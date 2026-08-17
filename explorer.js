const CUSTOM_CONTENT = window.CUSTOM_CONTENT;
const CATALOG = window.CATALOG || {};
const CUSTOM_CONTENT_DATABASE = window.CUSTOM_CONTENT_DATABASE || [];
const presetNames = Object.keys(CUSTOM_CONTENT).sort();
let activePreset = null;

// picked: Map(itemId -> { ...item, sourcePreset })
const STORAGE_KEY = 'bar-explorer-picks';
let picked = new Map(JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]'));

// Global index: every custom id found anywhere across all 51 decoded
// presets -> the first preset/slot it was found in. Needed so
// auto-picking a printer/lab's dependencies can find units that aren't
// part of the currently-active preset being browsed.
const globalIdIndex = new Map();
for (const [presetName, preset] of Object.entries(CATALOG)) {
	for (const [slotName, slot] of Object.entries(preset.slots || {})) {
		for (const id of (slot.unitIds || [])) {
			if (!globalIdIndex.has(id)) globalIdIndex.set(id, { sourcePreset: presetName, slotName });
		}
	}
}

// Quick id -> {name, tooltip, baseId} lookup from the Content Gallery's
// unified database, for ids not part of the currently-browsed preset's
// own item list (e.g. a dependency pulled in from a printer's buildoptions).
const dbById = new Map(CUSTOM_CONTENT_DATABASE.map(d => [d.id, d]));

function savePicks() {
	localStorage.setItem(STORAGE_KEY, JSON.stringify([...picked.entries()]));
}

function el(tag, attrs = {}, children = []) {
	const node = document.createElement(tag);
	for (const [k, v] of Object.entries(attrs)) {
		if (k === 'class') node.className = v;
		else if (k === 'text') node.textContent = v;
		else if (k.startsWith('on') && typeof v === 'function') node.addEventListener(k.slice(2), v);
		else node.setAttribute(k, v);
	}
	for (const c of [].concat(children)) {
		if (c == null) continue;
		node.appendChild(typeof c === 'string' ? document.createTextNode(c) : c);
	}
	return node;
}

function renderPresetList() {
	const list = document.getElementById('presetList');
	list.innerHTML = '';
	for (const name of presetNames) {
		const preset = CUSTOM_CONTENT[name];
		const item = el('div', {
			class: 'preset-item' + (name === activePreset ? ' active' : ''),
			onclick: () => { activePreset = name; renderAll(); },
		}, [
			name,
			el('span', { class: 'count', text: ` (${preset.items.length})` }),
		]);
		list.appendChild(item);
	}
	document.getElementById('stats').textContent = `${presetNames.length} presets with custom content`;
}

function renderContent() {
	const content = document.getElementById('content');
	content.innerHTML = '';
	if (!activePreset) {
		content.appendChild(el('p', { class: 'hint', text: 'Pick a preset on the left to see the custom units/buildings it adds beyond the vanilla game.' }));
		return;
	}
	const preset = CUSTOM_CONTENT[activePreset];
	content.appendChild(el('h2', { text: activePreset }));
	content.appendChild(el('p', { class: 'hint', text: `Map: ${preset.map || '(unknown)'} | ${preset.items.length} custom item(s)` }));

	const grid = el('div', { class: 'grid' });
	for (const item of preset.items) {
		const isPicked = picked.has(item.id);
		const card = el('div', {
			class: 'card' + (isPicked ? ' picked' : ''),
			onclick: () => {
				if (picked.has(item.id)) {
					picked.delete(item.id);
				} else {
					const n = autoPickWithDependencies(item.id, activePreset, null);
					if (n > 1) showImportNote(`Added "${item.name}" plus ${n - 1} unit(s) from its buildoptions.`);
				}
				savePicks();
				renderAll();
			},
		});
		const img = item.baseIcon ? el('img', { src: 'icons/' + item.baseIcon, loading: 'lazy' }) : el('div', { class: 'icon-placeholder' });
		card.appendChild(img);
		card.appendChild(el('div', { class: 'card-name', text: item.name }));
		if (item.tooltip) card.appendChild(el('div', { class: 'card-desc', text: item.tooltip }));
		card.appendChild(el('div', { class: 'card-base', text: `${item.id} (from ${item.baseId})` }));
		grid.appendChild(card);
	}
	content.appendChild(grid);
}

function renderCart() {
	const container = document.getElementById('cartItems');
	container.innerHTML = '';
	if (picked.size === 0) {
		container.appendChild(el('p', { class: 'hint', text: 'Nothing picked yet.' }));
		return;
	}
	for (const [id, item] of picked) {
		const row = el('div', { class: 'cart-item' }, [
			el('span', {}, [item.name, el('span', { class: 'src', text: `${id} — from "${item.sourcePreset}"` })]),
			el('button', { text: '✕', onclick: () => { picked.delete(id); savePicks(); renderAll(); } }),
		]);
		container.appendChild(row);
	}
}

function renderAll() {
	renderPresetList();
	renderContent();
	renderCart();
}

// Finds the exact original code for an id by parsing the raw decoded slot
// text it came from (via a real Lua AST, not regex slicing), so the
// generated preset keeps the real stat overrides instead of a
// reconstructed guess from just name/tooltip. Generalized to take an id +
// sourcePreset directly (rather than a picked item) so it can also be
// used while walking a printer/lab's buildoptions dependency chain.
function findOriginalBlockById(id, sourcePreset) {
	const preset = CATALOG[sourcePreset];
	if (!preset) return null;
	for (const [slotName, data] of Object.entries(preset.slots)) {
		const text = data.text;
		if (!text || !text.includes(id)) continue;
		let ast;
		try { ast = luaparse.parse(text, { ranges: true }); } catch (e) { continue; }
		let found = null;
		(function visit(node) {
			if (found || !node || typeof node !== 'object') return;
			if (Array.isArray(node)) { node.forEach(visit); return; }
			if (node.type === 'AssignmentStatement') {
				for (const v of node.variables) {
					let newId = null;
					if (v.type === 'MemberExpression') newId = v.identifier.name;
					else if (v.type === 'IndexExpression' && v.index.type === 'StringLiteral') newId = v.index.value;
					if (newId === id) { found = text.slice(node.range[0], node.range[1]); return; }
				}
			}
			for (const key of Object.keys(node)) {
				if (key === 'range' || key === 'loc') continue;
				visit(node[key]);
			}
		})(ast);
		if (found) return { code: found, slot: slotName };
	}
	return null;
}

function findOriginalBlock(item) {
	return findOriginalBlockById(item.id, item.sourcePreset);
}

// Pulls every unit id referenced in a code block's own `buildoptions =
// {...}` table (if it has one) -- both `[1] = 'id'` and bare `'id',` forms.
function extractBuildOptionIds(code) {
	const m = code.match(/buildoptions\s*=\s*\{([^}]*)\}/);
	if (!m) return [];
	return [...m[1].matchAll(/'([A-Za-z0-9_]+)'/g)].map(x => x[1]);
}

function getIdMeta(id, sourcePreset, slotName) {
	const fromDb = dbById.get(id);
	if (fromDb) return { name: fromDb.name, tooltip: fromDb.tooltip, baseId: fromDb.baseId, baseIcon: fromDb.icon };
	const block = findOriginalBlockById(id, sourcePreset);
	if (block) {
		const nameMatch = block.code.match(/name\s*=\s*'([^']*)'/);
		const tooltipMatch = block.code.match(/i18n_en_tooltip\s*=\s*'([^']*)'/);
		const baseMatch = block.code.match(/unitDefs\[['"]?([A-Za-z0-9_]+)['"]?\]/);
		return { name: nameMatch ? nameMatch[1] : id, tooltip: tooltipMatch ? tooltipMatch[1] : null, baseId: baseMatch ? baseMatch[1] : null, baseIcon: null };
	}
	return { name: id, tooltip: null, baseId: null, baseIcon: null };
}

// Picks an id and recursively auto-picks everything in its own
// buildoptions too, so clicking a printer/lab pulls in every unit it
// builds -- not just itself. Guards against cycles/repeat work with
// `visited`. Only follows ids we can actually find a source for; a
// buildoptions entry that's a real vanilla unit (not custom) is simply
// left alone since it already exists in the base game.
function autoPickWithDependencies(id, sourcePreset, slotName, visited) {
	visited = visited || new Set();
	if (visited.has(id)) return 0;
	visited.add(id);

	const meta = getIdMeta(id, sourcePreset, slotName);
	picked.set(id, { id, name: meta.name, tooltip: meta.tooltip, baseId: meta.baseId, baseIcon: meta.baseIcon, sourcePreset });
	let count = 1;

	const block = findOriginalBlockById(id, sourcePreset);
	if (block) {
		for (const depId of extractBuildOptionIds(block.code)) {
			if (visited.has(depId)) continue;
			const depIndex = globalIdIndex.get(depId);
			if (!depIndex) continue; // not a known custom id (real vanilla unit, or genuinely uncatalogued) -- leave it alone
			count += autoPickWithDependencies(depId, depIndex.sourcePreset, depIndex.slotName, visited);
		}
	}
	return count;
}

function buildPresetFromPicks() {
	if (picked.size === 0) { alert('Pick at least one item first.'); return; }
	const lines = [
		'-- Built from Preset Explorer picks -- ' + new Date().toISOString().slice(0, 10),
		'local unitDefs, tableMerge = UnitDefs or {}, table.merge',
		'',
	];
	const missing = [];
	for (const item of picked.values()) {
		const block = findOriginalBlock(item);
		if (block) {
			lines.push(`-- ${item.name} (from "${item.sourcePreset}", slot ${block.slot})`);
			lines.push(block.code);
			lines.push('');
		} else {
			missing.push(item);
			lines.push(`-- ${item.name} -- COULD NOT FIND ORIGINAL CODE, reconstructed from name/tooltip only (stat changes NOT preserved -- verify against "${item.sourcePreset}" manually)`);
			lines.push(`unitDefs.${item.id} = tableMerge(unitDefs['${item.baseId}'], {`);
			lines.push(`\tcustomparams = { i18n_en_humanname = '${item.name.replace(/'/g, "\\'")}'${item.tooltip ? `, i18n_en_tooltip = '${item.tooltip.replace(/'/g, "\\'")}'` : ''} },`);
			lines.push('})');
			lines.push('');
		}
	}
	const code = lines.join('\n');
	document.getElementById('buildOutput').style.display = 'block';
	document.getElementById('buildOutputCode').value = code;
	document.getElementById('buildOutputNote').textContent = missing.length
		? `${missing.length} of ${picked.size} item(s) had no exact original code found -- those are flagged with a warning comment in the output above.`
		: `All ${picked.size} item(s) matched to their exact original code.`;
}

function showImportNote(text) {
	const el2 = document.getElementById('importNote');
	el2.textContent = text;
	el2.style.display = 'block';
}

document.getElementById('buildBtn').addEventListener('click', buildPresetFromPicks);
document.getElementById('buildCopyBtn').addEventListener('click', () => {
	navigator.clipboard.writeText(document.getElementById('buildOutputCode').value).catch(() => {});
});

// Pulls in whatever's currently marked in the Content Gallery
// (localStorage, set from that tool's own "Mark" button) and auto-picks
// each one (with its own dependencies) here too, so a shortlist built
// while browsing carries over instead of needing to be re-found by hand.
document.getElementById('importMarkedBtn').addEventListener('click', () => {
	let markedIds;
	try {
		markedIds = JSON.parse(localStorage.getItem('bar-content-gallery-marked-v1') || '[]');
	} catch (e) {
		markedIds = [];
	}
	if (markedIds.length === 0) {
		showImportNote('Nothing marked in the Content Gallery yet -- mark items there first.');
		return;
	}
	let totalAdded = 0, noSourceCount = 0;
	const visited = new Set();
	for (const id of markedIds) {
		if (picked.has(id) && visited.has(id)) continue;
		const idx = globalIdIndex.get(id);
		if (!idx) {
			// No decoded preset has this id (e.g. an author-sourced item
			// found only via raw script scanning, never seen in a saved
			// preset) -- still add it standalone using the Content Gallery's
			// own data so it's not silently dropped, just flagged.
			const dbItem = dbById.get(id);
			if (dbItem) {
				picked.set(id, { id, name: dbItem.name, tooltip: dbItem.tooltip, baseId: dbItem.baseId, baseIcon: dbItem.icon, sourcePreset: null });
				totalAdded++;
				noSourceCount++;
			}
			continue;
		}
		totalAdded += autoPickWithDependencies(id, idx.sourcePreset, idx.slotName, visited);
	}
	savePicks();
	renderAll();
	showImportNote(`Imported ${totalAdded} item(s) from ${markedIds.length} marked.${noSourceCount ? ` ${noSourceCount} had no source preset found -- will use reconstructed code (flagged) when built.` : ''}`);
});

renderAll();

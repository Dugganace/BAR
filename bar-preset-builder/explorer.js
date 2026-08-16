const CUSTOM_CONTENT = window.CUSTOM_CONTENT;
const CATALOG = window.CATALOG || {};
const presetNames = Object.keys(CUSTOM_CONTENT).sort();
let activePreset = null;

// picked: Map(itemId -> { ...item, sourcePreset })
const STORAGE_KEY = 'bar-explorer-picks';
let picked = new Map(JSON.parse(localStorage.getItem(STORAGE_KEY) || '[]'));

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
				if (picked.has(item.id)) picked.delete(item.id);
				else picked.set(item.id, { ...item, sourcePreset: activePreset });
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

// Finds the exact original code for a picked item by parsing the raw
// decoded slot text it came from (via a real Lua AST, not regex slicing),
// so the generated preset keeps the real stat overrides instead of a
// reconstructed guess from just name/tooltip.
function findOriginalBlock(item) {
	const preset = CATALOG[item.sourcePreset];
	if (!preset) return null;
	for (const [slotName, data] of Object.entries(preset.slots)) {
		const text = data.text;
		if (!text || !text.includes(item.id)) continue;
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
					if (newId === item.id) { found = text.slice(node.range[0], node.range[1]); return; }
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

document.getElementById('buildBtn').addEventListener('click', buildPresetFromPicks);
document.getElementById('buildCopyBtn').addEventListener('click', () => {
	navigator.clipboard.writeText(document.getElementById('buildOutputCode').value).catch(() => {});
});

renderAll();

const allUnits = Object.values(window.UNITS_DB);
const factionOrder = ['Armada', 'Cortex', 'Legion', 'Raptors', 'Scavengers', 'Lootboxes', 'Other'];
let activeFaction = 'Armada';
let activeTarget = '';
let activeKind = 'all'; // 'all' | 'buildings' | 'units' -- same split as the Unit Database viewer
// targets: { targetId: Set(unitIds) }
const targets = {};

// A unit with no speed (or speed 0) can't move -- treat it as a building.
function isBuilding(u) { return !u.speed; }
function matchesKind(u) {
	if (activeKind === 'all') return true;
	if (activeKind === 'buildings') return isBuilding(u);
	return !isBuilding(u);
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

const kindTabsEl = document.getElementById('kindTabs');
for (const k of [{ key: 'all', label: 'All' }, { key: 'buildings', label: 'Buildings' }, { key: 'units', label: 'Units' }]) {
	const tab = el('div', {
		class: 'tab' + (k.key === activeKind ? ' active' : ''),
		text: k.label,
		onclick: () => {
			activeKind = k.key;
			[...kindTabsEl.children].forEach(t => t.classList.toggle('active', t.dataset.kind === activeKind));
			renderGrid();
		},
	});
	tab.dataset.kind = k.key;
	kindTabsEl.appendChild(tab);
}

const tabsEl = document.getElementById('tabs');
for (const f of factionOrder) {
	const count = allUnits.filter(u => u.faction === f).length;
	const tab = el('div', {
		class: 'tab' + (f === activeFaction ? ' active' : ''),
		text: `${f} (${count})`,
		onclick: () => { activeFaction = f; renderGrid(); document.querySelectorAll('#tabs .tab').forEach(t => t.classList.toggle('active', t.textContent.startsWith(f))); },
	});
	tabsEl.appendChild(tab);
}

function ensureTarget(id) {
	if (!id) return;
	if (!targets[id]) targets[id] = new Set();
}

function renderTargetChips() {
	const list = document.getElementById('targetList');
	list.innerHTML = '';
	const current = document.getElementById('targetCurrent');
	if (activeTarget) {
		const unit = window.UNITS_DB[activeTarget];
		current.textContent = `Currently adding to: ${unit ? unit.name + ' ' : ''}(${activeTarget})`;
	} else {
		current.textContent = 'No target picked yet — search above and pick one.';
	}
	if (Object.keys(targets).length === 0) return;
	const label = el('div', { class: 'hint', text: 'Targets set up so far (click to switch back):', style: 'margin-top:8px' });
	list.appendChild(label);
	const row = el('div', { style: 'display:flex; flex-wrap:wrap; gap:5px; margin-top:6px' });
	for (const id of Object.keys(targets)) {
		const unit = window.UNITS_DB[id];
		const chip = el('div', {
			class: 'target-chip' + (id === activeTarget ? ' active' : ''),
			text: `${unit ? unit.name : id} (${targets[id].size})`,
			onclick: () => { activeTarget = id; renderAll(); },
		});
		row.appendChild(chip);
	}
	list.appendChild(row);
}

function renderTargetSearch() {
	const q = document.getElementById('targetSearch').value.trim().toLowerCase();
	const container = document.getElementById('targetSearchResults');
	container.innerHTML = '';
	if (!q) return;
	const matches = allUnits.filter(u => u.id.toLowerCase().includes(q) || (u.name || '').toLowerCase().includes(q)).slice(0, 8);
	for (const u of matches) {
		const row = el('div', {
			class: 'target-result',
			onclick: () => {
				activeTarget = u.id;
				ensureTarget(activeTarget);
				document.getElementById('targetSearch').value = '';
				container.innerHTML = '';
				renderAll();
			},
		}, [
			u.icon ? el('img', { src: 'icons/' + u.icon }) : el('div', { style: 'width:28px;height:28px;background:#111;border-radius:4px' }),
			el('div', {}, [
				el('div', { text: u.name || u.id }),
				el('div', { class: 'tr-id', text: u.id }),
			]),
		]);
		container.appendChild(row);
	}
}

function renderGrid() {
	const q = document.getElementById('search').value.trim().toLowerCase();
	const grid = document.getElementById('grid');
	grid.innerHTML = '';
	// Searching is a deliberate lookup for something specific -- the
	// Buildings/Units toggle shouldn't hide an exact match just because it
	// was left on the wrong setting.
	let rows = q
		? allUnits.filter(u => u.id.toLowerCase().includes(q) || (u.name || '').toLowerCase().includes(q) || (u.description || '').toLowerCase().includes(q))
		: allUnits.filter(u => u.faction === activeFaction && matchesKind(u));

	const frag = document.createDocumentFragment();
	for (const u of rows.slice(0, 300)) {
		const isSelected = activeTarget && targets[activeTarget] && targets[activeTarget].has(u.id);
		const card = el('div', {
			class: 'card' + (isSelected ? ' selected' : ''),
			onclick: () => {
				if (!activeTarget) { alert('Set a target building/lab id first (top of the right panel).'); return; }
				ensureTarget(activeTarget);
				if (targets[activeTarget].has(u.id)) targets[activeTarget].delete(u.id);
				else targets[activeTarget].add(u.id);
				renderAll();
			},
		});
		const img = u.icon ? el('img', {
			src: 'icons/' + u.icon, loading: 'lazy', title: 'Click to customize a new unit cloned from this one',
			onclick: (e) => { e.stopPropagation(); window.open('newunit.html?base=' + encodeURIComponent(u.id), '_blank'); },
		}) : el('div', { class: 'icon-placeholder' });
		card.appendChild(img);
		card.appendChild(el('div', { class: 'card-name', text: u.name || u.id }));
		card.appendChild(el('div', { class: 'card-id', text: u.id }));
		frag.appendChild(card);
	}
	grid.appendChild(frag);
}

function renderSelections() {
	const container = document.getElementById('selections');
	container.innerHTML = '';
	if (!activeTarget || !targets[activeTarget] || targets[activeTarget].size === 0) {
		container.appendChild(el('div', { class: 'hint', text: 'No units added yet for this target.' }));
		return;
	}
	for (const unitId of targets[activeTarget]) {
		const unit = window.UNITS_DB[unitId];
		const row = el('div', { class: 'sel-item' }, [
			el('span', { text: (unit ? unit.name + ' ' : '') + '(' + unitId + ')' }),
			el('button', { text: '✕', onclick: () => { targets[activeTarget].delete(unitId); renderAll(); } }),
		]);
		container.appendChild(row);
	}
}

function renderAll() {
	renderTargetChips();
	renderGrid();
	renderSelections();
}

document.getElementById('search').addEventListener('input', renderGrid);
document.getElementById('targetSearch').addEventListener('input', renderTargetSearch);

document.getElementById('generateBtn').addEventListener('click', () => {
	const lines = [];
	lines.push("local unitDefs, tableMerge = UnitDefs or {}, table.merge");
	lines.push("");
	lines.push("local function addBuildOption(commanderId, newUnitId)");
	lines.push("\tlocal commander = unitDefs[commanderId]");
	lines.push("\tif not commander then return end");
	lines.push("\tif not commander.buildoptions then commander.buildoptions = {} end");
	lines.push("\ttable.insert(commander.buildoptions, newUnitId)");
	lines.push("end");
	lines.push("");
	for (const [targetId, unitSet] of Object.entries(targets)) {
		if (unitSet.size === 0) continue;
		lines.push(`-- ${targetId}`);
		for (const unitId of unitSet) {
			lines.push(`addBuildOption('${targetId}', '${unitId}')`);
		}
		lines.push("");
	}
	const code = lines.join('\n');
	document.getElementById('output').style.display = 'block';
	document.getElementById('outputCode').value = code;
});

document.getElementById('copyBtn').addEventListener('click', () => {
	const code = document.getElementById('outputCode').value;
	const b64 = btoa(unescape(encodeURIComponent(code)))
		.replace(/\+/g, '-').replace(/\//g, '_').replace(/=+$/, '');
	const btn = document.getElementById('copyBtn');
	function showCopied() {
		btn.textContent = 'Copied!';
		setTimeout(() => { btn.textContent = 'Copy pure code (paste into numbered Tweak Defs box)'; }, 1500);
	}
	function fallback() {
		const ta = document.createElement('textarea');
		ta.value = b64;
		ta.style.position = 'fixed'; ta.style.opacity = '0';
		document.body.appendChild(ta);
		ta.focus(); ta.select();
		try { document.execCommand('copy'); showCopied(); } catch (e) { alert('Copy failed, select manually from the code box.'); }
		document.body.removeChild(ta);
	}
	try {
		if (navigator.clipboard && navigator.clipboard.writeText) {
			navigator.clipboard.writeText(b64).then(showCopied).catch(fallback);
		} else fallback();
	} catch (e) { fallback(); }
});

renderAll();

const allUnits = Object.values(window.UNITS_DB);
const factionOrder = ['Armada', 'Cortex', 'Legion', 'Raptors', 'Scavengers', 'Lootboxes', 'Other'];
let activeFaction = 'Armada';
let activeKind = 'all'; // 'all' | 'buildings' | 'units'

// A unit with no speed (or speed 0) can't move -- treat it as a building.
function isBuilding(u) { return !u.speed; }

const kindTabsEl = document.getElementById('kindTabs');
const kinds = [
	{ key: 'all', label: 'All' },
	{ key: 'buildings', label: 'Buildings' },
	{ key: 'units', label: 'Units' },
];
for (const k of kinds) {
	const tab = document.createElement('div');
	tab.className = 'tab' + (k.key === activeKind ? ' active' : '');
	tab.textContent = k.label;
	tab.dataset.kind = k.key;
	tab.addEventListener('click', () => { activeKind = k.key; render(); });
	kindTabsEl.appendChild(tab);
}

const tabsEl = document.getElementById('tabs');
for (const f of factionOrder) {
	const count = allUnits.filter(u => u.faction === f).length;
	const tab = document.createElement('div');
	tab.className = 'tab' + (f === activeFaction ? ' active' : '');
	tab.textContent = `${f} (${count})`;
	tab.dataset.faction = f;
	tab.addEventListener('click', () => { activeFaction = f; render(); });
	tabsEl.appendChild(tab);
}

function matchesKind(u) {
	if (activeKind === 'all') return true;
	if (activeKind === 'buildings') return isBuilding(u);
	return !isBuilding(u);
}

function openStats(u) {
	const modal = document.getElementById('modal');
	const fields = [
		['Faction', u.faction], ['Category', u.category],
		['Metal cost', u.metalcost], ['Energy cost', u.energycost],
		['Build time', u.buildtime], ['Health', u.health],
		['Speed', u.speed || '0 (static)'], ['Tech level', u.techlevel ?? '(unset)'],
		['Has weapons', u.hasWeapons ? 'Yes' : 'No'],
	];
	modal.innerHTML = `
		${u.icon ? `<img src="icons/${u.icon}">` : ''}
		<h2>${u.name || u.id}</h2>
		<div class="mid">${u.id} &mdash; ${u.file || ''}</div>
		<div>${u.description || ''}</div>
		<div style="margin-top:10px">
			${fields.map(([k, v]) => `<div class="stat-row"><span>${k}</span><span>${v ?? '—'}</span></div>`).join('')}
		</div>
		<a class="customize-link" href="../../bar-preset-builder/newunit.html?base=${encodeURIComponent(u.id)}" target="_blank">Clone this into a new unit &rarr;</a>
		<div class="close" id="modalClose">Close</div>
	`;
	document.getElementById('modalClose').addEventListener('click', closeStats);
	document.getElementById('modalBg').classList.add('open');
}
function closeStats() { document.getElementById('modalBg').classList.remove('open'); }
document.getElementById('modalBg').addEventListener('click', (e) => { if (e.target.id === 'modalBg') closeStats(); });

function render() {
	const q = document.getElementById('search').value.trim().toLowerCase();
	document.querySelectorAll('#tabs .tab').forEach(t => t.classList.toggle('active', t.dataset.faction === activeFaction));
	document.querySelectorAll('#kindTabs .tab').forEach(t => t.classList.toggle('active', t.dataset.kind === activeKind));

	// Searching by name/id is a deliberate lookup for something specific --
	// the Buildings/Units toggle shouldn't hide an exact match just because
	// it was left on the wrong setting (found the hard way: "pawn launcher"
	// disappearing while "Units" was selected, even though it's a real unit).
	let rows = q
		? allUnits.filter(u =>
			u.id.toLowerCase().includes(q) ||
			(u.name || '').toLowerCase().includes(q) ||
			(u.description || '').toLowerCase().includes(q)
		)
		: allUnits.filter(u => u.faction === activeFaction && matchesKind(u));

	document.getElementById('stats').textContent = q
		? `${rows.length} match across all factions`
		: `${rows.length} in ${activeFaction} (${activeKind})`;

	const grid = document.getElementById('grid');
	grid.innerHTML = '';
	const frag = document.createDocumentFragment();
	for (const u of rows.slice(0, 400)) {
		const card = document.createElement('div');
		card.className = 'card';
		card.style.cursor = 'pointer';
		const img = u.icon
			? `<img src="icons/${u.icon}" loading="lazy" alt="${u.id}" title="Click for full stats">`
			: `<div class="icon-placeholder">no icon</div>`;
		card.innerHTML = `
			${img}
			<div class="card-name">${u.name || u.id}</div>
			<div class="card-desc">${u.description || ''}</div>
			<div class="card-id">${u.id}</div>
		`;
		card.addEventListener('click', () => openStats(u));
		frag.appendChild(card);
	}
	grid.appendChild(frag);
	if (rows.length > 400) {
		const note = document.createElement('div');
		note.className = 'card-desc';
		note.style.gridColumn = '1/-1';
		note.textContent = `... and ${rows.length - 400} more (narrow your search)`;
		grid.appendChild(note);
	}
}

document.getElementById('search').addEventListener('input', render);
render();

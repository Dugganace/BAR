const DATA = window.EVO_ECONOMY;
const factionIcons = [
	{ prefix: 'arm', name: 'Armada', icons: { fusion: 'armafus.png', converter: 'armmmkr.png', nano: 'armnanotc.png' } },
	{ prefix: 'cor', name: 'Cortex', icons: { fusion: 'corafus.png', converter: 'cormmkr.png', nano: 'cornanotc.png' } },
	{ prefix: 'leg', name: 'Legion', icons: { fusion: 'legafus.png', converter: 'legadveconv.png', nano: 'legnanotc.png' } },
];

const kinds = [
	{ key: 'fusion', label: 'Evo Fusion (30 levels)', explainer: 'Energy reactor. Cost grows exponentially but slightly dampened over levels (a 3% "tax reduction" per level keeps cost from outpacing output entirely); energymake scales with the raw exponential curve.' },
	{ key: 'converter', label: 'Evo Energy Converter (24 levels)', explainer: 'Converts energy into metal. Same cost curve as Fusion; capacity scales with level, actual metal/sec = capacity x 2% base efficiency.' },
	{ key: 'nano', label: 'Construction Turret (30 levels)', explainer: 'This is the "evo build turret" seen on every T2/T3 constructor -- all 30 levels are directly buildable from any constructor with no forced progression, letting you pick your investment tier. Buildpower (workertime) follows the exponential curve; assist range (builddistance) grows linearly at +3%/level instead.' },
];

let activeKind = 'nano';

const tabsEl = document.getElementById('tabs');
for (const k of kinds) {
	const tab = document.createElement('div');
	tab.className = 'tab' + (k.key === activeKind ? ' active' : '');
	tab.textContent = k.label;
	tab.addEventListener('click', () => { activeKind = k.key; render(); });
	tabsEl.appendChild(tab);
}

const factionRow = document.getElementById('factionRow');
for (const f of factionIcons) {
	const wrap = document.createElement('div');
	wrap.style.display = 'flex';
	wrap.style.alignItems = 'center';
	wrap.style.gap = '6px';
	const img = document.createElement('img');
	img.id = 'icon-' + f.prefix;
	wrap.appendChild(img);
	const label = document.createElement('span');
	label.className = 'fname';
	label.textContent = f.name;
	wrap.appendChild(label);
	factionRow.appendChild(wrap);
}

const columnsByKind = {
	fusion: [
		['level', 'Level'], ['metalcost', 'Metal'], ['energycost', 'Energy'], ['buildtime', 'Build Time'], ['energymake', 'Energy/sec'],
	],
	converter: [
		['level', 'Level'], ['metalcost', 'Metal'], ['energycost', 'Energy'], ['buildtime', 'Build Time'], ['energyconv_capacity', 'Capacity'], ['metal_per_sec', 'Metal/sec'],
	],
	nano: [
		['level', 'Level'], ['metalcost', 'Metal'], ['energycost', 'Energy'], ['buildtime', 'Build Time'], ['workertime', 'Buildpower'], ['builddistance', 'Assist Range'],
	],
};

function render() {
	document.querySelectorAll('.tab').forEach((t, i) => t.classList.toggle('active', kinds[i].key === activeKind));
	for (const f of factionIcons) {
		document.getElementById('icon-' + f.prefix).src = 'icons/' + f.icons[activeKind];
	}
	const kindInfo = kinds.find(k => k.key === activeKind);
	document.getElementById('explainer').textContent = kindInfo.explainer;

	const cols = columnsByKind[activeKind];
	const thead = document.getElementById('thead');
	thead.innerHTML = '<tr>' + cols.map(([, label]) => `<th>${label}</th>`).join('') + '</tr>';

	const rows = DATA[activeKind];
	const tbody = document.getElementById('tbody');
	tbody.innerHTML = rows.map(row =>
		'<tr>' + cols.map(([key]) => `<td>${row[key].toLocaleString()}</td>`).join('') + '</tr>'
	).join('');
}

render();

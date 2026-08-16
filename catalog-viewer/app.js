const CATALOG = window.CATALOG;
let activeFaction = 'all';
let searchTerm = '';

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

function formatChange(line) {
	const isTooltip = line.startsWith('tooltip:');
	const cls = 'changes-line' + (isTooltip ? ' tooltip' : '');
	if (line.includes('(+')) return el('li', { class: cls + ' pct-up', text: line });
	if (line.includes('(-')) return el('li', { class: cls + ' pct-down', text: line });
	return el('li', { class: cls, text: line });
}

function render() {
	const grid = document.getElementById('grid');
	grid.innerHTML = '';
	const filtered = CATALOG.filter(item => {
		if (activeFaction !== 'all' && item.baseFaction !== activeFaction) return false;
		if (searchTerm && !item.name.toLowerCase().includes(searchTerm) && !item.id.toLowerCase().includes(searchTerm)) return false;
		return true;
	});
	document.getElementById('stats').textContent = `${filtered.length} of ${CATALOG.length} custom units shown`;

	for (const item of filtered) {
		const img = item.baseIcon ? el('img', { src: 'icons/' + item.baseIcon, loading: 'lazy' }) : el('div', { style: 'width:64px;height:64px;background:#111;border-radius:8px' });
		const changesList = el('ul', { class: 'changes' }, item.changes.map(formatChange));
		const card = el('div', { class: 'card' }, [
			img,
			el('div', { class: 'card-body' }, [
				el('div', { class: 'card-name', text: item.name }),
				el('div', { class: 'card-base', text: `${item.id}  (cloned from ${item.baseId})` }),
				changesList,
			]),
		]);
		grid.appendChild(card);
	}
}

document.getElementById('search').addEventListener('input', (e) => {
	searchTerm = e.target.value.toLowerCase();
	render();
});

document.querySelectorAll('.faction-btn').forEach(btn => {
	btn.addEventListener('click', () => {
		document.querySelectorAll('.faction-btn').forEach(b => b.classList.remove('active'));
		btn.classList.add('active');
		activeFaction = btn.dataset.faction;
		render();
	});
});

render();

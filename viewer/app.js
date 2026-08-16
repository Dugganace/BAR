const REPLAY_CONTENT = window.REPLAY_CONTENT;
const hashes = Object.keys(REPLAY_CONTENT).sort((a, b) => REPLAY_CONTENT[b].playCount - REPLAY_CONTENT[a].playCount);
let activeHash = null;

const STORAGE_KEY = 'bar-replay-miner-picks';
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

function mapNameFromFile(file) {
	// filename format: DATE_TIME_MapName_version.sdfz
	const m = file.match(/^\d{4}-\d{2}-\d{2}_\d{2}-\d{2}-\d{2}-\d+_(.+?)_\d{4}\.\d{2}\.\d{2}\.sdfz$/);
	return m ? m[1] : file;
}

function renderPresetList() {
	const list = document.getElementById('presetList');
	list.innerHTML = '';
	for (const hash of hashes) {
		const p = REPLAY_CONTENT[hash];
		const item = el('div', {
			class: 'preset-item' + (hash === activeHash ? ' active' : ''),
			onclick: () => { activeHash = hash; renderAll(); },
		}, [
			`${mapNameFromFile(p.latestFile)} (${p.items.length} custom)`,
			el('span', { class: 'meta', text: `played ${p.playCount}x, latest ${p.latestFile.slice(0, 10)}` }),
		]);
		list.appendChild(item);
	}
	document.getElementById('stats').textContent = `${hashes.length} distinct preset variants with custom content`;
}

function renderContent() {
	const content = document.getElementById('content');
	content.innerHTML = '';
	if (!activeHash) {
		content.appendChild(el('p', { class: 'hint', text: 'Pick a preset variant on the left to see the custom units/buildings that game actually used.' }));
		return;
	}
	const p = REPLAY_CONTENT[activeHash];
	content.appendChild(el('h2', { text: mapNameFromFile(p.latestFile) }));
	content.appendChild(el('div', { class: 'presetMeta' }, [
		`Played ${p.playCount}x — first seen ${p.firstFile.slice(0, 10)}, latest ${p.latestFile.slice(0, 10)}`,
		el('div', {
			class: 'players',
			text: 'Players seen: ' + p.players.join(', '),
			title: 'Everyone who appeared in a game using this preset variant — used for tracing custom-content authors, not a roster of who you played with.',
		}),
	]));

	const grid = el('div', { class: 'grid' });
	for (const item of p.items) {
		const isPicked = picked.has(item.id);
		const card = el('div', {
			class: 'card' + (isPicked ? ' picked' : ''),
			onclick: () => {
				if (picked.has(item.id)) picked.delete(item.id);
				else picked.set(item.id, { ...item, sourceHash: activeHash });
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
			el('span', {}, [item.name, el('span', { class: 'src', text: `${id}` })]),
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

document.getElementById('exportBtn').addEventListener('click', () => {
	const data = [...picked.values()];
	const blob = new Blob([JSON.stringify(data, null, 2)], { type: 'application/json' });
	const url = URL.createObjectURL(blob);
	const a = document.createElement('a');
	a.href = url; a.download = 'replay-picked-content.json';
	document.body.appendChild(a); a.click(); document.body.removeChild(a);
	URL.revokeObjectURL(url);
});

renderAll();

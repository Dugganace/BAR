const allUnits = Object.values(window.UNITS_DB);
let selectedBase = null;

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

function renderBaseResults() {
	const q = document.getElementById('baseSearch').value.trim().toLowerCase();
	const container = document.getElementById('baseResults');
	container.innerHTML = '';
	if (!q) return;
	const matches = allUnits.filter(u => u.id.toLowerCase().includes(q) || (u.name || '').toLowerCase().includes(q)).slice(0, 8);
	for (const u of matches) {
		const row = el('div', {
			class: 'base-card', style: 'cursor:pointer',
			onclick: () => { selectBase(u); },
		}, [
			u.icon ? el('img', { src: 'icons/' + u.icon }) : el('div', { style: 'width:48px;height:48px;background:#111;border-radius:6px' }),
			el('div', { class: 'info' }, [
				el('div', { class: 'name', text: u.name || u.id }),
				el('div', { text: u.id + ' | ' + (u.faction || '') }),
				el('div', { text: `${u.metalcost ?? '?'}M / ${u.energycost ?? '?'}E / ${u.health ?? '?'}HP` }),
			]),
		]);
		container.appendChild(row);
	}
}

function selectBase(u) {
	selectedBase = u;
	document.getElementById('baseResults').innerHTML = '';
	document.getElementById('baseSearch').value = '';
	const container = document.getElementById('baseSelected');
	container.innerHTML = '';
	container.appendChild(el('div', { class: 'base-card' }, [
		u.icon ? el('img', { src: 'icons/' + u.icon }) : el('div', { style: 'width:48px;height:48px;background:#111;border-radius:6px' }),
		el('div', { class: 'info' }, [
			el('div', { class: 'name', text: 'Base: ' + (u.name || u.id) }),
			el('div', { text: u.id + ' | ' + (u.faction || '') }),
			el('div', { text: `${u.metalcost ?? '?'}M / ${u.energycost ?? '?'}E / ${u.buildtime ?? '?'}BT / ${u.health ?? '?'}HP` }),
		]),
	]));
	// prefill overrides with base values as a starting point
	document.getElementById('fMetal').value = u.metalcost ?? '';
	document.getElementById('fEnergy').value = u.energycost ?? '';
	document.getElementById('fBuildtime').value = u.buildtime ?? '';
	document.getElementById('fHealth').value = u.health ?? '';
}

document.getElementById('baseSearch').addEventListener('input', renderBaseResults);

// Click-to-customize: arriving from another tool's unit grid with ?base=<id>
// pre-selects that unit as the clone base immediately.
(function () {
	const params = new URLSearchParams(window.location.search);
	const baseId = params.get('base');
	if (!baseId) return;
	const match = allUnits.find(u => u.id === baseId);
	if (match) selectBase(match);
})();

document.getElementById('generateBtn').addEventListener('click', () => {
	if (!selectedBase) { alert('Pick a base unit to clone from first.'); return; }
	const name = document.getElementById('fName').value.trim() || selectedBase.name;
	const id = document.getElementById('fId').value.trim();
	if (!id) { alert('Give the new unit a unique id.'); return; }
	const metal = document.getElementById('fMetal').value;
	const energy = document.getElementById('fEnergy').value;
	const buildtime = document.getElementById('fBuildtime').value;
	const health = document.getElementById('fHealth').value;
	const tooltip = document.getElementById('fTooltip').value.trim();
	const techLevel = document.getElementById('fTechLevel').value;
	const targets = document.getElementById('fTarget').value.split(',').map(s => s.trim()).filter(Boolean);

	const lines = [];
	lines.push(`-- ${name} -- cloned from ${selectedBase.id} (${selectedBase.name})`);
	lines.push(`unitDefs.${id} = tableMerge(unitDefs['${selectedBase.id}'], {`);
	lines.push(`\tname = '${name.replace(/'/g, "\\'")}',`);
	lines.push(`\tunitname = '${id}',`);
	if (metal) lines.push(`\tmetalcost = ${metal},`);
	if (energy) lines.push(`\tenergycost = ${energy},`);
	if (buildtime) lines.push(`\tbuildtime = ${buildtime},`);
	if (health) lines.push(`\thealth = ${health},`);
	lines.push(`\tcustomparams = {`);
	lines.push(`\t\ti18n_en_humanname = '${name.replace(/'/g, "\\'")}',`);
	if (tooltip) lines.push(`\t\ti18n_en_tooltip = '${tooltip.replace(/'/g, "\\'")}',`);
	if (techLevel) lines.push(`\t\ttechlevel = ${techLevel},`);
	lines.push(`\t},`);
	lines.push(`})`);
	if (targets.length) {
		lines.push('');
		for (const t of targets) lines.push(`addBuildOption('${t}', '${id}')`);
	}
	lines.push('');
	lines.push(`-- NOTE: this only overrides top-level stats. If ${selectedBase.id} has a weapon,`);
	lines.push(`-- its weapondefs key was NOT auto-detected here -- verify the real key name`);
	lines.push(`-- (fetch ${selectedBase.file || selectedBase.id + '.lua'} from the game repo) before`);
	lines.push(`-- overriding damage/range, or the override will silently do nothing.`);

	document.getElementById('outputCode').value = lines.join('\n');
});

document.getElementById('copyBtn').addEventListener('click', () => {
	const code = document.getElementById('outputCode').value;
	function showCopied() { const b = document.getElementById('copyBtn'); b.textContent = 'Copied!'; setTimeout(() => b.textContent = 'Copy Lua', 1500); }
	function fallback() {
		const ta = document.createElement('textarea');
		ta.value = code; ta.style.position = 'fixed'; ta.style.opacity = '0';
		document.body.appendChild(ta); ta.focus(); ta.select();
		try { document.execCommand('copy'); showCopied(); } catch (e) {}
		document.body.removeChild(ta);
	}
	try {
		if (navigator.clipboard && navigator.clipboard.writeText) navigator.clipboard.writeText(code).then(showCopied).catch(fallback);
		else fallback();
	} catch (e) { fallback(); }
});

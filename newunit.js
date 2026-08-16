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
	selectedBase.weaponKeys = null; // filled in async by detectWeaponKeys() below
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
			el('div', { id: 'weaponKeyStatus', text: u.hasWeapons ? 'Checking real weapon key…' : '' }),
		]),
	]));
	// prefill overrides with base values as a starting point
	document.getElementById('fMetal').value = u.metalcost ?? '';
	document.getElementById('fEnergy').value = u.energycost ?? '';
	document.getElementById('fBuildtime').value = u.buildtime ?? '';
	document.getElementById('fHealth').value = u.health ?? '';

	if (u.hasWeapons && u.file) detectWeaponKeys(u);
}

// Auto-detects the real weapondefs key(s) for a base unit by fetching its
// actual source file from the game repo -- weapon key names are
// faction/unit-specific (armllt uses arm_lightlaser, armhlt uses
// arm_laserh1, Legion is often heat_ray) and guessing wrong produces a
// tweak that loads without error but silently does nothing. This was
// previously a fully manual step every time.
async function detectWeaponKeys(u) {
	const statusEl = document.getElementById('weaponKeyStatus');
	try {
		const url = `https://raw.githubusercontent.com/beyond-all-reason/Beyond-All-Reason/master/units/${u.file}`;
		const res = await fetch(url);
		if (!res.ok) throw new Error(`HTTP ${res.status}`);
		const text = await res.text();
		const keys = [...new Set([...text.matchAll(/weapondefs\s*=\s*\{\s*([A-Za-z0-9_]+)\s*=/g)].map(m => m[1]))];
		if (selectedBase !== u) return; // user picked a different base while this was in flight
		selectedBase.weaponKeys = keys;
		if (statusEl) {
			statusEl.textContent = keys.length ? `Real weapon key${keys.length > 1 ? 's' : ''}: ${keys.join(', ')}` : 'No weapondefs found in source (may use a shared/inherited weapon).';
			statusEl.style.color = keys.length ? '#6bd48a' : '#e8b34d';
		}
	} catch (e) {
		if (selectedBase !== u) return;
		if (statusEl) { statusEl.textContent = `Couldn't fetch real source to verify weapon key (${e.message}) -- verify manually.`; statusEl.style.color = '#e8b34d'; }
	}
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
	if (selectedBase.hasWeapons && selectedBase.weaponKeys && selectedBase.weaponKeys.length) {
		lines.push(`-- Real weapon key${selectedBase.weaponKeys.length > 1 ? 's' : ''} for ${selectedBase.id}, auto-detected from the live game source:`);
		for (const key of selectedBase.weaponKeys) {
			lines.push(`--   weapondefs = { ${key} = { range = ..., reloadtime = ..., damage = { default = ... } } },`);
		}
		lines.push(`-- Add the block above (merged into the tableMerge's second argument) to override damage/range.`);
	} else if (selectedBase.hasWeapons) {
		lines.push(`-- NOTE: ${selectedBase.id} has a weapon, but its real key couldn't be auto-detected`);
		lines.push(`-- (fetch ${selectedBase.file || selectedBase.id + '.lua'} from the game repo manually) --`);
		lines.push(`-- verify the exact key name before overriding damage/range, or the override will`);
		lines.push(`-- silently do nothing.`);
	}

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

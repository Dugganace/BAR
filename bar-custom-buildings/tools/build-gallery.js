// Builds a self-contained visual gallery: icon (converted from the real
// in-game DDS the unit inherits) + display name + short description, for
// every custom unit/building we've made, grouped by category.
const fs = require('fs');
const path = require('path');

function iconDataUri(iconId) {
	const p = path.join(__dirname, '..', 'icons', 'png', iconId + '.png');
	const buf = fs.readFileSync(p);
	return 'data:image/png;base64,' + buf.toString('base64');
}

// name, tooltip pulled from custom_buildings.lua; iconIds = {arm,cor,leg} or a single shared one.
// kind: 'building' (static, can't move) or 'unit' (mobile) -- drives the
// Buildings/Units toggle, same split used in the Unit Database viewer.
const categories = [
	{
		title: 'Defense',
		kind: 'building',
		items: [
			{ name: 'Bulwark Tower', desc: 'Heavy area-control tower. Tougher, harder-hitting.', icons: { Armada: 'armhlt', Cortex: 'corhlt', Legion: 'leglht' } },
			{ name: 'High Power Laser Tower', desc: 'High-cost laser tower: longer range, far more damage.', icons: { Armada: 'armllt', Cortex: 'corllt', Legion: 'leglht' } },
			{ name: 'Armored Tower', desc: 'More health plus a personal shield.', icons: { Armada: 'armllt', Cortex: 'corllt', Legion: 'leglht' } },
			{ name: 'Artillery Interceptor', desc: 'Missile point defense. Shoots down incoming missiles.', icons: { Armada: 'armamd', Cortex: 'corfmd', Legion: 'legabm' } },
			{ name: 'Energy Interceptor', desc: 'Beam point defense. Always ready, no stockpile needed.', icons: { Armada: 'armhlt', Cortex: 'corhlt', Legion: 'leglht' } },
			{ name: 'The Depawner', desc: 'Anti-air turret tuned to kill enemy drone-carriers fast.', icons: { Armada: 'armflak', Cortex: 'corflak', Legion: 'legflak' } },
			{ name: 'Rapid Fire Tower', desc: 'Rapid-fire anti-swarm turret. Weak vs single targets.', icons: { Armada: 'armllt', Cortex: 'corllt', Legion: 'leglht' } },
		],
	},
	{
		title: 'Obstacles',
		kind: 'building',
		items: [
			{ name: 'Barrier (Bronze/Silver/Gold)', desc: 'Repurposed husk. Large inert obstacle, blocks movement.', icons: { Armada: 'armdrag', Cortex: 'cordrag', Legion: 'legdrag' } },
		],
	},
	{
		title: 'Economy / Production / Utility',
		kind: 'building',
		items: [
			{ name: 'Hyper Reactor', desc: 'Massively upscaled Fusion Reactor.', icons: { Armada: 'armfus', Cortex: 'corfus', Legion: 'legfus' } },
			{ name: 'Assembly Complex', desc: 'Upgraded Vehicle Plant with much higher build power.', icons: { Armada: 'armvp', Cortex: 'corvp', Legion: 'legvp' } },
			{ name: 'Support Relay', desc: 'Long-range assist & repair turret.', icons: { Armada: 'armnanotc', Cortex: 'cornanotc', Legion: 'legnanotc' } },
			{ name: 'Raptor Bio-Reactor', desc: 'Salvaged Raptor bio-tech energy building.', icons: { 'All factions': 'lootboxgold' } },
		],
	},
	{
		title: 'Commander Chain',
		kind: 'unit',
		items: [
			{ name: 'Captain / General / Grand Marshal', desc: 'Higher-rank field commander. Expanded build access.', icons: { Armada: 'armcom', Cortex: 'corcom', Legion: 'legcom' } },
		],
	},
	{
		title: 'Heavy Units',
		kind: 'unit',
		items: [
			{ name: 'The Bull', desc: 'Slow heavy assault unit. High-damage, slow-firing laser.', icons: { Armada: 'armbull' } },
			{ name: 'The Dozer', desc: 'Slow heavy assault unit. High-damage, slow-firing laser.', icons: { Cortex: 'corgol' } },
			{ name: 'The Beamer', desc: 'Slow heavy assault unit. High-damage, slow-firing laser.', icons: { Legion: 'leginc' } },
		],
	},
];

let html = `<!doctype html>
<html><head><meta charset="utf-8"><title>Mark Magic Gallery</title>
<style>
	body { font-family: -apple-system, Segoe UI, sans-serif; background: #1a1c20; color: #e6e8eb; padding: 24px; }
	h1 { font-size: 20px; }
	h2 { font-size: 15px; color: #5fb3ff; margin-top: 30px; border-bottom: 1px solid #3a3e46; padding-bottom: 6px; }
	.grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 14px; margin-top: 12px; }
	.card { background: #24272d; border: 1px solid #3a3e46; border-radius: 10px; padding: 12px; }
	.card-title { font-weight: 700; font-size: 14px; margin-bottom: 6px; }
	.card-desc { color: #9aa0aa; font-size: 12px; margin-bottom: 10px; }
	.icon-row { display: flex; gap: 10px; flex-wrap: wrap; }
	.icon-item { text-align: center; }
	.icon-item img { width: 64px; height: 64px; border-radius: 8px; border: 1px solid #3a3e46; image-rendering: -webkit-optimize-contrast; }
	.icon-label { font-size: 10px; color: #9aa0aa; margin-top: 3px; }
	.kind-tabs { display: flex; gap: 6px; margin: 14px 0 4px; }
	.kind-tab { padding: 6px 14px; border-radius: 6px; background: #24272d; border: 1px solid #3a3e46; cursor: pointer; font-size: 13px; color: #e6e8eb; }
	.kind-tab.active { background: #5fb3ff; color: #0b1a24; font-weight: 600; border-color: #5fb3ff; }
</style></head><body>
<a href="../bar-toolkit-hub/index.html" style="color:#5fb3ff;text-decoration:none;font-size:12px;display:block;margin-bottom:6px;">&larr; Hub</a>
<h1>Mark Magic — Unit &amp; Building Gallery</h1>
<p style="color:#9aa0aa;font-size:13px">Icons shown are the real in-game icons each unit inherits from its base unit (we didn't create new art, just cloned and reskinned existing units).</p>
<div class="kind-tabs">
	<div class="kind-tab active" data-kind="all">All</div>
	<div class="kind-tab" data-kind="building">Buildings</div>
	<div class="kind-tab" data-kind="unit">Units</div>
</div>
`;

for (const cat of categories) {
	html += `<div class="category" data-kind="${cat.kind}"><h2>${cat.title}</h2><div class="grid">`;
	for (const item of cat.items) {
		html += `<div class="card"><div class="card-title">${item.name}</div><div class="card-desc">${item.desc}</div><div class="icon-row">`;
		for (const [faction, iconId] of Object.entries(item.icons)) {
			let dataUri;
			try { dataUri = iconDataUri(iconId); } catch (e) { dataUri = ''; }
			html += `<div class="icon-item"><img src="${dataUri}" alt="${iconId}"><div class="icon-label">${faction}</div></div>`;
		}
		html += `</div></div>`;
	}
	html += `</div></div>`;
}

html += `
<script>
document.querySelectorAll('.kind-tab').forEach(tab => {
	tab.addEventListener('click', () => {
		document.querySelectorAll('.kind-tab').forEach(t => t.classList.remove('active'));
		tab.classList.add('active');
		const kind = tab.dataset.kind;
		document.querySelectorAll('.category').forEach(cat => {
			cat.style.display = (kind === 'all' || cat.dataset.kind === kind) ? '' : 'none';
		});
	});
});
</script>
</body></html>`;

const outPath = path.join(__dirname, '..', 'gallery.html');
fs.writeFileSync(outPath, html, 'utf8');
console.log('Wrote', outPath, '(' + (html.length / 1024).toFixed(0) + 'KB)');

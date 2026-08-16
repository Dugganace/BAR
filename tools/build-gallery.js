// Builds the same visual gallery style as before (one card per logical
// unit/building, faction-equivalent icons grouped into a row inside the
// card) but now DATA-DRIVEN from the full Content Gallery dataset
// (bar-toolkit-hub/custom-content-database/data.js, 159 items covering
// our own content + every traced author) instead of a hardcoded list of
// just our own 31. Cards are auto-grouped by exact display name, so
// Armada/Cortex/Legion equivalents (e.g. armbulwark/corbulwark/legbulwark,
// all named "Bulwark Tower") collapse into one card with 3 icons, same as
// the original hand-curated version did.
const fs = require('fs');
const path = require('path');

const DATA_JS = path.join(__dirname, '..', '..', 'bar-toolkit-hub', 'custom-content-database', 'data.js');
const ICONS_DIR = path.join(__dirname, '..', '..', 'bar-unit-database', 'icons-png');

const window = {};
eval(fs.readFileSync(DATA_JS, 'utf8'));
const DB = window.CUSTOM_CONTENT_DATABASE;

function iconDataUri(iconFile) {
	if (!iconFile) return '';
	try {
		const buf = fs.readFileSync(path.join(ICONS_DIR, iconFile));
		return 'data:image/png;base64,' + buf.toString('base64');
	} catch (e) {
		return '';
	}
}

function factionLabel(id) {
	if (/^arm/.test(id)) return 'Armada';
	if (/^cor/.test(id)) return 'Cortex';
	if (/^leg/.test(id)) return 'Legion';
	return null;
}

// Group by exact display name -- items sharing a name are treated as
// faction-equivalents of the same logical card.
const groups = new Map();
for (const item of DB) {
	if (!groups.has(item.name)) groups.set(item.name, []);
	groups.get(item.name).push(item);
}

const cards = [...groups.entries()].map(([name, items]) => {
	const kind = items[0].type === 'Unit' ? 'unit' : items[0].type === 'Building' ? 'building' : 'other';
	const sources = [...new Set(items.map(i => i.source))];
	const iconEntries = items.map((item, i) => {
		const label = factionLabel(item.id) || (items.length > 1 ? `Variant ${i + 1}` : 'Icon');
		return { label, iconFile: item.icon, id: item.id };
	});
	return { name, desc: items[0].tooltip || '', kind, sources, icons: iconEntries };
}).sort((a, b) => a.name.localeCompare(b.name));

let html = `<!doctype html>
<html><head><meta charset="utf-8"><title>Content Gallery — Visual</title>
<style>
	body { font-family: -apple-system, Segoe UI, sans-serif; background: #1a1c20; color: #e6e8eb; padding: 24px; }
	h1 { font-size: 20px; }
	.grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(260px, 1fr)); gap: 14px; margin-top: 12px; }
	.card { background: #24272d; border: 1px solid #3a3e46; border-radius: 10px; padding: 12px; }
	.card-title { font-weight: 700; font-size: 14px; margin-bottom: 6px; }
	.card-desc { color: #9aa0aa; font-size: 12px; margin-bottom: 8px; min-height: 28px; }
	.card-source { font-size: 10px; color: #6bd48a; margin-bottom: 8px; }
	.icon-row { display: flex; gap: 10px; flex-wrap: wrap; }
	.icon-item { text-align: center; }
	.icon-item img { width: 64px; height: 64px; border-radius: 8px; border: 1px solid #3a3e46; image-rendering: -webkit-optimize-contrast; background: #1a1c20; }
	.icon-label { font-size: 10px; color: #9aa0aa; margin-top: 3px; }
	.kind-tabs { display: flex; gap: 6px; margin: 14px 0 4px; }
	.kind-tab { padding: 6px 14px; border-radius: 6px; background: #24272d; border: 1px solid #3a3e46; cursor: pointer; font-size: 13px; color: #e6e8eb; }
	.kind-tab.active { background: #5fb3ff; color: #0b1a24; font-weight: 600; border-color: #5fb3ff; }
	.count { color: #9aa0aa; font-size: 12px; margin: 6px 0; }
</style></head><body>
<a href="../bar-toolkit-hub/index.html" style="color:#5fb3ff;text-decoration:none;font-size:12px;display:block;margin-bottom:6px;">&larr; Hub</a>
<h1>Content Gallery — Visual</h1>
<p style="color:#9aa0aa;font-size:13px">Every custom unit/building found across the project (our own content + every traced author), grouped by name so faction equivalents share one card. Icons shown are the real in-game icons each unit inherits from its base unit. Data-driven from <a href="../bar-toolkit-hub/custom-content-database/data.js" style="color:#5fb3ff">the Content Gallery dataset</a> -- re-run <code>node tools/build-gallery.js</code> after rebuilding that data.</p>
<div class="kind-tabs">
	<div class="kind-tab active" data-kind="all">All</div>
	<div class="kind-tab" data-kind="building">Buildings</div>
	<div class="kind-tab" data-kind="unit">Units</div>
</div>
<div class="count" id="count"></div>
<div class="grid" id="grid">
`;

for (const card of cards) {
	html += `<div class="card" data-kind="${card.kind}"><div class="card-title">${card.name}</div>`;
	if (card.desc) html += `<div class="card-desc">${card.desc}</div>`;
	html += `<div class="card-source">${card.sources.join(', ')}</div><div class="icon-row">`;
	for (const icon of card.icons) {
		const dataUri = iconDataUri(icon.iconFile);
		html += `<div class="icon-item"><img src="${dataUri}" alt="${icon.id}" title="${icon.id}"><div class="icon-label">${icon.label}</div></div>`;
	}
	html += `</div></div>`;
}

html += `
</div>
<script>
const countEl = document.getElementById('count');
function updateCount() {
	const visible = [...document.querySelectorAll('.card')].filter(c => c.style.display !== 'none').length;
	countEl.textContent = visible + ' of ${cards.length} cards';
}
document.querySelectorAll('.kind-tab').forEach(tab => {
	tab.addEventListener('click', () => {
		document.querySelectorAll('.kind-tab').forEach(t => t.classList.remove('active'));
		tab.classList.add('active');
		const kind = tab.dataset.kind;
		document.querySelectorAll('.card').forEach(card => {
			card.style.display = (kind === 'all' || card.dataset.kind === kind) ? '' : 'none';
		});
		updateCount();
	});
});
updateCount();
</script>
</body></html>`;

const outPath = path.join(__dirname, '..', 'gallery.html');
fs.writeFileSync(outPath, html, 'utf8');
console.log('Wrote', outPath, '(' + (html.length / 1024 / 1024).toFixed(1) + 'MB), ' + cards.length + ' cards from ' + DB.length + ' items');

// Structured extraction for the two authors scan-all-new-units.js found
// creating genuinely new units (not just modifying existing ones):
// RandomGuyJunior's "Space Expansion" (SET/NAME/DESC/ADD helper-function
// idiom) and Mewi's "Nutty Raptors T4 Defence" (direct table-literal
// idiom, standalone units with no clone base). Produces the same
// {id,baseId,name,tooltip} shape as the other traced authors' json files
// so it can merge cleanly into the Content Gallery.
const fs = require('fs');
const path = require('path');

const CREDITS_DIR = path.join(__dirname, 'global-credits-full');
const NEW_UNITS = JSON.parse(fs.readFileSync(path.join(__dirname, 'all-authors-new-units.json'), 'utf8'));

// --- RandomGuyJunior: SET("base") ... NAME("...") DESC("...") ... ADD("newid") ---
function extractRandomGuyJunior() {
	const text = fs.readFileSync(path.join(CREDITS_DIR, 'RandomGuyJunior.tweakdefs.lua'), 'utf8');
	const validIds = new Set(NEW_UNITS.RandomGuyJunior || []);
	const events = [];
	for (const m of text.matchAll(/SET\("([a-z0-9_]+)"\)/g)) events.push({ pos: m.index, type: 'SET', val: m[1] });
	for (const m of text.matchAll(/ADD\("([a-z0-9_]+)"\)/g)) events.push({ pos: m.index, type: 'ADD', val: m[1] });
	for (const m of text.matchAll(/NAME\("([^"]*)"\)/g)) events.push({ pos: m.index, type: 'NAME', val: m[1] });
	for (const m of text.matchAll(/DESC\("([^"]*)"\)/g)) events.push({ pos: m.index, type: 'DESC', val: m[1] });
	events.sort((a, b) => a.pos - b.pos);
	let curBase = null, curName = null, curDesc = null;
	const results = [];
	for (const e of events) {
		if (e.type === 'SET') curBase = e.val;
		else if (e.type === 'NAME') curName = e.val;
		else if (e.type === 'DESC') curDesc = e.val;
		else if (e.type === 'ADD') {
			if (validIds.has(e.val)) results.push({ id: e.val, baseId: curBase, name: curName || e.val, tooltip: curDesc });
			curName = null; curDesc = null;
		}
	}
	return results;
}

// --- Mewi: direct table literals a.newid={name="...",description="..."} ---
function extractMewi() {
	const text = fs.readFileSync(path.join(CREDITS_DIR, 'Mewi.tweakdefs.lua'), 'utf8');
	const validIds = new Set(NEW_UNITS.Mewi || []);
	const results = [];
	for (const id of validIds) {
		const re = new RegExp(`\\.${id}\\s*=\\s*\\{`);
		const m = text.match(re);
		if (!m) continue;
		const after = text.slice(m.index, m.index + 500);
		const nameMatch = after.match(/name\s*=\s*"([^"]*)"/);
		const tooltipMatch = after.match(/i18n_en_tooltip\s*=\s*"([^"]*)"/) || after.match(/description\s*=\s*"([^"]*)"/);
		results.push({ id, baseId: null, name: nameMatch ? nameMatch[1] : id, tooltip: tooltipMatch ? tooltipMatch[1] : null });
	}
	return results;
}

const output = {
	RandomGuyJunior: extractRandomGuyJunior(),
	Mewi: extractMewi(),
};

for (const [author, items] of Object.entries(output)) {
	fs.writeFileSync(path.join(__dirname, `${author.toLowerCase()}-custom-content.json`), JSON.stringify(items, null, 2), 'utf8');
	console.log(`${author}: ${items.length} new units -> ${author.toLowerCase()}-custom-content.json`);
}

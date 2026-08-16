const fs = require('fs');
const path = require('path');

const OUT_DIR = path.join(__dirname, 'waffles-data');
const VANILLA_DB_PATH = path.join(__dirname, '..', 'bar-unit-database', 'units-database.json');

const vanillaDb = JSON.parse(fs.readFileSync(VANILLA_DB_PATH, 'utf8'));
const vanillaIds = new Set(Object.keys(vanillaDb));

const DEF_RE = /unitDefs(?:\.(\w+)|\[['"](\w+)['"]\])\s*=\s*(?:addSelfShield\()?\s*tableMerge\(\s*unitDefs\[['"](\w+)['"]\]/g;

function extractCustomUnits(text) {
	const found = [];
	let m;
	DEF_RE.lastIndex = 0;
	while ((m = DEF_RE.exec(text))) {
		const newId = m[1] || m[2];
		const baseId = m[3];
		if (!newId || vanillaIds.has(newId)) continue;
		const windowText = text.slice(m.index, m.index + 1500);
		const nameMatch = windowText.match(/name\s*=\s*'([^']*)'/) || windowText.match(/name\s*=\s*"([^"]*)"/);
		const tooltipMatch = windowText.match(/i18n_en_tooltip\s*=\s*'([^']*)'/) || windowText.match(/i18n_en_tooltip\s*=\s*"([^"]*)"/);
		const humanNameMatch = windowText.match(/i18n_en_humanname\s*=\s*'([^']*)'/) || windowText.match(/i18n_en_humanname\s*=\s*"([^"]*)"/);
		found.push({
			id: newId,
			baseId,
			name: (humanNameMatch && humanNameMatch[1]) || (nameMatch && nameMatch[1]) || newId,
			tooltip: (tooltipMatch && tooltipMatch[1]) || null,
		});
	}
	return found;
}

const files = fs.readdirSync(OUT_DIR).filter(f => f.endsWith('.lua'));
const allItems = new Map();
const creditLines = new Set();

for (const f of files) {
	const text = fs.readFileSync(path.join(OUT_DIR, f), 'utf8');
	for (const item of extractCustomUnits(text)) {
		if (!allItems.has(item.id)) allItems.set(item.id, item);
	}
	const credits = [...text.slice(0, 300).matchAll(/--[^\n]*\b(?:by|credit)\b[^\n]*/gi)];
	for (const c of credits) creditLines.add(c[0].trim());
}

console.log(`Total distinct custom units/buildings across his 17 preset variants: ${allItems.size}\n`);
console.log('Credit/author comments found:');
for (const c of creditLines) console.log(' ', c);
console.log();
console.log('Sample of custom items:');
for (const item of [...allItems.values()].slice(0, 30)) {
	console.log(`  ${item.name} (${item.id}, from ${item.baseId})`);
}

fs.writeFileSync(path.join(__dirname, 'waffles-custom-content.json'), JSON.stringify([...allItems.values()], null, 1));

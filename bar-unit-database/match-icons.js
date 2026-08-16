// Matches each unit's `buildpic` field (e.g. "ARMLLT.DDS" or
// "scavengers/SCAVBEACON.DDS") to its converted PNG path in icons-png/,
// case-insensitively, falling back to icons-png/<id>.png by convention.
const fs = require('fs');
const path = require('path');

function walk(dir, out = []) {
	for (const e of fs.readdirSync(dir, { withFileTypes: true })) {
		const full = path.join(dir, e.name);
		if (e.isDirectory()) walk(full, out);
		else if (e.name.toLowerCase().endsWith('.png')) out.push(full);
	}
	return out;
}

const pngFiles = walk('icons-png');
const lowerMap = new Map(); // lowercase relative path (with /) -> actual relative path
for (const f of pngFiles) {
	const rel = path.relative('icons-png', f).replace(/\\/g, '/');
	lowerMap.set(rel.toLowerCase(), rel);
}

const db = JSON.parse(fs.readFileSync('units-database.json', 'utf8'));
let matched = 0, unmatched = 0;

for (const unit of Object.values(db)) {
	let iconRel = null;
	if (unit.buildpic) {
		const guess = unit.buildpic.replace(/\.dds$/i, '.png').toLowerCase();
		if (lowerMap.has(guess)) iconRel = lowerMap.get(guess);
	}
	if (!iconRel) {
		const fallback = (unit.id + '.png').toLowerCase();
		if (lowerMap.has(fallback)) iconRel = lowerMap.get(fallback);
	}
	unit.icon = iconRel; // relative to icons-png/, or null
	if (iconRel) matched++; else unmatched++;
}

fs.writeFileSync('units-database.json', JSON.stringify(db, null, 1), 'utf8');
console.log(`Matched icons for ${matched} units, ${unmatched} without an icon.`);

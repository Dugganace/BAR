// Same custom-unit extraction logic as bar-preset-builder/extract-custom-content.js,
// but sourced from the distinct-presets.json produced by scan-demos.js + dedupe.js
// (i.e. from OUR OWN replay history) instead of from optionsPresets.json.
const fs = require('fs');
const path = require('path');

const OUT_DIR = path.join(__dirname, 'output');
const VANILLA_DB_PATH = path.join(__dirname, '..', 'bar-unit-database', 'units-database.json');
const DISTINCT_PATH = path.join(OUT_DIR, 'distinct-presets.json');
const RESULT_PATH = path.join(__dirname, 'replay-custom-content.json');

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
			baseIcon: vanillaDb[baseId] ? vanillaDb[baseId].icon : null,
			baseFaction: vanillaDb[baseId] ? vanillaDb[baseId].faction : null,
		});
	}
	return found;
}

const distinct = JSON.parse(fs.readFileSync(DISTINCT_PATH, 'utf8'));
const result = {}; // { hash: { games, items, latest } }

for (const group of distinct) {
	const base = group.games[group.games.length - 1].file.replace(/\.sdfz$/i, '');
	const defsPath = path.join(OUT_DIR, base + '.tweakdefs.lua');
	const unitsPath = path.join(OUT_DIR, base + '.tweakunits.lua');
	const defs = fs.existsSync(defsPath) ? fs.readFileSync(defsPath, 'utf8') : '';
	const units = fs.existsSync(unitsPath) ? fs.readFileSync(unitsPath, 'utf8') : '';

	const itemsById = new Map();
	for (const item of [...extractCustomUnits(defs), ...extractCustomUnits(units)]) {
		if (!itemsById.has(item.id)) itemsById.set(item.id, item);
	}
	if (itemsById.size > 0) {
		result[group.hash] = {
			playCount: group.games.length,
			latestFile: group.games[group.games.length - 1].file,
			firstFile: group.games[0].file,
			players: [...new Set(group.games.flatMap(g => g.players))],
			items: [...itemsById.values()],
		};
	}
}

fs.writeFileSync(RESULT_PATH, JSON.stringify(result, null, 1), 'utf8');
const totalItems = Object.values(result).reduce((s, p) => s + p.items.length, 0);
console.log(`Found custom content in ${Object.keys(result).length} of ${distinct.length} distinct preset sets, ${totalItems} custom unit/building entries total.`);

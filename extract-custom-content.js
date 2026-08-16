// For every decoded preset tweak slot, finds unit ids that are DEFINED
// there (unitDefs.X = tableMerge(unitDefs['base'], {...}) style) and are
// NOT already real vanilla units -- i.e. genuinely new custom content a
// preset adds, not a balance tweak to something that already exists.
// Extracts display name/tooltip/base-cloned-from for each, so we can show
// a real icon (inherited from the base unit) and description per item.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const VANILLA_DB_PATH = path.join(__dirname, '..', 'bar-unit-database', 'units-database.json');
const OUT_PATH = path.join(__dirname, 'custom-content.json');

const SLOT_KEYS = ['tweakdefs', 'tweakunits',
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakdefs' + i),
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakunits' + i)];

function decode(value) {
	if (!value) return null;
	const attempts = [value, value.replace(/-/g, '+').replace(/_/g, '/')];
	for (const attempt of attempts) {
		try {
			const padded = attempt + '='.repeat((4 - attempt.length % 4) % 4);
			const text = Buffer.from(padded, 'base64').toString('utf8');
			const printableRatio = [...text].filter(c => c.charCodeAt(0) >= 9 && c.charCodeAt(0) < 127).length / Math.max(1, text.length);
			if (printableRatio > 0.9) return text;
		} catch (e) { /* try next */ }
	}
	return null;
}

const vanillaDb = JSON.parse(fs.readFileSync(VANILLA_DB_PATH, 'utf8'));
const vanillaIds = new Set(Object.keys(vanillaDb));

// Match: unitDefs.newid = tableMerge(unitDefs['baseid'], ...  OR  unitDefs["baseid"]
// Also: unitDefs['newid'] = tableMerge(unitDefs['baseid'], ...
const DEF_RE = /unitDefs(?:\.(\w+)|\[['"](\w+)['"]\])\s*=\s*(?:addSelfShield\()?\s*tableMerge\(\s*unitDefs\[['"](\w+)['"]\]/g;

function extractCustomUnits(text) {
	const found = [];
	let m;
	DEF_RE.lastIndex = 0;
	while ((m = DEF_RE.exec(text))) {
		const newId = m[1] || m[2];
		const baseId = m[3];
		if (!newId || vanillaIds.has(newId)) continue; // skip if it's actually a real vanilla id (a balance tweak, not new content)
		// Grab a window of text after the match to look for name/tooltip within this unit's own table.
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

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
const result = {}; // { presetName: { map, items: [...] } }

for (const presetName of Object.keys(presets)) {
	const mod = presets[presetName].Modoptions || {};
	const itemsById = new Map(); // dedupe within a preset (same unit id might appear if slots overlap oddly)
	for (const slot of SLOT_KEYS) {
		const raw = mod[slot];
		if (!raw || raw.length === 0) continue;
		const decoded = decode(raw);
		if (!decoded) continue;
		for (const item of extractCustomUnits(decoded)) {
			if (!itemsById.has(item.id)) itemsById.set(item.id, item);
		}
	}
	if (itemsById.size > 0) {
		result[presetName] = { map: presets[presetName].Map || '', items: [...itemsById.values()] };
	}
}

fs.writeFileSync(OUT_PATH, JSON.stringify(result, null, 1), 'utf8');
const totalItems = Object.values(result).reduce((s, p) => s + p.items.length, 0);
console.log(`Found custom content in ${Object.keys(result).length} presets, ${totalItems} custom unit/building entries total.`);

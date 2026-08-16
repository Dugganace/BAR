// Builds one unified database of every custom unit/building found across
// the whole project: our own custom_buildings.lua (current + superseded
// ids still seen in old saved presets), the 3 traced authors' extracted
// content (CrossGamer/Hazyhazelnuts/Waffles_II), and anything else found
// while decoding all 51 saved presets in the Preset Catalog. Purpose: a
// single browsable "what custom content exists, where did it come from,
// which presets is it already in" reference to pick from when building a
// new preset -- not an auto-adoption tool, doesn't touch any live preset.
const fs = require('fs');
const path = require('path');

const OUT_FILE = path.join(__dirname, 'data.js');

const CUSTOM_BUILDINGS = path.join(__dirname, '..', '..', 'bar-custom-buildings', 'custom_buildings.lua');
const CATALOG_DATA = path.join(__dirname, '..', '..', 'bar-custom-buildings', 'catalog-viewer', 'data.js');
const AUTHOR_FILES = {
	CrossGamer: path.join(__dirname, '..', '..', 'bar-replay-miner', 'crossgamer-custom-content.json'),
	Hazyhazelnuts: path.join(__dirname, '..', '..', 'bar-replay-miner', 'hazy-custom-content.json'),
	Waffles_II: path.join(__dirname, '..', '..', 'bar-replay-miner', 'waffles-custom-content.json'),
};
const UNIT_DB = path.join(__dirname, '..', '..', 'bar-unit-database', 'units-database.json');

// --- 1. Load the preset catalog (all 51 presets, per-slot unitIds + raw text) ---
let catalogText = fs.readFileSync(CATALOG_DATA, 'utf8').replace('window.CATALOG = ', '').replace(/;\s*$/, '');
const catalog = JSON.parse(catalogText);

// Map id -> which presets/slots it appears in, and id -> a raw-text sample
// to extract from as a fallback when no clean structured source exists.
const presetsById = {};
const rawSampleById = {};
for (const [presetName, preset] of Object.entries(catalog)) {
	for (const [slotName, slot] of Object.entries(preset.slots)) {
		for (const id of (slot.unitIds || [])) {
			(presetsById[id] = presetsById[id] || []).push(`${presetName} (${slotName})`);
			if (!rawSampleById[id]) {
				const idx = slot.text.indexOf(id);
				if (idx >= 0) rawSampleById[id] = slot.text.slice(Math.max(0, idx - 60), idx + 500);
			}
		}
	}
}

// --- 2. Best-effort structured extraction from a raw text sample (used
// only for ids with no clean source from steps 3/4 below) ---
// Matches a single-quoted Lua string, allowing \' escapes inside it.
const LUA_STRING = String.raw`'((?:\\'|[^'])*)'`;

function unescapeLuaString(s) {
	return s ? s.replace(/\\'/g, "'") : s;
}

function extractFromRaw(id, raw) {
	if (!raw) return {};
	const nameMatch = raw.match(new RegExp(String.raw`name\s*=\s*${LUA_STRING}`));
	const tooltipMatch = raw.match(new RegExp(String.raw`i18n_en_tooltip\s*=\s*${LUA_STRING}`));
	const baseMatch = raw.match(/unitDefs\[['"]?([A-Za-z0-9_]+)['"]?\]/);
	return {
		name: nameMatch ? unescapeLuaString(nameMatch[1]) : null,
		tooltip: tooltipMatch ? unescapeLuaString(tooltipMatch[1]) : null,
		baseId: baseMatch ? baseMatch[1] : null,
	};
}

// --- 3. Our own current custom_buildings.lua (clean, high-confidence) ---
const ourText = fs.readFileSync(CUSTOM_BUILDINGS, 'utf8');
const ourEntries = {};
{
	const re = /unitDefs\.([A-Za-z0-9_]+)\s*=\s*(?:addSelfShield\()?tableMerge\(unitDefs\[['"]?([A-Za-z0-9_]+)['"]?\]/g;
	let m;
	while ((m = re.exec(ourText))) {
		const [, id, baseId] = m;
		const after = ourText.slice(m.index, m.index + 600);
		const nameMatch = after.match(new RegExp(String.raw`name\s*=\s*${LUA_STRING}`));
		const tooltipMatch = after.match(new RegExp(String.raw`i18n_en_tooltip\s*=\s*${LUA_STRING}`));
		ourEntries[id] = { name: nameMatch ? unescapeLuaString(nameMatch[1]) : id, tooltip: tooltipMatch ? unescapeLuaString(tooltipMatch[1]) : null, baseId, source: 'Ours (current)' };
	}
}

// --- 4. Traced authors (clean, from dedicated extraction passes) ---
const authorEntries = {};
for (const [author, file] of Object.entries(AUTHOR_FILES)) {
	if (!fs.existsSync(file)) continue;
	for (const item of JSON.parse(fs.readFileSync(file, 'utf8'))) {
		if (!authorEntries[item.id]) authorEntries[item.id] = { name: item.name, tooltip: item.tooltip, baseId: item.baseId, source: author };
	}
}

// --- 5. Merge everything, preferring clean sources over raw extraction ---
const realUnitIds = fs.existsSync(UNIT_DB) ? new Set(Object.keys(JSON.parse(fs.readFileSync(UNIT_DB, 'utf8')))) : new Set();

const allIds = new Set([...Object.keys(presetsById), ...Object.keys(ourEntries), ...Object.keys(authorEntries)]);
const database = [];
for (const id of allIds) {
	let entry = authorEntries[id] || ourEntries[id];
	let confidence = entry ? 'confirmed' : 'guessed';
	if (!entry) {
		const extracted = extractFromRaw(id, rawSampleById[id]);
		entry = { name: extracted.name || id, tooltip: extracted.tooltip, baseId: extracted.baseId, source: 'Unattributed (found in saved presets)' };
	}
	database.push({
		id,
		name: entry.name || id,
		tooltip: entry.tooltip || null,
		baseId: entry.baseId || null,
		baseIsRealUnit: entry.baseId ? realUnitIds.has(entry.baseId) : null,
		source: entry.source,
		confidence,
		foundInPresets: presetsById[id] || [],
		presetCount: (presetsById[id] || []).length,
	});
}

database.sort((a, b) => a.id.localeCompare(b.id));

fs.writeFileSync(OUT_FILE, `window.CUSTOM_CONTENT_DATABASE = ${JSON.stringify(database, null, 2)};\n`, 'utf8');
console.log(`Wrote ${database.length} unique custom units/buildings to ${OUT_FILE}`);
console.log(`  Confirmed (clean source): ${database.filter(d => d.confidence === 'confirmed').length}`);
console.log(`  Guessed (raw-text extraction): ${database.filter(d => d.confidence === 'guessed').length}`);
console.log(`  By source: ${JSON.stringify(database.reduce((acc, d) => { acc[d.source] = (acc[d.source] || 0) + 1; return acc; }, {}))}`);

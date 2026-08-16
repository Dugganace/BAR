// Same generic new-unit scanner as bar-replay-miner/scan-all-new-units.js,
// pointed at the NuttyB Configurator's own decoded tweak content (its real
// payload, tweakdata.txt, base64-decoded into decoded/*.lua by a one-off
// script). Finds which of NuttyB's 15 toggles create genuinely new unit
// ids vs. which only modify existing ones.
const fs = require('fs');
const path = require('path');

const DECODED_DIR = path.join(__dirname, 'decoded');
const UNIT_DB = path.join(__dirname, '..', '..', 'bar-unit-database', 'units-database.json');
const OUT_FILE = path.join(__dirname, 'nuttyb-new-units.json');

const vanillaIds = new Set(Object.keys(JSON.parse(fs.readFileSync(UNIT_DB, 'utf8'))));

function findUnitDefsAliases(text) {
	const aliases = new Set(['UnitDefs', 'unitDefs']);
	for (const m of text.matchAll(/local\s+(\w+)\s*=\s*UnitDefs\s*(?:or\s*\{\})?(?=\s*[,;\n]|\s*$)/g)) aliases.add(m[1]);
	for (const m of text.matchAll(/local\s+([\w,\s]+?)\s*=\s*([^\n;]+)/g)) {
		const names = m[1].split(',').map(s => s.trim());
		const exprs = m[2].split(',').map(s => s.trim());
		for (let i = 0; i < names.length && i < exprs.length; i++) {
			if (/^UnitDefs(\s*or\s*\{\})?$/.test(exprs[i])) aliases.add(names[i]);
		}
	}
	return aliases;
}

function scanFile(text) {
	const found = new Set();
	const aliases = findUnitDefsAliases(text);
	for (const alias of aliases) {
		const escaped = alias.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
		for (const re of [
			new RegExp(`${escaped}\\.([a-zA-Z][a-zA-Z0-9_]*)\\s*=[^=]`, 'g'),
			new RegExp(`${escaped}\\[['"]([a-zA-Z][a-zA-Z0-9_]*)['"]\\]\\s*=[^=]`, 'g'),
		]) {
			let m;
			while ((m = re.exec(text))) found.add(m[1]);
		}
	}
	for (const m of text.matchAll(/\bADD\(\s*['"]([a-zA-Z][a-zA-Z0-9_]*)['"]\s*\)/g)) found.add(m[1]);
	return found;
}

const PLAUSIBLE_ID = /^(arm|cor|leg|raptor|scav|legendary)[a-z0-9_]*$/i;
const KNOWN_FALSE_POSITIVES = new Set(['corpse', 'armor', 'cordon', 'legacy']);

const results = {};
for (const file of fs.readdirSync(DECODED_DIR).filter(f => f.endsWith('.lua'))) {
	const text = fs.readFileSync(path.join(DECODED_DIR, file), 'utf8');
	const found = scanFile(text);
	const newOnes = [...found].filter(id => !vanillaIds.has(id) && id.length >= 3 && PLAUSIBLE_ID.test(id) && !KNOWN_FALSE_POSITIVES.has(id.toLowerCase()));
	results[file] = newOnes.sort();
}

fs.writeFileSync(OUT_FILE, JSON.stringify(results, null, 2), 'utf8');
console.log(`Wrote ${OUT_FILE}`);
for (const [file, ids] of Object.entries(results)) {
	console.log(`  ${file}: ${ids.length} new ids${ids.length ? ' -- ' + ids.slice(0, 10).join(', ') + (ids.length > 10 ? ', ...' : '') : ''}`);
}

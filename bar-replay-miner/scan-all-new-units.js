// Broader new-unit scanner across EVERY traced author's raw script, not
// just the 3 originally hand-extracted (CrossGamer/Hazyhazelnuts/
// Waffles_II). Different authors write in genuinely different idioms
// (direct UnitDefs.id=, aliased local var, helper-function SET/ADD
// patterns, etc) so this tries several patterns per file rather than one
// fixed regex, then cross-references every found id against the real
// vanilla unit list -- only ids that AREN'T real vanilla units are new
// custom content worth surfacing.
const fs = require('fs');
const path = require('path');

const CREDITS_DIR = path.join(__dirname, 'global-credits-full');
const UNIT_DB = path.join(__dirname, '..', 'bar-unit-database', 'units-database.json');
const OUT_FILE = path.join(__dirname, 'all-authors-new-units.json');

const vanillaIds = new Set(Object.keys(JSON.parse(fs.readFileSync(UNIT_DB, 'utf8'))));

function findUnitDefsAliases(text) {
	const aliases = new Set(['UnitDefs', 'unitDefs']);
	// local x = UnitDefs or {} -- must be the WHOLE RHS (not UnitDefs[key]
	// or UnitDefs.field, which alias a single unit, not the master table).
	for (const m of text.matchAll(/local\s+(\w+)\s*=\s*UnitDefs\s*(?:or\s*\{\})?(?=\s*[,;\n]|\s*$)/g)) aliases.add(m[1]);
	// local a,b,c = expr1, UnitDefs, expr3 (positional multi-assign)
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
	// RandomGuyJunior-style: SET(base) ... ADD(newid) helper pattern.
	for (const m of text.matchAll(/\bADD\(\s*['"]([a-zA-Z][a-zA-Z0-9_]*)['"]\s*\)/g)) found.add(m[1]);
	return found;
}

const results = {};
for (const file of fs.readdirSync(CREDITS_DIR).filter(f => f.endsWith('.lua'))) {
	const author = file.replace(/\.(tweakdefs|tweakunits)\.lua$/, '');
	const text = fs.readFileSync(path.join(CREDITS_DIR, file), 'utf8');
	const found = scanFile(text);
	// Plausibility filter: real BAR unit ids overwhelmingly follow the
	// faction-prefix convention (arm/cor/leg/raptor/scav...). Field-name
	// false positives (from cross-scope local-variable reuse the regex
	// scanner can't fully avoid without real Lua scoping) mostly don't.
	const PLAUSIBLE_ID = /^(arm|cor|leg|raptor|scav|legendary)[a-z0-9_]*$/i;
	const KNOWN_FALSE_POSITIVES = new Set(['corpse', 'armor', 'cordon', 'legacy']);
	const newOnes = [...found].filter(id => !vanillaIds.has(id) && id.length >= 3 && PLAUSIBLE_ID.test(id) && !KNOWN_FALSE_POSITIVES.has(id.toLowerCase()));
	if (newOnes.length === 0) continue;
	results[author] = results[author] || new Set();
	newOnes.forEach(id => results[author].add(id));
}

const output = {};
for (const [author, ids] of Object.entries(results)) {
	output[author] = [...ids].sort();
}

fs.writeFileSync(OUT_FILE, JSON.stringify(output, null, 2), 'utf8');
console.log(`Wrote ${OUT_FILE}`);
for (const [author, ids] of Object.entries(output)) {
	console.log(`  ${author}: ${ids.length} non-vanilla ids -- ${ids.slice(0, 8).join(', ')}${ids.length > 8 ? ', ...' : ''}`);
}

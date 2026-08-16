// Pre-injection review: run this on custom_buildings.lua BEFORE building
// any new preset from it. Checks base units against the current live game
// data, re-runs the id-collision check, flags patterns we've found risky
// through past live testing, and reports where the file could be trimmed
// if a 6th slot is ever needed. Doesn't modify anything -- read-only report.
const fs = require('fs');
const path = require('path');
const { execSync } = require('child_process');

const CUSTOM_BUILDINGS = path.join(__dirname, '..', 'custom_buildings.lua');
const UNIT_DB_DIR = path.join(__dirname, '..', '..', 'bar-unit-database');
const UNIT_DB = path.join(UNIT_DB_DIR, 'units-database.json');
const BASELINE_DATE = path.join(UNIT_DB_DIR, 'BASELINE_DATE.txt');
const BASELINE_COMMIT = path.join(UNIT_DB_DIR, 'BASELINE_COMMIT.txt');

const text = fs.readFileSync(CUSTOM_BUILDINGS, 'utf8');
const lines = text.split('\n');

console.log('=== Pre-injection review: custom_buildings.lua ===\n');

// --- 1. Game-update freshness ---
console.log('--- 1. Game-update freshness ---');
if (fs.existsSync(BASELINE_DATE) && fs.existsSync(BASELINE_COMMIT)) {
	const date = fs.readFileSync(BASELINE_DATE, 'utf8').trim();
	const commit = fs.readFileSync(BASELINE_COMMIT, 'utf8').trim();
	console.log(`Unit database baseline: ${commit.slice(0, 8)} (checked ${date})`);
	try {
		execSync('git fetch origin master', { cwd: UNIT_DB_DIR, stdio: 'pipe' });
		const latest = execSync('git rev-parse origin/master', { cwd: UNIT_DB_DIR }).toString().trim();
		if (latest === commit) {
			console.log('✓ Baseline is current with the live game repo. No pending update to check.');
		} else {
			console.log(`⚠ Game repo has moved since baseline (${commit.slice(0, 8)} -> ${latest.slice(0, 8)}).`);
			console.log('  Run `node ../../bar-unit-database/check-for-updates.js` before proceeding.');
		}
	} catch (e) {
		console.log(`⚠ Couldn't check for updates (offline?): ${e.message}`);
	}
} else {
	console.log('⚠ No baseline recorded -- run check-for-updates.js at least once.');
}

// --- 2. Base unit validation ---
console.log('\n--- 2. Base unit validation (every tableMerge source must exist) ---');
const baseIds = new Set();
{
	const re = /tableMerge\(\s*unitDefs\[['"](\w+)['"]\]/g;
	let m;
	while ((m = re.exec(text))) baseIds.add(m[1]);
}
let realIds = new Set();
if (fs.existsSync(UNIT_DB)) realIds = new Set(Object.keys(JSON.parse(fs.readFileSync(UNIT_DB, 'utf8'))));
const missingBases = [...baseIds].filter(id => !realIds.has(id));
console.log(`${baseIds.size} distinct base unit ids referenced.`);
if (missingBases.length === 0) {
	console.log('✓ All base ids exist in the current unit database.');
} else {
	missingBases.forEach(id => console.log(`  ⚠ "${id}" not found in the current unit database -- clone would silently fail.`));
}

// --- 3. Id-collision check (re-run inline) ---
console.log('\n--- 3. Id-collision check ---');
try {
	const out = execSync('node tools/check-id-collisions.js', { cwd: path.join(__dirname, '..') }).toString();
	const criticalLines = out.split('\n').filter(l => l.includes('⚠') && !l.includes('Cross-author'));
	console.log(out.includes('No unexpected vanilla collisions') ? '✓ No unexpected vanilla-unit collisions.' : criticalLines.join('\n'));
} catch (e) {
	console.log(`⚠ Collision checker failed to run: ${e.message}`);
}

// --- 4. Known-risky pattern flags (from this project's own live-test history) ---
console.log('\n--- 4. Known-risky patterns ---');
const ourIds = new Set();
for (const re of [/unitDefs\.([A-Za-z0-9_]+)\s*=/g, /unitDefs\['([A-Za-z0-9_]+)'\]\s*=/g]) {
	let m; while ((m = re.exec(text))) ourIds.add(m[1]);
}
const KNOWN_INTENTIONAL_SELF_OVERRIDES = new Set(['armbotrail']); // Depawner: mutates the real Pawn Launcher's weapon, not a new-clone chain
const chainedClones = [...baseIds].filter(id => ourIds.has(id) && !KNOWN_INTENTIONAL_SELF_OVERRIDES.has(id));
if (chainedClones.length === 0) {
	console.log('✓ No clone-of-our-own-clone chains (every tableMerge source is a real vanilla unit, not one of our own ids) -- avoids execution-order sensitivity within a single script.');
} else {
	chainedClones.forEach(id => console.log(`  ⚠ "${id}" is both a base we clone FROM and an id we define -- execution order inside the file matters here, double check it's defined before it's used as a base.`));
}
console.log('  Reminder: tweakunits1 silently failed to apply our Commander Progression Chain in one');
console.log('  pre-patch test this session -- if targeting tweakunits1-9 for new content, live-test that');
console.log('  slot specifically before trusting it (tweakunits2 tested fine once, tweakunits1 did not).');

// --- 5. Trim opportunities ---
console.log('\n--- 5. Trim opportunities ---');
const commentLines = lines.filter(l => l.trim().startsWith('--'));
const commentChars = commentLines.reduce((s, l) => s + l.length, 0);
console.log(`${commentLines.length} comment lines, ${commentChars} chars (${((commentChars / text.length) * 100).toFixed(1)}% of the file).`);
const headerEnd = lines.findIndex(l => /^-{20,}$/.test(l.trim()));
if (headerEnd >= 0) {
	const headerLen = lines.slice(0, headerEnd).join('\n').length;
	console.log(`Shared header: ${headerLen} chars -- duplicated into every packaged slot, so trimming it has the biggest packaging-space payoff.`);
}
const longTooltips = [...text.matchAll(/i18n_en_tooltip\s*=\s*'([^']{80,})'/g)];
if (longTooltips.length) {
	console.log(`${longTooltips.length} tooltip(s) over 80 chars -- candidates for shortening if space is tight:`);
	longTooltips.forEach(m => console.log(`  (${m[1].length} chars) "${m[1].slice(0, 60)}..."`));
} else {
	console.log('No unusually long tooltips found.');
}

console.log('\n=== Review complete. Fix any ⚠ above before building a new preset. ===');

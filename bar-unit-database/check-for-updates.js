// Compares the current live game repo against our stored baseline commit
// to detect new/removed/modified unit files since the database was last
// built. Run this periodically (or before relying on the database) to
// know if `node extract-units.js` needs to be re-run.
const { execSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const baselineCommit = fs.readFileSync(path.join(__dirname, 'BASELINE_COMMIT.txt'), 'utf8').trim();

console.log('Fetching latest from origin/master...');
execSync('git fetch origin master', { cwd: __dirname, stdio: 'inherit' });

const latestCommit = execSync('git rev-parse origin/master', { cwd: __dirname }).toString().trim();

if (latestCommit === baselineCommit) {
	console.log('\nNo change: baseline is already up to date with origin/master.');
	console.log('Commit:', baselineCommit);
	process.exit(0);
}

console.log(`\nNew commits available: ${baselineCommit.slice(0,8)} -> ${latestCommit.slice(0,8)}`);

const diff = execSync(`git diff --name-status ${baselineCommit} ${latestCommit} -- units/ language/en/units.json`, { cwd: __dirname }).toString();
const lines = diff.trim().split('\n').filter(Boolean);

const added = lines.filter(l => l.startsWith('A')).map(l => l.split('\t')[1]);
const removed = lines.filter(l => l.startsWith('D')).map(l => l.split('\t')[1]);
const modified = lines.filter(l => l.startsWith('M')).map(l => l.split('\t')[1]);

console.log(`\n${added.length} added, ${removed.length} removed, ${modified.length} modified (unit files + names/descriptions file).`);
if (added.length) { console.log('\nAdded:'); added.forEach(f => console.log('  +', f)); }
if (removed.length) { console.log('\nRemoved:'); removed.forEach(f => console.log('  -', f)); }
if (modified.length) { console.log('\nModified:'); modified.slice(0, 30).forEach(f => console.log('  ~', f)); if (modified.length > 30) console.log(`  ... and ${modified.length - 30} more`); }

console.log('\nTo pull in these changes and rebuild the database:');
console.log('  git checkout origin/master -- units/ language/en/units.json');
console.log('  git rev-parse HEAD > BASELINE_COMMIT.txt   (or use', latestCommit, 'directly)');
console.log('  node extract-units.js');

// Game-update resilience check: custom_buildings.lua clones from specific
// vanilla unit ids (tableMerge(unitDefs['some id'], ...)) -- if a game
// update removes or restructures one of those, our content silently
// breaks. Cross-reference the removed/modified files above against what
// we actually depend on, so this gets caught here instead of in a live
// test.
const CUSTOM_BUILDINGS_PATH = path.join(__dirname, '..', 'bar-custom-buildings', 'custom_buildings.lua');
if (fs.existsSync(CUSTOM_BUILDINGS_PATH) && fs.existsSync(path.join(__dirname, 'units-database.json'))) {
	const unitsDb = JSON.parse(fs.readFileSync(path.join(__dirname, 'units-database.json'), 'utf8'));
	const fileToId = new Map(Object.values(unitsDb).map(u => [u.file, u.id]));

	const customText = fs.readFileSync(CUSTOM_BUILDINGS_PATH, 'utf8');
	const dependedIds = new Set();
	const re = /tableMerge\(\s*unitDefs\[['"](\w+)['"]\]/g;
	let m;
	while ((m = re.exec(customText))) dependedIds.add(m[1]);

	const changedFiles = [...removed, ...modified];
	const atRisk = changedFiles
		.map(f => f.replace(/^units\//, ''))
		.filter(f => fileToId.has(f) && dependedIds.has(fileToId.get(f)))
		.map(f => fileToId.get(f));

	console.log(`\ncustom_buildings.lua depends on ${dependedIds.size} vanilla base unit id(s).`);
	if (atRisk.length) {
		console.log(`⚠ ${atRisk.length} of them changed or were removed in this update: ${atRisk.join(', ')}`);
		console.log('  Check these specifically after rebuilding the database -- a clone whose');
		console.log('  base unit changed shape can silently break or behave unexpectedly.');
	} else {
		console.log('None of our depended-on base units were touched in this update.');
	}
}

// Cross-references every unit id our own custom_buildings.lua defines
// against (a) the real base-game unit id list, to catch any accidental
// overwrite of a vanilla unit, and (b) every other traced author's
// extracted content (CrossGamer/Hazyhazelnuts/Waffles_II from
// bar-replay-miner), to catch id collisions that would only surface once
// two authors' content gets combined into the same preset.
const fs = require('fs');
const path = require('path');

const CUSTOM_BUILDINGS = path.join(__dirname, '..', 'custom_buildings.lua');
const UNIT_DB = path.join(__dirname, '..', '..', 'bar-unit-database', 'units-database.json');
const AUTHOR_FILES = {
	CrossGamer: path.join(__dirname, '..', '..', 'bar-replay-miner', 'crossgamer-custom-content.json'),
	Hazyhazelnuts: path.join(__dirname, '..', '..', 'bar-replay-miner', 'hazy-custom-content.json'),
	Waffles_II: path.join(__dirname, '..', '..', 'bar-replay-miner', 'waffles-custom-content.json'),
};

function extractOurIds() {
	const text = fs.readFileSync(CUSTOM_BUILDINGS, 'utf8');
	const ids = new Set();
	for (const re of [/unitDefs\.([A-Za-z0-9_]+)\s*=/g, /unitDefs\['([A-Za-z0-9_]+)'\]\s*=/g]) {
		let m;
		while ((m = re.exec(text))) ids.add(m[1]);
	}
	return ids;
}

function loadRealUnitIds() {
	if (!fs.existsSync(UNIT_DB)) {
		console.warn(`⚠ Real unit database not found at ${UNIT_DB} -- skipping vanilla-collision check.`);
		return new Set();
	}
	const db = JSON.parse(fs.readFileSync(UNIT_DB, 'utf8'));
	return new Set(Object.keys(db));
}

function loadAuthorIds() {
	const byAuthor = {};
	for (const [author, file] of Object.entries(AUTHOR_FILES)) {
		if (!fs.existsSync(file)) {
			console.warn(`⚠ ${author}'s content file not found at ${file} -- skipping.`);
			continue;
		}
		const items = JSON.parse(fs.readFileSync(file, 'utf8'));
		byAuthor[author] = new Set(items.map(i => i.id));
	}
	return byAuthor;
}

// Known, intentional overrides of a real vanilla unit -- these are
// deliberate design choices (e.g. the Depawner interceptor fix modifies
// the real Scavenger Pawn Launcher's weapon), not accidental id reuse.
const KNOWN_INTENTIONAL_VANILLA_OVERRIDES = new Set(['armbotrail']);

const ourIds = extractOurIds();
const realIds = loadRealUnitIds();
const authorIds = loadAuthorIds();

console.log(`Our custom_buildings.lua defines ${ourIds.size} unit ids.\n`);

// 1. Collisions with real vanilla units -- these would silently corrupt a
// real base-game unit instead of creating something new.
const vanillaCollisions = [...ourIds].filter(id => realIds.has(id));
const unexpectedVanillaCollisions = vanillaCollisions.filter(id => !KNOWN_INTENTIONAL_VANILLA_OVERRIDES.has(id));
console.log(`=== Vanilla collisions (CRITICAL if any unexpected) ===`);
vanillaCollisions.filter(id => KNOWN_INTENTIONAL_VANILLA_OVERRIDES.has(id))
	.forEach(id => console.log(`  ✓ "${id}" is a REAL base-game unit id -- known intentional override, not a bug.`));
if (unexpectedVanillaCollisions.length === 0) {
	console.log('No unexpected vanilla collisions.\n');
} else {
	unexpectedVanillaCollisions.forEach(id => console.log(`  ⚠ "${id}" is a REAL base-game unit id -- our clone would overwrite it, not create a new unit.`));
	console.log('');
}

// 2. Collisions with other traced authors' content -- only a problem if we
// ever combine our content with theirs in the same preset.
console.log(`=== Cross-author collisions (only matters if combining presets) ===`);
let anyAuthorCollision = false;
for (const [author, ids] of Object.entries(authorIds)) {
	const collisions = [...ourIds].filter(id => ids.has(id));
	if (collisions.length > 0) {
		anyAuthorCollision = true;
		collisions.forEach(id => console.log(`  ⚠ "${id}" is used by both us and ${author}.`));
	}
}
// Also check the traced authors against each other.
const authorNames = Object.keys(authorIds);
for (let i = 0; i < authorNames.length; i++) {
	for (let j = i + 1; j < authorNames.length; j++) {
		const [a, b] = [authorNames[i], authorNames[j]];
		const shared = [...authorIds[a]].filter(id => authorIds[b].has(id));
		if (shared.length > 0) {
			anyAuthorCollision = true;
			shared.forEach(id => console.log(`  ⚠ "${id}" is used by both ${a} and ${b}.`));
		}
	}
}
if (!anyAuthorCollision) console.log('None found among the currently-traced authors.\n');

console.log(`\nDone. Re-run this after adding new content to custom_buildings.lua or tracing a new author.`);

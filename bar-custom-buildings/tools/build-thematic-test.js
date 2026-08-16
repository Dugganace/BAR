// One-off: builds "mark magic test" using THEMATIC (not size-balanced) grouping
// of the same full custom_buildings.lua content, to test whether Tetris
// stable's "fewer/cohesive scripts" packaging style is even achievable given
// current content size, and to give the user a real preset with a different
// script-count/shape to test the scav-spawn bug against.
const fs = require('fs');
const path = require('path');

const SRC = path.join(__dirname, '..', 'custom_buildings.lua');
const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'tetris scav mode';
const NEW_PRESET = 'mark magic test';
const SLOTS = ['tweakdefs4', 'tweakdefs5', 'tweakdefs6', 'tweakdefs7', 'tweakdefs8'];

function encodeForModoption(text) {
	return Buffer.from(text, 'utf8').toString('base64')
		.replace(/\+/g, '-')
		.replace(/\//g, '_')
		.replace(/=+$/, '');
}

const text = fs.readFileSync(SRC, 'utf8');
const lines = text.split('\n');
const markerIdx = [];
lines.forEach((l, i) => { if (/^-{20,}$/.test(l.trim())) markerIdx.push(i); });
const starts = markerIdx.filter(i => lines[i + 1] && lines[i + 1].trim().startsWith('--'));
const header = lines.slice(0, starts[0]).join('\n');
const sectionBounds = [...starts, lines.length];
const sections = [];
for (let k = 0; k < sectionBounds.length - 1; k++) {
	sections.push(lines.slice(sectionBounds[k], sectionBounds[k + 1]).join('\n'));
}

// Manually curated thematic groups (contiguous, order preserved -- later
// sections like "wire everything into commanders" reference ids defined in
// earlier sections, so cross-slot execution order still has to hold):
//   Slot1: Mobile Units + Depawner + Rapid Fire + Hyper Reactor + Bulwark
//   Slot2: High Power Laser + Armored Tower + Interceptors
//   Slot3: Barrier + Support Relay + Bio Reactor + Scav Recycler
//   Slot4: Wire-into-commanders + Pocket AFUS removal/con-wiring + printer note
//   Slot5: Commander Progression Chain + Startup confirmation
const GROUPS = [
	[0, 1, 2, 3, 4],
	[5, 6, 7],
	[8, 9, 10, 11],
	[12, 13, 14],
	[15, 16],
];

const RAW_CHAR_CEILING = 11400;
const bins = GROUPS.map(idxs => idxs.map(i => sections[i]));
const chunkTexts = bins.map((sectionsInBin, i) => {
	const body = header + '\n' + sectionsInBin.join('\n');
	console.log(`slot${i + 1} (${SLOTS[i]}): ${body.length} chars (${sectionsInBin.length} sections)${body.length > RAW_CHAR_CEILING ? '  ⚠ OVER CEILING' : ''}`);
	if (body.length > RAW_CHAR_CEILING) throw new Error(`slot${i + 1} exceeds ceiling, aborting before writing anything.`);
	return body;
});

if (process.argv.includes('--dry-run')) {
	console.log('Dry run only, nothing written.');
	process.exit(0);
}

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
if (!presets[SOURCE_PRESET]) throw new Error(`Source preset "${SOURCE_PRESET}" not found.`);

const BACKUP_DIR = path.join(__dirname, '..', 'preset-backups');
if (!fs.existsSync(BACKUP_DIR)) fs.mkdirSync(BACKUP_DIR);
const stamp = new Date().toISOString().replace(/[:.]/g, '-');
fs.copyFileSync(PRESETS_PATH, path.join(BACKUP_DIR, `optionsPresets-${stamp}.json`));
const backups = fs.readdirSync(BACKUP_DIR).filter(f => f.startsWith('optionsPresets-')).sort();
for (const old of backups.slice(0, -5)) fs.unlinkSync(path.join(BACKUP_DIR, old));
console.log(`Backed up live presets file to preset-backups/optionsPresets-${stamp}.json`);

const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));
for (let i = 0; i < chunkTexts.length; i++) {
	cloned.Modoptions[SLOTS[i]] = encodeForModoption(chunkTexts[i]);
}
presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}" across ${chunkTexts.length} slots: ${SLOTS.slice(0, chunkTexts.length).join(', ')}`);

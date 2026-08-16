// One-off: builds "mark magic test" using the EXACT SAME slot numbers Tetris
// stable itself uses (tweakdefs1, tweakdefs2, tweakdefs3, tweakdefs9,
// tweakunits1), overwriting that base content with our own -- to test
// whether slot NUMBER (not just count) is what matters for the scav-spawn
// bug. This intentionally drops Tetris stable's own base content (the
// evo-economy system, Waffles_II's tweaks, the cross-faction tax) from the
// resulting preset, per explicit user confirmation.
const fs = require('fs');
const path = require('path');

const SRC = path.join(__dirname, '..', 'custom_buildings.lua');
const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'tetris scav mode';
const NEW_PRESET = 'mark magic test';
const SLOTS = ['tweakdefs1', 'tweakdefs2', 'tweakdefs3', 'tweakdefs9', 'tweakunits1'];

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

// Order preserved within/across groups: group3 (Bio Reactor/Scav Recycler)
// must execute before group4 (con-tier wiring checks their existence).
// Group5 (Commander Chain) has no existence dependency on anything else --
// addBuildOption() only requires the COMMANDER id to already exist (which
// real commanders always do), it never checks the target building id, so
// it's safe to run from tweakunits1 regardless of tweakunits/tweakdefs
// relative execution order.
const GROUPS = [
	[0, 1, 2, 3, 4],       // -> tweakdefs1
	[5, 6, 7],             // -> tweakdefs2
	[8, 9, 10, 11],        // -> tweakdefs3
	[12, 13, 14],          // -> tweakdefs9
	[15, 16],              // -> tweakunits1
];

const RAW_CHAR_CEILING = 11400;
const bins = GROUPS.map(idxs => idxs.map(i => sections[i]));
const chunkTexts = bins.map((sectionsInBin, i) => {
	const body = header + '\n' + sectionsInBin.join('\n');
	console.log(`${SLOTS[i]}: ${body.length} chars (${sectionsInBin.length} sections)${body.length > RAW_CHAR_CEILING ? '  ⚠ OVER CEILING' : ''}`);
	if (body.length > RAW_CHAR_CEILING) throw new Error(`${SLOTS[i]} exceeds ceiling, aborting before writing anything.`);
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

// Build from SOURCE_PRESET fresh so any non-tweak modoptions (maxunits,
// ruins, etc.) still match the original -- only these 5 slots get replaced.
const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));
for (let i = 0; i < chunkTexts.length; i++) {
	cloned.Modoptions[SLOTS[i]] = encodeForModoption(chunkTexts[i]);
}
// Explicitly clear the other custom slots (4-8) in case they're non-empty
// from a prior run of this same preset name.
for (const s of ['tweakdefs4', 'tweakdefs5', 'tweakdefs6', 'tweakdefs7', 'tweakdefs8']) {
	cloned.Modoptions[s] = '';
}
presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}" across ${chunkTexts.length} slots: ${SLOTS.join(', ')}`);
console.log('This overwrites the base Tetris content in those slots -- no evo-economy system, no Waffles_II tweaks, no cross-faction tax in this build.');

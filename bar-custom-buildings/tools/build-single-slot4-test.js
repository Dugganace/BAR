// One-off: takes the currently-working "mark magic test" (custom content in
// tweakdefs1,2,3,9,tweakunits1 -- confirmed scavs/ruins work) and adds ONE
// small extra chunk into tweakdefs4 alone, to isolate whether using
// tweakdefs4-8 AT ALL (regardless of count) is what breaks scav spawning.
// Writes to a NEW preset name so the confirmed-working "mark magic test"
// isn't touched.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'mark magic test';
const NEW_PRESET = 'mark magic test slot4';

function encodeForModoption(text) {
	return Buffer.from(text, 'utf8').toString('base64')
		.replace(/\+/g, '-')
		.replace(/\//g, '_')
		.replace(/=+$/, '');
}

const SRC = path.join(__dirname, '..', 'custom_buildings.lua');
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

// Small, self-contained, no dependency on anything else: Hyper Reactor (index 3).
const testChunk = header + '\n' + sections[3];
console.log(`tweakdefs4 payload: ${testChunk.length} chars`);

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
cloned.Modoptions.tweakdefs4 = encodeForModoption(testChunk);
presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}": clone of "${SOURCE_PRESET}" (tweakdefs1,2,3,9,tweakunits1 unchanged) + Hyper Reactor added into tweakdefs4.`);

// One-off: clone of the confirmed-working "mark magic test 2slot" (Hyper
// Reactor in tweakdefs4, Support Relay in tweakdefs5, both confirmed fine
// live) with a THIRD chunk added into tweakdefs6, to narrow the slot-count
// threshold that breaks scav spawning.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'mark magic test 2slot';
const NEW_PRESET = 'mark magic test 3slot';

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

// Section 0: Mobile Units (The Bull/Dozer/Beamer) -- standalone, no
// dependency on anything else already in the build.
const chunk6 = header + '\n' + sections[0];
console.log(`tweakdefs6 payload: ${chunk6.length} chars (Mobile Units)`);

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
cloned.Modoptions.tweakdefs6 = encodeForModoption(chunk6);
presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}": clone of "${SOURCE_PRESET}" + Mobile Units in tweakdefs6.`);

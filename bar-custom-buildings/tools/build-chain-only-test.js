// One-off: clone of the confirmed-working "mark magic test" (custom content
// in tweakdefs1,2,3,9,tweakunits1) with ONLY the Commander Progression
// Chain added into tweakdefs4 -- isolating whether that specific section
// (the most complex thing we've built: 10-rank clone chain, evoStats,
// tierUnlocks, buildRankChain) is what breaks scav spawning, independent of
// slot count (single-slot-with-Hyper-Reactor already confirmed fine).
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'mark magic test';
const NEW_PRESET = 'mark magic test chain';

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

// Section 15: Commander Progression Chain. Self-contained -- only clones
// real base commander ids (armcom/corcom/legcom + evocom levels), doesn't
// reference any of our other custom sections.
const testChunk = header + '\n' + sections[15];
console.log(`tweakdefs4 payload: ${testChunk.length} chars (Commander Progression Chain only)`);

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
console.log(`\nWrote preset "${NEW_PRESET}": clone of "${SOURCE_PRESET}" + Commander Progression Chain alone in tweakdefs4.`);

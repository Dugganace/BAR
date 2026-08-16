// One-off: tests whether tweakunits slots (beyond tweakunits1, which the
// base preset already occupies) actually execute custom Lua correctly now
// that the game has been patched (2026.08.15-2, PR #8759 "expose BAR to the
// def-file sandbox"). Earlier this session, our Commander Progression Chain
// silently failed to apply when placed in tweakunits1 -- possibly the same
// underlying sandbox bug that broke scav spawning, now fixed. Clone of
// "mark magic 19" (confirmed working, full content) with one small extra
// section (Support Relay) added into the previously-empty tweakunits2.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'mark magic 19';
const NEW_PRESET = 'mark magic tweakunits2 test';

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

// Section 9: Support Relay -- small, simple, already known-good elsewhere.
// Renamed unitname suffix isn't needed since it clones a fresh id
// (armsupportrelay2 etc. would collide with the real one already in
// tweakdefs -- so instead reuse a different simple standalone one: section 8, Barrier).
const testChunk = header + '\n' + sections[8];
console.log(`tweakunits2 payload: ${testChunk.length} chars (Barrier)`);

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
if (!presets[SOURCE_PRESET]) throw new Error(`Source preset "${SOURCE_PRESET}" not found.`);
if (presets[SOURCE_PRESET].Modoptions.tweakunits2 && presets[SOURCE_PRESET].Modoptions.tweakunits2 !== '') {
	throw new Error('tweakunits2 is not empty in the source preset -- refusing to overwrite.');
}

const BACKUP_DIR = path.join(__dirname, '..', 'preset-backups');
if (!fs.existsSync(BACKUP_DIR)) fs.mkdirSync(BACKUP_DIR);
const stamp = new Date().toISOString().replace(/[:.]/g, '-');
fs.copyFileSync(PRESETS_PATH, path.join(BACKUP_DIR, `optionsPresets-${stamp}.json`));
const backups = fs.readdirSync(BACKUP_DIR).filter(f => f.startsWith('optionsPresets-')).sort();
for (const old of backups.slice(0, -5)) fs.unlinkSync(path.join(BACKUP_DIR, old));
console.log(`Backed up live presets file to preset-backups/optionsPresets-${stamp}.json`);

const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));
cloned.Modoptions.tweakunits2 = encodeForModoption(testChunk);
presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}": clone of "${SOURCE_PRESET}" + Barrier added into tweakunits2.`);
console.log('If this works in-game (Barrier buildable), tweakunits slots beyond 1 are usable for expansion.');

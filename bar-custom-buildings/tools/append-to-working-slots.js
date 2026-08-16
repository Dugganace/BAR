// Slots 4-8 have proven completely non-functional in this game session
// (confirmed via repeated live testing: rejected on manual edit, silently
// empty on preset load, regardless of ranked_game). Only tweakdefs1/2/3/9
// actually work. This script appends our content directly onto the END of
// those four already-working slots (as additional top-level Lua statements
// in the same script/chunk -- fully valid, since each part*.lua is already
// self-contained with its own local declarations) instead of using 4-8.
const fs = require('fs');
const path = require('path');

const PARTS_DIR = path.join(__dirname, '..', 'parts');
const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'mark magic unranked test'; // ranked_game = 0, has the real original 1/2/3/9 content
const NEW_PRESET = 'mark magic 4';

// Balanced distribution across the 4 working slots (existing content + appended part)
const plan = {
	tweakdefs2: ['part1.lua', 'part2.lua'], // 929 existing, most headroom
	tweakdefs9: ['part3.lua'],
	tweakdefs1: ['part4.lua'],
	tweakdefs3: ['part5.lua'],
};

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
if (!presets[SOURCE_PRESET]) throw new Error(`Source preset "${SOURCE_PRESET}" not found.`);

const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));

for (const [slot, parts] of Object.entries(plan)) {
	const existingB64 = cloned.Modoptions[slot] || '';
	const existingText = existingB64 ? Buffer.from(existingB64, 'base64').toString('utf8') : '';
	let appended = existingText;
	for (const partFile of parts) {
		const partText = fs.readFileSync(path.join(PARTS_DIR, partFile), 'utf8');
		appended += '\n\n' + partText;
	}
	cloned.Modoptions[slot] = Buffer.from(appended, 'utf8').toString('base64');
	console.log(`${slot}: ${existingText.length} existing + ${parts.join('+')} -> ${appended.length} chars total`);
}

presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}" (ranked_game=${cloned.Modoptions.ranked_game}), using only tweakdefs1/2/3/9.`);

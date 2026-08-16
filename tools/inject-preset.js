// Clones an existing BAR preset from the live optionsPresets.json into a new
// preset with our custom_buildings.lua tweak added to a free tweakdefs slot,
// and writes the file back. Never mutates the source preset in place.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:\\Program Files\\Beyond-All-Reason\\data\\optionsPresets.json';
const SOURCE_PRESET = 'tetris scav mode';
const NEW_PRESET = 'mark magic 1';
const TWEAK_SLOT = 'tweakdefs4'; // confirmed empty in the source preset
const LUA_PATH = path.join(__dirname, '..', 'custom_buildings.lua');

const raw = fs.readFileSync(PRESETS_PATH, 'utf8');
const presets = JSON.parse(raw);

if (!presets[SOURCE_PRESET]) {
	throw new Error(`Source preset "${SOURCE_PRESET}" not found.`);
}
if (presets[SOURCE_PRESET].Modoptions[TWEAK_SLOT] && presets[SOURCE_PRESET].Modoptions[TWEAK_SLOT] !== '') {
	throw new Error(`Slot ${TWEAK_SLOT} is not empty in the source preset — refusing to overwrite.`);
}

const luaSource = fs.readFileSync(LUA_PATH, 'utf8');
const b64 = Buffer.from(luaSource, 'utf8').toString('base64');

const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));
cloned.Modoptions[TWEAK_SLOT] = b64;

presets[NEW_PRESET] = cloned;

fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`Wrote preset "${NEW_PRESET}" (cloned from "${SOURCE_PRESET}") with ${TWEAK_SLOT} = ${b64.length} base64 chars.`);
console.log(`Lua source size: ${luaSource.length} chars.`);

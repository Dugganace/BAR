// Bundles the decoded preset-catalog/*.lua files + metadata into a single
// data.js the browser UI can load directly via file:// (no server, no
// fetch() calls needed) -- same pattern as bar-scav-spawn-editor.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const CATALOG_DIR = path.join(__dirname, '..', 'preset-catalog');
const OUT_PATH = path.join(__dirname, '..', 'catalog-viewer', 'data.js');

const SLOT_KEYS = ['tweakdefs', 'tweakunits',
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakdefs' + i),
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakunits' + i)];

function decode(value) {
	if (!value) return null;
	const attempts = [value, value.replace(/-/g, '+').replace(/_/g, '/')];
	for (const attempt of attempts) {
		try {
			const padded = attempt + '='.repeat((4 - attempt.length % 4) % 4);
			const text = Buffer.from(padded, 'base64').toString('utf8');
			const printableRatio = [...text].filter(c => c.charCodeAt(0) >= 9 && c.charCodeAt(0) < 127).length / Math.max(1, text.length);
			if (printableRatio > 0.9) return text;
		} catch (e) { /* try next */ }
	}
	return null;
}

function extractSummary(text) {
	const lines = text.split('\n');
	const headerComments = [];
	for (const line of lines.slice(0, 6)) {
		if (line.trim().startsWith('--')) headerComments.push(line.trim());
		else if (headerComments.length) break;
	}
	const unitIds = new Set();
	let m;
	const re1 = /unitDefs\.(\w+)\s*=/g;
	while ((m = re1.exec(text))) unitIds.add(m[1]);
	const re2 = /unitDefs\[['"](\w+)['"]\]\s*=/g;
	while ((m = re2.exec(text))) unitIds.add(m[1]);
	return { header: headerComments.join(' / '), unitIds: [...unitIds] };
}

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
const catalog = {}; // { presetName: { map, slots: { slotKey: { length, header, unitIds, text } } } }

for (const presetName of Object.keys(presets)) {
	const mod = presets[presetName].Modoptions || {};
	const slots = {};
	for (const slot of SLOT_KEYS) {
		const raw = mod[slot];
		if (!raw || raw.length === 0) continue;
		const decoded = decode(raw);
		if (!decoded) continue;
		const { header, unitIds } = extractSummary(decoded);
		slots[slot] = { length: decoded.length, header, unitIds, text: decoded };
	}
	if (Object.keys(slots).length > 0) {
		catalog[presetName] = { map: presets[presetName].Map || '', slots };
	}
}

if (!fs.existsSync(path.dirname(OUT_PATH))) fs.mkdirSync(path.dirname(OUT_PATH), { recursive: true });
fs.writeFileSync(OUT_PATH, `window.CATALOG = ${JSON.stringify(catalog)};\n`, 'utf8');
console.log(`Wrote ${OUT_PATH} with ${Object.keys(catalog).length} presets.`);

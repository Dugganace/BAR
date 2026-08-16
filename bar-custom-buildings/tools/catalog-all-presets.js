// Decodes every tweakdefs/tweakunits slot (numbered 1-9 plus the base
// unnumbered ones) across EVERY preset in the live optionsPresets.json,
// auto-detecting standard vs URL-safe base64, and extracts a readable
// summary of what each one actually contains: unitDefs.X assignments
// (new units/buildings it defines), and any leading comment header.
// Writes one .lua file per populated slot (for full reading later) plus
// a single catalog.md index summarizing everything at a glance.
const fs = require('fs');
const path = require('path');

const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const OUT_DIR = path.join(__dirname, '..', 'preset-catalog');
const SLOT_KEYS = ['tweakdefs', 'tweakunits',
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakdefs' + i),
	...[1,2,3,4,5,6,7,8,9].map(i => 'tweakunits' + i)];

function decode(value) {
	if (!value) return null;
	// Try URL-safe unpadded first, fall back to standard.
	const attempts = [
		value, // as-is (in case it's already standard with padding)
		value.replace(/-/g, '+').replace(/_/g, '/'), // url-safe -> standard, no padding fix
	];
	for (const attempt of attempts) {
		try {
			const padded = attempt + '='.repeat((4 - attempt.length % 4) % 4);
			const buf = Buffer.from(padded, 'base64');
			const text = buf.toString('utf8');
			// Sanity check: decoded text should be mostly printable.
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
	// Find unitDefs.X = or unitDefs['X'] = or unitDefs["X"] = assignments (new/overridden unit ids)
	const unitIds = new Set();
	const re1 = /unitDefs\.(\w+)\s*=/g;
	const re2 = /unitDefs\[['"](\w+)['"]\]\s*=/g;
	let m;
	while ((m = re1.exec(text))) unitIds.add(m[1]);
	while ((m = re2.exec(text))) unitIds.add(m[1]);
	return { headerComments, unitIds: [...unitIds] };
}

if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR);

const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
const catalogLines = ['# Preset Tweak Catalog', '', `Generated from ${Object.keys(presets).length} presets in optionsPresets.json.`, ''];

for (const presetName of Object.keys(presets)) {
	const mod = presets[presetName].Modoptions || {};
	const populatedSlots = SLOT_KEYS.filter(k => mod[k] && mod[k].length > 0);
	if (populatedSlots.length === 0) continue;

	const safeName = presetName.replace(/[^a-z0-9]+/gi, '_').toLowerCase();
	catalogLines.push(`## ${presetName}`);
	catalogLines.push(`Map: ${presets[presetName].Map || '(unknown)'}`);
	catalogLines.push('');

	for (const slot of populatedSlots) {
		const decoded = decode(mod[slot]);
		if (!decoded) {
			catalogLines.push(`- **${slot}**: (failed to decode, ${mod[slot].length} chars)`);
			continue;
		}
		const outFile = `${safeName}__${slot}.lua`;
		fs.writeFileSync(path.join(OUT_DIR, outFile), decoded, 'utf8');
		const { headerComments, unitIds } = extractSummary(decoded);
		catalogLines.push(`- **${slot}** (${decoded.length} chars) -> \`${outFile}\``);
		if (headerComments.length) {
			catalogLines.push('  - Header: ' + headerComments.join(' / '));
		}
		if (unitIds.length) {
			catalogLines.push(`  - Defines/overrides ${unitIds.length} unit id(s): ${unitIds.slice(0, 25).join(', ')}${unitIds.length > 25 ? ', ...' : ''}`);
		}
	}
	catalogLines.push('');
}

fs.writeFileSync(path.join(OUT_DIR, 'catalog.md'), catalogLines.join('\n'), 'utf8');
console.log(`Wrote catalog.md and ${fs.readdirSync(OUT_DIR).length - 1} decoded .lua files to ${OUT_DIR}`);

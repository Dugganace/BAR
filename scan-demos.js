// Scans every local BAR replay (.sdfz) for custom tweakdefs/tweakunits content.
// Decompresses each demo, pulls the [modoptions] block, reassembles any
// split tweakdefs*/tweakunits* slots, base64-decodes them (URL-safe/unpadded,
// same encoding proven in bar-custom-buildings), and writes out anything
// that isn't empty so we can see which of our own games used custom presets.

const fs = require('fs');
const path = require('path');
const zlib = require('zlib');

const DEMOS_DIR = 'C:/Program Files/Beyond-All-Reason/data/demos';
const OUT_DIR = path.join(__dirname, 'output');
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR);

function decodeModoption(b64) {
	if (!b64) return '';
	// reverse the URL-safe/unpadded encoding, then standard base64 decode
	let standard = b64.replace(/-/g, '+').replace(/_/g, '/');
	while (standard.length % 4 !== 0) standard += '=';
	try {
		return Buffer.from(standard, 'base64').toString('utf8');
	} catch (e) {
		return '';
	}
}

function extractSection(text, header) {
	const start = text.indexOf(header);
	if (start === -1) return null;
	const braceStart = text.indexOf('{', start);
	if (braceStart === -1) return null;
	// modoptions/player blocks are flat (no nested braces) in this format
	const braceEnd = text.indexOf('\n}', braceStart);
	if (braceEnd === -1) return null;
	return text.slice(braceStart + 1, braceEnd);
}

function parseKeyValues(block) {
	const out = {};
	const re = /^([A-Za-z0-9_]+)=(.*);$/gm;
	let m;
	while ((m = re.exec(block))) out[m[1]] = m[2];
	return out;
}

function extractPlayerNames(text) {
	const names = new Set();
	const re = /\[player\d+\]\s*\{[^}]*?name=([^;]+);/gs;
	let m;
	while ((m = re.exec(text))) names.add(m[1].trim());
	return [...names];
}

function reassembleTweakSlots(modoptions, prefix) {
	// prefix is 'tweakdefs' or 'tweakunits'. Slots: base key + key+N for N in 1..9.
	// Each slot is independently base64-encoded (split-and-package.js encodes
	// each Lua chunk separately before assigning to a slot) -- decoding must
	// happen PER SLOT, then concatenate the decoded text. Concatenating the
	// still-encoded base64 strings first and decoding once corrupts everything
	// after the first slot, since raw/unpadded base64 lengths aren't always
	// multiples of 4.
	const slots = [];
	if (modoptions[prefix]) slots.push(modoptions[prefix]);
	for (let n = 1; n <= 9; n++) {
		const key = prefix + n;
		if (modoptions[key]) slots.push(modoptions[key]);
	}
	return slots.map(decodeModoption).join('');
}

function main() {
	const files = fs.readdirSync(DEMOS_DIR).filter(f => f.toLowerCase().endsWith('.sdfz'));
	console.log(`Found ${files.length} replay files.`);

	const results = [];
	let processed = 0, withCustom = 0, failed = 0;

	for (const file of files) {
		processed++;
		const full = path.join(DEMOS_DIR, file);
		try {
			const raw = fs.readFileSync(full);
			const dec = zlib.gunzipSync(raw);
			const text = dec.toString('latin1');

			const modBlock = extractSection(text, '[modoptions]');
			if (!modBlock) continue;
			const modoptions = parseKeyValues(modBlock);

			const tweakDefsLua = reassembleTweakSlots(modoptions, 'tweakdefs');
			const tweakUnitsLua = reassembleTweakSlots(modoptions, 'tweakunits');

			if (!tweakDefsLua && !tweakUnitsLua) continue; // vanilla game, skip

			withCustom++;
			const players = extractPlayerNames(text);

			const entry = {
				file,
				players,
				tweakDefsLength: tweakDefsLua.length,
				tweakUnitsLength: tweakUnitsLua.length,
			};
			results.push(entry);

			const base = file.replace(/\.sdfz$/i, '');
			if (tweakDefsLua) fs.writeFileSync(path.join(OUT_DIR, base + '.tweakdefs.lua'), tweakDefsLua);
			if (tweakUnitsLua) fs.writeFileSync(path.join(OUT_DIR, base + '.tweakunits.lua'), tweakUnitsLua);
		} catch (e) {
			failed++;
		}
	}

	fs.writeFileSync(path.join(OUT_DIR, 'index.json'), JSON.stringify(results, null, 2));
	console.log(`Processed ${processed}, custom content found in ${withCustom}, failed ${failed}.`);
	console.log(`Output in ${OUT_DIR}`);
}

main();

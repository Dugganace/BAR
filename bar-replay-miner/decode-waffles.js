const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const raw = JSON.parse(fs.readFileSync(path.join(__dirname, 'waffles-data', 'all-batches.json'), 'utf8'));
const OUT_DIR = path.join(__dirname, 'waffles-data');

function decodeModoption(b64) {
	if (!b64) return '';
	let standard = b64.replace(/-/g, '+').replace(/_/g, '/');
	while (standard.length % 4 !== 0) standard += '=';
	try {
		return Buffer.from(standard, 'base64').toString('utf8');
	} catch (e) {
		return '';
	}
}

function reassemble(tweaks, prefix) {
	// Each slot is independently base64-encoded -- decode PER SLOT then join
	// the decoded text, not join-then-decode (corrupts everything past slot 1).
	const slots = [];
	if (tweaks[prefix]) slots.push(tweaks[prefix]);
	for (let n = 1; n <= 9; n++) {
		if (tweaks[prefix + n]) slots.push(tweaks[prefix + n]);
	}
	return slots.map(decodeModoption).join('');
}

const results = [];
for (const entry of raw) {
	const defsLua = reassemble(entry.tweaks, 'tweakdefs');
	const unitsLua = reassemble(entry.tweaks, 'tweakunits');
	if (!defsLua && !unitsLua) continue;
	const hash = crypto.createHash('sha1').update(defsLua + ' ' + unitsLua).digest('hex').slice(0, 12);
	results.push({ id: entry.id, fileName: entry.fileName, startTime: entry.startTime, hash, defsLua, unitsLua });
}

const groups = new Map();
for (const r of results) {
	if (!groups.has(r.hash)) groups.set(r.hash, []);
	groups.get(r.hash).push(r);
}

console.log(`${raw.length} games checked; ${results.length} had non-empty tweakdefs/tweakunits; ${groups.size} distinct content sets.\n`);

for (const [hash, entries] of [...groups.entries()].sort((a, b) => b[1].length - a[1].length)) {
	const first = entries[entries.length - 1];
	console.log(`[${hash}] played ${entries.length}x, earliest ${first.startTime}, size ${first.defsLua.length + first.unitsLua.length} chars — ${first.fileName}`);
	fs.writeFileSync(path.join(OUT_DIR, `${hash}.tweakdefs.lua`), first.defsLua);
	fs.writeFileSync(path.join(OUT_DIR, `${hash}.tweakunits.lua`), first.unitsLua);
}

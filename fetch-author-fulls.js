const fs = require('fs');
const path = require('path');

const picks = JSON.parse(fs.readFileSync('author-picks.json', 'utf8'));
const OUT_DIR = path.join(__dirname, 'global-credits-full');
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR);

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

function reassemble(gs, prefix) {
	const slots = [];
	if (gs[prefix]) slots.push(gs[prefix]);
	for (let n = 1; n <= 9; n++) {
		if (gs[prefix + n]) slots.push(gs[prefix + n]);
	}
	return slots.map(decodeModoption).join('');
}

async function main() {
	for (const [author, info] of Object.entries(picks)) {
		try {
			const r = await fetch('https://api.bar-rts.com/replays/' + info.sourceId);
			const j = await r.json();
			const gs = j.gameSettings || {};
			const defsLua = reassemble(gs, 'tweakdefs');
			const unitsLua = reassemble(gs, 'tweakunits');
			fs.writeFileSync(path.join(OUT_DIR, author + '.tweakdefs.lua'), defsLua);
			fs.writeFileSync(path.join(OUT_DIR, author + '.tweakunits.lua'), unitsLua);
			console.log(`${author}: defs ${defsLua.length} chars, units ${unitsLua.length} chars`);
		} catch (e) {
			console.log(`${author}: FAILED - ${e.message}`);
		}
	}
}

main();

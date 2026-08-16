// Finds who actually HOSTED each of your custom-content replays (not just
// who played in them), then ranks hosts by how many distinct preset
// content-sets they personally hosted -- this is the real signature of
// "someone with a library of custom presets," since a spectator/teammate
// riding along on YOUR preset doesn't show up here, only people who set
// up their own room with their own content.
const fs = require('fs');
const path = require('path');
const zlib = require('zlib');
const crypto = require('crypto');

const DEMOS_DIR = 'C:/Program Files/Beyond-All-Reason/data/demos';
const OUT_DIR = path.join(__dirname, 'output');
const index = JSON.parse(fs.readFileSync(path.join(OUT_DIR, 'index.json')));

const ME = 'Darth_raider';
const hostPresets = new Map(); // hostname -> Set(hash)
const hostGameCount = new Map(); // hostname -> count of games

for (const g of index) {
	const full = path.join(DEMOS_DIR, g.file);
	let text;
	try {
		text = zlib.gunzipSync(fs.readFileSync(full)).toString('latin1');
	} catch (e) { continue; }

	const hostMatch = text.match(/hostname=([^;]*);/);
	const hostTypeMatch = text.match(/hosttype=([^;]*);/);
	if (!hostMatch) continue;
	let host = hostMatch[1].trim();
	// SPADS/autohost-bot names aren't a person -- skip those, not useful for "who has a library"
	if (!host || /^Host\[/i.test(host) || (hostTypeMatch && hostTypeMatch[1] !== 'SinglePlayer' && /spads/i.test(hostTypeMatch[1]))) continue;

	const base = g.file.replace(/\.sdfz$/i, '');
	const defsPath = path.join(OUT_DIR, base + '.tweakdefs.lua');
	const unitsPath = path.join(OUT_DIR, base + '.tweakunits.lua');
	const defs = fs.existsSync(defsPath) ? fs.readFileSync(defsPath, 'utf8') : '';
	const units = fs.existsSync(unitsPath) ? fs.readFileSync(unitsPath, 'utf8') : '';
	const hash = crypto.createHash('sha1').update(defs + ' ' + units).digest('hex').slice(0, 12);

	if (!hostPresets.has(host)) hostPresets.set(host, new Set());
	hostPresets.get(host).add(hash);
	hostGameCount.set(host, (hostGameCount.get(host) || 0) + 1);
}

const ranked = [...hostPresets.entries()]
	.map(([host, set]) => ({ host, distinctPresets: set.size, games: hostGameCount.get(host) }))
	.sort((a, b) => b.distinctPresets - a.distinctPresets);

console.log(`${ranked.length} distinct hosts found across your custom-content replays.\n`);
console.log('Top hosts by variety of distinct presets they personally hosted:\n');
for (const r of ranked.slice(0, 40)) {
	console.log(`${r.distinctPresets} distinct presets, ${r.games} games hosted — ${r.host}`);
}

fs.writeFileSync(path.join(__dirname, 'hosts-ranked.json'), JSON.stringify(ranked, null, 2));

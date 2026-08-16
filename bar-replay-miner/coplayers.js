// Ranks co-players by how many DISTINCT custom-content games they showed up
// in (using dedupe.js's game list, not raw replay count) -- avoids one
// long play session with the same 8 people dominating the ranking, and
// separates "people you've played many custom-preset games with" from
// "people who happened to be in one big group."
const fs = require('fs');
const path = require('path');

const OUT_DIR = path.join(__dirname, 'output');
const index = JSON.parse(fs.readFileSync(path.join(OUT_DIR, 'index.json')));

const ME = 'Darth_raider';
const counts = new Map(); // name -> Set of game files (so repeats within one game don't double count)

for (const g of index) {
	if (!g.players.includes(ME)) continue; // only games you were actually in
	for (const p of g.players) {
		if (p === ME) continue;
		if (!counts.has(p)) counts.set(p, new Set());
		counts.get(p).add(g.file);
	}
}

const ranked = [...counts.entries()]
	.map(([name, files]) => ({ name, games: files.size }))
	.filter(r => r.games > 1) // "more than once" per the request
	.sort((a, b) => b.games - a.games);

console.log(`${ranked.length} players you've shared a custom-preset lobby with more than once:\n`);
for (const r of ranked) console.log(`${r.games}x  ${r.name}`);

fs.writeFileSync(path.join(__dirname, 'coplayers.json'), JSON.stringify(ranked, null, 2));

// Cross-references every "by <name>" credit found by global-scan.js against
// the official BAR team roster (bar-dev-roster.json, scraped from
// beyondallreason.info/team) to flag which custom-content authors are
// actual BAR developers/contributors vs. independent community modders.
const fs = require('fs');
const path = require('path');

const state = JSON.parse(fs.readFileSync(path.join(__dirname, 'global-scan-state.json'), 'utf8'));
const roster = JSON.parse(fs.readFileSync(path.join(__dirname, 'bar-dev-roster.json'), 'utf8'));

console.log(`Scan progress: ${state.gamesChecked} games checked, ${state.gamesWithContent} with content, ${Object.keys(state.distinctHashes).length} distinct presets, ${Object.keys(state.credits).length} distinct credits.\n`);

const entries = Object.entries(state.credits).sort((a, b) => b[1].count - a[1].count);
const devMatches = [];
const unknown = [];

for (const [line, info] of entries) {
	const nameMatch = line.match(/\bby\s+([A-Za-z0-9_\[\]]+)/i);
	const name = nameMatch ? nameMatch[1] : null;
	let devHit = null;
	if (name) {
		const upper = name.toUpperCase();
		devHit = roster.find(r => r === upper || r.replace(/[\[\]_]/g, '') === upper.replace(/[\[\]_]/g, ''));
	}
	if (devHit) devMatches.push({ line, name, devHit, count: info.count, fileName: info.fileName });
	else unknown.push({ line, name, count: info.count, fileName: info.fileName });
}

console.log(`=== MATCHES AGAINST OFFICIAL BAR TEAM ROSTER (${devMatches.length}) ===`);
for (const m of devMatches) console.log(`  ${m.count}x  "${m.line}"  ->  ${m.devHit}`);

console.log(`\n=== NOT MATCHED (independent community authors, ${unknown.length}) ===`);
for (const u of unknown) console.log(`  ${u.count}x  "${u.line}"`);

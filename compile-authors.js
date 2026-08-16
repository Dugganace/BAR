// Groups global-credits/*.lua snippets by author name, ranks authors by
// total popularity (sum of their snippets' play counts), and writes one
// file per author into global-credits-by-author/ for easy review.
const fs = require('fs');
const path = require('path');

const state = JSON.parse(fs.readFileSync(path.join(__dirname, 'global-scan-state.json'), 'utf8'));
const CREDITS_DIR = path.join(__dirname, 'global-credits');
const OUT_DIR = path.join(__dirname, 'global-credits-by-author');
if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR);

const files = fs.readdirSync(CREDITS_DIR);

function extractAuthor(line) {
	// crude but works across almost all observed patterns: last "by <Name>" in the line
	const matches = [...line.matchAll(/\bby\s+([A-Za-z][A-Za-z0-9_]{1,20})/gi)];
	if (matches.length === 0) return null;
	return matches[matches.length - 1][1];
}

const byAuthor = new Map(); // authorLower -> { displayName, snippets: [{line, count, file}] }

for (const [line, info] of Object.entries(state.credits)) {
	const author = extractAuthor(line);
	if (!author) continue;
	const key = author.toLowerCase();
	if (!byAuthor.has(key)) byAuthor.set(key, { displayName: author, snippets: [] });
	// find the matching file (sanitized name prefix match)
	const sanitized = line.replace(/[^a-z0-9]/gi, '_').slice(0, 40);
	const file = files.find(f => f.includes(sanitized));
	byAuthor.get(key).snippets.push({ line, count: info.count, file });
}

const ranked = [...byAuthor.values()].sort((a, b) => {
	const sumA = a.snippets.reduce((s, x) => s + x.count, 0);
	const sumB = b.snippets.reduce((s, x) => s + x.count, 0);
	return sumB - sumA;
});

console.log(`${ranked.length} distinct authors identified.\n`);
for (const author of ranked) {
	const total = author.snippets.reduce((s, x) => s + x.count, 0);
	console.log(`${author.displayName}: ${author.snippets.length} snippet(s), ${total} total occurrences`);

	let out = `-- ${author.displayName} -- content pulled from public BAR replays (bar-replay-miner global scan, 2026-08-15)\n`;
	out += `-- ${author.snippets.length} distinct snippet(s), ${total} total occurrences across scanned games\n\n`;
	for (const s of author.snippets) {
		out += `-- === "${s.line}" (seen ${s.count}x) ===\n`;
		if (s.file) {
			try {
				out += fs.readFileSync(path.join(CREDITS_DIR, s.file), 'utf8').trim() + '\n\n';
			} catch (e) {
				out += '-- (source file not found)\n\n';
			}
		} else {
			out += '-- (source file not found)\n\n';
		}
	}
	const safeFileName = author.displayName.replace(/[^a-z0-9]/gi, '_') + '.lua';
	fs.writeFileSync(path.join(OUT_DIR, safeFileName), out);
}

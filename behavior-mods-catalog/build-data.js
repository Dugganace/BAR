// Parses bar-replay-miner/global-credits-by-author/*.lua into a browsable
// catalog. This is a DIFFERENT content type from the Custom Content
// Database: these authors' packages (Bezz's T3 Commander overhaul
// especially) modify EXISTING units' behavior/buildoptions in place rather
// than creating new unit ids, so they don't fit an "id database" -- but
// the per-author files are already self-documenting (real credit-comment
// titles + occurrence counts from the 200k-replay scan), just not
// browsable as raw .lua. Doesn't adopt or change anything -- browse only.
const fs = require('fs');
const path = require('path');

const SRC_DIR = path.join(__dirname, '..', '..', 'bar-replay-miner', 'global-credits-by-author');
const OUT_FILE = path.join(__dirname, 'data.js');

const HEADER_RE = /^-- (.+?) -- content pulled from public BAR replays.*\n-- (\d+) distinct snippet\(s\), (\d+) total occurrences across scanned games/;
const SNIPPET_START_RE = /^-- === "(.*?)" \(seen (\d+)x\) ===$/gm;

const authors = [];
for (const file of fs.readdirSync(SRC_DIR).filter(f => f.endsWith('.lua'))) {
	const text = fs.readFileSync(path.join(SRC_DIR, file), 'utf8');
	const headerMatch = text.match(HEADER_RE);
	if (!headerMatch) {
		console.warn(`⚠ ${file} doesn't match the expected header format, skipping.`);
		continue;
	}
	const [, authorName, snippetCount, totalOccurrences] = headerMatch;

	const starts = [...text.matchAll(SNIPPET_START_RE)];
	const snippets = starts.map((m, i) => {
		const codeStart = m.index + m[0].length;
		const codeEnd = i + 1 < starts.length ? starts[i + 1].index : text.length;
		return {
			title: m[1],
			occurrences: parseInt(m[2], 10),
			code: text.slice(codeStart, codeEnd).trim(),
		};
	});
	snippets.sort((a, b) => b.occurrences - a.occurrences);

	authors.push({
		author: authorName,
		snippetCount: parseInt(snippetCount, 10),
		totalOccurrences: parseInt(totalOccurrences, 10),
		snippets,
	});
}

authors.sort((a, b) => b.totalOccurrences - a.totalOccurrences);

fs.writeFileSync(OUT_FILE, `window.BEHAVIOR_MODS = ${JSON.stringify(authors, null, 2)};\n`, 'utf8');
console.log(`Wrote ${authors.length} authors, ${authors.reduce((s, a) => s + a.snippets.length, 0)} total snippets, to ${OUT_FILE}`);
authors.forEach(a => console.log(`  ${a.author}: ${a.snippets.length} snippets, ${a.totalOccurrences} occurrences`));

const fs = require('fs');
const s = JSON.parse(fs.readFileSync('global-scan-state.json', 'utf8'));
const authors = ['Bezz', 'LoH', 'Ambo', 'CrossGamer', 'MGGW', 'FiendishDevil', 'Mewi', 'LordOfHangovers', 'Djarshi', 'RandomGuyJunior', 'onetrick', 'Luigi'];
const picks = {};
for (const [line, info] of Object.entries(s.credits)) {
	for (const a of authors) {
		const re = new RegExp('\\bby\\s+' + a + '\\b', 'i');
		if (re.test(line)) {
			if (!picks[a] || info.count > picks[a].count) {
				picks[a] = { line, count: info.count, sourceId: info.sourceId, fileName: info.fileName };
			}
		}
	}
}
console.log(JSON.stringify(picks, null, 1));
fs.writeFileSync('author-picks.json', JSON.stringify(picks));

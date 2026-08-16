const fs = require('fs');
const file = process.argv[2];
const t = fs.readFileSync(file, 'utf8');
let pdepth = 0, bdepth = 0, line = 1;
let i = 0;
const n = t.length;
while (i < n) {
	const ch = t[i];
	if (ch === '\n') { line++; i++; continue; }
	if (ch === '-' && t[i + 1] === '-') {
		if (t[i + 2] === '[' && t[i + 3] === '[') {
			const end = t.indexOf(']]', i + 4);
			const chunk = end === -1 ? t.slice(i) : t.slice(i, end + 2);
			line += (chunk.match(/\n/g) || []).length;
			i = end === -1 ? n : end + 2;
			continue;
		}
		const nl = t.indexOf('\n', i);
		i = nl === -1 ? n : nl;
		continue;
	}
	if (ch === "'" || ch === '"') {
		const quote = ch;
		let j = i + 1;
		while (j < n && t[j] !== quote) {
			if (t[j] === '\\') j++;
			if (t[j] === '\n') line++;
			j++;
		}
		i = j + 1;
		continue;
	}
	if (ch === '[' && t[i + 1] === '[') {
		const end = t.indexOf(']]', i + 2);
		const chunk = end === -1 ? t.slice(i) : t.slice(i, end + 2);
		line += (chunk.match(/\n/g) || []).length;
		i = end === -1 ? n : end + 2;
		continue;
	}
	if (ch === '(') { pdepth++; }
	else if (ch === ')') { pdepth--; if (pdepth < 0) console.log('paren NEGATIVE at line', line); }
	else if (ch === '{') { bdepth++; }
	else if (ch === '}') { bdepth--; if (bdepth < 0) console.log('brace NEGATIVE at line', line); }
	i++;
}
console.log('Final paren depth:', pdepth, '| Final brace depth:', bdepth, '(both should be 0) | total lines:', line);

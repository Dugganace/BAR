// Extracts the LandUnitsList / SeaUnitsList / AirUnitsList tables out of the
// real scav_spawn_defs.lua losslessly (by brace-matching, comment-aware),
// parses their unit=weight entries into JSON, and writes data.js so the
// static editor (index.html) can load everything without a server / fetch().
//
// Re-run with: node tools/build-data.js
const fs = require('fs');
const path = require('path');

const SRC = path.join(__dirname, '..', 'reference', 'scav_spawn_defs.lua');
const OUT = path.join(__dirname, '..', 'data.js');

const text = fs.readFileSync(SRC, 'utf8');

// Find the character index of `local NAME = {` and the matching closing `}`,
// ignoring braces that appear after a `--` line comment.
function findBlock(varName) {
	const declRe = new RegExp(`local\\s+${varName}\\s*=\\s*\\{`);
	const m = declRe.exec(text);
	if (!m) throw new Error(`Could not find "local ${varName} = {"`);
	const openBraceIdx = m.index + m[0].length - 1; // index of the opening '{'
	let depth = 0;
	let i = openBraceIdx;
	for (; i < text.length; i++) {
		const ch = text[i];
		if (ch === '\n') continue;
		if (ch === '-' && text[i + 1] === '-') {
			// skip to end of line (line comment)
			const nl = text.indexOf('\n', i);
			i = nl === -1 ? text.length : nl;
			continue;
		}
		if (ch === '{') depth++;
		else if (ch === '}') {
			depth--;
			if (depth === 0) { i++; break; }
		}
	}
	return { start: m.index, end: i, bodyStart: openBraceIdx + 1, bodyEnd: i - 1 };
}

// Parse a block's inner text into { Role: { Tier(number): { unitId: weight } } }
function parsePools(blockText) {
	// blockText is the text between "local NAME = {" ... matching "}" (inclusive of braces)
	const roles = {};
	const roleRe = /(\w+)\s*=\s*\{/g;
	// First pass: find top-level role keys (Raid/Assault/Support/Healer) by scanning
	// at depth 1 relative to the outer block.
	let depth = 0;
	let i = 0;
	const n = blockText.length;
	function skipCommentsAndWs(j) {
		while (j < n) {
			if (blockText[j] === '-' && blockText[j + 1] === '-') {
				const nl = blockText.indexOf('\n', j);
				j = nl === -1 ? n : nl + 1;
			} else if (/\s/.test(blockText[j])) {
				j++;
			} else break;
		}
		return j;
	}

	// outer block starts with '{' at index 0
	i = 1; // skip outer '{'
	while (i < n) {
		i = skipCommentsAndWs(i);
		if (i >= n) break;
		if (blockText[i] === '}') break; // end of outer block
		const keyMatch = /^(\w+)\s*=\s*\{/.exec(blockText.slice(i));
		if (!keyMatch) { i++; continue; }
		const roleName = keyMatch[1];
		let j = i + keyMatch[0].length; // position after role's '{'
		let roleDepth = 1;
		const roleBodyStart = j;
		while (j < n && roleDepth > 0) {
			if (blockText[j] === '-' && blockText[j + 1] === '-') {
				const nl = blockText.indexOf('\n', j);
				j = nl === -1 ? n : nl;
				continue;
			}
			if (blockText[j] === '{') roleDepth++;
			else if (blockText[j] === '}') roleDepth--;
			j++;
		}
		const roleBodyEnd = j - 1; // index of role's closing '}'
		const roleBody = blockText.slice(roleBodyStart, roleBodyEnd);
		roles[roleName] = parseTiers(roleBody);
		i = j;
	}
	return roles;
}

// Parse tier sub-blocks: [1] = { unit = weight, ... }, [2] = { ... }, ...
function parseTiers(roleBody) {
	const tiers = {};
	const n = roleBody.length;
	let i = 0;
	function skipCommentsAndWs(j) {
		while (j < n) {
			if (roleBody[j] === '-' && roleBody[j + 1] === '-') {
				const nl = roleBody.indexOf('\n', j);
				j = nl === -1 ? n : nl + 1;
			} else if (/\s/.test(roleBody[j])) {
				j++;
			} else break;
		}
		return j;
	}
	while (i < n) {
		i = skipCommentsAndWs(i);
		if (i >= n) break;
		const tierMatch = /^\[(\d+)\]\s*=\s*\{/.exec(roleBody.slice(i));
		if (!tierMatch) { i++; continue; }
		const tierNum = tierMatch[1];
		let j = i + tierMatch[0].length;
		let depth = 1;
		const bodyStart = j;
		while (j < n && depth > 0) {
			if (roleBody[j] === '-' && roleBody[j + 1] === '-') {
				const nl = roleBody.indexOf('\n', j);
				j = nl === -1 ? n : nl;
				continue;
			}
			if (roleBody[j] === '{') depth++;
			else if (roleBody[j] === '}') depth--;
			j++;
		}
		const bodyEnd = j - 1;
		const body = roleBody.slice(bodyStart, bodyEnd);
		const units = {};
		const unitRe = /(\w+)\s*=\s*(\d+(?:\.\d+)?)\s*,/g;
		let um;
		while ((um = unitRe.exec(body))) {
			units[um[1]] = Number(um[2]);
		}
		tiers[tierNum] = units;
		i = j;
	}
	return tiers;
}

const domains = ['LandUnitsList', 'SeaUnitsList', 'AirUnitsList'];
const result = {};
const ranges = {};
for (const name of domains) {
	const blk = findBlock(name);
	const blockText = text.slice(blk.start + `local ${name} = `.length, blk.end);
	result[name] = parsePools(blockText);
	ranges[name] = { start: blk.start, end: blk.end };
}

// Sanity: count total unit entries found
let total = 0;
for (const dom of domains) {
	for (const role of Object.values(result[dom])) {
		for (const tier of Object.values(role)) total += Object.keys(tier).length;
	}
}
console.log(`Parsed ${total} unit entries across ${domains.length} domains.`);

const outJs = `// AUTO-GENERATED by tools/build-data.js — do not hand-edit.
// Re-run "node tools/build-data.js" after updating reference/scav_spawn_defs.lua.
window.SCAV_FULL_TEXT = ${JSON.stringify(text)};
window.SCAV_BLOCK_RANGES = ${JSON.stringify(ranges)};
window.SCAV_POOLS = ${JSON.stringify(result, null, 2)};
`;

fs.writeFileSync(OUT, outJs, 'utf8');
console.log(`Wrote ${OUT}`);

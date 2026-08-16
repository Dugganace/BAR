// Walks every real unit .lua file checked out from the game's own repo,
// parses it with luaparse (proper Lua AST, not regex-guessing), and pulls
// out a structured record per unit: id, category (from folder path), key
// stats, and cross-referenced human name/description/tooltip from the
// game's own language/en/units.json. Writes units-database.json.
const fs = require('fs');
const path = require('path');
const luaparse = require('luaparse');

const UNITS_DIR = path.join(__dirname, 'units');
const LANG_PATH = path.join(__dirname, 'language', 'en', 'units.json');

const lang = JSON.parse(fs.readFileSync(LANG_PATH, 'utf8'));
const names = (lang.units && lang.units.names) || {};
const descriptions = (lang.units && lang.units.descriptions) || {};
const tooltips = (lang.units && lang.units.tooltips) || {};

function walk(dir, out = []) {
	for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
		const full = path.join(dir, entry.name);
		if (entry.isDirectory()) walk(full, out);
		else if (entry.name.endsWith('.lua')) out.push(full);
	}
	return out;
}

// Extract simple scalar/table field values from a luaparse AST table constructor.
function astValueToJs(node) {
	if (!node) return undefined;
	switch (node.type) {
		case 'StringLiteral':
			if (node.value != null) return node.value;
			// luaparse sometimes leaves .value null; fall back to stripping quotes from .raw
			if (typeof node.raw === 'string' && node.raw.length >= 2) {
				return node.raw.slice(1, -1).replace(/\\(.)/g, '$1');
			}
			return node.raw;
		case 'NumericLiteral': return node.value;
		case 'BooleanLiteral': return node.value;
		case 'TableConstructorExpression': {
			const obj = {};
			let isArray = true;
			let idx = 1;
			for (const field of node.fields) {
				if (field.type === 'TableKeyString') {
					obj[field.key.name] = astValueToJs(field.value);
					isArray = false;
				} else if (field.type === 'TableKey') {
					const key = field.key.type === 'StringLiteral' ? field.key.value : astValueToJs(field.key);
					obj[key] = astValueToJs(field.value);
					isArray = false;
				} else if (field.type === 'TableValue') {
					obj[idx++] = astValueToJs(field.value);
				}
			}
			return obj;
		}
		default: return undefined;
	}
}

const files = walk(UNITS_DIR);
const database = {};
const parseErrors = [];

for (const file of files) {
	const relPath = path.relative(UNITS_DIR, file).replace(/\\/g, '/');
	const text = fs.readFileSync(file, 'utf8');
	let ast;
	try {
		ast = luaparse.parse(text, { luaVersion: '5.1' });
	} catch (e) {
		parseErrors.push({ file: relPath, error: e.message });
		continue;
	}
	// Expect: return { unitid = { ...fields... }, [unitid2 = {...}, ...] }
	const returnStmt = ast.body.find(s => s.type === 'ReturnStatement');
	if (!returnStmt || !returnStmt.arguments.length) continue;
	const topTable = returnStmt.arguments[0];
	if (topTable.type !== 'TableConstructorExpression') continue;

	for (const field of topTable.fields) {
		if (field.type !== 'TableKeyString' && field.type !== 'TableKey') continue;
		const unitId = field.type === 'TableKeyString' ? field.key.name : (field.key.type === 'StringLiteral' ? field.key.value : null);
		if (!unitId) continue;
		const data = astValueToJs(field.value);
		if (!data || typeof data !== 'object') continue;

		const category = relPath.split('/').slice(0, -1).join('/') || '(root)';

		// Determine faction group: prefix-based for the three playable
		// factions, folder/id-pattern based for Raptors/Scavengers/other.
		let faction = 'Other';
		if (/_scav$/.test(unitId) || /scavenger/i.test(unitId) || /scavengers\//i.test(relPath)) faction = 'Scavengers';
		else if (/^raptor/.test(unitId) || /raptors\//i.test(relPath)) faction = 'Raptors';
		else if (/^arm/.test(unitId)) faction = 'Armada';
		else if (/^cor/.test(unitId)) faction = 'Cortex';
		else if (/^leg/.test(unitId)) faction = 'Legion';
		else if (/lootbox/i.test(unitId)) faction = 'Lootboxes';

		database[unitId] = {
			id: unitId,
			file: relPath,
			category,
			faction,
			name: names[unitId] || data.name || unitId,
			description: descriptions[unitId] || null,
			tooltip: tooltips[unitId] || null,
			buildpic: data.buildpic || null,
			metalcost: data.metalcost ?? null,
			energycost: data.energycost ?? null,
			buildtime: data.buildtime ?? null,
			health: data.health ?? null,
			speed: data.speed ?? null,
			techlevel: data.customparams && data.customparams.techlevel != null ? data.customparams.techlevel : null,
			hasWeapons: !!(data.weapondefs && Object.keys(data.weapondefs).length),
		};
	}
}

fs.writeFileSync(path.join(__dirname, 'units-database.json'), JSON.stringify(database, null, 1), 'utf8');
console.log(`Parsed ${files.length} files -> ${Object.keys(database).length} units.`);
if (parseErrors.length) {
	console.log(`${parseErrors.length} files failed to parse:`);
	parseErrors.slice(0, 10).forEach(e => console.log(' -', e.file, ':', e.error));
}

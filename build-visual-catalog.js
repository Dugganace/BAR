// Builds the visual catalog the user asked for: every custom unit found in
// the local replay corpus (bar-replay-miner/output), with its build picture,
// display name, and an actual plain-English diff of what was changed versus
// the real vanilla base unit -- not just "cloned from X" but the specific
// stat deltas (health/cost/buildtime/speed/damage/etc.), using a real Lua
// AST parse (luaparse) of the tableMerge(...) override table rather than
// regex-guessing, since override tables can be deeply nested and some
// presets are minified onto one line.
const fs = require('fs');
const path = require('path');
const luaparse = require(path.join(__dirname, '..', 'bar-unit-database', 'node_modules', 'luaparse'));

const OUT_DIR = path.join(__dirname, 'output');
const VANILLA_DB_PATH = path.join(__dirname, '..', 'bar-unit-database', 'units-database.json');
const RESULT_PATH = path.join(__dirname, 'visual-catalog.json');

const vanillaDb = JSON.parse(fs.readFileSync(VANILLA_DB_PATH, 'utf8'));

// Same AST-value walker as bar-unit-database/extract-units.js
function astValueToJs(node) {
	if (!node) return undefined;
	switch (node.type) {
		case 'StringLiteral':
			if (node.value != null) return node.value;
			if (typeof node.raw === 'string' && node.raw.length >= 2) {
				return node.raw.slice(1, -1).replace(/\\(.)/g, '$1');
			}
			return node.raw;
		case 'NumericLiteral': return node.value;
		case 'BooleanLiteral': return node.value;
		case 'UnaryExpression':
			if (node.operator === '-') { const v = astValueToJs(node.argument); return typeof v === 'number' ? -v : undefined; }
			return undefined;
		case 'TableConstructorExpression': {
			const obj = {};
			let idx = 1;
			for (const field of node.fields) {
				if (field.type === 'TableKeyString') {
					obj[field.key.name] = astValueToJs(field.value);
				} else if (field.type === 'TableKey') {
					const key = field.key.type === 'StringLiteral' ? astValueToJs(field.key) : astValueToJs(field.key);
					obj[key] = astValueToJs(field.value);
				} else if (field.type === 'TableValue') {
					obj[idx++] = astValueToJs(field.value);
				}
			}
			return obj;
		}
		default: return undefined;
	}
}

// Fields worth surfacing as a human-readable diff (top-level + one level of weapondefs)
const INTERESTING_FIELDS = ['health', 'metalcost', 'energycost', 'buildtime', 'speed', 'sightdistance', 'buildpower', 'mass', 'buildDistance', 'metalstorage', 'energystorage'];

function pct(oldV, newV) {
	if (typeof oldV !== 'number' || typeof newV !== 'number' || oldV === 0) return null;
	return Math.round(((newV - oldV) / oldV) * 100);
}

function diffAgainstVanilla(overrides, vanillaUnit) {
	const changes = [];
	if (!vanillaUnit) return changes;
	for (const field of INTERESTING_FIELDS) {
		if (overrides[field] === undefined) continue;
		const oldV = vanillaUnit[field];
		const newV = overrides[field];
		if (typeof oldV === 'number' && typeof newV === 'number') {
			const p = pct(oldV, newV);
			changes.push(`${field}: ${oldV} -> ${newV}${p !== null ? ` (${p > 0 ? '+' : ''}${p}%)` : ''}`);
		} else {
			changes.push(`${field}: ${JSON.stringify(oldV)} -> ${JSON.stringify(newV)}`);
		}
	}
	if (overrides.weapondefs && typeof overrides.weapondefs === 'object') {
		for (const [wname, wdef] of Object.entries(overrides.weapondefs)) {
			if (wdef && typeof wdef === 'object') {
				const wFields = Object.keys(wdef).filter(k => typeof wdef[k] !== 'object').slice(0, 6);
				if (wFields.length) changes.push(`weapon "${wname}" tuned: ${wFields.map(f => `${f}=${JSON.stringify(wdef[f])}`).join(', ')}`);
			}
		}
	}
	if (overrides.customparams && overrides.customparams.i18n_en_tooltip) {
		changes.push(`tooltip: "${overrides.customparams.i18n_en_tooltip}"`);
	}
	return changes;
}

function extractFromFile(text, sourceFile) {
	const found = [];
	let ast;
	try {
		ast = luaparse.parse(text, { comments: false });
	} catch (e) {
		return found; // some minified/odd files won't parse standalone -- skip, not fatal
	}

	function visit(node) {
		if (!node || typeof node !== 'object') return;
		if (Array.isArray(node)) { node.forEach(visit); return; }

		if (node.type === 'AssignmentStatement') {
			for (let i = 0; i < node.variables.length; i++) {
				const varNode = node.variables[i];
				const initNode = node.init[i];
				if (!initNode) continue;
				// unwrap addSelfShield(...) wrapper if present
				let call = initNode;
				if (call.type === 'CallExpression' && call.base && call.base.name === 'addSelfShield' && call.arguments[0]) {
					call = call.arguments[0];
				}
				if (call.type !== 'CallExpression' || !call.base || call.base.name !== 'tableMerge') continue;
				const [baseArg, overrideArg] = call.arguments;
				if (!baseArg || baseArg.type !== 'IndexExpression') continue;
				const baseId = astValueToJs(baseArg.index);
				if (!baseId || !vanillaDb[baseId]) continue;

				let newId = null;
				if (varNode.type === 'MemberExpression') newId = varNode.identifier.name;
				else if (varNode.type === 'IndexExpression') newId = astValueToJs(varNode.index);
				if (!newId || vanillaDb[newId]) continue; // skip if it's actually a real vanilla id

				const overrides = astValueToJs(overrideArg) || {};
				const humanName = (overrides.customparams && overrides.customparams.i18n_en_humanname) || overrides.name || newId;
				found.push({
					id: newId,
					baseId,
					name: humanName,
					baseIcon: vanillaDb[baseId].icon,
					baseFaction: vanillaDb[baseId].faction,
					changes: diffAgainstVanilla(overrides, vanillaDb[baseId]),
					sourceFile,
				});
			}
		}
		for (const key of Object.keys(node)) {
			if (key === 'range' || key === 'loc') continue;
			visit(node[key]);
		}
	}
	visit(ast);
	return found;
}

const files = fs.readdirSync(OUT_DIR).filter(f => f.endsWith('.tweakdefs.lua'));
const byId = new Map();
let parsedOk = 0, parseFailed = 0;

for (const f of files) {
	const text = fs.readFileSync(path.join(OUT_DIR, f), 'utf8');
	const items = extractFromFile(text, f);
	if (items.length > 0) parsedOk++;
	for (const item of items) {
		if (!byId.has(item.id) || byId.get(item.id).changes.length < item.changes.length) {
			byId.set(item.id, item);
		}
	}
}

const result = [...byId.values()].sort((a, b) => a.baseFaction.localeCompare(b.baseFaction) || a.name.localeCompare(b.name));
fs.writeFileSync(RESULT_PATH, JSON.stringify(result, null, 1));
console.log(`Parsed ${files.length} files. Extracted ${result.length} unique custom units with diffs.`);

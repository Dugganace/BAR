// Parses the real BAR modoptions.lua (fetched from
// github.com/beyond-all-reason/Beyond-All-Reason) into structured JSON --
// every real option with its key/name/desc/type/default/min/max/items/
// section, so the toolkit can distinguish "free" native modoptions
// (no Lua needed, just a Modoptions key/value) from things that actually
// need custom tweakdefs code. Uses a real Lua parse (luaparse), not
// regex, since option entries are full Lua table literals including
// nested `items` arrays for list-type options.
const fs = require('fs');
const path = require('path');

const luaparse = require(path.join(__dirname, '..', '..', 'bar-preset-builder', 'luaparse.js'));

const SRC = path.join(__dirname, 'modoptions.lua');
const OUT_JSON = path.join(__dirname, 'modoptions.json');
const OUT_JS = path.join(__dirname, 'modoptions-data.js');

const text = fs.readFileSync(SRC, 'utf8');
const ast = luaparse.parse(text, { comments: false });

// Turn a luaparse literal/table AST node into a plain JS value.
function toValue(node) {
	if (!node) return undefined;
	switch (node.type) {
		case 'StringLiteral': {
			// This luaparse build leaves .value null for strings, only .raw
			// (still quoted, with escapes) is populated.
			let raw = node.raw.slice(1, -1);
			return raw.replace(/\\(.)/g, (m, c) => ({ n: '\n', t: '\t', '\\': '\\', "'": "'", '"': '"' }[c] || c));
		}
		case 'NumericLiteral': return node.value;
		case 'BooleanLiteral': return node.value;
		case 'NilLiteral': return null;
		case 'TableConstructorExpression': {
			const isArray = node.fields.every(f => f.type === 'TableValue');
			if (isArray) return node.fields.map(f => toValue(f.value));
			const obj = {};
			for (const f of node.fields) {
				if (f.type === 'TableKeyString') obj[f.key.name] = toValue(f.value);
				else if (f.type === 'TableKey') obj[toValue(f.key)] = toValue(f.value);
			}
			return obj;
		}
		default: return undefined;
	}
}

// Find `local options = { ... }`.
let optionsTable = null;
for (const stmt of ast.body) {
	if (stmt.type === 'LocalStatement' && stmt.variables[0] && stmt.variables[0].name === 'options') {
		optionsTable = stmt.init[0];
		break;
	}
}
if (!optionsTable) throw new Error('Could not find `local options = {...}` in modoptions.lua');

const rawOptions = toValue(optionsTable);

// Keep only real, settable options -- drop section headers, subheaders,
// separators, and dev-only/hidden entries that aren't relevant to a
// preset-building tool. `key` is the actual Modoptions field name.
const IGNORED_TYPES = new Set(['section', 'subheader', 'separator', 'label', 'link']);
const options = rawOptions
	.filter(o => o && o.key && !IGNORED_TYPES.has(o.type))
	.map(o => ({
		key: o.key,
		name: o.name || o.key,
		desc: o.desc || '',
		type: o.type,
		def: o.def,
		min: o.min,
		max: o.max,
		step: o.step,
		items: o.items ? o.items.map(i => ({ key: i.key, name: i.name, desc: i.desc })) : undefined,
		section: o.section || null,
		hidden: !!o.hidden,
	}));

// The trailing for-loops in modoptions.lua dynamically generate 18 more
// entries (tweakunits1-9, tweakdefs1-9) -- these are the base64 tweak
// slots the rest of this toolkit already deals with directly, so they're
// intentionally excluded here (this reference is for the OTHER, "free"
// options -- content injection already has its own dedicated pipeline).

fs.writeFileSync(OUT_JSON, JSON.stringify(options, null, 2), 'utf8');
fs.writeFileSync(OUT_JS, `window.MODOPTIONS_REFERENCE = ${JSON.stringify(options, null, 2)};\n`, 'utf8');

const bySection = {};
for (const o of options) bySection[o.section || '(none)'] = (bySection[o.section || '(none)'] || 0) + 1;
console.log(`Parsed ${options.length} real, settable modoptions (sections/headers/tweakdefs slots excluded).`);
console.log('By section:', JSON.stringify(bySection, null, 2));

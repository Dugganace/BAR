// Splits custom_buildings.lua into several self-contained chunks (each with
// its own copy of the shared header/helpers, since each tweakdefs slot runs
// as an independent Lua chunk sharing only the global UnitDefs table) sized
// well under the ~11KB that worked in the original preset's slots, packs
// them into the next free tweakdefs slots, and writes a new preset version.
const fs = require('fs');
const path = require('path');

const SRC = path.join(__dirname, '..', 'custom_buildings.lua');
const OUT_DIR = path.join(__dirname, '..', 'parts');
const PRESETS_PATH = 'C:/Program Files/Beyond-All-Reason/data/optionsPresets.json';
const SOURCE_PRESET = 'tetris scav mode';
const NEW_PRESET = 'mark magic 21';
const SLOTS = ['tweakdefs4', 'tweakdefs5', 'tweakdefs6', 'tweakdefs7', 'tweakdefs8'];

// Real, native BAR modoptions to set on top of the cloned source preset --
// e.g. { unit_restrictions_noair: true } -- these are plain key/value
// settings, NOT tweakdefs code, applied directly to Modoptions. Checked
// against bar-toolkit-hub/modoptions-reference/modoptions.json (159 real
// options fetched from the game's own modoptions.lua) so a typo'd or
// nonexistent key fails loudly instead of silently doing nothing.
const MODOPTION_OVERRIDES = {};

// CONFIRMED 2026-08-15: the game requires URL-safe, UNPADDED base64 for
// these modoption values (standard base64 with +/=/ gets silently rejected
// or truncated). This is the exact transform NuttyB's own configurator
// uses, and it's what the ORIGINAL working preset's own tweakdefs9 slot
// used too. Verified live in-game via the numbered "Tweak Defs N" boxes
// under Advanced Options > Cheats.
function encodeForModoption(text) {
	return Buffer.from(text, 'utf8').toString('base64')
		.replace(/\+/g, '-')
		.replace(/\//g, '_')
		.replace(/=+$/, '');
}

const text = fs.readFileSync(SRC, 'utf8');
const lines = text.split('\n');

const markerIdx = [];
lines.forEach((l, i) => { if (/^-{20,}$/.test(l.trim())) markerIdx.push(i); });
const starts = markerIdx.filter(i => lines[i + 1] && lines[i + 1].trim().startsWith('--'));

const header = lines.slice(0, starts[0]).join('\n');
const sectionBounds = [...starts, lines.length];
const sections = [];
for (let k = 0; k < sectionBounds.length - 1; k++) {
	sections.push(lines.slice(sectionBounds[k], sectionBounds[k + 1]).join('\n'));
}

// Balanced contiguous partitioning (order must be preserved -- sections
// can't be reordered, only grouped -- since each slot is an independently
// executed script sharing the same global UnitDefs table in slot order,
// and later sections can reference ids defined in earlier ones). Naive
// greedy-until-overflow packing badly imbalances once one section is
// close to the bin-size limit on its own (e.g. a ~9000-char section
// forces awkward splits around it) -- this uses the classic "partition
// into K contiguous groups minimizing the max group size" approach
// (binary search on the answer + a greedy feasibility check) so a fixed
// slot COUNT is respected first, with the packer finding the smallest
// possible max-bin-size that still fits everything into SLOTS.length bins.
function canPackInto(sections, maxBinSize, maxBins) {
	let bins = 1, current = 0;
	for (const section of sections) {
		if (section.length > maxBinSize) return false; // a single section can't itself fit
		if (current > 0 && current + section.length > maxBinSize) {
			bins++;
			current = 0;
			if (bins > maxBins) return false;
		}
		current += section.length;
	}
	return true;
}

function packSections(sections, maxBinSize) {
	const bins = [[]];
	let binSize = 0;
	for (const section of sections) {
		if (binSize > 0 && binSize + section.length > maxBinSize) {
			bins.push([]);
			binSize = 0;
		}
		bins[bins.length - 1].push(section);
		binSize += section.length;
	}
	return bins;
}

const RAW_CHAR_CEILING = 11400; // confirmed live in-game ceiling per tweakdefs slot
const SAFE_SECTION_BUDGET = RAW_CHAR_CEILING - header.length; // what's left after the shared header

const totalSectionSize = sections.reduce((s, x) => s + x.length, 0);
let lo = Math.max(...sections.map(s => s.length), Math.ceil(totalSectionSize / SLOTS.length));
let hi = SAFE_SECTION_BUDGET;
if (!canPackInto(sections, hi, SLOTS.length)) {
	// Find the actual minimum bin-size that WOULD make it fit, purely to give
	// a useful error message about how much over budget we are.
	let probeLo = lo, probeHi = totalSectionSize;
	while (probeLo < probeHi) {
		const mid = Math.floor((probeLo + probeHi) / 2);
		if (canPackInto(sections, mid, SLOTS.length)) probeHi = mid;
		else probeLo = mid + 1;
	}
	throw new Error(`Can't fit content into ${SLOTS.length} slots -- needs at least ${probeLo} chars/slot even with perfect balancing, but the safe per-slot ceiling only allows ${hi} (the ~${RAW_CHAR_CEILING}-char confirmed limit minus the ${header.length}-char shared header). Over budget by ${probeLo - hi} chars/slot on average. Content has genuinely outgrown the available slots -- trim something or free up a 6th slot.`);
}
while (lo < hi) {
	const mid = Math.floor((lo + hi) / 2);
	if (canPackInto(sections, mid, SLOTS.length)) hi = mid;
	else lo = mid + 1;
}
const bins = packSections(sections, lo);

if (bins.length > SLOTS.length) {
	throw new Error(`Packed into ${bins.length} bins but only ${SLOTS.length} free slots available.`);
}

const DRY_RUN = process.argv.includes('--dry-run');
if (DRY_RUN) {
	console.log(`Dry run: would use ${bins.length} of ${SLOTS.length} available slots.`);
	bins.forEach((sectionsInBin, i) => {
		const size = header.length + 1 + sectionsInBin.join('\n').length;
		console.log(`  part${i + 1}: ${size} raw chars (${sectionsInBin.length} sections)${size > 11400 ? '  ⚠ OVER the ~11,400 ceiling' : ''}`);
	});
	console.log('No files written, no preset changed (pass without --dry-run to actually build).');
	process.exit(0);
}

if (!fs.existsSync(OUT_DIR)) fs.mkdirSync(OUT_DIR);

const chunkTexts = bins.map((sectionsInBin, i) => {
	const body = header + '\n' + sectionsInBin.join('\n');
	const outPath = path.join(OUT_DIR, `part${i + 1}.lua`);
	fs.writeFileSync(outPath, body, 'utf8');
	console.log(`part${i + 1}.lua: ${body.length} chars (${sectionsInBin.length} sections)`);
	return body;
});

// Inject into a fresh preset clone.
const presets = JSON.parse(fs.readFileSync(PRESETS_PATH, 'utf8'));
if (!presets[SOURCE_PRESET]) throw new Error(`Source preset "${SOURCE_PRESET}" not found.`);

// Back up the live file before touching it -- one bad run shouldn't be able
// to silently clobber every other saved preset. Keeps the last 5 backups.
const BACKUP_DIR = path.join(__dirname, '..', 'preset-backups');
if (!fs.existsSync(BACKUP_DIR)) fs.mkdirSync(BACKUP_DIR);
const stamp = new Date().toISOString().replace(/[:.]/g, '-');
fs.copyFileSync(PRESETS_PATH, path.join(BACKUP_DIR, `optionsPresets-${stamp}.json`));
const backups = fs.readdirSync(BACKUP_DIR).filter(f => f.startsWith('optionsPresets-')).sort();
for (const old of backups.slice(0, -5)) fs.unlinkSync(path.join(BACKUP_DIR, old));
console.log(`Backed up live presets file to preset-backups/optionsPresets-${stamp}.json`);

for (let i = 0; i < chunkTexts.length; i++) {
	const slot = SLOTS[i];
	if (presets[SOURCE_PRESET].Modoptions[slot] && presets[SOURCE_PRESET].Modoptions[slot] !== '') {
		throw new Error(`Slot ${slot} is not empty in the source preset — refusing to overwrite.`);
	}
}

const cloned = JSON.parse(JSON.stringify(presets[SOURCE_PRESET]));
for (let i = 0; i < chunkTexts.length; i++) {
	cloned.Modoptions[SLOTS[i]] = encodeForModoption(chunkTexts[i]);
}

// Apply any real native modoption overrides on top -- validated against
// the fetched reference so a typo'd key fails loudly instead of silently
// writing a dead key the game just ignores.
const overrideKeys = Object.keys(MODOPTION_OVERRIDES);
if (overrideKeys.length) {
	const MODOPTIONS_REF_PATH = path.join(__dirname, '..', '..', 'bar-toolkit-hub', 'modoptions-reference', 'modoptions.json');
	const ref = JSON.parse(fs.readFileSync(MODOPTIONS_REF_PATH, 'utf8'));
	const refByKey = Object.fromEntries(ref.map(o => [o.key, o]));
	for (const key of overrideKeys) {
		if (!refByKey[key]) throw new Error(`MODOPTION_OVERRIDES has unknown key "${key}" -- not in the real modoptions reference. Typo?`);
		const value = MODOPTION_OVERRIDES[key];
		const opt = refByKey[key];
		if (opt.type === 'number' && typeof value === 'number') {
			if (opt.min != null && value < opt.min) throw new Error(`"${key}" = ${value} is below its min (${opt.min}).`);
			if (opt.max != null && value > opt.max) throw new Error(`"${key}" = ${value} is above its max (${opt.max}).`);
		}
		if (opt.type === 'list' && opt.items && !opt.items.some(i => i.key === value)) {
			throw new Error(`"${key}" = "${value}" is not one of its valid options: ${opt.items.map(i => i.key).join(', ')}`);
		}
		cloned.Modoptions[key] = typeof value === 'boolean' ? (value ? 1 : 0) : String(value);
		console.log(`Set modoption "${key}" (${opt.name}) = ${value}`);
	}
}

presets[NEW_PRESET] = cloned;
fs.writeFileSync(PRESETS_PATH, JSON.stringify(presets), 'utf8');
console.log(`\nWrote preset "${NEW_PRESET}" across ${chunkTexts.length} slots: ${SLOTS.slice(0, chunkTexts.length).join(', ')}`);

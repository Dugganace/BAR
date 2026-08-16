// Exhaustive scan of BAR's public replay history via api.bar-rts.com.
// Paginates through every replay (hasBots=true, i.e. PvE/scav-style games
// where custom tweakdefs actually circulate), fetches each one's
// gameSettings, decodes any tweakdefs/tweakunits content, and extracts
// "-- ... by <name>" credited snippets so we can find real custom-content
// authors beyond the user's own play circle.
//
// Resumable: progress (last page fetched, all credits found so far) is
// checkpointed to global-scan-state.json after every page, so this can be
// killed and restarted without losing work. Run with: node global-scan.js

const fs = require('fs');
const path = require('path');
const crypto = require('crypto');

const STATE_PATH = path.join(__dirname, 'global-scan-state.json');
const CREDITS_DIR = path.join(__dirname, 'global-credits');
if (!fs.existsSync(CREDITS_DIR)) fs.mkdirSync(CREDITS_DIR);

const PAGE_LIMIT = 100;
const MAX_PAGES = 2000; // up to 200,000 replays -- will likely stop earlier when pages run dry
const CONCURRENCY = 8;

function loadState() {
	if (fs.existsSync(STATE_PATH)) {
		return JSON.parse(fs.readFileSync(STATE_PATH, 'utf8'));
	}
	return { nextPage: 1, gamesChecked: 0, gamesWithContent: 0, distinctHashes: {}, credits: {}, done: false };
}

function saveState(state) {
	fs.writeFileSync(STATE_PATH, JSON.stringify(state));
}

function decodeModoption(b64) {
	if (!b64) return '';
	let standard = b64.replace(/-/g, '+').replace(/_/g, '/');
	while (standard.length % 4 !== 0) standard += '=';
	try {
		return Buffer.from(standard, 'base64').toString('utf8');
	} catch (e) {
		return '';
	}
}

function reassemble(gs, prefix) {
	const slots = [];
	if (gs[prefix]) slots.push(gs[prefix]);
	for (let n = 1; n <= 9; n++) {
		if (gs[prefix + n]) slots.push(gs[prefix + n]);
	}
	return slots.map(decodeModoption).join('');
}

const CREDIT_RE = /--\s*[^\n]{0,60}\bby\s+[A-Za-z][A-Za-z0-9_\[\]]{1,20}\b[^\n]{0,20}/g;
// Filter out generic English "by" phrases that aren't actually author credit
const NOISE_WORDS = /\b(by hitting|by the engine|by this|by default|by cost|by design|by weight|by their|by its|by unit|by damage|by tier|by number|caused by|triggered by|followed by|used by|spawned by)\b/i;

function extractCredits(text, sourceId) {
	const found = [];
	let m;
	CREDIT_RE.lastIndex = 0;
	while ((m = CREDIT_RE.exec(text))) {
		const line = m[0].trim().replace(/\s+/g, ' ');
		if (NOISE_WORDS.test(line)) continue;
		const start = m.index;
		const rest = text.slice(start + m[0].length);
		const nextCommentIdx = rest.search(/\n--/);
		const block = nextCommentIdx >= 0 ? text.slice(start, start + m[0].length + nextCommentIdx) : text.slice(start, start + m[0].length + 3000);
		found.push({ line, block, sourceId });
	}
	return found;
}

async function fetchWithRetry(url, retries = 3) {
	for (let i = 0; i < retries; i++) {
		try {
			const r = await fetch(url);
			if (!r.ok) throw new Error('HTTP ' + r.status);
			return await r.json();
		} catch (e) {
			if (i === retries - 1) throw e;
			await new Promise(res => setTimeout(res, 1000 * (i + 1)));
		}
	}
}

async function processReplay(id, state) {
	try {
		const j = await fetchWithRetry('https://api.bar-rts.com/replays/' + id);
		const gs = j.gameSettings || {};
		const defsLua = reassemble(gs, 'tweakdefs');
		const unitsLua = reassemble(gs, 'tweakunits');
		state.gamesChecked++;
		if (!defsLua && !unitsLua) return;
		state.gamesWithContent++;

		const hash = crypto.createHash('sha1').update(defsLua + ' ' + unitsLua).digest('hex').slice(0, 12);
		if (!state.distinctHashes[hash]) {
			state.distinctHashes[hash] = { count: 0, fileName: j.fileName };
			const credits = [...extractCredits(defsLua, id), ...extractCredits(unitsLua, id)];
			for (const c of credits) {
				if (!state.credits[c.line]) {
					state.credits[c.line] = { count: 0, sourceId: c.sourceId, fileName: j.fileName };
					fs.writeFileSync(path.join(CREDITS_DIR, hash + '_' + sanitize(c.line) + '.lua'), c.block);
				}
				state.credits[c.line].count++;
			}
		}
		state.distinctHashes[hash].count++;
	} catch (e) {
		// skip failures silently, they're rare
	}
}

function sanitize(s) {
	return s.replace(/[^a-z0-9]/gi, '_').slice(0, 40);
}

async function processBatch(ids, state) {
	let idx = 0;
	async function worker() {
		while (idx < ids.length) {
			const id = ids[idx++];
			await processReplay(id, state);
		}
	}
	await Promise.all(Array.from({ length: CONCURRENCY }, worker));
}

async function main() {
	const state = loadState();
	if (state.done) {
		console.log('Scan already marked done. Delete global-scan-state.json to restart.');
		printSummary(state);
		return;
	}

	console.log(`Resuming from page ${state.nextPage}. So far: ${state.gamesChecked} checked, ${state.gamesWithContent} with content, ${Object.keys(state.credits).length} distinct credits found.`);

	for (let page = state.nextPage; page <= MAX_PAGES; page++) {
		let list;
		try {
			list = await fetchWithRetry(`https://api.bar-rts.com/replays?page=${page}&limit=${PAGE_LIMIT}&hasBots=true`);
		} catch (e) {
			console.log(`Page ${page} failed after retries, stopping for now (resumable).`);
			break;
		}
		if (!list.data || list.data.length === 0) {
			console.log(`Page ${page} empty -- reached end of available replays.`);
			state.done = true;
			break;
		}

		const ids = list.data.map(d => d.id);
		await processBatch(ids, state);

		state.nextPage = page + 1;
		saveState(state);

		if (page % 5 === 0) {
			console.log(`Page ${page}: ${state.gamesChecked} checked, ${state.gamesWithContent} with content, ${Object.keys(state.credits).length} distinct credits, ${Object.keys(state.distinctHashes).length} distinct presets.`);
		}
	}

	saveState(state);
	printSummary(state);
}

function printSummary(state) {
	console.log('\n=== SUMMARY ===');
	console.log('Games checked:', state.gamesChecked);
	console.log('Games with custom content:', state.gamesWithContent);
	console.log('Distinct preset content sets:', Object.keys(state.distinctHashes).length);
	console.log('Distinct credited snippets found:', Object.keys(state.credits).length);
	const sorted = Object.entries(state.credits).sort((a, b) => b[1].count - a[1].count);
	for (const [line, info] of sorted) {
		console.log(`  ${info.count}x  ${line}`);
	}
}

main().catch(e => console.error('Fatal error:', e));

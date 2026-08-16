// Hand-written after actually reading each author's real code in
// bar-replay-miner/global-credits-full/ (not auto-generated from the raw
// credit-comment titles, which were often garbled concatenations of
// adjacent comments -- see build-data.js's old approach, superseded).
// occurrences = how many times this content was seen across the
// 200k-replay global scan, a rough signal of how proven/played it is.
window.BEHAVIOR_MODS = [
	{
		author: 'Bezz',
		title: 'T3 Commander & Army Overhaul',
		occurrences: 1308,
		description: "The single most-played piece of custom content found in the entire scan. Transforms your commander into a near-unkillable T3 combat monster cloned from a Raptor boss unit (Armada's Bantha / Cortex's Kortog / Legion's Heat Ray Mech): 85,000-145,000 HP, 2.3-2.45x weapon damage, full long-range detection (sight/radar/sonar/cloak all maxed), and it can no longer build anything -- pure combat unit. Also globally rebalances the entire unit roster: regular units get 8.5x HP (defense buildings 8x, heavy units 2.8x, siege units 5x, other buildings 5.5x), 2-3.6x damage scaling by category, static AA gets faster reload plus bonus damage, nukes get +50% damage, and defense buildings hit commanders 2.1x harder specifically. Also includes a separate barbarian-AI balance patch (caps T1 army size, halves T1 unit HP vs BARb AI). This is a total-conversion-style rebalance, not a small tweak -- expect very different pacing if used.",
		verdict: 'Major, high-impact. Changes core game balance for every unit, not just commanders.',
	},
	{
		author: 'LoH',
		title: 'BaRandom',
		occurrences: 807,
		description: 'Every unit and building in the game gets a random rarity tier rolled (Common through joke-tier names like "GOD" and "Beyond All Reason") with tier-scaled stat boosts to power/HP/sight/radar. Units also get a random archetype reshaping their whole stat profile -- Glass Cannon, Tank, Sniper, or Brawler for mobile units; Fortress, Watchtower, or Suppressor for buildings -- plus flavor "mutations" per role (a Metal Extractor might roll "Deep Bore" or "Volatile Vein", an energy plant might roll "Surge" or "Efficient Core"). Every unit gets renamed in the build menu with its rolled rarity tag in brackets. Essentially an ARPG loot-rarity system laid over the entire BAR tech tree.',
		verdict: 'Fun/chaos mode, not competitive balance. Every game is a different random loadout.',
	},
	{
		author: 'Ambo',
		title: 'Random Rarities',
		occurrences: 210,
		description: 'Same rarity-randomizer concept as LoH\'s BaRandom -- its own file credits "Special thanks to MGGW" and shares near-identical code structure, so this reads as a close sibling/derivative rather than independent design. If you want this style of mod, BaRandom (LoH, above) is the more-played original.',
		verdict: 'Redundant with BaRandom unless you specifically prefer this version\'s tuning.',
	},
	{
		author: 'MGGW',
		title: 'Quad Pharos / Lava QoL',
		occurrences: 65,
		description: 'Conditionally unlocks buildoptions (e.g. orbital constructors) based on which modoptions/factions are actually active in the game, plus quality-of-life adjustments specific to lava-tide maps (checks the map\'s lava-tide settings before applying anything). Careful, defensive coding -- checks game state before acting rather than assuming.',
		verdict: 'Low-risk, map/modoption-conditional utility patch.',
	},
	{
		author: 'LordOfHangovers',
		title: 'LavaT3pack (by Djarshi, mislabeled)',
		occurrences: 14,
		description: 'Data-quality note: the file traced to "LordOfHangovers" is actually "LavaT3pack Djarshi v4.11" -- real author is Djarshi, not LordOfHangovers. Adds cross-faction constructor buildoptions themed for lava maps (a taxed cross-faction unlock, similar structure to TetrisCo\'s Cross Faction Tax found in the base Tetris preset).',
		verdict: 'Misattributed by the extraction pipeline -- content itself looks like a legitimate small QoL pack.',
	},
	{
		author: 'onetrick',
		title: 'LavaPack v5.0 (by Djarshi, mislabeled)',
		occurrences: 3,
		description: 'Same misattribution as above -- the file traced to "onetrick" is actually "LavaPack (Djarshi) v5.0". Reads the map\'s "is lava" modoption and conditionally unlocks buildoptions per faction when playing on a lava map.',
		verdict: 'Misattributed by the extraction pipeline -- likely a newer version of the LavaT3pack above.',
	},
	{
		author: 'Djarshi',
		title: 'Correction: not actually Djarshi\'s content',
		occurrences: 6,
		description: 'The file traced to "Djarshi" in this scan is actually a copy of LoH\'s BaRandom (identical code, just different rarity-chance constants) -- not "LavaPack" as an earlier pass of this project assumed. Djarshi\'s real content (LavaT3pack / LavaPack) is correctly attributed above under LordOfHangovers and onetrick, where the author-tracing pipeline actually placed it.',
		verdict: 'Data-quality correction, not a real distinct mod -- see LordOfHangovers/onetrick for Djarshi\'s actual content.',
	},
	{
		author: 'FiendishDevil',
		title: 'T3 Con Buildoption Unlocks',
		occurrences: 34,
		description: 'Adds T2 nanoturret / wall / shockwave-defense buildoptions to T3 air constructors (Armada and Cortex), and sets a few units (legstarfall, armvulc, corbuzz) to auto-fire-at-will by default (firestate=2) instead of requiring a manual order.',
		verdict: 'Small, low-risk QoL unlock -- lets T3 air cons build things they normally can\'t.',
	},
	{
		author: 'Luigi',
		title: 'BaRandom + personal edits',
		occurrences: 1,
		description: 'A personally-edited copy of LoH\'s BaRandom with tweaked rarity-chance constants -- not independent content.',
		verdict: 'Not worth adopting separately from LoH\'s original BaRandom.',
	},
];

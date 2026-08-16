# BAR Toolkit — Roadmap (v0.2)

**Build pass completed 2026-08-15** — see the ✅ markers below for what's
now actually built vs. still open. Full status recap sent to the user
separately; this file is the source of truth going forward.

## Overnight autonomous pass (2026-08-16) — read this first

Ran unsupervised overnight per explicit instruction ("finish all the
unfinished tasks... clean up the project as much as possible and push all
of it to the repo without my intervention"). Scope was deliberately
bounded to bounded/safe work — see the "explicitly not touched" list at
the end of this section for what was skipped and why.

- **All 5 local tool projects are now on GitHub**, merged into one repo:
  `github.com/Dugganace/BAR`. `bar-toolkit-hub` (this repo) is the root;
  `bar-custom-buildings`, `bar-preset-builder`, `bar-scav-spawn-editor`,
  and `bar-replay-miner` are merged in as subdirectories via `git subtree`
  (their original standalone local git repos are unaffected, still usable
  as-is on this machine). `bar-unit-database`'s files were copied in
  directly rather than subtree-merged, since its own `.git` is a full
  clone of the real upstream `beyond-all-reason/Beyond-All-Reason` repo,
  not something to merge history from. Bulk regenerable icon/image dumps
  (icons-png/, unitpics/, per-tool icons/ folders — hundreds of MB,
  duplicated across tools) and `node_modules/` were `.gitignore`d out to
  keep the repo a reasonable size; a handful of leftover scratch/debug
  files in `bar-custom-buildings` (old `debug-*.lua`, `chat-command-*.txt`
  dumps, a personal `optionsPresets.backup.json`) were excluded too as
  not being real source.
- **NuttyB Configurator added** — the real community tool
  (`rcorex/nuttyb-config`) copied in locally at
  `bar-toolkit-hub/nuttyb-configurator/` as a reference implementation for
  slot-assignment/base64 encoding, with its own hub card. Pulls a few
  scripts from CDN (marked/luaparse/luamin/giscus) same as upstream, so
  needs internet to fully render — not fully offline like our own tools.
- **New: Custom Content Database** (`bar-toolkit-hub/custom-content-database/`)
  — the real ask behind tonight's biggest chunk of work: one unified,
  searchable/filterable database of every custom unit/building found
  anywhere in the project (56 unique ids) — our own current
  `custom_buildings.lua` (31), the 3 traced authors CrossGamer/
  Hazyhazelnuts/Waffles_II (mostly overlapping — see
  [[project_bar_replay_mining]]-adjacent finding that they share a
  library, not independent content), and 4 more recovered directly from
  the Preset Catalog's raw decoded text (our own superseded/renamed
  content: the removed Assembly Complex, the pre-3-tier-split Raptor
  Bio-Reactor). Each entry shows name/tooltip/base-unit-cloned-from and
  every saved preset it's been seen in. Rebuild with `node
  build-database.js` after adding content or tracing a new author. This
  is a browse-and-pick reference only — it doesn't adopt or change any
  live preset by itself, deliberately (see below).
- **New Unit Builder's weapon-key auto-detection**: done, see the
  "unit-tree building workflow" section below.
- **Scav Spawn Editor's unit-id validation**: done, see "Tool-specific
  fixes still needed" below. Also discovered the editor was already far
  more functionally complete than this roadmap previously said.
- **Id-collision checker**: done, see "Other known gaps" below.

**Explicitly not touched, and why** (all judgment calls that need your
input, not bounded/safe overnight work):
- **Content adoption decisions** — which of CrossGamer's gadgets, Bezz's
  T3 Commander overhaul, etc. actually go into a live preset. The new
  Custom Content Database above makes this easier to do together, but
  the actual picking is still yours.
- **The full content-browser gallery merge** — still needs the mockup
  session with you the roadmap has always said it needs.
- **Map editor / map mirroring** — you explicitly deferred this
  ("huge ongoing project, come back to that one") and there's no specific
  target map right now; didn't want to invent scope on an initiative you
  parked on purpose.
- **winter_gaming lead** — still blocked on you giving a specific
  video/map name to search against.


Reorganized from v0.1 (see `ROADMAP-v0.1.md` for the raw chronological
notes from the tool-by-tool walkthrough on 2026-08-15) by initiative.
Not prioritized/ordered within each section — still a running list.

## Big initiative: consolidate the content browsers

Three separate tools all turned out to be doing the same basic thing —
browse content, see items, maybe pick some — and the user confirmed this
redundancy directly on all three:

- **Preset Catalog** — browses decoded tweak slots across all 51 saved
  presets, but shows raw code ("i dont read code. i read english").
- **Custom Content Catalog** — "basically just a copy of what we are
  doing in other tools."
- **Preset Explorer** — "isnt that just another catalogue picker?"

**Target design**: one gallery-style tool, modeled directly on the
**Custom Buildings Gallery**, which the user confirmed as the pattern to
follow ("i like the custom buildings gallery... this page is very
helpful and i like how you have presented it all good work"). It should:

- Show everything as visual cards (build picture, name, plain-English
  description of what changed) — never raw Lua.
  **✅ PARTIAL — Preset Catalog now defaults to visual cards** (icon,
  name, tooltip, cloned-from) instead of raw code; raw Lua is still
  available behind a "Show raw code" toggle for when it's actually
  needed. Custom Content Catalog and Preset Explorer not yet merged in —
  full three-tool consolidation is still the bigger ask below.
- Cover the full scope, not just our own content: our
  `custom_buildings.lua`, plus everything found in the replay-mining
  project (CrossGamer, Bezz, LoH, Ambo, MGGW, Mewi, Djarshi, etc.) and
  the 52-unit local diff catalog. User: "for all the ones in all the
  tweaks we have found so far its easier for me to see like this."
  **NOT YET DONE** — the author content (CrossGamer/Bezz/etc.) is still
  raw `.lua` files, not structured into name/icon/diff cards yet. Real
  work, not just wiring — needs its own extraction pass per author.
- **Split buildings from units** throughout.
  **✅ DONE in Unit Database viewer, Preset Builder, and Custom
  Buildings Gallery** — same All/Buildings/Units toggle pattern
  everywhere, split on the `speed` field (387 buildings vs 570 units),
  combined with faction tabs so it's "one type at a time, per faction"
  as requested, not just a global filter. Not yet done for the
  author-sourced content since that's not structured yet (see above).
- Fix the specific Preset Catalog bug along the way: clicking an item
  currently collapses the sidebar list it's in — should stay expanded.
  **✅ DONE** — root cause was the sidebar rebuilding from scratch on
  every click with no persisted expand-state; now tracks an
  `openPresets` set that survives re-renders.
- This is a joint design task — user wants mockups first ("we will
  flesh out together maybe with mock ups"), not a solo build.
  **Still true for the FULL three-tool merge** — what's built above are
  real incremental improvements within the existing tools, not the
  final consolidated gallery. That still needs the mockup session.

## Big initiative: unit-tree building workflow

User's own framing: "this is more a function for me so i can build unit
trees quickly." Two pieces:

1. **Click-to-customize flow.** ✅ **DONE** — clicking a unit's image in
   both the Preset Builder grid and the Unit Database viewer opens New
   Unit Builder in a new tab with `?base=<id>`, which auto-selects that
   unit as the clone base. New Unit Builder also gained a **Tech level**
   field and the target field now accepts multiple comma-separated
   ids ("which units/buildings can build it") instead of just one.
2. **Fix the Preset Builder's target field.** ✅ **DONE** — replaced the
   blind free-text box with a searchable picker (same pattern as the
   unit grid: search "printer", click a result). Added explicit step
   labels (Step 1 — what should build these? / Step 2 — click units to
   add / Step 3 — generate) and the multi-target list is now always
   visible with names, not just a hidden chip row.
- **New Unit Builder itself confirmed good as-is** — no changes wanted
  there, it's the piece everything else should route through.
- Known related gap: it doesn't auto-detect weapon keys from the cloned
  unit. **✅ DONE (2026-08-16)** — selecting a base unit with a weapon now
  fetches its real source file live from
  `raw.githubusercontent.com/beyond-all-reason/Beyond-All-Reason` and
  regex-extracts the actual `weapondefs` key(s), shown in the base-card
  and pre-filled into the generated Lua as a starter block, instead of
  just a "verify manually" warning. Falls back to the old warning if the
  fetch fails (offline, rate-limited, etc).

## Big initiative: game-update resilience process

User's concern: BAR updates over time, and every custom unit is built as
`tableMerge(unitDefs['some vanilla id'], overrides)` — a future patch
could rename, remove, or restructure a base unit we depend on and
silently break our content. Needs an actual process, not just hoping it
doesn't happen:

- Extend `bar-unit-database/check-for-updates.js` to also cross-reference
  every `baseId` that `custom_buildings.lua` clones from against the
  fresh unit list after any BAR update, flagging anything changed/
  removed before it's discovered the hard way in a live test.
  **✅ DONE** — still run manually (that part of the gap is unchanged),
  but the script now also extracts every `unitDefs['id']` our content
  depends on and cross-references it against the diff's removed/
  modified files, printing a specific ⚠ warning list if any of our
  dependencies were touched.

## Confirmed real, unresolved bugs (from live testing)

- **Scav spawn bug: RESOLVED (2026-08-15/16), was never our content.**
  Root cause was a real upstream BAR engine bug — scav/raptor spawner
  files erroring on `attempt to index global 'BAR' (a nil value)`
  because the `BAR` global wasn't exposed in the sandboxed environment
  used to load unit/feature/weapon defs. Fixed by tetrisface (the same
  dev credited for the evo-economy system in "Tetris stable") in commit
  `e8ec233`, PR #8759 "Fix scav and raptor spawners: expose BAR to the
  def-file sandbox", released in BAR test build 2026.08.15-2. Confirmed
  via a full live re-test of "mark magic 19" (full content, all 10
  scripts including the Commander Progression Chain) after the patch —
  scavs, ruins, and the wave timer all work correctly. No content
  changes were needed on our side. See
  `bar-custom-buildings/tools/build-*-slot-test.js` for the (now-moot)
  slot-count isolation series run before the real cause was found.
- **"Number of scripts, not size" hypothesis: TESTED, was a red
  herring.** Ran an actual isolated test series (1 extra slot → 2 → 3 →
  4 → full 5) specifically to check whether tweakdefs4-8's script count
  was the trigger. Every step passed cleanly once tested post-patch —
  the earlier failures were the same upstream engine bug above, not
  slot count. The 5-slot floor for current content size is still real
  (confirmed via both the balanced binary-search packer and a
  hand-curated thematic grouping, both landing on exactly 5 bins for
  ~40,900 chars of content against the ~11,400-char/slot ceiling), it
  just was never the cause of the scav bug.
- **`tweakunits2-9` confirmed usable for future expansion.** All 8 of
  these slots are completely unused (base preset only occupies
  `tweakunits1`). Live-tested adding a section to `tweakunits2` post-
  patch — worked correctly. Gives roughly 80,000 more characters of
  headroom beyond the current 5-slot content if ever needed. Note:
  `tweakunits1` specifically silently failed to apply our Commander
  Progression Chain in one earlier pre-patch test — worth a quick
  re-check before relying on `tweakunits1` itself for new content, even
  though `tweakunits2` now tests clean.
- **Printer-stacking bug: FIXED.** Static buildings (Hyper Reactor,
  Bulwark Tower, Armored Tower, Interceptors, Depawner) had been added
  to the two unit printers' buildoptions — printers expect mobile units
  that walk away, so static buildings just got constructed and stacked
  at the spawn point. Removed from `custom_buildings.lua`; buildings
  stay on commander/constructor buildoptions only.

## Content to review and possibly adopt

From the 200k-replay global scan and person-tracing — all decoded and
sent to the user, none reviewed/decided on yet:

- **CrossGamer's 7 gadgets** (MIRV Nuke, Portable Shield, Anti-Nuke T3
  Mod, Antinuke-to-ICBM Visuals, Scavenger Beacon → Nuke Silo, Beacon
  Nuke, Knockback rework) — user has vouched for CrossGamer directly
  ("i know crossgamer and yes he makes good ones we should take").
- **Bezz's T3 Commander overhaul** — the single most-played piece of
  custom content found in the entire scan (1308 occurrences).
- **LoH's BaRandom**, **Ambo's Random Rarities / Bigger Tier Steps / No
  Metal Mod**, **MGGW's Quad Pharos / Lava QoL**, **Mewi's Nutty Raptors
  T4 Defence**, **Djarshi's LavaPack**.

## Map tools (deliberately deferred)

User confirmed (2026-08-15): "the map editor is a huge ongoing project
we will come back to that one" — not neglected, just not now.

- **Map mirroring script** — pipeline validated (Beherith's
  `springrts_smf_compiler` decompile→recompile round-trips cleanly,
  byte-identical `.smt` on Ancient Bastion Remake). Actual mirror
  transform not yet built — single-map scope only when resumed, no mass
  tooling.
- **Springboard has no built-in symmetry tool** (issue #69, open since
  2015) and no community plugin exists either — confirmed, not
  something to keep searching for.

## Leads to chase

- **winter_gaming / Volshok** — confirmed BAR's official Narrative Lead.
  Blocked on YouTube's cookie-consent wall for automated playlist
  scraping; needs a specific video/map name from the user to search
  against the replay API.
- **Further author chain-tracing** — technique proven (co-player
  frequency + date-clustering + credit-comment scanning). Waffles_II
  came back as a dead end (just plays the shared group preset). Could
  try more names from `coplayers.txt` if useful later.

## Tool-specific fixes still needed

- **Scav Spawn Editor**: broken/incomplete, hub card doesn't even link
  anywhere. **✅ Link fixed** (hub card now links to its page). Turned out
  to already be far more functionally complete than this roadmap
  previously said — full weight editing, add/remove units, live-splice
  full-file reconstruction, export, localStorage persistence, and preview
  were already working. **✅ Its one real documented gap (unit-id
  validation on add) fixed 2026-08-16** — scav variants are generated by
  the engine at runtime from a real base unit rather than being
  separately authored, so adding a unit now strips the `_scav` suffix and
  checks the base id against `reference/valid-unit-ids.js` (957 real ids
  from `bar-unit-database`), warning before adding something that would
  silently produce a dead entry in-game. Still-open items from the
  README's own "Known limitations": only the 3 unit-pool tables are
  editable (Turrets/BurrowUnitsList/tierConfiguration/difficultyParameters/
  squad-assembly system untouched), and no packaging/install step for the
  exported file yet.
- **Custom Content + Delivery Pipeline hub card**: same broken-link
  issue. **✅ Fixed** — now links to the Custom Buildings Gallery as the
  visual view of what this pipeline produces.
- **Replay Miner**: **✅ "Players seen" label added** (tooltip explaining
  it's the data source for tracing content authors, not a play-history
  roster). Missing icons confirmed as a pipeline gap, not missing game
  data — **✅ fixed as part of the icon conversion work below.**
- **Hub landing page**: needs the actual Beyond All Reason logo.
  **✅ DONE** — downloaded the real official SVG logo and added it to
  the header.

## Other known gaps

- **28 icons never converted.** ✅ **DONE** — used Pillow (now that
  Python's installed from the map-mirroring work) instead of writing
  another from-scratch DXT decoder. All 28 converted successfully,
  verified non-trivial file size on every one. All 1495 unit icons now
  convert cleanly.
- **No injector for "picked" content.** ✅ **DONE for Preset Explorer** —
  added a "Build preset from picks" button. Originally had an
  "Export picks as JSON" button that went nowhere (no injector consumed
  it); user confirmed cutting it, then asked for the real thing: picks
  can be turned into an actual preset. Uses a real Lua parse (luaparse,
  copied in as `bar-preset-builder/luaparse.js`, loaded as a browser
  global) to find each picked item's *exact* original `tableMerge` block
  in its source preset's decoded content — not a reconstruction from
  just name/tooltip, so real stat overrides are preserved. Falls back to
  a flagged reconstruction with a clear warning if the original can't be
  found. Replay Miner's picks cart still doesn't have this — same fix
  could be reused there if wanted.
- **No auto-backup before writing `optionsPresets.json`.** ✅ **DONE** —
  `split-and-package.js` now backs up the live file to
  `bar-custom-buildings/preset-backups/` before every write, keeping
  the last 5.
- **No id-collision checker across authors.** **✅ DONE (2026-08-16)** —
  `bar-custom-buildings/tools/check-id-collisions.js` cross-references
  every id our `custom_buildings.lua` defines against the real 957-unit
  vanilla id list (flags accidental overwrites of a real unit — one
  intentional exception allowlisted: the Depawner's deliberate
  `armbotrail` weapon override) and against every traced author's
  extracted content (CrossGamer/Hazyhazelnuts/Waffles_II), plus checks
  those authors against each other. Run with `node
  tools/check-id-collisions.js`; re-run after adding new content or
  tracing a new author.
- **No slot-budget preview.** ✅ **DONE** — `split-and-package.js` now
  accepts `--dry-run`, prints every chunk's size and flags any over the
  ~11,400-char ceiling, writes nothing and touches no preset.
- **No back-to-hub navigation anywhere.** ✅ **DONE** — added a "← Hub"
  link to the header of all 8 tool pages (Preset Builder, New Unit
  Builder, Preset Explorer, Unit Database viewer, Preset Catalog,
  Custom Buildings Gallery, Replay Miner viewer, Custom Content
  Catalog).

- **Pocket AFUS removed, Bio-Reactor/Recycler added to all con tiers
  (2026-08-15).** Removed the original preset's Pocket Fusion Reactor
  (portfus, 1100E) and Portable Advanced Fusion Reactor (portafus,
  3300E) — these live in the base preset's own slots (1/3), nil'd out
  from our slot since it runs after those load. Added Scav Metal
  Recycler + Raptor Bio-Reactor to every T1/T2/T3 bot/vehicle/air
  constructor across all 3 factions (27 units), tier-matched (Bronze→
  T1, Silver→T2, Gold→T3). Built into "mark magic 19".

## "Tetris stable" preset analysis (2026-08-15)

- **Real author attribution found for the base preset's own content**
  (tweakdefs1/2/3/9 + tweakunits1, no `custom_buildings.lua` content):
  Epic Unit Printer/BioPrinter/Custom Balance Tweaks by **Waffles_II**
  (contradicts the earlier replay-mining conclusion that he had no
  independent library — worth revisiting), Cross Faction Tax by
  **TetrisCo**, and **"ExponentialEvoEcoConTurV2"** by **tetrisface**.
- **Solved the "evo build turret, 1-30 variants" mystery from earlier
  this session**: it's tetrisface's system, adding 3 exponentially-
  scaling building families (Evo Fusion 30 levels, Evo Energy Converter
  24 levels, Construction Turret 30 levels) directly to every T2/T3
  constructor's buildoptions — all levels buildable immediately, no
  forced progression chain. Built a real viewer for this at
  `bar-toolkit-hub/evo-economy/`, computed the actual exponential math
  and real stats per level (verified against real game source), linked
  from the hub. Reference/study only, not our own content.
- **Compared "Tetris stable" vs "mark magic 19" to investigate the scav
  spawn bug**: `ruins` is identical in both (enabled/verydense) — ruled
  out as the cause. Only other modoption difference is `maxunits`
  (1300 vs 1000, likely irrelevant). The one real structural
  difference: Tetris stable has NO content in tweakdefs4-8 at all,
  while mark magic runs 5 extra independent tweakdefs scripts there.
  This is real comparative evidence (not just theory) for the
  untested "number of scripts, not size" hypothesis from earlier —
  worth an actual isolated test.

## Ideas / not yet scoped

- (space for whatever comes up next)

## Content reworks in progress

- **Commander Progression Chain: REWORKED 2026-08-15 into 10 ranks**
  (Cadet/Private/Corporal/Sergeant/Lieutenant/Captain/Major/Colonel/
  General/Grand Admiral), replacing the old 4-tier Captain/General/
  Grand Marshal system. Each rank is tied to the REAL evolving
  commander's own evo level (armcom→armcomlvl2..10, engine feature,
  already on via evocom=1) — at each level the real commander unlocks
  building the matching rank unit, with stats cloned from the REAL
  evo-level stats (fetched from game source, not made up). Each rank's
  own buildoptions are cumulative, ending with Grand Admiral able to
  build every custom building/defense in the file. Built into
  "mark magic 13", **needs a live test** — this is new, untested
  territory (first time tying custom content to the real evocom system
  rather than a separate build-chain).
- **CONFIRMED WORKING (2026-08-15): "mark magic 18" tested live with a
  BARb AI, user reported "all worked good loved it."** The 10-rank
  Commander Progression Chain, build-order fix, tier gating, and
  simplified tooltips are all confirmed functioning correctly in a real
  game. This is the current known-good baseline to build forward from.
- **Commander Chain build order corrected (2026-08-15).** User tested
  and confirmed the leveling-together bug was fixed, but the build
  ORDER was still wrong — wanted progression through the ranks
  themselves, not the real evo commander unlocking each rank per level.
  Reworked: the real commander (any evo level) can now only ever build
  a Cadet; each rank then builds the next one up (Cadet→Private→...→
  Grand Admiral), matching the original 4-tier chain's pattern just
  extended to 10 steps. Tooltips also simplified to just the rank name
  per request ("just cadet, private not all the explanation text").
  Built into "mark magic 18".
- **Commander Chain leveling bug: FOUND AND FIXED (2026-08-15).** Live
  test showed all rank units (Cadet/Private/etc.) leveling up together
  as a group whenever the real commander leveled. Root cause: BAR's
  `unit_evolution.lua` gadget triggers on ANY unit with
  `customparams.evolution_target` set, not just real commanders — our
  rank units, cloned from `armcomlvlN`, inherited that field from their
  base. Fixed by explicitly clearing it on every rank unit. Also added
  `maxthisunit = 1` per rank per the user's request ("i only want to be
  able to build 1 of each commander like this"). Built into
  "mark magic 17".
- **Scav spawn bug: likely NOT our content after all.** User reports
  scavs not spawning in *other* (non-mark-magic) games too since a
  recent BAR update — strongly suggests this is the vanilla engine
  regression we traced earlier (the `BAR` global nil-value cascade in
  real raptor/scavengerboss files), not something in
  `custom_buildings.lua`. `ruins` is on (`verydense`) in this preset,
  inherited from the original "tetris scav mode" — worth testing with
  it off, but per the standing rule this is out of scope for us to fix
  directly; worth reporting to the BAR team/Discord as a likely
  post-update regression.
- **Scav Metal Recycler: NEW 2026-08-15**, same 3-tier pattern as the
  Bio-Reactor (Bronze/Silver/Gold, same lootbox shells for a consistent
  look, same tier-1/4/9 gating) but produces metal only via `metalmake`
  instead of energy: Bronze 5 / Silver 25 / Gold 50 metal/sec.
- **Support Relay build range lowered to 10%** of its previous value
  (900 → 90 `builddistance`) across all 3 factions.
- **Assembly Complex removed** — cut to free up packaging space once
  the file outgrew the 5 available tweakdefs slots (see the
  `split-and-package.js` fix below).
- **`split-and-package.js` packing algorithm fixed** — the old greedy
  packer couldn't balance well once a single section got close to the
  bin-size limit (a ~9000-char section forced awkward splits around
  it), and would fail even when a valid packing existed. Replaced with
  a proper "partition into K contiguous groups minimizing the max
  group size" algorithm (binary search + greedy feasibility check).
  Also now gives an accurate "over budget by N chars/slot" error
  instead of a confusing generic failure when content genuinely
  doesn't fit in the available slots.
- **Raptor Bio-Reactor: REWORKED 2026-08-15 into 3 tiers**, renamed to
  Bronze/Silver/Gold to match this file's Barrier naming convention
  (initially built as Small/Medium/Large, renamed on request), one per
  lootbox rarity template (Silver/Gold/Platinum lootbox → Bronze/Silver/
  Gold reactor), techlevel 1/2/3. Costs lowered and output set to exact
  requested values: Bronze 5,000 / Silver 10,000 / Gold 20,000 energy.
  Wired into the rank-tier system at matching tiers (Bronze at Cadet,
  Silver at Sergeant, Gold at General). Built into "mark magic 15".

- **The Depawner: REWORKED 2026-08-15.** Was a generic anti-VTOL flak
  turret; now a real interceptor against the Scavenger "Pawn Launcher"
  (`armbotrail`)'s ballistic shell, using the engine's `targetable`/
  `interceptor`/`coverageRange` bitmask mechanic (verified against real
  WeaponDef.cpp source — confirmed to work on any weapon type, not just
  missiles). **Needs a live test** — untested whether a continuously-
  firing flak-style weapon (vs. BAR's usual stockpiled AMD-style
  interceptors) behaves as expected for intercepting a Cannon-type
  projectile specifically.

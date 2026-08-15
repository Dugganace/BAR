# BAR Toolkit — Roadmap

Backlog for the whole toolkit (preset builder, unit database, replay miner,
custom buildings, map tools). Not prioritized/ordered — just a running list.

## Open bugs

- **Scav spawn system breaks in "mark magic" presets**: 6 raptor queen
  files + `scavengerbossv4.lua` fail to parse (`attempt to index global
  'BAR' (a nil value)`), which cascades into no scav enemy spawning and
  no wave/boss timer HUD. Confirmed new (zero occurrences in 3 prior
  session logs), not caused by anything in `custom_buildings.lua`
  directly. Root cause not found — needs a live test of "mark magic 12"
  to see if it still reproduces before investigating further. Per
  standing rule, any fix must stay inside our own content/scripts, not
  touch BAR's engine/vanilla files.
- **`split-and-package.js` bin-packing**: greedy order-preserving packer
  keeps landing on 5 tweakdefs slots for the current content regardless
  of `TARGET_BIN_SIZE` tuning — the "fewer slots might avoid the scav
  bug" theory was never actually testable because of this. Worth a
  smarter packing approach if slot count turns out to matter.
- **UNCONFIRMED, NEEDS A LIVE TEST — a possibly-new limit distinct from
  the per-slot character ceiling**: the existing ~11,400 raw-char /
  ~15,200 base64-char per-slot ceiling was already solidly confirmed
  long ago and isn't in question. What's newly suspected but NOT tested:
  a limit on the *number of separate tweakdefs scripts running at once*
  (currently 5, across slots 4-8). The theory is that running 5
  independent scripts, each modifying UnitDefs, may itself be what
  triggers the "BAR nil" load-order collision with vanilla raptor/scav
  files (see the open bug above) — not anything about how big any one
  of them is. This needs a real live test that isolates slot-COUNT as
  the variable (e.g. try the same content packed into fewer, larger
  slots, or a version with intentionally 2-3 slots instead of 5) before
  treating it as confirmed either way.

## Content to review and possibly adopt

- **CrossGamer's 7 gadgets** (MIRV Nuke, Portable Shield, Anti-Nuke T3
  Mod, Antinuke-to-ICBM Visuals, Scavenger Beacon → Nuke Silo, Beacon
  Nuke, Knockback rework) — sent to user, not yet merged into
  `custom_buildings.lua`. User has vouched for CrossGamer directly
  ("i know crossgamer and yes he makes good ones we should take").
- **Bezz's T3 Commander overhaul** — the single most-played piece of
  custom content found in the entire 200k-replay scan (1308
  occurrences). Full decoded source sent, not reviewed/decided on yet.
- **LoH's BaRandom**, **Ambo's Random Rarities / Bigger Tier Steps / No
  Metal Mod**, **MGGW's Quad Pharos / Lava QoL**, **Mewi's Nutty Raptors
  T4 Defence**, **Djarshi's LavaPack** — all decoded and sent, all
  unreviewed.

## Map tools

- **Confirmed by user (2026-08-15): "the map editor is a huge ongoing
  project we will come back to that one."** Deliberately deferred, not
  neglected — don't treat the lack of progress here as an oversight.
- **Map mirroring script** — validated the pipeline works (Beherith's
  `springrts_smf_compiler` decompile→recompile round-trips cleanly on
  Ancient Bastion Remake, byte-identical `.smt`). Actual mirror
  transform (flip 4 images, remap feature/start-position coordinates,
  repackage as `.sd7`) not yet built — user said hold until other work
  is done, single-map scope only, no mass tooling.
- **Springboard symmetry** — confirmed no built-in tool exists (issue
  #69, open since 2015), no community plugin found either.

## Leads to chase

- **winter_gaming / Volshok** — confirmed to be BAR's official Narrative
  Lead. Blocked on YouTube's cookie-consent wall for automated playlist
  scraping; needs a specific video/map name from the user to search
  against the replay API.
- **Chain-tracing further authors** — technique proven (co-player
  frequency + date-clustering + credit-comment scanning). Waffles_II
  came back as just playing the shared group preset, no independent
  library. Could try more names from `coplayers.txt` if useful.

## Toolkit UX polish (going tool-by-tool, in progress)

### Hub landing page (bar-toolkit-hub/index.html)

- **Needs the actual Beyond All Reason logo.** Currently just a plain
  text header, no branding.

- **Preset Builder (buildoptions picker) — confirmed clunky, root cause
  found**: the "target building/lab/commander" field is a blind
  free-text box requiring you to already know the exact internal unit
  id (e.g. `epicunitprinter`) from memory, while the units-to-add panel
  right next to it has full search/browse. Fix: make the target field a
  searchable picker using the same unit-search UI as the left panel
  (search "printer" instead of remembering the id). Also: multi-target
  support already exists (you can build buildoptions lists for several
  different targets in one session, Generate outputs all of them) but
  there's zero UI cue this is possible — switching targets looks like
  your picks vanished. Needs visible step ordering (1. pick target → 2.
  click units → 3. generate) and a clearer "targets in this preset" list.
- **New Unit Builder — confirmed good, no changes wanted.** User: "i
  like the new unit builder and how that all works good stuff."
- **New feature request — click-to-customize for building unit trees
  quickly**: from the Preset Builder's unit grid, clicking a unit's
  image should open the New Unit Builder with that unit pre-selected as
  the base to clone, so the whole flow becomes: click unit -> customize
  name, what tech level it's built at, and which units/buildings can
  build it (i.e. set its buildoptions parents) -> done, without leaving
  the page or re-searching for the same unit twice. This merges the
  buildoptions-picker and new-unit-builder into one continuous flow
  specifically for building out unit trees fast. User's own framing:
  "this is more a function for me so i can build unit trees quickly."
- Still to review: the hub landing page.

### Scav Spawn Editor

- **Broken/incomplete — the hub card doesn't even link anywhere.**
  Currently marked "parked" with no href on its hub-page card at all.
  Needs real work before it's usable, starting with just linking it to
  its actual page.

### Custom Content + Delivery Pipeline

- **Same issue: hub card has no href either** — confirmed, it's just a
  folder reference (`bar-custom-buildings/`), not a link to anything.
- **Correctly identified as primarily a Claude-facing tool**, not
  something the user browses directly — it's the actual content file
  and packaging script, understanding-of-game-logic territory rather
  than a UI.

### NEW: game-update resilience process (not yet scoped)

- **User's concern**: BAR gets updated over time, and `custom_buildings.
  lua` depends on specific vanilla unit ids continuing to exist with
  compatible stats/fields (every clone is `tableMerge(unitDefs['some
  vanilla id'], overrides)`). A game update could rename, remove, or
  restructure a base unit we depend on and silently break our content —
  need an actual PROCESS for catching this, not just hoping it doesn't
  happen.
- Relates to the already-logged `check-for-updates.js` gap (currently
  only checks the raw unit database for added/changed/removed vanilla
  units, manually, and doesn't cross-reference against what
  `custom_buildings.lua` actually depends on) — this should probably
  extend that script specifically: after any BAR update, re-run it,
  cross-reference every `baseId` our content clones from against the
  fresh unit list, and flag anything that changed or vanished before we
  find out the hard way in a live test.
- **Preset Explorer confirmed to have the same redundancy** — browse
  presets, click custom items, build a cross-preset pick cart, export
  JSON. Functionally overlaps with both Preset Catalog and Custom
  Content Catalog. This makes THREE tools that are all variations of
  "browse content / see items / maybe pick some" (Preset Catalog, Custom
  Content Catalog, Preset Explorer) — a strong signal the real fix is
  consolidating all three into one well-designed gallery-style tool
  (per the Custom Buildings Gallery section above), not polishing each
  one separately.

### Custom Content Catalog

- **Confirmed liked, but user suspects it's redundant.** User: "i like
  the custom content catalogue but im pretty sure this is basically just
  a copy of what we are doing in other tools." Agreed — this overlaps
  directly with the "use the gallery format for everything" consolidation
  already logged above (Custom Buildings Gallery section). Likely gets
  absorbed/replaced rather than kept as a separate tool once that
  consolidation happens, rather than maintained in parallel.

### Replay Miner

- User's framing: "this is more a tool for you" — i.e. this one is
  primarily useful for Claude's own investigation work (tracing content
  authors), less a thing the user needs to browse day-to-day.
- **Confirmed liked: play count and first-seen date stats.**
- **Unclear/unlabeled: the "Players seen" list.** User asked what it's
  for — it's every player who appeared in a game using that preset
  variant (the data source for tracing CrossGamer/Bezz/etc. back from
  the user's own replays). Needs a label/tooltip explaining this, since
  it's not self-evident from the UI alone.
- **Confirmed liked: the per-preset custom-unit item list** (icons,
  names, tooltips). Some items show no image — confirmed this is purely
  a gap in OUR extraction/conversion pipeline, not missing game data:
  every real in-game unit has real buildpic art (inherited from its base
  unit unless explicitly overridden), so the fix is converting the
  remaining 28 DXT-compressed icons properly (see the existing gap entry
  below), not sourcing missing art from anywhere.

### Custom Buildings Gallery

- **Confirmed liked overall, strong positive.** User: "i like the custom
  buildings gallery... this page is very helpful and i like how you have
  presented it all good work." Keep this page's presentation approach as
  the model/template for the other galleries requested above.
- **Wants a matching gallery for units** (as opposed to buildings) that
  we've made — same no-code visual format, separate page/gallery scoped
  to units specifically. Same buildings-vs-units split theme as the
  Unit Database viewer request above.
- **Bigger ask: use this same gallery format for EVERYTHING found across
  all the discovered tweaks/content so far** — not just our own
  `custom_buildings.lua`, but the full haul from the replay-mining
  project (CrossGamer, Bezz, LoH, Ambo, MGGW, Mewi, Djarshi, etc.) and
  the local replay corpus's 52-unit catalog. User: "for all the ones in
  all the tweaks we have found so far its easier for me to see like
  this." Effectively: the gallery is the preferred display pattern
  toolkit-wide for browsing any custom content, not just our own —
  should probably absorb/replace the Custom Content Catalog and parts of
  the Preset Catalog rather than existing as a separate one-off.

### Unit Database viewer

- **Split Buildings and Units into separate views** — currently mixed
  together within each faction tab; user wants them as distinct
  sections/pages, not interleaved.
- **New "Other Assets" page**: a separate page listing everything that
  isn't itself a placeable unit/building but could be used as a
  component when building a NEW unit or defense (e.g. raw
  models/effects/other reusable game assets) — a browsable reference for
  "what's available to build with," not "what's already buildable."
- **Confirmed liked: faction split** (Armada/Cortex/Legion/etc. tabs).
- **Click a unit image → show its full vanilla stats/settings**, not
  just name/icon. Same request as made earlier for the Preset Builder's
  unit grid — clicking should surface real detail, not just add-to-list.
- **Confirmed liked: the icon set itself.** User wants these exact
  converted icons (`bar-unit-database/icons-png/`) used as the visual
  asset set across the whole toolkit going forward — don't regenerate or
  swap them for a different icon source in other tools.

### Preset Catalog (now under review)

- **Confirmed liked: the sidebar preset list and naming.** Keep as-is.
- **Detail view shows raw decoded Lua code — user doesn't read code,
  wants plain English instead.** Same underlying idea as the Custom
  Content Catalog's diff view (name + build picture + what changed, in
  words) rather than a code dump. This is the core fix needed for this
  tool — replace/augment the raw-code panel with a readable summary per
  preset.
- **Bug: clicking a tweak slot collapses the sidebar list it's in.**
  User wants the list to stay expanded/visible after selecting a slot,
  so they can see which one is currently selected in context, instead of
  it collapsing away.
- **Bigger picture: wants a real graphical redesign of this tool, not
  just a plain-English text swap.** User: "i want a better graphical
  display that we will flesh out together maybe with mock ups." This is
  a joint design task to come back to (mockups first), not something to
  build solo — bigger than the plain-English fix above, which can still
  happen as an interim improvement.
- **Needs a "back to main page" button, confirmed toolkit-wide gap.**
  None of the individual tool pages link back to
  `bar-toolkit-hub/index.html` — every tool is a dead end navigation-wise
  once you're in it. Should be a standard header element added across
  every tool page, not just this one.

## Gaps found in existing tools

- **No injector for "picked" content**: `explorer.html` (preset explorer)
  and the replay-miner viewer both let you build a cross-preset "picks"
  cart and export it as JSON, but nothing actually takes that JSON and
  merges it into a working preset — you'd have to hand-write the
  `tableMerge` calls yourself. A script that turns a picks export into a
  ready-to-package `.lua` chunk (reusing `split-and-package.js`) would
  close the loop between "browse and pick" and "actually get it
  in-game."
- **New unit creator doesn't auto-detect weapon keys**: `newunit.js`'s
  generated Lua has a built-in warning that `weapondefs` overrides
  aren't auto-detected and must be verified manually against real source
  — still true, still manual every time.
- **28 icons never converted**: the DDS→PNG batch conversion
  (`bar-unit-database/icons-png/`) failed on 28 of 1495 icons
  (DXT-compressed formats, the decoder only handles uncompressed
  ARGB8888). Those units show as blank/placeholder in every visual tool.
  **Fix plan (asked about directly, 2026-08-15)**: unlike the original
  uncompressed-ARGB8888 decoder (which had to be written from scratch),
  DXT-compressed DDS is a standard, well-supported format — now that
  Python + Pillow are installed (from the map-mirroring work), Pillow
  can read DXT-compressed DDS directly with the right plugin, or the
  `nvdxt.exe`/DirectXTex tooling already on hand from the map compiler
  setup can decode it. This should be a bounded, known fix, not another
  from-scratch reverse-engineering job.
- **`check-for-updates.js` is manual-only**: detects new/changed/removed
  vanilla units since the baseline commit, but has to be run by hand —
  no way to know the unit database is stale without remembering to check.
- **`coplayers.txt` is a flat text dump**: 807 names, sent as a plain
  file. A simple searchable/sortable viewer (reusing the existing
  dark-panel UI pattern) would make it much easier to actually scan for
  familiar names instead of scrolling a .txt.
- **No changelog for `custom_buildings.lua`**: it's grown to 1000+ lines
  across many sessions with no record of what was added/changed when —
  makes it hard to tell what's new since the last live test versus
  what's been stable a while.

## Pipeline safety/quality-of-life

- **No auto-backup before writing `optionsPresets.json`**: done manually
  once before the "mark magic 11" rebuild, but `split-and-package.js`
  itself doesn't back up the live file before overwriting it — one bad
  run could silently clobber other presets. Should be built into the
  script itself, not remembered by hand each time.
- **No id-collision checker across authors**: if we ever combine content
  from multiple sources (our own + CrossGamer + Bezz, say) into one
  preset, nothing checks whether two authors' snippets define the same
  new unit id or stomp the same vanilla unit differently. Worth a
  pre-flight check before packaging anything combined.
- **No slot-budget preview**: right now the only way to know how many
  tweakdefs slots a given content file will need is to actually run
  `split-and-package.js` and read the console output. A quick
  size-estimate tool (or just a `--dry-run` flag) would let you check
  before committing to a rebuild.

## Ideas / not yet scoped

- (space for whatever comes up next)

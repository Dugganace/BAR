# BAR Scav Spawn Pool Editor

A visual editor for Beyond All Reason's scavenger (PvE zombie-horde) spawn
pools — the actual wave/tier unit lists that `scav_difficulty` and friends
scale, but which the game's modoptions system has no dial for directly.

No server, no build tooling required to *use* it — `index.html` is a static
page that loads pre-parsed data from `data.js`.

## What it does

- Loads the real spawn pool tables (`LandUnitsList`, `SeaUnitsList`,
  `AirUnitsList` — each broken down by role `Raid`/`Assault`/`Support`/
  `Healer` and anger-tier 1-7) extracted losslessly from the game's own
  `luarules/configs/scav_spawn_defs.lua`.
- Lets you edit spawn weights, remove units, and add any `*_scav` unit id
  to widen variety per tier/role.
- "Preview full file" shows the complete reconstructed Lua file — your
  edited tables spliced back into the *unmodified* original file text (all
  the difficulty-scaling math, Turrets, squad-assembly logic, etc. stay
  byte-identical to stock).
- "Export scav_spawn_defs.lua" downloads that reconstructed file, ready to
  drop into a mutator's `luarules/configs/scav_spawn_defs.lua` to override
  the stock one via BAR's VFS.
- Edits autosave to `localStorage` (key `bar-scav-editor-state-v1`) so a
  reload doesn't lose your work. "Reset to original" clears them.

## Running it

Just open `index.html` directly, or serve the folder statically:

```bash
node -e "require('http').createServer((req,res)=>{const fs=require('fs'),path=require('path');let p=path.join(__dirname,req.url==='/'?'/index.html':req.url);fs.readFile(p,(e,d)=>{if(e){res.writeHead(404);res.end();return}res.writeHead(200,{'Content-Type':path.extname(p)==='.js'?'text/javascript':'text/html'});res.end(d)})}).listen(8934)"
```

then visit `http://localhost:8934`.

## Refreshing the source data

`data.js` is generated, not hand-written. If `reference/scav_spawn_defs.lua`
is updated (e.g. a new BAR patch changes the file), regenerate it with:

```bash
node tools/build-data.js
```

This re-parses `LandUnitsList`/`SeaUnitsList`/`AirUnitsList` by brace-matching
(comment-aware) rather than by full Lua parsing, so it's robust to comment
and whitespace changes but assumes those three tables keep their current
`Role[Tier] = { unitId = weight, ... }` shape.

## Known limitations / next steps

- Only the three unit-pool tables are editable. `Turrets`, `BurrowUnitsList`,
  `tierConfiguration`, `difficultyParameters`, and the squad-assembly system
  (`addNewSquad`, `squadSpawnOptionsTable`) are untouched — those control
  *when/how much* spawns, not *what* spawns, and are a reasonable next
  editor surface if we want more control than just variety.
- No validation that an added `*_scav` unit id actually exists in the game's
  unit defs — a typo will silently produce a dead entry in-game rather than
  an error here. Cross-referencing against a real unit id list is a good
  follow-up.
- No packaging/install step yet — the exported file needs to be manually
  placed into a mutator archive with a `modinfo.lua` for BAR to load it as
  an override. That packaging workflow is not built yet.

--Quad Pharos pick by MGGW DJ did some fix.... convertersize/afusmul = out.
local mods = Spring.GetModOptions()
local uDefs = UnitDefs or {}
local cps = 'customparams'
local fds = 'featuredefs'
local wds = 'weapondefs'
local wpn = 'weapons'
local aACons = {'armaca','armack','armacv','armacsub','armoc'} --oc Orbital Constructor from Space Mod
local cACons = {'coraca','corack','coracv','coracsub','coroc'}
local lACons = {'legaca','legack','legacv','legoc'}
local allBOs = {}

local hasLegion = mods.experimentallegionfaction
local hasScavs = mods.scavunitsforplayers
local hasExtras = mods.experimentalextraunits
local hasHoverTide = mods.map_lavatiderhythm == 'enabled' and mods.map_lavalowlevel == 0

local noLRPC = mods.unit_restrictions_nolrpc
local noLOLCannon = mods.unit_restrictions_noendgamelrpc
local noPawnLauncher = noLOLCannon or true --TODO Pawn Bounce Thug Battery etc...
local noNukes = mods.unit_restrictions_nonukes
local noTacs = mods.unit_restrictions_notacnukes
local noSea = mods.map_waterislava
local noAir = mods.unit_restrictions_noair

local removeExcess = true --Delete unpopular units to reduce constructor pages.

local tweakPilum = true
local tweakBehemoth = true
local tweakReclaim = true
local tweakWrecks = true
local tweakMini = true
local tweakQuadLT = true
local tweakLegEpic = true
local tweakEcoT3 = true
local tweakBBT = true

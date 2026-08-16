-- Djarshi -- content pulled from public BAR replays (bar-replay-miner global scan, 2026-08-15)
-- 1 distinct snippet(s), 6 total occurrences across scanned games

-- === "--Concept by Djarshi / Txpera" (seen 6x) ===
--Concept by Djarshi / Txpera
local mods = Spring.GetModOptions()
local uDefs = UnitDefs or {}
local cps = 'customparams'
local aACons = {'armaca','armack','armacv','armacsub'}
local cACons = {'coraca','corack','coracv','coracsub'}
local lACons = {'legaca','legack','legacv'}

local noSea = mods.map_waterislava

local tweakT3Nano = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function extrapolate(t1, t2)
	return round10(t2 * (t2 / t1))
end

local function unwater(id)
	local def = UnitDefs[id]
	if def then
		def.minwaterdepth = -1000000
		def.maxwaterdepth = 0
	end
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function addBOArr(conIDs, id)
	for i = 1, #conIDs do
		addBO(conIDs[i], id)
	end
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end


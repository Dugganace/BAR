-- Custom Buildings: Economy / Defense / Production / Utility, x Armada/Cortex/Legion + a Raptor-flavored one
-- Pattern: clone an existing building with table.merge, override stats/name, then
-- append the new unit id into the relevant commander's buildoptions so every
-- player in the lobby can build it immediately (no extra install needed --
-- this whole file is meant to be pasted into a modoption tweakdefs slot).

local unitDefs, tableMerge = UnitDefs or {}, table.merge

local function addBuildOption(commanderId, newUnitId)
	local commander = unitDefs[commanderId]
	if not commander then return end
	if not commander.buildoptions then commander.buildoptions = {} end
	table.insert(commander.buildoptions, newUnitId)
end

-- Commander unit variants: BAR lets players pick different starting
-- commander subtypes (economy/offense/T2 focused), and this preset has
-- evocom=1 (Evolving Commanders) enabled, meaning a commander's unit id
-- literally changes as it levels up mid-match (armcomlvl2, armcomlvl3...).
-- All of these are DIFFERENT unitDefs entries, not the same one -- a
-- buildoptions edit on the base id alone misses every variant/level.
-- Patch all of them so build access doesn't depend on which commander
-- subtype or level a player happens to be using.
local armComVariants = { 'armcom', 'armcomcon', 'armcomnew', 'armcomlvl2', 'armcomlvl3', 'armcomlvl4', 'armcomlvl5', 'armcomlvl6', 'armcomlvl7', 'armcomlvl8', 'armcomlvl9', 'armcomlvl10' }
local corComVariants = { 'corcom', 'corcomcon', 'corcomlvl2', 'corcomlvl3', 'corcomlvl4', 'corcomlvl5', 'corcomlvl6', 'corcomlvl7', 'corcomlvl8', 'corcomlvl9', 'corcomlvl10' }
local legComVariants = { 'legcom', 'legcomecon', 'legcomoff', 'legcomt2com', 'legcomt2def', 'legcomt2off', 'legcomlvl2', 'legcomlvl3', 'legcomlvl4', 'legcomlvl5', 'legcomlvl6', 'legcomlvl7', 'legcomlvl8', 'legcomlvl9', 'legcomlvl10' }

local function addBuildOptionAll(variantList, newUnitId)
	for _, id in ipairs(variantList) do
		addBuildOption(id, newUnitId)
	end
end

----------------------------------------------------------------------------------------------
-- UTILITY: Support Relay -- long-range assist/repair building, bigger radius than nanotc
----------------------------------------------------------------------------------------------

unitDefs.armsupportrelay = tableMerge(unitDefs['armnanotc'], {
	name = 'Support Relay',
	unitname = 'armsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 900,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret with a much larger radius than the standard construction turret.',
	},
})

unitDefs.corsupportrelay = tableMerge(unitDefs['cornanotc'], {
	name = 'Support Relay',
	unitname = 'corsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 900,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret with a much larger radius than the standard construction turret.',
	},
})

unitDefs.legsupportrelay = tableMerge(unitDefs['legnanotc'], {
	name = 'Support Relay',
	unitname = 'legsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 900,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret with a much larger radius than the standard construction turret.',
	},
})

----------------------------------------------------------------------------------------------
-- RAPTOR-FLAVORED: Bio Reactor -- salvaged-tech economy building, same slot as the
-- "Portable Fusion Reactor" trick used elsewhere in this preset (clones a lootbox
-- building shell so it has a valid buildpic/model without needing new art assets)
----------------------------------------------------------------------------------------------

if unitDefs['lootboxgold'] then
	unitDefs.raptorbioreactor = tableMerge(unitDefs['lootboxgold'], {
		name = 'Raptor Bio-Reactor',
		unitname = 'raptorbioreactor',
		metalcost = 9800,
		energycost = 48000,
		buildtime = 240000,
		energymake = 2800,
		energystorage = 6000,
		metalmake = 0,
		health = 11000,
		reclaimable = true,
		sightdistance = 273,
		yardmap = "oooooooooooooooooo",
		customparams = {
			i18n_en_humanname = 'Raptor Bio-Reactor',
			i18n_en_tooltip = 'Salvaged Raptor bio-tech energy building. Produces 2800 energy.',
			removestop = true,
			removewait = true,
			techlevel = 3,
		},
	})
end

----------------------------------------------------------------------------------------------
-- Wire everything into the commanders' buildoptions so it's immediately buildable
----------------------------------------------------------------------------------------------

addBuildOptionAll(armComVariants, 'armbull_heavy')
addBuildOptionAll(armComVariants, 'armdepawner')
addBuildOptionAll(armComVariants, 'armllt_rapid')
addBuildOptionAll(armComVariants, 'armhyperreactor')
addBuildOptionAll(armComVariants, 'armbulwark')
addBuildOptionAll(armComVariants, 'armllt_hp')
addBuildOptionAll(armComVariants, 'armllt_armored')
addBuildOptionAll(armComVariants, 'arminterceptor_artillery')
addBuildOptionAll(armComVariants, 'arminterceptor_energy')
addBuildOptionAll(armComVariants, 'armbarrier_bronze')
addBuildOptionAll(armComVariants, 'armbarrier_silver')
addBuildOptionAll(armComVariants, 'armbarrier_gold')
addBuildOptionAll(armComVariants, 'armassemblycomplex')
addBuildOptionAll(armComVariants, 'armsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOptionAll(armComVariants, 'raptorbioreactor') end

addBuildOptionAll(corComVariants, 'corgol_heavy')
addBuildOptionAll(corComVariants, 'cordepawner')
addBuildOptionAll(corComVariants, 'corllt_rapid')
addBuildOptionAll(corComVariants, 'corhyperreactor')
addBuildOptionAll(corComVariants, 'corbulwark')
addBuildOptionAll(corComVariants, 'corllt_hp')
addBuildOptionAll(corComVariants, 'corllt_armored')
addBuildOptionAll(corComVariants, 'corinterceptor_artillery')
addBuildOptionAll(corComVariants, 'corinterceptor_energy')
addBuildOptionAll(corComVariants, 'corbarrier_bronze')
addBuildOptionAll(corComVariants, 'corbarrier_silver')
addBuildOptionAll(corComVariants, 'corbarrier_gold')
addBuildOptionAll(corComVariants, 'corassemblycomplex')
addBuildOptionAll(corComVariants, 'corsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOptionAll(corComVariants, 'raptorbioreactor') end

addBuildOptionAll(legComVariants, 'leginc_heavy')
addBuildOptionAll(legComVariants, 'legdepawner')
addBuildOptionAll(legComVariants, 'leglht_rapid')
addBuildOptionAll(legComVariants, 'leghyperreactor')
addBuildOptionAll(legComVariants, 'legbulwark')
addBuildOptionAll(legComVariants, 'leglht_hp')
addBuildOptionAll(legComVariants, 'leglht_armored')
addBuildOptionAll(legComVariants, 'leginterceptor_artillery')
addBuildOptionAll(legComVariants, 'leginterceptor_energy')
addBuildOptionAll(legComVariants, 'legbarrier_bronze')
addBuildOptionAll(legComVariants, 'legbarrier_silver')
addBuildOptionAll(legComVariants, 'legbarrier_gold')
addBuildOptionAll(legComVariants, 'legassemblycomplex')
addBuildOptionAll(legComVariants, 'legsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOptionAll(legComVariants, 'raptorbioreactor') end

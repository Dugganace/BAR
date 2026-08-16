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

addBuildOption('armcom', 'armbull_heavy')
addBuildOption('armcom', 'armdepawner')
addBuildOption('armcom', 'armllt_rapid')
addBuildOption('armcom', 'armhyperreactor')
addBuildOption('armcom', 'armbulwark')
addBuildOption('armcom', 'armllt_hp')
addBuildOption('armcom', 'armllt_armored')
addBuildOption('armcom', 'arminterceptor_artillery')
addBuildOption('armcom', 'arminterceptor_energy')
addBuildOption('armcom', 'armbarrier_bronze')
addBuildOption('armcom', 'armbarrier_silver')
addBuildOption('armcom', 'armbarrier_gold')
addBuildOption('armcom', 'armassemblycomplex')
addBuildOption('armcom', 'armsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('armcom', 'raptorbioreactor') end

addBuildOption('corcom', 'corgol_heavy')
addBuildOption('corcom', 'cordepawner')
addBuildOption('corcom', 'corllt_rapid')
addBuildOption('corcom', 'corhyperreactor')
addBuildOption('corcom', 'corbulwark')
addBuildOption('corcom', 'corllt_hp')
addBuildOption('corcom', 'corllt_armored')
addBuildOption('corcom', 'corinterceptor_artillery')
addBuildOption('corcom', 'corinterceptor_energy')
addBuildOption('corcom', 'corbarrier_bronze')
addBuildOption('corcom', 'corbarrier_silver')
addBuildOption('corcom', 'corbarrier_gold')
addBuildOption('corcom', 'corassemblycomplex')
addBuildOption('corcom', 'corsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('corcom', 'raptorbioreactor') end

addBuildOption('legcom', 'leginc_heavy')
addBuildOption('legcom', 'legdepawner')
addBuildOption('legcom', 'leglht_rapid')
addBuildOption('legcom', 'leghyperreactor')
addBuildOption('legcom', 'legbulwark')
addBuildOption('legcom', 'leglht_hp')
addBuildOption('legcom', 'leglht_armored')
addBuildOption('legcom', 'leginterceptor_artillery')
addBuildOption('legcom', 'leginterceptor_energy')
addBuildOption('legcom', 'legbarrier_bronze')
addBuildOption('legcom', 'legbarrier_silver')
addBuildOption('legcom', 'legbarrier_gold')
addBuildOption('legcom', 'legassemblycomplex')
addBuildOption('legcom', 'legsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('legcom', 'raptorbioreactor') end

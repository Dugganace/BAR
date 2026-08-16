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
-- ECONOMY: Hyper Reactor -- a T4-tier fusion reactor, ~4x a stock fusion's output/cost
----------------------------------------------------------------------------------------------

unitDefs.armhyperreactor = tableMerge(unitDefs['armfus'], {
	name = 'Hyper Reactor',
	unitname = 'armhyperreactor',
	metalcost = 24000,
	energycost = 340000,
	buildtime = 260000,
	health = 9000,
	energymake = 3000,
	energystorage = 4000,
	customparams = {
		i18n_en_humanname = 'Hyper Reactor',
		i18n_en_tooltip = 'Massively upscaled Fusion Reactor. Produces 3000 energy.',
		techlevel = 4,
	},
})

unitDefs.corhyperreactor = tableMerge(unitDefs['corfus'], {
	name = 'Hyper Reactor',
	unitname = 'corhyperreactor',
	metalcost = 24000,
	energycost = 340000,
	buildtime = 260000,
	health = 9000,
	energymake = 3300,
	energystorage = 4000,
	customparams = {
		i18n_en_humanname = 'Hyper Reactor',
		i18n_en_tooltip = 'Massively upscaled Fusion Reactor. Produces 3300 energy.',
		techlevel = 4,
	},
})

unitDefs.leghyperreactor = tableMerge(unitDefs['legfus'], {
	name = 'Hyper Reactor',
	unitname = 'leghyperreactor',
	metalcost = 24000,
	energycost = 340000,
	buildtime = 260000,
	health = 9000,
	energymake = 3600,
	energystorage = 4000,
	customparams = {
		i18n_en_humanname = 'Hyper Reactor',
		i18n_en_tooltip = 'Massively upscaled Fusion Reactor. Produces 3600 energy.',
		techlevel = 4,
	},
})

----------------------------------------------------------------------------------------------
-- DEFENSE: Bulwark Tower -- a heavier area-control turret than the stock hlt/lht
----------------------------------------------------------------------------------------------

unitDefs.armbulwark = tableMerge(unitDefs['armhlt'], {
	name = 'Bulwark Tower',
	unitname = 'armbulwark',
	metalcost = 3400,
	energycost = 42000,
	buildtime = 38000,
	health = 7200,
	customparams = {
		i18n_en_humanname = 'Bulwark Tower',
		i18n_en_tooltip = 'Heavy area-control defense tower, tougher and harder-hitting than the standard laser tower.',
	},
	weapondefs = {
		laser = {
			range = 780,
			reloadtime = 1.4,
			damage = { default = 480 },
		},
	},
})

unitDefs.corbulwark = tableMerge(unitDefs['corhlt'], {
	name = 'Bulwark Tower',
	unitname = 'corbulwark',
	metalcost = 3400,
	energycost = 42000,
	buildtime = 38000,
	health = 7200,
	customparams = {
		i18n_en_humanname = 'Bulwark Tower',
		i18n_en_tooltip = 'Heavy area-control defense tower, tougher and harder-hitting than the standard laser tower.',
	},
	weapondefs = {
		laser = {
			range = 780,
			reloadtime = 1.4,
			damage = { default = 480 },
		},
	},
})

unitDefs.legbulwark = tableMerge(unitDefs['leglht'], {
	name = 'Bulwark Tower',
	unitname = 'legbulwark',
	metalcost = 3400,
	energycost = 42000,
	buildtime = 38000,
	health = 7200,
	customparams = {
		i18n_en_humanname = 'Bulwark Tower',
		i18n_en_tooltip = 'Heavy area-control defense tower, tougher and harder-hitting than the standard heat ray tower.',
	},
})

----------------------------------------------------------------------------------------------
-- PRODUCTION: Assembly Complex -- a beefed-up vehicle plant, faster build speed
----------------------------------------------------------------------------------------------

unitDefs.armassemblycomplex = tableMerge(unitDefs['armvp'], {
	name = 'Assembly Complex',
	unitname = 'armassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

unitDefs.corassemblycomplex = tableMerge(unitDefs['corvp'], {
	name = 'Assembly Complex',
	unitname = 'corassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

unitDefs.legassemblycomplex = tableMerge(unitDefs['legvp'], {
	name = 'Assembly Complex',
	unitname = 'legassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

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

addBuildOption('armcom', 'armhyperreactor')
addBuildOption('armcom', 'armbulwark')
addBuildOption('armcom', 'armassemblycomplex')
addBuildOption('armcom', 'armsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('armcom', 'raptorbioreactor') end

addBuildOption('corcom', 'corhyperreactor')
addBuildOption('corcom', 'corbulwark')
addBuildOption('corcom', 'corassemblycomplex')
addBuildOption('corcom', 'corsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('corcom', 'raptorbioreactor') end

addBuildOption('legcom', 'leghyperreactor')
addBuildOption('legcom', 'legbulwark')
addBuildOption('legcom', 'legassemblycomplex')
addBuildOption('legcom', 'legsupportrelay')
if unitDefs['raptorbioreactor'] then addBuildOption('legcom', 'raptorbioreactor') end

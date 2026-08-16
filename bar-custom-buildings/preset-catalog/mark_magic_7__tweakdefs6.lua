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
-- DEFENSE: Interceptors -- point-defense that genuinely shoots down incoming
-- projectiles via the engine's interceptor/targetable weapon flags (the same
-- mechanic stock anti-nuke silos use). Two versions per faction:
--   Artillery: missile-based interceptor cloned from the stock anti-nuke silo
--     (armamd/corfmd/legabm) -- stockpiled rockets, wide coverage, tuned down
--     in cost/buildtime from "endgame anti-nuke only" to "usable area defense".
--   Energy: instant-hit beam interceptor cloned from the heavy laser tower
--     shell -- no stockpile, always ready, shorter range, fires constantly.
-- Both only intercept weapons the *attacker* has flagged targetable=1 (in
-- stock BAR that's nukes, LRPC, and other stockpile/starburst missiles --
-- normal hitscan lasers and direct-fire cannon shells aren't interceptable
-- by the engine, since they're not flagged as such by their own weapondefs).
----------------------------------------------------------------------------------------------

unitDefs.arminterceptor_artillery = tableMerge(unitDefs['armamd'], {
	name = 'Artillery Interceptor',
	unitname = 'arminterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		amd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.corinterceptor_artillery = tableMerge(unitDefs['corfmd'], {
	name = 'Artillery Interceptor',
	unitname = 'corinterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		fmd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.leginterceptor_artillery = tableMerge(unitDefs['legabm'], {
	name = 'Artillery Interceptor',
	unitname = 'leginterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		fmd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.arminterceptor_energy = tableMerge(unitDefs['armhlt'], {
	name = 'Energy Interceptor',
	unitname = 'arminterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		arm_laserh1 = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			energypershot = 120,
			damage = { default = 3000, commanders = 3000, vtol = 3000 },
		},
	},
})

unitDefs.corinterceptor_energy = tableMerge(unitDefs['corhlt'], {
	name = 'Energy Interceptor',
	unitname = 'corinterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		cor_laserh1 = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			energypershot = 120,
			damage = { default = 3000, commanders = 3000, vtol = 3000 },
		},
	},
})

unitDefs.leginterceptor_energy = tableMerge(unitDefs['leglht'], {
	name = 'Energy Interceptor',
	unitname = 'leginterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		heat_ray = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			damage = { default = 3000 },
		},
	},
})

----------------------------------------------------------------------------------------------
-- UTILITY: Barrier -- a large inert obstacle/pathing blocker, reskinned as a
-- repurposed husk rather than a purpose-built Dragon's Teeth shape (reuses the
-- game's own existing wreck art -- no new assets needed). Comes in three tiers
-- of health/durability/cost -- Bronze/Silver/Gold -- each visually a bigger
-- wreck to match: Bronze reuses a light laser tower's wreck, Silver a fusion
-- reactor's, Gold a commander's. Same inert-blocker mechanics underneath as
-- armdrag/cordrag/legdrag (blocking=true, canattack=false) throughout.
----------------------------------------------------------------------------------------------

local barrierTiers = {
	{ suffix = 'bronze', label = 'Barrier (Bronze)', wreckSuffix = 'llt_dead', metalcost = 150, buildtime = 1400, health = 8000, crushresistance = 700 },
	{ suffix = 'silver', label = 'Barrier (Silver)', wreckSuffix = 'fus_dead', metalcost = 260, buildtime = 2200, health = 14000, crushresistance = 1200 },
	{ suffix = 'gold', label = 'Barrier (Gold)', wreckSuffix = 'com_dead', metalcost = 400, buildtime = 3200, health = 22000, crushresistance = 1800 },
}

local function buildBarrierTier(factionPrefix, dragUnitId, tier)
	local unitId = factionPrefix .. 'barrier_' .. tier.suffix
	unitDefs[unitId] = tableMerge(unitDefs[dragUnitId], {
		name = tier.label,
		unitname = unitId,
		objectname = 'Units/' .. factionPrefix .. tier.wreckSuffix .. '.s3o',
		metalcost = tier.metalcost,
		energycost = 0,
		buildtime = tier.buildtime,
		health = tier.health,
		crushresistance = tier.crushresistance,
		footprintx = 4,
		footprintz = 4,
		yardmap = "ffffffffffffffff",
		customparams = {
			i18n_en_humanname = tier.label,
			i18n_en_tooltip = 'A repurposed battlefield husk, reinforced as a large inert obstacle (' .. tier.label .. ' tier). Cannot attack -- just blocks movement.',
			paralyzemultiplier = 0,
			removestop = true,
			removewait = true,
		},
	})
	return unitId
end

for _, tier in ipairs(barrierTiers) do
	buildBarrierTier('arm', 'armdrag', tier)
	buildBarrierTier('cor', 'cordrag', tier)
	buildBarrierTier('leg', 'legdrag', tier)
end


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

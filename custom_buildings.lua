-- Custom Buildings: clone existing units with table.merge, override stats,
-- append into the relevant commander's buildoptions (tweakdefs slot content).

local unitDefs, tableMerge = UnitDefs or {}, table.merge

local function addBuildOption(commanderId, newUnitId)
	local commander = unitDefs[commanderId]
	if not commander then return end
	if not commander.buildoptions then commander.buildoptions = {} end
	table.insert(commander.buildoptions, newUnitId)
end

-- Every commander subtype/evo-level id (evocom=1 means armcom becomes
-- armcomlvl2/3/... as separate unitDefs entries) -- patch all of them.
local armComVariants = { 'armcom', 'armcomcon', 'armcomnew', 'armcomlvl2', 'armcomlvl3', 'armcomlvl4', 'armcomlvl5', 'armcomlvl6', 'armcomlvl7', 'armcomlvl8', 'armcomlvl9', 'armcomlvl10' }
local corComVariants = { 'corcom', 'corcomcon', 'corcomlvl2', 'corcomlvl3', 'corcomlvl4', 'corcomlvl5', 'corcomlvl6', 'corcomlvl7', 'corcomlvl8', 'corcomlvl9', 'corcomlvl10' }
local legComVariants = { 'legcom', 'legcomecon', 'legcomoff', 'legcomt2com', 'legcomt2def', 'legcomt2off', 'legcomlvl2', 'legcomlvl3', 'legcomlvl4', 'legcomlvl5', 'legcomlvl6', 'legcomlvl7', 'legcomlvl8', 'legcomlvl9', 'legcomlvl10' }

local function addBuildOptionAll(variantList, newUnitId)
	for _, id in ipairs(variantList) do
		addBuildOption(id, newUnitId)
	end
end

------------------------------
-- MOBILE UNITS: The Bull / The Dozer / The Beamer -- one slow, heavy unit per
-- faction, single weapon, reskinned as a high-damage/slow-fire-rate laser.
-- Armada: cloned from armbull (already named "Bull" in the base game --
--   Heavy Assault Tank), its stock cannon converted to a beam laser.
-- Cortex: cloned from corgol ("Tzar", Very Heavy Assault Tank) -- corjugg was
--   considered but it's actually a 4-weapon T4 gantry superweapon, not a
--   simple single-weapon heavy, so corgol is the honest match here. Its
--   stock cannon converted to a beam laser too.
-- Legion: cloned from leginc ("(barely) Mobile Heavy Heat Ray") -- already a
--   single beam-laser weapon, just retuned from its stock rapid-pulse
--   (0.033s reload) into one slow, hard-hitting beam.
------------------------------

unitDefs.armbull_heavy = tableMerge(unitDefs['armbull'], {
	name = 'The Bull',
	unitname = 'armbull_heavy',
	metalcost = 2200,
	energycost = 30000,
	buildtime = 48000,
	health = 7200,
	speed = 32,
	customparams = {
		i18n_en_humanname = 'The Bull',
		i18n_en_tooltip = 'Slow heavy assault unit. High-damage, slow-firing laser.',
	},
	weapondefs = {
		arm_bull = {
			weapontype = 'BeamLaser',
			range = 650,
			reloadtime = 3.6,
			beamtime = 0.3,
			damage = { default = 1900, commanders = 2850, subs = 200, vtol = 60 },
		},
	},
})

unitDefs.corgol_heavy = tableMerge(unitDefs['corgol'], {
	name = 'The Dozer',
	unitname = 'corgol_heavy',
	metalcost = 2300,
	energycost = 31000,
	buildtime = 50000,
	health = 8200,
	speed = 30,
	customparams = {
		i18n_en_humanname = 'The Dozer',
		i18n_en_tooltip = 'Slow heavy assault unit. High-damage, slow-firing laser.',
	},
	weapondefs = {
		cor_gol = {
			weapontype = 'BeamLaser',
			range = 650,
			reloadtime = 3.6,
			beamtime = 0.3,
			damage = { default = 1900, commanders = 2850, subs = 200, vtol = 60 },
		},
	},
})

unitDefs.leginc_heavy = tableMerge(unitDefs['leginc'], {
	name = 'The Beamer',
	unitname = 'leginc_heavy',
	metalcost = 2100,
	energycost = 29000,
	buildtime = 46000,
	health = 7600,
	speed = 26,
	customparams = {
		i18n_en_humanname = 'The Beamer',
		i18n_en_tooltip = 'Slow heavy assault unit. High-damage, slow-firing laser.',
	},
	weapondefs = {
		heatraylarge = {
			range = 725,
			reloadtime = 3.4,
			beamtime = 0.3,
			damage = { default = 1850, commanders = 900, vtol = 55 },
		},
	},
})

------------------------------
-- DEFENSE: The Depawner -- intercepts the Scavenger Pawn Launcher's shell
-- (armbotrail/arm_botrail) via the engine's targetable/interceptor bitmask
-- pair, so the Pawn never spawns on impact.
------------------------------

-- Bit 128 chosen to avoid colliding with the vanilla nuke (1) / typical
-- anti-air missile (2) interceptor conventions.
local PAWN_INTERCEPT_FLAG = 128
if unitDefs['armbotrail'] then
	unitDefs.armbotrail = tableMerge(unitDefs['armbotrail'], {
		weapondefs = {
			arm_botrail = { targetable = PAWN_INTERCEPT_FLAG },
		},
	})
end

unitDefs.armdepawner = tableMerge(unitDefs['armflak'], {
	name = 'The Depawner',
	unitname = 'armdepawner',
	metalcost = 1250,
	energycost = 22000,
	buildtime = 26000,
	health = 2300,
	customparams = {
		i18n_en_humanname = 'The Depawner',
		i18n_en_tooltip = 'Shoots down the Pawn Launcher\'s shell in flight -- if it connects, the Pawn never spawns.',
	},
	weapondefs = {
		armflak_gun = {
			range = 1400,
			reloadtime = 0.35,
			interceptor = PAWN_INTERCEPT_FLAG,
			coverageRange = 1400,
		},
	},
})

unitDefs.cordepawner = tableMerge(unitDefs['corflak'], {
	name = 'The Depawner',
	unitname = 'cordepawner',
	metalcost = 1250,
	energycost = 22000,
	buildtime = 26000,
	health = 2300,
	customparams = {
		i18n_en_humanname = 'The Depawner',
		i18n_en_tooltip = 'Shoots down the Pawn Launcher\'s shell in flight -- if it connects, the Pawn never spawns.',
	},
	weapondefs = {
		armflak_gun = {
			range = 1400,
			reloadtime = 0.35,
			interceptor = PAWN_INTERCEPT_FLAG,
			coverageRange = 1400,
		},
	},
})

unitDefs.legdepawner = tableMerge(unitDefs['legflak'], {
	name = 'The Depawner',
	unitname = 'legdepawner',
	metalcost = 1250,
	energycost = 22000,
	buildtime = 26000,
	health = 2300,
	customparams = {
		i18n_en_humanname = 'The Depawner',
		i18n_en_tooltip = 'Shoots down the Pawn Launcher\'s shell in flight -- if it connects, the Pawn never spawns.',
	},
	weapondefs = {
		leg_t2_microflak = {
			range = 1400,
			reloadtime = 0.35,
			interceptor = PAWN_INTERCEPT_FLAG,
			coverageRange = 1400,
		},
	},
})

------------------------------
-- DEFENSE: Rapid Fire Tower -- high energy requirement, low per-shot damage,
-- very high fire rate. Anti-swarm role: bad against single tough targets,
-- excellent DPS against many small units. Cloned from the light laser tower.
------------------------------

unitDefs.armllt_rapid = tableMerge(unitDefs['armllt'], {
	name = 'Rapid Fire Tower',
	unitname = 'armllt_rapid',
	metalcost = 140,
	energycost = 1600,
	buildtime = 3200,
	health = 680,
	customparams = {
		i18n_en_humanname = 'Rapid Fire Tower',
		i18n_en_tooltip = 'Rapid-fire anti-swarm turret. Weak vs single targets.',
	},
	weapondefs = {
		arm_lightlaser = {
			areaofeffect = 40,
			reloadtime = 0.1,
			energypershot = 55,
			damage = { default = 22, commanders = 33, subs = 2, vtol = 2 },
		},
	},
})

unitDefs.corllt_rapid = tableMerge(unitDefs['corllt'], {
	name = 'Rapid Fire Tower',
	unitname = 'corllt_rapid',
	metalcost = 145,
	energycost = 1650,
	buildtime = 3300,
	health = 710,
	customparams = {
		i18n_en_humanname = 'Rapid Fire Tower',
		i18n_en_tooltip = 'Rapid-fire anti-swarm turret. Weak vs single targets.',
	},
	weapondefs = {
		cor_lightlaser = {
			areaofeffect = 40,
			reloadtime = 0.1,
			energypershot = 55,
			damage = { default = 22, commanders = 33, subs = 2, vtol = 2 },
		},
	},
})

unitDefs.leglht_rapid = tableMerge(unitDefs['leglht'], {
	name = 'Rapid Fire Tower',
	unitname = 'leglht_rapid',
	metalcost = 115,
	energycost = 1300,
	buildtime = 3000,
	health = 610,
	customparams = {
		i18n_en_humanname = 'Rapid Fire Tower',
		i18n_en_tooltip = 'Rapid-fire anti-swarm turret. Weak vs single targets.',
	},
	weapondefs = {
		heat_ray = {
			areaofeffect = 30,
			reloadtime = 0.25,
			damage = { default = 55 },
		},
	},
})

------------------------------
-- ECONOMY: Hyper Reactor -- a T4-tier fusion reactor, ~4x a stock fusion's output/cost
------------------------------

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

------------------------------
-- DEFENSE: Bulwark Tower -- a heavier area-control turret than the stock hlt/lht
------------------------------

unitDefs.armbulwark = tableMerge(unitDefs['armhlt'], {
	name = 'Bulwark Tower',
	unitname = 'armbulwark',
	metalcost = 3400,
	energycost = 42000,
	buildtime = 38000,
	health = 7200,
	customparams = {
		i18n_en_humanname = 'Bulwark Tower',
		i18n_en_tooltip = 'Heavy area-control tower. Tougher, harder-hitting.',
	},
	weapondefs = {
		arm_laserh1 = {
			range = 780,
			reloadtime = 1.4,
			damage = { default = 480, commanders = 720, vtol = 45 },
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
		i18n_en_tooltip = 'Heavy area-control tower. Tougher, harder-hitting.',
	},
	weapondefs = {
		cor_laserh1 = {
			range = 780,
			reloadtime = 1.4,
			damage = { default = 480, commanders = 720, vtol = 45 },
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
		i18n_en_tooltip = 'Heavy area-control tower. Tougher, harder-hitting.',
	},
	weapondefs = {
		heat_ray = {
			range = 780,
			reloadtime = 1.1,
			damage = { default = 640 },
		},
	},
})

------------------------------
-- DEFENSE: High Power Laser Tower -- a new "High Power" line of laser defenses.
-- Cloned from the light laser tower per faction (armllt/corllt/leglht -- Legion's
-- "leglht" is itself the light-tier heat ray tower, matching the other two's tier).
-- More expensive to build (metal/energy), more expensive to fire (energypershot,
-- i.e. costs more energy to *run*), longer range, and roughly 2.5x the damage.
------------------------------

unitDefs.armllt_hp = tableMerge(unitDefs['armllt'], {
	name = 'High Power Laser Tower',
	unitname = 'armllt_hp',
	metalcost = 255,
	energycost = 2380,
	buildtime = 6000,
	health = 930,
	customparams = {
		i18n_en_humanname = 'High Power Laser Tower',
		i18n_en_tooltip = 'High-cost laser tower: longer range, far more damage.',
	},
	weapondefs = {
		arm_lightlaser = {
			range = 688,
			energypershot = 80,
			damage = { default = 187.5, commanders = 281, subs = 12.5, vtol = 12.5 },
		},
	},
})

unitDefs.corllt_hp = tableMerge(unitDefs['corllt'], {
	name = 'High Power Laser Tower',
	unitname = 'corllt_hp',
	metalcost = 270,
	energycost = 2450,
	buildtime = 6250,
	health = 975,
	customparams = {
		i18n_en_humanname = 'High Power Laser Tower',
		i18n_en_tooltip = 'High-cost laser tower: longer range, far more damage.',
	},
	weapondefs = {
		cor_lightlaser = {
			range = 696,
			energypershot = 80,
			damage = { default = 187.5, commanders = 281, subs = 12.5, vtol = 12.5 },
		},
	},
})

unitDefs.leglht_hp = tableMerge(unitDefs['leglht'], {
	name = 'High Power Laser Tower',
	unitname = 'leglht_hp',
	metalcost = 210,
	energycost = 1925,
	buildtime = 5500,
	health = 825,
	customparams = {
		i18n_en_humanname = 'High Power Laser Tower',
		i18n_en_tooltip = 'High-cost heat ray tower: longer range, far more damage.',
	},
	weapondefs = {
		heat_ray = {
			range = 688,
			energypershot = 70,
			damage = { default = 500 },
		},
	},
})

------------------------------
-- DEFENSE: Armored Tower -- more health, more metal cost, and actual damage
-- mitigation (not just a bigger HP pool) via a small always-on self-shield
-- covering just the tower itself -- same shield mechanic this preset already
-- uses for the Umbrella Mk II, just scaled down to a passive personal shield.
------------------------------

local function addSelfShield(def, power, radius, powerRegen)
	def.weapondefs = def.weapondefs or {}
	def.weapondefs.selfshield = {
		weapontype = "Shield",
		shield = {
			alpha = 0.15,
			armortype = "shields",
			exterior = true,
			energyupkeep = 6,
			force = 0,
			interceptType = 1,
			power = power,
			powerregen = powerRegen,
			powerregenenergy = powerRegen * 10,
			radius = radius,
			repulser = false,
			smart = true,
			startingpower = power,
			visiblerepulse = false,
		},
	}
	def.weapons = def.weapons or {}
	table.insert(def.weapons, { def = "SELFSHIELD", onlytargetcategory = "NOTSUB" })
	return def
end

unitDefs.armllt_armored = addSelfShield(tableMerge(unitDefs['armllt'], {
	name = 'Armored Tower',
	unitname = 'armllt_armored',
	metalcost = 215,
	energycost = 900,
	buildtime = 3600,
	health = 1860,
	customparams = {
		i18n_en_humanname = 'Armored Tower',
		i18n_en_tooltip = 'Armored laser tower: more health plus a personal shield.',
	},
}), 700, 62, 25)

unitDefs.corllt_armored = addSelfShield(tableMerge(unitDefs['corllt'], {
	name = 'Armored Tower',
	unitname = 'corllt_armored',
	metalcost = 225,
	energycost = 920,
	buildtime = 3750,
	health = 1950,
	customparams = {
		i18n_en_humanname = 'Armored Tower',
		i18n_en_tooltip = 'Armored laser tower: more health plus a personal shield.',
	},
}), 700, 62, 25)

unitDefs.leglht_armored = addSelfShield(tableMerge(unitDefs['leglht'], {
	name = 'Armored Tower',
	unitname = 'leglht_armored',
	metalcost = 175,
	energycost = 720,
	buildtime = 3300,
	health = 1650,
	customparams = {
		i18n_en_humanname = 'Armored Tower',
		i18n_en_tooltip = 'Armored heat ray tower: more health plus a personal shield.',
	},
}), 700, 62, 25)

------------------------------
-- DEFENSE: Interceptors -- shoots down targetable=1 projectiles (nukes/LRPC/
-- starburst missiles), same engine mechanic as stock anti-nuke silos.
-- Artillery: cloned from the anti-nuke silo, tuned to area-defense cost.
-- Energy: instant-hit beam version cloned from the heavy laser tower.
------------------------------

unitDefs.arminterceptor_artillery = tableMerge(unitDefs['armamd'], {
	name = 'Artillery Interceptor',
	unitname = 'arminterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile point defense. Shoots down incoming missiles.',
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
		i18n_en_tooltip = 'Missile point defense. Shoots down incoming missiles.',
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
		i18n_en_tooltip = 'Missile point defense. Shoots down incoming missiles.',
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
		i18n_en_tooltip = 'Beam point defense. Always ready, no stockpile needed.',
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
		i18n_en_tooltip = 'Beam point defense. Always ready, no stockpile needed.',
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
		i18n_en_tooltip = 'Beam point defense. Always ready, no stockpile needed.',
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

------------------------------
-- UTILITY: Barrier -- a large inert obstacle/pathing blocker, reskinned as a
-- repurposed husk rather than a purpose-built Dragon's Teeth shape (reuses the
-- game's own existing wreck art -- no new assets needed). Comes in three tiers
-- of health/durability/cost -- Bronze/Silver/Gold -- each visually a bigger
-- wreck to match: Bronze reuses a light laser tower's wreck, Silver a fusion
-- reactor's, Gold a commander's. Same inert-blocker mechanics underneath as
-- armdrag/cordrag/legdrag (blocking=true, canattack=false) throughout.
------------------------------

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
			i18n_en_tooltip = 'Repurposed husk (' .. tier.label .. ' tier). Large inert obstacle, blocks movement.',
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


------------------------------
-- UTILITY: Support Relay -- long-range assist/repair building, bigger radius than nanotc
------------------------------

unitDefs.armsupportrelay = tableMerge(unitDefs['armnanotc'], {
	name = 'Support Relay',
	unitname = 'armsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 90,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret.',
	},
})

unitDefs.corsupportrelay = tableMerge(unitDefs['cornanotc'], {
	name = 'Support Relay',
	unitname = 'corsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 90,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret.',
	},
})

unitDefs.legsupportrelay = tableMerge(unitDefs['legnanotc'], {
	name = 'Support Relay',
	unitname = 'legsupportrelay',
	metalcost = 1400,
	energycost = 14000,
	buildtime = 12000,
	health = 2600,
	builddistance = 90,
	workertime = 500,
	customparams = {
		i18n_en_humanname = 'Support Relay',
		i18n_en_tooltip = 'Long-range assist & repair turret.',
	},
})

------------------------------
-- RAPTOR-FLAVORED: Bio Reactor -- REWORKED 2026-08-15 into 3 tiers (Bronze/
-- Silver/Gold, matching this file's Barrier naming convention), one per
-- lootbox rarity used as the stat/model template (Silver/Gold/Platinum --
-- same "clone a lootbox building shell" trick as before, just now three
-- of them instead of one). Costs lowered and outputs re-set on request
-- (2026-08-15): Bronze 5k / Silver 10k / Gold 20k energy.
------------------------------

local raptorReactorTiers = {
	{ size = 'Bronze', lootbox = 'lootboxsilver', id = 'raptorbioreactor_bronze', techlevel = 1,
	  metalcost = 3000, energycost = 12000, buildtime = 90000, energymake = 5000, energystorage = 5000, health = 6000 },
	{ size = 'Silver', lootbox = 'lootboxgold', id = 'raptorbioreactor_silver', techlevel = 2,
	  metalcost = 6000, energycost = 24000, buildtime = 160000, energymake = 10000, energystorage = 9000, health = 9500 },
	{ size = 'Gold', lootbox = 'lootboxplatinum', id = 'raptorbioreactor_gold', techlevel = 3,
	  metalcost = 11000, energycost = 45000, buildtime = 260000, energymake = 20000, energystorage = 15000, health = 14000 },
}

for _, tier in ipairs(raptorReactorTiers) do
	if unitDefs[tier.lootbox] then
		unitDefs[tier.id] = tableMerge(unitDefs[tier.lootbox], {
			name = tier.size .. ' Raptor Bio-Reactor',
			unitname = tier.id,
			metalcost = tier.metalcost,
			energycost = tier.energycost,
			buildtime = tier.buildtime,
			energymake = tier.energymake,
			energystorage = tier.energystorage,
			metalmake = 0,
			health = tier.health,
			reclaimable = true,
			sightdistance = 273,
			yardmap = "oooooooooooooooooo",
			customparams = {
				i18n_en_humanname = tier.size .. ' Raptor Bio-Reactor',
				i18n_en_tooltip = 'Salvaged Raptor bio-tech energy building, T' .. tier.techlevel .. '. Produces ' .. tier.energymake .. ' energy.',
				removestop = true,
				removewait = true,
				techlevel = tier.techlevel,
			},
		})
	end
end

------------------------------
-- RAPTOR-FLAVORED: Scav Metal Recycler -- same pattern as the Bio-Reactor
-- directly above (same lootbox shells for a consistent look across the
-- 3 tiers, same Bronze/Silver/Gold naming, same tier-1/4/9 gating), but
-- produces metal only via metalmake, no energy output.
------------------------------

local scavRecyclerTiers = {
	{ size = 'Bronze', lootbox = 'lootboxsilver', id = 'scavmetalrecycler_bronze', techlevel = 1,
	  metalcost = 3500, energycost = 30000, buildtime = 100000, metalmake = 5, health = 6000 },
	{ size = 'Silver', lootbox = 'lootboxgold', id = 'scavmetalrecycler_silver', techlevel = 2,
	  metalcost = 7000, energycost = 60000, buildtime = 180000, metalmake = 25, health = 9500 },
	{ size = 'Gold', lootbox = 'lootboxplatinum', id = 'scavmetalrecycler_gold', techlevel = 3,
	  metalcost = 13000, energycost = 110000, buildtime = 280000, metalmake = 50, health = 14000 },
}

for _, tier in ipairs(scavRecyclerTiers) do
	if unitDefs[tier.lootbox] then
		unitDefs[tier.id] = tableMerge(unitDefs[tier.lootbox], {
			name = tier.size .. ' Scav Metal Recycler',
			unitname = tier.id,
			metalcost = tier.metalcost,
			energycost = tier.energycost,
			buildtime = tier.buildtime,
			energymake = 0,
			metalmake = tier.metalmake,
			health = tier.health,
			reclaimable = true,
			sightdistance = 273,
			yardmap = "oooooooooooooooooo",
			customparams = {
				i18n_en_humanname = tier.size .. ' Scav Metal Recycler',
				i18n_en_tooltip = 'Salvaged Scavenger recycling plant, T' .. tier.techlevel .. '. Produces ' .. tier.metalmake .. ' metal.',
				removestop = true,
				removewait = true,
				techlevel = tier.techlevel,
			},
		})
	end
end

------------------------------
-- Wire everything into the commanders' buildoptions so it's immediately buildable
------------------------------

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
addBuildOptionAll(armComVariants, 'armsupportrelay')
if unitDefs['raptorbioreactor_bronze'] then addBuildOptionAll(armComVariants, 'raptorbioreactor_bronze') end
if unitDefs['raptorbioreactor_silver'] then addBuildOptionAll(armComVariants, 'raptorbioreactor_silver') end
if unitDefs['raptorbioreactor_gold'] then addBuildOptionAll(armComVariants, 'raptorbioreactor_gold') end
if unitDefs['scavmetalrecycler_bronze'] then addBuildOptionAll(armComVariants, 'scavmetalrecycler_bronze') end
if unitDefs['scavmetalrecycler_silver'] then addBuildOptionAll(armComVariants, 'scavmetalrecycler_silver') end
if unitDefs['scavmetalrecycler_gold'] then addBuildOptionAll(armComVariants, 'scavmetalrecycler_gold') end

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
addBuildOptionAll(corComVariants, 'corsupportrelay')
if unitDefs['raptorbioreactor_bronze'] then addBuildOptionAll(corComVariants, 'raptorbioreactor_bronze') end
if unitDefs['raptorbioreactor_silver'] then addBuildOptionAll(corComVariants, 'raptorbioreactor_silver') end
if unitDefs['raptorbioreactor_gold'] then addBuildOptionAll(corComVariants, 'raptorbioreactor_gold') end
if unitDefs['scavmetalrecycler_bronze'] then addBuildOptionAll(corComVariants, 'scavmetalrecycler_bronze') end
if unitDefs['scavmetalrecycler_silver'] then addBuildOptionAll(corComVariants, 'scavmetalrecycler_silver') end
if unitDefs['scavmetalrecycler_gold'] then addBuildOptionAll(corComVariants, 'scavmetalrecycler_gold') end

addBuildOptionAll(legComVariants, 'leginc_heavy')
addBuildOptionAll(legComVariants, 'legdepawner')
addBuildOptionAll(legComVariants, 'leglht_rapid')
addBuildOptionAll(legComVariants, 'leghyperreactor')
addBuildOptionAll(legComVariants, 'legbulwark')
addBuildOptionAll(legComVariants, 'leglht_hp')
addBuildOptionAll(legComVariants, 'leglht_armored')
addBuildOptionAll(legComVariants, 'leginterceptor_artillery')
addBuildOptionAll(legComVariants, 'leginterceptor_energy')

------------------------------
-- Remove the original preset's Pocket Fusion Reactor (portfus, 1100E) and
-- Portable Advanced Fusion Reactor (portafus, 3300E) -- defined in the
-- base preset's own slots (1/3), which already ran by the time this
-- slot executes, so nil-ing them here on the shared global table works.
-- Add Scav Metal Recycler + Raptor Bio-Reactor to every T1/T2/T3
-- bot/vehicle/air constructor, tier-matched (Bronze->T1, Silver->T2,
-- Gold->T3), for all 3 factions.
------------------------------
UnitDefs.portfus = nil
UnitDefs.portafus = nil

local consByTier = {
	arm = { { 'armck', 'armcv', 'armca' }, { 'armack', 'armacv', 'armaca' }, { 'armhack', 'armhacv', 'armhaca' } },
	cor = { { 'corck', 'corcv', 'corca' }, { 'corack', 'coracv', 'coraca' }, { 'corhack', 'corhacv', 'corhaca' } },
	leg = { { 'legck', 'legcv', 'legca' }, { 'legack', 'legacv', 'legaca' }, { 'leghack', 'leghacv', 'leghaca' } },
}
local tierSuffix = { 'bronze', 'silver', 'gold' }
for prefix, tiers in pairs(consByTier) do
	for tierIdx, consList in ipairs(tiers) do
		local suffix = tierSuffix[tierIdx]
		for _, conId in ipairs(consList) do
			if unitDefs['raptorbioreactor_' .. suffix] then addBuildOption(conId, 'raptorbioreactor_' .. suffix) end
			if unitDefs['scavmetalrecycler_' .. suffix] then addBuildOption(conId, 'scavmetalrecycler_' .. suffix) end
		end
	end
end

------------------------------
-- NOTE: an earlier version of this file added static buildings (Hyper
-- Reactor, Bulwark Tower, Armored Tower, Interceptors, Depawner) to the
-- printer buildoptions here. That was a real bug: printers ("Epic Unit
-- Printer" / "Black Market BioPrinter") spawn and pop out whatever's in
-- their buildoptions expecting it to walk away -- fine for mobile units,
-- but a static building just gets constructed and sits at the spawn point,
-- and the printer keeps stacking more on top of it every cycle (confirmed
-- live 2026-08-15). Buildings belong on commander/constructor buildoptions
-- only (already handled elsewhere in this file) -- don't add any building
-- to a printer's buildoptions, only genuinely mobile units.
------------------------------

addBuildOptionAll(legComVariants, 'legbarrier_bronze')
addBuildOptionAll(legComVariants, 'legbarrier_silver')
addBuildOptionAll(legComVariants, 'legbarrier_gold')
addBuildOptionAll(legComVariants, 'legsupportrelay')
if unitDefs['raptorbioreactor_bronze'] then addBuildOptionAll(legComVariants, 'raptorbioreactor_bronze') end
if unitDefs['raptorbioreactor_silver'] then addBuildOptionAll(legComVariants, 'raptorbioreactor_silver') end
if unitDefs['raptorbioreactor_gold'] then addBuildOptionAll(legComVariants, 'raptorbioreactor_gold') end
if unitDefs['scavmetalrecycler_bronze'] then addBuildOptionAll(legComVariants, 'scavmetalrecycler_bronze') end
if unitDefs['scavmetalrecycler_silver'] then addBuildOptionAll(legComVariants, 'scavmetalrecycler_silver') end
if unitDefs['scavmetalrecycler_gold'] then addBuildOptionAll(legComVariants, 'scavmetalrecycler_gold') end

------------------------------
-- COMMANDER PROGRESSION CHAIN -- 10 ranks (Cadet..Grand Admiral), stats
-- cloned from real evocom levels. Real commander (any level) builds only
-- Cadet; each rank then builds the next. iscommander stays false; own
-- buildoptions cumulative up to Grand Admiral, who builds everything.
------------------------------

local rankNames = { 'Cadet', 'Private', 'Corporal', 'Sergeant', 'Lieutenant', 'Captain', 'Major', 'Colonel', 'General', 'Grand Admiral' }

-- Real evo-commander stats per level, fetched from the game's own unit
-- source (armcomlvl2..10 / corcomlvl2..10 / legcomlvl2..10) -- level 1 uses
-- armcom/corcom/legcom's own base stats. NOT made-up numbers.
local evoStats = {
	arm = {
		{ metalcost = 2700, energycost = 26000, buildtime = 75000, health = 3700 },
		{ metalcost = 3000, energycost = 30000, buildtime = 75000, health = 6000 },
		{ metalcost = 4000, energycost = 40000, buildtime = 85000, health = 6900 },
		{ metalcost = 5000, energycost = 50000, buildtime = 94800, health = 7800 },
		{ metalcost = 6000, energycost = 60000, buildtime = 111600, health = 8700 },
		{ metalcost = 7000, energycost = 70000, buildtime = 128400, health = 9600 },
		{ metalcost = 8000, energycost = 80000, buildtime = 145200, health = 10500 },
		{ metalcost = 9000, energycost = 90000, buildtime = 162000, health = 11400 },
		{ metalcost = 10000, energycost = 100000, buildtime = 178000, health = 12300 },
		{ metalcost = 11000, energycost = 110000, buildtime = 195600, health = 13200 },
	},
	cor = {
		{ metalcost = 2700, energycost = 26000, buildtime = 75000, health = 3700 },
		{ metalcost = 3000, energycost = 30000, buildtime = 112500, health = 6000 },
		{ metalcost = 4000, energycost = 40000, buildtime = 120000, health = 6000 },
		{ metalcost = 5000, energycost = 50000, buildtime = 140000, health = 8000 },
		{ metalcost = 6000, energycost = 60000, buildtime = 154800, health = 10000 },
		{ metalcost = 7000, energycost = 70000, buildtime = 182000, health = 12000 },
		{ metalcost = 8000, energycost = 80000, buildtime = 210000, health = 14000 },
		{ metalcost = 9000, energycost = 90000, buildtime = 230000, health = 16000 },
		{ metalcost = 10000, energycost = 100000, buildtime = 240000, health = 18000 },
		{ metalcost = 11000, energycost = 110000, buildtime = 240000, health = 20000 },
	},
	leg = {
		{ metalcost = 2700, energycost = 26000, buildtime = 75000, health = 3700 },
		{ metalcost = 3000, energycost = 30000, buildtime = 112500, health = 6000 },
		{ metalcost = 4000, energycost = 40000, buildtime = 150000, health = 8000 },
		{ metalcost = 5000, energycost = 50000, buildtime = 187500, health = 10000 },
		{ metalcost = 6000, energycost = 60000, buildtime = 187500, health = 12000 },
		{ metalcost = 7000, energycost = 70000, buildtime = 187500, health = 14000 },
		{ metalcost = 8000, energycost = 80000, buildtime = 192000, health = 16000 },
		{ metalcost = 9000, energycost = 90000, buildtime = 216000, health = 18000 },
		{ metalcost = 10000, energycost = 100000, buildtime = 240000, health = 20000 },
		{ metalcost = 11000, energycost = 110000, buildtime = 264000, health = 22000 },
	},
}

-- What each tier adds to the rank units' OWN buildoptions (cumulative --
-- rank N gets tiers 1..N combined). Tier 10 (Grand Admiral) therefore ends
-- up with every custom building/defense in this file.
local tierUnlocks = {
	arm = {
		{ 'armmex', 'armsolar', 'armwin' },
		{ 'armllt' },
		{ 'armllt_rapid' },
		{ 'armalab', 'armaap', 'armamsub', 'armjamt' },
		{ 'armllt_hp', 'armllt_armored' },
		{ 'arminterceptor_artillery', 'arminterceptor_energy', 'armdepawner' },
		{ 'armsupportrelay' },
		{ 'armhyperreactor', 'armbulwark' },
		{ 'armbarrier_bronze', 'armbarrier_silver', 'armbarrier_gold' },
		{ 'armbull' },
	},
	cor = {
		{ 'cormex', 'corsolar', 'corwin' },
		{ 'corllt' },
		{ 'corllt_rapid' },
		{ 'coralab', 'coraap', 'coramsub', 'corjamt' },
		{ 'corllt_hp', 'corllt_armored' },
		{ 'corinterceptor_artillery', 'corinterceptor_energy', 'cordepawner' },
		{ 'corsupportrelay' },
		{ 'corhyperreactor', 'corbulwark' },
		{ 'corbarrier_bronze', 'corbarrier_silver', 'corbarrier_gold' },
		{ 'corgol' },
	},
	leg = {
		{ 'legmex', 'legsolar', 'legwin' },
		{ 'leglht' },
		{ 'leglht_rapid' },
		{ 'legalab', 'legaap', 'legajam' },
		{ 'leglht_hp', 'leglht_armored' },
		{ 'leginterceptor_artillery', 'leginterceptor_energy', 'legdepawner' },
		{ 'legsupportrelay' },
		{ 'leghyperreactor', 'legbulwark' },
		{ 'legbarrier_bronze', 'legbarrier_silver', 'legbarrier_gold' },
		{ 'leginc' },
	},
}
-- Small/Medium/Large reactors spread across the rank tiers matching their
-- own T1/T2/T3 techlevel, rather than all bunched at one tier.
if unitDefs['raptorbioreactor_bronze'] then
	table.insert(tierUnlocks.arm[1], 'raptorbioreactor_bronze')
	table.insert(tierUnlocks.cor[1], 'raptorbioreactor_bronze')
	table.insert(tierUnlocks.leg[1], 'raptorbioreactor_bronze')
end
if unitDefs['raptorbioreactor_silver'] then
	table.insert(tierUnlocks.arm[4], 'raptorbioreactor_silver')
	table.insert(tierUnlocks.cor[4], 'raptorbioreactor_silver')
	table.insert(tierUnlocks.leg[4], 'raptorbioreactor_silver')
end
if unitDefs['raptorbioreactor_gold'] then
	table.insert(tierUnlocks.arm[9], 'raptorbioreactor_gold')
	table.insert(tierUnlocks.cor[9], 'raptorbioreactor_gold')
	table.insert(tierUnlocks.leg[9], 'raptorbioreactor_gold')
end
if unitDefs['scavmetalrecycler_bronze'] then
	table.insert(tierUnlocks.arm[1], 'scavmetalrecycler_bronze')
	table.insert(tierUnlocks.cor[1], 'scavmetalrecycler_bronze')
	table.insert(tierUnlocks.leg[1], 'scavmetalrecycler_bronze')
end
if unitDefs['scavmetalrecycler_silver'] then
	table.insert(tierUnlocks.arm[4], 'scavmetalrecycler_silver')
	table.insert(tierUnlocks.cor[4], 'scavmetalrecycler_silver')
	table.insert(tierUnlocks.leg[4], 'scavmetalrecycler_silver')
end
if unitDefs['scavmetalrecycler_gold'] then
	table.insert(tierUnlocks.arm[9], 'scavmetalrecycler_gold')
	table.insert(tierUnlocks.cor[9], 'scavmetalrecycler_gold')
	table.insert(tierUnlocks.leg[9], 'scavmetalrecycler_gold')
end

-- Real commander (any evo level) can only build Cadet; the rank chain
-- itself handles the rest (Cadet builds Private, Private builds
-- Corporal, ...). Stats per rank still clone real evo-level stats.
local comVariantsAll = { arm = armComVariants, cor = corComVariants, leg = legComVariants }

local function buildRankChain(prefix)
	local cumulativeOptions = {}
	local rankIds = {}
	for level = 1, 10 do
		local rankId = prefix .. 'rank' .. level
		rankIds[level] = rankId
		local baseCloneFrom = level == 1 and (prefix .. 'com') or (prefix .. 'comlvl' .. level)
		local base = unitDefs[baseCloneFrom]
		if base then
			local stats = evoStats[prefix][level]
			local def = tableMerge(base, {
				name = rankNames[level],
				unitname = rankId,
				metalcost = stats.metalcost,
				energycost = stats.energycost,
				buildtime = stats.buildtime,
				health = stats.health,
				maxthisunit = 1,
				customparams = {
					i18n_en_humanname = rankNames[level],
					i18n_en_tooltip = rankNames[level],
					iscommander = false,
				},
			})
			-- Strip the inherited evolution_target (unit_evolution.lua triggers
			-- on ANY unit with this set -- confirmed live, was causing every
			-- rank to level together with the real commander).
			if def.customparams then def.customparams.evolution_target = nil end
			for _, opt in ipairs(tierUnlocks[prefix][level]) do
				table.insert(cumulativeOptions, opt)
			end
			def.buildoptions = {}
			for _, opt in ipairs(cumulativeOptions) do
				table.insert(def.buildoptions, opt)
			end
			unitDefs[rankId] = def
		end
	end

	-- The real commander, at any evo level, can only ever build a Cadet.
	if unitDefs[rankIds[1]] then
		for _, variant in ipairs(comVariantsAll[prefix]) do
			addBuildOption(variant, rankIds[1])
		end
	end

	-- Chain: each rank builds the next one up.
	for level = 1, 9 do
		if unitDefs[rankIds[level]] and unitDefs[rankIds[level + 1]] then
			addBuildOption(rankIds[level], rankIds[level + 1])
		end
	end
end

buildRankChain('arm')
buildRankChain('cor')
buildRankChain('leg')

------------------------------
-- T3 REPULSOR SHIELD: upgraded shield generator with the engine's real
-- repulser flag on, so it physically knocks projectiles back instead of
-- just absorbing them. Restricted to the Metal OverCommander (overcom)
-- and Grand Admiral (rank10) only -- not a normal constructor buildoption.
------------------------------

-- Scaling derived from the one real vanilla T2->T3 shield pair that
-- exists (Legion's legdeflector -> leggatet3, the only faction with a
-- native T3 shield): metalcost x4.53, energycost x3.93, buildtime x4.75,
-- health x5.07, shield power x8.0, powerregen x4.0. Radius deliberately
-- NOT scaled (real vanilla goes x1.29, kept flat here on request).
local repulsorShieldTiers = {
	{ prefix = 'arm', base = 'armgate', metalcost = 13600, energycost = 212000, buildtime = 261000, health = 18000 },
	{ prefix = 'cor', base = 'corgate', metalcost = 14500, energycost = 216000, buildtime = 261000, health = 18000 },
	{ prefix = 'leg', base = 'legdeflector', metalcost = 14500, energycost = 216000, buildtime = 261000, health = 18000 },
}

for _, tier in ipairs(repulsorShieldTiers) do
	local id = tier.prefix .. 'repulsorshield'
	if unitDefs[tier.base] then
		unitDefs[id] = tableMerge(unitDefs[tier.base], {
			name = 'T3 Repulsor Shield',
			unitname = id,
			metalcost = tier.metalcost,
			energycost = tier.energycost,
			buildtime = tier.buildtime,
			health = tier.health,
			customparams = {
				i18n_en_humanname = 'T3 Repulsor Shield',
				i18n_en_tooltip = 'Upgraded shield that repels incoming fire instead of absorbing it. Same range as the T2 shield, but stronger and costs energy to keep running.',
				techlevel = 3,
			},
			weapondefs = {
				repulsor = {
					shield = {
						power = 49400,
						powerregen = 520,
						energyupkeep = 500,
						repulser = true,
					},
				},
			},
		})
	end
end

addBuildOption('overcom', 'armrepulsorshield')
addBuildOption('overcom', 'correpulsorshield')
addBuildOption('overcom', 'legrepulsorshield')
addBuildOption('armrank10', 'armrepulsorshield')
addBuildOption('corrank10', 'correpulsorshield')
addBuildOption('legrank10', 'legrepulsorshield')

------------------------------
-- STARTUP CONFIRMATION: prints once the whole script above has parsed and run
-- without error, so a missing message in infolog.txt is itself the failure
-- signal (a Lua error here would mean this line never executes).
------------------------------

Spring.Echo("=== Darth_Raider's Force Magic loaded ===")

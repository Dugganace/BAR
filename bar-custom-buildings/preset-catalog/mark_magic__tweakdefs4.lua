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
----------------------------------------------------------------------------------------------

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
		i18n_en_tooltip = 'Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.',
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
		i18n_en_tooltip = 'Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.',
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
		i18n_en_tooltip = 'Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.',
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

----------------------------------------------------------------------------------------------
-- DEFENSE: The Depawner -- anti-air flak turret specialized against enemy
-- drone-carrier/spawner aircraft (VTOL units that deploy their own swarms
-- mid-flight, e.g. Swarmship-style carriers). Cloned from the stock flak
-- tower, same "VTOL-only" targeting, but with a much bigger damage bonus
-- specifically so carrier-type aircraft die before they can offload their
-- payload -- there's no separate "spawner" unit category in the base game,
-- so this works by hitting the whole VTOL class much harder than stock flak.
----------------------------------------------------------------------------------------------

unitDefs.armdepawner = tableMerge(unitDefs['armflak'], {
	name = 'The Depawner',
	unitname = 'armdepawner',
	metalcost = 1250,
	energycost = 22000,
	buildtime = 26000,
	health = 2300,
	customparams = {
		i18n_en_humanname = 'The Depawner',
		i18n_en_tooltip = 'Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.',
	},
	weapondefs = {
		armflak_gun = {
			range = 1050,
			reloadtime = 0.35,
			damage = { vtol = 620 },
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
		i18n_en_tooltip = 'Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.',
	},
	weapondefs = {
		armflak_gun = {
			range = 1050,
			reloadtime = 0.35,
			damage = { vtol = 620 },
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
		i18n_en_tooltip = 'Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.',
	},
	weapondefs = {
		leg_t2_microflak = {
			range = 1050,
			reloadtime = 0.35,
			damage = { vtol = 480 },
		},
	},
})

----------------------------------------------------------------------------------------------
-- DEFENSE: Rapid Fire Tower -- high energy requirement, low per-shot damage,
-- very high fire rate. Anti-swarm role: bad against single tough targets,
-- excellent DPS against many small units. Cloned from the light laser tower.
----------------------------------------------------------------------------------------------

unitDefs.armllt_rapid = tableMerge(unitDefs['armllt'], {
	name = 'Rapid Fire Tower',
	unitname = 'armllt_rapid',
	metalcost = 140,
	energycost = 1600,
	buildtime = 3200,
	health = 680,
	customparams = {
		i18n_en_humanname = 'Rapid Fire Tower',
		i18n_en_tooltip = 'High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.',
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
		i18n_en_tooltip = 'High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.',
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
		i18n_en_tooltip = 'High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.',
	},
	weapondefs = {
		heat_ray = {
			areaofeffect = 30,
			reloadtime = 0.25,
			damage = { default = 55 },
		},
	},
})

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
		i18n_en_tooltip = 'Heavy area-control defense tower, tougher and harder-hitting than the standard laser tower.',
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
		i18n_en_tooltip = 'Heavy area-control defense tower, tougher and harder-hitting than the standard heat ray tower.',
	},
	weapondefs = {
		heat_ray = {
			range = 780,
			reloadtime = 1.1,
			damage = { default = 640 },
		},
	},
})

----------------------------------------------------------------------------------------------
-- DEFENSE: High Power Laser Tower -- a new "High Power" line of laser defenses.
-- Cloned from the light laser tower per faction (armllt/corllt/leglht -- Legion's
-- "leglht" is itself the light-tier heat ray tower, matching the other two's tier).
-- More expensive to build (metal/energy), more expensive to fire (energypershot,
-- i.e. costs more energy to *run*), longer range, and roughly 2.5x the damage.
----------------------------------------------------------------------------------------------

unitDefs.armllt_hp = tableMerge(unitDefs['armllt'], {
	name = 'High Power Laser Tower',
	unitname = 'armllt_hp',
	metalcost = 255,
	energycost = 2380,
	buildtime = 6000,
	health = 930,
	customparams = {
		i18n_en_humanname = 'High Power Laser Tower',
		i18n_en_tooltip = 'High Power variant of the light laser tower: much more expensive to build and run, but longer range and far higher damage.',
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
		i18n_en_tooltip = 'High Power variant of the light laser tower: much more expensive to build and run, but longer range and far higher damage.',
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
		i18n_en_tooltip = 'High Power variant of the light heat ray tower: much more expensive to build and run, but longer range and far higher damage.',
	},
	weapondefs = {
		heat_ray = {
			range = 688,
			energypershot = 70,
			damage = { default = 500 },
		},
	},
})

----------------------------------------------------------------------------------------------
-- DEFENSE: Armored Tower -- more health, more metal cost, and actual damage
-- mitigation (not just a bigger HP pool) via a small always-on self-shield
-- covering just the tower itself -- same shield mechanic this preset already
-- uses for the Umbrella Mk II, just scaled down to a passive personal shield.
----------------------------------------------------------------------------------------------

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
		i18n_en_tooltip = 'Heavily armored laser tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.',
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
		i18n_en_tooltip = 'Heavily armored laser tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.',
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
		i18n_en_tooltip = 'Heavily armored heat ray tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.',
	},
}), 700, 62, 25)

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

----------------------------------------------------------------------------------------------
-- COMMANDER PROGRESSION CHAIN: Commander (T1, unchanged) -> Captain (T2) ->
-- General (T3) -> Grand Marshal (T4). Each rank is buildable from the rank
-- below it (Commander builds Captain, Captain builds General, General builds
-- Grand Marshal), and each unlocks that tier's build options.
--
-- IMPORTANT design note: these are NOT flagged as real commanders
-- (customparams.iscommander stays false). The actual player commander
-- (armcom/corcom/legcom) is untouched and remains the one true commander --
-- losing it still ends the game per this preset's deathmode="com" setting.
-- Captain/General/Grand Marshal are powerful mobile constructors cloned from
-- the commander's model/stats/build-speed, built like any other unit, that
-- exist purely to gate progressively wider build access behind rank. This
-- avoids fighting the engine's single-commander assumption and deathmode
-- logic, which real multi-commander flagging would risk breaking.
--
-- T2 tier reuses real stock T2 buildings (advanced lab/aircraft plant/jammer)
-- plus this file's own T2-ish defenses (High Power/Armored towers,
-- Interceptors, Depawner, Rapid Fire Tower). T3/T4 tiers unlock the rest of
-- this file's custom buildings (Assembly Complex, Support Relay, Hyper
-- Reactor, Barrier tiers, Raptor Bio-Reactor) rather than fabricated stock
-- unit ids, since those are the ones already verified to exist in this file.
----------------------------------------------------------------------------------------------

local function buildCommanderRank(commanderId, rankId, label, stats, extraBuildoptions)
	local base = unitDefs[commanderId]
	if not base then return end
	local def = tableMerge(base, {
		name = label,
		unitname = rankId,
		metalcost = stats.metalcost,
		energycost = stats.energycost,
		buildtime = stats.buildtime,
		health = stats.health,
		workertime = stats.workertime,
		customparams = {
			i18n_en_humanname = label,
			i18n_en_tooltip = label .. ' -- higher-rank field commander with expanded build access.',
			iscommander = false,
		},
	})
	def.buildoptions = {}
	for _, opt in ipairs(extraBuildoptions) do
		table.insert(def.buildoptions, opt)
	end
	unitDefs[rankId] = def
end

local armCaptainOptions = { 'armalab', 'armaap', 'armamsub', 'armjamt', 'armllt_hp', 'armllt_armored', 'arminterceptor_artillery', 'arminterceptor_energy', 'armdepawner', 'armllt_rapid' }
local corCaptainOptions = { 'coralab', 'coraap', 'coramsub', 'corjamt', 'corllt_hp', 'corllt_armored', 'corinterceptor_artillery', 'corinterceptor_energy', 'cordepawner', 'corllt_rapid' }
local legCaptainOptions = { 'legalab', 'legaap', 'legajam', 'leglht_hp', 'leglht_armored', 'leginterceptor_artillery', 'leginterceptor_energy', 'legdepawner', 'leglht_rapid' }

local armGeneralExtra = { 'armbulwark', 'armassemblycomplex', 'armsupportrelay', 'armhyperreactor', 'armbarrier_bronze', 'armbarrier_silver' }
local corGeneralExtra = { 'corbulwark', 'corassemblycomplex', 'corsupportrelay', 'corhyperreactor', 'corbarrier_bronze', 'corbarrier_silver' }
local legGeneralExtra = { 'legbulwark', 'legassemblycomplex', 'legsupportrelay', 'leghyperreactor', 'legbarrier_bronze', 'legbarrier_silver' }

local armGrandMarshalExtra = { 'armbarrier_gold' }
local corGrandMarshalExtra = { 'corbarrier_gold' }
local legGrandMarshalExtra = { 'legbarrier_gold' }
if unitDefs['raptorbioreactor'] then
	table.insert(armGrandMarshalExtra, 'raptorbioreactor')
	table.insert(corGrandMarshalExtra, 'raptorbioreactor')
	table.insert(legGrandMarshalExtra, 'raptorbioreactor')
end

local function concatLists(...)
	local result = {}
	for _, list in ipairs({ ... }) do
		for _, v in ipairs(list) do table.insert(result, v) end
	end
	return result
end

buildCommanderRank('armcom', 'armcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, armCaptainOptions)
buildCommanderRank('corcom', 'corcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, corCaptainOptions)
buildCommanderRank('legcom', 'legcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, legCaptainOptions)

buildCommanderRank('armcaptain', 'armgeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(armCaptainOptions, armGeneralExtra))
buildCommanderRank('corcaptain', 'corgeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(corCaptainOptions, corGeneralExtra))
buildCommanderRank('legcaptain', 'leggeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(legCaptainOptions, legGeneralExtra))

buildCommanderRank('armgeneral', 'armgrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(armCaptainOptions, armGeneralExtra, armGrandMarshalExtra))
buildCommanderRank('corgeneral', 'corgrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(corCaptainOptions, corGeneralExtra, corGrandMarshalExtra))
buildCommanderRank('leggeneral', 'leggrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(legCaptainOptions, legGeneralExtra, legGrandMarshalExtra))

addBuildOption('armcom', 'armcaptain')
addBuildOption('armcaptain', 'armgeneral')
addBuildOption('armgeneral', 'armgrandmarshal')

addBuildOption('corcom', 'corcaptain')
addBuildOption('corcaptain', 'corgeneral')
addBuildOption('corgeneral', 'corgrandmarshal')

addBuildOption('legcom', 'legcaptain')
addBuildOption('legcaptain', 'leggeneral')
addBuildOption('leggeneral', 'leggrandmarshal')

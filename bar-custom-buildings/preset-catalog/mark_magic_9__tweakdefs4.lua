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
		i18n_en_tooltip = 'Anti-air turret tuned to kill enemy drone-carriers fast.',
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
		i18n_en_tooltip = 'Anti-air turret tuned to kill enemy drone-carriers fast.',
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
		i18n_en_tooltip = 'Anti-air turret tuned to kill enemy drone-carriers fast.',
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

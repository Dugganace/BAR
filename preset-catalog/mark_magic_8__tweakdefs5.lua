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

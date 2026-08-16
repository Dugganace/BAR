-- BioPrinter, T4 Converter and buildoption inserts
-- Authos: Waffles_II
local unitDefs, tableMerge,bioprinter =
	UnitDefs or {},
	table.merge,
	'grenadier',
	'overseer',
	'spitter',
	'slinger',
	'birdangler',
	'regurgitator',
	'birdofprey',
	'bioprinter'

unitDefs.grenadier = tableMerge(
	unitDefs['raptorartillery'],
	{
		name='Grenadier',
		energycost = 33500,
		metalcost = 1800,
		health = 3200,
		unitname = "grenadier",
		customparams = {
			i18n_en_humanname = 'Grenadier Beetle',
			i18n_en_tooltip = 'Grenadier Beetle',
		},
		weapondefs = {
			goolauncher = {
				accuracy = 280,
				reloadtime = 7,
				range = 1350,
				impulsefactor = 2.4,
				intensity = 28,
			}
		},
	}
)

unitDefs.spitter = tableMerge(
	unitDefs['raptor_turret_basic_t2_v1'],
	{
		name='Spitter',
		energycost = 19000,
		metalcost = 870,
		health = 2230,
		buildtime = 19000,
		reclaimable = true,
		canrepeat = true,
		unitname = "spitter",
		builddistance = 0,
		workertime = 0,
		customparams = {
			i18n_en_humanname = 'Spitter',
			i18n_en_tooltip = 'Launches AoE Projectiles',
		},
		weapondefs = {
			weapon = {
				reloadtime = 2.1,
				areaofeffect = 192,
				range = 850,
				name = "GOOLAUNCHER",
				sprayangle = 512,
				damage = {
					default = 680,
				},
			},
		},
	}
)

unitDefs.slinger = tableMerge(
	unitDefs['raptor_turret_basic_t3_v1'],
	{
		name='Slinger',
		energycost = 49000,
		metalcost = 3700,
		health = 4230,
		buildtime = 47000,
		reclaimable = true,
		canrepeat = true,
		unitname = "slinger",
		builddistance = 0,
		workertime = 0,
		customparams = {
			i18n_en_humanname = 'Slinger',
			i18n_en_tooltip = 'Launches big Projecitels over greater distance',
		},
		weapondefs = {
			weapon = {
				accuracy = 468,
				reloadtime = 9,
				areaofeffect = 128,
				range = 1850,
				name = "GOOLAUNCHER",
				sprayangle = 1024,
				damage = {
					default = 380,
					shields = 320,
				},
			},
		},
	}
)

unitDefs.birdangler = tableMerge(
	unitDefs['raptor_turret_antiair_t3_v1'],
	{
		name='Bird Angler',
		energycost = 85000,
		metalcost = 3300,
		health = 2230,
		buildtime = 23000,
		reclaimable = true,
		canrepeat = true,
		unitname = "birdangler",
		builddistance = 0,
		workertime = 0,
		customparams = {
			i18n_en_humanname = 'Bird Angler',
			i18n_en_tooltip = 'Heavy long range Anti Air Turret',
		},
		weapondefs = {
			weapon = {
				reloadtime = 4.3,
				cameraShake = 700,
				range = 2400,
				flighttime = 8,
				name = "Deadly Defensive Spores",
				damage = {
					vtol = 5500,
				},
			},
		},
		weapons = {
			[1] = { badtargetcategory = "LIGHTAIRSCOUT", }
		}
	}
)

unitDefs.regurgitator = tableMerge(
	unitDefs['raptor_air_gunship_acid_t2_v1'],
	{
		name='Regurgitator',
		energycost = 35000,
		metalcost = 820,
		health = 780,
		buildtime = 24000,
		reclaimable = true,
		canrepeat = true,
		unitname = "regurgitator",
		customparams = {
			i18n_en_humanname = 'Regurgitator',
			i18n_en_tooltip = 'Sprays Acid on enemies',
		},
		weapondefs = {
			acidspit = {
				burst = 2,
				burstrate = 0.5,
				name = "Regurgitation",
				customparams = {
					area_onhit_ceg = "acid-area-150-repeat",
					area_onhit_damageCeg = "acid-damage-gen",
					area_onhit_time = 10,
					area_onhit_damage = 120,
					area_onhit_range = 150,
					area_onhit_resistance = "_RAPTORACID_",
					nofire = true,
				},
				damage = {
					default = 1,
				},
			},
		},
	}
)

unitDefs.birdofprey = tableMerge(
	unitDefs['raptor_air_fighter_basic_t4_v1'],
	{
		name='Bird of Prey',
		energycost = 15000,
		metalcost = 460,
		health = 630,
		buildtime = 19000,
		reclaimable = true,
		canrepeat = true,
		unitname = "birdofprey",
		builddistance = 0,
		workertime = 0,
		customparams = {
			i18n_en_humanname = 'Bird of Prey',
			i18n_en_tooltip = 'Khrathm... no, not that one! Air Fighter',
		},
		weapondefs = {
			weapon = {
				reloadtime = 0.7,
			},
		},
	}
)


unitDefs.overseer = tableMerge(
	unitDefs['raptorh5'],
	{
		name='Raptor Overseer',
		energycost = 33500,
		metalcost = 950,
		autoheal = 1,
		canrepair = true,
		canreclaim = true,
		reclaimable = true,
		canrepeat = true,
		workertime = 1050,
		sightdistance = 800,
		unitname = "raptorOverseer",
		customparams = {
			i18n_en_humanname = 'Raptor Overseer',
			i18n_en_tooltip = 'Raptor Overseer',
		},
		buildoptions={
			[1] = 'raptorh1b',
			[2] = 'raptor_land_swarmer_heal_t4_v1',
			[3] = 'birdofprey',
			[4] = 'regurgitator',
			[5] = 'spitter',
			[6] = 'slinger',
			[7] = 'birdangler',
		},
		weapondefs = {
			weapon = {
				reloadtime = 0.5,
				range = 400,
				damage = {
					raptor = 1,
					default = 100,
				},
			},
		},
	}
)

unitDefs.bioprinter = tableMerge(
	unitDefs['lootboxnano_t4_var3'],
	{
		name = 'Black Market BioPrinter',
		metalcost = 12300,
		energycost = 172000,
		buildtime = 97300,
		buildpic = "scavengers/SCAVBEACON.DDS",
		canrepeat = true,
		movestate = 0,
		health = 23500,
		maxthisunit = 1,
		customparams = {
			i18n_en_humanname = 'Black Market BioPrinter',
			i18n_en_tooltip = 'The most anticipated barely illegal underground Bio Printer',
		},
		workertime=6500,
		builddistance=550,
		buildoptions={
			[1] = 'raptor_allterrain_swarmer_emp_t2_v1',
			[2] = 'grenadier',
			[3] = 'raptor_allterrain_arty_basic_t4_v1',
			[4] = 'raptor_allterrain_arty_brood_t4_v1',
			[5] = 'raptor_land_swarmer_heal_t4_v1',
			[6] = 'raptor_matriarch_fire',
			[7] = 'raptor_matriarch_electric',
			[8] = 'raptor_matriarch_acid',
			[9] = 'raptor_matriarch_spectre',
			[10] = 'raptorh1b',
			[11] = 'overseer',
			[12] = 'birdofprey',
			[13] = 'regurgitator',
		},
	}
)

local a = UnitDefs or {}
local b = a
local c = table.merge
local d = {
	'arm',
	'cor',
	'leg',
}

local c = {
	'armack',
	'armaca',
	'armacv',
	'corack',
	'coraca',
	'coracv',
	'legack',
	'legaca',
	'legacv',
}

local a = UnitDefs or {}
local b = a
local c = table.merge
local d = {
	'arm',
	'cor',
	'leg',
}

local c = {
	'armack',
	'armaca',
	'armacv',
	'corack',
	'coraca',
	'coracv',
	'legack',
	'legaca',
	'legacv',
}

for c, c in pairs(c) do
	local d = c:sub(1, 3)
	local e = a[c].buildoptions
	if not e then
		e = {}
		a[c].buildoptions = e
	end
	local a = {
		'portfus',
		'portafus',
		'epicunitprinter',
		'bioprinter',
		'infinitybox',
	}
	for a, a in ipairs(a) do
		if b[a] then
			e[#e + 1] = a
		end 
	end
end

local a = UnitDefs or {}
local b = a
local c = table.merge
local d = {
	'arm',
	'cor',
	'leg',
}
local e = {
	arm = 'Armada ',
	cor = 'Cortex ',
	leg = 'Legion ',
}
local f = '_uwcold'
local g = 1.2
local h = 1.3
local function i(a, d, e)
	if b[a] and not b[d] then
		b[d] = c(b[a], e)
	end
end
local c = {
	'armack',
	'armaca',
	'armacv',
	'corack',
	'coraca',
	'coracv',
	'legack',
	'legaca',
	'legacv',
}

for c, c in ipairs(d) do
	local d = (c == 'arm')
	local d = (c == 'cor')
	local d = (c == 'leg')
	local j = d and 'legadveconvt3' or c .. 'mmkrt3'
	local k = j .. '_cold200'
	local l = b[j]
	if l then
		local a = 2.0
		i(j, k, {
			metalcost = math.ceil(l.metalcost * a),
			energycost = math.ceil(l.energycost * a),
			buildtime = math.ceil(l.buildtime * a),
			health = math.ceil(l.health * a * 6),
			customparams = {
				energyconv_capacity = math.ceil(l.customparams.energyconv_capacity * 2),
				energyconv_efficiency = 0.022,
				buildinggrounddecaldecayspeed = l.customparams.buildinggrounddecaldecayspeed,
				buildinggrounddecalsizex = l.customparams.buildinggrounddecalsizex,
				buildinggrounddecalsizey = l.customparams.buildinggrounddecalsizey,
				buildinggrounddecaltype = l.customparams.buildinggrounddecaltype,
				model_author = l.customparams.model_author,
				normaltex = l.customparams.normaltex,
				removestop = l.customparams.removestop,
				removewait = l.customparams.removewait,
				subfolder = l.customparams.subfolder,
				techlevel = l.customparams.techlevel,
				unitgroup = l.customparams.unitgroup,
				usebuildinggrounddecal = l.customparams.usebuildinggrounddecal,
				i18n_en_humanname = 'T4 cold Energy Converter',
				i18n_en_tooltip = 'Converts 12000 energy into 264 metal per sec.',
			},
			name = e[c] .. 'T4 Cold Energy Converter',
			buildpic = l.buildpic,
			objectname = l.objectname,
			footprintx = 6,
			footprintz = 6,
			yardmap = l.yardmap,
			script = l.script,
			activatewhenbuilt = l.activatewhenbuilt,
			explodeas = 'largeBuildingexplosiongeneric',
			selfdestructas = 'largeBuildingExplosionGenericSelfd',
			sightdistance = l.sightdistance,
			seismicsignature = l.seismicsignature,
			idleautoheal = l.idleautoheal,
			idletime = l.idletime,
			maxslope = l.maxslope,
			maxacc = l.maxacc,
			maxdec = l.maxdec,
			corpse = l.corpse,
			canrepeat = l.canrepeat,
		})
	end
end


local c = {
	'armack',
	'armaca',
	'armacv',
	'armacsub',
	'corack',
	'coraca',
	'coracv',
	'coracsub',
	'legack',
	'legaca',
	'legacv',
	'leaganavyconsub',
}
for c, c in pairs(c) do
	local d = c:sub(1, 3)
	local e = a[c].buildoptions
	if not e then
		e = {}
		a[c].buildoptions = e
	end
	local a = (d == 'leg')
	local a = a and 'legadveconvt3' or (d .. 'mmkrt3')
	local a = {
		a .. f,
		a .. '_cold200',
	}
	for a, a in ipairs(a) do
		if b[a] then
			e[#e + 1] = a
		end 
	end
end
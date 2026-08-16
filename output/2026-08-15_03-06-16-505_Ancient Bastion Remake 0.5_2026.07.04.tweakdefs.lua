-- Epic Unit Printer
-- Authos: Waffles_II
local unitDefs, tableMerge,armthort4,cordemont4,corthermitet3,portfus,portafus,infinitybox,jaeger,jaegermk2,hunterdrone,swarmship,umbrellamk2,epicunitprinter =
	UnitDefs or {},
	table.merge,
	'armthort4',
	'cordemont4',
	'corthermitet3',
	'portfus',
	'portafus',
	'infinitybox',
	'jaeger',
	'jaegermk2',
	'hunterdrone',
	'swarmship',
	'umbrellamk2',
	'epicunitprinter'

unitDefs.armthort4 = tableMerge(
	unitDefs['armthor'],
	{
		buildtime = 380000,
		health = 225000,
		metalcost = 35000,
		energycost = 596000,
		mass = 90000,
		name = 'Epic Thor',
		description = 'A true Terminator Tank Unit to crush your enemies',
		customparams = {
			i18n_en_humanname = 'Epic Thor',
			i18n_en_tooltip = 'Ultimate Terminator Tank',
		},
		featuredefs = {
			dead = {
				metal = 26000,
			},
			heap = {
				metal = 5200,
			},
		},
		weapondefs = {
			thunder = {
				areaofeffect = 60,
				energypershot = 1500,
				intensity = 56,
				range = 850,
				reloadtime = 2.8,
				thickness = 2.7,
				weaponvelocity = 400,
				customparams = {
					noattackrangearc = 1,
					spark_ceg = "genericshellexplosion-splash-large-lightning",
					spark_forkdamage = "0.5",
					spark_maxunits = "8",
					spark_range = "150",
				},
				damage = {
					default = 1050,
					subs = 300,
				},
			},
			emp = {
				areaofeffect = 24,
				range = 650,
				damage = {
					default = 1800,
				},
			},
			empmissile = {
				areaofeffect = 284,
				range = 1250,
				reloadtime = 3,
				stockpiletime = 55,
				weaponacceleration = 100,
				weapontimer = 2.5,
				weapontype = "StarburstLauncher",
				weaponvelocity = 500,
				customparams = {
					stockpilelimit = 2,
				},
				damage = {
					default = 60000,
				},
			},
		}
	}
)

unitDefs.cordemont4 = tableMerge(
	unitDefs['cordemon'],
	{
		name = 'Epic Demon',
		metalcost = 23000,
		energycost = 90000,
		buildtime = 360000,
		health = 145000,
		energystorage = 1000,
		mass = 22000,
		customparams = {
			i18n_en_humanname = 'Hellblazer',
			i18n_en_tooltip = 'Earth scorching Demon',
		},
		featuredefs = {
			dead = {
				metal = 12400,
			},
			heap = {
				metal = 2800,
			},
		},
		weapondefs={
			dmaw = {
				areaofeffect = 172,
				damageareaofeffect = 5,
				range = 560,
				rgbcolor = "0.91 0.88 1",
				rgbcolor2 = "0.8 0.8 0.91",
				sprayangle = 320,
				damage = {
					default = 96,
					subs = 30,
				},
			
			},
			karg_shoulder = {
				areaofeffect = 36,
				range = 950,
				reloadtime = 0.25,
				weaponvelocity = 980,
				damage = {
					default = 180,
					vtol = 360,
				},
			},
		},
	}
)

unitDefs.corthermitet3 = tableMerge(
	unitDefs['corthermite'],
	{
		name = 'Core Melter',
		metalcost = 9100,
		energycost = 140000,
		buildtime = 131000,
		health = 54000,
		mass = 21000,
		speed=52,
		customparams = {
			i18n_en_humanname = 'Core Melter',
			i18n_en_tooltip = 'Experimental Heat Ray Heavy Spider',
		},
		featuredefs = {
			dead = {
				metal = 5400,
			},
			heap = {
				metal = 1800,
			},
		},
		weapondefs = {
			thermite_laser = {
				areaofeffect = 96,
				craterareaofeffect = 96,
				energypershot = 550,
				range = 960,
				reloadtime = 2.2,
				thickness = 7,
				damage = {
					default = 2200,
					vtol = 850,
				},
			},
			tmaw = {
				accuracy = 700,
				areaofeffect = 128,
				range = 450,
				reloadtime = 0.39996,--3 0.09999,--burst 12 0.39996,
				weaponvelocity = 600,
				damage = {
					default = 40,
					subs = 10,
				}
			},
		},
	}
)

unitDefs.portfus = tableMerge(
	unitDefs['lootboxsilver'],
	{
		name = 'Portable Fusion Reactor',
		metalcost=3700,
		energycost=22000,
		buildtime=58000,
		energymake=1100,
		energystorage = 2000,
		metalmake=0,
		health=7000,
		reclaimable = true,
		buildpic = "FREEFUSION.DDS",
		sightdistance=273,
		unitname = "portfus",
		yardmap = "ooooooooo",
		customparams = {
			i18n_en_humanname = 'Pocket Fusion Reactor',
			i18n_en_tooltip = 'You can almost put it in your Pocket! Produces 1100 energy',
			removestop = true,
			removewait = true,
			techlevel = 2,
		},
	}
)

unitDefs.portafus = tableMerge(
	unitDefs['lootboxgold'],
	{
		name = 'Portable Advanced Fusion Reactor',
		metalcost=10900,
		energycost=53000,
		buildtime=265000,
		energymake=3300,
		energystorage=7000,
		metalmake=0,
		health=12000,
		reclaimable = true,
		buildpic = "FREEFUSION.DDS",
		sightdistance=273,
		unitname = "portafus",
		yardmap = "oooooooooooooooo",
		customparams = {
			i18n_en_humanname = 'Portable Advanced Fusion Reactor',
			i18n_en_tooltip = 'Portable, affordable, explosive! Produces 3300 energy',
			removestop = true,
			removewait = true,
			techlevel = 2,
		},
	} 
)

unitDefs.infinitybox = tableMerge(
	unitDefs['lootboxplatinum'],
	{
		name = 'Infinity Box',
		metalcost=119000,
		energycost=600000,
		buildtime=2500000,
		energymake=33000,
		metalmake=60,
		metalstorage=600,
		health=22000,
		energystorage = 80000,
		reclaimable = true,
		sightdistance=273,
		unitname = "infinitybox",
		selfdestructas = "empblast",
		explodeas = "empblast",
		yardmap = "h cbbbbbbc bssssssb bsssossb bsobbssb bssbbosb bssosssb bssssssb cbbbbbbc",
		customparams = {
			i18n_en_humanname = 'Infinity Box',
			i18n_en_tooltip = 'Oww, what´s in the box?! Produces 33000 energy and 60 metal',
			removestop = true,
			removewait = true,
			techlevel = 3,
		},
	} 
)

unitDefs.jaeger = tableMerge(
	unitDefs['corcomboss'],
	{
		name = 'Jaeger Mk I',
		metalcost = 480000,
		energycost = 14000000,
		buildtime = 4100000,
		health = 1800000,
		workertime = 1300,
		builddistance = 650,
		mass = 810000,
		speed=46,
		buildoptions = {[1] = {nil},[2] = {nil},},
		customparams = {
			i18n_en_humanname = 'Jaeger Mk I',
			i18n_en_tooltip = 'Experimental Hunter Killer',
			techlevel = 4,
		},
		featuredefs = {
			dead = {
				metal = 325400,
			},
			heap = {
				metal = 120000,
			},
		},
		weapondefs = {
			corcomlaserboss={areaofeffect=64,corethickness=0.3,ergypershot=1000,thickness =24,damage={default=3600}},
			corcomsealaserboss={areaofeffect=48,corethickness=0.3,energypershot=1000,thickness = 24,damage={default=2400}},
			disintegratorxl={reloadtime=2.4,range=850,energypershot=70000,damage={default=60000,scavboss = 120000,commanders = 20000}},
			melee = {
				areaofeffect = 180,
				avoidfeature = 0,
				avoidfriendly = 0,
				camerashake = 80,
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.7,
				explosiongenerator = "custom:raptorspike-large-sparks-burn",
				firesubmersed = true,
				impulsefactor = 1.5,
				model = "Raptors/spike.s3o",
				name = "BearClaws",
				noselfdamage = true,
				range = 400,
				reloadtime = 1,
				soundstart = "bigraptorbreath",
				tolerance = 5000,
				turret = true,
				waterweapon = true,
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					default = 2300,
				},
			},
		},
		weapons = {
			[1]={badtargetcategory = "VTOL GROUNDSCOUT", fastautoretargeting = true, onlytargetcategory = "NOTSUB",},
			[2]={onlytargetcategory="SURFACE"},
			[4] = {
				def = "MELEE",
				maindir = "0 0 1",
				maxangledif = 155,
			},
		},
	}
)

unitDefs.jaegermk2 = tableMerge(
	unitDefs['armscavengerbossv2_easy'],
	{
		name = 'Jaeger Mk II',
		buildpic = "scavengers/ARMCOMBOSS.DDS",
		autoheal = 0,
		metalcost = 480000,
		energycost = 14000000,
		buildtime = 4100000,
		health = 1800000,
		workertime = 1300,
		builddistance = 650,
		speed=46,
		unitname = "jaegermk2",
		customparams = {
			i18n_en_humanname = 'Jaeger Mk II',
			i18n_en_tooltip = 'Experimental Hunter Killer',
			techlevel = 4,
		},
		featuredefs = {
			dead = {
				metal = 325400,
			},
			heap = {
				metal = 120000,
			},
		},
		weapondefs = {
			machinegun={avoidfriendly=true,reloadtime=0.04,range=1100,energypershot=100,weaponvelocity=3200,damage={default=800,vtol=1000}},
			corkorg_laser ={thickness = 10,reloadtime=1.5,damage={default=4800}},
			disintegratorxl={reloadtime=0.5,commandfire=true,stockpiletime=24,stockpilelimit=30,damage={default=8000,scavboss=6000,commanders = 2000}},
		},
	}
)

unitDefs.hunterdrone = tableMerge(
	unitDefs['legheavydrone'],
	{
		nochasecategory = "COMMANDER",
		weapondefs = {
			heat_ray = {
				damage = {
					default = 16,
					vtol = 24,
				},
			},
		},
		weapons = {
			[1] = {badtargetcategory = "GROUND",}
		},
	}
)



unitDefs.swarmship = tableMerge(
	unitDefs['cordronecarryair'],
	{
		name = 'Swarmship',
		category = "VTOL",
		airStrafe = false,
		health = 8500,
		speed = 40,
		energycost = 160000,
		metalcost = 7900,
		buildtime = 104000,
		nochasecategory = "GROUND",
		customparams = {
			i18n_en_humanname = 'Swarmship',
			i18n_en_tooltip = 'Anti Air Drone Carrier',
		},
		weapondefs = {
			plasma = {
				customparams = {
				carried_unit = "hunterdrone",
				spawnrate = 12,
				maxunits = 10,
				metalcost = 150,
				energycost = 1500,
				stockpilemetal = 150,
				stockpileenergy = 1500,
				},
			},
		},
	}
)

unitDefs.umbrellamk2 = tableMerge(
	unitDefs['armscab'],
	{
		name = 'Umbrella Mk II',
		activatewhenbuilt = true,
		onoffable = true,
		airStrafe = false,
		health = 2700,
		speed = 48,
		energycost = 91000,
		metalcost = 2700,
		buildtime = 64000,
		energystorage = 800,
		nochasecategory = "GROUND",
		customparams = {
			i18n_en_humanname = 'Umbrella Mk II',
			i18n_en_tooltip = 'Mobile all-terrain Shield Unit',
			shield_color_mult = 0.8,
			shield_power = 3200,
			shield_radius = 350,
		},
		weapondefs = {
			repulsor = {
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				name = "PlasmaRepulsor",
				soundhitwet = "sizzle",
				weapontype = "Shield",
				shield = {
					alpha = 0.17,
					armortype = "shields",
					exterior = true,
					energyupkeep = 0,
					force = 2.5,
					intercepttype = 1,
					power = 3200,
					powerregen = 170,
					powerregenenergy = 362.5,
					radius = 350,
					repulser = false,
					smart = true,
					startingpower = 1290,
					visiblerepulse = true,
					badcolor = {
						[1] = 1,
						[2] = 0.2,
						[3] = 0.2,
						[4] = 0.2,
					},
					goodcolor = {
						[1] = 0.2,
						[2] = 1,
						[3] = 0.2,
						[4] = 0.17,
					},
				},
			},
		},
		weapons = {
			[1] = {
				def = "REPULSOR",
				onlytargetcategory = "NOTSUB",
			},
		},
	}
)

unitDefs.epicunitprinter = tableMerge(
	unitDefs['lootboxnano_t4_var9'],
	{
		name = 'Epic Unit Printer',
		metalcost = 12300,
		energycost = 172000,
		buildtime = 97300,
		buildpic = "scavengers/SCAVBEACON.DDS",
		canrepeat = true,
		health = 23500,
		maxthisunit = 1,
		movestate = 0,
		unitname = "epicunitprinter",
		yardmap = "oooooooooooooooooooooooooooooooooooo",
		customparams = {
			i18n_en_humanname = 'Epic Unit Printer',
			i18n_en_tooltip = 'The mother of all private army unit printers.',
		},
		workertime=6500,
		builddistance=550,
		buildoptions={
			[1] = 'armthort4',
			[2] = 'armbanth',
			[3] = 'armrattet4',
			[4] = 'armfepocht4',
			[5] = 'cordemont4',
			[6] = 'corjugg',
			[7] = 'corkorg',
			[8] = 'corcrwt4',
			[9] = 'corkarganetht4',
			[10] = 'corgolt4',
			[11] = 'corfblackhyt4',
			[12] = 'corthermitet3',
			[13] = 'legfortt4',
			[14] = 'legeheatraymech_old',
			[15] = 'legelrpcmech',
			[16] = 'legsrailt4',
			[17] = 'jaeger',
			[18] = 'jaegermk2',
			[19] = 'swarmship',
			[20] = 'umbrellamk2'
		},
	}
)



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
-- UTILITY: Support Relay -- long-range assist/repair building, bigg--Cross Faction Tax 70%
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,c,d,e,f,g=UnitDefs or{},1.7,{},{},Json.decode(VFS.LoadFile('language/en/units.json')),'_taxed',' (Taxed)'for a,h in pairs(a)do if h.customparams and h.customparams.subfolder and(h.customparams.subfolder:match'Fact'or h.customparams.subfolder:match'Lab')and h.customparams.techlevel==2 then local i=e and e.units.names[a]or a;c[a]=1;d[a..f]=table.merge(h,{energycost=h.energycost*b,icontype=a,metalcost=h.metalcost*b,name=i..g,customparams={i18n_en_humanname=i..g,i18n_en_tooltip=e and e.units.descriptions[a]or a}})end end;for b,e in pairs(a)do if e.buildoptions then for e,e in pairs(e.buildoptions)do if c[e]then for c,c in pairs{'arm','cor','leg'}do local f=c..e:sub(4)..f;if e:sub(1,3)~=c and d[f]then a[b].buildoptions[#a[b].buildoptions+1]=f end end end end end end;table.mergeInPlace(a,d)

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
}
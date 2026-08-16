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
		mass = 16000,
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
					default = 800,
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
		mass = 9000,
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
		health = 38000,
		mass = 210000,
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
		yardmap = "h cbbbbbbc bssssssb bsssossb bsobbssb bssbbosb bssosssb bssssssb cbbbbbbc",
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
		workertime = 900,
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
				metal = 365400,
			},
			heap = {
				metal = 180000,
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
		workertime = 900,
		speed=46,
		unitname = "jaegermk2",
		customparams = {
			i18n_en_humanname = 'Jaeger Mk II',
			i18n_en_tooltip = 'Experimental Hunter Killer',
			techlevel = 4,
		},
		featuredefs = {
			dead = {
				metal = 365400,
			},
			heap = {
				metal = 180000,
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
--Cross Faction Tax 70%
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,c,d,e,f,g=UnitDefs or{},1.7,{},{},Json.decode(VFS.LoadFile('language/en/units.json')),'_taxed',' (Taxed)'for a,h in pairs(a)do if h.customparams and h.customparams.subfolder and(h.customparams.subfolder:match'Fact'or h.customparams.subfolder:match'Lab')and h.customparams.techlevel==2 then local i=e and e.units.names[a]or a;c[a]=1;d[a..f]=table.merge(h,{energycost=h.energycost*b,icontype=a,metalcost=h.metalcost*b,name=i..g,customparams={i18n_en_humanname=i..g,i18n_en_tooltip=e and e.units.descriptions[a]or a}})end end;for b,e in pairs(a)do if e.buildoptions then for e,e in pairs(e.buildoptions)do if c[e]then for c,c in pairs{'arm','cor','leg'}do local f=c..e:sub(4)..f;if e:sub(1,3)~=c and d[f]then a[b].buildoptions[#a[b].buildoptions+1]=f end end end end end end;table.mergeInPlace(a,d)-- BioPrinter, T4 Converter and buildoption inserts
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
		health = 980,
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
		energycost = 49500,
		metalcost = 3550,
		buildtime = 36000,
		autoheal = 1,
		canrepair = true,
		canreclaim = true,
		reclaimable = true,
		canrepeat = true,
		workertime = 2000,
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
				avoidfriendly = true,
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
	'armacsub',
	'corack',
	'coraca',
	'coracv',
	'coracsub',
	'legack',
	'legaca',
	'legacv',
	'leganavyconsub',
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
	'leganavyconsub',
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
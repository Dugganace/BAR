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
'overcom',
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
i18n_en_tooltip = 'Launches big Projectiles over greater distance',
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
health = 3230,
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
range = 2200,
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
reloadtime = 0.8,
range = 1200,
damage = { default = 750 }
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
canreclaim = false,
reclaimable = true,
canrepeat = true,
workertime = 1800,
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
canmove = true,
reclaimable = true,
canpatrol = true,
health = 23500,
maxthisunit = 2,
unitname = "bioprinter",
yardmap = "oooooooooooooooooooooooooooooooooooo",
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

unitDefs.overcom = tableMerge(
unitDefs['armcomboss'],
{
name = 'Metal OverCommander',
buildpic = "scavengers/ARMCOM.DDS",
autoheal = 0,
maxacc = 0.4,
maxdec = 0.6,
metalcost = 480000,
energycost = 14000000,
buildtime = 4100000,
builddistance = 650,
canresurrect = true,
energymake = 3500,
metalmake = 60,
health = 1800000,
workertime = 9000,
speed=35,
maxthisunit=1,
unitname = "overcom",
customparams = {
i18n_en_humanname = 'Metal OverCommander',
i18n_en_tooltip = 'When hope was lost, he kept building',
techlevel = 4,
},
buildoptions = {
[1] = "armbanth",
[2] = "corkorg",
[3] = "legeheatraymech",
[4] = "armck",
[5] = "armack",
[6] = "corck",
[7] = "corack",
[8] = "legck",
[9] = "legack",
[10] = "portfus",
[11] = "portafus",
[12] = "infinitybox",
[13] = "armmmkrt3_cold200",
[14] = "armmoho",
[15] = "legmohocon",
[16] = "cormexp",
[17] = "leggatet3",
[18] = "armgatet3",
[19] = "corgatet3",
[20] = "armalab",
[21] = "coralab",
[22] = "legalab",
[23] = "armshltx",
[24] = "corgant",
[25] = "leggant",
[26] = "armamd",
[27] = "corfort",
[28] = "armveil",
[29] = "legarad",
[30] = "armflak",
[31] = "legflak",
[32] = "corscreamer",
[33] = "leglraa",
[34] = "corwint2",
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
emplightning = {
areaofeffect = 48,
avoidfeature = false,
beamttl = 1,
burst = 10,
burstrate = 0.03333,
craterareaofeffect = 0,
craterboost = 0,
cratermult = 0,
duration = 0.2,
edgeeffectiveness = 0.15,
energypershot = 650,
explosiongenerator = "custom:genericshellexplosion-large-lightning-thor",
falloffrate = 0.5,
firestarter = 50,
hardstop = false,
impactonly = 1,
impulsefactor = 0,
intensity = 40,
name = "EMP Heavy Lighting Cannon",
noselfdamage = true,
paralyzer = true,
paralyzetime = 12,
range = 940,
reloadtime = 0.3,
rgbcolor = "0.5 0.5 1",
soundhit = "lasrfir2",
soundhitwet = "sizzle",
soundstart = "lghthvy1",
soundtrigger = true,
thickness = 2.8,
turret = true,
weapontype = "LightningCannon",
weaponvelocity = 400,
customparams = {
noattackrangearc = 1,
spark_ceg = "genericshellexplosion-splash-large-lightning",
spark_forkdamage = "0.25",
spark_maxunits = "5",
spark_range = "175",
weapons_group = 1,
},
damage = {
default = 800,
subs = 300,
},
},
armcomsealaserboss={range=1050,energypershot=1000,damage={default=2300}},
disintegratorxl={avoidfriendly=true,weaponvelocity=450,gravityaffected = false,energypershot=200000,reloadtime=1.5,customparams = {weapons_group = 2,},damage = {default = 15000,scavboss=6000,commanders = 2000}},
},
weapons={
[1]={def = "emplightning", badtargetcategory = "GROUNDSCOUT", fastautoretargeting = true, onlytargetcategory = "EMPABLE",},
[2]={onlytargetcategory="SURFACE"},
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
local e = {
arm = 'Armada ',
cor = 'Cortex ',
leg = 'Legion ',
}

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
'portfus',
'portafus',
'epicunitprinter',
'bioprinter',
'infinitybox',
a .. '_cold200',
}
for a, a in ipairs(a) do
if b[a] then
e[#e + 1] = a
end 
end
end --  Anti-Nuke T3 Mod by CrossGamer

local UnitDefs = UnitDefs or {}

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
    else
        copy = orig
    end
    return copy
end

local function createT3AntiNuke(faction, baseUnit, newUnit)
    if UnitDefs[baseUnit] and not UnitDefs[newUnit] then
        local t2 = UnitDefs[baseUnit]
        
        -- Deep copy UnitDef fully to prevent reference leaking
        local t3 = deepcopy(t2)

        -- Modifying unit properties
        t3.name = (t3.name or baseUnit) .. " T3"
        t3.health = t2.health * 2.5
        t3.metalcost = t2.metalcost * 3
        t3.energycost = t2.energycost * 3
        t3.buildtime = t2.buildtime * 3
        
        t3.customparams = t3.customparams or {}
        t3.customparams.i18n_en_humanname = "T3 Anti-Nuke"
        t3.customparams.i18n_en_tooltip = "Extended Range Anti-Nuke (Cheaper/Faster stockpiling)"
        
        -- Use scavenger variant build pictures
        t3.buildpic = "scavengers/" .. string.upper(baseUnit) .. ".DDS"
        t3.icontype = baseUnit
        
        -- Apply the scav .s3o object model
        local oldObjectName = string.lower(t3.objectname or "")
        -- Check if it contains "units/" to strip it.
        local baseName = oldObjectName:match("([^/]+)$")
        if baseName then
            t3.objectname = "scavs/" .. baseName
        end

        -- Apply a model scale to distinguish it visually
        if t3.customparams.modelscale then
            t3.customparams.modelscale = tostring(tonumber(t3.customparams.modelscale) * 1.5)
        else
            t3.customparams.modelscale = "1.5"
        end

        -- Modify Weapons
        local wdefName = next(t3.weapondefs)
        if wdefName then
            local wdef = t3.weapondefs[wdefName]
            wdef.coverage = (wdef.coverage or 2000) * 2 -- Double protection range
            wdef.stockpiletime = math.floor((wdef.stockpiletime or 90) / 3) -- 1/3 stockpile time
            wdef.energypershot = math.floor((wdef.energypershot or 7500) * 0.9) -- 10% less energy cost
            wdef.metalpershot = math.floor((wdef.metalpershot or 150) * 0.9) -- 10% less metal cost
            wdef.customparams = wdef.customparams or {}
            wdef.customparams.stockpilelimit = 30 -- Limit to 30
            -- Note: Some game variants enforce limit directly on wdef, we set both to be safe
            wdef.stockpilelimit = 30
        end

        UnitDefs[newUnit] = t3
        
        -- Add to constructors
        local buildoptions = {
            "armack", "armaca", "armacv", "armhack", "armhaca", "armhacv",
            "corack", "coraca", "coracv", "corhack", "corhaca", "corhacv",
            "legack", "legaca", "legacv", "leghack", "leghaca", "leghacv"
        }
        
        for _, builder in ipairs(buildoptions) do
            if UnitDefs[builder] and UnitDefs[builder].buildoptions and string.sub(builder, 1, 3) == faction then
                local hasOption = false
                for _, opt in pairs(UnitDefs[builder].buildoptions) do
                    if opt == newUnit then hasOption = true break end
                end
                if not hasOption then
                    -- insert it at the end of the buildoptions map
                    local maxIndex = 0
                    for idx, _ in pairs(UnitDefs[builder].buildoptions) do
                        if type(idx) == "number" and idx > maxIndex then
                            maxIndex = idx
                        end
                    end
                    UnitDefs[builder].buildoptions[maxIndex + 1] = newUnit
                end
            end
        end
    end
end

createT3AntiNuke("arm", "armamd", "armamdt3")
createT3AntiNuke("cor", "corfmd", "corfmdt3")
createT3AntiNuke("leg", "legabm", "legabmt3")
-- Scavenger Beacon to Nuke Silo by CrossGamer

local function makeSilo(beaconName, tier)
    if UnitDefs and UnitDefs[beaconName] and UnitDefs["armsilo"] then
        local armsilo_wdefs = UnitDefs["armsilo"].weapondefs
        local armsilo_weapons = UnitDefs["armsilo"].weapons
        
        local scav = UnitDefs[beaconName]
        scav.weapondefs = {}
        
        for wname, wdata in pairs(armsilo_wdefs) do
            scav.weapondefs[wname] = {}
            for k, v in pairs(wdata) do
                if type(v) == "table" then
                    scav.weapondefs[wname][k] = {}
                    for k2, v2 in pairs(v) do
                        scav.weapondefs[wname][k][k2] = v2
                    end
                else
                    scav.weapondefs[wname][k] = v
                end
            end
            
            -- Adjust stockpiletime based on tier
            if scav.weapondefs[wname].stockpiletime then
                if tier == 2 then
                    scav.weapondefs[wname].stockpiletime = math.floor(scav.weapondefs[wname].stockpiletime / 3)
                elseif tier == 3 then
                    scav.weapondefs[wname].stockpiletime = 30
                elseif tier == 4 then
                    scav.weapondefs[wname].stockpiletime = 10
                end
                -- Tier 1 remains unchanged (normal)
            end
        end
        
        scav.weapons = {}
        for i, wdata in pairs(armsilo_weapons) do
            scav.weapons[i] = {}
            for k, v in pairs(wdata) do
                scav.weapons[i][k] = v
            end
        end
        
        scav.canattack = true
    end
end

local function addMIRVToSilo(unitName, weaponName) 
    if UnitDefs[unitName] and UnitDefs[unitName].weapondefs and UnitDefs[unitName].weapondefs[weaponName] then 
        local wdefs = UnitDefs[unitName].weapondefs 
        local motherNuke = wdefs[weaponName] 
         
        local childNuke = {} 
        for k, v in pairs(motherNuke) do 
            if type(v) == "table" then 
                childNuke[k] = {} 
                for k2, v2 in pairs(v) do childNuke[k][k2] = v2 end 
            else 
                childNuke[k] = v 
            end 
        end 
         
        local childName = weaponName .. "_mirv_child" 
        childNuke.name = (childNuke.name or "Nuke") .. " (MIRV Child)" 
         
        if childNuke.customparams then 
            childNuke.customparams.speceffect = nil
            childNuke.customparams.cluster_def = nil
            childNuke.customparams.shield_aoe_penetration = nil 
        end 
        
        childNuke.weapontype = "Cannon"
        childNuke.range = 1500
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 6) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 6
        motherNuke.customparams.shield_aoe_penetration = nil
    end 
end

makeSilo("scavbeacon_t1", 1)
makeSilo("scavbeacon_t2", 2)
makeSilo("scavbeacon_t3", 3)
makeSilo("scavbeacon_t4", 4)
makeSilo("scavbeacon_t1_scav", 1)
makeSilo("scavbeacon_t2_scav", 2)
makeSilo("scavbeacon_t3_scav", 3)
makeSilo("scavbeacon_t4_scav", 4)

addMIRVToSilo("scavbeacon_t1", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4", "nuclear_missile")
addMIRVToSilo("scavbeacon_t1_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4_scav", "nuclear_missile")

--ExponentialEvoEcoConTurre
-- Exponential evolving economy and construction turrets
-- Author: tetrisface
do local a=UnitDefs or{}local b=15;local c=1.25;local d=1.12;local e=0.03;local f={{prefix='arm',displayName='Armada',fusionBase='armafust3',converterBase='armmmkrt3',nanoT2Base='armnanotct2',nanoT3Base='armnanotct3',nanoObject='Units/ARMRESPAWN.s3o',builders={'armaca','armack','armacsub','armacv'}},{prefix='cor',displayName='Cortex',fusionBase='corafust3',converterBase='cormmkrt3',nanoT2Base='cornanotct2',nanoT3Base='cornanotct3',nanoObject='Units/CORRESPAWN.s3o',builders={'coraca','corack','coracsub','coracv'}},{prefix='leg',displayName='Legion',fusionBase='legafust3',converterBase='legadveconvt3',nanoT2Base='legnanotct2',nanoT3Base='legnanotct3',nanoObject='Units/legnanotcbase.s3o',builders={'legaca','legack','legacv','legcomt2com'}}}local g={'fusion','converter','nano'}local h={fusion={levelCount=30,sourceKey='fusionBase',unitSuffix='evfus',displayName='Evolving Fusion Reactor',footprint=12,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionFields={'energymake','energystorage'}},converter={levelCount=24,sourceKey='converterBase',unitSuffix='evconv',displayName='Evolving Energy Converter',footprint=6,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionCustomFields={'energyconv_capacity'}},nano={levelCount=30,sourceKey='nanoT3Base',unitSuffix='evnano',displayName='Evolving Construction Turret',footprint=6,costFields={'metalcost','energycost','buildtime'},productionFields={'workertime'},linearFields={'builddistance'},linearGainPerLevel=0.03}}local i=0;for j,k in ipairs(g)do i=math.max(i,h[k].levelCount)end;local l={{1,1},{1,3},{1,5},{4,3},{5,6},{6,1},{6,3}}local m={{1,2},{1,6},{2,2},{2,5},{2,6},{4,2},{6,5}}local function n(o,p)if type(o)~='number'then return nil end;return math.ceil(o*p)end;local function q(r)local s=math.min(r-1,b-1)local t=math.max(r-b,0)return c^s*d^t end;local function u(r,v)local w=1+e*(r-1)return v/w end;local function x(r,y)return 1+y*(r-1)end;local function z(o)if not o then return'0'end;if o==math.floor(o)then return string.format('%.0f',o)end;return string.format('%.2f',o)end;local function A(B,C,D,p)for j,E in ipairs(D)do local o=n(C[E],p)if o~=nil then B[E]=o end end end;local function F(G,H,I)local J=a[G]if not J or a[H]then return a[H]end;a[H]=table.merge(J,I)return a[H]end;local function K(L,M,N)local O=L*2;return{{M,N},{N,O-M+1},{O-M+1,O-N+1},{O-N+1,M}}end;local function P(M,N)return M..':'..N end;local function Q(C,R,S,T)local U={}for V=0,S-1 do for W=0,S-1 do for j,X in ipairs(C)do local M=X[1]local N=X[2]if T and V==S-1 and W==S-1 then M,N=R-N+1,R-M+1 end;U[#U+1]={M+V*R,N+W*R}end end end;return U end;local function Y(L,Z,_,a0,a1)local O=L*2;local a2={}for j,a3 in ipairs({_,a0})do for j,X in ipairs(a3)do a2[P(X[1],X[2])]=true end end;local a4={_[1]}for M=1,L do for N=1,L do if#a4<Z-1 and not a2[P(M,N)]then a4[#a4+1]={M,N}end end end;a4[#a4+1]=a0[#a0]if#a4~=Z then return nil end;local a5={}for r=1,Z do local a6={}for M=1,O do a6[M]={}for N=1,O do a6[M][N]='b'end end;for j,X in ipairs(_)do for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]='s'end end;for a8,X in ipairs(a4)do local a9='b'if a8<r then a9='s'elseif a8==r then a9='o'end;for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]=a9 end end;for j,a7 in ipairs(K(L,a1[1],a1[2]))do a6[a7[1]][a7[2]]='c'end;local aa={}for M=1,O do aa[M]=table.concat(a6[M])end;a5[r]='h '..table.concat(aa,' ')end;return a5 end;local ab=Q(l,6,2,true)local ac=Q(m,6,2,true)h.fusion.yardmaps=Y(12,h.fusion.levelCount,ab,ac,ac[1])h.converter.yardmaps=Y(6,h.converter.levelCount,l,m,m[1])local function ad(ae)return{metalcost=3700,energycost=62000,builddistance=550,buildtime=108000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=575,workertime=1900,icontype='armnanotct2',canrepeat=true,objectname=ae.nanoObject}end;local function af(ae)local ag=h.fusion;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)I.customparams.i18n_en_tooltip='Produces '..z(I.energymake)..' energy/sec'F(G,ai,I)end end;local function aj(ae)local ag=h.converter;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;local ak=J.customparams or{}for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I.customparams,ak,ag.productionCustomFields,v)local al=I.customparams.energyconv_capacity;local w=ak.energyconv_efficiency or 0;local am=al and al*w or nil;I.customparams.i18n_en_tooltip='Converts up to '..z(al)..' energy into '..z(am)..' metal/sec (Hazardous)'F(G,ai,I)end end;local function an(ae)local ao=a[ae.nanoT3Base]==nil;local ap=F(ae.nanoT2Base,ae.nanoT3Base,ad(ae))if ao and ap then ap.yardmap=nil end;local ag=h.nano;local G=ae[ag.sourceKey]local J=a[G]if not J then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,customparams={i18n_en_humanname=ag.displayName..' '..r}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)A(I,J,ag.linearFields,x(r,ag.linearGainPerLevel))I.customparams.i18n_en_tooltip='Provides '..z(I.workertime)..' buildpower at '..z(I.builddistance)..' range'local aq=F(G,ai,I)if aq then aq.yardmap=nil end end end;local function ar(as,at)local au=a[as]if not au or not a[at]then return end;au.buildoptions=au.buildoptions or{}for j,av in ipairs(au.buildoptions)do if av==at then return end end;au.buildoptions[#au.buildoptions+1]=at end;local function aw(ae)local ax={}for j,as in ipairs(ae.builders)do ax[#ax+1]=as end;ax[#ax+1]=ae.prefix..'t3aide'ax[#ax+1]=ae.prefix..'t3airaide'for j,as in ipairs(ax)do for r=1,i do for j,k in ipairs(g)do local ay=h[k]if r<=ay.levelCount then ar(as,ae.prefix..ay.unitSuffix..r)end end end end end;for j,ae in ipairs(f)do af(ae)aj(ae)an(ae)aw(ae)end end
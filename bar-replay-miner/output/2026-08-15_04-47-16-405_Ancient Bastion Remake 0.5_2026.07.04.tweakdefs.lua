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
end -- Custom Buildings: Economy / Defense / Production / Utility, x Armada/Cortex/Legion + a Raptor-flavored one
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

----------------------------------------------------------------------------------------------
-- STARTUP CONFIRMATION: prints once the whole script above has parsed and run
-- without error, so a missing message in infolog.txt is itself the failure
-- signal (a Lua error here would mean this line never executes).
----------------------------------------------------------------------------------------------

Spring.Echo("=== Darth_Raider's Force Magic loaded ===")
--ExponentialEvoEcoConTurre
-- Exponential evolving economy and construction turrets
-- Author: tetrisface
do local a=UnitDefs or{}local b=15;local c=1.25;local d=1.12;local e=0.03;local f={{prefix='arm',displayName='Armada',fusionBase='armafust3',converterBase='armmmkrt3',nanoT2Base='armnanotct2',nanoT3Base='armnanotct3',nanoObject='Units/ARMRESPAWN.s3o',builders={'armaca','armack','armacsub','armacv'}},{prefix='cor',displayName='Cortex',fusionBase='corafust3',converterBase='cormmkrt3',nanoT2Base='cornanotct2',nanoT3Base='cornanotct3',nanoObject='Units/CORRESPAWN.s3o',builders={'coraca','corack','coracsub','coracv'}},{prefix='leg',displayName='Legion',fusionBase='legafust3',converterBase='legadveconvt3',nanoT2Base='legnanotct2',nanoT3Base='legnanotct3',nanoObject='Units/legnanotcbase.s3o',builders={'legaca','legack','legacv','legcomt2com'}}}local g={'fusion','converter','nano'}local h={fusion={levelCount=30,sourceKey='fusionBase',unitSuffix='evfus',displayName='Evolving Fusion Reactor',footprint=12,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionFields={'energymake','energystorage'}},converter={levelCount=24,sourceKey='converterBase',unitSuffix='evconv',displayName='Evolving Energy Converter',footprint=6,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionCustomFields={'energyconv_capacity'}},nano={levelCount=30,sourceKey='nanoT3Base',unitSuffix='evnano',displayName='Evolving Construction Turret',footprint=6,costFields={'metalcost','energycost','buildtime'},productionFields={'workertime'},linearFields={'builddistance'},linearGainPerLevel=0.03}}local i=0;for j,k in ipairs(g)do i=math.max(i,h[k].levelCount)end;local l={{1,1},{1,3},{1,5},{4,3},{5,6},{6,1},{6,3}}local m={{1,2},{1,6},{2,2},{2,5},{2,6},{4,2},{6,5}}local function n(o,p)if type(o)~='number'then return nil end;return math.ceil(o*p)end;local function q(r)local s=math.min(r-1,b-1)local t=math.max(r-b,0)return c^s*d^t end;local function u(r,v)local w=1+e*(r-1)return v/w end;local function x(r,y)return 1+y*(r-1)end;local function z(o)if not o then return'0'end;if o==math.floor(o)then return string.format('%.0f',o)end;return string.format('%.2f',o)end;local function A(B,C,D,p)for j,E in ipairs(D)do local o=n(C[E],p)if o~=nil then B[E]=o end end end;local function F(G,H,I)local J=a[G]if not J or a[H]then return a[H]end;a[H]=table.merge(J,I)return a[H]end;local function K(L,M,N)local O=L*2;return{{M,N},{N,O-M+1},{O-M+1,O-N+1},{O-N+1,M}}end;local function P(M,N)return M..':'..N end;local function Q(C,R,S,T)local U={}for V=0,S-1 do for W=0,S-1 do for j,X in ipairs(C)do local M=X[1]local N=X[2]if T and V==S-1 and W==S-1 then M,N=R-N+1,R-M+1 end;U[#U+1]={M+V*R,N+W*R}end end end;return U end;local function Y(L,Z,_,a0,a1)local O=L*2;local a2={}for j,a3 in ipairs({_,a0})do for j,X in ipairs(a3)do a2[P(X[1],X[2])]=true end end;local a4={_[1]}for M=1,L do for N=1,L do if#a4<Z-1 and not a2[P(M,N)]then a4[#a4+1]={M,N}end end end;a4[#a4+1]=a0[#a0]if#a4~=Z then return nil end;local a5={}for r=1,Z do local a6={}for M=1,O do a6[M]={}for N=1,O do a6[M][N]='b'end end;for j,X in ipairs(_)do for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]='s'end end;for a8,X in ipairs(a4)do local a9='b'if a8<r then a9='s'elseif a8==r then a9='o'end;for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]=a9 end end;for j,a7 in ipairs(K(L,a1[1],a1[2]))do a6[a7[1]][a7[2]]='c'end;local aa={}for M=1,O do aa[M]=table.concat(a6[M])end;a5[r]='h '..table.concat(aa,' ')end;return a5 end;local ab=Q(l,6,2,true)local ac=Q(m,6,2,true)h.fusion.yardmaps=Y(12,h.fusion.levelCount,ab,ac,ac[1])h.converter.yardmaps=Y(6,h.converter.levelCount,l,m,m[1])local function ad(ae)return{metalcost=3700,energycost=62000,builddistance=550,buildtime=108000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=575,workertime=1900,icontype='armnanotct2',canrepeat=true,objectname=ae.nanoObject}end;local function af(ae)local ag=h.fusion;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)I.customparams.i18n_en_tooltip='Produces '..z(I.energymake)..' energy/sec'F(G,ai,I)end end;local function aj(ae)local ag=h.converter;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;local ak=J.customparams or{}for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I.customparams,ak,ag.productionCustomFields,v)local al=I.customparams.energyconv_capacity;local w=ak.energyconv_efficiency or 0;local am=al and al*w or nil;I.customparams.i18n_en_tooltip='Converts up to '..z(al)..' energy into '..z(am)..' metal/sec (Hazardous)'F(G,ai,I)end end;local function an(ae)local ao=a[ae.nanoT3Base]==nil;local ap=F(ae.nanoT2Base,ae.nanoT3Base,ad(ae))if ao and ap then ap.yardmap=nil end;local ag=h.nano;local G=ae[ag.sourceKey]local J=a[G]if not J then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,customparams={i18n_en_humanname=ag.displayName..' '..r}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)A(I,J,ag.linearFields,x(r,ag.linearGainPerLevel))I.customparams.i18n_en_tooltip='Provides '..z(I.workertime)..' buildpower at '..z(I.builddistance)..' range'local aq=F(G,ai,I)if aq then aq.yardmap=nil end end end;local function ar(as,at)local au=a[as]if not au or not a[at]then return end;au.buildoptions=au.buildoptions or{}for j,av in ipairs(au.buildoptions)do if av==at then return end end;au.buildoptions[#au.buildoptions+1]=at end;local function aw(ae)local ax={}for j,as in ipairs(ae.builders)do ax[#ax+1]=as end;ax[#ax+1]=ae.prefix..'t3aide'ax[#ax+1]=ae.prefix..'t3airaide'for j,as in ipairs(ax)do for r=1,i do for j,k in ipairs(g)do local ay=h[k]if r<=ay.levelCount then ar(as,ae.prefix..ay.unitSuffix..r)end end end end end;for j,ae in ipairs(f)do af(ae)aj(ae)an(ae)aw(ae)end end
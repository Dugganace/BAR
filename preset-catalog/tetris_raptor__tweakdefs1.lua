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
		health = 165000,
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
		health = 64000,
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
		metalcost=4000,
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
		metalcost = 700000,
		energycost = 20000000,
		buildtime = 4800000,
		health = 1800000,
		workertime = 900,
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
		metalcost = 700000,
		energycost = 20000000,
		buildtime = 4800000,
		health = 1800000,
		workertime = 900,
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
		maxthisunit = 3,
		movestate = 0,
		unitname = "epicunitprinter",
		customparams = {
			i18n_en_humanname = 'Epic Unit Printer',
			i18n_en_tooltip = 'The mother of all private army unit printers.',
		},
		workertime=6500,
		builddistance=300,
		buildoptions={
			[1] = 'armthort4',
			[2] = 'armbanth',
			[3] = 'armrattet4',
			--[4] = 'armfepocht4',
			[5] = 'cordemont4',
			[6] = 'corjugg',
			[7] = 'corkorg',
			[8] = 'corcrwt4',
			[9] = 'corkarganetht4',
			[10] = 'corgolt4',
			--[11] = 'corfblackhyt4',
			[12] = 'corthermitet3',
			--[13] = 'legfortt4',
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


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

--Cross Faction Tax 70%
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,c,d,e,f,g=UnitDefs or{},1.7,{},{},Json.decode(VFS.LoadFile('language/en/units.json')),'_taxed',' (Taxed)'for a,h in pairs(a)do if h.customparams and h.customparams.subfolder and(h.customparams.subfolder:match'Fact'or h.customparams.subfolder:match'Lab')and h.customparams.techlevel==2 then local i=e and e.units.names[a]or a;c[a]=1;d[a..f]=table.merge(h,{energycost=h.energycost*b,icontype=a,metalcost=h.metalcost*b,name=i..g,customparams={i18n_en_humanname=i..g,i18n_en_tooltip=e and e.units.descriptions[a]or a}})end end;for b,e in pairs(a)do if e.buildoptions then for e,e in pairs(e.buildoptions)do if c[e]then for c,c in pairs{'arm','cor','leg'}do local f=c..e:sub(4)..f;if e:sub(1,3)~=c and d[f]then a[b].buildoptions[#a[b].buildoptions+1]=f end end end end end end;table.mergeInPlace(a,d)-- OverCom, T4 Converter and buildoption inserts
-- Authos: Waffles_II
local unitDefs, tableMerge =
	UnitDefs or {},
	table.merge,
	'overcom'


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
		workertime = 18000,
		speed=35,
		maxthisunit=123,
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
				energypershot = 750,
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
			disintegratorxl={avoidfriendly=true,weaponvelocity=450,gravityaffected = false,energypershot=150000,reloadtime=1.5,customparams = {weapons_group = 2,},damage = {default = 12000,scavboss=6000,commanders = 2000}},
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
		'infinitybox',
		a .. '_cold200',
	}
	for a, a in ipairs(a) do
		if b[a] then
			e[#e + 1] = a
		end 
	end
end  -- Unit HP Buff T1 T2 and MaxUnits
-- Author: Waffles_II

for name, ud in pairs(UnitDefs) do
if not string.find(name, "scavengerboss") and not string.find(name, "raptor")then

	local o_metal = ud.metalcost or ud.buildcostmetal or 404
	local o_energy = ud.energycost or ud.buildcostenergy or 404
	local o_buildtime = ud.buildtime or 404

	-- HEALTH
	local health_val = ud.health
	local tech_lvl = ud.customparams.techlevel or 1
	local move_speed = ud.speed or 0
	local ug = ud.customparams.unitgroup or "misc"
	--if ug and (ug == "weapon" or ug == "aa" or ug == "weaponsub" or ug == "weaponaa" or ug == "emp") and (tech_lvl == 1 or tech_lvl == 2) and not (move_speed == 0) then
	if ug and (ug == "weapon" or ug == "weaponsub" or ug == "emp") and (tech_lvl == 1 or tech_lvl == 2) and not (move_speed == 0) then
		if health_val then
			local mult = 1.6
			local new_health = math.ceil(health_val * mult)
			ud.health = new_health
			ud.maxdamage = new_health
		end


		-- COSTS
		local cost_multM = 1.2
		local cost_mult = 1.2

		local mcost = math.ceil(o_metal * cost_multM)
		local ecost = math.ceil(o_energy * cost_mult)
		local bpcost = math.ceil(o_buildtime * cost_mult)

		ud.metalcost = mcost
		ud.energycost = ecost
		ud.buildtime = bpcost
	end

	-- MAXCOUNTS for non-AA defense turrets
	local move_speed = ud.speed or 0
	local ug = ud.customparams.unitgroup or "misc"
	if ug and (ug == "weapon") and (move_speed == 0) and (tech_lvl == 2 or tech_lvl == 3) then
		-- ud.maxthisunit = 4
	end
	if ug and (ug == "weapon") and (move_speed == 0) and (tech_lvl == 1) then
		-- ud.maxthisunit = 12
	end

end
end

--T3 Cons & Taxed Factories
-- Authors: Nervensaege, TetrisCo
local a,b,c,d,e,f,g=UnitDefs or{},{'arm','cor','leg'},table.merge,{arm='Armada ',cor='Cortex ',leg='Legion '},'_taxed',1.5,table.contains;local function h(b,d,e)if a[b]and not a[d]then a[d]=c(a[b],e)end end;for b,b in pairs(b)do local c,i,j=b=='arm',b=='cor',b=='leg'
h(b..'nanotct2',b..'nanotct3',{metalcost=7900,energycost=82000,builddistance=550,canreclaim=false,buildtime=128000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=3500,mass=37200,sightdistance=575,workertime=4600,icontype="armnanotct2",canrepeat=true,objectname=j and'Units/legnanotcbase.s3o'or i and'Units/CORRESPAWN.s3o'or'Units/ARMRESPAWN.s3o',customparams={i18n_en_humanname='T3 Construction Turret',i18n_en_tooltip='More BUILDPOWER! For the connoisseur'}})
h(j and'legamstor'or b..'uwadvms',j and'legamstort3'or b..'uwadvmst3',{metalstorage=30000,metalcost=4200,energycost=231150,buildtime=142800,health=53560,icontype="armuwadves",name=d[b]..'T3 Metal Storage',customparams={i18n_en_humanname='T3 Hardened Metal Storage',i18n_en_tooltip='The big metal storage tank for your most precious resources. Chopped chicken!'}})
h(j and'legadvestore'or b..'uwadves',j and'legadvestoret3'or b..'advestoret3',{energystorage=272000,metalcost=2100,energycost=59000,buildtime=93380,health=49140,icontype="armuwadves",name=d[b]..'T3 Energy Storage',customparams={i18n_en_humanname='T3 Hardened Energy Storage',i18n_en_tooltip='Power! Power! We need power!1!'}})
for b,b in pairs({b..'nanotc',b..'nanotct2'})do if a[b]then a[b].canrepeat=true end end;
local k=c and'armshltx'or i and'corgant'or'leggant'
local l=a[k]h(k,k..e,{energycost=l.energycost*f,icontype=k,metalcost=l.metalcost*f,name=d[b]..'Experimental Gantry Taxed',customparams={i18n_en_humanname=d[b]..'Experimental Gantry Taxed',i18n_en_tooltip='Produces Experimental Units'}})local f,j={},{b..'afust3',b..'nanotct2',b..'nanotct3',b..'alab',b..'avp',b..'aap',b..'gatet3',b..'flak',j and'legadveconvt3', j and 'legadveconvt3_cold200'or b..'mmkrt3',b..'mmkrt3_cold200','infinitybox',j and'legamstort3'or b..'uwadvmst3',j and'legadvestoret3'or b..'advestoret3',j and'legdeflector'or b..'gate',j and'legforti'or b..'fort',c and'armshltx'or b..'gant'}for a,a in ipairs(j)do f[#f+1]=a end;local j={arm={'corgant','leggant'},cor={'armshltx','leggant'},leg={'armshltx','corgant'}}for a,a in ipairs(j[b]or{})do f[#f+1]=a..e end;local e={arm={'armamd','armmercury','armbrtha','armminivulc','armvulc','armanni','armannit3','armlwall'},cor={'corfmd','corscreamer','cordoomt3','corbuzz','corminibuzz','corint','cordoom','corhllllt','cormwall'},leg={'legabm','legstarfall','legministarfall','leglraa','legbastion','legrwall','leglrpc','legapopupdef','legdtf'}}for a,a in ipairs(e[b]or{})do f[#f+1]=a end;local e=b..'t3aide'h(b..'decom',e,{blocking=true,builddistance=350,buildtime=140000,energycost=200000,energyupkeep=2000,health=10000,idleautoheal=5,idletime=1800,metalcost=12600,speed=85,terraformspeed=3000,turninplaceanglelimit=1.890,turnrate=1240,workertime=6000,reclaimable=true,candgun=false,name=d[b]..'Epic Aide',customparams={subfolder='ArmBots/T3',techlevel=3,unitgroup='buildert3',i18n_en_humanname='Epic Ground Construction Aide',i18n_en_tooltip='Your Aide that helps you construct buildings'},buildoptions=f})a[e].weapondefs={}a[e].weapons={}
local c=c and'armshltx'or i and'corgant'or'leggant'a[c].maxthisunit=22222;
if a[c]and a[c].buildoptions then local b=b..'t3aide'
if not g(a[c].buildoptions,b)then table.insert(a[c].buildoptions,b)end end;
end--Mini Bosses v2g
-- Authors: RCore
-- bar-nuttyb-collective.github.io/configurator
local a,b,c,d,e,f=UnitDefs or{},table.merge,table.copy,'raptor_matriarch_basic','customfusionexplo',Spring;local g,h=1.3,1.3;h=a[d].health/60000;g=a['raptor_queen_epic'].health/1250000;local i=1;local j=f.Utilities.Gametype.IsRaptors()if j or f.Utilities.Gametype.IsScavengers()then i=(#f.GetTeamList()-2)/12 end;local k=f.GetModOptions().raptor_spawncountmult or 3;local i=i*(k/3)local function k(a)return math.max(1,math.ceil(a*i))end;local i={70,85,90,105,110,125}local l=math.max(1,f.GetModOptions().raptor_queentimemult or 1.3)local m,n=i[1],i[#i]local o=l*i[#i]/1.3;local n=(o-m)/(n-m)for a=2,#i do i[a]=math.floor(m+(i[a]-m)*n)end;local f=f.GetModOptions().raptor_queen_count or 1;local m=1;m=math.min(10,g/1.3*0.9)local g=20;local n=10*(1.06^math.max(0,math.min(f,g)-8))local g=math.max(0,f-g)local g=(g<=80)and(0.6*g-g*g/270)or(24.3+(g-80)*0.15)local g=n+g;local g=math.ceil(m*g)local g=l*100+g;local f=math.max(3,k(math.floor((21*f+36)/19)))local function l(c,d,e)if a[c]and not a[d]then a[d]=b(a[c],e or{})end end;local d=a[d].health;l('raptor_queen_veryeasy','raptor_miniq_a',{name='Queenling Prima',icontype='raptor_queen_veryeasy',health=d*5,customparams={i18n_en_humanname='Queenling Prima',i18n_en_tooltip='Majestic and bold, ruler of the hunt.'}})l('raptor_queen_easy','raptor_miniq_b',{name='Queenling Secunda',icontype='raptor_queen_easy',health=d*6,customparams={i18n_en_humanname='Queenling Secunda',i18n_en_tooltip='Swift and sharp, a noble among raptors.'}})l('raptor_queen_normal','raptor_miniq_c',{name='Queenling Tertia',icontype='raptor_queen_normal',health=d*7,customparams={i18n_en_humanname='Queenling Tertia',i18n_en_tooltip='Refined tastes. Likes her prey rare.'}})a.raptor_miniq_b.weapondefs.acidgoo=c(a['raptor_matriarch_acid'].weapondefs.acidgoo)a.raptor_miniq_c.weapondefs.empgoo=c(a['raptor_matriarch_electric'].weapondefs.goo)for a,a in ipairs{{'raptor_matriarch_basic','raptor_mama_ba','Matrona','Claws charged with vengeance.'},{'raptor_matriarch_fire','raptor_mama_fi','Pyro Matrona','A firestorm of maternal wrath.'},{'raptor_matriarch_electric','raptor_mama_el','Paralyzing Matrona','Crackling with rage, ready to strike.'},{'raptor_matriarch_acid','raptor_mama_ac','Acid Matrona','Acid-fueled, melting everything in sight.'}}do l(a[1],a[2],{name=a[3],icontype=a[1],health=d*1.5,customparams={i18n_en_humanname=a[3],i18n_en_tooltip=a[4]}})end;l('critter_penguinking','raptor_consort',{name='Raptor Consort',icontype='corkorg',health=d*4,mass=100000,nochasecategory="MOBILE VTOL OBJECT",sonarstealth=false,stealth=false,speed=67.5,customparams={i18n_en_humanname='Raptor Consort',i18n_en_tooltip='Sneaky powerful little terror.'}})a.raptor_consort.weapondefs.goo=c(a['raptor_queen_epic'].weapondefs.goo)l('raptor_consort','raptor_doombringer',{name='Doombringer',icontype='armafust3',health=d*12,speed=50,customparams={i18n_en_humanname='Doombringer',i18n_en_tooltip='Your time is up. The Queens called for backup.'}})local function c(a,b,c,d,e,f)local g=j and'raptor'or'scav'return{[g..'customsquad']=true,[g..'squadunitsamount']=e or 1,[g..'squadminanger']=a,[g..'squadmaxanger']=b,[g..'squadweight']=f or 5,[g..'squadrarity']=d or'basic',[g..'squadbehavior']=c,[g..'squadbehaviordistance']=500,[g..'squadbehaviorchance']=0.75}end;local d={selfdestructas=e,explodeas=e,weapondefs={yellow_missile={damage={default=1,vtol=1000}}}}for b,c in pairs{raptor_miniq_a=b(d,{maxthisunit=k(2),customparams=c(i[1],i[2],'berserk'),weapondefs={goo={damage={default=750}},melee={damage={default=4000}}}}),raptor_miniq_b=b(d,{maxthisunit=k(3),customparams=c(i[3],i[4],'berserk'),weapondefs={acidgoo={burst=8,reloadtime=10,sprayangle=4096,damage={default=1500,shields=1500}},melee={damage={default=5000}}},weapons={[1]={def="MELEE",maindir="0 0 1",maxangledif=155},[2]={onlytargetcategory="VTOL",def="yellow_missile"},[3]={onlytargetcategory="VTOL",def="yellow_missile"},[4]={onlytargetcategory="VTOL",def="yellow_missile"},[5]={def="acidgoo",maindir="0 0 1",maxangledif=180}}}),raptor_miniq_c=b(d,{maxthisunit=k(4),customparams=c(i[5],i[6],'berserk'),weapondefs={empgoo={burst=10,reloadtime=10,sprayangle=4096,damage={default=2000,shields=2000}},melee={damage={default=6000}}},weapons={[1]={def="MELEE",maindir="0 0 1",maxangledif=155},[2]={onlytargetcategory="VTOL",def="yellow_missile"},[3]={onlytargetcategory="VTOL",def="yellow_missile"},[4]={onlytargetcategory="VTOL",def="yellow_missile"},[5]={def="empgoo",maindir="0 0 1",maxangledif=180}}}),raptor_consort={explodeas='raptor_empdeath_big',maxthisunit=k(6),customparams=c(i[2],1000,'berserk'),weapondefs={eyelaser={name='Angry Eyes',reloadtime=3,rgbcolor='1 0 0.3',range=500,damage={default=6000,commanders=6000}},goo={name='Snowball Barrage',soundstart='penbray2',soundStartVolume=2,cegtag="blob_trail_blue",burst=8,sprayangle=2048,weaponvelocity=600,reloadtime=4,range=1000,hightrajectory=1,rgbcolor="0.7 0.85 1.0",damage={default=1000}}},weapons={[1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},[2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}}},raptor_doombringer={explodeas="ScavComBossExplo",maxthisunit=f,customparams=c(g,1000,'berserk',nil,1,99),weapondefs={eyelaser={name='Eyes of Doom',reloadtime=3,rgbcolor='0.3 1 0',range=500,damage={default=48000,commanders=24000}},goo={name='Amber Hailstorm',soundstart='penbray1',soundStartVolume=2,cegtag="blob_trail_red",burst=15,sprayangle=3072,weaponvelocity=600,reloadtime=5,rgbcolor="0.7 0.85 1.0",hightrajectory=1,damage={default=5000}}},weapons={[1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},[2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}}},raptor_mama_ba={maxthisunit=k(4),customparams=c(55,i[3]-1,'berserk'),weapondefs={goo={damage={default=750}},melee={damage={default=750}}}},raptor_mama_fi={explodeas='raptor_empdeath_big',maxthisunit=k(4),customparams=c(55,i[3]-1,'berserk'),weapondefs={flamethrowerspike={damage={default=80}},flamethrowermain={damage={default=160}}}},raptor_mama_el={maxthisunit=k(4),customparams=c(65,1000,'berserk')},raptor_mama_ac={maxthisunit=k(4),customparams=c(60,1000,'berserk'),weapondefs={melee={damage={default=750}}}},raptor_land_assault_basic_t4_v2={maxthisunit=k(8),customparams=c(33,50,'raider')},raptor_land_assault_basic_t4_v1={maxthisunit=k(12),customparams=c(51,64,'raider','basic',2)}}do a[b]=a[b]or{}table.mergeInPlace(a[b],c,true)end;local a={raptor_mama_ba=36000,raptor_mama_fi=36000,raptor_mama_el=36000,raptor_mama_ac=36000,raptor_consort=45000,raptor_doombringer=90000}local b=UnitDef_Post;function UnitDef_Post(c,d)if b then b(c,d)end;local b=1;if h>1.3 then b=h/1.3 end;for a,c in pairs(a)do if UnitDefs[a]then local b=math.floor(c*b)UnitDefs[a].metalcost=b end end end-- Naval T3 and T4 Cold fus
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
	local k = j .. f
	local l = b[j]
	if l then
		i(j, k, {
			metalcost = math.ceil(l.metalcost * g),
			energycost = math.ceil(l.energycost * g),
			buildtime = math.ceil(l.buildtime * g),
			health = math.ceil(l.health * g * 3),
			maxwaterdepth = 160,
			minwaterdepth = 15,
			customparams = {
				energyconv_capacity = math.ceil(l.customparams.energyconv_capacity * g),
				energyconv_efficiency = 0.021,
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
				i18n_en_humanname = 'T3 Naval Cold Energy Converter ',
				i18n_en_tooltip = 'Converts 7200 energy into 151 metal per sec. Non-Explosive!',
			},
			name = e[c] .. 'T3 Naval cold Energy Converter',
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
	local k = j .. '_uwcold200'
	if l then
		local a = 2.0
		i(j, k, {
			metalcost = math.ceil(l.metalcost * a),
			energycost = math.ceil(l.energycost * a),
			buildtime = math.ceil(l.buildtime * a),
			health = math.ceil(l.health * a * 6),
			maxwaterdepth = 160,
			minwaterdepth = 15,
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
				i18n_en_humanname = 'T4 Naval cold Energy Converter',
				i18n_en_tooltip = 'Converts 12000 energy into 264 metal per sec. Non-Explosive!',
			},
			name = e[c] .. 'T4 Naval Cold Energy Converter',
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

	local e = c .. 't3aide'
	local g = c .. 't3airaide'
	local e = a[e]
	local a = a[g]
	if e and a then
		local g = {}
		local d = d and 'legadveconvt3' or (c .. 'mmkrt3')
		if b[d .. f] then
			g[#g + 1] = d .. f
		end
		if b[d .. '_uwcold200'] then
			g[#g + 1] = d .. '_uwcold200'
		end
		local c = c .. '_uwcold'
		if b[c .. f] then
			g[#g + 1] = c .. f
		end
		if b[c .. '_uwcold200'] then
			g[#g + 1] = c .. '_uwcold200'
		end
		for b, b in ipairs(g) do
			e.buildoptions[#e.buildoptions + 1] = b
			a.buildoptions[#a.buildoptions + 1] = b
		end
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
		a .. '_uwcold200',
		d .. '_uwcold' .. f,
		d .. 'afust3_uwcold200',
	}
	for a, a in ipairs(a) do
		if b[a] then
			e[#e + 1] = a
		end 
	end
end  -- BioPrinter, T4 Converter and buildoption inserts
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
end 
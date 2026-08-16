local unitDefs, tableMerge,armthort4,cordemont4,corthermitet3,portfus,portafus,infinitybox,jaeger,hunterdrone,swarmship,epicunitprinter =
	UnitDefs or {},
	table.merge,
	'armthort4',
	'cordemont4',
	'corthermitet3',
	'portfus',
	'portafus',
	'infinitybox',
	'jaeger',
	'hunterdrone',
	'swarmship',
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
		workertime = 250,
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
		customparams = {
			i18n_en_humanname = 'Pocket Fusion Reactor',
			i18n_en_tooltip = 'You can almost put it in your Pocket! Produces 1100 energy',
			techlevel = 2,
			paratrooper = false,
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
		metalmake=0,
		health=12000,
		energystorage = 7000,
		reclaimable = true,
		buildpic = "FREEFUSION.DDS",
		sightdistance=273,
		unitname = "portafus",
		customparams = {
			i18n_en_humanname = 'Portable Advanced Fusion Reactor',
			i18n_en_tooltip = 'Portable, affordable, explosive! Produces 3300 energy',
			techlevel = 2,
			paratrooper = false,
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
		health=22000,
		energystorage = 70000,
		reclaimable = true,
		sightdistance=273,
		unitname = "infinitybox",
		selfdestructas = "empblast",
		explodeas = "empblast",
		customparams = {
			i18n_en_humanname = 'Infinity Box',
			i18n_en_tooltip = 'Oww come on, what´s in the box?! Produces energy and metal',
			techlevel = 3,
			paratrooper = false,
		},
	} 
)

unitDefs.jaeger = tableMerge(
	unitDefs['corcomboss'],
	{
		name = 'Jaeger Mk I',
		metalcost = 409000,
		energycost = 14000000,
		buildtime = 4100000,
		health = 1800000,
		workertime = 250,
		mass = 810000,
		speed=46,
		customparams = {
			i18n_en_humanname = 'Jaeger Mk I',
			i18n_en_tooltip = 'Experimental Hunter Killer',
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
			corcomlaserboss={areaofeffect=64,corethickness=0.3,ergypershot=1000,thickness =24,damage={default=2800}},
			corcomsealaserboss={areaofeffect=48,corethickness=0.3,energypershot=1000,thickness = 24,damage={default=2400}},
			disintegratorxl={reloadtime=2.4, energypershot=70000,damage={default=120000,commanders = 20000}},
			melee = {
				areaofeffect = 180,
				avoidfeature = 0,
				avoidfriendly = 0,
				camerashake = 0,
				collidefriendly = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.7,
				explosiongenerator = "custom:raptorspike-large-sparks-burn",
				firesubmersed = true,
				impulsefactor = 1.5,
				interceptedbyshieldtype = 4,
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

unitDefs.hunterdrone = tableMerge(
	unitDefs['legheavydrone'],
	{
		nochasecategory = "COMMANDER",
		weapondefs = {
			heat_ray = {
				damage = {
					default = 10,
					vtol = 16,
				},
			},
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
		buildtime = 84000,
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
			[16] = 'jaeger',
			[17] = 'swarmship'
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
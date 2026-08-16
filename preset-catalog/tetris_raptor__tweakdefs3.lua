-- OverCom, T4 Converter and buildoption inserts
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
end  
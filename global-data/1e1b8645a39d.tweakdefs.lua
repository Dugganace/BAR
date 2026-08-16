-- LavaPack (Djarshi) v5.0
local a=Spring.GetModOptions()local b=a.map_waterislava;local c=UnitDefs or{}local d={"arm","cor","leg"}local e='customparams'local f={}for g,h in pairs(c)do if h and h.buildoptions then table.insert(f,g)end end;local function i(h,j,k)local l={'en','fr','de','es'}if h then for m=1,#l do if j then h[e]['i18n_'..l[m]..'_humanname']=j end;if k then h[e]['i18n_'..l[m]..'_tooltip']=k end end end end;local function n(o)return math.floor(o*0.1)*10 end;local function p(q,r)if c[q]and c[q].buildoptions and not table.contains(c[q].buildoptions,r)then table.insert(c[q].buildoptions,r)end end;local function s(r,...)local t={...}for m,u in ipairs(t)do p(u,r)end end;local function v(w,x,y)if c[w]and not c[x]then c[x]=table.merge(c[w],y)end;return c[x]end;local function z(A,g)for m=1,#A do rmvBO(A[m],g)end end;local function B(g)z(f,g)end;local C="h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"c["armageo"].yardmap=C;c["corageo"].yardmap=C;c["armuwageo"].yardmap=C;c["coruwageo"].yardmap=C;if c["legageo"]then c["legageo"].yardmap=C end;for D,E in pairs({"arm","cor","leg"})do local o,F,G=E=="arm",E=="cor",E=="leg"v(E.."nanotct2",E.."nanotct3",{icontype="armrespawn",metalcost=3360,energycost=51200,builddistance=625,buildtime=88000,collisionvolumescales="61 128 61",footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=625,workertime=3000,reclaimspeed=2000,canrepeat=true,objectname=G and"Units/legnanotcbase.s3o"or F and"Units/CORRESPAWN.s3o"or"Units/ARMRESPAWN.s3o",customparams={i18n_en_humanname="Epic Construction Turret",i18n_en_tooltip="Even more build power!"}})v(E.."ageo",E.."ageot3",{icontype="armageo",buildtime=88000,collisionvolumeoffsets="0 0 0",collisionvolumescales="61 128 61",energycost=270000,energymake=12500,energystorage=120000,footprintx=7,footprintz=7,health=7120,idleautoheal=33,idletime=1800,maxacc=0,maxdec=0,maxslope=15,maxwaterdepth=5,metalcost=16000,objectname="Units/mission_command_tower.s3o",buildpic="scavengers/mission_command_tower.dds",script="mission_command_tower.cob",seismicsignature=0,selfdestructas="advgeo",yardmap="h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",sightdistance=345,customparams={i18n_en_humanname="Epic Geothermal Powerplant",i18n_en_tooltip="Produces 10x T2 Geothermal + has plasma deflector. (tweaked by Djarshi & txpera)",shield_color_mult=0.99,shield_power=3250,shield_radius=750},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.17,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=6700,powerregen=69,powerregenenergy=562.5,radius=750,repulser=true,smart=true,startingpower=1100,visiblerepulse=true,badcolor={[1]=1,[2]=0.2,[3]=0.2,[4]=0.2},goodcolor={[1]=0.2,[2]=1,[3]=0.2,[4]=0.17}}}},weapons={[1]={def="REPULSOR",onlytargetcategory="NOTSUB"}}})for D,H in pairs({E.."nanotc",E.."nanotct2"})do if c[H]then c[H].canrepeat=true end end;local I=E.."afust3"if c[I]then c[I].explodeas="customfusionexplo"c[I].selfdestructas="advancedFusionExplosionSelfd"end end;local J=v("lootboxplatinum","afuslegendary",{icontype="lootboxplatinum",buildpic="other/resourcecheat.dds",buildtime=120000,metalmake=0,footprintx=4,footprintz=4,yardmap="yooy oooo oooo yooy",explodeas="ScavComBossExplo",reclaimable=true,customparams={i18n_en_humanname="Legendary Fusion Reactor",i18n_en_tooltip="Makes 50x of AFUS, Transportable, Unique (Very Hazardous)",shield_color_mult=0.99,shield_power=56000,shield_radius=1250,fall_damage_multiplier=15},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.25,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=56000,powerregen=1300,powerregenenergy=100000,radius=1250,repulser=true,smart=true,startingpower=1,visiblerepulse=true,badcolor={[1]=1,[2]=0.1,[3]=0.1,[4]=0.1},goodcolor={[1]=0.1,[2]=1,[3]=0.1,[4]=0.1}}}},weapons={[1]={def="REPULSOR",onlytargetcategory="NOTSUB"}}})local K=c["armafus"]if K then J.metalcost=K.metalcost*30;J.energycost=K.energycost*30;J.energymake=K.energymake*50;J.energystorage=K.energystorage*50;J.health=K.health*10;J.maxthisunit=1 end;local function L(M,N,O,P,Q)if M and N then N.health=M.health*O;N.buildtime=M.buildtime*P*0.75;N.metalcost=M.metalcost*Q;N.energycost=M.energycost*Q;N.energymake=M.energymake*P;N.explodeas='advancedFusionExplosionSelfd'end end;do local O=1.5;local P=10;local Q=8;local R=c['armafust3']local S=c['corafust3']local T=c['legafust3']L(c['armafus'],R,O,P,Q)L(c['corafus'],S,O,P,Q)L(c['legafus'],T,O,P,Q)R.energystorage=R.energystorage*O;R.stealth=true;if hasLegion then i(T,nil,'Produces '..T.energymake..' Energy (Hazardous)')end;i(R,nil,'Produces '..R.energymake..' Energy (Hazardous)')i(S,nil,'Produces '..S.energymake..' Energy (Hazardous)')end;s("afuslegendary","armack","armaca","armacv")s("afuslegendary","corack","coraca","coracv")s("afuslegendary","legack","legaca","legacv")local U=v("armmoho","t3mmex",{icontype="armmoho",health=6200,metalstorage=2000,buildpic="scavengers/scavsafeareabeacon.DDS",buildtime=30000,reclaimable=true,objectname="scavs/scavsafeareabeacon.s3o",script="Units/ARMEYES.cob",energycost=24300,metalcost=1920,energyupkeep=500,explodeas="geo",extractsmetal=0.016,onoffable=true,yardmap="h oooooooo osssssso osssssso ossoosso ossoosso osssssso osssssso oooooooo",customparams={i18n_en_humanname="Epic Metal Extractor",i18n_en_tooltip="Metal Extraction / Storage (upkeep 500 energy/s)"}})s("t3mmex","armack","armaca","armacv")s("t3mmex","corack","coraca","coracv")s("t3mmex","legack","legaca","legacv")c["corjugg"].metalcost=c["corjugg"].metalcost*2.5;if c["legeheatraymech"]then c["legeheatraymech"].metalcost=c["legeheatraymech"].metalcost*1.5 end;if c["legeheatraymech_old"]then c["legeheatraymech_old"].metalcost=c["legeheatraymech_old"].metalcost*1.5 end;c["armbotrail"].health=0;c["armbotrail"].maxthisunit=0;s("armnanotct3","armack","armaca","armacv")s("armageot3","armack","armaca","armacv")s("cornanotct3","corack","coraca","coracv")s("corageot3","corack","coraca","coracv")s("legnanotct3","legack","legaca","legacv")s("legageot3","legack","legaca","legacv")s("armaca","legapt3","corapt3")s("coraca","armapt3","legapt3")s("legaca","corapt3","armapt3")c["armvulc"].metalcost=c["armvulc"].metalcost*10;c["corbuzz"].metalcost=c["corbuzz"].metalcost*10;if c["legstarfall"]then c["legstarfall"].metalcost=c["legstarfall"].metalcost*10 end;for V,W in ipairs({"armsy","armasy","corsy","corasy","legsy","legasy"})do if c[W]then c[W].health=0;c[W].maxthisunit=0 end end;local function X(h)local Y=6;local Z='oooooo oooooo oooooo oooooo oooooo oooooo'local _='collisionvolumeoffsets'local a0='collisionvolumescales'if h then local a1=h.footprintx;if a1>Y then if h[_]then h[_]='0 0 0'end;if h[a0]then h[a0]='90 45 90'end;h.footprintx=Y;h.footprintz=Y;h.yardmap=Z;if h[fds]then local a2=h[fds].dead;if a2 then a2[_]='0 0 0'a2[a0]='90 45 90'a2.footprintx=Y;a2.footprintz=Y end;local a3=h[fds].heap;if a3 then a3.footprintx=Y;a3.footprintz=Y end end end end end;for D,E in pairs({"armmmkrt3","cormmkrt3","legadveconvt3"})do if c[E]then c[E]=table.merge(c[E],{footprintx=6,footprintz=6})end end;for j,a4 in pairs(c)do if a4.energymake>0 then a4.metalcost=(a4.metalcost or 0)*0.9;a4.energycost=(a4.energycost or 0)*0.9 end end;if b then local a5='minwaterdepth'local a6=c['coruwgeo']c['armuwgeo'][a5]=a6[a5]for g,h in pairs(c)do if h['customparams'].metal_extractor or h['customparams'].geothermal then h.maxwaterdepth=a6.maxwaterdepth end;local a7=h[a5]if hasHoverTide and a7 then local a8=h.energymake or h.metalmake or h[e].unitgroup=='energy'or h[e].unitgroup=='metal'if a8 or h.buildoptions or h.waterline==nil then B(g)else h.waterline=0;h[a5]=1;h[e]=h[e]or{}h[e].enabled_on_no_sea_maps=true end elseif a7 and a7>0 then B(g)end;if h.cruisealtitude then if h.cansubmerge then h.cansubmerge=false end;if h.maxwaterdepth then h.maxwaterdepth=0 end end end end--Lava QoL Patch 1.1.1 (Zop)
--Quad Pharos pick by MGGW DJ did some fix.... convertersize/afusmul = out.
local mods = Spring.GetModOptions()
local uDefs = UnitDefs or {}
local cps = 'customparams'
local fds = 'featuredefs'
local wds = 'weapondefs'
local wpn = 'weapons'
local aACons = {'armaca','armack','armacv','armacsub','armoc'} --oc Orbital Constructor from Space Mod
local cACons = {'coraca','corack','coracv','coracsub','coroc'}
local lACons = {'legaca','legack','legacv','legoc'}
local allBOs = {}

local hasLegion = mods.experimentallegionfaction
local hasScavs = mods.scavunitsforplayers
local hasExtras = mods.experimentalextraunits
local hasHoverTide = mods.map_lavatiderhythm == 'enabled' and mods.map_lavalowlevel == 0

local noLRPC = mods.unit_restrictions_nolrpc
local noLOLCannon = mods.unit_restrictions_noendgamelrpc
local noPawnLauncher = noLOLCannon or true --TODO Pawn Bounce Thug Battery etc...
local noNukes = mods.unit_restrictions_nonukes
local noTacs = mods.unit_restrictions_notacnukes
local noSea = mods.map_waterislava
local noAir = mods.unit_restrictions_noair

local removeExcess = true --Delete unpopular units to reduce constructor pages.

local tweakPilum = true
local tweakBehemoth = true
local tweakReclaim = true
local tweakWrecks = true
local tweakMini = true
local tweakQuadLT = true
local tweakLegEpic = true
local tweakEcoT3 = true
local tweakBBT = true

--Assign
for id, def in pairs(uDefs) do
	if def and def.buildoptions then
		table.insert(allBOs, id)
	end
end

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function round100(n)
	return math.floor(n * 0.01) * 100
end

local function mulAll(map, mul)
	for k, v in pairs(map) do
		map[k] = math.floor(v * mul)
	end
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function addBOArr(conIDs, id)
	for i = 1, #conIDs do
		addBO(conIDs[i], id)
	end
end

local function rmvBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef then
		for k, v in pairs(cDef.buildoptions) do
			if v == id then
				table.remove(cDef.buildoptions, k)
				break
			end
		end
	end
end

local function rmvBOArr(conIDs, id)
	for i = 1, #conIDs do
		rmvBO(conIDs[i], id)
	end
end

local function rmvID(id)
	rmvBOArr(allBOs, id)
end

local function delID(id)
	local def = UnitDefs[id]
	if def then
		def.health = 0
	end
end

local function mergeRec(def, ref)
	table.mergeInPlace(def, ref, true)
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de','es'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

--Deleted Units
if noLRPC then
	rmvID('armbrtha')
	rmvID('corint')
	rmvID('corslrpc')
	rmvID('leglrpc')
	rmvID('legelrpcmech')
end
if noLOLCannon then
	rmvID('armvulc')
	rmvID('corbuzz')
	rmvID('legstarfall')
end
if noPawnLauncher then
	delID('armbotrail')
end
if noNukes then
	rmvID('armsilo')
	rmvID('corsilo')
	rmvID('legsilo')
	delID('armseadragon')
	delID('cordesolator')
	rmvID('armamd')
	rmvID('corfmd')
	rmvID('legabm')
	rmvID('armscab')
	rmvID('cormabm')
	rmvID('legavantinuke')
	if hasLegion then
		local ramp = uDefs['legrampart']
		ramp[wpn][1] = ramp[wpn][2]
		ramp[wpn][2] = nil
		ramp[wds]['fmd_rocket'].interceptor = nil
	end
end
if noTacs then
	rmvID('armemp')
	rmvID('cortron')
	rmvID('legperdition')
end
if removeExcess then
	rmvBOArr(aACons, 'armdf')
	rmvBOArr(aACons, 'armckfus')
	if hasExtras and hasScavs then
		rmvID('armgmm')
	end
end

--Disable sea and water landing, keep mex and geo.
if noSea then
	local mwd = 'minwaterdepth'
	local uwRef = uDefs['coruwgeo']
	uDefs['armuwgeo'][mwd] = uwRef[mwd]
	for id, def in pairs(uDefs) do
		if def[cps].metal_extractor then
			def.maxwaterdepth = uwRef.maxwaterdepth
		end
		local min = def[mwd]
		if hasHoverTide and min then
			local isEco = def.energymake or def.metalmake or def[cps].unitgroup == 'energy' or def[cps].unitgroup == 'metal'
			if isEco or def.buildoptions or def.waterline == nil then
				rmvID(id)
			else
				def.waterline = 0
				def[mwd] = 1
				def[cps] = def[cps] or {}
				def[cps].enabled_on_no_sea_maps = true
			end
		elseif min and min > 0 then
			rmvID(id)
		end
		if def.cruisealtitude then
			if def.cansubmerge then
				def.cansubmerge = false
			end
			if def.maxwaterdepth then
				def.maxwaterdepth = 0
			end
		end
	end
end

--Pilum Nerf
if tweakPilum then
	mulAll(uDefs['legbunk'][wds]['piledriver'].damage, 0.25)
end

--Behemoth Nerf
if tweakBehemoth then
	local mMul = 2
	local eMul = 2
	if noAir then
		mMul = mMul + 1
	end
	local def = uDefs['corjugg']
	--Compatibility Check
	local cost = def.metalcost
	if cost == 20000 then
		def.metalcost = round100(def.metalcost * mMul)
		def.energycost = round100(def.energycost * eMul)
		def.buildtime = math.floor(def.buildtime * ((mMul + eMul) * 0.5))
	end
	def[cps].paralyzemultiplier = 2.5
end

--Nano Nerf
if tweakReclaim then
	local ws = 'workertime'
	local rs = 'reclaimspeed'
	local sqrtThreshold = 22.5 -- Above 506.25
	for k, v in pairs(uDefs) do
		local bp = v[ws] or v[rs]
		if bp and v.canreclaim and not v.canmove then
			v[rs] = math.min(bp, round10(math.sqrt(bp * mods.multiplier_buildpower) * sqrtThreshold))
		end
	end
end

--Smaller Wrecks
if tweakWrecks then
	local scale = 0.75
	if noAir then
		scale = 0.25
	end
	local cr = 'crushresistance'
	local mc = 'movementclass'
	local t3Crush = 1400
	local noCrush = 2500000
	local mcMul = 0.4
	local hpMul = 0.1
	for id, def in pairs(uDefs) do
		--Most epic bots are smaller than Titan.
		if def[mc] and def[mc] == 'EPICBOT' then
			def[mc] = 'HABOT5'
		end
		if def.canmove and def[fds] and def[fds].dead then
			local dead = def[fds].dead
			dead.footprintx = math.max(1, math.floor(dead.footprintx * scale))
			dead.footprintz = math.max(1, math.floor(dead.footprintz * scale))
			if def[cps].iscommander then
				dead[cr] = noCrush + 1
			end
			if not dead[cr] then
				local mass = 0
				if dead.mass then
					mass = dead.mass
				elseif def.mass then
					mass = def.mass * mcMul
					if dead.damage then
						mass = mass + (dead.damage * hpMul)
					end
				elseif def.metalcost then
					mass = def.metalcost * mcMul
					if dead.damage then
						mass = mass + (dead.damage * hpMul)
					end
				end
				if mass >= t3Crush and mass < noCrush then
					dead[cr] = t3Crush - 1
				end
			end
		end
	end
	uDefs['armbanth'][mc] = 'EPICBOT'
end

--Mini plasma as 'Cerberus' alternatives.
if hasScavs and tweakMini and hasLegion then
	local rangeMul = 1.25
	local aWDef = uDefs['armminivulc'][wds]['armminivulc_weapon']
	local cWDef = uDefs['corminibuzz'][wds]['corminibuzz_weapon']
	local lWDef = uDefs['legministarfall'][wds]['starfire']
	aWDef.range = round10(aWDef.range * rangeMul)
	cWDef.range = round10(cWDef.range * rangeMul)
	lWDef.range = round10(lWDef.range * rangeMul)
	mulAll(aWDef.damage, 2)
	mulAll(cWDef.damage, 2 * (aWDef.range / cWDef.range))
	local sfd = uDefs['legstarfall'][wds]['starfire'].damage
	lWDef.damage.shields = math.floor(lWDef.damage.default * (sfd.shields / sfd.default))
end

--Quad towers.
if hasScavs and tweakQuadLT and hasLegion then
	local aLT = 'armhllllt'
	local cLT = 'corhllllt'
	local lLT = 'leghllllt'
	local cDef = uDefs[cLT]
	uDefs[aLT] = table.copy(cDef)
	local aDef = uDefs[aLT]
	uDefs[lLT] = table.copy(cDef)
	local lDef = uDefs[lLT]
	for i = 1, 4 do
		local aWDef = aDef[wds]['hllt_'..i]
		local cWDef = cDef[wds]['hllt_'..i]
		local lWDef = lDef[wds]['hllt_'..i]
		mulAll(cWDef.damage, 0.675)
		local dps = cWDef.damage.default / cWDef.reloadtime
		local wr = cWDef.range + 50
		--Arm
		mergeRec(aWDef, uDefs['armbeamer'][wds]['armbeamer_weapon'])
		aWDef.range = wr - 35
		aWDef.reloadtime = aWDef.reloadtime + 0.075
		aWDef.beamtime = aWDef.reloadtime
		aWDef.thickness = aWDef.thickness - ((i - 1) * 0.5)
		mulAll(aWDef.damage, dps / (aWDef.damage.default / aWDef.reloadtime))
		aDef[wpn][i].fastautoretargeting = true
		--Cor
		cWDef.range = wr
		--Leg
		mergeRec(lWDef, uDefs['leglht'][wds]['heat_ray'])
		lWDef.range = wr - 15
		mulAll(lWDef.damage, dps / (lWDef.damage.default / lWDef.reloadtime))
		--Scatter Targets
		local btc = 'badtargetcategory'
		if i == 1 or i == 2 then
			aDef[wpn][i][btc] = 'VTOL GROUNDSCOUT'
			cDef[wpn][i][btc] = aDef[wpn][i][btc]
			lDef[wpn][i][btc] = aDef[wpn][i][btc]
		end
		local pxp = 'proximitypriority'
		if i == 1 or i == 3 then
			aWDef[pxp] = 1
			cWDef[pxp] = 1
			lWDef[pxp] = 1
		end
	end
	setDesc(aDef, 'Quad Beamer', 'Heavy Beam Laser Turret')
	setDesc(lDef, 'Quad Pharos', 'Heavy Heat Ray Tower')
	aDef.icontype = cLT
	lDef.icontype = cLT
	addBOArr(aACons, aLT)
	addBOArr(lACons, lLT)
end

--Legion epic defense.
if hasScavs then
	local cT4 = 'cordoomt3'
	local lT4 = 'legdoomt3'
	local cEvos = {'corcomlvl8', 'corcomlvl9', 'corcomlvl10'}
	local lEvos = {'legcomlvl8', 'legcomlvl9', 'legcomlvl10'}
	if tweakLegEpic and hasLegion then
		uDefs[lT4] = table.copy(uDefs[cT4])
		local def = uDefs[lT4]
		local wDef1 = def[wds]['armagmheat']
		local wDef2 = def[wds]['armageddon_blue_laser']
		local wDef3 = def[wds]['armageddon_green_laser']
		mergeRec(wDef1, uDefs['legsrailt4'][wds]['railgunt2'])
		wDef1.reloadtime = wDef1.reloadtime * 2
		wDef1.duration = 0.05
		wDef1.cegtag = 'railgun'
		wDef1.rgbcolor2 = '1 1 1'
		wDef1.areaofeffect = 100
		wDef1.edgeeffectiveness = 0.7
		wDef1.impactonly = nil
		wDef1.collidefriendly = false
		wDef1.stockpile = false
		wDef1.stockpilelimit = 0
		wDef1.thickness = 5
		wDef1.weaponvelocity = wDef1.weaponvelocity * 2.5
		mergeRec(wDef2, uDefs['legerailtank'][wds]['t3_rail_accelerator'])
		wDef2.duration = 0.05
		wDef2.burst = 3
		wDef2.burstrate = 0.25
		wDef2.thickness = 2
		mergeRec(wDef3, uDefs['legdtr'][wds]['corlevlr_weapon'])
		wDef3.reloadtime = wDef3.reloadtime * 0.375
		wDef3.impulsefactor = wDef3.impulsefactor * 2
		wDef3.proximitypriority = 1
		wDef3.rgbcolor = '1 0.8 0'
		setDesc(def, 'Trident', 'Super Heavy Railgun Defense')
		def.icontype = cT4
		addBOArr(lACons, lT4)
		addBOArr(lEvos, lT4)
	else
		addBOArr(lACons, cT4)
		addBOArr(lEvos, cT4)
	end
	addBOArr(cEvos, cT4)
end

--Base Comm
if tweakBBT then
	local bbtIDs = { 'armrespawn', 'correspawn', 'legnanotcbase' }
	for i = 1, #bbtIDs do
		local def = uDefs[bbtIDs[i]]
		if def then
			def[cps] = def[cps] or {}
			def[cps].isscavcommander = true
			def[cps].armordef = 'commanders'
		end
	end
end--OneBigNuke 1.3.1
local uDefs = UnitDefs or {}
local cps = 'customparams'
local wds = 'weapondefs'

local function addC(conName, newUnit)
	if
		uDefs[conName] and uDefs[conName].buildoptions and
		not table.contains(uDefs[conName].buildoptions, newUnit)
	then
		table.insert(uDefs[conName].buildoptions, newUnit)
	end
end

local function setDesc(def, name, tip)
	local latin = { 'en', 'fr', 'de', 'es' }
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_' .. latin[i] .. '_humanname'] = name
			end
			if tip then
				def[cps]['i18n_' .. latin[i] .. '_tooltip'] = tip
			end
		end
	end
end

local function addUnitToBO(newUnit, ...)
	local rest = { ... }
	for i, v in ipairs(rest) do
		addC(v, newUnit)
	end
end

local function mergeToNew(u, newU, obj)
	if uDefs[u] and not uDefs[newU] then
		uDefs[newU] = table.merge(uDefs[u], obj)
	end
	return uDefs[newU]
end

local nukeSettings = {
	health = 5900,
	maxthisunit = 1,
	buildtime = 4785000,
	energycost = 260000000,
	metalcost = 16000000,
}

local title = "Nuclear ICBM Launcher"
local tip = "Very expensive but it will do it's job with vigor'. Anti's for this are non existent'"

if uDefs["armsilo"] then
	local uDef = mergeToNew("armsilo", "armsiloexp", nukeSettings)
	uDef.icontype = "armsilo"
	local wDef = uDef[wds].nuclear_missile
	wDef.targetable = nil
	wDef.stockpiletime = 30
	wDef.areaofeffect = 3200
	wDef.damage.default = 1000000
	addUnitToBO("armsiloexp", "armack", "armaca", "armacv")
	setDesc(uDef, title, tip)
end

if uDefs["corsilo"] then
	local uDef = mergeToNew("corsilo", "corsiloexp", nukeSettings)
	uDef.icontype = "corsilo"
	local wDef = uDef[wds].crblmssl
	wDef.targetable = nil
	wDef.stockpiletime = 30
	wDef.areaofeffect = 3200
	wDef.damage.default = 1000000
	addUnitToBO("corsiloexp", "corack", "coraca", "coracv")
	setDesc(uDef, title, tip)
end

if uDefs["legsilo"] then
	local uDef = mergeToNew("legsilo", "legsiloexp", nukeSettings)
	uDef.icontype = "legsilo"
	local wDef = uDef[wds].legicbm
	wDef.targetable = nil
	wDef.stockpiletime = 30
	wDef.areaofeffect = 3200
	wDef.damage.default = 1000000
	wDef[cps].shield_aoe_penetration = true
	addUnitToBO("legsiloexp", "legack", "legaca", "legacv")
	setDesc(uDef, title, tip)
end--Riot Titan (Zop)
local uDefs = UnitDefs or {}
local cps = 'customparams'
local wds = 'weapondefs'
local wpn = 'weapons'

local tweakShieldTitan = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function round100(n)
	return math.floor(n * 0.01) * 100
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function mergeRec(def, ref)
	table.mergeInPlace(def, ref, true)
end

local function clear(m)
	for k, v in pairs(m) do
		m[k] = nil
	end
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de','es'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

--A titan that relies on energy to tank.
if tweakShieldTitan then
	local newID = 'armbanthx'
	uDefs[newID] = table.copy(uDefs['legcomt2def'])
	local def = uDefs[newID]
	mergeRec(def, uDefs['armbanth'])
	setDesc(def, 'Riot Titan', 'Heavy-Shielded Riot Mech')
	def.icontype = 'armbanth'
	def[cps].iscommander = nil
	def.showplayername = nil
	def.hidedamage = nil
	def.builder = false
	def.workertime = 0
	def.terraformspeed = 0
	def.buildoptions = {}
	def.cancapture = false
	def.capturable = true
	def.reclaimable = true
	def.metalmake = 0
	def.energymake = 0
	def.energystorage = 0
	def.metalcost = def.metalcost * 1.4
	def.energycost = def.energycost * 2.5
	def.buildtime = def.buildtime * 1.95
	def.radardistance = 0
	def.sonardistance = 0
	def.explodeas = 'mistexploxxl'
	def[cps].paralyzemultiplier = 0.2
	--Shield
	local shieldRad = def[cps]['shield_radius']
	local wDefShield = def[wds]['repulsor']
	wDefShield.shield.force = 5
	wDefShield.shield.power = round100(def.health * 0.3335)
	wDefShield.shield.powerregen = wDefShield.shield.power * 0.02
	wDefShield.shield.powerregenenergy = wDefShield.shield.powerregen * 5
	wDefShield.shield.intercepttype = 65535
	--Arms
	local wDefArms = def[wds]['armbantha_fire']
	local wDefRiot = uDefs['armmav'][wds]['armmav_weapon']
	clear(wDefArms)
	mergeRec(wDefArms, wDefRiot)
	wDefArms.projectiles = 4
	wDefArms.sprayangle = 1800
	wDefArms.weaponvelocity = wDefArms.weaponvelocity * 1.5
	wDefArms.reloadtime = wDefArms.reloadtime * 0.75
	wDefArms.range = 500
	wDefArms.soundstart = 'kroggie2xs'
	def[wpn][1].badtargetcategory = "VTOL GROUNDSCOUT"
	def[wpn][1].onlytargetcategory = 'SURFACE'
	--Shoulder
	local wDefLazer = def[wds]['tehlazerofdewm']
	local wDefLight = uDefs['armthor'][wds]['thunder']
	mergeRec(wDefLazer, wDefLight)
	wDefLazer.collidefriendly = false
	wDefLazer.beamtime = nil
	wDefLazer.burst = 15
	wDefLazer.burstburstrate = 0.03333
	wDefLazer.reloadtime = 0.5
	wDefLazer.energypershot = wDefLazer.energypershot * 2
	wDefLazer.range = round10(shieldRad * 1.4)
	wDefLazer.damage.default = round10(wDefLazer.damage.default * 0.325)
	wDefLazer.damage.commanders = wDefLazer.damage.default
	wDefLazer.damage.vtol = wDefLazer.damage.default
	--Backpack
	def[wpn][3].def = uDefs['legcomt2def'][wpn][3].def
	local wDefEMP = def[wds]['empgrenade']
	wDefEMP.projectiles = 3
	wDefEMP.sprayangle = 3600
	wDefEMP.commandfire = false
	wDefEMP.reloadtime = wDefEMP.reloadtime * 1.5
	wDefEMP.range = wDefArms.range
	wDefEMP.weaponvelocity = wDefArms.weaponvelocity * 0.5
	wDefEMP.damage.default = 10000
	wDefEMP.soundstart = 'lasfirerb'
	def[wpn][3].badtargetcategory = "VTOL GROUNDSCOUT"
	def[wpn][3].onlytargetcategory = 'SURFACE EMPABLE'
	--Labs
	addBO('armshltx', newID)
	addBO('armshltxuw', newID)
end--[[ TacMissileNerf(Ini_Wolf) ]] local uDefs=UnitDefs or{} local targets={'armemp','cortron','legperdition'} for _,n in ipairs(targets) do local d=uDefs[n] if d and d.weapondefs then for _,w in pairs(d.weapondefs) do w.customparams=w.customparams or{} w.customparams.stockpilelimit="3" end end end
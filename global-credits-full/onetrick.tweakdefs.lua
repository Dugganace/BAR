-- LavaPack (Djarshi) v5.0
local a=Spring.GetModOptions()local b=a.map_waterislava;local c=UnitDefs or{}local d={"arm","cor","leg"}local e='customparams'local f={}for g,h in pairs(c)do if h and h.buildoptions then table.insert(f,g)end end;local function i(h,j,k)local l={'en','fr','de','es'}if h then for m=1,#l do if j then h[e]['i18n_'..l[m]..'_humanname']=j end;if k then h[e]['i18n_'..l[m]..'_tooltip']=k end end end end;local function n(o)return math.floor(o*0.1)*10 end;local function p(q,r)if c[q]and c[q].buildoptions and not table.contains(c[q].buildoptions,r)then table.insert(c[q].buildoptions,r)end end;local function s(r,...)local t={...}for m,u in ipairs(t)do p(u,r)end end;local function v(w,x,y)if c[w]and not c[x]then c[x]=table.merge(c[w],y)end;return c[x]end;local function z(A,g)for m=1,#A do rmvBO(A[m],g)end end;local function B(g)z(f,g)end;local C="h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"c["armageo"].yardmap=C;c["corageo"].yardmap=C;c["armuwageo"].yardmap=C;c["coruwageo"].yardmap=C;if c["legageo"]then c["legageo"].yardmap=C end;for D,E in pairs({"arm","cor","leg"})do local o,F,G=E=="arm",E=="cor",E=="leg"v(E.."nanotct2",E.."nanotct3",{icontype="armrespawn",metalcost=3360,energycost=51200,builddistance=625,buildtime=88000,collisionvolumescales="61 128 61",footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=625,workertime=3000,reclaimspeed=2000,canrepeat=true,objectname=G and"Units/legnanotcbase.s3o"or F and"Units/CORRESPAWN.s3o"or"Units/ARMRESPAWN.s3o",customparams={i18n_en_humanname="Epic Construction Turret",i18n_en_tooltip="Even more build power!"}})v(E.."ageo",E.."ageot3",{icontype="armageo",buildtime=88000,collisionvolumeoffsets="0 0 0",collisionvolumescales="61 128 61",energycost=270000,energymake=12500,energystorage=120000,footprintx=7,footprintz=7,health=7120,idleautoheal=33,idletime=1800,maxacc=0,maxdec=0,maxslope=15,maxwaterdepth=5,metalcost=16000,objectname="Units/mission_command_tower.s3o",buildpic="scavengers/mission_command_tower.dds",script="mission_command_tower.cob",seismicsignature=0,selfdestructas="advgeo",yardmap="h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",sightdistance=345,customparams={i18n_en_humanname="Epic Geothermal Powerplant",i18n_en_tooltip="Produces 10x T2 Geothermal + has plasma deflector. (tweaked by Djarshi & txpera)",shield_color_mult=0.99,shield_power=3250,shield_radius=750},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.17,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=6700,powerregen=69,powerregenenergy=562.5,radius=750,repulser=true,smart=true,startingpower=1100,visiblerepulse=true,badcolor={[1]=1,[2]=0.2,[3]=0.2,[4]=0.2},goodcolor={[1]=0.2,[2]=1,[3]=0.2,[4]=0.17}}}},weapons={[1]={def="REPULSOR",onlytargetcategory="NOTSUB"}}})for D,H in pairs({E.."nanotc",E.."nanotct2"})do if c[H]then c[H].canrepeat=true end end;local I=E.."afust3"if c[I]then c[I].explodeas="customfusionexplo"c[I].selfdestructas="advancedFusionExplosionSelfd"end end;local J=v("lootboxplatinum","afuslegendary",{icontype="lootboxplatinum",buildpic="other/resourcecheat.dds",buildtime=120000,metalmake=0,footprintx=4,footprintz=4,yardmap="yooy oooo oooo yooy",explodeas="ScavComBossExplo",reclaimable=true,customparams={i18n_en_humanname="Legendary Fusion Reactor",i18n_en_tooltip="Makes 50x of AFUS, Transportable, Unique (Very Hazardous)",shield_color_mult=0.99,shield_power=56000,shield_radius=1250,fall_damage_multiplier=15},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.25,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=56000,powerregen=1300,powerregenenergy=100000,radius=1250,repulser=true,smart=true,startingpower=1,visiblerepulse=true,badcolor={[1]=1,[2]=0.1,[3]=0.1,[4]=0.1},goodcolor={[1]=0.1,[2]=1,[3]=0.1,[4]=0.1}}}},weapons={[1]={def="REPULSOR",onlytargetcategory="NOTSUB"}}})local K=c["armafus"]if K then J.metalcost=K.metalcost*30;J.energycost=K.energycost*30;J.energymake=K.energymake*50;J.energystorage=K.energystorage*50;J.health=K.health*10;J.maxthisunit=1 end;local function L(M,N,O,P,Q)if M and N then N.health=M.health*O;N.buildtime=M.buildtime*P*0.75;N.metalcost=M.metalcost*Q;N.energycost=M.energycost*Q;N.energymake=M.energymake*P;N.explodeas='advancedFusionExplosionSelfd'end end;do local O=1.5;local P=10;local Q=8;local R=c['armafust3']local S=c['corafust3']local T=c['legafust3']L(c['armafus'],R,O,P,Q)L(c['corafus'],S,O,P,Q)L(c['legafus'],T,O,P,Q)R.energystorage=R.energystorage*O;R.stealth=true;if hasLegion then i(T,nil,'Produces '..T.energymake..' Energy (Hazardous)')end;i(R,nil,'Produces '..R.energymake..' Energy (Hazardous)')i(S,nil,'Produces '..S.energymake..' Energy (Hazardous)')end;s("afuslegendary","armack","armaca","armacv")s("afuslegendary","corack","coraca","coracv")s("afuslegendary","legack","legaca","legacv")local U=v("armmoho","t3mmex",{icontype="armmoho",health=6200,metalstorage=2000,buildpic="scavengers/scavsafeareabeacon.DDS",buildtime=30000,reclaimable=true,objectname="scavs/scavsafeareabeacon.s3o",script="Units/ARMEYES.cob",energycost=24300,metalcost=1920,energyupkeep=500,explodeas="geo",extractsmetal=0.016,onoffable=true,yardmap="h oooooooo osssssso osssssso ossoosso ossoosso osssssso osssssso oooooooo",customparams={i18n_en_humanname="Epic Metal Extractor",i18n_en_tooltip="Metal Extraction / Storage (upkeep 500 energy/s)"}})s("t3mmex","armack","armaca","armacv")s("t3mmex","corack","coraca","coracv")s("t3mmex","legack","legaca","legacv")c["corjugg"].metalcost=c["corjugg"].metalcost*2.5;if c["legeheatraymech"]then c["legeheatraymech"].metalcost=c["legeheatraymech"].metalcost*1.5 end;if c["legeheatraymech_old"]then c["legeheatraymech_old"].metalcost=c["legeheatraymech_old"].metalcost*1.5 end;c["armbotrail"].health=0;c["armbotrail"].maxthisunit=0;s("armnanotct3","armack","armaca","armacv")s("armageot3","armack","armaca","armacv")s("cornanotct3","corack","coraca","coracv")s("corageot3","corack","coraca","coracv")s("legnanotct3","legack","legaca","legacv")s("legageot3","legack","legaca","legacv")s("armaca","legapt3","corapt3")s("coraca","armapt3","legapt3")s("legaca","corapt3","armapt3")c["armvulc"].metalcost=c["armvulc"].metalcost*10;c["corbuzz"].metalcost=c["corbuzz"].metalcost*10;if c["legstarfall"]then c["legstarfall"].metalcost=c["legstarfall"].metalcost*10 end;for V,W in ipairs({"armsy","armasy","corsy","corasy","legsy","legasy"})do if c[W]then c[W].health=0;c[W].maxthisunit=0 end end;local function X(h)local Y=6;local Z='oooooo oooooo oooooo oooooo oooooo oooooo'local _='collisionvolumeoffsets'local a0='collisionvolumescales'if h then local a1=h.footprintx;if a1>Y then if h[_]then h[_]='0 0 0'end;if h[a0]then h[a0]='90 45 90'end;h.footprintx=Y;h.footprintz=Y;h.yardmap=Z;if h[fds]then local a2=h[fds].dead;if a2 then a2[_]='0 0 0'a2[a0]='90 45 90'a2.footprintx=Y;a2.footprintz=Y end;local a3=h[fds].heap;if a3 then a3.footprintx=Y;a3.footprintz=Y end end end end end;for D,E in pairs({"armmmkrt3","cormmkrt3","legadveconvt3"})do if c[E]then c[E]=table.merge(c[E],{footprintx=6,footprintz=6})end end;for j,a4 in pairs(c)do if a4.energymake>0 then a4.metalcost=(a4.metalcost or 0)*0.9;a4.energycost=(a4.energycost or 0)*0.9 end end;if b then local a5='minwaterdepth'local a6=c['coruwgeo']c['armuwgeo'][a5]=a6[a5]for g,h in pairs(c)do if h['customparams'].metal_extractor or h['customparams'].geothermal then h.maxwaterdepth=a6.maxwaterdepth end;local a7=h[a5]if hasHoverTide and a7 then local a8=h.energymake or h.metalmake or h[e].unitgroup=='energy'or h[e].unitgroup=='metal'if a8 or h.buildoptions or h.waterline==nil then B(g)else h.waterline=0;h[a5]=1;h[e]=h[e]or{}h[e].enabled_on_no_sea_maps=true end elseif a7 and a7>0 then B(g)end;if h.cruisealtitude then if h.cansubmerge then h.cansubmerge=false end;if h.maxwaterdepth then h.maxwaterdepth=0 end end end end--OneBigNuke 1.3.1
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
end--T3 Fighters by onetrick
local HP=0.7
local W='legvenator'
local D={'legvenator','legafigdef','legfig'}
local G={'en','fr','de','es'}
local L={{'armfig','armhawk','armfigt3','armapt3','Tempest'},{'corveng','corvamp','corfigt3','corapt3','Revenant'},{'legfig','legafigdef','legfigt3','legapt3','Praetor'}}
local K,I={},{}
for k in ('metalcost# energycost# buildtime# health# speed turnrate# sightdistance# airsightdistance# range# reloadtime weaponvelocity# areaofeffect# flighttime'):gmatch('%S+') do
	local n=k:gsub('#','')
	K[#K+1]=n I[n]=n~=k
end
local function C(v)
	if type(v)~='table' then return v end
	local o={} for a,b in pairs(v) do o[a]=C(b) end return o
end
local function R(x,y)
	x,y=tonumber(x),tonumber(y)
	if x and y and x~=0 then return y*y/x end
end
local function A(t,k,v)
	if v then local e=t[k] if e then e[1],e[2]=e[1]+v,e[2]+1 else t[k]={v,1} end end
end
local function V(t,k,w)
	local e=t[k]
	if not e then return end
	local v=e[1]/e[2]
	if w then return math.floor(v+0.5) end
	return math.floor(v*10000+0.5)/10000
end
local function P(u)
	if type(u.weapondefs)~='table' then return end
	local n,d,c=nil,nil,0
	for a,b in pairs(u.weapondefs) do n,d,c=a,b,c+1 end
	if c==1 then return n,d end
end
local SU,SW,SD,SQ,B,N={},{},{},{}
for i=1,#L do
	local e=L[i]
	local a,b=UnitDefs[e[1]],UnitDefs[e[2]]
	if a and b then
		for j=1,#K do A(SU,K[j],R(a[K[j]],b[K[j]])) end
		local _,x=P(a)
		local n2,y=P(b)
		if x and y then
			for j=1,#K do A(SW,K[j],R(x[K[j]],y[K[j]])) end
			A(SQ,'r',tonumber(y.reloadtime))
			if type(x.damage)=='table' and type(y.damage)=='table' then
				for c,v in pairs(y.damage) do A(SD,c,R(x.damage[c],v)) end
			end
		end
		if not B then B,N=b,n2 end
	end
end
if not B then Spring.Echo('[T3F] no source fighters found') else
	local T=C(B)
	for j=1,#K do local k=K[j] local v=V(SU,k,I[k]) if v then T[k]=v end end
	T.health=math.max(1,math.floor((tonumber(T.health) or 0)*HP+0.5))

	local w=N and T.weapondefs[N]
	local fu=UnitDefs[W]
	if fu and type(fu.weapons)=='table' then
		local fn,fd=P(fu)
		if fn and fd then
			T.weapondefs={[fn]=C(fd)}
			T.weapons=C(fu.weapons)
			w=T.weapondefs[fn]
			Spring.Echo('[T3F] weapon: '..W..'/'..fn..' (flak)')
		end
	end
	if w then
		local r=V(SW,'range',true) if r then w.range=r end
		local q=V(SQ,'r') if q then w.reloadtime=q end
		if type(w.damage)~='table' then w.damage={} end
		for c in pairs(SD) do w.damage[c]=math.max(1,V(SD,c,true)) end
	end
	local s
	for i=1,#D do s=s or UnitDefs[D[i]] end
	if s and s.objectname then
		T.objectname=s.objectname
		T.script=s.script or T.script
		T.buildpic=s.buildpic or T.buildpic
		T.footprintx=tonumber(s.footprintx) or T.footprintx
		T.footprintz=tonumber(s.footprintz) or T.footprintz
	else
		Spring.Echo('[T3F] no skin donor found, keeping stock fighter model')
	end
	T.customparams=type(T.customparams)=='table' and T.customparams or {}
	T.customparams.techlevel,T.customparams.fighter=3,1
	
	T.customparams.armordef='vtol'
	T.canfly=true
	if type(T.category)=='string' then
		local c=T.category:gsub('%f[%w]NOTAIR%f[%W]','')
		if not c:find('VTOL') then c=c..' VTOL' end
		T.category=c:gsub('%s+',' '):gsub('^%s',''):gsub('%s$','')
	end
	for i=1,#L do
		local e=L[i]
		if not UnitDefs[e[3]] then
			local u=C(T)
			for q=1,#G do
				u.customparams['i18n_'..G[q]..'_humanname']=e[5]
				u.customparams['i18n_'..G[q]..'_tooltip']='Tier 3 Air Superiority Fighter'
			end
			UnitDefs[e[3]]=u
			local f,p=UnitDefs[e[4]],nil
			if f and type(f.buildoptions)=='table' then
				p=#f.buildoptions+1
				for j=1,#f.buildoptions do if f.buildoptions[j]==e[2] then p=j+1 break end end
				table.insert(f.buildoptions,p,e[3])
			end
			Spring.Echo('[T3F] '..e[3]..' m'..tostring(u.metalcost)..' hp'..tostring(u.health)..' @'..(p and e[4] or 'NO LAB '..e[4]))
		end
	end
end
--[[ TacMissileNerf(Ini_Wolf) ]] local uDefs=UnitDefs or{} local targets={'armemp','cortron','legperdition'} for _,n in ipairs(targets) do local d=uDefs[n] if d and d.weapondefs then for _,w in pairs(d.weapondefs) do w.customparams=w.customparams or{} w.customparams.stockpilelimit="5" end end end
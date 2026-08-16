--T3 Flying AntiAir v3-alpha
local UnitDefs=UnitDefs or{}local function a(b)local c=type(b)local d;if c=='table'then d={}for e,f in next,b,nil do d[a(e)]=a(f)end;setmetatable(d,a(getmetatable(b)))else d=b end;return d end;local function g(h)return"t3aa_"..h end;local i={corcrw=function(j)local k=a(j)k.category="ALL WEAPON VTOL NOTSUB NOTHOVER"k.cruisealtitude=230;k.health=k.health/2;k.nochasecategory="NOTAIR VTOL"local l=k.customparams or{}l.i18n_en_humanname="AA Archaic Dragon"l.i18n_en_tooltip="Supportive Flying Anti-Air Fortress"l.armordef="VTOL"k.customparams=l;local m=k.weapondefs;m.krowlaser=a(UnitDefs.corcrw.weapondefs.krowlaser2)local n=m.krowlaser;n.avoidfriendly=false;n.collidefriendly=false;n.name="High Energy Anti-Air Laser"n.predictboost=1;n.range=1000;n.reloadtime=1.3;n.damage={vtol=200}m.krowlaser2=a(UnitDefs.cordoom.weapondefs.atadr)local o=m.krowlaser2;o.avoidfriendly=false;o.collidefriendly=false;o.name="Long-Range Anti-Air Tachyon Accelerator"o.predictboost=1;o.range=1500;o.reloadtime=3;o.damage={vtol=750}for p,q in pairs(k.weapons)do q.badtargetcategory="NOTAIR"q.onlytargetcategory="VTOL"end;return k end,corcrwh=function(j)local k=a(j)k.category="ALL WEAPON VTOL NOTSUB NOTHOVER"k.cruisealtitude=220;k.nochasecategory="NOTAIR"local l=k.customparams or{}l.i18n_en_humanname="AA Dragon"l.i18n_en_tooltip="Aggressive Flying Anti-Air Fortress"l.armordef="VTOL"k.customparams=l;local m=k.weapondefs;local n=m.krowlaserh;n.avoidfriendly=false;n.collidefriendly=false;n.name="Anti-Air Laser"n.predictboost=1;n.range=650;n.reloadtime=1.3;n.damage={vtol=150}m.dragonmawh=a(UnitDefs.corflak.weapondefs.armflak_gun)local o=m.krowlaser2;o.avoidfriendly=false;o.collidefriendly=false;o.name="Heavy Flak Cannon"o.predictboost=1;o.range=840;o.damage={vtol=300}for p,q in pairs(k.weapons)do q.badtargetcategory="NOTAIR"q.onlytargetcategory="VTOL"end;return k end,corcrwt4=function(j)local k=a(j)k.category="ALL WEAPON VTOL NOTSUB NOTHOVER"k.cruisealtitude=260;k.energycost=k.energycost*2;k.metalcost=k.metalcost*2;k.nochasecategory="NOTAIR"local l=k.customparams or{}l.i18n_en_humanname="Epic AA Dragon"l.i18n_en_tooltip="Gigantic Flying Anti-Air Fortress"l.armordef="VTOL"k.customparams=l;local m=k.weapondefs;m.kmaw=a(UnitDefs.corjugg.weapondefs.juggernaut_fire)local r=m.kmaw;r.avoidfriendly=false;r.collidefriendly=false;r.gravityaffected=false;r.name="Nuclear Flak Cannon"r.predictboost=1;r.range=590;r.reloadtime=5;r.weaponvelocity=590;r.damage={vtol=1200}m.krowbosslaser=a(UnitDefs.cordoom.weapondefs.atadr)local s=m.krowbosslaser;s.avoidfriendly=false;s.collidefriendly=false;s.name="Long-Range Anti-Air Tachyon Accelerator"s.predictboost=1;s.range=1500;s.reloadtime=3;s.damage={vtol=750}m.krowbosslaser2=a(UnitDefs.corflak.weapondefs.armflak_gun)local t=m.krowbosslaser2;t.avoidfriendly=false;t.collidefriendly=false;t.name="Heavy Flak Cannon"t.predictboost=1;t.range=840;t.damage={vtol=300}m.edragon_missile=a(UnitDefs.corscreamer.weapondefs.cor_advsam)local u=m.edragon_missile;u.stockpiletime=2.7;u.stockpilelimit=10;for p,q in pairs(k.weapons)do q.badtargetcategory="NOTAIR"q.onlytargetcategory="VTOL"end;k.weapons[4].def="KROWBOSSLASER2"k.weapons[6].def="KROWBOSSLASER2"return k end,legfortt4=function(j)local k=a(j)k.category="ALL WEAPON VTOL NOTSUB NOTHOVER"k.cruisealtitude=260;k.nochasecategory="NOTAIR VTOL"local l=k.customparams or{}l.i18n_en_humanname="Epic AA Tyrannus"l.i18n_en_tooltip="Gigantic Flying Anti-Air Fortress"l.armordef="VTOL"k.customparams=l;local m=k.weapondefs;m.semiauto=a(UnitDefs.legmg.weapondefs.armmg_weapon)local v=m.semiauto;v.avoidfriendly=false;v.beamtime=0.07;v.burst=v.burst*2;v.burstrate=0.02;v.corethickness=0.45;v.collidefriendly=false;v.name="Heavy Rapid-fire Anti-Air Gun"v.predictboost=1;v.range=1500;v.reloadtime=0.4;v.sprayangle=968*4;v.thickness=7.5;v.damage={default=1,vtol=120}m.plasma=a(UnitDefs.leglraa.weapondefs.railgunt2)local w=m.plasma;w.avoidfriendly=false;w.collidefriendly=false;w.energypershot=0;w.proximitypriority=-1;w.reloadtime=0.66;local x=m.aa_missiles;x.flighttime=5;x.range=1900;x.reload=0.2;x.weaponacceleration=1600;for p,q in pairs(k.weapons)do if q.def=="SEMIAUTO"or q.def=="PLASMA"then q.badtargetcategory="NOTAIR"q.onlytargetcategory="VTOL"end;if q.def=="SEMIAUTO"or q.def=="AA_MISSILES"then q.fastautoretargeting=true end end;return k end,legfort=function(j)local k=a(j)k.category="ALL WEAPON VTOL NOTSUB NOTHOVER"k.cruisealtitude=230;k.nochasecategory="NOTAIR VTOL"local l=k.customparams or{}l.i18n_en_humanname="AA Tyrannus"l.i18n_en_tooltip="Flying Anti-Air Fortress"l.armordef="VTOL"k.customparams=l;local m=k.weapondefs;m.semiauto=a(UnitDefs.legmg.weapondefs.armmg_weapon)local v=m.semiauto;v.avoidfriendly=false;v.burst=v.burst*2;v.burstrate=0.03;v.collidefriendly=false;v.name="Rapid-fire Anti-Air Gun"v.predictboost=1;v.range=1000;v.reloadtime=0.4;v.sprayangle=968*4;v.damage={default=1,vtol=60}m.plasma=a(UnitDefs.leglupara.weapondefs.legflak_gun)local w=m.plasma;w.avoidfriendly=false;w.burst=1;w.collidefriendly=false;w.energypershot=0;w.range=1500;w.reloadtime=0.66;local x=m.aa_missiles;x.range=1250;for p,q in pairs(k.weapons)do if q.def=="SEMIAUTO"or q.def=="PLASMA"then q.badtargetcategory="NOTAIR"q.onlytargetcategory="VTOL"end;if q.def=="SEMIAUTO"or q.def=="AA_MISSILES"then q.fastautoretargeting=true end end;return k end,legstarfall=function(j)local k=a(j)local l=k.customparams or{}l.i18n_en_humanname="Epic Cacophony"l.i18n_en_tooltip="Extreme Land/Air Gatling Gun Turret"k.customparams=l;local m=k.weapondefs;m.starfire=a(UnitDefs.legmg.weapondefs.armmg_weapon)local v=m.starfire;v.avoidfriendly=false;v.beamtime=0.07;v.burst=189;v.burstrate=0.01;v.collidefriendly=false;v.corethickness=0.45;v.duration=0.07;v.interceptedbyshieldtype=4;v.name="Very Long-Range Rapid-fire Gatling Gun"v.predictboost=1;v.range=2000;v.reloadtime=5;v.sprayangle=968/1.5;v.thickness=7.5;v.tolerance=3000;v.weaponvelocity=1000;v.damage={default=100,vtol=200}for p,q in pairs(k.weapons)do q.badtargetcategory=nil;q.onlytargetcategory="NOTSUB VTOL"end;k.weapons[2]=nil;return k end}for h,y in pairs(i)do if UnitDefs[h]then local z,k=g(h),y(UnitDefs[h])k.id=g(h)k.icontype=h;UnitDefs[g(h)]=k end end;for A,B in pairs(UnitDefs)do if type(B.buildoptions)=="table"then for p,C in ipairs(B.buildoptions)do if i[C]~=nil then local z=g(C)Spring.Echo("Attempting to add "..z.." to "..A)local D=false;for E,F in ipairs(B.buildoptions)do if F==z then D=true;break end end;if D==false then table.insert(B.buildoptions,z)Spring.Echo("Added "..z.." to "..A)end end end end end;if UnitDefs["coraap"]then table.insert(UnitDefs["coraap"].buildoptions,g("corcrw"))endUnitDefs["legparadrone"] = table.copy(UnitDefs["legdrone"])
UnitDefs["legparadrone"].customparams.i18nfromunit = "legdrone"
UnitDefs["legparadrone"].health = 2000

UnitDefs["legparagon"] = table.copy(UnitDefs["leghive"])
UnitDefs["legparagon"].metalcost = 2000
UnitDefs["legparagon"].energycost = 20000
UnitDefs["legparagon"].buildtime = 30000
UnitDefs["legparagon"].footprintx = 4
UnitDefs["legparagon"].footprintz = 4
UnitDefs["legparagon"].health = 20000
UnitDefs["legparagon"].sightdistance = 500
UnitDefs["legparagon"].customparams.techlevel = 3
UnitDefs["legparagon"].idleautoheal = 50
UnitDefs["legparagon"].idletime = 800
UnitDefs["legparagon"].customparams.i18n_en_humanname = "Paragon"
UnitDefs["legparagon"].customparams.i18n_en_tooltip = "Advanced fortification which produces up to 6 drones with miniguns"
UnitDefs["legparagon"].crushresistance = 5000

UnitDefs["cortyrant"] = table.copy(UnitDefs["corfort"])
UnitDefs["cortyrant"].metalcost = 6000
UnitDefs["cortyrant"].energycost = 40000
UnitDefs["cortyrant"].buildtime = 40000
UnitDefs["cortyrant"].footprintx = 2
UnitDefs["cortyrant"].footprintz = 6
UnitDefs["cortyrant"].health = 40000
UnitDefs["cortyrant"].sightdistance = 200
UnitDefs["cortyrant"].customparams.techlevel = 3
UnitDefs["cortyrant"].customparams.i18n_en_humanname = "Tyrant"
UnitDefs["cortyrant"].customparams.i18n_en_tooltip = "Advanced memoryalloy fortification which can regenerate."
UnitDefs["cortyrant"].idleautoheal = 0
UnitDefs["cortyrant"].idletime = 0
UnitDefs["cortyrant"].autoheal = 400
UnitDefs["cortyrant"].crushresistance = 10000
UnitDefs["cortyrant"].customparams.buildinggrounddecalsizex = 4
UnitDefs["cortyrant"].customparams.buildinggrounddecalsizey = 8
UnitDefs["cortyrant"].collisionvolumescales = "32 52 96"

UnitDefs["armfirewall"] = table.copy(UnitDefs["armlwall"])
UnitDefs["armfirewall"].metalcost = 3000
UnitDefs["armfirewall"].energycost = 20000
UnitDefs["armfirewall"].buildtime = 30000
UnitDefs["armfirewall"].footprintx = 4
UnitDefs["armfirewall"].footprintz = 4
UnitDefs["armfirewall"].sightdistance = 500
UnitDefs["armfirewall"].health = 25000
UnitDefs["armfirewall"].customparams.techlevel = 3
UnitDefs["armfirewall"].customparams.i18n_en_humanname = "Equalizer"
UnitDefs["armfirewall"].customparams.i18n_en_tooltip = "Advanced fortification with a lightning arc EMP."
UnitDefs["armfirewall"].crushresistance = 5000
UnitDefs["armfirewall"].customparams.buildinggrounddecalsizex = 6
UnitDefs["armfirewall"].customparams.buildinggrounddecalsizey = 6


UnitDefs["armnanotc3"] = table.copy(UnitDefs["armrespawn"])
UnitDefs["armnanotc3"].customparams.i18n_en_humanname = "Epic Construction Turret"
UnitDefs["armnanotc3"].customparams.i18n_en_tooltip = "Enormous assist & repair in a very short radius"
UnitDefs["armnanotc3"].builddistance = 200
UnitDefs["armnanotc3"].sightdistance = 500
UnitDefs["armnanotc3"].energymake = 50
UnitDefs["armnanotc3"].blocking = true
UnitDefs["armnanotc3"].workertime = 10000
UnitDefs["armnanotc3"].energycost = 200000
UnitDefs["armnanotc3"].metalcost = 10000
UnitDefs["armnanotc3"].buildtime = 100000
UnitDefs["armnanotc3"].minwaterdepth = -1000
UnitDefs["armnanotc3"].maxslope = 36

UnitDefs["cornanotc3"] = table.copy(UnitDefs["correspawn"])
UnitDefs["cornanotc3"].customparams.i18n_en_humanname = "Epic Construction Turret"
UnitDefs["cornanotc3"].customparams.i18n_en_tooltip = "Enormous assist & repair in a very short radius"
UnitDefs["cornanotc3"].builddistance = 200
UnitDefs["cornanotc3"].sightdistance = 500
UnitDefs["cornanotc3"].energymake = 50
UnitDefs["cornanotc3"].blocking = true
UnitDefs["cornanotc3"].workertime = 10000
UnitDefs["cornanotc3"].energycost = 200000
UnitDefs["cornanotc3"].metalcost = 10000
UnitDefs["cornanotc3"].buildtime = 100000
UnitDefs["cornanotc3"].minwaterdepth = -1000
UnitDefs["cornanotc3"].maxslope = 36

UnitDefs["legnanotc3"] = table.copy(UnitDefs["legnanotcbase"])
UnitDefs["legnanotc3"].customparams.i18n_en_humanname = "Epic Construction Turret"
UnitDefs["legnanotc3"].customparams.i18n_en_tooltip = "Enormous assist & repair in a very short radius"
UnitDefs["legnanotc3"].builddistance = 200
UnitDefs["legnanotc3"].sightdistance = 500
UnitDefs["legnanotc3"].energymake = 50
UnitDefs["legnanotc3"].blocking = true
UnitDefs["legnanotc3"].workertime = 10000
UnitDefs["legnanotc3"].energycost = 200000
UnitDefs["legnanotc3"].metalcost = 10000
UnitDefs["legnanotc3"].buildtime = 100000
UnitDefs["legnanotc3"].minwaterdepth = -1000
UnitDefs["legnanotc3"].maxslope = 36

UnitDefs["corageot3"] = table.copy(UnitDefs["corageo"])
UnitDefs["corageot3"].customparams.i18n_en_humanname = "Barrage"
UnitDefs["corageot3"].customparams.i18n_en_tooltip = "Geothermal seeker rocket platform"
UnitDefs["corageot3"].metalcost = 3000
UnitDefs["corageot3"].energycost =40000
UnitDefs["corageot3"].buildtime = 40000
UnitDefs["corageot3"].energymake = 600
UnitDefs["corageot3"].energystorage = 30000
UnitDefs["corageot3"].customparams.techlevel = 3
UnitDefs["corageot3"].health = 6000
UnitDefs["corageot3"].sightdistance = 500
UnitDefs["corageot3"].customparams.removestop = false
UnitDefs["corageot3"].customparams.removewait = false
UnitDefs["corageot3"].onoffable = true
UnitDefs["corageot3"].script = "Units/CORSILO.cob"

UnitDefs["armageot3"] = table.copy(UnitDefs["armageo"])
UnitDefs["armageot3"].customparams.i18n_en_humanname = "Outpost"
UnitDefs["armageot3"].customparams.i18n_en_tooltip = "Geothermal cloakable intelligence providing vision, jammer, tremorsense, and 100k storage."
UnitDefs["armageot3"].metalcost = 2700
UnitDefs["armageot3"].energycost =38000
UnitDefs["armageot3"].buildtime = 35000
UnitDefs["armageot3"].energymake = 600
UnitDefs["armageot3"].energystorage = 100000
UnitDefs["armageot3"].metalmake = 1
UnitDefs["armageot3"].metalstorage = 100000
UnitDefs["armageot3"].customparams.techlevel = 3
UnitDefs["armageot3"].health = 4000
UnitDefs["armageot3"].seismicdistance = 2000
UnitDefs["armageot3"].radardistancejam = 800
UnitDefs["armageot3"].sightdistance = 2000
UnitDefs["armageot3"].cloakCost = 100
UnitDefs["armageot3"].minCloakDistance = 100
UnitDefs["armageot3"].canCloak = true
UnitDefs["armageot3"].initCloaked = true

for name, ud in pairs(UnitDefs) do
  local cp = ud.customparams
  if ud.buildoptions and tonumber(cp.techlevel) == 2 and tonumber(ud.maxacc)>0 then
    if name:find("^arm") then
      table.insert(ud.buildoptions, "armageot3")
      table.insert(ud.buildoptions, "armnanotc3")
      table.insert(ud.buildoptions, "armfirewall")
    elseif name:find("^cor") then
      table.insert(ud.buildoptions, "corageot3")
      table.insert(ud.buildoptions, "cornanotc3")
      table.insert(ud.buildoptions, "cortyrant")
    elseif name:find("^leg") then
      table.insert(ud.buildoptions, "legnanotc3")
      table.insert(ud.buildoptions, "legparagon")
    end
  end
end--Building Nanos (Navy Added)
local function a(b)local c=type(b)local d;if c=='table'then d={}for e,f in next,b,nil do d[a(e)]=a(f)end;setmetatable(d,a(getmetatable(b)))else d=b end;return d end;local function g(h,i)local j=a(h.buildoptions)i.buildoptions={}for k,l in ipairs(j)do i.buildoptions[k]=l end end;local UnitDefs=UnitDefs or{}local m={'arm','cor','leg'}for n,o in ipairs(m)do do local p={o..'nanotc',o..'respawn','legnanotcbase'}for n,q in ipairs(p)do if UnitDefs[q]then g(UnitDefs[o..'ck'],UnitDefs[q])end end end;do local r={o..'frock',o..'gplat'}if UnitDefs[o..'nanotcplat']then local s=o..'cs'local t={}if o=='leg'then s='legnavyconship't={'legfhive'}end;for n,l in ipairs(t)do table.insert(r,l)end;g(UnitDefs[s],UnitDefs[o..'nanotcplat'])for n,l in ipairs(r)do table.insert(UnitDefs[o..'nanotcplat'].buildoptions,l)end end end;do local r={o..'apt3',o..'afust3',o..'gatet3',o..'nanotct2',o..'wint2',o..'aap',o..'avp'}local t={}if o=='arm'then t={'armminivulc','armbotrail','armannit3','armmmkrt3','armshockwave','armlwall'}elseif o=='cor'then t={'corminibuzz','corhllllt','cordoomt3','cormmkrt3','cormwall'}elseif o=='leg'then t={'legministarfall','legadveconvt3','legmohocon','legrwall'}end;for n,l in ipairs(t)do table.insert(r,l)end;if UnitDefs[o..'nanotct2']then g(UnitDefs[o..'ack'],UnitDefs[o..'nanotct2'])for n,l in ipairs(r)do table.insert(UnitDefs[o..'nanotct2'].buildoptions,l)end end end;do local r={o..'fgate',o..'nanotc2plat'}if UnitDefs[o..'nanotc2plat']then g(UnitDefs[o..'acsub'],UnitDefs[o..'nanotc2plat'])for n,l in ipairs(r)do table.insert(UnitDefs[o..'nanotc2plat'].buildoptions,l)end end end end--Uneven Surface Begone
for name, ud in pairs(UnitDefs) do
    if (ud.isbuilding) or (ud.speed == nil or ud.speed == 0) then
        ud.maxslope = 90 
        if not ud.isfactory then
            ud.levelground = false 
            ud.upright = false      
        else
            ud.levelground = true
            ud.upright = true
        end
    end
end--Omni Commanders Mini
local UnitDefs = UnitDefs or {}

-- Extra Build Options (Omni Faction Commanders)
local extraBuildOptions = {
	armcom = {
		"corlab","corvp","corsy","corhp","corap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	corcom = {
		"armlab","armvp","armsy","armhp","armap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	legcom = {
		"armlab","armvp","armsy","armhp","armap",
		"corlab","corvp","corsy","corhp","corap",
		"armfhp","corfhp","legfhp",
	},
}

local level2Units = {
	armcom = {"corexp", "legmext15"},
	corcom = {"armamex", "legmext15"},
	legcom = {"armamex", "corexp"},
}

local level5Units = {
	armcom = {"cormexp", "legmohocon", "corbhmth", "legrampart"},
	corcom = {"armshockwave", "legmohocon", "legrampart"},
	legcom = {"armshockwave", "cormexp", "corbhmth"},
}

for baseName, extras in pairs(extraBuildOptions) do
	for lvl = 0, 10 do
		local unitName = lvl == 0 and baseName or (baseName .. "lvl" .. lvl)
		local uDef = UnitDefs[unitName]
		if uDef and uDef.buildoptions then
			for _, option in ipairs(extras) do
				table.insert(uDef.buildoptions, option)
			end

			if lvl >= 2 and lvl <= 4 and level2Units[baseName] then
				for _, option in ipairs(level2Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end

			if lvl >= 5 and level5Units[baseName] then
				for _, option in ipairs(level5Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end
		end
	end
endlocal a,b,c=UnitDefs,table.merge,table.copy;a.legendary_pulsar={name="Legendary Pulsar",description="A pinnacle of Armada engineering that fires devastating, rapid-fire tachyon bolts.",buildpic="ARMANNIT3.DDS",buildtime=280000,health=75000,metalcost=32000,energycost=800000,damagemodifier=0.15,energystorage=6000,idleautoheal=10,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0 15 0",collisionvolumescales="81 122 81",collisionvolumetype="Box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=72,maxslope=10,maxwaterdepth=0,nochasecategory="MOBILE",objectname="Units/scavbuildings/ARMANNIT3.s3o",onoffable=true,radardistance=1800,radaremitheight=72,script="Units/ARMANNI.cob",usePieceCollisionVolumes=1,seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1200,yardmap="oooooo oooooo oooooo oooooo oooooo oooooo",customparams={i18n_en_humanname="Legendary Pulsar",i18n_en_tooltip="Fires devastating, rapid-fire tachyon bolts at extreme range.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/armannit3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Cremuss",normaltex="unittextures/Arm_normal.dds",removewait=true,subfolder="ArmBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 1.06567382829e-05 -0.0",collisionvolumescales="62.5 81.7362213135 62.5",collisionvolumetype="Box",damage=3600,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=11640,object="Units/scavbuildings/armannit3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=1800,footprintx=5,footprintz=5,height=4,metal=4656,object="Units/arm3X3B.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="obli"},select={[1]="obli"}},weapondefs={tachyon_burst_cannon={name="Tachyon Burst Cannon",weapontype="LaserCannon",rgbcolor="0.2 0.7 1.0",burst=3,burstrate=0.15,reloadtime=1.8,accuracy=400,areaofeffect=128,range=1800,energypershot=500,turret=true,soundstart="annigun1",soundhit="xplolrg3",impulsefactor=0,weaponvelocity=1500,thickness=10,explosiongenerator="custom:tachyonshot",damage={default=3550}, allowNonBlockingAim = true, avoidfeature = false, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="tachyon_burst_cannon",onlytargetcategory="SURFACE"}}}
a.legendary_bastion={name="Legendary Bastion",description="The ultimate defensive emplacement. Projects a devastating, pulsating heatray.",health=75000,metalcost=48000,energycost=1450000,buildtime=180000,objectname="scavs/scavbeacon_t4.s3o",script="scavs/scavbeacon.cob",buildpic="scavengers/SCAVBEACON.DDS",maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",corpse="DEAD",damagemodifier=0.20,energystorage=1000,explodeas="largeBuildingexplosiongeneric",footprintx=5,footprintz=5,idleautoheal=2,idletime=1800,losemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",onoffable=true,radardistance=1200,radaremitheight=80,seismicsignature=0,selfdestructas="largeBuildingExplosionGenericSelfd",sightdistance=780,yardmap="yoooy ooooo ooooo ooooo yoooy",customparams={i18n_en_humanname="Legendary Bastion",i18n_en_tooltip="Projects a devastating, pulsating purple heatray.",maxrange=1400,usebuildinggrounddecal=true,buildinggrounddecaltype="decals/legbastion_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Gabs",normaltex="unittextures/leg_normal.dds",removewait=true,subfolder="CorBuildings/LandDefenceOffence",techlevel=3},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",damage=5400,featuredead="HEAP",footprintx=3,footprintz=3,height=20,metal=2911,object="Units/legbastion_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=2700,footprintx=3,footprintz=3,height=4,metal=1644,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="doom"},select={[1]="doom"}},weapondefs={legendary_bastion_ray={name="Legendary Heat Ray",thickness=15,rgbcolor="1.0 0.2 1.0",range=1400,damage={default=2995,vtol=15},weapontype="BeamLaser",reloadtime=0.3,soundstart="banthie2",soundtrigger=true,areaofeffect=120,avoidfeature=false,avoidfriendly=true,beamtime=0.3,camerashake=0.1,corethickness=0.3,craterareaofeffect=120,craterboost=0,cratermult=0,edgeeffectiveness=0.45,energypershot=500,explosiongenerator="custom:laserhit-medium-purple",firestarter=90,firetolerance=300,impulsefactor=0,laserflaresize=6,noselfdamage=true,predictboost=0.3,proximitypriority=1,rgbcolor2="0.9 1.0 0.5",soundhitdry="",soundhitwet="sizzle",turret=true,weaponvelocity=1500, allowNonBlockingAim = true, collidefriendly = false}},weapons={[1]={badtargetcategory="VTOL GROUNDSCOUT",def="legendary_bastion_ray",onlytargetcategory="SURFACE"}}}
a.legendary_bulwark={name="Legendary Bulwark",description="A pinnacle of defensive technology, the Legendary Bulwark annihilates all who approach.",buildpic="CORDOOMT3.DDS",buildtime=250000,health=95000,metalcost=45000,energycost=1250000,damagemodifier=0.15,energystorage=5000,idleautoheal=15,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 -7.5 0.0",collisionvolumescales="72.0 165.0 72.0",collisionvolumetype="box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",objectname="Units/scavbuildings/CORDOOMT3.s3o",usePieceCollisionVolumes=1,onoffable=true,radardistance=1400,radaremitheight=80,script="Units/CORDOOM.cob",seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1100,yardmap="yyooyy oooooo oooooo oooooo oooooo yyooyy",customparams={i18n_en_humanname="Legendary Bulwark",i18n_en_tooltip="The ultimate defensive structure.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/cordoomt3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Mr Bob",normaltex="unittextures/cor_normal.dds",removewait=true,paralyzemultiplier=0.2,subfolder="CorBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.281730651855 -0.153618286133 3.57356262207",collisionvolumescales="80.6815948486 91.7637634277 82.1471252441",collisionvolumetype="Box",damage=10800,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=9666,object="Units/scavbuildings/cordoomt3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=5400,footprintx=5,footprintz=5,height=4,metal=3864,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="armag"},select={[1]="armag"}},weapondefs={legendary_overload_scatter={name="Overload Scatter Beamer",weapontype="BeamLaser",range=1500,reloadtime=0.1,sprayangle=3000,projectiles=12,rgbcolor="0.8 0.1 1.0",accuracy=50,allowNonBlockingAim=true,areaofeffect=10,beamdecay=0.05,beamtime=0.1,beamttl=1,corethickness=0.25,burnblow=true,cylindertargeting=1,edgeeffectiveness=0.15,explosiongenerator="custom:laserhit-medium-purple",firestarter=100,impulsefactor=0.123,intensity=0.7,laserflaresize=9.35,noselfdamage=true,soundhitwet="sizzle",soundstart="beamershot2",tolerance=5000,thickness=6,turret=true,weaponvelocity=1000,damage={default=500}, avoidfeature = false, avoidfriendly = false, collidefriendly = false},legendary_heat_ray={name="Armageddon Heat Ray",weapontype="BeamLaser",range=1300,reloadtime=4.0,areaofeffect=72,avoidfeature=false,beamtime=0.6,cameraShake=350,corethickness=0.40,craterareaofeffect=72,energypershot=1200,explosiongenerator="custom:genericshellexplosion-medium-beam",impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,rgbcolor="1 0.8 0",rgbcolor2="0.8 0 0",scrollspeed=5,soundhitdry="",soundhitwet="sizzle",soundstart="heatray2xl",soundtrigger=1,thickness=7,tolerance=10000,turret=true,weaponvelocity=1800,damage={default=10000,commanders=1350}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false},legendary_point_defense={name="Point Defense Laser",weapontype="BeamLaser",range=750,reloadtime=0.5,areaofeffect=12,avoidfeature=false,beamtime=0.3,corethickness=0.32,energypershot=500,explosiongenerator="custom:laserhit-large-blue",firestarter=90,impactonly=1,impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,proximitypriority=0,rgbcolor="0 0 1",soundhitdry="",soundhitwet="sizzle",soundstart="annigun1",soundtrigger=1,texture3="largebeam",thickness=5.5,tilelength=150,tolerance=10000,turret=true,weaponvelocity=1500,damage={default=500,commanders=999}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="legendary_overload_scatter"},[2]={def="legendary_heat_ray"},[3]={def="legendary_point_defense"}}}
local d={"armack","armacv","armaca","armacsub","armcomlvl4"}for e,f in ipairs(d)do if a[f]then table.insert(a[f].buildoptions,'legendary_pulsar')end end;local g={"legack","legacv","legaca"}for e,f in ipairs(g)do if a[f]then table.insert(a[f].buildoptions,'legendary_bastion')end end;local h={"corack","coracv","coraca","coracsub"}for e,f in ipairs(h)do if a[f]then table.insert(a[f].buildoptions,'legendary_bulwark')end end-- Self-Balanced Randomizer

local mild = {
armpincer = true,
corgarp = true,
legamphtank = true,
armanac = true,
corsnap = true,
legner = true,
armsh = true,
corsh = true,
legsh = true,
armzapper = true
}

function RNG(f,t,s,u)f=f or.5 t=t or 2 s=s or.5 if u and mild[u]then t=t*1.5 end local n if math.random()<s then local mn=math.min(f,1)local mx=math.max(f,1)n=math.random()*(mx-mn)+mn else local mn=math.min(1,t)local mx=math.max(1,t)n=math.random()*(mx-mn)+mn end return n end

-- Custom weapon weight
local weaponWeightOverrides={
["armmar"]={["armamph_missile"]=1/2},
["armthor"]={["arm_thunder"]=.85,["emp"]=1/5},
["armbanth"]={["bantha_rocket"]=1/3},
["corshiva"]={["shiva_rocket"]=1/2},
["cordemon"]={["karg_shoulder"]=1/2},
["corjugg"]={global_mult=.3,["juggernaut_fire"]=.95},
["corkorg"]={["corkorg_rocket"]=1/4},
["corgolt4"]={["corgol_sidelaser"]=1/2},
["legjav"]={["aa_gun"]=1/3},
["legeshotgunmech"]={global_mult=.6,["shotgun"]=.9,["parabolic_rockets"]=1/6},
["legeheatraymech"]={["legflak_gun"]=1/4},
["legeheatraymech_old"]={["legflak_gun"]=1/4},
["legeallterrainmech"]={["light_antiair_missile"]=1/4},
["armlun"]={["depthcharge"]=1/3},
["corsok"]={["depthcharge"]=1/3},
["legehovertank"]={["depthcharge"]=1/3,["parabolic_rockets"]=1/4},
["corcrwh"]={["dragon_missileh"]=1/5},
["legfort"]={["aa_missiles"]=1/5},
["legfortt4"]={["aa_missiles"]=1/5},
["armepoch"]={["ferret_missile"]=1/7},
["armfepocht4"]={["ferret_missile"]=1/9},
["corblackhy"]={["ferret_missile"]=1/7},
["corfblackhyt4"]={["ferret_missile"]=1/9},
["cordoom"]={["doomsday_red_laser"]=1/3},
["armcroc"]={["armcl_missile"]=1/2},
["armvang"]={["shocker_low"]=.9},
["armguard"]={["plasma"]=.9},
["armamb"]={["armamb_gun"]=.9},
["corpun"]={["plasma"]=.9},
["cortoast"]={["cortoast_gun"]=.9},
["legcluster"]={["plasma"]=.9},
["legacluster"]={["plasma"]=.9},
["armcom"]={global_mult=.4,["disintegrator"]=.99},
["corcom"]={global_mult=.4,["disintegrator"]=.99},
["legcom"]={global_mult=.4,["disintegrator"]=.99},
}

for name, ud in pairs(UnitDefs) do
if not string.find(name, "scavengerboss") then
	local log_power = 0
	local spice = mild[name] and -0.105 or 0
	local cp = ud.customparams

	local o_metal = ud.metalcost or ud.buildcostmetal or 404
	local o_energy = ud.energycost or ud.buildcostenergy or 404
	local o_buildtime = ud.buildtime or 404

	-- The terminal of base weights for self-balance
	local HEALTH = 0.55
	local SPEED = 0.65
	local ACC = 0.09
	local DEC = 0.06
	local TURNRATE = 0.12
	local SIGHT = 0.15
	local DAMAGE = 0.60
	local RELOAD = -0.50
	local RANGE = 0.45
	local AOE = 0.05
	local SPRAYANGLE = -0.25
	local VELOCITY = 0.18
	local BURST = 0.59
	local SHLD_R = 0.95
	local SHLD_P = 0.75

-- HEALTH
local hv=ud.health or ud.maxdamage if hv then local m=RNG(.6,4,.6,name)local nh=math.ceil(hv*m)ud.health=nh ud.maxdamage=nh log_power=log_power+HEALTH*math.log(m)end

-- SPEED
if ud.speed then local m=RNG(.5,3,.6,name)if ud.canfly and m>1 then m=m*.6 end ud.speed=ud.speed*m log_power=log_power+SPEED*math.log(m)if ud.cloakcostmoving then ud.cloakcostmoving=math.ceil(ud.cloakcostmoving*m)end end

-- ACCELERATION
if ud.maxacc then local m=RNG(.4,3,.45,name)ud.maxacc=ud.maxacc*m log_power=log_power+ACC*math.log(m)end

-- DECELERATION
if ud.maxdec then local m=RNG(.4,3,.45,name)ud.maxdec=ud.maxdec*m log_power=log_power+DEC*math.log(m)end

-- TURNRATE
if ud.turnrate then local m=RNG(.4,3,.45,name)ud.turnrate=ud.turnrate*m log_power=log_power+TURNRATE*math.log(m)end

-- SIGHT
if ud.sightdistance then local m=RNG(.3,1.5,.6,name)ud.sightdistance=ud.sightdistance*m log_power=log_power+SIGHT*math.log(m)end

-- WEIGHTLESS UNIT STATS
ud.verticalspeed=ud.verticalspeed and ud.verticalspeed*RNG(.4,3,.6,name)
ud.idleautoheal=ud.idleautoheal and ud.idleautoheal*RNG(.6,10,.8,name)
ud.idletime=ud.idletime and ud.idletime*RNG(.6,1.9,.45,name)

-- WEAPONS
if not(cp and cp.unitgroup=="explo")then
local wd=ud.weapondefs 
if wd then local wc=0 local nb={} for wn,w in pairs(wd)do 
local bogus=false 
local wcp=w.customparams 
if wcp and wcp.bogus and wcp.bogus==1 then if w.damage then local dd=w.damage.default or 0 local vd=w.damage.vtol or 0 if dd==0 and vd==0 then bogus=true end else bogus=true end end if not bogus then wc=wc+1 nb[wn]=w end end 
local uw=weaponWeightOverrides[name]
local fixmednum1
local slowness=1
if ud.speed then local s=ud.speed
slowness=1+2*(.25)^(s/100)if slowness<1 then slowness=1 end else slowness=3 end

for wn,w in pairs(nb)do local ww if uw then if uw[wn]then ww=uw[wn]else ww=1/math.sqrt(wc)if uw.global_mult then ww=ww*uw.global_mult end end else ww=1/math.sqrt(wc)end if wn=="cluster_munition"then ww=ww*.5 end

local napalm=(w.soundhitdry=="flamhit1")
local isNuke=(w.soundstart=="nukelaunch")
local isAntinuke=(w.soundstart=="antinukelaunch")
local wcp=w.customparams 
local ov=w.weaponvelocity or 1000 
local os=w.sprayangle or 0 
local of=w.flighttime
local ob=w.burst or 1

--DAMAGE
if w.damage and not napalm and not isAntinuke then local isAA=(w.damage.vtol or 0)>(w.damage.default or 0) if w.damage.default then local dm=RNG(.4,2.2,.45,name)w.damage.default=w.damage.default*dm log_power=log_power+DAMAGE*ww*math.log(dm)if w.damage.commanders then w.damage.commanders=w.damage.commanders*dm end if w.damage.shields then w.damage.shields=w.damage.shields*dm end if w.thickness then w.thickness=w.thickness*dm end if w.laserflaresize then w.laserflaresize=w.laserflaresize*dm end end if w.damage.vtol then local vm=RNG(.4,2.2,.45,name)w.damage.vtol=w.damage.vtol*vm local vw=isAA and 1 or .2 log_power=log_power+DAMAGE*vw*ww*math.log(vm)end end

-- SHIELD
if w.shield then if w.shield.radius then local rad=RNG(.6,1.8,.6,name)w.shield.radius=math.ceil(w.shield.radius*rad) log_power=log_power+SHLD_R*ww*math.log(rad)if cp and cp.shield_radius then cp.shield_radius=cp.shield_radius*rad end if w.shield.power then local pow=RNG(.7,1.4,.6,name)local op=w.shield.power local new_power=w.shield.power*pow local rc=(rad+3)/4 new_power=new_power/rc w.shield.power=math.ceil(new_power) local em=w.shield.power/op log_power=log_power+SHLD_P*ww*math.log(em)if cp and cp.shield_power then cp.shield_power=cp.shield_power*pow end if w.shield.startingpower then w.shield.startingpower=w.shield.startingpower*pow end end end end

-- RELOAD
if w.reloadtime then local rm=RNG(.3,1.9,.45,name)w.reloadtime=w.reloadtime*rm log_power=log_power+RELOAD*ww*math.log(rm)end

-- BURST
if w.burst then local bm=RNG(.6,1.67,.6,name)local newb=w.burst*bm w.burst=math.floor(newb+.5)local op=ob+1 local np=w.burst+1 local pm=np/op log_power=log_power+BURST*ww*math.log(pm)end

-- RANGE
local rm=1 if w.range then rm=RNG(.4,2.5,.45,name)w.range=w.range*rm local rw=RANGE*ww*slowness if w.weapontype=="BeamLaser"then rw=rw*1.3 elseif w.weapontype=="LightningCannon"then rw=rw*1.6 end local nv=w.weaponvelocity or ov if w.tracking==false and nv<1000 then rw=rw*(nv/1000)end if w.tracking==false and w.sprayangle then local ns=w.sprayangle or os if ns>0 then rw=rw-(ns/10000)if rw<0 then rw=0 end end end if not(wn=="skybeam"or w.weapontype=="AircraftBomb")then log_power=log_power+rw*math.log(rm)end if w.mygravity~=nil or w.weaponvelocity then w.mygravity=(w.mygravity or.11)/rm end end

-- WEAPON VELOCITY
if w.weaponvelocity then local vm=RNG(.4,2.2,.45,name)w.weaponvelocity=w.weaponvelocity*vm if wn~="juggernaut_fire"then log_power=log_power+VELOCITY*ww*math.log(vm)end if w.mygravity~=nil then w.mygravity=w.mygravity*(vm*vm)end if w.flighttime and of then w.flighttime=w.flighttime*(rm/vm)end end

-- AREA OF EFFECT
if w.areaofeffect and not napalm and not w.noexplode and not isAntinuke then local am=RNG(.4,3.3,.6,name)w.areaofeffect=w.areaofeffect*am local as=w.areaofeffect/100 local aw=AOE*(as^1.5)*ww log_power=log_power+aw*math.log(am)if isNuke then if w.weaponvelocity then w.weaponvelocity=w.weaponvelocity/math.sqrt(am)end if w.weaponacceleration then w.weaponacceleration=w.weaponacceleration/math.sqrt(am)end end end

-- SPRAYANGLE
if w.sprayangle then local sm=RNG(.5,3,.6,name)local ns=w.sprayangle*sm w.sprayangle=ns local sw=SPRAYANGLE*ww*slowness if ns>0 then sw=sw/math.pow(ns,1/3)end log_power=log_power+sw*math.log(sm)end

--WEIGHTLESS WEAPON STATS
w.weapontimer=w.weapontimer and w.weapontimer*RNG(.6,1.67,.6,name)
w.beamtime=w.beamtime and w.beamtime*RNG(.6,1.67,.6,name)
w.edgeeffectiveness=w.edgeeffectiveness and w.edgeeffectiveness*RNG(.6,1.67,.6,name)
w.burstrate=w.burstrate and w.burstrate*RNG(.6,1.67,.6,name)
w.impulsefactor=w.impulsefactor and w.impulsefactor*RNG(.6,2.5,.33,name)
if w.startvelocity then local svm=RNG(.4,2.5,.6,name)w.startvelocity=w.startvelocity*svm if w.flighttime and svm<1 then w.flighttime=w.flighttime/svm end end
if w.weaponacceleration then local am=RNG(.4,2.5,.6,name)if isNuke and am>.8 then am=am*.5 elseif isAntinuke and am<.8 then am=am*2 end w.weaponacceleration=w.weaponacceleration*am if w.flighttime and am<1 then w.flighttime=w.flighttime/am end end

-- Miscellaneous limits
if w.edgeeffectiveness and w.edgeeffectiveness>.9 then w.edgeeffectiveness=.9 end
if w.ownerExpAccWeight then w.ownerExpAccWeight=math.min(w.ownerExpAccWeight,1.5)end
if wcp and wcp.overrange_distance then wcp.overrange_distance=72000 end

--OPman's limits
if(isNuke or isAntinuke)then if w.range>72000 then w.range=72000 end if isAntinuke then w.flighttime=400 w.turnrate=5000+(w.weaponacceleration*50)end if isNuke then w.startvelocity=30 w.weapontimer=2+(3000/w.weaponacceleration^1.7)+((w.areaofeffect or 900)-900)/750 end end

if wn=="legmed_missile"then fixmednum1=w.range end
if wn=="laser"and fixmednum1 then w.range=fixmednum1 end

end

local src for wn,w in pairs(wd)do local wcp=w.customparams if wcp and wcp.smart_priority then src=w break end end if src then for wn,w in pairs(wd)do local wcp=w.customparams if wcp and wcp.smart_trajectory_checker then w.range=src.range w.weaponvelocity=src.weaponvelocity w.mygravity=src.mygravity break end end end
end end

	-- COSTS (50% base for pace)
	local cost_mult = math.exp(log_power + spice)
	cost_mult = math.max(0.1, math.min(10.0, cost_mult)) * 0.5

	local mcost = math.ceil(o_metal * cost_mult)
	local ecost = math.ceil(o_energy * cost_mult)
	local bpcost = math.ceil(o_buildtime * cost_mult)

-- normalize big eco by cost, else too much simcity efficiency 
if(ud.speed==nil or ud.speed<1)then
if ud.energymake then if ud.energymake>0 and ud.energymake<=500 then mcost=math.ceil(mcost+ud.energymake*.5)elseif ud.energymake>500 then mcost=math.ceil(mcost+(ud.energymake-400))end end
if ud.tidalgenerator and ud.tidalgenerator>0 then mcost=math.ceil(mcost+10)end
if ud.windgenerator and ud.windgenerator>0 then mcost=math.ceil(mcost+ud.windgenerator*.4)end
if cp and cp.energyconv_capacity and cp.energyconv_efficiency then mcost=math.ceil(mcost+(cp.energyconv_efficiency-.014)*cp.energyconv_capacity*200)end
if ud.builder==true then mcost=math.ceil(mcost*1.5)ecost=math.ceil(ecost*1.5)bpcost=math.ceil(bpcost*1.5)end
end

	ud.metalcost = mcost
	ud.energycost = ecost
	ud.buildtime = bpcost
end
end

-- bugfixed Burst/Reload overlap (20% allowance for chance of constant machineguns) 
for n,u in pairs(UnitDefs)do if u.weapondefs then for w,d in pairs(u.weapondefs)do if d.burst and d.reloadtime and d.burstrate and d.burstrate>0 then local r=d.reloadtime local b=d.burstrate*d.burst if r<=b*.8 then local c=math.floor(b/r)+1 local p=d.projectiles or 1 local np=p*c d.projectiles=np d.reloadtime=r*(np/p)end end end end end

-- normalize coms with big and smol D-guns 
for n,u in pairs(UnitDefs)do if u.weapondefs then for w,d in pairs(u.weapondefs)do if w=="disintegrator"then local r=d.range if r and u.speed then if r<250 then u.speed=u.speed+(250-r)*.1 elseif r>250 then u.speed=u.speed*math.max(.5,1-(r-250)*.001)end end break end end end end





-- please take care, in order to save up on chars and fit all of this into one single tweak, at the cost of readability, the original code of Self-Balancer had obviously undergone machined Ultra Condensing Of doom Deluxe

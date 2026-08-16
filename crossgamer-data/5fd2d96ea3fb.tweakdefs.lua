-- LavaT3pack Djarshi v4.11 Modified
local races = {"arm", "cor", "leg"}
local a, b, c, d, e, f, g =
    UnitDefs or {},
    {"arm", "cor", "leg"},
    table.merge,
    {arm = "Armada ", cor = "Cortex ", leg = "Legion "},
    "_taxed",
    1.5,
    table.contains

local function h(i, j, k)
    if a[i] and not a[j] then
        a[j] = c(a[i], k)
    end
end

local function addC(conName, newUnit)
    if
        UnitDefs[conName] and UnitDefs[conName].buildoptions and
            not table.contains(UnitDefs[conName].buildoptions, newUnit)
     then
        table.insert(UnitDefs[conName].buildoptions, newUnit)
    end
end

local function addUnitToBO(newUnit, ...)
    local rest = {...}
    for i, v in ipairs(rest) do
        addC(v, newUnit)
    end
end

local function mergeToNew(u, newU, obj)
    if UnitDefs[u] and not UnitDefs[newU] then
        UnitDefs[newU] = table.merge(UnitDefs[u], obj)
    end
    return UnitDefs[newU]
end

local ym =
    "h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
UnitDefs["armageo"].yardmap = ym
UnitDefs["corageo"].yardmap = ym
UnitDefs["armuwageo"].yardmap = ym
UnitDefs["coruwageo"].yardmap = ym
if (UnitDefs["legageo"]) then
    UnitDefs["legageo"].yardmap = ym
end

for l, m in pairs(b) do
    local n, o, p = m == "arm", m == "cor", m == "leg"
    h(
        m .. "nanotct2",
        m .. "nanotct3",
        {
            icontype = "armrespawn",
            metalcost = 3360,
            energycost = 51200,
            builddistance = 625,
            buildtime = 88000,
            collisionvolumescales = "61 128 61",
            footprintx = 6,
            footprintz = 6,
            health = 8800,
            mass = 37200,
            sightdistance = 625,
            workertime = 3000,
            canrepeat = true,
            objectname = p and "Units/legnanotcbase.s3o" or o and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",
            customparams = {
                i18n_en_humanname = "Epic Construction Turret",
                i18n_en_tooltip = "Even more build power!"
            }
        }
    )
    h(
        m .. "ageo",
        m .. "ageot3",
        {
            icontype = "armageo",
            buildtime = 88000,
            collisionvolumeoffsets = "0 0 0",
            collisionvolumescales = "61 128 61",
            energycost = 270000,
            energymake = 12500,
            energystorage = 120000,
            footprintx = 7,
            footprintz = 7,
            health = 7120,
            idleautoheal = 33,
            idletime = 1800,
            maxacc = 0,
            maxdec = 0,
            maxslope = 15,
            maxwaterdepth = 5,
            metalcost = 16000,
            objectname = "Units/mission_command_tower.s3o",
            buildpic = "scavengers/mission_command_tower.dds",
            script = "mission_command_tower.cob",
            seismicsignature = 0,
            selfdestructas = "advgeo",
            -- extended from 'ym' of other geo's
            yardmap = "h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",
            sightdistance = 345,
            customparams = {
                i18n_en_humanname = "Epic Geothermal Powerplant",
                i18n_en_tooltip = "Produces 10x T2 Geothermal + has plasma deflector. (tweaked by Djarshi & txpera)",
                shield_color_mult = 0.99,
                shield_power = 3250,
                shield_radius = 750
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
                        energyupkeep = 0,
                        force = 2.5,
                        intercepttype = 1,
                        power = 6700,
                        powerregen = 69,
                        powerregenenergy = 562.5,
                        radius = 750,
                        repulser = true,
                        smart = true,
                        startingpower = 1100,
                        visiblerepulse = true,
                        badcolor = {
                            [1] = 1,
                            [2] = 0.2,
                            [3] = 0.2,
                            [4] = 0.2
                        },
                        goodcolor = {
                            [1] = 0.2,
                            [2] = 1,
                            [3] = 0.2,
                            [4] = 0.17
                        }
                    }
                }
            },
            weapons = {
                [1] = {
                    def = "REPULSOR",
                    onlytargetcategory = "NOTSUB"
                }
            }
        }
    )

    for l, q in pairs({m .. "nanotc", m .. "nanotct2"}) do
        if a[q] then
            a[q].canrepeat = true
        end
    end

    local AFU = m .. "afust3"
    if a[AFU] then
        a[AFU].explodeas = "customfusionexplo"
        a[AFU].selfdestructas = "advancedFusionExplosionSelfd"
    end
end

local newAfus =
    mergeToNew(
    "lootboxplatinum",
    "afuslegendary",
    {
        icontype = "lootboxplatinum",
        buildpic = "other/resourcecheat.dds",
        buildtime = 120000,
        metalmake = 0,
        footprintx = 4,
        footprintz = 4,
        yardmap = "yooy oooo oooo yooy",
        explodeas = "ScavComBossExplo",
        reclaimable = true,
        customparams = {
            i18n_en_humanname = "Legendary Fusion Reactor",
            i18n_en_tooltip = "Makes 50x of AFUS, Transportable, Unique (Very Hazardous)",
            shield_color_mult = 0.99,
            shield_power = 56000,
            shield_radius = 1250,
            fall_damage_multiplier = 15
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
                    alpha = 0.25,
                    armortype = "shields",
                    energyupkeep = 0,
                    force = 2.5,
                    intercepttype = 1,
                    power = 56000,
                    powerregen = 1300,
                    powerregenenergy = 100000,
                    radius = 1250,
                    repulser = true,
                    smart = true,
                    startingpower = 1,
                    visiblerepulse = true,
                    badcolor = {
                        [1] = 1,
                        [2] = 0.1,
                        [3] = 0.1,
                        [4] = 0.1
                    },
                    goodcolor = {
                        [1] = 0.1,
                        [2] = 1,
                        [3] = 0.1,
                        [4] = 0.1
                    }
                }
            }
        },
        weapons = {
            [1] = {
                def = "REPULSOR",
                onlytargetcategory = "NOTSUB"
            }
        }
    }
)

local normAfus = UnitDefs["armafus"]
if (normAfus) then
    newAfus.metalcost = normAfus.metalcost * 30
    newAfus.energycost = normAfus.energycost * 30
    newAfus.energymake = normAfus.energymake * 50
    newAfus.energystorage = normAfus.energystorage * 50
    newAfus.health = normAfus.health * 10
    newAfus.maxthisunit = 1
end

addUnitToBO("afuslegendary", "armack", "armaca", "armacv")
addUnitToBO("afuslegendary", "corack", "coraca", "coracv")
addUnitToBO("afuslegendary", "legack", "legaca", "legacv")

-- t3mex
local newT3Mex =
    mergeToNew(
    "armmoho",
    "t3mmex",
    {
        icontype = "armmoho",
        health = 6200,
        metalstorage = 2000,
        buildpic = "scavengers/scavsafeareabeacon.DDS",
        buildtime = 30000,
        reclaimable = true,
        objectname = "scavs/scavsafeareabeacon.s3o",
        script = "Units/ARMEYES.cob",
        energycost = 24300,
        metalcost = 1920,
        energyupkeep = 500,
        explodeas = "geo",
        extractsmetal = 0.016,
        onoffable = true,
        yardmap = "h oooooooo osssssso osssssso ossoosso ossoosso osssssso osssssso oooooooo",
        customparams = {
            i18n_en_humanname = "Epic Metal Extractor",
            i18n_en_tooltip = "Metal Extraction / Storage (upkeep 500 energy/s)"
        }
    }
)

addUnitToBO("t3mmex", "armack", "armaca", "armacv")
addUnitToBO("t3mmex", "corack", "coraca", "coracv")
addUnitToBO("t3mmex", "legack", "legaca", "legacv")

-- converter size fix
for l, m in pairs({"armmmkrt3", "cormmkrt3", "legadveconvt3"}) do
    if (UnitDefs[m]) then
        UnitDefs[m] = table.merge(UnitDefs[m], {footprintx = 6, footprintz = 6})
    end
end

UnitDefs["corjugg"].metalcost = UnitDefs["corjugg"].metalcost * 2.5
UnitDefs["legeheatraymech"].metalcost = UnitDefs["legeheatraymech"].metalcost * 1.5
if (UnitDefs["legeheatraymech_old"]) then
    UnitDefs["legeheatraymech_old"].metalcost = UnitDefs["legeheatraymech_old"].metalcost * 1.5
end

UnitDefs["armbotrail"].health = 0
UnitDefs["armbotrail"].maxthisunit = 0

addUnitToBO("armnanotct3", "armack", "armaca", "armacv")
addUnitToBO("armageot3", "armack", "armaca", "armacv")
addUnitToBO("cornanotct3", "corack", "coraca", "coracv")
addUnitToBO("corageot3", "corack", "coraca", "coracv")
addUnitToBO("legnanotct3", "legack", "legaca", "legacv")
addUnitToBO("legageot3", "legack", "legaca", "legacv")

--Omni Commanders Mini
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
end-- Self-Balanced Randomizer

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

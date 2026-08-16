--BaRandom v29 by LoH + edits by Luigi
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.72;local c=7;local d=0.2;local e=0.5;local f=5;local g={0,0,0}local h={28,28,28}local i={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75}local j={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50}local k={["Glass Cannon"]={{"Phantom",i,{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}},{"Plague",{},{fs=1.0,aoe=1.15,dmg=0.9}},{"Bouncer",{},{impf=6.0,impb=2.0,dmg=0.6}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}},{"GravWell",{},{impf=-2.0,aoe=1.4,dmg=0.8}}},["Sniper"]={{"Phantom",i,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}},{"Drunk",{},{wob=4000,dnc=60,acc=2.5,aoe=1.3}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}},{"Plague",{},{fs=1.0,aoe=1.15,dmg=0.9}},{"Bouncer",{},{impf=6.0,impb=2.0,dmg=0.6}}},["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}}},["Watchtower"]={{"Phantom",j,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"GravWell",{},{impf=-2.0,aoe=1.4,dmg=0.8}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3}},{"Berserker",{},{dmg=1.3,aoe=1.3}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}},{"Drunk",{},{wob=4000,dnc=60,acc=2.5,aoe=1.3}}}}-- LavaT3pack Djarshi v4.13
local mods = Spring.GetModOptions()
local noNukes = mods.unit_restrictions_nonukes
local noNukeDef = mods.unit_restrictions_noantinuke
local debugFast = false
local races = {"arm", "cor", "leg"}
local a, b, c, d, e, f, g =
    UnitDefs or {},
    {"arm", "cor", "leg"},
    table.merge,
    {arm = "Armada ", cor = "Cortex ", leg = "Legion "},
    "_taxed",
    1.5,
    table.contains

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


if (debugFast) then
  -- T2 air buildable by t1
  addUnitToBO("armaca", "armck", "armca", "armcv")
  addUnitToBO("coraca", "corack", "corca", "corcv")
  addUnitToBO("legaca", "legck", "legca", "legcv")
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
    mergeToNew(
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
    mergeToNew(
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




UnitDefs["corjugg"].metalcost = UnitDefs["corjugg"].metalcost * 2.5
if (UnitDefs["legeheatraymech"]) then
    UnitDefs["legeheatraymech"].metalcost = UnitDefs["legeheatraymech"].metalcost * 1.5
end
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

-- cross faction conplane builds.
addUnitToBO( "armaca", "legapt3", "corapt3" )
addUnitToBO( "coraca", "armapt3", "legapt3" )
addUnitToBO( "legaca", "corapt3", "armapt3" )

UnitDefs["armvulc"].metalcost = UnitDefs["armvulc"].metalcost * 10
UnitDefs["corbuzz"].metalcost = UnitDefs["corbuzz"].metalcost * 10
if (UnitDefs["legstarfall"]) then
    UnitDefs["legstarfall"].metalcost = UnitDefs["legstarfall"].metalcost * 10
end

local units = {
    "armsy",
    "armasy",
    "corsy",
    "corasy",
    "legsy",
    "legasy"
}

for _, unit in ipairs(units) do
    if ( UnitDefs[unit] ) then
        UnitDefs[unit].health = 0
        UnitDefs[unit].maxthisunit = 0
    end
end
-- converter size fix
for l, m in pairs({"armmmkrt3", "cormmkrt3", "legadveconvt3"}) do
    if (UnitDefs[m]) then
        UnitDefs[m] = table.merge(UnitDefs[m], {footprintx = 6, footprintz = 6})
    end
end




local factions = {'armade', 'legion', 'cortex'}
local plants = {
    armade = {},
    legion = {},
    cortex = {}
}
local COST_MULTIPLIER = 2.0
local function copyUnitWithCost(origDef, name)
    if not origDef return nil
    local copy = Sypring.CopyUnitDef(origDef)
    copy.name = name
    copy.buildCostMetal = copy.buildCostMetal * COST_MULTIPLER
    copy.buildCostEnergy = copy.buildCostEnergy * COST_MULTIPLIER
    return copy
end
local for_, fraction in pairds(factions) do
    local conSet = fraction...i -- this is the constructor name that will build
    for unitName, unitDef in utds do
        if unitDef unitName then
          table.insert(conSet.buildOptions, unitName)
        end
    end
end
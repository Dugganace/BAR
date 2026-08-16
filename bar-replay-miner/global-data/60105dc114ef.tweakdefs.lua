-- Lava T3 Eco Pack - Core
if UnitDefs["armcom"] then
  local ud = UnitDefs["armcom"]
  ud.health = ud.health
end
if UnitDefs["armcom"] then
local ud = UnitDefs["armcom"]
ud.health = ud.health
end
local function deepcopy(orig, seen)
if type(orig) ~= "table" then return orig end
if seen and seen[orig] then return seen[orig] end
local s = seen or {}
local copy = {}
s[orig] = copy
for k, v in next, orig, nil do
copy[deepcopy(k, s)] = deepcopy(v, s)
end
return setmetatable(copy, deepcopy(getmetatable(orig), s))
end
local function mergeToNew(srcName, newName, changes)
local src = UnitDefs[srcName]
if not src then return nil end
local newDef = deepcopy(src)
for k, v in pairs(changes or {}) do
newDef[k] = v
end
UnitDefs[newName] = newDef
return newDef
end
local function addUnitToBO(unitName, ...)
for _, builderName in ipairs({...}) do
local ud = UnitDefs[builderName]
if ud and ud.buildoptions then
local exists = false
for _, bo in ipairs(ud.buildoptions) do
if bo == unitName then exists = true
break
end
end
if not exists then
table.insert(ud.buildoptions, unitName)
end
end
end
end
mergeToNew("armnanotc", "armt3nano", {
health = 7500,
buildtime = 100000,
metalcost = 6000,
energycost = 80000,
workertime = 2000,
footprintx = 4,
footprintz = 4,
customparams = {
i18n_en_humanname = "T3 Nano Turret",
i18n_en_tooltip = "Endgame build support turret",
},
})
mergeToNew("cornanotc", "cort3nano", {
health = 7500,
buildtime = 100000,
metalcost = 6000,
energycost = 80000,
workertime = 2000,
footprintx = 4,
footprintz = 4,
customparams = {
i18n_en_humanname = "T3 Nano Turret",
i18n_en_tooltip = "Endgame build support turret",
},
})
mergeToNew("legnanotc", "legt3nano", {
health = 7500,
buildtime = 100000,
metalcost = 6000,
energycost = 80000,
workertime = 2000,
footprintx = 4,
footprintz = 4,
customparams = {
i18n_en_humanname = "T3 Nano Turret",
i18n_en_tooltip = "Endgame build support turret",
},
})
mergeToNew("armmoho", "t3mmex", {
icontype = "armmoho",
description = "Metal Extraction / Storage (upkeep 2000 energy/s)",
health = 8000,
metalstorage = 2000,
buildpic = "scavengers/scavsafeareabeacon.DDS",
buildtime = 30000,
reclaimable = true,
objectname = "scavs/scavsafeareabeacon.s3o",
script = "Units/ARMEYES.cob",
energycost = 55000,
metalcost = 2750,
energyupkeep = 2000,
explodeas = "geo",
extractsmetal = 0.024,
onoffable = true,
yardmap = "h oooooooo osssssso osssssso ossoosso ossoosso osssssso osssssso oooooooo",
customparams = {
i18n_en_humanname = "Epic Metal Extractor",
i18n_en_tooltip = "Metal Extraction / Storage (upkeep 2000 energy/s)",
},
})
if UnitDefs["t3mmex"] and UnitDefs["armmoho"] then
UnitDefs["t3mmex"].customparams = UnitDefs["t3mmex"].customparams or {}
if UnitDefs["armmoho"].customparams then
for k, v in pairs(UnitDefs["armmoho"].customparams) do
if UnitDefs["t3mmex"].customparams[k] == nil then
UnitDefs["t3mmex"].customparams[k] = v
end
end
end
end
local lavaGeoYardmap =
"h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
if UnitDefs["armageo"] then UnitDefs["armageo"].yardmap = lavaGeoYardmap end
if UnitDefs["armuwageo"] then UnitDefs["armuwageo"].yardmap = lavaGeoYardmap end
mergeToNew(
"armnanotct2",
"armnanotct3",
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
objectname = "Units/ARMRESPAWN.s3o",
customparams = {
i18n_en_humanname = "Epic Construction Turret",
i18n_en_tooltip = "Even more build power!"
}
}
)
mergeToNew(
"armageo",
"armageot3",
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
yardmap = "h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",
sightdistance = 345,
customparams = {
i18n_en_humanname = "Epic Geothermal Powerplant",
i18n_en_tooltip = "Produces 10x T2 Geothermal + has plasma deflector.",
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
badcolor = {[1] = 1, [2] = 0.2, [3] = 0.2, [4] = 0.2},
goodcolor = {[1] = 0.2, [2] = 1, [3] = 0.2, [4] = 0.17}
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
for _, q in pairs({"armnanotc", "armnanotct2"}) do
if UnitDefs[q] then
UnitDefs[q].canrepeat = true
end
end
if UnitDefs["armafust3"] then
UnitDefs["armafust3"].explodeas = "customfusionexplo"
UnitDefs["armafust3"].selfdestructas = "advancedFusionExplosionSelfd"
end
local coreLavaGeoYardmap =
"h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
if UnitDefs["corageo"] then UnitDefs["corageo"].yardmap = coreLavaGeoYardmap end
if UnitDefs["coruwageo"] then UnitDefs["coruwageo"].yardmap = coreLavaGeoYardmap end
mergeToNew(
"cornanotct2",
"cornanotct3",
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
objectname = "Units/CORRESPAWN.s3o",
customparams = {
i18n_en_humanname = "Epic Construction Turret",
i18n_en_tooltip = "Even more build power!"
}
}
)
mergeToNew(
"corageo",
"corageot3",
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
yardmap = "h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",
sightdistance = 345,
customparams = {
i18n_en_humanname = "Epic Geothermal Powerplant",
i18n_en_tooltip = "Produces 10x T2 Geothermal + has plasma deflector.",
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
badcolor = {[1] = 1, [2] = 0.2, [3] = 0.2, [4] = 0.2},
goodcolor = {[1] = 0.2, [2] = 1, [3] = 0.2, [4] = 0.17}
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
for _, q in pairs({"cornanotc", "cornanotct2"}) do
if UnitDefs[q] then
UnitDefs[q].canrepeat = true
end
end
local legLavaGeoYardmap =
"h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
if UnitDefs["legageo"] then UnitDefs["legageo"].yardmap = legLavaGeoYardmap end
mergeToNew(
"legnanotct2",
"legnanotct3",
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
objectname = "Units/legnanotcbase.s3o",
customparams = {
i18n_en_humanname = "Epic Construction Turret",
i18n_en_tooltip = "Even more build power!"
}
}
)
mergeToNew(
"legageo",
"legageot3",
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
yardmap = "h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",
sightdistance = 345,
customparams = {
i18n_en_humanname = "Epic Geothermal Powerplant",
i18n_en_tooltip = "Produces 10x T2 Geothermal + has plasma deflector.",
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
badcolor = {[1] = 1, [2] = 0.2, [3] = 0.2, [4] = 0.2},
goodcolor = {[1] = 0.2, [2] = 1, [3] = 0.2, [4] = 0.17}
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
for _, q in pairs({"legnanotc", "legnanotct2"}) do
if UnitDefs[q] then
UnitDefs[q].canrepeat = true
end
end
mergeToNew("armack", "armecobot", {
health = 10000,
buildtime = 140000,
energycost = 120000,
metalcost = 8000,
workertime = 2000,
customparams = {
i18n_en_humanname = "Experimental Construction Bot",
i18n_en_tooltip = "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter",
},
})
mergeToNew("corack", "corecobot", {
health = 10000,
buildtime = 14000,
energycost = 120000,
metalcost = 8000,
workertime = 2000,
customparams = {
i18n_en_humanname = "Experimental Construction Bot",
i18n_en_tooltip = "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter",
},
})
mergeToNew("legack", "legecobot", {
health = 10000,
buildtime = 14000,
energycost = 120000,
metalcost = 8000,
workertime = 2000,
customparams = {
i18n_en_humanname = "Experimental Construction Bot",
i18n_en_tooltip = "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter",
},
})
-- DIAGNOSTIC: OverCommander donor rebuild removed
addUnitToBO("armecobot", "armshltx")
addUnitToBO("corecobot", "corgant")
addUnitToBO("legecobot", "leggant")
for _, ud in pairs(UnitDefs)do
if ud.buildoptions then
for i = #ud.buildoptions, 1, -1 do
if ud.buildoptions[i] == "armt3mex" or ud.buildoptions[i] == "cort3mex" or ud.buildoptions[i] == "legt3mex" then
table.remove(ud.buildoptions, i)
end
end
end
end
local function removeUnitFromBO(unitName, ...)
for _, builderName in ipairs({...}) do
local ud = UnitDefs[builderName]
if ud and ud.buildoptions then
for i = #ud.buildoptions, 1, -1 do
if ud.buildoptions[i] == unitName then
table.remove(ud.buildoptions, i)
end
end
end
end
end
-- diagnostic: removal disabled
removeUnitFromBO("corecobot", "corack", "coraca", "coracv")
-- diagnostic: removal disabled
-- Lava T3 Eco Pack - Support
if UnitDefs["armcom"] then
  local ud = UnitDefs["armcom"]
  ud.health = ud.health
end
local function removeUnitFromBO(unitName, ...)
  for _, builderName in ipairs({...}) do
    local ud = UnitDefs[builderName]
    if ud and ud.buildoptions then
      for i = #ud.buildoptions, 1, -1 do
        if ud.buildoptions[i] == unitName then
          table.remove(ud.buildoptions, i)
        end
      end
    end
  end
end

-- Legendary AFUS using scav epic AFUS units
for _, n in ipairs({"armafust3", "corafust3", "legafust3"}) do
  local ud = UnitDefs[n]
  if ud then
    ud.metalcost = 250000
    ud.energycost = 12000000
    ud.buildtime = 600000
    ud.health = 350000
    ud.energymake = 100000
    ud.energystorage = 200000
    ud.explodeas = "customfusionexplo"
    ud.selfdestructas = "advancedFusionExplosionSelfd"
    ud.name = "Legendary AFUS"
    ud.description = "Endgame super reactor - 100k energy / catastrophic loss risk"
    ud.customparams = ud.customparams or {}
    ud.customparams.i18n_en_humanname = "Legendary AFUS"
    ud.customparams.i18n_en_tooltip = "Endgame super reactor - 100k energy / catastrophic loss risk"
  end
end

-- T3 Converters using scav converter units
for _, n in ipairs({"armmmkrt3", "cormmkrt3"}) do
  local ud = UnitDefs[n]
  if ud then
    ud.name = "T3 Energy Converter"
    ud.description = "Endgame energy to metal conversion (15k E -> 275M)"
    ud.metalcost = 9000
    ud.energycost = 120000
    ud.buildtime = 140000
    ud.health = 9000
    ud.metalmake = 0
    ud.footprintx = 6
    ud.footprintz = 6
    ud.customparams = ud.customparams or {}
    ud.customparams.energyconv_capacity = 15000
    ud.customparams.energyconv_efficiency = 0.0183333
    ud.customparams.i18n_en_humanname = "T3 Energy Converter"
    ud.customparams.i18n_en_tooltip = "Endgame energy to metal conversion (15k E -> 275M)"
  end
end

-- =========================================================
-- LEGION T3 ENERGY CONVERTER
-- Proven working standalone definition merged into Lava T3 Eco Pack.
-- =========================================================
if UnitDefs["legadveconvt3"] then
  local ud = UnitDefs["legadveconvt3"]

  ud.name = "T3 Energy Converter"
  ud.description = "Endgame energy to metal conversion (15k E -> 275M)"

  ud.metalcost = 9000
  ud.energycost = 120000
  ud.buildtime = 140000
  ud.health = 9000
  ud.metalmake = 0

  ud.customparams = ud.customparams or {}
  ud.customparams.energyconv_capacity = 15000
  ud.customparams.energyconv_efficiency = 0.0183333
  ud.customparams.i18n_en_humanname = "T3 Energy Converter"
  ud.customparams.i18n_en_tooltip = "Endgame energy to metal conversion (15k E -> 275M)"
end

-- Clean display strings
local names = {
  armt3nano = {"T3 Nano Turret", "Endgame build support turret"},
  cort3nano = {"T3 Nano Turret", "Endgame build support turret"},
  legt3nano = {"T3 Nano Turret", "Endgame build support turret"},
  t3mmex = {"Epic Metal Extractor", "Metal Extraction / Storage (upkeep 2000 energy/s)"},
  armageot3 = {"Epic Geothermal Powerplant", "Produces 10x T2 Geothermal + has plasma deflector."},
  corageot3 = {"Epic Geothermal Powerplant", "Produces 10x T2 Geothermal + has plasma deflector."},
  legageot3 = {"Epic Geothermal Powerplant", "Produces 10x T2 Geothermal + has plasma deflector."},
  armecobot = {"Experimental Construction Bot", "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter"},
  corecobot = {"Experimental Construction Bot", "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter"},
  legecobot = {"Experimental Construction Bot", "Builds: T3 Nano, T3 Geo, Legendary AFUS, T3 Converter"},
}

for unitName, info in pairs(names) do
  local ud = UnitDefs[unitName]
  if ud then
    ud.name = info[1]
    ud.description = info[2]
    ud.customparams = ud.customparams or {}
    ud.customparams.i18n_en_humanname = info[1]
    ud.customparams.i18n_en_tooltip = info[2]
  end
end

-- Pocket AFUS: compact but dangerous T3 reactor
if UnitDefs["lootboxgold"] and not UnitDefs["pocketafus"] then
  local ud = table.merge(UnitDefs["lootboxgold"], {
    name = "Pocket AFUS",
    metalcost = 18000,
    energycost = 150000,
    buildtime = 400000,
    energymake = 5000,
    energystorage = 10000,
    metalmake = 0,
    health = 9000,
    reclaimable = true,
    buildpic = "FREEFUSION.DDS",
    sightdistance = 273,
    unitname = "pocketafus",
    explodeas = "advancedFusionExplosion",
    selfdestructas = "advancedFusionExplosionSelfd",
    customparams = {
      i18n_en_humanname = "Pocket AFUS",
      i18n_en_tooltip = "Compact 5k energy reactor. Space efficient, but dangerous to mass.",
      removestop = true,
      removewait = true,
      techlevel = 3,
    },
  })
  UnitDefs["pocketafus"] = ud
end

-- Eco bot menus
if UnitDefs["armecobot"] then
  UnitDefs["armecobot"].buildoptions = {"armt3nano", "t3mmex", "armageot3", "armafust3", "armmmkrt3", "pocketafus"}
end
if UnitDefs["corecobot"] then
  UnitDefs["corecobot"].buildoptions = {"cort3nano", "t3mmex", "corageot3", "corafust3", "cormmkrt3", "pocketafus"}
end
if UnitDefs["legecobot"] then
  UnitDefs["legecobot"].buildoptions = {"legt3nano", "t3mmex", "legageot3", "legafust3", "legadveconvt3", "pocketafus"}
end

-- Remove converters from normal T2 constructors
removeUnitFromBO("armmmkrt3", "armack", "armaca", "armacv")
removeUnitFromBO("cormmkrt3", "corack", "coraca", "coracv")
removeUnitFromBO("legadveconvt3", "legack", "legaca", "legacv")



local shields = {"armgatet3","corgatet3","leggatet3"}

for _, n in ipairs(shields) do
  local ud = UnitDefs[n]
  if ud then
    ud.metalcost = 20000
    ud.energycost = 250000
    ud.buildtime = 250000
    ud.name = "T3 Shield Node"
    ud.description = "Late game base shield node"
    ud.customparams = ud.customparams or {}
    ud.customparams.i18n_en_humanname = "T3 Shield Node"
    ud.customparams.i18n_en_tooltip = "Late game base shield node"

    if ud.weapondefs then
      for _, wd in pairs(ud.weapondefs) do
        if wd.shield then
          local s = wd.shield
          s.radius = 850
          s.power = 60000
          s.powerregen = 850
          s.powerregenenergy = 4500
        end
      end
    end
  end
end

if UnitDefs["armecobot"] then
  UnitDefs["armecobot"].buildoptions = {"armt3nano", "t3mmex", "armageot3", "armafust3", "armmmkrt3", "armgatet3", "pocketafus"}
end

if UnitDefs["corecobot"] then
  UnitDefs["corecobot"].buildoptions = {"cort3nano", "t3mmex", "corageot3", "corafust3", "cormmkrt3", "corgatet3", "pocketafus"}
end

if UnitDefs["legecobot"] then
  UnitDefs["legecobot"].buildoptions = {"legt3nano", "t3mmex", "legageot3", "legafust3", "legadveconvt3", "leggatet3", "pocketafus"}
end

-- =========================================================
-- T3 BUILDPOWER TURRET VISUAL UPGRADE
-- Use the faction-specific Base Builder bodies while keeping T3 nano mechanics.
-- =========================================================
local nanoVisuals = {
  armt3nano = "armrespawn",
  cort3nano = "correspawn",
  legt3nano = "legnanotcbase",
}

for t3Name, sourceName in pairs(nanoVisuals) do
  local t3 = UnitDefs[t3Name]
  local src = UnitDefs[sourceName]

  if t3 and src then
    t3.objectname = src.objectname
    t3.script = src.script
    t3.buildpic = src.buildpic

    t3.footprintx = src.footprintx
    t3.footprintz = src.footprintz

    t3.collisionvolumeoffsets = src.collisionvolumeoffsets
    t3.collisionvolumescales = src.collisionvolumescales
    t3.collisionvolumetype = src.collisionvolumetype
  end
end

-- =========================================================
-- Lava T3 Eco Pack: no build caps on the ARM eco chain
-- =========================================================
for _, unitName in ipairs({
  "armecobot",
  "armt3nano",
  "t3mmex",
  "armageot3",
  "armafust3",
  "armmmkrt3",
  "armgatet3",
  "corecobot",
  "cort3nano",
  "corageot3",
  "corafust3",
  "cormmkrt3",
  "corgatet3",
  "legecobot",
  "legt3nano",
  "legageot3",
  "legafust3",
  "legadveconvt3",
  "leggatet3",
  "pocketafus",
}) do
  local ud = UnitDefs[unitName]
  if ud then
    ud.maxThisUnit = 99999
    ud.maxthisunit = 99999
  end
end
-- Original OverCommander Rebuild Test
local function deepcopy(orig,seen)
if type(orig)~="table" then return orig end
if seen and seen[orig] then return seen[orig] end
local s=seen or{}
local copy={}
s[orig]=copy
for k,v in next,orig,nil do copy[deepcopy(k,s)]=deepcopy(v,s) end
return setmetatable(copy,deepcopy(getmetatable(orig),s))
end

local boss=UnitDefs["armcomboss"]
local donor=UnitDefs["legcomt2def"]

if boss and donor then
for _,n in ipairs({"armecobot","corecobot","legecobot"}) do
local old=UnitDefs[n]
if old then
local oldBO=deepcopy(old.buildoptions or{})
local u=deepcopy(donor)

u.objectname=boss.objectname
u.script=boss.script
u.buildpic=boss.buildpic
u.collisionvolumetype=boss.collisionvolumetype
u.collisionvolumescales=boss.collisionvolumescales
u.collisionvolumeoffsets=boss.collisionvolumeoffsets
u.footprintx=boss.footprintx
u.footprintz=boss.footprintz
u.movementclass=boss.movementclass
u.turninplace=boss.turninplace
u.turninplaceanglelimit=boss.turninplaceanglelimit
u.turninplacespeedlimit=boss.turninplacespeedlimit
u.maxacc=boss.maxacc or u.maxacc
u.maxdec=boss.maxdec or u.maxdec
u.turnrate=boss.turnrate or u.turnrate
u.mass=boss.mass or 500000

u.name="Lava T3 OverCommander"
u.description="Endgame Lava economy construction commander"
u.health=60000
u.metalcost=25000
u.energycost=750000
u.buildtime=300000
u.workertime=3000
u.builddistance=500
u.terraformspeed=3000
u.speed=30
u.maxvelocity=30
u.energymake=0
u.metalmake=0
u.energyupkeep=0
u.metalupkeep=0
u.energystorage=0
u.metalstorage=0
u.canresurrect=false
u.cancloak=false
u.showplayername=false
u.cancapture=false
u.canmanualfire=false
u.reclaimable=true
u.builder=true
u.canassist=true
u.canrepair=true
u.canreclaim=true
u.canrestore=true
u.canguard=true
u.canpatrol=true
u.canfight=true
u.canmove=true
u.canrepeat=true
u.buildoptions=oldBO

local shieldSlot=nil
if u.weapons then
for _,w in ipairs(u.weapons) do
if w and type(w.def)=="string" and string.lower(w.def)=="repulsor" then
shieldSlot=deepcopy(w)
break
end
end
end
u.weapons=shieldSlot and {shieldSlot} or{}
u.canattack=false

if u.weapondefs and u.weapondefs.repulsor and u.weapondefs.repulsor.shield then
u.weapondefs.repulsor.range=350
local sh=u.weapondefs.repulsor.shield
sh.force=5
sh.power=20000
sh.powerregen=400
sh.powerregenenergy=2000
sh.intercepttype=65535
sh.radius=350
end

u.customparams=u.customparams or{}
u.customparams.i18n_en_humanname="Lava T3 OverCommander"
u.customparams.i18n_en_tooltip="Builds the Lava T3 economy. 3000 buildpower. 20k personal shield."
u.customparams.techlevel=3
u.customparams.unitgroup="builder"
u.customparams.iscommander=nil
u.customparams.shield_power=20000
u.customparams.shield_radius=350
u.icontype="armcom"

UnitDefs[n]=u
end
end
end
-- T3 Legendary Defenses
if UnitDefs["armcom"] then
local ud = UnitDefs["armcom"]
ud.health = ud.health
end
local a,b,c=UnitDefs,table.merge,table.copy;a.legendary_pulsar={name="Legendary Pulsar",description="A pinnacle of Armada engineering that fires devastating, rapid-fire tachyon bolts.",buildpic="ARMANNIT3.DDS",buildtime=700000,health=80000,metalcost=100000,energycost=4000000,maxthisunit=1,damagemodifier=0.15,energystorage=6000,idleautoheal=10,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0 15 0",collisionvolumescales="81 122 81",collisionvolumetype="Box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=72,maxslope=10,maxwaterdepth=0,nochasecategory="MOBILE",objectname="Units/scavbuildings/ARMANNIT3.s3o",onoffable=true,radardistance=1800,radaremitheight=72,script="Units/ARMANNI.cob",usePieceCollisionVolumes=1,seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1200,yardmap="oooooo oooooo oooooo oooooo oooooo oooooo",customparams={i18n_en_humanname="Legendary Pulsar",i18n_en_tooltip="Fires devastating, rapid-fire tachyon bolts at extreme range.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/armannit3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Cremuss",normaltex="unittextures/Arm_normal.dds",removewait=true,subfolder="ArmBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 1.06567382829e-05 -0.0",collisionvolumescales="62.5 81.7362213135 62.5",collisionvolumetype="Box",damage=3600,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=11640,object="Units/scavbuildings/armannit3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=1800,footprintx=5,footprintz=5,height=4,metal=4656,object="Units/arm3X3B.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="obli"},select={[1]="obli"}},weapondefs={tachyon_burst_cannon={name="Tachyon Burst Cannon",weapontype="LaserCannon",rgbcolor="0.2 0.7 1.0",burst=3,burstrate=0.15,reloadtime=1.8,accuracy=400,areaofeffect=128,range=1800,energypershot=500,turret=true,soundstart="annigun1",soundhit="xplolrg3",impulsefactor=0,weaponvelocity=1500,thickness=10,explosiongenerator="custom:tachyonshot",damage={default=7820}, allowNonBlockingAim = true, avoidfeature = false, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="tachyon_burst_cannon",onlytargetcategory="SURFACE"}}}
a.legendary_bastion={name="Legendary Bastion",description="The ultimate defensive emplacement. Projects a devastating, pulsating heatray.",health=100000,metalcost=125000,energycost=5000000,buildtime=800000,maxthisunit=1,objectname="scavs/scavbeacon_t4.s3o",script="scavs/scavbeacon.cob",buildpic="scavengers/SCAVBEACON.DDS",maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",corpse="DEAD",damagemodifier=0.20,energystorage=1000,explodeas="largeBuildingexplosiongeneric",footprintx=5,footprintz=5,idleautoheal=2,idletime=1800,losemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",onoffable=true,radardistance=1200,radaremitheight=80,seismicsignature=0,selfdestructas="largeBuildingExplosionGenericSelfd",sightdistance=780,yardmap="yoooy ooooo ooooo ooooo yoooy",customparams={i18n_en_humanname="Legendary Bastion",i18n_en_tooltip="Projects a devastating, pulsating purple heatray.",maxrange=1400,usebuildinggrounddecal=true,buildinggrounddecaltype="decals/legbastion_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Gabs",normaltex="unittextures/leg_normal.dds",removewait=true,subfolder="CorBuildings/LandDefenceOffence",techlevel=3},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",damage=5400,featuredead="HEAP",footprintx=3,footprintz=3,height=20,metal=2911,object="Units/legbastion_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=2700,footprintx=3,footprintz=3,height=4,metal=1644,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="doom"},select={[1]="doom"}},weapondefs={legendary_bastion_ray={name="Legendary Heat Ray",thickness=15,rgbcolor="1.0 0.2 1.0",range=1400,damage={default=6038,vtol=15},weapontype="BeamLaser",reloadtime=0.3,soundstart="banthie2",soundtrigger=true,areaofeffect=120,avoidfeature=false,avoidfriendly=true,beamtime=0.3,camerashake=0.1,corethickness=0.3,craterareaofeffect=120,craterboost=0,cratermult=0,edgeeffectiveness=0.45,energypershot=500,explosiongenerator="custom:laserhit-medium-purple",firestarter=90,firetolerance=300,impulsefactor=0,laserflaresize=6,noselfdamage=true,predictboost=0.3,proximitypriority=1,rgbcolor2="0.9 1.0 0.5",soundhitdry="",soundhitwet="sizzle",turret=true,weaponvelocity=1500, allowNonBlockingAim = true, collidefriendly = false}},weapons={[1]={badtargetcategory="VTOL GROUNDSCOUT",def="legendary_bastion_ray",onlytargetcategory="SURFACE"}}}
a.legendary_bulwark={name="Legendary Bulwark",description="A pinnacle of defensive technology, the Legendary Bulwark annihilates all who approach.",buildpic="CORDOOMT3.DDS",buildtime=900000,health=130000,metalcost=150000,energycost=6000000,maxthisunit=1,damagemodifier=0.15,energystorage=5000,idleautoheal=15,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 -7.5 0.0",collisionvolumescales="72.0 165.0 72.0",collisionvolumetype="box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",objectname="Units/scavbuildings/CORDOOMT3.s3o",usePieceCollisionVolumes=1,onoffable=true,radardistance=1400,radaremitheight=80,script="Units/CORDOOM.cob",seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1100,yardmap="yyooyy oooooo oooooo oooooo oooooo yyooyy",customparams={i18n_en_humanname="Legendary Bulwark",i18n_en_tooltip="The ultimate defensive structure.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/cordoomt3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Mr Bob",normaltex="unittextures/cor_normal.dds",removewait=true,paralyzemultiplier=0.2,subfolder="CorBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.281730651855 -0.153618286133 3.57356262207",collisionvolumescales="80.6815948486 91.7637634277 82.1471252441",collisionvolumetype="Box",damage=10800,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=9666,object="Units/scavbuildings/cordoomt3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=5400,footprintx=5,footprintz=5,height=4,metal=3864,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="armag"},select={[1]="armag"}},weapondefs={legendary_overload_scatter={name="Overload Scatter Beamer",weapontype="BeamLaser",range=1500,reloadtime=0.1,sprayangle=3000,projectiles=12,rgbcolor="0.8 0.1 1.0",accuracy=50,allowNonBlockingAim=true,areaofeffect=10,beamdecay=0.05,beamtime=0.1,beamttl=1,corethickness=0.25,burnblow=true,cylindertargeting=1,edgeeffectiveness=0.15,explosiongenerator="custom:laserhit-medium-purple",firestarter=100,impulsefactor=0.123,intensity=0.7,laserflaresize=9.35,noselfdamage=true,soundhitwet="sizzle",soundstart="beamershot2",tolerance=5000,thickness=6,turret=true,weaponvelocity=1000,damage={default=650}, avoidfeature = false, avoidfriendly = false, collidefriendly = false},legendary_heat_ray={name="Armageddon Heat Ray",weapontype="BeamLaser",range=1300,reloadtime=4.0,areaofeffect=72,avoidfeature=false,beamtime=0.6,cameraShake=350,corethickness=0.40,craterareaofeffect=72,energypershot=1200,explosiongenerator="custom:genericshellexplosion-medium-beam",impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,rgbcolor="1 0.8 0",rgbcolor2="0.8 0 0",scrollspeed=5,soundhitdry="",soundhitwet="sizzle",soundstart="heatray2xl",soundtrigger=1,thickness=7,tolerance=10000,turret=true,weaponvelocity=1800,damage={default=16900,commanders=1755}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false},legendary_point_defense={name="Point Defense Laser",weapontype="BeamLaser",range=750,reloadtime=0.5,areaofeffect=12,avoidfeature=false,beamtime=0.3,corethickness=0.32,energypershot=500,explosiongenerator="custom:laserhit-large-blue",firestarter=90,impactonly=1,impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,proximitypriority=0,rgbcolor="0 0 1",soundhitdry="",soundhitwet="sizzle",soundstart="annigun1",soundtrigger=1,texture3="largebeam",thickness=5.5,tilelength=150,tolerance=10000,turret=true,weaponvelocity=1500,damage={default=650,commanders=1299}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="legendary_overload_scatter"},[2]={def="legendary_heat_ray"},[3]={def="legendary_point_defense"}}}
local L={"legendary_pulsar","legendary_bastion","legendary_bulwark"}
for _,u in pairs(UnitDefs)do if u.buildoptions then for i=#u.buildoptions,1,-1 do local x=u.buildoptions[i] if x=="legendary_pulsar" or x=="legendary_bastion" or x=="legendary_bulwark" then table.remove(u.buildoptions,i) end end end end
for _,b in ipairs({"armecobot","corecobot","legecobot"})do local u=UnitDefs[b] if u then u.buildoptions=u.buildoptions or{} for _,x in ipairs(L)do table.insert(u.buildoptions,x)end end end
for _,x in ipairs(L)do if UnitDefs[x]then UnitDefs[x].maxthisunit=1 end end-- ARM T3 Unit Pack
if UnitDefs["armbanth"] then
  local ud = UnitDefs["armbanth"]
  ud.health = ud.health
end

local function deepcopy(orig, seen)
	if type(orig) ~= "table" then return orig end
	if seen and seen[orig] then return seen[orig] end
	local s = seen or {}
	local copy = {}
	s[orig] = copy
	for k, v in pairs(orig) do
		copy[deepcopy(k, s)] = deepcopy(v, s)
	end
	return copy
end
local function addUnitToBO(unitName, builderName)
	local builder = UnitDefs[builderName]
	if not builder then return end
	builder.buildoptions = builder.buildoptions or {}
	for _, bo in ipairs(builder.buildoptions) do
		if bo == unitName then return end
	end
	table.insert(builder.buildoptions, unitName)
end
local armBuilders = {
	"armshltx",
	"armshltxuw",
	"armgant",
	"armgantuw",
}
local function addToArmBuilders(unitName)
	for _, builderName in ipairs(armBuilders) do
		addUnitToBO(unitName, builderName)
	end
end
local ratte = UnitDefs["armrattet4"]
if ratte then
	ratte.name = "Ratte"
	ratte.description = "Arm T3 very-heavy assault tank. Mobile line-breaker with heavy energy-fed plasma cannon."
	ratte.metalcost = 25000
	ratte.energycost = 500000
	ratte.buildtime = 250000
	ratte.health = 83000
	ratte.mass = 1000000
	ratte.speed = 27
	ratte.turnrate = 170
	ratte.maxacc = 0.016
	ratte.maxdec = 0.095
	ratte.footprintx = 5
	ratte.footprintz = 5
	ratte.movementclass = "EPICVEH"
	ratte.maxslope = 10
	ratte.maxwaterdepth = 12
	ratte.turninplace = true
	ratte.turninplaceanglelimit = 360
	ratte.turninplacespeedlimit = 1
	ratte.sightdistance = 650
	ratte.buildpic = "scavengers/armrattet4.DDS"
	ratte.objectname = "Units/scavboss/armrattet4.s3o"
	ratte.script = "Units/scavboss/armrattet4.cob"
	ratte.customparams = ratte.customparams or {}
	ratte.customparams.i18n_en_humanname = "Ratte"
	ratte.customparams.i18n_en_tooltip = "Arm T3 very-heavy assault tank. Mobile line-breaker with heavy energy-fed plasma cannon."
	ratte.customparams.techlevel = 3
	ratte.customparams.unitgroup = "weapon"
	ratte.customparams.firingceg = "barrelshot-large"
	ratte.customparams.weapon1turretx = 45
	ratte.customparams.weapon1turrety = 80
	if ratte.weapondefs and ratte.weapondefs.arm_bosscannon then
		local w = ratte.weapondefs.arm_bosscannon
		w.name = "Heavy Energy Plasma Cannon"
		w.range = 1050
		w.reloadtime = 1.4
		w.energypershot = 3000
		w.weaponvelocity = 475
		w.areaofeffect = 300
		w.craterareaofeffect = 300
		w.edgeeffectiveness = 0.15
		w.impulsefactor = 0.18
		w.size = 4
		w.soundstart = "shotgunbig"
		w.soundhit = "xplonuk2xs"
		w.soundhitwet = "splslrg"
		w.explosiongenerator = "custom:genericshellexplosion-large-aoe"
		w.sprayangle = 900
		w.accuracy = 100
		w.targetmoveerror = 0.25
		w.projectiles = 5
		w.damage = w.damage or {}
		w.damage.default = 1500
		w.damage.commanders = 400
		w.damage.shields = 400
		w.damage.subs = 50
	end
	if ratte.weapons and ratte.weapons[1] then
		ratte.weapons[1].def = "ARM_BOSSCANNON"
		ratte.weapons[1].badtargetcategory = "VTOL"
		ratte.weapons[1].onlytargetcategory = "NOTSUB"
	end
	addToArmBuilders("armrattet4")
end
local pawn = UnitDefs["armpwt4"]
if pawn then
	pawn.name = "Epic Pawn"
	pawn.description = "Arm fast T3 assault raider. Mobile pressure unit and eco sink."
	pawn.metalcost = 8000
	pawn.energycost = 350000
	pawn.buildtime = 100000
	pawn.health = 34000
	pawn.speed = 105
	pawn.turnrate = 1200
	pawn.maxacc = 0.55
	pawn.maxdec = 0.95
	pawn.customparams = pawn.customparams or {}
	pawn.customparams.i18n_en_humanname = "Epic Pawn"
	pawn.customparams.i18n_en_tooltip = "Arm fast T3 assault raider. Mobile pressure unit and eco sink."
	pawn.customparams.techlevel = 3
	pawn.customparams.unitgroup = "weapon"
	if pawn.weapondefs then
		for _, w in pairs(pawn.weapondefs) do
			w.energypershot = 1500
			w.range = math.max(w.range or 0, 560)
			if w.reloadtime then
				w.reloadtime = math.max(w.reloadtime * 0.9, 0.08)
			end
			if w.damage then
				for k, v in pairs(w.damage) do
					if type(v) == "number" then
						w.damage[k] = math.floor(v * 1.2)
					end
				end
			end
		end
	end
	addToArmBuilders("armpwt4")
end
local tumble = UnitDefs["armvadert4"]
if tumble then
	tumble.name = "Epic Tumbleweed"
	tumble.description = "Arm T3 tactical rolling bomb. Siege breaker and anti-blob suicide unit."
	tumble.metalcost = 12000
	tumble.energycost = 750000
	tumble.buildtime = 180000
	tumble.health = 28000
	tumble.mass = 500000
	tumble.speed = 52
	tumble.turnrate = 500
	tumble.maxacc = 0.08
	tumble.maxdec = 0.22
	tumble.sightdistance = 650
	tumble.maxslope = 20
	tumble.maxwaterdepth = 12
	tumble.customparams = tumble.customparams or {}
	tumble.customparams.i18n_en_humanname = "Epic Tumbleweed"
	tumble.customparams.i18n_en_tooltip = "Arm T3 tactical rolling bomb. Siege breaker and anti-blob suicide unit."
	tumble.customparams.techlevel = 3
	tumble.customparams.unitgroup = "weapon"
	tumble.canselfdestruct = true
	tumble.explodeas = "advancedFusionExplosion"
	tumble.selfdestructas = "advancedFusionExplosionSelfd"
	addToArmBuilders("armvadert4")
end
local titanBase = UnitDefs["armbanth"]
if titanBase then
	local ud = deepcopy(titanBase)
	ud.name = "Apex Titan"
	ud.description = "Arm apex siege titan. Heavy plasma annihilator with supporting missile batteries."
	ud.metalcost = 60000
	ud.energycost = 1800000
	ud.buildtime = 450000
	ud.health = 165000
	ud.mass = 5000000
	ud.speed = 36
	ud.turnrate = 180
	ud.maxacc = 0.04
	ud.maxdec = 0.12
	ud.sightdistance = 1500
	ud.radardistance = 1800
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Apex Titan"
	ud.customparams.i18n_en_tooltip = "Arm apex siege titan. Heavy plasma annihilator with supporting missile batteries."
	ud.customparams.techlevel = 3
	ud.customparams.unitgroup = "weapon"
	if ud.weapondefs then
		for _, w in pairs(ud.weapondefs) do
			w.range = 1250
			w.reloadtime = 2.35
			w.energypershot = 14000
			w.areaofeffect = 300
			w.craterareaofeffect = 0
			w.edgeeffectiveness = 0.25
			w.impulsefactor = 0.05
			w.weaponvelocity = 520
			w.camerashake = 0
			if w.damage then
				for k, v in pairs(w.damage) do
					if type(v) == "number" then
						w.damage[k] = math.floor(v * 1.75)
					end
				end
			end
		end
	end
	UnitDefs["armapextitan"] = ud
	addToArmBuilders("armapextitan")
end
local mauserBase = UnitDefs["armmart"]
if mauserBase then
	local ud = deepcopy(mauserBase)
	ud.name = "Super Mauser"
	ud.description = "Arm T3 precision siege artillery. Long-range plasma annihilator."
	ud.metalcost = 16000
	ud.energycost = 900000
	ud.buildtime = 240000
	ud.health = 34000
	ud.mass = 1200000
	ud.speed = 42
	ud.turnrate = 220
	ud.maxacc = 0.045
	ud.maxdec = 0.11
	ud.sightdistance = 900
	ud.radardistance = 1500
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Super Mauser"
	ud.customparams.i18n_en_tooltip = "Arm T3 precision siege artillery. Long-range plasma annihilator."
	ud.customparams.techlevel = 3
	ud.customparams.unitgroup = "weapon"
	if ud.weapondefs then
		for _, w in pairs(ud.weapondefs) do
			w.range = 2450
			w.reloadtime = 5.5
			w.energypershot = 18000
			w.areaofeffect = 340
			w.craterareaofeffect = 220
			w.edgeeffectiveness = 0.55
			w.impulsefactor = 0.18
			w.weaponvelocity =650
			w.startvelocity = 650
                        w.weaponacceleration = 0
                         w.gravityaffected = "true"
                         w.mygravity = 0.11
			w.accuracy = 90
			w.targetmoveerror = 0.18
                        w.tolerance = 4000
			w.explosiongenerator = "custom:genericshellexplosion-huge"
			w.soundstart = "lrpcshot"
			w.soundhit = "xplolrg4"
			if w.damage then
				for k, v in pairs(w.damage) do
					if type(v) == "number" then
						w.damage[k] = math.floor(v * 10)
					end
				end
			end
		end
	end
	UnitDefs["armsupermauser"] = ud
	addToArmBuilders("armsupermauser")
end
local function removeUnitFromBO(builderName, unitName)
	local b = UnitDefs[builderName]
	if not b or not b.buildoptions then return end
	for i = #b.buildoptions, 1, -1 do
		if b.buildoptions[i] == unitName then
			table.remove(b.buildoptions, i)
		end
	end
end
if UnitDefs["armapextitan"] then
  UnitDefs["armapextitan"].icontype = "armbanth"
end
if UnitDefs["armsupermauser"] then
  UnitDefs["armsupermauser"].icontype = "armmart"
end
-- Core T3 Unit Pack
if UnitDefs["corkorg"] then
	local ud = UnitDefs["corkorg"]
	ud.health = ud.health
end

local function deepcopy(orig, seen)
	if type(orig) ~= "table" then return orig end
	if seen and seen[orig] then return seen[orig] end
	local s = seen or {}
	local copy = {}
	s[orig] = copy
	for k, v in pairs(orig) do
		copy[deepcopy(k, s)] = deepcopy(v, s)
	end
	return copy
end
local function addUnitToBO(unitName, builderName)
	local builder = UnitDefs[builderName]
	if not builder then return end
	builder.buildoptions = builder.buildoptions or {}
	for _, bo in ipairs(builder.buildoptions) do
		if bo == unitName then return end
	end
	table.insert(builder.buildoptions, unitName)
end
if UnitDefs["corkorg"] then
	local ud = deepcopy(UnitDefs["corkorg"])
	ud.name = "Epic Tzar"
	ud.description = "Core super-heavy assault vehicle. Real Tzar weapon profile."
	ud.buildpic = "CORGOLT4.DDS"
	ud.metalcost = 32000
	ud.energycost = 1500000
	ud.buildtime = 360000
	ud.health = 160000
	ud.mass = 1000000
	ud.speed = 24
	ud.turnrate = 150
	ud.movementclass = "EPICVEH"
	ud.footprintx = 5
	ud.footprintz = 5
	ud.objectname = "Units/scavboss/corgolt4.s3o"
	ud.script = "Units/scavboss/corgolt4.cob"
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Epic Tzar"
	ud.customparams.i18n_en_tooltip = "Core super-heavy assault vehicle. Real Tzar weapon profile."
	ud.customparams.techlevel = 3
	ud.customparams.weapon1turretx = 20
	ud.customparams.weapon1turrety = 170
	ud.weapondefs = {
		corlevlr_weapon = {
			areaofeffect = 350,
			avoidfeature = false,
			craterareaofeffect = 350,
			craterboost = 0,
			cratermult = 0,
			edgeeffectiveness = 0.4,
			energypershot = 4500,
			explosiongenerator = "custom:newnuketac",
			firestarter = 100,
			gravityaffected = "true",
			impulsefactor = 1.8,
			leadlimit = 64,
			name = "Huge g2g plasma cannon",
			noselfdamage = true,
			proximitypriority = -1,
			predictBoost = 0.8,
			range = 1000,
			reloadtime = 4.8,
			size = 9,
			soundhit = "xplonuk2",
			soundhitwet = "splslrg",
			soundstart = "krogun1",
			targetmoveerror = 0.5,
			turret = true,
			weapontype = "Cannon",
			weaponvelocity = 450,
			damage = {
				commanders = 1800,
				default = 11000,
				shields = 2800,
				subs = 700,
			},
		},
		corgol_sidelaser = {
			areaofeffect = 8,
			avoidfeature = false,
			beamtime = 0.16,
			beamttl = 2.4,
			corethickness = 0.21,
			edgeeffectiveness = 0.15,
			energypershot = 500,
			explosiongenerator = "custom:laserhit-medium-green",
			firestarter = 90,
			impactonly = 1,
			impulsefactor = 0,
			laserflaresize = 5.5,
			name = "HighEnergyLaser",
			noselfdamage = true,
			proximitypriority = 1,
			range = 475,
			reloadtime = 0.88,
			rgbcolor = "0.027 0.40 0.027",
			rgbcolor2 = "0.9 1 0.9",
			soundhitdry = "",
			soundhitwet = "sizzle",
			soundstart = "lasrhvy3",
			soundtrigger = 1,
			thickness = 4.0,
			tolerance = 10000,
			turret = true,
			weapontype = "BeamLaser",
			weaponvelocity = 700,
			customparams = {
				noattackrangearc = 1,
			},
			damage = {
				default = 1100,
				vtol = 175,
			},
		},
	}
	ud.weapons = {
		[1] = {
			badtargetcategory = "VTOL",
			def = "CORLEVLR_WEAPON",
			onlytargetcategory = "SURFACE",
			weaponAimAdjustPriority = 9,
		},
		[2] = {
			badtargetcategory = "VTOL",
			def = "corgol_sidelaser",
			onlytargetcategory = "SURFACE",
			maindir = "-1 0 0",
			maxangledif = 180,
		},
		[3] = {
			badtargetcategory = "VTOL",
			def = "corgol_sidelaser",
			onlytargetcategory = "SURFACE",
			maindir = "1 0 0",
			maxangledif = 180,
		},
	}
	UnitDefs["corgolt4"] = ud
	addUnitToBO("corgolt4", "corgant")
	addUnitToBO("corgolt4", "corgantuw")
end
if UnitDefs["corkorg"] then
	local ud = deepcopy(UnitDefs["corkorg"])
	ud.name = "Epic Grunt"
	ud.description = "Core mass-production epic assault unit. Fast spam eco sink."
	ud.buildpic = "CORAKT4.DDS"
	ud.metalcost = 8500
	ud.energycost = 300000
	ud.buildtime = 110000
	ud.health = 42000
	ud.speed = 84
	ud.turnrate = 1391.5
	ud.maxacc = 0.4416
	ud.maxdec = 0.8625
	ud.footprintx = 4
	ud.footprintz = 4
	ud.movementclass = "EPICBOT"
	ud.maxslope = 17
	ud.maxwaterdepth = 25
	ud.upright = true
	ud.objectname = "Units/scavboss/CORAKT4.s3o"
	ud.script = "Units/scavboss/CORAKT4.cob"
	ud.explodeas = "mediumExplosionGeneric"
	ud.selfdestructas = "mediumExplosionGenericSelfd"
	ud.corpse = nil
	ud.featuredefs = nil
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Epic Grunt"
	ud.customparams.i18n_en_tooltip = "Core mass-production epic assault unit. Fast spam eco sink."
	ud.customparams.techlevel = 3
	ud.customparams.unitgroup = "weapon"
	ud.customparams.weapon1turretx = 300
	ud.customparams.weapon1turrety = 300
	ud.weapondefs = {
		gator_laser = {
			areaofeffect = 17,
			avoidfeature = false,
			beamtime = 0.1,
			beamttl = 1,
			corethickness = 0.315,
			edgeeffectiveness = 0.15,
			energypershot = 1000,
			explosiongenerator = "custom:laserhit-small-red",
			firestarter = 50,
			impactonly = 1,
			impulsefactor = 0,
			laserflaresize = 8,
			name = "Laser",
			noselfdamage = true,
			range = 600,
			reloadtime = 0.1,
			rgbcolor = "1 0 0",
			soundstart = "krogun1",
			soundhitdry = "xplonuk2",
			soundhitwet = "sizzle",
			soundtrigger = 1,
			thickness = 2.25,
			tolerance = 10000,
			turret = true,
			weapontype = "BeamLaser",
			weaponvelocity = 1000,
			damage = {
				default = 135,
				vtol = 25,
			},
		},
	}
	ud.weapons = {
		[1] = {
			badtargetcategory = "VTOL",
			def = "gator_laser",
			onlytargetcategory = "NOTSUB",
		},
	}
	UnitDefs["corepicgrunt"] = ud
	addUnitToBO("corepicgrunt", "corgant")
	addUnitToBO("corepicgrunt", "corgantuw")
end
if UnitDefs["cormart"] then
	local ud = deepcopy(UnitDefs["cormart"])
	ud.name = "Super Quaker"
	ud.description = "T3 Siege Artillery. Devastating long-range bombardment."
	ud.metalcost = 14000
	ud.energycost = 1400000
	ud.buildtime = 260000
	ud.health = 12000
	ud.speed = 30
	ud.explodeas = "mediumExplosionGeneric"
	ud.selfdestructas = "mediumExplosionGenericSelfd"
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Super Quaker"
	ud.customparams.i18n_en_tooltip = "T3 Siege Artillery. Devastating long-range bombardment."
	if ud.weapondefs and ud.weapondefs.cor_artillery then
		local w = ud.weapondefs.cor_artillery
		w.name = "Tactical Siege Shell"
		w.range = 1600
		w.reloadtime = 18
		w.areaofeffect = 600
		w.edgeeffectiveness = 0.9
		w.energypershot = 12000
		w.weaponvelocity = 600
		w.startvelocity = 600
		w.weaponacceleration = 0
		w.gravityaffected = "true"
		w.mygravity = 0.13
		w.explosiongenerator = "custom:newnuketac"
		w.soundstart = "krogun1"
		w.soundhit = "xplonuk2"
		w.soundhitwet = "splslrg"
		w.impulsefactor = 2.5
		w.accuracy = 120
                w.targetmoveerror = 0.25
		w.damage = {
			default = 9000,
			commanders = 2500,
			shields = 6000,
			subs = 1000,
			vtol = 800,
		}
	end
	UnitDefs["corsuperquaker"] = ud
	addUnitToBO("corsuperquaker", "corgant")
	addUnitToBO("corsuperquaker", "corgantuw")
end
if UnitDefs["corkarg"] then
	local ud = deepcopy(UnitDefs["corkarg"])
	ud.name = "Core Hunter"
	ud.description = "Fast T3 anti-siege assault unit. Hunts artillery and exposed eco."
	ud.buildpic = "CORKARG.DDS"
	ud.metalcost = 16000
	ud.energycost = 900000
	ud.buildtime = 240000
	ud.health = 32000
	ud.speed = 90
	ud.turnrate = 900
	ud.maxacc = 0.18
	ud.maxdec = 0.45
	ud.explodeas = "largeBuildingExplosionGeneric"
	ud.selfdestructas = "largeBuildingExplosionGenericSelfd"
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Core Hunter"
	ud.customparams.i18n_en_tooltip = "Fast T3 anti-siege assault unit. Hunts artillery and exposed eco."
	ud.customparams.techlevel = 3
	ud.customparams.unitgroup = "weapon"
	if ud.weapondefs then
		for _, w in pairs(ud.weapondefs) do
			w.range = 420
			w.reloadtime = 1.0
			w.energypershot = 1500
			w.areaofeffect = math.max(w.areaofeffect or 0, 48)
			w.edgeeffectiveness = 0.45
			w.impulsefactor = 1.5
			w.soundstart = w.soundstart or "krogun1"
			w.soundhit = w.soundhit or "xplomed4"
			w.damage = {
				default = 1600,
				commanders = 650,
				shields = 900,
				subs = 200,
				vtol = 100,
			}
		end
	end
	UnitDefs["corhunter"] = ud
	addUnitToBO("corhunter", "corgant")
	addUnitToBO("corhunter", "corgantuw")
end
if UnitDefs["corkorg"] then
	local ud = deepcopy(UnitDefs["corkorg"])
	ud.name = "Apex Juggernaut"
	ud.description = "Endgame assault juggernaut. Devastates bases with energy-overload weaponry."
	ud.buildpic = "CORKORG.DDS"
	ud.metalcost = 125000
	ud.energycost = 2500000
	ud.buildtime = 750000
	ud.health = 165000
	ud.mass = 5000000
	ud.speed = 20
	ud.turnrate = 100
	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Apex Juggernaut"
	ud.customparams.i18n_en_tooltip = "Endgame assault juggernaut. Devastates bases with energy-overload weaponry."
	ud.customparams.techlevel = 3
	ud.customparams.unitgroup = "weapon"
	if ud.weapondefs then
		for _, w in pairs(ud.weapondefs) do
			w.name = "Overload Annihilator"
			w.range = 560
			w.reloadtime = 8
			w.energypershot = 40000
			w.areaofeffect = 380
			w.edgeeffectiveness = 0.65
			w.explosiongenerator = "custom:genericshellexplosion-large"
			w.soundstart = "krogun1"
			w.soundhit = "xplonuk2"
			w.soundhitwet = "splslrg"
			w.impulsefactor = 2.0
			w.accuracy = 400
			w.damage = {
				default = 16000,
				commanders = 5000,
				shields = 12000,
				subs = 2000,
				vtol = 500,
			}
		end
	end
	UnitDefs["corapex"] = ud
	addUnitToBO("corapex", "corgant")
	addUnitToBO("corapex", "corgantuw")
end
if UnitDefs["corgolt4"] then UnitDefs["corgolt4"].icontype = "corgolt4" end
if UnitDefs["corepicgrunt"] then UnitDefs["corepicgrunt"].icontype = "corakt4" end
if UnitDefs["corsuperquaker"] then UnitDefs["corsuperquaker"].icontype = "cormart" end
if UnitDefs["corhunter"] then UnitDefs["corhunter"].icontype = "corkarg" end
if UnitDefs["corapex"] then UnitDefs["corapex"].icontype = "corkorg" end
-- Legion T3 Unit Pack

if UnitDefs["legbunk"] then
	local ud = UnitDefs["legbunk"]
	ud.health = ud.health
end

-- =========================================================
-- LEGION BREAKER BUNKER
-- Unit ID: legbunk
-- =========================================================

if UnitDefs["legbunk"] then
	local ud = UnitDefs["legbunk"]

	ud.name = "Legion Breaker Bunker"
	ud.description = "Fast medium experimental assault unit. Breaks lines with speed, armor, and close-range firepower."
	ud.buildpic = ud.buildpic or "LEGBUNK.DDS"

	ud.metalcost = 18000
	ud.energycost = 420000
	ud.buildtime = 260000
	ud.health = 36000

	ud.speed = 58
	ud.turnrate = 420
	ud.maxacc = 0.05
	ud.maxdec = 0.12
	ud.sightdistance = 650
	ud.radardistance = 900

	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Legion Breaker Bunker"
	ud.customparams.i18n_en_tooltip = "Fast medium experimental assault unit. Breaks lines with speed, armor, and close-range firepower."
	ud.customparams.techlevel = 3
	ud.customparams.subfolder = "Legion/T3"

	if ud.weapondefs then
		for name, wd in pairs(ud.weapondefs) do
			if wd.damage then
				wd.range = math.min(math.max(wd.range or 0, 520), 650)
				wd.reloadtime = math.max((wd.reloadtime or 1) * 0.85, 0.45)
				wd.areaofeffect = math.max(wd.areaofeffect or 0, 48)

				wd.damage.default = math.max(wd.damage.default or 0, 420)
				wd.damage.vtol = math.min(wd.damage.vtol or 0, 75)
				wd.damage.subs = math.min(wd.damage.subs or 0, 60)
				wd.damage.lboats = math.max(wd.damage.lboats or 0, 280)
			end

			if wd.weaponvelocity then
				wd.weaponvelocity = math.max(wd.weaponvelocity, 850)
			end
		end
	end
end


-- =========================================================
-- LEGION ARQUEBUS PRIME
-- Unit ID: legsrailt4
-- =========================================================

if UnitDefs["legsrailt4"] then
	local ud = UnitDefs["legsrailt4"]

	ud.name = "Legion Arquebus Prime"
	ud.description = "Experimental long-range rail sniper. Deletes high-value targets with slow, precise armor-piercing shots."
	ud.buildpic = ud.buildpic or "LEGSRAILT4.DDS"

	ud.metalcost = 26000
	ud.energycost = 850000
	ud.buildtime = 420000
	ud.health = 28000

	ud.speed = 31
	ud.turnrate = 260
	ud.maxacc = 0.025
	ud.maxdec = 0.08
	ud.sightdistance = 900
	ud.radardistance = 1400

	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Legion Arquebus Prime"
	ud.customparams.i18n_en_tooltip = "Experimental long-range rail sniper. Deletes high-value targets with slow, precise armor-piercing shots."
	ud.customparams.techlevel = 3
	ud.customparams.subfolder = "Legion/T3"

	if ud.weapondefs then
		for name, wd in pairs(ud.weapondefs) do
			if wd.damage then
				wd.range = math.max(wd.range or 0, 1650)
				wd.reloadtime = math.max(wd.reloadtime or 1, 10.5)
				wd.areaofeffect = math.min(wd.areaofeffect or 16, 24)

				wd.damage.default = 28000
				wd.damage.commanders = 9000
				wd.damage.vtol = 50
				wd.damage.subs = 0
				wd.damage.lboats = 12000

				wd.accuracy = 0
				wd.sprayangle = 0
				wd.weaponvelocity = math.max(wd.weaponvelocity or 0, 4500)
				wd.turret = true
			end
		end
	end
end


-- =========================================================
-- LEGION MUKADE PRIME
-- Unit ID: legpede
-- =========================================================

if UnitDefs["legpede"] then
	local ud = UnitDefs["legpede"]

	ud.name = "Legion Mukade Prime"
	ud.description = "Experimental multi-weapon assault centipede. Saturates battlefields with rockets, railguns, and machine-gun fire."
	ud.buildpic = "LEGPEDE.DDS"

	ud.canattack = true
	ud.metalcost = 24000
	ud.energycost = 620000
	ud.buildtime = 360000
	ud.health = 52000

	ud.speed = 42
	ud.turnrate = 320
	ud.maxacc = 0.04
	ud.maxdec = 0.10
	ud.sightdistance = 850
	ud.radardistance = 1100

	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Legion Mukade Prime"
	ud.customparams.i18n_en_tooltip = "Experimental multi-weapon assault centipede. Saturates battlefields with rockets, railguns, and machine-gun fire."
	ud.customparams.techlevel = 3
	ud.customparams.subfolder = "Legion/T3"

	if ud.weapondefs then

		if ud.weapondefs.adv_rocket then
			local w = ud.weapondefs.adv_rocket
			w.range = 760
			w.reloadtime = 3.2
			w.burst = 4
			w.areaofeffect = 120
			w.weaponvelocity = 650
			w.damage = w.damage or {}
			w.damage.default = 520
			w.damage.subs = 120
			w.damage.vtol = 80
		end

		if ud.weapondefs.armmg_weapon then
			local w = ud.weapondefs.armmg_weapon
			w.range = 620
			w.reloadtime = 0.32
			w.burst = 8
			w.areaofeffect = 24
			w.weaponvelocity = 1100
			w.damage = w.damage or {}
			w.damage.default = 65
			w.damage.vtol = 35
			w.damage.commanders = 20
		end

		if ud.weapondefs.railgunt2 then
			local w = ud.weapondefs.railgunt2
			w.range = 950
			w.reloadtime = 4.5
			w.weaponvelocity = 3600
			w.damage = w.damage or {}
			w.damage.default = 1100
			w.damage.commanders = 350
			w.damage.vtol = 100
		end
	end
end


-- =========================================================
-- LEGION INFERNO COLOSSUS
-- Unit ID: legeheatraymech_old
-- =========================================================

if UnitDefs["legeheatraymech_old"] then
	local ud = UnitDefs["legeheatraymech_old"]

	ud.name = "Legion Inferno Colossus"
	ud.description = "Experimental siege walker armed with catastrophic rapid-fire thermal weaponry."
	ud.buildpic = ud.buildpic or "LEGEHEATRAYMECH.DDS"

	-- Increased apex-tier investment
	ud.metalcost = 65000
	ud.energycost = 2500000
	ud.buildtime = 850000

	-- Increased survivability
	ud.health = 125000

	ud.speed = 27
	ud.turnrate = 210
	ud.maxacc = 0.018
	ud.maxdec = 0.05

	ud.sightdistance = 1150
	ud.radardistance = 1500

	ud.customparams = ud.customparams or {}
	ud.customparams.i18n_en_humanname = "Legion Inferno Colossus"
	ud.customparams.i18n_en_tooltip = "Experimental apex siege walker that overwhelms targets with rapid-fire thermal laser barrages."
	ud.customparams.techlevel = 3
	ud.customparams.subfolder = "Legion/T3"

	if ud.weapondefs then
		for name, wd in pairs(ud.weapondefs) do
			if wd.damage then

				-- Keep rapid-fire laser behavior
				wd.range = math.max(wd.range or 0, 1150)
				wd.reloadtime = 0.25
				wd.areaofeffect = math.max(wd.areaofeffect or 0, 80)

				-- Increased sustained DPS
				wd.damage.default = 650
				wd.damage.commanders = 260
				wd.damage.lboats = 500
				wd.damage.subs = 0
				wd.damage.vtol = 70

				wd.weaponvelocity = math.max(wd.weaponvelocity or 0, 2500)

				-- Slightly heavier laser visuals
				wd.thickness = math.max(wd.thickness or 0, 6)
				wd.corethickness = math.max(wd.corethickness or 0, 0.6)

				wd.rgbcolor = "1 0.2 0.1"
				wd.rgbcolor2 = "1 0.8 0.4"
			end
		end
	end
end


-- =========================================================
-- ADD ALL UNITS TO LEGION T3 GANTRY
-- =========================================================

if UnitDefs["leggant"] then
	local ud = UnitDefs["leggant"]

	ud.buildoptions = ud.buildoptions or {}

	local unitsToAdd = {
		"legbunk",
		"legsrailt4",
		"legpede",
		"legeheatraymech_old",
	}

	for _, newUnit in ipairs(unitsToAdd) do
		local exists = false

		for _, existing in ipairs(ud.buildoptions) do
			if existing == newUnit then
				exists = true
				break
			end
		end

		if not exists then
			table.insert(ud.buildoptions, newUnit)
		end
	end
end

-- Strategic/minimap icon fixes.
if UnitDefs["legbunk"] then UnitDefs["legbunk"].icontype = "legbunk" end
if UnitDefs["legsrailt4"] then UnitDefs["legsrailt4"].icontype = "legsrailt4" end
if UnitDefs["legpede"] then UnitDefs["legpede"].icontype = "legpede" end
if UnitDefs["legeheatraymech_old"] then UnitDefs["legeheatraymech_old"].icontype = "legeheatraymech_old" end

-- =========================================================
-- T3 AIR LAB DEFINITIONS
-- Added here to keep the Eco Support and Air Rework lines small.
-- The Air Rework tweak handles T2 air-constructor insertion.
-- =========================================================
local function _labcopy(t)
    local n={}
    for k,v in pairs(t) do
        if type(v)=="table" then
            local x={}
            for a,b in pairs(v) do x[a]=b end
            n[k]=x
        else
            n[k]=v
        end
    end
    return n
end

local function _makelab(srcName,newName,cfg)
    if UnitDefs[newName] then return end
    local src=UnitDefs[srcName]
    if not src then return end
    local u=_labcopy(src)
    for k,v in pairs(cfg) do u[k]=v end
    UnitDefs[newName]=u
end

_makelab("armap","armapt3",{
    name="Armada T3 Aircraft Gantry",
    description="Experimental Aircraft Gantry",
    energycost=60000,
    metalcost=8500,
    buildtime=72400,
    health=11100,
    workertime=600,
    builder=true,
    canmove=true,
    canreclaim=false,
    footprintx=18,
    footprintz=12,
    maxslope=15,
    maxwaterdepth=0,
    objectname="Units/scavbuildings/ARMAPT3.s3o",
    script="Units/scavbuildings/ARMAPT3.cob",
    buildpic="ARMAP.DDS",
    collisionvolumeoffsets="0 8 1",
    collisionvolumescales="268 98 164",
    collisionvolumetype="Box",
    buildoptions={"armaca","armthundt4","armfepocht4","armlichet4"},
    customparams={unitgroup="buildert3",restrictions_inclusion="_noair_",techlevel=3}
})

_makelab("corap","corapt3",{
    name="Cortex T3 Aircraft Gantry",
    description="Experimental Aircraft Gantry",
    energycost=60000,
    metalcost=8500,
    buildtime=72400,
    health=11100,
    workertime=600,
    builder=true,
    canmove=true,
    canreclaim=false,
    footprintx=16,
    footprintz=12,
    maxslope=15,
    maxwaterdepth=0,
    objectname="Units/scavbuildings/CORAPT3.s3o",
    script="Units/scavbuildings/CORAPT3.cob",
    buildpic="CORAP.DDS",
    collisionvolumeoffsets="0 -14 -23",
    collisionvolumescales="220 66 100",
    collisionvolumetype="Box",
    buildoptions={"coraca","corcrwt4","corfblackhyt4","cordronecarryair"},
    customparams={unitgroup="buildert3",restrictions_inclusion="_noair_",techlevel=3}
})

_makelab("legap","legapt3",{
    name="Legion T3 Aircraft Gantry",
    description="Experimental Aircraft Gantry",
    energycost=60000,
    metalcost=8500,
    buildtime=72400,
    health=11100,
    workertime=600,
    builder=true,
    canmove=true,
    canreclaim=false,
    footprintx=16,
    footprintz=12,
    maxslope=15,
    maxwaterdepth=0,
    objectname="Units/scavbuildings/CORAPT3.s3o",
    script="Units/scavbuildings/CORAPT3.cob",
    buildpic="LEGAP.DDS",
    collisionvolumeoffsets="0 -14 -23",
    collisionvolumescales="220 66 100",
    collisionvolumetype="Box",
    buildoptions={"legaca","legmost3","legfortt4"},
    customparams={unitgroup="buildert3",restrictions_inclusion="_noair_",techlevel=3}
})

-- =========================================================
-- INSERT T3 AIR LABS AFTER THEY ARE CREATED
-- Keeps this independent of tweak-line load order.
-- =========================================================
local function _addairlab(builder,lab)
    local u=UnitDefs[builder]
    if not u or not UnitDefs[lab] then return end
    u.buildoptions=u.buildoptions or {}
    for _,x in ipairs(u.buildoptions) do
        if x==lab then return end
    end
    table.insert(u.buildoptions,lab)
end

_addairlab("armaca","armapt3")
_addairlab("coraca","corapt3")
_addairlab("legaca","legapt3")

-- T3 Air Rework - ARM Cortex Legion
if UnitDefs["armblade"] then
local u=UnitDefs["armblade"]
u.name="Hornet"
u.description="Heavy Assault Gunship"
u.health=5500
u.speed=160
u.turnrate=540
u.hoverattack=true
u.customparams=u.customparams or {}
u.customparams.i18n_en_humanname="Hornet"
u.customparams.i18n_en_tooltip="Tanky frontline assault gunship with a rapid heavy cannon."
u.weapondefs={
heavy_assault_cannon={
areaofeffect=48,
avoidfeature=false,
avoidfriendly=false,
collidefriendly=false,
craterareaofeffect=0,
craterboost=0,
cratermult=0,
edgeeffectiveness=0.35,
explosiongenerator="custom:genericshellexplosion-medium",
firestarter=60,
impulsefactor=0.08,
name="Heavy Assault Cannon",
noselfdamage=true,
range=390,
reloadtime=0.45,
soundhit="SabotHit",
soundhitwet="splshbig",
soundstart="SabotFire",
soundtrigger=true,
turret=true,
weapontype="Cannon",
weaponvelocity=900,
damage={default=125},
},
}
u.weapons={
[1]={badtargetcategory="VTOL",def="HEAVY_ASSAULT_CANNON",onlytargetcategory="SURFACE"},
}
end
if UnitDefs["armfepocht4"] then
local u = UnitDefs["armfepocht4"]
u.cruisealtitude=180
u.name = "Apex Flying Epoch"
u.description = "Apex Airborne Siege Dreadnought"
u.metalcost = 100000
u.energycost = 2500000
u.buildtime = 1000000
u.health = 150000
u.speed = 36
u.radardistance = 2700
u.customparams = u.customparams or {}
u.customparams.i18n_en_humanname = "Apex Flying Epoch"
u.customparams.i18n_en_tooltip = "Ultimate Armada airborne siege dreadnought with capital artillery and integrated anti-air defenses."
if u.weapondefs then
local ferret = u.weapondefs.ferret_missile
if ferret then
ferret.range = 1000
ferret.reloadtime = 1.4
ferret.damage = ferret.damage or {}
ferret.damage.vtol = 225
end
local flak = u.weapondefs.flak
if flak then
flak.range = 850
flak.reloadtime = 0.53333
flak.damage = flak.damage or {}
flak.damage.vtol = 250
end
local hp = u.weapondefs.heavyplasma
if hp then
hp.damage = hp.damage or {}
hp.damage.default = 850
hp.damage.vtol = 850
hp.reloadtime = 3.0
hp.areaofeffect = 128
hp.accuracy = 150
hp.sprayangle = 150
hp.edgeeffectiveness = 0.25
hp.range = 2450
hp.weaponvelocity = 850
end
local mp = u.weapondefs.mediumplasma
if mp then
mp.damage = mp.damage or {}
mp.damage.vtol = mp.damage.default or 270
end
end
u.weapons = {
[1] = {
def = "HEAVYPLASMA",
onlytargetcategory = "SURFACE T4AIR",
},
[2] = {
def = "MEDIUMPLASMA",
maindir = "0 0 1",
maxangledif = 320,
onlytargetcategory = "SURFACE T4AIR",
},
[3] = {
def = "HEAVYPLASMA",
maindir = "0 0 1",
maxangledif = 240,
onlytargetcategory = "SURFACE T4AIR",
},
[4] = {
def = "MEDIUMPLASMA",
maindir = "-4 0 1",
maxangledif = 180,
onlytargetcategory = "SURFACE T4AIR",
},
[5] = {
def = "MEDIUMPLASMA",
maindir = "4 0 1",
maxangledif = 180,
onlytargetcategory = "SURFACE T4AIR",
},
[6] = {
badtargetcategory = "NOTAIR GROUNDSCOUT",
def = "FERRET_MISSILE",
maindir = "0 -1 -2",
maxangledif = 270,
onlytargetcategory = "VTOL T4AIR",
},
[7] = {
badtargetcategory = "NOTAIR GROUNDSCOUT",
def = "FERRET_MISSILE",
onlytargetcategory = "VTOL T4AIR",
},
[8] = {
badtargetcategory = "NOTAIR GROUNDSCOUT",
def = "FLAK",
onlytargetcategory = "VTOL T4AIR",
},
[9] = {
badtargetcategory = "NOTAIR GROUNDSCOUT",
def = "FLAK",
onlytargetcategory = "VTOL T4AIR",
},
}
end
if UnitDefs["armlichet4"] then
local u=UnitDefs["armlichet4"]
u.name="Liche"
u.description="Air-Launched Nuclear Missile Carrier"
u.metalcost=25000
u.energycost=500000
u.health=18000
u.speed=200
u.customparams=u.customparams or {}
u.customparams.i18n_en_humanname="Liche"
u.customparams.i18n_en_tooltip="Standoff nuclear strike aircraft carrying an air-launched tactical missile."
if u.weapondefs and u.weapondefs.nuclear_missile then
local w=u.weapondefs.nuclear_missile
w.weapontype="MissileLauncher"
w.range=1050
w.reloadtime=30
w.areaofeffect=800
w.craterareaofeffect=800
w.tracks=true
w.turnrate=12000
w.flighttime=8
w.startvelocity=400
w.weaponacceleration=300
w.weaponvelocity=1200
w.weapontimer=8
w.tolerance=12000
w.burnblow=true
w.collideenemy=true
w.collidefeature=true
w.collidefriendly=false
w.avoidfriendly=false
w.avoidfeature=false
w.noselfdamage=true
w.damage=w.damage or {}
w.damage.default=15000
w.damage.commanders=3500
w.damage.vtol=2500
end
u.weapons={
[1]={
badtargetcategory="VTOL",
def="NUCLEAR_MISSILE",
onlytargetcategory="SURFACE",
},
}
end
if UnitDefs["armaca"] then
local u=UnitDefs["armaca"]
u.buildoptions=u.buildoptions or {}
local found=false
for i=1,#u.buildoptions do
if u.buildoptions[i]=="armapt3" then found=true break end
end
if not found then
u.buildoptions[#u.buildoptions+1]="armapt3"
end
end
if UnitDefs["corfblackhyt4"] then
local u = UnitDefs["corfblackhyt4"]
u.cruisealtitude=180
u.name = "Black Hydra"
u.description = "Apex Midrange Aerial Battle Fortress"
u.metalcost = 100000
u.energycost = 1000000
u.buildtime = 1000000
u.health = 170000
u.speed = 42
u.customparams = u.customparams or {}
u.customparams.i18n_en_humanname = "Black Hydra"
u.customparams.i18n_en_tooltip = "Apex aerial battle fortress armed with a devastating midrange superlaser."
if u.weapondefs then
u.weapondefs.heavyplasma = {
areaofeffect = 64,
avoidfeature = false,
avoidfriendly = false,
beamtime = 1.5,
beamttl = 2,
corethickness = 0.65,
craterareaofeffect = 0,
craterboost = 0,
cratermult = 0,
camerashake = 0,
cylindertargeting = 1,
edgeeffectiveness = 0.15,
energypershot = 0,
explosiongenerator = "custom:genericshellexplosion-medium-beam",
firestarter = 100,
impactonly = 1,
largebeamlaser = true,
texture3 = "largebeam",
tilelength = 120,
scrollspeed = 4,
beamdecay = 0.05,
impulsefactor = 0,
laserflaresize = 14,
name = "Death Star Superlaser",
noselfdamage = true,
range = 1150,
reloadtime = 6,
rgbcolor = "0.1 1.0 0.2",
rgbcolor2 = "0.6 1.0 0.5",
soundhitdry = "",
soundhitwet = "sizzle",
soundstart = "lasrhvy3",
soundtrigger = 1,
thickness = 30,
tolerance = 10000,
turret = true,
weapontype = "BeamLaser",
weaponvelocity = 1200,
damage = {
commanders = 3000,
default = 30000,
subs = 3000,
vtol = 30000,
},
}
end
if u.weapondefs and u.weapondefs.heavylaser then
local w = u.weapondefs.heavylaser
w.reloadtime = 0.75
w.damage = w.damage or {}
w.damage.default = 1500
w.damage.vtol = 65
end
if u.weapondefs and u.weapondefs.ferret_missile then
local w = u.weapondefs.ferret_missile
w.reloadtime = 1.7
w.damage = w.damage or {}
w.damage.vtol = 150
end
end
if UnitDefs["corcrwt4"] then
local u=UnitDefs["corcrwt4"]
u.name="Epic Dragon"
u.description="Super-Heavy Close-Range Assault Gunship"
u.metalcost=45000
u.energycost=450000
u.buildtime=450000
u.health=150000
u.speed=105
u.customparams=u.customparams or {}
u.customparams.i18n_en_humanname="Epic Dragon"
u.customparams.i18n_en_tooltip="Super-heavy close-range flying fortress built to absorb punishment and shred armies at point-blank range."
if u.weapondefs then
local maw=u.weapondefs.kmaw
if maw then
maw.range=500
maw.burst=12
maw.burstrate=0.03333
maw.reloadtime=0.4
maw.areaofeffect=128
maw.damage=maw.damage or {}
maw.damage.default=200
maw.damage.subs=25
end
local aa=u.weapondefs.edragon_missile
if aa then
aa.range=840
aa.reloadtime=0.4
aa.damage=aa.damage or {}
aa.damage.bombers=400
aa.damage.fighters=400
aa.damage.vtol=400
end
local laser=u.weapondefs.krowbosslaser
if laser then
laser.range=500
laser.reloadtime=1.5
laser.damage=laser.damage or {}
laser.damage.default=3000
laser.damage.commanders=300
laser.damage.vtol=300
laser.damage.subs=300
end
local laser2=u.weapondefs.krowbosslaser2
if laser2 then
laser2.range=500
laser2.reloadtime=2.5
laser2.damage=laser2.damage or {}
laser2.damage.default=5000
laser2.damage.commanders=500
laser2.damage.vtol=500
laser2.damage.subs=500
end
end
end
if UnitDefs["cordrone"] then
local d = UnitDefs["cordrone"]
d.name = "Laser Drone"
d.description = "Cortex Carrier Attack Drone"
d.health = 4000
d.customparams = d.customparams or {}
d.customparams.i18n_en_humanname = "Laser Drone"
d.customparams.i18n_en_tooltip = "Fast Cortex carrier drone armed with a rapid green beam laser."
if d.weapondefs and d.weapondefs.heat_ray then
local w = d.weapondefs.heat_ray
w.name = "Green Drone Laser"
w.range = 650
w.reloadtime = 0.9
w.beamtime = 0.15
w.corethickness = 0.15
w.thickness = 1.8
w.laserflaresize = 5
w.rgbcolor = "0 1 0"
w.rgbcolor2 = "0.4 1 0.4"
w.explosiongenerator = "custom:laserhit-small-green"
w.damage = w.damage or {}
w.damage.default = 225
w.damage.vtol = 25
end
end
if UnitDefs["cordronecarryair"] then
local u = UnitDefs["cordronecarryair"]
u.name = "Drone Carrier"
u.description = "Experimental Green-Laser Swarm Carrier"
u.metalcost = 30000
u.energycost = 500000
u.buildtime = 300000
u.health = 70000
u.speed = 40
u.customparams = u.customparams or {}
u.customparams.i18n_en_humanname = "Drone Carrier"
u.customparams.i18n_en_tooltip = "Experimental Cortex carrier deploying and replenishing a swarm of green-laser attack drones."
if u.weapondefs and u.weapondefs.plasma then
local w = u.weapondefs.plasma
w.customparams = w.customparams or {}
w.customparams.carried_unit = "cordrone"
w.customparams.engagementrange = "1300"
w.customparams.spawnrate = "6"
w.customparams.maxunits = "10"
w.customparams.startingdronecount = "5"
w.customparams.energycost = "1000"
w.customparams.metalcost = "40"
w.customparams.controlradius = "1100"
w.customparams.decayrate = "9"
w.customparams.attackformationspread = "200"
w.customparams.attackformationoffset = "30"
w.customparams.carrierdeaththroe = "release"
w.customparams.dockingarmor = "0.2"
w.customparams.dockinghealrate = "60"
w.customparams.docktohealthreshold = "50"
w.customparams.enabledocking = "1"
w.customparams.dockinghelperspeed = "5"
w.customparams.dockingpieces = "9 10 11 12 13 14 15 16 17 18 19"
w.customparams.dockingradius = "300"
w.customparams.stockpilelimit = "10"
w.customparams.stockpilemetal = "40"
w.customparams.stockpileenergy = "1000"
w.customparams.dronesusestockpile = "1"
w.customparams.dronedocktime = "2"
w.customparams.droneairtime = "30"
end
end
if UnitDefs["coraca"] then
local u=UnitDefs["coraca"]
u.buildoptions=u.buildoptions or {}
local found=false
for i=1,#u.buildoptions do
if u.buildoptions[i]=="corapt3" then found=true break end
end
if not found then
u.buildoptions[#u.buildoptions+1]="corapt3"
end
end
if UnitDefs["legmost3"] then
local u=UnitDefs["legmost3"]
u.name="Legion Rocket Siege Gunship"
u.description="Long-Range Saturation Rocket Gunship"
u.metalcost=15000
u.energycost=180000
u.buildtime=150000
u.health=30000
u.speed=130
u.customparams=u.customparams or {}
u.customparams.i18n_en_humanname="Legion Rocket Siege Gunship"
u.customparams.i18n_en_tooltip="Long-range Legion rocket gunship built to saturate ground armies and defenses from standoff range."
if u.weapondefs and u.weapondefs.exp_heavyrocket then
local w=u.weapondefs.exp_heavyrocket
w.range=1050
w.reloadtime=5.0
w.burst=6
w.burstrate=0.2
w.areaofeffect=128
w.edgeeffectiveness=0.65
w.flighttime=4.5
w.startvelocity=350
w.weaponacceleration=250
w.weaponvelocity=800
w.turnrate=6500
w.tolerance=5000
w.stockpile=false
w.stockpiletime=0
w.customparams=w.customparams or {}
w.customparams.stockpilelimit=nil
w.damage=w.damage or {}
w.damage.default=500
end
end
if UnitDefs["legaca"] then
local u=UnitDefs["legaca"]
u.buildoptions=u.buildoptions or {}
local found=false
for i=1,#u.buildoptions do
if u.buildoptions[i]=="legapt3" then found=true break end
end
if not found then
u.buildoptions[#u.buildoptions+1]="legapt3"
end
end
if UnitDefs["legfortt4"] then
local u=UnitDefs["legfortt4"]
u.cruisealtitude=180
u.name="Apex Tyrannus"
u.description="Apex Legion Flying Fortress"
u.metalcost=100000
u.energycost=2500000
u.buildtime=1000000
u.health=200000
u.speed=30
u.category="ALL WEAPON VTOL T4AIR NOTSUB NOTHOVER"
u.radardistance=2200
u.sightdistance=1400
u.customparams=u.customparams or {}
u.customparams.i18n_en_humanname="Apex Tyrannus"
u.customparams.i18n_en_tooltip="Apex Legion flying fortress with heavy broadside plasma batteries, rapid defensive guns, and long-range anti-air missiles."
if u.weapondefs then
local p=u.weapondefs.plasma
if p then
p.range=1400
p.reloadtime=2.0
p.projectiles=3
p.accuracy=300
p.sprayangle=400
p.weaponvelocity=850
p.areaofeffect=160
p.damage=p.damage or {}
p.damage.default=1600
p.damage.vtol=450
p.damage.subs=100
end
local s=u.weapondefs.semiauto
if s then
s.
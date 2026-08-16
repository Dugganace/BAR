-- MIRV NUKE by CrossGamer
local function addMIRVToSilo(unitName, weaponName) 
    if UnitDefs[unitName] and UnitDefs[unitName].weapondefs and UnitDefs[unitName].weapondefs[weaponName] then 
        local wdefs = UnitDefs[unitName].weapondefs 
        local motherNuke = wdefs[weaponName] 
         
        local childNuke = {} 
        for k, v in pairs(motherNuke) do 
            if type(v) == "table" then 
                childNuke[k] = {} 
                for k2, v2 in pairs(v) do childNuke[k][k2] = v2 end 
            else 
                childNuke[k] = v 
            end 
        end 
         
        local childName = weaponName .. "_mirv_child" 
        childNuke.name = (childNuke.name or "Nuke") .. " (MIRV Child)" 
         
        if childNuke.customparams then 
            childNuke.customparams.speceffect = nil
            childNuke.customparams.cluster_def = nil
            childNuke.customparams.shield_aoe_penetration = nil 
        end 
        
        childNuke.weapontype = "Cannon"
        childNuke.range = 1500
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 40) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 6
        motherNuke.customparams.shield_aoe_penetration = nil
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")-- by CrossGamer -- Antinuke to ICBM Visuals
for n, d in pairs(UnitDefs) do
    if d.weapondefs then
        for _, wDef in pairs(d.weapondefs) do
            if wDef.interceptor == 1 and wDef.weapontype == "StarburstLauncher" then
                wDef.model = "crblmssl.s3o"
                wDef.cegtag = "NUKETRAIL"
                wDef.texture1 = "null"
                wDef.texture2 = "railguntrail"
                wDef.texture3 = "null"
                wDef.smokesize = 35
                wDef.smoketime = 130
                wDef.explosiongenerator = "custom:newnukecor"
                wDef.soundstart = "nukelaunch"
                wDef.soundhit = "nukecor"
                wDef.weaponvelocity = 1600
                wDef.weaponacceleration = 100
                wDef.turnrate = 5500
                wDef.metalpershot = 200
                wDef.energypershot = 14000
                wDef.stockpiletime = 50 
                wDef.areaofeffect = 1000
                wDef.impulsefactor = 0
                wDef.impulseboost = 0
                wDef.cratermult = 0
                
                if type(wDef.damage) == "table" then
                    for k, _ in pairs(wDef.damage) do
                        wDef.damage[k] = 0
                    end
                else
                    wDef.damage = { default = 0 }
                end
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 90
            end
        end
    end
end-- by CrossGamer Portable shield
if UnitDefs then
    local arm_metal = 3000 * 1.2
    local arm_energy = 54000 * 1.2
    local arm_buildtime = 55000 * 1.2
    
    local cor_metal = 3200 * 1.2
    local cor_energy = 55000 * 1.2
    local cor_buildtime = 55000 * 1.2
    
    local leg_metal = 3200 * 1.2
    local leg_energy = 55000 * 1.2
    local leg_buildtime = 55000 * 1.2

    local powerregenenergy = 562.5 * 1.1

    local units_to_modify = {"armcroc", "corsala", "legamphtank"}
    for _, unitName in ipairs(units_to_modify) do
        local ud = UnitDefs[unitName]
        if ud then
            
            ud.name = "Mobile Shield"
            ud.description = "Mobile Plasma Deflector"
            
            if unitName == "armcroc" then
                ud.buildpic = "ARMGATE.DDS"
                ud.metalcost = arm_metal
                ud.energycost = arm_energy
                ud.buildtime = arm_buildtime
            elseif unitName == "corsala" then
                ud.buildpic = "CORGATE.DDS"
                ud.metalcost = cor_metal
                ud.energycost = cor_energy
                ud.buildtime = cor_buildtime
            elseif unitName == "legamphtank" then
                ud.buildpic = "LEGDEFLECTOR.DDS"
                ud.metalcost = leg_metal
                ud.energycost = leg_energy
                ud.buildtime = leg_buildtime
            end

            ud.canattack = false
            
            ud.customparams = ud.customparams or {}
            ud.customparams.shield_power = 6175
            ud.customparams.shield_radius = 550
            
            ud.weapons = {
                [1] = {
                    def = "REPULSOR",
                    onlytargetcategory = "NOTSUB",
                }
            }
            
            ud.weapondefs = ud.weapondefs or {}
            ud.weapondefs.repulsor = {
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
                    power = 6175,
                    powerregen = 130,
                    powerregenenergy = powerregenenergy,
                    radius = 550,
                    repulser = false,
                    smart = true,
                    startingpower = 2090,
                    visiblerepulse = true,
                    badcolor = {1, 0.2, 0.2, 0.2},
                    goodcolor = {0.2, 1, 0.2, 0.17},
                },
            }
        end
    end
end
--Knockback by CrossGamer

if WeaponDefs then
    for name, wDef in pairs(WeaponDefs) do
        if type(wDef) == "table" and wDef.weapontype ~= "Shield" then
            local dmg = 0
            if wDef.damage and wDef.damage.default then
                dmg = wDef.damage.default
            end

            local reload = wDef.reloadtime or 1
            local burst = wDef.burst or 1
            local projectiles = wDef.projectiles or 1

            local dps = (dmg * burst * projectiles) / reload

            local damageMult = 100 / (100 + dps)

            if wDef.damage then
                for k, v in pairs(wDef.damage) do
                    wDef.damage[k] = math.max(0.1, v * damageMult)
                end
            end

            wDef.impulsefactor = (wDef.impulsefactor or 0) * 100 + 50
            wDef.impulseboost = (wDef.impulseboost or 0) * 100 + 50
            wDef.cratermult = (wDef.cratermult or 0) + 2
        end
    end
end

if UnitDefs then
    for name, uDef in pairs(UnitDefs) do
        if type(uDef) == "table" then
            if not uDef.canfly then
                uDef.mass = 1
                uDef.mygravity = 0.5
                if not uDef.customparams then uDef.customparams = {} end
                uDef.customparams.fall_damage_multiplier = "0"
            end
        end
    end
end--T4 Eco (Fusion x2, Converter x5)
local unitDefs = UnitDefs or {}
local lootboxplatinum = 'lootboxplatinum'
local armdf = 'armdf'

-- x2 Fusion Reactor
local energy = {
    buildpic = 'other/resourcecheat.dds',
    buildtime = 200000,
    energycost = 130000,
    energymake = 6000,
    energystorage = 18000,
    explodeas = 'korgExplosionSelfd',
    health = 2000,
    metalcost = 19400,
    metalmake = 0,
    reclaimable = true
}

-- x5 Energy Converter (Giảm 1 nửa so với x10)
local converter = {
    activatewhenbuilt = true,
    buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
    buildtime = 156500,
    energycost = 250000,
    energymake = 0,
    explodeas = 'fusionExplosion',
    health = 500,
    maxwaterdepth = 20,
    metalcost = 4000,
    objectname = 'Units/CORUWFUS.s3o',
    script = 'Units/CORUWFUS.cob',
    selfdestructas = 'fusionExplosionSelfd'
}

local converterCustomparams = {
    energyconv_capacity = 2500,
    energyconv_efficiency = 0.02500,
    subfolder = 'ArmBuildings/LandEconomy',
    unitgroup = 'metal',
    i18n_en_humanname = 'x5 Energy Converter',
    i18n_en_tooltip = 'Converts 2500 energy into 62.5 metal per sec'
}

local converterFeaturedefsDead = {
    blocking = true,
    category = 'corpses',
    collisionvolumeoffsets = '1.8653717041 -0.0807505981445 0.994560241699',
    collisionvolumescales = '89.9762878418 27.3368988037 72.5986480713',
    collisionvolumetype = 'Box',
    damage = 1605,
    featuredead = 'HEAP',
    footprintx = 5,
    footprintz = 5,
    height = 20,
    metal = 1550,
    object = 'Units/coruwfus_dead.s3o',
    reclaimable = true
}

local converterFeaturedefsHeap = {
    blocking = false,
    category = 'heaps',
    damage = 803,
    footprintx = 5,
    footprintz = 5,
    height = 4,
    metal = 620,
    object = 'Units/cor5X5A.s3o',
    reclaimable = true,
    resurrectable = 0
}

local builderNames = {
    'armaca',
    'armack',
    'armacv',
    'coraca',
    'corack',
    'coracv',
    'legaca',
    'legack',
    'legacv'
}

for key, value in pairs(energy) do
    unitDefs[lootboxplatinum][key] = value
end

unitDefs[lootboxplatinum].customparams.i18n_en_humanname = 'x2 Fusion'
unitDefs[lootboxplatinum].customparams.i18n_en_tooltip = 'Produces 6000 Energy, Transportable (Very Hazardous)'

for key, value in pairs(converter) do
    unitDefs[armdf][key] = value
end

for key, value in pairs(converterCustomparams) do
    unitDefs[armdf].customparams[key] = value
end

for key, value in pairs(converterFeaturedefsDead) do
    unitDefs[armdf].featuredefs.dead[key] = value
end
for key, value in pairs(converterFeaturedefsHeap) do
    unitDefs[armdf].featuredefs.heap[key] = value
end

for i = 1, #builderNames do
    local builderName = builderNames[i]
    local nBuildOptions = #unitDefs[builderName].buildoptions
    unitDefs[builderName].buildoptions[nBuildOptions + 1] = armdf
    unitDefs[builderName].buildoptions[nBuildOptions + 2] = lootboxplatinum
endlocal targetFaction = "cor" 
local resourceMult = 2.0

local UnitDefs = UnitDefs or {} 
for i, unit in pairs(UnitDefs) do
    local faction = string.sub(i, 1, 3)
    if faction == targetFaction then
        if unit.extractsmetal then
            unit.extractsmetal = unit.extractsmetal * resourceMult
        end
        if unit.energymake then
            unit.energymake = unit.energymake * resourceMult
        end
        if unit.energyupkeep and unit.energyupkeep < 0 then
            unit.energyupkeep = unit.energyupkeep * resourceMult
        end
    end
end

if UnitDefs[targetFaction.."win"] and UnitDefs[targetFaction.."win"].customparams then
    UnitDefs[targetFaction.."win"].customparams.energymultiplier = resourceMult
end

if targetFaction == "leg" then
    if UnitDefs["legeconv"] and UnitDefs["legeconv"].customparams then
        UnitDefs["legeconv"].customparams.energyconv_efficiency = 0.01429 * resourceMult
    end
    if UnitDefs["legadveconv"] and UnitDefs["legadveconv"].customparams then
        UnitDefs["legadveconv"].customparams.energyconv_efficiency = 0.01724 * resourceMult
    end
else
    if UnitDefs[targetFaction.."makr"] and UnitDefs[targetFaction.."makr"].customparams then
        UnitDefs[targetFaction.."makr"].customparams.energyconv_efficiency = 0.01429 * resourceMult
    end
    if UnitDefs[targetFaction.."mmkr"] and UnitDefs[targetFaction.."mmkr"].customparams then
        UnitDefs[targetFaction.."mmkr"].customparams.energyconv_efficiency = 0.01724 * resourceMult
    end
end   
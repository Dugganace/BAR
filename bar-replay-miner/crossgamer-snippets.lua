-- CrossGamer content pulled from his replay history (bar-replay-miner project)
-- Deduped across his 17 distinct preset variants, 2026-08-15

--  Anti-Nuke T3 Mod by CrossGamer

local UnitDefs = UnitDefs or {}

local function deepcopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == 'table' then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[deepcopy(orig_key)] = deepcopy(orig_value)
        end
    else
        copy = orig
    end
    return copy
end

local function createT3AntiNuke(faction, baseUnit, newUnit)
    if UnitDefs[baseUnit] and not UnitDefs[newUnit] then
        local t2 = UnitDefs[baseUnit]
        
        -- Deep copy UnitDef fully to prevent reference leaking
        local t3 = deepcopy(t2)

        -- Modifying unit properties
        t3.name = (t3.name or baseUnit) .. " T3"
        t3.health = t2.health * 2.5
        t3.metalcost = t2.metalcost * 3
        t3.energycost = t2.energycost * 3
        t3.buildtime = t2.buildtime * 3
        
        t3.customparams = t3.customparams or {}
        t3.customparams.i18n_en_humanname = "T3 Anti-Nuke"
        t3.customparams.i18n_en_tooltip = "Extended Range Anti-Nuke (Cheaper/Faster stockpiling)"
        
        -- Use scavenger variant build pictures
        t3.buildpic = "scavengers/" .. string.upper(baseUnit) .. ".DDS"
        t3.icontype = baseUnit
        
        -- Apply the scav .s3o object model
        local oldObjectName = string.lower(t3.objectname or "")
        -- Check if it contains "units/" to strip it.
        local baseName = oldObjectName:match("([^/]+)$")
        if baseName then
            t3.objectname = "scavs/" .. baseName
        end

        -- Apply a model scale to distinguish it visually
        if t3.customparams.modelscale then
            t3.customparams.modelscale = tostring(tonumber(t3.customparams.modelscale) * 1.5)
        else
            t3.customparams.modelscale = "1.5"
        end

        -- Modify Weapons
        local wdefName = next(t3.weapondefs)
        if wdefName then
            local wdef = t3.weapondefs[wdefName]
            wdef.coverage = (wdef.coverage or 2000) * 2 -- Double protection range
            wdef.stockpiletime = math.floor((wdef.stockpiletime or 90) / 3) -- 1/3 stockpile time
            wdef.energypershot = math.floor((wdef.energypershot or 7500) * 0.9) -- 10% less energy cost
            wdef.metalpershot = math.floor((wdef.metalpershot or 150) * 0.9) -- 10% less metal cost
            wdef.customparams = wdef.customparams or {}
            wdef.customparams.stockpilelimit = 30 -- Limit to 30
            -- Note: Some game variants enforce limit directly on wdef, we set both to be safe
            wdef.stockpilelimit = 30
        end

        UnitDefs[newUnit] = t3
        
        -- Add to constructors
        local buildoptions = {
            "armack", "armaca", "armacv", "armhack", "armhaca", "armhacv",
            "corack", "coraca", "coracv", "corhack", "corhaca", "corhacv",
            "legack", "legaca", "legacv", "leghack", "leghaca", "leghacv"
        }
        
        for _, builder in ipairs(buildoptions) do
            if UnitDefs[builder] and UnitDefs[builder].buildoptions and string.sub(builder, 1, 3) == faction then
                local hasOption = false
                for _, opt in pairs(UnitDefs[builder].buildoptions) do
                    if opt == newUnit then hasOption = true break end
                end
                if not hasOption then
                    -- insert it at the end of the buildoptions map
                    local maxIndex = 0
                    for idx, _ in pairs(UnitDefs[builder].buildoptions) do
                        if type(idx) == "number" and idx > maxIndex then
                            maxIndex = idx
                        end
                    end
                    UnitDefs[builder].buildoptions[maxIndex + 1] = newUnit
                end
            end
        end
    end
end

createT3AntiNuke("arm", "armamd", "armamdt3")
createT3AntiNuke("cor", "corfmd", "corfmdt3")
createT3AntiNuke("leg", "legabm", "legabmt3")

-- Scavenger Beacon to Nuke Silo by CrossGamer

local function makeSilo(beaconName, tier)
    if UnitDefs and UnitDefs[beaconName] and UnitDefs["armsilo"] then
        local armsilo_wdefs = UnitDefs["armsilo"].weapondefs
        local armsilo_weapons = UnitDefs["armsilo"].weapons
        
        local scav = UnitDefs[beaconName]
        scav.weapondefs = {}
        
        for wname, wdata in pairs(armsilo_wdefs) do
            scav.weapondefs[wname] = {}
            for k, v in pairs(wdata) do
                if type(v) == "table" then
                    scav.weapondefs[wname][k] = {}
                    for k2, v2 in pairs(v) do
                        scav.weapondefs[wname][k][k2] = v2
                    end
                else
                    scav.weapondefs[wname][k] = v
                end
            end
            
            -- Adjust stockpiletime based on tier
            if scav.weapondefs[wname].stockpiletime then
                if tier == 2 then
                    scav.weapondefs[wname].stockpiletime = math.floor(scav.weapondefs[wname].stockpiletime / 3)
                elseif tier == 3 then
                    scav.weapondefs[wname].stockpiletime = 30
                elseif tier == 4 then
                    scav.weapondefs[wname].stockpiletime = 10
                end
                -- Tier 1 remains unchanged (normal)
            end
        end
        
        scav.weapons = {}
        for i, wdata in pairs(armsilo_weapons) do
            scav.weapons[i] = {}
            for k, v in pairs(wdata) do
                scav.weapons[i][k] = v
            end
        end
        
        scav.canattack = true
    end
end

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
                childNuke.damage[k] = math.floor(v / 6) 
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

makeSilo("scavbeacon_t1", 1)
makeSilo("scavbeacon_t2", 2)
makeSilo("scavbeacon_t3", 3)
makeSilo("scavbeacon_t4", 4)
makeSilo("scavbeacon_t1_scav", 1)
makeSilo("scavbeacon_t2_scav", 2)
makeSilo("scavbeacon_t3_scav", 3)
makeSilo("scavbeacon_t4_scav", 4)

addMIRVToSilo("scavbeacon_t1", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4", "nuclear_missile")
addMIRVToSilo("scavbeacon_t1_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4_scav", "nuclear_missile")

-- by CrossGamer -- Antinuke to ICBM Visuals
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
                wDef.metalpershot = 175
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
end--ExponentialEvoEcoConTurre

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
                childNuke.damage[k] = math.floor(v / 35) 
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
                wDef.metalpershot = 300
                wDef.energypershot = 37500
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
endlocal targetFaction = "cor" 
local resourceMult = 30.0

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

--  Beacon Nuke by CrossGamer

local function makeSilo(beaconName, tier)
    if UnitDefs and UnitDefs[beaconName] and UnitDefs["armsilo"] then
        local armsilo_wdefs = UnitDefs["armsilo"].weapondefs
        local armsilo_weapons = UnitDefs["armsilo"].weapons
        
        local scav = UnitDefs[beaconName]
        scav.weapondefs = {}
        
        for wname, wdata in pairs(armsilo_wdefs) do
            scav.weapondefs[wname] = {}
            for k, v in pairs(wdata) do
                if type(v) == "table" then
                    scav.weapondefs[wname][k] = {}
                    for k2, v2 in pairs(v) do
                        scav.weapondefs[wname][k][k2] = v2
                    end
                else
                    scav.weapondefs[wname][k] = v
                end
            end
            
            -- Adjust stockpiletime based on tier
            if scav.weapondefs[wname].stockpiletime then
                if tier == 2 then
                    scav.weapondefs[wname].stockpiletime = math.floor(scav.weapondefs[wname].stockpiletime / 3)
                elseif tier == 3 then
                    scav.weapondefs[wname].stockpiletime = 30
                elseif tier == 4 then
                    scav.weapondefs[wname].stockpiletime = 10
                end
                -- Tier 1 remains unchanged (normal)
            end
        end
        
        scav.weapons = {}
        for i, wdata in pairs(armsilo_weapons) do
            scav.weapons[i] = {}
            for k, v in pairs(wdata) do
                scav.weapons[i][k] = v
            end
        end
        
        scav.canattack = true
    end
end

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
                childNuke.damage[k] = math.floor(v / 6) 
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

makeSilo("scavbeacon_t1", 1)
makeSilo("scavbeacon_t2", 2)
makeSilo("scavbeacon_t3", 3)
makeSilo("scavbeacon_t4", 4)
makeSilo("scavbeacon_t1_scav", 1)
makeSilo("scavbeacon_t2_scav", 2)
makeSilo("scavbeacon_t3_scav", 3)
makeSilo("scavbeacon_t4_scav", 4)

addMIRVToSilo("scavbeacon_t1", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4", "nuclear_missile")
addMIRVToSilo("scavbeacon_t1_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4_scav", "nuclear_missile")

-- by CrossGamer Portable shield
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


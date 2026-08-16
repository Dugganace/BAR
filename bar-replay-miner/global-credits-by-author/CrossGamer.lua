-- CrossGamer -- content pulled from public BAR replays (bar-replay-miner global scan, 2026-08-15)
-- 29 distinct snippet(s), 289 total occurrences across scanned games

-- === "-- No Dgun by CrossGamer" (seen 1x) ===
-- No Dgun by CrossGamer

local UnitDefs = UnitDefs or {}
for unitDefName, unitDef in pairs(UnitDefs) do
	if type(unitDef) == "table" then
		local isCommander = false
		
		-- Check customparams for iscommander or isdecoycommander
		if unitDef.customparams then
			if unitDef.customparams.iscommander or unitDef.customparams.isdecoycommander then
				isCommander = true
			end
			-- Some mods use string "1" or "true"
			if unitDef.customparams.iscommander == "1" or unitDef.customparams.iscommander == "true" or unitDef.customparams.isdecoycommander == "1" or unitDef.customparams.isdecoycommander == "true" then
				isCommander = true
			end
		end
		
		-- Some unitdefs might have it directly on the unitdef
		if unitDef.iscommander == true or unitDef.isCommander == true or unitDef.isdecoycommander == true then
			isCommander = true
		end
		
		-- Check unit movement class just to be safe if customparams is missing on some evocommander
		if unitDef.movementclass and string.find(string.upper(unitDef.movementclass), "COMMANDER") then
			isCommander = true
		end
		
		-- Only apply to commanders to avoid hitting behemoths or other units
		if isCommander then
			if unitDef.candgun then
				unitDef.candgun = false
			end
			
			if unitDef.canDGun then
				unitDef.canDGun = false
			end
			
			local removedWeaponDefs = {}
			if unitDef.weapondefs then
				for weaponDefName, weaponDef in pairs(unitDef.weapondefs) do
					if weaponDef.weapontype == "DGun" then
						removedWeaponDefs[string.upper(weaponDefName)] = true
						unitDef.weapondefs[weaponDefName] = nil
					end
				end
			end
			
			if unitDef.weapons then
				local newWeapons = {}
				local nextIdx = 1
				for i, weapon in pairs(unitDef.weapons) do
					local weaponDefName = weapon.def and string.upper(weapon.def) or ""
					-- Remove if type was DGun or it matches disintegrator/dgun naming
					if not removedWeaponDefs[weaponDefName] and not string.find(weaponDefName, "DISINTEGRATOR") and not string.find(weaponDefName, "DGUN") then
						newWeapons[nextIdx] = weapon
						nextIdx = nextIdx + 1
					end
				end
				unitDef.weapons = nextIdx > 1 and newWeapons or nil
			end
		end
	end
end

-- === "-- Anti-Nuke T3 Mod by CrossGamer" (seen 6x) ===
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

-- === "-- Beacon Nuke by CrossGamer" (seen 2x) ===
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

-- === "-- MIRV NUKE by CrossGamer" (seen 65x) ===
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
                childNuke.damage[k] = math.floor(v / 15) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 8
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
                    wDef.damage = { d

-- === "-- by CrossGamer -- Antinuke to ICBM" (seen 72x) ===
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
                wDef.weaponvelocity = 1600
                wDef.weaponacceleration = 100
                wDef.turnrate = 5500
                wDef.metalpershot = 300
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
end

-- === "-- Scavenger Beacon to Nuke Silo by CrossGamer" (seen 3x) ===
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

-- === "-- by CrossGamer Portable shield" (seen 54x) ===
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

-- === "--Knockback by CrossGamer" (seen 41x) ===
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

-- === "-- by CrossGamer" (seen 2x) ===
-- by CrossGamer -- Air T2 builds Nuke
if UnitDefs then
    local addBO = {
        armaca = {"armsilo", "armamd"},
        coraca = {"corsilo", "corfmd"},
        legaca = {"legsilo", "legtrem"}
    }
    
    for builder, buildings in pairs(addBO) do
        local ud = UnitDefs[builder]
        if ud and ud.buildoptions then
            for _, b in ipairs(buildings) do
                local exists = false
                for _, ex in ipairs(ud.buildoptions) do
                    if ex == b then 
                        exists = true 
                        break 
                    end
                end
                if not exists then 
                    table.insert(ud.buildoptions, b) 
                end
            end
        end
    end
end

-- === "-- by CrossGamer -- Air T2 builds Nu" (seen 3x) ===
-- by CrossGamer -- Air T2 builds Nuke
if UnitDefs then
    local addBO = {
        armaca = {"armsilo", "armamd"},
        coraca = {"corsilo", "corfmd"},
        legaca = {"legsilo", "legtrem"}
    }
    
    for builder, buildings in pairs(addBO) do
        local ud = UnitDefs[builder]
        if ud and ud.buildoptions then
            for _, b in ipairs(buildings) do
                local exists = false
                for _, ex in ipairs(ud.buildoptions) do
                    if ex == b then 
                        exists = true 
                        break 
                    end
                end
                if not exists then 
                    table.insert(ud.buildoptions, b) 
                end
            end
        end
    end
end

-- === "-- Knockback by CrossGamer" (seen 10x) ===
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

-- === "-- MIRV by CrossGamer" (seen 1x) ===
-- MIRV by CrossGamer
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
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")-- by CrossGamer Portable shield
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

-- === "-- Portable shield by CrossGamer" (seen 1x) ===
-- Portable shield by CrossGamer 
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

    local units_to_modify = {"armcroc", "corsala", "legfloat"}
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
            elseif unitName == "legfloat" then
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

-- === "-- Fly by CrossGamer" (seen 1x) ===
-- Fly by CrossGamer
processed = {} 

    for n,d in pairs(UnitDefs) do
      local a=d.customparams and d.customparams.iscommander
      local b=d.canfly and not a
      if b then
        d.dontland=true
        if not d.customparams then d.customparams={} end
        d.customparams.fighter="1"
      elseif not d.canfly and d.health and d.health>0 and (tonumber(d.speed) or 0)>0 and not a then
        d.canfly=true
        d.cruisealtitude=150
        d.hoverattack=true
        d.upright=true
        d.turnrate=(tonumber(d.turnrate) or 500)*1.5
        d.acceleration=(tonumber(d.acceleration) or 0.1)*2
        d.floater=false
        d.waterline=0
        d.minwaterdepth=0
        d.dontland=true
        if not d.customparams then d.customparams={} end
        d.customparams.fighter="1"
      end
      local c={}
      if d.weapons then
        for _,e in pairs(d.weapons) do
          if e.onlytargetcategory=="VTOL" or e.badtargetcategory=="NOTAIR" or e.badtargetcategory=="NOTAIR LIGHTAIRSCOUT" then
            if e.def then c[string.lower(e.def)]=true end
          end
          e.badtargetcategory=nil
          e.onlytargetcategory=nil
          e.maxangledif=360
        end
      end
      if d.weapondefs then
        for f,g in pairs(d.weapondefs) do
          if not processed[g] then
            processed[g]=true
            local h=c[string.lower(f)] or (g.canattackground==false)
            local i=0
            if g.damage then
              local j=tonumber(g.damage.default) or 0
              local k=tonumber(g.damage.vtol) or 0
              i=math.max(j,k)
            end
            local l=1.2
            if b then l=l+0.6 end
            if h then l=l+0.6 end
            if g.damage and i>0 then
              local m=i*l
              g.damage.default=m
              g.damage.vtol=m
              g.damage.subs=m
            end
            if g.weaponvelocity then
              g.weaponvelocity=(tonumber(g.weaponvelocity) or 100)*1.5
            end
            g.canattackground=true
            if g.waterweapon then g.waterweapon=nil end
            g.badtargetcategory=nil
            g.onlytargetcategory=nil
            if g.weapontype=="MissileLauncher" or g.weapontype=="StarburstLauncher" then
              g.tolerance=32000
              if g.flighttime then g.flighttime=(tonumber(g.flighttime) or 2)*1.5 end
              if g.turnrate then g.turnrate=(tonumber(g.turnrate) or 1000)*1.5 end
            end
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

    local units_to_modify = {"armcroc", "corsala", "legfloat"}
    for _, unitName in i

-- === "-- by CrossGamer NUKE" (seen 3x) ===
-- by CrossGamer NUKE
ocal function addMIRVToSilo(unitName, weaponName) 
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
        motherNuke.customparams.cluster_number = 7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")--BaRandom v29 by LoH
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.75;local c=7;local d=0.2;local e=0.5;local f=5;local g={0,0,0}local h={28,28,28}local i=0.034;local j=0.90;local k=0.98;local l=6;local m={armcom=true,corcom=true,legcom=true}local n={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75}local o={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50}local p={["Glass Cannon"]={{"Phantom",n,{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}}},["Sniper"]={{"Phantom",n,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}}},["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}}},["Watchtower"]={{"Phantom",o,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3

-- === "-- by CrossGamer -- Flying Tanks & W" (seen 4x) ===
-- by CrossGamer -- Flying Tanks & Walking Planes Mod
local tanks = {
    -- Armada
    ["armfav"]=true, ["armmlv"]=true, ["armflash"]=true, ["armart"]=true, ["armcv"]=true, ["armbeaver"]=true, ["armsam"]=true, ["armpincer"]=true, ["armstump"]=true, ["armjanus"]=true, ["armjam"]=true, ["armseer"]=true, ["armgremlin"]=true, ["armconsul"]=true, ["armmart"]=true, ["armlatnk"]=true, ["armyork"]=true, ["armacv"]=true, ["armcroc"]=true, ["armmerl"]=true, ["armbull"]=true, ["armmanni"]=true, ["armthor"]=true,
    -- Cortex
    ["corfav"]=true, ["cormlv"]=true, ["corgator"]=true, ["corcv"]=true, ["cormist"]=true, ["cormuskrat"]=true, ["corwolv"]=true, ["corgarp"]=true, ["corlevlr"]=true, ["corraid"]=true, ["corvrad"]=true, ["coreter"]=true, ["corsala"]=true, ["cormart"]=true, ["corsent"]=true, ["coracv"]=true, ["correap"]=true, ["corvroc"]=true, ["corban"]=true, ["corparrow"]=true, ["cormabm"]=true, ["corgol"]=true, ["cortrem"]=true,
    -- Legion
    ["legscout"]=true, ["legmlv"]=true, ["leghades"]=true, ["legcv"]=true, ["legotter"]=true, ["leghelios"]=true, ["legamphtank"]=true, ["legrail"]=true, ["legbar"]=true, ["leggat"]=true, ["legvcarry"]=true, ["legavjam"]=true, ["legavrad"]=true, ["legafcv"]=true, ["legmrv"]=true, ["legaskirmtank"]=true, ["legamcluster"]=true, ["legvflak"]=true, ["legacv"]=true, ["legfloat"]=true, ["legavroc"]=true, ["legavantinuke"]=true, ["legaheattank"]=true, ["legmed"]=true, ["leginf"]=true, ["legkeres"]=true, ["legerailtank"]=true
}

local planes = {
    -- Armada
    ["armpeep"]=true, ["armatlas"]=true, ["armfig"]=true, ["armsfig"]=true, ["armca"]=true, ["armsehak"]=true, ["armkam"]=true, ["armthund"]=true, ["armcsa"]=true, ["armhvytrans"]=true, ["armsaber"]=true, ["armsb"]=true, ["armseap"]=true, ["armhawk"]=true, ["armawac"]=true, ["armpnix"]=true, ["armbrawl"]=true, ["armdfly"]=true, ["armaca"]=true, ["armlance"]=true, ["armstil"]=true, ["armblade"]=true, ["armliche"]=true,
    -- Cortex
    ["corfink"]=true, ["corbw"]=true, ["corveng"]=true, ["corvalk"]=true, ["corsfig"]=true, ["corca"]=true, ["corhunt"]=true, ["corcsa"]=true, ["corshad"]=true, ["corhvytrans"]=true, ["corsb"]=true, ["corcut"]=true, ["corseap"]=true, ["corvamp"]=true, ["corawac"]=true, ["corhurc"]=true, ["coraca"]=true, ["corape"]=true, ["corseah"]=true, ["cortitan"]=true, ["corcrwh"]=true,
    -- Legion
    ["legdrone"]=true, ["legfig"]=true, ["legkam"]=true, ["leglts"]=true, ["legspfighter"]=true, ["legheavydrone"]=true, ["legcib"]=true, ["legca"]=true, ["legmos"]=true, ["legspradarsonarplane"]=true, ["legspcon"]=true, ["legatrans"]=true, ["legsptorpgunship"]=true, ["legspbomber"]=true, ["legspcarrier"]=true, ["legspsurfacegunship"]=true, ["legvenator"]=true, ["legafigdef"]=true, ["legwhisper"]=true, ["legmineb"]=true, ["legaca"]=true, ["legphoenix"]=true, ["legatorpbomber"]=true, ["legstronghold"]=true, ["legfort"]=true
}

for n, d in pairs(UnitDefs) do
    local isModified = false

    if tanks[n] and not d.canfly then
        d.canfly, d.cruisealtitude, d.hoverattack, d.upright, d.mo

-- === "-- Chain lightning by CrossGamer" (seen 1x) ===
-- Chain lightning by CrossGamer
for n, d in pairs(UnitDefs) do 
    if d.weapondefs then
        for wName, wDef in pairs(d.weapondefs) do
            if wDef.weapontype ~= "Shield" then
                if not wDef.customparams then wDef.customparams = {} end
                if not wDef.customparams.spark_forkdamage then
                    wDef.customparams.spark_ceg = "genericshellexplosion-splash-lightning"
                    wDef.customparams.spark_forkdamage = "0.1"   
                    wDef.customparams.spark_maxunits = "8"       
                    wDef.customparams.spark_range = "120"        
                end
            end
        end
    end
end

-- === "--mirv by crossgamer" (seen 1x) ===
--mirv by crossgamer
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
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")

-- === "-- knockback by crossgamer" (seen 1x) ===
-- knockback by crossgamer
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
end

-- === "--ANTINUKE by Crossgamer" (seen 1x) ===
--ANTINUKE by Crossgamer
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
                
                wDef.stockpiletime = 60 
                
                wDef.areaofeffect = 1000
                wDef.edgeeffectiveness = 0.3
                
                if not wDef.damage then
                    wDef.damage = {}
                end
                wDef.damage.default = 5500
                wDef.damage.commanders = 1200
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                -- Thay đổi thời gian nạp ICBM tại đây (tính bằng giây, mặc định là 180s)
                wDef.stockpiletime =100
            end
        end
    end
end--NUKE by CrossGamer
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
        motherNuke.customparams.speceffect = nil -- Xóa split
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number =

-- === "--NUKE by CrossGamer" (seen 1x) ===
--NUKE by CrossGamer
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
        motherNuke.customparams.speceffect = nil -- Xóa split
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 10
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 

addMIRVToSilo("armsilo", "nuclear_missile")

addMIRVToSilo("legsilo", "legicbm")

-- === "-- by CrossGamer Knockback" (seen 4x) ===
-- by CrossGamer Knockback
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
end-- by CrossGamer -- Antinuke to ICBM Visuals & Stats
for n, d in pairs(UnitDefs) do
    if d.weapondefs then
        for _, wDef in pairs(d.weapondefs) do
            -- 1. Sửa Antinuke
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
                
                wDef.stockpiletime = 60 
                
                wDef.areaofeffect = 1000
                wDef.edgeeffectiveness = 0.3
                
                if not wDef.damage then
                    wDef.damage = {}
                end
                wDef.damage.default = 5500
                wDef.damage.commanders = 1200
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 90
            end
        end
    end
end

-- === "-- by CrossGamer -- Antigravity" (seen 3x) ===
-- by CrossGamer -- Antigravity
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
        motherNuke.customparams.speceffect = nil -- Xóa split
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number =7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 

addMIRVToSilo("armsilo", "nuclear_missile")

addMIRVToSilo("legsilo", "legicbm")-- by CrossGamer AdvSAM AA Homing Nuke
if UnitDefs then local u1,u2=UnitDefs.armmercury,UnitDefs.corscreamer if u1 then u1.buildtime=150000 u1.metalcost=6500 u1.energycost=90000 end if u2 then u2.buildtime=150000 u2.metalcost=6500 u2.energycost=90000 end end if WeaponDefs then for _,n in ipairs({"armmercury_arm_advsam","corscreamer_cor_advsam"})do local w=WeaponDefs[n] if w then w.tracks=true w.turnrate=99000 w.trajectoryheight=0.55 w.reloadtime=20 w.areaofeffect=2000 w.craterareaofeffect=2000 w.explosiongenerator="custom:newnuke" w.soundhit="nukearm" w.soundstart="nukelaunch" w.customparams=w.customparams or{} w.customparams.nuclear=1 w.damage=w.damage or{} w.damage.default=15000 w.damage.vtol=15000 w.flighttime=10 end end end

-- === "-- by CrossGamer AdvSAM AA Homing Nu" (seen 2x) ===
-- by CrossGamer AdvSAM AA Homing Nuke
if UnitDefs then local u1,u2=UnitDefs.armmercury,UnitDefs.corscreamer if u1 then u1.buildtime=150000 u1.metalcost=6500 u1.energycost=90000 end if u2 then u2.buildtime=150000 u2.metalcost=6500 u2.energycost=90000 end end if WeaponDefs then for _,n in ipairs({"armmercury_arm_advsam","corscreamer_cor_advsam"})do local w=WeaponDefs[n] if w then w.tracks=true w.turnrate=99000 w.trajectoryheight=0.55 w.reloadtime=20 w.areaofeffect=2000 w.craterareaofeffect=2000 w.explosiongenerator="custom:newnuke" w.soundhit="nukearm" w.soundstart="nukelaunch" w.customparams=w.customparams or{} w.customparams.nuclear=1 w.damage=w.damage or{} w.damage.default=15000 w.damage.vtol=15000 w.flighttime=10 end end end

-- === "-- by CrossGamer ANTINUKE" (seen 1x) ===
-- by CrossGamer ANTINUKE
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
                
                wDef.stockpiletime = 60 
                
                wDef.areaofeffect = 1000
                wDef.edgeeffectiveness = 0.3
                
                if not wDef.damage then
                    wDef.damage = {}
                end
                wDef.damage.default = 5500
                wDef.damage.commanders = 1200
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 100
            end
        end
    end
end-- by CrossGamer NUKE
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
        end 
        
        childNuke.weapontype = "Cannon"
        
        childNuke.range = 1400
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 6) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil 
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")

-- === "-- by CrossGamer Antinuke" (seen 1x) ===
-- by CrossGamer Antinuke
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
                wDef.edgeeffectiveness = 0.3
                
                if not wDef.damage then
                    wDef.damage = {}
                end
                wDef.damage.default = 5500
                wDef.damage.commanders = 1200
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 90
            end
        end
    end
end-- by CrossGamer Nuke
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
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
a

-- === "-- by CrossGamer Nuke" (seen 1x) ===
-- by CrossGamer Nuke
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
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")-- by CrossGamer Knockback
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

            wDef.impulsefactor = (wDef.impulsefactor or 0) * 60+ 50
            wDef.impulseboost = (wDef.impulseboost or 0) * 60+ 50
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
end

-- === "-- mod by CrossGamer NUKE" (seen 1x) ===
-- mod by CrossGamer NUKE
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
        motherNuke.customparams.cluster_number = 7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")if WeaponDefs then
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
end

-- === "-- by CrossGamer -- Gravity Inversio" (seen 2x) ===
-- by CrossGamer -- Gravity Inversion Mod
local excludedCommanders = {
    ["armcom"] = true, ["armcomlvl2"] = true, ["armcomlvl3"] = true, ["armcomlvl4"] = true,
    ["armcomlvl5"] = true, ["armcomlvl6"] = true, ["armcomlvl7"] = true, ["armcomlvl8"] = true,
    ["armcomlvl9"] = true, ["armcomlvl10"] = true, ["armdecom"] = true, ["armcomboss"] = true,
    ["armscavengerbossv2"] = true,
    ["corcom"] = true, ["corcomlvl2"] = true, ["corcomlvl3"] = true, ["corcomlvl4"] = true,
    ["corcomlvl5"] = true, ["corcomlvl6"] = true, ["corcomlvl7"] = true, ["corcomlvl8"] = true,
    ["corcomlvl9"] = true, ["corcomlvl10"] = true, ["cordecom"] = true, ["corcomboss"] = true,
    ["legcom"] = true, ["legcomlvl2"] = true, ["legcomlvl3"] = true, ["legcomlvl4"] = true,
    ["legcomlvl5"] = true, ["legcomlvl6"] = true, ["legcomlvl7"] = true, ["legcomlvl8"] = true,
    ["legcomlvl9"] = true, ["legcomlvl10"] = true, ["legcomdef"] = true, ["legcomecon"] = true,
    ["legcomoff"] = true, ["legcomt2com"] = true, ["legcomt2def"] = true, ["legcomt2off"] = true,
    ["legdecom"] = true,
    ["scavengerbossv4"] = true, ["comeffigy"] = true
}

for n, d in pairs(UnitDefs) do
    if not excludedCommanders[n] then
        local isModified = false

        if d.canfly and d.health and d.health > 0 then
            d.canfly = false
            d.cruisealtitude = nil
            d.hoverattack = false
            d.movementclass = "TANK3"
            d.collide = true
            d.maxslope = 15
            d.maxwaterdepth = 15
            d.upright = true
            d.turnrate = 350
            d.turninplace = true
            d.turninplaceanglelimit = 90
            d.footprintx = d.footprintx or 3
            d.footprintz = d.footprintz or 3
            isModified = true
            
        elseif not d.canfly and d.movementclass and d.health and d.health > 0 and (tonumber(d.speed) or 0) > 0 then
            d.canfly = true
            d.cruisealtitude = 150
            d.upright = true
            d.movementclass = nil
            
            if d.weapons and next(d.weapons) then
                d.hoverattack = true
            end
            
            d.turnrate = (tonumber(d.turnrate) or 500) * 1.5
            d.acceleration = (tonumber(d.acceleration) or 0.1) * 2
            d.floater = false
            d.waterline = 0
            d.minwaterdepth = 0
            isModified = true
        end

        if isModified then
            if d.weapons then
                for _, weapon in pairs(d.weapons) do
                    if weapon.badtargetcategory and (string.find(weapon.badtargetcategory, "VTOL") or string.find(weapon.badtargetcategory, "NOTAIR")) then
                        weapon.badtargetcategory = nil
                    end
                    if weapon.onlytargetcategory and (string.find(weapon.onlytargetcategory, "VTOL") or string.find(weapon.onlytargetcategory, "NOTAIR")) then
                        weapon.onlytargetcategory = nil
                    end
                end
            end


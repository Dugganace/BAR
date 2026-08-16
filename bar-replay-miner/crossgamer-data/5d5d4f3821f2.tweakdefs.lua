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
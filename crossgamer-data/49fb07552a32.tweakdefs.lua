local targetFaction = "cor" 
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
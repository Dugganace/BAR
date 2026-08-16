-- 1. Create a clean list by checking Build Power
local combatOnly = {}
for _, unitName in ipairs(unitsToTry) do
    if UnitDefs[unitName] then
        -- Check if buildSpeed exists and is 0 (or nil)
        local buildPower = UnitDefs[unitName].buildSpeed or 0
        
        if buildPower == 0 then
            table.insert(combatOnly, unitName)
        else
            -- Optional: Log which units were kicked out
            -- Spring.Echo("REMOVED BUILDER: " .. unitName)
        end
    end
end

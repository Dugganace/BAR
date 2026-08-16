-- 2. Loop through your 'unitsToAdd' list and add them one by one
            for _, unitName in ipairs(unitsToAdd) do
                table.insert(UnitDefs[name].buildoptions, unitName)
            end
            
            -- Spring.Echo("Updated " .. name .. " with " .. #unitsToAdd .. " units.")
        end
    end
end
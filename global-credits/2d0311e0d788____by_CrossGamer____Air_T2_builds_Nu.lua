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
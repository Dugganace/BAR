-- Disable Tyrannus/Dragon

local legaap = UnitDefs["legaap"]
if legaap and legaap.buildoptions then
    for i=#legaap.buildoptions,1,-1 do
        if legaap.buildoptions[i] == "legfort" then
            table.remove(legaap.buildoptions, i)
        end
    end
end

local coraap = UnitDefs["coraap"]
if coraap and coraap.buildoptions then
    for i=#coraap.buildoptions,1,-1 do
        if coraap.buildoptions[i] == "corcrwh" then
            table.remove(coraap.buildoptions, i)
        end
    end
end
-- Detect tech level from customparams or by factory buildoption membership
local function getTechLevel(name, uDef)
    if uDef.customparams and uDef.customparams.techlevel then
        local tl = tonumber(uDef.customparams.techlevel)
        if tl then return tl end
    end
    return nil
end

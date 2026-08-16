-- Create T3 nano turrets by merging from T2 variants
for l, faction in pairs({"arm", "cor", "leg"}) do
    local srcUnit = faction .. "nanotct2"
    local newUnit = faction .. "nanotct3"
    
    if UnitDefs[srcUnit] and not UnitDefs[newUnit] then
        UnitDefs[newUnit] = table.merge(UnitDefs[srcUnit], {
            metalcost = 3360,
            energycost = 51200,
            builddistance = 625,
            buildtime = 88000,
            collisionvolumescales = "61 128 61",
            footprintx = 6,
            footprintz = 6,
            health = 8800,
            mass = 37200,
            sightdistance = 625,
            workertime = 3000,
            canrepeat = true,
            objectname = (faction == "leg") and "Units/legnanotcbase.s3o" or (faction == "cor") and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",
            customparams = {
                i18n_en_humanname = "Epic Construction Turret",
                i18n_en_tooltip = "T3 Buildpower"
            }
        })
    end
end

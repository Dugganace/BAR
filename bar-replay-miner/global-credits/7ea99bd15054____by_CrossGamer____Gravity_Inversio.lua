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

--Bigger Tier Steps by Ambo V0.4
for name, ud in pairs(UnitDefs) do
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 2) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 2) end
            if ud.health then ud.health = math.floor(ud.health * 2) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.5 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.5 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.5 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.5 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.4 end
        else
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 4) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 4) end
            if ud.health then ud.health = math.floor(ud.health * 4) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.77) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.5 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.5 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.8 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.5 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.4 end
        end
    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 5) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 5) end
            if ud.health then ud.health = math.floor(ud.health * 5) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.44) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.44 end
            if ud.range then ud.range = math.floor(ud.range * 3.33) end
            if ud.energymake then ud.energymake = ud.energymake * 2.6 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 2.6 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 2.6 end
            if ud.customparams.energyconv_efficiency then ud.customp
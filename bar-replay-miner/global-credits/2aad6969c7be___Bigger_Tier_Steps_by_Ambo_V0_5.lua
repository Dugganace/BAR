--Bigger Tier Steps by Ambo V0.5
for name, ud in pairs(UnitDefs) do
    local m_metal, m_energy, m_health, m_speed, m_reload, m_range, m_energy_gen, m_metal_gen, m_conv_cap, m_conv_eff, m_wind
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 2; m_energy = 2; m_health = 2; m_reload = 0.4; m_range = 1.5; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.5; m_conv_eff = 1.5; m_wind = 1.4
        else
            m_metal = 4; m_energy = 4; m_health = 4; m_speed = 0.77; m_reload = 0.4; m_range = 1.88; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.8; m_conv_eff = 1.5; m_wind = 1.4
        end
    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 5; m_energy = 5; m_health = 5; m_speed = 0.44; m_reload = 0.2; m_range = 2.4; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        else
            m_metal = 10; m_energy = 10; m_health = 10; m_speed = 0.44; m_reload = 0.2; m_range = 3.33; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        end
    else
        m_metal = 0.66; m_energy = 0.66; m_health = 0.66; m_speed = 1; m_reload = 1.5; m_range = 0.8; m_energy_gen = 0.9; m_metal_gen = 0.9; m_conv_cap = 0.9; m_conv_eff = 0.9; m_wind = 0.825
    end

    if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * m_metal) end
    if ud.energycost then ud.energycost = math.floor(ud.energycost * m_energy) end
    if ud.health then ud.health = math.floor(ud.health * m_health) end
    if ud.speed and m_speed then ud.speed = math.floor(ud.speed * m_speed) end
    if ud.energymake then ud.energymake = ud.energymake * m_energy_gen end
    if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * m_metal_gen end
    if ud.windgenerator then ud.windgenerator = ud.windgenerator * m_wind end
    if ud.customparams then
        if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * m_conv_cap end
        if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * m_conv_eff end
    end

    if ud.weapondefs then
        for _, weapon_def in pairs(ud.weapondefs) do
            if m_reload then
                if weapon_def.reloadtime then weapon_def.reloadtime = weapon_def.reloadtime * m_reload end
                if weapon_def.burstrate then weapon_def.burstrate = weapon_def.burstrate * m_reload end
            end
            if m_range and weapon_def.range then
                weapon_def.range = math.floor(weapon_def.range * m_range)
            end
        end
    end
end

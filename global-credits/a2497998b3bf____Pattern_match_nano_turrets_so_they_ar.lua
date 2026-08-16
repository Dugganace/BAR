-- Pattern match nano turrets so they are never bypassed by building checks
    local isNano = nanoTC[un] or un:find("nanotc") ~= nil or (un:find("nano") ~= nil and not un:find("nanobetan"))
    local isBldg = (isNano or u.isbuilding or u.isBuilding or u.yardmap or u.yardMap or (spd ~= nil and spd == 0)) and not fly

    if isBldg and not procU[u] then
        procU[u] = true
        if airSight[un] then u.airsightdistance, u.airSightDistance = airSight[un], airSight[un] end
        
        -- Explicit Jammer Assignment
        if jamDist[un] then 
            local dist = jamDist[un]
            u.radardistancejam, u.radarDistanceJam = dist, dist
            u.sonardistancejam, u.sonarDistanceJam = dist, dist
        end

        if un == "cortl" or un == "armtl" or un == "coratl" or un == "armatl" then u.sonardistance, u.sonarDistance, u.stealth = 300, 300, true end

        if hp2k[un] then
            u.maxdamage, u.maxDamage, u.health = 2000, 2000, 2000
        elseif isNano then
            sH(u, 6) -- Applies 6.0x multiplier to original base HP
        elseif hp6k[un] then
            u.maxdamage, u.maxDamage, u.health = 6000, 6000, 6000
        elseif un == "armllt" or un == "corllt" then
            sH(u, 4)
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 250, 250, 250, 250
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 2000, 2000, 2000, 2000
        elseif un == "armbeamer" or un == "corhllt" then
            sH(u, 4)
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 350, 350, 350, 350
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 6000, 6000, 6000, 6000
        elseif un == "armhlt" or un == "corhlt" then
            u.maxdamage, u.maxDamage, u.health = 12000, 12000, 12000
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1050, 1050, 1050, 1050
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 10000, 10000, 10000, 10000
        elseif un == "armwin" or un == "corwin" then
            u.maxdamage, u.maxDamage, u.health = 2500, 2500, 2500
        elseif un == "armsolar" or un == "corsolar" or un == "armtide" or un == "cortide" then
            u.maxdamage, u.maxDamage, u.health = 3000, 3000, 3000
        elseif un == "corgate" or un == "armgate" then
            sH(u, 4)
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 3500, 3500, 3500, 3500
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 35000, 35000, 35000, 35000
            for _, k in ipairs({"shieldradius","shieldRadius"}) do if u[k] then u[k]=u[k]*1.3 end end
            local cp = u.customparams or u.customParams
            if cp and cp.shield_radius then local r = tonumber(cp.shield_radius); if r then cp.shield_radius = r * 1.3 end end
        elseif un == "corbhmth" then sH(u, 5); sC(u, 5)
        elseif un == "corfmd" or un == "armamd" then
            sH(u, 4)
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1500, 1500, 1500, 1500
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 38000, 38000, 38000, 38000
        elseif un == "corlab" or un == "armlab" then
            sH(u, 4)
            u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 300, 300, 300, 300
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 800, 800, 800, 800
            u.buildtime, u.buildTime = 3500, 3500
        elseif un == "armclaw" or un == "cormaw" then sH(u, 6); sC(u, 3)
        elseif un == "armguard" or un == "corpun" or un == "cortoast" or un == "armamb" then
            u.maxdamage, u.maxDamage, u.health = 25000, 25000, 25000; sC(u, 3)
        elseif un == "armvp" or un == "corvp" or un == "armfhp" or un == "corfhp" or un == "armhp" or un == "corhp" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1000, 1000, 1000, 1000
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 2000, 2000, 2000, 2000
            u.energystorage, u.energyStorage = 6000, 6000
        elseif un == "armap" or un == "corap" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1000, 1000, 1000, 1000
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 1800, 1800, 1800, 1800
            u.energystorage, u.energyStorage = 6000, 6000
        elseif un == "armamsub" or un == "coramsub" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1500, 1500, 1500, 1500
            u.energystorage, u.energyStorage = 6000, 6000
        elseif un == "armalab" or un == "coralab" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 1900, 1900, 1900, 1900
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 12000, 12000, 12000, 12000
            u.energystorage, u.energyStorage = 25000, 25000
        elseif un == "armavp" or un == "coravp" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 2900, 2900, 2900, 2900
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 18000, 18000, 18000, 18000
            u.energystorage, u.energyStorage = 50000, 50000
        elseif un == "armaap" or un == "coraap" then
            sH(u, 4); u.buildcostmetal, u.buildCostMetal, u.metalcost, u.metalCost = 2800, 2800, 2800, 2800
            u.buildcostenergy, u.buildCostEnergy, u.energycost, u.energyCost = 35000, 35000, 35000, 35000
            u.energystorage, u.energyStorage = 50000, 50000
        elseif un == "armshltx" or un == "corgant" or un == "armshltxuw" or un == "corgantuw" then
            sH(u, 4); u.energystorage, u.energyStorage = 50000, 50000
        else
            local grp = string.lower(u.unitgroup or u.unitGroup or u.category or (u.customparams and u.customparams.unitgroup) or "")
            local fn = string.lower(u.filename or u.filepath or u._filename or u.unitfilename or "")
            local isEcon = grp:find("energy") or grp:find("metal") or fn:find("landeconomy") or fn:find("seaeconomy")
            sH(u, isEcon and 5 or 4)
            local wd = u.weapondefs or u.weaponDefs or u.weapons
            if not isEcon and wd and type(wd) == "table" and next(wd) ~= nil then sC(u, 3) end
        end

        sS(u, 0.5)

        local wd = u.weapondefs or u.weaponDefs or u.weapons or {}
        for _, w in pairs(wd) do processW(w, un) end

        if afus[un] then
            u.explodeas, u.explodeAs = fusExp, fusExp
            u.selfdestructas, u.selfDestructAs, u.selfdexplodeas = fusExp, fusExp, fusExp
        end
    end
end-- tweakdefs5.lua: SHIPS & NAVAL OVERRIDES

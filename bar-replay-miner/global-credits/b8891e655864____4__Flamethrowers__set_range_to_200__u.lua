-- 4. Flamethrowers: set range to 200 (unless overridden by specific unit settings like corfship)
    if not (uName == "armlship" or uName == "corfship") then
        local isFlame = string.find(wt, "flame") or string.find(wName, "flame") or string.find(wName, "pyro") or string.find(wName, "fire")
        if isFlame then
            w.range = 200
        end
    end

    -- 5. Plasma Weapons: Reload 3x
    local isPlasma = (wt == "cannon" or wt == "emgcannon" or string.find(wName, "plasma") or string.find(wName, "cannon")) 
                     and not (string.find(wt, "laser") or string.find(wName, "laser"))

    if isPlasma then
        for _, k in ipairs({"reloadtime", "reloadTime"}) do
            if w[k] then w[k] = w[k] * 3 end
        end
    end

    -- 6. Light Laser Weapons: Damage 0.2x
    local isLaser = (wt == "lasercannon" or wt == "beamlaser" or string.find(wt, "laser") or string.find(wName, "laser"))
    local isLightLaser = isLaser and (
        string.find(wName, "light") or 
        string.find(wName, "llt") or 
        string.find(wName, "clt") or 
        not (string.find(wName, "heavy") or string.find(wName, "hlt") or string.find(wName, "annihilator") or string.find(wName, "doomsday") or string.find(wName, "tachyon"))
    )

    if isLightLaser and w.damage then
        for k, v in pairs(w.damage) do
            w.damage[k] = v * 0.2
        end
    end

    -- 7. Specific Submarine Weapon Overrides (Reload & Damage)
    if uName == "armsub" or uName == "corsub" then
        for _, k in ipairs({"reloadtime", "reloadTime"}) do w[k] = 6 end
        if w.damage then
            for k in pairs(w.damage) do w.damage[k] = 1000 end
        end
    elseif uName == "armsubk" or uName == "corshark" then
        for _, k in ipairs({"reloadtime", "reloadTime"}) do w[k] = 6 end
        if w.damage then
            for k in pairs(w.damage) do w.damage[k] = 1500 end
        end
    elseif uName == "armserp" or uName == "corssub" then
        for _, k in ipairs({"reloadtime", "reloadTime"}) do w[k] = 30 end
        if w.damage then
            for k in pairs(w.damage) do w.damage[k] = 3500 end
        end
    end
end

for name, u in pairs(UnitDefs) do
    local uName = string.lower(name)

    if isShip(u) and not u._tweak5Processed then
        u._tweak5Processed = true

        -- 1. Jammer & Sonar Distance Overrides
        if uName == "corsjam" or uName == "armsjam" then
            u.radardistancejam = 450
            u.radarDistanceJam = 450
            u.sonardistancejam = 450
            u.sonarDistanceJam = 450
        end

        if uName == "armserp" or uName == "corssub" or uName == "corpt" or uName == "armpt" then
            u.sonardistance = 450
            u.sonarDistance = 450
        elseif uName == "armroy" or uName == "corroy" or uName == "armcrus" or uName == "corcrus" then
            u.sonardistance = 300
            u.sonarDistance = 300
        end

        -- 2. Health & Cost Scaling
        if flagships[uName] then
            -- Flagship Exception: 5x HP, Fixed 75,000 Metal & 500,000 Energy
            sH(u, 5)
            u.metalcost = 75000
            u.metalCost = 75000
            u.energycost = 500000
            u.energyCost = 500000
        elseif uName == "corroy" or uName == "armroy" then
            -- Destroyer Exception: Fixed 26,000 HP, 5x Cost
            u.maxdamage = 26000
            u.maxDamage = 26000
            u.health    = 26000
            sC(u, 5)
        elseif uName == "armlship" or uName == "corfship" then
            -- Light / Flame Ship Exception: 5x HP, Fixed 350 Metal & 7,000 Energy
            sH(u, 5)
            u.metalcost = 350
            u.metalCost = 350
            u.energycost = 7000
            u.energyCost = 7000
        elseif isBuilderUnit(u) then
            -- Construction Ships: 2x HP, 1x Cost
            sH(u, 2)
        else
            -- Standard Combat Ships: 5x HP, 5x Cost
            sH(u, 5)
            sC(u, 5)
        end

        -- 3. Weapon Modifications
        local wd = u.weapondefs or u.weaponDefs or u.weapons or {}
        for _, w in pairs(wd) do
            processShipWeapon(w, uName)
        end
    end
end-- tweakdefs6.lua: SPECIFIC UNIT & EXPERIMENTAL OVERRIDES

--
    -- 2. global WeaponDefs by string key
    ------------------------------------------------

    if WeaponDefs then
        if WeaponDefs[weaponName] then
            return WeaponDefs[weaponName]
        end

        if WeaponDefs[lower] then
            return WeaponDefs[lower]
        end
    end

    ------------------------------------------------
    -- 3. WeaponDefNames if available
    ------------------------------------------------

    if WeaponDefNames then
        if WeaponDefNames[weaponName] then
            return WeaponDefNames[weaponName]
        end

        if WeaponDefNames[lower] then
            return WeaponDefNames[lower]
        end
    end

    ------------------------------------------------
    -- 4. final fallback: scan WeaponDefs table
    ------------------------------------------------

    if WeaponDefs then
        for key,wd in pairs(WeaponDefs) do
            if lowerName(key)==lower or weaponDefNameMatches(wd,lower) then
                return wd
            end
        end
    end

    return nil
end

local function getDamageMultForUnit(ud,hp)
    if hp>=HEAVY_HP_THRESHOLD then
        return HEAVY_DAMAGE_MULT
    elseif isDefenseBuilding(ud) then
        return DEFENSE_DAMAGE_MULT
    end

    return NORMAL_DAMAGE_MULT
end

local function scaleWeaponDamage(wd,mult)
    if not wd or not wd.damage then return end
    if mult==1 then return end

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*mult
        else
            local num=tonumber(dmg)
            if num then
                wd.damage[armorType]=num*mult
            end
        end
    end
end

local function setDefenseCommanderDamage(wd,mult)
    if not wd then return end

    wd.damage=wd.damage or {}

    local base=tonumber(wd.damage.default) or 1

    wd.damage.commander=base*mult
    wd.damage.commanders=base*mult
end

local function localizeAndScaleUnitWeapons(unitName,unitDef,damageMult,isDefense)
    if not unitDef then return end
    if not unitDef.weapons then return end

    unitDef.weapondefs=unitDef.weapondefs or {}

    for index,w in pairs(unitDef.weapons) do
        local weaponName=getWeaponName(w)
        local sourceWd=getWeaponDefSource(unitDef,weaponName)

        if sourceWd then
            local privateName="t3com_"..safeName(unitName).."_weapon_"..tostring(index)
            local privateWd=copyTable(sourceWd)

            scaleWeaponDamage(privateWd,damageMult)

            if isDefense then
                setDefenseCommanderDamage(privateWd,DEFENSE_VS_COMMANDER_MULT)
            end

            privateWd.t3com_localized_weapon=true

            ------------------------------------------------
            -- Local weapondef for the unit.
            ------------------------------------------------

            unitDef.weapondefs[privateName]=privateWd

            ------------------------------------------------
            -- Also register by private name globally as fallback.
            -- This does NOT dirty original shared weapondefs.
            ------------------------------------------------

            if WeaponDefs then
                WeaponDefs[privateName]=copyTable(privateWd)
            end

            if WeaponDefNames then
                WeaponDefNames[privateName]=copyTable(privateWd)
            end

            w.def=privateName
            w.weapondef=privateName
            w.weaponDef=privateName
            w.name=privateName
        end
    end
end

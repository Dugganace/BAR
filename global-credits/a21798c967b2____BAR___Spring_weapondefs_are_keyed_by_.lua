-- BAR / Spring weapondefs are keyed by weapondef.
    -- def/name are only fallbacks.
    return w.weapondef or w.def or w.name
end

local function getWeaponDefByName(name)
    if not name then return nil end

    local lowerName=string.lower(name)

    return WeaponDefs[name] or WeaponDefs[lowerName]
end

local function getLocalWeaponDef(unitDef,weaponName)
    if not unitDef or not unitDef.weapondefs or not weaponName then return nil end

    local lowerName=string.lower(weaponName)

    return unitDef.weapondefs[weaponName] or unitDef.weapondefs[lowerName]
end

local function getDamageMultForUnit(ud,hp)
    if hp>=HEAVY_HP_THRESHOLD then
        return HEAVY_DAMAGE_MULT
    elseif isDefenseBuilding(ud) then
        return DEFENSE_DAMAGE_MULT
    end

    return NORMAL_DAMAGE_MULT
end

local function scaleDamageTableDirect(wd,mult)
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

local function setDefenseCommanderDamageDirect(wd,mult)
    if not wd then return end

    wd.damage=wd.damage or {}

    local base=tonumber(wd.damage.default) or 1

    wd.damage.commander=base*mult
    wd.damage.commanders=base*mult
end

-- knockback by crossgamer
if WeaponDefs then
    for name, wDef in pairs(WeaponDefs) do
        if type(wDef) == "table" and wDef.weapontype ~= "Shield" then
            local dmg = 0
            if wDef.damage and wDef.damage.default then
                dmg = wDef.damage.default
            end

            local reload = wDef.reloadtime or 1
            local burst = wDef.burst or 1
            local projectiles = wDef.projectiles or 1

            local dps = (dmg * burst * projectiles) / reload

            local damageMult = 100 / (100 + dps)
            
            if wDef.damage then
                for k, v in pairs(wDef.damage) do
                    wDef.damage[k] = math.max(0.1, v * damageMult)
                end
            end

            wDef.impulsefactor = (wDef.impulsefactor or 0) * 100 + 50
            wDef.impulseboost = (wDef.impulseboost or 0) * 100 + 50
            wDef.cratermult = (wDef.cratermult or 0) + 2
        end
    end
end

if UnitDefs then
    for name, uDef in pairs(UnitDefs) do
        if type(uDef) == "table" then
            if not uDef.canfly then
                uDef.mass = 1
                uDef.mygravity = 0.5
                if not uDef.customparams then uDef.customparams = {} end
                uDef.customparams.fall_damage_multiplier = "0"
            end
        end
    end
end
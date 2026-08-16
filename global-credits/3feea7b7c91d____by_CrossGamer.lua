-- by CrossGamer 

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
end-- Epic Construction Turret

local UnitDefs = UnitDefs or {}

local function mergeTable(source, target, overrides)
    if UnitDefs[source] and not UnitDefs[target] then
        UnitDefs[target] = table.merge(UnitDefs[source], overrides)
    end
    return UnitDefs[target]
end

local function addToBuildOptions(builder, unitName)
    if UnitDefs[builder] and UnitDefs[builder].buildoptions then
        if not table.contains(UnitDefs[builder].buildoptions, unitName) then
            table.insert(UnitDefs[builder].buildoptions, unitName)
        end
    end
end

for _, prefix in ipairs({"arm", "cor", "leg"}) do
    mergeTable(
        prefix .. "nanotct2",
        prefix .. "nanotct3",
        {
            name = "Epic Construction Turret",
            description = "Even more build power!",
            icontype = "armrespawn",
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
            reclaimspeed = 2000,
            canrepeat = true,
            objectname = (prefix == "leg") and "Units/legnanotcbase.s3o" or 
                         (prefix == "cor") and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o"
        }
    )

    for _, tier in ipairs({prefix .. "nanotc", prefix .. "nanotct2"}) do
        if UnitDefs[tier] then
            UnitDefs[tier].canrepeat = true
        end
    end

    for _, builder in ipairs({prefix .. "ack", prefix .. "aca", prefix .. "acv"}) 
-- Factory build speed by tech level
        -- T1 factories pump units fast on their own
        -- T2/T3 factories need nano turret assistance
        if uDef.buildoptions and #uDef.buildoptions > 0
           and (not uDef.canmove or (uDef.speed and uDef.speed == 0)) then
            local factoryTL = getTechLevel(uDef) or 1
            if uDef.workertime then
                if factoryTL <= 1 then
                    -- T1 factories: 80% faster build speed
                    uDef.workertime = math.floor(uDef.workertime * 1.8)
                elseif factoryTL == 2 then
                    -- T2 factories: 20% faster, still want nano help
                    uDef.workertime = math.floor(uDef.workertime * 1.2)
                else
                    -- T3 factories: 10% faster, really need nanos
                    uDef.workertime = math.floor(uDef.workertime * 1.1)
                end
            end
            goto continue
        end

        -- Only modify mobile player units
        if not uDef.canmove or (uDef.speed and uDef.speed == 0) then
            goto continue
        end

        -- Flying builders: remove self-destruct explosion (QoL)
        if uDef.canfly and uDef.workertime and uDef.workertime > 0 then
            if uDef.weapondefs then
                for wname, wDef in pairs(uDef.weapondefs) do
                    if wname:match("selfd") or wname:match("self_d") then
                        if wDef.damage then
                            for dtype, _ in pairs(wDef.damage) do
                                wDef.damage[dtype] = 0
                            end
                        end
                    end
                end
            end
        end

        -- Apply tier-based scaling to mobile combat units
        local tl = getTechLevel(uDef)
        if tl and TIER_COST[tl] then
            if uDef.metalcost then
                uDef.metalcost = math.floor(uDef.metalcost * TIER_COST[tl])
            end
            if uDef.energycost then
                uDef.energycost = math.floor(uDef.energycost * TIER_COST[tl])
            end
            if uDef.health then
                uDef.health = math.floor(uDef.health * (TIER_HP[tl] or 1.0))
            end
        end

        ::continue::
    end

    -- Commander corpses: indestructible (so players don't lose reclaim incentive)
    for name, fDef in pairs(FeatureDefs or {}) do
        if name:match("armcom") or name:match("corcom") or name:match("legcom") then
            fDef.damage = 9999999
            fDef.reclaimable = 0
        end
    end
end
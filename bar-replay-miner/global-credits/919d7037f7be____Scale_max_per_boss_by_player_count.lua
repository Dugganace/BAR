-- Scale max-per-boss by player count
        local maxBossCount = math.max(math.floor(1 + playerCount / 4), 1)

        ---------------------------------------------------------------
        -- Mini-boss tier 1: Matron (~10 min, anger ~300)
        -- Signals need for T2 player tech
        ---------------------------------------------------------------
        local matron = cloneUnit(matriarchBase, "raptor_miniboss_matron", {
            health = math.floor(baseHP * 3.0 * totalSpawnScale),
            metalcost = 2000,
            energycost = 20000,
            speed = baseSpeed * 0.9,
            maxthisunit = maxBossCount,
        })
        if matron then
            matron.customparams = matron.customparams or {}
            matron.customparams.subfolder = "other/raptors"
            pveSquad(matron.customparams, "raptor_miniboss_matron", 250, 450, "BERSERKER", 1, 5, "basic")
            -- Straightforward damage boost
            if matron.weapondefs then
                for _, wDef in pairs(matron.weapondefs) do
                    if wDef.damage then
                        for dtype, dval in pairs(wDef.damage) do
                            wDef.damage[dtype] = math.floor(dval * 2.0)
                        end
                    end
                end
            end
        end

        ---------------------------------------------------------------
        -- Mini-boss tier 2: Queenling (~20 min, anger ~500)
        -- Signals need for T3 player tech
        ---------------------------------------------------------------
        local queenling = cloneUnit(matriarchBase, "raptor_miniboss_queenling", {
            health = math.floor(baseHP * 5.0 * totalSpawnScale),
            metalcost = 4000,
            energycost = 40000,
            speed = baseSpeed * 0.8,
            maxthisunit = maxBossCount,
        })
        if queenling then
            queenling.customparams = queenling.customparams or {}
            queenling.customparams.subfolder = "other/raptors"
            pveSquad(queenling.customparams, "raptor_miniboss_queenling", 400, 650, "BERSERKER", 1, 5, "basic")
            -- Acid weapon: area damage boost
            if queenling.weapondefs then
                for _, wDef in pairs(queenling.weapondefs) do
                    if wDef.damage then
                        for dtype, dval in pairs(wDef.damage) do
                            wDef.damage[dtype] = math.floor(dval * 3.0)
                        end
                    end
                    wDef.areaofeffect = (wDef.areaofeffect or 0) + 64
                end
            end
        end

        ---------------------------------------------------------------
        -- Mini-boss tier 3: Elite (~25 min, anger ~700)
        -- T3 army test before queen appears
        ---------------------------------------------------------------
        local elite = cloneUnit(matriarchBase, "raptor_miniboss_elite", {
            health = math.floor(baseHP * 7.0 * totalSpawnScale),
            metalcost = 6000,
            energycost = 60000,
            speed = baseSpeed * 0.7,
            maxthisunit = maxBossCount,
        })
        if elite then
            elite.customparams = elite.customparams or {}
            elite.customparams.subfolder = "other/raptors"
            pveSquad(elite.customparams, "raptor_miniboss_elite", 600, 850, "BERSERKER", 1, 5, "basic")
            -- EMP weapon: stun + heavy damage
            if elite.weapondefs then
                for _, wDef in pairs(elite.weapondefs) do
                    if wDef.damage then
                        for dtype, dval in pairs(wDef.damage) do
                            wDef.damage[dtype] = math.floor(dval * 4.0)
                        end
                    end
                    wDef.paralyzer = true
                    wDef.paralyzetime = 3
                end
            end
            -- Death explosion
            elite.explodeas = "raptor_empdeath_big"
            elite.selfdestructas = "raptor_empdeath_big"
        end
    end

    -- Proper UnitDef_Post chaining for post-processing
    local oldUnitDef_Post = UnitDef_Post
    function UnitDef_Post(unitID, unitDef)
        if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then
            oldUnitDef_Post(unitID, unitDef)
        end
        -- Ensure all mini-bosses have raptor subfolder
        if unitID and type(unitID) == "string" and unitID:match("raptor_miniboss_") then
            unitDef.customparams = unitDef.customparams or {}
            unitDef.customparams.subfolder = "other/raptors"
        end
    end
end
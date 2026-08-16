-- Group factories by tech level and type (subfolder)
    -- Factories share a subfolder like "Arm/Factories" and a techlevel
    local labGroups = {}  -- key = "techlevel:type" -> list of factory names

    for name, uDef in pairs(unitDefs) do
        -- Only process factories: must have buildoptions and be immobile
        if uDef.buildoptions and #uDef.buildoptions > 0
           and (not uDef.canmove or uDef.speed == 0 or uDef.speed == nil) then

            -- Skip raptor structures
            if uDef.customparams and uDef.customparams.subfolder == "other/raptors" then
                goto continue
            end

            -- Detect if this is a factory via subfolder containing common factory keywords
            local subfolder = uDef.customparams and uDef.customparams.subfolder or ""
            local isFactory = subfolder:lower():match("fact")
                           or subfolder:lower():match("lab")
                           or subfolder:lower():match("plant")
                           or subfolder:lower():match("yard")
                           or subfolder:lower():match("platform")

            if isFactory then
                local tl = (uDef.customparams and uDef.customparams.techlevel) or "1"
                -- Determine factory type from subfolder (strip faction prefix)
                -- e.g. "Armada/Factories/BotLab" -> "BotLab"
                local factoryType = subfolder:match("[^/]+$") or "unknown"
                local groupKey = tl .. ":" .. factoryType:lower()

                if not labGroups[groupKey] then
                    labGroups[groupKey] = {}
                end
                table.insert(labGroups[groupKey], name)
            end

            ::continue::
        end
    end

    -- Merge buildoptions within each factory group
    local function mergeLabs(labs)
        local merged = {}
        local order = {}

        for _, labName in ipairs(labs) do
            local uDef = unitDefs[labName]
            if uDef and uDef.buildoptions then
                for _, bo in ipairs(uDef.buildoptions) do
                    if not merged[bo] then
                        merged[bo] = true
                        table.insert(order, bo)
                    end
                end
            end
        end

        if #order > 0 then
            for _, labName in ipairs(labs) do
                local uDef = unitDefs[labName]
                if uDef then
                    uDef.buildoptions = {}
                    for i, bo in ipairs(order) do
                        uDef.buildoptions[i] = bo
                    end
                end
            end
        end
    end

    -- Only merge groups with 2+ factories (cross-faction)
    for groupKey, labs in pairs(labGroups) do
        if #labs >= 2 then
            mergeLabs(labs)
        end
    end
end
-- Epic Construction Turret

local UnitDefs = UnitDefs or {}

local function createUnitDefFromSource(sourceName, overrides)
    local source = UnitDefs[sourceName]
    if not source then return nil end

    local newDef = {}

    for k, v in pairs(source) do
        newDef[k] = v
    end

    newDef.customparams = {}
    if source.customparams then
        for k, v in pairs(source.customparams) do
            newDef.customparams[k] = v
        end
    end

    for k, v in pairs(overrides) do
        if k == "customparams" then
            for ck, cv in pairs(v) do
                newDef.customparams[ck] = cv
            end
        else
            newDef[k] = v
        end
    end

    return newDef
end

local function addToBuildOptions(builderName, unitToAdd)
    local builder = UnitDefs[builderName]
    if builder and builder.buildoptions then
        local exists = false
        for _, existingUnit in ipairs(builder.buildoptions) do
            if existingUnit == unitToAdd then
                exists = true
                break
            end
        end
        if not exists then
            table.insert(builder.buildoptions, unitToAdd)
        end
    end
end

local function addBuildOptionToMultipleBuilders(unitToAdd, ...)
    local builderList = {...}
    for _, builderName in ipairs(builderList) do
        addToBuildOptions(builderName, unitToAdd)
    end
end

for _, prefix in ipairs({"arm", "cor", "leg"}) do
    local sourceName = prefix .. "nanotct2"
    local targetName = prefix .. "nanotct3"

    if UnitDefs[sourceName] and not UnitDefs[targetName] then
        UnitDefs[targetName] = createUnitDefFromSource(
            sourceName,
            {
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
                             (prefix == "cor") and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",
                customparams = {
                    i18n_en_humanname = "Epic Construction Turret",
                    i18n_en_tooltip = "Even more build power!"
                }
            }
        )
    end
end

addBuildOptionToMultipleBuilders("armnanotct3", "armack", "armaca", "armacv")
addBuildOptionToMultipleBuilders("cornanotct3", "corack", "coraca", "coracv")
addBuildOptionToMultipleBuilders("legnanotct3", "legack", "legaca", "legacv")--Cross Faction Tax 70%
-- Authors: TetrisCo
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,c,d,e,f,g=UnitDefs or{},1.7,{},{},Json.decode(VFS.LoadFile('language/en/units.json')),'_taxed',' (Taxed)'for h,i in pairs(a)do if i.customparams and i.customparams.subfolder and(i.customparams.subfolder:match'Fact'or i.customparams.subfolder:match'Lab')and i.customparams.techlevel==2 then local j=e and e.units.names[h]or h;c[h]=1;d[h..f]=table.merge(i,{energycost=i.energycost*b,icontype=h,metalcost=i.metalcost*b,name=j..g,customparams={i18n_en_humanname=j..g,i18n_en_tooltip=e and e.units.descriptions[h]or h}})end end;for k,l in pairs(a)do if l.buildoptions then for m,n in pairs(l.buildoptions)do if c[n]then for m,o in pairs{'arm','cor','leg'}do local p=o..n:sub(4)..f;if n:sub(1,3)~=o and d[p]then a[k].buildoptions[#a[k].buildoptions+1]=p end end end end end end;table.mergeInPlace(a,d)
-- T3 Com Mod v1.2 by Bezz-- T3 Com Cons

local commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

local function roundValue(value)
    if type(value)~="number" then return value end

    return math.floor(value+0.5)
end

local boostedConstructors={}

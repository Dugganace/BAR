-- T3 Commanders by Bezz-- T3 Commanders Mod v1.1-- T3 Com Cons

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

--Randomizer by Ambo v0.4
function get_rnd_number(from_val, to_val, split_chance)
    from_val = from_val or 0.5
    to_val = to_val or 2.0
    split_chance = split_chance or 0.5

    local num

    if math.random() < split_chance then
        local range_min = math.min(from_val, 1)
        local range_max = math.max(from_val, 1)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
    else
        local range_min = math.min(1, to_val)
        local range_max = math.max(1, to_val)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
    end
    return num
end

function rndmz(value,from_val, to_val, split_chance)
    if type(value) == "number" then
        return value * get_rnd_number(from_val, to_val, split_chance)
    end
    return value 
end
 
for name, ud in pairs(UnitDefs) do
    ud.speed = rndmz(ud.speed, 0.5,3, 0.33)
    ud.maxacc = rndmz(ud.maxacc, 0.4,3, 0.33)
    ud.maxdec = rndmz(ud.maxdec, 0.4,3, 0.33)
    ud.maxslope = rndmz(ud.maxslope, 0.4,3, 0.33)
    ud.turnrate = rndmz(ud.turnrate, 0.4,3, 0.33)
    ud.verticalspeed = rndmz(ud.verticalspeed, 0.4,3, 0.33)
    ud.buildtime = rndmz(ud.buildtime, 0.3,1.3, 0.66)
    ud.sightdistance = rndmz(ud.sightdistance, 0.3,1.5, 0.33)
    ud.health = rndmz(ud.health, 0.6,4, 0.33)
    ud.idleautoheal = rndmz(ud.idleautoheal, 0.6,10, 0.33)

    -- rounding to integer. thanks to BARtian
    ud.metalcost = (ud.metalcost and math.floor(rndmz(ud.metalcost, 0.3,1.5, 0.66) + 0.5) or ud.metalcost)
    ud.energycost = (ud.energycost and math.floor(rndmz(ud.energycost, 0.3,1.5, 0.66) + 0.5) or ud.energycost)
    
 
    if ud.weapondefs then
        for weapon_name, weapon_def in pairs(ud.weapondefs) do
            weapon_def.areaofeffect = rndmz(weapon_def.areaofeffect)
            weapon_def.beamtime = rndmz(weapon_def.beamtime)
            weapon_def.energypershot = rndmz(weapon_def.energypershot)
            weapon_def.reloadtime = rndmz(weapon_def.reloadtime, 0.3,1.3, 0.66)
            weapon_def.thickness = rndmz(weapon_def.thickness)
            weapon_def.weaponvelocity = rndmz(weapon_def.weaponvelocity)
            weapon_def.craterareaofeffect = rndmz(weapon_def.craterareaofeffect)
            weapon_def.craterboost = rndmz(weapon_def.craterboost)
            weapon_def.cratermult = rndmz(weapon_def.cratermult)
            weapon_def.edgeeffectiveness = rndmz(weapon_def.edgeeffectiveness)
            weapon_def.laserflaresize = rndmz(weapon_def.laserflaresize)
            weapon_def.range = rndmz(weapon_def.range,0.4,2.5, 0.33)
            weapon_def.burst = rndmz(weapon_def.burst)
            weapon_def.burstrate = rndmz(weapon_def.burstrate)
            weapon_def.flighttime = rndmz(weapon_def.flighttime)
            weapon_def.impulsefactor = rndmz(weapon_def.impulsefactor)
            weapon_def.startvelocity = rndmz(weapon_def.startvelocity,0.4,2.5, 0.33)
            weapon_def.weaponaccel
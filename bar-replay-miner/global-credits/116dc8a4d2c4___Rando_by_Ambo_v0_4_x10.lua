--Rando by Ambo v0.4 x10
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
    ud.speed = rndmz(ud.speed, 0.5,30, 0.33)
    ud.maxacc = rndmz(ud.maxacc, 0.4,3, 0.33)
    ud.maxdec = rndmz(ud.maxdec, 0.4,3, 0.33)
    ud.maxslope = rndmz(ud.maxslope, 0.4,3, 0.33)
    ud.turnrate = rndmz(ud.turnrate, 0.4,3, 0.33)
    ud.verticalspeed = rndmz(ud.verticalspeed, 0.4,3, 0.33)
    ud.buildtime = rndmz(ud.buildtime, 0.3,1.3, 0.66)
    ud.sightdistance = rndmz(ud.sightdistance, 0.3,1.5, 0.33)
    ud.health = rndmz(ud.health, 0.6,4, 0.33)
    ud.idleautoheal = rndmz(ud.idleautoheal, 0.6,10, 0.33)
    if ud.autoheal == 50 then
        ud.autoheal = rndmz(ud.autoheal, 100,1000, 0.33)
        ud.health = rndmz(ud.health, 10,100, 0.33)
        ud.sightdistance = rndmz(ud.sightdistance, 10,100, 0.33)
    end

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
            
            if ud.autoheal == 50 then
                weapon_def.range = rndmz(weapon_def.range,10,50, 0.33)
            end
            weapon_def.burst = rndmz(weapon_def.burst)
            weapon_def.burstrate = rndmz(weapon_def.burstrate)
            weapon_def.flighttime = rndmz(weapon_def.flighttime)
            weapon_def.impulsefactor = rndmz(weapon_def.impulsefactor)
            weapon_def.startvelocity = rndmz(weapon_def.startvelocity,0.4,2.5, 0.33)
            weapon_def.weaponacceleration = rndmz(weapon_def.weaponacceleration,0.4,2.5, 0.33)
            weapon_def.weapontimer = rndmz(weapon_def.weapontimer)
 
            if weapon_def.damage then
                weapon_def.damage.default = rndmz(weapon_def.damage.default,0.4,22, 0.5)
                weapon_def.damage.vtol = rndmz(weapon_def.damage.vtol,0.4,22, 0.5)
            end
        end
    end
end--T3 Eco Express (Zop)
local uDefs = UnitDefs or {}
local cps = 'customparams'
local fds = 'featuredefs'

local tweakT3Afus = true
local tweakT3Conv = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function rmvBO(builderID, id)
	local bDef = UnitDefs[builderID]
	local uDef = UnitDefs[id]
	if bDef and uDef then
		for k, v in pairs(bDef.buildoptions) do
			if v == id then
				table.remove(bDef.buildoptions, k)
				break
			end
		end
	end
end

local function mergeMap(l, r)
	for k, v in pairs(r) do
		l[k] = v
	end
end

local function mergeMapRec(l, r)
	for k, v in pairs(r) do
		if type(v) == 'table' then
			local lk = l[k] or {}
			mergeMapRec(lk, v);
			l[k] = lk
		else
			l[k] = v
		end
	end
end

local function remodel(def, name, hasDead, hasDecal)
	if def then
		def.buildpic = name..'.DDS'
		def.objectname = 'Units/'..name..'.s3o'
		def.script = 'Units/'..name..'.cob'
		if hasDead then
			def[fds].dead.object = 'Units/'..string.lower(name)..'_dead.s3o'
		end
		if hasDecal then
			def[cps].buildinggrounddecaltype = 'decals/'..string.lower(name)..'_aoplane.dds'
		end
	end
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

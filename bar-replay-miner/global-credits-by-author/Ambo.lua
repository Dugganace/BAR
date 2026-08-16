-- Ambo -- content pulled from public BAR replays (bar-replay-miner global scan, 2026-08-15)
-- 30 distinct snippet(s), 210 total occurrences across scanned games

-- === "--Randomizer by Ambo v0.4" (seen 11x) ===
---Randomizer by Ambo v0.4 w Bartian rounding and OPman and Robert fix

local function get_rnd_number(from_val, to_val, split_chance)
    from_val = from_val or 0.6
    to_val =  to_val or 1.5
    split_chance = split_chance or  0.5
	--- Spring.Echo(from_val, "<- from_val - to_val ->", to_val , split_chance) ---

    local num

    if math.random() < split_chance then
        local range_min = math.min(from_val, 1)
        local range_max = math.max(from_val, 1)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
	---	Spring.Echo(" within < range min: ", range_min) ---
	---	Spring.Echo(" within < range max: ", range_max) ---
		Spring.Echo(" within < num: ", num) 
		
    else
        local range_min = math.min(1, to_val)
        local range_max = math.max(1, to_val)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
	---	Spring.Echo(" within > range min: ", range_min) ---
	---	Spring.Echo(" within > range max: ", range_max) ---
		Spring.Echo(" within > num: ", num)
    end
    return num
end

local function rndmz(value,from_val, to_val, split_chance)
    if type(value) == "number" then
        return value * get_rnd_number(from_val, to_val, split_chance)
    end
    return value
end

for name, ud in pairs(UnitDefs) do
	--- Spring.Echo("Processing:", name) ---
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


		if ud.canfly == true and type(ud.speed) == "number" and ud.speed > 450 then
			ud.speed = 450
		end

    if ud.weapondefs then
	  local tempcount = 0
	  local fixnum1
      local fixnum2
	  local fixnum3
	  local fixnum4
	  local fixnum5
	  local fixnum6
	  local fixnum7
	  local fixnum8

        for weapon_name, weapon_def in pairs(ud.weapondefs) do
		
            weapon_def.areaofeffect = rndmz(weapon_def.areaofeffect)
            weapon_def.beamtime = rndmz(weapon_def.beamtime)
            weapon_def.energypershot = rndmz(weapon_def.energypershot)
            weapon_def.reloadtime = rndmz(weapon_def.reloadtime, 0.3,1.3, 0.66)
            weapon_def.thickness = rndmz(weapon_def.thickness)
            weapon_def.stockpiletime = rndmz(weapon_def.stockpiletime,0.8,1.2,0.5) 
            weapon_def.craterareaofeffect = rndmz(weapon_de

-- === "--Random Rarities by Ambo V0.7.1" (seen 14x) ===
--Random Rarities by Ambo V0.7.1

-- === "--Random Rarities by Ambo Tuned v0.9" (seen 21x) ===
--Random Rarities by Ambo Tuned v0.9

-- === "--Bigger Tier Steps by Ambo V0.5" (seen 1x) ===
--Bigger Tier Steps by Ambo V0.5 - post-version


local oldUnitDef_Post = UnitDef_Post  
function UnitDef_Post(name, ud)
    if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then  
        oldUnitDef_Post(name, ud)  
    end  
    local m_metal, m_energy, m_health, m_speed, m_reload, m_range, m_energy_gen, m_metal_gen, m_conv_cap, m_conv_eff, m_wind
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 2; m_energy = 2; m_health = 2; m_reload = 0.4; m_range = 1.5; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.5; m_conv_eff = 1.5; m_wind = 1.4
        else
            m_metal = 4; m_energy = 4; m_health = 4; m_speed = 0.77; m_reload = 0.4; m_range = 1.88; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.8; m_conv_eff = 1.5; m_wind = 1.4
        end
    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 5; m_energy = 5; m_health = 5; m_speed = 0.44; m_reload = 0.2; m_range = 2.4; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        else
            m_metal = 10; m_energy = 10; m_health = 10; m_speed = 0.44; m_reload = 0.2; m_range = 3.33; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        end
    else
        m_metal = 0.66; m_energy = 0.66; m_health = 0.66; m_speed = 1; m_reload = 1.5; m_range = 0.8; m_energy_gen = 0.9; m_metal_gen = 0.9; m_conv_cap = 0.9; m_conv_eff = 0.9; m_wind = 0.825
    end

    if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * m_metal) end
    if ud.energycost then ud.energycost = math.floor(ud.energycost * m_energy) end
    if ud.health then ud.health = math.floor(ud.health * m_health) end
    if ud.speed and m_speed then ud.speed = math.floor(ud.speed * m_speed) end
    if ud.energymake then ud.energymake = ud.energymake * m_energy_gen end
    if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * m_metal_gen end
    if ud.windgenerator then ud.windgenerator = ud.windgenerator * m_wind end
    if ud.customparams then
        if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * m_conv_cap end
        if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * m_conv_eff end
    end

    if ud.weapondefs then
        for _, weapon_def in pairs(ud.weapondefs) do
            if m_reload then
                if weapon_def.reloadtime then weapon_def.reloadtime = weapon_def.reloadtime * m_reload end
                if weapon_def.burstrate then weapon_def.burstrate = weapon_def.burstrate * m_reload end
            end
            if m_range and weapon_def.range then
                weapon_def.range = math.floor(weapon_def.range * m_range)
            end
        end
    end
end

Spring.Echo("tweakdefs_rename_block_count:" .. "2")

-- === "---Randomizer by Ambo v0.4 w Bartian roun" (seen 19x) ===
---Randomizer by Ambo v0.4 w Bartian rounding and OPman and Robert fix

local function get_rnd_number(from_val, to_val, split_chance)
    from_val = from_val or 0.6
    to_val =  to_val or 1.5
    split_chance = split_chance or  0.5
	--- Spring.Echo(from_val, "<- from_val - to_val ->", to_val , split_chance) ---

    local num

    if math.random() < split_chance then
        local range_min = math.min(from_val, 1)
        local range_max = math.max(from_val, 1)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
	---	Spring.Echo(" within < range min: ", range_min) ---
	---	Spring.Echo(" within < range max: ", range_max) ---
		Spring.Echo(" within < num: ", num) 
		
    else
        local range_min = math.min(1, to_val)
        local range_max = math.max(1, to_val)
        local current_range_size = range_max - range_min
        num = math.random() * current_range_size + range_min
	---	Spring.Echo(" within > range min: ", range_min) ---
	---	Spring.Echo(" within > range max: ", range_max) ---
		Spring.Echo(" within > num: ", num)
    end
    return num
end

local function rndmz(value,from_val, to_val, split_chance)
    if type(value) == "number" then
        return value * get_rnd_number(from_val, to_val, split_chance)
    end
    return value
end

for name, ud in pairs(UnitDefs) do
	--- Spring.Echo("Processing:", name) ---
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


		if ud.canfly == true and type(ud.speed) == "number" and ud.speed > 450 then
			ud.speed = 450
		end

    if ud.weapondefs then
	  local tempcount = 0
	  local fixnum1
      local fixnum2
	  local fixnum3
	  local fixnum4
	  local fixnum5
	  local fixnum6
	  local fixnum7
	  local fixnum8

        for weapon_name, weapon_def in pairs(ud.weapondefs) do
		
            weapon_def.areaofeffect = rndmz(weapon_def.areaofeffect)
            weapon_def.beamtime = rndmz(weapon_def.beamtime)
            weapon_def.energypershot = rndmz(weapon_def.energypershot)
            weapon_def.reloadtime = rndmz(weapon_def.reloadtime, 0.3,1.3, 0.66)
            weapon_def.thickness = rndmz(weapon_def.thickness)
            weapon_def.stockpiletime = rndmz(weapon_def.stockpiletime,0.8,1.2,0.5) 
            weapon_def.craterareaofeffect = rndmz(weapon_de

-- === "--Randomizer by Ambo v0.3" (seen 3x) ===
--Randomizer by Ambo v0.3
function get_rnd_number(from_val,to_val,split_chance)from_val=from_val or 0.5 to_val=to_val or 2.0 split_chance=split_chance or 0.5 local num if math.random()< split_chance then local range_min=math.min(from_val,1)local range_max=math.max(from_val,1)local current_range_size=range_max - range_min num=math.random()* current_range_size + range_min else local range_min=math.min(1,to_val)local range_max=math.max(1,to_val)local current_range_size=range_max - range_min num=math.random()* current_range_size + range_min end return math.floor(num * 100)/ 100 end function rndmz(value,from_val,to_val,split_chance)if type(value)=="number" then return value * get_rnd_number(from_val,to_val,split_chance)end return value end for name,ud in pairs(UnitDefs)do ud.speed=rndmz(ud.speed,0.5,3,0.33)ud.maxacc=rndmz(ud.maxacc,0.4,3,0.33)ud.maxdec=rndmz(ud.maxdec,0.4,3,0.33)ud.maxslope=rndmz(ud.maxslope,0.4,3,0.33)ud.turnrate=rndmz(ud.turnrate,0.4,3,0.33)ud.verticalspeed=rndmz(ud.verticalspeed,0.4,3,0.33)ud.buildtime=rndmz(ud.buildtime,0.3,1.3,0.66)ud.energycost=rndmz(ud.energycost,0.3,1.5,0.66)ud.health=rndmz(ud.health,0.6,4,0.33)ud.idleautoheal=rndmz(ud.idleautoheal,0.6,10,0.33)ud.metalcost=rndmz(ud.metalcost,0.3,1.5,0.66)ud.sightdistance=rndmz(ud.sightdistance,0.3,1.5,0.33)if ud.weapondefs then for weapon_name,weapon_def in pairs(ud.weapondefs)do weapon_def.areaofeffect=rndmz(weapon_def.areaofeffect)weapon_def.beamtime=rndmz(weapon_def.beamtime)weapon_def.energypershot=rndmz(weapon_def.energypershot)weapon_def.reloadtime=rndmz(weapon_def.reloadtime,0.3,1.3,0.66)weapon_def.thickness=rndmz(weapon_def.thickness)weapon_def.weaponvelocity=rndmz(weapon_def.weaponvelocity)weapon_def.craterareaofeffect=rndmz(weapon_def.craterareaofeffect)weapon_def.craterboost=rndmz(weapon_def.craterboost)weapon_def.cratermult=rndmz(weapon_def.cratermult)weapon_def.edgeeffectiveness=rndmz(weapon_def.edgeeffectiveness)weapon_def.laserflaresize=rndmz(weapon_def.laserflaresize)weapon_def.range=rndmz(weapon_def.range,0.4,2.5,0.33)weapon_def.burst=rndmz(weapon_def.burst)weapon_def.burstrate=rndmz(weapon_def.burstrate)weapon_def.flighttime=rndmz(weapon_def.flighttime)weapon_def.impulsefactor=rndmz(weapon_def.impulsefactor)weapon_def.startvelocity=rndmz(weapon_def.startvelocity,0.4,2.5,0.33)weapon_def.weaponacceleration=rndmz(weapon_def.weaponacceleration,0.4,2.5,0.33)weapon_def.weapontimer=rndmz(weapon_def.weapontimer)if weapon_def.damage then weapon_def.damage.default=rndmz(weapon_def.damage.default,0.4,2.2,0.5)weapon_def.damage.vtol=rndmz(weapon_def.damage.vtol,0.4,2.2,0.5)end end end end

-- === "--Random Rarities by Ambo Tuned v0.10" (seen 5x) ===
--Random Rarities by Ambo Tuned v0.10

-- === "--Random Rarities by Ambo V0.7" (seen 34x) ===
--Random Rarities by Ambo V0.7.1

-- === "--No Metal Mod by Ambo V0.1" (seen 11x) ===
--No Metal Mod by Ambo V0.1
for name,ud in pairs(UnitDefs)do if ud.metalcost and ud.metalcost >0 and ud.energycost and ud.energycost >0 then ud.energycost=ud.energycost +((ud.energycost / ud.metalcost)*ud.metalcost)ud.metalcost=0 end if ud.metalcost and ud.metalcost >0 then ud.energycost=(5*ud.metalcost)ud.metalcost=0 end end for name,ud in pairs(UnitDefs)do if ud.extractsmetal and ud.extractsmetal > 0 then ud.maxthisunit=0 end if ud.customparams and ud.customparams.energyconv_efficiency and ud.customparams.energyconv_efficiency > 0 then ud.maxthisunit=0 end end

-- === "--Bigger Tier Steps by Ambo V0.5 - post-version" (seen 13x) ===
--Bigger Tier Steps by Ambo V0.5 - post-version


local oldUnitDef_Post = UnitDef_Post  
function UnitDef_Post(name, ud)
    if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then  
        oldUnitDef_Post(name, ud)  
    end  
    local m_metal, m_energy, m_health, m_speed, m_reload, m_range, m_energy_gen, m_metal_gen, m_conv_cap, m_conv_eff, m_wind
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 2; m_energy = 2; m_health = 2; m_reload = 0.4; m_range = 1.5; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.5; m_conv_eff = 1.5; m_wind = 1.4
        else
            m_metal = 4; m_energy = 4; m_health = 4; m_speed = 0.77; m_reload = 0.4; m_range = 1.88; m_energy_gen = 1.5; m_metal_gen = 1.5; m_conv_cap = 1.8; m_conv_eff = 1.5; m_wind = 1.4
        end
    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            m_metal = 5; m_energy = 5; m_health = 5; m_speed = 0.44; m_reload = 0.2; m_range = 2.4; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        else
            m_metal = 10; m_energy = 10; m_health = 10; m_speed = 0.44; m_reload = 0.2; m_range = 3.33; m_energy_gen = 2.6; m_metal_gen = 2.6; m_conv_cap = 2.6; m_conv_eff = 2.6; m_wind = 2.6
        end
    else
        m_metal = 0.66; m_energy = 0.66; m_health = 0.66; m_speed = 1; m_reload = 1.5; m_range = 0.8; m_energy_gen = 0.9; m_metal_gen = 0.9; m_conv_cap = 0.9; m_conv_eff = 0.9; m_wind = 0.825
    end

    if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * m_metal) end
    if ud.energycost then ud.energycost = math.floor(ud.energycost * m_energy) end
    if ud.health then ud.health = math.floor(ud.health * m_health) end
    if ud.speed and m_speed then ud.speed = math.floor(ud.speed * m_speed) end
    if ud.energymake then ud.energymake = ud.energymake * m_energy_gen end
    if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * m_metal_gen end
    if ud.windgenerator then ud.windgenerator = ud.windgenerator * m_wind end
    if ud.customparams then
        if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * m_conv_cap end
        if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * m_conv_eff end
    end

    if ud.weapondefs then
        for _, weapon_def in pairs(ud.weapondefs) do
            if m_reload then
                if weapon_def.reloadtime then weapon_def.reloadtime = weapon_def.reloadtime * m_reload end
                if weapon_def.burstrate then weapon_def.burstrate = weapon_def.burstrate * m_reload end
            end
            if m_range and weapon_def.range then
                weapon_def.range = math.floor(weapon_def.range * m_range)
            end
        end
    end
end

Spring.Echo("tweakdefs_rename_block_count:" .. "2")

-- === "--Random Rarities by Ambo v7 post-version" (seen 6x) ===
--Random Rarities by Ambo v7 post-version

-- === "--Random Rarities by Ambo V0.7.1 (compact)" (seen 2x) ===
--Random Rarities by Ambo V0.7.1 (compact)

-- === "--Random Rarities V0.1 by Ambo" (seen 4x) ===
--Random Rarities V0.1 by Ambo
rename_list={}local rarities={"Common","Uncommon","Rare","Very Rare","Epic","Super Epic","Exotic","Legendary","Jackpot","Mythical","Ethereal","Miracle","Exotic","Blessing","UNIVERSE","Super 67 sayan","TooLucky","Limiting","Ultra Powered","Victimization","Zeta-nil","Zeta-Infinity","Beyond","Oh Rats!","Wicked","Beyond Every Possibility And Every Chance","AMBO","Beyond All Reason"}rarity_chance=0.7 multi_p=1.06 multi_p2=1.06 multi_n=0.92 multi_p3=1.04 function get_rarity(x)x=x or 0 if math.random()< rarity_chance then if x + 1 < #rarities then x=x + 1 + get_rarity(x)end end return x end for name,ud in pairs(UnitDefs)do local unit_rarity=get_rarity()if unit_rarity > 1 then if ud.speed then ud.speed=math.floor(ud.speed * multi_p ^ unit_rarity)end if ud.maxacc then ud.maxacc=ud.maxacc * multi_p ^ unit_rarity end if ud.maxdec then ud.maxdec=ud.maxdec * multi_p ^ unit_rarity end if ud.maxslope then ud.maxslope=ud.maxslope * multi_p ^ unit_rarity end if ud.turnrate then ud.turnrate=ud.turnrate * multi_p ^ unit_rarity end if ud.verticalspeed then ud.verticalspeed=ud.verticalspeed * multi_p ^ unit_rarity end if ud.sightdistance then ud.sightdistance=ud.sightdistance * multi_p ^ unit_rarity end if ud.health then ud.health=math.floor(ud.health * multi_p ^ unit_rarity)end if ud.idleautoheal then ud.idleautoheal=ud.idleautoheal * multi_p ^ unit_rarity end if ud.windgenerator or ud.builder==true or(not ud.speed and not ud.weapondefs)then if ud.metalcost then ud.metalcost=math.floor(ud.metalcost * multi_n ^ unit_rarity)end if ud.energycost then ud.energycost=math.floor(ud.energycost * multi_n ^ unit_rarity)end if ud.buildtime then ud.buildtime=ud.buildtime * multi_n ^ unit_rarity end if ud.workertime then ud.workertime=math.floor(ud.workertime * multi_p ^ unit_rarity)end else if ud.metalcost then ud.metalcost=math.floor(ud.metalcost * multi_p2 ^ unit_rarity)end if ud.energycost then ud.energycost=math.floor(ud.energycost * multi_p2 ^ unit_rarity)end if ud.buildtime then ud.buildtime=ud.buildtime * multi_p2 ^ unit_rarity end end if ud.energystorage then ud.energystorage=math.floor(ud.energystorage * multi_p ^ unit_rarity)end if ud.metalstorage then ud.metalstorage=math.floor(ud.metalstorage * multi_p ^ unit_rarity)end if ud.energymake then ud.energymake=ud.energymake * multi_p3 ^ unit_rarity end if ud.extractsmetal then ud.extractsmetal=ud.extractsmetal * multi_p3 ^ unit_rarity end if ud.customparams then if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency=ud.customparams.energyconv_efficiency * multi_p3 ^ unit_rarity end if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity=ud.customparams.energyconv_capacity * multi_p3 ^ unit_rarity end end if ud.weapondefs then for weapon_name,weapon_def in pairs(ud.weapondefs)do if weapon_def.areaofeffect then weapon_def.areaofeffect=weapon_def.areaofeffect * multi_p ^ unit_rarity end if weapon_def.energypershot then weapon_def.energypershot=weapon_def.energypershot *

-- === "--Bigger Tier Steps by Ambo V0.4" (seen 7x) ===
--Bigger Tier Steps by Ambo V0.4
for name, ud in pairs(UnitDefs) do
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 2) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 2) end
            if ud.health then ud.health = math.floor(ud.health * 2) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.5 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.5 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.5 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.5 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.4 end
        else
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 4) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 4) end
            if ud.health then ud.health = math.floor(ud.health * 4) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.77) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.5 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.5 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.8 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.5 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.4 end
        end
    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 5) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 5) end
            if ud.health then ud.health = math.floor(ud.health * 5) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.44) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.44 end
            if ud.range then ud.range = math.floor(ud.range * 3.33) end
            if ud.energymake then ud.energymake = ud.energymake * 2.6 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 2.6 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 2.6 end
            if ud.customparams.energyconv_efficiency then ud.customp

-- === "--Random Rarities by Ambo V0.5.1" (seen 3x) ===
--Random Rarities by Ambo V0.5.1

-- === "--Based on version by Ambo & MGGW" (seen 10x) ===
--Based on version by Ambo & MGGW
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}rarity_chance=0.7;local b=7;local c=0.10;local d=0.33;local e=7;local f={["Glass Cannon"]={{"Phantom",{cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75},{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}}},["Sniper"]={{"Phantom",{cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75},{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}}}}local g={{"Fortress",1.20,1.0,1.08,1.04,0.97,1.04,0.97},{"Watchtower",1.03,1.0,1.05,1.14,0.98,0.95,0.91},{"Suppressor",1.06,1.0,1.04,1.0,0.88,1.12,0.97}}local h={["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}}},["Watchtower"]={{"Phantom",{cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50},{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3}},{"Berserker",{},{dmg=1.3,aoe=1.3}}}}function get_rarity(i)local i=i or 0;if i+1<=#a and math.random()<rarity_chance then i=get_rarity(i+1)end;return i end;function get_rarity_min(j)local k=get_rarity(j)if k<j then k=j end;return k end;function set_v(i,l,k,m,n)local m=m or false;local o=0;local n=n or 1;if i then o=i*l^k+(l-1)*i;if m then o=math.floor(o)end;return o*n else return nil end end;local p={{"Glass Cannon",1.0,1.05,1.12,1.05,0.91,1.05,0.96},{"Tank",1.22,1.0,1.01,1.04,0.97,1.04,0.97},{"Sniper",1.03,1.04,1.07,1.14,0.98,0.95,0.91},{"Brawler",1.06,1.10,1.05,1.0,0.88,1.10,0.97}}local q={armada={armap={"armthund","armkam"},armlab={"armpw","armrock","armham","armwar","armflea"},armvp={"armmlv","armfav","armflash","armpincer","armstump","armart","armjanus"},armsy={"armdecade","armpt","armpship","armroy","armsub"},armfhp={"armsh","armanac","armmh"},armplat={"armsaber","armsb","armseap"},armaap={"armbrawl","armpnix","armlance","armdfly","armblade","armstil","armliche"},armalab={"armfast","armamph","armzeus","armmav","armsptk","armfido","armsnipe","armfboy","armspid","armvader","armscab"},armavp={"armcroc","armlatnk","armbull","armgremlin","armmart","armmerl","armmanni"},armasy={"armcrus","armsubk","armserp","armantiship","armbats","armmship","armepoch","armlship"},armamsub={"armpincer","armcroc"},armshltx={"armbanth","armraz","armmar","armvang","armlun","armthor"}},cortex={corap={"corshad","corbw"},corlab={"corak","corstorm","corthud"},corvp={"cormlv","corfav","corgator","corgarp","corraid","corlevlr","corwo

-- === "--Random Rarities by Ambo V0.6" (seen 2x) ===
--Random Rarities by Ambo V0.6

-- === "--Random Rarities by Ambo V0.2" (seen 1x) ===
--Random Rarities by Ambo V0.2
rename_list={}local rarities={"Common","Uncommon","Rare","Epic","Exotic","Legendary","Jackpot","Mythical","Ethereal","Miracle","Exotic","Blessing","Unique","Divine","Eternal","Supreme","Omega","Ultimate","Beyond","Immortal","Absurd","System Error","TooRNG","Insanely Lucky","Dope","Admin","GOD","nil","null","undefined","ERROR","Super Sayan","Beyond","Beyond Every Possibility And Every Chance","AMBO","Beyond All Reason"}rarity_chance=0.7 multi_p=1.06 multi_p2=1.06 multi_n=0.92 multi_p3=1.04 function get_rarity(x)x=x or 0 if math.random()< rarity_chance then if x + 1 < #rarities then x=x + 1 + get_rarity(x)end end return x end for name,ud in pairs(UnitDefs)do local unit_rarity=get_rarity()if unit_rarity > #rarities then unit_rarity=#rarities end if unit_rarity > 1 then if ud.speed then ud.speed=math.floor(ud.speed * multi_p ^ unit_rarity)end if ud.maxacc then ud.maxacc=ud.maxacc * multi_p ^ unit_rarity end if ud.maxdec then ud.maxdec=ud.maxdec * multi_p ^ unit_rarity end if ud.maxslope then ud.maxslope=ud.maxslope * multi_p ^ unit_rarity end if ud.turnrate then ud.turnrate=ud.turnrate * multi_p ^ unit_rarity end if ud.verticalspeed then ud.verticalspeed=ud.verticalspeed * multi_p ^ unit_rarity end if ud.sightdistance then ud.sightdistance=ud.sightdistance * multi_p ^ unit_rarity end if ud.sonardistance then ud.sonardistance=ud.sonardistance * multi_p ^ unit_rarity end if ud.radardistancejam then ud.radardistancejam=ud.radardistancejam * multi_p ^ unit_rarity end if ud.radardistance then ud.radardistance=ud.radardistance * multi_p ^ unit_rarity end if ud.radaremitheight then ud.radaremitheight=ud.radaremitheight * multi_p ^ unit_rarity end if ud.health then ud.health=math.floor(ud.health * multi_p ^ unit_rarity)end if ud.idleautoheal then ud.idleautoheal=ud.idleautoheal * multi_p ^ unit_rarity end if ud.tidalgenerator or ud.windgenerator or ud.builder==true or(not ud.speed and not ud.weapondefs)then if ud.metalcost then ud.metalcost=math.floor(ud.metalcost * multi_n ^ unit_rarity)end if ud.energycost then ud.energycost=math.floor(ud.energycost * multi_n ^ unit_rarity)end if ud.buildtime then ud.buildtime=ud.buildtime * multi_n ^ unit_rarity end if ud.workertime then ud.workertime=math.floor(ud.workertime * multi_p ^ unit_rarity)end else if ud.metalcost then ud.metalcost=math.floor(ud.metalcost * multi_p2 ^ unit_rarity)end if ud.energycost then ud.energycost=math.floor(ud.energycost * multi_p2 ^ unit_rarity)end if ud.buildtime then ud.buildtime=ud.buildtime * multi_p2 ^ unit_rarity end end if ud.energystorage then ud.energystorage=math.floor(ud.energystorage * multi_p ^ unit_rarity)end if ud.metalstorage then ud.metalstorage=math.floor(ud.metalstorage * multi_p ^ unit_rarity)end if ud.energymake then ud.energymake=ud.energymake * multi_p3 ^ unit_rarity end if ud.extractsmetal then ud.extractsmetal=ud.extractsmetal * multi_p3 ^ unit_rarity end if ud.customparams then if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency=u

-- === "--Random Rarities by Ambo 8" (seen 8x) ===
--Random Rarities by Ambo 8

-- === "---Random Rarities by Ambo V0.7" (seen 1x) ===
--Random Rarities by Ambo V0.7.1

-- === "--LRPC by Ambo v1" (seen 5x) ===
--LRPC by Ambo v1
local lrpc = {
  corint = true, armbrtha = true, leglrpc = true
}
local lrpc2 = {
corbuzz = true, armvulc = true, legstarfall = true
}

for name, ud in pairs(UnitDefs) do
    if lrpc[name] then
        ud.turnrate = ud.turnrate and ud.turnrate * 4 or ud.turnrate
        ud.energycost = ud.energycost and ud.energycost * 5 or ud.energycost
        ud.metalcost = ud.metalcost and ud.metalcost * 10 or ud.metalcost
        ud.highTrajectory = 0
        if ud.weapondefs then
			for weapon_name, weapon_def in pairs(ud.weapondefs) do
                weapon_def.damage.default = weapon_def.damage.default and weapon_def.damage.default * 10 or weapon_def.damage.default
                weapon_def.energypershot = weapon_def.energypershot and weapon_def.energypershot * 5 or weapon_def.energypershot
                weapon_def.range = weapon_def.range and weapon_def.range * 3 or weapon_def.range
                weapon_def.weaponvelocity = weapon_def.weaponvelocity and weapon_def.weaponvelocity * 3 or weapon_def.weaponvelocity
                weapon_def.mygravity = weapon_def.mygravity and weapon_def.mygravity * 3 or weapon_def.mygravity
                weapon_def.sprayangle = weapon_def.sprayangle and 0 or weapon_def.sprayangle
                weapon_def.cegtag = weapon_def.cegtag and "arty-huge" or weapon_def.cegtag
                weapon_def.accuracy = 0
                weapon_def.areaofeffect = 0
                weapon_def.avoidfriendly = true
                weapon_def.craterboost = 0
                weapon_def.cratermult = 0
                weapon_def.firetolerance = 10000
                weapon_def.reloadtime = weapon_def.reloadtime and weapon_def.reloadtime / 5 or weapon_def.reloadtime
                weapon_def.weaponacceleration = 500
                weapon_def.weapontype = "Cannon"
                weapon_def.edgeeffectiveness = 0.1
                weapon_def.rgbcolor = "0.7 0.7 1.0"
                weapon_def.highTrajectory = 0
 
            end
        end
    elseif lrpc2[name] then
        ud.turnrate = ud.turnrate and ud.turnrate * 4 or ud.turnrate
        ud.energycost = ud.energycost and ud.energycost * 2 or ud.energycost
        ud.metalcost = ud.metalcost and ud.metalcost * 3 or ud.metalcost
        ud.highTrajectory = nil
        if ud.weapondefs then
			for weapon_name, weapon_def in pairs(ud.weapondefs) do
                weapon_def.damage.default = weapon_def.damage.default and weapon_def.damage.default * 3 or weapon_def.damage.default
                weapon_def.energypershot = weapon_def.energypershot and weapon_def.energypershot * 2 or weapon_def.energypershot
                weapon_def.range = weapon_def.range and weapon_def.range * 3 or weapon_def.range
                weapon_def.weaponvelocity = weapon_def.weaponvelocity and weapon_def.weaponvelocity * 3 or weapon_def.weaponvelocity
                weapon_def.mygravity = weapon_def.mygravity and weapon_def.mygravity * 3 or 0.1445 * 3
                weapon_def.sprayangle = weapon_def.sprayangle and 0 or weapon_def.sprayangle
                weapon_def.cegtag = weapon_def.cegtag and "arty-huge" or weapon_def.cegtag
                weapon_def.accuracy = 0
                weapon_def.areaofeffect = 0
                weapon_def.avoidfriendly = true
                weapon_def.craterboost = 0
                weapon_def.cratermult = 0
                weapon_def.firetolerance = 10000
                weapon_def.reloadtime = weapon_def.reloadtime and weapon_def.reloadtime / 2 or weapon_def.reloadtime
                weapon_def.weaponacceleration = 500
                weapon_def.weapontype = "Cannon"
                weapon_def.edgeeffectiveness = 0.1
                weapon_def.rgbcolor = "0.7 0.7 1.0"
                weapon_def.highTrajectory = 0
            end
        end
    end
end--Cross Faction Tax 70%

-- === "-- UNIT_LAUNCHERS_END--Random Rarities by Ambo V0.7" (seen 1x) ===
-- UNIT_LAUNCHERS_END--Random Rarities by Ambo V0.7

-- === "--Random Rarities by Ambo V0.5" (seen 7x) ===
--Random Rarities by Ambo V0.5

-- === "--Random Rarities by Ambo V0.4" (seen 1x) ===
--Random Rarities by Ambo V0.4

-- === "--Random Rarities by Ambo V0.3.1" (seen 3x) ===
--Random Rarities by Ambo V0.3.1

-- === "--Random Rarities by Ambo V0.3" (seen 8x) ===
--Random Rarities by Ambo V0.3
rename_list = {}
local rarities = {"Uncommon","Rare","Epic","Exotic","Legendary",
    "Jackpot","Mythical","Ethereal","Miracle","Exotic","Blessing","Unique","Divine","Eternal",
    "Supreme","Omega","Ultimate","Beyond","Immortal","Absurd","System Error",
    "TooRNG","Insanely Lucky","Dope","Admin","GOD","nil","null","undefined",
    "ERROR","Super Sayan","Beyond","Beyond Every Possibility And Every Chance","AMBO","Beyond All Reason"
}

rarity_chance = 0.7

function get_rarity(x)
    local x = x or 0
    if math.random() < rarity_chance then
        if x + 1 < #rarities then
            x = x + 1 + get_rarity(x)
        end
    end
    return x
end

function set_v(x,m,r,f)
    local f = f or false
    local t = 0
    if x then
        t = x*(m^r)+((m-1)*x)
        if f then t = math.floor(t) end
        return t
    else
        return nil
    end
    
end
local bug
local fix
for name, ud in pairs(UnitDefs) do
    local unit_rarity = get_rarity()
    if unit_rarity > #rarities then unit_rarity = #rarities end
    if unit_rarity > 0 then
        ud.speed = set_v(ud.speed, 1.05, unit_rarity, true)
        ud.maxacc = set_v(ud.maxacc, 1.05, unit_rarity)
        ud.maxdec = set_v(ud.maxdec, 1.05, unit_rarity)
        ud.maxslope = set_v(ud.maxslope, 1.05, unit_rarity)
        ud.turnrate = set_v(ud.turnrate, 1.05, unit_rarity)
        ud.verticalspeed = set_v(ud.verticalspeed, 1.05, unit_rarity)
        ud.sightdistance = set_v(ud.sightdistance, 1.05, unit_rarity)
        ud.sonardistance = set_v(ud.sonardistance, 1.05, unit_rarity)
        ud.radardistancejam = set_v(ud.radardistancejam, 1.05, unit_rarity)
        ud.radardistance = set_v(ud.radardistance, 1.1, unit_rarity)
        ud.radaremitheight = set_v(ud.radaremitheight, 1.05, unit_rarity)
        ud.health = set_v(ud.health, 1.1, unit_rarity, true)
        ud.idleautoheal = set_v(ud.idleautoheal, 1.1, unit_rarity)
        ud.energystorage = set_v(ud.energystorage, 1.15, unit_rarity, true)
        ud.metalstorage = set_v(ud.metalstorage, 1.15, unit_rarity, true)
        ud.energymake = set_v(ud.energymake, 1.04, unit_rarity)
        ud.extractsmetal = set_v(ud.extractsmetal, 1.1, unit_rarity)
        ud.energyupkeep = set_v(ud.energyupkeep, 1.04, unit_rarity)
        ud.tidalgenerator = set_v(ud.tidalgenerator, 1.04, unit_rarity)
        if ud.windgenerator and not ud.customparams.energymultiplier then ud.customparams.energymultiplier = 1 end
        if ud.tidalgenerator or ud.windgenerator or ud.builder == true or (not ud.speed and not ud.weapondefs) then
            ud.metalcost = set_v(ud.metalcost, 0.97, unit_rarity, true)
            ud.energycost = set_v(ud.energycost, 0.98, unit_rarity, true)
            ud.buildtime = set_v(ud.buildtime, 0.98, unit_rarity)
            ud.workertime = set_v(ud.workertime, 1.1, unit_rarity, true)
        else
            ud.metalcost = set_v(ud.metalcost, 1.035, unit_rarity, true)
            ud.energycost = set_v(ud.energycost, 1.04, unit_rarity, true

-- === "--Bigger Tier Steps by Ambo V0.3" (seen 3x) ===
--Bigger Tier Steps by Ambo V0.3
for name, ud in pairs(UnitDefs) do
    if ud.customparams and ud.customparams.techlevel == 2 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 2) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 2) end
            if ud.health then ud.health = math.floor(ud.health * 2) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.8 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.8 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.8 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.8 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.6 end
        else
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 4) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 4) end
            if ud.health then ud.health = math.floor(ud.health * 4) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.77) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.7 end
            if ud.range then ud.range = math.floor(ud.range * 1.88) end
            if ud.energymake then ud.energymake = ud.energymake * 1.8 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 1.8 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 1.8 end
            if ud.customparams.energyconv_efficiency then ud.customparams.energyconv_efficiency = ud.customparams.energyconv_efficiency * 1.8 end
            if ud.windgenerator  then ud.windgenerator  = ud.windgenerator * 1.6 end
        end


    elseif ud.customparams and ud.customparams.techlevel == 3 then
        if (not ud.speed) or ud.speed < 1 then
            if ud.metalcost then ud.metalcost = math.floor(ud.metalcost * 5) end
            if ud.energycost then ud.energycost = math.floor(ud.energycost * 5) end
            if ud.health then ud.health = math.floor(ud.health * 5) end
            if ud.speed then ud.speed = math.floor(ud.speed * 0.44) end
            if ud.reloadtime then ud.reloadtime = ud.reloadtime * 0.44 end
            if ud.range then ud.range = math.floor(ud.range * 3.33) end
            if ud.energymake then ud.energymake = ud.energymake * 3.6 end
            if ud.extractsmetal then ud.extractsmetal = ud.extractsmetal * 3.6 end
            if ud.customparams.energyconv_capacity then ud.customparams.energyconv_capacity = ud.customparams.energyconv_capacity * 3.6 end
            if ud.customparams.energyconv_efficiency then ud.custo

-- === "--Rando by Ambo v0.4 x10" (seen 2x) ===
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

-- === "-- UNIT_LAUNCHERS_END--No Metal Mod by Ambo V0.1" (seen 2x) ===
-- UNIT_LAUNCHERS_END--No Metal Mod by Ambo V0.1
for name,ud in pairs(UnitDefs)do if ud.metalcost and ud.metalcost >0 and ud.energycost and ud.energycost >0 then ud.energycost=ud.energycost +((ud.energycost / ud.metalcost)*ud.metalcost)ud.metalcost=0 end if ud.metalcost and ud.metalcost >0 then ud.energycost=(5*ud.metalcost)ud.metalcost=0 end end for name,ud in pairs(UnitDefs)do if ud.extractsmetal and ud.extractsmetal > 0 then ud.maxthisunit=0 end if ud.customparams and ud.customparams.energyconv_efficiency and ud.customparams.energyconv_efficiency > 0 then ud.maxthisunit=0 end end

-- === "--No Metal Mod by Ambo V0.1 (Merely Zero M" (seen 2x) ===
--No Metal Mod by Ambo V0.1 (Merely Zero Metal, Converters Allowed)
for name,ud in pairs(UnitDefs) do
  ud.metalcost = 0
  ud.metalCost = 0
  ud.buildCostMetal = 0
end

for name,ud in pairs(UnitDefs) do
  if ud.extractsMetal and ud.extractsMetal > 0 then
    ud.maxThisUnit = 0
  end
end-- Source: ["~lua/main-defs.lua"]
local a,b,c,d=UnitDefs or{},'repulsor',pairs,table.merge;function addWeapon(c,e,f)a[c]=a[c]or{}a[c].weapons=a[c].weapons or{}a[c].weapondefs=a[c].weapondefs or{}a[c].customparams=a[c].customparams or{}table.insert(a[c].weapons,{def=b,onlytargetcategory=f or''})a[c].weapondefs[b]=e;if e.shield and e.shield.power>0 then e.range=e.shield.radius;a[c].customparams=d(a[c].customparams or{},{off_on_stun='true',shield_color_mult=0.8,shield_power=e.shield.power,shield_radius=e.shield.radius})end end;for a,b in c(a)do if string.sub(a,1,24)=='raptor_air_fighter_basic'then if b.weapondefs then for a,a in c(b.weapondefs)do a.name='Spike'a.accuracy=200;a.collidefriendly=0;a.collidefeature=0;a.avoidfeature=0;a.avoidfriendly=0;a.areaofeffect=64;a.edgeeffectiveness=0.3;a.explosiongenerator='custom:raptorspike-large-sparks-burn'a.cameraShake={}a.dance={}a.interceptedbyshieldtype=0;a.model='Raptors/spike.s3o'a.reloadtime=1.1;a.soundstart='talonattack'a.startvelocity=200;a.submissile=1;a.smoketrail=0;a.smokePeriod={}a.smoketime={}a.smokesize={}a.smokecolor={}a.soundhit={}a.texture1={}a.texture2={}a.tolerance={}a.tracks=0;a.turnrate=60000;a.weaponacceleration=100;a.weapontimer=1;a.weaponvelocity=1000;a.weapontype={}a.wobble={}end end elseif a:match'^[acl][ore][rgm]com'and not a:match'_scav$'then table.mergeInPlace(b,{customparams={combatradius=0,fall_damage_multiplier=0,paratrooper=true,wtboostunittype={}},featuredefs={dead={damage=9999999,reclaimable=false,mass=9999999}}})end end;local b={raptor_air_kamikaze_basic_t2_v1={selfdestructas='raptor_empdeath_big'},raptor_land_swarmer_emp_t2_v1={weapondefs={raptorparalyzersmall={damage={shields=70},paralyzetime=6}}},raptor_land_assault_emp_t2_v1={weapondefs={raptorparalyzerbig={damage={shields=150},paralyzetime=10}}},raptor_allterrain_arty_emp_t2_v1={weapondefs={goolauncher={paralyzetime=6}}},raptor_allterrain_arty_emp_t4_v1={weapondefs={goolauncher={paralyzetime=10}}},raptor_air_bomber_emp_t2_v1={weapondefs={weapon={damage={shields=1100,default=2000},paralyzetime=10}}},raptor_allterrain_swarmer_emp_t2_v1={weapondefs={raptorparalyzersmall={damage={shields=70},paralyzetime=6}}},raptor_allterrain_assault_emp_t2_v1={weapondefs={raptorparalyzerbig={damage={shields=150},paralyzetime=6}}},raptor_matriarch_electric={weapondefs={goo={paralyzetime=13},melee={paralyzetime=13},spike_emp_blob={paralyzetime=13}}}}for b,c in c(b)do if a[b]then a[b]=d(a[b],c)end end;for b,b in c({'raptor_antinuke','raptor_turret_acid_t2_v1','raptor_turret_acid_t3_v1','raptor_turret_acid_t4_v1','raptor_turret_antiair_t2_v1','raptor_turret_antiair_t3_v1','raptor_turret_antiair_t4_v1','raptor_turret_antinuke_t2_v1','raptor_turret_antinuke_t3_v1','raptor_turret_basic_t2_v1','raptor_tu


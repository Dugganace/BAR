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
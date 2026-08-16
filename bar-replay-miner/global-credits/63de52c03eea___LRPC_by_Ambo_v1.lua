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
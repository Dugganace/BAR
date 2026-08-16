--Random Rarities by Ambo V0.7
--Special Thanks to MGGW
rename_list = {}
local rarities = {	"Uncommon","Rare","Exceptional","Epic","Exotic",
				"Legendary","Mythical","Miracle","Divine","Eternal",
				"Supreme","Omega","Unique", "Jackpot","Immortal",
				"Absurd","Godlike","TooRNG","Insanely Lucky","Dope",
				"Admin","GOD","ERROR","Super Sayan","Beyond",
				"MGGW","AMBO","Beyond All Reason"
}

rarity_chance = 0.7

function get_rarity(x)
	local x = x or 0
	if x + 1 <= #rarities and math.random() < rarity_chance then
			x = get_rarity(x+1)
	end
	return x
end

function set_v(x,m,r,f,em)
	local f = f or false
	local t = 0
	local em = em or 1
	if x then
		t = x*(m^r)+((m-1)*x)
		if f then t = math.floor(t) end
		return t*em
	else
		return nil
	end	
end

for name, ud in pairs(UnitDefs) do
	local unit_rarity = get_rarity()
	local MCost = ud.metalcost and "metalcost" or "buildcostmetal"
	local ECost = ud.energycost and "energycost" or "buildcostenergy"
	local Health = ud.health and "health" or "maxdamage"
	if not ud.power then ud.power = ud[MCost] + (ud[ECost]/60) end
	local bugfix = unit_rarity
	if not (unit_rarity <= #rarities) then unit_rarity = #rarities end
	if not (unit_rarity <= 6) and (name == "armcom" or name == "corcom" or name == "legcom") then
		unit_rarity = 6
	end
	if bugfix > 0 then
		ud.power = set_v(ud.power, 1.2, unit_rarity)
		ud.speed = set_v(ud.speed, 1.05, unit_rarity, true)
		ud.maxacc = set_v(ud.maxacc, 1.05, unit_rarity)
		ud.maxdec = set_v(ud.maxdec, 1.05, unit_rarity)
		ud.turnrate = set_v(ud.turnrate, 1.05, unit_rarity)
		ud.verticalspeed = set_v(ud.verticalspeed, 1.05, unit_rarity)
		ud.sightdistance = set_v(ud.sightdistance, 1.05, unit_rarity)
		ud.sonardistance = set_v(ud.sonardistance, 1.05, unit_rarity)
		ud.radardistancejam = set_v(ud.radardistancejam, 1.05, unit_rarity)
		ud.radardistance = set_v(ud.radardistance, 1.1, unit_rarity)
		ud.radaremitheight = set_v(ud.radaremitheight, 1.05, unit_rarity)
		ud[Health] = set_v(ud[Health], 1.1, unit_rarity, true)
		ud.idleautoheal = set_v(ud.idleautoheal, 1.1, unit_rarity)
		ud.energystorage = set_v(ud.energystorage, 1.15, unit_rarity, true)
		ud.metalstorage = set_v(ud.metalstorage, 1.15, unit_rarity, true)
		ud.energymake = set_v(ud.energymake, 1.04, unit_rarity)
		ud.extractsmetal = set_v(ud.extractsmetal, 1.1, unit_rarity)
		ud.energyupkeep = set_v(ud.energyupkeep, 1.04, unit_rarity)
		ud.tidalgenerator = set_v(ud.tidalgenerator, 1.04, unit_rarity)
		ud.windgenerator = set_v(ud.windgenerator, 1.04, unit_rarity)
		if ud.windgenerator and not ud.customparams.energymultiplier then ud[MCost] = set_v(ud[MCost], 0.97, unit_rarity, true) end
		if ud.tidalgenerator or ud.windgenerator or ud.builder == true or (not ud.speed and not ud.weapondefs) then
			ud[MCost] = set_v(ud[MCost], 0.97, unit_rarity, true)
			ud[ECost] = set_v(ud[ECost], 0.98, unit_rarity, true)
			ud.buildtime = set_v(ud.buildtime, 0.98, unit_rarity)
			ud.workertime = set_v(ud.workertime, 1.05, unit_rarity, true)
			ud.builddistance = set_v(ud.builddistance, 1.05, unit_rarity, true)
		else
			ud[MCost] = set_v(ud[MCost], 1.035, unit_rarity, true)
			ud[ECost] = set_v(ud[ECost], 1.04, unit_rarity, true)
			ud.buildtime = set_v(ud.buildtime, 1.05, unit_rarity)
			ud.workertime = set_v(ud.workertime, 1.05, unit_rarity, true)
			ud.builddistance = set_v(ud.builddistance, 1.05, unit_rarity, true)
		end
		if ud.customparams then
			ud.customparams.energyconv_efficiency = set_v(ud.customparams.energyconv_efficiency, 1.04, unit_rarity)
			ud.customparams.energyconv_capacity = set_v(ud.customparams.energyconv_capacity, 1.04, unit_rarity, true)
			ud.customparams.shield_power = set_v(ud.customparams.shield_power, 1.1, unit_rarity, true)
			ud.customparams.shield_radius = set_v(ud.customparams.shield_radius, 1.05, unit_rarity, true)
			ud.customparams.energymultiplier = set_v(ud.customparams.energymultiplier, 1.04, unit_rarity, true)
		end
		if ud.weapondefs then
			for weapon_name, weapon_def in pairs(ud.weapondefs) do
				if weapon_def.interceptor == 1 or weapon_def.targetable == 1 then
					weapon_def.coverage = set_v(weapon_def.coverage, 1.02, unit_rarity, true)
					weapon_def.damage.default = set_v(weapon_def.damage.default, 1.1, unit_rarity)
					weapon_def.areaofeffect = set_v(weapon_def.areaofeffect, 1.01, unit_rarity)
				else
					if not weapon_def.reloadtime or weapon_def.reloadtime < 0.034 then weapon_def.reloadtime = 0.034 end
					if weapon_def.burstrate and weapon_def.burstrate < 0.034 then weapon_def.burstrate = 0.034 end
					if weapon_def.burst and weapon_def.burstrate then
						if weapon_def.burst *weapon_def.burstrate > weapon_def.reloadtime then weapon_def.reloadtime = weapon_def.burst *weapon_def.burstrate end
					end
					if weapon_def.beamtime then
						if weapon_def.beamtime > weapon_def.reloadtime then weapon_def.reloadtime = weapon_def.beamtime end
					end
					
					local is_continuous = false
					if weapon_def.burstrate and weapon_def.burst and weapon_def.reloadtime then
						local brb = (weapon_def.burstrate*weapon_def.burst)
						local brbr = brb/weapon_def.reloadtime
						if brbr >= 0.98 or brb >= weapon_def.reloadtime then
							is_continuous = true
						end
					end
					local is_continuous_b = false
					if weapon_def.beamtime and weapon_def.reloadtime then
						local btrt = weapon_def.beamtime/weapon_def.reloadtime
						if weapon_def.beamtime/weapon_def.reloadtime >= 0.98 or weapon_def.beamtime >= weapon_def.reloadtime then
							is_continuous_b = true
						end
					end
					weapon_def.reloadtime = set_v(weapon_def.reloadtime, 0.95, unit_rarity)
					weapon_def.burstrate = set_v(weapon_def.burstrate, 0.95, unit_rarity)

					weapon_def.areaofeffect = set_v(weapon_def.areaofeffect, 1.05, unit_rarity)
					weapon_def.energypershot = set_v(weapon_def.energypershot, 1.1, unit_rarity)
					weapon_def.weaponvelocity = set_v(weapon_def.weaponvelocity, 1.06, unit_rarity)
					weapon_def.startvelocity = set_v(weapon_def.startvelocity, 1.06, unit_rarity) 
					weapon_def.turnrate = set_v(weapon_def.turnrate, 1.06, unit_rarity)
					weapon_def.range = set_v(weapon_def.range, 1.05, unit_rarity, true)
					weapon_def.weaponacceleration = set_v(weapon_def.weaponacceleration, 1.05, unit_rarity)
					weapon_def.flighttime = set_v(weapon_def.flighttime, 1.1, unit_rarity)
					weapon_def.sprayangle = set_v(weapon_def.sprayangle, 0.97, unit_rarity)
					weapon_def.accuracy = set_v(weapon_def.accuracy, 0.97, unit_rarity)
					weapon_def.corethickness = set_v(weapon_def.corethickness, 1.02, unit_rarity)
					weapon_def.thickness = set_v(weapon_def.thickness, 1.03, unit_rarity)
					weapon_def.laserflaresize  = set_v(weapon_def.laserflaresize , 1.04, unit_rarity)
					weapon_def.size = set_v(weapon_def.size, 1.01, unit_rarity)

                    if weapon_def.customparams then weapon_def.customparams.overrange_distance = set_v(weapon_def.customparams.overrange_distance, 1.05, unit_rarity, true) end

					if weapon_def.damage then
						local dm = 1
						local dsm = 0
						local rt = weapon_def.reloadtime or 1
						local bt = weapon_def.beamtime or 0
						local br = weapon_def.burstrate or 1
						local b = weapon_def.burst or 1
						
						if rt < 0.034 then 
							dm = dm + (0.034/rt) -1
							weapon_def.reloadtime = 0.034
							rt = 0.034
						end
						if weapon_def.customparams and weapon_def.customparams.sweepfire then 
							dm = dm + (3/rt) -1
							dsm = 0.035
							weapon_def.reloadtime = 3
							rt = 0.1
							weapon_def.beamtime = 3
							rt = 0.1
						end
						if name == "armbeamer" then 
							dm = dm + (0.1/rt) -1 + (0.1/bt) -1
							dm = dm*2
							weapon_def.reloadtime = 0.1
							rt = 0.1
							weapon_def.beamtime = 0.1
							rt = 0.1
						end
						if bt > rt then 
							dm = dm + (bt/rt) -1
							weapon_def.reloadtime = bt
							rt = bt
						end
						if br < 0.034 then 
							dm = dm + (0.034/br) -1
							weapon_def.burstrate = 0.034
							br = 0.034
						end
						local brb = br*b
						if weapon_def.burstrate and weapon_def.burst and brb > rt then
							dm = dm + (brb/rt) -1
							weapon_def.reloadtime = brb
						end
						for k, v in pairs(weapon_def.damage) do
							if v == "commanders" then
								weapon_def.damage[k] = set_v(weapon_def.damage[k], 1.02+dsm, unit_rarity, false,dm)

							else
								weapon_def.damage[k] = set_v(weapon_def.damage[k], 1.05+dsm, unit_rarity, false,dm)
							end
						end
					end
					if weapon_def.shield then
						weapon_def.shield.power = set_v(weapon_def.shield.power, 1.1, unit_rarity, true)
						weapon_def.shield.powerregen = set_v(weapon_def.shield.powerregen, 1.1, unit_rarity, true)
						weapon_def.shield.radius = set_v(weapon_def.shield.radius, 1.05, unit_rarity, true)
						weapon_def.shield.force = set_v(weapon_def.shield.force, 1.05, unit_rarity)
						weapon_def.shield.powerregenenergy = set_v(weapon_def.shield.powerregenenergy, 0.99, unit_rarity, true)
					end
					if is_continuous == true then weapon_def.reloadtime = weapon_def.burst *weapon_def.burstrate end
					if is_continuous_b == true then weapon_def.reloadtime = weapon_def.beamtime end
				end
			end
		end
		if name then
			table.insert(rename_list, {name, "prefix", "[" .. rarities[unit_rarity] .. "]"})
			table.insert(rename_list, {name, "desc_prefix", "Mk." .. unit_rarity .. "   "})
		end
	else
		if name then
			table.insert(rename_list, {name, "prefix", "[Common]"})
			table.insert(rename_list, {name, "desc_prefix", "Mk." .. unit_rarity .. " "})
		end
	end
end

Spring.Echo("tweakdefs_rename_get_ready")
for i, entry in pairs(rename_list) do
	Spring.Echo("/("..entry[1].."/-"..entry[2].."/-"..entry[3].."/)")
end
Spring.Echo("tweakdefs_rename_end")
Spring.Echo("Added ".. #rename_list .. " tweakdefs_rename_instructions")
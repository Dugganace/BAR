-- No Dgun by CrossGamer

local UnitDefs = UnitDefs or {}
for unitDefName, unitDef in pairs(UnitDefs) do
	if type(unitDef) == "table" then
		local isCommander = false
		
		-- Check customparams for iscommander or isdecoycommander
		if unitDef.customparams then
			if unitDef.customparams.iscommander or unitDef.customparams.isdecoycommander then
				isCommander = true
			end
			-- Some mods use string "1" or "true"
			if unitDef.customparams.iscommander == "1" or unitDef.customparams.iscommander == "true" or unitDef.customparams.isdecoycommander == "1" or unitDef.customparams.isdecoycommander == "true" then
				isCommander = true
			end
		end
		
		-- Some unitdefs might have it directly on the unitdef
		if unitDef.iscommander == true or unitDef.isCommander == true or unitDef.isdecoycommander == true then
			isCommander = true
		end
		
		-- Check unit movement class just to be safe if customparams is missing on some evocommander
		if unitDef.movementclass and string.find(string.upper(unitDef.movementclass), "COMMANDER") then
			isCommander = true
		end
		
		-- Only apply to commanders to avoid hitting behemoths or other units
		if isCommander then
			if unitDef.candgun then
				unitDef.candgun = false
			end
			
			if unitDef.canDGun then
				unitDef.canDGun = false
			end
			
			local removedWeaponDefs = {}
			if unitDef.weapondefs then
				for weaponDefName, weaponDef in pairs(unitDef.weapondefs) do
					if weaponDef.weapontype == "DGun" then
						removedWeaponDefs[string.upper(weaponDefName)] = true
						unitDef.weapondefs[weaponDefName] = nil
					end
				end
			end
			
			if unitDef.weapons then
				local newWeapons = {}
				local nextIdx = 1
				for i, weapon in pairs(unitDef.weapons) do
					local weaponDefName = weapon.def and string.upper(weapon.def) or ""
					-- Remove if type was DGun or it matches disintegrator/dgun naming
					if not removedWeaponDefs[weaponDefName] and not string.find(weaponDefName, "DISINTEGRATOR") and not string.find(weaponDefName, "DGUN") then
						newWeapons[nextIdx] = weapon
						nextIdx = nextIdx + 1
					end
				end
				unitDef.weapons = nextIdx > 1 and newWeapons or nil
			end
		end
	end
end


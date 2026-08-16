-- No DGun Mod CrossGamer

local UnitDefs = UnitDefs or {}
for unitDefName, unitDef in pairs(UnitDefs) do
	if type(unitDef) == "table" then
		if unitDef.candgun then
			unitDef.candgun = false
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
				if not removedWeaponDefs[weaponDefName] and weaponDefName ~= "DISINTEGRATOR" then
					newWeapons[nextIdx] = weapon
					nextIdx = nextIdx + 1
				end
			end
			unitDef.weapons = nextIdx > 1 and newWeapons or nil
		end
	end
end


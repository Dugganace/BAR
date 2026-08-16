-- Make ALL weapons blockable by shields
for name, def in pairs(WeaponDefs) do
    def.interceptedByShieldType = 1
end
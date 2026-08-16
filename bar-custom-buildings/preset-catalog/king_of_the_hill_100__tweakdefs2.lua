--T2 con turrent
for name, ud in pairs(UnitDefs) do
if name == "armaca" or name == "armack" or name == "armacv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "armnanotct2"
end
if name == "coraca" or name == "corack" or name == "coracv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "cornanotct2"
end
if name == "coravp" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "corvac"
end
if name == "legaca" or name == "legack" or name == "legacv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "legnanotct2"
end
if name == "armnanotct2" or name == "cornanotct2" or name == "legnanotct2" then
	ud.health = 1020
	ud.explodeas = "largeBuildingExplosionGeneric"
end
end


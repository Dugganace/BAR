--Omni Commanders Mini
local UnitDefs = UnitDefs or {}

-- Extra Build Options (Omni Faction Commanders)
local extraBuildOptions = {
	armcom = {
		"corlab","corvp","corsy","corhp","corap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	corcom = {
		"armlab","armvp","armsy","armhp","armap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	legcom = {
		"armlab","armvp","armsy","armhp","armap",
		"corlab","corvp","corsy","corhp","corap",
		"armfhp","corfhp","legfhp",
	},
}

local level2Units = {
	armcom = {"corexp", "legmext15"},
	corcom = {"armamex", "legmext15"},
	legcom = {"armamex", "corexp"},
}

local level5Units = {
	armcom = {"cormexp", "legmohocon", "corbhmth", "legrampart"},
	corcom = {"armshockwave", "legmohocon", "legrampart"},
	legcom = {"armshockwave", "cormexp", "corbhmth"},
}

for baseName, extras in pairs(extraBuildOptions) do
	for lvl = 0, 10 do
		local unitName = lvl == 0 and baseName or (baseName .. "lvl" .. lvl)
		local uDef = UnitDefs[unitName]
		if uDef and uDef.buildoptions then
			for _, option in ipairs(extras) do
				table.insert(uDef.buildoptions, option)
			end

			if lvl >= 2 and lvl <= 4 and level2Units[baseName] then
				for _, option in ipairs(level2Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end

			if lvl >= 5 and level5Units[baseName] then
				for _, option in ipairs(level5Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end
		end
	end
end
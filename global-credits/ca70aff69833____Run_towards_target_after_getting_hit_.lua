-- Run towards target after getting hit by enemy or after hitting the target
	"skirmisher", -- Keep distance from the target
	"healer", -- Getting long max lifetime and always use Fight command. These units spawn as healers from burrows and queen
	"artillery", -- Long lifetime and no regrouping, always uses Fight command to keep distance, friendly fire enabled (assuming nothing else in the game stops it)
	"kamikaze", -- Long lifetime and no regrouping, always uses Move command to rush into the enemy
}
local shipList, hoverList, subList = {
		BOAT3 = true,
		BOAT4 = true,
		BOAT5 = true,
		BOAT9 = true,
		EPICSHIP = true
	}, {
		HOVER2 = true,
		HOVER3 = true,
		HHOVER4 = true,
		AHOVER2 = true
	}, {
		UBOAT4 = true,
		EPICSUBMARINE = true
	}
local function getMovement(def)
	if def.canfly then
		return 2
	elseif subList[def.movementclass] or shipList[def.movementclass] or (hoverList[def.movementclass] and def.maxwaterdepth and def.maxwaterdepth >=1) then
		return 3
	elseif (def.speed or 0) > 0 then
		return 1
	else
		return -1
	end
end
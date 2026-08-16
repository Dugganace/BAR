-- Fixed 'bad argument' error by correctly prefixing the CEG
					area_onhit_ceg = "custom:smokegen-part",
					area_onhit_time = 120,    -- 2 minutes of smoke
					area_onhit_range = 5000,  -- Massive coverage
					area_onhit_damage = 50,   -- Light radiation damage
				},
				damage={default=10000000}
			}
		},
		weapons={[1]={def="celestial_star"}}
	}
}

for n,t in pairs(T)do local u=a[n]if u then M(u,t)end end
local f={"legcom","armcom","corcom"}
for _,p in ipairs(f)do
	if a[p] then
		a[p].buildoptions=a[p].buildoptions or{}
		table.insert(a[p].buildoptions,"ending")
	end
	for l=2,10 do
		local n=p.."lvl"..l
		if a[n] then
			a[n].buildoptions=a[n].buildoptions or{}
			table.insert(a[n].buildoptions,"ending")
		end
	end
end-- Everything cost 1 Tweak
local unitDefs = UnitDefs or {}
local commanderCats = {["COMMANDER"] = true}
for unitId, unitDef in pairs(unitDefs) do
    if unitDef and type(unitDef) == 'table' then
        local isCommander = false
        if unitDef.category then
            for cat in string.gmatch(unitDef.category, "%S+") do
                if commanderCats[cat] then isCommander = true; break end
            end
        end
        if not isCommander then
            unitDef.metalcost = 1
            unitDef.energycost = 1
        end
    end
end-- No Buildtime
local function M(d,s)
    for k,v in pairs(s) do 
        if type(v)=="table" then 
            d[k]=d[k]or{} 
            M(d[k],v) 
        elseif v=="nil" then 
            d[k]=nil 
        else 
            d[k]=v 
        end 
    end 
end

local a = UnitDefs or {}

for unitID, unitDef in pairs(a) do
    if unitDef.buildtime ~= nil then
        unitDef.buildtime = 1
    end
end-- No Wreckage
for unitName, unitDef in pairs(UnitDefs) do
  unitDef.corpse = nil
end
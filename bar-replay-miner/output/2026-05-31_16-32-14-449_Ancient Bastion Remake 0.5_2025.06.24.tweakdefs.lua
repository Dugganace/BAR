Spring.Echo("MYDEF XPRANGE START")


function debug(o,p)
  if not p then p = "" end
  
  if type(o) == "table" then
    local s = "{\n"
    for k,v in pairs(o) do
      if type(k) ~= "number" then k = "\""..k.."\"" end
      s = s..p.."  ["..k.."] = "..debug(v,p.."  ").."\n"
    end
    return s..p.."}"
  end
    return tostring(o)
end


for name, ud in pairs(UnitDefs) do
    if ud.weapons and ud.weapons[1] then
        ud.customparams.rangexpscale = 1.0
        for i,x in pairs(ud.weapondefs) do
          if(x.range) then
            x.range = x.range * 0.75
          end
        end
    end
end


print("armsnipe = "..debug(UnitDefs["armsnipe"]))


Spring.Echo("MYDEF SUCCESS")
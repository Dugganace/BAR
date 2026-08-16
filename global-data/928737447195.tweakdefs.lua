-- Epic commando Off
UnitDefs["cormandot4"].maxthisunit = 0--Wildfire (napalmbomber)
-- Author: Developer
-- Description: GOOD OLD NAPALMBOMBER
-- Generated with BAR Editor
-- ----------------------------------------------------

-- EDITP_BUILDMENU_BEGIN
local function editp_bo(i,a,r,o)local u=UnitDefs and UnitDefs[i]if not u then return end if type(u.buildoptions)~="table"then u.buildoptions={}end if o then local t={}for x in string.gmatch(o,"%S+")do t[#t+1]=x end u.buildoptions=t return end local rm={}if r then for x in string.gmatch(r,"%S+")do rm[x]=true end end local seen={}local out={}for _,x in ipairs(u.buildoptions)do if type(x)=="string"then local k=string.lower(x)if not rm[k]then out[#out+1]=x seen[k]=true end end end if a then for x in string.gmatch(a,"%S+")do local k=string.lower(x)if not seen[k]then out[#out+1]=x seen[k]=true end end end u.buildoptions=out end editp_bo("legaap","legnap",nil,nil) 
-- onetrick -- content pulled from public BAR replays (bar-replay-miner global scan, 2026-08-15)
-- 1 distinct snippet(s), 3 total occurrences across scanned games

-- === "--T3 Fighters by onetrick" (seen 3x) ===
--T3 Fighters by onetrick
local HP=0.7
local W='legvenator'
local D={'legvenator','legafigdef','legfig'}
local G={'en','fr','de','es'}
local L={{'armfig','armhawk','armfigt3','armapt3','Tempest'},{'corveng','corvamp','corfigt3','corapt3','Revenant'},{'legfig','legafigdef','legfigt3','legapt3','Praetor'}}
local K,I={},{}
for k in ('metalcost# energycost# buildtime# health# speed turnrate# sightdistance# airsightdistance# range# reloadtime weaponvelocity# areaofeffect# flighttime'):gmatch('%S+') do
	local n=k:gsub('#','')
	K[#K+1]=n I[n]=n~=k
end
local function C(v)
	if type(v)~='table' then return v end
	local o={} for a,b in pairs(v) do o[a]=C(b) end return o
end
local function R(x,y)
	x,y=tonumber(x),tonumber(y)
	if x and y and x~=0 then return y*y/x end
end
local function A(t,k,v)
	if v then local e=t[k] if e then e[1],e[2]=e[1]+v,e[2]+1 else t[k]={v,1} end end
end
local function V(t,k,w)
	local e=t[k]
	if not e then return end
	local v=e[1]/e[2]
	if w then return math.floor(v+0.5) end
	return math.floor(v*10000+0.5)/10000
end
local function P(u)
	if type(u.weapondefs)~='table' then return end
	local n,d,c=nil,nil,0
	for a,b in pairs(u.weapondefs) do n,d,c=a,b,c+1 end
	if c==1 then return n,d end
end
local SU,SW,SD,SQ,B,N={},{},{},{}
for i=1,#L do
	local e=L[i]
	local a,b=UnitDefs[e[1]],UnitDefs[e[2]]
	if a and b then
		for j=1,#K do A(SU,K[j],R(a[K[j]],b[K[j]])) end
		local _,x=P(a)
		local n2,y=P(b)
		if x and y then
			for j=1,#K do A(SW,K[j],R(x[K[j]],y[K[j]])) end
			A(SQ,'r',tonumber(y.reloadtime))
			if type(x.damage)=='table' and type(y.damage)=='table' then
				for c,v in pairs(y.damage) do A(SD,c,R(x.damage[c],v)) end
			end
		end
		if not B then B,N=b,n2 end
	end
end
if not B then Spring.Echo('[T3F] no source fighters found') else
	local T=C(B)
	for j=1,#K do local k=K[j] local v=V(SU,k,I[k]) if v then T[k]=v end end
	T.health=math.max(1,math.floor((tonumber(T.health) or 0)*HP+0.5))

	local w=N and T.weapondefs[N]
	local fu=UnitDefs[W]
	if fu and type(fu.weapons)=='table' then
		local fn,fd=P(fu)
		if fn and fd then
			T.weapondefs={[fn]=C(fd)}
			T.weapons=C(fu.weapons)
			w=T.weapondefs[fn]
			Spring.Echo('[T3F] weapon: '..W..'/'..fn..' (flak)')
		end
	end
	if w then
		local r=V(SW,'range',true) if r then w.range=r end
		local q=V(SQ,'r') if q then w.reloadtime=q end
		if type(w.damage)~='table' then w.damage={} end
		for c in pairs(SD) do w.damage[c]=math.max(1,V(SD,c,true)) end
	end
	local s
	for i=1,#D do s=s or UnitDefs[D[i]] end
	if s and s.objectname then
		T.objectname=s.objectname
		T.script=s.script or T.script
		T.buildpic=s.buildpic or T.buildpic
		T.footprintx=tonumber(s.footprintx) or T.footprintx
		T.footprintz=tonumber(s.footprintz) or T.footprintz
	else
		Spring.Echo('[T3F] no skin donor found, keeping stock fighter model')
	end
	T.customparams=type(T.customparams)=='table' and T.customparams or {}
	T.customparams.techlevel,T.customparams.fighter=3,1
	
	T.customparams.armordef='vtol'
	T.canfly=true
	if type(T.category)=='string' then
		local c=T.category:gsub('%f[%w]NOTAIR%f[%W]','')
		if not c:find('VTOL') then c=c..' VTOL' end
		T.category=c:gsub('%s+',' '):gsub('^%s',''):gsub('%s$','')
	end
	for i=1,#L do
		local e=L[i]
		if not UnitDefs[e[3]] then
			local u=C(T)
			for q=1,#G do
				u.customparams['i18n_'..G[q]..'_humanname']=e[5]
				u.customparams['i18n_'..G[q]..'_tooltip']='Tier 3 Air Superiority Fighter'
			end
			UnitDefs[e[3]]=u
			local f,p=UnitDefs[e[4]],nil
			if f and type(f.buildoptions)=='table' then
				p=#f.buildoptions+1
				for j=1,#f.buildoptions do if f.buildoptions[j]==e[2] then p=j+1 break end end
				table.insert(f.buildoptions,p,e[3])
			end
			Spring.Echo('[T3F] '..e[3]..' m'..tostring(u.metalcost)..' hp'..tostring(u.health)..' @'..(p and e[4] or 'NO LAB '..e[4]))
		end
	end
end


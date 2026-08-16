local c=1
local f=2
local _=3
local u=4
local E=1
local T=2
local z=3
local A={{4,4,4,4},{15,15,15,5},{20,20,20,0}}
local p={{25,25,25,25},{35,35,35,35},{45,45,45,45}}
local k={18,25,40,25}
local y={1.,2.,20.}
local g=.1
local q={2.5,2.9,3.5,3.5}
local x=12
local j=25
local l=8
local b=.7
local h={
armcom=1,
armck=1,
armcv=1,
armca=1,
armcs=1,
armch=1,
corcom=1,
corck=1,
corcv=1,
corca=1,
corcs=1,
corch=1,
legcom=1,
legck=1,
legcv=1,
legca=1,
legch=1,
armaca=2,
armack=2,
armacv=2,
coraca=2,
corack=2,
coracv=2,
legaca=2,
legack=2,
legacv=2,
}
local i={
armlab=1,
armvp=1,
armap=1,
armsy=1,
armhp=1,
armfhp=1,
armplat=1,
corlab=1,
corvp=1,
corap=1,
corsy=1,
corhp=1,
corfhp=1,
corplat=1,
leglab=1,
legvp=1,
legap=1,
legsy=1,
leghp=1,
legfhp=1,
legplat=1,
legdroneplant=1,
armalab=2,
armavp=2,
armaap=2,
armasy=2,
coralab=2,
coravp=2,
coraap=2,
corasy=2,
legalab=2,
legavp=2,
legaap=2,
legasy=2,
armshltxuw=3,
armshltx=3,
corgantuw=3,
corgant=3,
leggant=3,
legantuw=3,
}
local t={
cancloak=true,
cloakcost=5,
cloakcostmoving=15,
mincloakdistance=75
}
local e={
cancloak=true,
cloakcost=5,
cloakcostmoving=15,
mincloakdistance=50
}
local v={
["Glass Cannon"]={
{"Phantom",t,{hp=.895}},
{"Volatile",{},{dmg=1.15,hp=.7}},
{"Overcharged",{},{rld=.85,energypershot=1.45}},
{"Plague",{},{fs=1.,aoe=1.15,dmg=.8}},
{"Bouncer",{},{impf=5.,impb=1.5,dmg=.65}},
},
["Tank"]={
{"Juggernaut",{},{hp=1.4,spd=.8,turnrate=.85}},
{"Regenerator",{},{autoheal=2.5}},
{"Fortified",{},{hp=1.2,rld=1.1}},
{"GravWell",{},{impf=-1.4,aoe=1.5,dmg=.85}},
},
["Sniper"]={
{"Phantom",e,{hp=.95}},
{"Marksman",{},{rng=1.25,acc=.8,aoe=.8}},
{"Piercing",{},{dmg=1.1,aoe=.6}},
{"Drunk",{},{wob=4000,dnc=50,acc=1.5,aoe=1.1}},
},
["Brawler"]={
{"Swift",{},{spd=1.25,hp=.8,maxacc=1.2}},
{"Berserker",{},{dmg=1.1,aoe=1.2,acc=1.3}},
{"Siege",{},{aoe=1.65,dmg=1.15,spd=.85}},
{"Plague",{},{fs=1.,aoe=1.25,dmg=.95}},
{"Bouncer",{},{impf=6.,impb=2.,dmg=.65}},
},
["Fortress"]={
{"Juggernaut",{},{hp=1.4}},
{"Shielded",{},{shield_power=1.3,shield_radius=1.12}},
{"Siren",{},{impf=3.5,impb=1.,dmg=.7,aoe=1.25}},
},
["Watchtower"]={
{"Phantom",e,{hp=.95}},
{"Marksman",{},{rng=1.2,acc=.75,aoe=.75}},
{"GravWell",{},{impf=-2.,aoe=1.25,dmg=.85}},
},
["Suppressor"]={
{"Siege",{},{aoe=1.45,dmg=1.1,acc=1.25}},
{"Berserker",{},{dmg=1.2,aoe=1.2}},
{"Siren",{},{impf=3.5,impb=1.,dmg=.76,aoe=1.12}},
{"Drunk",{},{wob=4000,dnc=60,acc=2.2,aoe=1.8}},
}
}
local r={
{"Glass Cannon",.92,1.011,1.07,1.01,.96,1.09,.99},
{"Tank",1.11,1.,1.008,1.02,.985,1.09,.99},
{"Sniper",1.02,1.02,1.,1.08,.99,.98,.95},
{"Brawler",1.03,1.05,1.02,1.,.92,1.04,.986}
}
local m={
{"Fortress",1.11,1.,1.03,1.02,.97,1.02,.99},
{"Watchtower",1.03,1.,1.02,1.02,.98,.97,.97},
{"Suppressor",1.02,1.,1.01,1.,.88,1.02,.97}
}
local a={}
local n={}
local d={}
local o={}
local function e(t,e)
return e*(1-math.exp(-t/35))
end
local function s(e,t,a,i)
local o=tonumber(e[t])
if a and o then
e[t]=o*a
if i then
e[t]=math.floor(e[t])
end
end
end
local function w(e)
local e=e:byte()
if e==99 then
return f
elseif e==108 then
return _
elseif e==97 then
return c
else
return u
end
end
local function f(e,t,a)
local o=t-e
local a=math.floor(o*(1-math.random()^(1/a)))+e
return math.max(e,math.min(a,t))
end
local function c(e,a,o,n,i)
e=tonumber(e)
if e then
local t=e*(a^o)+(a-1)*e
if e>0 and t<=0 then
t=e*(a^o)
end
if n then
t=math.floor(t)
end
return t*(i or 1)
end
end
local function t(t,e,a,o,i)
t[e]=c(t[e],a,o,i)
end
for e,t in pairs(UnitDefs)do
local a=h[e]
if h[e]then
o[e]=a
if t.buildoptions then
for t,e in ipairs(t.buildoptions)do
local t=o[e]or 3
o[e]=math.min(a,t)
end
end
end
end
for e,t in pairs(UnitDefs)do
local a=i[e]
if i[e]then
o[e]=a
if t.buildoptions then
for t,e in ipairs(t.buildoptions)do
local t=o[e]or 3
o[e]=math.min(a,t)
end
end
end
end
for e,t in pairs(UnitDefs)do
local t=w(e)
local o=o[e]or 2
local s=A[o][t]
local h=p[o][t]
local i=q[o]or 1.
local o=f(s,h,i)
a[e]=0
n[e]=0
if math.random()<g and t~=u then
n[e]=o
else
a[e]=o
end
if e=="armcom"or e=="corcom"or e=="legcom"then
n[e]=0
a[e]=f(x,j,i)
end
end
for t,e in pairs(UnitDefs)do
if i[t]then
if e.buildoptions then
local e=e.buildoptions
local e=e[math.random(#e)]
local t=o[e]
a[e]=k[t]
n[e]=0
end
end
end
local u={}
for e,t in pairs(UnitDefs)do
local a=a[e]or 0
if a>=l and t.weapondefs then
if t.speed then
u[e]=r[math.random(#r)]
elseif t.builder~=true then
u[e]=m[math.random(#m)]
end
end
end
local p={}
for t,e in pairs(UnitDefs)do
local a=a[t]or 0
local e=u[t]
if a>=l and e then
local e=v[e[1]]
if e and math.random()<b then
p[t]=e[math.random(#e)]
end
end
end
for h,i in pairs(UnitDefs)do
local a=a[h]
local e=n[h]
local m=i.health and"health"or"maxdamage"
local l=i.energycost and"energycost"or"buildcostenergy"
local r=i.metalcost and"metalcost"or"buildcostmetal"
local w=o[h]or 3
local o=i
local f=u[h]
local u=p[h]
local n=o.customparams
if e~=0 then
i.power=i[r]+i[l]*e/60
t(o,m,.963,e,true)
t(o,"speed",.987,e,true)
t(o,"maxacc",.987,e)
t(o,"turnrate",.987,e)
t(o,"sightdistance",.987,e)
t(o,"radardistance",.987,e)
t(o,r,.9075,e,true)
t(o,l,.9075,e,true)
t(o,"buildtime",.898,e)
if o.weapondefs then
for o,a in pairs(o.weapondefs)do
if a.interceptor~=1 and a.targetable~=1 then
t(a,"range",.987,e,true)
t(a,"reloadtime",1.034,e)
if a.damage then
for t,o in pairs(a.damage)do
a.damage[t]=c(o,.954,e)
end
end
end
end
end
table.insert(d,
{h,"prefix","Cursed MK."..e.." "})
table.insert(d,
{h,"desc_prefix","Cursed Mk."..e.." "})
elseif a>0 then
i.power=(i[r]+i[l]/60)*
(a+1)
if n then
n.rarity=tostring(a)
end
local e=f or{}
local b=e[2]or 1.01
local g=e[3]or 1.035
local v=e[4]or 1.025
local i=e[5]or 1.025
local y=e[6]or .935
local p=e[7]or 1.095
local w=e[8]or .957
t(o,"power",1.11,a)
t(o,"speed",g,a,true)
t(o,"maxacc",1.035,a)
t(o,"maxdec",1.035,a)
t(o,"turnrate",1.035,a)
t(o,"sightdistance",1.035,a)
t(o,"radardistance",1.05,a)
t(o,m,b,a,true)
t(o,"idleautoheal",1.01,a)
t(o,"energymake",1.15,a)
t(o,"extractsmetal",1.035,a)
t(o,"energyupkeep",1.15,a)
t(o,"tidalgenerator",1.15,a)
t(o,"windgenerator",1.35,a)
if o.windgenerator and not(n and n.energymultiplier)then
t(o,r,.987,a,true)
end
if o.tidalgenerator or o.windgenerator or o.builder==true or
(not o.speed and not o.weapondefs)then
t(o,r,.987,a,true)
t(o,l,.998,a,true)
t(o,"buildtime",.998,a)
t(o,"workertime",1.04,a,true)
t(o,"builddistance",1.04,a,true)
else
t(o,r,1.035,a,true)
t(o,l,1.04,a,true)
t(o,"buildtime",1.035,a)
t(o,"workertime",1.035,a,true)
t(o,"builddistance",1.035,a,true)
end
if n then
t(n,"energyconv_efficiency",1.075,a)
t(n,"energyconv_capacity",1.08,a,true)
t(n,"shield_power",1.15,a,true)
t(n,"shield_radius",1.05,a,true)
t(n,"energymultiplier",1.08,a,true)
end
if o.weapondefs then
for o,e in pairs(o.weapondefs)do
if e.interceptor==1 or e.targetable==1 then
t(e,"coverage",1.02,a,true)
if e.damage then
t(e.damage,"default",1.1,a)
end
t(e,"areaofeffect",1.06,a)
else
local o=e.customparams
if not e.reloadtime or e.reloadtime<.034 then
e.reloadtime=.034
end
if e.burstrate and e.burstrate<.034 then
e.burstrate=.034
end
if e.burst and e.burstrate then
if e.burst*e.burstrate>e.reloadtime then
e.reloadtime=e.burst*e.burstrate
end
end
if e.beamtime and e.beamtime>e.reloadtime then
e.reloadtime=e.beamtime
end
local r=false
if e.burstrate and e.burst and e.reloadtime then
local t=e.burstrate*e.burst
if t/e.reloadtime>=.98 or t>=e.reloadtime then
r=true
end
end
local d=false
if e.beamtime and e.reloadtime then
if e.beamtime/e.reloadtime>=.9 or e.beamtime>=e.reloadtime then
d=true
end
end
t(e,"reloadtime",y,a)
t(e,"burstrate",y,a)
t(e,"areaofeffect",p,a)
t(e,"weaponvelocity",1.05,a)
t(e,"range",i,a,true)
t(e,"flighttime",1.05,a)
t(e,"sprayangle",w,a)
t(e,"accuracy",w,a)
t(e,"energypershot",1.05,a,true)
t(e,"metalpershot",1.035,a,true)
t(e,"stockpiletime",.96,a,true)
t(e,"startvelocity",1.035,a)
t(e,"turnrate",1.023,a)
t(e,"weaponacceleration",1.035,a)
t(e,"laserflaresize",1.034,a)
t(e,"size",1.075,a)
t(e,"thickness",1.05,a)
if o then
t(o,"overrange_distance",i,a,true)
t(o,"controlradius",i,a,true)
t(o,"engagementrange",i,a,true)
local e=tonumber(o.spark_range)
if e then
o.spark_range=tostring(c(e,1.05,a,true))
end
t(o,"area_onhit_damage",1.045,a,true)
t(o,"area_onhit_range",1.045,a,true)
end
if e.damage then
local t=1
local r=0
local i=e.reloadtime or 1
local n=e.beamtime or 0
local s=e.burstrate or 1
local d=e.burst or 1
if i<.034 then
t=t+.034/i-1
e.reloadtime=.034
i=.034
end
if(o and o.sweepfire)or h=="armbeamer"then
e.reloadtime=e.reloadtime or i
i=e.reloadtime
end
if n>i then
t=t+n/i-1
e.reloadtime=n
i=n
end
if s<.034 then
t=t+.034/s-1
e.burstrate=.034
s=.034
end
local o=s*d
if e.burstrate and e.burst and o>i then
t=t+o/i-1
e.reloadtime=o
end
for o,i in pairs(e.damage)do
if o=="commanders"then
e.damage[o]=c(i,1.012+r,a,false,
t)
else
e.damage[o]=c(i,v+r,a,false,
t)
end
end
end
local o=e.shield
if o then
t(o,"power",1.1,a,true)
t(o,"powerregen",1.1,a,true)
t(o,"radius",1.05,a,true)
t(o,"force",1.05,a)
t(o,"powerregenenergy",.99,a,true)
end
if r then
e.reloadtime=e.burst*e.burstrate
end
if d then
e.reloadtime=e.beamtime
end
end
end
end
if u then
for e,t in pairs(u[2])do
o[e]=t
end
local e=u[3]
s(o,m,e.hp,true)
s(o,"speed",e.spd,true)
s(o,"turnrate",e.turnrate)
s(o,"maxacc",e.maxacc)
s(o,"idleautoheal",e.autoheal)
if n then
s(n,"shield_power",e.shield_power,true)
s(n,"shield_radius",e.shield_radius,true)
end
if o.weapondefs then
for a,t in pairs(o.weapondefs)do
if t.interceptor~=1 and t.targetable~=1 then
s(t,"areaofeffect",e.aoe,true)
s(t,"range",e.rng,true)
s(t,"reloadtime",e.rld)
s(t,"energypershot",e.energypershot)
s(t,"sprayangle",e.acc)
s(t,"accuracy",e.acc)
if e.dmg and t.damage then
for a,o in pairs(t.damage)do
t.damage[a]=o*e.dmg
end
end
if e.impf then t.impulsefactor=e.impf end
if e.impb then t.impulseboost=e.impb end
if e.fs then t.firestarter=e.fs end
if e.wob then t.wobble=e.wob end
if e.dnc then t.dance=e.dnc end
end
end
end
end
local t=f and" "..f[1]or""
local e=u and" "..u[1]or""
table.insert(d,
{h,"prefix","MK."..a.." "..e..t.." "})
table.insert(d,
{h,"desc_prefix","Mk."..a})
else
table.insert(d,
{h,"prefix","MK."..a})
table.insert(d,
{h,"desc_prefix","Mk."..a})
end
i[r]=i[r]*y[w]
i[l]=i[l]*y[w]
end
Spring.Echo("tweakdefs_rename_get_ready")
for t,e in pairs(d)do
Spring.Echo("/("..e[E].."/-"..e[T].."/-"..e[z].."/)")
end
Spring.Echo("tweakdefs_rename_end")

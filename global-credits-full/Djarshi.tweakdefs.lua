--BaRandom v29 by LoH
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.75;local c=7;local d=0.2;local e=0.5;local f=5;local g={0,0,0}local h={28,28,28}local i=0.034;local j=0.90;local k=0.98;local l=6;local m={armcom=true,corcom=true,legcom=true}local n={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75}local o={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50}local p={["Glass Cannon"]={{"Phantom",n,{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}}},["Sniper"]={{"Phantom",n,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}}},["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}}},["Watchtower"]={{"Phantom",o,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3}},{"Berserker",{},{dmg=1.3,aoe=1.3}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}}}}local function q(r)local r=r or 0;if r+1<=#a and math.random()<b then r=q(r+1)end;return r end;local function s(t)local u=q(t)if u<t then u=t end;return u end;local function v(r,w,u,x,y)r=tonumber(r)if r then local z=r*w^u+(w-1)*r;if r>0 and z<=0 then z=r*w^u end;if x then z=math.floor(z)end;return z*(y or 1)end end;local function A(z,B,w,u,x)z[B]=v(z[B],w,u,x)end;local function C(z,B,w,x)local D=tonumber(z[B])if w and D then z[B]=D*w;if x then z[B]=math.floor(z[B])end end end;local function E(F)return F:byte()==99 and 2 or F:byte()==108 and 3 or 1 end;local G={{"Glass Cannon",0.88,1.05,1.12,1.05,0.91,1.05,0.96},{"Tank",1.22,1.0,1.01,1.04,0.97,1.04,0.97},{"Sniper",1.03,1.04,1.0,1.14,0.98,0.95,0.91},{"Brawler",1.06,1.10,1.05,1.0,0.88,1.10,0.97}}local H={{"Fortress",1.20,1.0,1.08,1.04,0.97,1.04,0.97},{"Watchtower",1.03,1.0,1.05,1.14,0.98,0.95,0.91},{"Suppressor",1.06,1.0,1.04,1.0,0.88,1.12,0.97}}local I={{"armthund","armkam"},{"armpw","armrock","armham","armwar","armflea"},{"armmlv","armfav","armflash","armpincer","armstump","armart","armjanus"},{"armdecade","armpt","armpship","armroy","armsub"},{"armsh","armanac","armmh"},{"armsaber","armsb","armseap"},{"armbrawl","armpnix","armlance","armdfly","armblade","armstil","armliche"},{"armfast","armamph","armzeus","armmav","armsptk","armfido","armsnipe","armfboy","armspid","armvader","armscab"},{"armcroc","armlatnk","armbull","armgremlin","armmart","armmerl","armmanni"},{"armcrus","armsubk","armserp","armantiship","armbats","armmship","armepoch","armlship"},{"armbanth","armraz","armmar","armvang","armlun","armthor"},{"corshad","corbw"},{"corak","corstorm","corthud"},{"cormlv","corfav","corgator","corgarp","corraid","corlevlr","corwolv"},{"coresupp","corpt","corpship","corroy","corsub"},{"corsh","corsnap","cormh","corhal"},{"corcut","corsb","corseap"},{"corape","corhurc","cortitan","corcrwh"},{"corpyro","coramph","corcan","corsumo","cortermite","cormort","corhrk","corroach","corsktl","cormando"},{"corsala","correap","corparrow","corgol","corban","cormart","corvroc","cortrem"},{"corcrus","corshark","corssub","corantiship","corbats","cormship","corblackhy","corfship"},{"corkorg","corkarg","corjugg","corshiva","corcat","corsok","cordemon"},{"legkam","legcib","legmos"},{"leggob","leglob","legcen","legbal","legkark"},{"legscout","leghades","leghelios","leggat","legbar","legmlv","legamphtank"},{"legnavyscout","legnavyfrigate","legnavydestro","legnavysub","legnavyartyship"},{"legsh","legner","legmh","legcar"},{"legspsurfacegunship","legspcarrier","legspbomber","legsptorpgunship"},{"legstronghold","legmineb","legatorpbomber","legfort","legphoenix"},{"legstr","legamph","legshot","leginc","legsrail","legbart","leginfestor","leghrk","legsnapper"},{"legmrv","legaskirmtank","legfloat","legaheattank","legmed","legamcluster","legvcarry","legavroc","leginf"},{"leganavycruiser","leganavyheavysub","leganavybattlesub","leganavybattleship","leganavyartyship","leganavymissileship","leganavyflagship","leganavyantiswarm"},{"legeheatraymech","legeallterrainmech","legjav","legelrpcmech","legehovertank","legerailtank","legeshotgunmech","legkeres"}}local J={}local K={}for L,M in ipairs(I)do local N={}for L,O in ipairs(M)do if not K[O]then N[#N+1]=O end end;if#N==0 then N=M end;local P=N[math.random(#N)]local Q=E(P)local u=s(math.max(c,g[Q]))if u>h[Q]then u=h[Q]end;J[P]=u;K[P]=true end;local R={}for S,T in pairs(UnitDefs)do if not J[S]and(T.speed or T.weapondefs and next(T.weapondefs)~=nil or T.builder==true)then local U=T.weapondefs and T.builder~=true;if U and math.random()<d then local V=q()if V<1 then V=1 end;R[S]=V;J[S]=0 else local u=q()local Q=E(S)if u<g[Q]then u=g[Q]end;if u>h[Q]then u=h[Q]end;J[S]=u end end end;local W={}for S,T in pairs(UnitDefs)do local u=J[S]or 0;if u>=5 and T.weapondefs then if T.speed then W[S]=G[math.random(#G)]elseif T.builder~=true then W[S]=H[math.random(#H)]end end end;local X={}for S,T in pairs(UnitDefs)do local u=J[S]or 0;local Y=W[S]if u>=f and Y then local Z=p[Y[1]]if Z and math.random()<e then X[S]=Z[math.random(#Z)]end end end;local function _(T,V,a0,a1,a2)local a3=T.customparams;if a3 then a3.cursed=tostring(V)end;A(T,a2,0.93,V,true)A(T,"speed",0.97,V,true)A(T,"maxacc",0.97,V)A(T,"turnrate",0.97,V)A(T,"sightdistance",0.97,V)A(T,"radardistance",0.97,V)A(T,a0,0.85,V,true)A(T,a1,0.85,V,true)A(T,"buildtime",0.88,V)if T.weapondefs then for L,a4 in pairs(T.weapondefs)do if a4.interceptor~=1 and a4.targetable~=1 then A(a4,"range",0.97,V,true)A(a4,"reloadtime",1.04,V)if a4.damage then for B,D in pairs(a4.damage)do a4.damage[B]=v(D,0.94,V)end end end end end end;local function a5(T,a6,Y,a0,a1,a2)local a3=T.customparams;local a7=Y and Y[2]or 1.1;local a8=Y and Y[3]or 1.05;if a3 then a3.rarity=tostring(a6)end;A(T,"power",1.2,a6)A(T,"speed",a8,a6,true)A(T,"maxacc",1.05,a6)A(T,"maxdec",1.05,a6)A(T,"turnrate",1.05,a6)A(T,"sightdistance",1.05,a6)A(T,"radardistance",1.1,a6)A(T,a2,a7,a6,true)A(T,"idleautoheal",1.1,a6)A(T,"energymake",1.04,a6)A(T,"extractsmetal",1.1,a6)A(T,"energyupkeep",1.04,a6)A(T,"tidalgenerator",1.04,a6)A(T,"windgenerator",1.04,a6)if T.builder==true then A(T,a0,0.97,a6,true)A(T,a1,0.98,a6,true)A(T,"buildtime",0.98,a6)A(T,"workertime",1.05,a6,true)A(T,"builddistance",1.05,a6,true)else A(T,a0,1.035,a6,true)A(T,a1,1.04,a6,true)A(T,"buildtime",1.05,a6)A(T,"workertime",1.05,a6,true)A(T,"builddistance",1.05,a6,true)end;if a3 then A(a3,"energyconv_efficiency",1.04,a6)A(a3,"energyconv_capacity",1.04,a6,true)A(a3,"shield_power",1.1,a6,true)A(a3,"shield_radius",1.05,a6,true)A(a3,"energymultiplier",1.04,a6,true)end end;local function a9(S,T,a6,Y)local aa=Y and Y[4]or 1.05;local ab=Y and Y[5]or 1.05;local ac=Y and Y[6]or 0.95;local ad=Y and Y[7]or 1.05;local ae=Y and Y[8]or 0.97;if not T.weapondefs then return end;for L,a4 in pairs(T.weapondefs)do if a4.interceptor==1 or a4.targetable==1 then A(a4,"coverage",1.02,a6,true)A(a4.damage,"default",1.1,a6)A(a4,"areaofeffect",1.01,a6)else local af=a4.customparams;if not a4.reloadtime or a4.reloadtime<i then a4.reloadtime=i end;if a4.burstrate and a4.burstrate<i then a4.burstrate=i end;if a4.burst and a4.burstrate then if a4.burst*a4.burstrate>a4.reloadtime then a4.reloadtime=a4.burst*a4.burstrate end end;if a4.beamtime then if a4.beamtime>a4.reloadtime then a4.reloadtime=a4.beamtime end end;local ag=false;if a4.burstrate and a4.burst and a4.reloadtime then local ah=a4.burstrate*a4.burst;if ah/a4.reloadtime>=k or ah>=a4.reloadtime then ag=true end end;local ai=false;if a4.beamtime and a4.reloadtime then if a4.beamtime/a4.reloadtime>=j or a4.beamtime>=a4.reloadtime then ai=true end end;A(a4,"reloadtime",ac,a6)A(a4,"burstrate",ac,a6)A(a4,"areaofeffect",ad,a6)A(a4,"weaponvelocity",1.05,a6)A(a4,"range",ab,a6,true)A(a4,"flighttime",1.05,a6)A(a4,"sprayangle",ae,a6)A(a4,"accuracy",ae,a6)A(a4,"energypershot",1.1,a6,true)A(a4,"metalpershot",1.05,a6,true)A(a4,"stockpiletime",0.96,a6,true)A(a4,"startvelocity",1.05,a6)A(a4,"turnrate",1.03,a6)A(a4,"weaponacceleration",1.05,a6)A(a4,"laserflaresize",1.04,a6)A(a4,"size",1.09,a6)A(a4,"thickness",1.06,a6)if af then A(af,"overrange_distance",ab,a6,true)A(af,"controlradius",ab,a6,true)A(af,"engagementrange",ab,a6,true)local aj=tonumber(af.spark_range)if aj then af.spark_range=tostring(v(aj,1.05,a6,true))end;A(af,"area_onhit_damage",1.05,a6,true)A(af,"area_onhit_range",1.05,a6,true)end;if a4.damage then local ak=1;local al=a4.reloadtime or 1;local am=a4.beamtime or 0;local an=a4.burstrate or 1;local ao=a4.burst or 1;if al<i then ak=ak+i/al-1;a4.reloadtime=i;al=i end;local ap=af and af.sweepfire;if ap or S=="armbeamer"then a4.reloadtime=a4.reloadtime or al;al=a4.reloadtime end;if am>al then ak=ak+am/al-1;a4.reloadtime=am;al=am end;if an<i then ak=ak+i/an-1;a4.burstrate=i;an=i end;local ah=an*ao;if a4.burstrate and a4.burst and ah>al then ak=ak+ah/al-1;a4.reloadtime=ah end;for B,D in pairs(a4.damage)do if B=="commanders"then a4.damage[B]=v(D,1.02,a6,false,ak)else a4.damage[B]=v(D,aa,a6,false,ak)end end end;local aq=a4.shield;if aq then A(aq,"power",1.1,a6,true)A(aq,"powerregen",1.1,a6,true)A(aq,"radius",1.05,a6,true)A(aq,"force",1.05,a6)A(aq,"powerregenenergy",0.99,a6,true)end;if ag then a4.reloadtime=a4.burst*a4.burstrate end;if ai then a4.reloadtime=a4.beamtime end end end end;local function ar(T,as,a2)local a3=T.customparams;for B,D in pairs(as[2])do T[B]=D end;local at=as[3]C(T,a2,at.hp,true)C(T,"speed",at.spd,true)C(T,"turnrate",at.turnrate)C(T,"maxacc",at.maxacc)C(T,"idleautoheal",at.autoheal)if a3 then C(a3,"shield_power",at.shield_power,true)C(a3,"shield_radius",at.shield_radius,true)end;if T.weapondefs then for L,a4 in pairs(T.weapondefs)do if a4.interceptor~=1 and a4.targetable~=1 then C(a4,"areaofeffect",at.aoe,true)C(a4,"range",at.rng,true)C(a4,"reloadtime",at.rld)C(a4,"energypershot",at.energypershot)C(a4,"sprayangle",at.acc)C(a4,"accuracy",at.acc)if at.dmg and a4.damage then for B,D in pairs(a4.damage)do a4.damage[B]=D*at.dmg end end;if at.impf then a4.impulsefactor=at.impf end;if at.impb then a4.impulseboost=at.impb end;if at.fs then a4.firestarter=at.fs end;if at.wob then a4.wobble=at.wob end;if at.dnc then a4.dance=at.dnc end end end end end;local function au(S,av,Y,as,V)if not S then return end;if V then table.insert(rename_list,{S,"prefix","[Cursed Mk."..V.."]"})table.insert(rename_list,{S,"desc_prefix","Cursed Mk."..V.." "})elseif av>0 then local aw=Y and" "..Y[1]or""local ax=as and" "..as[1]or""table.insert(rename_list,{S,"prefix","["..a[av]..ax..aw.."]"})table.insert(rename_list,{S,"desc_prefix","Mk."..av.."   "})else table.insert(rename_list,{S,"prefix","[Common]"})table.insert(rename_list,{S,"desc_prefix","Mk."..av.." "})end end;for S,T in pairs(UnitDefs)do if T.speed or T.weapondefs and next(T.weapondefs)~=nil or T.builder==true then local av=J[S]or 0;local a0=T.metalcost and"metalcost"or"buildcostmetal"local a1=T.energycost and"energycost"or"buildcostenergy"local a2=T.health and"health"or"maxdamage"if not T.power then T.power=T[a0]+T[a1]/60 end;local ay=av;if av>#a then av=#a end;if av>l and m[S]then av=l end;local V=R[S]local Y=W[S]local as=X[S]if V then _(T,V,a0,a1,a2)elseif ay>0 then a5(T,av,Y,a0,a1,a2)a9(S,T,av,Y)if as then ar(T,as,a2)end end;au(S,av,Y,as,V)end end;Spring.Echo("tweakdefs_rename_get_ready")for az,aA in pairs(rename_list)do Spring.Echo("/("..aA[1].."/-"..aA[2].."/-"..aA[3].."/)")end;Spring.Echo("tweakdefs_rename_end")--BaRandom Buildings v28 by LoH
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.75;local c=0.5;local d=5;local e={0,0,0}local f={28,28,28}local function g(h)local h=h or 0;if h+1<=#a and math.random()<b then h=g(h+1)end;return h end;local function i(h,j,k,l,m)h=tonumber(h)if h then local n=h*j^k+(j-1)*h;if h>0 and n<=0 then n=h*j^k end;if l then n=math.floor(n)end;return n*(m or 1)end end;local function o(n,p,j,k,l)n[p]=i(n[p],j,k,l)end;local function q(n,p,j,l)local r=tonumber(n[p])if j and r then n[p]=r*j;if l then n[p]=math.floor(n[p])end end end;local function s(t)return t:byte()==99 and 2 or t:byte()==108 and 3 or 1 end;local function u(v)if v.extractsmetal and v.extractsmetal>0 then return"mex"end;local w=v.customparams;if w and w.energyconv_capacity then return"converter"end;if v.windgenerator or v.tidalgenerator then return"windtidal"end;if v.radardistancejam and v.radardistancejam>0 then return"jammer"end;if v.radardistance and v.radardistance>0 then return"radar"end;if v.sonardistance and v.sonardistance>0 then return"sonar"end;if v.buildoptions then return"factory"end;if v.builder==true then return"nano"end;local x=v.metalstorage or 0;local y=v.energystorage or 0;if x>500 or y>500 then return"storage"end;if v.energymake and v.energymake>0 then return"energy"end;return"generic"end;local z={{"Efficient",0.9,0.8,1.15,0.9},{"Fortified",1.5,1.1,1.0,1.0},{"Overclocked",0.8,1.0,1.4,1.3}}local A={armmex="armmoho",cormex="cormoho",legmex="legmext15"}local B={armsolar="armadvsol",corsolar="coradvsol",legsolar="legadvsol"}local C={mex={{"Deep Bore",{em=1.5,bt=1.3}},{"Volatile Vein",{em=1.3,death=true}},{"Metamorphic",{evo="mex"}}},energy={{"Surge",{out=1.6,death=true}},{"Efficient Core",{mc=0.7,out=1.2}},{"Metamorphic",{evo="energy"}}},windtidal={{"Gale Force",{out=1.8,hp=0.7}},{"Anchored",{hp=1.5,out=1.2,mc=0.8}}},converter={{"Refined Process",{eff=1.3,cap=1.2}},{"Bulk Conversion",{cap=2.0,eff=0.9}}},radar={{"All-Seeing",{rd=2,los=2}},{"Shroud",{jam=0.5}},{"Resilient",{hp=3,pz=0.3}}},sonar={{"Deep Scan",{sd=2,los=1.5}},{"Resilient",{hp=3,pz=0.3}}},jammer={{"Blackout",{jd=1.8,upk=1.4}},{"Stealth Field",{jd=1.3,hp=1.5,upk=0.9}}},factory={{"Rush Order",{wt=1.4,upk=1.5}},{"Long Arm",{bd=1.8,los=1.3}},{"Bunker",{hp=2.5,los=1.5}}},storage={{"Vault",{stor=3,hp=1.5}},{"Volatile Reserve",{stor=2,death=true}}},nano={{"Precision",{bd=1.8,wt=1.2}},{"Frenzy",{wt=2,hp=0.6}},{"Fortified Builder",{hp=2,bd=1.3,wt=0.9}}}}local function D(v)local E=v.weapondefs and next(v.weapondefs)~=nil;return not v.speed and not E and v.builder~=true end;local F={}for G,v in pairs(UnitDefs)do if D(v)then local k=g()local H=s(G)if k<e[H]then k=e[H]end;if k>f[H]then k=f[H]end;F[G]=k end end;local I={}local J={}for G,v in pairs(UnitDefs)do local k=F[G]or 0;if k>=d and D(v)then I[G]=z[math.random(#z)]local K=u(v)local L=C[K]if L and math.random()<c then local M=L[math.random(#L)]local N=M[2]if N.evo then local w=v.customparams;local O=w and tonumber(w.techlevel)or 1;local P=N.evo=="mex"and A or B;if O>1 or not P[G]then M=nil end end;if M then J[G]=M end end end end;for G,v in pairs(UnitDefs)do if D(v)then local k=F[G]or 0;if k>#a then k=#a end;if k<=0 then if G then table.insert(rename_list,{G,"prefix","[Common]"})table.insert(rename_list,{G,"desc_prefix","Mk.0 "})end else local Q=v.metalcost and"metalcost"or"buildcostmetal"local R=v.energycost and"energycost"or"buildcostenergy"local S=v.health and"health"or"maxdamage"local w=v.customparams;if w then w.rarity=tostring(k)end;if not v.power then v.power=v[Q]+v[R]/60 end;o(v,"power",1.2,k)o(v,S,1.1,k,true)o(v,"sightdistance",1.05,k)o(v,"radardistance",1.1,k)o(v,"idleautoheal",1.1,k)o(v,"energymake",1.04,k)o(v,"extractsmetal",1.1,k)o(v,"energyupkeep",1.04,k)o(v,"tidalgenerator",1.04,k)o(v,"windgenerator",1.04,k)if v.windgenerator and(not w or not w.energymultiplier)then o(v,Q,0.97,k,true)end;o(v,Q,0.97,k,true)o(v,R,0.98,k,true)o(v,"buildtime",0.98,k)o(v,"workertime",1.05,k,true)o(v,"builddistance",1.05,k,true)if w then o(w,"energyconv_efficiency",1.04,k)o(w,"energyconv_capacity",1.04,k,true)o(w,"shield_power",1.1,k,true)o(w,"shield_radius",1.05,k,true)o(w,"energymultiplier",1.04,k,true)end;local T=I[G]if T then local K=u(v)q(v,S,T[2],true)q(v,Q,T[3],true)q(v,R,T[3],true)q(v,"energyupkeep",T[5])local U=T[4]if K=="mex"then q(v,"extractsmetal",U)elseif K=="energy"then q(v,"energymake",U)elseif K=="windtidal"then q(v,"windgenerator",U)q(v,"tidalgenerator",U)elseif K=="radar"then q(v,"radardistance",U,true)elseif K=="sonar"then q(v,"sonardistance",U,true)elseif K=="jammer"then q(v,"radardistancejam",U,true)elseif K=="factory"or K=="nano"then q(v,"workertime",U,true)elseif K=="converter"and w then q(w,"energyconv_capacity",U,true)elseif K=="storage"then q(v,"metalstorage",U,true)q(v,"energystorage",U,true)end end;local M=J[G]if M then local N=M[2]if N.hp then q(v,S,N.hp,true)end;if N.mc then q(v,Q,N.mc,true)end;if N.bt then q(v,"buildtime",N.bt)end;if N.em then q(v,"extractsmetal",N.em)end;if N.out then local K=u(v)if K=="mex"then q(v,"extractsmetal",N.out)elseif K=="energy"then q(v,"energymake",N.out)elseif K=="windtidal"then q(v,"windgenerator",N.out)q(v,"tidalgenerator",N.out)end end;if N.rd then q(v,"radardistance",N.rd,true)end;if N.sd then q(v,"sonardistance",N.sd,true)end;if N.jd then q(v,"radardistancejam",N.jd,true)end;if N.los then q(v,"sightdistance",N.los,true)end;if N.wt then q(v,"workertime",N.wt,true)end;if N.bd then q(v,"builddistance",N.bd,true)end;if N.upk then q(v,"energyupkeep",N.upk)end;if N.stor then q(v,"metalstorage",N.stor,true)q(v,"energystorage",N.stor,true)end;if N.eff and w then q(w,"energyconv_efficiency",N.eff)end;if N.cap and w then q(w,"energyconv_capacity",N.cap,true)end;if N.pz and w then w.paralyzemultiplier=tostring(N.pz)end;if N.jam then local V=v.radardistance or 0;v.radardistancejam=math.floor(V*N.jam)end;if N.death then if w then local W=tonumber(v[S])or 1000;w.area_ondeath_damage=tostring(math.floor(W*0.5))w.area_ondeath_range="200"w.area_ondeath_time="3"end end;if N.evo and w then local P=N.evo=="mex"and A or B;local X=P[G]if X then w.evolution_target=X;w.evolution_condition="timer"w.evolution_timer="300"end end end;if G then local Y=T and" "..T[1]or""local Z=M and" "..M[1]or""table.insert(rename_list,{G,"prefix","["..a[k]..Z..Y.."]"})table.insert(rename_list,{G,"desc_prefix","Mk."..k.."   "})end end end end;Spring.Echo("tweakdefs_rename_get_ready")for _,a0 in pairs(rename_list)do Spring.Echo("/("..a0[1].."/-"..a0[2].."/-"..a0[3].."/)")end;Spring.Echo("tweakdefs_rename_end")--Extra Towers (Zop)
local uDefs = UnitDefs or {}
local mods = Spring.GetModOptions()
local cps = 'customparams'
local fds = 'featuredefs'
local wds = 'weapondefs'
local wpn = 'weapons'
local aACons = {'armaca','armack','armacv'}
local cACons = {'coraca','corack','coracv'}
local lACons = {'legaca','legack','legacv'}

local hasScavs = mods.scavunitsforplayers

local tweakMini = true
local tweakQuadLT = true
local tweakLegEpic = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function addBOArr(conIDs, id)
	for i = 1, #conIDs do
		addBO(conIDs[i], id)
	end
end

local function mergeRec(def, ref)
	table.mergeInPlace(def, ref, true)
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de','es'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

--Mini plasma as 'Cerberus' alternatives.
if hasScavs and tweakMini then
	local rangeMul = 1.25
	local epsMul = 0.5
	local aWDef = uDefs['armminivulc'][wds]['armminivulc_weapon']
	local cWDef = uDefs['corminibuzz'][wds]['corminibuzz_weapon']
	local lWDef = uDefs['legministarfall'][wds]['starfire']
	aWDef.range = round10(aWDef.range * rangeMul)
	cWDef.range = round10(cWDef.range * rangeMul)
	lWDef.range = round10(lWDef.range * rangeMul)
	local eps = 'energypershot'
	aWDef[eps] = aWDef[eps] * epsMul
	cWDef[eps] = cWDef[eps] * epsMul
	lWDef[eps] = lWDef[eps] * epsMul
end

--Quad towers.
if hasScavs and tweakQuadLT then
	local aLT = 'armhllllt'
	local cLT = 'corhllllt'
	local lLT = 'leghllllt'
	local cDef = uDefs[cLT]
	uDefs[aLT] = table.copy(cDef)
	local aDef = uDefs[aLT]
	uDefs[lLT] = table.copy(cDef)
	local lDef = uDefs[lLT]
	for i = 1, 4 do
		local aWDef = aDef[wds]['hllt_'..i]
		local cWDef = cDef[wds]['hllt_'..i]
		local lWDef = lDef[wds]['hllt_'..i]
		local dps = cWDef.damage.default / cWDef.reloadtime
		--Arm
		mergeRec(aWDef, uDefs['armbeamer'][wds]['armbeamer_weapon'])
		aWDef.range = round10(aWDef.range * 1.2)
		aWDef.reloadtime = aWDef.reloadtime + 0.075
		aWDef.beamtime = aWDef.reloadtime
		aWDef.thickness = aWDef.thickness - ((i - 1) * 0.5)
		local aMul = dps / (aWDef.damage.default / aWDef.reloadtime)
		aWDef.damage.default = math.floor(aWDef.damage.default * aMul)
		aWDef.damage.vtol = math.floor(aWDef.damage.vtol * aMul)
		aWDef.damage.commanders = nil
		aDef[wpn][i]['fastautoretargeting'] = true
		--Cor
		cWDef.range = round10(cWDef.range * 1.25)
		cWDef.damage.commanders = nil
		--Leg
		mergeRec(lWDef, uDefs['legmg'][wds]['armmg_weapon'])
		lWDef.reloadtime = lWDef.reloadtime + ((i - 1) * (1 / lWDef.burst))
		lWDef.burst = lWDef.burst + (i - 1)
		local lMul = dps / (lWDef.damage.default / (lWDef.reloadtime / lWDef.burst))
		lWDef.damage.default = math.floor(lWDef.damage.default * lMul)
		lWDef.damage.commanders = nil
		lDef[wpn][i]['fastautoretargeting'] = true
		--Scatter Targets
		local btc = 'badtargetcategory'
		if i == 1 or i == 2 then
			aDef[wpn][i][btc] = "VTOL GROUNDSCOUT"
			cDef[wpn][i][btc] = aDef[wpn][i][btc]
			lDef[wpn][i][btc] = aDef[wpn][i][btc]
		end
		local pxp = 'proximitypriority'
		if i == 1 or i == 3 then
			aWDef[pxp] = 1
			cWDef[pxp] = 1
			lWDef[pxp] = 1
		end
	end
	setDesc(aDef, 'Quad Beamer', 'Heavy Beam Laser Turret')
	setDesc(lDef, 'Quad Cacophony', 'Heavy Machine Gun Turret')
	aDef.icontype = cLT
	lDef.icontype = cLT
	addBOArr(aACons, aLT)
	addBOArr(lACons, lLT)
end

--Legion epic defense.
if hasScavs then
	local cT4 = 'cordoomt3'
	local lT4 = 'legdoomt3'
	local cEvos = {'corcomlvl8', 'corcomlvl9', 'corcomlvl10'}
	local lEvos = {'legcomlvl8', 'legcomlvl9', 'legcomlvl10'}
	if tweakLegEpic then
		uDefs[lT4] = table.copy(uDefs[cT4])
		local def = uDefs[lT4]
		local wDef1 = def[wds]['armagmheat']
		local wDef2 = def[wds]['armageddon_blue_laser']
		local wDef3 = def[wds]['armageddon_green_laser']
		mergeRec(wDef1, uDefs['legsrailt4'][wds]['railgunt2'])
		wDef1.reloadtime = wDef1.reloadtime * 2
		wDef1.duration = 0.05
		wDef1.cegtag = 'railgun'
		wDef1.rgbcolor2 = '1 1 1'
		wDef1.areaofeffect = 100
		wDef1.edgeeffectiveness = 0.7
		wDef1.impactonly = nil;
		wDef1.collidefriendly = false
		wDef1.stockpile = false
		wDef1.stockpilelimit = 0
		wDef1.thickness = 5
		wDef1.weaponvelocity = wDef1.weaponvelocity * 2.5
		mergeRec(wDef2, uDefs['legerailtank'][wds]['t3_rail_accelerator'])
		wDef2.duration = 0.05
		wDef2.burst = 3
		wDef2.burstrate = 0.25
		wDef2.thickness = 2
		mergeRec(wDef3, uDefs['legdtr'][wds]['corlevlr_weapon'])
		wDef3.reloadtime = wDef3.reloadtime * 0.375
		wDef3.impulsefactor = wDef3.impulsefactor * 2
		wDef3.proximitypriority = 1
		wDef3.rgbcolor = '1 0.8 0'
		setDesc(def, 'Trident', 'Super Heavy Railgun Defense')
		def.icontype = cT4
		addBOArr(lACons, lT4)
		addBOArr(lEvos, lT4)
	else
		addBOArr(lACons, cT4)
		addBOArr(lEvos, cT4)
	end
	addBOArr(cEvos, cT4)
end--T3 Nano Turrets (Zop)
--Concept by Djarshi / Txpera
local mods = Spring.GetModOptions()
local uDefs = UnitDefs or {}
local cps = 'customparams'
local aACons = {'armaca','armack','armacv','armacsub'}
local cACons = {'coraca','corack','coracv','coracsub'}
local lACons = {'legaca','legack','legacv'}

local noSea = mods.map_waterislava

local tweakT3Nano = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function extrapolate(t1, t2)
	return round10(t2 * (t2 / t1))
end

local function unwater(id)
	local def = UnitDefs[id]
	if def then
		def.minwaterdepth = -1000000
		def.maxwaterdepth = 0
	end
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function addBOArr(conIDs, id)
	for i = 1, #conIDs do
		addBO(conIDs[i], id)
	end
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

--Extrapolate nano turret stats.
if tweakT3Nano and not uDefs['armnanotct3'] then
	local footMul = 1.25
	local at1Def = uDefs['armnanotc']
	local at2Def = uDefs['armnanotct2']
	if at1Def and at2Def then
		local ex = 'hugeBuildingExplosionGeneric'
		local override = {
			icontype = 'armrespawn',
			metalcost = extrapolate(at1Def.metalcost, at2Def.metalcost) * footMul,
			energycost = extrapolate(at1Def.energycost, at2Def.energycost) * footMul,
			buildtime = extrapolate(at1Def.buildtime, at2Def.buildtime) * footMul,
			workertime = extrapolate(at1Def.workertime, at2Def.workertime) * footMul,
			builddistance = extrapolate(at1Def.builddistance, at2Def.builddistance),
			sightdistance = extrapolate(at1Def.sightdistance, at2Def.sightdistance),
			health = extrapolate(at1Def.health, at2Def.health),
			maxwaterdepth = 1000000,
			minwaterdepth = -1000000,
			explodeas = ex,
			selfdestructas = ex..'Selfd',
			customparams = {
				techlevel = 3
			}
		}
		local at3 = 'armnanotct3'
		local ct3 = 'cornanotct3'
		local lt3 = 'legnanotct3'
		uDefs[at3] = table.merge(uDefs['armrespawn'], override)
		uDefs[ct3] = table.merge(uDefs['correspawn'], override)
		uDefs[lt3] = table.merge(uDefs['legnanotcbase'], override)
		local at3Def = uDefs[at3]
		local ct3Def = uDefs[ct3]
		local lt3Def = uDefs[lt3]
		if noSea then
			unwater(at3)
			unwater(ct3)
			unwater(lt3)
		end
		local t3Name = 'Epic Construction Turret'
		local t3Desc = 'Assist & Repair in massive radius. (OP by djarshi)'
		setDesc(at3Def, t3Name, t3Desc)
		setDesc(ct3Def, t3Name, t3Desc)
		setDesc(lt3Def, t3Name, t3Desc)
		addBOArr(aACons, at3)
		addBOArr(cACons, ct3)
		addBOArr(lACons, lt3)
	end
end--T3 Bubble Geo (Zop)
--Concept by Djarshi / Txpera
local mods = Spring.GetModOptions()
local uDefs = UnitDefs or {}
local cps = 'customparams'
local fds = 'featuredefs'
local wds = 'weapondefs'
local wpn = 'weapons'
local aACons = {'armaca','armack','armacv','armacsub'}
local cACons = {'coraca','corack','coracv','coracsub'}
local lACons = {'legaca','legack','legacv'}

local noSea = mods.map_waterislava

local tweakT3Geo = true

local function round10(n)
	return math.floor(n * 0.1) * 10
end

local function extrapolate(t1, t2)
	return round10(t2 * (t2 / t1))
end

local function mulTier(t1Def, t2Def, t3Def, stat)
	if t1Def and t2Def and t3Def then
		t3Def[stat] = extrapolate(t1Def[stat], t2Def[stat])
	end
end

local function unwater(id)
	local def = UnitDefs[id]
	if def then
		def.minwaterdepth = -1000000
		def.maxwaterdepth = 0
	end
end

local function addBO(conID, id)
	local cDef = UnitDefs[conID]
	local uDef = UnitDefs[id]
	if cDef and uDef and not cDef.buildoptions[id] then
		table.insert(cDef.buildoptions, id)
	end
end

local function addBOArr(conIDs, id)
	for i = 1, #conIDs do
		addBO(conIDs[i], id)
	end
end

local function remodel(def, name, hasDead, hasDecal)
	if def then
		def.buildpic = name..'.DDS'
		def.objectname = 'Units/'..name..'.s3o'
		def.script = 'Units/'..name..'.cob'
		if hasDead then
			def[fds].dead.object = 'Units/'..string.lower(name)..'_dead.s3o'
		end
		if hasDecal then
			def[cps].buildinggrounddecaltype = 'decals/'..string.lower(name)..'_aoplane.dds'
		end
	end
end

local function setDesc(def, name, tip)
	local latin = {'en','fr','de'}
	if def then
		for i = 1, #latin do
			if name then
				def[cps]['i18n_'..latin[i]..'_humanname'] = name
			end
			if tip then
				def[cps]['i18n_'..latin[i]..'_tooltip'] = tip
			end
		end
	end
end

local function mulGeoTier(t1, t2, t3)
	mulTier(t1, t2, t3, 'metalcost')
	mulTier(t1, t2, t3, 'energycost')
	mulTier(t1, t2, t3, 'buildtime')
	mulTier(t1, t2, t3, 'energymake')
	mulTier(t1, t2, t3, 'energystorage')
	mulTier(t1, t2, t3, 'health')
end

local function mergeShield(def, ref)
	if def and ref then
		def[wds] = table.merge(def[wds], ref[wds])
		def[wpn] = table.merge(def[wpn], ref[wpn])
		def[cps]['shield_color_mult'] = ref[cps].shield_color_mult
		def[cps]['shield_power'] = ref[cps].shield_power
		def[cps]['shield_radius'] = ref[cps].shield_radius
	end
end

--Extrapolate geo stats.
if tweakT3Geo and not uDefs['armageot3'] then
	local at2Def = uDefs['armageo']
	local ct2Def = uDefs['corageo']
	local lt2Def = uDefs['legageo']
	--T3
	local override = {
		icontype = 'armageo',
		canattack = false,
		canrepeat = false,
		maxwaterdepth = 1000000,
		minwaterdepth = -1000000,
		explodeas = 'advancedFusionExplosionSelfd',
		selfdestructas = 'ScavComBossExplo',
		customparams = {
			techlevel = 3
		},
		weapondefs = {},
		weapons = {}
	}
	local at3 = 'armageot3'
	local ct3 = 'corageot3'
	local lt3 = 'legageot3'
	uDefs[at3] = table.merge(at2Def, override)
	uDefs[ct3] = table.merge(ct2Def, override)
	uDefs[lt3] = table.merge(lt2Def, override)
	local at3Def = uDefs[at3]
	local ct3Def = uDefs[ct3]
	local lt3Def = uDefs[lt3]
	if noSea then
		unwater(at3)
		unwater(ct3)
		unwater(lt3)
	end
	local t3Name = 'Epic Geothermal Powerplant'
	local t3DescP = 'Produces '
	local t3DescS = ' Energy (Extremely Hazardous) (OP by djarshi)'
	--Arm
	mulGeoTier(uDefs['armgeo'], at2Def, at3Def)
	mergeShield(at3Def, uDefs['armgatet3'])
	setDesc(at3Def, t3Name, t3DescP..at3Def.energymake..t3DescS)
	remodel(at3Def, 'ARMUWAGEO', false, false)
	addBOArr(aACons, at3)
	--Cor
	mulGeoTier(uDefs['corgeo'], ct2Def, ct3Def)
	mergeShield(ct3Def, uDefs['corgatet3'])
	setDesc(ct3Def, t3Name, t3DescP..ct3Def.energymake..t3DescS)
	remodel(ct3Def, 'CORUWAGEO', false, false)
	addBOArr(cACons, ct3)
	--Leg
	mulGeoTier(uDefs['leggeo'], lt2Def, lt3Def)
	mergeShield(lt3Def, uDefs['leggatet3'])
	setDesc(lt3Def, t3Name, t3DescP..lt3Def.energymake..t3DescS)
	remodel(lt3Def, 'legrampart', false, false)
	addBOArr(lACons, lt3)
	--T2
	local ym = 'h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc'
	at2Def.yardmap = ym
	ct2Def.yardmap = ym
	lt2Def.yardmap = ym
	uDefs['armuwageo'].yardmap = ym
	uDefs['coruwageo'].yardmap = ym
	--Space Mod
	addBO('armoc', at3)
	addBO('coroc', ct3)
	addBO('legoc', lt3)
end
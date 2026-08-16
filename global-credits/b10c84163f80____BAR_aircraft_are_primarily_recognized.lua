-- BAR aircraft are primarily recognized by copied aircraft unitdef fields + VTOL category.
 -- We copy real aircraft/transport definitions first, then only make sure key air flags survived.
 u.canfly=true
 u.canFly=true
 u.category=addcat(u.category,"VTOL")
 u.category=addcat(u.category,"NOTSUB")
 u.customparams=u.customparams or{}
 u.customparams.unitgroup="air"
 u.customparams.subfolder="Air"
 u.customparams.skor_air_class=true
end


local function bomb(payload,model)return{areaofeffect=1,avoidfeature=false,collidefriendly=false,craterboost=0,cratermult=0,edgeeffectiveness=.65,explosiongenerator="custom:dirtpopup",gravityaffected="true",impulsefactor=0,model=model,mygravity=.07,name="Paradrop Spawn Bomb",noselfdamage=true,range=650,reloadtime=5,soundhitdry="xplodragconcrete",soundhitwet="splsmed",soundstart="bombrel",sprayangle=300,weapontype="AircraftBomb",customparams={bogus=1,spawns_name=payload,spawns_surface="LAND"},damage={default=1}}end
local function drop(id,lab,base,pay,n,d)local b=U[base];local p=U[pay];if not b or not p then return end;local u=cp(b);u.unitname=id;meta(u,n,d,"Air");u.canattack=true;u.canfight=true;u.canload=false;u.canunload=false;u.hoverattack=false;u.attackrunlength=220;local model=p.objectname or p.objectName or"Units/ARMPW.s3o";u.weapondefs={dt_paradrop_spawn=bomb(pay,model)};u.weapons={{def="DT_PARADROP_SPAWN",onlytargetcategory="NOTSUB",badtargetcategory="VTOL"}};markAir(u);U[id]=u;add(lab,id)end
drop("dt_arm_dropbomber","armap","armthund","armpw","Armada Pawn Drop Bomber","Paradrop bomber. Drops Pawns by parachute.")
drop("dt_cor_dropbomber","corap","corshad","corak","Cortex Grunt Drop Bomber","Paradrop bomber. Drops Grunts by parachute.")
drop("dt_leg_dropbomber","legap","armthund","leglob","Legion Satyr Drop Bomber","Paradrop bomber. Drops Satyrs by parachute.")
local pb=U.dt_arm_dropbomber;if pb and type(pb.speed)=="number"then pb.speed=math.max(1,pb.speed-10)end
local function t2transport(advLab,exact,fallback)local e=exact and U[exact];if e then return e,exact end;local best=nil;local bestname=nil;local score=-1;local L=U[advLab];if L and L.buildoptions then for _,un in pairs(L.buildoptions)do local c=U[un];local t=low(un.." "..(c and c.name or"").." "..(c and c.humanname or"").." "..(c and c.description or"").." "..(c and c.tooltip or""));if c and t:find("transport",1,true)then local s=(c.metalcost or 0);if t:find("heavy",1,true)then s=s+5000 end;if t:find("advanced",1,true)then s=s+3000 end;if s>score then best=c;bestname=un;score=s end end end end;return best or U[fallback],bestname or fallback end
local function markTransportable(id)local u=U[id];if not u then return end;u.cantbetransported=false;u.cantBeTransported=false;u.canbetransported=true;u.canBeTransported=true;u.transportbyenemy=false;u.transportByEnemy=false;u.transportSize=1;u.transportsize=1;u.transportMass=math.min(u.transportMass or u.mass or 50000,50000);u.transportmass=u.transportMass;u.mass=u.transportMass;u.canattack=true;u.canAttack=true;u.canfight=true;u.canFight=true;u.firestate=2;u.fireState=2;u.customparams=u.customparams or{};u.customparams.notransport=nil;u.customparams.not_transportable=nil;u.customparams.untransportable=nil;u.customparams.cantbetransported=nil;u.customparams.cant_be_transported=nil;u.customparams.transportable=true;u.customparams.canbetransported=true;u.customparams.skor_can_fire_from_transport=true;u.customparams.fire_from_transport=true end
local function allowT3Transport()local labs={"armshltx","corgant","leggant","armgantry","corgantry","leggantry"};for _,lab in ipairs(labs)do local L=U[lab];if L and L.buildoptions then for _,un in pairs(L.buildoptions)do markTransportable(un)end end end;for n,u in pairs(U)do local t=low(n.." "..(u.name or"").." "..(u.humanname or"").." "..(u.description or"").." "..(u.tooltip or""));if t:find("experimental",1,true)or t:find("t3",1,true)or t:find("gantry",1,true)or t:find("razor",1,true)then markTransportable(n)end end end
local function fireT(id,lab,base,advLab,exact,fallback,n)local donor,src=t2transport(advLab,exact,fallback);donor=donor or U[base];if not donor then return end;local u=cp(donor);u.unitname=id;meta(u,n,"Expensive T1 fire-platform transport using a heavy/T2 transport visual. Can carry T3-sized units and lets transported units fire.","Air");u.metalcost=750;u.energycost=math.max(u.energycost or 0,18000);u.buildtime=math.max(u.buildtime or 0,18000);u.health=1600;u.canload=true;u.canunload=true;u.transportcapacity=math.max(u.transportcapacity or 0,1);u.transportCapacity=u.transportcapacity;u.transportcapacity=math.max(u.transportcapacity or u.transportCapacity or 0,4);u.transportCapacity=u.transportcapacity;u.transportsize=math.max(u.transportsize or u.transportSize or 0,99999);u.transportSize=u.transportsize;u.transportmass=math.max(u.transportmass or u.transportMass or 0,99999999);u.transportMass=u.transportmass;u.loadingradius=math.max(u.loadingradius or 0,260);u.unloadspread=math.max(u.unloadspread or 0,100);u.transportunloadmethod=0;u.transportUnloadMethod=0;u.isfireplatform=true;u.isFirePlatform=true;u.fireplatform=true;u.firePlatform=true;u.canattack=true;u.canAttack=true;u.canfight=true;u.canFight=true;u.holdsteady=true;u.holdSteady=true;u.releaseheld=true;u.releaseHeld=true;u.customparams.skor_transport_note="Fire platform enabled. T3 pickup allowed by high transportsize/transportmass and by clearing target unit notransport flags. Passenger firing still depends on carried unit script support.";u.customparams.skor_visual_source=src or exact or fallback;u.customparams.isfireplatform=true;u.customparams.fireplatform=true;markAir(u);U[id]=u;add(lab,id)end
allowT3Transport()
fireT("dt_arm_firetransport","armap","armatlas","armaap","armdfly","armhvytrans","Armada Fire Platform Transport")
fireT("dt_cor_firetransport","corap","corvalk","coraap","corseah","corhvytrans","Cortex Fire Platform Transport")
fireT("dt_leg_firetransport","legap","armatlas","legaap",nil,"armatlas","Legion Fire Platform Transport")


local function setCustomAirHealthCustom()
 local vals={dt_arm_dropbomber=70,dt_cor_dropbomber=140,dt_leg_dropbomber=140,dt_arm_firetransport=140,dt_cor_firetransport=140,dt_leg_firetransport=140}
 for id,hp in pairs(vals)do local u=U[id];if u then u.health=hp;u.maxdamage=nil;u.maxDamage=nil end end
 local pb=U.dt_arm_dropbomber
 if pb and pb.weapondefs and pb.weapondefs.dt_paradrop_spawn then
  local w=pb.weapondefs.dt_paradrop_spawn
  w.energypershot=500
  w.energyPerShot=500
  w.customparams=w.customparams or{}
  w.customparams.energycost=500
  w.customparams.energy_per_drop=500
 end
end
setCustomAirHealthCustom()
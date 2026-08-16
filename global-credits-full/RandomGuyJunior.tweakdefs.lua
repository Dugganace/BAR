-- Space Expansion V2.9
local a={}function SET(b)a=table.copy(UnitDefs[b])end;function ADD(c)UnitDefs[c]=a end;function CP()a.customparams={}end;function MC(d)a.metalcost=d end;function EC(d)a.energycost=d end;function BT(d)a.buildtime=d end;function FX(d)a.footprintx=d end;function FZ(d)a.footprintz=d end;function HP(d)a.health=d end;function SD(d)a.sightdistance=d end;function TECH(d)a.customparams.techlevel=d end;function NAME(d)a.customparams.i18n_en_humanname=d end;function DESC(d)a.customparams.i18n_en_tooltip=d end;function IAHP(d)a.idleautoheal=d end;function IT(d)a.idletime=d end;function REP(d)a.repairspeed=d end;function AHP(d)a.autoheal=d end;function CR(d)a.crushresistance=d end;function ICT(d)a.icontype=d.."_scav"end;function WT(d)a.workertime=d end;function MWD(d)a.minwaterdepth=d end;function B(d)a.blocking=d end;function BD(d)a.builddistance=d end;function EM(d)a.energymake=d end;function RS(d)a.removestop=d end;function RW(d)a.removewait=d end;function ON(d)a.onoffable=d end;function S(d)a.script=d end;function ES(d)a.energystorage=d end;function MS(d)a.metalstorage=d end;function SEID(d)a.seismicdistance=d end;function RDJ(d)a.radardistancejam=d end;function SP(d)a.speed=d end;function ASD(d)a.airsightdistance=d end;function RD(d)a.radardistance=d end;function RA(d)a.radiusadjust=d end;function UG(d)a.customparams.unitgroup=d end;function ONAME(d)a.objectname=d end;function BPIC(d)a.buildpic=d end;function BUILDER(d)a.builder=d end;function AS(d)a.airStrafe=d end;function C(d)a.collide=d end;function BOPTION(d)a.buildoptions=d end;function BNOPTION()a.buildoptions={}end;function MOVE(d)a.canmove=d end;function UP(d)a.upright=d end;function CF(d)a.canfight=d end;function TR(d)a.turnrate=d end;function NOASD()a.customparams.attacksafetydistance=nil end;function EXP(d)a.explodeas=d end;function SELF(d)a.selfdestructas=d end;function WATER()a.floater=true;a.maxwaterdepth=1000;a.waterline=0 end;function SPACE(d)a.corpse=""a.customparams.crashable=0;a.radardistance=0;a.sightdistance=0;a.reclaimable=false;a.repairable=true;a.canmove=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=8;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=true;a.customparams.restrictions_exclusion="_nosea_noair_"a.customparams.armordef="space"a.maxacc=0.5;a.maxdec=0.5 end;function SPACES(d)a.customparams.crashable=0;a.customparams.armordef="space"a.radardistance=0;a.reclaimable=true;a.repairable=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=14;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=false;a.airstrafe=false;a.turnrate=0;a.canmove=false;a.maxacc=0.2;a.canfight=false;a.canguard=false;a.canPatrol=false;a.maxdec=0;a.upright=true;a.speed=0.1;a.sonardistance=0;a.customparams.restrictions_exclusion="_nosea_noair_"a.blocking=true end;function SOLBALANCE(e,f,g,h,i,j)a.metalcost=(UnitDefs[e].metalcost/UnitDefs[e].energymake+UnitDefs[f].metalcost/UnitDefs[f].energymake+UnitDefs[g].metalcost/UnitDefs[g].energymake)/3*500*h;a.energycost=(UnitDefs[e].energycost/UnitDefs[e].energymake+UnitDefs[f].energycost/UnitDefs[f].energymake+UnitDefs[g].energycost/UnitDefs[g].energymake)/3*500*i;a.buildtime=(UnitDefs[e].buildtime/UnitDefs[e].energymake+UnitDefs[f].buildtime/UnitDefs[f].energymake+UnitDefs[g].buildtime/UnitDefs[g].energymake)/3*500*j end;function FACBALANCE(e,f,g,h,i,j)a.metalcost=(UnitDefs[e].metalcost/UnitDefs[e].workertime+UnitDefs[f].metalcost/UnitDefs[f].workertime+UnitDefs[g].metalcost/UnitDefs[g].workertime)/3*600*h;a.energycost=(UnitDefs[e].energycost/UnitDefs[e].workertime+UnitDefs[f].energycost/UnitDefs[f].workertime+UnitDefs[g].energycost/UnitDefs[g].workertime)/3*600*i;a.buildtime=(UnitDefs[e].buildtime/UnitDefs[e].workertime+UnitDefs[f].buildtime/UnitDefs[f].workertime+UnitDefs[g].buildtime/UnitDefs[g].workertime)/3*600*j end;SET("armrespawn")NAME("Epic Construction Turret")DESC("Enormous Assist & Repair in a short Radius")BD(200)SD(500)EM(50)B(true)WT(10000)REP(5000)EC(200000)MC(10000)BT(200000)MWD(-1000)ADD("armnanotc3")SET("correspawn")NAME("Epic Construction Turret")DESC("Enormous Assist & Repair in a short Radius")BD(200)SD(500)EM(50)B(true)WT(10000)REP(5000)EC(200000)MC(10000)BT(200000)MWD(-1000)ADD("cornanotc3")SET("legnanotcbase")NAME("Epic Construction Turret")DESC("Enormous Assist & Repair in a short Radius")BD(200)SD(500)EM(50)B(true)WT(10000)REP(5000)EC(200000)MC(10000)BT(200000)MWD(-1000)ADD("legnanotc3")SET("armsat")SPACE(2100)NAME("Sky Eye")DESC("Long-Range Radar Satellite")MC(200)EC(10000)BT(10000)HP(500)SP(110)ASD(1300)SD(1100)RD(2300)ICT("armeyes")RA(2)ADD("armosat")SET("corsfig")SPACE(2100)BPIC("ARMSABER.DDS")ONAME("Units/ARMSABER.s3o")S("Units/ARMSABER.cob")MC(130)EC(3000)BT(4000)HP(275)SP(200)ASD(700)NAME("Blaster")DESC("Orbital Fighter")UG("weapon")ICT("armhawk")RA(2.3)TR(720)SD(200)ADD("armofighter")SET("armmls")BNOPTION()SPACE(2000)MC(600)EC(13000)BT(15000)HP(600)SP(60)BUILDER(true)WT(200)BD(200)ASD(500)SD(200)EM(30)NAME("Advanced Orbital Constructor")DESC("Tech 2 Constructor")UG("buildert2")ICT("armaca")RA(2.5)a.reclaimSpeed=50;ADD("armoc")SET("armhawk")SPACE(2000)TR(180)MC(500)EC(6000)BT(8000)HP(500)SP(70)SD(350)ASD(600)NAME("Peacemaker")DESC("Orbital Bomber")a.nochasecategory="VTOL"UG("weapon")ICT("armbrtha")RA(2.5)NOASD()ADD("armocan")SET("armaap")NAME("Space Factory")DESC("Tech 2 Orbital Units")FACBALANCE("armaap","coraap","legaap",1.05,1.1,1)WT(600)ICT("armaap")HP(4000)BNOPTION()WATER()ADD("armspace")SET("armemp")BPIC("scavengers/armemp.DDS")ASD(1600)MC(3000)EC(60000)BT(50000)HP(3000)SD(600)NAME("Maestro")DESC("Anti-Orbit Missile Launcher")UG("weapon")a.canrepeat=false;WATER()ADD("armorocket")SET("armsubk")SPACE(2030)MC(700)EC(20000)BT(25000)HP(2600)SP(90)ASD(1000)SD(300)NAME("Lion")DESC("Laser Assault Spaceship")UG("weapon")ICT("armbrawl")RA(2.4)ADD("armobruiser")SET("armlship")SPACE(2060)AS(false)UP(true)MC(900)EC(30000)BT(30000)HP(1500)SP(70)ASD(1600)SD(300)NAME("Accelerator")DESC("Tachyon Accelerator Spaceship")UG("weapon")ICT("armanni")RA(2.8)ADD("armotachyon")SET("armdronecarry")SPACE(2000)MC(8000)EC(80000)BT(90000)HP(20000)SP(70)ASD(1400)SD(500)NAME("Kaiser")DESC("Orbital Drone Carrier Battleship")UG("weapon")TECH(3)ICT("armtrident")RA(2)AS(false)UP(true)RD(1200)a.sonardistance=0;ADD("armokaiser")SET("armdrone")SPACE(2000)MC(25)EC(600)BT(1200)HP(500)SP(200)ASD(800)NAME("Kaiser Drone")DESC("Rocket drone capable of attacking aircraft and spaceships.")UG("weapon")ICT("armdrone")ADD("armodrone")SET("armdl")BPIC("scavengers/armdl.DDS")SPACES(2000)ASD(1300)MC(800)EC(9000)BT(20000)HP(3000)SD(300)NAME("Penguin")DESC("Orbital Laser Defense")UG("weapon")TECH(1)ICT("armhlt")WATER()ADD("armolaser")SET("armfepocht4")SPACE(2000)MC(70000)EC(900000)BT(400000)HP(70000)SP(50)SD(1000)ASD(1500)UG("weapon")NAME("Iron Sky")DESC("Experimental Orbital Carpet Artillery")a.customparams.paralyzemultiplier=0;ICT("armvulc")EXP("fusionExplosion")SELF("ScavComBossExplo")a.customparams.crashable=1;a.corpse="DEAD"ADD("armoliberator")SET("legaap")NAME("Space Factory")DESC("Tech 2 Orbital Units")TECH(2)FACBALANCE("armaap","coraap","legaap",1.05,1.1,1)WT(600)ICT("legaap")HP(4000)BNOPTION()WATER()ADD("legspace")SET("armptt2")BPIC("scavengers/armptt2.DDS")SPACES(2000)RD(0)ASD(1500)MC(1500)EC(20000)BT(33000)HP(4000)SD(600)NAME("Kraken")DESC("Area Control and Anti-Ground Orbital Defense")UG("weapon")ICT("armhlt")RA(2)ADD("armomulti")SET("corfdoom")BPIC("scavengers/corfdoom.DDS")SPACES(2000)ASD(1500)MC(1600)EC(21000)BT(36000)HP(4000)SD(600)NAME("Cardinal")DESC("Area Control and Anti-Ground Orbital Defense")UG("weapon")ICT("corfdoom")ADD("coromulti")SET("leganavaldefturret")SPACES(2000)ASD(1500)MC(1500)EC(21000)BT(32000)HP(4000)SD(800)NAME("Aeon")DESC("Area Control and Anti-Ground Orbital Defense")UG("weapon")ICT("leganavaldefturret")ADD("legomulti")SET("armapt3")NAME("Experimental Space Factory")DESC("Tech 3 Orbital Units")TECH(3)BNOPTION()ICT("armapt3")WATER()ADD("armspacet3")SET("corapt3")NAME("Experimental Space Factory")DESC("Tech 3 Orbital Units")TECH(3)BNOPTION()ICT("corapt3")WATER()ADD("corspacet3")SET("legapt3")NAME("Experimental Space Factory")DESC("Tech 3 Orbital Units")TECH(3)BNOPTION()ICT("legapt3")WATER()ADD("legspacet3")SET("coraap")TECH(2)NAME("Space Factory")DESC("Tech 2 Orbital Units")FACBALANCE("armaap","coraap","legaap",1.05,1.1,1)WT(600)ICT("coraap")HP(4000)BNOPTION()WATER()ADD("corspace")SET("corsat")SPACE(2100)NAME("Observer")DESC("Long-Range Radar Satellite")MC(200)EC(10000)BT(10000)HP(500)SP(110)ASD(1000)SD(1100)RD(2300)ICT("coreyes")RA(2)ADD("corosat")SET("corsfig")SPACE(2100)MC(140)EC(3000)BT(4000)HP(280)SP(200)ASD(700)NAME("Zealot")DESC("Orbital Fighter")UG("weapon")ICT("corvamp")RA(2.8)TR(720)SD(200)ADD("corofighter")SET("correcl")BNOPTION()SPACE(2000)a.canassist=true;a.canresurrect=false;MC(600)EC(9000)BT(15000)HP(500)SP(60)BUILDER(true)WT(200)BD(200)ASD(500)SD(200)EM(30)NAME("Advanced Orbital Constructor")DESC("Tech 2 Constructor")UG("buildert2")ICT("coraca")TECH(2)RA(2.5)a.reclaimSpeed=50;ADD("coroc")SET("corvamp")SPACE(2000)TR(180)MC(550)EC(6660)BT(9000)HP(550)SP(70)SD(350)ASD(500)NAME("Bombard")DESC("Orbital Bomber")UG("weapon")ICT("corint")RA(2.5)NOASD()ADD("corocan")SET("corshark")SPACE(2030)MC(650)EC(22000)BT(24000)HP(2200)SP(85)ASD(1000)SD(300)NAME("Inquisitor")DESC("Medium Range Missile Assault Spaceship")UG("weapon")ICT("corape")RA(2.4)ADD("corobruiser")SET("corssub")SPACE(2060)MC(1100)EC(50000)BT(40000)HP(4000)SP(65)ASD(1300)SD(300)NAME("Punisher")DESC("Armored Long Range Laser Spaceship")UG("weapon")ICT("corcrwh")a.stealth=false;ADD("coroheavy")SET("legsolar")SPACE(2000)SOLBALANCE("corfus","armfus","legfus",1.03,1.2,1.2)HP(3000)SP(10)ASD(500)EM(480)ES(1500)NAME("Orbital Solar Collector")DESC("Produces 500 Energy")UG("energy")ICT("legadvsol")RA(2)EXP("fusionExplosion")SELF("fusionExplosionSelfd")ADD("legosolar")SET("corsolar")ONAME("Units/CORADVSOL.s3o")BPIC("CORADVSOL.DDS")S("Units/CORADVSOL.cob")SPACE(2000)SOLBALANCE("corfus","armfus","legfus",1,1.2,1.2)HP(3000)SP(10)ASD(500)EM(480)ES(1500)NAME("Orbital Solar Collector")DESC("Produces 500 Energy")a.customparams.solar=true;UG("energy")ICT("coradvsol")RA(2)EXP("fusionExplosion")SELF("fusionExplosionSelfd")ADD("corosolar")SET("armsolar")SPACE(2000)SOLBALANCE("corfus","armfus","legfus",1.03,1.2,1.2)HP(3000)SP(10)ASD(500)EM(480)ES(1500)NAME("Orbital Solar Collector")DESC("Produces 500 Energy")UG("energy")ICT("coradvsol")RA(2)EXP("fusionExplosion")SELF("fusionExplosionSelfd")ADD("armosolar")local a={}function SET(b)a=table.copy(UnitDefs[b])end;function ADD(c)UnitDefs[c]=a end;function CP()a.customparams={}end;function MC(d)a.metalcost=d end;function EC(d)a.energycost=d end;function BT(d)a.buildtime=d end;function HP(d)a.health=d end;function SD(d)a.sightdistance=d end;function TECH(d)a.customparams.techlevel=d end;function NAME(d)a.customparams.i18n_en_humanname=d end;function DESC(d)a.customparams.i18n_en_tooltip=d end;function IAHP(d)a.idleautoheal=d end;function IT(d)a.idletime=d end;function AHP(d)a.autoheal=d end;function ICT(d)a.icontype=d.."_scav"end;function WT(d)a.workertime=d end;function MWD(d)a.minwaterdepth=d end;function B(d)a.blocking=d end;function BD(d)a.builddistance=d end;function EM(d)a.energymake=d end;function RS(d)a.removestop=d end;function RW(d)a.removewait=d end;function ON(d)a.onoffable=d end;function S(d)a.script=d end;function ES(d)a.energystorage=d end;function MS(d)a.metalstorage=d end;function SEID(d)a.seismicdistance=d end;function RDJ(d)a.radardistancejam=d end;function SP(d)a.speed=d end;function ASD(d)a.airsightdistance=d end;function RD(d)a.radardistance=d end;function RA(d)a.radiusadjust=d end;function TR(d)a.turnrate=d end;function UG(d)a.customparams.unitgroup=d end;function ONAME(d)a.objectname=d end;function BPIC(d)a.buildpic=d end;function BUILDER(d)a.builder=d end;function AS(d)a.airStrafe=d end;function C(d)a.collide=d end;function BOPTION(d)a.buildoptions=d end;function BNOPTION()a.buildoptions={}end;function UP(d)a.upright=d end;function NOASD()a.customparams.attacksafetydistance=nil end;function EXP(d)a.explodeas=d end;function SELF(d)a.selfdestructas=d end;function WATER()a.floater=true;a.waterline=0;a.maxwaterdepth=1000 end;function SPACE(d)a.corpse=""a.customparams.crashable=0;a.customparams.armordef="space"a.maxacc=0.5;a.maxdec=0.5;a.radardistance=0;a.sightdistance=0;a.reclaimable=false;a.repairable=true;a.canmove=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=8;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=true;a.customparams.restrictions_exclusion="_nosea_noair_"end;function SPACES(d)a.customparams.crashable=0;a.customparams.armordef="space"a.radardistance=0;a.reclaimable=true;a.repairable=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=14;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=false;a.airstrafe=false;a.turnrate=0;a.canmove=false;a.maxacc=0.2;a.canfight=false;a.canguard=false;a.canPatrol=false;a.maxdec=0;a.upright=true;a.speed=0.1;a.sonardistance=0;a.customparams.restrictions_exclusion="_nosea_noair_"a.blocking=true end;SET("armsat")SPACE(2100)BPIC("legwhisper.DDS")ONAME("Units/legwhisper.s3o")S("Units/legwhisper.cob")MC(200)EC(10000)BT(10000)HP(500)SP(70)ASD(1500)SD(1100)RA(2)RD(2300)ICT("legeyes")NAME("Lumen")DESC("Long-Range Radar Satellite")ADD("legosat")SET("legnavyrezsub")SPACE(2000)a.canassist=true;a.canresurrect=false;MC(600)EC(9000)BT(15000)HP(500)SP(60)BUILDER(true)WT(200)BD(200)ASD(500)SD(200)EM(30)NAME("Advanced Orbital Constructor")DESC("Tech 2 Constructor")UG("buildert2")ICT("legaca")RA(2.5)a.reclaimSpeed=50;ADD("legoc")SET("corsfig")ONAME("Units/legionnaire.s3o")BPIC("legionnaire.DDS")S("Units/legionnaire.cob")SPACE(2100)MC(127.5)EC(2600)BT(4000)HP(265)SP(215)ASD(700)NAME("Lykion")DESC("Orbital Fighter")UG("weapon")ICT("legionnaire")RA(2.8)TR(720)SD(200)ADD("legofighter")SET("legafigdef")SPACE(2000)MC(500)EC(6000)BT(8000)HP(500)SP(70)SD(400)ASD(500)NAME("Zeus")DESC("Orbital Lightning Bomber")UG("weapon")ICT("leglrpc")RA(2.5)NOASD()ADD("legocan")SET("legnavyscout")SPACE(2030)MC(720)EC(19000)BT(26000)HP(2900)SP(100)ASD(900)SD(300)NAME("Thaleon")DESC("Gatling Gun Assault Spaceship")UG("weapon")ICT("legvelite")RA(2.4)ADD("legobruiser")SET("legnavyfrigate")SPACE(2060)MC(900)EC(31000)BT(33000)HP(1100)SP(70)ASD(1400)SD(300)NAME("Trikeos")DESC("Seeker Missile Orbital Striker")UG("weapon")ICT("legacluster")RA(2)ADD("legotrigun")SET("legerailtank")SPACE(2000)MC(1000)EC(30000)BT(30000)HP(2000)SP(70)ASD(2000)SD(1000)NAME("Propheteus")DESC("Orbital Camera Deployer")UG("weapon")ICT("spy")RA(2.5)ADD("legospy")SET("legeyes")NAME("Argus")DESC("Orbital Deployed Camera with increased uncloaking range.")a.movementclass="HOVER2"a.mincloakdistance=50;a.icontype="legeyes"ADD("legoeyes")SET("legosat")SPACE(1850)BPIC("ARMSPID.DDS")ONAME("dbg_sphere_fullmetal.s3o")S("Units/ARMSILO.cob")MC(110000)EC(1500000)BT(1100000)HP(100000)SP(50)SD(1500)ASD(1500)NAME("Phaethon")DESC("Celestial Earth Scorcher")UG("weapon")ICT("defence_hllllt")RA(3)TR(160)TECH(3)UP(true)AS(false)SELF("ScavComBossExplo")EXP("korgExplosion")a.customparams.crashable=1;a.collisionvolumetype="sphere"a.corpse="DEAD"ADD("legohelios")SET("leglraa")ASD(1600)MC(3100)EC(60000)BT(50000)HP(3000)SD(600)NAME("Nostradamos")DESC("Anti-Orbit Railgun Defense")UG("weapon")ICT("leglraa")WATER()ADD("legocannon")SET("leglupara")SPACES(2000)ASD(1200)MC(780)EC(10000)BT(21000)HP(3000)SD(300)NAME("Pompeii")DESC("Orbital Beam Laser Defense")WATER()ADD("legolaser")SET("cordemon")DESC("Anti Orbital Flamethrower Mech")ADD("cordemon")UnitDefs["armoc"].buildoptions={[1]="armafus",[2]="armageo",[3]="armckfus",[4]="armfus",[5]="armuwageo",[6]="armgmm",[7]="armmoho",[8]="armmmkr",[9]="armuwadves",[10]="armuwadvms",[11]="armarad",[12]="armveil",[13]="armfort",[14]="armasp",[15]="armfasp",[16]="armtarg",[17]="armsd",[18]="armgate",[19]="armamb",[20]="armpb",[21]="armanni",[22]="armflak",[23]="armmercury",[24]="armemp",[25]="armamd",[26]="armsilo",[27]="armbrtha",[28]="armvulc",[29]="armdf",[30]="armshltx",[31]="armap",[32]="armspace",[33]="armap",[34]="armuwmme",[35]="armanavaldefturret",[36]="t3mmex"}UnitDefs["coroc"].buildoptions={[1]="corfus",[2]="corafus",[3]="corageo",[4]="coruwageo",[5]="corbhmth",[6]="cormoho",[7]="cormexp",[8]="cormmkr",[9]="coruwadves",[10]="coruwadvms",[11]="corarad",[12]="corshroud",[13]="corfort",[14]="corasp",[15]="corfasp",[16]="cortarg",[17]="corsd",[18]="corgate",[19]="cortoast",[20]="corvipe",[21]="cordoom",[22]="corflak",[23]="corscreamer",[24]="cortron",[25]="corfmd",[26]="corsilo",[27]="corint",[28]="corbuzz",[29]="corplat",[30]="corgant",[31]="corspace",[32]="corap",[33]="coruwmme",[34]="coranavaldefturret",[35]="t3mmex"}UnitDefs["legoc"].buildoptions={"legfus","legafus","legageo","leganavalmex","legrampart","legmoho","legadveconv","legadvestore","legamstor","legarad","legajam","legforti","legtarg","legsd","legdeflector","legacluster","legapopupdef","legbastion","legflak","leglraa","legperdition","legabm","legsilo","leglrpc","legstarfall","leggant","legspace","legap","leganavaltorpturret","leganavaldefturret","leganavalaaturret","t3mmex"}local e=Spring.GetModOptions()for c,f in pairs(UnitDefs)do local g=f.customparams;if f.buildoptions then if c=="armaca"or c=="armack"or c=="armacsub"or c=="armacv"or c=="armoc"then table.insert(f.buildoptions,"armnanotc3")table.insert(f.buildoptions,"armfirewall")table.insert(f.buildoptions,"armorocket")table.insert(f.buildoptions,"armomulti")table.insert(f.buildoptions,"armspacet3")elseif c=="coraca"or c=="corack"or c=="coracsub"or c=="coracv"or c=="coroc"then table.insert(f.buildoptions,"cornanotc3")table.insert(f.buildoptions,"cortyrant")table.insert(f.buildoptions,"corocannon")table.insert(f.buildoptions,"coromulti")table.insert(f.buildoptions,"corspacet3")elseif c=="legaca"or c=="legack"or c=="legacv"or c=="legoc"then table.insert(f.buildoptions,"legnanotc3")table.insert(f.buildoptions,"legparagon")table.insert(f.buildoptions,"legocannon")table.insert(f.buildoptions,"legomulti")table.insert(f.buildoptions,"legspacet3")end;if c=="armca"or c=="armcs"or c=="armcsa"or c=="armbeaver"or c=="armcv"or c=="armck"or c=="armch"then table.insert(f.buildoptions,"armspace")table.insert(f.buildoptions,"armolaser")table.insert(f.buildoptions,"armollt")elseif c=="corca"or c=="corcs"or c=="corcsa"or c=="corch"or c=="cormuskrat"or c=="corcv"or c=="corck"then table.insert(f.buildoptions,"corspace")table.insert(f.buildoptions,"cororocket")table.insert(f.buildoptions,"corollt")elseif c=="legca"or c=="legnavyconship"or c=="legotter"or c=="legch"or c=="legcv"or c=="legck"or c=="legspcon"then table.insert(f.buildoptions,"legspace")table.insert(f.buildoptions,"legolaser")table.insert(f.buildoptions,"legollt")end;if e.scavunitsforplayers then if c=="armoc"then table.insert(f.buildoptions,"armapt3")table.insert(f.buildoptions,"armminivulc")table.insert(f.buildoptions,"legmbotrail")table.insert(f.buildoptions,"armannit3")table.insert(f.buildoptions,"armafust3")table.insert(f.buildoptions,"armmmkrt3")elseif c=="coroc"then table.insert(f.buildoptions,"corapt3")table.insert(f.buildoptions,"corminibuzz")table.insert(f.buildoptions,"corhllllt")table.insert(f.buildoptions,"cordoomt3")table.insert(f.buildoptions,"corafust3")table.insert(f.buildoptions,"cormmkrt3")elseif c=="legoc"then table.insert(f.buildoptions,"legapt3")table.insert(f.buildoptions,"legministarfall")table.insert(f.buildoptions,"legafust3")table.insert(f.buildoptions,"legadveconvt3")end end;if e.experimentalextraunits then if c=="coroc"then table.insert(f.buildoptions,"corwint2")table.insert(f.buildoptions,"cornanotct2")table.insert(f.buildoptions,"cormwall")table.insert(f.buildoptions,"corgatet3")table.insert(f.buildoptions,"corfgate")table.insert(f.buildoptions,"cornanotc2plat")elseif c=="armoc"then table.insert(f.buildoptions,"armshockwave")table.insert(f.buildoptions,"armwint2")table.insert(f.buildoptions,"armnanotct2")table.insert(f.buildoptions,"armlwall")table.insert(f.buildoptions,"armgatet3")table.insert(f.buildoptions,"armfgate")table.insert(f.buildoptions,"armnanotc2plat")elseif c=="legoc"then table.insert(f.buildoptions,"legmohocon")table.insert(f.buildoptions,"legwint2")table.insert(f.buildoptions,"legnanotct2")table.insert(f.buildoptions,"legrwall")table.insert(f.buildoptions,"leggatet3")end end end endlocal a={}function SET(b)a=table.copy(UnitDefs[b])end;function ADD(c)UnitDefs[c]=a end;function CP()a.customparams={}end;function MC(d)a.metalcost=d end;function EC(d)a.energycost=d end;function BT(d)a.buildtime=d end;function HP(d)a.health=d end;function SD(d)a.sightdistance=d end;function TECH(d)a.customparams.techlevel=d end;function NAME(d)a.customparams.i18n_en_humanname=d end;function DESC(d)a.customparams.i18n_en_tooltip=d end;function IAHP(d)a.idleautoheal=d end;function IT(d)a.idletime=d end;function AHP(d)a.autoheal=d end;function ICT(d)a.icontype=d.."_scav"end;function WT(d)a.workertime=d end;function MWD(d)a.minwaterdepth=d end;function B(d)a.blocking=d end;function BD(d)a.builddistance=d end;function EM(d)a.energymake=d end;function RS(d)a.removestop=d end;function RW(d)a.removewait=d end;function ON(d)a.onoffable=d end;function S(d)a.script=d end;function ES(d)a.energystorage=d end;function MS(d)a.metalstorage=d end;function SEID(d)a.seismicdistance=d end;function RDJ(d)a.radardistancejam=d end;function SP(d)a.speed=d end;function ASD(d)a.airsightdistance=d end;function RD(d)a.radardistance=d end;function RA(d)a.radiusadjust=d end;function TR(d)a.turnrate=d end;function UG(d)a.customparams.unitgroup=d end;function ONAME(d)a.objectname=d end;function BPIC(d)a.buildpic=d end;function AS(d)a.airStrafe=d end;function BOPTION(d)a.buildoptions=d end;function BNOPTION()a.buildoptions={}end;function EXP(d)a.explodeas=d end;function SELF(d)a.selfdestructas=d end;function UP(d)a.upright=d end;function WATER()a.floater=true;a.waterline=0;a.maxwaterdepth=1000 end;function SPACE(d)a.corpse=""a.customparams.crashable=0;a.customparams.armordef="space"a.maxacc=0.5;a.maxdec=0.5;a.radardistance=0;a.sightdistance=0;a.reclaimable=false;a.repairable=true;a.canmove=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=8;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=true;a.customparams.restrictions_exclusion="_nosea_noair_"end;function SPACES(d)a.customparams.crashable=0;a.customparams.armordef="space"a.radardistance=0;a.reclaimable=true;a.repairable=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=14;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=false;a.airstrafe=false;a.turnrate=0;a.canmove=false;a.maxacc=0.2;a.canfight=false;a.canguard=false;a.canPatrol=false;a.maxdec=0;a.upright=true;a.speed=0.1;a.sonardistance=0;a.customparams.restrictions_exclusion="_nosea_noair_"a.blocking=true end;SET("coresuppt3")SPACE(2000)MC(14000)EC(100000)BT(160000)HP(36000)SP(65)ASD(1600)NAME("Maginot")DESC("Heavy Heatray Battleship")TECH(3)ICT("coresuppt3")AS(false)UP(true)ADD("coroheatray")SET("legfortt4")SPACE(2000)MC(12000)EC(130000)BT(120000)HP(30000)SP(70)ASD(1400)NAME("Longinus")DESC("Heavy Anti-Swarm Battleship")TECH(3)ICT("legfort")AS(false)UP(true)SELF("largeExplosionGenericSelfd")EXP("largeexplosiongeneric")ADD("legofort")SET("legstronghold")SPACE(2000)MC(3600)EC(70000)BT(85000)HP(5000)SP(60)SD(1050)ASD(1300)NAME("Athena")DESC("Cluster Plasma Orbital Bomber")UG("weapon")ICT("armliche")RA(2)TECH(3)a.transportcapacity=nil;a.transportsize=nil;ADD("legobomber")SET("corprince")SPACE(2000)MC(90000)EC(900000)BT(820000)HP(80000)SP(50)SD(1200)ASD(1600)NAME("Apocalypse")DESC("Meteor Rain Artillery")TECH(3)UG("weapon")ICT("corbuzz")a.firestate=0;TR(180)UP(true)AS(false)SELF("ScavComBossExplo")EXP("fusionExplosion")TECH(3)a.customparams.crashable=1;a.corpse="DEAD"ADD("coroapoc")SET("armserpt3")SPACE(2000)MC(2900)EC(72000)BT(74000)HP(5000)SP(60)SD(900)ASD(1200)NAME("Porcupine")DESC("Orbital Tumbleweed Cannon")UG("weapon")ICT("armvader")RA(2)a.inheritxpratemultiplier=1;a.childreninheritxp="BOTCANNON"a.parentsinheritxp="BOTCANNON"a.stealth=false;a.sonardistance=0;TECH(3)ADD("armobomber")SET("corhurc")SPACE(2100)MC(1000)EC(20000)BT(20000)HP(1300)SP(200)SD(400)ASD(1100)NAME("Hunter")DESC("Heavy Fighter")UG("weapon")ICT("corcrwh")RA(2)TR(720)TECH(3)ADD("corohunter")SET("armseadragon")SPACE(2000)MC(3500)EC(60000)BT(70000)HP(3000)SP(80)SD(1000)RD(2300)ASD(1300)NAME("Porter")DESC("Orbital Radar and Vanguard Deployment Spaceship. (55 m/s and 1.1k e/s)")UG("weapon")ICT("armseadragon")RA(2)TR(180)a.sonardistance=0;RW(false)TECH(3)ADD("armohorizon")SET("armseap")SPACE(1970)MC(200)EC(4000)BT(5000)HP(300)SP(200)SD(200)ASD(900)NAME("Aspirant")DESC("Low Orbit Fighter")UG("weapon")ICT("armseap")RA(2)TR(720)TECH(2)ADD("armoplane")SET("corveng")SPACE(1970)MC(200)EC(4000)BT(5000)HP(300)SP(200)SD(200)ASD(800)NAME("Locust")DESC("Low Orbit Fighter")UG("weapon")ICT("corseap")RA(2)TR(720)TECH(2)ADD("coroplane")SET("corcut")SPACE(1970)MC(200)EC(4000)BT(5000)HP(300)SP(205)SD(200)ASD(800)NAME("Koluma")DESC("Low Orbit Fighter")UG("weapon")ICT("corcut")RA(2)TR(720)TECH(2)ADD("legoplane")SET("corjuno")BPIC("scavengers/corjuno.DDS")ASD(1750)MC(3300)EC(60000)BT(50000)HP(3666)SD(600)NAME("Decimator")DESC("Anti-Orbital Unstable Plasma Defense")UG("weapon")a.stealthy=false;WATER()ADD("corocannon")UnitDefs["armaap"].buildoptions[11]="armoplane"UnitDefs["coraap"].buildoptions[9]="coroplane"UnitDefs["legaap"].buildoptions[10]="legoplane"SET("armbanth")a.weapondefs.bantha_rocket.customparams.overrange_distance=nil;a.weapondefs.bantha_rocket.collidefeature=false;a.weapondefs.bantha_rocket.damage.space=2100;a.weapondefs.tehlazerofdewm.cylindertargeting=50;a.weapondefs.tehlazerofdewm.heightmod=0.1;a.weapondefs.tehlazerofdewm.minintensity=0.5;a.weapons[2].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[3].onlytargetcategory="NOTSUB SPACENOTOBJECT"ADD("armbanth")SET("corkorg")a.weapondefs.corkorg_rocket.customparams.overrange_distance=nil;a.weapondefs.corkorg_rocket.collidefeature=false;a.weapondefs.corkorg_rocket.damage.space=2400;a.weapondefs.corkorg_laser.cylindertargeting=50;a.weapondefs.corkorg_laser.heightmod=0.1;a.weapondefs.corkorg_laser.minintensity=0.5;a.weapons[2].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[3].onlytargetcategory="NOTSUB SPACENOTOBJECT"ADD("corkorg")SET("legeheatraymech")a.weapons[1].onlytargetcategory="SURFACE SPACENOTOBJECT"a.weapons[1].badtargetcategory="SPACENOTOBJECT VTOL GROUNDSCOUT"a.weapons[2].onlytargetcategory="SURFACE SPACENOTOBJECT"a.weapons[2].badtargetcategory="SPACENOTOBJECT VTOL GROUNDSCOUT"a.weapons[3].onlytargetcategory="SURFACE SPACENOTOBJECT"a.weapons[3].badtargetcategory="SPACENOTOBJECT VTOL GROUNDSCOUT"a.weapondefs.heatray1.cylindertargeting=100;a.weapondefs.heatray1.minintensity=0.5;a.weapondefs.heatray1.damage.space=25;ADD("legeheatraymech")SET("corblackhy")a.weapondefs.ferret_missile.collidefeature=false;a.weapondefs.ferret_missile.damage.space=450;a.weapondefs.ferret_missile.flighttime=5;a.weapondefs.ferret_missile.burnblow=false;a.weapondefs.ferret_missile.range=1050;a.weapons[3].onlytargetcategory="VTOL SPACENOTOBJECT"a.weapons[6].onlytargetcategory="VTOL SPACENOTOBJECT"ADD("corblackhy")SET("armepoch")a.weapondefs.ferret_missile.collidefeature=false;a.weapondefs.ferret_missile.damage.space=450;a.weapondefs.ferret_missile.flighttime=5;a.weapondefs.ferret_missile.burnblow=false;a.weapondefs.ferret_missile.range=1050;a.weapons[6].onlytargetcategory="VTOL SPACENOTOBJECT"a.weapons[7].onlytargetcategory="VTOL SPACENOTOBJECT"ADD("armepoch")SET("corfblackhyt4")a.weapondefs.ferret_missile.collidefeature=false;a.weapondefs.ferret_missile.damage.space=1200;a.weapondefs.ferret_missile.flighttime=5;a.weapondefs.ferret_missile.burnblow=false;a.weapondefs.ferret_missile.range=1050;a.weapons[3].onlytargetcategory="VTOL SPACENOTOBJECT"a.weapons[6].onlytargetcategory="VTOL SPACENOTOBJECT"ADD("corfblackhyt4")SET("armfepocht4")a.weapondefs.ferret_missile.collidefeature=false;a.weapondefs.ferret_missile.damage.space=1200;a.weapondefs.ferret_missile.flighttime=5;a.weapondefs.ferret_missile.burnblow=false;a.weapondefs.ferret_missile.range=1050;a.weapons[6].onlytargetcategory="VTOL SPACENOTOBJECT"a.weapons[7].onlytargetcategory="VTOL SPACENOTOBJECT"ADD("armfepocht4")SET("legfortt4")a.weapondefs.aa_missiles.collidefeature=false;a.weapondefs.aa_missiles.damage.space=440;a.weapondefs.aa_missiles.burnblow=false;a.weapons[6].onlytargetcategory="VTOL SPACENOTOBJECT"a.category="T4AIR ALL WEAPON VTOL NOTSUB NOTHOVER",ADD("legfortt4")SET("legerailtank")DESC("Experimental Anti-Orbital Rail Accelerator Tank")a.weapons[1].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[2].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[3].onlytargetcategory="NOTSUB SPACENOTOBJECT"ADD("legerailtank")SET("cordemon")DESC("Flamethrower Mech with Anti-Orbital Missiles")a.weapons[2].onlytargetcategory="VTOL SPACENOTOBJECT"a.weapondefs.karg_shoulder.damage.space=360;a.weapondefs.karg_shoulder.flighttime=5;a.weapondefs.karg_shoulder.collidefeature=false;ADD("cordemon")SET("armraz")DESC("Anti Orbital Battle Mech")a.weapondefs.mech_rapidlaser.minintensity=0.3;a.weapondefs.mech_rapidlaser.accuracy=0;a.weapondefs.mech_rapidlaser.heightmod=0.1;a.weapondefs.mech_rapidlaser.cylindertargeting=100;a.weapondefs.mech_rapidlaser.damage.space=105;a.weapons[1].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[1].burstcontrolwhenoutofarc=nil;ADD("armraz")SET("legdrone")SD(200)SPACE(2100)MC(20)EC(1000)HP(300)a.weapondefs.semiauto.range=390;a.weapondefs.semiauto.sprayangle=0;a.weapondefs.semiauto.damage.space=24;a.weapondefs.semiauto.weaponvelocity=1200;a.weapons[1].maxangledif=360;a.weapons[1].onlytargetcategory="SPACENOTOBJECT"ADD("legodrone")SET("legvcarry")ASD(800)MC(500)EC(12000)BT(17000)HP(2500)NAME("Carrier")a.customparams.ignore_noair=true;DESC("Mobile Orbital Drone Vehicle (Drones cost 20m 1000E each)")a.weapondefs.targeting.customparams.carried_unit="legodrone"a.weapondefs.targeting.customparams.droneammo=0;a.weapons[1].onlytargetcategory="SPACENOTOBJECT"ADD("legov")SET("legov")ADD("armov")SET("legov")ADD("corov")SET("armbanth")DESC("Anti Orbital Assault Mech")ADD("armbanth")SET("corkorg")DESC("Experimental Anti Orbital Assault Bot")ADD("corkorg")SET("legeheatraymech")DESC("Experimental Anti Orbital Dual Heat-Ray/Riot Mech")ADD("legeheatraymech")local a={}function SET(b)a=table.copy(UnitDefs[b])end;function ADD(c)UnitDefs[c]=a end;function CP()a.customparams={}end;function MC(d)a.metalcost=d end;function EC(d)a.energycost=d end;function BT(d)a.buildtime=d end;function HP(d)a.health=d end;function SD(d)a.sightdistance=d end;function TECH(d)a.customparams.techlevel=d end;function NAME(d)a.customparams.i18n_en_humanname=d end;function DESC(d)a.customparams.i18n_en_tooltip=d end;function IAHP(d)a.idleautoheal=d end;function IT(d)a.idletime=d end;function AHP(d)a.autoheal=d end;function ICT(d)a.icontype=d.."_scav"end;function WT(d)a.workertime=d end;function MWD(d)a.minwaterdepth=d end;function B(d)a.blocking=d end;function BD(d)a.builddistance=d end;function EM(d)a.energymake=d end;function RS(d)a.removestop=d end;function RW(d)a.removewait=d end;function ON(d)a.onoffable=d end;function S(d)a.script=d end;function ES(d)a.energystorage=d end;function MS(d)a.metalstorage=d end;function SEID(d)a.seismicdistance=d end;function RDJ(d)a.radardistancejam=d end;function SP(d)a.speed=d end;function ASD(d)a.airsightdistance=d end;function RD(d)a.radardistance=d end;function RA(d)a.radiusadjust=d end;function TR(d)a.turnrate=d end;function UG(d)a.customparams.unitgroup=d end;function ONAME(d)a.objectname=d end;function BPIC(d)a.buildpic=d end;function AS(d)a.airStrafe=d end;function BOPTION(d)a.buildoptions=d end;function BNOPTION()a.buildoptions={}end;function EXP(d)a.explodeas=d end;function SELF(d)a.selfdestructas=d end;function UP(d)a.upright=d end;function WATER()a.floater=true;a.waterline=0;a.maxwaterdepth=1000 end;function SPACE(d)a.corpse=""a.customparams.crashable=0;a.customparams.armordef="space"a.maxacc=0.22;a.maxdec=0.5;a.radardistance=0;a.sightdistance=0;a.reclaimable=false;a.repairable=true;a.canmove=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=8;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=true;a.customparams.restrictions_exclusion="_nosea_noair_"end;function SPACES(d)a.customparams.crashable=0;a.customparams.armordef="space"a.radardistance=0;a.reclaimable=true;a.repairable=true;a.canfly=true;a.cruisealtitude=d;a.hoverattack=true;a.airhoverfactor=0;a.verticalspeed=14;a.category="SPACENOTOBJECT"a.useSmoothMesh=true;a.turninplace=false;a.airstrafe=false;a.turnrate=0;a.canmove=false;a.maxacc=0.2;a.canfight=false;a.canguard=false;a.canPatrol=false;a.maxdec=0;a.upright=true;a.speed=0.1;a.sonardistance=0;a.customparams.restrictions_exclusion="_nosea_noair_"a.blocking=true end;SET("armllt")BPIC("scavengers/armllt.DDS")SPACES(2000)MC(160)EC(900)BT(4000)HP(350)SD(400)ASD(1000)NAME("Orbital Sentry")DESC("Orbital Light Laser Defense")WATER()ADD("armollt")SET("corllt")BPIC("scavengers/corllt.DDS")SPACES(2000)MC(160)EC(900)BT(4000)HP(350)SD(400)ASD(1000)NAME("Orbital Guard")DESC("Orbital Light Laser Defense")WATER()ADD("corollt")SET("leglht")SPACES(2000)MC(160)EC(900)BT(4000)HP(350)SD(400)ASD(1000)NAME("Orbital Pharos")DESC("Orbital Light Laser Defense")WATER()ADD("legollt")SET("cormadsam")BPIC("scavengers/cormadsam.DDS")SPACES(2000)ASD(1300)MC(820)EC(9500)BT(20000)HP(3100)SD(300)NAME("Purger")DESC("Orbital Defense Battery")TECH(1)ICT("armhlt")WATER()ADD("cororocket")SET("cormship")SPACE(2000)RD(0)MC(3300)EC(82000)BT(82000)HP(5000)SP(60)SD(900)ASD(1200)NAME("Shieldbreaker")DESC("Heavy Duty Orbital Bomber")UG("weapon")ICT("armliche")RA(2)TR(180)TECH(3)a.customparams.maxrange=nil;ADD("corobomber")SET("cordrone")SD(250)ASD(800)SPACE(2100)MC(20)HP(400)EC(1000)a.weapondefs.heat_ray.range=390;a.weapondefs.heat_ray.heightmod=0.1;a.weapondefs.heat_ray.cylindertargeting=50;a.weapondefs.heat_ray.minIntensity=0.5;a.weapondefs.heat_ray.damage.space=67.5;a.weapondefs.heat_ray.targetmoveerror=0;a.weapons[1].maxangledif=360;a.weapons[1].onlytargetcategory="SPACENOTOBJECT"ADD("corodrone")SET("armdrone")SD(250)ASD(800)SPACE(2100)MC(20)HP(250)EC(1000)a.weapondefs.med_emg.range=390;a.weapondefs.med_emg.accuracy=0;a.weapondefs.med_emg.sprayangle=0;a.weapondefs.med_emg.damage.space=21.6;a.weapondefs.med_emg.turret=true;a.weapons[1].maxangledif=360;a.weapons[1].onlytargetcategory="SPACENOTOBJECT"ADD("armantiodrone")SET("cordronecarry")DESC("Anti Orbital Drone Carrier")ASD(1100)a.customparams.ignore_noair=true;a.weapondefs.plasma.customparams.carried_unit="corodrone"a.weapondefs.plasma.customparams.droneammo=0;a.weapons[1].def="AAMISSILE"a.weapons[1].onlytargetcategory="VTOL"a.weapons[2].def="PLASMA"a.weapons[2].onlytargetcategory="SPACENOTOBJECT"ADD("cordronecarry")SET("armdronecarry")ASD(1100)DESC("Anti Orbital Drone Carrier")a.customparams.ignore_noair=true;a.weapondefs.plasma.customparams.carried_unit="armantiodrone"a.weapondefs.plasma.customparams.droneammo=0;a.weapons[1].def="AAMISSILE"a.weapons[1].onlytargetcategory="VTOL"a.weapons[2].def="PLASMA"a.weapons[2].onlytargetcategory="SPACENOTOBJECT"ADD("armdronecarry")SET("armlichet4")a.weapondefs.nuclear_missile.tracks=true;a.weapondefs.nuclear_missile.collideenemy=true;a.weapondefs.nuclear_missile.turnrate=20000;a.weapondefs.nuclear_missile.weapontype="MissileLauncher"a.weapons[1].badtargetcategory="SPACENOTOBJECT"a.weapons[1].onlytargetcategory="SURFACE SPACENOTOBJECT"ADD("armlichet4")SET("corcrwt4")a.weapondefs.edragon_missile.burnblow=false;a.weapondefs.edragon_missile.damage.space=450;a.weapons[2].onlytargetcategory="VTOL SPACENOTOBJECT"ADD("corcrwt4")SET("leganavyflagship")DESC("Anti Orbital Naval Combat Flagship")a.weapons[4].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[4].burstControlWhenOutOfArc="nil"a.weapons[5].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[5].burstControlWhenOutOfArc="nil"a.weapons[6].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[6].burstControlWhenOutOfArc="nil"a.weapons[7].onlytargetcategory="NOTSUB SPACENOTOBJECT"a.weapons[7].burstControlWhenOutOfArc="nil"a.weapondefs.leg_experimental_railgun.damage.space=750;a.weapondefs.leg_experimental_railgun.weaponvelocity=7000;ADD("leganavyflagship")table.insert(UnitDefs["armasy"].buildoptions,"armdronecarry")table.insert(UnitDefs["corasy"].buildoptions,"cordronecarry")table.insert(UnitDefs["corcom"].buildoptions,"corollt")table.insert(UnitDefs["armcom"].buildoptions,"armollt")table.insert(UnitDefs["legcom"].buildoptions,"legollt")table.insert(UnitDefs["legadvshipyard"].buildoptions,"cordronecarry")table.insert(UnitDefs["legavp"].buildoptions,"legov")table.insert(UnitDefs["armavp"].buildoptions,"armov")table.insert(UnitDefs["coravp"].buildoptions,"corov")table.insert(UnitDefs["legafcv"].buildoptions,"legollt")table.insert(UnitDefs["legaceb"].buildoptions,"legocannon")table.insert(UnitDefs["legaceb"].buildoptions,"legomulti")table.insert(UnitDefs["armconsul"].buildoptions,"armorocket")table.insert(UnitDefs["armconsul"].buildoptions,"armomulti")table.insert(UnitDefs["armmls"].buildoptions,"armorocket")table.insert(UnitDefs["armmls"].buildoptions,"armomulti")table.insert(UnitDefs["corfast"].buildoptions,"corocannon")table.insert(UnitDefs["corfast"].buildoptions,"coromulti")table.insert(UnitDefs["cormls"].buildoptions,"corocannon")table.insert(UnitDefs["cormls"].buildoptions,"coromulti")local _u = {}
function SET(def) _u = table.copy(UnitDefs[def]) end
function ADD(name) UnitDefs[name] = _u end
function CP()    _u.customparams = {} end
function HP(v)    _u.health    = v end
function SD(v)    _u.sightdistance    = v end
function TECH(v) _u.customparams.techlevel  = v end
function NAME(v) _u.customparams.i18n_en_humanname   = v end
function DESC(v) _u.customparams.i18n_en_tooltip    = v end
function SP(v) _u.speed = v end
function RA(v) _u.radiusadjust = v  end
function TR(v) _u.turnrate = v end
function ONAME(v) _u.objectname = v end
function UNAME(v) _u.unitname = v end
function RAPTORS(v)
_u.reclaimable = false
_u.repairable = true
_u.cruisealtitude = v
_u.verticalspeed = 8
_u.category = "SPACENOTOBJECT RAPTOR"
_u.customparams.raptorcustomsquad = true
_u.customparams.armordef = "space"
end
function RSUA(v) _u.customparams.raptorsquadunitsamount = v end
function RSMINA(v) _u.customparams.raptorsquadminanger = v end
function RSMAXA(v) _u.customparams.raptorsquadmaxanger = v end
function RSW(v) _u.customparams.raptorsquadweight = v end
function RSR(v) _u.customparams.raptorsquadrarity = v end
function RSB(v) _u.customparams.raptorsquadbehavior = v end
function RSBD(v) _u.customparams.raptorsquadbehaviordistance = v end
function RSBC(v) _u.customparams.raptorsquadbehaviorchance = v end

SET("raptor_air_fighter_basic_t2_v1")
RAPTORS(1600)
RSUA(4)
RSMINA(10)
RSMAXA(100)
RSW(1)
RSR("basic")
RSB("raider")
RSBD(100)
RSBC(1)
HP(700)
SP(200)
NAME("Gnaw")
DESC("Orbital fighter.")
SD(400)
UNAME("raptor_orbital_fighter_basic_t2_v1")
ADD("raptor_orbital_fighter_basic_t2_v1")

SET("raptor_air_bomber_basic_t2_v1")
RAPTORS(2000)
RSUA(3)
RSMINA(12)
RSMAXA(100)
RSW(2)
RSR("basic")
RSB("artillery")
RSBD(450)
RSBC(0.5)
HP(1000)
SP(100)
NAME("Regurgitator")
DESC("Orbital acid rain.")
SD(500)
UNAME("raptor_orbital_bomber_basic_t2_v1")
ADD("raptor_orbital_bomber_basic_t2_v1")

SET("raptor_air_fighter_basic_t4_v1")
RAPTORS(1600)
RSUA(2)
RSMINA(40)
RSMAXA(100)
RSW(4)
RSR("basic")
RSB("raider")
RSBD(100)
RSBC(1)
HP(3000)
SP(120)
NAME("Apex Gnaw")
DESC("Evolved Orbital Fighter.")
SD(400)
UNAME("raptor_orbital_bruiser_basic_t2_v1")
ADD("raptor_orbital_bruiser_basic_t2_v1")

SET("raptor_air_bomber_basic_t4_v1")
RAPTORS(2000)
RSUA(3)
RSMINA(40)
RSMAXA(100)
RSW(2)
RSR("basic")
RSB("artillery")
RSBD(1000)
RSBC(0.5)
HP(3000)
SP(90)
NAME("Bleeder")
DESC("Orbital Bombardment.")
SD(400)
UNAME("raptor_orbital_bomber_basic_t3_v1")
ADD("raptor_orbital_bomber_basic_t3_v1")

SET("raptor_air_bomber_brood_t4_v4")
RAPTORS(2000)
RSUA(1)
RSMINA(70)
RSMAXA(110)
RSW(1)
RSR("special")
RSB("raider")
RSBD(1000)
RSBC(1)
HP(35000)
SP(80)
NAME("Fleshlord")
DESC("Orbital Biological Battleship.")
SD(1000)
UNAME("raptor_orbital_battleship_basic_t3_v1")
ADD("raptor_orbital_battleship_basic_t3_v1")

SET("raptor_hive")
_u.weapondefs.antiair.collidefeature = false
_u.weapondefs.antiair.damage.default = 500
_u.weapondefs.antiair.burnblow = false
_u.weapons[2].onlytargetcategory = "VTOL SPACENOTOBJECT"
ADD("raptor_hive")

SET("raptor_turret_antiair_t2_v1")
_u.weapondefs.weapon.collidefeature = false
_u.weapondefs.weapon.damage.default = 700
_u.weapondefs.weapon.burnblow = false
_u.weapons[1].onlytargetcategory = "VTOL SPACENOTOBJECT"
ADD("raptor_turret_antiair_t2_v1")

SET("raptor_turret_antiair_t3_v1")
_u.weapondefs.weapon.collidefeature = false
_u.weapondefs.weapon.damage.default = 1000
_u.weapondefs.weapon.burnblow = false
_u.weapons[1].onlytargetcategory = "VTOL SPACENOTOBJECT"
ADD("raptor_turret_antiair_t3_v1")

SET("raptor_turret_antiair_t4_v1")
_u.weapondefs.weapon.collidefeature = false
_u.weapondefs.weapon.damage.default = 1000
_u.weapondefs.weapon.burnblow = false
_u.weapons[1].onlytargetcategory = "VTOL SPACENOTOBJECT"
ADD("raptor_turret_antiair_t4_v1")

SET("raptor_queen_easy")
_u.weapondefs.yellow_missile.collidefeature = false
_u.weapondefs.yellow_missile.damage.default = 1000*playerCountScale
_u.weapondefs.yellow_missile.burnblow = false
_u.weapons[2].onlytargetcategory = "VTOL SPACENOTOBJECT"
_u.weapons[3].onlytargetcategory = "VTOL SPACENOTOBJECT"
_u.weapons[4].onlytargetcategory = "VTOL SPACENOTOBJECT"
ADD("raptor_queen_veryeasy")
ADD("raptor_queen_easy")
ADD("raptor_queen_normal")
ADD("raptor_queen_hard")
ADD("raptor_queen_veryhard")
ADD("raptor_queen_epic")

for name, ud in pairs(UnitDefs) do
 local category = ud.category
  if category and category:find("RAPTOR") and not name:match("^raptor_queen") and ud.weapons then
    for i, weapon in ipairs(ud.weapons) do
      if not weapon.onlytargetcategory then
        weapon.onlytargetcategory = "SUB NOTSUB"
      end
    end
  end
end--NuttyB v1.52b Def Main
-- Authors: ChrispyNut, BackBash
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,pairs,c=UnitDefs or{},'repulsor',pairs,table.merge;function addWeapon(d,e,f)a[d]=a[d]or{}a[d].weapons=a[d].weapons or{}a[d].weapondefs=a[d].weapondefs or{}a[d].customparams=a[d].customparams or{}table.insert(a[d].weapons,{def=b,onlytargetcategory=f or''})a[d].weapondefs[b]=e;if e.shield and e.shield.power>0 then e.range=e.shield.radius;a[d].customparams=c(a[d].customparams or{},{off_on_stun='true',shield_color_mult=0.8,shield_power=e.shield.power,shield_radius=e.shield.radius})end end;for g,h in ipairs({'armcom','armcomlvl2','armcomlvl3','armcomlvl4','corcom','corcomlvl2','corcomlvl3','corcomlvl4','legcom','legcomlvl2','legcomlvl3','legcomlvl4','legcomlvl5'})do addWeapon(h,{avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name='PlasmaRepulsor',range=50,soundhitwet='sizzle',weapontype='Shield',damage={default=100},shield={alpha=0.15,armortype='shields',energyuse=1,force=2.5,intercepttype=1,power=500,powerregen=3,powerregenenergy=3,radius=100,repulser=true,smart=true,startingpower=100,visiblerepulse=true,badcolor={1,0.2,0.2,0.2},goodcolor={0.2,1,0.2,0.17}}})end;for i,j in pairs(a)do if string.sub(i,1,24)=='raptor_air_fighter_basic'then if j.weapondefs then for g,k in pairs(j.weapondefs)do k.name='Spike'k.accuracy=200;k.collidefriendly=0;k.collidefeature=0;k.avoidfeature=0;k.avoidfriendly=0;k.areaofeffect=64;k.edgeeffectiveness=0.3;k.explosiongenerator='custom:raptorspike-large-sparks-burn'k.cameraShake={}k.dance={}k.interceptedbyshieldtype=0;k.model='Raptors/spike.s3o'k.reloadtime=1.1;k.soundstart='talonattack'k.startvelocity=200;k.submissile=1;k.smoketrail=0;k.smokePeriod={}k.smoketime={}k.smokesize={}k.smokecolor={}k.soundhit={}k.texture1={}k.texture2={}k.tolerance={}k.tracks=0;k.turnrate=60000;k.weaponacceleration=100;k.weapontimer=1;k.weaponvelocity=1000;k.weapontype={}k.wobble={}end end elseif i:match'^[acl][ore][rgm]com'and not i:match'_scav$'then table.mergeInPlace(j,{customparams={combatradius=0,fall_damage_multiplier=0,paratrooper=true,wtboostunittype={}},featuredefs={dead={damage=9999999,reclaimable=false,mass=9999999}}})end end;local l={raptor_air_kamikaze_basic_t2_v1={selfdestructas='raptor_empdeath_big'},raptor_land_swarmer_emp_t2_v1={weapondefs={raptorparalyzersmall={damage={shields=70},paralyzetime=6}}},raptor_land_assault_emp_t2_v1={weapondefs={raptorparalyzerbig={damage={shields=150},paralyzetime=10}}},raptor_allterrain_arty_emp_t2_v1={weapondefs={goolauncher={paralyzetime=6}}},raptor_allterrain_arty_emp_t4_v1={weapondefs={goolauncher={paralyzetime=10}}},raptor_air_bomber_emp_t2_v1={weapondefs={weapon={damage={shields=1100,default=2000},paralyzetime=10}}},raptor_allterrain_swarmer_emp_t2_v1={weapondefs={raptorparalyzersmall={damage={shields=70},paralyzetime=6}}},raptor_allterrain_assault_emp_t2_v1={weapondefs={raptorparalyzerbig={damage={shields=150},paralyzetime=6}}},raptor_matriarch_electric={weapondefs={goo={paralyzetime=13},melee={paralyzetime=13},spike_emp_blob={paralyzetime=13}}}}for m,n in pairs(l)do if a[m]then a[m]=c(a[m],n)end end;for g,o in pairs({'raptor_antinuke','raptor_turret_acid_t2_v1','raptor_turret_acid_t3_v1','raptor_turret_acid_t4_v1','raptor_turret_antiair_t2_v1','raptor_turret_antiair_t3_v1','raptor_turret_antiair_t4_v1','raptor_turret_antinuke_t2_v1','raptor_turret_antinuke_t3_v1','raptor_turret_basic_t2_v1','raptor_turret_basic_t3_v1','raptor_turret_basic_t4_v1','raptor_turret_burrow_t2_v1','raptor_turret_emp_t2_v1','raptor_turret_emp_t3_v1','raptor_turret_emp_t4_v1','raptor_worm_green'})do local p=a[o]p.maxthisunit=10;p.health=p.health*2;if p.weapondefs then for g,q in pairs(p.weapondefs)do q.reloadtime=q.reloadtime/1.5;q.range=q.range/2 end end end;for g,r in pairs(a)do if r.builder==true then if r.canfly==true then r.explodeas=''r.selfdestructas=''end end end;local s={'raptor_air_bomber_basic_t2_v1','raptor_air_bomber_basic_t2_v2','raptor_air_bomber_basic_t4_v1','raptor_air_bomber_basic_t4_v2','raptor_air_bomber_basic_t1_v1'}for g,t in pairs(s)do local j=a[t]if j.weapondefs then for g,u in pairs(j.weapondefs)do u.damage.default=u.damage.default/1.30 end end end;local v={'armrespawn','correspawn','legnanotcbase'}for g,i in ipairs(v)do local w=UnitDefs[i]if w then w.cantbetransported,w.footprintx,w.footprintz=false,4,4;w.customparams=w.customparams or{}w.customparams.paratrooper=true;w.customparams.fall_damage_multiplier=0 end end;local UnitDefs=UnitDefs or{}local function x(y)local z={}for A,B in pairs(y)do z[A]=type(B)=="table"and x(B)or B end;return z end;local function C(D,k)for A,B in pairs(k)do if type(B)=="table"then D[A]=D[A]or{}C(D[A],B)elseif D[A]==nil then D[A]=B end end end;local function E(F,G,H)if UnitDefs[F]and not UnitDefs[G]then local z=x(UnitDefs[F])C(z,H)UnitDefs[G]=z end end;local I={{"raptor_land_swarmer_basic_t1_v1","raptor_hive_swarmer_basic",{name="Hive Spawn",customparams={i18n_en_humanname="Hive Spawn",i18n_en_tooltip="Raptor spawned to defend hives from attackers."}}},{"raptor_land_assault_basic_t2_v1","raptor_hive_assault_basic",{name="Armored Assault Raptor",customparams={i18n_en_humanname="Armored Assault Raptor",i18n_en_tooltip="Heavy, slow, and unyielding—these beasts are made to take the hits others cant."}}},{"raptor_land_assault_basic_t4_v1","raptor_hive_assault_heavy",{name="Heavy Armored Assault Raptor",customparams={i18n_en_humanname="Heavy Armored Assault Raptor",i18n_en_tooltip="Lacking speed, these armored monsters make up for it with raw, unbreakable toughness."}}},{"raptor_land_assault_basic_t4_v2","raptor_hive_assault_superheavy",{name="Super Heavy Armored Assault Raptor",customparams={i18n_en_humanname="Super Heavy Armored Assault Raptor",i18n_en_tooltip="These super-heavy armored beasts may be slow, but they’re built to take a pounding and keep rolling."}}},{"raptorartillery","raptor_evolved_motort4",{name="Evolved Lobber",customparams={i18n_en_humanname="Evolved Lobber",i18n_en_tooltip="These lobbers did not just evolve—they became deadlier than anything before them."}}},{"raptor_land_swarmer_basic_t1_v1","raptor_acidspawnling",{name="Acid Spawnling",customparams={i18n_en_humanname="Acid Spawnling",i18n_en_tooltip="This critters are so cute but can be so deadly at the same time."}}}}for g,J in ipairs(I)do E(J[1],J[2],J[3])end;local K=UnitDef_Post;function UnitDef_Post(L,M)if K and K~=UnitDef_Post then K(L,M)end;local N=UnitDefs["raptor_land_swarmer_basic_t1_v1"]and UnitDefs["raptor_land_swarmer_basic_t1_v1"].health;local O={texture1={},texture2={},tracks=false,weaponvelocity=4000,smokePeriod={},smoketime={},smokesize={},smokecolor={},smoketrail=0}local P={accuracy=2048,areaofeffect=256,burst=4,burstrate=0.4,flighttime=12,dance=25,craterareaofeffect=256,edgeeffectiveness=0.7,cegtag="blob_trail_blue",explosiongenerator="custom:genericshellexplosion-huge-bomb",impulsefactor=0.4,intensity=0.3,interceptedbyshieldtype=1,range=2300,reloadtime=10,rgbcolor="0.2 0.5 0.9",size=8,sizedecay=0.09,soundhit="bombsmed2",soundstart="bugarty",sprayangle=2048,tolerance=60000,turnrate=6000,trajectoryheight=2,turret=true,weapontype="Cannon",weaponvelocity=520,startvelocity=140,weaponacceleration=125,weapontimer=0.2,wobble=14500,highTrajectory=1,damage={default=900,shields=600}}local Q={accuracy=1024,areaofeffect=24,burst=1,burstrate=0.3,cegtag="blob_trail_green",edgeeffectiveness=0.63,explosiongenerator="custom:raptorspike-small-sparks-burn",impulsefactor=1,intensity=0.4,interceptedbyshieldtype=1,name="Acid",range=250,reloadtime=1,rgbcolor="0.8 0.99 0.11",size=1,stages=6,soundhit="bloodsplash3",soundstart="alien_bombrel",sprayangle=128,tolerance=5000,turret=true,weapontimer=0.1,weapontype="Cannon",weaponvelocity=320,damage={default=80}}local R={raptor_hive_swarmer_basic={metalcost=350,nochasecategory="OBJECT",icontype="raptor_land_swarmer_basic_t1_v1"},raptor_hive_assault_basic={metalcost=3000,health=25000,speed=20.0,nochasecategory="OBJECT",icontype="raptor_land_assault_basic_t2_v1",weapondefs={aaweapon=O}},raptor_hive_assault_heavy={metalcost=6000,health=30000,speed=17.0,nochasecategory="OBJECT",icontype="raptor_land_assault_basic_t4_v1",weapondefs={aaweapon=O}},raptor_hive_assault_superheavy={metalcost=9000,health=35000,speed=16.0,nochasecategory="OBJECT",icontype="raptor_land_assault_basic_t4_v2",weapondefs={aaweapon=O}},raptor_evolved_motort4={icontype="raptor_allterrain_arty_basic_t4_v1",weapondefs={poopoo=P},weapons={[1]={badtargetcategory="MOBILE",def="poopoo",maindir="0 0 1",maxangledif=50,onlytargetcategory="NOTAIR"}}},raptor_acidspawnling={metalcost=375,energycost=600,health=N*2,icontype="raptor_land_swarmer_basic_t1_v1",buildpic="raptors/raptorh1b.DDS",objectname="Raptors/raptor_droneb.s3o",weapondefs={throwup=Q},weapons={[1]={def="throwup",onlytargetcategory="NOTAIR",maindir="0 0 1",maxangledif=180}}}}for i,S in pairs(R)do local j=UnitDefs[i]if j then for A,B in pairs(S)do if A=="weapondefs"then j.weapondefs=j.weapondefs or{}for T,U in pairs(B)do j.weapondefs[T]=j.weapondefs[T]or{}for V,W in pairs(U)do j.weapondefs[T][V]=W end end elseif A=="weapons"then j.weapons=B else j[A]=B end end end end end--T3 Cons & Taxed Factories
-- Authors: Nervensaege, TetrisCo (edited by RandomGuyJunior)
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a, b, c, d, e, f, g =
    UnitDefs or {},
    {"arm", "cor", "leg"},
    table.merge,
    {arm = "Armada ", cor = "Cortex ", leg = "Legion "},
    "_taxed",
    1.5,
    table.contains
local function h(i, j, k)
    if a[i] and not a[j] then
        a[j] = c(a[i], k)
    end
end
for l, m in pairs(b) do
    local n, o, p = m == "arm", m == "cor", m == "leg"
    h(
        m .. "nanotct2",
        m .. "nanotct3",
        {
            metalcost = 3700,
            energycost = 62000,
            builddistance = 550,
            buildtime = 108000,
            collisionvolumescales = "61 128 61",
            footprintx = 6,
            footprintz = 6,
            health = 8800,
            mass = 37200,
            sightdistance = 575,
            workertime = 1900,
            icontype = "armnanotct2",
            canrepeat = true,
            objectname = p and "Units/legnanotcbase.s3o" or o and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",
            customparams = {
                i18n_en_humanname = "T3 Construction Turret",
                i18n_en_tooltip = "More BUILDPOWER! For the connoisseur"
            }
        }
    )
    h(
        p and "legamstor" or m .. "uwadvms",
        p and "legamstort3" or m .. "uwadvmst3",
        {
            metalstorage = 30000,
            metalcost = 4200,
            energycost = 231150,
            buildtime = 142800,
            health = 53560,
            maxthisunit = 3,
            icontype = "armuwadves",
            name = d[m] .. "T3 Metal Storage",
            customparams = {
                i18n_en_humanname = "T3 Hardened Metal Storage",
                i18n_en_tooltip = "The big metal storage tank for your most precious resources. Chopped chicken!"
            }
        }
    )
    h(
        p and "legadvestore" or m .. "uwadves",
        p and "legadvestoret3" or m .. "advestoret3",
        {
            energystorage = 272000,
            metalcost = 2100,
            energycost = 59000,
            buildtime = 93380,
            health = 49140,
            icontype = "armuwadves",
            maxthisunit = 3,
            name = d[m] .. "T3 Energy Storage",
            customparams = {
                i18n_en_humanname = "T3 Hardened Energy Storage",
                i18n_en_tooltip = "Power! Power! We need power!1!"
            }
        }
    )
    for l, q in pairs({m .. "nanotc", m .. "nanotct2"}) do
        if a[q] then
            a[q].canrepeat = true
        end
    end
    local r = n and "armshltx" or o and "corgant" or "leggant"
    local s = a[r]
    h(
        r,
        r .. e,
        {
            energycost = s.energycost * f,
            icontype = r,
            metalcost = s.metalcost * f,
            name = d[m] .. "Experimental Gantry Taxed",
            customparams = {
                i18n_en_humanname = d[m] .. "Experimental Gantry Taxed",
                i18n_en_tooltip = "Produces Experimental Units"
            }
        }
    )
    local t, u = {},
        {
            m .. "afust3",
            m .. "nanotct2",
            m .. "nanotct3",
            m .. "alab",
            m .. "avp",
            m .. "aap",
            m .. "gatet3",
            m .. "flak",
            p and "legadveconvt3" or m .. "mmkrt3",
            p and "legamstort3" or m .. "uwadvmst3",
            p and "legadvestoret3" or m .. "advestoret3",
            p and "legdeflector" or m .. "gate",
            p and "legforti" or m .. "fort",
            n and "armshltx" or m .. "gant"
        }
    for l, v in ipairs(u) do
        t[#t + 1] = v
    end
    local w = {arm = {"corgant", "leggant"}, cor = {"armshltx", "leggant"}, leg = {"armshltx", "corgant"}}
    for l, x in ipairs(w[m] or {}) do
        t[#t + 1] = x .. e
    end
    local y = {
        arm = {
            "armamd",
            "armmercury",
            "armbrtha",
            "armminivulc",
            "armvulc",
            "armanni",
            "armannit3",
            "armlwall",
            "legendary_pulsar",
            "armnanotc3",
            "armspacet3",
        },
        cor = {
            "corfmd",
            "corscreamer",
            "cordoomt3",
            "corbuzz",
            "corminibuzz",
            "corint",
            "cordoom",
            "corhllllt",
            "cormwall",
            "legendary_bulwark",
            "cornanotc3",
            "corspacet3",
        },
        leg = {
            "legabm",
            "legstarfall",
            "legministarfall",
            "leglraa",
            "legbastion",
            "legrwall",
            "leglrpc",
            "legendary_bastion",
            "legapopupdef",
            "legdtf",
            "legnanotc3",
            "legspacet3",
        }
    }
    for l, v in ipairs(y[m] or {}) do
        t[#t + 1] = v
    end
    local j = m .. "t3aide"
    h(
        m .. "decom",
        j,
        {
            blocking = true,
            builddistance = 350,
            buildtime = 140000,
            energycost = 200000,
            energyupkeep = 2000,
            health = 10000,
            idleautoheal = 5,
            idletime = 1800,
            maxthisunit = 1,
            metalcost = 12600,
            speed = 85,
            terraformspeed = 3000,
            turninplaceanglelimit = 1.890,
            turnrate = 1240,
            workertime = 6000,
            reclaimable = true,
            candgun = false,
            name = d[m] .. "Epic Aide",
            customparams = {
                subfolder = "ArmBots/T3",
                techlevel = 3,
                unitgroup = "buildert3",
                i18n_en_humanname = "Epic Ground Construction Aide",
                i18n_en_tooltip = "Your Aide that helps you construct buildings"
            },
            buildoptions = t
        }
    )
    a[j].weapondefs = {}
    a[j].weapons = {}
    j = m .. "t3airaide"
    h(
        "armfify",
        j,
        {
            blocking = false,
            canassist = true,
            cruisealtitude = 3000,
            builddistance = 1750,
            buildtime = 140000,
            energycost = 200000,
            energyupkeep = 2000,
            health = 21100,
            idleautoheal = 5,
            idletime = 1800,
            icontype = "armnanotct2",
            maxthisunit = 1,
            metalcost = 13400,
            speed = 25,
            category = "SPACENOTOBJECT",
            terraformspeed = 3000,
            turninplaceanglelimit = 1.890,
            turnrate = 1240,
            workertime = 1600,
            buildpic = "ARMFIFY.DDS",
            name = d[m] .. "Epic Aide",
            customparams = {
                is_builder = true,
                subfolder = "ArmBots/T3",
                techlevel = 3,
                unitgroup = "buildert3",
                i18n_en_humanname = "Epic Orbital Construction Aide",
                i18n_en_tooltip = "Your Aide that helps you construct buildings"
            },
            buildoptions = t
        }
    )
    a[j].weapondefs = {}
    a[j].weapons = {}
    local z = n and "armshltx" or o and "corgant" or "leggant"
    if a[z] and a[z].buildoptions then
        local A = m .. "t3aide"
        if not g(a[z].buildoptions, A) then
            table.insert(a[z].buildoptions, A)
        end
    end
    z = m .. "apt3"
    if a[z] and a[z].buildoptions then
        local B = m .. "t3airaide"
        if not g(a[z].buildoptions, B) then
            table.insert(a[z].buildoptions, B)
        end
    end
end
--NuttyB v1.52 1.5X HP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
for unitName, unitDef in pairs(UnitDefs) do
    if string.sub(unitName, 1, 24) == "raptor_land_swarmer_heal" then
        unitDef.reclaimspeed = 100
        unitDef.stealth = false
        unitDef.builder = false
        unitDef.workertime = unitDef.workertime * 0.5
        unitDef.canassist = false
        unitDef.maxthisunit = 0
    end

    if unitDef.customparams and unitDef.customparams.subfolder == "other/raptors" and unitDef.health and not unitName:match('^raptor_queen_.*') then
        unitDef.health = unitDef.health * 1.5
        unitDef.sfxtypes = {}
        unitDef.explodas = unitDef.explodas
    end
end

local oldUnitDef_Post = UnitDef_Post
function UnitDef_Post(unitID, unitDef)
    if oldUnitDef_Post and oldUnitDef_Post ~= UnitDef_Post then
        oldUnitDef_Post(unitID, unitDef)
    end

    if unitDef.customparams and unitDef.customparams.subfolder == "other/raptors" then
        unitDef.nochasecategory = "OBJECT"
        if unitDef.metalcost and unitDef.health then
            unitDef.metalcost = math.floor(unitDef.health * 0.466666667)
        end
    end
end--NuttyB v1.52 1.5X QHP
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
for b, c in pairs(UnitDefs) do
	if b:match('^raptor_queen_.*') then
		c.repairable = 0
		c.canbehealed = 0
		c.buildtime = 9999999
		c.autoheal = 2
		c.canSelfRepair = 0
		c.health = c.health * 1.5
	end
end--Mini Bosses v2e
-- Authors: RCore
-- docs.google.com/spreadsheets/d/1QSVsuAAMhBrhiZdTihVfSCwPzbbZWDLCtXWP23CU0ko
local a,b,c,d,e,f=UnitDefs or{},table.merge,table.copy,'raptor_matriarch_basic','customfusionexplo',Spring;local g,h=1.3,1.3;h=a[d].health/60000;g=a['raptor_queen_epic'].health/1250000;local i=1;if f.Utilities.Gametype.IsRaptors()then i=(#f.GetTeamList()-2)/12 end;local j=f.GetModOptions().raptor_spawncountmult or 3;local k=i*j/3;local function l(m)return math.max(1,math.ceil(m*k))end;local n={70,85,90,105,110,125}local o=math.max(1,f.GetModOptions().raptor_queentimemult or 1.3)local p,q=n[1],n[#n]local r=o*n[#n]/1.3;local s=(r-p)/(q-p)for t=2,#n do n[t]=math.floor(p+(n[t]-p)*s)end;local u=f.GetModOptions().raptor_queen_count or 1;local v=1;if g>1.3 then v=math.min(10,g/1.3*0.9)end;local w=math.ceil(v*10*1.06^math.max(0,u-8))local x=o*100+w;local y=math.max(3,l(math.floor((21*u+36)/19)))local function z(A,B,C)if a[A]and not a[B]then a[B]=b(a[A],C or{})end end;local D=a[d].health;z('raptor_queen_veryeasy','raptor_miniq_a',{name='Queenling Prima',icontype='raptor_queen_veryeasy',health=D*5,customparams={i18n_en_humanname='Queenling Prima',i18n_en_tooltip='Majestic and bold, ruler of the hunt.'}})z('raptor_queen_easy','raptor_miniq_b',{name='Queenling Secunda',icontype='raptor_queen_easy',health=D*6,customparams={i18n_en_humanname='Queenling Secunda',i18n_en_tooltip='Swift and sharp, a noble among raptors.'}})z('raptor_queen_normal','raptor_miniq_c',{name='Queenling Tertia',icontype='raptor_queen_normal',health=D*7,customparams={i18n_en_humanname='Queenling Tertia',i18n_en_tooltip='Refined tastes. Likes her prey rare.'}})a.raptor_miniq_b.weapondefs.acidgoo=c(a['raptor_matriarch_acid'].weapondefs.acidgoo)a.raptor_miniq_c.weapondefs.empgoo=c(a['raptor_matriarch_electric'].weapondefs.goo)for E,F in ipairs{{'raptor_matriarch_basic','raptor_mama_ba','Matrona','Claws charged with vengeance.'},{'raptor_matriarch_fire','raptor_mama_fi','Pyro Matrona','A firestorm of maternal wrath.'},{'raptor_matriarch_electric','raptor_mama_el','Paralyzing Matrona','Crackling with rage, ready to strike.'},{'raptor_matriarch_acid','raptor_mama_ac','Acid Matrona','Acid-fueled, melting everything in sight.'}}do z(F[1],F[2],{name=F[3],icontype=F[1],health=D*1.5,customparams={i18n_en_humanname=F[3],i18n_en_tooltip=F[4]}})end;z('critter_penguinking','raptor_consort',{name='Raptor Consort',icontype='corkorg',health=D*4,mass=100000,nochasecategory="MOBILE VTOL OBJECT",sonarstealth=false,stealth=false,speed=67.5,customparams={i18n_en_humanname='Raptor Consort',i18n_en_tooltip='Sneaky powerful little terror.'}})a.raptor_consort.weapondefs.goo=c(a['raptor_queen_epic'].weapondefs.goo)z('raptor_consort','raptor_doombringer',{name='Doombringer',icontype='armafust3',health=D*12,speed=50,customparams={i18n_en_humanname='Doombringer',i18n_en_tooltip='Your time is up. The Queens called for backup.'}})local function G(H,I,J,K,L,M)return{raptorcustomsquad=true,raptorsquadunitsamount=L or 1,raptorsquadminanger=H,raptorsquadmaxanger=I,raptorsquadweight=M or 5,raptorsquadrarity=K or'basic',raptorsquadbehavior=J,raptorsquadbehaviordistance=500,raptorsquadbehaviorchance=0.75}end;local N={selfdestructas=e,explodeas=e,weapondefs={yellow_missile={damage={default=1,vtol=1000}}}}for O,P in pairs{raptor_miniq_a=b(N,{maxthisunit=l(2),customparams=G(n[1],n[2],'berserk'),weapondefs={goo={damage={default=750}},melee={damage={default=4000}}}}),raptor_miniq_b=b(N,{maxthisunit=l(3),customparams=G(n[3],n[4],'berserk'),weapondefs={acidgoo={burst=8,reloadtime=10,sprayangle=4096,damage={default=1500,shields=1500}},melee={damage={default=5000}}},weapons={[1]={def="MELEE",maindir="0 0 1",maxangledif=155},[2]={onlytargetcategory="VTOL",def="yellow_missile"},[3]={onlytargetcategory="VTOL",def="yellow_missile"},[4]={onlytargetcategory="VTOL",def="yellow_missile"},[5]={def="acidgoo",maindir="0 0 1",maxangledif=180}}}),raptor_miniq_c=b(N,{maxthisunit=l(4),customparams=G(n[5],n[6],'berserk'),weapondefs={empgoo={burst=10,reloadtime=10,sprayangle=4096,damage={default=2000,shields=2000}},melee={damage={default=6000}}},weapons={[1]={def="MELEE",maindir="0 0 1",maxangledif=155},[2]={onlytargetcategory="VTOL",def="yellow_missile"},[3]={onlytargetcategory="VTOL",def="yellow_missile"},[4]={onlytargetcategory="VTOL",def="yellow_missile"},[5]={def="empgoo",maindir="0 0 1",maxangledif=180}}}),raptor_consort={explodeas='raptor_empdeath_big',maxthisunit=l(6),customparams=G(n[2],1000,'berserk'),weapondefs={eyelaser={name='Angry Eyes',reloadtime=3,rgbcolor='1 0 0.3',range=500,damage={default=6000,commanders=6000}},goo={name='Snowball Barrage',soundstart='penbray2',soundStartVolume=2,cegtag="blob_trail_blue",burst=8,sprayangle=2048,weaponvelocity=600,reloadtime=4,range=1000,hightrajectory=1,rgbcolor="0.7 0.85 1.0",damage={default=1000}}},weapons={[1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},[2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}}},raptor_doombringer={explodeas="ScavComBossExplo",maxthisunit=y,customparams=G(x,1000,'berserk',nil,1,99),weapondefs={eyelaser={name='Eyes of Doom',reloadtime=3,rgbcolor='0.3 1 0',range=500,damage={default=48000,commanders=24000}},goo={name='Amber Hailstorm',soundstart='penbray1',soundStartVolume=2,cegtag="blob_trail_red",burst=15,sprayangle=3072,weaponvelocity=600,reloadtime=5,rgbcolor="0.7 0.85 1.0",hightrajectory=1,damage={default=5000}}},weapons={[1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},[2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}}},raptor_mama_ba={maxthisunit=l(4),customparams=G(55,n[3]-1,'berserk'),weapondefs={goo={damage={default=750}},melee={damage={default=750}}}},raptor_mama_fi={explodeas='raptor_empdeath_big',maxthisunit=l(4),customparams=G(55,n[3]-1,'berserk'),weapondefs={flamethrowerspike={damage={default=80}},flamethrowermain={damage={default=160}}}},raptor_mama_el={maxthisunit=l(4),customparams=G(65,1000,'berserk')},raptor_mama_ac={maxthisunit=l(4),customparams=G(60,1000,'berserk'),weapondefs={melee={damage={default=750}}}},raptor_land_assault_basic_t4_v2={maxthisunit=l(8),customparams=G(33,50,'raider')},raptor_land_assault_basic_t4_v1={maxthisunit=l(12),customparams=G(51,64,'raider','basic',2)}}do a[O]=a[O]or{}table.mergeInPlace(a[O],P,true)end;local Q={raptor_mama_ba=36000,raptor_mama_fi=36000,raptor_mama_el=36000,raptor_mama_ac=36000,raptor_consort=45000,raptor_doombringer=90000}local R=UnitDef_Post;function UnitDef_Post(H,S)if R then R(H,S)end;local T=1;if h>1.3 then T=h/1.3 end;for U,V in pairs(Q)do if UnitDefs[U]then local W=math.floor(V*T)UnitDefs[U].metalcost=W end end end
--Space Expansion V1.9
local _u = {}
local function YARD()
_u.yardmap = [[h
gossssssog
osossoosso
ssosossoos
sosssossss
sososssoss
ssosssosos
ssssosssos
soossososs
ossoossoso
gossssssog
]] 
end
function SET(def) _u = table.copy(UnitDefs[def]) end
function ADD(name) UnitDefs[name] = _u end
function CP()    _u.customparams = {} end
function MC(v)    _u.metalcost = v end
function EC(v)    _u.energycost= v end
function BT(v)    _u.buildtime    = v end
function FX(v)    _u.footprintx= v end
function FZ(v)    _u.footprintz= v end
function HP(v)    _u.health    = v end
function SD(v)    _u.sightdistance    = v end
function TECH(v) _u.customparams.techlevel  = v end
function NAME(v) _u.customparams.i18n_en_humanname   = v end
function DESC(v) _u.customparams.i18n_en_tooltip    = v end
function IAHP(v)    _u.idleautoheal    = v end
function IT(v)    _u.idletime    = v end
function AHP(v)    _u.autoheal    = v end
function CR(v)    _u.crushresistance    = v end
function ICT(v) _u.icontype = v end
function WT(v) _u.workertime = v end
function MWD(v) _u.minwaterdepth = v end
function B(v) _u.blocking = v end
function BD(v) _u.builddistance = v end
function EM(v) _u.energymake = v end
function RS(v) _u.removestop = v end
function RW(v) _u.removewait = v end
function ON(v) _u.onoffable = v end
function S(v) _u.script = v end
function ES(v) _u.energystorage = v end
function MS(v) _u.metalstorage = v end
function SEID(v) _u.seismicdistance = v end
function RDJ(v) _u.radardistancejam = v end
function SP(v) _u.speed = v end
function ASD(v) _u.airsightdistance = v end
function RD(v) _u.radardistance = v end
function RA(v) _u.radiusadjust = v  end
function UG(v) _u.customparams.unitgroup = v end
function ONAME(v) _u.objectname = v end
function BPIC(v) _u.buildpic = v end
function BUILDER(v) _u.builder = v end
function AS(v) _u.airStrafe = v end
function C(v) _u.collide = v end
function BOPTION(v) _u.buildoptions = v end
function BNOPTION() _u.buildoptions = {} end
function MOVE(v) _u.canmove = v end
function UP(v) _u.upright = v end
function CF(v) _u.canfight = v end
function TR(v) _u.turnrate = v end
function NOASD() _u.customparams.attacksafetydistance = nil end
function EXP(v) _u.explodeas = v end
function SELF(v) _u.selfdestructas = v end
function WATER() _u.floater = true
_u.waterline = 0
end
function SPACE(v)
_u.radardistance = 0
_u.sightdistance = 0
_u.reclaimable = false
_u.repairable = true
_u.sfxtypes.explosiongenerators = {}
_u.canmove = true
_u.canfly = true
_u.cruisealtitude = v
_u.hoverattack = true
_u.airhoverfactor = 0
_u.verticalspeed = 8
_u.category = "SPACENOTOBJECT"
_u.useSmoothMesh = true
_u.turninplace = true
_u.customparams.enabled_on_no_sea_maps = true
_u.customparams.ignore_noair = true
end
function SPACES(v)
_u.radardistance = 0
_u.reclaimable = false
_u.repairable = true
_u.canfly = true
_u.cruisealtitude = v
_u.hoverattack = true
_u.airhoverfactor = 0
_u.verticalspeed = 8
_u.category = "SPACENOTOBJECT"
_u.useSmoothMesh = true
_u.turninplace = false
_u.airstrafe = false
_u.turnrate = 0
_u.canmove = false
_u.maxacc = 0
_u.canfight = false
_u.canguard = false
_u.canPatrol = false
_u.maxdec = 0
_u.upright = true
_u.speed = 0.1
_u.customparams.enabled_on_no_sea_maps = true
_u.customparams.ignore_noair = true
_u.blocking = true
end

SET("legdrone")
HP(2000)
NAME("Paragon Drone")
DESC("Drone with minigun capable of attacking air and land.")
ADD("legparadrone")

SET("leghive")
MC(2000)
EC(20000)
BT(30000)
FX(4)
FZ(4)
HP(20000)
SD(500)
TECH(3)
NAME("Paragon")
DESC("Advanced fortification which produces up to 6 drones with miniguns")
AHP(50)
IT(800)
CR(5000)
ADD("legparagon")

SET("corfort")
MC(6000)
EC(40000)
BT(40000)
FX(2)
FZ(6)
HP(50000)
SD(200)
CP()
TECH(3)
NAME("Tyrant")
DESC("Advanced memoryalloy fortification which regenerates 500 HP/s.")
IAHP(0)
IT(0)
AHP(500)
CR(10000)
FX(4)
FZ(8)
_u.collisionvolumescales = "32 52 96"
ADD("cortyrant")

SET("armlwall")
MC(3000)
EC(20000)
BT(30000)
FX(4)
FZ(4)
SD(500)
HP(25000)
TECH(3)
NAME("Equalizer")
DESC("Advanced fortification with a lightning arc EMP.")
CR(5000)
ADD("armfirewall")

SET("armrespawn")
NAME("Epic Construction Turret")
DESC("Enormous assist & repair in a very short radius")
BD(200)
SD(500)
EM(50)
B(true)
WT(10000)
EC(200000)
MC(10000)
BT(200000)
MWD(-1000)
ADD("armnanotc3")

SET("correspawn")
NAME("Epic Construction Turret")
DESC("Enormous assist & repair in a very short radius")
BD(200)
SD(500)
EM(50)
B(true)
WT(10000)
EC(200000)
MC(10000)
BT(200000)
MWD(-1000)
ADD("cornanotc3")

SET("legnanotcbase")
NAME("Epic Construction Turret")
DESC("Enormous assist & repair in a very short radius")
BD(200)
SD(500)
EM(50)
B(true)
WT(10000)
EC(200000)
MC(10000)
BT(200000)
MWD(-1000)
ADD("legnanotc3")

SET("corageo")
NAME("Barrage")
DESC("Geothermal seeker rocket platform.")
MC(3000)
EC(40000)
BT(40000)
EM(600)
ES(30000)
TECH(3)
HP(6000)
SD(500)
RS(false)
RW(false)
ON(true)
S("Units/CORSILO.cob")
ICT("legrampart")
YARD()
ADD("corageot3")

SET("armageo")
NAME("Outpost")
DESC("Geothermal cloakable intelligence providing vision, jammer, tremorsense, and 100k storage.")
EC(38000)
BT(35000)
MC(2400)
EM(600)
ES(100000)
_u.metalmake = 1
MS(100000)
TECH(3)
HP(4000)
SEID(2000)
RDJ(800)
SD(2000)
_u.cloakCost = 100
_u.minCloakDistance = 100
_u.canCloak = true
_u.initCloaked = true
ICT("legrampart")
YARD()
ADD("armageot3")

SET("armsat")
SPACE(2100)
NAME("Sky Eye")
DESC("Satellite granting line of sight and radar.")
MC(200)
EC(10000)
BT(15000)
HP(500)
SP(110)
ASD(1100)
SD(1000)
RD(2300)
ICT("armeyes")
RA(2)
ADD("armosat")

SET("corsfig")
SPACE(2100)
BPIC("ARMSABER.DDS")
ONAME("Units/ARMSABER.s3o")
S("Units/ARMSABER.cob")
MC(260)
EC(7000)
BT(9000)
HP(550)
SP(200)
ASD(500)
NAME("Blaster")
DESC("Fast orbital fighter with an anti spaceship laser.")
UG("weapon")
ICT("armhawk")
RA(2.3)
TR(720)
SD(200)
ADD("armofighter")

SET("armmls")
BNOPTION()
SPACE(2000)
MC(600)
EC(13000)
BT(20000)
HP(600)
SP(60)
BUILDER(true)
WT(200)
BD(200)
ASD(500)
SD(200)
EM(30)
NAME("Advanced Orbital Constructor")
DESC("Tech 2 Constructor. (can not reclaim)")
UG("buildert2")
ICT("armaca")
RA(2.5)
_u.canReclaim = false
ADD("armoc")

SET("armhawk")
SPACE(2000)
TR(180)
MC(500)
EC(14000)
BT(18000)
HP(900)
SP(70)
SD(200)
ASD(600)
NAME("Peacemaker")
DESC("Orbital 2 Ground cannon.")
_u.nochasecategory = "VTOL"
UG("weapon")
ICT("armbrtha")
RA(2.5)
NOASD()
ADD("armocan")

SET("armaap")
NAME("Space Factory")
DESC("Tech 2 Orbital Units")
BT(24000)
EC(32000)
MC(3300)
WT(400)
ICT("armaap")
HP(4000)
BNOPTION()
ADD("armspace")

SET("armemp")
ASD(1600)
MC(3700) 
EC(30000) 
BT(40000) 
HP(8000) 
SD(600)
NAME("Maestro") 
DESC("Fires rockets at orbital units.") 
UG("weapon")
_u.canrepeat = false
ADD("armorocket")

SET("armsubk")
SPACE(2030)
MC(1000) EC(17000) BT(24000) HP(5500) SP(90) ASD(900) SD(300)
NAME("Lion") DESC("Assault spaceship with rapid fire anti spaceship laser.") UG("weapon")
ICT("armbrawl") RA(2.4)
ADD("armobruiser")

SET("armexcalibur")
SPACE(2060)
AS(false)
UP(true)
MC(1700) EC(24000) BT(29000) HP(4200) SP(78) ASD(1600) SD(300)
NAME("Accelerator") DESC("Long range tachyon laser spaceship") UG("weapon")
ICT("armanni") RA(2.8)
ADD("armotachyon")

SET("armdronecarry")
SPACE(2000)
MC(10000) EC(100000) BT(100000) HP(25000) SP(70) ASD(1400) SD(500)
NAME("Kaiser") DESC("Orbital drone carrier capable of attacking aircraft and spaceships.") UG("weapon")
TECH(3)
ICT("armtrident") RA(2)
AS(false)
UP(true)
RD(1200)
ADD("armokaiser")

SET("armdrone")
SPACE(2000)
MC(25) EC(600) BT(1200) HP(600) SP(90) ASD(800) 
NAME("Kaiser Drone") DESC("Rocket drone capable of attacking aircraft and spaceships.") UG("weapon")
ICT("armdrone")
ADD("armodrone")

SET("armdl")
SPACES(2000)
ASD(1100) MC(1000) EC(9000) BT(20000) HP(4000) SD(200)
NAME("Penguin") DESC("Orbital Laser Defense.") UG("weapon") TECH(1)
ICT("armhlt")
_u.sonardistance = 0
WATER()
ADD("armolaser")

SET("armfepocht4")
SPACE(2000)
MC(70000) EC(900000) BT(400000) HP(70000) SP(50) SD(1000) ASD(1500)
UG("weapon")
NAME("Iron Sky") DESC("Experimental orbital carpet artillery.")
_u.customparams.paralyzemultiplier = 0
ICT("armfepocht4")
EXP("customfusionexplo")
SELF("ScavComBossExplo")
ADD("armoliberator")

SET("legaap")
NAME("Space Factory") DESC("Tech 2 Orbital Units") TECH(2)
BT(24000) EC(31000) MC(3300) WT(400)
ICT("legaap") HP(4000)
BNOPTION()
ADD("legspace")

SET("armptt2")
SPACES(2000)
RD(0)
ASD(1400) MC(2000) EC(20000) BT(40000) HP(9000) SD(600)
NAME("Kraken") DESC("Long Range Laser Defense with Ground Cannon.") UG("weapon")
ADD("armomulti")

SET("corfdoom")
SPACES(2000)
ASD(1400) MC(2250) EC(21000) BT(44000) HP(9800) SD(600)
NAME("Cardinal") DESC("Orbital Laser Defense with Ground and AA Rockets.") UG("weapon")
ICT("corfdoom")
ADD("coromulti")

SET("legfloat")
SPACES(2000)
ASD(1400) MC(2050) EC(21000) BT(39000) HP(9300) SD(800)
NAME("Aeon") DESC("Long Range Laser defense with Ground Railgun.") UG("weapon")
ICT("legapopupdef")
ADD("legomulti")

SET("armapt3")
NAME("Experimental Space Factory") DESC("Tech 3 Orbital Units") TECH(3)
BNOPTION()
ICT("armapt3")
ADD("armspacet3")

SET("corapt3")
NAME("Experimental Space Factory") DESC("Tech 3 Orbital Units") TECH(3)
BNOPTION()
ICT("corapt3")
ADD("corspacet3")

SET("legapt3")
NAME("Experimental Space Factory") DESC("Tech 3 Orbital Units") TECH(3)
BNOPTION()
ICT("legapt3")
ADD("legspacet3")

SET("coraap")
TECH(2)
NAME("Space Factory")
DESC("Tech 2 Orbital Units")
BT(24000)
EC(31000)
MC(3300)
WT(400)
ICT("coraap")
HP(4000)
BNOPTION()
ADD("corspace")

SET("corsat")
SPACE(2100)
NAME("Observer")
DESC("Satellite granting line of sight and radar.")
MC(200)
EC(10000)
BT(15000)
HP(500)
SP(110)
ASD(1000)
SD(1000)
RD(2300)
ICT("coreyes")
RA(2)
ADD("corosat")

SET("corsfig")
SPACE(2100)
MC(280)
EC(7000)
BT(9600)
HP(560)
SP(200)
ASD(500)
NAME("Zealot")
DESC("Fast orbital fighter with an anti spaceship laser.")
UG("weapon")
ICT("corvamp")
RA(2.8)
TR(720)
SD(200)
ADD("corofighter")

SET("correcl")
BNOPTION()
SPACE(2000)
_u.canassist = true
_u.canresurrect = false
MC(600)
EC(9000)
BT(20000)
HP(500)
SP(60)
BUILDER(true)
WT(200)
BD(200)
ASD(500)
SD(200)
EM(30)
NAME("Advanced Orbital Constructor")
DESC("Tech 2 Constructor.")
UG("buildert2")
ICT("coraca")
TECH(2)
RA(2.5)
_u.canReclaim = false
ADD("coroc")

SET("corvamp")
SPACE(2000)
TR(180)
MC(550)
EC(13000)
BT(19000)
HP(950)
SP(70)
SD(250)
ASD(500)
NAME("Bombard")
DESC("Orbital 2 ground plasma cannon.")
UG("weapon")
ICT("corint")
RA(2.5)
NOASD()
ADD("corocan")

SET("coradvsol")
SPACE(2000)
MC(1950)
EC(21000)
BT(36000)
HP(2000)
SP(10)
ASD(500)
EM(500)
ES(1500)
NAME("Orbital Solar Collector")
DESC("Produces 500 energy.")
_u.customparams.solar = true
UG("energy")
ICT("coradvsol")
RA(2)
ADD("corosolar")

SET("corshark")
SPACE(2030)
MC(900)
EC(16000)
BT(20000)
HP(4000)
SP(90)
ASD(900)
SD(300)
NAME("Inquisitor")
DESC("Assault spaceship with long range anti spaceship rockets.")
UG("weapon")
ICT("corape")
RA(2.4)
ADD("corobruiser")

SET("corssub")
SPACE(2060)
MC(2200)
EC(30000)
BT(35000)
HP(9300)
SP(80)
ASD(700)
SD(300)
NAME("Punisher")
DESC("Heavy spaceship with lots of health and 2 medium anti spaceship laser.")
UG("weapon")
ICT("corcrwh")
_u.stealth = false
ADD("coroheavy")

SET("cormadsam")
SPACES(2000)
ASD(1100)
MC(1050)
EC(9500)
BT(21000)
HP(4200)
SD(300)
NAME("Purger")
DESC("Orbital Rocket Defense.")
TECH(1)
ICT("armhlt")
WATER()
ADD("cororocket")

SET("cormship")
SPACE(2000)
RD(0)
MC(3300)
EC(82000)
BT(80000)
HP(8000)
SP(60)
SD(900)
ASD(1200)
NAME("Shieldbreaker")
DESC("Heavy Duty Orbital Bombardment Spaceship")
UG("weapon")
ICT("armliche")
RA(2)
TR(180)
TECH(3)
ADD("corobomber")


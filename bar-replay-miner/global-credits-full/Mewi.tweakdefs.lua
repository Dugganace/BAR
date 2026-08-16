--Nutty Raptors T4 Defence
local a,b,c=UnitDefs,table.merge,table.copy;a.legendary_pulsar={name="Legendary Pulsar",description="A pinnacle of Armada engineering that fires devastating, rapid-fire tachyon bolts.",buildpic="ARMANNIT3.DDS",buildtime=280000,health=75000,metalcost=32000,energycost=800000,damagemodifier=0.15,energystorage=6000,idleautoheal=10,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0 15 0",collisionvolumescales="81 122 81",collisionvolumetype="Box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=72,maxslope=10,maxwaterdepth=0,nochasecategory="MOBILE",objectname="Units/scavbuildings/ARMANNIT3.s3o",onoffable=true,radardistance=1800,radaremitheight=72,script="Units/ARMANNI.cob",usePieceCollisionVolumes=1,seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1200,yardmap="oooooo oooooo oooooo oooooo oooooo oooooo",customparams={i18n_en_humanname="Legendary Pulsar",i18n_en_tooltip="Fires devastating, rapid-fire tachyon bolts at extreme range.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/armannit3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Cremuss",normaltex="unittextures/Arm_normal.dds",removewait=true,subfolder="ArmBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 1.06567382829e-05 -0.0",collisionvolumescales="62.5 81.7362213135 62.5",collisionvolumetype="Box",damage=3600,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=11640,object="Units/scavbuildings/armannit3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=1800,footprintx=5,footprintz=5,height=4,metal=4656,object="Units/arm3X3B.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="obli"},select={[1]="obli"}},weapondefs={tachyon_burst_cannon={name="Tachyon Burst Cannon",weapontype="LaserCannon",rgbcolor="0.2 0.7 1.0",burst=3,burstrate=0.15,reloadtime=1.8,accuracy=400,areaofeffect=128,range=1800,energypershot=500,turret=true,soundstart="annigun1",soundhit="xplolrg3",impulsefactor=0,weaponvelocity=1500,thickness=10,explosiongenerator="custom:tachyonshot",damage={default=3550}, allowNonBlockingAim = true, avoidfeature = false, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="tachyon_burst_cannon",onlytargetcategory="SURFACE"}}}
a.legendary_bastion={name="Legendary Bastion",description="The ultimate defensive emplacement. Projects a devastating, pulsating heatray.",health=75000,metalcost=48000,energycost=1450000,buildtime=180000,objectname="scavs/scavbeacon_t4.s3o",script="scavs/scavbeacon.cob",buildpic="scavengers/SCAVBEACON.DDS",maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",corpse="DEAD",damagemodifier=0.20,energystorage=1000,explodeas="largeBuildingexplosiongeneric",footprintx=5,footprintz=5,idleautoheal=2,idletime=1800,losemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",onoffable=true,radardistance=1200,radaremitheight=80,seismicsignature=0,selfdestructas="largeBuildingExplosionGenericSelfd",sightdistance=780,yardmap="yoooy ooooo ooooo ooooo yoooy",customparams={i18n_en_humanname="Legendary Bastion",i18n_en_tooltip="Projects a devastating, pulsating purple heatray.",maxrange=1400,usebuildinggrounddecal=true,buildinggrounddecaltype="decals/legbastion_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Gabs",normaltex="unittextures/leg_normal.dds",removewait=true,subfolder="CorBuildings/LandDefenceOffence",techlevel=3},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.0 0.0 0.0",collisionvolumescales="102 151 97",collisionvolumetype="CylY",damage=5400,featuredead="HEAP",footprintx=3,footprintz=3,height=20,metal=2911,object="Units/legbastion_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=2700,footprintx=3,footprintz=3,height=4,metal=1644,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="doom"},select={[1]="doom"}},weapondefs={legendary_bastion_ray={name="Legendary Heat Ray",thickness=15,rgbcolor="1.0 0.2 1.0",range=1400,damage={default=2995,vtol=15},weapontype="BeamLaser",reloadtime=0.3,soundstart="banthie2",soundtrigger=true,areaofeffect=120,avoidfeature=false,avoidfriendly=true,beamtime=0.3,camerashake=0.1,corethickness=0.3,craterareaofeffect=120,craterboost=0,cratermult=0,edgeeffectiveness=0.45,energypershot=500,explosiongenerator="custom:laserhit-medium-purple",firestarter=90,firetolerance=300,impulsefactor=0,laserflaresize=6,noselfdamage=true,predictboost=0.3,proximitypriority=1,rgbcolor2="0.9 1.0 0.5",soundhitdry="",soundhitwet="sizzle",turret=true,weaponvelocity=1500, allowNonBlockingAim = true, collidefriendly = false}},weapons={[1]={badtargetcategory="VTOL GROUNDSCOUT",def="legendary_bastion_ray",onlytargetcategory="SURFACE"}}}
a.legendary_bulwark={name="Legendary Bulwark",description="A pinnacle of defensive technology, the Legendary Bulwark annihilates all who approach.",buildpic="CORDOOMT3.DDS",buildtime=250000,health=95000,metalcost=45000,energycost=1250000,damagemodifier=0.15,energystorage=5000,idleautoheal=15,maxacc=0,activatewhenbuilt=true,maxdec=0,buildangle=4096,canrepeat=false,collisionvolumeoffsets="0.0 -7.5 0.0",collisionvolumescales="72.0 165.0 72.0",collisionvolumetype="box",corpse="DEAD",explodeas="fusionExplosion",footprintx=6,footprintz=6,idletime=1800,sightemitheight=80,maxslope=10,maxwaterdepth=0,nochasecategory="VTOL",objectname="Units/scavbuildings/CORDOOMT3.s3o",usePieceCollisionVolumes=1,onoffable=true,radardistance=1400,radaremitheight=80,script="Units/CORDOOM.cob",seismicsignature=0,selfdestructas="fusionExplosion",sightdistance=1100,yardmap="yyooyy oooooo oooooo oooooo oooooo yyooyy",customparams={i18n_en_humanname="Legendary Bulwark",i18n_en_tooltip="The ultimate defensive structure.",usebuildinggrounddecal=true,buildinggrounddecaltype="decals/cordoomt3_aoplane.dds",buildinggrounddecalsizey=9,buildinggrounddecalsizex=9,buildinggrounddecaldecayspeed=30,unitgroup='weapon',model_author="Mr Bob",normaltex="unittextures/cor_normal.dds",removewait=true,paralyzemultiplier=0.2,subfolder="CorBuildings/LandDefenceOffence",techlevel=4},featuredefs={dead={blocking=true,category="corpses",collisionvolumeoffsets="0.281730651855 -0.153618286133 3.57356262207",collisionvolumescales="80.6815948486 91.7637634277 82.1471252441",collisionvolumetype="Box",damage=10800,featuredead="HEAP",footprintx=5,footprintz=5,height=20,metal=9666,object="Units/scavbuildings/cordoomt3_dead.s3o",reclaimable=true},heap={blocking=false,category="heaps",collisionvolumescales="55.0 4.0 6.0",collisionvolumetype="cylY",damage=5400,footprintx=5,footprintz=5,height=4,metal=3864,object="Units/cor3X3E.s3o",reclaimable=true,resurrectable=0}},sfxtypes={pieceexplosiongenerators={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},sounds={canceldestruct="cancel2",underattack="warning1",cant={[1]="cantdo4"},count={[1]="count6",[2]="count5",[3]="count4",[4]="count3",[5]="count2",[6]="count1"},ok={[1]="armag"},select={[1]="armag"}},weapondefs={legendary_overload_scatter={name="Overload Scatter Beamer",weapontype="BeamLaser",range=1500,reloadtime=0.1,sprayangle=3000,projectiles=12,rgbcolor="0.8 0.1 1.0",accuracy=50,allowNonBlockingAim=true,areaofeffect=10,beamdecay=0.05,beamtime=0.1,beamttl=1,corethickness=0.25,burnblow=true,cylindertargeting=1,edgeeffectiveness=0.15,explosiongenerator="custom:laserhit-medium-purple",firestarter=100,impulsefactor=0.123,intensity=0.7,laserflaresize=9.35,noselfdamage=true,soundhitwet="sizzle",soundstart="beamershot2",tolerance=5000,thickness=6,turret=true,weaponvelocity=1000,damage={default=500}, avoidfeature = false, avoidfriendly = false, collidefriendly = false},legendary_heat_ray={name="Armageddon Heat Ray",weapontype="BeamLaser",range=1300,reloadtime=4.0,areaofeffect=72,avoidfeature=false,beamtime=0.6,cameraShake=350,corethickness=0.40,craterareaofeffect=72,energypershot=1200,explosiongenerator="custom:genericshellexplosion-medium-beam",impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,rgbcolor="1 0.8 0",rgbcolor2="0.8 0 0",scrollspeed=5,soundhitdry="",soundhitwet="sizzle",soundstart="heatray2xl",soundtrigger=1,thickness=7,tolerance=10000,turret=true,weaponvelocity=1800,damage={default=10000,commanders=1350}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false},legendary_point_defense={name="Point Defense Laser",weapontype="BeamLaser",range=750,reloadtime=0.5,areaofeffect=12,avoidfeature=false,beamtime=0.3,corethickness=0.32,energypershot=500,explosiongenerator="custom:laserhit-large-blue",firestarter=90,impactonly=1,impulsefactor=0,largebeamlaser=true,laserflaresize=8.8,noselfdamage=true,proximitypriority=0,rgbcolor="0 0 1",soundhitdry="",soundhitwet="sizzle",soundstart="annigun1",soundtrigger=1,texture3="largebeam",thickness=5.5,tilelength=150,tolerance=10000,turret=true,weaponvelocity=1500,damage={default=500,commanders=999}, allowNonBlockingAim = true, avoidfriendly = false, collidefriendly = false}},weapons={[1]={def="legendary_overload_scatter"},[2]={def="legendary_heat_ray"},[3]={def="legendary_point_defense"}}}
local d={"armack","armacv","armaca","armacsub","armcomlvl4"}for e,f in ipairs(d)do if a[f]then table.insert(a[f].buildoptions,'legendary_pulsar')end end;local g={"legack","legacv","legaca"}for e,f in ipairs(g)do if a[f]then table.insert(a[f].buildoptions,'legendary_bastion')end end;local h={"corack","coracv","coraca","coracsub"}for e,f in ipairs(h)do if a[f]then table.insert(a[f].buildoptions,'legendary_bulwark')end endlocal unitDefs,tableMerge,armthort4,cordemont4,epicunitprinter=UnitDefs or {},table.merge,'armthort4','cordemont4','epicunitprinter'unitDefs.armthort4=tableMerge(unitDefs['armthor'],{buildtime=830000,health=195000,metalcost=35000,energycost=596000,name='Epic Thor',description='A true Terminator Tank Unit to crush your enemies',customparams={i18n_en_humanname='Epic Thor',i18n_en_tooltip='Ultimate Terminator Tank'},weapondefs={thunder={areaofeffect=60,edgeeffectiveness=0.15,energypershot=1500,explosiongenerator="custom:genericshellexplosion-large-lightning-thor",falloffrate=0.5,firestarter=50,hardstop=false,impactonly=1,impulsefactor=0,intensity=56,name="Heavy Lightning Cannon",noselfdamage=true,range=800,reloadtime=2.8,rgbcolor="0.5 0.5 1",thickness=2.7,turret=true,weapontype="LightningCannon",weaponvelocity=400,customparams={noattackrangearc=1,spark_ceg="genericshellexplosion-splash-large-lightning",spark_forkdamage=1,spark_maxunits=25,spark_range="150"},damage={default=1050,subs=300}}}})unitDefs.cordemont4=tableMerge(unitDefs['cordemon'],{name='Epic Demon',metalcost=25000,energycost=90001,buildtime=10000,health=150000,customparams={i18n_en_humanname='Hellblazer',i18n_en_tooltip='Earth scorching Demon'},weapondefs={dmaw={areaofeffect=300,colormap="0.91 0.88 1 0.032   0.7 0.55 0.9 0.028   0.72 0.21 0.54 0.024   0.033 0.018 0.011 0.04   0.0 0.0 0.0 0.01",damageareaofeffect=50,range=650,rgbcolor="0.91 0.88 1",rgbcolor2="0.8 0.8 0.91",sprayangle=420,damage={default=500,subs=150}},karg_shoulder={areaofeffect=24,range=800,reloadtime=0.2,weaponvelocity=980,damage={default=500,vtol=2000}}}})unitDefs.epicunitprinter=tableMerge(unitDefs['lootboxnano_t4_var9'],{name='Epic Unit Printer',metalcost=12300,energycost=172000,buildtime=97300,buildpic="scavengers/SCAVBEACON.DDS",health=23500,maxthisunit=10,customparams={i18n_en_humanname='Epic Unit Printer',i18n_en_tooltip='The mother of all private army unit printers.'}})
--T5 Super Eco by Mewi
local unitDefs = UnitDefs or {}
local lootboxplatinum = 'lootboxplatinum'
local armdf = 'armdf'
local energy = {
    buildpic = 'other/resourcecheat.dds',
    buildtime = 200000,
    energycost = 5000000,
    energymake = 300000,
    energystorage = 50000,
    explodeas = 'korgExplosionSelfd',
    health = 10000,
    metalcost = 450000,
    metalmake = 0,
    reclaimable = true
}
local converter = {
    activatewhenbuilt = true,
    buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
    buildtime = 83000,
    energycost = 300000,
    energymake = 0,
    explodeas = 'fusionExplosion',
    health = 3000,
    maxwaterdepth = 20,
    metalcost = 250000,
    objectname = 'Units/CORUWFUS.s3o',
    script = 'Units/CORUWFUS.cob',
    selfdestructas = 'fusionExplosionSelfd'
}
local converterCustomparams = {
    energyconv_capacity = 125000,
    energyconv_efficiency = 0.00800,
    subfolder = 'ArmBuildings/LandEconomy',
    unitgroup = 'metal',
    i18n_en_humanname = 'Super Energy Converter',
    i18n_en_tooltip = 'Converts 125000 energy into 825 metal per sec'
}
local converterFeaturedefsDead = {
    blocking = true,
    category = 'corpses',
    collisionvolumeoffsets = '1.8653717041 -0.0807505981445 0.994560241699',
    collisionvolumescales = '89.9762878418 27.3368988037 72.5986480713',
    collisionvolumetype = 'Box',
    damage = 3210,
    featuredead = 'HEAP',
    footprintx = 5,
    footprintz = 5,
    height = 20,
    metal = 3099,
    object = 'Units/coruwfus_dead.s3o',
    reclaimable = true
}
local converterFeaturedefsHeap = {
    blocking = false,
    category = 'heaps',
    damage = 1605,
    footprintx = 5,
    footprintz = 5,
    height = 4,
    metal = 1240,
    object = 'Units/cor5X5A.s3o',
    reclaimable = true,
    resurrectable = 0
}

local builderNames = {
    'armaca',
    'armack',
    'armacv',
    'coraca',
    'corack',
    'coracv',
    'legaca',
    'legack',
    'legacv'
}

for key, value in pairs(energy) do
    unitDefs[lootboxplatinum][key] = value
end

unitDefs[lootboxplatinum].customparams.i18n_en_humanname = 'Super Fusion Reactor'
unitDefs[lootboxplatinum].customparams.i18n_en_tooltip = 'Produces 300000 Energy, Transportable (Very Hazardous)'

for key, value in pairs(converter) do
    unitDefs[armdf][key] = value
end

for key, value in pairs(converterCustomparams) do
    unitDefs[armdf].customparams[key] = value
end

for key, value in pairs(converterFeaturedefsDead) do
    unitDefs[armdf].featuredefs.dead[key] = value
end
for key, value in pairs(converterFeaturedefsHeap) do
    unitDefs[armdf].featuredefs.heap[key] = value
end

for i = 1, #builderNames do
    local builderName = builderNames[i]
    local nBuildOptions = #unitDefs[builderName].buildoptions
    unitDefs[builderName].buildoptions[nBuildOptions + 1] = armdf
    unitDefs[builderName].buildoptions[nBuildOptions + 2] = lootboxplatinum
end-- T3 Cons & Taxed Factories + Cross Faction Tax 70% (plus: Epic Aides can build T3 walls & shields)
do local U,FACTIONS,tmerge,FNAMES,TAX_SUFFIX,TAX_MULT=UnitDefs or{},{'arm','cor','leg'},table.merge,{arm='Armada ',cor='Cortex ',leg='Legion '},'_taxed',1.5;local function has(tbl,val)for _,v in pairs(tbl)do if v==val then return true end end end;local function clone(src,dst,over)if U[src]and not U[dst]then U[dst]=tmerge(U[src],over)end end;for _,o in pairs(FACTIONS)do local isArm,isCor,isLeg=(o=='arm'),(o=='cor'),(o=='leg');clone(o..'nanotct2',o..'nanotct3',{metalcost=3700,energycost=62000,builddistance=1550,buildtime=108000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=88000,mass=37200,sightdistance=575,workertime=1900,canrepeat=true,objectname=isLeg and'Units/legnanotcbase.s3o'or isCor and'Units/CORRESPAWN.s3o'or'Units/ARMRESPAWN.s3o',customparams={i18n_en_humanname='T3 Construction Turret',i18n_en_tooltip='More BUILDPOWER! For the connoisseur'}});clone(isLeg and'legamstor'or o..'uwadvms',isLeg and'legamstort3'or o..'uwadvmst3',{metalstorage=500000,metalcost=4200,energycost=231150,buildtime=142800,health=99999,maxthisunit=10,name=FNAMES[o]..'T3 Metal Storage',customparams={i18n_en_humanname='T3 Hardened Metal Storage',i18n_en_tooltip='The big metal storage tank for your most precious resources. Chopped chicken!'}});clone(isLeg and'legadvestore'or o..'uwadves',isLeg and'legadvestoret3'or o..'advestoret3',{energystorage=500000,metalcost=2100,energycost=59000,buildtime=93380,health=99999,maxthisunit=10,name=FNAMES[o]..'T3 Energy Storage',customparams={i18n_en_humanname='T3 Hardened Energy Storage',i18n_en_tooltip='Power! Power! We need power!1!'}});for _,s in pairs({o..'nanotc',o..'nanotct2'})do if U[s]then U[s].canrepeat=true end end;local gantryID=isArm and'armshltx'or isCor and'corgant'or'leggant';local gantryDef=U[gantryID];clone(gantryID,gantryID..TAX_SUFFIX,{energycost=gantryDef.energycost*TAX_MULT,icontype=gantryID,metalcost=gantryDef.metalcost*TAX_MULT,name=FNAMES[o]..'Experimental Gantry Taxed',customparams={i18n_en_humanname=FNAMES[o]..'Experimental Gantry Taxed',i18n_en_tooltip='Produces Experimental Units'}});local buildPool,baseList={},{
  o..'afust3',o..'nanotct2',o..'nanotct3',o..'alab',o..'avp',o..'aap','gatet3','flak',
  isLeg and'legadveconvt3'or o..'mmkrt3',
  isLeg and'legamstort3'or o..'uwadvmst3',
  isLeg and'legadvestoret3'or o..'advestoret3',
  isLeg and'legdeflector'or o..'gate',
  isLeg and'legforti'or o..'fort',
  isArm and'armshltx'or o..'gant',
  -- NEW: faction T3 walls + T3 shields so Epic Aides can build them
  (isArm and 'armfirewall' or isCor and 'cortyrant' or 'legparagon'),
  (isArm and 'armgatet3'  or isCor and 'corgatet3' or 'leggatet3')
};for _,x in ipairs(baseList)do buildPool[#buildPool+1]=x end;local cross={arm={'corgant','leggant'},cor={'armshltx','leggant'},leg={'armshltx','corgant'}};for _,z in ipairs(cross[o]or{})do buildPool[#buildPool+1]=z..TAX_SUFFIX end;local extras={arm={'armamd','armmercury','armbrtha','armminivulc','armvulc','armanni','armannit3','armlwall'},cor={'corfmd','corscreamer','cordoomt3','corbuzz','corminibuzz','corint','cordoom','corhllllt','cormwall'},leg={'legabm','legstarfall','legministarfall','leglraa','legbastion','legrwall','leglrpc'}};for _,x in ipairs(extras[o]or{})do buildPool[#buildPool+1]=x end;local aideGround=o..'t3aide';clone(o..'decom',aideGround,{blocking=true,builddistance=350,buildtime=140000,energycost=200000,energyupkeep=2000,health=100000,idleautoheal=5,idletime=1800,maxthisunit=10,metalcost=12600,speed=85,terraformspeed=3000,turninplaceanglelimit=1.890,turnrate=1240,workertime=6000,reclaimable=true,candgun=false,name=FNAMES[o]..'Epic Aide',customparams={subfolder='ArmBots/T3',techlevel=3,unitgroup='buildert3',i18n_en_humanname='Epic Ground Construction Aide',i18n_en_tooltip='Your Aide that helps you construct buildings'},buildoptions=buildPool});U[aideGround].weapondefs={};U[aideGround].weapons={};local aideAir=o..'t3airaide';clone('armfify',aideAir,{blocking=false,canassist=true,cruisealtitude=3000,builddistance=1750,buildtime=140000,energycost=200000,energyupkeep=2000,health=100000,idleautoheal=5,idletime=1800,maxthisunit=10,metalcost=13400,speed=150,terraformspeed=3000,turninplaceanglelimit=1.890,turnrate=1240,workertime=1600,buildpic='ARMFIFY.DDS',name=FNAMES[o]..'Epic Aide',customparams={subfolder='ArmBots/T3',techlevel=3,unitgroup='buildert3',i18n_en_humanname='Epic Air Construction Aide',i18n_en_tooltip='Your Aide that helps you construct buildings'},buildoptions=buildPool});U[aideAir].weapondefs={};U[aideAir].weapons={};local baseFactory=isArm and'armshltx'or isCor and'corgant'or'leggant';if U[baseFactory]and U[baseFactory].buildoptions then local id=o..'t3aide';if not has(U[baseFactory].buildoptions,id)then table.insert(U[baseFactory].buildoptions,id)end end;local apt3=o..'apt3';if U[apt3]and U[apt3].buildoptions then local id=o..'t3airaide';if not has(U[apt3].buildoptions,id)then table.insert(U[apt3].buildoptions,id)end end end end;do local U=UnitDefs or{};local TAX=1.7;local eligible,clones={},{};local SUFFIX='_taxed';local NAME_SUFFIX=' (Taxed)';local loc=nil;if Json and VFS and VFS.LoadFile then local ok,data=pcall(VFS.LoadFile,'language/en/units.json');if ok and data and Json.decode then local ok2,parsed=pcall(Json.decode,data);if ok2 and parsed then loc=parsed end end end;for id,def in pairs(U)do if def.customparams and def.customparams.subfolder and(def.customparams.subfolder:match'Fact'or def.customparams.subfolder:match'Lab')and def.customparams.techlevel==2 then local displayName=(loc and loc.units and loc.units.names and loc.units.names[id])or id;eligible[id]=1;clones[id..SUFFIX]=table.merge(def,{energycost=def.energycost*TAX,icontype=id,metalcost=def.metalcost*TAX,name=displayName..NAME_SUFFIX,customparams={i18n_en_humanname=displayName..NAME_SUFFIX,i18n_en_tooltip=(loc and loc.units and loc.units.descriptions and loc.units.descriptions[id])or id}})end end;for builderID,bdef in pairs(U)do if bdef.buildoptions then for _,opt in pairs(bdef.buildoptions)do if eligible[opt]then for _,pref in pairs({'arm','cor','leg'})do local crossID=pref..opt:sub(4)..SUFFIX;if opt:sub(1,3)~=pref and clones[crossID]then U[builderID].buildoptions[#U[builderID].buildoptions+1]=crossID end end end end end end;if table.mergeInPlace then table.mergeInPlace(U,clones)else for k,v in pairs(clones)do U[k]=v end end end

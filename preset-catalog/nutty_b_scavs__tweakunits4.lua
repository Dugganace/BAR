--EVO_XP_LRPC
-- EVO_XP_START

for name,ud in pairs(UnitDefs)do if string.match(name,'comlvl%d')or string.match(name,'armcom')or string.match(name,'corcom')or string.match(name,'legcom')then ud.customparams=ud.customparams or{}ud.customparams.inheritxpratemultiplier=0.5 ud.customparams.childreninheritxp='TURRET MOBILEBUILT'ud.customparams.parentsinheritxp='TURRET MOBILEBUILT'end end

-- EVO_XP_END

-- LRPC_START

do local UnitDefs=UnitDefs or{}if UnitDefs.armbrtha then table.mergeInPlace(UnitDefs.armbrtha,{health=13000,weapondefs={ARMBRTHA_MAIN={damage={commanders=480,default=33000},areaofeffect=60,energypershot=8000,range=2400,reloadtime=9,turnrate=20000}}})end if UnitDefs.corint then table.mergeInPlace(UnitDefs.corint,{health=13000,weapondefs={CORINT_MAIN={damage={commanders=480,default=85000},areaofeffect=230,edgeeffectiveness=0.6,energypershot=15000,range=2700,reloadtime=18}}})end if UnitDefs.leglrpc then table.mergeInPlace(UnitDefs.leglrpc,{health=13000,weapondefs={LEGLRPC_MAIN={damage={commanders=480,default=4500},energypershot=2000,range=2000,reloadtime=2,turnrate=30000}}})end end

-- LRPC_END
--ExponentialEvoEcoConTurre
-- Exponential evolving economy and construction turrets
-- Author: tetrisface
do local a=UnitDefs or{}local b=15;local c=1.25;local d=1.12;local e=0.03;local f={{prefix='arm',displayName='Armada',fusionBase='armafust3',converterBase='armmmkrt3',nanoT2Base='armnanotct2',nanoT3Base='armnanotct3',nanoObject='Units/ARMRESPAWN.s3o',builders={'armaca','armack','armacsub','armacv'}},{prefix='cor',displayName='Cortex',fusionBase='corafust3',converterBase='cormmkrt3',nanoT2Base='cornanotct2',nanoT3Base='cornanotct3',nanoObject='Units/CORRESPAWN.s3o',builders={'coraca','corack','coracsub','coracv'}},{prefix='leg',displayName='Legion',fusionBase='legafust3',converterBase='legadveconvt3',nanoT2Base='legnanotct2',nanoT3Base='legnanotct3',nanoObject='Units/legnanotcbase.s3o',builders={'legaca','legack','legacv','legcomt2com'}}}local g={'fusion','converter','nano'}local h={fusion={levelCount=30,sourceKey='fusionBase',unitSuffix='evfus',displayName='Evolving Fusion Reactor',footprint=12,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionFields={'energymake','energystorage'}},converter={levelCount=24,sourceKey='converterBase',unitSuffix='evconv',displayName='Evolving Energy Converter',footprint=6,usesGeothermalUpgrade=true,costFields={'metalcost','energycost','buildtime'},productionCustomFields={'energyconv_capacity'}},nano={levelCount=30,sourceKey='nanoT3Base',unitSuffix='evnano',displayName='Evolving Construction Turret',footprint=6,costFields={'metalcost','energycost','buildtime'},productionFields={'workertime'},linearFields={'builddistance'},linearGainPerLevel=0.03}}local i=0;for j,k in ipairs(g)do i=math.max(i,h[k].levelCount)end;local l={{1,1},{1,3},{1,5},{4,3},{5,6},{6,1},{6,3}}local m={{1,2},{1,6},{2,2},{2,5},{2,6},{4,2},{6,5}}local function n(o,p)if type(o)~='number'then return nil end;return math.ceil(o*p)end;local function q(r)local s=math.min(r-1,b-1)local t=math.max(r-b,0)return c^s*d^t end;local function u(r,v)local w=1+e*(r-1)return v/w end;local function x(r,y)return 1+y*(r-1)end;local function z(o)if not o then return'0'end;if o==math.floor(o)then return string.format('%.0f',o)end;return string.format('%.2f',o)end;local function A(B,C,D,p)for j,E in ipairs(D)do local o=n(C[E],p)if o~=nil then B[E]=o end end end;local function F(G,H,I)local J=a[G]if not J or a[H]then return a[H]end;a[H]=table.merge(J,I)return a[H]end;local function K(L,M,N)local O=L*2;return{{M,N},{N,O-M+1},{O-M+1,O-N+1},{O-N+1,M}}end;local function P(M,N)return M..':'..N end;local function Q(C,R,S,T)local U={}for V=0,S-1 do for W=0,S-1 do for j,X in ipairs(C)do local M=X[1]local N=X[2]if T and V==S-1 and W==S-1 then M,N=R-N+1,R-M+1 end;U[#U+1]={M+V*R,N+W*R}end end end;return U end;local function Y(L,Z,_,a0,a1)local O=L*2;local a2={}for j,a3 in ipairs({_,a0})do for j,X in ipairs(a3)do a2[P(X[1],X[2])]=true end end;local a4={_[1]}for M=1,L do for N=1,L do if#a4<Z-1 and not a2[P(M,N)]then a4[#a4+1]={M,N}end end end;a4[#a4+1]=a0[#a0]if#a4~=Z then return nil end;local a5={}for r=1,Z do local a6={}for M=1,O do a6[M]={}for N=1,O do a6[M][N]='b'end end;for j,X in ipairs(_)do for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]='s'end end;for a8,X in ipairs(a4)do local a9='b'if a8<r then a9='s'elseif a8==r then a9='o'end;for j,a7 in ipairs(K(L,X[1],X[2]))do a6[a7[1]][a7[2]]=a9 end end;for j,a7 in ipairs(K(L,a1[1],a1[2]))do a6[a7[1]][a7[2]]='c'end;local aa={}for M=1,O do aa[M]=table.concat(a6[M])end;a5[r]='h '..table.concat(aa,' ')end;return a5 end;local ab=Q(l,6,2,true)local ac=Q(m,6,2,true)h.fusion.yardmaps=Y(12,h.fusion.levelCount,ab,ac,ac[1])h.converter.yardmaps=Y(6,h.converter.levelCount,l,m,m[1])local function ad(ae)return{metalcost=3700,energycost=62000,builddistance=550,buildtime=108000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=575,workertime=1900,icontype='armnanotct2',canrepeat=true,objectname=ae.nanoObject}end;local function af(ae)local ag=h.fusion;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)I.customparams.i18n_en_tooltip='Produces '..z(I.energymake)..' energy/sec'F(G,ai,I)end end;local function aj(ae)local ag=h.converter;local G=ae[ag.sourceKey]local J=a[G]if not J or not ag.yardmaps then return end;local ak=J.customparams or{}for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,yardmap=ag.yardmaps[r],customparams={i18n_en_humanname=ag.displayName..' '..r,geothermal=ag.usesGeothermalUpgrade and 1 or nil}}A(I,J,ag.costFields,ah)A(I.customparams,ak,ag.productionCustomFields,v)local al=I.customparams.energyconv_capacity;local w=ak.energyconv_efficiency or 0;local am=al and al*w or nil;I.customparams.i18n_en_tooltip='Converts up to '..z(al)..' energy into '..z(am)..' metal/sec (Hazardous)'F(G,ai,I)end end;local function an(ae)local ao=a[ae.nanoT3Base]==nil;local ap=F(ae.nanoT2Base,ae.nanoT3Base,ad(ae))if ao and ap then ap.yardmap=nil end;local ag=h.nano;local G=ae[ag.sourceKey]local J=a[G]if not J then return end;for r=1,ag.levelCount do local v=q(r)local ah=u(r,v)local ai=ae.prefix..ag.unitSuffix..r;local I={name=ae.displayName..' '..ag.displayName..' '..r,description=ag.displayName..' Level '..r,footprintx=ag.footprint,footprintz=ag.footprint,customparams={i18n_en_humanname=ag.displayName..' '..r}}A(I,J,ag.costFields,ah)A(I,J,ag.productionFields,v)A(I,J,ag.linearFields,x(r,ag.linearGainPerLevel))I.customparams.i18n_en_tooltip='Provides '..z(I.workertime)..' buildpower at '..z(I.builddistance)..' range'local aq=F(G,ai,I)if aq then aq.yardmap=nil end end end;local function ar(as,at)local au=a[as]if not au or not a[at]then return end;au.buildoptions=au.buildoptions or{}for j,av in ipairs(au.buildoptions)do if av==at then return end end;au.buildoptions[#au.buildoptions+1]=at end;local function aw(ae)local ax={}for j,as in ipairs(ae.builders)do ax[#ax+1]=as end;ax[#ax+1]=ae.prefix..'t3aide'ax[#ax+1]=ae.prefix..'t3airaide'for j,as in ipairs(ax)do for r=1,i do for j,k in ipairs(g)do local ay=h[k]if r<=ay.levelCount then ar(as,ae.prefix..ay.unitSuffix..r)end end end end end;for j,ae in ipairs(f)do af(ae)aj(ae)an(ae)aw(ae)end end

-- Custom Buildings: Economy / Defense / Production / Utility, x Armada/Cortex/Legion + a Raptor-flavored one
-- Pattern: clone an existing building with table.merge, override stats/name, then
-- append the new unit id into the relevant commander's buildoptions so every
-- player in the lobby can build it immediately (no extra install needed --
-- this whole file is meant to be pasted into a modoption tweakdefs slot).

local unitDefs, tableMerge = UnitDefs or {}, table.merge

local function addBuildOption(commanderId, newUnitId)
	local commander = unitDefs[commanderId]
	if not commander then return end
	if not commander.buildoptions then commander.buildoptions = {} end
	table.insert(commander.buildoptions, newUnitId)
end

----------------------------------------------------------------------------------------------
-- DEFENSE: Interceptors -- point-defense that genuinely shoots down incoming
-- projectiles via the engine's interceptor/targetable weapon flags (the same
-- mechanic stock anti-nuke silos use). Two versions per faction:
--   Artillery: missile-based interceptor cloned from the stock anti-nuke silo
--     (armamd/corfmd/legabm) -- stockpiled rockets, wide coverage, tuned down
--     in cost/buildtime from "endgame anti-nuke only" to "usable area defense".
--   Energy: instant-hit beam interceptor cloned from the heavy laser tower
--     shell -- no stockpile, always ready, shorter range, fires constantly.
-- Both only intercept weapons the *attacker* has flagged targetable=1 (in
-- stock BAR that's nukes, LRPC, and other stockpile/starburst missiles --
-- normal hitscan lasers and direct-fire cannon shells aren't interceptable
-- by the engine, since they're not flagged as such by their own weapondefs).
----------------------------------------------------------------------------------------------

unitDefs.arminterceptor_artillery = tableMerge(unitDefs['armamd'], {
	name = 'Artillery Interceptor',
	unitname = 'arminterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		amd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.corinterceptor_artillery = tableMerge(unitDefs['corfmd'], {
	name = 'Artillery Interceptor',
	unitname = 'corinterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		fmd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.leginterceptor_artillery = tableMerge(unitDefs['legabm'], {
	name = 'Artillery Interceptor',
	unitname = 'leginterceptor_artillery',
	metalcost = 650,
	energycost = 16000,
	buildtime = 22000,
	health = 2400,
	customparams = {
		i18n_en_humanname = 'Artillery Interceptor',
		i18n_en_tooltip = 'Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		fmd_rocket = {
			coverage = 2600,
			reloadtime = 1.1,
			stockpiletime = 40,
			customparams = { stockpilelimit = 20 },
			damage = { default = 1500 },
		},
	},
})

unitDefs.arminterceptor_energy = tableMerge(unitDefs['armhlt'], {
	name = 'Energy Interceptor',
	unitname = 'arminterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		arm_laserh1 = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			energypershot = 120,
			damage = { default = 3000, commanders = 3000, vtol = 3000 },
		},
	},
})

unitDefs.corinterceptor_energy = tableMerge(unitDefs['corhlt'], {
	name = 'Energy Interceptor',
	unitname = 'corinterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		cor_laserh1 = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			energypershot = 120,
			damage = { default = 3000, commanders = 3000, vtol = 3000 },
		},
	},
})

unitDefs.leginterceptor_energy = tableMerge(unitDefs['leglht'], {
	name = 'Energy Interceptor',
	unitname = 'leginterceptor_energy',
	metalcost = 900,
	energycost = 24000,
	buildtime = 20000,
	health = 2200,
	customparams = {
		i18n_en_humanname = 'Energy Interceptor',
		i18n_en_tooltip = 'Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.',
		techlevel = 2,
		unitgroup = 'antinuke',
	},
	weapondefs = {
		heat_ray = {
			interceptor = 1,
			coverage = 1600,
			range = 900,
			reloadtime = 0.35,
			damage = { default = 3000 },
		},
	},
})

----------------------------------------------------------------------------------------------
-- UTILITY: Barrier -- a large inert obstacle/pathing blocker, reskinned as a
-- repurposed husk rather than a purpose-built Dragon's Teeth shape (reuses the
-- game's own existing wreck art -- no new assets needed). Comes in three tiers
-- of health/durability/cost -- Bronze/Silver/Gold -- each visually a bigger
-- wreck to match: Bronze reuses a light laser tower's wreck, Silver a fusion
-- reactor's, Gold a commander's. Same inert-blocker mechanics underneath as
-- armdrag/cordrag/legdrag (blocking=true, canattack=false) throughout.
----------------------------------------------------------------------------------------------

local barrierTiers = {
	{ suffix = 'bronze', label = 'Barrier (Bronze)', wreckSuffix = 'llt_dead', metalcost = 150, buildtime = 1400, health = 8000, crushresistance = 700 },
	{ suffix = 'silver', label = 'Barrier (Silver)', wreckSuffix = 'fus_dead', metalcost = 260, buildtime = 2200, health = 14000, crushresistance = 1200 },
	{ suffix = 'gold', label = 'Barrier (Gold)', wreckSuffix = 'com_dead', metalcost = 400, buildtime = 3200, health = 22000, crushresistance = 1800 },
}

local function buildBarrierTier(factionPrefix, dragUnitId, tier)
	local unitId = factionPrefix .. 'barrier_' .. tier.suffix
	unitDefs[unitId] = tableMerge(unitDefs[dragUnitId], {
		name = tier.label,
		unitname = unitId,
		objectname = 'Units/' .. factionPrefix .. tier.wreckSuffix .. '.s3o',
		metalcost = tier.metalcost,
		energycost = 0,
		buildtime = tier.buildtime,
		health = tier.health,
		crushresistance = tier.crushresistance,
		footprintx = 4,
		footprintz = 4,
		yardmap = "ffffffffffffffff",
		customparams = {
			i18n_en_humanname = tier.label,
			i18n_en_tooltip = 'A repurposed battlefield husk, reinforced as a large inert obstacle (' .. tier.label .. ' tier). Cannot attack -- just blocks movement.',
			paralyzemultiplier = 0,
			removestop = true,
			removewait = true,
		},
	})
	return unitId
end

for _, tier in ipairs(barrierTiers) do
	buildBarrierTier('arm', 'armdrag', tier)
	buildBarrierTier('cor', 'cordrag', tier)
	buildBarrierTier('leg', 'legdrag', tier)
end


----------------------------------------------------------------------------------------------
-- PRODUCTION: Assembly Complex -- a beefed-up vehicle plant, faster build speed
----------------------------------------------------------------------------------------------

unitDefs.armassemblycomplex = tableMerge(unitDefs['armvp'], {
	name = 'Assembly Complex',
	unitname = 'armassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

unitDefs.corassemblycomplex = tableMerge(unitDefs['corvp'], {
	name = 'Assembly Complex',
	unitname = 'corassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

unitDefs.legassemblycomplex = tableMerge(unitDefs['legvp'], {
	name = 'Assembly Complex',
	unitname = 'legassemblycomplex',
	metalcost = 2600,
	energycost = 26000,
	buildtime = 24000,
	health = 4200,
	workertime = 900,
	customparams = {
		i18n_en_humanname = 'Assembly Complex',
		i18n_en_tooltip = 'Upgraded Vehicle Plant with much higher build power.',
	},
})

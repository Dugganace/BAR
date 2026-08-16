local ab = 1
if Spring.Utilities.Gametype.IsRaptors() then
	ab = (#Spring.GetTeamList() - 2)/2
end
-- ===================== 单位最终属性配置 =====================
unitFinalConfigs = {
    armrad  = { metalcost  = 10},
    legafigdef_1 = {
        sightdistance = 800,
        weapondefs = {leggun = {range=800, reloadtime=0.2}}
    },
    armthundt4_1 = {
        weapondefs = {armbomb = {burst=250, burstrate=0.02, impulsefactor=5, areaofeffect = 420, craterareaofeffect = 420,reloadtime=5}}
    },
    legfortt4_1 = {
        weapondefs = { semiauto = {range = 1400,  damage = { default = 1280, vtol = 980,}, },plasma = {range=1600, rgbcolor = "0.8 0.3 0.3",  projectiles=6,damage = {default = 5000},},aa_missiles = {range = 1800,flighttime = 15,damage = {vtol = 4000,},}}
    },
    legeheatraymech_human = {
        buildtime=800000, energycost=1805000, metalcost=87000,
        weapondefs = { aimhull = {range=1300},heatray1 = {energypershot=2500, range=1300, corethickness=0.6, craterareaofeffect=150,rgbcolor="0.8 0.1 0.1", rgbcolor2="1.0 0.3 0.3", name="热 能 射 线",damage={ default=600, vtol= 600}}
        }
    },
    cormart_human = {
        metalcost=68000, energycost=184000, buildtime=400000, mass=27000,
        customparams={firingceg="barrelshot-huge"},
        sfxtypes = {
            explosiongenerators={[1]="custom:barrelshot-huge"},
            pieceexplosiongenerators={[1]="deathceg2", [2]="deathceg3", [3]="deathceg4"}
        },
        weapondefs = {
            cor_artillery = {
                name="弧 光 冲 击 炮",
                energypershot = 5000,
                impulsefactor = 0.1,
                range=2500, reloadtime=3, weaponvelocity=900,
                damage={default=12000}
            }
        }
    },
    legshot_human = {
        energycost=147500, metalcost=35500, buildtime=158000,
        idleautoheal=500, idletime=100, mass=22000,
        customparams={reactive_armor_health=50000, reactive_armor_restore=1000},
        weapondefs={legion_riot_cannon_t2={range=600, damage={default=6000}}}
    },
    raptor_mama_fi = {
        weapondefs={flamethrowerspike={range = 500,damage={default=400}}, flamethrowermain={range = 700,damage={default=600}}}
    },
    raptor_mama_ac = {
        weapondefs={acidgoo = {range = 1600,reloadtime = 5,burst = 10,customparams = {area_onhit_damage = 2000,},},melee={damage={default=1750}}}
    },
    raptor_mama_el ={weapondefs = {goo = {accuracy = 256 * 4,areaofeffect = 220 * 4,range = 1600,burst = 20,reloadtime = 5,},melee = {reloadtime = 2,}}},
  
    armmeatball_human = {
        buildtime=400000, energycost=905000, metalcost=57000,
        weapondefs={         
            armamph_missile={
            name = "长 箭 飞 弹",          
            range = 1200,
            burst = 2,
            flighttime = 3,
            burstrate = 0.5,
            energypershot = 500,
            reloadtime = 2, 
            startvelocity = 1050,          
            damage = {vtol=8000}},
            lrpc={range=1000, name ="双 管 高 斯 炮", reloadtime=0.3, weaponvelocity=750, energypershot = 1000,damage={default=4500}}
        }
    },
    corkarg_human = {
            buildtime=80000, energycost=905000, metalcost=97000,
            weapondefs={
            karg_shoulder = {
            name = "标 枪 导 弹 发 射 筒",
            range = 1600,
            energypershot = 2000,
            flighttime = 3,
            reloadtime = 1,
            startvelocity = 1050,
            damage = {vtol=45000}, },           
            super_missile = { name = "卡 加 内 斯 超 级 导 弹",flighttime = 3,energypershot = 2000,range = 800,damage = {default = 5000}, },
         },
    },
    raptor_queen_epic = {health = 1250000 * 1.50  * ab, reclaimable = false, weapondefs = {goo = {targetable = 10, burst = 30, reloadtime = 10,damage = {default = 200000,shields = 50000},},melee = {areaofeffect = 980,damage = {default = 20000*ab,},},yellow_missile = {reloadtime = 1.0,damage = {default = 1,vtol = 50000*ab,},}}},
    raptor_consort={
    mass=100000,
    nochasecategory="MOBILE VTOL OBJECT",
        explodeas='raptor_empdeath_big',
        weapondefs={
            eyelaser={
                name='Angry Eyes',
                reloadtime=3,
                rgbcolor='1 0 0.3',
                range=1000,targetable = 10,
                damage={default=18000,commanders=6000}
            },
            goo={
                name='暴 雪 球',
                soundstart='penbray2',
                soundStartVolume=2,
                cegtag="blob_trail_blue",
                burst=10,
                sprayangle=2048,
                weaponvelocity=600,
                reloadtime=4,
                range=1500,
                hightrajectory=1,
                rgbcolor="0.7 0.85 1.0",
                damage={default=10000}
            }
        },
        weapons={
            [1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},
            [2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}
        }
    },
    raptor_doombringer = {
    mass=100000,
    nochasecategory="MOBILE VTOL OBJECT",
        explodeas="ScavComBossExplo",
        weapondefs={eyelaser={ name='Eyes of Doom',targetable = 10,reloadtime=3,rgbcolor='0.3 1 0',range=1500,damage={default=48000,commanders=24000}},
            goo={
                name='琥 珀 星 雨',
                soundstart='penbray1',
                soundStartVolume=2,
                cegtag="blob_trail_red",
                burst=15,
                sprayangle=3072,
                weaponvelocity=600,
                range=2000,
                reloadtime=5,
                rgbcolor="0.7 0.85 1.0",
                hightrajectory=1,
                damage={default=50000}
            }
        },
        weapons={
            [1]={def="eyelaser",badtargetcategory="VTOL OBJECT"},
            [2]={def='goo',maindir='0 0 1',maxangledif=180,badtargetcategory="VTOL OBJECT"}
        }
    },  
    legstarfall_human = {
        weapondefs={
        starfire = {       
                burst = 61,                    
                burstrate = 0.01,            
                sprayangle = 500,              
                fireTolerance = 364,           
                tolerance = 364,              
                flighttime = 10,
                highTrajectory = 1,
                range=6100,
                reloadtime = 12,
                weapontimer = 10,
                energypershot = 720000,       
                damage = {
                    default = 18000, 
					vtol = 18000,
				},
        }
     }
    },
    legstr_human =  {buildtime=120000,energycost = 60000,metalcost = 52000,weapondefs = {armmg_weapon = {range = 700,damage = {default = 380,vtol = 380,},}}},
    legkam_human = {buildtime = 36000,energycost = 80000,metalcost = 3800,weapondefs = {martyrbomb  = {	damage = {commanders = 7000,default = 9000,}}}},
    armlichet4_1 = { weapondefs = {nuclear_missile  = {targetable = 10, areaofeffect = 1920,craterareaofeffect = 1280,cratermult = 200.2,burst = 8 ,burstrate = 0.5, reloadtime = 5,damage = {commanders = 5000,default = 19000,vtol = 4000,}}}},
    armliche_1 = {weapondefs = {arm_pidr = {areaofeffect = 384,craterareaofeffect = 768,range = 500,burst = 8 ,burstrate = 0.5,reloadtime = 5}}},
    cordemon_human = {buildtime=900000,energycost = 820000,metalcost = 136000,weapondefs = {newdmaw = { name = "地狱火喷射器",energypershot=2000,damage = {default = 400,subs = 32,},}}},
    raptor_fighter_basic_t4_new1 = {weapondefs = {weapon = {damage = {default = 10,vtol = 3000,},}}},
    corfblackhyt4_human = {weapondefs = {heavylaser = {rgbcolor = "1 0 0"},heavyplasma = {burst = 4,burstrate = 0.25,range = 1800,energypershot = 50000,reloadtime = 5 ,weaponvelocity = 600}},},
    corfblackhyt4_1= {weapondefs = {heavylaser = {rgbcolor = "1 0 0"},heavyplasma = {burst = 4,burstrate = 0.25,range = 1800,reloadtime = 5 ,weaponvelocity = 600}},},
    armvulc_human= { weapondefs = { rflrpc = {  energypershot = 120000,}}},
    corbuzz_human= { weapondefs = { rflrpc  = {  energypershot = 150000,}}},
    armmmkrt3_t4 = { metalcost = 225000, energycost = 13750000, buildtime = 3500000,explodeas = "ScavComBossExplo",customparams = {energyconv_capacity = 60000,energyconv_efficiency = 0.023,} },
    cormmkrt3_t4 = { metalcost = 225000, energycost = 13750000, buildtime = 3500000,explodeas = "ScavComBossExplo",customparams = {energyconv_capacity = 60000,energyconv_efficiency = 0.023,} },
    legadveconvt3_t4 = { metalcost = 225000, energycost = 13750000, buildtime = 3500000,explodeas = "ScavComBossExplo",customparams = {energyconv_capacity = 60000,energyconv_efficiency = 0.023,} }, 
    armafust3_t4 = {health = 7900 * 7, metalcost = 900000, energycost = 5500000, buildtime = 20000000 ,energymake = 300000,energystorage = 900000,},
    corafust3_t4 = {health = 7900 * 7, metalcost = 900000, energycost = 5500000, buildtime = 20000000 ,energymake = 300000,energystorage = 900000,},
    legafust3_t4 = {health = 7900 * 7, metalcost = 900000, energycost = 5500000, buildtime = 20000000 ,energymake = 300000,energystorage = 900000,},
    armbeamer_t4 = {weapondefs = {armbeamer_weapon = {rgbcolor = "0.3 0.1 0.7",}}}, 
    armstil_1 = {weapondefs = {stiletto_bomb = {areaofeffect = 576,burst = 10,burstrate = 0.3}}},
    armscavengerbossv2_1 = {weapondefs = {disintegratorxl  = {damage = {raptor = 9999,raptorqueen = 9999},}}},
    scavengerbossv4_epic_1 = {weapondefs = {special_disintegratorxl  = {damage = {raptor = 9999,raptorqueen = 9999},}}},
    bluegundam = {energyupkeep = 1000000,energycost = 3000000*100,metalcost = 300000*100,buildtime = 300000*80,health = 400000*10,maxthisunit = 1,maxunits = 1, weapondefs = {disintegratorxl  = {energypershot = 1000000,reloadtime = 2,damage = {default = 99999,raptor = 9999,raptorqueen = 9999},}}},
    redgundam = {energyupkeep = 1000000,energycost = 3000000*100,metalcost = 300000*100,buildtime = 300000*80,health = 400000*10,maxthisunit = 1,maxunits = 1, weapondefs = {disintegratorxl  = {energypershot = 1000000,burst = 5,burstrate = 0.2,damage = {default = 29999,raptor = 9999,raptorqueen = 9999},}}},
    legiongundam = {energyupkeep = 2000000,energycost = 5000000*100,metalcost = 500000*100,buildtime = 500000*130,health = 600000*10,maxthisunit = 1,maxunits = 1, weapondefs = {turbo_shoulderturrets = {range = 4525,reloadtime = 10,},special_disintegratorxl  = {energypershot = 2000000,damage = {default = 199999,raptor = 9999,raptorqueen = 9999},}}},
    armapt3_human ={ workertime = 8000,},
    corapt3_human ={ workertime = 8000,},
    legapt3_human ={ workertime = 8000,},
    --legflak_t4 ={weapondefs  = {legflak_gun = { damage = {default = 8000,},}},weapons = {[1] = {burstcontrolwhenoutofarc = 2,def = "LEGFLAK_GUN",fastautoretargeting = true,},},},
    armflak_t4 ={ weapondefs = {armflak_gun = {	damage = {default = 2000,},}},weapons = {[1] = {badtargetcategory = "NOTAIR LIGHTAIRSCOUT",def = "ARMFLAK_GUN",},},},
    corflak_t4 ={ weapondefs = {armflak_gun = { damage = {default = 2000,},}},weapons = {[1] = {badtargetcategory = "NOTAIR LIGHTAIRSCOUT",def = "ARMFLAK_GUN",},},},
}
-- 合并最终配置到UnitDefs
for unitName, unitConfig in pairs(unitFinalConfigs) do
    UnitDefs[unitName] = UnitDefs[unitName] or {}
    table.mergeInPlace(UnitDefs[unitName], unitConfig, true)
end
-- 史诗女王仆从单位列表
local QUEEN_MINIONS = {"raptor_air_bomber_t4_new2", "raptor_mama_fi", "raptor_miniq_c"}
-- ===================== 史诗女王仆从配置 =====================
raptorMinions = raptorMinions or {}
raptorMinions["raptor_queen_epic"] = raptorMinions["raptor_queen_epic"] or {}
local R = UnitDef_Post
function UnitDef_Post(H, S)
    if R then R(H, S) end
    for _, unitName in ipairs(QUEEN_MINIONS) do
        table.insert(raptorMinions["raptor_queen_epic"], unitName)
    end   
end
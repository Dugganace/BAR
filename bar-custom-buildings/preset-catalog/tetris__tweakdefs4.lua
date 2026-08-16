-- ===================== 1. 常量&配置表 =====================
-- 单位属性倍率配置（按类型分类）
UNIT_CFG = {
    --调整T1T2单位属性
    usually = {
        list = {},
        health_mult = 5,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 5,
        range_mult = nil,
        buildtime_mult = nil,
    },
    air = {
        list = {"armfig", "armhawk", "corvamp", "corveng", "legionnaire", "legafigdef"},
        health_mult = 1.2,
        cost_mult_meta = 5,
        cost_mult_energ = 5,
        damage_mult = 3,
        range_mult = nil,  -- 空中单位不调整射程
    --    buildtime_mult = 3,
    },
    ground = {
        list = {"armjeth", "armsam", "armaak", "armyork", "cormist", "corcrash", "corsent", "coraak", "legaabot", "legrail", "legadvaabot", "legvflak"},
        health_mult = 3,
        cost_mult_meta = 8,
        cost_mult_energ = 10,
        damage_mult = 8,
        range_mult = 1.2,  
        buildtime_mult = 5,
    },
    player_T3_air = {
        list = {"legafigdef_human", "corvamp_human", "armhawk_human"},
        health_mult = 1.5,
        cost_mult_meta = 45,
        cost_mult_energ = 45,
        buildtime_mult = 25,
        damage_mult = 30,
        range_mult = 1.3  
    },
    player_T4_air = {
        list = {"legafigdef_human_t4", "corvamp_human_t4", "armhawk_human_t4"},
        health_mult = 5,
        cost_mult_meta = 120,
        cost_mult_energ = 120,
        buildtime_mult = 80,
        damage_mult = 100,
        range_mult = 1.6  
    },
    T3 = {
        list = {"armbrawl_human","corape_human"},
        health_mult = 1,
        cost_mult_meta = 30,
        cost_mult_energ = 50,
        damage_mult = 30,
        range_mult = 1.3,
        buildtime_mult = 30,
    },
    T4 = {
        list = {"legfortt4_human","corfblackhyt4_human","armfepocht4_human"},
        health_mult = 10,
        cost_mult_meta = 10,
        cost_mult_energ = 10,
        damage_mult = 12,
        range_mult = 1.2,
        buildtime_mult = 8,
        energypershot_mult = 5000,
    },
    rapotr = {
        list = {"raptor_hive","raptor_turret_antiair_t2_v1","raptor_turret_antiair_t3_v1","raptor_turret_antiair_t4_v1"},
        health_mult = 5,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 5,
        range_mult = 1.2,
        buildtime_mult = 1,
    },
    budid_tower = {
        list = {"armvulc_human","corbuzz_human","leglrpc_t4","armlwall_t4","cormwall_t4"},
        health_mult = 10,
        cost_mult_meta = 10,
        cost_mult_energ = 10,
        damage_mult = 15,
        range_mult = 1.2,
        buildtime_mult = 5,
        energypershot_mult = 10000,  
    },
    rapotr_special = {
        list = {"corjugg_1","legafigdef_1","armbanth_1","armlichet4_1","armthundt4_1","corfblackhyt4_1","raptor_land_swarmer_basic_t1_v1_new","raptor_land_swarmer_spectre_t3_new","raptor_land_swarmer_basic_t2_new","raptor_land_assault_basic_t2_new","raptor_land_swarmer_basic_t3_v1"},
        health_mult = 1,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 20,
        range_mult = 1.3,
        buildtime_mult = 1,
    },
    rapotr_special_2 = {
        list = {"raptor_land_swarmer_brood_t2_v1","raptor_land_swarmer_basic_t3_v3","raptor_land_swarmer_basic_t2_v3","raptor_air_scout_basic_t2_v1","raptor_air_scout_basic_t3_v1","raptor_air_scout_basic_t4_v1","raptor_land_swarmer_basic_t1_v1","raptor_land_swarmer_basic_t3_v2","raptor_land_swarmer_basic_t2_v1","raptor_land_swarmer_emp_t2_v1","raptor_air_fighter_basic_t2_v1","raptor_air_fighter_basic_t4_v1","raptor_air_bomber_basic_t1_v1","raptor_air_bomber_basic_t2_v1"},
        health_mult = 3,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 12,
        range_mult = 1.3,
        buildtime_mult = 1,
    },
    player_t4_con = {
        list = {"armaca_t4","armack_t4","armacv_t4","coraca_t4","corack_t4","coracv_t4","legaca_t4","legack_t4","legacv_t4"},
        health_mult = 20,
        cost_mult_meta = 8,
        cost_mult_energ = 6,
        damage_mult = 1,
        range_mult = 1.2,
        buildtime_mult = 5,
        workertime_mult = 5,
    },
    budid_t4_tower = {
        list = {"armguard_t4","armbeamer_t4","armhlt_t4","armmercury_t4","corpun_t4","corllt_t4","corhlt_t4","legacluster_t4","legbombard_t4"},
        health_mult = 15,
        cost_mult_meta = 30,
        cost_mult_energ = 40,
        damage_mult = 45,
        range_mult = 1.3,
        buildtime_mult = 20,
        energypershot_mult = 3000,  
    },
    budid_t4_AAtower = {
        list = {"armcir_t4","corerad_t4","cormadsam_t4","legmg_t4","leglupara_t4","legrhapsis_t4"},
        health_mult = 10,
        cost_mult_meta = 35,
        cost_mult_energ = 50,
        damage_mult = 60,
        range_mult = 2.0,
        buildtime_mult = 20,
        energypershot_mult = 3000,  
    },
    budid_t2_t4_AAtower = {
        list = {"legflak_t4","armflak_t4","corflak_t4"},
        health_mult = 10,
        cost_mult_meta = 50,
        cost_mult_energ = 70,
        damage_mult = 55,
        range_mult = 1.5,
        buildtime_mult = 35,
        energypershot_mult = 6000,  
    },
    rapotr_tower = {
        list = {"raptor_turret_basic_t2_v1","raptor_turret_antiair_t2_v1","raptor_turret_antinuke_t2_v1","raptor_turret_emp_t2_v1","raptor_turret_emp_t3_v1","raptor_turret_acid_t2_v1","raptor_turret_emp_t4_v1","raptor_turret_acid_t4_v1","raptor_turret_acid_t3_v1","raptor_turret_basic_t3_v1","raptor_turret_basic_t4_v1"},
        health_mult = 5,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 10,
        range_mult = 1.5,
        buildtime_mult = 1,
    },   
    usually_ships = {
        list = {},
        health_mult = 5,
        cost_mult_meta = 20,
        cost_mult_energ = 20,
        damage_mult = 15,
        range_mult = 1.3,
        buildtime_mult = 10,
        energypershot_mult = 8000,
    }, 
    T4_AA = {
        list = {"armaak_t4","armyork_t4","corsent_t4","coraak_t4","legadvaabot_t4","legvflak_t4"},
        health_mult = 30,
        cost_mult_meta = 60,
        cost_mult_energ = 100,
        damage_mult = 100,
        range_mult = 1.7,
        buildtime_mult = 50,
        energypershot_mult = 5000,
    },
    T4_temp = {
        list = {"corkarganetht4_t4","legelrpcmech_t4","legbunk_t4","corshiva_t4","raptor_air_bomber_basic_t2_v1"},
        health_mult = 10,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 1,
        range_mult = 1.0,
        buildtime_mult = 1,
    },
    boss_temp = {
        list = {"bluegundam","redgundam","legiongundam",},
        health_mult = 1,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 10,
        range_mult = 1.2,
        buildtime_mult = 1,
        energypershot_mult = 100000,
    },
    rapotr_temp = {
        list = {"armcomboss_1","corcomboss_1","armscavengerbossv2_1","scavengerbossv4_epic_1"},
        health_mult = 1,
        cost_mult_meta = 1,
        cost_mult_energ = 1,
        damage_mult = 10,
        range_mult = 1.0,
        buildtime_mult = 1,
    },
}
-- 生成玩家单位配置
local function BuildPlayerUnitCfg(cfg)
    return {
        name = cfg[3],
        icontype = cfg[1],
        health = cfg[6] or nil,
        speed = cfg[5] or nil,
        customparams = {
            i18n_zh_humanname = cfg[3] or "",
            i18n_zh_tooltip = cfg[4] or "",
            i18n_en_humanname = cfg[8] or "",
            i18n_en_tooltip = cfg[9] or "",
            armordef = cfg[7] or "standard"
        }
    }
end
for _, playerCfg in ipairs(playerUnitList) do
    local overrideCfg = BuildPlayerUnitCfg(playerCfg)
    CopyUnitDef(playerCfg[1], playerCfg[2], overrideCfg)
end
--给t1 t2 单位加入到表里面 载具 armvp armavp corvp coravp legvp legavp  机器 armlab armalab corlab coralab leglab legalab 飞机 armap armaap corap coraap legap legaap
Building_BuildUnit = {"armvp","armavp","corvp","coravp","legvp","legavp","armlab","armalab","corlab","coralab","leglab","legalab","armap","armaap","corap","coraap","legap","legaap"}
--遍历可生成单位插入到表里
for key, value in pairs(UnitDefs) do
     for _, name in pairs(Building_BuildUnit) do
        -- 遍历建筑可建造单位列表，匹配到目标单位后，将其加入usually列表
        if key == name then
        for k , v in pairs(value.buildoptions) do
            table.insert(UNIT_CFG.usually.list, v)
        end
           break  -- 匹配到目标单位后跳出，避免无效遍历
        end
    end
end 
--给t1 t2 海军单位加入到表里面 
Building_BuildUnit_ships = {"armsy","armasy","corsy","corasy","legsy","legadvshipyard"}
--遍历可生成单位插入到表里
for key, value in pairs(UnitDefs) do
     for _, name in pairs(Building_BuildUnit_ships) do
        -- 遍历建筑可建造单位列表，匹配到目标单位后，将其加入usually列表
        if key == name then
        for k , v in pairs(value.buildoptions) do
            table.insert(UNIT_CFG.usually_ships.list, v)
        end
           break  -- 匹配到目标单位后跳出，避免无效遍历
        end
    end
end 
local factions = {'arm', 'cor', 'leg'}
-- 复制并修改单位定义的工具函数
local function copyAndModifyUnit(baseUnitId, newUnitId, modifyTable)
    if UnitDefs [baseUnitId] and not UnitDefs [newUnitId] then
        UnitDefs [newUnitId] = table_merge(UnitDefs[baseUnitId], modifyTable)
    end
end
-- 遍历三大阵营（arm/cor/leg）
for _, faction in pairs(factions) do
    local isArm = faction == 'arm'
    local isCor = faction == 'cor'
    local isLeg = faction == 'leg'
    -- 1. 创建T3建造炮塔（基于T2纳米建造平台）
    copyAndModifyUnit(
        faction .. 'nanotct2',
        faction .. 'nanotct3',
        {
            metalcost  = 4200,
            energycost  = 64000,
            builddistance = 600,
            buildtime = 108000,
            collisionvolumescales = '61 128 61',
            footprintx = 6,
            footprintz = 6,
            health = 12000,
            mass = 37200,
            sightdistance = 575,
            workertime = 2000,
            icontype = "armrespawn",
            selfdestructas = "commanderExplosion",
            canrepeat = true,
            objectname = isLeg and 'Units/legnanotcbase.s3o' 
                or isCor and 'Units/CORRESPAWN.s3o' 
                or 'Units/ARMRESPAWN.s3o',
            customparams = {
                i18n_en_humanname = 'T4 Construction Turret',
                i18n_en_tooltip = 'More BUILDPOWER! For the connoisseur',
                i18n_zh_humanname = 'T4 工程塔',
                i18n_zh_tooltip = '在大范围内辅助与维修'
            }
        }
    )
end
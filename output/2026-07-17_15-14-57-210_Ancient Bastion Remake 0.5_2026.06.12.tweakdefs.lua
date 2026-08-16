-- 全局常量
CONST = {
    MIN_MAX_UNITS = 3,               -- 最小单位数量阈值
    DEFAULT_SQUAD_DISTANCE = 500,    -- 默认小队行为距离
    DEFAULT_BEHAVIOR_CHANCE = 0.75,  -- 默认小队行为触发概率
    QUEEN_SQUAD_DISTANCE = 700,      -- 女王小队行为距离
    QUEEN_BEHAVIOR_CHANCE = 0.9,     -- 女王小队行为触发概率
    RAPTOR_AIR_HEALTH_MULT = 10,      -- 空对空 Raptor 血量倍率
    SPAWN_COUNT_BASE = 3,            -- 生成数量基数
    DEFAULT_ARMOR_DEF = "raptor",    -- 默认装甲类型
    DEFAULT_SQUAD_WEIGHT = 5,        -- 默认小队权重
    DEFAULT_SQUAD_RARITY = "basic",  -- 默认小队稀有度
    DEFAULT_SQUAD_UNIT_NUM = 1,       -- 默认小队单位数
    METAL_COST_MULT = 1.0,  -- 金属成本
    ENERGY_COST_MULT = 1.0, -- 能量成本 
    -- 源单位无成本时的默认值
    DEFAULT_METAL_COST = 50000,
    DEFAULT_ENERGY_COST = 800000
}
-- 基础变量初始化
local UnitDefs = UnitDefs or {}
table_merge = table.merge
table_copy = table.copy 
local baseRaptorUnit = 'raptor_matriarch_basic'  
local customExplosionType = 'customfusionexplo'  -- 定义但未使用，保留兼容
local teamCountScale = 1
local baseHealth=UnitDefs[baseRaptorUnit].health;
-- 计算队伍数量系数
if Spring and Spring.Utilities and Spring.Utilities.Gametype.IsRaptors() then
    teamCountScale = (#Spring.GetTeamList() - 2) / 6
end
-- 生成数量倍率计算
local spawnCountMult = (Spring and Spring.GetModOptions and Spring.GetModOptions().raptor_spawncountmult) or 10
local spawnScale = teamCountScale * spawnCountMult / CONST.SPAWN_COUNT_BASE
-- 计算最大单位数
function CalcMaxUnits(val)
    return math.max(CONST.MIN_MAX_UNITS, math.ceil(val * spawnScale))
end
-- 复制并覆盖单位配置
function CopyUnitDef(srcUnit, newUnit, override)
    if not UnitDefs[srcUnit] or UnitDefs[newUnit] then return end
    override = override or {}
    UnitDefs[newUnit] = table_merge(UnitDefs[srcUnit], override)
end
-- 构建基础单位配置
function BuildBaseUnitCfg(cfg)
        -- 先读取源单位成本（兼容源单位不存在的情况）
    local srcMetalCost = UnitDefs[cfg[1]] and UnitDefs[cfg[1]].metalcost or CONST.DEFAULT_METAL_COST
    local srcEnergyCost = UnitDefs[cfg[1]] and UnitDefs[cfg[1]].energycost or CONST.DEFAULT_ENERGY_COST
    local baseCfg = {
        name = cfg[3],
        icontype = cfg[1],
        health = cfg[7] or 0,
        speed = cfg[6] or 0,
        category = "RAPTOR",  -- Raptor 单位默认分类
        metalcost = math.ceil(srcMetalCost * CONST.METAL_COST_MULT),
        energycost = math.ceil(srcEnergyCost * CONST.ENERGY_COST_MULT),
        customparams = {
            i18n_zh_humanname = cfg[3] or "",
            i18n_zh_tooltip = cfg[4] or "",
            i18n_en_humanname = cfg[15] or "",
            i18n_en_tooltip = cfg[16] or "",
            raptorcustomsquad = true,
            raptorsquadunitsamount = cfg[8] or CONST.DEFAULT_SQUAD_UNIT_NUM,
            raptorsquadminanger = cfg[9] or 50,
            raptorsquadmaxanger = cfg[10] or 1000,
            raptorsquadweight = cfg[11] or CONST.DEFAULT_SQUAD_WEIGHT,
            raptorsquadrarity = cfg[12] or CONST.DEFAULT_SQUAD_RARITY,
            raptorsquadbehavior = cfg[13] or "raider",
            raptorsquadbehaviordistance = CONST.DEFAULT_SQUAD_DISTANCE,
            raptorsquadbehaviorchance = CONST.DEFAULT_BEHAVIOR_CHANCE,
            armordef = cfg[14] or CONST.DEFAULT_ARMOR_DEF
        }
    }
    -- 仅Raptor主单位计算最大数量，玩家单位/女王单位单独处理
    if cfg[5] then baseCfg.maxthisunit = CalcMaxUnits(cfg[5]) end
    return baseCfg
end
-- ===================== Raptor 基础单位配置 =====================
--最大数量 速度 血量 小队最大数量 minAnger maxAnger 权重
local raptorUnitList = { 
    {"raptor_land_swarmer_basic_t1_v1","raptor_land_swarmer_basic_t1_v1_new","快速幼年蜂群","极速异虫",30,250,15000,30,0,40,5,"basic","raider","raptor","Quick Juvenile Swarmer","Basic Raptor."},
    {"raptor_land_swarmer_spectre_t3_v1","raptor_land_swarmer_spectre_t3_new","幽灵蜂群","隐形异虫",30,200,25000,30,10,60,30,"special","raider","raptor","Spectre Swarmer","Invisible Raptor."},
    {"raptor_air_bomber_basic_t4_v1","raptor_bomber_t4_new2","史诗轰炸者","史诗飞行轰炸虫群之母!",20,100,950000,20,80,1000,10,"special","raider","vtol","Epic Bombardier","The Epic Mother of the Bombardier class!"},
    {"armlunchbox","armlunchbox_1","感染的午餐盒","感染的全地形重型等离子炮",20,35,100000,20,60,1000,10,"special","raider","raptor","Infecting Lunchbox","Infecting All-Terrain Heavy Plasma Cannon"},
    {"raptor_air_fighter_basic_t4_v1","raptor_fighter_basic_t4_new1","史诗级空战者","飞行战斗机异虫!",30,220,300000,20,90,1000,10,"special","raider","vtol","Epic Fighter","The Mother of the Fighter class!"},
    {"raptor_air_bomber_brood_t4_v2","raptor_bomber_brood_t4_new","史诗幼雏轰炸者","它们会繁殖!",10,240,300000,10,33,1000,5,"special","raider","vtol","Epic Brood Bomber","The Epic Brood Mother of the Bombardier class!"},
    {"raptor_land_swarmer_basic_t2_v2","raptor_land_swarmer_basic_t2_new","极速蜂群","高速异虫!",10,300,25000,10,0,50,5,"special","raider","raptor","Fast Swarmer","Fast Raptor!"},
    {"raptor_land_assault_basic_t2_v3","raptor_land_assault_basic_t2_new","极速斗士","快速突击异虫!",20,250,35000,10,35,1000,5,"special","raider","raptor","Fast Assault","Fast Assault Raptor!"},
    {"legafigdef","legafigdef_1","感染阿贾克斯","感染防御制空战斗机!",30,280,250000,10,33,1000,5,"basic","raider","vtol","Infecting Ajax","Infecting Defensive Air Fighter!"},
    {"armstil","armstil_1","感染史诗级匕首","感染EMP轰炸机!",30,300,350000,20,33,1000,10,"special","raider","vtol","Infecting Epic Stiletto","Infecting Helicopter!"},
    {"armlichet4","armlichet4_1","感染史诗级巫妖","感染战略原子轰炸机!",30,180,550000,20,60,1000,35,"special","raider","vtol","Infecting Epic Lich","Infecting EMP Bomber!"},
    {"armliche","armliche_1","感染巫妖","感染战略原子轰炸机!",30,200,350000,20,40,120,35,"special","raider","vtol","Infecting Epic Lich","Infecting EMP Bomber!"},
    {"armthundt4","armthundt4_1","感染史诗风暴使者","实验性地毯式轰炸机!",30,280,450000,20,60,1000,15,"special","raider","vtol","Infecting Epic Stormbringer","Infecting Experimental Carpet Bomber!"},
    {"legfortt4","legfortt4_1","感染史诗级暴君","感染巨型飞行要塞!",50,50,2500000,20,70,1000,99,"special","raider","vtol","Infecting Epic Tyrannus","Infecting Epic Tyrannus!"},
    {"corjugg","corjugg_1","感染史诗级巨兽","感染可移动重型炮塔!",30,45,500000,20,60,1000,30,"special","raider","raptor","Infecting Epic Beast","Infecting Mobile Heavy Turret!","Infecting Epic Beast","Infecting Mobile Heavy Turret!"},
    {"armbanth","armbanth_1","感染史诗级泰坦","感染突击机甲!",30,60,450000,10,60,1000,10,"special","raider","raptor","Infecting Epic Bomber","Infecting Large Bomber!"},
    {"corfblackhyt4","corfblackhyt4_1","感染飞行黑海德拉","感染带有垂直起降推进器的旗舰...等等，什么？",30,180,1500000,10,60,1000,10,"special","artillery","vtol","Infecting Flying Black Hydra","Flagship with Vtol thrusters... wait what?"},
    {"raptor_matriarch_fire","raptor_mama_fi","超级火焰母体","火焰喷射类虫群之母！",10,80,650000,3,55,2000,5,"special","berserk","raptor","Infecting Fire Raptor","Fire Raptor."},
    {"raptor_matriarch_electric","raptor_mama_el","超级瘫痪母体","瘫痪类虫群之母！",10,80,400000,3,55,2000,5,"special","berserk","raptor","Infecting Electric Raptor","Electric Raptor."},
    {"raptor_matriarch_acid","raptor_mama_ac","超级酸液母体","酸性类虫群之母！",10,80,500000,3,55,2000,5,"special","berserk","raptor","Infecting Acid Raptor","Acid Raptor."},

    {"critter_penguinking","raptor_consort","猛禽秘侍","诡秘强悍，小小煞星 !",10,67.5,baseHealth*8,3,80,1000,5,"special","raider","berserk","raptor Consort","Sneaky powerful little terror."},
    {"critter_penguinking","raptor_doombringer","末日使者","死期已至，汝命将尽，女王降临 !",1,50,baseHealth*10,3,85,1000,99,"special","berserk","raptor","Doombringer","Your time is up. The Queens called for backup."},
    {"armcomboss","armcomboss_1","感染史诗级指挥官 - 最终首领","我超他丫的 我们死定了!",1,30,baseHealth*18,1,85,1000,99,"special","berserk","raptor","Epic Commander - Final Boss","Oh s##t we are so dead"},
    {"corcomboss","corcomboss_1","感染史诗级指挥官 - 最终首领","我超他丫的 我们死定了!",1,30,baseHealth*18,1,85,1000,99,"special","berserk","raptor","Epic Beast - Final Boss","Infecting Mobile Heavy Turret!"},
    {"armscavengerbossv2_epic","armscavengerbossv2_1","感染格式塔 终极兵器 - 最终首领","拾荒者之父!",1,37.5,baseHealth*20,1,88,1000,99,"special","raider","raptor","Epic Scavenger - Final Boss","Father of All Scavengers"},
    {"scavengerbossv4_epic","scavengerbossv4_epic_1","感染军团 终极兵器 - 最终首领","拾荒者始祖!",1,37.5,baseHealth*25,1,88,1000,99,"special","raider","raptor","Epic Commander - Final Boss","Father of All Scavengers"},
}
-- 生成Raptor基础单位配置
for _, unitCfg in ipairs(raptorUnitList) do
    local overrideCfg = BuildBaseUnitCfg(unitCfg)
    CopyUnitDef(unitCfg[1], unitCfg[2], overrideCfg)
end
-- ===================== 批量强化空对空Raptor单位（血量×5） =====================
for unitName, unitDef in pairs(UnitDefs) do
    if string.find(unitName:lower(), "raptor_air") and unitDef.health then
        unitDef.health = unitDef.health * CONST.RAPTOR_AIR_HEALTH_MULT
    end
    if string.find(unitName:lower(), "raptor_land_swarmer_heal")  then
        unitDef.workertime = unitDef.workertime * 2
        unitDef.builddistance = unitDef.builddistance * 1.5
    end
end-- ===================== 玩家专属单位配置 =====================
playerUnitList = {
    {"armthundt4","armthundt4_human","激光轰炸机","史诗激光轰炸机",220,100000,"vtol","Epic Laser Bomber","Epic Laser Bomber!"},
    {"legafigdef","legafigdef_human","史诗阿贾克斯","防御制空战斗机!",270,15000,"vtol","Epic Ajax","Defensive Air Fighter!"},
    {"corvamp","corvamp_human","史诗夜鹰","雷达隐形战斗机",380,19000,"vtol","Epic Hawk","Radar Stealth Fighter!"},
    {"armhawk","armhawk_human","史诗狂风","雷达隐形战斗机",360,21000,"vtol","Epic Wind","Radar Stealth Fighter!"},
    {"armbrawl","armbrawl_human","女妖","史诗炮艇",160,30000,"vtol","Epic Banshee","Gunship"},
    {"corape","corape_human","史诗黄蜂","史诗炮艇",160,30000,"vtol","Epic Corape","Gunship"},
    {"legkam","legkam_human","爆 蚊","自爆无人机",400,160,"vtol","Baneling","Self-destructs to deal explosive damage to target area!"},
    {"legafigdef","legafigdef_human_t4","T4实验级阿贾克斯","防御制空战斗机!",270,15000,"vtol","T4 Epic Ajax","Defensive Air Fighter!"},
    {"corvamp","corvamp_human_t4","T4实验级夜鹰","雷达隐形战斗机",380,19000,"vtol","T4 Epic Hawk","Radar Stealth Fighter!"},
    {"armhawk","armhawk_human_t4","T4实验级狂风","雷达隐形战斗机",360,21000,"vtol","T4 Epic Wind","Radar Stealth Fighter!"},

    {"armaca","armaca_t4","T4 工程飞机","T4科技工程单位",192,200,"vtol","T4 Construction Aircraft","Tech 4 Constructor"},
    {"armack","armack_t4","T4 工程机器人","T4科技工程单位",40,930,"standard","T4 Construction Bot","Tech 4 Constructor"},
    {"armacv","armacv_t4","T4 工程载具","T4科技工程单位",55,2050,"standard","T4 Construction Vehicle","Tech 4 Constructor"},
    {"coraca","coraca_t4","T4 工程飞机","T4科技工程单位",192,205,"vtol","T4 Construction Aircraft","Tech 4 Constructor"},
    {"corack","corack_t4","T4 工程机器人","T4科技工程单位",40,1000,"standard","T4 Construction Bot","Tech 4 Constructor"},
    {"coracv","coracv_t4","T4 工程载具","T4科技工程单位",55,2150,"standard","T4 Construction Vehicle","Tech 4 Constructor"},
    {"legaca","legaca_t4","T4 工程飞机","T4科技工程单位",203,195,"vtol","T4 Construction Aircraft","Tech 4 Constructor"},
    {"legack","legack_t4","T4 工程机器人","T4科技工程单位",46,860,"standard","T4 Construction Bot","Tech 4 Constructor"},
    {"legacv","legacv_t4","T4 工程载具","T4科技工程单位",60,1950,"standard","T4 Construction Vehicle","Tech 4 Constructor"},

    {"legfortt4","legfortt4_human","T4实验级 暴君","巨型飞行要塞",nil,nil,"vtol","T4 Epic Tyrannus","Gigantic Flying Fortress!"},
    {"corfblackhyt4","corfblackhyt4_human","T4实验级 海德拉","带有垂直起降推进器的旗舰...等等，什么？",100,nil,"vtol","T4 Flying Black Hydra","Flagship with Vtol thrusters... wait what?"},
    {"armfepocht4","armfepocht4_human","T4实验级 纪元","带垂直起降推进器的旗舰... 等等，什么？",100,nil,"vtol","T4 Flying Epoch","Flagship with Vtol thrusters... wait what?"},
    {"legeheatraymech_old","legeheatraymech_human","巨像","热能武器机甲",40,200000,"standard","Colossus","Heat Ray Weapon Mech!"},
    {"cormart","cormart_human","攻城坦克","固定火炮",58,10000,"standard","Siege Tank","Fixed Gun Battle Tank!"},
    {"legshot","legshot_human","不朽者","防护罩机甲",50,55000,"standard","Immortal","Shield Mech!"},
    {"armmeatball","armmeatball_human","歌利亚","机枪步行机甲",30,220000,"standard","Goliath","Machine Gun Weapon Mech!"},
    {"corkarganetht4","corkarg_human","雷神","重型攻击机甲",40,500000,"standard","Thor","Eternal Weapon Mech!"},
    {"cordemon","cordemon_human","火蝠","火焰喷射机甲",60,720000,"standard","Firebat","Flamethrower Mech"},
    {"legstr","legstr_human","陆战队员","机枪步兵",84,80000,"standard","Marine","Machine Gun Infantry!"},
    {"corkarg","corkarganetht4_t4","追猎者","全地形两栖突击机甲",nil,nil,"standard","Stalker","All-Terrain Amphibious Assault Mech"},
    {"armliche","armliche_t4","T4 巫妖","战略原子轰炸机!",nil,nil,"vtol","T4 Epic Lich","Atomic Bomber"},
    {"legelrpcmech","legelrpcmech_t4","金甲虫","远程集束等离子攻城机甲",nil,nil,"standard","Reaver","Long-Range Cluster Plasma Siege Mech"},
    {"legbunk","legbunk_t4","狂热者","快速突击机甲",nil,nil,"standard","Zealot","Fast Assault Mech"},
    {"corshiva","corshiva_t4","战 狼","两栖攻城机甲",nil,nil,"standard","Warhound","Amphibious Siege Mech"},

    {"armaak","armaak_t4","T4 大天使","两栖防空机器人",nil,nil,"standard","T4 Epic AaK","Archangel Amphibious Anti-Air Bot"},
    {"armyork","armyork_t4","T4 粉碎者","防空高射炮载具",nil,nil,"standard","T4 Shredder","Anti-Air Flak Vehicle"},
    {"corsent","corsent_t4","T4 狂怒","T4 防空高射炮车",nil,nil,"standard","T4 Fury","Anti-Air Flak Vehicle"},
    {"coraak","coraak_t4","T4 蝎尾狮","重型两栖防空机器人",nil,nil,"standard","T4 Manticore","Heavy Amphibious Anti-Air Bot"},
    {"legadvaabot","legadvaabot_t4","T4 阿奎隆","T4 重型两栖防空机器人",nil,nil,"standard","T4 Aquilon","Heavy Amphibious Anti-Air Bot"},
    {"legvflak","legvflak_t4","T4 卡戎","T4 防空机枪卡车",nil,nil,"standard","T4 Charon","Anti-Air Minigun Truck"},

    {"raptor_land_spiker_basic_t4_v1","hydralisk","刺 蛇","对地对空尖刺异虫",140,nil,"standard","Hydralisk","Anti-Ground and Anti-Air Spiked Alien"},
    {"raptor_land_kamikaze_basic_t4_v1","baneling","爆 虫","自毁型异虫 死亡时能造成大范围伤害",nil,nil,"standard","Baneling","Self-Destructs to deal explosive damage to target area"},
    {"raptor_land_assault_acid_t2_v1","roach","蟑 螂","酸液突击单位",80,nil,"standard","Roach","Acid Assault Unit"},
    {"raptor_air_kamikaze_basic_t2_v1","scourge","爆 蚊","自毁式飞行异虫",nil,nil,"vtol","Scourge","Self-Destruct Flying Alien"},
    {"raptor_air_fighter_basic_t4_v1","mutalisk","异 龙","快速飞行攻击异虫",350,nil,"vtol","Mutalisk","Fast Flying Attack Alien"},
    {"raptor_matriarch_basic","ultralisk","雷 兽","重型攻击范围性顺劈猛兽",100,nil,"standard","Ultralisk","Heavy Assault Beast"},
    {"legfortt4","battlecruiser","战列巡洋舰","强大的战舰。可以使用大和炮",40,nil,"vtol","Battlecruiser","Powerful warship. Can use Yamato Cannon"},
    {"legmost3","voidray","虚空辉光舰","高能光束武器战舰",nil,nil,"vtol","Void Ray","High-Energy Beam Weapon Warship"},
    {"corkarganetht4","immortal","不朽者","防护罩机甲",nil,nil,"standard","Immortal","Shield Mech!"},

    {"legstarfall","legstarfall_human","终极对空星落","远程火箭发射器",0,50000,"standard","Epic Starfall","Starfall!"},
    {"armapt3","armapt3_human","T4 飞行工厂","生产T4 飞行单位",0,20000,"standard","T4 Flight Factory","Production T4 flight unit"},
    {"armshltx","armshltx_human","T4 地面工厂","生产T4 地面单位",0,30000,"standard","T4 Ground Factory ","Production T4 ground unit"},
    {"corapt3","corapt3_human","T4 飞行工厂","生产T4 飞行单位",0,20000,"standard","T4 Flight Factory ","Production T4 flight unit"},
    {"corgant","corgant_human","T4 地面工厂","生产T4 地面单位",0,30000,"standard","T4 Ground Factory ","Production T4 ground unit"},
    {"legapt3","legapt3_human","T4 飞行工厂","生产T4 飞行单位",0,20000,"standard","T4 Flight Factory ","Production T4 flight unit"},
    {"leggant","leggant_human","T4 地面工厂","生产T4 地面单位",0,30000,"standard","T4 Ground Factory ","Production T4 ground unit"},
--  {"corbuzz","corbuzz_human","洲际导弹 灾难","核弹洲际弹道导弹发射器",0,20000,"standard","Epic Intercontinental Missile Disaster","Intercontinental Missile Disaster!"},
    {"corbuzz","corbuzz_human","浩劫轰击","速射远程等离子炮!",0,80000,"standard","Epic Calamity","Rapid-Fire Long-Range Plasma Cannon!"},
    {"armvulc","armvulc_human","终极诸神黄昏","速射远程等离子炮!",0,80000,"standard","Epic Ragnarok","Rapid-Fire Long-Range Plasma Cannon!"},
    {"legstarfall","legstarfall_t4","天劫轰击","远程核弹发射器",nil,50000,"standard","Epic Starfall","Starfall!"},
    
    {"armvulc","armvulc_t4","可移动的诸神黄昏","速射远程等离子炮!",60,nil,"standard","Epic CanMove Ragnarok","Rapid-Fire Long-Range Plasma Cannon!"},
    {"corbuzz","corbuzz_t4","可移动的浩劫轰击","速射远程等离子炮!",60,nil,"standard","Epic CanMove Calamity","Rapid-Fire Long-Range Plasma Cannon!"},
    {"legstarfall","legstarfall_mt4","可移动的星陨","远程等离子发射器",60,nil,"standard","Epic CanMove Starfall","Starfall!"},

    {"armguard","armguard_t4","T4 铁拳堡垒","区域压制等离子火炮",0,5500,"standard","T4 Gauntlet","Area Control Plasma Artillery"},
    {"armbeamer","armbeamer_t4","T4 光束塔","光束激光炮塔",0,5800,"standard","T4 Beam Turret","Beam Laser Turret"},
    {"armhlt","armhlt_t4","T4 守望者","区域压制激光塔",0,6800,"standard","T4 Laser Turret","Area Control Laser Tower"},
    {"armmercury","armmercury_t4","T4 水星","远程防空塔",0,7900,"standard","T4 Laser Turret","Long Range Anti-Air Tower"},
    {"armcir","armcir_t4","T4 链锯","中程防空导弹阵地",0,8600,"standard","T4 Circular Turret","Medium-Range Anti-Air Missile Battery"},
    {"armrl","irondome","铁 穹","区域拒止阵列",nil,5500,"standard","Iron Dome","Area Denial Array"},

    {"corpun","corpun_t4","T4 煽动者","区域压制等离子火炮",0,8900,"standard","T4 Agitator","Circular Laser Turret"},
    {"corllt","corllt_t4","T4 激光炮塔","激光塔",0,4800,"standard","T4 Guard","Light Laser Tower"},
    {"corerad","corerad_t4","T4 根除者","中程防空导弹阵列",0,6800,"standard","T4 Eradicator","Medium-Range Anti-Air Missile Battery"},
    {"corhlt","corhlt_t4","T4 终结者","区域压制激光炮塔",0,7800,"standard","T4 Warden","Area Control Laser Tower"},
    {"cormadsam","cormadsam_t4","T4  MADSAM","加固防空导弹炮台",0,9800,"standard","T4 SAM","Hardened Anti-Air Missile Battery"},

    {"legacluster","legacluster_t4","T4 开膛者","弹出式集束等离子火炮",0,9700,"standard","T4 Eviscerator","Pop-up Cluster Plasma Artillery"},
    {"legmg","legmg_t4","T4 喧嚣壁垒","重型地对空加特林机枪炮塔",0,7900,"standard","T4 Cacophony","Heavy Land/Air Gatling Gun Turret"},
    {"leglupara","leglupara_t4","T4 卢帕拉","抗炸弹中程防空高射炮台",0,8900,"standard","T4 Lupara","Bomb-Resistant Medium-Range Anti-Air Flak Battery"},
    {"legrhapsis","legrhapsis_t4","T4 狂想曲壁垒","齐射防空导弹阵列",0,9800,"standard","T4 Rhapsis","Salvo Anti-Air Missile Battery"},
    {"legbombard","legbombard_t4","T4 轰炸者","榴弹发射器防御",0,8800,"standard","T4 Bombardier","Grenade Launcher Defence"},
    {"leglrpc","leglrpc_t4","T4 奥林匹斯","远程集束等离子炮",0,8800,"standard","T4 Olympus","Long-Range Cluster Plasma Cannon"},
}
local table2 = {
    {"armafust3","armafust3_t4","T4 聚变反应堆","生产超级能量（极度危险）",0,20000,"standard","T4 Fusion Reactor","Producing super energy (extremely dangerous)"},
    {"armmmkrt3","armmmkrt3_t4","T4 能量转换器","生产超级金属（极度危险）",0,20000,"standard","T4 Energy Converter","Producing super metals (extremely dangerous)"},
    {"corafust3","corafust3_t4","T4 聚变反应堆","生产超级能量（极度危险）",0,20000,"standard","T4 Engineering Tower","Producing super energy (extremely dangerous)"},
    {"cormmkrt3","cormmkrt3_t4","T4 能量转换器","生产超级金属（极度危险）",0,20000,"standard","T4 Engineering Tower","Producing super metals (extremely dangerous)"},
    {"legafust3","legafust3_t4","T4 聚变反应堆","生产超级能量（极度危险）",0,20000,"standard","T4 Engineering Tower","Producing super energy (extremely dangerous)"},
    {"legadveconvt3","legadveconvt3_t4","T4 能量转换器","生产超级金属（极度危险）",0,20000,"standard","T4 Engineering Tower","Producing super metals (extremely dangerous)"},
    {"armmoho","armmoho_t4","T4 金属提取器","生产超级资源（极度危险）",0,20000,"standard","T4 Metal Extractor","Metal Extractor / Storage (extremely dangerous)"},
    {"armcomboss","bluegundam","舰队 终极兵器","人形机器人",nil,nil,"standard","Armada Final Weapon","Humanoid Robot"},
    {"corcomboss","redgundam","格式塔 终极兵器","人形机器人",nil,nil,"standard","Cortex Final Weapon","Humanoid Robot"},
    {"scavengerbossv4_epic","legiongundam","军团 终极兵器","人形机器人",nil,nil,"standard","Legion Final Weapon","Humanoid Robot"},
    {"legflak","legflak_t4","T4 普鲁托","防空机枪炮塔",nil,nil,"standard","T4 Pluto","Anti-Air Minigun"},
    {"armflak","armflak_t4","T4 弩炮","空地机枪炮塔",nil,nil,"standard","T4 armflak","Minigun"},
    {"corflak","corflak_t4","T4 鸟弹","空地机枪炮塔",nil,nil,"standard","T4 corflak","Minigun"},
    {"armlwall","armlwall_t4","T4 龙之怒","弹出式持续闪电炮塔",0,5320,"standard","T4 Dragon's Fury","Pop-up Continuous Lightning Turret"},
    {"cormwall","cormwall_t4","T4 龙怒","弹出式多管火箭发射器",0,5320,"standard","T4 Dragon's Rage","Pop-up Multiple Rocket Launcher"},
    
}

for _, unitData in ipairs(table2) do
    table.insert(playerUnitList, unitData)
end-- ===================== 1. 常量&配置表 =====================
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
end--清空复制的可建造单位
UnitDefs.armapt3_human.buildoptions= {};
UnitDefs.armshltx_human.buildoptions= {};
UnitDefs.corapt3_human.buildoptions= {};
UnitDefs.corgant_human.buildoptions= {};
UnitDefs.legapt3_human.buildoptions= {};
UnitDefs.leggant_human.buildoptions= {};
UnitDefs.armaca_t4.buildoptions= {};
UnitDefs.armack_t4.buildoptions= {};
UnitDefs.armacv_t4.buildoptions= {};
UnitDefs.coraca_t4.buildoptions= {};
UnitDefs.corack_t4.buildoptions= {};
UnitDefs.coracv_t4.buildoptions= {};
UnitDefs.legaca_t4.buildoptions= {};
UnitDefs.legack_t4.buildoptions= {};
UnitDefs.legacv_t4.buildoptions= {};
-- 建筑→对应可建造单位映射
BUILDING_UNITS = {
    ["corapt3"] = {"corape_human","corvamp_human"},
    ["armapt3"] = {"armbrawl_human","armhawk_human"},
    ["legapt3"] = {"legkam_human","legafigdef_human"},
    ["armapt3_human"] = {"armhawk_human_t4","armfepocht4_human","armaca_t4","armliche_t4","mutalisk","scourge"},
    ["armshltx_human"] = {"armack_t4","armacv_t4","armaak_t4","armyork_t4","hydralisk","baneling","roach","ultralisk"},
    ["legapt3_human"] = {"legafigdef_human_t4","legfortt4_human","legaca_t4","voidray"},
    ["leggant_human"] = {"legack_t4","legacv_t4","legeheatraymech_human","legshot_human","legadvaabot_t4","legvflak_t4","corkarganetht4_t4","legbunk_t4","legelrpcmech_t4","immortal"},
    ["corapt3_human"] = {"corvamp_human_t4","corfblackhyt4_human","coraca_t4","battlecruiser"},
    ["corgant_human"] = {"corack_t4","coracv_t4","cormart_human","cordemon_human","corsent_t4","coraak_t4","corshiva_t4","armmeatball_human","corkarg_human","legstr_human",},
    ["armaca"] = {"armapt3_human","armshltx_human","armvulc_human"},
    ["armack"] = {"armapt3_human","armshltx_human","armvulc_human"},
    ["armacv"] = {"armapt3_human","armshltx_human","armvulc_human"},
    ["coraca"] = {"corapt3_human","corgant_human","corbuzz_human"},
    ["corack"] = {"corapt3_human","corgant_human","corbuzz_human"},
    ["coracv"] = {"corapt3_human","corgant_human","corbuzz_human"},
    ["legaca"] = {"legapt3_human","leggant_human","legstarfall_human"},
    ["legack"] = {"legapt3_human","leggant_human","legstarfall_human"},
    ["legacv"] = {"legapt3_human","leggant_human","legstarfall_human"},
    ["armaca_t4"] = {"armlwall_t4","armapt3_human","armshltx_human","armvulc_human","armguard_t4","armbeamer_t4","armhlt_t4","armmercury_t4","armcir_t4","armnanotct3","armafust3_t4","armmmkrt3_t4","armarad","armarad","armmoho_t4","irondome","armgatet3","armvulc_t4","armflak_t4"},
    ["armack_t4"] = {"armlwall_t4","armapt3_human","armshltx_human","armvulc_human","armguard_t4","armbeamer_t4","armhlt_t4","armmercury_t4","armcir_t4","armnanotct3","armafust3_t4","armmmkrt3_t4","armarad","armarad","armmoho_t4","irondome","armgatet3","armvulc_t4","armflak_t4"},
    ["armacv_t4"] = {"armlwall_t4","armapt3_human","armshltx_human","armvulc_human","armguard_t4","armbeamer_t4","armhlt_t4","armmercury_t4","armcir_t4","armnanotct3","armafust3_t4","armmmkrt3_t4","armarad","armarad","armmoho_t4","irondome","armgatet3","armvulc_t4","armflak_t4"},
    ["coraca_t4"] = {"cormwall_t4","corapt3_human","corgant_human","corbuzz_human","corpun_t4","corllt_t4","corerad_t4","corhlt_t4","cormadsam_t4","cornanotct3","corafust3_t4","cormmkrt3_t4","corarad","armmoho_t4","irondome","corgatet3","corbuzz_t4","corflak_t4"},
    ["corack_t4"] = {"cormwall_t4","corapt3_human","corgant_human","corbuzz_human","corpun_t4","corllt_t4","corerad_t4","corhlt_t4","cormadsam_t4","cornanotct3","corafust3_t4","cormmkrt3_t4","corarad","armmoho_t4","irondome","corgatet3","corbuzz_t4","corflak_t4"},
    ["coracv_t4"] = {"cormwall_t4","corapt3_human","corgant_human","corbuzz_human","corpun_t4","corllt_t4","corerad_t4","corhlt_t4","cormadsam_t4","cornanotct3","corafust3_t4","cormmkrt3_t4","corarad","armmoho_t4","irondome","corgatet3","corbuzz_t4","corflak_t4"},
    ["legaca_t4"] = {"legapt3_human","leggant_human","legstarfall_human","legacluster_t4","legmg_t4","leglupara_t4","legrhapsis_t4","legbombard_t4","legnanotct3","legafust3_t4","legadveconvt3_t4","leglrpc_t4","legarad","legstarfall_t4","armmoho_t4","irondome","leggatet3","legstarfall_mt4","legflak_t4"},
    ["legack_t4"] = {"legapt3_human","leggant_human","legstarfall_human","legacluster_t4","legmg_t4","leglupara_t4","legrhapsis_t4","legbombard_t4","legnanotct3","legafust3_t4","legadveconvt3_t4","leglrpc_t4","legarad","legstarfall_t4","armmoho_t4","irondome","leggatet3","legstarfall_mt4","legflak_t4"},
    ["legacv_t4"] = {"legapt3_human","leggant_human","legstarfall_human","legacluster_t4","legmg_t4","leglupara_t4","legrhapsis_t4","legbombard_t4","legnanotct3","legafust3_t4","legadveconvt3_t4","leglrpc_t4","legarad","legstarfall_t4","armmoho_t4","irondome","leggatet3","legstarfall_mt4","legflak_t4"},
    ["armcom"]={"bluegundam"},
    ["corcom"]={"redgundam"},
    ["legcom"]={"legiongundam"},
}
-- 深拷贝表（避免引用传递）
function deepCopy(t)
    local copy = {}
    for k, v in pairs(t) do
        copy[k] = type(v) == "table" and deepCopy(v) or v
    end
    return copy
end
UnitDefs.raptor_land_swarmer_brood_t2_v1 = deepCopy(UnitDefs.corhurc); 
UnitDefs.raptor_land_swarmer_basic_t3_v3 = deepCopy(UnitDefs.leggobt3);
UnitDefs.raptor_land_swarmer_basic_t2_v3 = deepCopy(UnitDefs.legvflak);
UnitDefs.raptor_air_scout_basic_t2_v1 = deepCopy(UnitDefs.corcrwh);
UnitDefs.raptor_air_scout_basic_t3_v1 = deepCopy(UnitDefs.legfort);
UnitDefs.raptor_air_scout_basic_t4_v1 = deepCopy(UnitDefs.corcrwt4);
UnitDefs.raptor_land_swarmer_basic_t1_v1 = deepCopy(UnitDefs.corcan);
UnitDefs.raptor_land_swarmer_basic_t3_v2 = deepCopy(UnitDefs.armthor);
UnitDefs.raptor_allterrain_swarmer_basic_t4_v1 = deepCopy(UnitDefs.legeheatraymech_old);
UnitDefs.raptor_land_assault_basic_t4_v2 = deepCopy(UnitDefs.legeheatraymech_old);
UnitDefs.raptor_land_swarmer_basic_t2_v1 = deepCopy(UnitDefs.corgol);
UnitDefs.raptor_land_swarmer_emp_t2_v1 = deepCopy(UnitDefs.raptor_mama_el);
UnitDefs.raptor_land_assault_basic_t2_v1 = deepCopy(UnitDefs.raptor_mama_fi);
UnitDefs.raptor_land_assault_basic_t4_v1 = deepCopy(UnitDefs.raptor_mama_fi);
UnitDefs.raptor_air_fighter_basic_t2_v1 = deepCopy(UnitDefs.armhawk);
UnitDefs.raptor_air_bomber_basic_t1_v1 = deepCopy(UnitDefs.corcrwt4);
UnitDefs.raptor_air_bomber_basic_t2_v1 = deepCopy(UnitDefs.corcrwt4);
UnitDefs.raptor_air_fighter_basic_t1_v1 = deepCopy(UnitDefs.legafigdef_1);
UnitDefs.raptor_land_swarmer_basic_t3_v1 = deepCopy(UnitDefs.legeheatraymech_old);

-- 函数：批量修改单位属性（基础属性+武器属性）
-- 参数：unitDef-单位定义, cfg-当前单位类型的倍率配置
function modifyUnitAttributes(unitDef, cfg)
    if not unitDef or not unitDef.health then return end
    -- 修改基础属性：血量、能量/金属成本、建造时间
    unitDef.health = unitDef.health * cfg.health_mult
    if unitDef.energycost then unitDef.energycost = unitDef.energycost * cfg.cost_mult_energ end
    if unitDef.metalcost then unitDef.metalcost = unitDef.metalcost * cfg.cost_mult_meta end
    if cfg.buildtime_mult and unitDef.buildtime then unitDef.buildtime = unitDef.buildtime * cfg.buildtime_mult end
    if cfg.workertime_mult and unitDef.workertime then unitDef.workertime = unitDef.workertime * cfg.workertime_mult end
    -- 修改武器属性：伤害（所有类型）+ 射程（可选）
    if not unitDef.weapondefs then return end
    for _, weaponDef in pairs(unitDef.weapondefs) do
        if weaponDef.damage then
            for damageType, oldDamage in pairs(weaponDef.damage) do
                weaponDef.damage[damageType] = (oldDamage or 0) * cfg.damage_mult
            end
            weaponDef.damage.shields = 5000
        end
        if cfg.range_mult and weaponDef.range then
            weaponDef.range = weaponDef.range * cfg.range_mult
            if  weaponDef.flighttime then
                weaponDef.flighttime = weaponDef.flighttime * 2
            end  
        end

        if  weaponDef.energypershot then
            weaponDef.energypershot = weaponDef.energypershot * 5
        elseif cfg.energypershot_mult then
            weaponDef.energypershot = cfg.energypershot_mult
        end     
    end
end
-- ===================== 批量处理单位属性 =====================
for unitName, unitDef in pairs(UnitDefs) do
    -- 处理空中/地面/玩家空中单位（通过配置表批量处理，消除重复循环）
    for _, typeCfg in pairs(UNIT_CFG) do
        for _, targetUnit in ipairs(typeCfg.list) do
            if unitName == targetUnit then
                modifyUnitAttributes(unitDef, typeCfg)
                break  -- 匹配到目标单位后跳出，避免无效遍历
            end
        end
    end
    -- 给建筑添加可建造单位（去重）
    for buildingName, targetUnits in pairs(BUILDING_UNITS) do
        if unitName == buildingName and unitDef.buildoptions then
            for _, targetUnit in ipairs(targetUnits) do
                if not table.contains(unitDef.buildoptions, targetUnit) then
                    table.insert(unitDef.buildoptions, targetUnit)
                end
            end
        end
    end
end
--先给单位替换武器 再调整武器数值
UnitDefs.corkarg_human.weapondefs.karg_shoulder = deepCopy(UnitDefs.corkarg.weapondefs.super_missile);
UnitDefs.armmeatball_human.weapondefs.armamph_missile = deepCopy(UnitDefs.corkarg.weapondefs.super_missile);
UnitDefs.cormart_human.weapondefs.cor_artillery = deepCopy(UnitDefs.corgolt4.weapondefs.corlevlr_weapon);

UnitDefs.raptor_consort.weapondefs.goo=deepCopy(UnitDefs['raptor_queen_epic'].weapondefs.goo);
UnitDefs.raptor_doombringer.weapondefs.goo=deepCopy(UnitDefs['raptor_queen_epic'].weapondefs.goo);
UnitDefs.legstarfall_human.weapondefs.starfire =deepCopy(UnitDefs.armaak.weapondefs.longrangemissile);
local copiedWeapon = deepCopy(UnitDefs.armaak.weapons[1])
copiedWeapon.def = "starfire"
UnitDefs.legstarfall_human.weapons[1]=copiedWeapon;
UnitDefs.corfblackhyt4_human.weapondefs.heavyplasma = deepCopy(UnitDefs.corgolt4.weapondefs.corlevlr_weapon);
UnitDefs.corfblackhyt4_1.weapondefs.heavyplasma = deepCopy(UnitDefs.corgolt4.weapondefs.corlevlr_weapon);
UnitDefs.corkarganetht4_t4.weapondefs.super_missile =nil;
UnitDefs.corkarganetht4_t4.weapondefs.karg_shoulder =nil;
UnitDefs.corkarganetht4_t4.weapondefs.super_missile =deepCopy(UnitDefs.legsrailt4.weapondefs.railgunt2);
UnitDefs.corkarganetht4_t4.weapondefs.karg_shoulder =deepCopy(UnitDefs.armbeamer.weapondefs.armbeamer_weapon);
UnitDefs.legbunk_t4.weapons[3]=nil;
UnitDefs.legbunk_t4.weapons[1]=nil;
UnitDefs.armmoho_t4.sfxtypes=UnitDefs.lootboxsilver.sfxtypes;
UnitDefs.ultralisk.weapons[5]=nil;
UnitDefs.ultralisk.weapons[4]=nil;
UnitDefs.ultralisk.weapons[3]=nil;
UnitDefs.ultralisk.weapons[2]=nil;
UnitDefs.battlecruiser.weapondefs.plasma = deepCopy(UnitDefs.armcomboss_1.weapondefs.disintegratorxl);
UnitDefs.battlecruiser.weapondefs.aa_missiles =deepCopy(UnitDefs.battlecruiser.weapondefs.semiauto);
UnitDefs.irondome.weapondefs.fmd_rocket=deepCopy(UnitDefs.corfmd.weapondefs.fmd_rocket);
UnitDefs.irondome.weapons[1]=nil;
UnitDefs.voidray.weapondefs.exp_heavyrocket=deepCopy(UnitDefs.armbeamer.weapondefs.armbeamer_weapon);
UnitDefs.voidray.weapons[1]=nil;
UnitDefs.immortal.weapondefs.super_missile = deepCopy(UnitDefs.corbuzz.weapondefs.rflrpc);
UnitDefs.immortal.weapons[2]=nil;
UnitDefs.legelrpcmech_t4.weapondefs.shocker_low.customparams = nil;
UnitDefs.armscavengerbossv2_1.customparams.i18nfromunit  = nil;
UnitDefs.scavengerbossv4_epic_1.customparams.i18nfromunit  = nil;
UnitDefs.legiongundam.customparams.i18nfromunit  = nil;
UnitDefs.armflak_t4.weapons[1]=nil;
UnitDefs.corflak_t4.weapons[1]=nil;local ab = 1
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
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
end
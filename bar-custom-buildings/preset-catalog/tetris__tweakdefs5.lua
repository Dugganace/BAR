--清空复制的可建造单位
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
UnitDefs.corflak_t4.weapons[1]=nil;
-- T3 Com Features
local P={{"armck","armckx"},{"armcv","armcvx"},{"armbeaver","armbeaverx"},{"armca","armcax"},{"corck","corckx"},{"corcv","corcvx"},{"cormuskrat","cormuskratx"},{"corca","corcax"},{"legck","legckx"},{"legcv","legcvx"},{"legotter","legotterx"},{"legca","legcax"}}local function cp(t)if type(t)~="table"then return t end local n={}for k,v in pairs(t)do n[k]=cp(v)end return n end local function has(ud,u)if not ud or type(ud.buildoptions)~="table"then return false end for _,v in pairs(ud.buildoptions)do if v==u then return true end end return false end local function add(ud,u)if not ud or not UnitDefs[u]then return end ud.buildoptions=ud.buildoptions or{}if not has(ud,u)then ud.buildoptions[#ud.buildoptions+1]=u end end local function rep(ud,a,b)if not ud or type(ud.buildoptions)~="table"then return end for i=#ud.buildoptions,1,-1 do if ud.buildoptions[i]==a then table.remove(ud.buildoptions,i)add(ud,b)end end end local function ic(sn,s,p)local c=s.customparams or{};p.customparams=p.customparams or{};p.buildpic=s.buildpic;p.buildPic=s.buildPic;p.iconname=s.iconname or s.iconName or c.iconname or c.iconName or sn;p.iconName=s.iconName or s.iconname or c.iconName or c.iconname or sn;local i=s.icontype or s.iconType or s.icon or c.icontype or c.iconType or c.icon or c.uniticon or c.unitIcon or c.strategicicon or c.strategicIcon or sn;p.icontype=i;p.iconType=i;p.icon=i;for _,k in ipairs({"icontype","iconType","icon","iconname","iconName","uniticon","unitIcon","strategicicon","strategicIcon"})do if c[k]~=nil then p.customparams[k]=c[k]end end;p.customparams.icontype=i;p.customparams.iconType=i;p.customparams.icon=i;p.customparams.iconname=p.iconname;p.customparams.iconName=p.iconName end local function loc(sn,s,p)local c=s.customparams or{};local nk="units.names."..sn;local dk="units.descriptions."..sn;p.name=s.name or nk;p.description=s.description or dk;p.tooltip=s.tooltip or dk;ic(sn,s,p);p.customparams.i18nfromunit=sn;p.customparams.i18n_from_unit=sn;p.customparams.i18n_en_humanname=c.i18n_en_humanname or s.name or nk;p.customparams.i18n_en_tooltip=c.i18n_en_tooltip or s.tooltip or s.description or dk;p.customparams.i18n_pl_humanname=c.i18n_pl_humanname or c.i18n_en_humanname or s.name or nk;p.customparams.i18n_pl_tooltip=c.i18n_pl_tooltip or c.i18n_en_tooltip or s.tooltip or s.description or dk;p.customparams.description=c.description or s.description or dk;p.customparams.tooltip=c.tooltip or s.tooltip or s.description or dk;p.customparams.humanname=c.humanname or s.name or nk end local function mk(sn,pn)local s=UnitDefs[sn]if not s then return end if not UnitDefs[pn]then UnitDefs[pn]=cp(s)end local p=UnitDefs[pn];local c=s.customparams or{};p.unitname=pn;p.unitName=pn;p.objectname=s.objectname;p.objectName=s.objectName;p.script=s.script;p.customparams=p.customparams or{};loc(sn,s,p);p.customparams.unitgroup=c.unitgroup or c.unitGroup or c.unit_group;p.customparams.unitGroup=c.unitGroup or c.unitgroup or c.unit_group;p.customparams.unit_group=c.unit_group or c.unitgroup or c.unitGroup;p.customparams.techlevel=c.techlevel;p.customparams.t3barb_private_constructor="1";p.customparams.t3barb_private_tier="1";p.customparams.t3barb="T3";p.customparams.t3barb_private_source="tweak0";p.maxthisunit=nil;p.maxThisUnit=nil;p.notbuildable=nil;p.notBuildable=nil;p.hidden=nil;p.hide=nil;p.disabled=nil;p.nobuild=nil;p.noBuild=nil;p.builder=true;p.canrepeat=true;p.canRepeat=true;p.customparams.hidden=nil;p.customparams.no_build=nil;p.customparams.notbuildable=nil;p.customparams.ai_ignore=nil;p.customparams.barbarian_ignore=nil;p.customparams.disabled=nil end local function trap(sn)local s=UnitDefs[sn]if not s then return end s.customparams=s.customparams or{};s.customparams.t3barb_stock_constructor_trap="1";s.customparams.ai_ignore="1";s.customparams.barbarian_ignore="1";s.customparams.hidden="1";s.customparams.no_build="1";s.customparams.notbuildable="1";s.maxthisunit=0;s.maxThisUnit=0;s.notbuildable=true;s.notBuildable=true end for _,q in ipairs(P)do mk(q[1],q[2])end for _,ud in pairs(UnitDefs)do if type(ud)=="table"and type(ud.buildoptions)=="table"then for _,q in ipairs(P)do rep(ud,q[1],q[2])end end end for _,q in ipairs(P)do trap(q[1])end

-- BARbAI selected reset patch #1:
-- T1 mobile combat cap 80, T1 mobile combat HP x0.5, corvac hard block.
do
  local T1_ARMY_LIMIT=50
  local T1_ARMY_HP_MULT=0.70
  local commanderUnits={armcom=true,corcom=true,legcom=true}

  local function cpof(ud)return (ud and ud.customparams)or{}end
  local function lower(v)return string.lower(tostring(v or ""))end
  local function isBuilding(ud)return ud and(ud.isbuilding or ud.isBuilding or ud.building or ud.yardmap or ud.canmove==false or ud.canMove==false)end
  local function hasBuildOptions(ud)return ud and type(ud.buildoptions)=="table" and next(ud.buildoptions)~=nil end
  local function isBuilder(ud)return ud and(ud.builder or ud.canbuild or ud.canBuild or hasBuildOptions(ud))end
  local function hasWeapons(ud)return ud and type(ud.weapons)=="table" and next(ud.weapons)~=nil end
  local function getMetal(ud)return ud and(ud.metalcost or ud.metalCost or 0)or 0 end
  local function getBuildTime(ud)return ud and(ud.buildtime or ud.buildTime or 0)or 0 end
  local function getTech(ud)
    if not ud then return nil end
    local cp=cpof(ud)
    local tech=cp.techlevel or cp.techLevel or cp.unittech or cp.unitTech or cp.tech or ud.techlevel or ud.techLevel
    if type(tech)=="number" then return tech end
    if type(tech)=="string" then
      local n=tonumber(tech)
      if n then return n end
      tech=lower(tech)
      if tech=="t1"or tech=="tech1"or tech=="tech 1"then return 1 end
      if tech=="t2"or tech=="tech2"or tech=="tech 2"then return 2 end
      if tech=="t3"or tech=="tech3"or tech=="tech 3"then return 3 end
    end
    return nil
  end
  local function estimateTier(ud)
    local tech=getTech(ud)
    if tech==1 or tech==2 then return tech end
    if tech and tech>=3 then return 3 end
    local m=getMetal(ud)
    local bt=getBuildTime(ud)
    if m>0 and m<=1000 and bt<=25000 then return 1 end
    if m>0 and m<=6000 and bt<=65000 then return 2 end
    return nil
  end
  local function setUnitLimitMax(ud,limit)
    if not ud then return end
    local old=ud.maxthisunit or ud.maxThisUnit
    if old==0 then return end
    if type(old)=="number" and old>0 and old<limit then return end
    ud.maxthisunit=limit
    ud.maxThisUnit=limit
  end

  for name,ud in pairs(UnitDefs)do
    if type(ud)=="table" and not commanderUnits[name] and estimateTier(ud)==1 and not isBuilding(ud) and hasWeapons(ud) and not isBuilder(ud) then
      setUnitLimitMax(ud,T1_ARMY_LIMIT)
      if not ud._barbai_t1_army_hp_trim then
        ud._barbai_t1_army_hp_trim=true
        local hp=ud.health or ud.maxdamage or ud.maxDamage
        if type(hp)=="number" and hp>0 then
          local nhp=math.max(1,math.floor(hp*T1_ARMY_HP_MULT+0.5))
          ud.health=nhp
          ud.maxdamage=nhp
          ud.maxDamage=nhp
        end
      end
    end
  end

  local blocked="corvac"
  for _,ud in pairs(UnitDefs)do
    if type(ud)=="table" and type(ud.buildoptions)=="table" then
      for i=#ud.buildoptions,1,-1 do
        if ud.buildoptions[i]==blocked then table.remove(ud.buildoptions,i)end
      end
    end
  end
  local u=UnitDefs[blocked]
  if u then
    u.maxthisunit=0
    u.maxThisUnit=0
    u.notbuildable=true
    u.notBuildable=true
    u.hidden=true
    u.hide=true
    u.disabled=true
    u.nobuild=true
    u.noBuild=true
    u.customparams=u.customparams or{}
    u.customparams.ai_ignore="1"
    u.customparams.barbarian_ignore="1"
    u.customparams.hidden="1"
    u.customparams.no_build="1"
    u.customparams.notbuildable="1"
  end
end
-- T3 Com | Armada
local comName="armcom"
local bossName="armbanth"
local speedMul=2.2

local COMMANDER_RANGE=800
local COMMANDER_RELOAD=1.0
local COMMANDER_RADAR=1200
local COMMANDER_SONAR=1200
local COMMANDER_SIGHT=1000
local COMMANDER_AIRSIGHT=1200
local COMMANDER_DAMAGE_MULT=2.45
local COMMANDER_DAMAGE_TAKEN=0.65
local COMMANDER_CLOAK_COST=1000
local COMMANDER_CLOAK_COST_MOVING=1000
local COMMANDER_MIN_CLOAK_DISTANCE=75
local COMMANDER_TURNRATE=4000

local function copyTable(t)
    if type(t)~="table" then return t end
    local n={}
    for k,v in pairs(t) do n[k]=copyTable(v) end
    return n
end

local function disableEmpParalyze(unitDef)
    if not unitDef then return end
    unitDef.paralyzemultiplier=0
    unitDef.paralyzeMultiplier=0
    unitDef.capturable=false
    unitDef.paralyzable=false
    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.paralyzemultiplier=0
    unitDef.customparams.paralyze_multiplier=0
    unitDef.customparams.emp_immunity="1"
    unitDef.customparams.no_stunner=true
end

local function getCommanderWeaponDamageMult(weaponName,wd,defaultMult)
    local n=string.lower(tostring(weaponName or wd and wd.name or ""))

    -- Armada:
    -- laser general DPS target ~12000
    -- blaster + rocket general DPS target ~6500
    if string.find(n,"tehlazerofdewm",1,true)
    or string.find(n,"lazer",1,true)
    or string.find(n,"laser",1,true) then
        return 2
    end

    if string.find(n,"armbantha_fire",1,true)
    or string.find(n,"bantha_rocket",1,true)
    or string.find(n,"rocket",1,true)
    or string.find(n,"blaster",1,true)
    or string.find(n,"fire",1,true) then
        return 2592025/1000000
    end

    return defaultMult
end

local function scaleWeaponDamage(weaponName,wd,mult)
    if not wd or not wd.damage then return end
    local finalMult=getCommanderWeaponDamageMult(weaponName,wd,mult)

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*finalMult
        end
    end

    if type(wd.damage.default)=="number" then
        wd.damage.commander=wd.damage.default*51/100
        wd.damage.commanders=wd.damage.default*51/100
    end
end

local function forceLocalWeaponDefs(unitDef,range,reload,damageMult)
    if not unitDef then return end
    unitDef.weapondefs=unitDef.weapondefs or {}

    for weaponName,wd in pairs(unitDef.weapondefs) do
        if wd then
            wd.range=range
            wd.reloadtime=reload
            wd.reload=reload
            scaleWeaponDamage(weaponName,wd,damageMult)
        end
    end

    if unitDef.weapons then
        for _,w in pairs(unitDef.weapons) do
            local weaponName=w.def or w.weapondef or w.name
            if weaponName then
                local lowerName=string.lower(weaponName)
                local wd=WeaponDefs[weaponName] or WeaponDefs[lowerName]
                if wd and not unitDef.weapondefs[lowerName] then
                    local wdCopy=copyTable(wd)
                    wdCopy.range=range
                    wdCopy.reloadtime=reload
                    wdCopy.reload=reload
                    scaleWeaponDamage(weaponName,wdCopy,damageMult)
                    unitDef.weapondefs[weaponName]=wdCopy
                    unitDef.weapondefs[lowerName]=wdCopy
                end
            end
        end
    end
end

local function forceDetectionFields(unitDef)
    if not unitDef then return end
    unitDef.sightdistance=COMMANDER_SIGHT
    unitDef.sightDistance=COMMANDER_SIGHT
    unitDef.losradius=COMMANDER_SIGHT
    unitDef.losRadius=COMMANDER_SIGHT
    unitDef.radardistance=COMMANDER_RADAR
    unitDef.radarDistance=COMMANDER_RADAR
    unitDef.radarradius=COMMANDER_RADAR
    unitDef.radarRadius=COMMANDER_RADAR
    unitDef.sonardistance=COMMANDER_SONAR
    unitDef.sonarDistance=COMMANDER_SONAR
    unitDef.sonarradius=COMMANDER_SONAR
    unitDef.sonarRadius=COMMANDER_SONAR
    unitDef.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.airSightDistance=COMMANDER_AIRSIGHT
    unitDef.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.airLosDistance=COMMANDER_AIRSIGHT
    unitDef.airlosradius=COMMANDER_AIRSIGHT
    unitDef.airLosRadius=COMMANDER_AIRSIGHT

    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.sightdistance=COMMANDER_SIGHT
    unitDef.customparams.sight_distance=COMMANDER_SIGHT
    unitDef.customparams.losradius=COMMANDER_SIGHT
    unitDef.customparams.los_radius=COMMANDER_SIGHT
    unitDef.customparams.radardistance=COMMANDER_RADAR
    unitDef.customparams.radar_distance=COMMANDER_RADAR
    unitDef.customparams.radarradius=COMMANDER_RADAR
    unitDef.customparams.radar_radius=COMMANDER_RADAR
    unitDef.customparams.sonardistance=COMMANDER_SONAR
    unitDef.customparams.sonar_distance=COMMANDER_SONAR
    unitDef.customparams.sonarradius=COMMANDER_SONAR
    unitDef.customparams.sonar_radius=COMMANDER_SONAR
    unitDef.customparams.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_sight_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosradius=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_radius=COMMANDER_AIRSIGHT

    unitDef.seismicsignature=0
    unitDef.stealth=false
    unitDef.sonarstealth=false
    unitDef.jamdistance=0
    unitDef.jamDistance=0
    unitDef.radarjamdistance=0
    unitDef.radarJamDistance=0
    unitDef.sonardistancejam=0
    unitDef.sonarDistanceJam=0

    unitDef.cancloak=true
    unitDef.canCloak=true
    unitDef.cloakcost=COMMANDER_CLOAK_COST
    unitDef.cloakCost=COMMANDER_CLOAK_COST
    unitDef.cloakcostmoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.cloakCostMoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.mincloakdistance=COMMANDER_MIN_CLOAK_DISTANCE
    unitDef.minCloakDistance=COMMANDER_MIN_CLOAK_DISTANCE
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]
if com and boss then
    for k,v in pairs(boss) do com[k]=copyTable(v) end
    disableEmpParalyze(com)
    forceDetectionFields(com)

    com.name="Armada Commander"
    com.unitname=comName
    com.description="Experimental Battle Commander"
    com.tooltip="Experimental Battle Commander"
    com.customparams={}
    com.customparams.iscommander="1"
    com.customparams.i18n_en_humanname="Armada Commander"
    com.customparams.i18n_en_tooltip="Experimental Battle Commander"
    com.customparams.commander_damage_balance="armada_general12k_laser_nonlaser_minus35_cmd51_hp85k"
    com.canexperience=false
    com.experience=0
    com.candgun=false
    com.canDgun=false
    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil
    com.customparams.level=nil
    com.customparams.veteran=nil
    com.customparams.veterancy=nil
    com.customparams.experience=nil
    com.customparams.xp=nil
    com.customparams.scavenger=nil
    com.customparams.scav=nil
    com.customparams.epic=nil
    com.customparams.boss=nil
    com.customparams.superboss=nil
    com.customparams.bonushealth=nil
    com.customparams.maxhealth=nil
    com.customparams.healthboost=nil
    com.customparams.healthmult=nil
    com.customparams.regen=nil
    com.customparams.regeneration=nil
    com.customparams.healthregen=nil
    com.customparams.autoheal=nil
    com.customparams.idleautoheal=nil

    disableEmpParalyze(com)

    com.builder=false
    com.buildoptions={}
    com.workertime=0
    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false

    com.canmove=true
    com.canattack=true
    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    -- Minimal commander body turnrate override.
    com.turnrate=COMMANDER_TURNRATE
    com.turnRate=COMMANDER_TURNRATE
    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5
    -- Commander HP balance
    com.health=85000
    com.maxdamage=85000
    com.maxDamage=85000

    forceLocalWeaponDefs(com,COMMANDER_RANGE,COMMANDER_RELOAD,COMMANDER_DAMAGE_MULT)

    com.damageModifier=COMMANDER_DAMAGE_TAKEN
    com.metalcost=0
    com.energycost=0
    com.buildtime=1

    disableEmpParalyze(com)
    forceDetectionFields(com)
end-- T3 Com | Cortex
local comName="corcom"
local bossName="corkorg"
local speedMul=1.85

local COMMANDER_RANGE=800
local COMMANDER_RELOAD=1.30
local COMMANDER_RADAR=1200
local COMMANDER_SONAR=1200
local COMMANDER_SIGHT=1000
local COMMANDER_AIRSIGHT=1200
local COMMANDER_DAMAGE_MULT=2.3
local COMMANDER_DAMAGE_TAKEN=0.55
local COMMANDER_CLOAK_COST=1000
local COMMANDER_CLOAK_COST_MOVING=1000
local COMMANDER_MIN_CLOAK_DISTANCE=75
local COMMANDER_TURNRATE=2000

local function copyTable(t)
    if type(t)~="table" then return t end
    local n={}
    for k,v in pairs(t) do n[k]=copyTable(v) end
    return n
end

local function disableEmpParalyze(unitDef)
    if not unitDef then return end
    unitDef.paralyzemultiplier=0
    unitDef.paralyzeMultiplier=0
    unitDef.capturable=false
    unitDef.paralyzable=false
    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.paralyzemultiplier=0
    unitDef.customparams.paralyze_multiplier=0
    unitDef.customparams.emp_immunity="1"
    unitDef.customparams.no_stunner=true
end

local function getCommanderWeaponDamageMult(weaponName,wd,defaultMult)
    local n=string.lower(tostring(weaponName or wd and wd.name or ""))

    -- Cortex:
    -- heat ray general DPS target ~12000
    -- gauss + rocket general DPS target ~6500
    if string.find(n,"corkorg_laser",1,true)
    or string.find(n,"laser",1,true)
    or string.find(n,"heat",1,true)
    or string.find(n,"ray",1,true) then
        return 1854692/1000000
    end

    if string.find(n,"corkorg_fire",1,true)
    or string.find(n,"corkorg_rocket",1,true)
    or string.find(n,"rocket",1,true)
    or string.find(n,"gauss",1,true)
    or string.find(n,"fire",1,true) then
        return 2247156/1000000
    end

    return defaultMult
end

local function scaleWeaponDamage(weaponName,wd,mult)
    if not wd or not wd.damage then return end
    local finalMult=getCommanderWeaponDamageMult(weaponName,wd,mult)

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*finalMult
        end
    end

    if type(wd.damage.default)=="number" then
        wd.damage.commander=wd.damage.default*51/100
        wd.damage.commanders=wd.damage.default*51/100
    end
end

local function forceLocalWeaponDefs(unitDef,range,reload,damageMult)
    if not unitDef then return end
    unitDef.weapondefs=unitDef.weapondefs or {}
    for weaponName,wd in pairs(unitDef.weapondefs) do
        if wd then
            wd.range=range
            wd.reloadtime=reload
            wd.reload=reload
            scaleWeaponDamage(weaponName,wd,damageMult)
        end
    end
    if unitDef.weapons then
        for _,w in pairs(unitDef.weapons) do
            local weaponName=w.def or w.weapondef or w.name
            if weaponName then
                local lowerName=string.lower(weaponName)
                local wd=WeaponDefs[weaponName] or WeaponDefs[lowerName]
                if wd and not unitDef.weapondefs[lowerName] then
                    local wdCopy=copyTable(wd)
                    wdCopy.range=range
                    wdCopy.reloadtime=reload
                    wdCopy.reload=reload
                    scaleWeaponDamage(weaponName,wdCopy,damageMult)
                    unitDef.weapondefs[weaponName]=wdCopy
                    unitDef.weapondefs[lowerName]=wdCopy
                end
            end
        end
    end
end

local function forceDetectionFields(unitDef)
    if not unitDef then return end
    unitDef.sightdistance=COMMANDER_SIGHT
    unitDef.sightDistance=COMMANDER_SIGHT
    unitDef.losradius=COMMANDER_SIGHT
    unitDef.losRadius=COMMANDER_SIGHT
    unitDef.radardistance=COMMANDER_RADAR
    unitDef.radarDistance=COMMANDER_RADAR
    unitDef.radarradius=COMMANDER_RADAR
    unitDef.radarRadius=COMMANDER_RADAR
    unitDef.sonardistance=COMMANDER_SONAR
    unitDef.sonarDistance=COMMANDER_SONAR
    unitDef.sonarradius=COMMANDER_SONAR
    unitDef.sonarRadius=COMMANDER_SONAR
    unitDef.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.airSightDistance=COMMANDER_AIRSIGHT
    unitDef.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.airLosDistance=COMMANDER_AIRSIGHT
    unitDef.airlosradius=COMMANDER_AIRSIGHT
    unitDef.airLosRadius=COMMANDER_AIRSIGHT

    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.sightdistance=COMMANDER_SIGHT
    unitDef.customparams.sight_distance=COMMANDER_SIGHT
    unitDef.customparams.losradius=COMMANDER_SIGHT
    unitDef.customparams.los_radius=COMMANDER_SIGHT
    unitDef.customparams.radardistance=COMMANDER_RADAR
    unitDef.customparams.radar_distance=COMMANDER_RADAR
    unitDef.customparams.radarradius=COMMANDER_RADAR
    unitDef.customparams.radar_radius=COMMANDER_RADAR
    unitDef.customparams.sonardistance=COMMANDER_SONAR
    unitDef.customparams.sonar_distance=COMMANDER_SONAR
    unitDef.customparams.sonarradius=COMMANDER_SONAR
    unitDef.customparams.sonar_radius=COMMANDER_SONAR
    unitDef.customparams.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_sight_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosradius=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_radius=COMMANDER_AIRSIGHT

    unitDef.seismicsignature=0
    unitDef.stealth=false
    unitDef.sonarstealth=false
    unitDef.jamdistance=0
    unitDef.jamDistance=0
    unitDef.radarjamdistance=0
    unitDef.radarJamDistance=0
    unitDef.sonardistancejam=0
    unitDef.sonarDistanceJam=0
    unitDef.cancloak=true
    unitDef.canCloak=true
    unitDef.cloakcost=COMMANDER_CLOAK_COST
    unitDef.cloakCost=COMMANDER_CLOAK_COST
    unitDef.cloakcostmoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.cloakCostMoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.mincloakdistance=COMMANDER_MIN_CLOAK_DISTANCE
    unitDef.minCloakDistance=COMMANDER_MIN_CLOAK_DISTANCE
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]
if com and boss then
    for k,v in pairs(boss) do com[k]=copyTable(v) end
    disableEmpParalyze(com)
    forceDetectionFields(com)
    com.name="Cortex Commander"
    com.unitname=comName
    com.description="Experimental Battle Commander"
    com.tooltip="Experimental Battle Commander"
    com.customparams={}
    com.customparams.iscommander="1"
    com.customparams.i18n_en_humanname="Cortex Commander"
    com.customparams.i18n_en_tooltip="Experimental Battle Commander"
    com.customparams.commander_damage_balance="cortex_heatray_burst10200_nonlaser_minus35_cmd51_hp145k_dt058"
    com.canexperience=false
    com.experience=0
    com.candgun=false
    com.canDgun=false
    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil
    com.customparams.level=nil
    com.customparams.veteran=nil
    com.customparams.veterancy=nil
    com.customparams.experience=nil
    com.customparams.xp=nil
    com.customparams.scavenger=nil
    com.customparams.scav=nil
    com.customparams.epic=nil
    com.customparams.boss=nil
    com.customparams.superboss=nil
    com.customparams.bonushealth=nil
    com.customparams.maxhealth=nil
    com.customparams.healthboost=nil
    com.customparams.healthmult=nil
    com.customparams.regen=nil
    com.customparams.regeneration=nil
    com.customparams.healthregen=nil
    com.customparams.autoheal=nil
    com.customparams.idleautoheal=nil
    disableEmpParalyze(com)
    com.builder=false
    com.buildoptions={}
    com.workertime=0
    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false
    com.canmove=true
    com.canattack=true
    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    -- Minimal commander body turnrate override.
    com.turnrate=COMMANDER_TURNRATE
    com.turnRate=COMMANDER_TURNRATE
    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5
    -- Commander HP balance
    com.health=145000
    com.maxdamage=145000
    com.maxDamage=145000
    forceLocalWeaponDefs(com,COMMANDER_RANGE,COMMANDER_RELOAD,COMMANDER_DAMAGE_MULT)
    com.damageModifier=COMMANDER_DAMAGE_TAKEN
    com.metalcost=0
    com.energycost=0
    com.buildtime=1
    disableEmpParalyze(com)
    forceDetectionFields(com)
end-- T3 Com | Legion
local comName="legcom"
local bossName="legeheatraymech"
local speedMul=1.97
local COMMANDER_RANGE=800
local COMMANDER_RELOAD=0.35
local LEGION_LASER_RELOAD=0.03
local LEGION_AA_RELOAD_MULT=1/3
local COMMANDER_RADAR=1200
local COMMANDER_SONAR=1200
local COMMANDER_SIGHT=1000
local COMMANDER_AIRSIGHT=1200
local COMMANDER_DAMAGE_MULT=2.45
local COMMANDER_DAMAGE_TAKEN=0.65
local COMMANDER_CLOAK_COST=1000
local COMMANDER_CLOAK_COST_MOVING=1000
local COMMANDER_MIN_CLOAK_DISTANCE=75
local COMMANDER_TURNRATE=2000

local function copyTable(t)
    if type(t)~="table" then return t end
    local n={}
    for k,v in pairs(t) do n[k]=copyTable(v) end
    return n
end

local function disableEmpParalyze(unitDef)
    if not unitDef then return end
    unitDef.paralyzemultiplier=0
    unitDef.paralyzeMultiplier=0
    unitDef.capturable=false
    unitDef.paralyzable=false
    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.paralyzemultiplier=0
    unitDef.customparams.paralyze_multiplier=0
    unitDef.customparams.emp_immunity="1"
    unitDef.customparams.no_stunner=true
end

local function getCommanderWeaponDamageMult(weaponName,wd,defaultMult)
    local n=string.lower(tostring(weaponName or wd and wd.name or ""))

    -- Legion:
    -- thermal/heat ray general DPS target ~12000
    -- riot autocannon general DPS target ~6500
    -- AA flak remains on default multiplier, but also gets commanders modifier 51%.
    if string.find(n,"heatray1",1,true)
    or string.find(n,"heat",1,true)
    or string.find(n,"thermal",1,true)
    or string.find(n,"ray",1,true) then
        return 13352499/1000000
    end

    if string.find(n,"ultraheavyriotcannon",1,true)
    or string.find(n,"riot",1,true)
    or string.find(n,"autocannon",1,true) then
        return 2012928/1000000
    end

    return defaultMult*65/100
end

local function scaleWeaponDamage(weaponName,wd,mult)
    if not wd or not wd.damage then return end
    local finalMult=getCommanderWeaponDamageMult(weaponName,wd,mult)

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*finalMult
        end
    end

    if type(wd.damage.default)=="number" then
        wd.damage.commander=wd.damage.default*51/100
        wd.damage.commanders=wd.damage.default*51/100
    end
end

local function isLaserWeaponDef(name,wd)
    local n=string.lower(tostring(name or ""))
    if string.find(n,"laser",1,true) or string.find(n,"beam",1,true) or string.find(n,"heat",1,true) or string.find(n,"ray",1,true) then return true end
    if wd then
        local wt=string.lower(tostring(wd.weapontype or wd.weaponType or ""))
        if string.find(wt,"laser",1,true) or string.find(wt,"beam",1,true) then return true end
        local nm=string.lower(tostring(wd.name or ""))
        if string.find(nm,"laser",1,true) or string.find(nm,"beam",1,true) or string.find(nm,"heat",1,true) or string.find(nm,"ray",1,true) then return true end
    end
    return false
end

local function isAAWeaponDef(name,wd)
    local n=string.lower(tostring(name or ""))
    if string.find(n,"flak",1,true) or string.find(n,"aa",1,true) or string.find(n,"anti_air",1,true) or string.find(n,"antiair",1,true) then return true end
    if wd then
        local nm=string.lower(tostring(wd.name or ""))
        local wt=string.lower(tostring(wd.weapontype or wd.weaponType or ""))
        if string.find(nm,"flak",1,true) or string.find(nm,"aa",1,true) or string.find(nm,"anti_air",1,true) or string.find(nm,"antiair",1,true) then return true end
        if string.find(wt,"flak",1,true) then return true end
    end
    return false
end

local function getReloadForWeapon(weaponName,wd)
    if isLaserWeaponDef(weaponName,wd) then return LEGION_LASER_RELOAD end
    if isAAWeaponDef(weaponName,wd) then return COMMANDER_RELOAD*LEGION_AA_RELOAD_MULT end
    return COMMANDER_RELOAD
end

local function forceLocalWeaponDefs(unitDef,range,reload,damageMult)
    if not unitDef then return end
    unitDef.weapondefs=unitDef.weapondefs or {}
    for weaponName,wd in pairs(unitDef.weapondefs) do
        if wd then
            local weaponReload=getReloadForWeapon(weaponName,wd)
            wd.range=range
            wd.reloadtime=weaponReload
            wd.reload=weaponReload
            scaleWeaponDamage(weaponName,wd,damageMult)
        end
    end
    if unitDef.weapons then
        for _,w in pairs(unitDef.weapons) do
            local weaponName=w.def or w.weapondef or w.name
            if weaponName then
                local lowerName=string.lower(weaponName)
                local wd=WeaponDefs[weaponName] or WeaponDefs[lowerName]
                if wd and not unitDef.weapondefs[lowerName] then
                    local wdCopy=copyTable(wd)
                    local weaponReload=getReloadForWeapon(weaponName,wdCopy)
                    wdCopy.range=range
                    wdCopy.reloadtime=weaponReload
                    wdCopy.reload=weaponReload
                    scaleWeaponDamage(weaponName,wdCopy,damageMult)
                    unitDef.weapondefs[weaponName]=wdCopy
                    unitDef.weapondefs[lowerName]=wdCopy
                end
            end
        end
    end
end

local function forceDetectionFields(unitDef)
    if not unitDef then return end
    unitDef.sightdistance=COMMANDER_SIGHT
    unitDef.sightDistance=COMMANDER_SIGHT
    unitDef.losradius=COMMANDER_SIGHT
    unitDef.losRadius=COMMANDER_SIGHT
    unitDef.radardistance=COMMANDER_RADAR
    unitDef.radarDistance=COMMANDER_RADAR
    unitDef.radarradius=COMMANDER_RADAR
    unitDef.radarRadius=COMMANDER_RADAR
    unitDef.sonardistance=COMMANDER_SONAR
    unitDef.sonarDistance=COMMANDER_SONAR
    unitDef.sonarradius=COMMANDER_SONAR
    unitDef.sonarRadius=COMMANDER_SONAR
    unitDef.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.airSightDistance=COMMANDER_AIRSIGHT
    unitDef.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.airLosDistance=COMMANDER_AIRSIGHT
    unitDef.airlosradius=COMMANDER_AIRSIGHT
    unitDef.airLosRadius=COMMANDER_AIRSIGHT

    unitDef.customparams=unitDef.customparams or {}
    unitDef.customparams.sightdistance=COMMANDER_SIGHT
    unitDef.customparams.sight_distance=COMMANDER_SIGHT
    unitDef.customparams.losradius=COMMANDER_SIGHT
    unitDef.customparams.los_radius=COMMANDER_SIGHT
    unitDef.customparams.radardistance=COMMANDER_RADAR
    unitDef.customparams.radar_distance=COMMANDER_RADAR
    unitDef.customparams.radarradius=COMMANDER_RADAR
    unitDef.customparams.radar_radius=COMMANDER_RADAR
    unitDef.customparams.sonardistance=COMMANDER_SONAR
    unitDef.customparams.sonar_distance=COMMANDER_SONAR
    unitDef.customparams.sonarradius=COMMANDER_SONAR
    unitDef.customparams.sonar_radius=COMMANDER_SONAR
    unitDef.customparams.airsightdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_sight_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosdistance=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_distance=COMMANDER_AIRSIGHT
    unitDef.customparams.airlosradius=COMMANDER_AIRSIGHT
    unitDef.customparams.air_los_radius=COMMANDER_AIRSIGHT

    unitDef.seismicsignature=0
    unitDef.stealth=false
    unitDef.sonarstealth=false
    unitDef.jamdistance=0
    unitDef.jamDistance=0
    unitDef.radarjamdistance=0
    unitDef.radarJamDistance=0
    unitDef.sonardistancejam=0
    unitDef.sonarDistanceJam=0
    unitDef.cancloak=true
    unitDef.canCloak=true
    unitDef.cloakcost=COMMANDER_CLOAK_COST
    unitDef.cloakCost=COMMANDER_CLOAK_COST
    unitDef.cloakcostmoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.cloakCostMoving=COMMANDER_CLOAK_COST_MOVING
    unitDef.mincloakdistance=COMMANDER_MIN_CLOAK_DISTANCE
    unitDef.minCloakDistance=COMMANDER_MIN_CLOAK_DISTANCE
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]
if com and boss then
    for k,v in pairs(boss) do com[k]=copyTable(v) end
    disableEmpParalyze(com)
    forceDetectionFields(com)
    com.name="Legion Commander"
    com.unitname=comName
    com.description="Experimental Battle Commander"
    com.tooltip="Experimental Battle Commander"
    com.customparams={}
    com.customparams.iscommander="1"
    com.customparams.i18n_en_humanname="Legion Commander"
    com.customparams.i18n_en_tooltip="Experimental Battle Commander"
    com.customparams.commander_damage_balance="legion_laser18500_reload03_nonlaser_minus35_cmd51_aa_reload_hp115k"
    com.canexperience=false
    com.experience=0
    com.candgun=false
    com.canDgun=false
    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil
    com.customparams.level=nil
    com.customparams.veteran=nil
    com.customparams.veterancy=nil
    com.customparams.experience=nil
    com.customparams.xp=nil
    com.customparams.scavenger=nil
    com.customparams.scav=nil
    com.customparams.epic=nil
    com.customparams.boss=nil
    com.customparams.superboss=nil
    com.customparams.bonushealth=nil
    com.customparams.maxhealth=nil
    com.customparams.healthboost=nil
    com.customparams.healthmult=nil
    com.customparams.regen=nil
    com.customparams.regeneration=nil
    com.customparams.healthregen=nil
    com.customparams.autoheal=nil
    com.customparams.idleautoheal=nil
    disableEmpParalyze(com)
    com.builder=false
    com.buildoptions={}
    com.workertime=0
    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false
    com.canmove=true
    com.canattack=true
    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    -- Minimal commander body turnrate override.
    com.turnrate=COMMANDER_TURNRATE
    com.turnRate=COMMANDER_TURNRATE
    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5
    -- Commander HP balance
    com.health=115000
    com.maxdamage=115000
    com.maxDamage=115000
    forceLocalWeaponDefs(com,COMMANDER_RANGE,COMMANDER_RELOAD,COMMANDER_DAMAGE_MULT)
    com.damageModifier=COMMANDER_DAMAGE_TAKEN
    com.metalcost=0
    com.energycost=0
    com.buildtime=1
    disableEmpParalyze(com)
    forceDetectionFields(com)
end-- T3 Commander Mod | Bezz
local commanderUnits={armcom=true,corcom=true,legcom=true,}local unitDamageMult={}local boostedWeaponDefs={}local boostedDefenseWeaponDefs={}local boostedNukeWeaponDefs={}local boostedAAReloadWeaponDefs={}local boostedDefenseRangeWeaponDefs={}local originalWeaponRanges={}local NORMAL_HP_MULT=8.5 local BUILDING_HP_MULT=5.5 local DEFENSE_HP_MULT=8 local HEAVY_HP_MULT=2.8 local MOBILE_SIEGE_HP_MULT=5 local HEAVY_HP_THRESHOLD=100000 local MAX_BUFFED_HP=950000 local NORMAL_DAMAGE_MULT=3.6 local DEFENSE_DAMAGE_MULT=2 local HEAVY_DAMAGE_MULT=2.3 local MOBILE_SIEGE_DAMAGE_MULT=2.5 local DEFENSE_VS_COMMANDER_MULT=2.1 local DEFENSE_RANGE_MULT=1 local LONG_RANGE_STATIC_DEF_THRESHOLD=2000 local MOBILE_SIEGE_RANGE_THRESHOLD=900 local MOBILE_SIEGE_METAL_THRESHOLD=2500 local MOBILE_SIEGE_BUILDTIME_THRESHOLD=40000 local NUKE_DAMAGE_MULT=1.5 local STATIC_AA_DAMAGE_MULT=2.2 local STATIC_AA_RELOAD_MULT=0.10 local function isBuilding(ud)return ud and(ud.isbuilding or ud.building or ud.yardmap or ud.canmove==false)end local function hasWeapons(ud)return ud and ud.weapons and next(ud.weapons)~=nil end local function isDefenseBuilding(ud)return isBuilding(ud)and hasWeapons(ud)end local function getCP(ud)return(ud and ud.customparams)or{}end local function isUnitGroup(ud,groupName)local cp=getCP(ud)local ug=cp.unitgroup or cp.unitGroup or cp.unit_group return string.lower(tostring(ug or ""))==groupName end local function isStaticAAUnit(ud)if not ud then return false end if not isBuilding(ud)then return false end if not isUnitGroup(ud,"aa")then return false end return true end local function getWeaponNameFromSlot(w)if not w then return nil end return w.def or w.weapondef or w.weaponDef or w.name end local function getWeaponDefByName(name)if not name then return nil end local lowerName=string.lower(tostring(name))return WeaponDefs[name]or WeaponDefs[lowerName]end local function getLocalOrGlobalWeaponDef(ud,weaponName)if not ud then return nil end if not weaponName then return nil end local lowerName=string.lower(tostring(weaponName))if ud.weapondefs then return ud.weapondefs[weaponName]or ud.weapondefs[lowerName]or getWeaponDefByName(weaponName)end return getWeaponDefByName(weaponName)end local function getOriginalWeaponRange(wd)if not wd then return 0 end if originalWeaponRanges[wd]then return originalWeaponRanges[wd]end local range=wd.range or wd.weaponrange or wd.weaponRange or 0 if type(range)~="number" then range=0 end originalWeaponRanges[wd]=range return range end local function getMetalCost(ud)return ud.metalcost or ud.metalCost or 0 end local function getEnergyCost(ud)return ud.energycost or ud.energyCost or 0 end local function getBuildTime(ud)return ud.buildtime or ud.buildTime or 0 end local function getWorkerTime(ud)return ud.workertime or ud.workerTime or ud.buildspeed or ud.buildSpeed or 0 end local function getMaxWeaponRange(ud)if not ud then return 0 end local maxRange=0 if ud.weapondefs then for _,wd in pairs(ud.weapondefs)do if wd then local range=wd.range or wd.weaponrange or wd.weaponRange or 0 if type(range)=="number" and range>maxRange then maxRange=range end end end end if ud.weapons then for _,weaponSlot in pairs(ud.weapons)do local weaponName=getWeaponNameFromSlot(weaponSlot)local wd=getLocalOrGlobalWeaponDef(ud,weaponName)if wd then local range=wd.range or wd.weaponrange or wd.weaponRange or 0 if type(range)=="number" and range>maxRange then maxRange=range end end end end return maxRange end local function isMobileSiegeHeavy(ud)if not ud then return false end if isBuilding(ud)then return false end local range=getMaxWeaponRange(ud)local metal=getMetalCost(ud)local buildtime=getBuildTime(ud)if range>=MOBILE_SIEGE_RANGE_THRESHOLD and(metal>=MOBILE_SIEGE_METAL_THRESHOLD or buildtime>=MOBILE_SIEGE_BUILDTIME_THRESHOLD)then return true end return false end local function isAntiNukeName(s)local n=string.lower(tostring(s or ""))return string.find(n,"antinuke",1,true)or string.find(n,"anti_nuke",1,true)or string.find(n,"anti-nuke",1,true)end local function hasNukeName(weaponName)local n=string.lower(tostring(weaponName or ""))return string.find(n,"nuke",1,true)or string.find(n,"nuclear",1,true)or string.find(n,"strategic",1,true)or string.find(n,"icbm",1,true)or string.find(n,"missile_nuclear",1,true)or string.find(n,"crblmssl",1,true)end local function isNukeWeapon(wd,weaponName)if not wd then return false end local n=tostring(weaponName or wd.name or "")if isAntiNukeName(n)then return true end if hasNukeName(n)then return true end local wt=string.lower(tostring(wd.weapontype or wd.weaponType or ""))if string.find(wt,"starburst",1,true)and(hasNukeName(n)or isAntiNukeName(n))then return true end return false end local function isOffensiveNukeWeapon(wd,weaponName)if not wd then return false end local n=tostring(weaponName or wd.name or "")if isAntiNukeName(n)then return false end if hasNukeName(n)then return true end return false end local function isLongRangeStaticDefenseWeapon(ud,wd)if not isDefenseBuilding(ud)then return false end if not wd then return false end local range=getOriginalWeaponRange(wd)return type(range)=="number" and range>=LONG_RANGE_STATIC_DEF_THRESHOLD end local function multiplyDamageTable(wd,mult)if not wd then return end if not wd.damage then return end for armorType,dmg in pairs(wd.damage)do if type(dmg)=="number" then wd.damage[armorType]=dmg*mult end end end local function scaleNukeDamage(wd,weaponName)if not isOffensiveNukeWeapon(wd,weaponName)then return end if boostedNukeWeaponDefs[wd]then return end boostedNukeWeaponDefs[wd]=true multiplyDamageTable(wd,NUKE_DAMAGE_MULT)end local function scaleWeaponReload(wd,mult)if not wd then return end if boostedAAReloadWeaponDefs[wd]then return end boostedAAReloadWeaponDefs[wd]=true local base=wd.reloadtime or wd.reloadTime or wd.reload if not base then return end if type(base)~="number" then return end local boosted=base*mult wd.reloadtime=boosted wd.reloadTime=boosted wd.reload=boosted end local function scaleDefenseRange(wd,mult)if not wd then return end if boostedDefenseRangeWeaponDefs[wd]then return end boostedDefenseRangeWeaponDefs[wd]=true local base=getOriginalWeaponRange(wd)if not base then return end if type(base)~="number" then return end local boosted=base*mult wd.range=boosted wd.weaponrange=boosted wd.weaponRange=boosted end local function scaleWeaponDamageOnce(wd,mult)if not wd then return end if boostedWeaponDefs[wd]then return end boostedWeaponDefs[wd]=true multiplyDamageTable(wd,mult)end local function setDefenseCommanderDamage(ud,wd,mult,weaponName)if not wd then return end if boostedDefenseWeaponDefs[wd]then return end boostedDefenseWeaponDefs[wd]=true if isLongRangeStaticDefenseWeapon(ud,wd)then return end if isNukeWeapon(wd,weaponName)then return end if isStaticAAUnit(ud)then return end wd.damage=wd.damage or{}local base=wd.damage.default or 1 wd.damage.commander=base*mult wd.damage.commanders=base*mult end local function getDamageMultForUnit(ud,hp)if hp>HEAVY_HP_THRESHOLD then return HEAVY_DAMAGE_MULT end if isMobileSiegeHeavy(ud)then return MOBILE_SIEGE_DAMAGE_MULT end if isDefenseBuilding(ud)then return DEFENSE_DAMAGE_MULT end return NORMAL_DAMAGE_MULT end for name,ud in pairs(UnitDefs)do if not commanderUnits[name]then local hp=ud.health or ud.maxdamage if hp then local hpMult=NORMAL_HP_MULT local damageMult=getDamageMultForUnit(ud,hp)if hp>HEAVY_HP_THRESHOLD then hpMult=HEAVY_HP_MULT elseif isMobileSiegeHeavy(ud)then hpMult=MOBILE_SIEGE_HP_MULT elseif isDefenseBuilding(ud)then hpMult=DEFENSE_HP_MULT elseif isBuilding(ud)then hpMult=BUILDING_HP_MULT end unitDamageMult[name]=damageMult ud.health=math.min(hp*hpMult,MAX_BUFFED_HP)ud.maxdamage=ud.health end end end for name,ud in pairs(UnitDefs)do if not commanderUnits[name]and ud.weapondefs then local damageMult=unitDamageMult[name]or NORMAL_DAMAGE_MULT for weaponName,wd in pairs(ud.weapondefs)do local wasLongRange=isLongRangeStaticDefenseWeapon(ud,wd)if isDefenseBuilding(ud)and not isNukeWeapon(wd,weaponName)then scaleDefenseRange(wd,DEFENSE_RANGE_MULT)end if isNukeWeapon(wd,weaponName)then scaleNukeDamage(wd,weaponName)elseif isStaticAAUnit(ud)then scaleWeaponDamageOnce(wd,STATIC_AA_DAMAGE_MULT)scaleWeaponReload(wd,STATIC_AA_RELOAD_MULT)elseif wasLongRange then else scaleWeaponDamageOnce(wd,damageMult)end end end end for unitName,ud in pairs(UnitDefs)do if not commanderUnits[unitName]and isDefenseBuilding(ud)and ud.weapons then for _,weaponSlot in pairs(ud.weapons)do local weaponName=getWeaponNameFromSlot(weaponSlot)local wd=getLocalOrGlobalWeaponDef(ud,weaponName)if wd and not isNukeWeapon(wd,weaponName)then scaleDefenseRange(wd,DEFENSE_RANGE_MULT)end end end end for unitName,ud in pairs(UnitDefs)do if not commanderUnits[unitName]and isStaticAAUnit(ud)and ud.weapons then for _,weaponSlot in pairs(ud.weapons)do local weaponName=getWeaponNameFromSlot(weaponSlot)local wd=getLocalOrGlobalWeaponDef(ud,weaponName)if wd then scaleWeaponDamageOnce(wd,STATIC_AA_DAMAGE_MULT)scaleWeaponReload(wd,STATIC_AA_RELOAD_MULT)end end end end for unitName,ud in pairs(UnitDefs)do if not commanderUnits[unitName]and ud.weapons then for _,weaponSlot in pairs(ud.weapons)do local weaponName=getWeaponNameFromSlot(weaponSlot)local wd=getLocalOrGlobalWeaponDef(ud,weaponName)if isNukeWeapon(wd,weaponName)then scaleNukeDamage(wd,weaponName)end end end end for name,ud in pairs(UnitDefs)do if isDefenseBuilding(ud)and ud.weapons then for _,weaponSlot in pairs(ud.weapons)do local weaponName=getWeaponNameFromSlot(weaponSlot)local wd=getLocalOrGlobalWeaponDef(ud,weaponName)setDefenseCommanderDamage(ud,wd,DEFENSE_VS_COMMANDER_MULT,weaponName)end end end do local function setFinalHP(unitName,hp)local u=UnitDefs[unitName]if not u then return end u.health=hp u.maxdamage=hp u.maxDamage=hp end local function scaleFinalDamage(unitName,num,den)local u=UnitDefs[unitName]if not u or u._t4_final_damage_override then return end u._t4_final_damage_override=true local function scaleWeapon(wd)if not wd or type(wd.damage)~="table" then return end for armorType,dmg in pairs(wd.damage)do if type(dmg)=="number" then wd.damage[armorType]=dmg*num/den end end end if type(u.weapondefs)=="table" then for _,wd in pairs(u.weapondefs)do scaleWeapon(wd)end end if type(u.weapons)=="table" then for _,slot in pairs(u.weapons)do local weaponName=slot.def or slot.weapondef or slot.weaponDef or slot.name if weaponName and WeaponDefs then scaleWeapon(WeaponDefs[weaponName]or WeaponDefs[string.lower(tostring(weaponName))])end end end end local function scaleFinalWeaponDamage(unitName,weaponKey,num,den)local u=UnitDefs[unitName]if not u then return end local flag="_t4_final_" .. tostring(unitName).. "_" .. tostring(weaponKey).. "_" .. tostring(num).. "_" .. tostring(den)if u[flag]then return end u[flag]=true local function scaleWeapon(wd)if not wd or type(wd.damage)~="table" then return end for armorType,dmg in pairs(wd.damage)do if type(dmg)=="number" then wd.damage[armorType]=dmg*num/den end end end local lowerKey=string.lower(tostring(weaponKey))local upperKey=string.upper(tostring(weaponKey))if type(u.weapondefs)=="table" then scaleWeapon(u.weapondefs[weaponKey])scaleWeapon(u.weapondefs[lowerKey])scaleWeapon(u.weapondefs[upperKey])end if WeaponDefs then scaleWeapon(WeaponDefs[weaponKey])scaleWeapon(WeaponDefs[lowerKey])scaleWeapon(WeaponDefs[upperKey])end end setFinalHP("armbanth",415000)setFinalHP("corjugg",860000)setFinalHP("corkorg",485000)setFinalHP("legeheatraymech",364000)scaleFinalWeaponDamage("corjugg","juggernaut_fire",75,100)end-- T3 Com Cons
local commanders={armcom=true,corcom=true,legcom=true}
local P={{"armck","armckx"},{"armcv","armcvx"},{"armbeaver","armbeaverx"},{"armca","armcax"},{"corck","corckx"},{"corcv","corcvx"},{"cormuskrat","cormuskratx"},{"corca","corcax"},{"legck","legckx"},{"legcv","legcvx"},{"legotter","legotterx"},{"legca","legcax"}}
local A={{"metalcost","metalCost"},{"energycost","energyCost"},{"buildtime","buildTime"},{"workertime","workerTime"},{"buildspeed","buildSpeed"},{"buildpower","buildPower"},{"builddistance","buildDistance"},{"buildrange","buildRange"},{"speed"},{"maxvelocity","maxVelocity"},{"sightdistance","sightDistance"},{"losradius","losRadius"}}
local function r(v)return type(v)=="number" and math.floor(v+.5)or v end
local function cp(t)if type(t)~="table"then return t end local n={}for k,v in pairs(t)do n[k]=cp(v)end return n end
local function bo(ud,u)if not ud or type(ud.buildoptions)~="table"then return false end for _,v in pairs(ud.buildoptions)do if v==u then return true end end return false end
local function addbo(ud,u)if not ud or not UnitDefs[u]then return end ud.buildoptions=ud.buildoptions or{}if not bo(ud,u)then ud.buildoptions[#ud.buildoptions+1]=u end end
local function repbo(ud,a,b)if not ud or type(ud.buildoptions)~="table"then return end for i=#ud.buildoptions,1,-1 do if ud.buildoptions[i]==a then table.remove(ud.buildoptions,i)addbo(ud,b)end end end
local function icon(sn,s,p)local c=s.customparams or{};p.customparams=p.customparams or{};p.buildpic=s.buildpic;p.buildPic=s.buildPic;p.iconname=s.iconname or s.iconName or c.iconname or c.iconName or sn;p.iconName=s.iconName or s.iconname or c.iconName or c.iconname or sn;local i=s.icontype or s.iconType or s.icon or c.icontype or c.iconType or c.icon or c.uniticon or c.unitIcon or c.strategicicon or c.strategicIcon or p.iconname or sn;p.icontype=i;p.iconType=i;p.icon=i;for _,k in ipairs({"icontype","iconType","icon","iconname","iconName","uniticon","unitIcon","strategicicon","strategicIcon"})do if c[k]~=nil then p.customparams[k]=c[k]end end;p.customparams.icontype=i;p.customparams.iconType=i;p.customparams.icon=i;p.customparams.iconname=p.iconname;p.customparams.iconName=p.iconName end
local function loc(sn,s,p)local c=s.customparams or{};p.customparams=p.customparams or{};local nk="units.names."..sn;local dk="units.descriptions."..sn;p.name=s.name or nk;p.description=s.description or dk;p.tooltip=s.tooltip or dk;icon(sn,s,p);p.customparams.i18nfromunit=sn;p.customparams.i18n_from_unit=sn;p.customparams.i18n_en_humanname=c.i18n_en_humanname or s.name or nk;p.customparams.i18n_en_tooltip=c.i18n_en_tooltip or s.tooltip or s.description or dk;p.customparams.i18n_pl_humanname=c.i18n_pl_humanname or c.i18n_en_humanname or s.name or nk;p.customparams.i18n_pl_tooltip=c.i18n_pl_tooltip or c.i18n_en_tooltip or s.tooltip or s.description or dk;p.customparams.description=c.description or s.description or dk;p.customparams.tooltip=c.tooltip or s.tooltip or s.description or dk;p.customparams.humanname=c.humanname or s.name or nk end
local function mk(sn,pn)local s=UnitDefs[sn]if not s or UnitDefs[pn]then return end UnitDefs[pn]=cp(s)local p=UnitDefs[pn];local c=s.customparams or{};p.unitname=pn;p.unitName=pn;p.objectname=s.objectname;p.objectName=s.objectName;p.script=s.script;loc(sn,s,p);p.customparams.unitgroup=c.unitgroup;p.customparams.unitGroup=c.unitGroup;p.customparams.unit_group=c.unit_group;p.customparams.techlevel=c.techlevel;p.customparams.t3barb_private_constructor="1";p.customparams.t3barb_private_tier="1";p.customparams.t3barb="T3" end
local function trap(sn)local s=UnitDefs[sn]if not s then return end s.customparams=s.customparams or{};s.customparams.t3barb_stock_constructor_trap="1";s.customparams.ai_ignore="1";s.customparams.barbarian_ignore="1";s.customparams.hidden="1";s.customparams.no_build="1";s.customparams.notbuildable="1";s.maxthisunit=0;s.maxThisUnit=0;s.notbuildable=true;s.notBuildable=true end
local function unlock(p,s,sn)if not p then return end p.maxthisunit=nil;p.maxThisUnit=nil;p.notbuildable=nil;p.notBuildable=nil;p.hidden=nil;p.hide=nil;p.disabled=nil;p.nobuild=nil;p.noBuild=nil;p.builder=true;p.canrepeat=true;p.canRepeat=true;p.customparams=p.customparams or{};p.customparams.hidden=nil;p.customparams.no_build=nil;p.customparams.notbuildable=nil;p.customparams.ai_ignore=nil;p.customparams.barbarian_ignore=nil;p.customparams.disabled=nil;p.customparams.t3barb_private_constructor="1";p.customparams.t3barb_private_tier="1";p.customparams.t3barb="T3";if s then icon(sn or s.unitname or s.unitName or "",s,p)local c=s.customparams;if c then local g=c.unitgroup or c.unitGroup or c.unit_group;if g then p.customparams.unitgroup=g;p.customparams.unitGroup=g;p.customparams.unit_group=g end end end end
for _,q in ipairs(P)do mk(q[1],q[2])end
for _,ud in pairs(UnitDefs)do if type(ud)=="table"and type(ud.buildoptions)=="table"then for _,q in ipairs(P)do repbo(ud,q[1],q[2])end end end
for _,q in ipairs(P)do trap(q[1])end
local boosted={}
local function first(ud,t)for _,k in ipairs(t)do local v=ud[k]if type(v)=="number"then return v end end end
local function setall(ud,t,v)for _,k in ipairs(t)do ud[k]=v end end
local function mul(ud,t,m,minv)local v=first(ud,t)if v and v>0 then setall(ud,t,math.max(minv or 0,r(v*m)))end end
local function mobile(ud)return ud and not(ud.isbuilding or ud.building or ud.yardmap or ud.canmove==false)and ud.buildoptions and next(ud.buildoptions)~=nil end
for n,ud in pairs(UnitDefs)do if not commanders[n]and not boosted[n]and mobile(ud)then boosted[n]=true;mul(ud,{"metalcost","metalCost"},.8);mul(ud,{"energycost","energyCost"},.8);mul(ud,{"buildtime","buildTime"},.8,1);mul(ud,{"speed","maxvelocity","maxVelocity"},1.25);mul(ud,{"workertime","workerTime","buildspeed","buildSpeed","buildpower","buildPower"},1.35);mul(ud,{"builddistance","buildDistance","buildrange","buildRange"},1.3);mul(ud,{"sightdistance","sightDistance","losradius","losRadius"},1.25);for _,k in ipairs({"turnrate","turnRate"})do if type(ud[k])=="number"then ud[k]=r(ud[k]*1.25)end end for _,k in ipairs({"acceleration","maxacc","maxAcc","brakerate","brakeRate"})do if type(ud[k])=="number"then ud[k]=ud[k]*1.25 end end end end
local function sync(p,s,sn)if not p or not s then return end unlock(p,s,sn)local hp=s.health or s.maxdamage or s.maxDamage;if hp~=nil then p.health=hp;p.maxdamage=hp;p.maxDamage=hp end for _,a in ipairs(A)do local v=s[a[1]]or(a[2]and s[a[2]])if v~=nil then p[a[1]]=v;if a[2]then p[a[2]]=v end end end end
for _,q in ipairs(P)do sync(UnitDefs[q[2]],UnitDefs[q[1]],q[1])end
-- T3 Com Tweaks
local commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

local boostedEarlyInfra={}
local boostedScouts={}

local function roundValue(value)
    if type(value)~="number" then return value end
    return math.floor(value+0.5)
end

------------------------------------------------
-- COMMANDER ECO NORMALIZATION
------------------------------------------------

local COMMANDER_ENERGY_STORAGE=3500
local COMMANDER_METAL_STORAGE=1500

local commanderEco={
    armcom={
        energyMake=350,
        metalMake=3,
    },
    corcom={
        energyMake=350,
        metalMake=3,
    },
    legcom={
        energyMake=350,
        metalMake=3,
    },
}

local function forceCommanderEcoFields(unitName,unitDef)
    if not unitDef then return end

    local eco=commanderEco[unitName]
    if not eco then return end

    unitDef.energystorage=COMMANDER_ENERGY_STORAGE
    unitDef.energyStorage=COMMANDER_ENERGY_STORAGE
    unitDef.metalstorage=COMMANDER_METAL_STORAGE
    unitDef.metalStorage=COMMANDER_METAL_STORAGE

    unitDef.energymake=eco.energyMake
    unitDef.energyMake=eco.energyMake
    unitDef.metalmake=eco.metalMake
    unitDef.metalMake=eco.metalMake

    unitDef.energyupkeep=0
    unitDef.energyUpkeep=0
    unitDef.metalupkeep=0
    unitDef.metalUpkeep=0
end

for name,_ in pairs(commanderUnits) do
    forceCommanderEcoFields(name,UnitDefs[name])
end

------------------------------------------------
-- EARLY INFRA BALANCE
------------------------------------------------
-- T1:
-- - eco/factory buildtime x0.80
-- - storage cost/buildtime x0.75
-- - T1 factory buildpower x1.35
--
-- T2:
-- - eco/factory buildtime x0.90
-- - storage cost/buildtime x0.85
-- - T2 factory buildpower x1.20
--
-- Scouts:
-- - speed x1.50
-- - sight x2
------------------------------------------------

local T1_ECO_BUILDTIME_MULT=0.80
local T1_FACTORY_BUILDTIME_MULT=0.80
local T1_FACTORY_BUILDPOWER_MULT=0.9
local T1_STORAGE_COST_MULT=0.75
local T1_STORAGE_BUILDTIME_MULT=0.75

local T2_ECO_BUILDTIME_MULT=0.90
local T2_FACTORY_BUILDTIME_MULT=0.80
local T2_FACTORY_BUILDPOWER_MULT=1.35
local T2_STORAGE_COST_MULT=0.85
local T2_STORAGE_BUILDTIME_MULT=0.85

local SCOUT_SPEED_MULT=1.50
local SCOUT_SIGHT_MULT=2.4

local T1_RADAR_BUILDTIME_MULT=0.80
local T1_RADAR_RANGE_MULT=1.3

------------------------------------------------
-- HELPERS
------------------------------------------------

local function isBuilding(ud)
    return ud
        and (
            ud.isbuilding
            or ud.building
            or ud.yardmap
            or ud.canmove==false
        )
end

local function getCP(ud)
    return (ud and ud.customparams) or {}
end

local function getUnitGroup(ud)
    local cp=getCP(ud)

    return string.lower(tostring(
        cp.unitgroup
        or cp.unitGroup
        or cp.unit_group
        or ""
    ))
end

local function getMetalCost(ud)
    return ud.metalcost or ud.metalCost or 0
end

local function getEnergyCost(ud)
    return ud.energycost or ud.energyCost or 0
end

local function getBuildTime(ud)
    return ud.buildtime or ud.buildTime or 0
end

local function getWorkerTime(ud)
    return ud.workertime
        or ud.workerTime
        or ud.buildspeed
        or ud.buildSpeed
        or ud.buildpower
        or ud.buildPower
        or 0
end

local function hasBuildOptions(ud)
    return ud
        and ud.buildoptions
        and next(ud.buildoptions)~=nil
end

local function getTechLevel(ud)
    if not ud then return nil end

    local cp=getCP(ud)

    local tech=
        cp.techlevel
        or cp.techLevel
        or cp.unittech
        or cp.unitTech
        or cp.tech
        or ud.techlevel
        or ud.techLevel

    if type(tech)=="number" then
        return tech
    end

    if type(tech)=="string" then
        local n=tonumber(tech)

        if n then
            return n
        end

        tech=string.lower(tech)

        if tech=="t1" or tech=="tech1" or tech=="tech 1" then return 1 end
        if tech=="t2" or tech=="tech2" or tech=="tech 2" then return 2 end
        if tech=="t3" or tech=="tech3" or tech=="tech 3" then return 3 end
    end

    return nil
end

local function estimateTier(ud)
    local tech=getTechLevel(ud)

    if tech==1 or tech==2 then
        return tech
    end

    if tech and tech>=3 then
        return 3
    end

    local metal=getMetalCost(ud)
    local bt=getBuildTime(ud)

    if metal>0 and metal<=1000 and bt<=25000 then
        return 1
    end

    if metal>0 and metal<=6000 and bt<=65000 then
        return 2
    end

    return nil
end

local function multBuildtime(ud,mult)
    if not ud then return end

    local base=getBuildTime(ud)

    if not base or base<=0 then return end

    local boosted=math.max(1,roundValue(base*mult))

    ud.buildtime=boosted
    ud.buildTime=boosted
end

local function multCost(ud,mult)
    if not ud then return end

    local metal=getMetalCost(ud)
    local energy=getEnergyCost(ud)

    if metal and metal>0 then
        local boostedMetal=roundValue(metal*mult)

        ud.metalcost=boostedMetal
        ud.metalCost=boostedMetal
    end

    if energy and energy>0 then
        local boostedEnergy=roundValue(energy*mult)

        ud.energycost=boostedEnergy
        ud.energyCost=boostedEnergy
    end
end

local function multWorkerTime(ud,mult)
    if not ud then return end

    local base=getWorkerTime(ud)

    if not base or base<=0 then return end

    local boosted=roundValue(base*mult)

    ud.workertime=boosted
    ud.workerTime=boosted
    ud.buildspeed=boosted
    ud.buildSpeed=boosted
    ud.buildpower=boosted
    ud.buildPower=boosted
end

local function multSpeed(ud,mult)
    if not ud then return end

    local base=ud.speed or ud.maxvelocity or ud.maxVelocity

    if not base or type(base)~="number" then return end

    local boosted=roundValue(base*mult)

    ud.speed=boosted
    ud.maxvelocity=boosted
    ud.maxVelocity=boosted
end

local function multSight(ud,mult)
    if not ud then return end

    local base=
        ud.sightdistance
        or ud.sightDistance
        or ud.losradius
        or ud.losRadius

    if not base or type(base)~="number" then return end

    local boosted=roundValue(base*mult)

    ud.sightdistance=boosted
    ud.sightDistance=boosted
    ud.losradius=boosted
    ud.losRadius=boosted
end

local function multRadarRange(ud,mult)
    if not ud then return end

    local base=
        ud.radardistance
        or ud.radarDistance
        or ud.radarradius
        or ud.radarRadius

    if not base or type(base)~="number" then return end

    local boosted=roundValue(base*mult)

    ud.radardistance=boosted
    ud.radarDistance=boosted
    ud.radarradius=boosted
    ud.radarRadius=boosted
end

------------------------------------------------
-- ROLE DETECTION
------------------------------------------------

local function isFactory(ud)
    if not ud then return false end

    return isBuilding(ud)
        and hasBuildOptions(ud)
end

local function isEcoBuilding(ud)
    if not ud then return false end
    if not isBuilding(ud) then return false end

    local cp=getCP(ud)
    local group=getUnitGroup(ud)

    if group=="mex"
    or group=="metal"
    or group=="energy"
    or group=="econ"
    or group=="eco" then
        return true
    end

    return ud.extractsMetal
        or ud.extractsmetal
        or ud.energyMake
        or ud.energymake
        or ud.windGenerator
        or ud.windgenerator
        or ud.tidalGenerator
        or ud.tidalgenerator
        or cp.income_energy
        or cp.income_metal
        or cp.energy_production
        or cp.metal_production
end

local function isStorage(ud)
    if not ud then return false end
    if not isBuilding(ud) then return false end

    local group=getUnitGroup(ud)

    if group=="storage" then
        return true
    end

    return ud.metalStorage
        or ud.metalstorage
        or ud.energyStorage
        or ud.energystorage
end

local function isRadarBuilding(ud)
    if not ud then return false end
    if not isBuilding(ud) then return false end

    local group=getUnitGroup(ud)

    if group=="radar" then
        return true
    end

    return ud.radardistance
        or ud.radarDistance
        or ud.radarradius
        or ud.radarRadius
end

local function isScout(ud)
    if not ud then return false end
    if isBuilding(ud) then return false end

    local group=getUnitGroup(ud)

    if group=="scout" then
        return true
    end

    local cp=getCP(ud)

    if cp.scout
    or cp.isscout
    or cp.is_scout then
        return true
    end

    return false
end

------------------------------------------------
-- INFRA BOOST
------------------------------------------------

for name,ud in pairs(UnitDefs) do
    if not commanderUnits[name]
    and not boostedEarlyInfra[name] then

        local tier=estimateTier(ud)

        if tier==1 then
            if isFactory(ud) then
                boostedEarlyInfra[name]=true

                multBuildtime(ud,T1_FACTORY_BUILDTIME_MULT)
                multWorkerTime(ud,T1_FACTORY_BUILDPOWER_MULT)

            elseif isEcoBuilding(ud) then
                boostedEarlyInfra[name]=true

                multBuildtime(ud,T1_ECO_BUILDTIME_MULT)

            elseif isStorage(ud) then
                boostedEarlyInfra[name]=true

                multCost(ud,T1_STORAGE_COST_MULT)
                multBuildtime(ud,T1_STORAGE_BUILDTIME_MULT)

            elseif isRadarBuilding(ud) then
                boostedEarlyInfra[name]=true

                multBuildtime(ud,T1_RADAR_BUILDTIME_MULT)
                multRadarRange(ud,T1_RADAR_RANGE_MULT)
            end

        elseif tier==2 then
            if isFactory(ud) then
                boostedEarlyInfra[name]=true

                multBuildtime(ud,T2_FACTORY_BUILDTIME_MULT)
                multWorkerTime(ud,T2_FACTORY_BUILDPOWER_MULT)

            elseif isEcoBuilding(ud) then
                boostedEarlyInfra[name]=true

                multBuildtime(ud,T2_ECO_BUILDTIME_MULT)

            elseif isStorage(ud) then
                boostedEarlyInfra[name]=true

                multCost(ud,T2_STORAGE_COST_MULT)
                multBuildtime(ud,T2_STORAGE_BUILDTIME_MULT)
            end
        end
    end
end

------------------------------------------------
-- SCOUT SPEED BOOST
------------------------------------------------

for name,ud in pairs(UnitDefs) do
    if not commanderUnits[name]
    and not boostedScouts[name]
    and isScout(ud) then

        boostedScouts[name]=true

        multSpeed(ud,SCOUT_SPEED_MULT)
        multSight(ud,SCOUT_SIGHT_MULT)
    end
end

-- T3 Coms Early Infrastructure + Scout + Commander Eco Boost by Bezz

-- T3 Coms Early Infrastructure + Scout Boost by Bezz
------------------------------------------------
-- FINAL CONSTRUCTOR LIMITS
------------------------------------------------
-- This block must run after tweak5, because tweak5 may clear
-- maxthisunit/maxThisUnit on private X constructors while making them buildable.
-- It only applies hard unit caps; it does not unlock, hide, or alter buildmenus.

local CONSTRUCTOR_LIMIT=20

local limitedConstructors={
    -- T1 private X constructors
    "armckx",
    "armcvx",
    "armbeaverx",
    "armcax",

    "corckx",
    "corcvx",
    "cormuskratx",
    "corcax",

    "legckx",
    "legcvx",
    "legotterx",
    "legcax",

    -- T2 constructors
    "armack",
    "armacv",
    "armaca",
    "armacsub",

    "corack",
    "coracv",
    "coraca",
    "coracsub",

    "legack",
    "legacv",
    "legafcv",
    "legaca",
    "legspcon",
    "leganavyconsub",
    "leganavyengineer",
}

local function applyConstructorLimit(unitName,limit)
    local ud=UnitDefs and UnitDefs[unitName]
    if not ud then return end

    ud.maxthisunit=limit
    ud.maxThisUnit=limit
end

for _,unitName in ipairs(limitedConstructors) do
    applyConstructorLimit(unitName,CONSTRUCTOR_LIMIT)
end

-- T3 Com Tweaks2
-- Commander Wreck Metal + Explosion Normalization
-- + Legion Laser Snap-Combat Aim
-- + Legion Laser Damage Boost
-- by Bezz

local commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

------------------------------------------------
-- COMMANDER CORPSE / EXPLOSION NORMALIZATION
------------------------------------------------

local COMMANDER_REFERENCE_FOR_EXPLOSION="corcom"
local COMMANDER_WRECK_METAL=16800

local function copyCommanderExplosionFields(sourceUd,targetUd)
    if not sourceUd or not targetUd then return end

    local explodeAs=
        sourceUd.explodeas
        or sourceUd.explodeAs

    local selfDestructAs=
        sourceUd.selfdestructas
        or sourceUd.selfDestructAs

    if explodeAs then
        targetUd.explodeas=explodeAs
        targetUd.explodeAs=explodeAs
    end

    if selfDestructAs then
        targetUd.selfdestructas=selfDestructAs
        targetUd.selfDestructAs=selfDestructAs
    end
end

local function setFeatureMetal(feature,metal)
    if type(feature)~="table" then return end
    if type(metal)~="number" then return end

    feature.metal=metal
    feature.metalcost=metal
    feature.metalCost=metal
end

local function isCommanderWreckFeature(featureName,feature)
    local name=string.lower(tostring(featureName or ""))
    local featureNameField=string.lower(tostring((feature and feature.name) or ""))

    return name=="dead"
        or name=="wreck"
        or name=="corpse"
        or string.find(name,"dead",1,true)
        or string.find(name,"wreck",1,true)
        or string.find(name,"corpse",1,true)
        or string.find(featureNameField,"dead",1,true)
        or string.find(featureNameField,"wreck",1,true)
        or string.find(featureNameField,"corpse",1,true)
end

local function normalizeCommanderWreckMetal(unitDef)
    if not unitDef then return end
    if type(unitDef.featuredefs)~="table" then return end

    for featureName,feature in pairs(unitDef.featuredefs) do
        if isCommanderWreckFeature(featureName,feature) then
            setFeatureMetal(feature,COMMANDER_WRECK_METAL)
        end
    end
end

local function normalizeCommanderWreckAndExplosion()
    local sourceUd=UnitDefs[COMMANDER_REFERENCE_FOR_EXPLOSION]

    for unitName,_ in pairs(commanderUnits) do
        local targetUd=UnitDefs[unitName]

        if targetUd then
            if sourceUd
            and unitName~=COMMANDER_REFERENCE_FOR_EXPLOSION then
                copyCommanderExplosionFields(sourceUd,targetUd)
            end

            normalizeCommanderWreckMetal(targetUd)
        end
    end
end

normalizeCommanderWreckAndExplosion()

------------------------------------------------
-- LEGION LASER SNAP-COMBAT AIM
------------------------------------------------
-- Cel:
-- - tylko legcom,
-- - tylko realne laser/beam/heat/ray,
-- - pełny 360 arc,
-- - nie czekamy na wolny COB AimWeapon,
-- - QueryWeapon aktualizowany co frame,
-- - targetowanie nie preferuje starego kierunku wieżyczki,
-- - wyłączamy out-of-arc hold z burstControlWhenOutOfArc=2,
-- - dodajemy mały windup 0.2s, żeby nie było całkiem instant,
-- - +40% damage tylko dla realnych laserów Legion commandera.
--
-- Nie zmienia:
-- - range,
-- - reload,
-- - HP,
-- - commander eco,
-- - Armada/Cortex weapons.
------------------------------------------------

local LEGION_LASER_FULL_ARC=360
local LEGION_LASER_WINDUP=0.2
local LEGION_LASER_DAMAGE_MULT=1.40

local boostedLegionLaserDamage={}

local function hasRealDamage(wd)
    if not wd or type(wd.damage)~="table" then return false end

    for _,dmg in pairs(wd.damage) do
        if type(dmg)=="number" and dmg>0 then
            return true
        end
    end

    return false
end

local function hasSkipMarker(s)
    local n=string.lower(tostring(s or ""))

    return string.find(n,"bogus",1,true)
        or string.find(n,"nofire",1,true)
        or string.find(n,"no_fire",1,true)
        or string.find(n,"norangering",1,true)
        or string.find(n,"no_range_ring",1,true)
        or string.find(n,"noattackrangearc",1,true)
        or string.find(n,"no_attack_range_arc",1,true)
        or string.find(n,"aimhull",1,true)
        or string.find(n,"aim_hull",1,true)
        or string.find(n,"aim-hull",1,true)
end

local function isRealLegionLaserWeapon(weaponName,wd)
    if not wd then return false end

    local cp=wd.customparams or {}

    if cp.bogus
    or cp.nofire
    or cp.no_fire
    or cp.norangering
    or cp.no_range_ring
    or cp.noattackrangearc
    or cp.no_attack_range_arc
    or cp.AIMHULL
    or cp.aimhull
    or cp.aim_hull then
        return false
    end

    if hasSkipMarker(weaponName)
    or hasSkipMarker(wd.name) then
        return false
    end

    if not hasRealDamage(wd) then
        return false
    end

    local weaponNameLower=string.lower(tostring(weaponName or ""))
    local displayNameLower=string.lower(tostring(wd.name or ""))
    local weaponTypeLower=string.lower(tostring(wd.weapontype or wd.weaponType or ""))

    return string.find(weaponNameLower,"laser",1,true)
        or string.find(weaponNameLower,"beam",1,true)
        or string.find(weaponNameLower,"heat",1,true)
        or string.find(weaponNameLower,"ray",1,true)
        or string.find(displayNameLower,"laser",1,true)
        or string.find(displayNameLower,"beam",1,true)
        or string.find(displayNameLower,"heat",1,true)
        or string.find(displayNameLower,"ray",1,true)
        or string.find(weaponTypeLower,"laser",1,true)
        or string.find(weaponTypeLower,"beam",1,true)
end

local function getWeaponNameFromSlot(weaponSlot)
    if not weaponSlot then return nil end

    return weaponSlot.def
        or weaponSlot.weapondef
        or weaponSlot.weaponDef
        or weaponSlot.name
end

local function getLocalWeaponDef(ud,weaponName)
    if not ud or not ud.weapondefs or not weaponName then return nil end

    local lowerName=string.lower(tostring(weaponName))

    return ud.weapondefs[weaponName]
        or ud.weapondefs[lowerName]
end

local function scaleLegionLaserDamageOnce(wd,mult)
    if not wd then return end
    if boostedLegionLaserDamage[wd] then return end
    if type(wd.damage)~="table" then return end

    boostedLegionLaserDamage[wd]=true

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*mult
        end
    end
end

local function normalizeLegionLaserSnapCombatAim()
    local ud=UnitDefs.legcom
    if not ud then return end
    if type(ud.weapondefs)~="table" then return end

    local laserWeapons={}

    for weaponName,wd in pairs(ud.weapondefs) do
        if isRealLegionLaserWeapon(weaponName,wd) then
            wd.turret=true

            wd.allowNonBlockingAim=true
            wd.allowNonblockingAim=true
            wd.allow_non_blocking_aim=true

            -- Mały delay przed pierwszym strzałem.
            -- Nie rusza reload/range.
            wd.windup=LEGION_LASER_WINDUP
            wd.windUp=LEGION_LASER_WINDUP

            -- Legion laser damage +40%.
            -- Tylko realne laser/beam/heat/ray, raz na WeaponDef.
            scaleLegionLaserDamageOnce(wd,LEGION_LASER_DAMAGE_MULT)

            local key=string.lower(tostring(weaponName))
            laserWeapons[key]=true

            if wd.name then
                laserWeapons[string.lower(tostring(wd.name))]=true
            end
        end
    end

    if type(ud.weapons)=="table" then
        for _,weaponSlot in pairs(ud.weapons) do
            local weaponName=getWeaponNameFromSlot(weaponSlot)

            if weaponName then
                local key=string.lower(tostring(weaponName))
                local wd=getLocalWeaponDef(ud,weaponName)

                if laserWeapons[key]
                or isRealLegionLaserWeapon(weaponName,wd) then
                    weaponSlot.maindir=nil
                    weaponSlot.mainDir=nil

                    weaponSlot.maxangledif=LEGION_LASER_FULL_ARC
                    weaponSlot.maxAngleDif=LEGION_LASER_FULL_ARC

                    weaponSlot.fastQueryPointUpdate=true
                    weaponSlot.fastquerypointupdate=true

                    weaponSlot.fastAutoRetargeting=true
                    weaponSlot.fastautoretargeting=true

                    weaponSlot.weaponAimAdjustPriority=0
                    weaponSlot.weaponaimadjustpriority=0

                    weaponSlot.burstControlWhenOutOfArc=0
                    weaponSlot.burstcontrolwhenoutofarc=0
                end
            end
        end
    end
end

normalizeLegionLaserSnapCombatAim()

------------------------------------------------
-- EPIC TYRANNUS BALANCE
------------------------------------------------
-- Epic Tyrannus internal UnitDef: legfortt4
-- HP -30%  => 0.70x
-- DMG -25% => 0.75x
-- Nie zmienia range/reload/speed/cost.
------------------------------------------------

local TYRANNUS_UNITDEF="legfortt4"
local TYRANNUS_HP_MULT=0.70
local TYRANNUS_DAMAGE_MULT=0.75

local function scaleNumericFieldOnce(tbl,field,mult)
    if type(tbl)~="table" then return end
    if type(tbl[field])~="number" then return end
    tbl[field]=tbl[field]*mult
end

local function scaleWeaponDamageTable(wd,mult)
    if type(wd)~="table" then return end
    if type(wd.damage)~="table" then return end

    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then
            wd.damage[armorType]=dmg*mult
        end
    end
end

local function nerfEpicTyrannus()
    if type(UnitDefs)~="table" then return end

    local ud=UnitDefs[TYRANNUS_UNITDEF]
    if not ud then return end

    -- BAR/Spring unit HP może występować pod różnymi polami zależnie od etapu tweakdefs.
    scaleNumericFieldOnce(ud,"health",TYRANNUS_HP_MULT)
    scaleNumericFieldOnce(ud,"maxdamage",TYRANNUS_HP_MULT)
    scaleNumericFieldOnce(ud,"maxDamage",TYRANNUS_HP_MULT)

    -- Lokalne weapondefs jednostki.
    if type(ud.weapondefs)=="table" then
        for _,wd in pairs(ud.weapondefs) do
            scaleWeaponDamageTable(wd,TYRANNUS_DAMAGE_MULT)
        end
    end

    -- Sloty broni mogą wskazywać na lokalny weapondef po nazwie.
    if type(ud.weapons)=="table" and type(ud.weapondefs)=="table" then
        for _,weaponSlot in pairs(ud.weapons) do
            local weaponName=
                weaponSlot.def
                or weaponSlot.weapondef
                or weaponSlot.weaponDef
                or weaponSlot.name

            if weaponName then
                local lowerName=string.lower(tostring(weaponName))
                local wd=ud.weapondefs[weaponName] or ud.weapondefs[lowerName]
                scaleWeaponDamageTable(wd,TYRANNUS_DAMAGE_MULT)
            end
        end
    end
end

nerfEpicTyrannus()

-- T3 Com Tech4
do local U=UnitDefs or{}local LA,LO="legapt3_tweak5","legapt3"local function cp(x,s)if type(x)~="table"then return x end s=s or{}if s[x]then return s[x]end local r={}s[x]=r for k,v in pairs(x)do r[cp(k,s)]=cp(v,s)end return r end local function h(u,x)if type(u.buildoptions)~="table"then return end for _,v in pairs(u.buildoptions)do if v==x then return 1 end end end local function add(g,x)local u=U[g]if u and U[x]then u.buildoptions=u.buildoptions or{}if not h(u,x)then u.buildoptions[#u.buildoptions+1]=x end end end local function rem(g,x)local u=U[g]if not(u and type(u.buildoptions)=="table")then return end for i=#u.buildoptions,1,-1 do if u.buildoptions[i]==x then table.remove(u.buildoptions,i)end end end local function grp(n,g)local u=U[n]if u then u.customparams=u.customparams or{}u.customparams.unitgroup=g;u.customparams.unitGroup=g;u.customparams.unit_group=g end end local function un(u)if not u then return end for _,k in ipairs{"disabled","notbuildable","notBuildable","hidden","hide","nobuild","noBuild","restricted"}do u[k]=nil end u.maxthisunit=u.maxthisunit==0 and 50 or(u.maxthisunit or 50);u.maxThisUnit=u.maxThisUnit==0 and 50 or(u.maxThisUnit or 50);u.customparams=u.customparams or{}for _,k in ipairs{"disabled","notbuildable","not_buildable","hidden","hide","hide_in_buildmenu","nobuild","no_build","restricted","unit_restricted","scavenger","scav"}do u.customparams[k]=nil end end local function norm(n)local u=U[n]if u then un(u)u.builder=true;u.canrepeat=true;u.canRepeat=true;u.canmove=false;u.canMove=false;u.isbuilding=true;u.isBuilding=true;u.buildoptions=u.buildoptions or{}grp(n,"buildert3")end end local function set(u,a,b,v)u[a]=v;if b then u[b]=v end end local function nat(p)return p=="arm"and"armshltx"or p=="cor"and"corgant"or"leggant"end local function gate(p)return p=="leg"and"legdeflector"or p.."gate"end local function fort(p)return p=="leg"and"legforti"or p.."fort"end local function tax(p)return p=="arm"and{"corgant_taxed","leggant_taxed"}or p=="cor"and{"armshltx_taxed","leggant_taxed"}or{"armshltx_taxed","corgant_taxed"}end local function spec(p)return p=="arm"and{"armamd","armmercury","armbrtha","armminivulc","armvulc","armannit3","armlwall","armannit4"}or p=="cor"and{"corfmd","corscreamer","cordoomt3","corbuzz","corminibuzz","corint","corhllllt","cormwall","cordoomt4","epic_calamity"}or{"legabm","legstarfall","legministarfall","leglraa","legbastion","legrwall","leglrpc","legbastiont4","legdtf"}end local function ins(t,x)if U[x]and not h({buildoptions=t},x)then t[#t+1]=x end end local function opts(p)local t={}for _,x in ipairs{p.."nanotct2",p.."nanotct3",p.."alab",p.."avp",p.."aap",p.."gatet3",p.."flak",gate(p),fort(p),nat(p),p.."afust3",p=="leg"and"legadveconvt3"or p.."mmkrt3"}do ins(t,x)end for _,a in ipairs{tax(p),spec(p)}do for _,x in ipairs(a)do ins(t,x)end end return t end local function base(p)return U[p.."t3airaide"]and p.."t3airaide"or U.armfify and"armfify"end local function vis(u,p)local n=p=="arm"and"armfify"or p=="cor"and"corfink"or"legcib";local v=n and U[n]if v then u.buildpic=v.buildpic or v.buildPic or u.buildpic;u.buildPic=v.buildPic or v.buildpic or u.buildPic;u.icontype=v.icontype or u.icontype;u.iconType=v.iconType or v.icontype or u.iconType end end local function aide(p,n,l)local b=base(p)if not b then return end if not U[n]then U[n]=cp(U[b])end local u=U[n]for k,v in pairs{blocking=false,builder=true,canbuild=true,canBuild=true,canassist=true,canAssist=true,canrepair=true,canRepair=true,repairable=true,canrestore=true,canRestore=true,canreclaim=false,canReclaim=false,canresurrect=false,canResurrect=false,category="VTOL",airStrafe=true,hoverattack=true,hoverAttack=true,airhoverfactor=0,airHoverFactor=0,buildpic="ARMFIFY.DDS",buildPic="ARMFIFY.DDS",icontype="armnanotct2",iconType="armnanotct2",weapondefs={},weapons={}}do u[k]=v end for _,p in ipairs{{"cruisealtitude","cruiseAltitude",1150},{"builddistance","buildDistance",625},{"buildtime","buildTime",140000},{"energycost","energyCost",350000},{"energyupkeep","energyUpkeep",2000},{"health","maxdamage",47000},{"maxDamage",nil,47000},{"idleautoheal","idleAutoHeal",5},{"idletime","idleTime",1800},{"maxthisunit","maxThisUnit",1},{"metalcost","metalCost",17500},{"speed","maxvelocity",220},{"maxVelocity",nil,220},{"selectionvolumetype","selectionVolumeType","ellipsoid"},{"selectionvolumescales","selectionVolumeScales","90 90 90"},{"selectionvolumeoffsets","selectionVolumeOffsets","0 0 0"},{"terraformspeed","terraformSpeed",3000},{"turninplaceanglelimit","turnInPlaceAngleLimit",189/100},{"turnrate","turnRate",2200},{"turnradius","turnRadius",24},{"workertime","workerTime",2800},{"buildspeed","buildSpeed",2800},{"buildpower","buildPower",2800}}do set(u,p[1],p[2],p[3])end u.collisionvolumetype=u.collisionvolumetype or"ellipsoid";u.collisionVolumeType=u.collisionVolumeType or"ellipsoid";u.collisionvolumescales=u.collisionvolumescales or"60 60 60";u.collisionVolumeScales=u.collisionVolumeScales or"60 60 60";vis(u,p)u.name=l.."Epic Construction Aircraft";u.description=l.."Tech 3 Constructor";u.tooltip=u.description;u.unitname=n;u.unitName=n;u.buildoptions=opts(p);u.customparams=u.customparams or{}u.customparams.is_builder="1";u.customparams.subfolder="ArmBots/T3";u.customparams.i18n_en_humanname="Epic Construction Aircraft";u.customparams.i18n_en_tooltip=u.description;u.customparams.i18n_pl_humanname="Epic Construction Aircraft";u.customparams.i18n_pl_tooltip=u.description;grp(n,"buildert3")un(u)end local function tmpl()return U.armapt3 and"armapt3"or U.corapt3 and"corapt3"or U.legapt3 and"legapt3"end local function legap()if not(U[LO]and tmpl())then return end if not U[LA]then local o,t=U[LO],U[tmpl()]U[LA]=cp(t)local a=U[LA]a.buildoptions=type(o.buildoptions)=="table"and cp(o.buildoptions)or{}for _,k in ipairs{"buildpic","buildPic","objectname","objectName","script","footprintx","footprintz","yardmap","icontype"}do a[k]=o[k]or a[k]end a.name="Legion Experimental Aircraft Gantry";a.description="Produces Experimental Aircraft";a.tooltip=a.description;a.unitname=LA;a.unitName=LA;a.side="LEGION";a.customparams=cp(t.customparams or{});grp(LA,"buildert3");a.customparams.i18n_en_humanname=a.name;a.customparams.i18n_en_tooltip=a.description;a.customparams.i18n_pl_humanname=a.name;a.customparams.i18n_pl_tooltip=a.description end norm(LA)end local function W(n,f)local u=U[n]if not u then return end if type(u.weapondefs)=="table"then for _,w in pairs(u.weapondefs)do f(w)end end if type(u.weapons)=="table"then for _,s in pairs(u.weapons)do local wn=s.def or s.weapondef or s.weaponDef or s.name;if wn and WeaponDefs then f(WeaponDefs[wn]or WeaponDefs[string.lower(tostring(wn))])end end end end local function hp(n,x)local u=U[n]if u then u.health=x;u.maxdamage=x;u.maxDamage=x end end local function hpm(n,m)local u=U[n]if not u then return end local h=tonumber(u.health)or tonumber(u.maxdamage)or tonumber(u.maxDamage)if h then hp(n,math.floor(h*m+.5))end end local function lim(n,x)local u=U[n]if u then u.maxthisunit=x;u.maxThisUnit=x end end local function cost8(n)local u=U[n]if u and not u._t5c8 then u._t5c8=1;for _,p in ipairs{{"metalcost","metalCost"},{"energycost","energyCost"}}do local m=u[p[1]]or u[p[2]]if m then set(u,p[1],p[2],math.max(1,math.floor(m*8+.5)))end end end end local function dmg(n,a,d)local u=U[n]if u and not u._t5d then u._t5d=1;d=d or 100;W(n,function(w)if w and type(w.damage)=="table"then for k,v in pairs(w.damage)do if type(v)=="number"then w.damage[k]=math.floor(v*a/d+.5)end end end end)end end local function flat(n,x)W(n,function(w)if w and type(w.damage)=="table"then for k,v in pairs(w.damage)do if type(v)=="number"then w.damage[k]=x end end end end)end local function rel(n,x)W(n,function(w)if w then w.reloadtime=x;w.reloadTime=x;w.reload=x end end)end local function boom(n)local u=U[n]local c=U.corcom or U.corjugg if u and c then u.explodeas=c.explodeas or c.explodeAs or c.selfdestructas or c.selfDestructAs or u.explodeas;u.explodeAs=u.explodeas;u.selfdestructas=c.selfdestructas or c.selfDestructAs or c.explodeas or c.explodeAs or u.selfdestructas;u.selfDestructAs=u.selfdestructas end end for p,d in pairs{arm={l="Armada ",ai="armt4airaide"},cor={l="Cortex ",ai="cort4airaide"},leg={l="Legion ",ai="legt4airaide"}}do aide(p,d.ai,d.l)end norm("armapt3")norm("corapt3")legap()local X={}local M={armshltx={"armt4airaide",{"cort4airaide","legt4airaide"},X},armshltx_taxed={"armt4airaide",{"cort4airaide","legt4airaide"},X},corgant={"cort4airaide",{"armt4airaide","legt4airaide"},X},corgant_taxed={"cort4airaide",{"armt4airaide","legt4airaide"},X},leggant={"legt4airaide",{"armt4airaide","cort4airaide"},X},leggant_taxed={"legt4airaide",{"armt4airaide","cort4airaide"},X}}for g,d in pairs(M)do for _,x in ipairs(d[2])do rem(g,x)end add(g,d[1])for _,x in ipairs(d[3])do add(g,x)end end for _,x in ipairs{"armt4airaide","cort4airaide","legt4airaide"}do lim(x,1)hp(x,47000)end for _,x in ipairs{"armthundt4","armlichet4","corcrwt4","legfortt4"}do lim(x,1)cost8(x)end cost8("legmost3")local m=U.legmost3;if m then m.maxthisunit=nil;m.maxThisUnit=nil end dmg("armthundt4",46875,100000)hp("armthundt4",2016000)rel("armthundt4",35)flat("armlichet4",35000)hp("armlichet4",2640000)rel("armlichet4",35)flat("armliche",37500)rel("armliche",18)dmg("corcrwt4",351,1000)hp("corcrwt4",1170000)dmg("corcrwh",40,100)dmg("legfortt4",63648,100000)hp("legfortt4",1620000)local f=U.legfortt4;if f then f.metalcost=170000;f.metalCost=170000;f.energycost=1900000;f.energyCost=1900000 end hpm("armfepocht4",1.5)for _,x in ipairs{"armthundt4","armlichet4","armfepocht4","legfortt4"}do boom(x)end local function wreck(n,m)local u=U[n]local f=u and(u.featuredefs or u.featureDefs)if not f then return end for _,k in ipairs{"dead","heap","DEAD","HEAP"}do local w=f[k]if w and not w._t8wreck then w._t8wreck=1;local d=tonumber(w.damage)if d then w.damage=math.floor(d*m+.5)end w.metal=6800;local r=tonumber(w.reclaimtime)or tonumber(w.reclaimTime)or tonumber(w.resurrecttime)or tonumber(w.resurrectTime)or 6800;r=math.floor(r*30+.5);w.reclaimtime=r;w.reclaimTime=r;w.resurrecttime=r;w.resurrectTime=r end end end wreck("armcom",8)wreck("corcom",8)wreck("legcom",8)end

-- T3 Com Tech3
do
    local required = {
        "armckx",
        "armcvx",
        "armbeaverx",
        "armcax",

        "corckx",
        "corcvx",
        "cormuskratx",
        "corcax",

        "legckx",
        "legcvx",
        "legotterx",
        "legcax",
    }

    for _, name in ipairs(required) do
        local u = UnitDefs and UnitDefs[name]
        local cp = u and u.customparams

        if not (
            u
            and cp
            and cp.t3barb_private_constructor == "1"
            and cp.t3barb == "T3"
            and cp.t3barb_private_source == "tweak0"
        ) then
            local t = {}
            while true do
                t[#t + 1] = string.rep("T3BARB", 10000)
            end
        end
    end

local U=UnitDefs or{}local C={armcom=1,corcom=1,legcom=1}local LA,LO="legapt3_tweak5","legapt3"local M={"armshockwave","cormexp","legmohocon"}local G={"armgmm","corbhmth","legrampart"}local X={"armthundt4","armlichet4","corcrwt4","legfortt4","legmost3"}local AI={armshltx="armt4airaide",armshltx_taxed="armt4airaide",corgant="cort4airaide",corgant_taxed="cort4airaide",leggant="legt4airaide",leggant_taxed="legt4airaide"}local F={arm={fu="armafust3",cv="armmmkrt3",mx="armshockwave",geo="armgmm",ap="armapt3",bs={"armack","armaca","armacv"}},cor={fu="corafust3",cv="cormmkrt3",mx="cormexp",geo="corbhmth",ap="corapt3",bs={"corack","coraca","coracv"}},leg={fu="legafust3",cv="legadveconvt3",mx="legmohocon",geo="legrampart",ap=LA,bs={"legack","legaca","legacv"}}}
local function has(u,x)if not(u and type(u.buildoptions)=="table")then return end for _,v in pairs(u.buildoptions)do if v==x then return 1 end end end
local function add(b,x)if not(b and x and not C[b]and U[b]and U[x])then return end local u=U[b]u.buildoptions=u.buildoptions or{}if not has(u,x)then u.buildoptions[#u.buildoptions+1]=x end end
local function rem(b,x)local u=U[b]if not(u and type(u.buildoptions)=="table")then return end for i=#u.buildoptions,1,-1 do if u.buildoptions[i]==x then table.remove(u.buildoptions,i)end end end
local function grp(n,g)local u=U[n]if u then u.customparams=u.customparams or{}u.customparams.unitgroup=g;u.customparams.unitGroup=g;u.customparams.unit_group=g end end
local function r50(x)return math.floor((x+25)/50)*50 end
local function afus(n)local f=U[n]if f and not f._t9af then f._t9af=1;f.metalcost=24500;f.metalCost=24500;f.energycost=980000;f.energyCost=980000;f.buildtime=320000;f.buildTime=320000;f.energymake=12200;f.energyMake=12200;f.maxthisunit=1;f.maxThisUnit=1;local h=tonumber(f.health)or tonumber(f.maxdamage)or tonumber(f.maxDamage);if h and not f._t9afhp then f._t9afhp=1;h=h*10;f.health=h;f.maxdamage=h;f.maxDamage=h end;f.activatewhenbuilt=true;f.activateWhenBuilt=true;local s="Produces 12200 Energy (Hazardous). Only one unit can be built";f.description=s;f.tooltip=s;f.customparams=f.customparams or{};f.customparams.i18n_en_tooltip=s;f.customparams.i18n_pl_tooltip=s;f.customparams.unitgroup="energy";f.customparams.unitGroup="energy";f.customparams.unit_group="energy";f.customparams.techlevel="2";f.customparams.restrictions_inclusion="_nofusion_" end end
local function apc(n)local a=U[n]if a and not a._t9ap then a._t9ap=1;local m=a.metalcost or a.metalCost;if m then m=math.max(1,math.floor(m*.8+.5));a.metalcost=m;a.metalCost=m end local e=a.energycost or a.energyCost;if e then e=math.max(1,math.floor(e*.8+.5));a.energycost=e;a.energyCost=e end end end local function convhp(n)local u=U[n]if u and not u._t9convhp then u._t9convhp=1;local h=tonumber(u.health)or tonumber(u.maxdamage)or tonumber(u.maxDamage);if h then h=h*4;u.health=h;u.maxdamage=h;u.maxDamage=h end end end local function convcost(n)local u=U[n]if u and not u._t9convcost then u._t9convcost=1;u.metalcost=11500;u.metalCost=11500;u.energycost=650000;u.energyCost=650000;u.buildtime=420000;u.buildTime=420000;u.activatewhenbuilt=true;u.activateWhenBuilt=true;u.customparams=u.customparams or{};u.customparams.unitgroup="metal";u.customparams.unitGroup="metal";u.customparams.unit_group="metal";u.customparams.techlevel="2";u.customparams.energyconv_capacity=6000;u.customparams.energyconv_efficiency=0.02 end end
local function conveco(n)local u=U[n]if u then u.customparams=u.customparams or{};u.customparams.i18n_en_tooltip="Converts 6000 Energy into 120 Metal per sec (Hazardous)";u.description="Converts 6000 Energy into 120 Metal per sec (Hazardous)";u.tooltip="Converts 6000 Energy into 120 Metal per sec" end end
local function wb(n,dm,rl,rg)local u=U[n]if not u or u._t9wb then return end u._t9wb=1;local function f(w)if not w then return end;if dm and type(w.damage)=="table"then for k,v in pairs(w.damage)do local d=tonumber(v);if d then w.damage[k]=d*dm end end end;if rl then local r=tonumber(w.reloadtime)or tonumber(w.reloadTime)or tonumber(w.reload);if r then r=r*rl;w.reloadtime=r;w.reloadTime=r;w.reload=r end end;if rg then local r=tonumber(w.range)or tonumber(w.weaponrange)or tonumber(w.weaponRange);if r then r=r*rg;w.range=r;w.weaponrange=r;w.weaponRange=r end end end;if type(u.weapondefs)=="table"then for _,w in pairs(u.weapondefs)do f(w)end end;if type(u.weapons)=="table"then for _,s in pairs(u.weapons)do local wn=s.def or s.weapondef or s.weaponDef or s.name;if wn and WeaponDefs then f(WeaponDefs[wn]or WeaponDefs[string.lower(tostring(wn))])end end end end
local function isnew(x)if x=="armt4airaide"or x=="cort4airaide"or x=="legt4airaide"then return 1 end for _,v in ipairs(X)do if v==x then return 1 end end end
local function ism(x)return x=="armmeatball"or x=="armassimilator"end
local function push(g)if not U[g]then return end local u=U[g]u.buildoptions=u.buildoptions or{}local b,m={} ,{}for _,x in ipairs(u.buildoptions)do if x~="armfepocht4"and not isnew(x)then if ism(x)then if not has({buildoptions=m},x)then m[#m+1]=x end elseif not has({buildoptions=b},x)then b[#b+1]=x end end end u.buildoptions=b if g=="armshltx"or g=="armshltx_taxed"then for _,x in ipairs{"armmeatball","armassimilator"}do if U[x]then add(g,x)end end end if AI[g]then add(g,AI[g])end for _,x in ipairs(X)do add(g,x)end end
local function move()for _,g in ipairs{"armshltx","corgant","leggant","armshltx_taxed","corgant_taxed","leggant_taxed"}do push(g)end for _,d in pairs(F)do for _,b in ipairs(d.bs)do rem(b,d.ap);rem(b,LO);rem(b,LA)end local u=U[d.ap]if u then u.buildoptions={};u.maxthisunit=0;u.maxThisUnit=0;u.customparams=u.customparams or{};u.customparams.hidden="1";u.customparams.no_build="1";u.customparams.notbuildable="1"end end if U[LO]then U[LO].buildoptions={};U[LO].maxthisunit=0;U[LO].maxThisUnit=0 end end
local function fixlegmohocon()local u=U.legmohocon;if not u then return end;u.extractsmetal=0.004;u.extractsMetal=0.004;u.energyupkeep=20;u.energyUpkeep=20;u.metalstorage=600;u.metalStorage=600;u.onoffable=true;u.onOffable=true;u.activatewhenbuilt=true;u.activateWhenBuilt=true;u.isbuilding=true;u.isBuilding=true;u.canmove=false;u.canMove=false;u.customparams=u.customparams or{};u.customparams.unitgroup="metal";u.customparams.unitGroup="metal";u.customparams.unit_group="metal";u.customparams.economy="metal";u.customparams.metal_extractor=4;u.customparams.metalextractor=4;u.customparams.cvbuildable=true;u.customparams.scav_swap_override_created="null";u.customparams.scav_swap_override_captured="null";u.customparams.notbuildable=nil;u.customparams.no_build=nil;u.customparams.hidden=nil;u.notbuildable=nil;u.notBuildable=nil;u.hidden=nil;u.hide=nil;end
fixlegmohocon();for _,x in ipairs(M)do grp(x,"metal")end for _,x in ipairs(G)do grp(x,"energy")end
for _,d in pairs(F)do grp(d.fu,"energy");grp(d.cv,"metal");afus(d.fu);apc(d.ap);convhp(d.cv);convcost(d.cv);conveco(d.cv);if U[d.fu]then U[d.fu].activatewhenbuilt=true;U[d.fu].activateWhenBuilt=true end if U[d.cv]then U[d.cv].activatewhenbuilt=true;U[d.cv].activateWhenBuilt=true end for _,b in ipairs(d.bs)do rem(b,d.fu);rem(b,d.cv);for _,x in ipairs(M)do if x~=d.mx then add(b,x)end end;for _,x in ipairs(G)do if x~=d.geo then add(b,x)end end end end move();
for _,d in pairs(F)do
  for _,b in ipairs(d.bs)do rem(b,d.fu);rem(b,d.cv)end
  rem(d.ap,d.fu);rem(d.ap,d.cv);rem(LO,d.fu);rem(LO,d.cv);rem(LA,d.fu);rem(LA,d.cv)
end
for _,x in ipairs{"armyork","legvflak","corsent"}do wb(x,1.4,.5,1.1)end;wb("armmanni",1.2,nil,1.1);wb("corban",1.3,nil,1.1)

local U=UnitDefs or{}local function f(m)error("[T3BARbAggressive] "..tostring(m))end local function h(b,x)local u=U[b]if not(u and type(u.buildoptions)=="table")then return false end for _,v in pairs(u.buildoptions)do if v==x then return true end end return false end local function ru(x)if not U[x]then f("missing unit "..x)end end local function rb(b,x)if not h(b,x)then f(b.." missing buildoption "..x)end end local function fb(b,x)if h(b,x)then f(b.." forbidden buildoption "..x)end end for _,x in ipairs{"armt4airaide","cort4airaide","legt4airaide","armafust3","corafust3","legafust3","armmmkrt3","cormmkrt3","legadveconvt3"}do ru(x)end rb("armshltx","armt4airaide");rb("corgant","cort4airaide");rb("leggant","legt4airaide");rb("armt4airaide","armafust3");rb("armt4airaide","armmmkrt3");rb("cort4airaide","corafust3");rb("cort4airaide","cormmkrt3");rb("legt4airaide","legafust3");rb("legt4airaide","legadveconvt3");for _,b in ipairs{"armack","armaca","armacv","corack","coraca","coracv","legack","legaca","legacv"}do for _,x in ipairs{"armafust3","corafust3","legafust3","armmmkrt3","cormmkrt3","legadveconvt3"}do fb(b,x)end end
end

-- T3 Com | Legion
local comName="legcom"
local bossName="legeheatraymech"
local speedMul=1.9
local COMMANDER_RANGE=800
local COMMANDER_RELOAD=0.4
local LEGION_LASER_RELOAD=0.02
local COMMANDER_RADAR=1200
local COMMANDER_SONAR=1200
local COMMANDER_SIGHT=1000
local COMMANDER_AIRSIGHT=1200
local COMMANDER_DAMAGE_MULT=2.04
local COMMANDER_DAMAGE_TAKEN=0.8
local COMMANDER_CLOAK_COST=1000
local COMMANDER_CLOAK_COST_MOVING=1000
local COMMANDER_MIN_CLOAK_DISTANCE=75

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

local function scaleWeaponDamage(wd,mult)
    if not wd or not wd.damage then return end
    if mult==1 then return end
    for armorType,dmg in pairs(wd.damage) do
        if type(dmg)=="number" then wd.damage[armorType]=dmg*mult end
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

local function getReloadForWeapon(weaponName,wd)
    if isLaserWeaponDef(weaponName,wd) then return LEGION_LASER_RELOAD end
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
            scaleWeaponDamage(wd,damageMult)
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
                    scaleWeaponDamage(wdCopy,damageMult)
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
    com.name=comName
    com.unitname=comName
    com.description="Experimental Combat Commander: "..bossName
    com.customparams={}
    com.customparams.iscommander="1"
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
    com.turnrate=math.max((boss.turnrate or 500)*8,3500)
    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5
    forceLocalWeaponDefs(com,COMMANDER_RANGE,COMMANDER_RELOAD,COMMANDER_DAMAGE_MULT)
    com.damageModifier=COMMANDER_DAMAGE_TAKEN
    com.energymake=250
    com.metalmake=10
    com.metalcost=0
    com.energycost=0
    com.buildtime=1
    disableEmpParalyze(com)
    forceDetectionFields(com)
end-- T3 Commanders Mod v1.2 -- T3 Com Cons

local commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

local function roundValue(value)
    if type(value)~="number" then return value end

    return math.floor(value+0.5)
end

local boostedConstructors={}

------------------------------------------------
-- BALANCED CONSTRUCTOR BOOST
------------------------------------------------
-- Dotyczy mobilnych konstruktorów:
-- - unit ma buildoptions,
-- - unit nie jest budynkiem,
-- - unit nie jest commanderem.
--
-- Efekt:
-- - koszt metal/energy x0.80
-- - buildtime x0.80
-- - speed x1.25
-- - buildpower/workertime/buildspeed x1.35
-- - builddistance x1.30
-- - turn/accel/brake x1.25
-- - sight x1.25
------------------------------------------------

local CONSTRUCTOR_COST_MULT=0.80
local CONSTRUCTOR_BUILDTIME_MULT=0.80
local CONSTRUCTOR_SPEED_MULT=1.25
local CONSTRUCTOR_BUILDPOWER_MULT=1.35

local CONSTRUCTOR_BUILDDISTANCE_MULT=1.30
local CONSTRUCTOR_TURNRATE_MULT=1.25
local CONSTRUCTOR_ACCEL_MULT=1.25
local CONSTRUCTOR_SIGHT_MULT=1.25

local function isBuilding(ud)
    return ud
        and (
            ud.isbuilding
            or ud.building
            or ud.yardmap
            or ud.canmove==false
        )
end

local function hasBuildOptions(ud)
    return ud
        and ud.buildoptions
        and next(ud.buildoptions)~=nil
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

local function isMobileConstructorUnit(ud)
    if not ud then return false end
    if isBuilding(ud) then return false end

    if not hasBuildOptions(ud) then
        return false
    end

    if ud.canmove==false then
        return false
    end

    return true
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

local function multBuildDistance(ud,mult)
    if not ud then return end

    local base=
        ud.builddistance
        or ud.buildDistance
        or ud.buildrange
        or ud.buildRange

    if not base or type(base)~="number" then return end

    local boosted=roundValue(base*mult)

    ud.builddistance=boosted
    ud.buildDistance=boosted
    ud.buildrange=boosted
    ud.buildRange=boosted
end

local function multManeuverability(ud,turnMult,accelMult)
    if not ud then return end

    if ud.turnrate and type(ud.turnrate)=="number" then
        ud.turnrate=roundValue(ud.turnrate*turnMult)
    end

    if ud.turnRate and type(ud.turnRate)=="number" then
        ud.turnRate=roundValue(ud.turnRate*turnMult)
    end

    if ud.acceleration and type(ud.acceleration)=="number" then
        ud.acceleration=ud.acceleration*accelMult
    end

    if ud.maxacc and type(ud.maxacc)=="number" then
        ud.maxacc=ud.maxacc*accelMult
    end

    if ud.maxAcc and type(ud.maxAcc)=="number" then
        ud.maxAcc=ud.maxAcc*accelMult
    end

    if ud.brakerate and type(ud.brakerate)=="number" then
        ud.brakerate=ud.brakerate*accelMult
    end

    if ud.brakeRate and type(ud.brakeRate)=="number" then
        ud.brakeRate=ud.brakeRate*accelMult
    end
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

for name,ud in pairs(UnitDefs) do
    if not commanderUnits[name]
    and not boostedConstructors[name]
    and isMobileConstructorUnit(ud) then

        boostedConstructors[name]=true

        multCost(ud,CONSTRUCTOR_COST_MULT)
        multBuildtime(ud,CONSTRUCTOR_BUILDTIME_MULT)
        multSpeed(ud,CONSTRUCTOR_SPEED_MULT)
        multWorkerTime(ud,CONSTRUCTOR_BUILDPOWER_MULT)
        multBuildDistance(ud,CONSTRUCTOR_BUILDDISTANCE_MULT)
        multManeuverability(ud,CONSTRUCTOR_TURNRATE_MULT,CONSTRUCTOR_ACCEL_MULT)
        multSight(ud,CONSTRUCTOR_SIGHT_MULT)
    end
end

-- T3 Coms Constructor Boost by Bezz-- T3 Com Tweaks
local commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

local boostedEarlyInfra={}
local boostedScouts={}

------------------------------------------------
-- EARLY INFRA BALANCE
------------------------------------------------
-- T1:
-- - eco/factory buildtime x0.90
-- - storage cost/buildtime x0.80
-- - T1 factory buildpower x1.20
--
-- T2:
-- - eco/factory buildtime x0.95
-- - storage cost/buildtime x0.92
-- - T2 factory buildpower x1.10
--
-- Scouts:
-- - speed x1.30
------------------------------------------------

local T1_ECO_BUILDTIME_MULT=0.80
local T1_FACTORY_BUILDTIME_MULT=0.80
local T1_FACTORY_BUILDPOWER_MULT=1.35
local T1_STORAGE_COST_MULT=0.75
local T1_STORAGE_BUILDTIME_MULT=0.75

local T2_ECO_BUILDTIME_MULT=0.90
local T2_FACTORY_BUILDTIME_MULT=0.90
local T2_FACTORY_BUILDPOWER_MULT=1.20
local T2_STORAGE_COST_MULT=0.85
local T2_STORAGE_BUILDTIME_MULT=0.85

local SCOUT_SPEED_MULT=1.30
local SCOUT_SIGHT_MULT=2

local T1_RADAR_BUILDTIME_MULT=0.80
local T1_RADAR_RANGE_MULT=1.25

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

    ------------------------------------------------
    -- Fallback bez nazw:
    -- używamy kosztu/buildtime tylko do rozróżnienia early infra.
    ------------------------------------------------

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
-- remove previous chaos buffs by forcing sane values
            if wd.projectiles and wd.projectiles>1 then
                wd.projectiles=1
            end

            if wd.burst and wd.burst>1 then
                wd.burst=1
            end

            if wd.burstrate then
                wd.burstrate=0.1
            end
        end
    end
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]

if com and boss then

    ------------------------------------------------
    -- SAVE ORIGINAL COMMANDER DEATH DATA
    ------------------------------------------------

    local originalExplodeAs=com.explodeas
    local originalSelfDestructAs=com.selfdestructas
    local originalCorpse=com.corpse
    local originalFeatureDefs=copyTable(com.featuredefs)

    ------------------------------------------------
    -- BECOME BOSS
    ------------------------------------------------

    for k,v in pairs(boss) do
        com[k]=copyTable(v)
    end

    ------------------------------------------------
    -- RESTORE COMMANDER IDENTITY
    ------------------------------------------------

    com.name=comName
    com.unitname=comName
    com.description="Experimental Combat Commander: "..bossName

    ------------------------------------------------
    -- ARMADA FIX:
    -- clean inherited boss/scav/epic params
    ------------------------------------------------

    com.customparams={}

    com.customparams.iscommander="1"

    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil
    com.customparams.level=nil

    com.customparams.scavenger=nil
    com.customparams.scav=nil
    com.customparams.epic=nil
    com.customparams.boss=nil
    com.customparams.superboss=nil

    com.customparams.veteran=nil
    com.customparams.veterancy=nil
    com.customparams.experience=nil
    com.customparams.xp=nil

    com.customparams.bonushealth=nil
    com.customparams.maxhealth=nil
    com.customparams.healthboost=nil
    com.customparams.healthmult=nil

    com.customparams.regen=nil
    com.customparams.regeneration=nil
    com.customparams.healthregen=nil
    com.customparams.autoheal=nil
    com.customparams.idleautoheal=nil

    ------------------------------------------------
    -- RESTORE ORIGINAL COMMANDER DEATH BEHAVIOR
    ------------------------------------------------

    com.explodeas=originalExplodeAs
    com.selfdestructas=originalSelfDestructAs
    com.corpse=originalCorpse
    com.featuredefs=originalFeatureDefs

    ------------------------------------------------
    -- NO BUILDING
    ------------------------------------------------

    com.builder=false
    com.buildoptions={}
    com.workertime=0

    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false

    ------------------------------------------------
    -- MOVEMENT
    ------------------------------------------------

    com.canmove=true
    com.canattack=true

    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    com.turnrate=math.max((boss.turnrate or 500)*8,3500)

    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5

    ------------------------------------------------
    -- COMMANDER WEAPON SETTINGS
    ------------------------------------------------

    setCommanderWeapons(com)

    ------------------------------------------------
    -- VISION / RADAR / SONAR
    ------------------------------------------------

    com.sightdistance=700
    com.radardistance=750
    com.sonardistance=0
    com.airsightdistance=700

    ------------------------------------------------
    -- HP
    ------------------------------------------------

    com.health=200000
    com.maxdamage=200000

    ------------------------------------------------
    -- ECO / COST
    ------------------------------------------------

    com.energymake=250
    com.metalmake=10

    com.metalcost=0
    com.energycost=0
    com.buildtime=1
endlocal comName="corcom"
local bossName="corkorg"
local speedMul=2.1

local function copyTable(t)
    if type(t)~="table" then return t end
    local n={}
    for k,v in pairs(t) do
        n[k]=copyTable(v)
    end
    return n
end

local function getWeaponName(w)
    if not w then return nil end
    local weaponName=w.def or w.weapondef or w.name
    if not weaponName then return nil end
    return string.lower(weaponName)
end

local function getWeaponDef(w)
    local weaponName=getWeaponName(w)
    if not weaponName then return nil,nil end
    return weaponName,WeaponDefs[weaponName]
end

local function setCommanderWeapons(unitDef)
    if not unitDef or not unitDef.weapons then return end

    for _,w in pairs(unitDef.weapons) do
        local _,wd=getWeaponDef(w)

        if wd then
            wd.range=600
            wd.reloadtime=1.4
            wd.reload=1.4

            if wd.projectiles and wd.projectiles>1 then
                wd.projectiles=1
            end

            if wd.burst and wd.burst>1 then
                wd.burst=1
            end

            if wd.burstrate then
                wd.burstrate=0.1
            end
        end
    end
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]

if com and boss then

    ------------------------------------------------
    -- SAVE ORIGINAL COMMANDER DEATH DATA
    ------------------------------------------------

    local originalExplodeAs=com.explodeas
    local originalSelfDestructAs=com.selfdestructas
    local originalCorpse=com.corpse
    local originalFeatureDefs=copyTable(com.featuredefs)

    ------------------------------------------------
    -- BECOME BOSS
    ------------------------------------------------

    for k,v in pairs(boss) do
        com[k]=copyTable(v)
    end

    ------------------------------------------------
    -- RESTORE COMMANDER IDENTITY
    ------------------------------------------------

    com.name=comName
    com.unitname=comName
    com.description="Experimental Combat Commander: "..bossName

    com.customparams=com.customparams or {}
    com.customparams.iscommander="1"

    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil

    ------------------------------------------------
    -- RESTORE ORIGINAL COMMANDER DEATH BEHAVIOR
    ------------------------------------------------

    com.explodeas=originalExplodeAs
    com.selfdestructas=originalSelfDestructAs
    com.corpse=originalCorpse
    com.featuredefs=originalFeatureDefs

    ------------------------------------------------
    -- NO BUILDING
    ------------------------------------------------

    com.builder=false
    com.buildoptions={}
    com.workertime=0

    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false

    ------------------------------------------------
    -- MOVEMENT
    ------------------------------------------------

    com.canmove=true
    com.canattack=true

    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    com.turnrate=math.max((boss.turnrate or 500)*8,3500)

    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5

    ------------------------------------------------
    -- COMMANDER WEAPON SETTINGS
    ------------------------------------------------

    setCommanderWeapons(com)

    ------------------------------------------------
    -- VISION / RADAR / SONAR
    ------------------------------------------------

    com.sightdistance=700
    com.radardistance=750
    com.sonardistance=0
    com.airsightdistance=700

    ------------------------------------------------
    -- HP
    ------------------------------------------------

    com.health=200000
    com.maxdamage=200000

    ------------------------------------------------
    -- ECO / COST
    ------------------------------------------------

    com.energymake=250
    com.metalmake=10

    com.metalcost=0
    com.energycost=0
    com.buildtime=1
endlocal comName="legcom"
local bossName="legeheatraymech"
local speedMul=2.1

local function copyTable(t)
    if type(t)~="table" then return t end
    local n={}
    for k,v in pairs(t) do
        n[k]=copyTable(v)
    end
    return n
end

local function getWeaponName(w)
    if not w then return nil end
    local weaponName=w.def or w.weapondef or w.name
    if not weaponName then return nil end
    return string.lower(weaponName)
end

local function getWeaponDef(w)
    local weaponName=getWeaponName(w)
    if not weaponName then return nil,nil end
    return weaponName,WeaponDefs[weaponName]
end

local function setCommanderWeapons(unitDef)
    if not unitDef or not unitDef.weapons then return end

    for _,w in pairs(unitDef.weapons) do
        local _,wd=getWeaponDef(w)

        if wd then
            wd.range=600
            wd.reloadtime=1.4
            wd.reload=1.4

            if wd.projectiles and wd.projectiles>1 then
                wd.projectiles=1
            end

            if wd.burst and wd.burst>1 then
                wd.burst=1
            end

            if wd.burstrate then
                wd.burstrate=0.1
            end
        end
    end
end

local com=UnitDefs[comName]
local boss=UnitDefs[bossName]

if com and boss then

    ------------------------------------------------
    -- SAVE ORIGINAL COMMANDER DEATH DATA
    ------------------------------------------------

    local originalExplodeAs=com.explodeas
    local originalSelfDestructAs=com.selfdestructas
    local originalCorpse=com.corpse
    local originalFeatureDefs=copyTable(com.featuredefs)

    ------------------------------------------------
    -- BECOME BOSS
    ------------------------------------------------

    for k,v in pairs(boss) do
        com[k]=copyTable(v)
    end

    ------------------------------------------------
    -- RESTORE COMMANDER IDENTITY
    ------------------------------------------------

    com.name=comName
    com.unitname=comName
    com.description="Experimental Combat Commander: "..bossName

    com.customparams=com.customparams or {}
    com.customparams.iscommander="1"

    com.customparams.commtype=nil
    com.customparams.dynamic_comm=nil
    com.customparams.commlevel=nil

    ------------------------------------------------
    -- RESTORE ORIGINAL COMMANDER DEATH BEHAVIOR
    ------------------------------------------------

    com.explodeas=originalExplodeAs
    com.selfdestructas=originalSelfDestructAs
    com.corpse=originalCorpse
    com.featuredefs=originalFeatureDefs

    ------------------------------------------------
    -- NO BUILDING
    ------------------------------------------------

    com.builder=false
    com.buildoptions={}
    com.workertime=0

    com.canrepair=false
    com.canreclaim=false
    com.canrestore=false
    com.cancapture=false
    com.canassist=false

    ------------------------------------------------
    -- MOVEMENT
    ------------------------------------------------

    com.canmove=true
    com.canattack=true

    com.maxvelocity=(boss.maxvelocity or 1)*speedMul
    com.speed=(boss.speed or boss.maxvelocity or 1)*speedMul
    com.acceleration=(boss.acceleration or 1)*3
    com.brakerate=(boss.brakerate or 1)*5
    com.turnrate=math.max((boss.turnrate or 500)*8,3500)

    com.maxacc=(boss.maxacc or boss.acceleration or 1)*3
    com.maxdec=(boss.maxdec or boss.brakerate or 1)*5

    ------------------------------------------------
    -- COMMANDER WEAPON SETTINGS
    ------------------------------------------------

    setCommanderWeapons(com)

    ------------------------------------------------
    -- VISION / RADAR / SONAR
    ------------------------------------------------

    com.sightdistance=700
    com.radardistance=750
    com.sonardistance=0
    com.airsightdistance=700

    ------------------------------------------------
    -- HP
    ------------------------------------------------

    com.health=200000
    com.maxdamage=200000

    ------------------------------------------------
    -- ECO / COST
    ------------------------------------------------

    com.energymake=250
    com.metalmake=10

    com.metalcost=0
    com.energycost=0
    com.buildtime=1
endlocal commanderUnits={
    armcom=true,
    corcom=true,
    legcom=true,
}

local bossUnits={
    armsptkt4=true,
    corkorg=true,
    legeheatraymech=true,
}

local buffedCombatWeapons={}
local buffedDefenseWeapons={}

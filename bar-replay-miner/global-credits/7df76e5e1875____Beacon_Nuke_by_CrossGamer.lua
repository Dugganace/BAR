--  Beacon Nuke by CrossGamer

local function makeSilo(beaconName, tier)
    if UnitDefs and UnitDefs[beaconName] and UnitDefs["armsilo"] then
        local armsilo_wdefs = UnitDefs["armsilo"].weapondefs
        local armsilo_weapons = UnitDefs["armsilo"].weapons
        
        local scav = UnitDefs[beaconName]
        scav.weapondefs = {}
        
        for wname, wdata in pairs(armsilo_wdefs) do
            scav.weapondefs[wname] = {}
            for k, v in pairs(wdata) do
                if type(v) == "table" then
                    scav.weapondefs[wname][k] = {}
                    for k2, v2 in pairs(v) do
                        scav.weapondefs[wname][k][k2] = v2
                    end
                else
                    scav.weapondefs[wname][k] = v
                end
            end
            
            -- Adjust stockpiletime based on tier
            if scav.weapondefs[wname].stockpiletime then
                if tier == 2 then
                    scav.weapondefs[wname].stockpiletime = math.floor(scav.weapondefs[wname].stockpiletime / 3)
                elseif tier == 3 then
                    scav.weapondefs[wname].stockpiletime = 30
                elseif tier == 4 then
                    scav.weapondefs[wname].stockpiletime = 10
                end
                -- Tier 1 remains unchanged (normal)
            end
        end
        
        scav.weapons = {}
        for i, wdata in pairs(armsilo_weapons) do
            scav.weapons[i] = {}
            for k, v in pairs(wdata) do
                scav.weapons[i][k] = v
            end
        end
        
        scav.canattack = true
    end
end

local function addMIRVToSilo(unitName, weaponName) 
    if UnitDefs[unitName] and UnitDefs[unitName].weapondefs and UnitDefs[unitName].weapondefs[weaponName] then 
        local wdefs = UnitDefs[unitName].weapondefs 
        local motherNuke = wdefs[weaponName] 
         
        local childNuke = {} 
        for k, v in pairs(motherNuke) do 
            if type(v) == "table" then 
                childNuke[k] = {} 
                for k2, v2 in pairs(v) do childNuke[k][k2] = v2 end 
            else 
                childNuke[k] = v 
            end 
        end 
         
        local childName = weaponName .. "_mirv_child" 
        childNuke.name = (childNuke.name or "Nuke") .. " (MIRV Child)" 
         
        if childNuke.customparams then 
            childNuke.customparams.speceffect = nil
            childNuke.customparams.cluster_def = nil
            childNuke.customparams.shield_aoe_penetration = nil 
        end 
        
        childNuke.weapontype = "Cannon"
        childNuke.range = 1500
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 6) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 6
        motherNuke.customparams.shield_aoe_penetration = nil
    end 
end

makeSilo("scavbeacon_t1", 1)
makeSilo("scavbeacon_t2", 2)
makeSilo("scavbeacon_t3", 3)
makeSilo("scavbeacon_t4", 4)
makeSilo("scavbeacon_t1_scav", 1)
makeSilo("scavbeacon_t2_scav", 2)
makeSilo("scavbeacon_t3_scav", 3)
makeSilo("scavbeacon_t4_scav", 4)

addMIRVToSilo("scavbeacon_t1", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4", "nuclear_missile")
addMIRVToSilo("scavbeacon_t1_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t2_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t3_scav", "nuclear_missile")
addMIRVToSilo("scavbeacon_t4_scav", "nuclear_missile")

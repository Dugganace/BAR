-- by CrossGamer ANTINUKE
for n, d in pairs(UnitDefs) do
    if d.weapondefs then
        for _, wDef in pairs(d.weapondefs) do
            if wDef.interceptor == 1 and wDef.weapontype == "StarburstLauncher" then
                wDef.model = "crblmssl.s3o"
                wDef.cegtag = "NUKETRAIL"
                wDef.texture1 = "null"
                wDef.texture2 = "railguntrail"
                wDef.texture3 = "null"
                wDef.smokesize = 35
                wDef.smoketime = 130
                wDef.explosiongenerator = "custom:newnukecor"
                wDef.soundstart = "nukelaunch"
                wDef.soundhit = "nukecor"
                
                wDef.weaponvelocity = 1600
                wDef.weaponacceleration = 100
                wDef.turnrate = 5500
                
                wDef.metalpershot = 300
                wDef.energypershot = 37500
                
                wDef.stockpiletime = 60 
                
                wDef.areaofeffect = 1000
                wDef.edgeeffectiveness = 0.3
                
                if not wDef.damage then
                    wDef.damage = {}
                end
                wDef.damage.default = 5500
                wDef.damage.commanders = 1200
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 100
            end
        end
    end
end-- by CrossGamer NUKE
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
        end 
        
        childNuke.weapontype = "Cannon"
        
        childNuke.range = 1400
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 6) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil 
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")

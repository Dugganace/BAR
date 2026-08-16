-- by CrossGamer -- Antigravity
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
        
        childNuke.range = 1500
         
        if childNuke.damage then 
            for k, v in pairs(childNuke.damage) do 
                childNuke.damage[k] = math.floor(v / 6) 
            end 
        end 
         
        wdefs[childName] = childNuke 
         
        motherNuke.customparams = motherNuke.customparams or {} 
        motherNuke.customparams.speceffect = nil -- Xóa split
        
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number =7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 

addMIRVToSilo("armsilo", "nuclear_missile")

addMIRVToSilo("legsilo", "legicbm")-- by CrossGamer AdvSAM AA Homing Nuke
if UnitDefs then local u1,u2=UnitDefs.armmercury,UnitDefs.corscreamer if u1 then u1.buildtime=150000 u1.metalcost=6500 u1.energycost=90000 end if u2 then u2.buildtime=150000 u2.metalcost=6500 u2.energycost=90000 end end if WeaponDefs then for _,n in ipairs({"armmercury_arm_advsam","corscreamer_cor_advsam"})do local w=WeaponDefs[n] if w then w.tracks=true w.turnrate=99000 w.trajectoryheight=0.55 w.reloadtime=20 w.areaofeffect=2000 w.craterareaofeffect=2000 w.explosiongenerator="custom:newnuke" w.soundhit="nukearm" w.soundstart="nukelaunch" w.customparams=w.customparams or{} w.customparams.nuclear=1 w.damage=w.damage or{} w.damage.default=15000 w.damage.vtol=15000 w.flighttime=10 end end end
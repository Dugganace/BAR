-- by CrossGamer NUKE
ocal function addMIRVToSilo(unitName, weaponName) 
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
        motherNuke.customparams.speceffect = nil
        motherNuke.customparams.cluster_def = childName 
        motherNuke.customparams.cluster_number = 7
    end 
end 
 
addMIRVToSilo("corsilo", "crblmssl") 
addMIRVToSilo("armsilo", "nuclear_missile")
addMIRVToSilo("legsilo", "legicbm")--BaRandom v29 by LoH
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.75;local c=7;local d=0.2;local e=0.5;local f=5;local g={0,0,0}local h={28,28,28}local i=0.034;local j=0.90;local k=0.98;local l=6;local m={armcom=true,corcom=true,legcom=true}local n={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75}local o={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50}local p={["Glass Cannon"]={{"Phantom",n,{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}}},["Sniper"]={{"Phantom",n,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}}},["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}},{"Siren",{},{impf=3.5,impb=1.0,dmg=0.7,aoe=1.15}}},["Watchtower"]={{"Phantom",o,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3
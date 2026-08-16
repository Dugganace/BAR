-- Chain lightning by CrossGamer
for n, d in pairs(UnitDefs) do 
    if d.weapondefs then
        for wName, wDef in pairs(d.weapondefs) do
            if wDef.weapontype ~= "Shield" then
                if not wDef.customparams then wDef.customparams = {} end
                if not wDef.customparams.spark_forkdamage then
                    wDef.customparams.spark_ceg = "genericshellexplosion-splash-lightning"
                    wDef.customparams.spark_forkdamage = "0.1"   
                    wDef.customparams.spark_maxunits = "8"       
                    wDef.customparams.spark_range = "120"        
                end
            end
        end
    end
end

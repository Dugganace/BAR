-- by CrossGamer -- Antinuke to ICBM Visuals
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
                wDef.energypershot = 14000
                wDef.stockpiletime = 50 
                wDef.areaofeffect = 1000
                wDef.impulsefactor = 0
                wDef.impulseboost = 0
                wDef.cratermult = 0
                
                if type(wDef.damage) == "table" then
                    for k, _ in pairs(wDef.damage) do
                        wDef.damage[k] = 0
                    end
                else
                    wDef.damage = { default = 0 }
                end
                
            elseif wDef.customparams and (wDef.customparams.nuclear == "1" or wDef.customparams.nuclear == 1) then
                wDef.stockpiletime = 90
            end
        end
    end
end
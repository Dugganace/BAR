-- 1. Create the new unit by copying the old one
    UnitDefs["legbastion_epic"] = table.copy(UnitDefs["legbastion"])
    local ud = UnitDefs["legbastion_epic"]

    -- 2. Give it a unique identity
    ud.unitname = "legbastion_epic"
    ud.name = "Epic Bastion"
    ud.description = "Super Heavy Defensive Structure"
    ud.objectname = "Units/legbastion.s3o"

    -- 3. Apply your custom stats
    ud.energycost = 174000
    ud.metalcost = 12600
    ud.buildtime = 95000
    ud.health = 30000
    ud.damagemodifier = 0.15
    ud.radardistance = 3600
    ud.sightdistance = 2340



    -- 5. Weapon Upgrades
    if ud.weapondefs and ud.weapondefs.t2heatray then
        local w = ud.weapondefs.t2heatray
        w.range = 2540
        w.areaofeffect = 240
        w.thickness = 13
        w.corethickness = 1
        w.laserflaresize = 18
        w.reloadtime = 1
        w.damage.default = 350
        w.energypershot = 1250
        w.beamtime = 0.3
        w.rgbcolor = "0.8 0.2 0"
        w.rgbcolor2 = "1 0.5 0"
    end

    -- 6. ADD TO BUILD MENU (Critical!)
    -- This adds the Epic Bastion to the T2 Construction Unit's menu
    -- You can replace 'corack' with the specific builder you use
    if UnitDefs["legack"] and UnitDefs["legack"].buildoptions then
        table.insert(UnitDefs["legack"].buildoptions, "legbastion_epic")
    end
end
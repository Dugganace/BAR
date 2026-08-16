-- by CrossGamer Portable shield
if UnitDefs then
    local arm_metal = 3000 * 1.2
    local arm_energy = 54000 * 1.2
    local arm_buildtime = 55000 * 1.2
    
    local cor_metal = 3200 * 1.2
    local cor_energy = 55000 * 1.2
    local cor_buildtime = 55000 * 1.2
    
    local leg_metal = 3200 * 1.2
    local leg_energy = 55000 * 1.2
    local leg_buildtime = 55000 * 1.2

    local powerregenenergy = 562.5 * 1.1

    local units_to_modify = {"armcroc", "corsala", "legamphtank"}
    for _, unitName in ipairs(units_to_modify) do
        local ud = UnitDefs[unitName]
        if ud then
            
            ud.name = "Mobile Shield"
            ud.description = "Mobile Plasma Deflector"
            
            if unitName == "armcroc" then
                ud.buildpic = "ARMGATE.DDS"
                ud.metalcost = arm_metal
                ud.energycost = arm_energy
                ud.buildtime = arm_buildtime
            elseif unitName == "corsala" then
                ud.buildpic = "CORGATE.DDS"
                ud.metalcost = cor_metal
                ud.energycost = cor_energy
                ud.buildtime = cor_buildtime
            elseif unitName == "legamphtank" then
                ud.buildpic = "LEGDEFLECTOR.DDS"
                ud.metalcost = leg_metal
                ud.energycost = leg_energy
                ud.buildtime = leg_buildtime
            end

            ud.canattack = false
            
            ud.customparams = ud.customparams or {}
            ud.customparams.shield_power = 6175
            ud.customparams.shield_radius = 550
            
            ud.weapons = {
                [1] = {
                    def = "REPULSOR",
                    onlytargetcategory = "NOTSUB",
                }
            }
            
            ud.weapondefs = ud.weapondefs or {}
            ud.weapondefs.repulsor = {
                avoidfeature = false,
                craterareaofeffect = 0,
                craterboost = 0,
                cratermult = 0,
                edgeeffectiveness = 0.15,
                name = "PlasmaRepulsor",
                soundhitwet = "sizzle",
                weapontype = "Shield",
                shield = {
                    alpha = 0.17,
                    armortype = "shields",
                    exterior = true,
                    energyupkeep = 0,
                    force = 2.5,
                    intercepttype = 1,
                    power = 6175,
                    powerregen = 130,
                    powerregenenergy = powerregenenergy,
                    radius = 550,
                    repulser = false,
                    smart = true,
                    startingpower = 2090,
                    visiblerepulse = true,
                    badcolor = {1, 0.2, 0.2, 0.2},
                    goodcolor = {0.2, 1, 0.2, 0.17},
                },
            }
        end
    end
end
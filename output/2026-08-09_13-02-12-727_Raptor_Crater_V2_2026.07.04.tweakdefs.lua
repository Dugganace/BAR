-- King of The Hill
local a = {}
function SET(b)
    a = table.copy(UnitDefs[b])
end
function ADD(c)
    UnitDefs[c] = a
end
function NAME(d)
    a.customparams.i18n_en_humanname = d
end
function DESC(d)
    a.customparams.i18n_en_tooltip = d
end

for unitName, unitDef in pairs(UnitDefs) do
	if not unitDef.movementclass then
		unitDef.customparams = unitDef.customparams or {}
		unitDef.customparams.armordef = "structures"
	end
end

SET("armguard")
NAME("Defensive Gauntlet")
DESC("Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.plasma.damage.shields = 1
a.weapondefs.plasma.damage.structures = 1
a.weapondefs.plasma_high.damage.shields = 1
a.weapondefs.plasma_high.damage.structures = 1
ADD("armguard")


SET("armamb")
NAME("Defensive Rattlesnake")
DESC("Cloakable Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.armamb_gun.damage.shields = 1
a.weapondefs.armamb_gun.damage.structures = 1
a.weapondefs.armamb_gun_high.damage.shields = 1
a.weapondefs.armamb_gun_high.damage.structures = 1
ADD("armamb")

SET("armemp")
NAME("Defensive Paralyzer")
DESC("EMP Missile Launcher that deals no damage to structures.")
a.weapondefs.armemp_weapon.damage.structures = 1
ADD("armemp")

SET("armanni")
NAME("Defensive Pulsar")
DESC("Tachyon Accelerator that deals no damage to structures.")
a.weapondefs.ata.damage.structures = 1
ADD("armanni")

SET("armannit3")
NAME("Defensive Epic Pulsar")
DESC("Overcharged Tachyon Accelerator that deals no damage to structures.")
a.weapondefs.ata.damage.structures = 1
ADD("armannit3")

SET("corpun")
NAME("Defensive Agitator")
DESC("Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.plasma.damage.structures = 1
a.weapondefs.plasma.damage.shields = 1
a.weapondefs.plasma_high.damage.shields = 1
a.weapondefs.plasma_high.damage.structures = 1
ADD("corpun")

SET("cortoast")
NAME("Defensive Persecutor")
DESC("Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.cortoast_gun.damage.structures = 1
a.weapondefs.cortoast_gun.damage.shields = 1
a.weapondefs.cortoast_gun_high.damage.shields = 1
a.weapondefs.cortoast_gun_high.damage.structures = 1
ADD("cortoast")

SET("cortron")
NAME("Defensive Catalyst")
DESC("Tactial Missile Launcher that deals no damage to structures.")
a.weapondefs.cortron_weapon.damage.structures = 1
ADD("cortron")

SET("cordoom")
NAME("Defensive Bulwark")
DESC("Energy Weapon that deals no damage to structures.")
a.weapondefs.atadr.damage.structures = 1
a.weapondefs.doomsday_green_laser.damage.structures = 1
a.weapondefs.doomsday_red_laser.damage.structures = 1
ADD("cordoom")


SET("cordoomt3")
NAME("Defensive Epic Bulwark")
DESC("Super Heavy Heatray Defense that deals no damage to structures.")
a.weapondefs.armagmheat.damage.structures = 1
a.weapondefs.armageddon_blue_laser.damage.structures = 1
a.weapondefs.armageddon_green_laser.damage.structures = 1
ADD("cordoomt3")

SET("legcluster")
NAME("Defensive Amputator")
DESC("Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.plasma.damage.structures = 1
a.weapondefs.plasma.damage.shields = 1
a.weapondefs.plasma_high.damage.structures = 1
a.weapondefs.plasma_high.damage.shields = 1
a.weapondefs.cluster_munition.damage.structures = 1
a.weapondefs.cluster_munition.damage.shields = 1
ADD("legcluster")

SET("legacluster")
NAME("Defensive Eviscerator")
DESC("Plasma Artillery that deals no damage to structures and shields.")
a.weapondefs.plasma.damage.structures = 1
a.weapondefs.plasma.damage.shields = 1
a.weapondefs.plasma_high.damage.structures = 1
a.weapondefs.plasma_high.damage.shields = 1
a.weapondefs.cluster_munition.damage.structures = 1
a.weapondefs.cluster_munition.damage.shields = 1
ADD("legacluster")

SET("legbastion")
NAME("Defensive Bastion")
DESC("Energy Weapon Defence that deals no damage to structures.")
a.weapondefs.t2heatray.damage.structures = 1
ADD("legbastion")

SET("legperdition")
NAME("Defensive Perdition")
DESC("Long Range Napalm Launcher that deals no damage to structures.")
a.weapondefs.napalmmissile.damage.structures = 1
ADD("legperdition")--T2 con turrent
for name, ud in pairs(UnitDefs) do
if name == "armaca" or name == "armack" or name == "armacv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "armnanotct2"
end
if name == "coraca" or name == "corack" or name == "coracv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "cornanotct2"
end
if name == "coravp" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "corvac"
end
if name == "legaca" or name == "legack" or name == "legacv" then
	local numB = #ud.buildoptions
	ud.buildoptions[numB + 1] = "legnanotct2"
end
if name == "armnanotct2" or name == "cornanotct2" or name == "legnanotct2" then
	ud.health = 1020
	ud.explodeas = "largeBuildingExplosionGeneric"
end
end


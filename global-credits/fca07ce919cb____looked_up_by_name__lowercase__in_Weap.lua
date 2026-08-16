-- looked up by name (lowercase) in WeaponDefNames
main.customparams.cluster_number = 6
main.metalpershot  = math.floor((tonumber(s.metalcost)  or 0) * 6 * 0.75)
main.energypershot = math.floor((tonumber(s.energycost) or 0) * 6 * 0.75)
local sub = {
areaofeffect = 16,
weapontype = "Cannon",
range = 400,                      -- controls how far the 6 scatter from impact
reloadtime = 1,
weaponvelocity = 300,
gravityaffected = "true",
mygravity = 0.22,
model = "armpw_anim_projectile.s3o",
explosiongenerator = "custom:botrailspawn",
cegtag = "arty-botrail",
noselfdamage = true,
craterareaofeffect = 0,
craterboost = 0,
cratermult = 0,
soundhit = "xplosml2",
customparams = {
spawns_name = spawnUnit,
spawns_surface = "LAND",
},
damage = { default = 10 },
}
b.weapondefs = { [mainKey] = main, [subKey] = sub }
b.weapons = { { badtargetcategory = "MOBILE", def = mainKey:upper(), onlytargetcategory = "SURFACE" } }
b.icontype = LAUNCHER
setName(b, humanName, tooltip)
UnitDefs[newName] = b
end
if UnitDefs[LAUNCHER] then
makeSimpleLauncher("corgruntlauncher", "corak", "Grunt Launcher", "Lobs a single Grunt at range")
makeSimpleLauncher("armpawnlauncher",  "armpw", "Pawn Launcher",  "Lobs a single Pawn at range")
makeMirvLauncher  ("corgruntmirv",     "corak", "Grunt MIRV Launcher", "Splits into 6 Grunts on impact")
makeMirvLauncher  ("armpawnmirv",      "armpw", "Pawn MIRV Launcher",  "Splits into 6 Pawns on impact")
addBuild("corck", "corgruntlauncher"); addBuild("corcv", "corgruntlauncher"); addBuild("corgruntstructor", "corgruntlauncher")
addBuild("corck", "corgruntmirv");     addBuild("corcv", "corgruntmirv");     addBuild("corgruntstructor", "corgruntmirv")
addBuild("armck", "armpawnlauncher");  addBuild("armcv", "armpawnlauncher");  addBuild("armpawnstructor", "armpawnlauncher")
addBuild("armck", "armpawnmirv");      addBuild("armcv", "armpawnmirv");      addBuild("armpawnstructor", "armpawnmirv")
end -- Aiur Lab
local copy = table.copy
local function setName(def, humanName, tooltip)
def.customparams = def.customparams or {}
def.customparams.i18n_en_humanname = humanName
def.customparams.i18n_en_tooltip   = tooltip
end
local function addBuild(builderName, unitName)
local bd = UnitDefs[builderName]
if bd and bd.buildoptions then
table.insert(bd.buildoptions, unitName)
end
end
local GRUNT  = { obj = "Units/corak.s3o",            pic = "CORAK.DDS"            }
local PAWN   = { obj = "Units/armpw.s3o",            pic = "ARMPW.DDS"            }
local EGRUNT = { obj = "Units/scavboss/CORAKT4.s3o", pic = "CORAKT4.DDS"          }
local EPAWN  = { obj = "Units/scavboss/armpwt4.s3o", pic = "scavengers/armpwt4.DDS" }
local GRUNT_PROJ = "Units/corak.s3o"
local PAWN_PROJ  = "armpw_anim_projectile.s3o"   -- the dedicated flying-pawn model
local function cloneAir(donorName, newName)
local u = copy(UnitDefs[donorName])
local wkey = newName .. "_w"
local wd
for _, v in pairs(u.weapondefs) do wd = v end  -- these donors each have ONE weapon
u.weapondefs = { [wkey] = wd }
for _, w in ipairs(u.weapons) do w.def = 
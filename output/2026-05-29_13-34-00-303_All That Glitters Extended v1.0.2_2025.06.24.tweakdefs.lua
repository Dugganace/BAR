
local bots={armaak=true,armack=true,armamph=true,armaser=true,armdecom=true,armfark=true,armfast=true,armfboy=true,armfido=true,armhack=true,armmark=true,armmav=true,armsack=true,armscab=true,armsnipe=true,armspid=true,armsptk=true,armspy=true,armvader=true,armzeus=true,armck=true,armflea=true,armham=true,armjeth=true,armpw=true,armrectr=true,armrock=true,armwar=true,corak=true,corck=true,corcrash=true,cornecro=true,corstorm=true,corthud=true,coraak=true,corack=true,coramph=true,corcan=true,cordecom=true,corfast=true,corhack=true,corhrk=true,cormando=true,cormort=true,corpyro=true,corroach=true,corsack=true,corsktl=true,corspec=true,corspy=true,corsumo=true,cortermite=true,corvoyr=true,legaabot=true,legbal=true,legcen=true,leggob=true,legkark=true,leglob=true,legrezbot=true,legadvaabot=true,legajamk=true,legamph=true,legaradk=true,legaspy=true,legbart=true,legdecom=true,leghrk=true,leginc=true,leginfestor=true,legshot=true,legsnapper=true,legsrail=true,legstr=true}local gunships={armkam=true,armbrawl=true,armblade=true,legstronghold=true,legmos=true,corbw=true,corape=true}local vehicles={legamphtank=true,legbar=true,leggat=true,leghades=true,leghelios=true,legmlv=true,legrail=true,legscout=true,legaheattank=true,legamcluster=true,legaskirmtank=true,legavjam=true,legavrad=true,legavroc=true,legfloat=true,leginf=true,legmed=true,legmrv=true,legvcarry=true,legvflak=true,armart=true,armbeaver=true,armcv=true,armfav=true,armflash=true,armjanus=true,armmlv=true,armpincer=true,armsam=true,armstump=true,armacv=true,armbull=true,armconsul=true,armcroc=true,armgremlin=true,armhacv=true,armjam=true,armlatnk=true,armmanni=true,armmart=true,armmerl=true,armsacv=true,armseer=true,armyork=true,corcv=true,corfav=true,corgarp=true,corgator=true,corlevlr=true,cormist=true,cormlv=true,cormuskrat=true,corraid=true,corwolv=true,coracv=true,corban=true,coreter=true,corgol=true,corhacv=true,corintr=true,cormabm=true,cormart=true,corparrow=true,corphantom=true,corprinter=true,correap=true,corsacv=true,corsala=true,corseal=true,corsent=true,corsiegebreaker=true,cortrem=true,corvac=true,corvacct=true,corvrad=true,corvroc=true}local function tolower(s)return s and string.lower(s)or s end for name,ud in pairs(UnitDefs)do if bots[name] then if ud.speed then ud.speed=ud.speed * 1.2 end if ud.maxacc then ud.maxacc=ud.maxacc * 1.2 end if ud.maxdec then ud.maxdec=ud.maxdec * 1.2 end elseif vehicles[name] then if ud.speed then ud.speed=ud.speed * 1.3 end if ud.maxacc then ud.maxacc=ud.maxacc * 1.3 end if ud.maxdec then ud.maxdec=ud.maxdec * 1.3 end elseif gunships[name] then if ud.health then ud.health=ud.health * 1.2 end if ud.nochasecategory and ud.nochasecategory:find("VTOL")then ud.nochasecategory=nil end if ud.weapondefs then for _,w in pairs(ud.weapondefs)do if w.damage and w.damage.default and w.damage.default > 0 then w.damage.vtol=w.damage.default * 1 end if w.range then w.range=w.range * 1.5 end end end if ud.weapons then for _,slot in ipairs(ud.weapons)do if slot.onlytargetcategory and slot.onlytargetcategory:find("SURFACE")then slot.onlytargetcategory=nil end if slot.badtargetcategory and slot.badtargetcategory:find("VTOL")then local nb=slot.badtargetcategory:gsub("VTOL",""):gsub("%s%s+"," "):gsub("^%s+",""):gsub("%s+$","")slot.badtargetcategory=(nb=="")and nil or nb end end end end if ud.canfly then if ud.speed then ud.speed=ud.speed * 2 end if ud.maxacc then ud.maxacc=ud.maxacc * 1.5 end if ud.maxdec then ud.maxdec=ud.maxdec * 1.5 end if ud.verticalspeed then ud.verticalspeed=ud.verticalspeed * 2 end if ud.sightdistance then ud.sightdistance=ud.sightdistance * 2.5 end if ud.airsightdistance then ud.airsightdistance=ud.airsightdistance * 2.5 end if ud.weapondefs then for _,w in pairs(ud.weapondefs)do if w.weaponvelocity then w.weaponvelocity=w.weaponvelocity * 1.5 end end end end if ud.weapondefs then for _,w in pairs(ud.weapondefs)do local wt=tolower(w.weapontype or w.type or "")if wt=="aircraftbomb" then if w.reloadtime then w.reloadtime=w.reloadtime * 0.5 end if w.sprayangle then w.sprayangle=math.floor(w.sprayangle * 0.333 + 0.5)end if w.burst and w.burst > 1 and w.burstrate then w.burstrate=w.burstrate * 0.5 end end end end if name=="armthund" and ud.weapondefs then for _,w in pairs(ud.weapondefs)do if w.range then w.range=w.range * 0.6 end end end if name=="legstronghold" and ud.weapondefs then for _,w in pairs(ud.weapondefs)do if w.reloadtime then w.reloadtime=w.reloadtime * 0.10 end if w.projectiles ~=nil then w.projectiles=3 end if w.range then w.range=800 end if w.name=="Medium Shotgun" then w.damage.default=10 w.damage.vtol=10 end end end end-- LavaT3pack Djarshi v4.11 Modified
local races = {"arm", "cor", "leg"}
local a, b, c, d, e, f, g =
    UnitDefs or {},
    {"arm", "cor", "leg"},
    table.merge,
    {arm = "Armada ", cor = "Cortex ", leg = "Legion "},
    "_taxed",
    1.5,
    table.contains

local function h(i, j, k)
    if a[i] and not a[j] then
        a[j] = c(a[i], k)
    end
end

local function addC(conName, newUnit)
    if
        UnitDefs[conName] and UnitDefs[conName].buildoptions and
            not table.contains(UnitDefs[conName].buildoptions, newUnit)
     then
        table.insert(UnitDefs[conName].buildoptions, newUnit)
    end
end

local function addUnitToBO(newUnit, ...)
    local rest = {...}
    for i, v in ipairs(rest) do
        addC(v, newUnit)
    end
end

local function mergeToNew(u, newU, obj)
    if UnitDefs[u] and not UnitDefs[newU] then
        UnitDefs[newU] = table.merge(UnitDefs[u], obj)
    end
    return UnitDefs[newU]
end

local ym =
    "h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
UnitDefs["armageo"].yardmap = ym
UnitDefs["corageo"].yardmap = ym
UnitDefs["armuwageo"].yardmap = ym
UnitDefs["coruwageo"].yardmap = ym
if (UnitDefs["legageo"]) then
    UnitDefs["legageo"].yardmap = ym
end

for l, m in pairs(b) do
    local n, o, p = m == "arm", m == "cor", m == "leg"
    h(
        m .. "nanotct2",
        m .. "nanotct3",
        {
            icontype = "armrespawn",
            metalcost = 3360,
            energycost = 51200,
            builddistance = 625,
            buildtime = 88000,
            collisionvolumescales = "61 128 61",
            footprintx = 6,
            footprintz = 6,
            health = 8800,
            mass = 37200,
            sightdistance = 625,
            workertime = 3000,
            canrepeat = true,
            objectname = p and "Units/legnanotcbase.s3o" or o and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",
            customparams = {
                i18n_en_humanname = "Epic Construction Turret",
                i18n_en_tooltip = "Even more build power!"
            }
        }
    )
    h(
        m .. "ageo",
        m .. "ageot3",
        {
            icontype = "armageo",
            buildtime = 88000,
            collisionvolumeoffsets = "0 0 0",
            collisionvolumescales = "61 128 61",
            energycost = 270000,
            energymake = 12500,
            energystorage = 120000,
            footprintx = 7,
            footprintz = 7,
            health = 7120,
            idleautoheal = 33,
            idletime = 1800,
            maxacc = 0,
            maxdec = 0,
            maxslope = 15,
            maxwaterdepth = 5,
            metalcost = 16000,
            objectname = "Units/mission_command_tower.s3o",
            buildpic = "scavengers/mission_command_tower.dds",
            script = "mission_command_tower.cob",
            seismicsignature = 0,
            selfdestructas = "advgeo",
            -- extended from 'ym' of other geo's
            yardmap = "h oooooooooooooo oooooooooooooo oocbgybsyybcoo oobsbssbbssboo ooysbsbssbbgoo ooybsssbsssyoo oosbsbsssbsboo oobsbsssbsbsoo ooysssbsssbyoo oogbbssbsbsyoo oobssbbssbsboo oocbyysbygbcoo oooooooooooooo oooooooooooooo",
            sightdistance = 345,
            customparams = {
                i18n_en_humanname = "Epic Geothermal Powerplant",
                i18n_en_tooltip = "Produces 10x T2 Geothermal + has plasma deflector. (tweaked by Djarshi & txpera)",
                shield_color_mult = 0.99,
                shield_power = 3250,
                shield_radius = 750
            },
            weapondefs = {
                repulsor = {
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
                        energyupkeep = 0,
                        force = 2.5,
                        intercepttype = 1,
                        power = 6700,
                        powerregen = 69,
                        powerregenenergy = 562.5,
                        radius = 750,
                        repulser = true,
                        smart = true,
                        startingpower = 1100,
                        visiblerepulse = true,
                        badcolor = {
                            [1] = 1,
                            [2] = 0.2,
                            [3] = 0.2,
                            [4] = 0.2
                        },
                        goodcolor = {
                            [1] = 0.2,
                            [2] = 1,
                            [3] = 0.2,
                            [4] = 0.17
                        }
                    }
                }
            },
            weapons = {
                [1] = {
                    def = "REPULSOR",
                    onlytargetcategory = "NOTSUB"
                }
            }
        }
    )

    for l, q in pairs({m .. "nanotc", m .. "nanotct2"}) do
        if a[q] then
            a[q].canrepeat = true
        end
    end

    local AFU = m .. "afust3"
    if a[AFU] then
        a[AFU].explodeas = "customfusionexplo"
        a[AFU].selfdestructas = "advancedFusionExplosionSelfd"
    end
end

local newAfus =
    mergeToNew(
    "lootboxplatinum",
    "afuslegendary",
    {
        icontype = "lootboxplatinum",
        buildpic = "other/resourcecheat.dds",
        buildtime = 120000,
        metalmake = 0,
        footprintx = 4,
        footprintz = 4,
        yardmap = "yooy oooo oooo yooy",
        explodeas = "ScavComBossExplo",
        reclaimable = true,
        customparams = {
            i18n_en_humanname = "Legendary Fusion Reactor",
            i18n_en_tooltip = "Makes 50x of AFUS, Transportable, Unique (Very Hazardous)",
            shield_color_mult = 0.99,
            shield_power = 56000,
            shield_radius = 1250,
            fall_damage_multiplier = 15
        },
        weapondefs = {
            repulsor = {
                avoidfeature = false,
                craterareaofeffect = 0,
                craterboost = 0,
                cratermult = 0,
                edgeeffectiveness = 0.15,
                name = "PlasmaRepulsor",
                soundhitwet = "sizzle",
                weapontype = "Shield",
                shield = {
                    alpha = 0.25,
                    armortype = "shields",
                    energyupkeep = 0,
                    force = 2.5,
                    intercepttype = 1,
                    power = 56000,
                    powerregen = 1300,
                    powerregenenergy = 100000,
                    radius = 1250,
                    repulser = true,
                    smart = true,
                    startingpower = 1,
                    visiblerepulse = true,
                    badcolor = {
                        [1] = 1,
                        [2] = 0.1,
                        [3] = 0.1,
                        [4] = 0.1
                    },
                    goodcolor = {
                        [1] = 0.1,
                        [2] = 1,
                        [3] = 0.1,
                        [4] = 0.1
                    }
                }
            }
        },
        weapons = {
            [1] = {
                def = "REPULSOR",
                onlytargetcategory = "NOTSUB"
            }
        }
    }
)

local normAfus = UnitDefs["armafus"]
if (normAfus) then
    newAfus.metalcost = normAfus.metalcost * 30
    newAfus.energycost = normAfus.energycost * 30
    newAfus.energymake = normAfus.energymake * 50
    newAfus.energystorage = normAfus.energystorage * 50
    newAfus.health = normAfus.health * 10
    newAfus.maxthisunit = 1
end

addUnitToBO("afuslegendary", "armack", "armaca", "armacv")
addUnitToBO("afuslegendary", "corack", "coraca", "coracv")
addUnitToBO("afuslegendary", "legack", "legaca", "legacv")

-- t3mex
local newT3Mex =
    mergeToNew(
    "armmoho",
    "t3mmex",
    {
        icontype = "armmoho",
        health = 6200,
        metalstorage = 2000,
        buildpic = "scavengers/scavsafeareabeacon.DDS",
        buildtime = 30000,
        reclaimable = true,
        objectname = "scavs/scavsafeareabeacon.s3o",
        script = "Units/ARMEYES.cob",
        energycost = 24300,
        metalcost = 1920,
        energyupkeep = 500,
        explodeas = "geo",
        extractsmetal = 0.016,
        onoffable = true,
        yardmap = "h oooooooo osssssso osssssso ossoosso ossoosso osssssso osssssso oooooooo",
        customparams = {
            i18n_en_humanname = "Epic Metal Extractor",
            i18n_en_tooltip = "Metal Extraction / Storage (upkeep 500 energy/s)"
        }
    }
)

addUnitToBO("t3mmex", "armack", "armaca", "armacv")
addUnitToBO("t3mmex", "corack", "coraca", "coracv")
addUnitToBO("t3mmex", "legack", "legaca", "legacv")

-- converter size fix
for l, m in pairs({"armmmkrt3", "cormmkrt3", "legadveconvt3"}) do
    if (UnitDefs[m]) then
        UnitDefs[m] = table.merge(UnitDefs[m], {footprintx = 6, footprintz = 6})
    end
end

UnitDefs["corjugg"].metalcost = UnitDefs["corjugg"].metalcost * 2.5
UnitDefs["legeheatraymech"].metalcost = UnitDefs["legeheatraymech"].metalcost * 1.5
if (UnitDefs["legeheatraymech_old"]) then
    UnitDefs["legeheatraymech_old"].metalcost = UnitDefs["legeheatraymech_old"].metalcost * 1.5
end

UnitDefs["armbotrail"].health = 0
UnitDefs["armbotrail"].maxthisunit = 0

addUnitToBO("armnanotct3", "armack", "armaca", "armacv")
addUnitToBO("armageot3", "armack", "armaca", "armacv")
addUnitToBO("cornanotct3", "corack", "coraca", "coracv")
addUnitToBO("corageot3", "corack", "coraca", "coracv")
addUnitToBO("legnanotct3", "legack", "legaca", "legacv")
addUnitToBO("legageot3", "legack", "legaca", "legacv")

--Omni Commanders Mini
local UnitDefs = UnitDefs or {}

-- Extra Build Options (Omni Faction Commanders)
local extraBuildOptions = {
	armcom = {
		"corlab","corvp","corsy","corhp","corap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	corcom = {
		"armlab","armvp","armsy","armhp","armap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	legcom = {
		"armlab","armvp","armsy","armhp","armap",
		"corlab","corvp","corsy","corhp","corap",
		"armfhp","corfhp","legfhp",
	},
}

local level2Units = {
	armcom = {"corexp", "legmext15"},
	corcom = {"armamex", "legmext15"},
	legcom = {"armamex", "corexp"},
}

local level5Units = {
	armcom = {"cormexp", "legmohocon", "corbhmth", "legrampart"},
	corcom = {"armshockwave", "legmohocon", "legrampart"},
	legcom = {"armshockwave", "cormexp", "corbhmth"},
}

for baseName, extras in pairs(extraBuildOptions) do
	for lvl = 0, 10 do
		local unitName = lvl == 0 and baseName or (baseName .. "lvl" .. lvl)
		local uDef = UnitDefs[unitName]
		if uDef and uDef.buildoptions then
			for _, option in ipairs(extras) do
				table.insert(uDef.buildoptions, option)
			end

			if lvl >= 2 and lvl <= 4 and level2Units[baseName] then
				for _, option in ipairs(level2Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end

			if lvl >= 5 and level5Units[baseName] then
				for _, option in ipairs(level5Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end
		end
	end
end
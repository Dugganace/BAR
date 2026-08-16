-- LavaT3pack Djarshi v4.11
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

UnitDefs["armvulc"].metalcost = UnitDefs["armvulc"].metalcost * 10
UnitDefs["corbuzz"].metalcost = UnitDefs["corbuzz"].metalcost * 10
UnitDefs["legstarfall"].metalcost = UnitDefs["legstarfall"].metalcost * 10

UnitDefs["armsy"].health = 0
UnitDefs["armsy"].maxthisunit = 0
UnitDefs["armasy"].health = 0
UnitDefs["armasy"].maxthisunit = 0
UnitDefs["corsy"].health = 0
UnitDefs["corsy"].maxthisunit = 0
UnitDefs["corasy"].maxthisunit = 0
UnitDefs["corasy"].maxthisunit = 0
UnitDefs["legsy"].health = 0
UnitDefs["legsy"].maxthisunit = 0
UnitDefs["legasy"].health = 0
UnitDefs["legasy"].maxthisunit = 0

--Random Rarities by LordOfHangovers vdev
rename_list={}local a={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}local b=0.7;local c=7;local d=0.10;local e=0.33;local f=7;local g={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=75}local h={cancloak=true,cloakcost=5,cloakcostmoving=15,mincloakdistance=50}local i={["Glass Cannon"]={{"Phantom",g,{hp=0.85}},{"Volatile",{},{dmg=1.3,hp=0.6}},{"Overcharged",{},{rld=0.8,energypershot=1.5}}},["Tank"]={{"Juggernaut",{},{hp=1.6,spd=0.7,turnrate=0.75}},{"Regenerator",{},{autoheal=3.0}},{"Fortified",{},{hp=1.3,rld=1.2}}},["Sniper"]={{"Phantom",g,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}},{"Piercing",{},{dmg=1.2,aoe=0.5}}},["Brawler"]={{"Swift",{},{spd=1.4,hp=0.7,maxacc=1.3}},{"Berserker",{},{dmg=1.2,aoe=1.3,acc=1.4}},{"Siege",{},{aoe=1.4,dmg=1.15,spd=0.85}}},["Fortress"]={{"Juggernaut",{},{hp=1.6}},{"Shielded",{},{shield_power=1.4,shield_radius=1.2}}},["Watchtower"]={{"Phantom",h,{hp=0.9}},{"Marksman",{},{rng=1.3,acc=0.7,aoe=0.7}}},["Suppressor"]={{"Siege",{},{aoe=1.4,dmg=1.15,acc=1.3}},{"Berserker",{},{dmg=1.3,aoe=1.3}}}}local function j(k)local k=k or 0;if k+1<=#a and math.random()<b then k=j(k+1)end;return k end;local function l(m)local n=j(m)if n<m then n=m end;return n end;local function o(k,p,n,q,r)local q=q or false;local s=0;local r=r or 1;if k then s=k*p^n+(p-1)*k;if q then s=math.floor(s)end;return s*r else return nil end end;local t={{"Glass Cannon",0.88,1.05,1.12,1.05,0.91,1.05,0.96},{"Tank",1.22,1.0,1.01,1.04,0.97,1.04,0.97},{"Sniper",1.03,1.04,1.07,1.14,0.98,0.95,0.91},{"Brawler",1.06,1.10,1.05,1.0,0.88,1.10,0.97}}local u={{"Fortress",1.20,1.0,1.08,1.04,0.97,1.04,0.97},{"Watchtower",1.03,1.0,1.05,1.14,0.98,0.95,0.91},{"Suppressor",1.06,1.0,1.04,1.0,0.88,1.12,0.97}}local v={{"armthund","armkam"},{"armpw","armrock","armham","armwar","armflea"},{"armmlv","armfav","armflash","armpincer","armstump","armart","armjanus"},{"armdecade","armpt","armpship","armroy","armsub"},{"armsh","armanac","armmh"},{"armsaber","armsb","armseap"},{"armbrawl","armpnix","armlance","armdfly","armblade","armstil","armliche"},{"armfast","armamph","armzeus","armmav","armsptk","armfido","armsnipe","armfboy","armspid","armvader","armscab"},{"armcroc","armlatnk","armbull","armgremlin","armmart","armmerl","armmanni"},{"armcrus","armsubk","armserp","armantiship","armbats","armmship","armepoch","armlship"},{"armpincer","armcroc"},{"armbanth","armraz","armmar","armvang","armlun","armthor"},{"corshad","corbw"},{"corak","corstorm","corthud"},{"cormlv","corfav","corgator","corgarp","corraid","corlevlr","corwolv"},{"coresupp","corpt","corpship","corroy","corsub"},{"corsh","corsnap","cormh","corhal"},{"corcut","corsb","corseap"},{"corape","corhurc","cortitan","corcrwh"},{"corpyro","coramph","corcan","corsumo","cortermite","cormort","corhrk","corroach","corsktl","cormando"},{"corsala","correap","corparrow","corgol","corban","cormart","corvroc","cortrem"},{"corcrus","corshark","corssub","corantiship","corbats","cormship","corblackhy","corfship"},{"corgarp","corsala","corparrow"},{"corkorg","corkarg","corjugg","corshiva","corcat","corsok","cordemon"},{"legkam","legcib","legmos"},{"leggob","leglob","legcen","legbal","legkark"},{"legscout","leghades","leghelios","leggat","legbar","legmlv","legamphtank"},{"legnavyscout","legnavyfrigate","legnavydestro","legnavysub","legnavyartyship"},{"legsh","legner","legmh","legcar"},{"legspsurfacegunship","legspcarrier","legspbomber","legsptorpgunship"},{"legstronghold","legmineb","legatorpbomber","legfort","legphoenix"},{"legstr","legamph","legshot","leginc","legsrail","legbart","leginfestor","leghrk","legsnapper"},{"legmrv","legaskirmtank","legfloat","legaheattank","legmed","legamcluster","legvcarry","legavroc","leginf"},{"leganavycruiser","leganavyheavysub","leganavybattlesub","leganavybattleship","leganavyartyship","leganavymissileship","leganavyflagship","leganavyantiswarm"},{"legamphtank","legfloat","legamph"},{"legeheatraymech","legeallterrainmech","legjav","legelrpcmech","legehovertank","legerailtank","legeshotgunmech","legkeres"}}local w={}local x={}for y,z in ipairs(v)do local A={}for y,B in ipairs(z)do if not x[B]then A[#A+1]=B end end;if#A==0 then A=z end;local C=A[math.random(#A)]local n=l(c)w[C]=n;x[C]=true end;local D={}for E,F in pairs(UnitDefs)do if not w[E]then local G=F.weapondefs and F.builder~=true;if G and math.random()<d then local H=j()if H<1 then H=1 end;D[E]=H;w[E]=0 else w[E]=j()end end end;local I={}for E,F in pairs(UnitDefs)do local n=w[E]or 0;if n>=5 and F.weapondefs then if F.speed then I[E]=t[math.random(#t)]elseif F.builder~=true then I[E]=u[math.random(#u)]end end end;local J={}for E,F in pairs(UnitDefs)do local n=w[E]or 0;local K=I[E]if n>=f and K then local L=i[K[1]]if L and math.random()<e then J[E]=L[math.random(#L)]end end end;for E,F in pairs(UnitDefs)do local M=w[E]or 0;local N=F.metalcost and"metalcost"or"buildcostmetal"local O=F.energycost and"energycost"or"buildcostenergy"local P=F.health and"health"or"maxdamage"if not F.power then F.power=F[N]+F[O]/60 end;local Q=M;if not(M<=#a)then M=#a end;if not(M<=6)and(E=="armcom"or E=="corcom"or E=="legcom")then M=6 end;local H=D[E]if H then if F.customparams then F.customparams.cursed=tostring(H)end;F[P]=o(F[P],0.93,H,true)F.speed=o(F.speed,0.97,H,true)F.maxacc=o(F.maxacc,0.97,H)F.turnrate=o(F.turnrate,0.97,H)F.sightdistance=o(F.sightdistance,0.97,H)F.radardistance=o(F.radardistance,0.97,H)F[N]=o(F[N],0.85,H,true)F[O]=o(F[O],0.85,H,true)F.buildtime=o(F.buildtime,0.88,H)if F.weapondefs then for R,S in pairs(F.weapondefs)do if S.interceptor~=1 and S.targetable~=1 then S.range=o(S.range,0.97,H,true)S.reloadtime=o(S.reloadtime,1.04,H)if S.damage then for T,U in pairs(S.damage)do S.damage[T]=o(S.damage[T],0.94,H)end end end end end;if E then table.insert(rename_list,{E,"prefix","[Cursed Mk."..H.."]"})table.insert(rename_list,{E,"desc_prefix","Cursed Mk."..H.." "})end elseif Q>0 then if F.customparams then F.customparams.rarity=tostring(M)end;local K=I[E]local V=K and K[2]or 1.1;local W=K and K[3]or 1.05;local X=K and K[4]or 1.05;local Y=K and K[5]or 1.05;local Z=K and K[6]or 0.95;local _=K and K[7]or 1.05;local a0=K and K[8]or 0.97;F.power=o(F.power,1.2,M)F.speed=o(F.speed,W,M,true)F.maxacc=o(F.maxacc,1.05,M)F.maxdec=o(F.maxdec,1.05,M)F.turnrate=o(F.turnrate,1.05,M)F.sightdistance=o(F.sightdistance,1.05,M)F.radardistance=o(F.radardistance,1.1,M)F[P]=o(F[P],V,M,true)F.idleautoheal=o(F.idleautoheal,1.1,M)F.energymake=o(F.energymake,1.04,M)F.extractsmetal=o(F.extractsmetal,1.1,M)F.energyupkeep=o(F.energyupkeep,1.04,M)F.tidalgenerator=o(F.tidalgenerator,1.04,M)F.windgenerator=o(F.windgenerator,1.04,M)if F.windgenerator and not F.customparams.energymultiplier then F[N]=o(F[N],0.97,M,true)end;if F.tidalgenerator or F.windgenerator or F.builder==true or not F.speed and not F.weapondefs then F[N]=o(F[N],0.97,M,true)F[O]=o(F[O],0.98,M,true)F.buildtime=o(F.buildtime,0.98,M)F.workertime=o(F.workertime,1.05,M,true)F.builddistance=o(F.builddistance,1.05,M,true)else F[N]=o(F[N],1.035,M,true)F[O]=o(F[O],1.04,M,true)F.buildtime=o(F.buildtime,1.05,M)F.workertime=o(F.workertime,1.05,M,true)F.builddistance=o(F.builddistance,1.05,M,true)end;if F.customparams then F.customparams.energyconv_efficiency=o(F.customparams.energyconv_efficiency,1.04,M)F.customparams.energyconv_capacity=o(F.customparams.energyconv_capacity,1.04,M,true)F.customparams.shield_power=o(F.customparams.shield_power,1.1,M,true)F.customparams.shield_radius=o(F.customparams.shield_radius,1.05,M,true)F.customparams.energymultiplier=o(F.customparams.energymultiplier,1.04,M,true)end;if F.weapondefs then for R,S in pairs(F.weapondefs)do if S.interceptor==1 or S.targetable==1 then S.coverage=o(S.coverage,1.02,M,true)S.damage.default=o(S.damage.default,1.1,M)S.areaofeffect=o(S.areaofeffect,1.01,M)else if not S.reloadtime or S.reloadtime<0.034 then S.reloadtime=0.034 end;if S.burstrate and S.burstrate<0.034 then S.burstrate=0.034 end;if S.burst and S.burstrate then if S.burst*S.burstrate>S.reloadtime then S.reloadtime=S.burst*S.burstrate end end;if S.beamtime then if S.beamtime>S.reloadtime then S.reloadtime=S.beamtime end end;local a1=false;if S.burstrate and S.burst and S.reloadtime then local a2=S.burstrate*S.burst;local a3=a2/S.reloadtime;if a3>=0.98 or a2>=S.reloadtime then a1=true end end;local a4=false;if S.beamtime and S.reloadtime then if S.beamtime/S.reloadtime>=0.90 or S.beamtime>=S.reloadtime then a4=true end end;S.reloadtime=o(S.reloadtime,Z,M)S.burstrate=o(S.burstrate,Z,M)S.areaofeffect=o(S.areaofeffect,_,M)S.weaponvelocity=o(S.weaponvelocity,1.06,M)S.range=o(S.range,Y,M,true)S.sprayangle=o(S.sprayangle,a0,M)S.accuracy=o(S.accuracy,a0,M)if S.customparams then S.customparams.overrange_distance=o(S.customparams.overrange_distance,Y,M,true)S.customparams.controlradius=o(S.customparams.controlradius,Y,M,true)S.customparams.engagementrange=o(S.customparams.engagementrange,Y,M,true)end;if S.damage then local a5=1;local a6=0;local a7=S.reloadtime or 1;local a8=S.beamtime or 0;local a9=S.burstrate or 1;local aa=S.burst or 1;if a7<0.034 then a5=a5+0.034/a7-1;S.reloadtime=0.034;a7=0.034 end;local ab=S.customparams and S.customparams.sweepfire;if ab or E=="armbeamer"then S.reloadtime=S.reloadtime or a7;a7=S.reloadtime end;if a8>a7 then a5=a5+a8/a7-1;S.reloadtime=a8;a7=a8 end;if a9<0.034 then a5=a5+0.034/a9-1;S.burstrate=0.034;a9=0.034 end;local a2=a9*aa;if S.burstrate and S.burst and a2>a7 then a5=a5+a2/a7-1;S.reloadtime=a2 end;for T,U in pairs(S.damage)do if U=="commanders"then S.damage[T]=o(S.damage[T],1.02+a6,M,false,a5)else S.damage[T]=o(S.damage[T],X+a6,M,false,a5)end end end;if S.shield then S.shield.power=o(S.shield.power,1.1,M,true)S.shield.powerregen=o(S.shield.powerregen,1.1,M,true)S.shield.radius=o(S.shield.radius,1.05,M,true)S.shield.force=o(S.shield.force,1.05,M)S.shield.powerregenenergy=o(S.shield.powerregenenergy,0.99,M,true)end;if a1==true then S.reloadtime=S.burst*S.burstrate end;if a4==true then S.reloadtime=S.beamtime end end end end;local ac=J[E]if ac then for T,U in pairs(ac[2])do F[T]=U end;local ad=ac[3]if ad.hp then F[P]=math.floor(F[P]*ad.hp)end;if ad.spd and F.speed then F.speed=math.floor(F.speed*ad.spd)end;if ad.turnrate and F.turnrate then F.turnrate=F.turnrate*ad.turnrate end;if ad.maxacc and F.maxacc then F.maxacc=F.maxacc*ad.maxacc end;if ad.autoheal and F.idleautoheal then F.idleautoheal=F.idleautoheal*ad.autoheal end;if ad.shield_power and F.customparams and F.customparams.shield_power then F.customparams.shield_power=math.floor(F.customparams.shield_power*ad.shield_power)end;if ad.shield_radius and F.customparams and F.customparams.shield_radius then F.customparams.shield_radius=math.floor(F.customparams.shield_radius*ad.shield_radius)end;if F.weapondefs then for ae,af in pairs(F.weapondefs)do if af.interceptor~=1 and af.targetable~=1 then if ad.aoe and af.areaofeffect then af.areaofeffect=math.floor(af.areaofeffect*ad.aoe)end;if ad.rng and af.range then af.range=math.floor(af.range*ad.rng)end;if ad.rld and af.reloadtime then af.reloadtime=af.reloadtime*ad.rld end;if ad.energypershot and af.energypershot then af.energypershot=af.energypershot*ad.energypershot end;if ad.acc then if af.sprayangle then af.sprayangle=af.sprayangle*ad.acc end;if af.accuracy then af.accuracy=af.accuracy*ad.acc end end;if ad.dmg and af.damage then for T,U in pairs(af.damage)do af.damage[T]=U*ad.dmg end end end end end end;if E then local ag=K and" "..K[1]or""local ah=ac and" "..ac[1]or""table.insert(rename_list,{E,"prefix","["..a[M]..ah..ag.."]"})table.insert(rename_list,{E,"desc_prefix","Mk."..M.."   "})end else if E then table.insert(rename_list,{E,"prefix","[Common]"})table.insert(rename_list,{E,"desc_prefix","Mk."..M.." "})end end end;Spring.Echo("tweakdefs_rename_get_ready")for ai,aj in pairs(rename_list)do Spring.Echo("/("..aj[1].."/-"..aj[2].."/-"..aj[3].."/)")end;Spring.Echo("tweakdefs_rename_end")
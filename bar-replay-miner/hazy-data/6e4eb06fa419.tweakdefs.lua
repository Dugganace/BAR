--LavaPack lite crdhq.com
local UD=UnitDefs or {}
local function addBO(lab,u) if UD[lab] and UD[lab].buildoptions and UD[u] then local h=false for _,b in ipairs(UD[lab].buildoptions) do if b==u then h=true break end end if not h then table.insert(UD[lab].buildoptions,u) end end end
local function addAll(u,...) for _,l in ipairs({...}) do addBO(l,u) end end
local function clone(s,t,o) if UD[s] and not UD[t] then UD[t]=table.merge(UD[s],o) end return UD[t] end
local y="h cbbybjyybc bjbjjbbjjb yjbjbjjbbb ybjjjbjjjy jbjbjjjbjb bjbjjjbjbj yjjjbjjjby bbbjjbjbjy bjjbbjjbjb cbyyjbybbc"
if UD["armageo"] then UD["armageo"].yardmap=y end
if UD["corageo"] then UD["corageo"].yardmap=y end
if UD["armuwageo"] then UD["armuwageo"].yardmap=y end
if UD["coruwageo"] then UD["coruwageo"].yardmap=y end
if UD["legageo"] then UD["legageo"].yardmap=y end
for _,f in ipairs({"arm","cor","leg"}) do
local isLeg,isCor=f=="leg",f=="cor"
clone(f.."nanotct2",f.."nanotct3",{icontype="armrespawn",metalcost=3360,energycost=51200,buildtime=88000,buildistance=625,collisionvolumescales="61 128 61",footprintx=6,footprintz=6,health=8800,mass=37200,sightdistance=625,workertime=3000,reclaimspeed=2000,canrepeat=true,objectname=isLeg and "Units/legnanotcbase.s3o" or isCor and "Units/CORRESPAWN.s3o" or "Units/ARMRESPAWN.s3o",customparams={i18n_en_humanname="Epic Construction Turret",i18n_en_tooltip="Even more build power!"}})
clone(f.."ageo",f.."ageot3",{icontype="armageo",buildtime=88000,collisionvolumeoffsets="0 0 0",collisionvolumescales="61 128 61",energycost=270000,energymake=12500,energystorage=120000,footprintx=7,footprintz=7,health=7120,idleautoheal=33,idletime=1800,maxacc=0,maxdec=0,maxslope=15,maxwaterdepth=5,metalcost=16000,objectname="Units/mission_command_tower.s3o",buildpic="scavengers/mission_command_tower.dds",script="mission_command_tower.cob",seismicsignature=0,selfdestructas="advgeo",yardmap="h  oooooooooooooo  oooooooooooooo  oocbgybsyybcoo  oobsbssbbssboo  ooysbsbssbbgoo  ooybsssbsssyoo  oosbsbssssbsboo  oobsbssbsbsboo  ooyssssbsssbyoo  oogbbssbsbsyoo  oobssbbssbsboo  oocbyysbygbcoo  oooooooooooooo  oooooooooooooo",sightdistance=345,customparams={i18n_en_humanname="Epic Geothermal Powerplant",i18n_en_tooltip="Produces 10x T2 Geothermal + has plasma deflector.",shield_color_mult=0.99,shield_power=3250,shield_radius=750},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.17,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=6700,powerregen=69,powerregenenergy=562.5,radius=750,repulser=true,smart=true,startingpower=1100,visiblerepulse=true,badcolor={1,0.2,0.2,0.2},goodcolor={0.2,1,0.2,0.17}}}},weapons={{def="REPULSOR",onlytargetcategory="NOTSUB"}}})
end
local F=clone("lootboxplatinum","afuslegendary",{icontype="lootboxplatinum",buildpic="other/resourcecheat.dds",buildtime=120000,metalmake=0,footprintx=4,footprintz=4,yardmap="yooy oooo oooo yooy",explodeas="ScavComBossExplo",reclaimable=true,customparams={i18n_en_humanname="Legendary Fusion Reactor",i18n_en_tooltip="Makes 50x of AFUS, Transportable, Unique (Very Hazardous)",shield_color_mult=0.99,shield_power=56000,shield_radius=1250,fall_damage_multiplier=15},weapondefs={repulsor={avoidfeature=false,craterareaofeffect=0,craterboost=0,cratermult=0,edgeeffectiveness=0.15,name="PlasmaRepulsor",soundhitwet="sizzle",weapontype="Shield",shield={alpha=0.25,armortype="shields",energyupkeep=0,force=2.5,intercepttype=1,power=56000,powerregen=1300,powerregenenergy=100000,radius=1250,repulser=true,smart=true,startingpower=1,visiblerepulse=true,badcolor={1,0.1,0.1,0.1},goodcolor={0.1,1,0.1,0.1}}}},weapons={{def="REPULSOR",onlytargetcategory="NOTSUB"}}})
local A=UD["armafus"]
if A and F then F.metalcost=A.metalcost*30 F.energycost=A.energycost*30 F.energymake=A.energymake*50 F.energystorage=A.energystorage*50 F.health=A.health*10 F.maxthisunit=1 end
clone("armmoho","t3mmex",{icontype="armmoho",health=6200,metalstorage=2000,buildpic="scavengers/scavsafeareabeacon.DDS",buildtime=30000,reclaimable=true,objectname="scavs/scavsafeareabeacon.s3o",script="Units/ARMEYES.cob",energycost=24300,metalcost=1920,energyupkeep=500,explodeas="geo",extractsmetal=0.016,onoffable=true,yardmap="h  oooooooo  osssssso  osssssso  ossoosso  ossoosso  osssssso  osssssso  oooooooo",customparams={i18n_en_humanname="Epic Metal Extractor",i18n_en_tooltip="Metal Extraction / Storage (upkeep 500 energy/s)"}})
addAll("afuslegendary","armack","armaca","armacv")
addAll("afuslegendary","corack","coraca","coracv")
addAll("afuslegendary","legack","legaca","legacv")
addAll("t3mmex","armack","armaca","armacv")
addAll("t3mmex","corack","coraca","coracv")
addAll("t3mmex","legack","legaca","legacv")
addAll("armnanotct3","armack","armaca","armacv")
addAll("armageot3","armack","armaca","armacv")
addAll("cornanotct3","corack","coraca","coracv")
addAll("corageot3","corack","coraca","coracv")
addAll("legnanotct3","legack","legaca","legacv")
addAll("legageot3","legack","legaca","legacv")
for _,n in ipairs({"armmmkrt3","cormmkrt3","legadvecont3"}) do if UD[n] then UD[n]=table.merge(UD[n],{footprintx=6,footprintz=6}) end end
-- Player Raptors [SS1]
-- Credits to Skrip for starting the mod with Raptor Buildings v1! Check them out here: https://discord.com/channels/549281623154229250/1365417045147258971
local function a(b, c)
    local d = c.customparams or {}
    local e = b
    local f, f, g = string.find(b, "_v(%d+)")
    if g then
        g = tonumber(g) or 0
    end
    e = e:gsub("_v(%d+)", "")
    local f, f, h = string.find(b, "_t(%d+)")
    if h then
        h = tonumber(h)
    end
    local i = e:gsub("_t(%d+)", "")
    local j = string.find(b, "_queen") or string.find(b, "_matriarch") or b == "raptorh5"
    if j then
        h = 5
    end
    if string.find(b, "_hive") then
        h = 3
    end
    if h then
        d.techlevel = h
    end
    local k
    if c.yardmap or c.speed == 0.0 then
        k = c.yardmap or ""
    end
    if k then
        d.unitgroup = "weapon"
    end
    local l = string.find(b, "_heal") or b == "raptorh5"
    if l then
        d.unitgroup = "builder"
    end
    local m = {aName = e, gName = i, v = g, isRoyal = j, isT = k, isH = l}
    d.raptorbuildmeta = m
    c.customparams = d
    return m
end
local function n(o)
    local p = type(o)
    local q
    if p == "table" then
        q = {}
        for r, s in next, o, nil do
            q[n(r)] = n(s)
        end
        setmetatable(q, n(getmetatable(o)))
    else
        q = o
    end
    return q
end
local function t(u, v)
    UnitDefs[u] = v
    v.unitname = u
    v.maxthisunit = nil
    v.buildoptions = {}
    local w = v.customparams or {}
    w.subfolder = "other/raptors"
    v.customparams = w
    return w
end
local function x(b, u, v)
    v.icontype = b
    local w = t(u, v)
    w.i18nfromunit = b
    return w
end
local function y(z, A)
    return "custchickenunit_t" .. z .. "_" .. string.lower(A)
end
local function B(A, C)
    return A .. " Raptor " .. C
end
local D, E, F = {}, {"Infant", "Juvenile", "Young"}, {0.1, 0.25, 0.5}
for b, c in pairs(UnitDefs) do
    if c.category == "RAPTOR" and not string.find(b, "custraptorunit") then
        local C = a(b, c)
        D[b] = c
    end
end
Spring.Echo("Raptor Buildings Metadata Complete")
local G = {"Juvenile", "Common", "Mature", "Apex", "Royal"}
local function H(A, z)
    return "Produces " .. A .. " Raptors (T" .. z .. ")"
end
local function I(J, K, L)
    local M = {}
    for z, b in ipairs(L) do
        local N = G[z]
        local A = y(z, J)
        local O = n(UnitDefs[b])
        local P = x(b, A, O)
        O.icontype = "raptor_hive"
        P.i18nfromunit = nil
        P.i18n_en_humanname = B(N, J)
        P.i18n_en_tooltip = H(N .. " " .. K, z)
        P.normalmaps = true
        P.normaltex = "unittextures/chicken_l_normals.png"
        P.techlevel = z
        P.areadamageresistance = "_RAPTORACID_"
        local Q = {aName = A, gName = A:gsub("_t(%d+)", ""), v = 1, isRoyal = z == 5, isT = true, isH = true}
        P.raptorbuildmeta = Q
        M[z] = O
    end
    return M
end
local R = I("Hatchery", "Land", {"leglab", "leghp", "legalab", "leggant", "leggant"})[5]
R.energycost = R.energycost * 5
R.metalcost = R.metalcost * 5
R.buildtime = R.buildtime * 5
R.health = R.health * 2.5
I("Nest", "Air", {"legap", "legaap", "legaap", "legapt3"})
local function S(z, b)
    local A = y(z, b)
    if UnitDefs[A] then
        return
    end
    b = "leg" .. b
    local O = n(UnitDefs[b])
    local P = x(b, A, O)
    P.normalmaps = true
    P.normaltex = "unittextures/chicken_l_normals.png"
    P.areadamageresistance = "_RAPTORACID_"
    local Q = {aName = A, gName = A:gsub("_t(%d+)", ""), v = 1, isT = true, isH = false}
    P.raptorbuildmeta = Q
end
local T = {
    {"solar", "win", "econv", "mex"},
    {"advsol", "win", "econv", "mex", "mext15"},
    {"advsol", "wint2", "adveconv", "moho"},
    {"advsol", "wint2", "adveconv", "fus", "afus", "moho", "mohocon"},
    {"advsol", "wint2", "fus", "afus", "moho", "mohocon", "afust3", "adveconvt3"}
}
for z, U in ipairs(T) do
    for V, b in ipairs(U) do
        S(z, b)
    end
end
local W, X, Y = {}, {}, {}
for Z, _ in pairs(D) do
    local a0, a1 = Z:gsub("raptor", "custraptorunit"), n(_)
    local P = x(Z, a0, a1)
    local z, C = P.techlevel or 0, P.raptorbuildmeta
    C.uName = a0
    local a2, a3 = C.isT, C.isH
    if a3 and G[z] then
        a1.canreclaim = 1
        a1.workertime = math.min(a1.health, 500 * math.max(z, 1))
        a1.reclaimspeed = a1.workertime
        if z == 5 and string.find(a0, "_matriarch") then
            a3, C.isH = nil, nil
        else
            P.i18nfromunit, P.i18n_en_humanname, P.i18n_en_tooltip =
                nil,
                G[z] .. " Constructor Raptor",
                "Tech " .. z .. " Constructor"
        end
    end
    local a4
    if a1.canfly then
        X[z] = X[z] or {}
        a4 = X[z]
        a1.customparams.armordef = "vtol"
    else
        W[z] = W[z] or {}
        a4 = W[z]
    end
    local V = a4[C.gName]
    if (not V or (V.v or 0) < (C.v or 0)) and not (a3 and a2) then
        a4[C.gName] = C
        if a3 and not a2 then
            Y[C.aName] = a1
        end
    end
    if a2 then
        a1.maxSlope = a1.maxSlope or 255
    end
    local a5 = string.find(a0, "_queen")
    if a5 then
        local a6 = string.sub(a0, a5 + 7):gsub("very", "very ")
        P.i18nfromunit = nil
        P.i18n_en_humanname = "[" .. a6 .. "] Raptor Queen"
        P.i18n_en_tooltip = "The Mother of ALL " .. string.upper(a6) .. " RAPTORS!"
    end
    if type(a1.weapondefs) == "table" then
        for a7, a8 in pairs(a1.weapondefs) do
            if string.find(a0, "_air_bomber_basic") then
                a8.reloadtime = 6
            end
            if a7 == "spawnmeteor" then
                a8.damage = {default = 1}
            end
            if type(a8.explosiongenerator) == "string" and string.find(a8.explosiongenerator, "acid-explosion", 1, true) then
                local a9, aa = 1.5, a8.customparams
                if not aa then
                    aa = {}
                    a8.customparams = aa
                end
                if string.find(a8.explosiongenerator, "small") then
                    a9 = 1
                end
                if string.find(a8.explosiongenerator, "xl") then
                    a9 = 2
                end
                if aa.area_onhit_damageCeg then
                    aa.area_onhit_damageceg = aa.area_onhit_damageCeg
                end
                if not aa.area_onhit_damageceg then
                    aa.area_onhit_damageceg = "acid-damage-gen"
                end
                if not aa.area_onhit_ceg then
                    aa.area_onhit_ceg = "acid-area-" .. a9 * 75 .. "-repeat"
                end
                if not aa.area_onhit_time then
                    aa.area_onhit_time = 10
                end
                if not aa.area_onhit_damage then
                    aa.area_onhit_damage = 20 * (z + 1)
                end
                if not aa.area_onhit_range then
                    aa.area_onhit_range = a9 * 75
                end
                if not aa.area_onhit_resistance then
                    aa.area_onhit_resistance = "_RAPTORACID_"
                end
            end
        end
    end
end
Spring.Echo("Raptor Buildings Copying Complete")
local ab, ac, ad = {}, {}, {}
for z, N in ipairs(G) do
    local ae, af, ag = {}, {}, {}
    for i, C in pairs(W[z]) do
        if not C.isT then
            ae[C.uName] = Y[C.aName]
            table.insert(ag, C.uName)
            ab[i] = C.uName
        else
            ad[i] = C.uName
        end
    end
    if z == 5 then
        for i, C in pairs(W[0] or {}) do
            if not C.isT then
                ae[C.uName] = Y[C.aName]
                table.insert(ag, C.uName)
                ab[i] = C.uName
            elseif not C.isStart then
                ad[i] = C.uName
            end
        end
    end
    for i, C in pairs(X[z] or {}) do
        ae[C.uName] = Y[C.aName]
        ac[i] = C.uName
    end
    if z == 4 then
        for i, C in pairs(X[0] or {}) do
            ae[C.uName] = Y[C.aName]
            ac[i] = C.uName
        end
    end
    for i, a0 in pairs(ac) do
        table.insert(af, a0)
    end
    local ah, ai = y(z, "hatchery"), y(z, "nest")
    local aj, ak = UnitDefs[ah], UnitDefs[ai] or {}
    aj.buildoptions, ak.buildoptions = ag, af
    local al, am = {ah, ai}, G[z + 1]
    Spring.Echo("buildorderdebug thb", z, al)
    if z == 1 then
        for f, an in ipairs(al) do
            for f, ao in ipairs({"armcom", "corcom", "legcom"}) do
                table.insert((UnitDefs[ao] or {}).buildoptions or {}, an)
                for ap = 2, 10 do
                    table.insert((UnitDefs[ao .. "lvl" .. ap] or {}).buildoptions or {}, an)
                end
            end
        end
    elseif z == 5 then
        table.insert(al, y(z - 1, "hatchery"))
        table.insert(al, y(z - 1, "nest"))
    end
    if am then
        table.insert(al, y(z + 1, "hatchery"))
    end
    for i, a0 in pairs(ad) do
        table.insert(al, a0)
    end
    for f, aq in ipairs(T[z]) do
        table.insert(al, y(z, aq))
    end
    for a0, a1 in pairs(ae) do
        a1.buildoptions = al
    end
end
Spring.Echo("Raptor Buildings BuildOptions Complete")

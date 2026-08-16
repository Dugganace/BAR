-- T3 Coms Early Infrastructure + Scout Boost by Bezz-- T3 Com Tweaks2
do
    local privatePairs={
        {"armck","armckx"},
        {"armcv","armcvx"},
        {"armca","armcax"},
        {"corck","corckx"},
        {"corcv","corcvx"},
        {"corca","corcax"},
        {"legck","legckx"},
        {"legcv","legcvx"},
        {"legca","legcax"},
    }

    local function syncAlias(dst,src,lowerName,camelName)
        local v=src[lowerName]
        if v==nil and camelName then
            v=src[camelName]
        end

        if v~=nil then
            dst[lowerName]=v
            if camelName then
                dst[camelName]=v
            end
        end
    end

    local function forceBuildablePrivate(ud)
        if not ud then return end

        ud.maxthisunit=nil
        ud.maxThisUnit=nil
        ud.notbuildable=nil
        ud.notBuildable=nil
        ud.hidden=nil
        ud.hide=nil

        ud.customparams=ud.customparams or {}
        ud.customparams.hidden=nil
        ud.customparams.no_build=nil
        ud.customparams.notbuildable=nil
        ud.customparams.ai_ignore=nil
        ud.customparams.barbarian_ignore=nil

        ud.customparams.t3barb_private_constructor="1"
        ud.customparams.t3barb_private_tier="1"
        ud.customparams.t3barb="T3"
    end

    for _,p in ipairs(privatePairs) do
        local stockName=p[1]
        local privateName=p[2]
        local stock=UnitDefs[stockName]
        local private=UnitDefs[privateName]

        if stock and private then
            forceBuildablePrivate(private)

            local hp=stock.health or stock.maxdamage or stock.maxDamage
            if hp~=nil then
                private.health=hp
                private.maxdamage=hp
                private.maxDamage=hp
            end

            syncAlias(private,stock,"metalcost","metalCost")
            syncAlias(private,stock,"energycost","energyCost")
            syncAlias(private,stock,"buildtime","buildTime")
            syncAlias(private,stock,"workertime","workerTime")
            syncAlias(private,stock,"buildspeed","buildSpeed")
            syncAlias(private,stock,"buildpower","buildPower")
            syncAlias(private,stock,"builddistance","buildDistance")
            syncAlias(private,stock,"buildrange","buildRange")
            syncAlias(private,stock,"speed",nil)
            syncAlias(private,stock,"maxvelocity","maxVelocity")
            syncAlias(private,stock,"sightdistance","sightDistance")
            syncAlias(private,stock,"losradius","losRadius")
        end
    end
end

do
local pairsIconFix={
  armck="armckx",armcv="armcvx",armca="armcax",
  corck="corckx",corcv="corcvx",corca="corcax",cormuskrat="cormuskratx",
  legck="legckx",legcv="legcvx",legca="legcax",
}
for stockName,privateName in pairs(pairsIconFix) do
  local s=UnitDefs[stockName]
  local p=UnitDefs[privateName]
  if s and p then
    p.buildpic=s.buildpic
    p.buildPic=s.buildPic
    p.icontype=s.icontype or s.iconType or s.icon
    p.iconType=s.iconType or s.icontype or s.icon
    p.icon=s.icon
  end
end
end

do
local extraPrivateT1Fix={
  cormuskrat="cormuskratx",
}
for stockName,privateName in pairs(extraPrivateT1Fix) do
  local s=UnitDefs[stockName]
  local p=UnitDefs[privateName]
  if s and p then
    p.buildpic=s.buildpic
    p.buildPic=s.buildPic
    p.icontype=s.icontype or s.iconType or s.icon
    p.iconType=s.iconType or s.icontype or s.icon
    p.icon=s.icon
    p.customparams=p.customparams or{}
    p.customparams.t3barb_private_constructor="1"
    p.customparams.t3barb_private_tier="1"
    p.customparams.t3barb="T3"
    p.customparams.unitgroup=s.customparams and (s.customparams.unitgroup or s.customparams.unitGroup or s.customparams.unit_group) or p.customparams.unitgroup
  end
end
end

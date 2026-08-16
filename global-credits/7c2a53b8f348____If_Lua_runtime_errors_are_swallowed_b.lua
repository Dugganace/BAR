-- If Lua runtime errors are swallowed by loader, modify critical UnitDefs instead.
    for _,n in ipairs({
        "armcom","corcom","legcom",
        "armlab","armvp","armap","armalab","armavp","armaap",
        "corlab","corvp","corap","coralab","coravp","coraap",
        "leglab","legvp","legap","legalab","legavp","legaap"
    }) do
        breakUnit(n)
    end

    -- Also poison stock/private T1 constructors if any exist.
    for _,p in ipairs(P) do
        breakUnit(p[1])
        breakUnit(p[2])
    end

    -- Keep a visible global-ish marker in UnitDefs for log/debug inspection.
    if U.armcom then
        U.armcom.customparams=U.armcom.customparams or {}
        U.armcom.customparams.t3barb_guard_reason=tostring(reason)
    end
end

local missingReason=nil

for _,p in ipairs(P) do
    local stockName=p[1]
    local privateName=p[2]
    local private=U[privateName]

    if not private then
        missingReason="missing private constructor created by tweak5: "..privateName
        break
    end

    local privateCP=private.customparams or {}

    if privateCP.t3barb_private_constructor~="1" then
        missingReason=privateName.." missing t3barb_private_constructor marker from tweak5"
        break
    end

    if privateCP.t3barb_private_tier~="1" then
        missingReason=privateName.." missing t3barb_private_tier marker from tweak5"
        break
    end

    if privateCP.t3barb_tweak5_required_by_tweak9~=REQUIRED_TWEAK5_MARKER then
        missingReason=privateName.." missing exact tweak5 marker required by tweak9"
        break
    end

    local stock=U[stockName]
    if not stock then
        missingReason="missing stock constructor: "..stockName
        break
    end

    local stockCP=stock.customparams or {}
    if stockCP.t3barb_stock_constructor_trap~="1" then
        missingReason=stockName.." missing stock trap marker from tweak5"
        break
    end

    if stock.maxthisunit~=0 and stock.maxThisUnit~=0 then
        missingReason=stockName.." is not blocked by tweak5"
        break
    end

    for unitName,ud in pairs(U) do
        if type(ud)=="table" and type(ud.buildoptions)=="table" and hasBuildOption(unitName,stockName) then
            missingReason=unitName.." still has forbidden stock T1 constructor buildoption: "..stockName
            break
        end
    end

    if missingReason then break end
end

if missingReason then
    breakSetup(missingReason)
end
end

do local U=UnitDefs or{}local C={armcom=1,corcom=1,legcom=1}local LA,LO="legapt3_tweak5","legapt3"local M={"armshockwave","cormexp","legmohocon"}local G={"armgmm","corbhmth","legrampart"}local A={"armt4airaide","cort4airaide","legt4airaide","armthundt4","armlichet4","corcrwt4","legfortt4","legmost3"}local F={arm={fu="armafust3",cv="armmmkrt3",mx="armshockwave",geo="armgmm",ap="armapt3",bs={"armack","armaca","armacv"}},cor={fu="corafust3",cv="cormmkrt3",mx="cormexp",geo="corbhmth",ap="corapt3",bs={"corack","coraca","coracv"}},leg={fu="legafust3",cv="legadveconvt3",mx="legmohocon",geo="legrampart",ap=LA,bs={"legack","le
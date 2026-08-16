-- base build list shared by Epic Aides
    local buildPool = {}
    local baseList = {
      o .. "afust3",
      o .. "nanotct2",
      o .. "nanotct3",
      o .. "alab",
      o .. "avp",
      o .. "aap",
      "gatet3",
      "flak",
      isLeg and "legadveconvt3" or o .. "mmkrt3",
      isLeg and "legamstort3" or o .. "uwadvmst3",
      isLeg and "legadvestoret3" or o .. "advestoret3",
      isLeg and "legdeflector" or o .. "gate",
      isLeg and "legforti" or o .. "fort",
      isArm and "armshltx" or o .. "gant",
      -- faction T3 walls + T3 shields so Epic Aides can build them
      (isArm and "armfirewall" or isCor and "cortyrant" or "legparagon"),
      (isArm and "armgatet3" or isCor and "corgatet3" or "leggatet3")
    }

    for _, x in ipairs(baseList) do
      buildPool[#buildPool + 1] = x
    end

    -- cross-faction taxed experimental gantries
    local cross = {
      arm = { "corgant", "leggant" },
      cor = { "armshltx", "leggant" },
      leg = { "armshltx", "corgant" }
    }
    for _, z in ipairs(cross[o] or {}) do
      buildPool[#buildPool + 1] = z .. TAX_SUFFIX
    end

    -- extra toys: per-faction heavies + your requested additions
    local extras = {
      arm = {
        "armamd", "armmercury", "armbrtha", "armminivulc", "armvulc",
        "armanni", "armannit3", "armlwall",
        "armshockwave", "armafust3", "legendary_pulsar", "armflak"
      },
      cor = {
        "corfmd", "corscreamer", "cordoomt3", "corbuzz", "corminibuzz",
        "corint", "cordoom", "corhllllt", "cormwall",
        "cormexp", "corafust3", "legendary_bulwark", "corflak"
      },
      leg = {
        "legabm", "legstarfall", "legministarfall", "leglraa",
        "legbastion", "legrwall", "leglrpc",
        "legmohocon", "legafust3", "legendary_bastion", "legflak"
      }
    }

    for _, x in ipairs(extras[o] or {}) do
      buildPool[#buildPool + 1] = x
    end

    -- Epic ground aide
    local aideGround = o .. "t3aide"
    clone(
      o .. "decom",
      aideGround,
      {
        blocking = true,
        builddistance = 350,
        buildtime = 140000,
        energycost = 200000,
        energyupkeep = 2000,
        health = 10000,
        idleautoheal = 50,
        idletime = 1,
        maxthisunit = 10,
        metalcost = 10000,
        speed = 85,
        terraformspeed = 3000,
        turninplaceanglelimit = 1.890,
        turnrate = 1240,
        workertime = 6000,
        reclaimable = true,
        candgun = false,
        name = FNAMES[o] .. "Epic Aide",
        customparams = {
          subfolder = "ArmBots/T3",
          techlevel = 3,
          unitgroup = "buildert3",
          i18n_en_humanname = "Epic Ground Construction Aide",
          i18n_en_tooltip = "Your Aide that helps you construct buildings"
        },
        buildoptions = buildPool
      }
    )
    U[aideGround].weapondefs = {}
    U[aideGround].weapons = {}

    -- Epic air aide
    local aideAir = o .. "t3airaide"
    clone(
      "armfify",
      aideAir,
      {
        blocking = false,
        canassist = true,
        cruisealtitude = 1000,
        builddistance = 1750,
        buildtime = 140000,
        energycost = 200000,
        energyupkeep = 2000,
        health = 10000,
        idleautoheal = 50,
        idletime = 1,
        maxthisunit = 1,
        metalcost = 10000,
        speed = 300,
        terraformspeed = 30000,
        turninplaceanglelimit = 1.890,
        turnrate = 240,
        workertime = 1600,
        buildpic = "ARMFIFY.DDS",
        name = FNAMES[o] .. "Epic Aide",
        customparams = {
          subfolder = "ArmBots/T3",
          techlevel = 3,
          unitgroup = "buildert3",
          i18n_en_humanname = "T3 PvP Epic Air Construction Aide",
          i18n_en_tooltip = "Your Aide that helps you construct buildings"
        },
        buildoptions = buildPool
      }
    )
    U[aideAir].weapondefs = {}
    U[aideAir].weapons = {}

    -- inject ground Epic Aide into each faction's T3 botlab/gantry
    local baseFactory = isArm and "armshltx" or isCor and "corgant" or "leggant"
    if U[baseFactory] and U[baseFactory].buildoptions then
      local id = o .. "t3aide"
      if not has(U[baseFactory].buildoptions, id) then
        table.insert(U[baseFactory].buildoptions, id)
      end
    end

    -- inject air Epic Aide into each faction's T3 airlab
    local apt3 = o .. "apt3"
    if U[apt3] and U[apt3].buildoptions then
      local id = o .. "t3airaide"
      if not has(U[apt3].buildoptions, id) then
        table.insert(U[apt3].buildoptions, id)
      end
    end
  end
end

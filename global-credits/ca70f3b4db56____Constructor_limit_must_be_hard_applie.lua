-- Constructor limit must be hard-applied by exact UnitDef name.
  -- Do not use tier/builder heuristics here: T1 army cap works that way,
  -- but constructor cap was not reliably applied to all BAR constructor UnitDefs.
  local limitedConstructors={
    -- Private T1 X constructors
    "armckx","armcvx","armbeaverx","armcax",
    "corckx","corcvx","cormuskratx","corcax",
    "legckx","legcvx","legotterx","legcax",

    -- Mobile T2 constructors
    "armack","armacv","armaca","armacsub",
    "corack","coracv","coraca","coracsub",
    "legack","legacv","legaca","legspcon","leganavyconsub","leganavyengineer",
  }

  for _,unitName in ipairs(limitedConstructors) do
    local ud=UnitDefs[unitName]
    if ud and not isStockConstructorTrap(ud) then
      setUnitLimitMax(ud,CONSTRUCTOR_LIMIT)
      ud.customparams=ud.customparams or {}
      ud.customparams.maxthisunit=tostring(CONSTRUCTOR_LIMIT)
      ud.customparams.max_this_unit=tostring(CONSTRUCTOR_LIMIT)
      ud.customparams.t3barb_constructor_limit=tostring(CONSTRUCTOR_LIMIT)
    end
  end

  -- Cortex corvac hard block: remove from every build menu and make it unbuildable if UnitDef exists.
  local blocked="corvac"
  for _,ud in pairs(UnitDefs) do
    if type(ud)=="table" and type(ud.buildoptions)=="table" then
      for i=#ud.buildoptions,1,-1 do
        if ud.buildoptions[i]==blocked then
          table.remove(ud.buildoptions,i)
        end
      end
    end
  end
  local u=UnitDefs[blocked]
  if u then
    u.maxthisunit=0
    u.maxThisUnit=0
    u.notbuildable=true
    u.notBuildable=true
    u.hidden=true
    u.hide=true
    u.disabled=true
    u.nobuild=true
    u.noBuild=true
    u.customparams=u.customparams or {}
    u.customparams.ai_ignore="1"
    u.customparams.barbarian_ignore="1"
    u.customparams.hidden="1"
    u.customparams.no_build="1"
    u.customparams.notbuildable="1"
  end
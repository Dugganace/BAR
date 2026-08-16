-- Fly by CrossGamer
processed = {} 

    for n,d in pairs(UnitDefs) do
      local a=d.customparams and d.customparams.iscommander
      local b=d.canfly and not a
      if b then
        d.dontland=true
        if not d.customparams then d.customparams={} end
        d.customparams.fighter="1"
      elseif not d.canfly and d.health and d.health>0 and (tonumber(d.speed) or 0)>0 and not a then
        d.canfly=true
        d.cruisealtitude=150
        d.hoverattack=true
        d.upright=true
        d.turnrate=(tonumber(d.turnrate) or 500)*1.5
        d.acceleration=(tonumber(d.acceleration) or 0.1)*2
        d.floater=false
        d.waterline=0
        d.minwaterdepth=0
        d.dontland=true
        if not d.customparams then d.customparams={} end
        d.customparams.fighter="1"
      end
      local c={}
      if d.weapons then
        for _,e in pairs(d.weapons) do
          if e.onlytargetcategory=="VTOL" or e.badtargetcategory=="NOTAIR" or e.badtargetcategory=="NOTAIR LIGHTAIRSCOUT" then
            if e.def then c[string.lower(e.def)]=true end
          end
          e.badtargetcategory=nil
          e.onlytargetcategory=nil
          e.maxangledif=360
        end
      end
      if d.weapondefs then
        for f,g in pairs(d.weapondefs) do
          if not processed[g] then
            processed[g]=true
            local h=c[string.lower(f)] or (g.canattackground==false)
            local i=0
            if g.damage then
              local j=tonumber(g.damage.default) or 0
              local k=tonumber(g.damage.vtol) or 0
              i=math.max(j,k)
            end
            local l=1.2
            if b then l=l+0.6 end
            if h then l=l+0.6 end
            if g.damage and i>0 then
              local m=i*l
              g.damage.default=m
              g.damage.vtol=m
              g.damage.subs=m
            end
            if g.weaponvelocity then
              g.weaponvelocity=(tonumber(g.weaponvelocity) or 100)*1.5
            end
            g.canattackground=true
            if g.waterweapon then g.waterweapon=nil end
            g.badtargetcategory=nil
            g.onlytargetcategory=nil
            if g.weapontype=="MissileLauncher" or g.weapontype=="StarburstLauncher" then
              g.tolerance=32000
              if g.flighttime then g.flighttime=(tonumber(g.flighttime) or 2)*1.5 end
              if g.turnrate then g.turnrate=(tonumber(g.turnrate) or 1000)*1.5 end
            end
          end
        end
      end
    end-- by CrossGamer Portable shield
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

    local units_to_modify = {"armcroc", "corsala", "legfloat"}
    for _, unitName in i
local SEED = 918273

local function roll(key)
  local h = SEED
  for i = 1, #key do
    h = (h * 33 + string.byte(key, i)) % 2147483647
  end
  return 1 + 0.5 * ((h % 1000000) / 1000000)
end

local function up(t, field, key)
  local v = t[field]
  if type(v) == "number" and v > 0 then
    t[field] = v * roll(key .. ":" .. field)
  end
end

local function betterLower(t, field, key, floor)
  local v = t[field]
  if type(v) == "number" and v > 0 then
    local nv = v / roll(key .. ":" .. field)
    if floor and nv < floor then nv = floor end
    t[field] = nv
  end
end

for unitName, ud in pairs(UnitDefs) do
  local k = "U:" .. unitName

  up(ud, "health", k)
  up(ud, "autoheal", k)
  up(ud, "idleautoheal", k)
  up(ud, "speed", k)
  up(ud, "maxacc", k)
  up(ud, "maxdec", k)
  up(ud, "turnrate", k)
  up(ud, "workertime", k)
  up(ud, "builddistance", k)
  up(ud, "capturespeed", k)
  up(ud, "terraformspeed", k)
  up(ud, "sightdistance", k)
  up(ud, "airsightdistance", k)
  up(ud, "radardistance", k)
  up(ud, "sonardistance", k)
  up(ud, "radardistancejam", k)
  up(ud, "sonardistancejam", k)

  if ud.weapondefs then
    for weaponName, wd in pairs(ud.weapondefs) do
      local wk = k .. ":W:" .. weaponName

      up(wd, "range", wk)
      up(wd, "areaofeffect", wk)
      up(wd, "weaponvelocity", wk)
      up(wd, "startvelocity", wk)
      up(wd, "weaponacceleration", wk)

      betterLower(wd, "reloadtime", wk, 0.05)
      betterLower(wd, "accuracy", wk, 0)
      betterLower(wd, "sprayangle", wk, 0)

      up(wd, "shieldpower", wk)
      up(wd, "shieldpowerregen", wk)
      up(wd, "shieldradius", wk)
    end
  end
end

--Scav Boss HP 5X
local a=UnitDef_Post;function UnitDef_Post(b,c)a(b,c)if c.health and b:match("^scavengerbossv4")then c.health=math.floor(c.health*5)end end  
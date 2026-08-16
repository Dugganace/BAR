-- Unit HP Buff T1 T2 and MaxUnits
-- Author: Waffles_II

for name, ud in pairs(UnitDefs) do
if not string.find(name, "scavengerboss") and not string.find(name, "raptor")then

	local o_metal = ud.metalcost or ud.buildcostmetal or 404
	local o_energy = ud.energycost or ud.buildcostenergy or 404
	local o_buildtime = ud.buildtime or 404

	-- HEALTH
	local health_val = ud.health
	local tech_lvl = ud.customparams.techlevel or 1
	local move_speed = ud.speed or 0
	local ug = ud.customparams.unitgroup or "misc"
	--if ug and (ug == "weapon" or ug == "aa" or ug == "weaponsub" or ug == "weaponaa" or ug == "emp") and (tech_lvl == 1 or tech_lvl == 2) and not (move_speed == 0) then
	if ug and (ug == "weapon" or ug == "weaponsub" or ug == "emp") and (tech_lvl == 1 or tech_lvl == 2) and not (move_speed == 0) then
		if health_val then
			local mult = 1.6
			local new_health = math.ceil(health_val * mult)
			ud.health = new_health
			ud.maxdamage = new_health
		end


		-- COSTS
		local cost_multM = 1.2
		local cost_mult = 1.2

		local mcost = math.ceil(o_metal * cost_multM)
		local ecost = math.ceil(o_energy * cost_mult)
		local bpcost = math.ceil(o_buildtime * cost_mult)

		ud.metalcost = mcost
		ud.energycost = ecost
		ud.buildtime = bpcost
	end

	-- MAXCOUNTS for non-AA defense turrets
	local move_speed = ud.speed or 0
	local ug = ud.customparams.unitgroup or "misc"
	if ug and (ug == "weapon") and (move_speed == 0) and (tech_lvl == 2 or tech_lvl == 3) then
		-- ud.maxthisunit = 4
	end
	if ug and (ug == "weapon") and (move_speed == 0) and (tech_lvl == 1) then
		-- ud.maxthisunit = 12
	end

end
end

--T3 Cons & Taxed Factories
-- Authors: Nervensaege, TetrisCo
local a,b,c,d,e,f,g=UnitDefs or{},{'arm','cor','leg'},table.merge,{arm='Armada ',cor='Cortex ',leg='Legion '},'_taxed',1.5,table.contains;local function h(b,d,e)if a[b]and not a[d]then a[d]=c(a[b],e)end end;for b,b in pairs(b)do local c,i,j=b=='arm',b=='cor',b=='leg'
h(b..'nanotct2',b..'nanotct3',{metalcost=7900,energycost=82000,builddistance=550,canreclaim=false,buildtime=128000,collisionvolumescales='61 128 61',footprintx=6,footprintz=6,health=3500,mass=37200,sightdistance=575,workertime=4600,icontype="armnanotct2",canrepeat=true,objectname=j and'Units/legnanotcbase.s3o'or i and'Units/CORRESPAWN.s3o'or'Units/ARMRESPAWN.s3o',customparams={i18n_en_humanname='T3 Construction Turret',i18n_en_tooltip='More BUILDPOWER! For the connoisseur'}})
h(j and'legamstor'or b..'uwadvms',j and'legamstort3'or b..'uwadvmst3',{metalstorage=30000,metalcost=4200,energycost=231150,buildtime=142800,health=53560,icontype="armuwadves",name=d[b]..'T3 Metal Storage',customparams={i18n_en_humanname='T3 Hardened Metal Storage',i18n_en_tooltip='The big metal storage tank for your most precious resources. Chopped chicken!'}})
h(j and'legadvestore'or b..'uwadves',j and'legadvestoret3'or b..'advestoret3',{energystorage=272000,metalcost=2100,energycost=59000,buildtime=93380,health=49140,icontype="armuwadves",name=d[b]..'T3 Energy Storage',customparams={i18n_en_humanname='T3 Hardened Energy Storage',i18n_en_tooltip='Power! Power! We need power!1!'}})
for b,b in pairs({b..'nanotc',b..'nanotct2'})do if a[b]then a[b].canrepeat=true end end;
local k=c and'armshltx'or i and'corgant'or'leggant'
local l=a[k]h(k,k..e,{energycost=l.energycost*f,icontype=k,metalcost=l.metalcost*f,name=d[b]..'Experimental Gantry Taxed',customparams={i18n_en_humanname=d[b]..'Experimental Gantry Taxed',i18n_en_tooltip='Produces Experimental Units'}})local f,j={},{b..'afust3',b..'nanotct2',b..'nanotct3',b..'alab',b..'avp',b..'aap',b..'gatet3',b..'flak',j and'legadveconvt3', j and 'legadveconvt3_cold200'or b..'mmkrt3',b..'mmkrt3_cold200','infinitybox',j and'legamstort3'or b..'uwadvmst3',j and'legadvestoret3'or b..'advestoret3',j and'legdeflector'or b..'gate',j and'legforti'or b..'fort',c and'armshltx'or b..'gant'}for a,a in ipairs(j)do f[#f+1]=a end;local j={arm={'corgant','leggant'},cor={'armshltx','leggant'},leg={'armshltx','corgant'}}for a,a in ipairs(j[b]or{})do f[#f+1]=a..e end;local e={arm={'armamd','armmercury','armbrtha','armminivulc','armvulc','armanni','armannit3','armlwall'},cor={'corfmd','corscreamer','cordoomt3','corbuzz','corminibuzz','corint','cordoom','corhllllt','cormwall'},leg={'legabm','legstarfall','legministarfall','leglraa','legbastion','legrwall','leglrpc','legapopupdef','legdtf'}}for a,a in ipairs(e[b]or{})do f[#f+1]=a end;local e=b..'t3aide'h(b..'decom',e,{blocking=true,builddistance=350,buildtime=140000,energycost=200000,energyupkeep=2000,health=10000,idleautoheal=5,idletime=1800,metalcost=12600,speed=85,terraformspeed=3000,turninplaceanglelimit=1.890,turnrate=1240,workertime=6000,reclaimable=true,candgun=false,name=d[b]..'Epic Aide',customparams={subfolder='ArmBots/T3',techlevel=3,unitgroup='buildert3',i18n_en_humanname='Epic Ground Construction Aide',i18n_en_tooltip='Your Aide that helps you construct buildings'},buildoptions=f})a[e].weapondefs={}a[e].weapons={}
local c=c and'armshltx'or i and'corgant'or'leggant'a[c].maxthisunit=22222;
if a[c]and a[c].buildoptions then local b=b..'t3aide'
if not g(a[c].buildoptions,b)then table.insert(a[c].buildoptions,b)end end;
end
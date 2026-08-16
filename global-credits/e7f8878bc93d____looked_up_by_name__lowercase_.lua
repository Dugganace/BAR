-- looked up by name (lowercase)
			wd.customparams.cluster_number = 3
		end
	end

	-- Sub-shell: also looks like the epic unit, explodes where it lands, also with
	-- a large blast but modest damage.
	u.weapondefs[subkey] = {
		weapontype = "Cannon",
		range = 380,                      -- scatter radius of the 3
		reloadtime = 1,
		weaponvelocity = 350,
		areaofeffect = 420,               -- big secondary blasts
		edgeeffectiveness = 0.25,
		gravityaffected = "true",
		mygravity = 0.2,
		model = projModel,
		explosiongenerator = "custom:genericshellexplosion-large-bomb",
		soundhit = "xplomed2",
		noselfdamage = true,
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		damage = { default = 150 },
	}

	u.health     = math.floor(u.health     * 1.3)
	u.metalcost  = math.floor(u.metalcost  * 1.5)
	u.energycost = math.floor(u.energycost * 1.5)
	u.buildtime  = math.floor(u.buildtime  * 1.5)
	u.icontype = donorName
	setName(u, humanName, tooltip)
	UnitDefs[newName] = u
	for _, b in ipairs(builders) do addBuild(b, newName) end
end

makeShatterArty("cortoast", "corgruntshatter", "Gruntshatter Cannon",
	"T2 artillery: epic-grunt shell that shatters into 3 blasts", EGRUNT_PROJ,
	{ "corack", "coracv" })
makeShatterArty("armamb", "armpawnshatter", "Pawnshatter Cannon",
	"T2 artillery: epic-pawn shell that shatters into 3 blasts", EPAWN_PROJ,
	{ "armack", "armacv" })

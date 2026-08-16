--Nuke mod by FiendishDevil
{
corsilo = {
		customparams = {
    			i18n_en_tooltip = 'Cluster Nuke ICBM Launcher',
		},
		weapondefs = {
			crblmssl = {
				areaofeffect = 1000,
				craterareaofeffect = 1000,
				customparams = {
					cluster_def = 'nuke_cluster',
					cluster_number = 4,
				},
				damage = {
					commanders = 2500,
					default = 11500,
				},
			},
			nuclear_launch = {
				areaofeffect = 0,
				avoidfeature = false,
				avoidfriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0,
				impulsefactor = 0,
				metalpershot = 0,
				name = "Nuclear Launch",
				range = 0,
				reloadtime = 30,
				soundhit = "nukelaunchalarm",
				soundhitvolume = 50,
				tolerance = 10000,
				turnrate = 10000,
				weaponacceleration = 101,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 100,
				damage = {
					default = 0,
				},
			},
			nuke_cluster = {
				areaofeffect = 350,
				avoidfeature = false,
				cegtag = "ministarfire",
				craterareaofeffect = 350,
				craterboost = 2.4,
				cratermult = 1.2,
				edgeeffectiveness = 0.45,
				explosiongenerator = "custom:newnuketac",
				gravityaffected = "false",
				impulsefactor = 0.5,
				name = "Cluster Nuke",
				noselfdamage = true,
				range = 750,
				rgbcolor = "0.7 0.7 1.0 1.0 1.0 1.0 1.0 1.0",
				soundhit = "xplomed4",
				soundhitwet = "splsmed",
				soundstart = "cannhvy2",
				weapontype = "Cannon",
				damage = {
					default = 5250,
				},
			},

		},
		weapons = {
			[1] = {
				def = "CRBLMSSL",
				onlytargetcategory = "NOTSUB",
			},
			[2] = {
				def = "NUCLEAR_LAUNCH",
				onlytargetcategory = "NOTSUB",
			},
			[3] = {
				def = "NUKE_CLUSTER",
				onlytargetcategory = "NOTSUB",
			},
		},
	},
legsilo = {
		customparams = {
    			i18n_en_tooltip = 'Nuclear Napalm ICBM Launcher',
		},
		weapondefs = {
			legicbm = {
				cegtag = "burnflame",
				colormap = "0.75 0.73 0.67 0.024   0.37 0.4 0.30 0.021   0.22 0.21 0.14 0.018  0.024 0.014 0.009 0.03   0.0 0.0 0.0 0.008",
				rgbcolor = ".17 0.98 0.11",
				flamegfxtime = 1,
				customparams = {
					area_onhit_ceg = "fire-area-1000-repeat",
					area_onhit_damageCeg = "burnflamexl-gen",
					area_onhit_resistance = "fire",
					area_onhit_damage = 500,
					area_onhit_range = 1000,
					area_onhit_time = 30,
				},
				damage = {
					commanders = 1500,
					default = 5500,
				},
			},
			nuclear_launch = {
				areaofeffect = 0,
				avoidfeature = false,
				avoidfriendly = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0,
				impulsefactor = 0,
				metalpershot = 0,
				name = "Nuclear Launch",
				range = 0,
				reloadtime = 30,
				soundhit = "nukelaunchalarm",
				soundhitvolume = 50,
				tolerance = 10000,
				turnrate = 10000,
				weaponacceleration = 101,
				weapontimer = 0.1,
				weapontype = "Cannon",
				weaponvelocity = 100,
				damage = {
					default = 0,
				},
			},
		},
		weapons = {
			[1] = {
				def 
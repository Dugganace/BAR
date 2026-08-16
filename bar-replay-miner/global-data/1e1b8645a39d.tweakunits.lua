--engiMan Epic Comm
{
	armshltx = {buildoptions = {[25] = "scavengerbossv4_epic",},},
	armshltxuw = {buildoptions = {[25] = "scavengerbossv4_epic",},},
	corgant = {buildoptions = {[25] = "scavengerbossv4_epic",},},
	corgantuw = {buildoptions = {[25] = "scavengerbossv4_epic",},},
	leggant = {buildoptions = {[25] = "scavengerbossv4_epic",},},

	scavengerbossv4_epic = {
		energycost = 10000000,
		metalcost = 1000000,
		movementclass = "VBOT6",
		radardistance = 0,
		radaremitheight = 0,
		buildpic = "scavengers/ARMCOMBOSS.DDS",
		explodeas = "korgExplosionSelfd",
		selfdestructas = "ScavComBossExplo",
		selfdestructcountdown = 10,
		speed = 26.5,
		featuredefs = {
			dead = {
				metal = 7000,
			},
			heap = {
				metal = 3500,
			},
		},
		weapondefs = {
			special_botcannon = {
				areaofeffect = 0,
				range = 0,
				reloadtime = 999999999,
				stockpiletime = 999999999,
				numbounce = 0,
				customparams = {
					spawns_name = "",
					spawns_surface = "",
					stockpilelimit = 0,
				},
			},
			machinegun = {
				range = 600,
			},
			shotgunarm = {
				range = 550,
			},
			shoulderturrets = {
				range = 800,
			},
			missilelauncher = {
				range = 800,
			},
			turbo_shoulderturrets = {
				range = 800,
			},
			special_disintegratorxl = {
				damage = {
					default = 1000,
					commanders = 0,
				},
			},
			turbo_missilelauncher = {
				range = 800,
			},
			turbo_napalm = {
				commandfire = true,
			},
			turbo_machinegun = {
				range = 600,
			},
		},
		weapons = {
			[3] = {
			badtargetcategory = "VTOL",
			def = "shotgunarm",
			onlytargetcategory = "SURFACE",
		},
			[4] = {
			badtargetcategory = "VTOL GROUNDSCOUT WEAPON",
			def = "shoulderturrets",
			onlytargetcategory = "SURFACE",
		},
		[5] = {
			badtargetcategory = "SURFACE",
			def = "missilelauncher",
			onlytargetcategory = "NOTSUB",
		},
		[8] = {
			badtargetcategory = "SURFACE",
			def = "turbo_missilelauncher",
			onlytargetcategory = "NOTSUB",
		},
			[11] = {
			badtargetcategory = "VTOL GROUNDSCOUT WEAPON",
			def = "turbo_shoulderturrets",
			onlytargetcategory = "SURFACE",
		},
			[12] = {
			badtargetcategory = "ALL",
			def = "special_botcannon",
			onlytargetcategory = "CANBEUW UNDERWATER",
			},
		},
	},
	armcom = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl2 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl3 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl4 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl5 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl6 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl7 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl8 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl9 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	armcomlvl10 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcom = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl2 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl3 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl4 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl5 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl6 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl7 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl8 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl9 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	corcomlvl10 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcom = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl2 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl3 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl4 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl5 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl6 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl7 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl8 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl9 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
	legcomlvl10 = {weapondefs={disintegrator={damage={scavboss=9999999,},},},},
}
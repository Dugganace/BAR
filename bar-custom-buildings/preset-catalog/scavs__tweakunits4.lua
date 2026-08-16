{
	armshltx = {
		buildoptions = {
				[17] = "scavengerbossv4_epic",
				[18] = "armscavengerbossv2_epic",
				[19] = "armcomboss",
		},
	},
	armshltxuw = {
		buildoptions = {
				[17] = "scavengerbossv4_epic",
				[18] = "armscavengerbossv2_epic",
				[19] = "armcomboss",
		},
	},
	corgant = {
		buildoptions = {
				[17] = "scavengerbossv4_epic",
				[18] = "armscavengerbossv2_epic",
				[19] = "armcomboss",
		},
	},
	corgantuw = {
		buildoptions = {
				[17] = "scavengerbossv4_epic",
				[18] = "armscavengerbossv2_epic",
				[19] = "armcomboss",
		},
	},
	leggant = {
		buildoptions = {
				[17] = "scavengerbossv4_epic",
				[18] = "armscavengerbossv2_epic",
				[19] = "armcomboss",
		},
	},
	armcomboss = {
		speed = 27,
		buildtime = 10000000,
       		metalcost = 1000000,
       		weapondefs = {
            	armcomlaserboss = {
                energypershot = 20000,
            },
            armcomsealaserboss = {
                energypershot = 30000,
            },
            disintegratorxl = {
                energypershot = 200000,
				reloadtime=0.75,
                damage = {
					default = 70000,
				},
            },
        }
	},
	armscavengerbossv2_epic = {
		energycost = 7000000,
		buildtime = 7000000,
       	metalcost = 700000,
		speed = 35,
		buildpic = "scavengers/ARMCOMBOSS.DDS",
		health = 1680000,
		weapondefs = {
		    machinegun = {
                energypershot = 1500,
            },
            torpedo = {
                energypershot = 7000,
            },
            disintegratorxl = {
                    energypershot = 300000,
	    avoidFriendly= true,
                    damage = {
                        default = 20000,
                    },
            },
            corkorg_laser= {
                energypershot = 30000,
            },
		}
	},
	scavengerbossv4_epic = {
		energycost = 5000000,
		metalcost = 500000,
		radardistance = 0,
		radaremitheight = 0,
		buildpic = "scavengers/ARMCOMBOSS.DDS",
		explodeas = "korgExplosionSelfd",
		selfdestructas = "ScavComBossExplo",
		selfdestructcountdown = 20,
		speed = 37.5,
		health = 1280000,
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
				energypershot = 30000,
				range = 600,
			},
			shotgunarm = {
				range = 900,
				energypershot = 10000,
			},
			eaterbeam = {
				energypershot = 100000,
			},
			shoulderturrets = {
				range = 1100,
				energypershot = 30000,
			},
			missilelauncher = {
				energypershot = 20000,
				range = 1000,
			},
			turbo_shoulderturrets = {
				range = 1100,
				energypershot = 30000,
			},
			special_disintegratorxl = {
				energypershot = 100000,
				damage = {
					default = 20000,
					commanders = 0,
				},
			},
			turbo_missilelauncher = {
				energypershot = 50000,
				range = 1000,
			},
			turbo_machinegun = {
				energypershot = 200000,
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
	}
}  
{corfdrag={health=6000,repairable=true},
 armfdrag={health=6000,repairable=true},
 legfdrag={health=6000,repairable=true},
 armflak={airsightdistance=1350,weapondefs={armflak_gun={collidefriendly=0,collidefeature=0,avoidfeature=0,avoidfriendly=0,areaofeffect=200,range=1150,weaponvelocity=3600}}},
 corflak={airsightdistance=1350,weapondefs={armflak_gun={collidefriendly=0,collidefeature=0,avoidfeature=0,avoidfriendly=0,areaofeffect=200,range=1150,weaponvelocity=3600}}},
 legflak={footprintx=4,footprintz=4,airsightdistance=1350,energycost=35000,metalcost=2100,health=6000,weapondefs={leg_t2_microflak={collidefriendly=0,collidefeature=0,avoidfeature=0,avoidfriendly=0,areaofeffect=100,burst=3,range=1050,intensity=0.18}}},
 armmercury={airsightdistance=2200,weapondefs={arm_advsam={areaofeffect=500,energypershot=2000,explosiongenerator='custom:flak',flighttime=1.5,metalpershot=6,name='Mid-range, rapid-fire g2a guided missile launcher',range=2500,reloadtime=1.2,smoketrail=false,startvelocity=1500,weaponacceleration=1000,weaponvelocity=4000}}},
 corscreamer={airsightdistance=2800,weapondefs={cor_advsam={areaofeffect=800,energypershot=2000,explosiongenerator='custom:flak',flighttime=1,metalpershot=10,name='Long-range g2a guided heavy flak missile launcher',range=2800,reloadtime=1.8,smoketrail=false,startvelocity=4000,weaponacceleration=1000,weaponvelocity=8000}}},
 armanavaldefturret={weapondefs={armada_tachyon_emitter={reloadtime=2.1,damage={default=1600}},armada_medium_gauss_cannon={reloadtime=0.5,weaponvelocity=1200}}},
 armnavaldefturret={weapondefs={arm_medium_gauss_cannon={weaponvelocity=1200,damage={default=250}}}},
 coranavaldefturret={weapondefs={cortex_medium_energy_blaster={reloadtime=2,damage={default=950}},t1_heavy_plasma_cannon={reloadtime=0.9,weaponvelocity=900}}},
 cornavaldefturret={weapondefs={t1_heavy_plasma_cannon={reloadtime=2.3,weaponvelocity=600}}},
 leganavaldefturret={weapondefs={legion_heavy_minigun={range=700,damage={default=50}},advanced_shotgun={weaponvelocity=1200,damage={default=40}}}},
 legnavaldefturret={weapondefs={leg_med_anti_naval_salvo_rocket ={weaponvelocity=900,damage={default=150}}}},
 armanni={weapondefs={ata={reloadtime=3.7,energypershot=700,damage={default=3600}}}},
 armcomboss={weapondefs={disintegratorxl={damage={default=150000,commanders = 20000}}}},
 armrectr={workertime=450},
 cornecro={workertime=450},
 legrezbot={workertime=450},
 armt3airaide={cruisealtitude=3000,builddistance=600,speed=40},
 cort3airaide={cruisealtitude=3000,builddistance=600,speed=40},
 legt3airaide={cruisealtitude=3000,builddistance=600,speed=40},
 legapopupdef={weapondefs = {advanced_riot_cannon={damage={default=220}},standard_minigun={weaponvelocity=1500,damage={default=17}}}},
 corcomlvl3={customparams={shield_power = 4270,}},
 corcomlvl4={customparams={shield_power = 7450,}},
 corcomlvl5={customparams={shield_power = 11000,}},
 corcomlvl6={customparams={shield_power = 13000,}},
 corcomlvl7={customparams={shield_power = 15000,}},
 corcomlvl8={customparams={shield_power = 18000,}},
 corcomlvl9={customparams={shield_power = 21000,}},
 corcomlvl10={customparams={shield_power = 24000,}},
 cortron={weapondefs={cortron_weapon={range=2200}}},
 corfort={repairable=true},
 armfort={repairable=true},
 legforti={repairable=true},
 armgate={explodeas='empblast',selfdestructas='empblast'},
 corgate={explodeas='empblast',selfdestructas='empblast'},
 legdeflector={explodeas='empblast',selfdestructas='empblast'},
 corhlt={energycost=5500,metalcost=520,weapondefs={cor_laserh1={range=750,reloadtime=0.95,damage={default=395,vtol=35}}}},
 armhlt={energycost=5700,metalcost=510,weapondefs={arm_laserh1={range=750,reloadtime=1,damage={default=405,vtol=35}}}},
 armsat={energycost=120000,buildtime = 42800,sightdistance=2800,sonardistance=3000,radardistance=3600},
 corsat={energycost=120000,buildtime = 42800,sightdistance=2800,sonardistance=3000,radardistance=3600},
 armapt3={buildoptions={[12]="armsat"}},
 corapt3={buildoptions={[12]="corsat"}},
 legapt3={buildoptions={[12]="armsat"}},
 raptor_land_swarmer_brood_t2_v1={reclaimable=false},
 raptor_land_swarmer_heal_t4_v1={metalcost=1400,energycost=15000},
 }  {
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
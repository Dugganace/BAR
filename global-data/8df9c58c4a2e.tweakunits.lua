{
legparadrone = {
weapondefs = {
			semiauto = {
				accuracy = 7,
				areaofeffect = 16,
				avoidfeature = false,
				burnblow = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.5,
				explosiongenerator = "custom:plasmahit-sparkonly",
				impulsefactor = 0.123,
				intensity = 0.8,
				name = "Full Autmatic Machine Gun",
				noselfdamage = true,
				ownerExpAccWeight = 4.0,
				proximitypriority = 1,
				range = 300,
				reloadtime = 0.1,
				rgbcolor = "1 0.95 0.4",
				soundhit = "bimpact3",
				soundhitwet = "splshbig",
				soundstart = "mgun3",
				soundtrigger = true,
				sprayangle = 1024,
				texture1 = "shot",
				texture2 = "empty",
				thickness = 2.0,
				tolerance = 6000,
				turret = true,
				weapontype = "LaserCannon",
				weaponvelocity = 692,
				damage = {
					default = 7,
				},
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "SEMIAUTO",
				maindir = "0 0 1",
				maxangledif = 90,
				onlytargetcategory = "NOTSUB",
			},
		},
},
legparagon = {
weapondefs = {
			plasma = {
				areaofeffect = 4,
				avoidfeature = false,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.15,
				explosiongenerator = "",
				gravityaffected = "true",
				hightrajectory = 1,
				impulsefactor = 0.123,
				name = "HeavyCannon",
				noselfdamage = true,
				metalpershot = 15,
				energypershot = 500,
				range = 1100,
				reloadtime = 2.5,
				size = 0,
				soundhit = "",
				soundhitwet = "",
				soundstart = "",
				stockpile = true,
				stockpiletime = 10,
				turret = true,
				weapontype = "Cannon",
				weaponvelocity = 1000,
				damage = {
					default = 0,
				},
				customparams = {
					carried_unit = "legparadrone",     --Name of the unit spawned by this carrier unit.
					engagementrange = 1100,
					spawns_surface = "LAND",    -- "LAND" or "SEA". The SEA option has not been tested currently.
					spawnrate = 8, 				--Spawnrate roughly in seconds.
					maxunits = 6,				--Will spawn units until this amount has been reached.
					energycost = 500,			--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working.
					metalcost = 15,				--Custom spawn cost. Remove this or set = nil to inherit the cost from the carried_unit unitDef. Cost inheritance is currently not working.
					controlradius = 1200,			--The spawned units should stay within this radius. Unfinished behavior may cause exceptions. Planned: radius = 0 to disable radius limit.
					decayrate = 4,
					carrierdeaththroe = "release",
					dockingarmor = 0.2,
					dockinghealrate = 16,
					docktohealthreshold = 66,
					enabledocking = true,		--If enabled, docking behavior is used. Currently docking while moving or stopping, and undocking while attacking. Unfinished behavior may cause exceptions.
					dockingHelperSpeed = 5,
					dockingpieces = "4 5 6 7 8 9",
					dockingradius = 80,			--The range at which the units snap to the carrier unit when docking.
					stockpilelimit = 6,
					stockpilemetal = 15,
					stockpileenergy = 500,
				}
			},
		},
		weapons = {
			[1] = {
				badtargetcategory = "VTOL",
				def = "PLASMA",
				onlytargetcategory = "NOTSUB",
			},
		},
},
armfirewall = {
weapondefs = {
			lightning = {
				areaofeffect = 8,
				avoidfeature = false,
				beamttl = 1,
				burst = 4,
				burstrate = 0.02,
				craterareaofeffect = 0,
				craterboost = 0,
				cratermult = 0,
				duration = 1,
				edgeeffectiveness = 0.15,
				energypershot = 5,
				explosiongenerator = "custom:genericshellexplosion-large-lightning2",
				firestarter = 50,
				impactonly = 1,
				impulsefactor = 0,
				intensity = 28, --was 24
				name = "EMP Lightning Cannon",
				noselfdamage = true,
				range = 500,
				reloadtime = 0.1,
				rgbcolor = "0.5 0.5 1",
				soundhit = "lashit",
				soundhitwet = "sizzle",
				soundstart = "lghthvy1",
				soundtrigger = true,
				thickness = 2.2,
				turret = true,
				weapontype = "LightningCannon",
				weaponvelocity = 400,
				paralyzer = true,
				paralyzetime = 8,
				damage = {
					default = 40,
				},
			},
},
		weapons = {
			[1] = {
				def = "lightning",
				onlytargetcategory = "NOTSUB",
				fastautoretargeting = true,
			},
		},
},
corageot3 = {
weapondefs = {
cor_georockets = {
				areaofeffect = 200,
				avoidfeature = true,
				avoidfriendly = false,
				burnblow = true,
				canattackground = true,
				castshadow = false,
				cegtag = "missiletrailaa-large",
				collidefriendly = false,
				craterareaofeffect = 200,
				craterboost = 0,
				cratermult = 0,
				edgeeffectiveness = 0.6,
				energypershot = 0,
				explosiongenerator = "custom:genericshellexplosion-huge-aa",
				firestarter = 90,
				flighttime = 10,
				impulsefactor = 0,
				metalpershot = 0,
				model = "corscreamermissile.s3o",
				name = "Long Range Seeker Rocket Platform",
				noselfdamage = true,
				proximitypriority = -1,
				range = 1500,
				reloadtime = 1.2,
				smokecolor = 0.9,
				smokeperiod = 2,
				smokesize = 4,
				smoketime = 24,
				smoketrail = true,
				smoketrailcastshadow = false,
				soundhit = "impact",
				soundhitvolume = 8,
				soundhitwet = "splslrg",
				soundstart = "aarocket",
				soundstartvolume = 8,
				startvelocity = 1000,
				texture1 = "null",
				texture2 = "smoketrailaaflak",
				tolerance = 10000,
				tracks = true,
				trajectoryheight = 2,
				turnrate = 40000,
				turret = true,
				weapontimer = 1,
				weaponacceleration = 1000,
				weapontype = "StarburstLauncher",
				weaponvelocity = 1400,
				damage = {
					default  = 900,
					vtol = 2000,
					commander = 450,
				},
			},
},
weapons = {
[1] = {
				def = "COR_GEOROCKETS",
				fastautoretargeting = true,
				onlytargetcategory = "NOTSUB",
    },
},
},
}--EpicCom(EngiMan) V3
{armshltx ={buildoptions ={[25] = "scavengerbossv4_epic",},},armshltxuw ={buildoptions ={[25] = "scavengerbossv4_epic",},},corgant ={buildoptions ={[25] = "scavengerbossv4_epic",},},corgantuw ={buildoptions ={[25] = "scavengerbossv4_epic",},},leggant ={buildoptions ={[25] = "scavengerbossv4_epic",},},scavengerbossv4_epic ={builder = false,metalmake = 0,energymake = 2500,energycost = 10000000,metalcost = 1000000,maxthisunit = 1,movementclass = "VBOT6",radardistance = 1000,radaremitheight = 54,buildpic = "scavengers/ARMCOMBOSS.DDS",explodeas = "advancedFusionExplosionSelfd",selfdestructas = "ScavComBossExplo",selfdestructcountdown = 10,speed = 35,customparams ={unitgroup = 'weapon',},featuredefs ={dead ={metal = 7000,},heap ={metal = 3500,},},weapondefs ={special_botcannon ={areaofeffect = 0,range = 0,stockpile = false,reloadtime = 999999999,stockpiletime = 999999999,numbounce = 0,customparams ={spawns_name = "",spawns_surface = "",stockpilelimit = 0,},},machinegun ={range = 650,},shotgunarm ={range = 700,},shoulderturrets ={range = 900,},missilelauncher ={range = 900,},turbo_shoulderturrets ={range = 900,},special_disintegratorxl ={damage ={default = 1000,commanders = 0,},},eaterbeam ={commandfire = true,},turbo_missilelauncher ={range = 1000,},turbo_machinegun ={range = 650,},},weapons ={[12] ={badtargetcategory = "ALL",def = "special_botcannon",onlytargetcategory = "CANBEUW UNDERWATER",},},},armcom ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl2 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl3 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl4 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl5 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl6 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl7 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl8 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl9 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},armcomlvl10 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcom ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl2 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl3 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl4 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl5 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl6 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl7 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl8 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl9 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},corcomlvl10 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcom ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl2 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl3 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl4 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl5 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl6 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl7 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl8 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl9 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},legcomlvl10 ={weapondefs ={disintegrator ={damage ={scavboss = 9999999,},},},},}-- DRONE_HIVE_T2

do
    local a, b, c = UnitDefs or {}, table.merge, 'legdronehive_t2'
    a[c] = b(
        a['leghive'],
        {
            name = 'Drone Hive T2',
            description = 'Tier 2 drone carrier tower.',
            buildtime = 60000,
            health = 6000,
            metalcost = 2000,
            energycost = 50000,
            icontype = 'leghive',
            customparams = {
                i18n_en_humanname = 'Heavy Drone Hive',
                i18n_en_tooltip = 'Spawns and controls small heavy drones at 90 metal 1000 energy per drone',
                techlevel = 2,
            },
            weapondefs = {
                drone_controller = {
                    areaofeffect = 4,
                    avoidfeature = false,
                    collidefriendly = false,
                    craterareaofeffect = 0,
                    craterboost = 0,
                    cratermult = 0,
                    edgeeffectiveness = 0.15,
                    explosiongenerator = "",
                    gravityaffected = "true",
                    hightrajectory = 1,
                    impulsefactor = 0.123,
                    name = "Drone Control Matrix",
                    noselfdamage = true,
                    metalpershot = 90,
                    energypershot = 1000,
                    range = 1300,
                    reloadtime = 6, -- 6-second spawn timer
                    size = 0,
                    stockpile = true,
                    stockpiletime = 6,
                    turret = true,
                    weapontype = "Cannon",
                    weaponvelocity = 1000,
                    damage = { default = 0 },
                    customparams = {
                        carried_unit = "legheavydronesmall",
                        engagementrange = 1300,
                        spawns_surface = "LAND",
                        spawnrate = 6,
                        maxunits = 6,
                        energycost = 1000,
                        metalcost = 90,
                        controlradius = 1200,
                        decayrate = 4,
                        carrierdeaththroe = "release",
                        dockingarmor = 0.2,
                        dockinghealrate = 256, -- faster healing
                        docktohealthreshold = 33, -- % hp before returning to hive
                        enabledocking = true, -- lets them land and repair/hold
                        dockingHelperSpeed = 5, -- idk copied from hive/drone
                        dockingpieces = "4 5 6 7 8 9", -- Caused them to not show up on lower numbers, idk why
                        dockingradius = 80, -- How far from the center the rotate
                        stockpilelimit = 6, -- Amount of drones
                        stockpilemetal = 90, -- make sure you can always pay
                        stockpileenergy = 1000, --makes sure you can always pay
                        dronesusestockpile = true,
                    }
                }
            },
            weapons = {
                [1] = {
                    badtargetcategory = "VTOL", -- not supposed to hit air but because of heat-ray it does, refer to legheavydronesmall.lua
                    def = "drone_controller",
                    onlytargetcategory = "NOTSUB",
                }
            }
        }
    )

    -- Add constructors to build this tower
    local builders_leg = {'legaca','legack','legacsub','legacv','legt3airaide','legt3aide'}
    for i = 3, 10 do
        builders_leg[#builders_leg+1] = 'legcomlvl' .. i
    end

    local function ensureBuildOption(builderName, optionName)
        local builder = a[builderName]
        local optionDef = optionName and a[optionName]
        if not builder or not optionDef then return end
        builder.buildoptions = builder.buildoptions or {}
        for i = 1, #builder.buildoptions do
            if builder.buildoptions[i] == optionName then return end
        end
        builder.buildoptions[#builder.buildoptions+1] = optionName
    end

    for _, builder_name in pairs(builders_leg) do
        ensureBuildOption(builder_name, c)
    end
end

-- DRONE_HIVE_T2_END

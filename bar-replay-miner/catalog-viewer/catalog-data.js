window.CATALOG = [
 {
  "id": "armllt_armored",
  "baseId": "armllt",
  "name": "Armored Tower",
  "baseIcon": "armllt.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 620 -> 1860 (+200%)",
   "metalcost: 85 -> 215 (+153%)",
   "energycost: 680 -> 900 (+32%)",
   "buildtime: 2400 -> 3600 (+50%)",
   "tooltip: \"Heavily armored laser tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "arminterceptor_artillery",
  "baseId": "armamd",
  "name": "Artillery Interceptor",
  "baseIcon": "armamd.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 3300 -> 2400 (-27%)",
   "metalcost: 1500 -> 650 (-57%)",
   "energycost: 38000 -> 16000 (-58%)",
   "buildtime: 60000 -> 22000 (-63%)",
   "weapon \"amd_rocket\" tuned: coverage=2600, reloadtime=1.1, stockpiletime=40",
   "tooltip: \"Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armassemblycomplex",
  "baseId": "armvp",
  "name": "Assembly Complex",
  "baseIcon": "armvp.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 3000 -> 4200 (+40%)",
   "metalcost: 590 -> 2600 (+341%)",
   "energycost: 1550 -> 26000 (+1577%)",
   "buildtime: 5700 -> 24000 (+321%)",
   "tooltip: \"Upgraded Vehicle Plant with much higher build power.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armbulwark",
  "baseId": "armhlt",
  "name": "Bulwark Tower",
  "baseIcon": "armhlt.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 2600 -> 7200 (+177%)",
   "metalcost: 440 -> 3400 (+673%)",
   "energycost: 4700 -> 42000 (+794%)",
   "buildtime: 11300 -> 38000 (+236%)",
   "weapon \"arm_laserh1\" tuned: range=780, reloadtime=1.4",
   "tooltip: \"Heavy area-control defense tower, tougher and harder-hitting than the standard laser tower.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "arminterceptor_energy",
  "baseId": "armhlt",
  "name": "Energy Interceptor",
  "baseIcon": "armhlt.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 2600 -> 2200 (-15%)",
   "metalcost: 440 -> 900 (+105%)",
   "energycost: 4700 -> 24000 (+411%)",
   "buildtime: 11300 -> 20000 (+77%)",
   "weapon \"arm_laserh1\" tuned: interceptor=1, coverage=1600, range=900, reloadtime=0.35, energypershot=120",
   "tooltip: \"Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armthort4",
  "baseId": "armthor",
  "name": "Epic Thor",
  "baseIcon": "armthor.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 56000 -> 225000 (+302%)",
   "metalcost: 9000 -> 35000 (+289%)",
   "energycost: 240000 -> 596000 (+148%)",
   "buildtime: 320000 -> 380000 (+19%)",
   "mass: undefined -> 16000",
   "weapon \"thunder\" tuned: areaofeffect=60, energypershot=1500, intensity=56, range=850, reloadtime=2.8, thickness=2.7",
   "weapon \"emp\" tuned: areaofeffect=24, range=650",
   "weapon \"empmissile\" tuned: areaofeffect=284, range=1250, reloadtime=3, stockpiletime=55, weaponacceleration=100, weapontimer=2.5",
   "tooltip: \"Ultimate Terminator Tank\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "armllt_hp",
  "baseId": "armllt",
  "name": "High Power Laser Tower",
  "baseIcon": "armllt.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 620 -> 930 (+50%)",
   "metalcost: 85 -> 255 (+200%)",
   "energycost: 680 -> 2380 (+250%)",
   "buildtime: 2400 -> 6000 (+150%)",
   "weapon \"arm_lightlaser\" tuned: range=688, energypershot=80",
   "tooltip: \"High Power variant of the light laser tower: much more expensive to build and run, but longer range and far higher damage.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armhyperreactor",
  "baseId": "armfus",
  "name": "Hyper Reactor",
  "baseIcon": "armfus.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 3800 -> 9000 (+137%)",
   "metalcost: 3350 -> 24000 (+616%)",
   "energycost: 18000 -> 340000 (+1789%)",
   "buildtime: 54000 -> 260000 (+381%)",
   "energystorage: undefined -> 4000",
   "tooltip: \"Massively upscaled Fusion Reactor. Produces 3000 energy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armllt_rapid",
  "baseId": "armllt",
  "name": "Rapid Fire Tower",
  "baseIcon": "armllt.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 620 -> 680 (+10%)",
   "metalcost: 85 -> 140 (+65%)",
   "energycost: 680 -> 1600 (+135%)",
   "buildtime: 2400 -> 3200 (+33%)",
   "weapon \"arm_lightlaser\" tuned: areaofeffect=40, reloadtime=0.1, energypershot=55",
   "tooltip: \"High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armsupportrelay",
  "baseId": "armnanotc",
  "name": "Support Relay",
  "baseIcon": "armnanotc.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 560 -> 2600 (+364%)",
   "metalcost: 230 -> 1400 (+509%)",
   "energycost: 3200 -> 14000 (+338%)",
   "buildtime: 5300 -> 12000 (+126%)",
   "tooltip: \"Long-range assist & repair turret with a much larger radius than the standard construction turret.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armbull_heavy",
  "baseId": "armbull",
  "name": "The Bull",
  "baseIcon": "armbull.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 4650 -> 7200 (+55%)",
   "metalcost: 950 -> 2200 (+132%)",
   "energycost: 13000 -> 30000 (+131%)",
   "buildtime: 23000 -> 48000 (+109%)",
   "speed: 62 -> 32 (-48%)",
   "weapon \"arm_bull\" tuned: weapontype=\"BeamLaser\", range=650, reloadtime=3.6, beamtime=0.3",
   "tooltip: \"Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "armdepawner",
  "baseId": "armflak",
  "name": "The Depawner",
  "baseIcon": "armflak.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 1750 -> 2300 (+31%)",
   "metalcost: 820 -> 1250 (+52%)",
   "energycost: 13000 -> 22000 (+69%)",
   "buildtime: 19000 -> 26000 (+37%)",
   "weapon \"armflak_gun\" tuned: range=1050, reloadtime=0.35",
   "tooltip: \"Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "umbrellamk2",
  "baseId": "armscab",
  "name": "Umbrella Mk II",
  "baseIcon": "armscab.png",
  "baseFaction": "Armada",
  "changes": [
   "health: 870 -> 2700 (+210%)",
   "metalcost: 1150 -> 2700 (+135%)",
   "energycost: 30000 -> 91000 (+203%)",
   "buildtime: 49000 -> 64000 (+31%)",
   "speed: 51 -> 48 (-6%)",
   "energystorage: undefined -> 800",
   "weapon \"repulsor\" tuned: avoidfeature=false, craterareaofeffect=0, craterboost=0, cratermult=0, edgeeffectiveness=0.15, name=\"PlasmaRepulsor\"",
   "tooltip: \"Mobile all-terrain Shield Unit\""
  ],
  "sourceFile": "2026-04-23_16-10-27-566_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "corllt_armored",
  "baseId": "corllt",
  "name": "Armored Tower",
  "baseIcon": "corllt.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 650 -> 1950 (+200%)",
   "metalcost: 90 -> 225 (+150%)",
   "energycost: 700 -> 920 (+31%)",
   "buildtime: 2500 -> 3750 (+50%)",
   "tooltip: \"Heavily armored laser tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corinterceptor_artillery",
  "baseId": "corfmd",
  "name": "Artillery Interceptor",
  "baseIcon": "corfmd.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 3300 -> 2400 (-27%)",
   "metalcost: 1500 -> 650 (-57%)",
   "energycost: 40000 -> 16000 (-60%)",
   "buildtime: 60000 -> 22000 (-63%)",
   "weapon \"fmd_rocket\" tuned: coverage=2600, reloadtime=1.1, stockpiletime=40",
   "tooltip: \"Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corassemblycomplex",
  "baseId": "corvp",
  "name": "Assembly Complex",
  "baseIcon": "corvp.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 3000 -> 4200 (+40%)",
   "metalcost: 570 -> 2600 (+356%)",
   "energycost: 1550 -> 26000 (+1577%)",
   "buildtime: 5650 -> 24000 (+325%)",
   "tooltip: \"Upgraded Vehicle Plant with much higher build power.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corbulwark",
  "baseId": "corhlt",
  "name": "Bulwark Tower",
  "baseIcon": "corhlt.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 2750 -> 7200 (+162%)",
   "metalcost: 480 -> 3400 (+608%)",
   "energycost: 4700 -> 42000 (+794%)",
   "buildtime: 11400 -> 38000 (+233%)",
   "weapon \"cor_laserh1\" tuned: range=780, reloadtime=1.4",
   "tooltip: \"Heavy area-control defense tower, tougher and harder-hitting than the standard laser tower.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corinterceptor_energy",
  "baseId": "corhlt",
  "name": "Energy Interceptor",
  "baseIcon": "corhlt.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 2750 -> 2200 (-20%)",
   "metalcost: 480 -> 900 (+88%)",
   "energycost: 4700 -> 24000 (+411%)",
   "buildtime: 11400 -> 20000 (+75%)",
   "weapon \"cor_laserh1\" tuned: interceptor=1, coverage=1600, range=900, reloadtime=0.35, energypershot=120",
   "tooltip: \"Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "cordemont4",
  "baseId": "cordemon",
  "name": "Hellblazer",
  "baseIcon": "cordemon.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 18000 -> 145000 (+706%)",
   "metalcost: 6000 -> 23000 (+283%)",
   "energycost: 90000 -> 90000 (0%)",
   "buildtime: 160000 -> 360000 (+125%)",
   "mass: undefined -> 9000",
   "energystorage: undefined -> 1000",
   "weapon \"dmaw\" tuned: areaofeffect=172, damageareaofeffect=5, range=560, rgbcolor=\"0.91 0.88 1\", rgbcolor2=\"0.8 0.8 0.91\", sprayangle=320",
   "weapon \"karg_shoulder\" tuned: areaofeffect=36, range=950, reloadtime=0.25, weaponvelocity=980",
   "tooltip: \"Earth scorching Demon\""
  ],
  "sourceFile": "2026-04-06_15-49-08-538_Supreme Isthmus v2.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "corllt_hp",
  "baseId": "corllt",
  "name": "High Power Laser Tower",
  "baseIcon": "corllt.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 650 -> 975 (+50%)",
   "metalcost: 90 -> 270 (+200%)",
   "energycost: 700 -> 2450 (+250%)",
   "buildtime: 2500 -> 6250 (+150%)",
   "weapon \"cor_lightlaser\" tuned: range=696, energypershot=80",
   "tooltip: \"High Power variant of the light laser tower: much more expensive to build and run, but longer range and far higher damage.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corhyperreactor",
  "baseId": "corfus",
  "name": "Hyper Reactor",
  "baseIcon": "corfus.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 4300 -> 9000 (+109%)",
   "metalcost: 3600 -> 24000 (+567%)",
   "energycost: 22000 -> 340000 (+1445%)",
   "buildtime: 59000 -> 260000 (+341%)",
   "energystorage: undefined -> 4000",
   "tooltip: \"Massively upscaled Fusion Reactor. Produces 3300 energy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corllt_rapid",
  "baseId": "corllt",
  "name": "Rapid Fire Tower",
  "baseIcon": "corllt.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 650 -> 710 (+9%)",
   "metalcost: 90 -> 145 (+61%)",
   "energycost: 700 -> 1650 (+136%)",
   "buildtime: 2500 -> 3300 (+32%)",
   "weapon \"cor_lightlaser\" tuned: areaofeffect=40, reloadtime=0.1, energypershot=55",
   "tooltip: \"High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corsupportrelay",
  "baseId": "cornanotc",
  "name": "Support Relay",
  "baseIcon": "cornanotc.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 560 -> 2600 (+364%)",
   "metalcost: 230 -> 1400 (+509%)",
   "energycost: 3200 -> 14000 (+338%)",
   "buildtime: 5300 -> 12000 (+126%)",
   "tooltip: \"Long-range assist & repair turret with a much larger radius than the standard construction turret.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "cordepawner",
  "baseId": "corflak",
  "name": "The Depawner",
  "baseIcon": "corflak.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 1840 -> 2300 (+25%)",
   "metalcost: 850 -> 1250 (+47%)",
   "energycost: 14000 -> 22000 (+57%)",
   "buildtime: 20000 -> 26000 (+30%)",
   "weapon \"armflak_gun\" tuned: range=1050, reloadtime=0.35",
   "tooltip: \"Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "corgol_heavy",
  "baseId": "corgol",
  "name": "The Dozer",
  "baseIcon": "corgol.png",
  "baseFaction": "Cortex",
  "changes": [
   "health: 7800 -> 8200 (+5%)",
   "metalcost: 1650 -> 2300 (+39%)",
   "energycost: 28000 -> 31000 (+11%)",
   "buildtime: 40000 -> 50000 (+25%)",
   "speed: 39 -> 30 (-23%)",
   "weapon \"cor_gol\" tuned: weapontype=\"BeamLaser\", range=650, reloadtime=3.6, beamtime=0.3",
   "tooltip: \"Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leglht_armored",
  "baseId": "leglht",
  "name": "Armored Tower",
  "baseIcon": "leglht.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 550 -> 1650 (+200%)",
   "metalcost: 70 -> 175 (+150%)",
   "energycost: 550 -> 720 (+31%)",
   "buildtime: 2200 -> 3300 (+50%)",
   "tooltip: \"Heavily armored heat ray tower: far more health, costs more metal, and mitigates incoming damage with a small always-on personal shield.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leginterceptor_artillery",
  "baseId": "legabm",
  "name": "Artillery Interceptor",
  "baseIcon": "legabm.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 3650 -> 2400 (-34%)",
   "metalcost: 1500 -> 650 (-57%)",
   "energycost: 40000 -> 16000 (-60%)",
   "buildtime: 60000 -> 22000 (-63%)",
   "weapon \"fmd_rocket\" tuned: coverage=2600, reloadtime=1.1, stockpiletime=40",
   "tooltip: \"Missile-based point defense. Stockpiles interceptor rockets to shoot down incoming missile and stockpile-artillery attacks.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "legassemblycomplex",
  "baseId": "legvp",
  "name": "Assembly Complex",
  "baseIcon": "legvp.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 3000 -> 4200 (+40%)",
   "metalcost: 570 -> 2600 (+356%)",
   "energycost: 1650 -> 26000 (+1476%)",
   "buildtime: 5700 -> 24000 (+321%)",
   "tooltip: \"Upgraded Vehicle Plant with much higher build power.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "legbulwark",
  "baseId": "leglht",
  "name": "Bulwark Tower",
  "baseIcon": "leglht.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 550 -> 7200 (+1209%)",
   "metalcost: 70 -> 3400 (+4757%)",
   "energycost: 550 -> 42000 (+7536%)",
   "buildtime: 2200 -> 38000 (+1627%)",
   "weapon \"heat_ray\" tuned: range=780, reloadtime=1.1",
   "tooltip: \"Heavy area-control defense tower, tougher and harder-hitting than the standard heat ray tower.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leginterceptor_energy",
  "baseId": "leglht",
  "name": "Energy Interceptor",
  "baseIcon": "leglht.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 550 -> 2200 (+300%)",
   "metalcost: 70 -> 900 (+1186%)",
   "energycost: 550 -> 24000 (+4264%)",
   "buildtime: 2200 -> 20000 (+809%)",
   "weapon \"heat_ray\" tuned: interceptor=1, coverage=1600, range=900, reloadtime=0.35",
   "tooltip: \"Instant-hit beam point defense. No stockpile needed, always ready -- shoots down incoming missile and stockpile-artillery attacks the moment they enter range.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leglht_hp",
  "baseId": "leglht",
  "name": "High Power Laser Tower",
  "baseIcon": "leglht.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 550 -> 825 (+50%)",
   "metalcost: 70 -> 210 (+200%)",
   "energycost: 550 -> 1925 (+250%)",
   "buildtime: 2200 -> 5500 (+150%)",
   "weapon \"heat_ray\" tuned: range=688, energypershot=70",
   "tooltip: \"High Power variant of the light heat ray tower: much more expensive to build and run, but longer range and far higher damage.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "hunterdrone",
  "baseId": "legheavydrone",
  "name": "hunterdrone",
  "baseIcon": "legheavydrone.png",
  "baseFaction": "Legion",
  "changes": [],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "leghyperreactor",
  "baseId": "legfus",
  "name": "Hyper Reactor",
  "baseIcon": "legfus.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 4600 -> 9000 (+96%)",
   "metalcost: 4000 -> 24000 (+500%)",
   "energycost: 25000 -> 340000 (+1260%)",
   "buildtime: 66000 -> 260000 (+294%)",
   "energystorage: undefined -> 4000",
   "tooltip: \"Massively upscaled Fusion Reactor. Produces 3600 energy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leglht_rapid",
  "baseId": "leglht",
  "name": "Rapid Fire Tower",
  "baseIcon": "leglht.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 550 -> 610 (+11%)",
   "metalcost: 70 -> 115 (+64%)",
   "energycost: 550 -> 1300 (+136%)",
   "buildtime: 2200 -> 3000 (+36%)",
   "weapon \"heat_ray\" tuned: areaofeffect=30, reloadtime=0.25",
   "tooltip: \"High energy draw, low damage per shot, very high fire rate. Weak against single tough targets, excellent DPS against swarms of small units.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "legsupportrelay",
  "baseId": "legnanotc",
  "name": "Support Relay",
  "baseIcon": "legnanotc.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 560 -> 2600 (+364%)",
   "metalcost: 230 -> 1400 (+509%)",
   "energycost: 3200 -> 14000 (+338%)",
   "buildtime: 5300 -> 12000 (+126%)",
   "tooltip: \"Long-range assist & repair turret with a much larger radius than the standard construction turret.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "leginc_heavy",
  "baseId": "leginc",
  "name": "The Beamer",
  "baseIcon": "leginc.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 9000 -> 7600 (-16%)",
   "metalcost: 2300 -> 2100 (-9%)",
   "energycost: 46000 -> 29000 (-37%)",
   "buildtime: 69700 -> 46000 (-34%)",
   "speed: 24 -> 26 (+8%)",
   "weapon \"heatraylarge\" tuned: range=725, reloadtime=3.4, beamtime=0.3",
   "tooltip: \"Slow, heavy assault unit. Single laser weapon: high damage, slow fire rate.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "legdepawner",
  "baseId": "legflak",
  "name": "The Depawner",
  "baseIcon": "legflak.png",
  "baseFaction": "Legion",
  "changes": [
   "health: 1750 -> 2300 (+31%)",
   "metalcost: 820 -> 1250 (+52%)",
   "energycost: 13000 -> 22000 (+69%)",
   "buildtime: 19000 -> 26000 (+37%)",
   "weapon \"leg_t2_microflak\" tuned: range=1050, reloadtime=0.35",
   "tooltip: \"Anti-air turret specialized against enemy drone-carrier/spawner aircraft -- hits VTOL targets much harder than a standard flak tower, killing carriers before they can deploy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "infinitybox",
  "baseId": "lootboxplatinum",
  "name": "Infinity Box",
  "baseIcon": "lootboxes/lootboxplatinum.png",
  "baseFaction": "Lootboxes",
  "changes": [
   "health: 67000 -> 22000 (-67%)",
   "metalcost: 2500 -> 119000 (+4660%)",
   "energycost: 25000 -> 600000 (+2300%)",
   "buildtime: 1000 -> 2500000 (+249900%)",
   "sightdistance: undefined -> 273",
   "metalstorage: undefined -> 600",
   "energystorage: undefined -> 80000",
   "tooltip: \"Oww come on, what´s in the box?! Produces energy and metal\""
  ],
  "sourceFile": "2026-04-09_20-58-52-557_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "portfus",
  "baseId": "lootboxsilver",
  "name": "Pocket Fusion Reactor",
  "baseIcon": "lootboxes/lootboxsilver.png",
  "baseFaction": "Lootboxes",
  "changes": [
   "health: 44500 -> 7000 (-84%)",
   "metalcost: 750 -> 3700 (+393%)",
   "energycost: 25000 -> 22000 (-12%)",
   "buildtime: 1000 -> 58000 (+5700%)",
   "sightdistance: undefined -> 273",
   "energystorage: undefined -> 2000",
   "tooltip: \"You can almost put it in your Pocket! Produces 1100 energy\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "portafus",
  "baseId": "lootboxgold",
  "name": "Portable Advanced Fusion Reactor",
  "baseIcon": "lootboxes/lootboxgold.png",
  "baseFaction": "Lootboxes",
  "changes": [
   "health: 56000 -> 12000 (-79%)",
   "metalcost: 1500 -> 10900 (+627%)",
   "energycost: 25000 -> 53000 (+112%)",
   "buildtime: 1000 -> 265000 (+26400%)",
   "sightdistance: undefined -> 273",
   "energystorage: undefined -> 7000",
   "tooltip: \"Portable, affordable, explosive! Produces 3300 energy\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "raptorbioreactor",
  "baseId": "lootboxgold",
  "name": "Raptor Bio-Reactor",
  "baseIcon": "lootboxes/lootboxgold.png",
  "baseFaction": "Lootboxes",
  "changes": [
   "health: 56000 -> 11000 (-80%)",
   "metalcost: 1500 -> 9800 (+553%)",
   "energycost: 25000 -> 48000 (+92%)",
   "buildtime: 1000 -> 240000 (+23900%)",
   "sightdistance: undefined -> 273",
   "energystorage: undefined -> 6000",
   "tooltip: \"Salvaged Raptor bio-tech energy building. Produces 2800 energy.\""
  ],
  "sourceFile": "2026-08-15_04-47-16-405_Ancient Bastion Remake 0.5_2026.07.04.tweakdefs.lua"
 },
 {
  "id": "birdangler",
  "baseId": "raptor_turret_antiair_t3_v1",
  "name": "Bird Angler",
  "baseIcon": "raptors/raptor_turretl_antiair.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 11100 -> 2230 (-80%)",
   "metalcost: 240 -> 2900 (+1108%)",
   "energycost: 6000 -> 65000 (+983%)",
   "buildtime: 5200 -> 19000 (+265%)",
   "weapon \"weapon\" tuned: reloadtime=3.6, cameraShake=700, range=3200, flighttime=8, name=\"Deadly Defensive Spores\"",
   "tooltip: \"Heavy long range Anti Air Turret\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "birdofprey",
  "baseId": "raptor_air_fighter_basic_t4_v1",
  "name": "Bird of Prey",
  "baseIcon": "raptors/raptorw2.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 1000 -> 930 (-7%)",
   "metalcost: 72 -> 460 (+539%)",
   "energycost: 2200 -> 15000 (+582%)",
   "buildtime: 1950 -> 19000 (+874%)",
   "weapon \"weapon\" tuned: reloadtime=0.7",
   "tooltip: \"Khrathm... no, not that one! Air Fighter\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "grenadier",
  "baseId": "raptorartillery",
  "name": "Grenadier Beetle",
  "baseIcon": "raptors/raptorr1.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 2000 -> 3200 (+60%)",
   "metalcost: 396 -> 1800 (+355%)",
   "energycost: 12320 -> 33500 (+172%)",
   "weapon \"goolauncher\" tuned: accuracy=280, reloadtime=7, range=1350, impulsefactor=2.4, intensity=28",
   "tooltip: \"Grenadier Beetle\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "overseer",
  "baseId": "raptorh5",
  "name": "Raptor Overseer",
  "baseIcon": "raptors/raptorh5.png",
  "baseFaction": "Raptors",
  "changes": [
   "metalcost: 251 -> 1850 (+637%)",
   "energycost: 5201 -> 39500 (+659%)",
   "buildtime: 18000 -> 29000 (+61%)",
   "sightdistance: undefined -> 800",
   "weapon \"weapon\" tuned: reloadtime=0.5, range=400",
   "tooltip: \"Raptor Overseer\""
  ],
  "sourceFile": "2026-04-21_17-22-21-832_Ancient Vault v1.4_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "regurgitator",
  "baseId": "raptor_air_gunship_acid_t2_v1",
  "name": "Regurgitator",
  "baseIcon": "raptors/raptorf1.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 350 -> 780 (+123%)",
   "metalcost: 212 -> 820 (+287%)",
   "energycost: 4550 -> 35000 (+669%)",
   "buildtime: 9375 -> 24000 (+156%)",
   "weapon \"acidspit\" tuned: burst=2, burstrate=0.5, name=\"Regurgitation\"",
   "tooltip: \"Sprays Acid on enemies\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "slinger",
  "baseId": "raptor_turret_basic_t3_v1",
  "name": "Slinger",
  "baseIcon": "raptors/raptor_turretl.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 11100 -> 4230 (-62%)",
   "metalcost: 240 -> 2100 (+775%)",
   "energycost: 6000 -> 39000 (+550%)",
   "buildtime: 5200 -> 47000 (+804%)",
   "weapon \"weapon\" tuned: accuracy=768, reloadtime=5.5, areaofeffect=256, range=1850, name=\"GOOLAUNCHER\", sprayangle=768",
   "tooltip: \"Launches big Projecitels over greater distance\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "spitter",
  "baseId": "raptor_turret_basic_t2_v1",
  "name": "Spitter",
  "baseIcon": "raptors/raptor_turrets.png",
  "baseFaction": "Raptors",
  "changes": [
   "health: 1670 -> 2230 (+34%)",
   "metalcost: 120 -> 870 (+625%)",
   "energycost: 3000 -> 19000 (+533%)",
   "buildtime: 2700 -> 19000 (+604%)",
   "weapon \"weapon\" tuned: reloadtime=2.1, areaofeffect=192, range=850, name=\"GOOLAUNCHER\", sprayangle=512",
   "tooltip: \"Launches AoE Projectiles\""
  ],
  "sourceFile": "2026-04-13_17-17-41-893_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "corthermitet3",
  "baseId": "corthermite",
  "name": "Core Melter",
  "baseIcon": "corthermite.png",
  "baseFaction": "Scavengers",
  "changes": [
   "health: 15000 -> 38000 (+153%)",
   "metalcost: 3500 -> 9100 (+160%)",
   "energycost: 60000 -> 140000 (+133%)",
   "buildtime: 188000 -> 131000 (-30%)",
   "speed: 42.3 -> 52 (+23%)",
   "mass: undefined -> 210000",
   "weapon \"thermite_laser\" tuned: areaofeffect=96, craterareaofeffect=96, energypershot=550, range=960, reloadtime=2.2, thickness=7",
   "weapon \"tmaw\" tuned: accuracy=700, areaofeffect=128, range=450, reloadtime=0.39996, weaponvelocity=600",
   "tooltip: \"Experimental Heat Ray Heavy Spider\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "jaeger",
  "baseId": "corcomboss",
  "name": "Jaeger Mk I",
  "baseIcon": "scavengers/corcomboss.png",
  "baseFaction": "Scavengers",
  "changes": [
   "health: 300000 -> 1800000 (+500%)",
   "metalcost: 300000 -> 409000 (+36%)",
   "energycost: 3000000 -> 14000000 (+367%)",
   "buildtime: 300000 -> 4100000 (+1267%)",
   "speed: 15 -> 46 (+207%)",
   "mass: undefined -> 810000",
   "weapon \"corcomlaserboss\" tuned: areaofeffect=64, corethickness=0.3, ergypershot=1000, thickness=24",
   "weapon \"corcomsealaserboss\" tuned: areaofeffect=48, corethickness=0.3, energypershot=1000, thickness=24",
   "weapon \"disintegratorxl\" tuned: reloadtime=2.4, energypershot=70000",
   "weapon \"melee\" tuned: areaofeffect=180, avoidfeature=0, avoidfriendly=0, camerashake=0, collidefriendly=0, craterboost=0",
   "tooltip: \"Experimental Hunter Killer\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "overcom",
  "baseId": "armcomboss",
  "name": "Metal OverCommander",
  "baseIcon": "scavengers/armcomboss.png",
  "baseFaction": "Scavengers",
  "changes": [
   "health: 2800000 -> 1800000 (-36%)",
   "metalcost: 10000000 -> 480000 (-95%)",
   "energycost: 10000000 -> 14000000 (+40%)",
   "buildtime: 750000000000 -> 4100000 (-100%)",
   "speed: 15 -> 35 (+133%)",
   "weapon \"emplightning\" tuned: areaofeffect=48, avoidfeature=false, beamttl=1, burst=10, burstrate=0.03333, craterareaofeffect=0",
   "weapon \"armcomsealaserboss\" tuned: range=1050, energypershot=1000",
   "weapon \"disintegratorxl\" tuned: avoidfriendly=true, weaponvelocity=450, gravityaffected=false, energypershot=200000, reloadtime=1.5",
   "tooltip: \"When hope was lost, he kept building\""
  ],
  "sourceFile": "2026-04-28_11-04-39-422_Ancient Bastion Remake 0.5_2025.06.19.tweakdefs.lua"
 },
 {
  "id": "swarmship",
  "baseId": "cordronecarryair",
  "name": "Swarmship",
  "baseIcon": null,
  "baseFaction": "Scavengers",
  "changes": [
   "health: 3500 -> 8500 (+143%)",
   "metalcost: 1700 -> 7900 (+365%)",
   "energycost: 17000 -> 160000 (+841%)",
   "buildtime: 24000 -> 84000 (+250%)",
   "speed: 34.5 -> 40 (+16%)",
   "tooltip: \"Anti Air Drone Carrier\""
  ],
  "sourceFile": "2026-03-27_16-45-54-942_The Rock 3.0.1_2025.06.19.tweakdefs.lua"
 }
];
--AMBR-1 XL
local u = UnitDefs

local map = {
	B="buildtime", E="energycost", M="metalcost", WK="workertime", H="health",
	P="power", S="speed", SD="sightdistance", SD2="sonardistance", ASD="airsightdistance",
	F="mass", MAXA="maxacc", MAXD="maxdec", TIP="turninplaceanglelimit",
	CVO="collisionvolumeoffsets", CVS="collisionvolumescales", CVT="collisionvolumetype",
	AH="autoheal", TC="transportcapacity", TT="tracktype", TW="trackwidth",
	XPLD="explodeas", SELFD="selfdestructas", FD="featuredefs", IAH="idleautoheal",
	IT="idletime", TR="turnrate", FBM="flankingbonusmax", EM="energymake",
	EU="energyupkeep", SDCD="selfdestructcountdown", CBT="cantbetransported",
	AOE="areaofeffect", EDGE="edgeeffectiveness", MVACC="movingaccuracy",
	SSV="soundstartvolume", SHV="soundhitvolume", BTIME="beamtime", RT="reloadtime",
	R="range", WV="weaponvelocity", MG="mygravity", SA="sprayangle",
	AF="avoidfeature", BB="beamburst", BUR="burst", BTTL="beamttl", BDECAY="beamdecay",
	BURR="burstrate", STRIG="soundtrigger", TOL="tolerance", WB="waterbounce",
	BEG="bounceExplosionGenerator",
	NB="numbounce", WACC="weaponacceleration", WPT="weapontimer", LL="leadlimit",
	EPS="energypershot", N="name", SS="soundstart", SH="soundhit", EG="explosiongenerator",
	IMPF="impulsefactor", IMPB="impulseboost", FT="flighttime", WOB="wobble",
	TH="trajectoryheight", TRACKS="tracks", EAWE="ownerExpAccWeight",
	CF="collidefriendly", THICK="thickness", SIZE="size", DANCE="dance",
	SZD="sizedecay", ALPH="alphadecay", STG="stages", SEP="separation", NG="nogap",
	SV="startvelocity", PR="projectiles", CST="camerashake", INT="intensity",
	TX1="texture1", TX2="texture2", DUR="duration", CM="cratermult",
	RGB1="rgbcolor", RGB2="rgbcolor2", CEG="cegtag", CD="cluster_def", CN="cluster_number",
	GB="groundbounce", BR="bouncerebound", BS="bounceslip", D="damage",
	DEF="default", VTOL="vtol", SUBS="subs", LBO="lboats", HBO="hvyboats",
	CB="crawlingbombs", CMDRS="commanders", ACC="accuracy", CP="customparams",
	RXPS="rangexpscale", PM="paralyzemultiplier", NOEX="noexplode"
}

local function apply(t, s)
	for k, v in pairs(s) do
		local mk = map[k] or k
		if type(v) == "table" then
			if not t[mk] then t[mk] = {} end
			apply(t[mk], v)
		else
			t[mk] = v
		end
	end
end

local LGB = "custom:genericshellexplosion-large-bomb"
local HP_Defs = {B=7500, E=4000, M=650, WK=175}
local FHP_Defs = {B=7500, E=3000, M=675, WK=175}

local c1 = {
corhp=HP_Defs,
corfhp=FHP_Defs,
armhp=HP_Defs,
armfhp=FHP_Defs,
leghp=HP_Defs,
legfhp=FHP_Defs,
armalab={H=5950,B=32400},
armavp={H=8050,B=36000},
legalab={H=6500,E=14500,B=34800},
legavp={H=7300,E=15500,B=38000},
coralab={H=6800,B=33600},
coravp={H=7100,B=37000},
armasy={H=6750,B=32000},
corasy={H=7200,B=31400},
legadvshipyard={H=7000,B=32800,M=3000,E=9400},
legsplab={H=2100,B=11900,M=1500,E=4500},
armaap={H=4750,B=41800},
coraap={H=4900,B=41400},
legaap={H=4650,B=44600,E=28500},
armshltx={B=245600,WK=1200},
armshltxuw={B=245600,WK=1200},
corgant={B=269200,WK=1200},
corgantuw={B=269200,WK=1200},
leggant={M=8300,E=61000,H=17200,B=257400,WK=1200},
leggantuw={M=8250,E=61500,H=17200,B=257400,WK=1200},
corak={F=25,H=270,w={gator_laser={MVACC=970,SSV=0.5,D={VTOL=7.4}}}},
armpw={F=30,H=335,E=960},
armfav={E=390,MAXD=0.1666,TIP=135,F=17,CVO="0 -1 0",CVS="19 9.5 25",w={arm_laser={R=175,BTIME=0.12,RT=0.54,D={DEF=24,VTOL=12}}}},
corfav={MAXD=0.2,TIP=135,F=15,CVS="16 14.5 26",w={cor_laser={R=165,RT=0.67,D={DEF=35,VTOL=10.5}}}},
armart={w={tawf113_weapon={R=690,WV=430,MG=0.24}}},
corwolv={w={corwolv_gun={EDGE=0.3,WV=465,MG=0.2}}},
corpyro={w={flamethrower={R=195,SA=490}}},
armsh={P=83,SD=577,w={armsh_weapon={BTIME=0.35,RT=1.27,D={DEF=101,VTOL=40.4}}}},
corsh={P=75,S=107.2,SD=541,w={armsh_weapon={AF=false,BB=true,BUR=5,BTTL=8,BDECAY=0.6,BURR=0.35,R=215,RT=2.5,STRIG=false,TOL=1000,WV=700,D={DEF=40,VTOL=10}}}},
armanac={P=200,w={armanac_weapon={SA=850,RT=2,WB=true,BS=0.45,BR=0.55,BEG="custom:laserhit-medium",NB=2,D={DEF=170}}}},
corsnap={P=220,w={armanac_weapon={SA=360,WV=310,RT=1.55,R=390,D={DEF=138}}}},
armmh={w={armmh_weapon={R=730,TR=17000,WACC=130}}},
legmh={w={legmh_weapon={R=715,TR=13000,WACC=100,AOE=96,WPT=2.5}}},
coresupp={w={laser={R=260,RT=0.77}}},
corpt={w={cortruck_aa={BUR=3,BURR=0.18,DANCE=40,RT=3,D={VTOL=70}},cortruck_missile={BUR=3,BURR=0.18,DANCE=30,FT=0.9,WOB=1700,TR=650,SA=1800,TH=0.17,TRACKS=false,R=575,RT=3,D={DEF=40}}}},
armlship={AH=21.5},
corfship={AH=21.5,w={aamissile={BUR=3,BURR=0.18,DANCE=40,RT=3,D={VTOL=70}}}},
corvamp={w={corvtol_advmissile={BUR=3,BURR=0.15,RT=1.95,D={VTOL=260,STRIG=true}}}},
armhawk={w={armvtol_advmissile={BUR=2,BURR=0.2,D={VTOL=305,STRIG=true}}}},
corseah={S=216,M=460,H=3280,SD=391,TC=8},
armllt={B=3790,M=115,H=820,SD=466},
corllt={B=4080,M=125,H=950,SD=466},
leglht={B=3170,M=95,E=850,H=675,w={heat_ray={EPS=35}}},
armrl={B=2625,M=100,H=650},
corrl={B=3025,M=110,H=800},
legrl={B=2825,M=105,E=950,H=725},
armfrt={B=3150,M=120,E=1150,H=690},
corfrt={B=3630,M=130,H=860},
corbats={TR=127,B=61800,w={cor_bats={AOE=202,EDGE=0.4,MVACC=800,D={SUBS=90}}}},
armbats={TR=130,B=60000,w={arm_bats={AOE=180,EDGE=0.35,MVACC=700,D={SUBS=60}}}},
corhal={MAXA=0.021,MAXD=0.021},
legcar={B=11500,S=53.3,w={shot={AOE=23,SSV=2.1,RT=1.9,EAWE=0,D={DEF=47.5,LBO=57}}}},
leglob={P=46,SD=370,S=55.25,w={close_plasma={SH="xplomed1",EG="custom:genericshellexplosion-tiny"}}},
legscout={TIP=180,MAXA=0.15,MAXD=0.1,TR=1028,M=22,E=360,P=12,w={gun={R=150.1,CF=false,EDGE=0.85}}},
leghades={SD=265,H=360,S=104.4,MAXA=0.0728,MAXD=0.09,TR=510,TIP=135,FD={dead={CVS="16 5 23"}},B=1300,P=40,M=55,E=700,w={gauss={AOE=44,WV=440,D={VTOL=41.25}}}},
legsh={P=35,M=50,w={heat_ray={LL=3,EPS=2,D={VTOL=20}}}},
leggob={P=24,F=20,w={semiauto={N="Light Autocannons",MVACC=1700}}},
legner={P=155,S=80.2,SD=505,w={legner_weapon={RT=0.8,R=355,SA=470,D={DEF=55.5}}}},
legaskirmtank={H=2400,SD=408,CVS="30 15 34",FD={dead={CVS="40 13 44"}},S=70.1,P=275,IAH=13.5,IT=900,w={legmgplasma={R=590,MG=0.12,EDGE=0.3}}},
legmrv={MAXD=0.1,F=175,M=255,P=210,CVO="0 -3 -1",CVS="29 10 34",CVT="Box",w={quickshot_cannon={AOE=80,WV=530,D={DEF=130,VTOL=71.5}}},weapons={[1]={onlytargetcategory="NOTSUB"}}},
legmed={H=5500,B=37700,TT="armbull_tracks",TW=53,TR=144,w={legmed_missile={IMPF=1}}},
legvcarry={F=1300,H=4800,B=17500,E=10000,TW=72,MAXA=0.0045,MAXD=0.006,TR=165,XPLD="largeBuildingExplosionGeneric",SELFD="largeBuildingExplosionGeneric",CVS="55 43 67",FD={heap={object="Units/cor3X3A.s3o"}}},
legdrone={SD=375,w={semiauto={N="Light Autocannons",SS="mgun2",THICK=1.5,BURR=0.1,BUR=2,RT=1.2}}},
armlun={H=6600,P=1000,w={cannon={ACC=200,EDGE=0.6,N="Heavy Fragmentation Gauss Launcher",R=555,RT=1.45,SS="cannhvy1",SH="xplosml2",EG="custom:genericshellexplosion-large-bomb",D={DEF=305}},depthcharge={D={CB=750}}}},
corsok={H=5750,P=800,w={corsok_laser={SSV=17.5,AOE=70,EDGE=0.15},depthcharge={D={CB=750}}}},
armfus={P=6000},
armckfus={P=6100,M=3450,E=33000},
armafus={P=30000,E=91000,B=442500,IAH=17},
armuwfus={P=11500,E=51000,EM=1175,M=4250,FBM=3,CVS="91 57 59",CVT="Box"},
corfus={P=6400},
corafus={P=30000,E=76000,B=479200,IAH=17},
coruwfus={P=12250,E=56500,EM=1275,M=4600,FBM=3},
legfus={P=6800},
legafus={P=33000,E=99500,B=510500,IAH=17,H=8800},
cormakr={P=175},
corfmkr={P=175},
armmakr={P=175},
armfmkr={P=175},
legeconv={P=175},
legfeconv={E=1150,P=175},
armpincer={E=2250,SD=305,SD2=0,w={arm_pincer_gauss={EG="custom:genericshellexplosion-small-t2",AOE=77,EDGE=0.25,WV=330,R=275,RT=1.65,D={DEF=145,VTOL=29}}}},
corgarp={E=2500,SD=318,SD2=0,M=190,H=1150,w={arm_pincer_gauss={AOE=30,RT=0.9,D={DEF=88,VTOL=31}}}},
legamphtank={B=3950,SD=342,M=215,E=2750,S=73.7,H=1535,IT=600,IAH=10.5,CP={PM=0.2},w={leg_amph_gauss={R=295,AOE=30,RT=1.45}}},
corparrow={SD=385,E=29000,P=925,B=39900,w={cor_parrow={EDGE=0.8,SIZE=3.5,IMPF=1.2,IMPB=100,SH="xplomed2xs",EG="custom:genericshellexplosion-large",WV=390,MG=0.2,SZD=0.1,ALPH=0.05,STG=10,SEP=2,NG=false}}},
armcroc={FBM=1.2,CVS="40 38 54",CVO="0 6 -0.5",CVT="Ellipsoid",MAXA=0.0145,MAXD=0.0172,B=31500,P=425,H=6000,F=1130,SD=372,ASD=404,w={arm_triton={WV=285,MG=0.16},armcl_missile={RT=4,SV=140,WACC=110,FT=3.7,AOE=130,N="Light AoE Anti-Air Missile Launcher",EDGE=0.5,SH="xplosml1",EG="custom:genericshellexplosion-medium-air",D={VTOL=160}}}},
corexp={P=80,w={hllt_bottom={R=405,RT=0.333}}},
cormexp={EU=40,P=1350},
corhlt={E=4650,H=3060,P=290},
armhlt={P=300},
corfhlt={P=305},
armfhlt={M=440,H=3750,P=305},
armclaw={P=180},
cormaw={P=195},
legdtr={P=165,SD=416,M=360,H=1880,E=1650},
legmg={P=275,CP={RXPS=0.3},w={armmg_weapon={EAWE=0.75,R=585,IMPB=15,D={VTOL=13.5}}}},
corcrwh={w={dragon_missileh={AOE=94}}},
legfort={H=14400,XPLD="hugeexplosiongeneric",SELFD="hugeexplosiongenericSelfD",w={semiauto={RT=0.27,BUR=1,THICK=3,N="Autocannons",SS="rocklit3",D={DEF=35.55}},plasma={N="Long-Range Rapid a2g Cluster Plasma Cannons",CEG="ministarfire",EG="custom:ministarfire-explosion",RGB1="0.7 0.7 1.0",SA=625,RT=1.34,WV=250,MG=0.065,D={DEF=100},CP={CD="cluster_munition",CN=2}},cluster_munition={EG="custom:ministarfire-explosion",CEG="ministarfire",R=40,AOE=80,EDGE=0.3,SH="xplomed4",SHW="splsmed",IMPF=0.5,RGB1="0.7 0.7 1.0",D={DEF=70,SUBS=20,VTOL=20}},aa_missiles={AOE=128}}},
armfast={M=190,E=4600,B=3960,w={arm_fast={D={DEF=15,VTOL=3}}}},
armamph={w={armamph_weapon1={SS="lasrfir3scav",RGB1="1 0 0.3",EPS=10,D={HBO=100,CB=160}}}},
coramph={w={coramph_weapon1={R=300,TRACKS=true,TR=16000,GB=true,NB=3,BR=0.35,BS=0.45},coramph_weapon2={EG="custom:laserhit-medium-aqua",RGB1="0 1 0.65",D={CB=300}}}},
armfboy={E=11000,H=7300,B=35000,w={arm_fatboy_notalaser={CEG="unitsmoke",SIZE=5,AOE=240,EDGE=0.85,D={HBO=1000}}}},
armguard={M=1125,w={plasma={R=1190,D={HBO=450}},plasma_high={IMPF=0.4,IMPB=265,R=1190,D={HBO=450}}}},
corpun={SD=430,H=3400,w={plasma={D={HBO=525}},plasma_high={IMPF=0.4,IMPB=280,D={HBO=525}}}},
armamb={E=18500,M=2400,w={armamb_gun={SS="cannhvy3",SSV=29,SH="xplomed3",EG=LGB,RT=4.1,AOE=197,EDGE=0.35,IMPB=305,CM=0.08,D={DEF=475,HBO=712.5}},armamb_gun_high={SS="cannhvy3",SSV=24,SH="xplomed3",EG=LGB,RT=4.1,AOE=197,EDGE=0.35,IMPB=505,CM=0.08,D={DEF=475,HBO=712.5}}}},
cortoast={w={cortoast_gun={SS="cannhvy3",SSV=29,SH="xplomed3",EG=LGB,RT=4.6,AOE=213,IMPB=320,CM=0.08,D={DEF=555,LBO=555,HBO=832.5}},cortoast_gun_high={SS="cannhvy3",SSV=29,SH="xplomed3",EG=LGB,RT=4.6,AOE=213,IMPB=520,CM=0.08,D={DEF=555,LBO=555,HBO=832.5}}}},
corblackhy={TR=99,F=15500,CP={PM=0.5},w={heavyplasma={BURR=0.3,RT=6.1,ACC=1400,SA=950,AOE=256,EDGE=0.3,WV=495,MG=0.095,D={DEF=800,SUBS=120}},ferret_missile={RT=1,AOE=94,R=1040,D={VTOL=88}}}},
armepoch={TR=105,F=15000,CP={PM=0.5},w={heavyplasma={BURR=0.3,RT=4.5,ACC=1300,SA=650,AOE=192,WV=480,MG=0.095,D={DEF=660,SUBS=99}},ferret_missile={AOE=80,R=1070}}},
cormship={TR=260,SD=360,H=4080,B=29000,XPLD="hugeexplosiongeneric",SELFD="hugeexplosiongenericSelfd",w={missile={RT=0.87,D={VTOL=85}},rocket={RT=12,R=1640},rocket_split={EDGE=0.4,D={HBO=525}}}},
armmship={TR=270,M=1920,E=10500,B=28400,XPLD="hugeexplosiongeneric",SELFD="hugeexplosiongenericSelfd",w={missile={RT=1.7},rocket={RT=9,R=1660},rocket_split={EDGE=0.55,D={HBO=525}}}},
armcrus={TR=220,M=1190,E=13300,w={gauss={RT=1.37,MVACC=1300},laser={RGB1="1 1 0.3",RGB2="1 0.55 0.3",N="Medium close-quarters g2g lasers",BTIME=0.33,RT=0.85,EPS=45,D={DEF=215,VTOL=86}},depthcharge={D={CB=750}}}},
corcrus={TR=215,M=1240,E=15800,B=25400,w={cor_crus={EPS=85,D={DEF=240}},advdepthcharge={D={CB=750}}}},
armaas={w={ga2={AOE=80,R=1070,RT=1.7,D={VTOL=150}}}},
corarch={H=4200,M=1080,E=12800,B=22000,w={ga2={AOE=94,R=1040,RT=1,D={VTOL=88}}}},
armroy={w={depthcharge={R=325,D={CB=750}},plasma={AOE=57,MVACC=1300}}},
corroy={w={depthcharge={R=325,D={CB=750}},plasma={AOE=75,MVACC=1600}}},
cortermite={M=600,E=9000,S=48.3,P=380,w={cor_termite_laser={RGB1="1 0.44 0.1",RGB2="1 0.3 0.1",laserflaresize=7,THICK=3.3,N="High Energy Heatray",SS="heatray1s",RT=1.17,R=360,AOE=58,TOL=12000,D={DEF=420}}}},
}

for name, ch in pairs(c1) do
	local ud = u[name]
	if ud then
		apply(ud, ch)
		if ch.w then
			if not ud.weapondefs then ud.weapondefs = {} end
			for wn, wch in pairs(ch.w) do
				if not ud.weapondefs[wn] then ud.weapondefs[wn] = {} end
				apply(ud.weapondefs[wn], wch)
			end
		end
	end
end--AMBR-2 XL
local u = UnitDefs

local map = {
	B="buildtime", E="energycost", M="metalcost", WK="workertime", H="health",
	P="power", S="speed", SD="sightdistance", SD2="sonardistance", ASD="airsightdistance",
	MASS="mass", MAXA="maxacc", MAXD="maxdec", TIP="turninplaceanglelimit",
	CVO="collisionvolumeoffsets", CVS="collisionvolumescales", CVT="collisionvolumetype",
	AH="autoheal", TC="transportcapacity", TT="tracktype", TW="trackwidth",
	XPLD="explodeas", SELFD="selfdestructas", FD="featuredefs", IAH="idleautoheal",
	IT="idletime", TR="turnrate", FBM="flankingbonusmax", EM="energymake",
	EU="energyupkeep", SDCD="selfdestructcountdown", CBT="cantbetransported",
	AOE="areaofeffect", EDGE="edgeeffectiveness", MVACC="movingaccuracy",
	SSV="soundstartvolume", SHV="soundhitvolume", BTIME="beamtime", RT="reloadtime",
	R="range", WV="weaponvelocity", MG="mygravity", SA="sprayangle",
	AF="avoidfeature", BB="beamburst", BUR="burst", BTTL="beamttl", BDECAY="beamdecay",
	BURR="burstrate", STRIG="soundtrigger", TOL="tolerance", WB="waterbounce",
	BSLIP="bounceslip", BREB="bouncerebound", BEG="bounceExplosionGenerator",
	NB="numbounce", WACC="weaponacceleration", WPT="weapontimer", LL="leadlimit",
	EPS="energypershot", N="name", SS="soundstart", SH="soundhit", EG="explosiongenerator",
	IMPF="impulsefactor", IMPB="impulseboost", FT="flighttime", WOB="wobble",
	TH="trajectoryheight", TRACKS="tracks", EAWE="ownerExpAccWeight",
	CF="collidefriendly", THICK="thickness", SIZE="size", DANCE="dance",
	SZD="sizedecay", ALPH="alphadecay", STG="stages", SEP="separation", NG="nogap",
	SV="startvelocity", PR="projectiles", CST="camerashake", INT="intensity",
	TX1="texture1", TX2="texture2", DUR="duration", CM="cratermult",
	RGB1="rgbcolor", RGB2="rgbcolor2", CEG="cegtag", CD="cluster_def", CN="cluster_number",
	GB="groundbounce", BR="bouncerebound", BS="bounceslip", D="damage",
	DEF="default", VTOL="vtol", SUBS="subs", LBO="lboats", HBO="hvyboats",
	CB="crawlingbombs", CMDRS="commanders", ACC="accuracy", CP="customparams",
	RXPS="rangexpscale", PM="paralyzemultiplier", NOEX="noexplode",
	STOCK="stockpile", STIME="stockpiletime", SLIMIT="stockpilelimit",
	PTIME="paralyzetime", CRALT="cruisealtitude", CLKCOST="cloakcost",
	MCDIST="mincloakdistance", RDJ="radardistancejam", ESTORE="energystorage",
	WPS="weapons", OTC="onlytargetcategory", MAD="maxangledif",
	MSWPR="minesweeper", REP="repairspeed", MINES="mines", FBMIN="flankingBonusMin",
	CAG="canattackground", UPCV="usepiececollisionvolumes", TKS="trackstrength", LFS="laserflaresize"
}

local function apply(t, s)
	for k, v in pairs(s) do
		local mk = map[k] or k
		if type(v) == "table" then
			if not t[mk] then t[mk] = {} end
			apply(t[mk], v)
		else
			t[mk] = v
		end
	end
end

local c2 = {
corjugg={w={juggernaut_bottom={EG="custom:laserhit-medium-yellow",RGB1="1 0.65 0",RGB2="0.8 0 0",BTIME=0.21,RT=0.5,N="Heavy Rapid Heat Ray",D={DEF=180}},juggernaut_fire={N="Large Disintegrator",RT=5.1,WV=485,D={DEF=999,CMDRS=500}},juggernaut_top={EG="custom:laserhit-medium-yellow",RGB1="1 0.48 0",RGB2="0.8 0 0",BTIME=0.27,RT=0.527,N="Heavy Rapid Heat Ray",D={DEF=195}}}},
leegmech={CBT=true,B=266600,MASS=9000,SDCD=7.5,w={shotgun={PR=16,IMPF=1.8,IMPB=100,AOE=59,EDGE=0.15,CEG="arty-medium",N="Super Shotgun",WV=810,SA=2360,MG=0.75},railgunt3={N="Overcharged Railgun",R=770,RGB1="0.22 0.27 0.47",AOE=240,NOEX=true,RT=4.5,EPS=5000,THICK=4.5,SSV=52,SHV=26,SH="rflrpc3",WV=2180,CST=6000,IMPF=1.7,IMPB=2000,D={CMDRS=400,DEF=1325}},topgunaa={N="Anti-Air Autocannon",WV=1670,THICK=6,INT=0.95,TX1="shot",TX2="empty",SS="rocklit3",SH="flakhit2",AOE=55,D={DEF=0,VTOL=75}},aimhull={FT=2.2,BUR=12,burnblow=false,AOE=160},frontgun={N="Rapid Autocannons",SS="minigun2",TX1="shot",TX2="empty",THICK=2.25,DUR=0.12}}},
legpede={CBT=true,S=54.5,MASS=4500},
armbull={S=65.1,w={arm_bull={EDGE=0.25,RT=1.2,EG="custom:genericshellexplosion-medium-aoe"}}},
armmanni={H=2950,w={atam={EPS=2000,D={DEF=2350}}}},
armanni={w={ata={EPS=7000}}},
cordoom={w={atadr={EPS=3200,R=990,RGB1="0 1 0.8"}}},
corkorg={S=33.6,w={corkorg_laser={CST=420,THICK=7,D={DEF=6075,VTOL=3645}}}},
armmav={P=400,IT=450,IAH=120,w={armmav_weapon={AOE=10,D={VTOL=80}}}},
correap={H=5000,w={cor_reap={AOE=57,RT=0.9,D={DEF=140}}},WPS={[1]={OTC="NOTSUB"}}},
corban={SD=570,P=600,B=24400,H=2750,w={banisher={D={CMDRS=600}}},WPS={[1]={MAD=270}}},
corcat={w={exp_heavyrocket={RT=15.5,AOE=133}}},
armgremlin={H=1000,w={armgremlin_gauss={EDGE=0.6,AOE=107,WV=360,MG=0.33,N="Close-quarters Fragmentation Gauss Cannon",heightBoostFactor=25,EG="custom:genericshellexplosion-medium-bomb",SH="bombssml1",RT=0.9,STOCK=true,STIME=5.8,CP={SLIMIT=4},D={VTOL=105,CMDRS=105}}}},
armfido={IT=900,w={bfido={WV=245,MG=0.095,AOE=84,EDGE=0.25,EG="custom:genericshellexplosion-medium"}}},
armjuno={M=410,XPLD="energystorage",FD={dead={H=1762}},w={juno_pulse={R=7900,D={DEF=5}}}},
corjuno={M=450,XPLD="energystorage",FD={dead={H=1850}},w={juno_pulse={R=7900,D={DEF=5}}}},
legotter={H=2250,B=7080,M=185,E=3850,S=44.15,ESTORE=125,WK=100},
armbeaver={H=1630,B=6550,ESTORE=125},
cormuskrat={H=2010,ESTORE=125},
corch={H=995,M=135,E=3600,WK=70},
armch={H=935,M=125,E=3150,WK=65},
legch={B=4690,H=1205,M=140,E=4950,WK=75},
armsy={E=1200},
corsy={E=1150},
legsy={E=1300},
leglab={M=480},
coracsub={E=8500,M=705,B=24750,H=1240},
corsala={SD=375,SD2=0,AH=11.5},
armlatnk={CP={PM=0.15}},
armzeus={CP={PM=0.3}},
cormando={P=390,REP=1000,XPLD="metalmaker",SELFD="metalmakerSelfd",SD2=90,CP={PM=0.15},w={commando_blaster={EG="custom:laserhit-large-red",TOL=12000,RGB1="0.85 0.3 0.2",WV=899,D={MINES=1}}},WPS={[1]={OTC="NOTSUB"}}},
corpship={w={plasma={WV=280,MG=0.095,D={DEF=92}}}},
corbw={P=150},
armdfly={P=750,TC=8},
armspid={P=600},
armstil={P=1500},
legrhapsis={w={burst_aa_missile={RT=1.1,D={VTOL=29.2}}}},
cormines={M=600,E=9000,S=48.3,P=380,w={cor_termite_laser={RGB1="1 0.44 0.1",RGB2="1 0.3 0.1",laserflaresize=7,THICK=3.3,N="High Energy Heatray",SS="heatray1s",RT=1.17,R=360,AOE=58,TOL=12000,D={DEF=420}}}},
armgmm={SELFD="flagshipExplosionSelfd"},
armageo={P=7200,M=1775,EM=1700},
corageo={P=7000,M=1700,EM=1600},
corbhmth={P=2200,w={corbhmth_weapon={R=1690,EPS=190}}},
legageo={B=59800,H=4400,M=1850,P=7400,EM=1800},
leganavaladvgeo={B=59800,H=4400,M=1850,P=7400,EM=1800},
leggeo={B=17700,H=2190,M=630,EM=400},
legrampart={B=75500},
leghive={H=1900},
legfhive={H=2100},
coruwageo={P=7000,M=1700,EM=1600},
armuwageo={P=7200,B=1775,EM=1700},
corgeo={EM=350},
armgeo={EM=350},
coruwgeo={EM=350},
armuwgeo={EM=350},
armlance={SD2=0,w={armair_torpedo={FT=3.3}}},
armawac={P=1000,SD2=375},
armsehak={S=249,P=500},
cortitan={SD2=0,w={armair_torpedo={FT=3.3}}},
corawac={P=1000,SD2=375},
corhunt={S=281,P=500,H=505},
coraak={P=470,SD=615,H=2025,w={botflak={AOE=198,RT=5.5,PR=2,R=680}}},
armaak={S=40.4,P=440,SD=640,H=1440,w={shortrangemissile={AOE=130,N="Heavy AoE Anti-Air Missile Launcher",EDGE=0.5,SH="xplosml1",EG="custom:genericshellexplosion-medium-air",RT=2.1,D={VTOL=300}}}},
corthud={TR=720,SD=389,H=1000,w={arm_ham={MVACC=1650,RT=1.8,WV=321,D={DEF=118,VTOL=24}}}},
corstorm={MAXA=0.081,MAXD=0.24,TR=850,FBM=2.4},
corraid={SD=311,w={arm_lightcannon={RT=1.35,D={DEF=111}}}},
armham={TR=850,H=900,w={arm_ham={RT=1.6}}},
armrock={MAXA=0.088,MAXD=0.26,TR=790,FBM=2.4,w={arm_bot_rocket={AOE=54,RT=4.2,WV=205,D={DEF=173}}}},
legbal={MAXA=0.077,MAXD=0.22,TR=705,H=950,FBM=2.4,w={leg_bot_rocket={SV=180,WV=180,CEG="missiletrailsmall"}}},
legcen={B=4500,E=2950,H=795,S=94.4,TR=1280,w={gauss={AOE=24,R=170,WV=390}}},
cormist={S=62,SD=466,P=145,w={cortruck_missile={FT=1.2,WOB=2300,TR=530,SA=1150,TH=0.1,CP={projectile_destruction_method="descend",overrangedistance=25}}}},
armsam={S=68,SD=470,H=715,P=140,w={armtruck_aa={BUR=2,BURR=1.666,STRIG=false,D={VTOL=80}},armtruck_missile={BUR=2,BURR=1.666,STRIG=false,FT=1.2,WOB=2450,TR=550,SA=1200,TH=0.1,CP={projectile_destruction_method="descend",overrangedistance=25},D={DEF=45}}}},
cornecro={P=350,E=1950},
armrectr={P=350,E=1800,H=215,B=2370},
armthor={MAXD=0.022,w={thunder={RT=2.8,CP={spark_forkdamage="0.333"},D={DEF=210}},emp={D={DEF=725}}}},
armmoho={EU=40,P=1200},
armuwmme={EU=40,P=1200},
cormoho={EU=40,M=660,P=1200},
coruwmme={EU=40,M=660,P=1200},
legmoho={EU=40,H=3350,E=8500,B=13600,P=1200},
armshockwave={M=1280,E=13250,AH=50,SD=855,H=5200,EU=40,w={hllt_bottom={PTIME=28,EDGE=0.75,D={VTOL=800}}}},
armmex={P=250,B=2800,H=257},
cormex={P=250,B=2970,E=600,H=288},
legmex={P=250,B=2710,E=550,H=241},
armmart={w={arm_artillery={MG=0.16,AOE=147,EDGE=0.35,EG="custom:genericshellexplosion-large"}},WPS={[1]={MAD=130}}},
cormart={w={cor_artillery={TOL=300,WV=329,AOE=173,R=840,EDGE=0.4}},WPS={[1]={MAD=130}}},
corhrk={TR=820,XPLD="largeExplosionGeneric",SELFD="largeExplosionGenericSelfd",w={corhrk_rocket={R=1160,AOE=95,EDGE=0.2,RT=8.6}}},
legmlv={SD=188,H=225,S=67.5,WK=45,CP={MSWPR=300},w={minesweep={AOE=136,WV=275,RGB1="0.2 0.6 0.2",R=260,D={DEF=35}}}},
armmlv={SD=263,H=310,CP={MSWPR=300},w={minesweep={AOE=124,R=260,D={DEF=35}}}},
cormlv={SD=216,CP={MSWPR=300},w={minesweep={AOE=96,R=260,D={DEF=35}}}},
legfig={CRALT=105,H=110,FBMIN=0.8},
legmos={H=390,w={cor_bot_rocket={STIME=2.4,CP={SLIMIT=8}}}},
armkam={WPS={[1]={OTC="NOTSUB"}}},
corseap={M=195,E=3900,H=750,S=228},
armseap={S=220},
armsaber={S=149},
corsb={E=8850},
corcut={S=135,H=1200},
corshiva={w={shiva_gun={AOE=120,SH="xplomed3",SS="cannhvy5",EG="custom:genericshellexplosion-large",RT=1.75,D={DEF=490}},shiva_rocket={N="FastRockets",TR=22000,WACC=190,WPT=1.2,RT=5.15,D={DEF=710}}}},
armjam={RDJ=500},
corspec={RDJ=400,H=365},
armjamt={B=6950,M=220,CLKCOST=25,MCDIST=145,RDJ=390},
corshroud={H=1290},
armzapper={H=190,S=164,SD=545,XPLD="flamethrower",SELFD="pyro",CP={unitgroup="emp",PM=0.3},w={bladewing_lyzer={D={CMDRS=2400}}}},
cortrem={MASS=1480,H=4000,w={tremor_spread_fire={EDGE=0.3,RT=0.4,AOE=132,D={DEF=240,VTOL=240,shields=120}}}},
corforge={w={flamethrower_ce={SA=2700,WV=300,RT=1.6,D={DEF=16.97}}}},
cortorch={E=4850,M=260,MAXD=0.06,TIP=180,H=885,FBM=1.2,w={flame_thrower={RT=0.5,SA=130}}},
armbotrail={M=14400,E=592000,w={arm_botrail={EPS=8880}}},
armannit3={w={ata={EPS=19000}}},
leggobt3={M=5000,E=100000},
legrail={M=260,E=4000,P=185,w={railgun={EPS=50,RT=8,D={DEF=240,CMDRS=120},AOE=90,IMPB=300,CP={nodecal=true}},aa_railgun={CAG=false,D={VTOL=360}}}},
leghelios={H=890,IT=900,w={heat_ray={BTIME=0.44,EPS=12}}},
leggat={SD=333,TR=244,S=45.4,B=6000,E=3000,UPCV=1,w={armmg_weapon={R=400,WV=921,D={VTOL=9}}}},
legbar={SD=382,TR=290,M=320,E=3600,B=5400,H=1670,w={clusternapalm={WV=185,MG=0.07,PR=3,RT=12.5,SA=2400,SIZE=5}}},
legstronghold={B=19950,E=10900,M=575,SD=514,TC=8,w={shotgun={SA=1400,EAWE=0}}},
legsrail={P=480,M=900,E=18000,w={railgunt2={MVACC=700,AOE=115,IMPB=900,CP={nodecal=true}}}},
leginc={E=56000,B=40000,S=24.4,CVO="0 -1 0",CVS="50 30 55",XPLD="crawl_blast",SELFD="crawl_blast",FBMIN=0.8,FBM=2.4,upright=false,w={heatraylarge={LFS=8,THICK=6,BTTL=4,BDECAY=0.5,AOE=104,EDGE=0.35}}},
leginfestor={CVT="Ellipsoid",CVS="30 26 28",M=235,B=3000,AH=3,REP=300,BD=100,w={festorbeam={LL=3,RT=3,THICK=3,EPS=30,LFS=6,BTIME=0.6,BDECAY=0.6,BTTL=6,D={DEF=300,SUBS=60,VTOL=60}}}},
legaheattank={S=51,SD=414,XPLD="hugeexplosiongeneric",SELFD="hugeExplosionGenericSelfd",UPCV=1,w={heat_ray={RT=3.3,EPS=825}}},
legstr={H=1710,S=85.45,TR=728.64,w={armmg_weapon={SA=1500,THICK=1.5,D={DEF=7.5,VTOL=3.75}}}},
leginf={H=6850,M=2000,TT="armbull_tracks",TW=58,TKS=14,XPLD="minifusionExplosion",SELFD="minifusionExplosion",FD={heap={object="Units/cor3X3A.s3o"}},w={rapidnapalm={AOE=175,SIZE=5.5,WV=350,MG=0.095,SA=2750,BURR=0.3,RT=1.8,STOCK=true,STIME=9,CP={SLIMIT=6},D={DEF=90}}}},
legbastion={XPLD="hugeBuildingexplosiongeneric",SELFD="hugeBuildingExplosionGenericSelfd",w={t2heatray={EPS=2850}}},
legbart={SD=405,S=62.8,H=2080,XPLD="flamethrowerSelfd",SELFD="flamethrowerSelfd",TR=640,E=9700,w={clusternapalm={SA=2100,AOE=135,WV=275,SIZE=4.5,RT=7.5,PR=4,CP={AHT=5}}}},
}

for name, ch in pairs(c2) do
	local ud = u[name]
	if ud then
		apply(ud, ch)
		if ch.w then
			if not ud.weapondefs then ud.weapondefs = {} end
			for wn, wch in pairs(ch.w) do
				if not ud.weapondefs[wn] then ud.weapondefs[wn] = {} end
				apply(ud.weapondefs[wn], wch)
			end
		end
	end
end--AMBR-3 XL
local u = UnitDefs

local map = {
	B="buildtime", E="energycost", M="metalcost", WK="workertime", H="health",
	P="power", S="speed", SD="sightdistance", SD2="sonardistance", ASD="airsightdistance",
	MASS="mass", MAXA="maxacc", MAXD="maxdec", TIP="turninplaceanglelimit",
	CVO="collisionvolumeoffsets", CVS="collisionvolumescales", CVT="collisionvolumetype",
	AH="autoheal", TC="transportcapacity", TT="tracktype", TW="trackwidth",
	XPLD="explodeas", SELFD="selfdestructas", FD="featuredefs", IAH="idleautoheal",
	IT="idletime", TR="turnrate", FBM="flankingbonusmax", EM="energymake",
	EU="energyupkeep", SDCD="selfdestructcountdown", CBT="cantbetransported",
	AOE="areaofeffect", EDGE="edgeeffectiveness", MVACC="movingaccuracy",
	SSV="soundstartvolume", SHV="soundhitvolume", BTIME="beamtime", RT="reloadtime",
	R="range", WV="weaponvelocity", MG="mygravity", SA="sprayangle",
	AF="avoidfeature", BB="beamburst", BUR="burst", BTTL="beamttl", BDECAY="beamdecay",
	BURR="burstrate", STRIG="soundtrigger", TOL="tolerance", WB="waterbounce",
	BSLIP="bounceslip", BREB="bouncerebound", BEG="bounceExplosionGenerator",
	NB="numbounce", WACC="weaponacceleration", WPT="weapontimer", LL="leadlimit",
	EPS="energypershot", N="name", SS="soundstart", SH="soundhit", EG="explosiongenerator",
	IMPF="impulsefactor", IMPB="impulseboost", FT="flighttime", WOB="wobble",
	TH="trajectoryheight", TRACKS="tracks", EAWE="ownerExpAccWeight",
	CF="collidefriendly", THICK="thickness", SIZE="size", DANCE="dance",
	SZD="sizedecay", ALPH="alphadecay", STG="stages", SEP="separation", NG="nogap",
	SV="startvelocity", PR="projectiles", CST="camerashake", INT="intensity",
	TX1="texture1", TX2="texture2", DUR="duration", CM="cratermult",
	RGB1="rgbcolor", RGB2="rgbcolor2", CEG="cegtag", CD="cluster_def", CN="cluster_number",
	GB="groundbounce", BR="bouncerebound", BS="bounceslip", D="damage",
	DEF="default", VTOL="vtol", SUBS="subs", LBO="lboats", HBO="hvyboats",
	CB="crawlingbombs", CMDRS="commanders", ACC="accuracy", CP="customparams",
	PM="paralyzemultiplier", STOCK="stockpile", STIME="stockpiletime", SLIMIT="stockpilelimit",
	ESTORE="energystorage", WPS="weapons", OTC="onlytargetcategory", MAD="maxangledif",
	MSWPR="minesweeper", REP="repairspeed", MINES="mines", FBMIN="flankingBonusMin",
	UPCV="usepiececollisionvolumes", TKS="trackstrength", LFS="laserflaresize",
	DDE="dyndamageexp", DDMIN="dynDamageMin", DDR="dyndamagerange", DDINV="dyndamageinverted",
	MPS="metalpershot", EXPS="explosionspeed", CBOOST="craterboost", CMULT="cratermult", SPTIME="stockpiletime",
	FLGT="flamegfxtime", CMAP="colormap", SWF="sweepfire", AHT="area_onhit_time", AHD="area_onhit_damage",
	AHR="area_onhit_range", AHC="area_onhit_ceg", AHDC="area_onhit_damageCeg", AHRES="area_onhit_resistance",
	BRK="brakerate", ACCEL="acceleration", MAIL="maxaileron", MRUD="maxrudder", TRAD="turnradius",
	FSTATE="firestate", BO="buildoptions", MD="maindir", MDEF="def", SHLD="shields", RDJ="radardistancejam",
	NR="norangering", WT="weapontype", SHW="soundhitwet", CAOE="craterareaofeffect", RD="radardistance"
}

local function apply(t, s)
	for k, v in pairs(s) do
		local mk = map[k] or k
		if type(v) == "table" then
			if not t[mk] then t[mk] = {} end
			apply(t[mk], v)
		else
			t[mk] = v
		end
	end
end

local c3 = {
armsnipe={cloaktimeout=64,XPLD="mediumExplosionGenericSelfd",SELFD="metalmaker",FD={dead={H=1200}},w={old_armsnipe_weapon={EPS=1125,DDE=0.18,DDMIN=1700,DDR=810,DDINV=true}}},
cormort={M=395,TR=1000,IT=900,XPLD="smallExplosionGenericSelfd",SELFD="smallbuilderSelfd",w={cor_mort={AOE=48,MVACC=1100,MG=0.2,RT=2.5,EG="custom:genericshellexplosion-medium",SS="cannon3",D={DEF=164}}}},
armsilo={w={nuclear_missile={WACC=115,TR=6250,WPT=6}}},
legsilo={E=88000,M=7850,B=182500,H=6050,w={legicbm={AOE=2240,CAOE=2240,EDGE=0.25,WACC=85,TR=4250,SPTIME=165,MPS=1375,EPS=218750,WPT=5,EXPS=21,IMPB=300,IMPF=2.5,D={DEF=10500}}}},
cortron={w={cortron_weapon={CBOOST=1.8,CMULT=1.2,R=2880,MPS=750,EPS=16500,D={DEF=3250,HBO=6500}}}},
legperdition={w={
		napalmmissile={RT=4,CEG="nuketrail-roost",EG="custom:t3unitexplosionxxl",CBOOST=1.3,CMULT=1.2,R=3100,MG=0.05,WV=425,SPTIME=71,MPS=565,EPS=27000,SSV=45,CP={NR=1,AHD=160,AHT=25,CD="cluster_munition",CN=3},D={DEF=760,HBO=3800}},
		cluster_munition={AOE=600,AF=false,CEG="burnflame",CF=false,CMAP="0.75 0.73 0.67 0.024   0.37 0.4 0.30 0.021   0.22 0.21 0.14 0.018  0.024 0.014 0.009 0.03   0.0 0.0 0.0 0.008",CBOOST=0,CMULT=0,EDGE=0.75,EG="custom:fire-explosion-large",FLGT=1,IMPF=15,IMPB=40,CST=450,N="Hellfire",R=60,RGB1="1 0.25 0.1",SIZE=0.1,SH="flamhit1",SHW="sizzle",SS="cannhvy2",WT="Cannon",D={DEF=50,deflectors=900},CP={nodecal=true,AHC="fire-area-150-repeat",AHDC="burnflamexl-gen",AHD=30,AHR=225,AHT=21}},
		hintweapon={RT=4,R=3100,WV=850,N="Over Time Napalm Damage",D={DEF=2960}}},
	WPS={[2]={MDEF="HINTWEAPON",OTC="NOTSUB"}}
},
corgol={S=40.3,B=54000,E=22000,H=10800,w={cor_gol={CEG="unitsmoke",MG=0.075,WV=215,SIZE=4.5,RT=3,CP={SWF=2,CD="cluster_munition",CN=3},D={DEF=540}},cluster_munition={AOE=50,AF=false,CF=false,CBOOST=0,CMULT=0,EDGE=0.75,EG="custom:blank",IMPF=0.123,N="HESH",R=0.1,RGB1="0.4 0.02 0 0",SIZE=0.1,WT="Cannon",D={DEF=120},CP={nodecal=true}},hintweapon={RT=3,R=0.1,AOE=50,EDGE=0.75,N="Direct Hit HESH Damage",D={DEF=360}}},WPS={[2]={MDEF="HINTWEAPON"}}},
corbuzz={w={rflrpc={MG=0.2}}},
armvulc={w={rflrpc={MG=0.2}}},
legstarfall={E=1711000,M=64000,w={starfire={EDGE=0.15}}},
armbrtha={H=9550,w={lrpc={MG=0.2,IMPF=3}}},
corint={H=16800,w={lrpc={MG=0.2,IMPF=3}}},
leglrpc={H=14200,w={lrpc={MG=0.2,IMPF=3}}},
legavroc={S=31.4,TR=360,M=815,E=8000,SD=204,H=1550,w={armtruck_rocket={TR=7000,IMPF=0.8,AOE=145,EDGE=0.7,WACC=120,RT=20.5,R=1330,D={DEF=2050,SUBS=450,CMDRS=650}}}},
corvroc={H=1690,S=32.6,TR=420,w={cortruck_rocket={TR=8000,EDGE=0.8,AOE=155,WV=345}}},
armmerl={H=1520,w={armtruck_rocket={TR=9000,EDGE=0.75,WACC=110,WPT=2.4}}},
legcluster={SD=469,w={plasma={ACC=200,AOE=160,D={DEF=120,HBO=300,SHLD=300,SUBS=30,VTOL=30}},plasma_high={ACC=200,AOE=160,D={DEF=120,HBO=300,SHLD=300,SUBS=30,VTOL=30}},cluster_munition={EDGE=0.75}}},
legacluster={SD=433,B=31900,w={plasma={ACC=600,AOE=240,R=1360,SIZE=7,D={DEF=160,LBO=160,HBO=320,SHLD=320,SUBS=40,VTOL=40}},plasma_high={ACC=600,AOE=240,R=1360,SIZE=7,D={DEF=160,LBO=160,HBO=320,SHLD=300,SUBS=40,VTOL=40}},cluster_munition={EDGE=0.75}}},
legamcluster={SD=307,S=49,H=1700,M=470,B=12050,w={cluster_artillery={SIZE=5.5,MG=0.065,WV=269,RT=4.4,D={DEF=140,SHLD=420,SUBS=35,VTOL=35}},cluster_munition={R=55,AOE=90,EDGE=0.75}},WPS={[1]={MAD=130}}},
legelrpcmech={H=28200,w={shocker_low={R=2700}}},
legeshotgunmech={M=9000,H=30900,S=61.25,XPLD="explosiont3xl",SELFD="explosiont3xxl",FBMIN=0.8,P=3000,w={clusterplasma={SIZE=6.5,MG=0.065,WV=229,RT=5.2,CP={CN=7},D={DEF=330}},cluster_munition={R=55,EDGE=0.75},shotgun={IMPF=3,IMPB=300,CST=110,SSV=20,AOE=68,EDGE=0.15,CEG="arty-fast",SA=2360,MG=0.75,EAWE=0,WT="Cannon",SH="rockhit2",EG="custom:genericshellexplosion-small-t2",RT=2,D={DEF=125}},adv_rocket={RT=1.5,STOCK=true,STIME=6,CP={SLIMIT=4}},leg_t2_microflak_mobile={R=990}}},
legjav={E=22000,w={mg_guns={TX1="shot",TX2="empty",THICK=2.75,SA=1450,D={DEF=13.5,VTOL=6.75}}},WPS={[1]={OTC="NOTSUB"}}},
legerailtank={S=58.3,SD=825,B=95000,BRK=0.037,M=5100,E=227000,w={t3_rail_accelerator={AOE=160,RGB1="0.22 0.27 0.47",THICK=3.6,RT=5,BURR=0.5,IMPB=1800,EPS=1200,D={DEF=1175,CMDRS=352.5},CP={nodecal=true}}}},
legkeres={S=47.1,MASS=4100,M=3050,E=64000,ACCEL=0.0055,BRK=0.011,TR=140,w={legkeres_gatling={BUR=75,PR=2,RT=5.8,IMPB=21,BURR=0.033,EAWE=0.4,WV=1400,THICK=1.75,SS="minigun",D={DEF=8,VTOL=6}},legkeres_cannon={AOE=264,EDGE=0.7,IMPB=150,R=440,SH="xplonuk2xs",SHV=13,MG=0.2,EG="custom:genericshellexplosion-large-aoe",SIZE=7,RT=1.9,D={DEF=530}}}},
legflak={H=2475,M=990,E=17000,B=23300},
legvflak={H=2600,M=430,E=13300,TIP=135,MAXA=0.063,MAXD=0.08,S=77,SD=366,w={leg_t2_microflak_mobile={N="Small Dual Rotary Microflak Cannons",R=630}}},
armyork={H=2300,w={bogus_missile={R=665},mobileflak={R=665}}},
corsent={w={bogus_missile={R=680},mobileflak={R=680}}},
corvac={H=3150,E=8800,SDCD=2.5,XPLD="hugeExplosionGeneric-builder",SELFD="hugeExplosionGenericSelfd-builder",BO={[1]="corexp",[2]="coradvsol"}},
corvacct={WK=260,XPLD="hugeExplosionGeneric-builder",SELFD="flagshipExplosion"},
armconsul={BD=152,WK=155,BO={[1]="armadvsol",[2]="armamex"}},
legaceb={H=965,BD=144,WK=130},
armnanotc={P=600,B=5700},
armnanotcplat={P=600,B=5700},
cornanotc={P=600,H=580,E=3400},
cornanotcplat={P=600,H=580,E=3400},
legnanotc={P=600,H=570,B=5500,E=3300},
legnanotcplat={P=600,H=570,B=5500,E=3300},
armwin={H=178,P=100},
armwint2={H=1780,P=1000},
corwin={H=200,P=100},
corwint2={H=2000,P=1000},
legwin={H=191,B=1440,P=100},
legwint2={H=1910,B=15000,P=1000},
cormstor={H=2260,B=3030},
coruwms={H=2260,B=3030},
armestor={H=1575},
armuwes={H=1575},
armuwms={H=2100},
legestor={H=1750,M=165,E=2050,B=4440},
legmstor={H=2180,M=350,E=580,B=2860},
legamstor={H=10900,M=740,E=12000,B=20300},
legrad={SD=690,H=205,M=65,B=1190},
armrad={SD=700,H=225,M=70,B=1210},
armfrad={H=144,M=135,B=1850},
armarad={H=1665,SD=1040},
corarad={H=1180,M=370},
armpb={H=2100},
corvipe={H=2400},
legbombard={H=2225},
armflea={MASS=5},
armflash={S=99,SD=290,H=690,w={emgx={R=190,D={DEF=10.05,VTOL=4.44}}}},
corgator={w={gator_laserx={D={VTOL=19}}}},
armthund={w={armbomb={IMPB=600,IMPF=1.25}}},
armsb={w={arm_seaadvbomb={IMPB=600,IMPF=1.25}}},
armpnix={w={armadvbomb={IMPB=600,IMPF=1.25}}},
armblade={w={vtol_sabot={R=620}}},
corlevlr={MAXD=0.066,TR=396.5},
armjanus={w={janus_rocket={EDGE=0.55,WOB=15000,TR=6500,RT=7,FT=1.64,D={DEF=275}}}},
armsubk={w={armsmart_torpedo={D={DEF=437,HBO=350,LBO=350}}}},
corshark={SD=345,w={armsmart_torpedo={D={DEF=437,HBO=350,LBO=350}}}},
correcl={S=63.5,H=500,SD=313},
armamsub={B=9600,E=6500,H=3800,BO={[7]="armvader"}},
coramsub={B=10200,M=1175,E=6800,H=4050,BO={[8]="corroach"}},
legamphlab={B=10800,M=1225,E=6300,H=4300,BO={[8]="legsnapper"}},
armvader={P=300,SD=154,ASD=0},
corroach={P=310,SD=140,ASD=0,B=8200,E=5900},
legsnapper={P=320,SD=147,ASD=0,B=8050,MASS=749,FSTATE=0,M=77,w={crawl_dummy={R=42}}},
legkam={ACCEL=0.095,S=218,CP={unitgroup="explo"}},
legatorpbomber={SD2=0,w={legair_torp={FT=3.3}}},
legafigdef={H=880,S=244,w={leggun={WV=1750,D={VTOL=33}}}},
legvenator={w={birdshot={PR=6,SA=810,WV=1200,RGB1="1 0.4 0.95",TX1="shot",TX2="empty",THICK=3,WT="LaserCannon",D={VTOL=180}}}},
legphoenix={maxbank=0.65,MAIL=0.003,E=55000,S=268.5,w={skybeam={EPS=1925,D={VTOL=33}},legphtarg={EPS=1925}}},
legnap={maxbank=0.5,MAIL=0.0055,MRUD=0.0025,TRAD=480,w={napalmbombs={CEG="unitsmokefire",EG="custom:t3unitexplosionmed",RT=16,AOE=400,SH="bombsmed1",SHV=15,D={DEF=120},CP={AHD=60}}}},
legwhisper={H=940,P=1000,SD2=375,S=325,SD=1300,RD=2450},
legmineb={E=10100},
legjuno={H=2425,E=16500,M=430,XPLD="energystorage",FD={dead={H=1806}},w={juno_pulse={R=7900,D={DEF=5}}}},
legjam={H=1035,B=5350,RDJ=420},
legajam={H=1445,M=170,E=19500,RDJ=810},
legarad={H=1315,M=385,SD=1020},
legehovertank={XPLD="hugeexplosiongeneric",SELFD="hugeexplosiongenericSelfd",w={heat_ray={R=415,SS="heatray4burn",EG="custom:heatray-huge",SSV=32,EPS=2300,RT=10.5,CST=360,THICK=8,LFS=10,D={DEF=90,VTOL=45,CMDRS=45},CP={SWF=3}},parabolic_rockets={EG="custom:genericshellexplosion-medium-bomb",DANCE=8,SV=115,WACC=55,TR=14500,WOB=19000,TH=0.33,FT=3,R=540,RT=6.1},depthcharge={D={CB=750}}},WPS={[3]={MAD=210,MD="1 0 1"},[4]={MAD=210,MD="-1 0 1"}}},
legeheatraymech={S=38.8,E=680000,w={heatray1={SSV=40},bigfootstep={D={DEF=5}},ultraheavyriotcannon={N="Ultra Heavy Thermal Cannon",CEG="missiletrailmship",SS="cannhvy6",WV=400,PR=2,AOE=416,EDGE=0.7,CST=3900,SSV=21,SHV=29,RT=6.5,EG="custom:t3unitexplosion",STG=4,SZD=0.2,CMAP="0.95 0.91 0.57 0.95   0.95 0.71 0.17 0.9   0.97 0.3 0.08 0.85",CMULT=0.5,MG=0.2,CP={AHC="fire-area-150-repeat",AHDC="burnflamexl-gen",AHRES="fire",AHD=75,AHR=150,AHT=3}}}},
}

for name, ch in pairs(c3) do
	local ud = u[name]
	if ud then
		apply(ud, ch)
		if ch.w then
			if not ud.weapondefs then ud.weapondefs = {} end
			for wn, wch in pairs(ch.w) do
				if not ud.weapondefs[wn] then ud.weapondefs[wn] = {} end
				apply(ud.weapondefs[wn], wch)
			end
		end
	end
end--AMBR-4 XL
local u = UnitDefs

local map = {
	B="buildtime", E="energycost", M="metalcost", WK="workertime", H="health",
	P="power", S="speed", SD="sightdistance", ASD="airsightdistance",
	MASS="mass", MAXA="maxacc", MAXD="maxdec",
	CVO="collisionvolumeoffsets", CVS="collisionvolumescales", CVT="collisionvolumetype",
	IAH="idleautoheal", IT="idletime", TR="turnrate", FBM="flankingbonusmax", FBMIN="flankingBonusMin",
	EM="energymake", EU="energyupkeep", CBT="cantbetransported",
	AOE="areaofeffect", EDGE="edgeeffectiveness", MVACC="movingaccuracy",
	SSV="soundstartvolume", SHV="soundhitvolume", BTIME="beamtime", RT="reloadtime",
	R="range", WV="weaponvelocity", MG="mygravity", SA="sprayangle",
	BUR="burst", BTTL="beamttl", BDECAY="beamdecay", BURR="burstrate",
	STRIG="soundtrigger", TOL="tolerance", BSLIP="bounceslip", BEG="bounceExplosionGenerator",
	NB="numbounce", LL="leadlimit",
	EPS="energypershot", N="name", SS="soundstart", SH="soundhit", EG="explosiongenerator",
	IMPF="impulsefactor", IMPB="impulseboost", EAWE="ownerExpAccWeight",
	CF="collidefriendly", THICK="thickness", SIZE="size",
	PR="projectiles", CST="camerashake", TX1="texture1", TX2="texture2", DUR="duration",
	RGB1="rgbcolor", CEG="cegtag", CD="cluster_def", CN="cluster_number",
	GB="groundbounce", BR="bouncerebound", BS="bounceslip", D="damage",
	DEF="default", VTOL="vtol", SUBS="subs", LBO="lboats", HBO="hvyboats",
	CB="crawlingbombs", CMDRS="commanders", ACC="accuracy", CP="customparams",
	STOCK="stockpile", STIME="stockpiletime", SLIMIT="stockpilelimit",
	WPS="weapons", OTC="onlytargetcategory", MAD="maxangledif", LFS="laserflaresize",
	CMAP="colormap", SWF="sweepfire", AHT="area_onhit_time", AHD="area_onhit_damage",
	AHR="area_onhit_range", AHC="area_onhit_ceg", AHDC="area_onhit_damageCeg",
	BO="buildoptions", MDEF="def", SHLD="shields",
	WT="weapontype", SHW="soundhitwet", CAOE="craterareaofeffect",
	DM="damagemodifier", LG="levelground", RS="rspeed", FAST="fastautoretargeting",
	COR="corethickness", SCR="scrollspeed", LLB="largebeamlaser",
	TIPS="turninplacespeedlimit", NSD="noselfdamage", PROX="proximitypriority",
	BTC="badtargetcategory", BLC="blocking", CAT="category", FD="featuredefs", O="object", BP="buildpic",
	SFX="sfxtypes", EGS="explosiongenerators", MWD="minwaterdepth", XPLD="explodeas", SELFD="selfdestructas",
}

local function apply(t, s)
	for k, v in pairs(s) do
		local mk = map[k] or k
		if type(v) == "table" then
			if not t[mk] then t[mk] = {} end
			apply(t[mk], v)
		else
			t[mk] = v
		end
	end
end

local CTL_Defs = {BSLIP=0.7, BEG="custom:footstep-medium", RT=2.15, R=775, D={HBO=450, SUBS=300, CB=750}}

local c4 = {
armtide={MWD=16},
cortide={MWD=16},
legtide={MWD=16},
armsolar={H=320,DM=0.333},
legsolar={M=145},
legadvsol={H=1305,E=4200,M=480},
legfloat={TW=51,TT="armsam_tracks",S=59.5,P=666,B=36000,M=800,E=12000,SD=440,w={legfloat_gauss={RT=2.64,R=610,N="Thermal Gauss Cannon",MVACC=850,CEG="missiletrailcorroyspecial",CMAP="1 1 0.27 0.95   0.97 0.3 0.03 0.85",D={DEF=475},CP={CD="cluster_munition",CN=1}},cluster_munition={R=0.1,AOE=120,CST=120,EG="custom:blank",RGB1="0.5 0 0 0",SIZE=0.1,D={DEF=10}},legfloat_gatling={R=370,N="Rapid-Fire Defense Machine Gun",THICK=1.5,BURR=0.1,BUR=4,CF=false,D={DEF=8,VTOL=12}}}},
legshot={FBM=3,S=35.6,H=2825,DM=0.2,w={legion_riot_cannon_t2={RT=1.2,AOE=120,N="Rapid Twin Riot Cannon",SH="corlevlrhit",SS="corlevlr",EG="custom:genericshellexplosion-medium-bomb",D={DEF=160}}}},
legkark={FBM=3,DM=0.333,B=5700,w={legion_shotgun={EAWE=0,N="Light Burst-Fire Shotgun",SS="mavgun4",BUR=3,PR=6,SA=2660,BURR=0.67,RT=3,IMPF=3,IMPB=13,D={LBO=24}},heat_ray={BTIME=0.44,EPS=12}}},
legamph={M=660,E=20500,FBM=1.2,DM=0.333,P=570,w={coax_depthcharge={GB=true,NB=3,BR=0.7,BS=0.85,BEG="custom:footstep-medium",D={CB=700}},heat_ray={R=400,BTIME=0.07,SS="heatray3start",BTTL=7,BDECAY=0.7,D={DEF=66}}},WPS={[1]={MAD=120}}},
leghrk={H=1275,TR=525,XPLD="mediumExplosionGenericSelfd",SELFD="largeExplosionGenericSelfd",w={rocket_barrage={IMPF=0.6,EG="custom:genericshellexplosion-small-bomb"}},WPS={[1]={MAD=60}}},
legfmg={P=225,E=7000,H=3300,SD=595,IMPB=20,LG=false,CP={RXPS=0.3},w={gatling_gun={R=595,EAWE=0.75,ACC=1500,D={DEF=19,VTOL=14.25}}}},
legfrl={B=3290,M=125,E=1100,H=775,CBT=false,LG=false},
legapopupdef={H=2225,M=810,E=19000,w={advanced_riot_cannon={R=680,SH="xplomed2xs"}}},
armdl={B=8500,w={coax_depthcharge=CTL_Defs}},
cordl={B=8800,w={coax_depthcharge=CTL_Defs}},
legctl={M=230,B=8300,H=2050,w={torplauncher=CTL_Defs}},
leguwestore={H=1750,M=165,E=2050,B=4440},
leguwmstore={H=2180,M=350,E=580,B=2860},
legadvestore={M=820,E=12000},
coruwadves={H=13200,B=20500},
legmohocon={H=4050},
legmohoconct={H=4050},
legmext15={E=6000,M=290,B=4400},
legrezbot={P=350,M=125,E=1875,H=210,B=2600},
legck={E=1675},
legcv={E=2025,S=59.4},
legca={E=3100,SD=429},
legadvaabot={M=715,S=31.7,ASD=1400,SD=690,w={aa_railgun={RT=2,R=1770}}},
leglraa={H=4400},
corscreamer={H=2670},
armmercury={H=2330},
armferret={B=3560},
armmar={w={armmech_cannon={CEG="arty-small"}}},
armdf={SELFD="flagshipExplosion"},
legavrad={S=53.2,M=109,E=1700,H=665},
legavjam={S=51.8,RDJ=425,H=555,E=1800},
legaradk={S=43.4,E=1450,M=92,H=440},
legajamk={S=42.4,RDJ=375,E=1200,M=88,H=400},
legbunk={H=5350,CVS="54 52 54",CVO="0 -15 0",FBMIN=0.8,w={railgunt2={SS="railgun",SSV=20}}},
legeallterrainmech={S=29.3,H=11250,CP={maxrange=1050},w={plasma_low={WV=348,MG=0.095},plasma_high={WV=348,MG=0.095},cluster_munition={EDGE=0.75},smart_trajectory_dummy={R=1100},drone_controller={R=1150}}},
armwar={B=5200,TR=750,w={armwar_laser={SA=1830,THICK=1.45,BDECAY=0.5,BTTL=7,PR=5,RT=0.7,STRIG=true,PROX=2,CP={SWF=3.38},D={DEF=40}}}},
leguwgeo={MWD=0,B=17700,H=2190,M=630,EM=400},
armemp={P=4000}, cortron={P=4000}, legperdition={P=4000},
armamd={P=3700}, corfmd={P=3700}, legabm={P=3700},
armscab={P=3600}, cormabm={P=3600}, legavantinuke={P=3600,icontype="cormabm"},
armfrt={CBT=false,LG=false}, corfrt={CBT=false,LG=false},
armfrad={CBT=false,LG=false}, corfrad={CBT=false,LG=false}, legfrad={CBT=false,LG=false},
armseadragon={H=8000,w={sdmssl={CP={SLIMIT=3}},waterballon={EG="custom:genericunitexplosion-huge-uw",model="coradvtorpedo.s3o",CEG="torpedotrail-large",N="Heavy Anti-Ship Torpedo",AOE=74,CST=1000,WV=190,RT=9.6,D={DEF=2675,SUBS=2675,HBO=5350,CMDRS=1070}}}},
cordesolator={H=8300,w={crblmssl={CP={SLIMIT=3}},waterballon={EG="custom:genericunitexplosion-huge-uw",model="coradvtorpedo.s3o",CEG="torpedotrail-large",N="Heavy Anti-Ship Torpedo",AOE=74,CST=1000,WV=190,RT=9.2,D={DEF=2725,SUBS=2725,HBO=5450,CMDRS=1090}}}},
coresuppt3={SD=850,TR=60,MAXA=0.005,MAXD=0.005,FBM=1.2,w={laser={CST=800,LLB=true,SCR=4,N="Armageddon Heat Ray",SS="heatray2xl",EG="custom:genericbuildingexplosion-metalmaker",COR=0.4,THICK=9,LFS=12,RT=7.5,SSV=95,AOE=120,BTTL=4,BDECAY=0.5,EPS=3500,D={DEF=11250,HBO=16875,VTOL=4500}}}},
armmls={WK=190},
cormls={BO={[18]="coramph"}},
armah={S=94.9,w={armah_weapon={BUR=4,RT=2.9}}},
corah={w={corah_weapon={BUR=1,RT=1.4,D={VTOL=120}}}},
legah={H=1055,w={aagun={R=800}}},
armkraken={w={armmech_cannon={SS="KroGun1",SSV=2.5}}},
corcan={FBM=1.6,H=5600},
legaap={BO={[10]="legnap"}},
corhp={BO={[7]="corthovr"}},
corfhp={BO={[7]="corthovr"}},
armhp={BO={[6]="armthovr"}},
armfhp={BO={[6]="armthovr"}},
leghp={H=3550,BO={[7]="legthovr"}},
legfhp={H=3550,BO={[7]="legthovr"}},
corgantuw={BO={[6]="corintr"}},
corgant={BO={[8]="corintr"}},
armshltxuw={BO={[5]="armprowl"}},
armshltx={BO={[7]="armprowl"}},
legamphlab={BO={[9]="corseal"}},
legavp={BO={[16]="corvac"}},
corseal={MASS=150,MAXA=0.05875,TR=518,M=335,FBMIN=0.33,S=88.1,RS=88.1,H=1050,IAH=25.5,IT=300,w={cor_croc={AOE=97,EDGE=0.35,STRIG=true,SH="rockhit2",SHV=22,EG="custom:heatray-large",CMAP="1 1 0.27 0.95   0.97 0.3 0.03 0.85",RT=0.6,STOCK=true,STIME=2.3,BUR=2,PR=2,R=205,WV=190,MG=0.2,BURR=0.05,SA=2950,N="Heat Shotgun",TOL=12000,D={DEF=29.3},CP={SLIMIT=12}}}},
armgplat={w={gun={R=410,WV=345,MG=0.2,SA=1970,RT=0.6,D={DEF=116}}}},
corgplat={w={gun={R=415,WV=360,MG=0.2,SA=1880}}},
legcs={BO={[27]="corgplat"}},
cordeadeye={w={cor_burst_laser={WV=3642,DUR=0.02,SSV=11,BURR=0.6}},WPS={[1]={FAST=true}}},
corsiegebreaker={S=55.3,XPLD="hugeexplosiongeneric",SELFD="hugeExplosionGenericSelfd",E=36000,TR=80,TIPS=0.01,H=3600,FBMIN=0.8,FBM=2.4,w={dreadovercharge={EPS=5000,LFS=8,COR=0.2,THICK=4,BTIME=1.9,BTTL=10,BDECAY=0.7,RT=11,D={DEF=6050}}}},
armfrock={MTU=0}, corfrock={MTU=0},
resourcecheat={P=1000000},
corprince={MASS=13000,M=13300,S=47.5,TR=85,w={navalplasma={AOE=129,ACC=670,SA=110,MVACC=1070,WV=700,SS="xplolrg5",SH="xplonuk5",D={DEF=720,SHLD=360,SUBS=216}},heavyplasma={ACC=1005,SA=100,MVACC=1205,WV=850,EG="custom:genericshellexplosion-huge",D={DEF=1400,SHLD=700,SUBS=420}}}},
legch={BO={[47]="legnavaldefturret"}},
legotter={BO={[46]="legnavaldefturret"}},
legnavyconship={BO={[28]="legnavaldefturret",[29]="legfhive",[30]="corgplat"}},
armcs={BO={[27]="armnavaldefturret"}},
armch={BO={[46]="armnavaldefturret"}},
armbeaver={BO={[45]="armnavaldefturret"}},
corcs={BO={[27]="cornavaldefturret"}},
corch={BO={[46]="cornavaldefturret"}},
cormuskrat={BO={[45]="cornavaldefturret"}},
cornavaldefturret={M=800,w={t1_heavy_plasma_cannon={R=715,IMPB=200,ACC=440,RT=4,AOE=208,WV=310,MG=0.095,SIZE=4.8,D={DEF=640,VTOL=128,SUBS=128}}}},
legnavaldefturret={H=5350,w={leg_med_anti_naval_salvo_rocket={TR=500,WOB=250}}},
armacsub={BO={[15]="armanavaldefturret"}},
coracsub={BO={[15]="coranavaldefturret"}},
armprowl={H=7050,S=79.9,M=1700,E=44000,B=70500,SD=583,XPLD="minifusionExplosion",SELFD="fusionExplosion",CVS="34 57 38",FD={dead={BLC=false,CAT="heaps",O="Units/arm4X4E.s3o",CVS="65.0 4.0 6.0",CVT="cylY"}},BP="ARMMEATBALL.DDS",SFX={EGS={[1]="genericshellexplosion-medium-lightning2"}},w={armmech_cannon={LL=100,AOE=390,BS=0.85,BR=0.3,NB=10,GB=true,WB=true,BEG="custom:genericshellexplosion-small-lightning",CEG="blob_trail_blue",EDGE=0.95,EG="custom:genericshellexplosion-large-lightning",EPS=340,N="Bouncy Ball Lightnings",CF=false,R=615,NSD=true,RGB1="0.4 0.5 1",RT=2.8,SA=600,WT="Cannon",WV=170,MG=0.04,SIZE=9,SH="xploelc2",SS="flashemgxlhit2",SSV=20,SHV=24,CP={AHC="genericshellexplosion-large-lightning",AHDC="genericshellexplosion-splash-large-lightning",AHD=100,AHR=190,AHT=2},D={DEF=100}},armamph_missile={model="",CEG="",TX1="",TX2="",SA=660,AOE=20,AF=false,CAOE=0,CBOOST=0,CMULT=0,DUR=0.05,PR=2,EDGE=0.15,EPS=60,EG="custom:genericshellexplosion-small",IMPF=0,INT=4,N="Twin g2g discharge blaster",NSD=true,PROX=1,R=880,RT=1.1,RGB1="0.05 0.05 1",SH="xplosml3",SHW="sizzle",SS="lasrfir3alt2",SSV=5,THICK=4,WT="LaserCannon",WV=980,D={DEF=60,VTOL=10}}},WPS={[2]={MDEF="ARMAMPH_MISSILE",BTC="VTOL",OTC="SURFACE"}}},
legnavyaaship={H=1370,SD=790,SFX={EGS={[1]="custom:barrelshot-medium-aa"}},w={light_antiair_missile={RT=0.9,D={VTOL=37}}}},
legnavydestro={w={leg_medium_heatray={SS="heatray3start",EPS=75,BTTL=10,BDECAY=0.65},drone_control_matrix={CP={carrierdeaththroe="release"}}}},
leganavymissileship={M=1880,E=11000,S=62.1,H=3160,XPLD="hugeexplosiongeneric",SELFD="hugeexplosiongenericSelfd",CVO="0 -7 0",w={leg_salvo_vertical_rocket={CEG="crashing-small2",RT=18,BUR=12,BURR=0.17,SA=550,SS="rocklit2_OLD",SH="bombsmed1",SHV=15,EG="custom:genericunitexplosion-large-fire",SSV=30,D={DEF=180,CMDRS=180,HBO=540},CP={nodecal=true,AHC="fire-area-75-repeat",AHDC="burnflamexl-gen",AHD=60,AHR=75,AHT=10}}}},
leganavybattleship={H=9250,w={burst_plasma_t2={EG="custom:genericshellexplosion-medium-aoe"},land_burst_plasma_t2={WV=360},legion_shotgun={EAWE=0,STRIG=true,SA=1690,RT=1.4,D={DEF=24.5,LBO=29.4}}}},
leganavycruiser={H=5100,CVO="0 -9 0",CVS="38 40 100",CVT="CylZ",w={mg_guns={D={VTOL=12}},advdepthcharge={D={CB=750}}},WPS={[1]={BTC="VTOL",OTC="NOTSUB"}}},
legspradarsonarplane={S=272.5,P=500,H=535},
legadvshipyard={BO={[14]="cordesolator"}},
leganavalmex={EU=40,H=3350,E=8500,B=13600,P=1200},
leganavalfusion={EM=1375,P=13000,H=6050,M=5000,E=60000,FBM=3,CVS="101 58 69",CVT="Box"},
}

for name, ch in pairs(c4) do
	local ud = u[name]
	if ud then
		apply(ud, ch)
		if ch.w then
			if not ud.weapondefs then ud.weapondefs = {} end
			for wn, wch in pairs(ch.w) do
				if not ud.weapondefs[wn] then ud.weapondefs[wn] = {} end
				apply(ud.weapondefs[wn], wch)
			end
		end
	end
end--AMBR-5 XL
local u = UnitDefs
local map = {
	B="buildtime", E="energycost", M="metalcost", WK="workertime", H="health",
	P="power", S="speed", SD="sightdistance", MASS="mass", MAXA="maxacc", MAXD="maxdec",
	CVS="collisionvolumescales", CVT="collisionvolumetype",
	IAH="idleautoheal", IT="idletime", TR="turnrate", FBM="flankingbonusmax", CBT="cantbetransported",
	AOE="areaofeffect", EDGE="edgeeffectiveness", SSV="soundstartvolume",
	RT="reloadtime", R="range", WV="weaponvelocity", MG="mygravity", SA="sprayangle",
	AF="avoidfeature", BB="beamburst", BUR="burst", BURR="burstrate", STRIG="soundtrigger",
	BEG="bounceExplosionGenerator", NB="numbounce",
	EPS="energypershot", N="name", SS="soundstart", SH="soundhit", EG="explosiongenerator",
	IMPF="impulsefactor", IMPB="impulseboost", CF="collidefriendly",
	PR="projectiles", CST="camerashake", TX2="texture2",
	RGB1="rgbcolor", CEG="cegtag", BR="bouncerebound", BS="bounceslip",
	D="damage", DEF="default", VTOL="vtol", CMDRS="commanders",
	STOCK="stockpile", STIME="stockpiletime",
	WPS="weapons", OTC="onlytargetcategory", MDEF="def", SWF="sweepfire",
	BO="buildoptions", WT="weapontype", SHW="soundhitwet", RS="rspeed",
	NSD="noselfdamage", BTC="badtargetcategory",
	FD="featuredefs", O="object", BP="buildpic", SFX="sfxtypes", ICT="icontype",
	MWD="minwaterdepth", MXWD="maxwaterdepth", EC="evolution_condition", ET="evolution_timer", EG2="evolution_target",
	SFW="speedfactorinwater", LR="loadingradius", IFP="isFirePlatform", BLD="builder",
	REP="repairspeed", CAS="canassist", CSR="canselfrepair", CRE="canreclaim",
	BANG="buildangle", CMV="canmove", RLH="releaseheld",
	WL="waterline", TT="tracktype", TKS="trackstrength", TOF="trackoffset", UNL="unloadspread",
	TIPSL="turninplacespeedlimit", TRC="transportcapacity", TRS="transportsize", TRU="transportunloadmethod",
	FST="firestate", FPX="footprintx", FPZ="footprintz", MCL="movementclass", NCC="nochasecategory",
	OBJ="objectname", MCD="mincloakdistance",
	AVF="avoidfriendly", CN="collideneutral", CE="collideenemy", CFE="collidefeature",
	HT="hightrajectory", FSUB="firesubmersed", TURR="turret",
	REC="reclaimable", RES="resurrectable", FD2="featuredead", MA="model_author",
	NT="normaltex", SF="subfolder", TL="techlevel", TW="trackwidth", PEG="pieceexplosiongenerators",
	MTU="maxthisunit", MPS="metalpershot", XPLD="explodeas", SELFD="selfdestructas", AD="armordef",
	SUBM="submissile", DDE="dynDamageExp", DDMIN="dynDamageMin", DDR="dynDamageRange", DDINV="dynDamageInverted",
	PM="paralyzemultiplier", AH="autoheal", CP="customparams", MM="metalmake", EM="energymake"
}

local function apply(t,s)for k,v in pairs(s)do local mk=map[k]or k if type(v)=="table"then if not t[mk]then t[mk]={}end apply(t[mk],v)else t[mk]=v end end end

u.legadvsol2=table.copy(u.legadvsol)
u.armthovr=table.copy(u.corhal)
u.corthovr=table.copy(u.corhal)
u.legthovr=table.copy(u.corhal)
u.corintr=table.copy(u.corgarp)

local c5 = {
legadvsol={EM=110,XPLD="smallBuildingExplosionGenericSelfd",SELFD="mediumBuildingExplosionGenericSelfd"},
legadvsol2={ICT="legadvsol",SELFD="mediumBuildingExplosionGenericSelfd",CP={EC="timer",ET=180,EG2="legadvsol"}},

cormoho={CVT="Ell",CVS="79 81 79"},
cormexp={CVT="Ell",CVS="79 87 79"},

armthovr={XPLD="hugeExplosionGeneric",SELFD="hugeExplosionGenericSelfd",
FBM=1.2,LR=110,ICT="armassimilator",IFP=true,BLD=true,WK=20,REP=250,
CAS=false,CSR=true,CRE=false,BANG=16384,BP="ARMTHOVR.DDS",B=10350,CBT=true,CVT="CylZ",E=8300,
FPX=4,FPZ=4,H=9050,MAXA=0.02983,MAXD=0.02983,M=700,MWD=12,MCL="HHOVER4",NCC="ALL",
OBJ="Units/ARMTHOVR.s3o",RLH=true,SD=555,S=53.1,TRC=20,TRS=3,TRU=2,TIPSL=1.2,TR=370,WL=4,
CP={MA="Beherith",NT="unittextures/Arm_normal.dds",SF="ArmHovercraft"},
FD={dead={CVT="CylZ",FPX=4,FPZ=4,H=20,O="Units/armthovr_dead.s3o",REC=true}},
SND={ok={"hovt1transok"},select={"hovt1transsel"}},
w={arm_botdispense={AOE=180,AF=false,AVF=false,BUR=5,BURR=0.3,CEG="arty-botrail",CF=false,
CN=false,CE=false,CFE=false,EDGE=0,EPS=6940,EG="custom:footstep-large",FST=0,HT=1,IMPF=1,IMPB=75,
MPS=486,model="armpw_anim_projectile.s3o",MG=0.22,NSD=true,R=175,RT=1.5,SA=6600,STOCK=true,STIME=40,
SH="flakhit2",SHW="splshbig",SS="nanlath2",SSV=25,WB=true,BS=0.8,BR=0.4,BEG="custom:footstep-medium",
NB=4,WT="Cannon",WV=190,TURR=true,FSUB=true,D={DEF=3.35}}},
WPS={[1]={BTC="MOBILE",MDEF="ARM_BOTDISPENSE",OTC="SURFACE"}}},

corthovr={XPLD="largeexplosiongeneric",SELFD="largeExplosionGenericSelfd",
FBM=1.2,LR=110,ICT="armassimilator",IFP=true,BLD=true,WK=20,REP=250,
CAS=false,CSR=true,CRE=false,BANG=16384,BP="CORTHOVR.DDS",B=10100,CBT=true,CVT="CylZ",E=8000,
FPX=4,FPZ=4,H=8800,MAXA=0.03101,MAXD=0.03101,M=700,MWD=12,MCL="HHOVER4",NCC="ALL",
OBJ="Units/CORTHOVR.s3o",RLH=true,SD=555,S=55.2,TRC=20,TRS=3,TRU=2,TIPSL=1.2,TR=370,WL=4,
CP={MA="Beherith",NT="unittextures/cor_normal.dds",SF="CorHovercraft"},
FD={dead={CVT="Box",H=20,O="Units/corthovr_dead.s3o",REC=true}},
w={cor_botdispense={AOE=180,AF=false,AVF=false,BUR=3,BURR=0.3,CEG="arty-botrail",CF=false,
CN=false,CE=false,CFE=false,EDGE=0,EPS=2790,EG="custom:footstep-large",FST=0,HT=1,IMPF=1,IMPB=75,
MPS=224,model="akbomb.s3o",MG=0.22,NSD=true,R=175,RT=0.9,SA=6600,STOCK=true,STIME=20,
SH="flakhit2",SHW="splshbig",SS="nanlath2",SSV=25,WB=true,BS=0.8,BR=0.4,BEG="custom:footstep-medium",
NB=4,WT="Cannon",WV=190,TURR=true,FSUB=true,D={DEF=3.35}}},
WPS={[1]={BTC="MOBILE",MDEF="COR_BOTDISPENSE",OTC="SURFACE"}}},

legthovr={XPLD="hugeExplosionGeneric",SELFD="hugeExplosionGenericSelfd",
FBM=1.2,LR=110,ICT="armassimilator",IFP=true,BLD=true,WK=20,REP=250,
CAS=false,CSR=true,CRE=false,BANG=16384,BP="ARMTHOVR.DDS",B=10350,CBT=true,CVT="CylZ",E=8600,
FPX=4,FPZ=4,H=9050,MAXA=0.02983,MAXD=0.02983,M=700,MWD=12,MCL="HHOVER4",NCC="ALL",
OBJ="Units/ARMTHOVR.s3o",RLH=true,SD=555,S=53.1,TRC=20,TRS=3,TRU=2,TIPSL=1.2,TR=370,WL=4,
CP={MA="Beherith",NT="unittextures/Arm_normal.dds",SF="ArmHovercraft"},
FD={dead={CVT="CylZ",FPX=4,FPZ=4,H=20,O="Units/armthovr_dead.s3o",REC=true}},
SND={ok={"hovt1transok"},select={"hovt1transsel"}},
w={leg_botdispense={AOE=180,AF=false,AVF=false,BUR=9,BURR=0.3,CEG="arty-botrail",CF=false,
CN=false,CE=false,CFE=false,EDGE=0,EPS=11500,EG="custom:footstep-large",FST=0,HT=1,IMPF=1,IMPB=75,
MPS=760,model="Units/leggob.s3o",MG=0.22,NSD=true,R=175,RT=2.7,SA=6600,STOCK=true,STIME=60,
SH="flakhit2",SHW="splshbig",SS="nanlath2",SSV=25,WB=true,BS=0.8,BR=0.4,BEG="custom:footstep-medium",
NB=4,WT="Cannon",WV=190,TURR=true,FSUB=true,D={DEF=3.35}}},
WPS={[1]={BTC="MOBILE",MDEF="LEG_BOTDISPENSE",OTC="SURFACE"}}},

corintr={XPLD="hugeexplosiongeneric-phib",SELFD="hugeExplosionGenericSelfd-phib",
FBM=1.2,LR=110,ICT="armassimilator",IFP=true,BLD=true,WK=20,REP=350,
CAS=false,CSR=true,CRE=false,BANG=16384,BP="CORINTR.DDS",B=14200,CBT=true,CVT="BOX",E=39000,
FPX=3,FPZ=3,H=22000,IAH=5,IT=1800,MASS=4000,MAXA=0.01621,MAXD=0.01621,M=1350,
OBJ="Units/CORINTR.s3o",RLH=true,SD=592,S=61.2,RS=49,TKS=30,TW=41,TOF=1,TRC=20,TRS=4,TRU=2,
TIPSL=1.24872,TR=120,UNL=3,
CP={MA="Mr Bob",NT="unittextures/cor_normal.dds",SF="CorVehicles/T2",TL=2,TW=32},
FD={dead={CVT="Box",FD2="HEAP",FPX=4,FPZ=4,H=20,O="Units/corintr_dead.s3o",REC=true},heap={CVT="cylY",H=4,M=329,O="Units/cor4X4C.s3o",REC=true,RES=0}},
SFX={PEG={[1]="deathceg2",[2]="deathceg3",[3]="deathceg4"}},
w={cor_botdispense={AOE=240,AG=false,AF=false,AVF=false,CST=450,CEG="arty-botrail",CF=false,
CN=false,CE=false,CFE=false,EDGE=0,EPS=9300,EG="custom:footstep-huge",EXPS=4,FST=0,HT=1,IMPF=3,IMPB=125,
MPS=560,model="Units/corcan.s3o",MG=0.18,NSD=true,R=225,RT=0.5,SA=6200,STOCK=true,STIME=10,
SH="mavgun2",SHW="splshbig",SS="bombssml1_old",SSV=7,SHV=22,WB=true,BS=0.8,BR=0.4,
BEG="custom:footstep-large",NB=4,WT="Cannon",WV=210,TURR=true,FSUB=true,TOL=200000,D={DEF=75}}},
WPS={[1]={BTC="MOBILE",MDEF="COR_BOTDISPENSE",OTC="SURFACE"}}},

armcom={EM=40,BO={[28]="armgplat"},REP=300,WK=400,CP={PM=0.025},
w={armcomlaser={N="Light Scatter Beamer",SA=840,EG="custom:laserhit-beamer",SS="lghthvy1",STRIG=true,BB=true,BUR=5,BURR=0.03,PR=2,RT=1.2,RGB1="0 0 1",D={DEF=27.5,CMDRS=22},CP={SWF=4}}}},
corcom={EM=40,BO={[28]="corgplat"},REP=300,WK=400,CP={PM=0.025}},
legcom={EM=40,BO={[28]="corgplat"},CVS="28 52 28",REP=300,WK=400,CP={PM=0.025},
w={torpedo={SUBM=true,TRACKS=false},legcomlaser={AOE=28},aa_missile={RT=0.67,R=350,TX2="smoketrail",D={VTOL=70},DDE=1.0,DDMIN=0.5,DDR=700,DDINV=false}}},

armdecom={REP=300,WK=400,CP={PM=0.025},AH=15.5,
w={disintegrator={D={DEF=110,CMDRS=70}},armcomlaser={N="Light Scatter Beamer",SA=840,EG="custom:laserhit-beamer",SS="lghthvy1",STRIG=true,BB=true,BUR=5,BURR=0.03,PR=2,RT=1.2,RGB1="0 0 1",D={DEF=27.5,CMDRS=22},CP={SWF=4}}}},
cordecom={REP=300,WK=400,CP={PM=0.025},AH=15.5,
w={disintegrator={D={DEF=110,CMDRS=70}}}},
legdecom={REP=300,WK=400,CP={PM=0.025},E=14000,M=730,AH=15.5,CVS="28 52 28",
w={disintegrator={D={DEF=110,CMDRS=70}},torpedo={SUBM=true,TRACKS=false},legcomlaser={AOE=28},aa_missile={RT=0.67,TX2="smoketrail",D={VTOL=70},DDE=1.0,DDMIN=0.5,DDR=900,DDINV=false}}},

armgplat={w={gun={R=410,WV=345,MG=0.2,SA=1970,RT=0.6,D={DEF=116}}}},
corgplat={w={gun={R=415,WV=360,MG=0.2,SA=1880}}},
}

--Mines
do local mt={{"mine1",45},{"mine2",110,22},{"mine3",300,33},{"fmine3",190,33}}local fs={"arm","cor","leg"}for _,f in ipairs(fs)do for _,t in ipairs(mt)do local n=f..t[1]local e={P=t[2],MCD=-40,IAH=1,IT=300}if t[3]then e.H=t[3]end c5[n]=e end end end

--Deflectors
for _,n in ipairs{"armgate","corgate","legdeflector","armgatet3","corgatet3","leggatet3"}do if not c5[n]then c5[n]={}end if not c5[n].CP then c5[n].CP={}end c5[n].CP.AD="deflectors" end

--Napalm vs deflectors
for _,n in ipairs{"legbar","legbart","leginf"}do local wd=u[n]and u[n].weapondefs if wd then for _,w in pairs(wd)do if w.D and w.D.DEF then w.D.shields=w.D.DEF*3 end end end end

--Factories M
local t1={"corlab","armlab","leglab","corvp","armvp","legvp","corap","armap","legap","corhp","armhp","leghp","corfhp","armfhp","legfhp","corsy","armsy","legsy"}
local t15={"coramsub","armamsub","legamphlab","corplat","armplat","legsplab"}
local t2={"coralab","armalab","legalab","coravp","armavp","legavp","coraap","armaap","legaap","corasy","armasy","legadvshipyard"}

for _,n in ipairs(t1) do c5[n]={MM=1, B=u[n].buildtime+1500} end
for _,n in ipairs(t15) do c5[n]={MM=1.5, WK=u[n].M and u[n].M<1350 and 275 or 250} end
for _,n in ipairs(t2) do c5[n]={MM=2, WK=525} end

--disable bad extra units
if not Spring.GetModOptions().scavunitsforplayers then
	local mtuZero={"armwint2","corwint2","legwint2","armnanotct2","cornanotct2","legnanotct2",
	"armnanotc2plat","cornanotc2plat","legnanotct2plat","armgatet3","corgatet3","leggatet3",
	"armlwall","cormwall","legrwall","corforge","corphantom","armassimilator","armmeatball","armfify","armfrock","corfrock"}
	for _,name in ipairs(mtuZero)do c5[name]={MTU=0} end
end

--Wetspeed
local hoverGroups={
	{{"armsh","corsh","legsh"},"1.2"},
	{{"armch","corch","legch","armah","corah","legah","armanac","corsnap","legner"},"1.15"},
	{{"armmh","cormh","legmh","armlun","corsok","legehovertank","armthovr","corthovr","legthovr","corhal","legcar"},"1.1"}
}
for _,g in ipairs(hoverGroups)do
	local list,val=g[1],g[2]
	for _,name in ipairs(list)do
		if not c5[name]then c5[name]={}end
		if not c5[name].CP then c5[name].CP={}end
		c5[name].CP.SFW=val
	end
end

for _, ud in pairs(u) do
	local bo = ud[map.BO]
	local mcl = ud[map.MCL]
	local mwd = ud[map.MWD]

	if bo then
		for i, name in ipairs(bo) do
			if name == "legadvsol" then
				bo[i] = "legadvsol2"
			end
		end
	end

	local current = ud[map.MXWD]
	if current ~= nil then
		if (not mcl or (mcl:sub(1,5) ~= "HOVER" and mcl:sub(1,6) ~= "HHOVER"))
		   and (not mwd or mwd <= 0) then
			local d = (ud.extractsmetal and ud.extractsmetal > 0) and 36 or 12
			if current < d then
				ud[map.MXWD] = d
			end
		end
	end

	local cp = ud[map.CP] or {}
	cp.restrictions_exclusion = "_nosea_"
	ud[map.CP] = cp
end

for name,ch in pairs(c5)do local ud=u[name]if ud then apply(ud,ch)if ch.w then if not ud.weapondefs then ud.weapondefs={}end for wn,wch in pairs(ch.w)do if not ud.weapondefs[wn]then ud.weapondefs[wn]={}end apply(ud.weapondefs[wn],wch)end end end end

--Omni Commanders Mini
local UnitDefs = UnitDefs or {}

-- Extra Build Options (Omni Faction Commanders)
local extraBuildOptions = {
	armcom = {
		"corlab","corvp","corsy","corhp","corap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	corcom = {
		"armlab","armvp","armsy","armhp","armap",
		"leglab","legvp","legsy","leghp","legap",
		"armfhp","corfhp","legfhp",
	},
	legcom = {
		"armlab","armvp","armsy","armhp","armap",
		"corlab","corvp","corsy","corhp","corap",
		"armfhp","corfhp","legfhp",
	},
}

local level2Units = {
	armcom = {"corexp", "legmext15"},
	corcom = {"armamex", "legmext15"},
	legcom = {"armamex", "corexp"},
}

local level5Units = {
	armcom = {"cormexp", "legmohocon", "corbhmth", "legrampart"},
	corcom = {"armshockwave", "legmohocon", "legrampart"},
	legcom = {"armshockwave", "cormexp", "corbhmth"},
}

for baseName, extras in pairs(extraBuildOptions) do
	for lvl = 0, 10 do
		local unitName = lvl == 0 and baseName or (baseName .. "lvl" .. lvl)
		local uDef = UnitDefs[unitName]
		if uDef and uDef.buildoptions then
			for _, option in ipairs(extras) do
				table.insert(uDef.buildoptions, option)
			end

			if lvl >= 2 and lvl <= 4 and level2Units[baseName] then
				for _, option in ipairs(level2Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end

			if lvl >= 5 and level5Units[baseName] then
				for _, option in ipairs(level5Units[baseName]) do
					table.insert(uDef.buildoptions, option)
				end
			end
		end
	end
end--Self-Balanced Randomizer

--v1.2

-- You can check the Tweak post in official BAR discord there: https://discord.com/channels/549281623154229250/1447694694300651520/1447694694300651520


   


local a={armpincer=1,corgarp=1,legamphtank=1,armanac=1,corsnap=1,legner=1,armsh=1,corsh=1,legsh=1,armzapper=1}function RNG(b,c,d,e)b=b or.5;c=c or 2;d=d or.5;if e and a[e]then c=c*1.5 end;local f;if math.random()<d then local g=math.min(b,1)local h=math.max(b,1)f=math.random()*(h-g)+g else local g=math.min(1,c)local h=math.max(1,c)f=math.random()*(h-g)+g end;return f end;local i={["armmar"]={["armamph_missile"]=1/2},["armthor"]={["arm_thunder"]=.85,["emp"]=1/5},["armbanth"]={["bantha_rocket"]=1/3},["corshiva"]={["shiva_rocket"]=1/2},["cordemon"]={["karg_shoulder"]=1/2},["corjugg"]={global_mult=.3,["juggernaut_fire"]=.95},["corkorg"]={["corkorg_rocket"]=1/4},["corgolt4"]={["corgol_sidelaser"]=1/2},["legjav"]={["aa_gun"]=1/3},["legeshotgunmech"]={global_mult=.6,["shotgun"]=.9,["parabolic_rockets"]=1/6},["legeheatraymech"]={["legflak_gun"]=1/4},["legeheatraymech_old"]={["legflak_gun"]=1/4},["legeallterrainmech"]={["light_antiair_missile"]=1/4},["armlun"]={["depthcharge"]=1/3},["corsok"]={["depthcharge"]=1/3},["legehovertank"]={["depthcharge"]=1/3,["parabolic_rockets"]=1/4},["corcrwh"]={["dragon_missileh"]=1/5},["legfort"]={["aa_missiles"]=1/5},["legfortt4"]={["aa_missiles"]=1/5},["armepoch"]={["ferret_missile"]=1/7},["armfepocht4"]={["ferret_missile"]=1/9},["corblackhy"]={["ferret_missile"]=1/7},["corfblackhyt4"]={["ferret_missile"]=1/9},["cordoom"]={["doomsday_red_laser"]=1/3},["armcroc"]={["armcl_missile"]=1/2},["armvang"]={["shocker_low"]=.9},["armguard"]={["plasma"]=.9},["armamb"]={["armamb_gun"]=.9},["corpun"]={["plasma"]=.9},["cortoast"]={["cortoast_gun"]=.9},["legcluster"]={["plasma"]=.9},["legacluster"]={["plasma"]=.9},["legnavyfrigate"]={["leg_alt_torpedo_launcher"]=.2},["legnavydestro"]={["drone_control_matrix"]=.3},["armcom"]={global_mult=.4,["disintegrator"]=.99},["corcom"]={global_mult=.4,["disintegrator"]=.99},["legcom"]={global_mult=.4,["disintegrator"]=.99}}for j,k in pairs(UnitDefs)do if not string.find(j,"scavengerboss")then local l=0;local m=a[j]and-0.105 or 0;local n=k.customparams;local o=k.metalcost or k.buildcostmetal or 404;local p=k.energycost or k.buildcostenergy or 404;local q=k.buildtime or 404;local r=0.55;local s=0.65;local t=0.09;local u=0.06;local v=0.12;local w=0.15;local x=0.60;local y=-0.50;local z=0.45;local A=0.05;local B=-0.25;local C=0.18;local D=0.59;local E=1.25;local F=0.70;local G=k.health or k.maxdamage;if G then local H=RNG(.6,4,.6,j)local I=math.ceil(G*H)k.health=I;k.maxdamage=I;l=l+r*math.log(H)end;if k.speed then local H=RNG(.5,3,.6,j)if k.canfly and H>1 then H=H*.6 end;k.speed=k.speed*H;l=l+s*math.log(H)if k.cloakcostmoving then k.cloakcostmoving=math.ceil(k.cloakcostmoving*H)end end;if k.maxacc then local H=RNG(.4,3,.45,j)k.maxacc=k.maxacc*H;l=l+t*math.log(H)end;if k.maxdec then local H=RNG(.4,3,.45,j)k.maxdec=k.maxdec*H;l=l+u*math.log(H)end;if k.turnrate then local H=RNG(.4,3,.45,j)k.turnrate=k.turnrate*H;l=l+v*math.log(H)end;if k.sightdistance then local H=RNG(.3,1.5,.6,j)k.sightdistance=k.sightdistance*H;l=l+w*math.log(H)end;k.verticalspeed=k.verticalspeed and k.verticalspeed*RNG(.4,3,.6,j)k.idleautoheal=k.idleautoheal and k.idleautoheal*RNG(.6,10,.8,j)k.idletime=k.idletime and k.idletime*RNG(.6,1.9,.45,j)if not(n and n.unitgroup=="explo")then local J=k.weapondefs;if J then local K=0;local L={}for M,N in pairs(J)do local O=false;if M:find("botdispense")then O=true end;local P=N.customparams;if P and P.bogus and P.bogus==1 then if N.damage then local Q=N.damage.default or 0;local R=N.damage.vtol or 0;if Q==0 and R==0 then O=true end else O=true end end;if not O then K=K+1;L[M]=N end end;local S=i[j]local T;local U=1;if k.speed then local d=k.speed;U=1+2*.25^(d/100)if U<1 then U=1 end else U=3 end;for M,N in pairs(L)do local V;if S then if S[M]then V=S[M]else V=1/math.sqrt(K)if S.global_mult then V=V*S.global_mult end end else V=1/math.sqrt(K)end;if M=="cluster_munition"then V=V*.5 end;local W=N.soundhitdry=="flamhit1"local X=N.soundstart=="nukelaunch"local Y=N.soundstart=="antinukelaunch"local P=N.customparams;local Z=N.weaponvelocity or 1000;local _=N.sprayangle or 0;local a0=N.flighttime;local a1=N.burst or 1;if N.damage and not Y then local a2=(N.damage.vtol or 0)>(N.damage.default or 0)local a3=W and.6 or 1;local a4=RNG(.4,2.2,.45,j)local a5=RNG(.4,2.2,.45,j)for a6,a7 in pairs(N.damage)do if type(a7)=="number"then if a6=="vtol"then N.damage.vtol=a7*a5;local a8=a2 and 1 or.2;l=l+x*a8*V*math.log(a5)*a3 else N.damage[a6]=a7*a4;if a6=="default"then l=l+x*V*math.log(a4)*a3 end end end end;if N.thickness then N.thickness=N.thickness*a4 end;if N.laserflaresize then N.laserflaresize=N.laserflaresize*a4 end;if P and P.area_onhit_damage then P.area_onhit_damage=P.area_onhit_damage*a4 end end;if N.shield then if N.shield.radius then local a9=RNG(.6,1.8,.6,j)N.shield.radius=math.ceil(N.shield.radius*a9)l=l+E*V*math.log(a9)if n and n.shield_radius then n.shield_radius=n.shield_radius*a9 end;if N.shield.power then local aa=RNG(.7,1.4,.6,j)local ab=N.shield.power;local ac=N.shield.power*aa;local ad=(a9+3)/4;ac=ac/ad;N.shield.power=math.ceil(ac)local ae=N.shield.power/ab;l=l+F*V*math.log(ae)if n and n.shield_power then n.shield_power=n.shield_power*aa end;if N.shield.startingpower then N.shield.startingpower=N.shield.startingpower*aa end end end end;if N.reloadtime then local af=RNG(.3,1.9,.45,j)N.reloadtime=N.reloadtime*af;l=l+y*V*math.log(af)end;if N.burst then local ag=RNG(.6,1.67,.6,j)local ah=N.burst*ag;N.burst=math.floor(ah+.5)local ab=a1+1;local ai=N.burst+1;local aj=ai/ab;l=l+D*V*math.log(aj)end;local af=1;if N.range then af=RNG(.4,2.5,.45,j)N.range=N.range*af;local ak=z*V*U;if N.weapontype=="BeamLaser"then ak=ak*1.3 elseif N.weapontype=="LightningCannon"then ak=ak*1.6 end;local al=N.weaponvelocity or Z;if N.tracking==false and al<1000 then ak=ak*al/1000 end;if N.tracking==false and N.sprayangle then local am=N.sprayangle or _;if am>0 then ak=ak-am/10000;if ak<0 then ak=0 end end end;if not(M=="skybeam"or N.weapontype=="AircraftBomb")then l=l+ak*math.log(af)end;if N.mygravity~=nil or N.weaponvelocity then N.mygravity=(N.mygravity or.11)/af end;if P then for an,ao in ipairs{"overrange_distance","engagementrange","controlradius","spark_range"}do local ap=P[ao]if ap then if ao=="spark_range"then P.spark_range=tostring(tonumber(ap)*af)else P[ao]=ap*af end end end end end;if N.weaponvelocity then local a5=RNG(.4,2.2,.45,j)N.weaponvelocity=N.weaponvelocity*a5;if M~="juggernaut_fire"then l=l+C*V*math.log(a5)end;if N.mygravity~=nil then N.mygravity=N.mygravity*a5*a5 end;if N.flighttime and a0 then N.flighttime=N.flighttime*af/a5 end end;if N.areaofeffect and not N.noexplode and not Y then local aq=RNG(.4,3.3,.6,j)N.areaofeffect=N.areaofeffect*aq;local ar=N.areaofeffect/100;local as=A*ar^1.5*V;l=l+as*math.log(aq)if P and P.area_onhit_range then P.area_onhit_range=P.area_onhit_range*aq end;if X then if N.weaponvelocity then N.weaponvelocity=N.weaponvelocity/math.sqrt(aq)end;if N.weaponacceleration then N.weaponacceleration=N.weaponacceleration/math.sqrt(aq)end end end;if N.sprayangle then local at=RNG(.5,3,.6,j)local am=N.sprayangle*at;N.sprayangle=am;local au=B*V*U;if am>0 then au=au/math.pow(am,1/3)end;l=l+au*math.log(at)end;N.weapontimer=N.weapontimer and N.weapontimer*RNG(.6,1.67,.6,j)N.beamtime=N.beamtime and N.beamtime*RNG(.6,1.67,.6,j)N.edgeeffectiveness=N.edgeeffectiveness and N.edgeeffectiveness*RNG(.6,1.67,.6,j)N.burstrate=N.burstrate and N.burstrate*RNG(.6,1.67,.6,j)N.impulsefactor=N.impulsefactor and N.impulsefactor*RNG(.6,2.5,.33,j)if N.startvelocity then local av=RNG(.4,2.5,.6,j)N.startvelocity=N.startvelocity*av;if N.flighttime and av<1 then N.flighttime=N.flighttime/av end end;if N.weaponacceleration then local aq=RNG(.4,2.5,.6,j)if X and aq>.8 then aq=aq*.5 elseif Y and aq<.8 then aq=aq*2 end;N.weaponacceleration=N.weaponacceleration*aq;if N.flighttime and aq<1 then N.flighttime=N.flighttime/aq end end;if N.edgeeffectiveness and N.edgeeffectiveness>.9 then N.edgeeffectiveness=.9 end;if N.ownerExpAccWeight then N.ownerExpAccWeight=math.min(N.ownerExpAccWeight,1.5)end;local aw=1142.857;if N.hightrajectory==1 and N.range and N.weaponvelocity and N.mygravity then local ax=N.range;local ap=N.weaponvelocity;local ay=N.mygravity;local az=aw*ay;local aA=az*ax/(ap*ap)if aA>1 then aA=1 end;if aA>0 then local aB=(math.pi-math.asin(aA))/2;local aC=2*ap*math.sin(aB)/az;local aD=2*ap*math.sin(math.pi/4)/az;local aE=(aC-aD)/aD;N.mygravity=ay*(1+aE)if N.sprayangle then N.sprayangle=N.sprayangle*(1-aE)end end end;if X or Y then if N.range>72000 then N.range=72000 end;if Y then N.flighttime=400;N.turnrate=5000+N.weaponacceleration*50 end;if X then N.startvelocity=30;N.weapontimer=2+3000/N.weaponacceleration^1.7+((N.areaofeffect or 900)-900)/750 end end;if M=="legmed_missile"then T=N.range end;if M=="laser"and T then N.range=T end end;local aF;for M,N in pairs(J)do local P=N.customparams;if P and P.smart_priority then aF=N;break end end;if aF then for M,N in pairs(J)do local P=N.customparams;if P and P.smart_trajectory_checker then N.range=aF.range;N.weaponvelocity=aF.weaponvelocity;N.mygravity=aF.mygravity;break end end end end end;local aG=math.exp(l+m)aG=math.max(0.1,math.min(10.0,aG))*0.5;local aH=math.ceil(o*aG)local aI=math.ceil(p*aG)local aJ=math.ceil(q*aG)if k.speed==nil or k.speed<1 then if k.energymake then if k.energymake>0 and k.energymake<=500 then aH=math.ceil(aH+k.energymake*.5)elseif k.energymake>500 then aH=math.ceil(aH+k.energymake-400)end end;if k.tidalgenerator and k.tidalgenerator>0 then aH=math.ceil(aH+10)end;if k.windgenerator and k.windgenerator>0 then aH=math.ceil(aH+k.windgenerator*.4)end;if n and n.energyconv_capacity and n.energyconv_efficiency then aH=math.ceil(aH+(n.energyconv_efficiency-.014)*n.energyconv_capacity*200)end;if k.builder==true then aH=math.ceil(aH*1.5)aI=math.ceil(aI*1.5)aJ=math.ceil(aJ*1.5)end end;if k.power then k.power=k.power*aG end;k.metalcost=aH;k.energycost=aI;k.buildtime=aJ end end;for f,e in pairs(UnitDefs)do if e.weapondefs then for N,aK in pairs(e.weapondefs)do if aK.burst and aK.reloadtime and aK.burstrate and aK.burstrate>0 then local aL=aK.reloadtime;local aM=aK.burstrate*aK.burst;if aL<=aM*.8 then local aN=math.floor(aM/aL)+1;local aO=aK.projectiles or 1;local ai=aO*aN;aK.projectiles=ai;aK.reloadtime=aL*ai/aO end end end end end;for f,e in pairs(UnitDefs)do if e.weapondefs then for N,aK in pairs(e.weapondefs)do if N=="disintegrator"then local aL=aK.range;if aL and e.speed then if aL<250 then e.speed=e.speed+(250-aL)*.1 elseif aL>250 then e.speed=e.speed*math.max(.5,1-(aL-250)*.001)end end;break end end end end
--Random Rarities by Ambo Tuned v0.10
--Special Thanks to MGGW


-- factories!



local a=UnitDef_Post;local b=false;local c={}function UnitDef_Post(d,e)if not c[d]then if a and a~=UnitDef_Post then a(d,e)end end;if not b then b=true;c={}for f,g in pairs(UnitDefs)do a(f,g)c[f]=true end;rename_list={}local h={"Uncommon","Rare","Exceptional","Epic","Exotic","Legendary","Mythical","Miracle","Divine","Eternal","Supreme","Omega","Unique","Jackpot","Immortal","Absurd","Godlike","TooRNG","Insanely Lucky","Dope","Admin","GOD","ERROR","Super Sayan","Beyond","MGGW","AMBO","Beyond All Reason"}rarity_chance=0.75;function get_rarity(i)local i=i or 0;if math.random()<rarity_chance then if i+1<#h then i=i+1+get_rarity(i)end end;return i end;local j=0.861;function set_v(i,k,l,m)if not i then return nil end;local n=i*k^l^j;if m then n=math.floor(n)end;return n end;local function o(p)if type(p)~='table'then return p end;local q={}for r,s in pairs(p)do q[o(r)]=o(s)end;return q end;local function t(e)return e.metalcost or e.buildcostmetal or 0 end;local function u(e)return e.energycost or e.buildcostenergy or 0 end;local v={}local w={}for d,e in pairs(UnitDefs)do local l=get_rarity()if l>#h then l=#h end;if l>11 and(d=="armcom"or d=="corcom"or d=="legcom")then l=11 end;v[d]=l;if e.customparams and e.customparams.evolution_target then local n=e.customparams.evolution_target;if UnitDefs[n]then w[d]=n end end end;local x={}for d,y in pairs(w)do if not x[d]then local z,A={},d;while A and not x[A]do x[A]=true;table.insert(z,A)A=w[A]end;local B=v[A or z[#z]]for C,g in ipairs(z)do v[g]=B end end end;local D={"armcom","corcom","legcom","corvac","legmohocon"}for C,E in ipairs(D)do if UnitDefs[E]then local F=v[E]for d in pairs(UnitDefs)do if d:find("^"..E)then v[d]=F end end end end;local G={}for d,e in pairs(UnitDefs)do if e.weapondefs then for C,H in pairs(e.weapondefs)do if H.customparams and H.customparams.carried_unit then G[d]=G[d]or{}G[d][H]=H.customparams.carried_unit end end end end;local I={}local J={}local K,L=1,{}for d in pairs(UnitDefs)do L[d]=true end;for M,N in pairs(G)do local O={}for H,P in pairs(N)do if not O[P]then local Q;repeat Q=P.."_"..K;K=K+1 until not L[Q]L[Q]=true;local p=UnitDefs[P]if p then local R=o(p)I[Q]=R;J[Q]=M;if Q:find("legheavydrone")then R.icontype="legheavydrone"elseif Q:find("legdrone")then R.icontype="legdrone"else R.icontype="armdroneold"end;O[P]=Q end end end;for H,P in pairs(N)do if O[P]then H.customparams.carried_unit=O[P]end end end;for Q,R in pairs(I)do UnitDefs[Q]=R;v[Q]=0 end;for d in pairs(UnitDefs)do if d=="armcom"or d=="corcom"or d=="legcom"then if v[d]>11 then v[d]=11 end end end;local S=0.05;local T={}local U={}for d,l in pairs(v)do U[d]=l end;local function V(W,X)if not W or W<0 then return W end;local l=W;local Y=X-l;while Y>=2 do local Z=0.1^(1.2/Y^1.35)if math.random()<Z then l=l+1;Y=X-l else break end end;if l<27 then for C=1,X do if l>=27 then break end;if math.random()<S then l=l+1 end end end;return l end;local _={}for a0,e in pairs(UnitDefs)do if(not e.speed or e.speed<1)and e.buildoptions and#e.buildoptions>0 then local a1=math.min(v[a0],28)if a1 and a1>=0 then local a2={}for C,a3 in ipairs(e.buildoptions)do local W=U[a3]if not W or W<0 then a2[#a2+1]=a3 else local a4=V(W,a1)if not T[a3]then v[a3]=a4;T[a3]=true;a2[#a2+1]=a3 else if a4>W then local Q=a3;local a5=1;while UnitDefs[Q.."_"..a5]or _[Q.."_"..a5]do a5=a5+1 end;Q=Q.."_"..a5;local R=o(UnitDefs[a3])_[Q]=R;R.customparams=R.customparams or{}R.customparams.i18nfromunit=a3;v[Q]=a4;U[Q]=W;T[Q]=true;a2[#a2+1]=Q else a2[#a2+1]=a3 end end end end;e.buildoptions=a2 end end end;for d,R in pairs(_)do UnitDefs[d]=R end;for Q,M in pairs(J)do v[Q]=v[M]end;for d,e in pairs(UnitDefs)do local a6=v[d]local a7=e.metalcost and"metalcost"or"buildcostmetal"local a8=e.energycost and"energycost"or"buildcostenergy"local a9=e.health and"health"or"maxdamage"if not e.power then e.power=e[a7]+e[a8]/60 end;local aa=a6;if aa>#h then a6=#h end;if aa>11 and(d=="armcom"or d=="corcom"or d=="legcom")then a6=11 end;local ab=not e.speed or e.speed<1;if aa>0 then e.power=set_v(e.power,1.35,a6)e.speed=set_v(e.speed,0.98,a6,true)e.maxacc=set_v(e.maxacc,1.05,a6)e.maxdec=set_v(e.maxdec,1.05,a6)e.turnrate=set_v(e.turnrate,1.05,a6)e.verticalspeed=set_v(e.verticalspeed,1.05,a6)e.sightdistance=set_v(e.sightdistance,1.05,a6)e.seismicdistance=set_v(e.seismicdistance,1.02,a6)e.sonardistance=set_v(e.sonardistance,1.05,a6)e.radardistancejam=set_v(e.radardistancejam,1.05,a6)e.radardistance=set_v(e.radardistance,1.1,a6)e.radaremitheight=set_v(e.radaremitheight,1.05,a6)e[a9]=set_v(e[a9],1.1,a6,true)e.idleautoheal=set_v(e.idleautoheal,1.1,a6)e.energystorage=set_v(e.energystorage,1.15,a6,true)e.metalstorage=set_v(e.metalstorage,1.15,a6,true)e.energymake=set_v(e.energymake,1.04,a6)e.extractsmetal=set_v(e.extractsmetal,1.05,a6)e.energyupkeep=set_v(e.energyupkeep,1.04,a6)e.tidalgenerator=set_v(e.tidalgenerator,1.04,a6)if e.windgenerator then e.buildtime=set_v(e.buildtime,0.83,a6)e[a8]=set_v(e[a8],0.95,a6,true)end;local ac=e.customparams;local ad=false;local ae=false;local af=false;local ag=e.weapondefs and next(e.weapondefs)~=nil;local ah=false;if ag then ah=true;for C,H in pairs(e.weapondefs)do if not(H.customparams and H.customparams.bogus==1)then ah=false;break end end end;if ac and ac.unitgroup=="explo"or ah then ad=true elseif ag then af=true elseif e.tidalgenerator or e.windgenerator or e.extractsmetal or e.energymake or e.builder and not ag or ac and ac.energyconv_capacity then ae=true else ad=true end;e.workertime=set_v(e.workertime,1.05,a6,true)e.repairspeed=set_v(e.repairspeed,1.05,a6,true)e.reclaimspeed=set_v(e.reclaimspeed,1.05,a6,true)if af then e[a7]=set_v(e[a7],1.035,a6,true)e[a8]=set_v(e[a8],1.04,a6,true)local ai=ab and 1.18 or 1.15;e.power=set_v(e.power,0.95,a6)e.buildtime=set_v(e.buildtime,ai,a6)elseif ae then e[a7]=set_v(e[a7],0.97,a6,true)e[a8]=set_v(e[a8],0.98,a6,true)local ai=ab and 1.2 or 1.14;e.buildtime=set_v(e.buildtime,ai,a6)else e[a7]=set_v(e[a7],0.97,a6,true)e[a8]=set_v(e[a8],0.98,a6,true)e.buildtime=set_v(e.buildtime,0.98,a6)e[a9]=set_v(e[a9],1.05,a6,true)e.speed=set_v(e.speed,1.05,a6,true)end;if ac then ac.energyconv_efficiency=set_v(ac.energyconv_efficiency,1.03,a6)ac.energyconv_capacity=set_v(ac.energyconv_capacity,1.04,a6,true)ac.shield_power=set_v(ac.shield_power,1.1,a6,true)ac.shield_radius=set_v(ac.shield_radius,1.05,a6,true)end;if e.weapondefs then for aj,H in pairs(e.weapondefs)do if H.interceptor==1 or H.targetable==1 then H.coverage=set_v(H.coverage,1.02,a6,true)H.damage.default=set_v(H.damage.default,1.1,a6)H.areaofeffect=set_v(H.areaofeffect,1.01,a6)else local ak=nil;local al=H.customparams;if H.burst and H.burstrate then ak=H.burst*H.burstrate elseif H.beamtime then ak=H.beamtime end;local am=H.reloadtime;local an=set_v(am,0.96,a6)local ao=false;if ak and am and ak*1.5>=an or an and an<0.1 or al and al.sweepfire then ao=true end;local ap=ao and 0.05 or 0;H.reloadtime=ao and am or an;if H.damage then for aq,ar in pairs(H.damage)do if type(ar)=="number"then H.damage[aq]=set_v(ar,1.05+ap,a6)end end end;H.laserflaresize=set_v(H.laserflaresize,1.02+ap/2,a6)H.size=set_v(H.size,1.08+ap,a6)H.thickness=set_v(H.thickness,1.06+ap,a6)H.soundstartvolume=set_v(H.size,1.04+ap,a6)H.soundhitvolume=set_v(H.size,1.04+ap,a6)H.areaofeffect=set_v(H.areaofeffect,1.03,a6)if H.areaofeffect then H.areaofeffect=H.areaofeffect+4*a6 end;H.energypershot=set_v(H.energypershot,1.08,a6,true)H.metalpershot=set_v(H.metalpershot,1.05,a6,true)H.stockpiletime=set_v(H.stockpiletime,0.96,a6,true)H.weaponvelocity=set_v(H.weaponvelocity,1.03,a6)H.startvelocity=set_v(H.startvelocity,1.03,a6)H.turnrate=set_v(H.turnrate,1.03,a6)local as=ab and 1.02 or 1.03;if aj~="disintegrator"then H.range=set_v(H.range,as,a6,true)end;H.sprayangle=set_v(H.sprayangle,0.98,a6)H.accuracy=set_v(H.accuracy,0.98,a6)H.weaponacceleration=set_v(H.weaponacceleration,1.03,a6)H.flighttime=set_v(H.flighttime,1.03,a6)if al then local at=tonumber(al.spark_range)if at then al.spark_range=tostring(set_v(at,1.05,a6,true))end;if al.engagementrange then al.engagementrange=set_v(al.engagementrange,1.03,a6,true)end;if al.controlradius then al.controlradius=set_v(al.controlradius,1.03,a6,true)end;al.area_onhit_damage=set_v(al.area_onhit_damage,1.05,a6,true)al.area_onhit_range=set_v(al.area_onhit_range,1.03,a6,true)al.overrange_distance=set_v(al.overrange_distance,1.03,a6,true)end;if H.shield then H.shield.power=set_v(H.shield.power,1.1,a6,true)H.shield.powerregen=set_v(H.shield.powerregen,1.05,a6,true)H.shield.radius=set_v(H.shield.radius,1.05,a6,true)H.shield.force=set_v(H.shield.force,1.05,a6)H.shield.powerregenenergy=set_v(H.shield.powerregenenergy,0.99,a6,true)end end;if H.hightrajectory==1 and H.range and H.weaponvelocity and H.mygravity then local au=1142.857;local av=H.range;local s=H.weaponvelocity;local aw=H.mygravity;local ax=au*aw;local ay=ax*av/(s*s)if ay>1 then ay=1 end;if ay>0 then local az=(math.pi-math.asin(ay))/2;local aA=2*s*math.sin(az)/ax;local aB=2*s*math.sin(math.pi/4)/ax;local aC=(aA-aB)/aB;H.mygravity=aw*(1+aC)if H.sprayangle then H.sprayangle=H.sprayangle*(1-aC)end end end end end;if d then table.insert(rename_list,{d,"prefix","["..h[a6].."]"})table.insert(rename_list,{d,"desc_prefix","Mk."..a6 .."   "})end else if d then table.insert(rename_list,{d,"prefix","[Common]"})table.insert(rename_list,{d,"desc_prefix","Mk."..a6 .." "})end end end;local aD={["armthovr"]={{4,"armpw"},{1,"armwar"}},["crothovr"]={{2,"corak"},{1,"corthud"}},["legthovr"]={{6,"leggob"},{2,"legcen"},{1,"legkark"}},["corintr"]={{1,"corcan"}}}for d,aE in pairs(aD)do local e=UnitDefs[d]if e and e.weapondefs then local aF,aG=0,0;for C,aH in ipairs(aE)do local aI=UnitDefs[aH[2]]if aI then aF=aF+t(aI)*aH[1]aG=aG+u(aI)*aH[1]end end;for C,H in pairs(e.weapondefs)do H.metalpershot=aF;H.energypershot=aG end end end;Spring.Echo("tweakdefs_rename_get_ready")for aJ,aH in pairs(rename_list)do Spring.Echo("/("..aH[1].."/-"..aH[2].."/-"..aH[3].."/)")end;Spring.Echo("tweakdefs_rename_end")Spring.Echo("Added "..#rename_list.." tweakdefs_rename_instructions")end end

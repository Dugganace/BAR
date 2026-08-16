-- Your master list reorganized by Faction, Type, and Tier
local unitsToTry = {
    -- ARMADA BOTS (T1)
    "armflea", "armham", "armjeth", "armpw", "armrock",
  
      -- CORTEX BOTS (T1)
    "corak", "corcrash", "corstorm", "corthud",
    -- ARMADA BOTS (T2)
    "armwar", "armaak", "armamph", "armaser", "armfast", "armfboy", "armfido", 
    "armhack", "armmark", "armmav", "armscab", "armsnipe", "armspid", "armsptk", 
    "armvader", "armzeus",
  
      -- CORTEX BOTS (T2)
    "coraak", "coramph", "corcan", "corhrk", "cormort", "corpyro", "corroach", 
    "corsktl", "corspec", "corspy", "corsumo", "cortermite", "corvoyr",

    -- ARMADA VEHICLES (T1)
    "armart", "armfav", "armflash", "armjanus", "armpincer", "armsam", "armstump",
      -- CORTEX VEHICLES (T1)
    "corfav", "corgarp", "corgator", "corlevlr", "cormist", "corraid", "corwolv",
    -- ARMADA VEHICLES (T2)
    "armbull", "armcroc", "armgremlin", "armjam", "armlatnk", "armmanni", "armmart", 
    "armmerl", "armseer", "armyork",
      -- CORTEX VEHICLES (T2)
    "corban", "coreter", "corgol", "cormabm", "cormart", "corparrow", "corphantom", 
    "correap", "corsala", "corseal", "corsent", "corsiegebreaker", "cortrem", 
    "corvrad", "corvroc",
    -- ARMADA AIR
    "armdrone", "armfig", "armkam", "armpeep", "armthund", "armawac", "armblade", 
    "armbrawl", "armdfly", "armhawk", "armlance", "armliche", "armpnix", "armstil",
      -- CORTEX AIR
    "cordrone", "corfink", "corshad", "corveng", "corape", "corawac", "corcrwh", 
    "corhurc", "corseah", "cortitan", "corvamp",

    -- ARMADA SEA & HOVER
    "armdecade", "armpship", "armpt", "armroy", "armsub", "armtorps", "armaas", 
    "armantiship", "armbats", "armcarry", "armcrus", "armepoch", "armexcalibur", 
    "armlship", "armmship", "armseadragon", "armserp", "armsjam", "armsubk", "armtrident",
    "armsaber", "armsb", "armseap", "armsehak", "armsfig", "armsfig2", "armah", 
    "armanac", "armmh", "armsh",
  
      -- CORTEX SEA & HOVER
    "coresupp", "corpship", "corpt", "corroy", "corsub", "corantiship", "corarch", 
    "corbats", "corblackhy", "corcarry", "corcrus", "cordesolator", "corfship", 
    "cormship", "coronager", "corprince", "corsentinel", "corshark", "corsjam", 
    "corssub", "cortdrone", "corah", "corhal", "cormh", "corsh", "corsnap",

    -- ARMADA T3 / GANTRY
    "armbanth", "armlun", "armmar", "armprowl", "armraz", "armthor", "armvang",

    -- CORTEX T3 / GANTRY
    "corcat", "cordemon", "corjugg", "corkarg", "corgorg", "corshiva", "corsok"
}

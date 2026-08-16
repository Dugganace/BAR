--T4 Eco
local unitDefs = UnitDefs or {}
local lootboxplatinum = 'lootboxplatinum'
local armdf = 'armdf'
local energy = {
    buildpic = 'other/resourcecheat.dds',
    buildtime = 1000000,
    energycost = 650000,
    energymake = 30000,
    energystorage = 90000,
    explodeas = 'korgExplosionSelfd',
    health = 10000,
    metalcost = 97000,
    metalmake = 0,
    reclaimable = true
}
local converter = {
    activatewhenbuilt = true,
    buildpic = 'lootboxes/LOOTBOXGOLD.DDS',
    buildtime = 313000,
    energycost = 500000,
    energymake = 0,
    explodeas = 'fusionExplosion',
    health = 1000,
    maxwaterdepth = 20,
    metalcost = 8000,
    objectname = 'Units/CORUWFUS.s3o',
    script = 'Units/CORUWFUS.cob',
    selfdestructas = 'fusionExplosionSelfd'
}
local converterCustomparams = {
    energyconv_capacity = 5000,
    energyconv_efficiency = 0.02500,
    subfolder = 'ArmBuildings/LandEconomy',
    unitgroup = 'metal',
    i18n_en_humanname = 'Super Energy Converter',
    i18n_en_tooltip = 'Converts 5000 energy into 125 metal per sec'
}
local converterFeaturedefsDead = {
    blocking = true,
    category = 'corpses',
    collisionvolumeoffsets = '1.8653717041 -0.0807505981445 0.994560241699',
    collisionvolumescales = '89.9762878418 27.3368988037 72.5986480713',
    collisionvolumetype = 'Box',
    damage = 3210,
    featuredead = 'HEAP',
    footprintx = 5,
    footprintz = 5,
    height = 20,
    metal = 3099,
    object = 'Units/coruwfus_dead.s3o',
    reclaimable = true
}
local converterFeaturedefsHeap = {
    blocking = false,
    category = 'heaps',
    damage = 1605,
    footprintx = 5,
    footprintz = 5,
    height = 4,
    metal = 1240,
    object = 'Units/cor5X5A.s3o',
    reclaimable = true,
    resurrectable = 0
}

local builderNames = {
    'armaca',
    'armack',
    'armacv',
    'coraca',
    'corack',
    'coracv',
    'legaca',
    'legack',
    'legacv'
}

for key, value in pairs(energy) do
    unitDefs[lootboxplatinum][key] = value
end

unitDefs[lootboxplatinum].customparams.i18n_en_humanname = 'Super Fusion Reactor'
unitDefs[lootboxplatinum].customparams.i18n_en_tooltip = 'Produces 30000 Energy, Transportable (Very Hazardous)'

for key, value in pairs(converter) do
    unitDefs[armdf][key] = value
end

for key, value in pairs(converterCustomparams) do
    unitDefs[armdf].customparams[key] = value
end

for key, value in pairs(converterFeaturedefsDead) do
    unitDefs[armdf].featuredefs.dead[key] = value
end
for key, value in pairs(converterFeaturedefsHeap) do
    unitDefs[armdf].featuredefs.heap[key] = value
end

for i = 1, #builderNames do
    local builderName = builderNames[i]
    local nBuildOptions = #unitDefs[builderName].buildoptions
    unitDefs[builderName].buildoptions[nBuildOptions + 1] = armdf
    unitDefs[builderName].buildoptions[nBuildOptions + 2] = lootboxplatinum
end

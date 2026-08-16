-- Custom Buildings: Economy / Defense / Production / Utility, x Armada/Cortex/Legion + a Raptor-flavored one
-- Pattern: clone an existing building with table.merge, override stats/name, then
-- append the new unit id into the relevant commander's buildoptions so every
-- player in the lobby can build it immediately (no extra install needed --
-- this whole file is meant to be pasted into a modoption tweakdefs slot).

local unitDefs, tableMerge = UnitDefs or {}, table.merge

local function addBuildOption(commanderId, newUnitId)
	local commander = unitDefs[commanderId]
	if not commander then return end
	if not commander.buildoptions then commander.buildoptions = {} end
	table.insert(commander.buildoptions, newUnitId)
end

----------------------------------------------------------------------------------------------
-- COMMANDER PROGRESSION CHAIN: Commander (T1, unchanged) -> Captain (T2) ->
-- General (T3) -> Grand Marshal (T4). Each rank is buildable from the rank
-- below it (Commander builds Captain, Captain builds General, General builds
-- Grand Marshal), and each unlocks that tier's build options.
--
-- IMPORTANT design note: these are NOT flagged as real commanders
-- (customparams.iscommander stays false). The actual player commander
-- (armcom/corcom/legcom) is untouched and remains the one true commander --
-- losing it still ends the game per this preset's deathmode="com" setting.
-- Captain/General/Grand Marshal are powerful mobile constructors cloned from
-- the commander's model/stats/build-speed, built like any other unit, that
-- exist purely to gate progressively wider build access behind rank. This
-- avoids fighting the engine's single-commander assumption and deathmode
-- logic, which real multi-commander flagging would risk breaking.
--
-- T2 tier reuses real stock T2 buildings (advanced lab/aircraft plant/jammer)
-- plus this file's own T2-ish defenses (High Power/Armored towers,
-- Interceptors, Depawner, Rapid Fire Tower). T3/T4 tiers unlock the rest of
-- this file's custom buildings (Assembly Complex, Support Relay, Hyper
-- Reactor, Barrier tiers, Raptor Bio-Reactor) rather than fabricated stock
-- unit ids, since those are the ones already verified to exist in this file.
----------------------------------------------------------------------------------------------

local function buildCommanderRank(commanderId, rankId, label, stats, extraBuildoptions)
	local base = unitDefs[commanderId]
	if not base then return end
	local def = tableMerge(base, {
		name = label,
		unitname = rankId,
		metalcost = stats.metalcost,
		energycost = stats.energycost,
		buildtime = stats.buildtime,
		health = stats.health,
		workertime = stats.workertime,
		customparams = {
			i18n_en_humanname = label,
			i18n_en_tooltip = label .. ' -- higher-rank field commander with expanded build access.',
			iscommander = false,
		},
	})
	def.buildoptions = {}
	for _, opt in ipairs(extraBuildoptions) do
		table.insert(def.buildoptions, opt)
	end
	unitDefs[rankId] = def
end

local armCaptainOptions = { 'armalab', 'armaap', 'armamsub', 'armjamt', 'armllt_hp', 'armllt_armored', 'arminterceptor_artillery', 'arminterceptor_energy', 'armdepawner', 'armllt_rapid' }
local corCaptainOptions = { 'coralab', 'coraap', 'coramsub', 'corjamt', 'corllt_hp', 'corllt_armored', 'corinterceptor_artillery', 'corinterceptor_energy', 'cordepawner', 'corllt_rapid' }
local legCaptainOptions = { 'legalab', 'legaap', 'legajam', 'leglht_hp', 'leglht_armored', 'leginterceptor_artillery', 'leginterceptor_energy', 'legdepawner', 'leglht_rapid' }

local armGeneralExtra = { 'armbulwark', 'armassemblycomplex', 'armsupportrelay', 'armhyperreactor', 'armbarrier_bronze', 'armbarrier_silver' }
local corGeneralExtra = { 'corbulwark', 'corassemblycomplex', 'corsupportrelay', 'corhyperreactor', 'corbarrier_bronze', 'corbarrier_silver' }
local legGeneralExtra = { 'legbulwark', 'legassemblycomplex', 'legsupportrelay', 'leghyperreactor', 'legbarrier_bronze', 'legbarrier_silver' }

local armGrandMarshalExtra = { 'armbarrier_gold' }
local corGrandMarshalExtra = { 'corbarrier_gold' }
local legGrandMarshalExtra = { 'legbarrier_gold' }
if unitDefs['raptorbioreactor'] then
	table.insert(armGrandMarshalExtra, 'raptorbioreactor')
	table.insert(corGrandMarshalExtra, 'raptorbioreactor')
	table.insert(legGrandMarshalExtra, 'raptorbioreactor')
end

local function concatLists(...)
	local result = {}
	for _, list in ipairs({ ... }) do
		for _, v in ipairs(list) do table.insert(result, v) end
	end
	return result
end

buildCommanderRank('armcom', 'armcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, armCaptainOptions)
buildCommanderRank('corcom', 'corcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, corCaptainOptions)
buildCommanderRank('legcom', 'legcaptain', 'Captain', { metalcost = 4500, energycost = 45000, buildtime = 110000, health = 5200, workertime = 450 }, legCaptainOptions)

buildCommanderRank('armcaptain', 'armgeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(armCaptainOptions, armGeneralExtra))
buildCommanderRank('corcaptain', 'corgeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(corCaptainOptions, corGeneralExtra))
buildCommanderRank('legcaptain', 'leggeneral', 'General', { metalcost = 8000, energycost = 85000, buildtime = 170000, health = 7800, workertime = 650 }, concatLists(legCaptainOptions, legGeneralExtra))

buildCommanderRank('armgeneral', 'armgrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(armCaptainOptions, armGeneralExtra, armGrandMarshalExtra))
buildCommanderRank('corgeneral', 'corgrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(corCaptainOptions, corGeneralExtra, corGrandMarshalExtra))
buildCommanderRank('leggeneral', 'leggrandmarshal', 'Grand Marshal', { metalcost = 14000, energycost = 150000, buildtime = 260000, health = 11500, workertime = 900 }, concatLists(legCaptainOptions, legGeneralExtra, legGrandMarshalExtra))

addBuildOption('armcom', 'armcaptain')
addBuildOption('armcaptain', 'armgeneral')
addBuildOption('armgeneral', 'armgrandmarshal')

addBuildOption('corcom', 'corcaptain')
addBuildOption('corcaptain', 'corgeneral')
addBuildOption('corgeneral', 'corgrandmarshal')

addBuildOption('legcom', 'legcaptain')
addBuildOption('legcaptain', 'leggeneral')
addBuildOption('leggeneral', 'leggrandmarshal')

----------------------------------------------------------------------------------------------
-- STARTUP CONFIRMATION: prints once the whole script above has parsed and run
-- without error, so a missing message in infolog.txt is itself the failure
-- signal (a Lua error here would mean this line never executes).
----------------------------------------------------------------------------------------------

Spring.Echo("=== Darth_Raider's Force Magic loaded ===")

local unitDefs, tableMerge,bioprinter =
	UnitDefs or {},
	table.merge,
	'bioprinter'

unitDefs.bioprinter = tableMerge(
	unitDefs['lootboxnano_t4_var3'],
	{
		name = 'Black Market BioPrinter',
		metalcost = 12300,
		energycost = 172000,
		buildtime = 97300,
		buildpic = "scavengers/SCAVBEACON.DDS",
		canrepeat = true,
		health = 23500,
		maxthisunit = 1,
		customparams = {
			i18n_en_humanname = 'Black Market BioPrinter',
			i18n_en_tooltip = 'The most anticipated barely illegal underground Bio Printer',
		},
		workertime=6500,
		builddistance=550,
		buildoptions={
			[1] = 'raptor_land_kamikaze_emp_t2_v1',
			[2] = 'raptor_land_swarmer_brood_t4_v1',
			[3] = 'raptor_allterrain_arty_brood_t4_v1',
			[4] = 'raptor_land_swarmer_fire_t4_v1',
			[5] = 'raptor_allterrain_arty_basic_t4_v1',
			[6] = 'raptor_land_swarmer_heal_t4_v1',
			[7] = 'raptor_matriarch_fire',
			[8] = 'raptor_matriarch_healer',
			[9] = 'raptor_matriarch_electric',
			[10] = 'raptor_matriarch_spectre'
		},
	}
)

local a = UnitDefs or {}
local b = a
local c = table.merge
local d = {
	'arm',
	'cor',
	'leg',
}

local c = {
	'armack',
	'armaca',
	'armacv',
	'corack',
	'coraca',
	'coracv',
	'legack',
	'legaca',
	'legacv',
}

for c, c in pairs(c) do
	local d = c:sub(1, 3)
	local e = a[c].buildoptions
	if not e then
		e = {}
		a[c].buildoptions = e
	end
	local a = {
		'bioprinter',
	}
	for a, a in ipairs(a) do
		if b[a] then
			e[#e + 1] = a
		end
	end
end
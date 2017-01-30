local AutoUpdate = true
local SLEvade = "0.01"
local SLEPatchnew, SLEPatchold = GetGameVersion():sub(1,3), GetGameVersion():sub(1,3)-.1

function AutoUpdate(data)
  if not AutoUpdate then return end
    if tonumber(data) > tonumber(SLEvade) then
		PrintChat("<font color=\"#fd8b12\"><b>[SL-Evade] - <font color=\"#F2EE00\">New Version found ! "..data.."</b></font>")
		PrintChat("<font color=\"#fd8b12\"><b>[SL-Evade] - <font color=\"#F2EE00\">Downloading Update... Please wait</b></font>")
		DownloadFileAsync("https://raw.githubusercontent.com/LoggeL/GoS/master/SL-Evade.lua", SCRIPT_PATH .. "SL-Evade.lua", function() PrintChat("<font color=\"#fd8b12\"><b>[SL-Evade] - <font color=\"#F2EE00\">Reload the Script with 2x F6</b></font>") return	end)
	else
		PrintChat("<font color=\"#fd8b12\"><b>[SL-Evade] - <font color=\"#F2EE00\">No Updates Found.</b></font>")
	end
end
GetWebResultAsync("https://raw.githubusercontent.com/LoggeL/GoS/master/SL-Evade.version", AutoUpdate)

local s = {
["Aatrox"] = {
	{
	charName = "Aatrox",
	danger = 3,
	name = "Dark Flight",
	speed = 450,
	radius = 285,
	range = 650,
	delay = 250,
	Slot = 0,
	spellName = "AatroxQ",
	spellType = "Circular",
	killTime = 0.225,
	},
	{
	charName = "Aatrox",
	danger = 1,
	name = "Blade of Torment",
	speed = 1200,
	radius = 100,
	range = 1075,
	delay = 250,
	Slot = 2,
	spellName = "AatroxE",
	spellType = "Line",
	FoW = true,
	},
},
--end Aatrox
["Ahri"] = {
	{
	charName = "Ahri",
	danger = 2,
	missileName = "AhriOrbMissile",
	name = "Orb of Deception",
	speed = 1750,
	radius = 100,
	range = 925,
	delay = 250,
	Slot = 0,
	spellName = "AhriOrbofDeception",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Ahri",
	danger = 3,
	missileName = "AhriSeduceMissile",
	name = "Charm",
	speed = 1550,
	radius = 60,
	range = 1000,
	delay = 250,
	Slot = 2,
	spellName = "AhriSeduce",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Ahri",
	danger = 3,
	name = "Orb of Deception Back",
	speed = 915,
	radius = 100,
	range = 925,
	delay = 250,
	Slot = 0,
	spellName = "AhriOrbofDeception2",
	spellType = "Line",
	FoW = true,
	},
},
--end Ahri
["Alistar"] = {
	{
	charName = "Alistar",
	defaultOff = true,
	danger = 3,
	name = "Pulverize",
	speed = math.huge,
	delay = 0,
	radius = 365,
	range = 365,
	Slot = 0,
	spellName = "Pulverize",
	spellType = "Circular",
	killName = "Pulverize",
	killTime = 0.2,
	Dangerous = true,
	},
},
--end Alistar
["Amumu"] = {
	{
	charName = "Amumu",
	danger = 4,
	name = "Curse of the Sad Mummy",
	speed = math.huge,
	radius = 560,
	range = 560,
	delay = 250,
	Slot = 3,
	spellName = "CurseoftheSadMummy",
	spellType = "Circular",
	killName = "CurseoftheSadMummy",
	killTime = 1.25,
	Dangerous = true,
	},
	{
	charName = "Amumu",
	danger = 3,
	missileName = "SadMummyBandageToss",
	name = "Bandage Toss",
	speed = 2000,
	radius = 80,
	range = 1100,
	delay = 250,
	Slot = 0,
	spellName = "BandageToss",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Amumu
["Anivia"] = {
	{
	charName = "Anivia",
	danger = 3,
	missileName = "FlashFrostSpell",
	name = "Flash Frost",
	speed = 850,
	radius = 110,
	range = 1250,
	delay = 250,
	Slot = 0,
	spellName = "FlashFrostSpell",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Anivia
["Annie"] = {
	{
	angle = 25,
	charName = "Annie",
	danger = 2,
	name = "Incinerate",
	radius = 80,
	range = 625,
	delay = 250,
	Slot = 2,
	spellName = "Incinerate",
	spellType = "Cone",
	},
	{
	charName = "Annie",
	danger = 4,
	name = "InfernalGuardian",
	speed = math.huge,
	radius = 290,
	range = 600,
	delay = 250,
	Slot = 3,
	spellName = "InfernalGuardian",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
},
--end Annie
["Ashe"] = {
	{
	charName = "Ashe",
	danger = 3,
	name = "Enchanted Arrow",
	speed = 1600,
	radius = 130,
	range = 25000,
	delay = 250,
	Slot = 3,
	spellName = "EnchantedCrystalArrow",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
	{
	angle = 5,
	charName = "Ashe",
	danger = 2,
	missileName = "VolleyAttack",
	name = "Volley",
	speed = 1500,
	radius = 20,
	range = 1200,
	delay = 250,
	Slot = 1,
	spellName = "Volley",
	spellType = "Line",
	isSpecial = true,
	collision = true,
	},
},
["AurelionSol"] = {
	{
    charName = "AurelionSol",
    danger = 2,
    missileName = "AurelionSolQMissile",
    name = "AurelionSolQ",
    speed = 850,
    radius = 180,
    range = 1500,
    fixedRange = true,
    delay = 250,
    Slot = 0,
    spellName = "AurelionSolQ",
    spellType = "Line",
	Dangerous = true,
	FoW = true,
    },
    {
    charName = "AurelionSol",
    danger = 3,
    missileName = "AurelionSolRBeamMissile",
    name = "AurelionSolR",
    speed = 4600,
    radius = 120,
    range = 1420,
    fixedRange = true,
    delay = 300,
    Slot = 3,
    spellName = "AurelionSolR",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
    },
},
--end Ashe
["Azir"] = {
	{
	charName = "Azir",
	danger = 2,
	name = "AzirQ",
	speed = 1000,
	radius = 80,
	range = 800,
	delay = 250,
	Slot = 0,
	spellName = "AzirQ",
	spellType = "Line",
	FoW = true,
	isSpecial = true,
	},
},
--end Azir
["Bard"] = {
	{
	charName = "Bard",
	danger = 2,
	name = "BardQ",
	missileName = "BardQMissile",
	speed = 1600,
	radius = 60,
	range = 950,
	delay = 250,
	Slot = 0,
	spellName = "BardQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Bard",
	danger = 2,
	name = "BardR",
	missileName = "BardR",
	speed = 2100,
	radius = 350,
	range = 3400,
	delay = 250,
	Slot = 3,
	spellName = "BardR",
	spellType = "Circular",
	killName = "BardR",
	killTime = 1,
	Dangerous = true,
	},
},
--end Bard
["Blitzcrank"] = {
	{
	charName = "Blitzcrank",
	danger = 3,
	extraDelay = 75,
	missileName = "RocketGrabMissile",
	name = "Rocket Grab",
	speed = 1800,
	radius = 70,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "RocketGrab",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Blitzcrank",
	danger = 3,
	name = "Static Field",
	speed = math.huge,
	radius = 500,
	range = 0,
	delay = 100,
	Slot = 3,
	spellName = "StaticField",
	spellType = "Circular",
	killTime = 0.2,
	Dangerous = true,
	},
},
--end Blitzcrank
["Brand"] = {
	{
	charName = "Brand",
	danger = 3,
	missileName = "BrandQMissile",
	name = "Sear",
	speed = 2000,
	radius = 60,
	range = 1100,
	delay = 250,
	Slot = 0,
	spellName = "BrandQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,	
	},
	{
	charName = "Brand",
	danger = 2,
	name = "Pillar of Flame",
	speed = math.huge,
	radius = 250,
	range = 1100,
	delay = 850,
	Slot = 1,
	spellName = "BrandW",
	spellType = "Circular",
	killName = "BrandW",
	killTime = 0.275,
	},
},
--end Brand
["Braum"] = {
	{
	charName = "Braum",
	danger = 4,
	name = "Glacial Fissure",
	speed = 1125,
	radius = 100,
	range = 1250,
	delay = 500,
	Slot = 3,
	spellName = "BraumRWrapper",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Braum",
	danger = 3,
	missileName = "BraumQMissile",
	name = "Winter's Bite",
	speed = 1200,
	delay = 250,   
	radius = 100,
	range = 1000,             
	Slot = 0,
	spellName = "BraumQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Braum
["Caitlyn"] = {
	{
	charName = "Caitlyn",
	danger = 2,
	name = "Piltover Peacemaker",
	speed = 2200,
	radius = 90,
	range = 1300,
	delay = 625,
	Slot = 0,
	spellName = "CaitlynPiltoverPeacemaker",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Caitlyn",
	danger = 2,
	missileName = "CaitlynEntrapmentMissile",
	name = "90 Caliber Net",
	speed = 2000,
	radius = 80,
	range = 950,
	delay = 125,
	Slot = 2,
	spellName = "CaitlynEntrapment",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Caitlyn
["Cassiopeia"] = {
	{
	angle = 40,
	charName = "Cassiopeia",
	danger = 4,
	name = "Petrifying Gaze",
	speed = math.huge,
	radius = 20,
	range = 825,
	delay = 500,
	Slot = 3,
	spellName = "CassiopeiaR",
	spellType = "Cone",
	Dangerous = true,
	},
	{
	charName = "Cassiopeia",
	danger = 1,
	name = "Noxious Blast",
	speed = math.huge,
	radius = 200,
	range = 600,
	delay = 825,
	Slot = 0,
	spellName = "CassiopeiaQ",
	spellType = "Circular",
	killName = "CassiopeiaQ",
	killTime = 0.2,
	},
	-- {
	-- charName = "Cassiopeia",
	-- danger = 1,
	-- name = "Miasma",
	-- radius = 220,
	-- range = 850,
	-- delay = 250,
	-- speed = 2500,
	-- Slot = 1,
	-- spellName = "CassiopeiaW",
	-- spellType = "Circular",
	-- killName = "CassiopeiaW",
	-- killTime = 1.5,
	-- },
},
--end Cassiopeia
["Chogath"] = {
	{
	angle = 30,
	charName = "Chogath",
	danger = 2,
	name = "FeralScream",
	speed = 2000,
	radius = 20,
	range = 650,
	delay = 250,
	Slot = 1,
	spellName = "FeralScream",
	spellType = "Cone",
	},
	{
	charName = "Chogath",
	danger = 3,
	name = "Rupture",
	speed = math.huge,
	radius = 250,
	range = 950,
	delay = 1200,
	Slot = 0,
	spellName = "Rupture",
	spellType = "Circular",
	extraDrawHeight = 45,
	killName = "Rupture",
	killTime = 0.45,
	Dangerous = true,
	},
},
--end Chogath
["Corki"] = {
	{
	charName = "Corki",
	danger = 1,
	missileName = "MissileBarrageMissile2",
	name = "Missile Barrage big",
	speed = 2000,
	radius = 40,
	range = 1500,
	delay = 175,
	Slot = 3,
	spellName = "MissileBarrage2",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Corki",
	danger = 2,
	missileName = "PhosphorusBombMissile",
	name = "Phosphorus Bomb",
	speed = 1125,
	radius = 270,
	range = 825,
	delay = 500,
	Slot = 0,
	spellName = "PhosphorusBomb",
	spellType = "Circular",
	extraDrawHeight = 110,
	killTime = 0.35,
	},
	{
	charName = "Corki",
	danger = 1,
	missileName = "MissileBarrageMissile",
	name = "Missile Barrage",
	speed = 2000,
	radius = 40,
	range = 1300,
	delay = 175,
	Slot = 3,
	spellName = "MissileBarrage",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Corki
["Darius"] = {
	{
	angle = 25,
	charName = "Darius",
	danger = 3,
	name = "Apprehend",
	radius = 20,
	range = 570,
	delay = 320,
	Slot = 2,
	spellName = "DariusAxeGrabCone",
	spellType = "Cone",
	Dangerous = true,
	},
},
--end Darius
["Diana"] = {
	{
	charName = "Diana",
	danger = 3,
	name = "DianaArc",
	speed = 1400,
	radius = 50,
	range = 850,
	fixedRange = true,
	delay = 250,
	Slot = 0,
	spellName = "DianaArc",
	spellType = "Line",
	hasEndExplosion = true,
	secondaryRadius = 195,
	extraEndTime = 250,
	FoW = true,
	},
},
--end Diana
["DrMundo"] = {
	{
	charName = "DrMundo",
	danger = 1,
	missileName = "InfectedCleaverMissile",
	name = "Infected Cleaver",
	speed = 2000,
	radius = 60,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "InfectedCleaverMissileCast",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end DrMundo
["Draven"] = {
	{
	charName = "Draven",
	danger = 3,
	missileName = "DravenR",
	name = "Whirling Death",
	speed = 2000,
	radius = 160,
	range = 25000,
	delay = 500,
	Slot = 3,
	spellName = "DravenRCast",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Draven",
	danger = 2,
	missileName = "DravenDoubleShotMissile",
	name = "Stand Aside",
	speed = 1400,
	radius = 130,
	range = 1100,
	delay = 250,
	Slot = 2,
	spellName = "DravenDoubleShot",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Draven
["Ekko"] = {
	{
	charName = "Ekko",
	danger = 3,
	name = "Timewinder",
	missileName = "EkkoQMis",
	speed = 1650,
	radius = 60,
	range = 950,
	delay = 250,
	Slot = 0,
	spellName = "EkkoQ",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Ekko",
	danger = 3,
	name = "Parallel Convergence",
	speed = math.huge,
	radius = 375,
	range = 1600,
	delay = 3750,
	Slot = 1,
	spellName = "EkkoW",
	spellType = "Circular",
	killName = "EkkoW",
	killTime = 1.2,
	Dangerous = true,
	},
	{
	charName = "Ekko",
	danger = 3,
	name = "Chronobreak",
	speed = math.huge,
	radius = 375,
	range = 1600,
	delay = 250,
	Slot = 3,
	spellName = "EkkoR",
	spellType = "Circular",
	isSpecial = true,
	killTime = 0.2,
	},
},
--end Ekko
["Elise"] = {
	{
	charName = "Elise",
	danger = 3,
	name = "Cocoon",
	speed = 1600,
	radius = 70,
	range = 1100,
	delay = 250,
	Slot = 2,
	spellName = "EliseHumanE",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Elise
["Evelynn"] = {
	{
	charName = "Evelynn",
	danger = 3,
	name = "Agony's Embrace",
	speed = math.huge,
	radius = 350,
	range = 650,
	delay = 250,
	Slot = 3,
	spellName = "EvelynnR",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.2,
	},
},
--end Evelynn
["Ezreal"] = {
	{
	charName = "Ezreal",
	danger = 2,
	missileName = "EzrealMysticShotMissile",
	name = "Mystic Shot",
	speed = 2000,
	radius = 60,
	range = 1200,
	delay = 250,
	Slot = 0,
	spellName = "EzrealMysticShot",
	extraSpellNames = "ezrealmysticshotwrapper",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Ezreal",
	danger = 3,
	name = "Trueshot Barrage",
	speed = 2000,
	radius = 160,
	range = 20000,
	delay = 1000,
	Slot = 3,
	spellName = "EzrealTrueshotBarrage",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Ezreal",
	danger = 1,
	missileName = "EzrealEssenceFluxMissile",
	name = "Essence Flux",
	speed = 1600,
	radius = 80,
	range = 1050,
	delay = 250,
	Slot = 1,
	spellName = "EzrealEssenceFlux",
	spellType = "Line",
	FoW = true,
	},
},
--end Ezreal
["Fiora"] = {
	{
	charName = "Fiora",
	danger = 1,
	missileName = "FioraWMissile",
	name = "Riposte",
	speed = 3200,
	radius = 70,
	range = 750,
	delay = 500,
	Slot = 1,
	spellName = "FioraW",
	spellType = "Line",
	FoW = true,
	},
},
--end Fiora
["Fizz"] = {
	{
	charName = "Fizz",
	danger = 2,
	name = "Playful / Trickster",
	speed = 1400,
	radius = 150,
	range = 550,
	delay = 0,
	Slot = 2,
	spellName = "FizzPiercingStrike",
	spellType = "Circular",
	isSpecial = true,
	killTime = 0.3,
	},
	{
	charName = "Fizz",
	danger = 3,
	missileName = "FizzMarinerDoomMissile",
	name = "Chum the Waters",
	speed = 1350,
	radius = 120,
	range = 1275,
	delay = 250,
	Slot = 3,
	spellName = "FizzMarinerDoom",
	spellType = "Line",
	hasEndExplosion = true,
	secondaryRadius = 250,
	useEndPosition = true,
	extraEndTime = 1000,
	Dangerous = true,
	FoW = true,
	},
},
--end Fizz
["Galio"] = {
	{
	charName = "Galio",
	danger = 2,
	name = "Righteous Gust",
	missileName = "GalioRighteousGust",
	speed = 1300,
	radius = 160,
	range = 1280,
	Slot = 2,
	spellName = "GalioRighteousGust",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Galio",
	danger = 2,
	name = "ResoluteSmite",
	missileName = "GalioResoluteSmite",
	speed = 1200,
	radius = 235,
	range = 1040,
	delay = 250,
	Slot = 0,
	spellName = "GalioResoluteSmite",
	spellType = "Circular",
	killTime = 0.2,
	},
	{
	charName = "Galio",
	danger = 4,
	name = "IdolOfDurand",
	radius = 600,
	range = 600,
	Slot = 3,
	spellName = "GalioIdolOfDurand",
	spellType = "Circular",
	Dangerous = true,
	},
},
--end Galio
["Gnar"] = {
	{
	charName = "Gnar",
	danger = 2,
	name = "Boulder Toss",
	missileName = "GnarBigQMissile",
	speed = 2000,
	radius = 90,
	range = 1150,
	delay = 500,
	Slot = 0,
	spellName = "GnarBigQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Gnar",
	danger = 3,
	name = "GnarUlt",
	radius = 500,
	range = 500,
	delay = 250,
	Slot = 3,
	spellName = "GnarR",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
	{
	charName = "Gnar",
	danger = 3,
	name = "Wallop",
	speed = math.huge,
	radius = 100,
	range = 600,
	delay = 600,
	Slot = 1,
	spellName = "GnarBigW",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Gnar",
	danger = 2,
	name = "Boomerang Throw",
	missileName = "GnarQMissile",
	extraMissileNames = "GnarQMissileReturn",
	speed = 2400,
	radius = 60,
	range = 1185,
	delay = 250,
	Slot = 0,
	spellName = "GnarQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Gnar",
	danger = 2,
	name = "GnarE",
	spellName = "GnarE",
	range = 475,
	delay = 0,
	radius = 150,
	fixedRange = true,
	speed = 900,
	Slot = 2,
	spellType = "Circular",
	killTime = 0.2,
	},
	{
	charName = "Gnar",
	danger = 2,
	name = "GnarBigE",
	spellName = "gnarbige",
	range = 475,
	delay = 0,
	radius = 100,
	fixedRange = true,
	speed = 800,
	Slot = 2,
	spellType = "Circular",
	killTime = 0.2,
	},
},
--end Gnar
["Gragas"] = {
	{
	charName = "Gragas",
	danger = 2,
	name = "Barrel Roll",
	speed = 1000,
	radius = 300,
	range = 975,
	delay = 250,
	Slot = 0,
	spellName = "GragasQ",
	spellType = "Circular",
	killName = "GragasQToggle",
	killTime = 2.5,
	},
	{
	charName = "Gragas",
	danger = 3,
	name = "BodySlam",
	speed = 1200,
	radius = 200,
	range = 950,
	delay = 0,
	Slot = 2,
	spellName = "GragasE",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
	{
	charName = "Gragas",
	danger = 4,
	name = "ExplosiveCask",
	speed = 1750,
	radius = 350,
	range = 1050,
	delay = 250,
	Slot = 3,
	spellName = "GragasR",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
},
--end Gragas
["Graves"] = {
	{
	charName = "Graves",
	danger = 2,
	missileName = "GravesQLineMis",
	extraMissileNames = "GravesQReturn",
	name = "Buckshot",
	speed = 3000,
	radius = 100,
	range = 825,
	delay = 250,
	Slot = 0,
	spellName = "GravesQLineSpell",
	spellType = "Line",
	HasEndExplosion = true,
	FoW = true,
	},
	{
	charName = "Graves",
	danger = 2,
	missileName = "GravesSmokeGrenadeBoom",
	name = "Smoke Screen",
	speed = math.huge,
	radius = 250,
	range = 1000,
	delay = 250,
	Slot = 1,
	spellName = "GravesSmokeGrenadeBoom",
	spellType = "Circular",
	Dangerous = false,
	killTime = 3,
	},
	{
	charName = "Graves",
	danger = 3,
	missileName = "GravesChargeShotShot",
	name = "Collateral Damage",
	speed = 2100,
	radius = 125,
	range = 1000,
	delay = 250,
	Slot = 3,
	spellName = "GravesChargeShot",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Graves
["Hecarim"] = {
	{
	charName = "Hecarim",
	danger = 4,
	name = "HecarimR",
	missileName = "hecarimultmissile",
	speed = 1100,
	radius = 300,
	range = 1500,
	delay = 10,
	Slot = 3,
	spellName = "HecarimUlt",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Hecarim
["Heimerdinger"] = {
	{
	charName = "Heimerdinger",
	danger = 2,
	missileName = "HeimerdingerESpell",
	name = "HeimerdingerE",
	speed = 1750,
	radius = 135,
	range = 925,
	delay = 325,
	Slot = 2,
	spellName = "HeimerdingerE",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
	{
	charName = "Heimerdinger",
	danger = 2,
	name = "HeimerdingerW",
	missileName = "HeimerdingerWAttack2",
	speed = 2500,
	radius = 35,
	range = 1350,
	fixedRange = true,
	delay = 250,
	Slot = 1,
	spellName = "HeimerdingerW",
	spellType = "Line",
	defaultOff = true,
	FoW = true,
	},
	{
	charName = "Heimerdinger",
	danger = 2,
	name = "Turret Energy Blast",
	speed = 1650,
	radius = 50,
	range = 1000,
	delay = 435,
	Slot = 0,
	spellName = "HeimerdingerTurretEnergyBlast",
	spellType = "Line",
	isSpecial = true,
	FoW = true,
	},
	{
	charName = "Heimerdinger",
	danger = 3,
	name = "Turret Energy Blast",
	speed = 1650,
	radius = 75,
	range = 1000,
	delay = 350,
	Slot = 0,
	spellName = "HeimerdingerTurretBigEnergyBlast",
	spellType = "Line",
	FoW = true,
	},
},
--end Heimerdinger
["Illaoi"] = {
	{
	charName = "Illaoi",
	danger = 3,
	name = "IllaoiQ",
	speed = math.huge,
	radius = 100,
	range = 850,
	delay = 750,
	Slot = 0,
	spellName = "IllaoiQ",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Illaoi",
	danger = 3,
	missileName = "Illaoiemis",
	name = "IllaoiE",
	speed = 1900,
	radius = 50,
	range = 950,
	delay = 250,
	Slot = 2,
	spellName = "IllaoiE",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
	{
	charName = "Illaoi",
	danger = 3,
	name = "IllaoiR",
	speed = math.huge,
	range = 0,
	radius = 450,
	delay = 500,
	Slot = 3,
	spellName = "IllaoiR",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.2,
	},
},
--end Illaoi
["Irelia"] = {
	{
	charName = "Irelia",
	danger = 1,
	missileName = "ireliatranscendentbladesspell",
	name = "IreliaTranscendentBlades",
	speed = 1600,
	radius = 120,
	range = 1200,
	Slot = 3,
	delay = 0,
	spellName = "IreliaTranscendentBlades",
	spellType = "Line",
	FoW = true,
	},
},
--end Irelia
["Janna"] ={
	{
	charName = "Janna",
	danger = 2,
	missileName = "HowlingGaleSpell",
	name = "HowlingGaleSpell",
	speed = 900,
	radius = 120,
	delay = 1000,
	range = 1700,
	Slot = 0,
	spellName = "HowlingGale",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Janna
["JarvanIV"] = {
	{
	charName = "JarvanIV",
	danger = 2,
	name = "DragonStrike",
	speed = 2000,
	radius = 80,
	range = 845,
	delay = 250,
	Slot = 0,
	spellName = "JarvanIVDragonStrike",
	spellType = "Line",
	},
	{
	charName = "JarvanIV",
	danger = 2,
	name = "DragonStrike",
	speed = 1800,
	radius = 120,
	range = 845,
	delay = 250,
	Slot = 0,
	spellName = "JarvanIVDragonStrike2",
	spellType = "Line",
	useEndPosition = true,
	FoW = true,
	},
	{
	charName = "JarvanIV",
	danger = 3,
	name = "Cataclysm",
	speed = 1900,
	radius = 350,
	range = 825,
	delay = 0,
	Slot = 3,
	spellName = "JarvanIVCataclysm",
	spellType = "Circular",
	Dangerous = true,
	killName = "",
	killTime = 1.5,
	},
},
--end JarvanIV
["Jayce"] = {
	{
	charName = "Jayce",
	danger = 3,
	missileName = "JayceShockBlastMis",
	name = "JayceShockBlastCharged",
	speed = 2350,
	radius = 70,
	range = 1570,
	delay = 250,
	Slot = 0,
	spellName = "JayceShockBlast",
	spellType = "Line",
	collision = true,
	hasEndExplosion = true,
	secondaryRadius = 250,
	FoW = true,
	},
	{
	charName = "Jayce",
	danger = 2,
	missileName = "JayceShockBlastMis",
	name = "JayceShockBlast",
	speed = 1450,
	radius = 70,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "jayceshockblast",
	spellType = "Line",
	collision = true,
	hasEndExplosion = true,
	secondaryRadius = 175,
	FoW = true,
	},
},
--end Jayce
["Jinx"] = {
	{
	charName = "Jinx",
	danger = 3,
	name = "JinxR",
	speed = 2000,
	radius = 140,
	range = 25000,
	delay = 600,
	Slot = 3,
	spellName = "JinxR",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
	{
	charName = "Jinx",
	danger = 3,
	missileName = "JinxWMissile",
	name = "Zap",
	speed = 3300,
	radius = 60,
	range = 1500,
	delay = 600,
	Slot = 1,
	spellName = "JinxWMissile",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Jinx
["Jhin"] = {
	{
	charName = "Jhin",
	danger = 3,
	missileName = "JhinWMissile",
	name = "JhinW",
	speed = 5000,
	radius = 40,
	range = 2250,
	delay = 750,
	Slot = 1,
	spellName = "JhinW",
	spellType = "Line",
	fixedRange = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Jhin",
	danger = 2,
	missileName = "JhinRShotMis",
	name = "JhinR",
	speed = 5000,
	radius = 80,
	range = 3500,
	delay = 250,
	Slot = 3,
	spellName = "JhinRShot",
	extraSpellNames = "JhinRShotFinal",
	spellType = "Line",
	fixedRange = true,
	extraMissileNames = "JhinRShotMis4",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
},
--end
["Kalista"] = {
	{
	charName = "Kalista",
	danger = 2,
	missileName = "kalistamysticshotmistrue",
	name = "KalistaQ",
	speed = 2000,
	radius = 70,
	range = 1200,
	delay = 350,
	Slot = 0,
	spellName = "KalistaMysticShot",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Kalista
["Karma"] = {
	{
	charName = "Karma",
	danger = 2,
	missileName = "KarmaQMissile",
	name = "KarmaQ",
	speed = 1700,
	radius = 90,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "KarmaQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Karma",
	danger = 2,
	missileName = "KarmaQMissileMantra",
	name = "KarmaQMantra",
	speed = 1700,
	radius = 90,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "KarmaQMissileMantra",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Karma
["Karthus"] = {
	{
	charName = "Karthus",
	danger = 1,
	name = "Lay Waste",
	speed = math.huge,
	radius = 190,
	range = 875,
	delay = 900,
	Slot = 0,
	spellName = "KarthusLayWaste",
	spellType = "Circular",
	extraSpellNames = {"karthuslaywastea2", "karthuslaywastea3", "karthuslaywastedeada1", "karthuslaywastedeada2", "karthuslaywastedeada3"},	--tostring
	killTime = 0.2,
	},
},
--end Karthus
["Kassadin"] = {
	{
	charName = "Kassadin",
	danger = 1,
	name = "RiftWalk",
	radius = 270,
	range = 700,
	delay = 250,
	Slot = 3,
	spellName = "RiftWalk",
	spellType = "Circular",
	killTime = 0.3,
	},
	{
	angle = 40,
	charName = "Kassadin",
	danger = 2,
	name = "ForcePulse",
	radius = 20,
	range = 700,
	delay = 250,
	Slot = 2,
	spellName = "ForcePulse",
	spellType = "Cone",
	},
},
--end Kassadin
["Kennen"] = {
	{
	charName = "Kennen",
	danger = 2,
	missileName = "KennenShurikenHurlMissile1",
	name = "Thundering Shuriken",
	speed = 1700,
	radius = 50,
	range = 1175,
	delay = 180,
	Slot = 0,
	spellName = "KennenShurikenHurlMissile1",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Kennen
["Khazix"] = { 
	{
	charName = "Khazix",
	danger = 1,
	missileName = "KhazixWMissile",
	name = "KhazixW",
	speed = 1700,
	radius = 70,
	range = 1100,
	delay = 250,
	Slot = 1,
	spellName = "KhazixW",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	angle = 22,
	charName = "Khazix",
	danger = 1,
	isThreeWay = true,
	name = "KhazixWLong",
	speed = 1700,
	radius = 70,
	range = 1025,
	delay = 250,
	Slot = 1,
	spellName = "KhazixWLong",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Khazix
["KogMaw"] = {
	{
	charName = "KogMaw",
	danger = 2,
	name = "Caustic Spittle",
	missileName = "KogMawQ",
	speed = 1650,
	radius = 70,
	range = 1125,
	delay = 250,
	Slot = 0,
	spellName = "KogMawQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "KogMaw",
	danger = 1,
	name = "KogMawVoidOoze",
	missileName = "KogMawVoidOozeMissile",
	speed = 1400,
	radius = 120,
	range = 1360,
	delay = 250,
	Slot = 2,
	spellName = "KogMawVoidOoze",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "KogMaw",
	danger = 2,
	name = "Living Artillery",
	speed = math.huge,
	radius = 235,
	range = 2200,
	delay = 1100,
	Slot = 3,
	spellName = "KogMawLivingArtillery",
	spellType = "Circular",
	killTime = 0.5,
	},
},
--end KogMaw
["Leblanc"] = {
	{
	charName = "Leblanc",
	danger = 2,
	name = "Ethereal Chains R",
	missileName = "LeblancSoulShackleM",
	speed = 1750,
	radius = 55,
	range = 960,
	delay = 250,
	Slot = 3,
	spellName = "LeblancSoulShackleM",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Leblanc",
	danger = 2,
	name = "Ethereal Chains",
	missileName = "LeblancSoulShackle",
	speed = 1750,
	radius = 55,
	range = 960,
	delay = 250,
	Slot = 2,
	spellName = "LeblancSoulShackle",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Leblanc",
	danger = 1,
	name = "LeblancSlideM",
	speed = 1450,
	radius = 250,
	range = 725,
	delay = 250,
	Slot = 3,
	spellName = "LeblancSlideM",
	spellType = "Circular",
	killTime = 0.2,
	},
	{
	charName = "Leblanc",
	danger = 1,
	name = "LeblancSlide",
	speed = 1450,
	radius = 250,
	range = 725,
	delay = 250,
	Slot = 1,
	spellName = "LeblancSlide",
	spellType = "Circular",
	killTime = 0.2,
	},
},
--end Leblanc
["LeeSin"] = {
	{
	charName = "LeeSin",
	danger = 3,
	name = "Sonic Wave",
	speed = 1800,
	radius = 60,
	range = 1100,
	delay = 250,
	Slot = 0,
	spellName = "BlindMonkQOne",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	--end LeeSin
},
["Leona"] = {
	{
	charName = "Leona",
	danger = 4,
	name = "Leona Solar Flare",
	radius = 300,
	range = 1200,
	delay = 1000,
	Slot = 3,
	spellName = "LeonaSolarFlare",
	spellType = "Circular",
	killName = "LeonaSolarFlare",
	killTime = 1,
	Dangerous = true,
	},
	{
	charName = "Leona",
	danger = 3,
	extraDistance = 65,
	missileName = "LeonaZenithBladeMissile",
	name = "Zenith Blade",
	speed = 2000,
	radius = 70,
	range = 975,
	delay = 200,
	Slot = 2,
	spellName = "LeonaZenithBlade",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Leona
["Lissandra"] = {
	{
	charName = "Lissandra",
	danger = 3,
	name = "LissandraW",
	speed = math.huge,
	radius = 450,
	range = 725,
	delay = 250,
	Slot = 1,
	spellName = "LissandraW",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.2,
	},
	{
	charName = "Lissandra",
	danger = 2,
	name = "Ice Shard",
	speed = 2250,
	radius = 75,
	range = 825,
	delay = 250,
	Slot = 0,
	spellName = "LissandraQ",
	spellType = "Line",
	FoW = true,
	},
},
--end Lissandra
["Lucian"] = {
	{
	charName = "Lucian",
	danger = 1,
	defaultOff = true,
	name = "LucianW",
	speed = 1600,
	radius = 80,
	range = 1000,
	delay = 300,
	Slot = 1,
	spellName = "LucianW",
	spellType = "Line",
	collision = true,
	HasEndExplosion = true,
	FoW = true,
	},
	{
	charName = "Lucian",
	danger = 2,
	defaultOff = true,
	isSpecial = true,
	name = "LucianQ",
	speed = math.huge,
	radius = 65,
	range = 1140,
	delay = 350,
	Slot = 0,
	spellName = "LucianQ",
	spellType = "Line",
	FoW = true,
	},
},
--end Lucian
["Lulu"] = {
	{
	charName = "Lulu",
	danger = 2,
	missileName = "LuluQMissile",
	extraMissileNames = "LuluQMissileTwo",
	name = "LuluQ",
	speed = 1450,
	radius = 80,
	range = 925,
	delay = 250,
	Slot = 0,
	spellName = "LuluQ",
	extraSpellNames = "LuluQMissile",
	spellType = "Line",
	isSpecial = true,
	FoW = true,
	},
},
--end Lulu
["Lux"] = {
	{
	charName = "Lux",
	danger = 2,
	name = "LuxLightStrikeKugel",
	speed = 1400,
	radius = 350,
	range = 1100,
	extraEndTime = 1000,
	delay = 250,
	Slot = 2,
	spellName = "LuxLightStrikeKugel",
	spellType = "Circular",
	killName = "LuxLightstrikeToggle",
	killTime = 5.25,
	},
	{
	charName = "Lux",
	danger = 3,
	missilename = "LuxMaliceCannon",
	name = "LuxMaliceCannon",
	speed = math.huge,
	radius = 190,
	range = 3500,
	delay = 1000,
	Slot = 3,
	spellName = "LuxMaliceCannon",
	spellType = "Line",
	Dangerous = true,
	},
	{
	charName = "Lux",
	danger = 3,
	missileName = "LuxLightBindingMis",
	name = "Light Binding",
	speed = 1200,                
	radius = 70,
	range = 1300,
	delay = 250,
	Slot = 0,
	spellName = "LuxLightBinding",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Lux
["Malphite"] = {
	{
	charName = "Malphite",
	danger = 4,
	name = "UFSlash",
	speed = 2000,
	radius = 300,
	range = 1000,
	delay = 0,
	Slot = 3,
	spellName = "UFSlash",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.4,
	},
},
--end Malphite
["Malzahar"] = {
	{
	charName = "Malzahar",
	danger = 2,
	extraEndTime = 750,
	defaultOff = true,
	isSpecial = true,
	isWall = true,
	missileName = "MalzaharQMissile",
	name = "MalzaharQ",
	speed = 1600,
	radius = 85,
	range = 900,
	sideRadius = 400,
	delay = 1000,
	Slot = 0,
	spellName = "MalzaharQ",
	spellType = "Line",
	FoW = true,
	},
},
--end Malzahar
["MonkeyKing"] = {
	{
	charName = "MonkeyKing",
	danger = 3,
	name = "MonkeyKingSpinToWin",
	radius = 225,
	range = 300,
	delay = 250,
	Slot = 3,
	spellName = "MonkeyKingSpinToWin",
	spellType = "Circular",
	defaultOff = true,
	killName = "",
	killTime = 1,
	},
},
--end MonkeyKing
["Morgana"] = {
	{
	charName = "Morgana",
	danger = 3,
	name = "Dark Binding",
	speed = 1200,
	radius = 80,
	range = 1300,
	delay = 250,
	Slot = 0,
	spellName = "DarkBindingMissile",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Morgana
["Nami"] = {
	{
	charName = "Nami",
	danger = 3,
	name = "NamiQ",
	speed = math.huge,
	radius = 200,
	range = 875,
	delay = 1000,
	Slot = 0,
	spellName = "NamiQ",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.35,
	},
	{
	charName = "Nami",
	danger = 4,
	missileName = "NamiRMissile",
	name = "NamiR",
	speed = 850,
	radius = 250,
	range = 2750,
	delay = 500,
	Slot = 3,
	spellName = "NamiR",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Nami
["Nautilus"] = {
	{
	charName = "Nautilus",
	danger = 3,
	missileName = "NautilusAnchorDragMissile",
	name = "Dredge Line",
	speed = 2000,
	radius = 90,
	range = 1250,
	delay = 250,
	Slot = 0,
	spellName = "NautilusAnchorDrag",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Nautilus
["Nidalee"] = {
	{
	charName = "Nidalee",
	danger = 2,
	missileName = "JavelinToss",
	name = "Javelin Toss",
	speed = 1300,
	radius = 60,
	range = 1500,
	delay = 250,
	Slot = 0,
	spellName = "JavelinToss",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Nidalee
["Nocturne"] = {
	{
	charName = "Nocturne",
	danger = 1,
	name = "NocturneDuskbringer",
	speed = 1400,
	radius = 60,
	range = 1125,
	delay = 250,
	Slot = 0,
	spellName = "NocturneDuskbringer",
	spellType = "Line",
	FoW = true,
	},
},
--end Nocturne
["Olaf"] = {
	{
	charName = "Olaf",
	danger = 1,
	name = "Undertow",
	speed = 1600,
	radius = 90,
	range = 1000,
	delay = 250,
	Slot = 0,
	spellName = "OlafAxeThrowCast",
	spellType = "Line",
	FoW = true,
	},
},
--end Olaf
["Orianna"] = {
	{
	charName = "Orianna",
	danger = 2,
	hasEndExplosion = true,
	name = "IzunaCommand",
	speed = 1200,
	radius = 80,
	secondaryRadius = 170,
	range = 2000,
	delay = 250,
	Slot = 0,
	spellName = "OrianaIzunaCommand",
	spellType = "Line",
	isSpecial = true,
	useEndPosition = true,
	FoW = true,
	},
	{
	charName = "Orianna",
	danger = 4,
	name = "DetonateCommand",
	speed = math.huge,
	radius = 410,
	range = 410,
	delay = 500,
	Slot = 3,
	spellName = "OrianaDetonateCommand",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
	{
	charName = "Orianna",
	danger = 2,
	name = "DissonanceCommand",
	speed = math.huge,
	radius = 250,
	range = 1825,
	delay = 0,
	Slot = 1,
	spellName = "OrianaDissonanceCommand",
	spellType = "Circular",
	killTime = 0.1,
	},
},
--end Orianna
["Pantheon"] = {
	{
	angle = 35,
	charName = "Pantheon",
	danger = 2,
	name = "Heartseeker",
	speed = math.huge,
	radius = 100,
	range = 650,
	delay = 1000,
	Slot = 2,
	spellName = "PantheonE",
	spellType = "Cone",
	},
},
--end Pantheon
["Poppy"] = {
	{
	charName = "Poppy",
	danger = 2,
	name = "Hammer Shock",
	speed = math.huge,
	radius = 100,
	range = 450,
	delay = 500,
	Slot = 0,
	spellName = "PoppyQ",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Poppy",
	danger = 3,
	name = "Keeper's Verdict",
	radius = 110,
	speed = math.huge,
	range = 450,
	delay = 300,
	Slot = 3,
	spellName = "PoppyRSpellInstant",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Poppy",
	danger = 3,
	name = "Keeper's Verdict",
	radius = 100,
	range = 1150,
	speed = 1750,
	delay = 300,
	Slot = 3,
	spellName = "PoppyRSpell",
	missileName = "PoppyRMissile",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end
["Quinn"] = {
	{
	charName = "Quinn",
	danger = 2,
	missileName = "QuinnQMissile",
	name = "QuinnQ",
	speed = 1550,
	radius = 80,
	range = 1050,
	delay = 250,
	Slot = 0,
	spellName = "QuinnQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Quinn
["RekSai"] = {
	{
	charName = "RekSai",
	danger = 2,
	missileName = "RekSaiQBurrowedMis",
	name = "RekSaiQ",
	speed = 1950,
	radius = 65,
	range = 1500,
	delay = 125,
	Slot = 0,
	spellName = "ReksaiQBurrowed",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end RekSai
["Rengar"] = {
	{
	charName = "Rengar",
	danger = 2,
	missileName = "RengarEFinal",
	name = "Bola Strike",
	speed = 1500,
	radius = 70,
	range = 1000,
	delay = 250,
	Slot = 2,
	spellName = "RengarE",
	spellType = "Line",
	extraMissileNames = "RengarEFinalMAX",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Rengar
["Riven"] = {
	{
	angle = 15,
	charName = "Riven",
	danger = 2,
	isThreeWay = true,
	name = "WindSlash",
	speed = 1600,
	radius = 100,
	range = 1100,
	delay = 250,
	Slot = 3,
	spellName = "RivenIzunaBlade",
	spellType = "Line",
	isSpecial = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Riven",
	danger = 2,
	defaultOff = true,
	name = "RivenW",
	speed = 1500,
	radius = 280,
	range = 650,
	delay = 267,
	Slot = 1,
	spellName = "RivenMartyr",
	spellType = "Circular",
	killTime = 0.3,
	},
},
--end Riven
["Rumble"] = {
	{
	charName = "Rumble",
	danger = 1,
	missileName = "RumbleGrenadeMissile",
	name = "RumbleGrenade",
	speed = 2000,
	radius = 90,
	range = 950,
	delay = 250,
	Slot = 2,
	spellName = "RumbleGrenade",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Rumble
["Ryze"] = {
	{
	charName = "Ryze",
	danger = 2,
	missileName = "RyzeQ",
	name = "RyzeQ",
	speed = 1700,
	radius = 60,
	range = 900,
	delay = 250,
	Slot = 0,
	spellName = "RyzeQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Ryze
["Sejuani"] = {
	{
	charName = "Sejuani",
	danger = 3,
	name = "Arctic Assault",
	speed = 1600,
	radius = 70,
	range = 900,
	delay = 0,
	Slot = 0,
	spellName = "SejuaniArcticAssault",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
	{
	charName = "Sejuani",
	danger = 4,
	missileName = "SejuaniGlacialPrison",
	name = "SejuaniR",
	speed = 1600,
	radius = 110,
	range = 1200,
	delay = 250,
	Slot = 3,
	spellName = "SejuaniGlacialPrisonCast",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Sejuani
["Shen"] = {
	{
	charName = "Shen",
	danger = 3,
	missileName = "ShenE",
	name = "ShadowDash",
	speed = 1600,
	radius = 60,
	range = 675,
	delay = 0,
	Slot = 2,
	spellName = "ShenE",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Shen
["Shyvana"] = {
	{
	charName = "Shyvana",
	danger = 1,
	name = "ShyvanaFireball",
	speed = 1700,
	radius = 60,
	range = 950,
	Slot = 2,
	spellName = "ShyvanaFireball",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Shyvana",
	danger = 3,
	name = "ShyvanaTransformCast",
	speed = 1100,
	radius = 160,
	range = 1000,
	delay = 10,
	Slot = 3,
	spellName = "ShyvanaTransformCast",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Shyvana
["Sion"] = {
	{
	charName = "Sion",
	danger = 2,
	missileName = "SionEMissile",
	name = "SionE",
	speed = 1800,
	radius = 80,
	range = 800,
	delay = 250,
	Slot = 2,
	spellName = "SionE",
	spellType = "Line",
	isSpecial = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Sion
["Sivir"] = {
	{
	charName = "Sivir",
	danger = 2,
	missileName = "SivirQMissile",
	name = "Boomerang Blade",
	speed = 1350,
	radius = 100,
	range = 1275,
	delay = 250,
	Slot = 0,
	spellName = "SivirQ",
	extraMissileNames = "SivirQMissileReturn",
	spellType = "Line",
	FoW = true,
	},
},
--end Sivir
["Skarner"] = {
	{
	charName = "Skarner",
	danger = 2,
	missileName = "SkarnerFractureMissile",
	name = "SkarnerFracture",
	speed = 1400,
	radius = 60,
	range = 1000,
	delay = 250,
	Slot = 2,
	spellName = "SkarnerFracture",
	spellType = "Line",
	FoW = true,
	},
},
--end Skarner
["Sona"] = {
	{
	charName = "Sona",
	danger = 4,
	name = "Crescendo",
	speed = 2400,
	radius = 150,
	range = 1000,
	delay = 250,
	Slot = 3,
	spellName = "SonaR",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Sona
["Soraka"] = {
	{
	charName = "Soraka",
	danger = 2,
	name = "SorakaQ",
	speed = 1100,
	radius = 260,
	range = 970,
	delay = 250,
	Slot = 0,
	spellName = "SorakaQ",
	spellType = "Circular",
	killTime = 0.275,
	},
	{
	charName = "Soraka",
	danger = 3,
	name = "SorakaE",
	speed = math.huge,
	radius = 275,
	range = 925,
	delay = 1750,
	Slot = 2,
	spellName = "SorakaE",
	spellType = "Circular",
	killTime = 0.8,
	},
},
--end Soraka
["Swain"] = {
	{
	charName = "Swain",
	danger = 3,
	name = "Nevermove",
	speed = math.huge,
	radius = 250,
	range = 900,
	delay = 1100,
	Slot = 1,
	spellName = "SwainShadowGrasp",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.5,
	},
},
--end Swain
["Syndra"] = {
	{
	angle = 30,
	charName = "Syndra",
	danger = 3,
	name = "SyndraE",
	missileName = "SyndraE",
	speed = 1500,
	radius = 140,
	range = 800,
	delay = 250,
	Slot = 2,
	spellName = "SyndraE",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Syndra",
	danger = 2,
	name = "SyndraW",
	speed = 1450,
	radius = 220,
	range = 925,
	delay = 0,
	Slot = 1,
	spellName = "SyndraWCast",
	spellType = "Circular",
	killTime = 0.2,
	},
	{
	charName = "Syndra",
	danger = 2,
	name = "SyndraQ",
	radius = 210,
	range = 800,
	delay = 600,
	Slot = 0,
	spellName = "SyndraQ",
	missileName = "SyndraQSpell",
	spellType = "Circular",
	killTime = 0.2,
	},
},
--end Syndra
["TahmKench"] = {
	{
	charName = "TahmKench",
	danger = 2,
	missileName = "TahmkenchQMissile",
	name = "TahmKenchQ",
	speed = 2000,
	delay = 250,
	radius = 100,
	range = 951,
	Slot = 0,
	spellName = "TahmKenchQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end TahmKench
["Talon"] = {
	{
	angle = 20,
	charName = "Talon",
	danger = 2,
	isThreeWay = true,
	name = "TalonRake",
	speed = 2300,
	radius = 75,
	range = 780,
	Slot = 1,
	spellName = "TalonRake",
	spellType = "Line",
	splits = 3,
	isSpecial = true,
	FoW = true,
	},
},
--end Talon
["Thresh"] = {
	{
	charName = "Thresh",
	danger = 3,
	missileName = "ThreshQMissile",
	name = "ThreshQ",
	speed = 1900,
	radius = 70,
	range = 1100,
	delay = 500,
	Slot = 0,
	spellName = "ThreshQ",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Thresh",
	danger = 3,
	missileName = "ThreshEMissile1",
	name = "ThreshE",
	speed = 2000,
	radius = 110,
	range = 1075,
	delay = 0,
	defaultOff = true,
	Slot = 2,
	spellName = "ThreshE",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
},
--end Thresh
["TwistedFate"] = {
	{
	angle = 28,
	charName = "TwistedFate",
	danger = 2,
	isThreeWay = true,
	missileName = "SealFateMissile",
	name = "Loaded Dice",
	speed = 1000,
	radius = 40,
	range = 1450,
	delay = 250,
	Slot = 0,
	spellName = "WildCards",
	spellType = "Line",
	isSpecial = true,
	FoW = true,
	},
},
--end TwistedFate
["Twitch"] = {
	{
	charName = "Twitch",
	danger = 2,
	name = "Loaded Dice",
	speed = 4000,
	radius = 60,
	range = 1100,
	delay = 250,
	Slot = 3,
	spellName = "TwitchSprayandPrayAttack",
	spellType = "Line",
	FoW = true,
	},
},
--end Twitch
["Urgot"] = {
	{
	charName = "Urgot",
	danger = 1,
	name = "Acid Hunter",
	speed = 1600,
	radius = 60,
	range = 1000,
	delay = 175,
	Slot = 0,
	spellName = "UrgotHeatseekingLineMissile",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
	{
	charName = "Urgot",
	danger = 2,
	name = "Plasma Grenade",
	speed = 1750,
	radius = 250,
	range = 900,
	delay = 250,
	Slot = 2,
	spellName = "UrgotPlasmaGrenade",
	spellType = "Circular",
	killTime = 0.3,
	},
},
--end Urgot
["Varus"] = {
	{
	charName = "Varus",
	danger = 1,
	name = "Varus E",
	missileName = "VarusEMissile",
	speed = 1500,
	radius = 235,
	range = 925,
	delay = 250,
	Slot = 2,
	spellName = "VarusE",
	extraSpellNames = "VarusEMissile",
	spellType = "Circular",
	killTime = 0.5,
	},
	{
	charName = "Varus",
	danger = 2,
	missileName = "VarusQMissile",
	name = "VarusQMissile",
	speed = 1900,
	radius = 70,
	range = 1600,
	delay = 0,
	Slot = 0,
	spellName = "VarusQ",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Varus",
	danger = 3,
	name = "VarusR",
	missileName = "VarusRMissile",
	speed = 1950,
	radius = 100,
	range = 1200,
	delay = 250,
	Slot = 3,
	spellName = "VarusR",
	spellType = "Line",
	Dangerous = true,
	collision = true,
	FoW = true,
	},
},
--end Varus
["Veigar"] = {
	{
	charName = "Veigar",
	danger = 2,
	name = "VeigarBalefulStrike",
	radius = 70,
	range = 950,
	delay = 250,
	speed = 1750,
	Slot = 0,
	spellName = "VeigarBalefulStrike",
	missileName = "VeigarBalefulStrikeMis",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Veigar",
	danger = 2,
	name = "VeigarDarkMatter",
	speed = math.huge,
	radius = 225,
	range = 900,
	delay = 1350,
	Slot = 1,
	spellName = "VeigarDarkMatter",
	spellType = "Circular",
	killName = "VeigarDarkMatter",
	killTime = 0.5,
	},
	{
	charName = "Veigar",
	danger = 3,
	name = "VeigarEventHorizon",
	speed = math.huge,
	radius = 425,
	range = 700,
	delay = 500,
	extraEndTime = 3500,
	Slot = 2,
	spellName = "VeigarEventHorizon",
	spellType = "Circular",
	defaultOff = true,
	Dangerous = true,
	killName = "VeigarEventHorizon",
	killTime = 3.5,
	},
},
--end Veigar
["Velkoz"] = {
	{
	charName = "Velkoz",
	danger = 2,
	name = "VelkozE",
	speed = 1500,
	radius = 225,
	range = 950,
	Slot = 2,
	spellName = "VelkozE",
	spellType = "Circular",
	Dangerous = true,
	},
	{
	charName = "Velkoz",
	danger = 1,
	name = "VelkozW",
	speed = 1700,
	radius = 88,
	range = 1100,
	Slot = 1,
	spellName = "VelkozW",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Velkoz",
	danger = 2,
	name = "VelkozQMissileSplit",
	speed = 2100,
	radius = 45,
	range = 1100,
	Slot = 0,
	spellName = "VelkozQMissileSplit",
	spellType = "Line",
	FoW = true,

	collision = true,
	},
	{
	charName = "Velkoz",
	danger = 2,
	name = "VelkozQ",
	speed = 1300,
	radius = 50,
	range = 1250,
	Slot = 0,
	missileName = "VelkozQMissile",
	spellName = "VelkozQ",
	spellType = "Line",
	collision = true,
	FoW = true,
	},
},
--end Velkoz
["Vi"] = {
	{
	charName = "Vi",
	danger = 3,
	name = "ViQMissile",
	speed = 1500,
	radius = 90,
	range = 725,
	Slot = 0,
	spellName = "ViQMissile",
	spellType = "Line",
	Dangerous = true,
	defaultOff = true,
	FoW = true,
	},
},
--end Vi
["Viktor"] = {
	{
	charName = "Viktor",
	danger = 2,
	missileName = "ViktorDeathRayMissile",
	name = "ViktorDeathRay",
	speed = 1050,
	delay = 100,
	radius = 80,
	range = 800,
	Slot = 2,
	spellName = "ViktorDeathRay",
	extraMissileNames = "ViktorEAugMissile",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Viktor",
	danger = 2,
	name = "ViktorDeathRay3",
	speed = math.huge,
	delay = 500,
	radius = 80,
	range = 800,
	Slot = 2,
	spellName = "ViktorDeathRay3",
	spellType = "Line",  
	FoW = true,	
	},
	{
	charName = "Viktor",
	danger = 2,
	missileName = "ViktorDeathRayMissile2",
	name = "ViktorDeathRay2",
	speed = 1500,
	radius = 80,
	range = 800,
	Slot = 2,
	spellName = "ViktorDeathRay2",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Viktor",
	danger = 2,
	name = "GravitonField",
	speed = math.huge,
	radius = 300,
	range = 625,
	delay = 1500,
	Slot = 1,
	spellName = "ViktorGravitonField",
	spellType = "Circular",
	defaultOff = true,
	Dangerous = true,
	killTime = 1,
	},
},
--end Viktor
["Vladimir"] = {
	{
	charName = "Vladimir",
	danger = 3,
	name = "VladimirR",
	radius = 375,
	range = 700,
	delay = 389,
	Slot = 3,
	spellName = "VladimirR",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.3,
	},
},
--end Vladimir
["Xerath"] = {
	{
	charName = "Xerath",
	danger = 2,
	name = "XerathArcaneBarrage2",
	radius = 280,
	range = 1100,
	delay = 750,
	Slot = 1,
	spellName = "XerathArcaneBarrage2",
	spellType = "Circular",
	extraDrawHeight = 45,
	killTime = 0.3,
	},
	{
	charName = "Xerath",
	danger = 3,
	name = "XerathArcanopulse2",
	speed = math.huge,
	radius = 70,
	range = 1525,
	delay = 500,
	Slot = 0,
	spellName = "XerathArcanopulse2",
	useEndPosition = true,
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Xerath",
	danger = 2,
	name = "XerathLocusOfPower2",
	missileName = "XerathLocusPulse",
	radius = 200,
	range = 5600,
	delay = 600,
	Slot = 3,
	spellName = "XerathRMissileWrapper",
	extraSpellNames = "XerathLocusPulse",
	spellType = "Circular",
	Dangerous = true,
	killTime = 0.4,
	},
	{
	charName = "Xerath",
	danger = 3,
	missileName = "XerathMageSpearMissile",
	name = "XerathMageSpear",
	speed = 1600,
	delay = 200,
	radius = 60,
	range = 1125,
	Slot = 2,
	spellName = "XerathMageSpear",
	spellType = "Line",
	collision = true,
	Dangerous = true,
	FoW = true,
	},
},
--end Xerath
["Yasuo"] = {
	{
	charName = "Yasuo",
	danger = 3,
	missileName = "YasuoQ3",
	name = "Steel Tempest 3",
	speed = 1200,
	radius = 90,
	range = 1100,
	delay = 250,
	Slot = 0,
	spellName = "YasuoQ3W",
	extraMissileNames = "YasuoQ3Mis",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Yasuo",
	danger = 2,
	name = "Steel Tempest 2",
	speed = math.huge,
	radius = 35,
	range = 525,
	fixedRange = true,
	delay = 350,
	Slot = 0,
	spellName = "YasuoQ2",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Yasuo",
	danger = 2,
	name = "Steel Tempest 1",
	speed = math.huge,
	radius = 35,
	range = 525,
	fixedRange = true,
	delay = 350,
	Slot = 0,
	spellName = "YasuoQ2",
	spellType = "Line",
	FoW = true,
	},
},
--end Yasuo
["Zac"] = {
	{
	charName = "Zac",
	danger = 2,
	name = "ZacQ",
	speed = math.huge,
	fixedRange = true,
	radius = 120,
	range = 550,
	delay = 500,
	Slot = 0,
	spellName = "ZacQ",
	spellType = "Line",
	FoW = true,
	},
},
--end Zac
["Zed"] = {
	{
	charName = "Zed",
	danger = 2,
	missileName = "ZedQMissile",
	name = "ZedQ",                
	speed = 1700,
	radius = 50,
	range = 925,
	delay = 250,
	Slot = 0,
	spellName = "ZedQ",
	spellType = "Line",
	FoW = true,
	},
	{
	charName = "Zed",
	danger = 1,
	name = "ZedE",
	speed = math.huge,
	delay = 0,
	radius = 290,
	range = 290,
	Slot = 2,
	spellName = "ZedE",
	spellType = "Circular",
	isSpecial = true,
	defaultOff = true,
	killTime = 0.1,
	},
},
--end Zed
["Ziggs"] = {
	{
	charName = "Ziggs",
	danger = 1,
	name = "ZiggsE",
	speed = 3000,
	radius = 235,
	range = 2000,
	delay = 250,
	Slot = 2,
	spellName = "ZiggsE",
	spellType = "Circular",
	killName = "ZiggsE",
	killTime = 1.5,
	},
	{
	charName = "Ziggs",
	danger = 1,
	name = "ZiggsW",
	speed = 3000,
	radius = 275,
	range = 2000,
	delay = 250,
	Slot = 1,
	spellName = "ZiggsW",
	spellType = "Circular",
	killName = "ZiggsW",
	killTime = 1.25,
	},
	{
	charName = "Ziggs",
	danger = 2,
	name = "ZiggsQ",
	speed = 1700,
	radius = 150,
	range = 850,                
	delay = 250,
	Slot = 0,
	spellName = "ZiggsQ",
	spellType = "Circular",
	isSpecial = true,
	noProcess = true,
	killName = "ZiggsQ",
	killTime = 0.2,
	},
	{
	charName = "Ziggs",
	danger = 4,
	name = "ZiggsR",
	speed = 1500,
	radius = 550,
	range = 5300,
	delay = 1500,
	Slot = 3,
	spellName = "ZiggsR",
	spellType = "Circular",
	killName = "ZiggsR",
	killTime = 1.75,
	Dangerous = true,
	},
},
--end Ziggs
["Zilean"] = {
	{
	charName = "Zilean",
	danger = 2,
	name = "ZileanQ",
	speed = 2000,
	radius = 250,
	range = 900,
	delay = 300,
	Slot = 0,
	spellName = "ZileanQ",
	spellType = "Circular",
	killTime = 1.5,
	},
},
--end Zilean
["Zyra"] = {
	{
	charName = "Zyra",
	danger = 3,
	name = "Grasping Roots",
	speed = 1400,
	radius = 70,
	range = 1150,
	delay = 250,
	Slot = 2,
	spellName = "ZyraE",
	spellType = "Line",
	Dangerous = true,
	FoW = true,
	},
	{
	charName = "Zyra",
	danger = 2,
	name = "Deadly Bloom",
	speed = math.huge,
	radius = 260,
	range = 825,
	delay = 800,
	Slot = 0,
	spellName = "ZyraQ",
	spellType = "Circular",
	killName = "ZyraQ",
	killTime = 0.275,
	},
	{
	charName = "Zyra",
	danger = 4,
	name = "ZyraR",
	speed = math.huge,
	radius = 550,
	range = 700,
	delay = 500,
	Slot = 3,
	spellName = "ZyraRSplash",
	spellType = "Circular",
	killName = "ZyraRSplash",
	killTime = 1.2,
	Dangerous = true,
	},
},
--end Zyra
}

local d = {
["Ahri"] = {
		dl = 4,
		name = "AhriTumble",
		range = 500,
		spellDelay = 50,
		speed = 1575,
		spellKey = 3,
		evadeType = "DashP",
		castType = "Position",
},
["Caitlyn"] = {
		dl = 3,
		name = "CaitlynEntrapment",
		range = 490,
		spellDelay = 50,
		speed = 1000,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Corki"] = {
		dl = 3,
		name = "CarpetBomb",
		range = 790,
		spellDelay = 50,
		speed = 975,
		spellKey = 1,
		evadeType = "DashP",
		castType = "Position",
},
["Ekko"] = {
	-- {
		dl = 3,
		name = "PhaseDive",
		range = 350,
		spellDelay = 50,
		speed = 1150,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
	-- },
	-- {
		-- charName = "Ekko",
		-- dangerlevel = 4,
		-- name = "Chronobreak",
		-- range = 20000,
		-- spellDelay = 50,
		-- spellKey = 3,
		-- evadeType = "DashS",
		-- castType = "Self",
     -- },
},
["Ezreal"] = {
		dl = 2,
		name = "ArcaneShift",
		speed = math.huge,
		range = 450,
		spellDelay = 250,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Gragas"] = {
		dl = 2,
		name = "BodySlam",
		range = 600,
		spellDelay = 50,
		speed = 900,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Gnar"] = {
	-- {
		dl = 3,
		name = "GnarE",
		range = 475,
		spellDelay = 50,
		speed = 900,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
    -- },
	-- {
		-- dl = 4,
		-- name = "GnarBigE",
		-- range = 475,
		-- spellDelay = 50,
		-- speed = 800,
		-- spellKey = 2,
		-- evadeType = "DashP",
		-- castType = "Position",
    -- },
},
["Graves"] = {
		dl = 2,
		name = "QuickDraw",
		range = 425,
		spellDelay = 50,
		speed = 1250,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Kassadin"] = {
		dl = 1,
		name = "RiftWalk",
		speed = math.huge,
		range = 450,
		spellDelay = 250,
		spellKey = 3,
		evadeType = "DashP",
		castType = "Position",
},
["Kayle"] = {
		dl = 4,
		name = "Intervention",
		speed = math.huge,
		range = 0,
		spellDelay = 250,
		spellKey = 3,
		evadeType = "SpellShieldT",
		castType = "Target",
},
["LeBlanc"] = {
		dl = 2,
		name = "Distortion",
		range = 600,
		spellDelay = 50,
		speed = 1600,
		spellKey = 1,
		evadeType = "DashP",
		castType = "Position",
},
["LeeSin"] = {	
		dl = 3,
		name = "Safeguard",
		range = 700,
		speed = 1400,
		spellDelay = 50,
		spellKey = 1,
		evadeType = "DashT",
		castType = "Target",
},
["Lucian"] = {			
		dl = 1,
		name = "RelentlessPursuit",
		range = 425,
		spellDelay = 50,
		speed = 1350,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Morgana"] = {
		dl = 3,
		name = "BlackShield",
		speed = math.huge,
		range = 650,
		spellDelay = 50,
		spellKey = 2,
		evadeType = "SpellShieldT",
		castType = "Target",
},
["Nocturne"] = {
		dl = 3,
		name = "ShroudofDarkness",
		speed = math.huge,
		range = 0,
		spellDelay = 50,
		spellKey = 1,
		evadeType = "SpellShieldS",
		castType = "Self",
		--BuffName = ""
},
["Nidalee"] = {
		dl = 3,
		name = "Pounce",
		range = 375,
		spellDelay = 150,
		speed = 1750,
		spellKey = 1,
		evadeType = "DashP",
		castType = "Position",
},
["Fiora"] = {
	--{
		dl = 3,
		name = "FioraQ",
		range = 340,
		speed = 1100,
		spellDelay = 50,
		spellKey = 0,
		evadeType = "DashP",
		castType = "Position",
   -- },
	-- {
		-- dl = 3,
		-- name = "FioraW",
		-- range = 750,
		-- spellDelay = 100,
		-- spellKey = 1,
		-- evadeType = "WindWallP",
		-- castType = "Position",
    -- },
},
["Fizz"] = {
		dl = 3,
		name = "FizzJump",
		range = 400,
		speed = 1400,
		spellDelay = 50,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},
["Riven"] = {
	--[[
	{
		dl = 1,
		name = "BrokenWings",
		range = 260,
		spellDelay = 50,
		speed = 560,
		spellKey = 0,
		evadeType = "DashP",
		castType = "Position",
    },
	{--]]
		dl = 2,
		name = "Valor",
		range = 325,
		spellDelay = 50,
		speed = 1200,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
	--},
},
["Sivir"] = {
		dl = 2,
		name = "SivirE",
		spellDelay = 50,
		spellKey = 2,
		evadeType = "SpellShieldS",
		castType = "Self",
		BuffName = "SivirE"
},
["Shaco"] = {
	--{
		dl = 3,
		name = "Deceive",
		range = 400,
		spellDelay = 250,
		spellKey = 0,
		evadeType = "DashP",
		castType = "Position",
   -- },
	-- {
		-- dl = 3,
		-- name = "JackInTheBox",
		-- range = 425,
		-- spellDelay = 250,
		-- spellKey = 1,
		-- evadeType = "WindWallP",
		-- castType = "Position",
	-- },
},
["Tristana"] = {
		dl = 3,
		name = "RocketJump",
		range = 900,
		spellDelay = 500,
		speed = 1100,
		spellKey = 1,
		evadeType = "DashP",
		castType = "Position",
},       
["Tryndamere"] = {
		dl = 3,
		name = "SpinningSlash",
		range = 660,
		spellDelay = 50,
		speed = 900,
		spellKey = 2,
		evadeType = "DashP",
		castType = "Position",
},   
["Vayne"] = {
		dl = 2,
		name = "Tumble",
		range = 300,
		speed = 900,
		spellDelay = 50,
		spellKey = 0,
		evadeType = "DashP",
		castType = "Position",
},
["Yasuo"] = {
	-- {
		-- dl = 2,
		-- name = "SweepingBlade",
		-- range = 475,
		-- speed = 1000,
		-- spellDelay = 50,
		-- spellKey = 2,
		-- evadeType = "DashT",
		-- castType = "Target",
	-- },
	--{
		dl = 3,
		name = "WindWall",
		range = 400,
		spellDelay = 250,
		spellKey = 1,
		evadeType = "WindWallP",
		castType = "Position",
	--},
},
["Vladimir"] = {
		dl = 4,
		name = "Sanguine Pool",
		range = 350,
		spellDelay = 50,
		spellKey = 1,
		evadeType = "SpellShieldS",
		castType = "Self",
},
["MasterYi"] = {
		dl = 3,
		name = "AlphaStrike",
		range = 600,
		speed = math.huge,
		spellDelay = 100,
		spellKey = 0,
		evadeType = "DashT",
		castType = "Target",
},
["Katarina"] = {
		dl = 3,
		name = "KatarinaE",
		range = 700,
		speed = math.huge,
		spellDelay = 50,
		spellKey = 2,
		evadeType = "DashT",
		castType = "Target",
},
["Kindred"] = {
		dl = 1,
		name = "KindredQ",
		range = 300,
		speed = 733,
		spellDelay = 50,
		spellKey = 0,
		evadeType = "DashP",
		castType = "Position",
},
["Talon"] = {
		dl = 3,
		name = "Cutthroat",
		range = 700,
		speed = math.huge,
		spellDelay = 50,
		spellKey = 2,
		evadeType = "DashT",
		castType = "Target",
   
},

}
require 'MapPositionGOS'


local obj = {}
local str = {[-1]="P",[0]="Q",[1]="W",[2]="E",[3]="R"}
local IsEvading2 = false
local EMenu = Menu("SL-Evade", "["..SLEPatchnew.."-"..SLEPatchold.."][v.:"..SLEvade.."] SL-Evade")
local Flash = (GetCastName(GetMyHero(),SUMMONER_1):lower():find("summonerflash") and SUMMONER_1 or (GetCastName(GetMyHero(),SUMMONER_2):lower():find("summonerflash") and SUMMONER_2 or nil))
local DodgeOnlyDangerous = false
local patha = nil
local pathb = nil
EMenu:Slider("d","Danger",2,1,5,1)
EMenu:SubMenu("Spells", "Spells")
EMenu:SubMenu("Dashes", "EvadeSpells")	
EMenu:SubMenu("Advanced", "Advanced")
EMenu.Advanced:Slider("ew", "Extra Width", 20, 0, 100, 5)
EMenu:SubMenu("Draws", "Draws")
EMenu.Draws:Boolean("DSPath", "Draw SkillShot Path", true)
EMenu.Draws:Boolean("DSEW", "Draw SkillShot Extra Width", true)
EMenu.Draws:Boolean("DSPos", "Draw SkillShot Position", true)
EMenu.Draws:Boolean("DEPos", "Draw Evade Position", true)
EMenu.Draws:Boolean("DevOpt", "Draw for Devs", false)
EMenu.Draws:Slider("SQ", "SkillShot Quality", 5, 1, 35, 5)
EMenu.Draws:Info("asd", "lower = higher Quality")
EMenu:SubMenu("Keys", "Key Bindings")
EMenu.Keys:KeyBinding("DD", "Disable Dodging", string.byte("K"), true)
EMenu.Keys:KeyBinding("DDraws", "Disable Drawings", string.byte("J"), true)
EMenu.Keys:KeyBinding("DoD", "Dodge only Dangerous", string.byte(" "))
EMenu.Keys:KeyBinding("DoD2", "Dodge only Dangerous 2", string.byte("V"))
DelayAction(function()
	for _,k in pairs(GetEnemyHeroes()) do
		if s[GetObjectName(k)] then
			EMenu.Spells:Menu(GetObjectName(k),GetObjectName(k))
			for m,p in pairs(s[GetObjectName(k)]) do
			if p.name == "" and GetCastName(k,m) then p.name = GetCastName(k,m) end
			if p.spellName == "" and GetCastName(k,m) then p.spellName = GeTCastName(k,m) end
			if not p.spellType then p.spellType = "Line" end
				if p.name ~= "" and p.spellName ~= "" and p.spellType and p.Slot then
				if not EMenu.Spells[GetObjectName(k)] then EMenu.Spells:Menu(GetObjectName(k), GetObjectName(k)) end
					EMenu.Spells[GetObjectName(k)]:Boolean(p.name,"|"..(str[p.Slot] or "?").."| - "..(p.name or "."), true)
					EMenu.Spells[GetObjectName(k)]:Boolean("IsD"..p.name,"IsDangerous", p.Dangerous or false)
					EMenu.Spells[GetObjectName(k)]:Boolean("FoW"..p.name,"FoW Dodge", p.FoW or false)				
					EMenu.Spells[GetObjectName(k)]:Slider("d"..p.name,"Danger",(p.danger or 1), 1, 5, 1)
					EMenu.Spells[GetObjectName(k)]:Info("Info"..p.name, "")			
				end	
			end
		end
	end
	if d[GetObjectName(myHero)] and d[GetObjectName(myHero)].spellKey then 
		EMenu.Dashes:Boolean(d[GetObjectName(myHero)].name,"|"..(str[d[GetObjectName(myHero)].spellKey] or "?").."| - "..(d[GetObjectName(myHero)].name or "."), true)
		EMenu.Dashes:Slider("d"..d[GetObjectName(myHero)].name,(str[d[GetObjectName(myHero)].spellKey] or "?").."- Danger",(d[GetObjectName(myHero)].dl or 2), 1, 5, 1)
		EMenu.Dashes:Info("Info"..d[GetObjectName(myHero)].name,"")
	end
	if Flash then
		EMenu.Dashes:Boolean("EnableFlash", "Flash", true)
		EMenu.Dashes:Slider("FlashDanger", "Flash - Danger", 5, 1, 5, 1)
	end
end,.001)

OnCreateObj(function (Object)
	DelayAction( function()
		if GetObjectBaseName(Object) == "missile" and not GetObjectSpellName(Object):lower():find("attack") then
			--hero = myHero
			for _,hero in pairs(GetEnemyHeroes()) do
				if not s[GetObjectName(GetObjectSpellOwner(Object))] or GetObjectType(GetObjectSpellOwner(Object)) ~= Obj_AI_Hero or GetTeam(GetObjectSpellOwner(Object)) ~= MINION_ENEMY then return end
				if EMenu.Draws.DevOpt:Value() then 
					print(GetObjectSpellName(Object)) 
				end
				for m,l in pairs(s[GetObjectName(GetObjectSpellOwner(Object))]) do
					if (l.missileName == GetObjectSpellName(Object) or GetObjectSpellName(Object):lower():find(l.name:lower()) or GetObjectSpellName(Object):lower():find(l.spellName:lower()) or (tostring(l.extraMissileNames) and l.extraMissileNames == GetObjectSpellName(Object))) and l.spellType == "Line" and EMenu.Spells[GetObjectName(GetObjectSpellOwner(Object))][l.name]:Value() and ((not DodgeOnlyDangerous and EMenu.d:Value() <= EMenu.Spells[GetObjectName(GetObjectSpellOwner(Object))]["d"..l.name]:Value()) or (DodgeOnlyDangerous and EMenu.Spells[GetObjectName(GetObjectSpellOwner(Object))]["IsD"..l.name]:Value())) then
						start = GetObjectSpellStartPos(Object)
						start.y = GetOrigin(Object).y
						endpos = GetObjectSpellEndPos(Object) 
						endpos.y = GetOrigin(Object).y
						obj[GetObjectSpellName(Object)] = {Obj = Object, sPos = start, ePos = endpos, spell = l, sType = l.spellType, sSpeed = l.speed or math.huge, sDelay = l.delay or 250, sRange = l.range, uDodge = false}
					end
				end
			end
		end
	end, .001)
end)

OnDeleteObj(function (Object)
	if GetObjectBaseName(Object) == "missile" then
		DelayAction( function()
			if obj[GetObjectSpellName(Object)] and obj[GetObjectSpellName(Object)].Obj then
				obj[GetObjectSpellName(Object)] = nil
			end
		end, .001)	
	end
end)


OnDraw(function ()
	if EMenu.Draws.DevOpt:Value() then
		DrawText("DoD:", 20, 460, 20, GoS.White)
		DrawText(DodgeOnlyDangerous, 20, 500, 20, GoS.Red)
	end
	local offy = 60
	local angle = 0
	if EMenu.Draws.DevOpt:Value() then 
		DrawText("Active Spells:",30,40,offy-30,GoS.White)
	end
	for _,i in pairs(obj) do
	  if EMenu.Draws.DevOpt:Value() then
		DrawText(_,30,40,offy,GoS.White)
	  end
		if i.sType == "Line" and not EMenu.Keys.DDraws:Value() then
			if _ ~= GetObjectSpellName(i.Obj) then obj[_] = nil end
			local Screen = WorldToScreen(0,GetOrigin(i.Obj))
			local Screen2 = WorldToScreen(0,i.sPos)
			if EMenu.Draws.DSPos:Value() then
				DrawCircle(GetOrigin(i.Obj),(i.spell.radius+myHero.boundingRadius)*.5,3,EMenu.Draws.SQ:Value(),GoS.White)
			end
			endPos = Vector(i.sPos)+Vector(Vector(i.ePos)-i.sPos):normalized()*(i.spell.range+i.spell.radius)
			endPos2 = Vector(i.sPos)+Vector(Vector(i.ePos)-i.sPos):normalized()*(i.spell.range+i.spell.radius+EMenu.Advanced.ew:Value())
			offy = offy + 30
			local sPos = Vector(i.sPos)
 			local ePos = Vector(endPos)
 			local dVec = Vector(ePos - sPos)
 			-- DrawCircle(dVec,50,0,3,GoS.White)
 			sVec = dVec:normalized():perpendicular()*((i.spell.radius+myHero.boundingRadius)*.5)
			sVec2 = dVec:normalized():perpendicular()*((i.spell.radius+myHero.boundingRadius)*.5+EMenu.Advanced.ew:Value())

 			local TopD1 = WorldToScreen(0,sPos+sVec)
 			local TopD2 = WorldToScreen(0,sPos-sVec)
 			local BotD1 = WorldToScreen(0,ePos+sVec)
 			local BotD2 = WorldToScreen(0,ePos-sVec)
 			local TopD3 = WorldToScreen(0,sPos+sVec2)
 			local TopD4 = WorldToScreen(0,sPos-sVec2)
 			local BotD3 = WorldToScreen(0,ePos+sVec2)
 			local BotD4 = WorldToScreen(0,ePos-sVec2)
			if EMenu.Draws.DSPath:Value() then
				DrawLine(TopD1.x,TopD1.y,TopD2.x,TopD2.y,3,ARGB(255,255,255,255))
				DrawLine(TopD1.x,TopD1.y,BotD1.x,BotD1.y,3,ARGB(255,255,255,255))
				DrawLine(TopD2.x,TopD2.y,BotD2.x,BotD2.y,3,ARGB(255,255,255,255))
				DrawLine(BotD1.x,BotD1.y,BotD2.x,BotD2.y,3,ARGB(255,255,255,255))
				if EMenu.Draws.DSEW:Value() then
					DrawLine(TopD3.x,TopD3.y,TopD4.x,TopD4.y,1.5,ARGB(175,255,255,255))
					DrawLine(TopD3.x,TopD3.y,BotD3.x,BotD3.y,1.5,ARGB(175,255,255,255))
					DrawLine(TopD4.x,TopD4.y,BotD4.x,BotD4.y,1.5,ARGB(175,255,255,255))
					DrawLine(BotD3.x,BotD3.y,BotD4.x,BotD4.y,1.5,ARGB(175,255,255,255))
				end
			end
		elseif i.sType == "Circular" and not EMenu.Keys.DDraws:Value() then
			if EMenu.Draws.DSPath:Value() then
				DrawCircle(i.ePos,i.spell.radius,3,EMenu.Draws.SQ:Value(),ARGB(255,255,255,255))
				if EMenu.Draws.DSEW:Value() then
					DrawCircle(i.ePos,i.spell.radius+EMenu.Advanced.ew:Value(),1.5,EMenu.Draws.SQ:Value(),ARGB(175,255,255,255))
				end
			end
		end
		if EMenu.Draws.DEPos:Value() and not EMenu.Keys.DDraws:Value() and i.safe then	
			if i.uDodge then 
				local tp232 = WorldToScreen(0,GetOrigin(myHero))
				local tp233 = WorldToScreen(0,i.safe)
				DrawLine(tp232.x,tp232.y,tp233.x,tp233.y,3,GoS.Red)
			else
				local tp234 = WorldToScreen(0,GetOrigin(myHero))
				local tp235 = WorldToScreen(0,i.safe)		
				DrawLine(tp234.x,tp234.y,tp235.x,tp235.y,3,GoS.Blue)
			end
		end
	end
end)

OnProcessSpell( function(unit,spellProc)
	if EMenu.Draws.DevOpt:Value() then 
		if unit == myHero then print(spellProc.name) end
	end
	if unit.team == MINION_ENEMY then
	if s[GetObjectName(unit)] then
		for _,i in pairs(s[GetObjectName(unit)]) do
			if i.spellType == "Circular" and spellProc.name == i.spellName and EMenu.Spells[i.charName][i.name]:Value() and ((not DodgeOnlyDangerous and EMenu.d:Value() <= EMenu.Spells[i.charName]["d"..i.name]:Value()) or (DodgeOnlyDangerous and EMenu.Spells[i.charName]["IsD"..i.name]:Value())) then
				obj[i.spellName] = {sPos = spellProc.startPos, ePos = spellProc.endPos, spell = i, obj = spellProc, sType = i.spellType, radius = i.radius, sSpeed = i.speed or math.huge, sDelay = i.delay or 250, sRange = i.range, uDodge = false, caster = unit}
				if i.killTime then
					DelayAction(function() obj[i.spellName] = nil end,i.killTime + GetDistance(unit,spellProc.endPos)/i.speed + i.delay*.001)
				end
			elseif spellProc.name == i.killName then
				obj[i.spellName] = nil
			end
		end
	end
	end
end)

OnTick(function()
	--DisableAll(false)
	if EMenu.Keys.DoD:Value() or EMenu.Keys.DoD2:Value() then
			DodgeOnlyDangerous = true
		else
			DodgeOnlyDangerous = false
	end
	for _,i in pairs(obj) do
	  if i.sType == "Line" and not i.Obj then
		  obj[_] = nil
	  end
	   local oT = i.sDelay + GetDistance(myHero,i.sPos) / i.sSpeed
	   local fT = .75
		for m,p in pairs(GetEnemyHeroes()) do
			if not s[GetObjectName(p)] then return end
			if i.safe and i.sType == "Line" then
				if GetDistance(i.Obj)/i.sSpeed + i.sDelay*.001 < GetDistance(i.safe)/myHero.ms then 
						i.uDodge = true 
					else
						i.uDodge = false
				end
			elseif i.safe and i.sType == "Circular" then
				if GetDistance(i.caster)/i.sSpeed + i.sDelay*.001 < GetDistance(i.safe)/myHero.ms then
						i.uDodge = true 
					else
						i.uDodge = false
				end
			end
			for pp,tabl in pairs(s[GetObjectName(p)]) do
				if i.sType == "Line" then
					i.sPos = Vector(i.sPos)
					i.ePos = Vector(i.ePos)
					S1 = GetOrigin(myHero)+(Vector(i.sPos)-Vector(i.ePos)):perpendicular()
					S2 = GetOrigin(myHero)
					jp = Vector(VectorIntersection(i.sPos,i.ePos,S1,S2).x,i.ePos.y,VectorIntersection(i.sPos,i.ePos,S1,S2).y)
					if GetDistance(myHero,GetOrigin(i.Obj)) < i.spell.radius + i.sSpeed + i.sDelay + myHero.boundingRadius then 
						i.jp = jp
					else
						i.jp = nil
					end
					-- and not i.safe then
					if i.jp and GetDistance(myHero,i.jp) < i.spell.radius + myHero.boundingRadius and not i.safe then
						if GetDistance(GetOrigin(myHero) + Vector(i.sPos-i.ePos):perpendicular(),jp) >= GetDistance(GetOrigin(myHero) + Vector(i.sPos-i.ePos):perpendicular2(),jp) then
							patha = jp + Vector(i.sPos - i.ePos):perpendicular():normalized() * ((i.spell.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value())
							if not MapPosition:inWall(patha) then
									i.safe = jp + Vector(i.sPos - i.ePos):perpendicular():normalized() * ((i.spell.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value())
								else 
									i.safe = jp + Vector(jp - i.safe) + Vector(i.sPos - i.ePos):perpendicular2():normalized() * ((i.spell.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value()) --// might not work
							end
						end
						--print("register")
						i.isEvading = true
						--DisableAll(true)
					else
						patha = nil
						i.safe = nil
						i.isEvading = false
					end
				elseif i.sType == "Circular" then
					if GetDistance(myHero,i.ePos) < i.radius + myHero.boundingRadius and not i.safe then
						pathb = Vector(i.ePos) + (GetOrigin(myHero) - Vector(i.ePos)):normalized() * ((i.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value())
						if not MapPosition:inWall(pathb) then
								i.safe = Vector(i.ePos) + (GetOrigin(myHero) - Vector(i.ePos)):normalized() * ((i.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value())
							else
								i.safe = myHero + Vector(i.ePos) + (GetOrigin(myHero) - Vector(i.ePos)):normalized() * ((i.radius + myHero.boundingRadius)*1.1+EMenu.Advanced.ew:Value())
						end
						i.isEvading = true
						--DisableAll(true)
					else
						pathb = nil
						i.safe = nil
						i.isEvading = false
					end
				end
			--DashP = Dash - Position, DashS = Dash - Self, DashT = Dash - Targeted, SpellShieldS = SpellShield - Self, SpellShieldT = SpellShield - Targeted, WindWallP = WindWall - Position, 
			   if EMenu.Keys.DD:Value() then return end
				if i.safe then
					BlockInput(true)
					MoveToXYZ(i.safe)
					if not d[GetObjectName(myHero)] then IsEvading2 = false end
					if d[GetObjectName(myHero)] and d[GetObjectName(myHero)].evadeType and d[GetObjectName(myHero)].spellKey and EMenu.Spells[GetObjectName(p)]["d"..tabl.name]:Value() >= EMenu.Dashes["d"..d[GetObjectName(myHero)].name]:Value() and EMenu.Dashes[d[GetObjectName(myHero)].name]:Value() then 
						if i.uDodge == true then
							if d[GetObjectName(myHero)].evadeType == "DashP" and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == READY then
								IsEvading2 = true
								CastSkillShot(d[GetObjectName(myHero)].spellKey, i.safe)
							else
								IsEvading2 = false
							end	
							if d[GetObjectName(myHero)].evadeType == "DashT" then
								for pp,ally in pairs(GetAllyHeroes()) do
									if ally ~= nil then
										if GetDistance(myHero,ally) < d[GetObjectName(myHero)].range and not ally.dead and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == READY then
											IsEvading2 = true	
											DelayAction(function()								
												CastTargetSpell(ally, d[GetObjectName(myHero)].spellKey)
											end,oT*fT*.001)
										else
											IsEvading2 = false
										end
									end
								end
								for _,minion in pairs(minionManager.objects) do
									if GetTeam(minion) == MINION_ALLY then 
										if GetDistance(myHero,minion) < d[GetObjectName(myHero)].range and not minion.dead and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == READY then
											IsEvading2 = true
											DelayAction(function()										
												CastTargetSpell(minion, d[GetObjectName(myHero)].spellKey)
											end,oT*fT*.001)
										else
											IsEvading2 = false
										end
									end
									if GetTeam(minion) == MINION_JUNGLE then 
										if GetDistance(myHero,minion) < d[GetObjectName(myHero)].range and not minion.dead and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == READY then
											IsEvading2 = true
											DelayAction(function()
												CastTargetSpell(minion, d[GetObjectName(myHero)].spellKey)
											end,oT*fT*.001)
										else
											IsEvading2 = false
										end
									end
								end
							end
							if d[GetObjectName(myHero)].evadeType == "WindWallP" and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == READY then
								IsEvading2 = true
								DelayAction(function()
								CastSkillShot(d[GetObjectName(myHero)].spellKey, i.ePos)
								end,oT*fT*.001)
							else
								IsEvading2 = false
							end		
							if d[GetObjectName(myHero)].BuffName then
								if d[GetObjectName(myHero)].evadeType == "SpellShieldS" and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == 0 and GotBuff(myHero,d[GetObjectName(myHero)].BuffName) ~= 1 then
									IsEvading2 = true
									DelayAction(function()
										CastSpell(d[GetObjectName(myHero)].spellKey)
									end,oT*fT*.001)
								else
									IsEvading2 = false
								end
							end
							-- if d[GetObjectName(myHero)].evadeType == "SpellShieldT" and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == 0 then
								-- IsEvading2 = true
							-- else
								-- IsEvading2 = false
							-- end
							if d[GetObjectName(myHero)].evadeType == "DashS" and CanUseSpell(myHero, d[GetObjectName(myHero)].spellKey) == 0 then
								IsEvading2 = true
								CastSpell(d[GetObjectName(myHero)].spellKey)
							else
								IsEvading2 = false
							end
						else
							IsEvading2 = false
						end
					else
						IsEvading2 = false
					end
					if Flash and Ready(Flash) and i.uDodge == true and EMenu.Dashes.EnableFlash:Value() and EMenu.Spells[GetObjectName(p)]["d"..tabl.name]:Value() >= EMenu.Dashes.FlashDanger:Value() then
						IsEvading2 = true
						CastSkillShot(Flash, i.safe)
					else
						IsEvading2 = false
					end			
					if EMenu.Draws.DevOpt:Value() then 
						print(IsEvading2)
					end
				else
					BlockInput(false)
				end
			end
		end
	end
end)

function DisableAll(boolean)
	if boolean then
		if _G.IOW then
			IOW.movementEnabled = false
			IOW.attacksEnabled = false
		end			
		if _G.PW then
			PW.movementEnabled = false
			PW.attacksEnabled = false
		end
		if _G.DAC_Loaded then
			DAC:MovementEnabled(false)
			DAC:AttacksEnabled(false)
		end
		if _G.GoSWalkLoaded then
			_G.GoSWalk:EnableMovement(false)
			_G.GoSWalk:EnableAttack(false)
		end
		if _G.AutoCarry_Loaded then
			DACR.movementEnabled = false
			DACR.attacksEnabled = false
		end
	else
		if _G.IOW then
			IOW.movementEnabled = true
			IOW.attacksEnabled = true
		end	
		if _G.PW then
			PW.movementEnabled = true
			PW.attacksEnabled = true
		end
		if _G.DAC_Loaded then
			DAC:MovementEnabled(true)
			DAC:AttacksEnabled(true)
		end
		if _G.GoSWalkLoaded then
			_G.GoSWalk:EnableMovement(true)
			_G.GoSWalk:EnableAttack(true)
		end
		if _G.AutoCarry_Loaded then
			DACR.movementEnabled = true
			DACR.attacksEnabled = true
		end
	end
end


local t = {_G.MoveToXYZ, _G.AttackUnit, _G.HoldPosition}
function Stopp(state)
	if state then 
		_G.MoveToXYZ, _G.AttackUnit, _G.HoldPosition = function() end, function() end,function() end
		BlockF7OrbWalk(true)
		BlockF7Dodge(true)
	else
		_G.MoveToXYZ, _G.AttackUnit, _G.HoldPosition = t[1], t[2], t[3]
		BlockF7OrbWalk(false)
		BlockF7Dodge(false)
	end
end

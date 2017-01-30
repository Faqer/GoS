if not pcall( require, "Inspired" ) then PrintChat("You are missing Inspired.lua - Go download it and save it Common!") return end
                  
spellList = {
    
	-- Aatrox
	AatroxQ = { Name = "Aatrox", range = 650, spellType = 3, size = 250, speed = 2, delay = 600},
	AatroxE = { Name = "Aatrox", range = 1075, spellType = 1, size = 100, speed = 1.25, delay = 250},
	
	-- Ahri
	AhriOrbofDeception = {Name = "Ahri", range = 1000, spellType = 1, size = 100, duration = 1000, speed = 2.5, delay = 250},
	AhriOrbReturn = {Name = "Ahri", range = 1000, spellType = 1, size = 100, duration = 1000, speed = 1.9, delay = 250},
	AhriSeduce = {Name = "Ahri", range = 1000, spellType = 1, size = 60, duration = 1000, speed = 1.55, delay = 250},

	-- Amumu
	BandageToss = {Name = "Amumu", range = 1100, spellType = 1, size = 90, duration = 1000, speed = 2, delay = 250},
        CurseoftheSadMummy = {Name = "Amumu", range = 0, spellType = 3, size = 550, duration = 1000, speed = 2, delay = 250},
	
	-- Anivia
	FlashFrostSpell = {Name = "Anivia", range = 1100, spellType = 1, size = 110, duration = 2000, speed = 0.85, delay = 250},
    
	-- Annie
	Incinerate = {Name = "Annie", range = 825, spellType = 1, size = 80, duration = 1000, delay = 250},
	InfernalGuardian = {Name = "Annie", range = 600, spellType = 3, size = 250, duration = 1000, delay = 250},
	
	-- Ashe
	EnchantedCrystalArrow = {Name = "Ashe", range = 50000, spellType = 1, size = 130, duration = 4000},

	-- Bard
	BardQ = {Name = "Bard", range = 950, spellType = 1, size = 60, duration = 1000, speed = 1.6, delay = 250},
	BardR = {Name = "Bard", range = 3400, spellType = 3, size = 350, duration = 1000, speed = 2.1, delay = 500},
	
	-- Blitzcrank
	RocketGrabMissile = {Name = "Blitzcrank", range = 1050, spellType = 1, size = 100, duration = 1000, speed = 1.8, delay = 250},
	StaticField = {Name = "Blitzcrank", range = 0, spellType = 3, size = 600, duration = 250, delay = 250},
				
	-- Brand
	BrandBlazeMissile = {Name = "Brand", range = 1100, spellType = 1, size = 60, duration = 1000, speed = 1.6, delay = 250},
	BrandFissure = {Name = "Brand", range = 900, spellType = 3, size = 240, duration = 1000, delay = 850},
	
	-- Braum
	BraumQMissile = {Name = "Braum", range = 1050, spellType = 1, size = 60, duration = 1000, speed = 1.7, delay = 250},
	braumrmissile = {Name = "Braum", range = 1200, spellType = 1, size = 115, duration = 1000, speed = 1.4, delay = 500},

	-- Caitlyn
	CaitlynPiltoverPeacemaker = {Name = "Caitlyn", range = 1300, spellType = 1, size = 90, duration = 1000, speed = 2.2, delay = 625},
	CaitlynEntrapmentMissile = {Name = "Caitlyn", range = 1000, spellType = 1, size = 80, duration = 1000, speed = 2, delay = 125},

	-- Cassiopeia
	CassiopeiaNoxiousBlast = {Name = "Cassiopeia", range = 850, spellType = 3, size = 150, duration = 1000},
	CassiopeiaMiasma = {Name = "Cassiopeia", range = 850, spellType = 3, size = 175, duration = 1000},
	CassiopeiaPetrifyingGaze = {Name = "Cassiopeia", range = 850, spellType = 6, size = 300, duration = 1000},

	-- Cho'Gath
	Rupture = {Name = "Chogath", range = 950, spellType = 3, size = 250, duration = 1500},

	-- Corki
	PhosphorusBomb = {Name = "Corki", range = 650, spellType = 3, size = 150, duration = 1000},
	MissileBarrageMissile = {Name = "Corki", range = 1225, spellType = 1, size = 80, duration = 1000, speed = 2.0, delay = 300},
	MissileBarrageMissile2 = {Name = "Corki", range = 1225, spellType = 1, size = 100, duration = 1000, speed = 2.0, delay = 300},
	CarpetBomb = {Name = "Corki", range = 800, spellType = 2, size = 150, duration = 1000},

	-- Diana
	DianaArc = {Name = "Diana", range = 900, spellType = 3, size = 205, duration = 1000},

	-- Draven
	DravenDoubleShot = {Name = "Draven", range = 1050, spellType = 1, size = 125, duration = 1000},
	DravenRCast = {Name = "Draven", range = 20000, spellType = 1, size = 100, duration = 6000},

	-- DrMundo
	InfectedCleaver = {Name = "DrMundo", range = 1000, spellType = 1, size = 80, duration = 1000, speed = 2, delay = 300},
	InfectedCleaverMissile = {Name = "DrMundo", range = 1000, spellType = 1, size = 80, duration = 1000, speed = 2, delay = 300},

	-- Ezreal
	EzrealMysticShotMissile = {Name = "Ezreal", range = 1200, spellType = 1, size = 50, delay = 250, speed = 1975, duration = 1000},
	EzrealEssenceFluxMissile = {Name = "Ezreal", range = 900, spellType = 1, size = 100, duration = 1000, speed = 1.5, delay = 300},
	EzrealTrueshotBarrage = {Name = "Ezreal", range = 50000, spellType = 4, size = 150, duration = 4000, speed = 0, delay = 1000,},
	EzrealArcaneShift = {Name = "Ezreal", range = 475, spellType = 5, size = 100, duration = 1000},

	--Fizz
	FizzMarinerDoom = {Name = "Fizz", range = 1275, spellType = 2, size = 100, duration = 1500},

	--FiddleSticks
	Crowstorm = {Name = "FiddleSticks", range = 800, spellType = 3, size = 600, duration = 1500},

	-- Galio
	GalioResoluteSmite = {Name = "Galio", range = 900, spellType = 3, size = 200, duration = 1500},
	GalioRighteousGust = {Name = "Galio", range = 1000, spellType = 1, size = 200, duration = 1500},

	-- Gragas
	GragasBarrelRoll = {Name = "Gragas", range = 1100, spellType = 3, size = 320, duration = 2500, speed = 1, delay = 300},
	GragasExplosiveCask = {Name = "Gragas", range = 1050, spellType = 3, size = 400, duration = 1500},
	GragasBodySlam = {Name = "Gragas", range = 650, spellType = 2, size = 60, duration = 1500},

	-- Graves
	GravesChargeShot = {Name = "Graves", range = 1000, spellType = 1, size = 110, duration = 1000},
	GravesClusterShot = {Name = "Graves", range = 750, spellType = 1, size = 50, duration = 1000},
	GravesSmokeGrenade = {Name = "Graves", range = 700, spellType = 3, size = 275, duration = 1500},

	-- Heimerdinger
	CH1ConcussionGrenade = {Name = "Heimerdinger", range = 950, spellType = 3, size = 225, duration = 1500},

	-- Irelia
	IreliaTranscendentBlades = {Name = "Irelia", range = 1200, spellType = 1, size = 80, duration = 800},

	-- Janna
	HowlingGale = {Name = "Janna", range = 1700, spellType = 1, size = 100, duration = 2000},

	-- JarvanIV
	JarvanIVDemacianStandard = {Name = "JarvanIV", range = 830, spellType = 3, size = 150, duration = 2000},
	JarvanIVDragonStrike = {Name = "JarvanIV", range = 770, spellType = 1, size = 70, duration = 1000},
	JarvanIVCataclysm = {Name = "JarvanIV", range = 650, spellType = 3, size = 300, duration = 1500},

	-- Kartus
	LayWaste = {Name = "Karthus", range = 875, spellType = 3, size = 150, duration = 1000},

	--Kassadin
	RiftWalk = {Name = "Kassadin", range = 700, spellType = 5, size = 150, duration = 1000},

	-- Katarina
	ShadowStep = {Name = "Katarina", range = 700, spellType = 3, size = 75, duration = 1000},

	-- Kennen
	KennenShurikenThrow = {Name = "Kennen", range = 1050, spellType = 1, size = 75, duration = 1000, speed = 1.7, delay = 300},
	KennenShurikenHurlMissile1 = {Name = "Kennen", range = 1050, spellType = 1, size = 75, duration = 1000, speed = 1.7, delay = 300},

	-- KogMaw
	KogMawVoidOoze = {Name = "KogMaw", range = 1115, spellType = 1, size = 100, duration = 1000},
	KogMawVoidOozeMissile = {Name = "KogMaw", range = 1115, spellType = 1, size = 100, duration = 1000},
	KogMawLivingArtillery = {Name = "KogMaw", range = 2200, spellType = 3, size = 200, duration = 1500},

	-- Leblanc
	LeblancSoulShackle = {Name = "Leblanc", range = 1000, spellType = 1, size = 80, duration = 1000},
	LeblancSoulShackleM = {Name = "Leblanc", range = 1000, spellType = 1, size = 80, duration = 1000},
	LeblancSlide = {Name = "Leblanc", range = 600, spellType = 3, size = 250, duration = 1000},
	LeblancSlideM = {Name = "Leblanc", range = 600, spellType = 3, size = 250, duration = 1000},
	leblancslidereturn = {Name = "Leblanc", range = 1000, spellType = 3, size = 50, duration = 1000},
	leblancslidereturnm = {Name = "Leblanc", range = 1000, spellType = 3, size = 50, duration = 1000},

	-- LeeSin
	BlindMonkQOne = {Name = "LeeSin", range = 975, spellType = 1, size = 80, duration = 1000, speed = 1.8, delay = 300},
	BlindMonkRKick = {Name = "LeeSin", range = 1200, spellType = 1, size = 100, duration = 1000,},

	-- Leona
	LeonaZenithBladeMissile = {Name = "Leona", range = 700, spellType = 1, size = 80, duration = 1000},

	-- Lulu
	LuluQ = {Name = "Lulu", range = 975, spellType = 1, size = 50, duration = 1000},

	-- Lux
	LuxLightBinding = {Name = "Lux", range = 1300, spellType = 1, size = 80, duration = 1000, speed = 1.17, delay = 300},
	LucentSingularity = {Name = "Lux", range = 1100, spellType = 3, size = 300, duration = 2500, speed = 1.24, delay = 300},
	LuxLightStrikeKugel = {Name = "Lux", range = 1100, spellType = 3, size = 300, duration = 2500, speed = 1.24, delay = 300},
	FinalesFunkeln = {Name = "Lux", range = 3000, spellType = 1, size = 80, duration = 1500, speed = 0, delay = 500,},
	LuxMaliceCannon = {Name = "Lux", range = 3000, spellType = 1, size = 80, duration = 1500, speed = 0, delay = 500,},
		
	-- Malphite
	UFSlash = {Name = "Malphite", range = 1000, spellType = 3, size = 325, duration = 1000},

	-- Malzahar
	AlZaharCalloftheVoid = {Name = "Malzahar", range = 900, spellType = 3, size = 100, duration = 1000},
	AlZaharNullZone = {Name = "Malzahar", range = 800, spellType = 3, size = 250, duration = 1000},
		
	-- Maokai
	MaokaiTrunkLineMissile = {Name = "Maokai", range = 600, spellType = 1, size = 100, duration = 1000},
	MaokaiSapling2 = {Name = "Maokai", range = 1100, spellType = 3, size = 350, duration = 1000},

	-- MissFortune
	MissFortuneScattershot = {Name = "MissFortune", range = 800, spellType = 3, size = 400, duration = 1000},
		
	-- Morgana
	DarkBinding = {Name = "Morgana", range = 1300, spellType = 1, size = 100, duration = 1500, speed = 1.2, delay = 300},
	DarkBindingMissile = {Name = "Morgana", range = 1300, spellType = 1, size = 100, duration = 1500, speed = 1.2, delay = 300},
	TormentedSoil = {Name = "Morgana", range = 900, spellType = 3, size = 350, duration = 1500},

	-- Nautilus
	NautilusAnchorDrag = {Name = "Nautilus", range = 950, spellType = 1, size = 80, duration = 1500},

	-- Nidalee
	JavelinToss = {Name = "Nidalee", range = 1500, spellType = 1, size = 80, duration = 1500, speed = 1.3, delay = 300},

	-- Nocturne
	NocturneDuskbringer = {Name = "Nocturne", range = 1200, spellType = 1, size = 80, duration = 1500},

	-- Olaf
	OlafAxeThrow = {Name = "Olaf", range = 1000, spellType = 2, size = 100, duration = 1500, speed = 1.6, delay = 300},

	-- Orianna
	OrianaIzunaCommand = {Name = "Orianna", range = 825, spellType = 3, size = 150, duration = 1500},

	-- Renekton
	RenektonSliceAndDice = {Name = "Renekton", range = 450, spellType = 1, size = 80, duration = 1000},
	renektondice = {Name = "Renekton", range = 450, spellType = 1, size = 80, duration = 1000},

	-- Rumble
	RumbleGrenadeMissile = {Name = "Rumble", range = 1000, spellType = 1, size = 100, duration = 1500},

	-- Sejuani
	SejuaniGlacialPrison = {Name = "Sejuani", range = 1150, spellType = 1, size = 80, duration = 1000},

	-- Sivir
	SpiralBlade = {Name = "Sivir", range = 1000, spellType = 1, size = 100, duration = 1000, speed = 1.33, delay = 300},

	-- Singed
	MegaAdhesive = {Name = "Singed", range = 1000, spellType = 3, size = 350, duration = 1500},

	-- Shaco
	Deceive = {Name = "Shaco", range = 500, spellType = 5, size = 100, duration = 3500},

	-- Shen
	ShenShadowDash = {Name = "Shen", range = 600, spellType = 2, size = 80, duration = 1000},

	-- Shyvana
	ShyvanaTransformLeap = {Name = "Shyvana", range = 925, spellType = 1, size = 80, duration = 1500},
	ShyvanaFireballMissile = {Name = "Shyvana", range = 1000, spellType = 1, size = 80, duration = 1000},

	-- Skarner
	SkarnerFracture = {Name = "Skarner", range = 600, spellType = 1, size = 100, duration = 1000},

	-- Sona
	SonaCrescendo = {Name = "Sona", range = 1000, spellType = 1, size = 150, duration = 1000},

	-- Swain
	--Nevermove
	SwainShadowGrasp = {Name = "Swain", range = 900, spellType = 3, size = 265, duration = 1500},

	-- Tristana
	RocketJump = {Name = "Tristana", range = 900, spellType = 3, size = 200, duration = 1000},

	-- Tryndamere
	MockingShout = {Name = "Tryndamere", range = 850, spellType = 6, size = 100, duration = 1000},
	Slash = {Name = "Tryndamere", range = 600, spellType = 2, size = 100, duration = 1000},

	-- TwistedFate
	WildCards = {Name = "TwistedFate", range = 1450, spellType = 1, size = 80, duration = 1000},

	-- Urgot
	UrgotHeatseekingLineMissile = {Name = "Urgot", range = 1000, spellType = 1, size = 80, duration = 800},
	UrgotPlasmaGrenade = {Name = "Urgot", range = 950, spellType = 3, size = 300, duration = 1000},

	-- Varus
	VarusR = {Name = "Varus", range = 1075, spellType = 1, size = 80, duration = 1500},
	VarusQ = {Name = "Varus", range = 1475, spellType = 1, size = 50, duration = 1000},

	-- Vayne
	VayneTumble = {Name = "Vayne", range = 250, spellType = 5, size = 100, duration = 1000},

	-- Veigar
	VeigarDarkMatter = {Name = "Veigar", range = 900, spellType = 3, size = 225, duration = 2000},

	-- Viktor
	ViktorDeathRay = {Name = "Viktor", range = 700, spellType = 1, size = 80, duration = 2000},

	-- Xerath
	xeratharcanopulsedamage = {Name = "Xerath", range = 900, spellType = 1, size = 80, duration = 1000},
	xeratharcanopulsedamageextended = {Name = "Xerath", range = 1300, spellType = 1, size = 80, duration = 1000},
	xeratharcanebarragewrapper = {Name = "Xerath", range = 900, spellType = 3, size = 250, duration = 1000},
	xeratharcanebarragewrapperext = {Name = "Xerath", range = 1300, spellType = 3, size = 250, duration = 1000},

	-- Ziggs
	ZiggsQ = {Name = "Ziggs", range = 850, spellType = 3, size = 160, duration = 1000,},
	ZiggsW = {Name = "Ziggs", range = 1000, spellType = 3, size = 225, duration = 1000,},
	ZiggsE = {Name = "Ziggs", range = 900, spellType = 3, size = 250, duration = 1000,},
	ZiggsR = {Name = "Ziggs", range = 5300, spellType = 3, size = 550, duration = 3000,},
	
	-- Zyra
	ZyraQFissure = {Name = "Zyra", range = 825, spellType = 3, size = 275, duration = 1500,},
	ZyraGraspingRoots = {Name = "Zyra", range = 1100, spellType = 1, size = 90, duration = 1500,},
}
       
        _G.IsEvading = false
	local spellArray = {}
	local spellArrayCount = 0
	local moveTo = {}
	
	local colors = {0xffffffff, 0xff00ffff, 0xffff0000, 0xff00ff00, 0xffffff00}
	
DelayAction(function()
	for _,enemy in pairs(GetEnemyHeroes()) do
		if enemy ~= nil then
			for i, spell in pairs(spellList) do
				if spell.Name == GetObjectName(enemy) then
				spellArrayCount = spellArrayCount + 1
				spellArray[i] = spellList[i]
				spellArray[i].color = colors[spellArray[i].spellType]
				spellArray[i].shot = false
				spellArray[i].lastshot = 0
				spellArray[i].skillshotpoint = {}
				end
			end
	        end
	end
end, 1)

	local Evaduuu = MenuConfig("Evaduuu", "Evaduuu")
	Evaduuu:Boolean("drawSkillShot", "Draw Skills", true)
	Evaduuu:KeyBinding("dodgeSkillShot", "Dodge Skills", string.byte("K"), true)
	Evaduuu:Slider("dodgeSpace", "Additional Dodge Distance", 150, 50, 500, 0)
			
	detectedSkillshots = {}
			
	function calculateLinepass(pos1, pos2, maxDist)
		local spellVector = Vector(pos2) - pos1
		spellVector = spellVector / spellVector:len() * maxDist
		return {Vector(pos1), spellVector + pos1}
	end
		
	function calculateLinepoint(pos1, pos2, maxDist)
		local spellVector = Vector(pos2) - pos1
		if spellVector:len() > maxDist then
		spellVector = spellVector / spellVector:len() * maxDist
		end
		return {Vector(pos1), spellVector + pos1}
	end
	
	function calculateLineaoe(pos1, pos2, maxDist)
		return {Vector(pos2)}
	end
			
	function calculateLineaoe2(pos1, pos2, maxDist)
		local spellVector = Vector(pos2) - pos1
		if spellVector:len() > maxDist then
		spellVector = spellVector / spellVector:len() * maxDist
		end
		return {Vector(pos1) + spellVector}
	end

	function dodgeAOE(pos1, pos2, radius)
		local distancePos2 = GetDistance(pos2)
		if distancePos2 < radius then
		movex = pos2.x + ((radius+50)/distancePos2)*(myHeroPos().x-pos2.x)
		movez = pos2.z + ((radius+50)/distancePos2)*(myHeroPos().z-pos2.z)
		MoveToXYZ(movex,0,movez)
		end
	end

	function dodgeLinePoint(pos1, pos2, radius)
		local distancePos1 = GetDistance(pos1)
		local distancePos2 = GetDistance(pos2)
		local distancePos1Pos2 = GetDistance(pos1, pos2)
		local perpendicular = (math.floor((math.abs((pos2.x-pos1.x)*(pos1.z-myHeroPos().z)-(pos1.x-myHeroPos().x)*(pos2.z-pos1.z)))/distancePos1Pos2))
		if perpendicular < radius and distancePos2 < distancePos1Pos2 and distancePos1 < distancePos1Pos2 then
		local k = ((pos2.z-pos1.z)*(myHeroPos().x-pos1.x) - (pos2.x-pos1.x)*(myHeroPos().z-pos1.z)) / distancePos1Pos2
		local pos3 = {}
		pos3.x = myHeroPos().x - k * (pos2.z-pos1.z)
		pos3.z = myHeroPos().z + k * (pos2.x-pos1.x)
		local distancePos3 = GetDistance(pos3)
		movex = pos3.x + ((radius+50)/distancePos3)*(myHeroPos().x-pos3.x)
		movez = pos3.z + ((radius+50)/distancePos3)*(myHeroPos().z-pos3.z)
		MoveToXYZ(movex,0,movez)
	        end
	end

	function dodgeLinePass(pos1, pos2, radius, maxDist)
		local distancePos1 = GetDistance(pos1)
		local distancePos1Pos2 = GetDistance(pos1, pos2)
		local pos3 = {}
		pos3.x = pos1.x + (maxDist)/distancePos1Pos2*(pos2.x-pos1.x)
		pos3.z = pos1.z + (maxDist)/distancePos1Pos2*(pos2.z-pos1.z)
		local distancePos3 = GetDistance(pos3)
		local distancePos1Pos3 = GetDistance(pos1, pos3)
		local perpendicular = (math.floor((math.abs((pos3.x-pos1.x)*(pos1.z-myHeroPos().z)-(pos1.x-myHeroPos().x)*(pos3.z-pos1.z)))/distancePos1Pos3))
		if perpendicular < radius and distancePos3 < distancePos1Pos3 and distancePos1 < distancePos1Pos3 then
		local k = ((pos3.z-pos1.z)*(myHeroPos().x-pos1.x) - (pos3.x-pos1.x)*(myHeroPos().z-pos1.z)) / ((pos3.z-pos1.z)^2 + (pos3.x-pos1.x)^2)
		local pos4 = {}
		pos4.x = myHeroPos().x - k * (pos3.z-pos1.z)
		pos4.z = myHeroPos().z + k * (pos3.x-pos1.x)
		local distancePos4 = GetDistance(pos4)
		movex = pos4.x + ((radius+50)/distancePos4)*(myHeroPos().x-pos4.x)
		movez = pos4.z + ((radius+50)/distancePos4)*(myHeroPos().z-pos4.z)
		MoveToXYZ(movex,0,movez)
		end
	end
		
	OnProcessSpell(function(unit,spell)
		if IsDead(unit) == true then return end
		if unit ~= nil and GetTeam(unit) ~= GetTeam(GetMyHero()) and spellArray[spell.name] ~= nil and GetDistance(unit) < spellArray[spell.name].range + spellArray[spell.name].size + 500 then
			local startPosition = Vector(unit)
			local endPosition = Vector(spell.endPos)
			local delay = spellArray[spell.name].delay or 0
			local range = spellArray[spell.name].range or 0
			local projectileSpeed = spellArray[spell.name].speed or 1
			local duration = range/projectileSpeed*1000
			local directionVector = (endPosition - startPosition):normalized()
			endPosition = startPosition + directionVector * range
			table.insert(detectedSkillshots, {startPosition = startPosition, endPosition = endPosition, directionVector = directionVector, startTick = GetTickCount() + delay, endTick = GetTickCount() + delay + duration, skillshot = skillshot})
					
			spellArray[spell.name].shot = true
			spellArray[spell.name].lastshot = GetTickCount()
			if spellArray[spell.name].spellType == 1 then
			        spellArray[spell.name].skillshotpoint = calculateLinepass(GetOrigin(unit), spell.endPos, spellArray[spell.name].range)
				if Evaduuu.dodgeSkillShot:Value() then
				dodgeLinePass(spell.startPos, spell.endPos, spellArray[spell.name].size+GetHitBox(myHero), spellArray[spell.name].range)
				_G.IsEvading = true
				end
			elseif spellArray[spell.name].spellType == 2 then
				spellArray[spell.name].skillshotpoint = calculateLinepoint(spell.startPos, spell.endPos, spellArray[spell.name].range)
				if Evaduuu.dodgeSkillShot:Value() then
				dodgeLinePoint(spell.startPos, spell.endPos, spellArray[spell.name].size+GetHitBox(myHero))
				_G.IsEvading = true
				end
			elseif spellArray[spell.name].spellType == 3 then
				spellArray[spell.name].skillshotpoint = calculateLineaoe(spell.startPos, spell.endPos, spellArray[spell.name].range)
				if Evaduuu.dodgeSkillShot:Value() then
				dodgeAOE(spell.startPos, spell.endPos, spellArray[spell.name].size+GetHitBox(myHero))
				_G.IsEvading = true
				end
			elseif spellArray[spell.name].spellType == 4 then
				spellArray[spell.name].skillshotpoint = calculateLinepass(spell.startPos, spell.endPos, 5000)
				if Evaduuu.dodgeSkillShot:Value() then
				dodgeLinePass(spell.startPos, spell.endPos, spellArray[spell.name].size+GetHitBox(myHero), spellArray[spell.name].range)
				_G.IsEvading = true
				end
			elseif spellArray[spell.name].spellType == 5 then
				spellArray[spell.name].skillshotpoint = calculateLineaoe2(spell.startPos, spell.endPos, spellArray[spell.name].range)
				if Evaduuu.dodgeSkillShot:Value() then
				dodgeAOE(spell.startPos, spell.endPos, spellArray[spell.name].size+GetHitBox(myHero))
				_G.IsEvading = true
				end
			end
		end
	end)
			
	OnDraw(function(myHero)
		if Evaduuu.drawSkillShot:Value() then
			for i, spell in pairs(spellArray) do
				if spell.shot and #spell.skillshotpoint > 0 then
					if #spell.skillshotpoint == 1 then
					DrawCircle(spell.skillshotpoint[1].x, spell.skillshotpoint[1].y, spell.skillshotpoint[1].z, spell.size, 1, 0, spell.color)
					end
					if #spell.skillshotpoint == 3 then
					DrawCircle(spell.skillshotpoint[3].x, spell.skillshotpoint[3].y, spell.skillshotpoint[3].z, spell.size, 1, 0, spell.color)
					end
				end
			end
		end
	end)
			
        OnTick(function(myHero)
		local tick = GetTickCount()
			 
		for i, detectedSkillshot in pairs(detectedSkillshots) do
			if detectedSkillshot.endTick <= tick then
			table.remove(detectedSkillshots, i)
			i = i-1
			_G.IsEvading = false
			end
	        end
	        
	        for i, spell in pairs(spellArray) do
			if spell.shot and spell.lastshot < tick - 1000 then
			spell.shot = false
			spell.skillshotpoint = {}
			moveTo = {}
			end
		end
	end)

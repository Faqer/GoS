if GetObjectName(GetMyHero()) ~= "Varus" then return end

require("Inspired")
if not pcall( require, "OpenPredict" ) then PrintChat("This script doesn't work without OpenPredict! Download it!") return end

local version = 1
 
--AutoUpdate("/LoggeL/GoS/master/Varus.lua","/LoggeL/GoS/master/Varus.version","Varus.lua",version)

-- Menu
VMenu = Menu("Varus", "Varus")
VMenu:SubMenu("c", "Combo")
VMenu.c:Boolean("Q", "Use Q", true)
VMenu.c:Slider("sQ", "Stacks to use Q", 0, 0, 3, 1)
VMenu.c:Boolean("cQ", "Always fully charge Q", false)
VMenu.c:Boolean("E", "Use E", true)
VMenu.c:Slider("sE", "Stacks to use E", 1, 0, 3, 1)
VMenu.c:Boolean("R", "Use R", true)
VMenu.c:Slider("RE", "Enemies around for R", 3, 1, 5, 1)

VMenu:SubMenu("ks", "Killsteal")
VMenu.ks:Boolean("KSS","Smart Killsteal", true)
VMenu.ks:Boolean("KSQ","Killsteal with Q", true)
VMenu.ks:Boolean("KSE","Killsteal with E", true)
VMenu.ks:Boolean("KSR","Killsteal with R", true)

VMenu:SubMenu("p", "Prediction")
VMenu.p:Slider("hQ", "HitChance Q", 20, 0, 100, 1)
VMenu.p:Slider("hE", "HitChance E", 20, 0, 100, 1)
VMenu.p:Slider("hR", "HitChance R", 20, 0, 100, 1)

VMenu:SubMenu("d", "Draw Damage")
VMenu.d:Boolean("dD","Draw Damage", true)
VMenu.d:Boolean("dQ","Draw Q", true)
VMenu.d:Boolean("dW","Draw W", true)
VMenu.d:Boolean("dE","Draw E", true)
VMenu.d:Boolean("dR","Draw R", true)

VMenu:SubMenu("i", "Items")
VMenu.i:Boolean("iC","Use Items only in Combo", true)
VMenu.i:Boolean("iO","Use offensive Items", true)
VMenu.i:Boolean("iQ","Use QSS/Merc", true)
VMenu.i:Boolean("cStun","Cleanse Stun", true)
VMenu.i:Boolean("cTaunt","Cleanse Taunt", true)
VMenu.i:Boolean("cSnare","Cleanse Snare", true)
VMenu.i:Boolean("cFear","Cleanse Fear", true)
VMenu.i:Boolean("cCharm","Cleanse Charm", true)
VMenu.i:Boolean("cSupp","Cleanse Suppression", true)

VMenu:SubMenu("a", "AutoLvl")
VMenu.a:Boolean("aL", "Use AutoLvl", true)
VMenu.a:DropDown("aLS", "AutoLvL", 1, {"Q-W-E","Q-E-W"})
VMenu.a:Slider("sL", "Start AutoLvl with LvL x", 1, 1, 18, 1)
VMenu.a:Boolean("hL", "Humanize LvLUP", true)

VMenu:SubMenu("s","Skin")
VMenu.s:Boolean("uS", "Use Skin", false)
VMenu.s:Slider("sV", "Skin Number", 0, 0, 7, 1)

--Var
qTime = 0
qCharge = false
qRange = 0
VarusE = { delay = 0.1, speed = 1700, width = 55, range = 925, radius = 275 }
VarusR = { delay = 0.1, speed = 1850, width = 120, range = 1075}
cSkin=0
local item={GetItemSlot(myHero,3144),GetItemSlot(myHero,3142),GetItemSlot(myHero,3153)}
--						 cutlassl 				 gb 			 bork 

--Lvlup table
lTable={
[1]={_Q,_W,_E,_Q,_Q,_R,_Q,_W,_Q,_W,_R,_W,_W,_E,_E,_R,_E,_E},
[2]={_Q,_E,_W,_Q,_Q,_R,_Q,_E,_Q,_E,_R,_E,_E,_W,_W,_R,_W,_W}
}

wTrack = {}
DelayAction( function()
	for _,i in pairs(GetEnemyHeroes()) do
		wTrack[GetObjectName(i)]=0
	end
end,1)


-- Start
OnTick(function(myHero)
	if not IsDead(myHero) then
		local unit = GetCurrentTarget()
		ks()
		combo(unit)
		items(unit)
		lvlUp()
		skin()
	end
end)

OnDraw(function(myHero)
	for i,unit in pairs(GetEnemyHeroes()) do
		if ValidTarget(unit,2000) and VMenu.d.dD:Value() then
			local DmgDraw=0
			if Ready(_Q) and VMenu.d.dQ:Value() then
				DmgDraw = DmgDraw + qDmg(unit)
			end
			if Ready(_Q) or Ready(_E) and VMenu.d.dW:Value() then
				DmgDraw = DmgDraw + StackDamage(unit)
			end
			if Ready(_E) and VMenu.d.dE:Value() then
				DmgDraw = DmgDraw + CalcDamage(myHero, unit, GetCastLevel(myHero,_E)*35+30+GetBonusDmg(unit)*.6 ,0)
			end
			if Ready(_R) and VMenu.d.dR:Value() then
				DmgDraw = DmgDraw + CalcDamage(myHero, unit, 0 ,GetCastLevel(myHero,_R)*75+25+GetBonusAP(unit))
			end
			if DmgDraw > GetCurrentHP(unit) then
				DmgDraw = GetCurrentHP(unit)
			end
			DrawDmgOverHpBar(unit,GetCurrentHP(unit),DmgDraw,0,0xffffffff)
		end
	end
end)


--Functions

function combo(unit)
	if qCharge and (1000 + (GetTickCount() - qTime) * 0.4) < 1625 then
		qRange = 1000 + (GetTickCount() - qTime) * 0.4
	elseif not qCharge then
		qRange = 900
	end
	if IOW:Mode() == "Combo" then
		--Q1
		if VMenu.c.Q:Value() and Ready(_Q) and ValidTarget(unit, 1500) and not qCharge and wTrack[GetObjectName(unit)] >= VMenu.c.sQ:Value() then
			CastSkillShot(_Q,GetOrigin(myHero))	
		end
		
		--Q2
		if VMenu.c.Q:Value() and Ready(_Q) and ValidTarget(unit, qRange) and qCharge then
			local VarusQ = { delay = 0.1, speed = 1850, width = 70, range = qRange }
			local QPred = GetPrediction(unit, VarusQ)
			--DrawCircle(GetOrigin(myHero),qRange,0,3,0xffffff00)
			
			if QPred and QPred.hitChance >= (VMenu.p.hQ:Value()/100) then
				if not VMenu.c.cQ:Value() or qRange > 1500 then
					CastSkillShot2(_Q, QPred.castPos)
				end
			end
		end
		
		--E
		if Ready(_E) and VMenu.c.E:Value() and ValidTarget(unit, GetCastRange(myHero,_E)) and wTrack[GetObjectName(unit)] >= VMenu.c.sE:Value() then
			local EPred=GetCircularAOEPrediction(unit, VarusE)
			if EPred and EPred.hitChance >= (VMenu.p.hE:Value()/100) then
				CastSkillShot(_E,EPred.castPos)
			end
		end		
		
		--R
		if Ready(_R) and VMenu.c.R:Value() and ValidTarget(unit, 1075) and EnemiesAround(GetOrigin(unit), 600) >= VMenu.c.RE:Value() then
			local RPred=GetPrediction(unit, VarusR)
			if RPred and RPred.hitChance >= (VMenu.p.hR:Value()/100) then
				CastSkillShot(_R,RPred.castPos)
			end
		end		
	end
end

function ks()
	for i,unit in pairs(GetEnemyHeroes()) do
		
		--Smark KS
		if VMenu.ks.KSS:Value() and ValidTarget(unit, 1075) and Ready(_R) then
			if Ready(_Q) and VMenu.ks.KSQ:Value() and (GetCurrentHP(unit)+GetDmgShield(unit)) < CalcDamage(myHero, unit, qDmg(unit) , GetCastLevel(myHero,_R) * 75 + 25 + GetBonusAP(unit) + 2 * GetMaxHP(unit) * ((1.25 + GetCastLevel(myHero,_W) * 0.75) + GetBonusAP(unit) * 0.02) *.01) and (GetCurrentHP(unit)+GetDmgShield(unit)) > CalcDamage(myHero, unit, GetCastLevel(myHero,_Q) * 50 - 40 + GetBonusDmg(unit) * 1.5,GetMaxHP(unit) * ((1.25 + GetCastLevel(myHero,_W) * 0.75) + GetBonusAP(unit) * 0.02) * .01* wTrack[GetObjectName(unit)]) then
				local RPred=GetPrediction(unit, VarusR)
				local VarusQ = { delay = 0.1, speed = 1850, width = 70, range = qRange }
				local QPred = GetPrediction(unit, VarusQ)
				if RPred and RPred.hitChance >= (VMenu.p.hR:Value()/100) and QPred and QPred.hitChance >= (VMenu.p.hQ:Value()/100) then
					CastSkillShot(_R,RPred.castPos)
					DelayAction( function()
						CastSkillShot(_Q,GetOrigin(myHero))	
							DelayAction( function()
								CastSkillShot2(_Q, GetOrigin(unit)) 
							end,0.050)
					end,50)
				end
			end
		end
	
		--Q1
		if VMenu.ks.KSQ:Value() and Ready(_Q) and ValidTarget(unit,1500) and GetCurrentHP(unit) + GetDmgShield(unit) <  qDmg(unit)*1.5 + StackDamage(unit) then 
			if not qCharge then
				CastSkillShot(_Q,GetOrigin(myHero))	
		--Q2
			elseif qCharge and GetCurrentHP(unit) + GetDmgShield(unit) <  qDmg(unit) + StackDamage(unit) then
				local VarusQ = { delay = 0.1, speed = 1850, width = 70, range = qRange }
				local QPred = GetPrediction(unit, VarusQ)
				if QPred and QPred.hitChance >= (VMenu.p.hQ:Value()/100) then
					CastSkillShot2(_Q, QPred.castPos)
				end
			end
		end
		
		--E
		if VMenu.ks.KSE:Value() and Ready(_E) and ValidTarget(unit,GetCastRange(myHero,_E)) and GetCurrentHP(unit)+GetDmgShield(unit) <  CalcDamage(myHero, unit, GetCastLevel(myHero,_E)*35+30+GetBonusDmg(myHero)*.6 ,0) + StackDamage(unit) then 
			local EPred=GetCircularAOEPrediction(unit, VarusE)
			if EPred and EPred.hitChance >= (VMenu.p.hE:Value()/100) then
				CastSkillShot(_E,EPred.castPos)
			end
		end
		
		--R
		if VMenu.ks.KSR:Value() and Ready(_R) and ValidTarget(unit,1075) and GetCurrentHP(unit)+GetDmgShield(unit) <  CalcDamage(myHero, unit, 0 ,GetCastLevel(myHero,_R)*75+25+GetBonusAP(myHero)) then 
			local RPred=GetPrediction(unit, VarusR)
			if RPred and RPred.hitChance >= (VMenu.p.hR:Value()/100) then
				CastSkillShot(_R,RPred.castPos)
			end
		end
	end
end

function StackDamage(unit)
	if wTrack[GetObjectName(unit)] then
		local wDmg = GetMaxHP(unit)*((1.25+GetCastLevel(myHero,_W)*0.75)+GetBonusAP(myHero)*0.02)*.01
		return CalcDamage(myHero, unit, 0, wDmg*wTrack[GetObjectName(unit)])
	else
		return 0
	end
end

function qDmg(unit)
	local delta = GetTickCount() - qTime
	local qMax = GetCastLevel(myHero,_Q)*55-30+GetBonusDmg(myHero)*1.6+GetBaseDamage(myHero)*1.6
	local qMin = qMax/16*10
	local qCur = 0
	--print("max "..CalcDamage(myHero, unit, qMax ,0)+StackDamage(unit))
	--print("min "..CalcDamage(myHero, unit, qMin ,0)+StackDamage(unit))
	qCur = qMin + (qMax - qMin) * delta / 2000
	if qCur > qMax and qCharge then 
		qCur = qMax
	elseif not qCharge then
		qCur = qMin
	elseif not Ready(_Q) then
		qCur = 0
	end
	return CalcDamage(myHero, unit, qCur ,0)
end

function items(unit)
	if VMenu.i.iO:Value() and ValidTarget(unit,500) then
		if IOW:Mode() == "Combo" or not VMenu.i.iC:Value() then
			for _,i in pairs(item) do
				if i>0 then
					CastTargetSpell(unit,i)
				end
			end
		end
	end
	if VMenu.i.iQ:Value() and iCC then
		if GetItemSlot(myHero,3140)>0 then
			CastSpell(GetItemSlot(myHero,3140))
		elseif GetItemSlot(myHero,3139)>0 then
			CastSpell(GetItemSlot(myHero,3139))
		end
	end
end

function lvlUp()
	if VMenu.a.aL:Value() and GetLevelPoints(myHero) >= 1 and GetLevel(myHero) >= VMenu.a.sL:Value() then
		if VMenu.a.hL:Value() then
			DelayAction(function() LevelSpell(lTable[VMenu.a.aLS:Value()][GetLevel(myHero)-GetLevelPoints(myHero)+1]) end, math.random(0.500,0.750))
		else
			LevelSpell(lTable[VMenu.a.aLS:Value()][GetLevel(myHero)-GetLevelPoints(myHero)+1])
		end
	end
end

function skin()
	if VMenu.s.uS:Value() and VMenu.s.sV:Value() ~= cSkin then
		HeroSkinChanger(GetMyHero(),VMenu.s.sV:Value()) 
		cSkin = VMenu.s.sV:Value()
	end
end



--CALLBACKS

OnUpdateBuff(function(unit,buffProc)
	if unit == myHero and buffProc.Name:lower() == "varusqlaunch" then 
		qCharge = true
		qTime = GetTickCount()
	elseif unit ~= myHero and buffProc.Name:lower() == "varuswdebuff" then
		wTrack[GetObjectName(unit)]=buffProc.Count
	end
	if unit == myHero then
		if VMenu.i.cStun:Value() and buffProc.Type == 5 then
			iCC = true
		elseif VMenu.i.cTaunt:Value() and buffProc.Type == 8 then
			iCC = true
		elseif VMenu.i.cSnare:Value() and buffProc.Type == 11 then
			iCC = true
		elseif VMenu.i.cFear:Value() and buffProc.Type == 21 then
			iCC = true
		elseif VMenu.i.cCharm:Value() and buffProc.Type == 22 then
			iCC = true
		elseif VMenu.i.cSupp:Value() and buffProc.Type == 24 then
			iCC = true
		end
	end
end)

OnRemoveBuff(function(unit,buffProc)
	if unit == myHero and buffProc.Name:lower() == "varusqlaunch" then 
		qCharge = false
	elseif unit ~= myHero and buffProc.Name:lower() == "varuswdebuff" then
		wTrack[GetObjectName(unit)]=0
	end
	if unit == myHero then
		if VMenu.i.cStun:Value() and buffProc.Type == 5 then
			iCC = false
		elseif VMenu.i.cTaunt:Value() and buffProc.Type == 8 then
			iCC = false
		elseif VMenu.i.cSnare:Value() and buffProc.Type == 11 then
			iCC = false
		elseif VMenu.i.cFear:Value() and buffProc.Type == 21 then
			iCC = false
		elseif VMenu.i.cCharm:Value() and buffProc.Type == 22 then
			iCC = false
		elseif VMenu.i.cSupp:Value() and buffProc.Type == 24 then
			iCC = false
		end
	end
end)

PrintChat("Varus Loaded - Enjoy your game - Logge")

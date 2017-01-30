if GetObjectName(GetMyHero()) ~= "Khazix" then return end

require('Inspired')
require('OpenPredict')
local khazix = Menu("IS khazix", "IS khazix")
khazix:SubMenu("Combo", "Combo")
khazix.Combo:Key("Combo", "Combo", string.byte(" "))
khazix.Combo:Boolean('move','Move Towards mouse', true)
khazix.Combo:Boolean('Q','use Q', true)
khazix.Combo:Boolean('W','use W', true)
khazix.Combo:Boolean('E','use E', true)
khazix.Combo:Boolean('items', 'use items', true)

khazix:SubMenu("Killsteal", "Killsteal")
khazix.Killsteal:Boolean("Q", "with Q", true)
khazix.Killsteal:Boolean("W", "with W", true)
--khazix.Killsteal:Boolean("E", "With E", true)

--if Smite ~= nil then khazix.Killsteal:Boolean("Smite", "With chilling smite", true) end

khazix:SubMenu("Kill", "Predator mode")
khazix.Kill:Boolean("KillCombo", "oneshot if possible", true)

khazix:SubMenu("Misc", "extra")
--if Ignite ~= nil then khazix.Misc:Boolean("AutoIgnite", "auto ignite", true) end
khazix.Misc:Boolean("AutoQSS", "auto QSS", true)
khazix.Misc:Boolean("Thunder", "Key Stone Thunderlords?", false)

local myHero = GetMyHero()
local PD = {15,20,25,35,45,55,65,75,85,95,110,125,140,150,160,170,180,190}
local Emini = {delay = 0.25, speed = 400, width = 325, range = 700}
local Ebig = {delay = 0.25, speed = 400, width = 325, range = 900}
local W = {delay = 0.25, speed = 1650, width = 70, range = 1025}
local CCbuffnames = {
"Stun",
"CurseoftheSadMummy",
"braumstundebuff",
"caitlynyordletrapdebuff",
"ekkowstun",
"EliseHumanE",
"powerfistslow",
"fiorawstun",
"fizzmarinerdoombomb",
"Taunt",
"gnarstun",
"HowlingGaleSpell",
"jinxeminesnare",
"karmaspiritbindroot",
"leblancsoulshacklenet",
"leblancsoulshacklenetm",
"leonazenithbladeroot",
"lissandrawfrozen",
"LuxLightBindingMis",
"LuxLightBinding",
"suppression",
"maokaiunstablegrowthroot",
"DarkBindingMissile",
"RyzeW",
"nautiluspassiveroot",
"RengarEFinalMAX",
"sorakaesnare",
"swainshadowgrasproot",
"ThreshQ", 
"threshqfakeknockup",
"varusrroot",
"veigareventhorizonstun",
"yasuorstun",
"yasuorknockupcombo",
"viktorgravitonfieldstun",
"zyragraspingrootshold",
"root",
"zedultexecute",
"fiorarmark"
}	
	

	
--pre functions
local function IfItemCastItem(itemID)

	if GetItemSlot(myHero, itemID) > 0 then
		if CanUseSpell(myHero, GetItemSlot(myHero, itemID)) == READY then
			CastSpell(GetItemSlot(myHero, itemID))
		end
	end
end

local function IfTargetItemCastItem(itemID, unit)
	if GetItemSlot(myHero, itemID) > 0 then
		if CanUseSpell(myHero, GetItemSlot(myHero, itemID)) == READY then
			CastTargetSpell(unit, GetItemSlot(myHero, itemID))
		end
	end
end
		

local function GotItemReady(itemID)
	if GetItemSlot(myHero, itemID) > 0 then
		if CanUseSpell(myHero, GetItemSlot(myHero, itemID)) == READY then	
			return true
		else 
			return false
		end
	else 
		return false
	end
end
	
local function QReady()
	return CanUseSpell(myHero, _Q) == READY 

end

local function WReady()
	return CanUseSpell(myHero, _W) == READY

end

local function EReady()
	return CanUseSpell(myHero, _E) == READY

end

local function RReady()
	return CanUseSpell(myHero, _R) == READY

end

local function CastQ(unit)
	CastTargetSpell(unit, _Q)
end	

local function CastW(unit)
	local WPred = GetPrediction(unit, W)
	if WPred and WPred.hitChance >= 0.5 and not WPred:mCollision(1) then
		CastSkillShot(_W,WPred.castPos)
	end
end

local function CastEMini(unit)
	local EPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),400,250,900,325,false,false)
	if EPred.HitChance == 1 then
		CastSkillShot(_E,EPred.PredPos)
	end
end

local function CastEPos(Pos)
	CastSkillShot(_E, GetOrigin(Pos))
end

local function CastEBig(unit)
	local EPred = GetPredictionForPlayer(GetOrigin(myHero),unit,GetMoveSpeed(unit),400,250,600,325,false,false)
	if EPred.HitChance == 1 then
		CastSkillShot(_E,EPred.PredPos)
	end
end

local function CastOffensiveItems()
	IfItemCastItem(3077)
	IfItemCastItem(3074)
end

local function CastStartItem()
	IfItemCastItem(3142)
end

local function CastAntiCCItems()
	IfItemCastItem(3140)
	IfItemCastItem(3139)
end

function IsIsolated(unit)
	for i,Enemy in pairs(GetEnemyHeroes()) do
		if unit ~= Enemy and GetDistance(unit, Enemy) < 425 then
			return false
		end
	end
	
	for _, minion in pairs(minionManager.objects) do
		if MINION_ENEMY == GetTeam(minion) then
			if unit ~= minion and GetDistance(unit, minion) < 425 then
				return false
			end
		end
	end
    return true
end

local function ifInRangeAttack(unit)
	local AARange = GetRange(myHero)
	if GetDistance(unit,myHero) <= AARange then
		AttackUnit(unit)
	end
end

local function GotPassive()
	return GotBuff(myHero, "khazixpdamage") ~= 0 
end

local function IsStealth()
	return GotBuff(myHero, "khazixrstealth") ~= 0
end
	

-- local function CastChillingSmite(Enemy)
	-- IfTargetItemCastItem(1403, Enemy)
	-- IfTargetItemCastItem(3706, Enemy)
	-- IfTargetItemCastItem(3709, Enemy)
	-- IfTargetItemCastItem(3708, Enemy)
	-- IfTargetItemCastItem(3707, Enemy)
	-- IfTargetItemCastItem(3930, Enemy)
-- end


local function Thunderlord()
	if not GotBuff(myHero, "masterylordsdecreecooldown") ~= 0 and khazix.Misc.Thunder:Value() then
		return true
	else
		return false
	end
end

	

	
--Combo
local function Combo()
    if khazix.Combo.Combo:Value() then
		if khazix.Combo.items:Value() then
			CastStartItem()
		end
		local unit = GetCurrentTarget()
		if not IsStealth() and not IsImmune(unit, myHero) and IsTargetable(unit) then
			local WPred = GetPrediction(unit, W)
			if QReady() and ValidTarget(unit, QRange) and khazix.Combo.Q:Value() then
				CastQ(unit)
			end
			if GetDistance(unit, myHero) < 301 and (GotItemReady(3077) or GotItemReady(3074)) and khazix.Combo.items:Value() then
				CastOffensiveItems()
			end
			if WReady() and ValidTarget(unit, 1050) and WPred and WPred.hitChance >= 0.5 and not WPred:mCollision(1) and khazix.Combo.W:Value() then
				CastSkillShot(_W,WPred.castPos)
			end
			if EName == "KhazixE" and EReady() and ValidTarget(unit, 550) and GetDistance(unit, myHero) > AARange+50 and khazix.Combo.E:Value() then
				CastEPos(unit)
			elseif EReady() and ValidTarget(unit, 850) and GetDistance(unit, myHero) > AARange+60 and khazix.Combo.E:Value() then
				CastEPos(unit)
			elseif GetDistance(unit, myHero) > AARange+3 and khazix.Combo.move:Value() then
				MoveToXYZ(GetMousePos())
			elseif ValidTarget(unit, AARange) then
				AttackUnit(unit)
			end
		end		
	end
end



local function KS()
	for _,Enemy in pairs(GetEnemyHeroes()) do
		if not IsStealth() and not IsImmune(Enemy, myHero) and IsTargetable(Enemy) then
			local MyLVL = GetLevel(myHero)
			local EnemyDefStat = GetCurrentHP(Enemy)+GetDmgShield(Enemy)
			local QDmg = (45+25*Qlvl)+GetBonusDmg(myHero)*1.2
			local QDmgIso = (45+25*Qlvl)+(45+25*Qlvl)*0.3+GetBonusDmg(myHero)*1.56
			local EvolQDmgIso = QDmgIso + (10*MyLVL+GetBonusDmg(myHero)*1.04)
			local WDmg = (50+30*Wlvl)+GetBonusDmg(myHero)
			--local EDmg = (30+35*Elvl)+GetBonusDmg(myHero)*0.2
			local TiamatAndRHDmg = GetBonusDmg(myHero)*0.80         --3077  3074
			local AADmg = GetBonusDmg(myHero) + GetBaseDamage(myHero)
			local PassiveDamage = PD[MyLVL]+GetBonusAP(myHero)
			local ChillingSmiteDmg = 20 + (8*MyLVL)
			
			if QReady() and ValidTarget(Enemy, QRange) and khazix.Killsteal.Q:Value() and CalcDamage(myHero, Enemy, QDmg, 0) > (EnemyDefStat+GetHPRegen(Enemy)) then
				CastQ(Enemy)
			end
			
			if QName == "khazixqlong" then
				if QReady() and IsIsolated(Enemy) and ValidTarget(Enemy, QRange) and khazix.Killsteal.Q:Value() and CalcDamage(myHero, Enemy,EvolQDmgIso,0) > (EnemyDefStat+GetHPRegen(Enemy)) then
					CastQ(Enemy)
				
					ifInRangeAttack(Enemy)
				end
			elseif QReady() and IsIsolated(Enemy) and ValidTarget(Enemy, QRange) and khazix.Killsteal.Q:Value() and CalcDamage(myHero, Enemy, QDmgIso,0) > (EnemyDefStat+GetHPRegen(Enemy)) then
				CastQ(Enemy)
				ifInRangeAttack(Enemy)
			end
			-- if Smite ~= nil then
				-- if khazix.Killsteal.Smite:Value() and (GotItemReady(1403) or GotItemReady(3706) or GotItemReady(3709) or GotItemReady(3708) or GotItemReady(3707) or GotItemReady(3930)) and ChillingSmiteDmg > (EnemyDefStat+GetHPRegen(Enemy)) then
					-- CastChillingSmite(Enemy)
				-- end
			-- end
				
			if WReady() and ValidTarget(Enemy, WRange) and khazix.Killsteal.W:Value() and CalcDamage(myHero, Enemy, WDmg, 0) > (EnemyDefStat+GetHPRegen(Enemy)) then
				CastW(Enemy)
			end
			
			
			if CalcDamage(myHero, Enemy, TiamatAndRHDmg, 0) > (EnemyDefStat+GetHPRegen(Enemy)) and ValidTarget(Enemy, 400) and (GotItemReady(3077) or GotItemReady(3074)) then
				CastOffensiveItems()
			end
			
			if CalcDamage(myHero, Enemy, AADmg, 0) > (EnemyDefStat+GetHPRegen(Enemy)) then
				ifInRangeAttack(Enemy)
			end
			
			if GotPassive() and  CalcDamage(myHero, Enemy, AADmg, PassiveDamage) > (EnemyDefStat+GetHPRegen(Enemy))  then
				ifInRangeAttack(Enemy)
			end
		end
	end
end
	
	-- MY SENPAI KILL MODE
local function PredatorMode()
	if khazix.Kill.KillCombo:Value() then
		for _,Enemy in pairs(GetEnemyHeroes()) do
			
			--more vars :DDD
			local MyLVL = GetLevel(myHero)
			local EnemyDefStat = GetCurrentHP(Enemy)+GetDmgShield(Enemy)+GetHPRegen(Enemy)
			local QDmg = (45+25*Qlvl)+GetBonusDmg(myHero)*1.2
			local QDmgIso = (45+25*Qlvl)+(45+25*Qlvl)*0.3+GetBonusDmg(myHero)*1.56
			local EvolQDmgIso = QDmgIso + (10*MyLVL+GetBonusDmg(myHero)*1.04)
			local WDmg = (50+30*Wlvl)+GetBonusDmg(myHero)
			--local EDmg = (30+35*Elvl)+GetBonusDmg(myHero)*0.2
			local TiamatAndRHDmg = GetBonusDmg(myHero)*0.80         --3077  3074
			local AADmg = GetBonusDmg(myHero) + GetBaseDamage(myHero)
			local PassiveDamage = PD[MyLVL]+GetBonusAP(myHero)
			local ChillingSmiteDmg = 20 + (8*MyLVL)
			local EvolQisoTiamW = EvolQDmgIso+AADmg+TiamatAndRHDmg+WDmg
			local EvolQisoW = EvolQDmgIso+AADmg+WDmg
			local EvolQisoTiam = EvolQDmgIso+AADmg+TiamatAndRHDmg
			local EvolQiso = EvolQDmgIso+AADmg
			local QisoTiamW = QDmgIso+AADmg+TiamatAndRHDmg+WDmg
			local QisoW = QDmgIso+AADmg+WDmg
			local QisoTiam = QDmgIso+AADmg+TiamatAndRHDmg
			local Qiso = QDmgIso+AADmg
			local QTiamW = QDmg+AADmg+WDmg+TiamatAndRHDmg
			local QW = QDmg+AADmg+WDmg
			local QTiam = QDmg+AADmg+TiamatAndRHDmg
			local Q = QDmg+AADmg
			local Tiam = AADmg+TiamatAndRHDmg			
			local ThunderlordDmg = 10 * MyLVL + 0.3*GetBonusDmg(myHero) + 0.1*GetBonusAP(myHero)
			local PThunder = ThunderlordDmg + PassiveDamage
			
			if not IsStealth() and not IsImmune(Enemy, myHero) and IsTargetable(Enemy) then
				
				
				if WReady() and ValidTarget(Enemy, WRange) then
					if CalcDamage(myHero, Enemy, WDmg, 0) > (EnemyDefStat) then
						CastW(Enemy)
					end
				end
					
				if ValidTarget(Enemy, 880) then
					if (GotItemReady(3077) or GotItemReady(3074)) then
						if CalcDamage(myHero, Enemy, Tiam, 0) > EnemyDefStat then
							if ValidTarget(Enemy, AARange) then
								CastOffensiveItems()
								ifInRangeAttack()
							elseif Ename == "KhazixE" then
								if ValidTarget(Enemy, 580) and EReady() then
									CastEPos(Enemy)
									ifInRangeAttack()
									CastOffensiveItems()
								end
							elseif EReady() then
								CastEPos(Enemy)
								CastOffensiveItems()
								ifInRangeAttack()
							end
						end
					elseif (GotItemReady(3077) or GotItemReady(3074)) and GotPassive() then
						if CalcDamage(myHero, Enemy, Tiam, PassiveDamage) > EnemyDefStat then
							if ValidTarget(Enemy, AARange) then
								CastOffensiveItems()
								ifInRangeAttack()
							elseif Ename == "KhazixE" then
								if ValidTarget(Enemy, 580) and EReady() then
									CastEPos(Enemy)
									CastOffensiveItems()
									ifInRangeAttack()
								end
							elseif EReady() then
								CastEPos(Enemy)
								CastOffensiveItems()
								ifInRangeAttack()
							end
						end
					end	
					if Thunderlord() then
						if QReady() then 
							if IsIsolated(Enemy) then
								if QName == "khazixqlong" then
									if GotPassive() then
										if WReady() then
											if (GotItemReady(3077) or GotItemReady(3074)) then
												if CalcDamage(myHero, Enemy, EvolQisoTiamW, PThunder) > EnemyDefStat then
													if ValidTarget(Enemy, QRange) then
														CastOffensiveItems()
														CastQ(Enemy)
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													elseif Ename == "KhazixE" then
														if ValidTarget(Enemy, 580) and EReady() then
															CastEPos(Enemy)
															CastOffensiveItems()
															CastQ(Enemy)
															ifInRangeAttack(Enemy)
															CastW(Enemy)
														end
													elseif EReady() then
														CastEPos(Enemy)
														CastOffensiveItems()
														CastQ(Enemy)
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													end
												end
											elseif CalcDamage(myHero, Enemy, EvolQisoW, PThunder) > EnemyDefStat then
												if ValidTarget(Enemy, QRange) then
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												elseif Ename == "KhazixE" then
													if ValidTarget(Enemy, 580) and EReady() then
														CastEPos(Enemy)
														CastQ(Enemy)
														CastOffensiveItems()
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													end
												elseif EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											end	
										elseif (GotItemReady(3077) or GotItemReady(3074)) then
											if CalcDamage(myHero, Enemy, EvolQisoTiam, PThunder) > EnemyDefStat then
												if ValidTarget(Enemy, QRange) then
													CastOffensiveItems()
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												elseif Ename == "KhazixE" then
													if ValidTarget(Enemy, 580) and EReady() then
														CastEPos(Enemy)
														CastQ(Enemy)
														CastOffensiveItems()
														ifInRangeAttack(Enemy)
													end
												elseif EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												end
											end
										elseif CalcDamage(myHero, Enemy, EvolQiso, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										end
									elseif WReady() then
										if (GotItemReady(3077) or GotItemReady(3074)) then
											if CalcDamage(myHero, Enemy, EvolQisoTiamW, 0) > EnemyDefStat then
												if ValidTarget(Enemy, QRange) then
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												elseif Ename == "KhazixE" then
													if ValidTarget(Enemy, 580) and EReady() then
														CastEPos(Enemy)
														CastQ(Enemy)
														CastOffensiveItems()
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													end
												elseif EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											end	
										elseif CalcDamage(myHero, Enemy, EvolQisoW, 0) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end
									elseif (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, EvolQisoTiam, 0) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, EvolQiso, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end	
								elseif GotPassive() then
									if WReady() then
										if (GotItemReady(3077) or GotItemReady(3074)) then
											if CalcDamage(myHero, Enemy, QisoTiamW, PThunder) > EnemyDefStat then
												if ValidTarget(Enemy, QRange) then
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												elseif Ename == "KhazixE" then
													if ValidTarget(Enemy, 580) and EReady() then
														CastEPos(Enemy)
														CastQ(Enemy)
														CastOffensiveItems()
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													end
												elseif EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											end	
										elseif CalcDamage(myHero, Enemy, QisoW, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, QisoTiam, PThunder) > EnemyDefStat then 
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, Qiso, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end	
								elseif WReady() then
									if (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, QisoTiamW, 0) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, QisoW, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end	
								elseif (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, QisoTiam, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end	
								elseif CalcDamage(myHero, Enemy, Qiso, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end	
								end
							elseif GotPassive() then
								if WReady() then
									if (GotItemReady(3077) or GotItemReady(3074)) then	
										if CalcDamage(myHero, Enemy, QTiamW, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, QW, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end	
								elseif (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, QTiam, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end		
								elseif CalcDamage(myHero, Enemy, Q, PThunder) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end
							elseif WReady() then
								if (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, QTiamW, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end
								elseif CalcDamage(myHero, Enemy, QW, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									end
								end	
							elseif (GotItemReady(3077) or GotItemReady(3074)) then
								if CalcDamage(myHero, Enemy, QTiam, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end	
							elseif CalcDamage(myHero, Enemy, Q, 0) > EnemyDefStat then
								if ValidTarget(Enemy, QRange) then
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								elseif Ename == "KhazixE" then
									if ValidTarget(Enemy, 580) and EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								elseif EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								end	
							end	
						end
					elseif QReady() then 
						if IsIsolated(Enemy) then
							if QName == "khazixqlong" then
								if GotPassive() then
									if WReady() then
										if (GotItemReady(3077) or GotItemReady(3074)) then
											if CalcDamage(myHero, Enemy, EvolQisoTiamW, PThunder) > EnemyDefStat then
												if ValidTarget(Enemy, QRange) then
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												elseif Ename == "KhazixE" then
													if ValidTarget(Enemy, 580) and EReady() then
														CastEPos(Enemy)
														CastQ(Enemy)
														CastOffensiveItems()
														ifInRangeAttack(Enemy)
														CastW(Enemy)
													end
												elseif EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											end
										elseif CalcDamage(myHero, Enemy, EvolQisoW, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, EvolQisoTiam, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										end
									elseif CalcDamage(myHero, Enemy, EvolQiso, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end
								elseif WReady() then
									if (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, EvolQisoTiamW, 0) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, EvolQisoW, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end
								elseif (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, EvolQisoTiam, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end	
								elseif CalcDamage(myHero, Enemy, EvolQiso, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end	
							elseif GotPassive() then
								if WReady() then
									if (GotItemReady(3077) or GotItemReady(3074)) then
										if CalcDamage(myHero, Enemy, QisoTiamW, PThunder) > EnemyDefStat then
											if ValidTarget(Enemy, QRange) then
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											elseif Ename == "KhazixE" then
												if ValidTarget(Enemy, 580) and EReady() then
													CastEPos(Enemy)
													CastQ(Enemy)
													CastOffensiveItems()
													ifInRangeAttack(Enemy)
													CastW(Enemy)
												end
											elseif EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										end	
									elseif CalcDamage(myHero, Enemy, QisoW, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end	
								elseif (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, QisoTiam, PThunder) > EnemyDefStat then 
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									end	
								elseif CalcDamage(myHero, Enemy, Qiso, PThunder) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end	
							elseif WReady() then
								if (GotItemReady(3077) or GotItemReady(3074)) then
									if CalcDamage(myHero, Enemy, QisoTiamW, 0) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end	
								elseif CalcDamage(myHero, Enemy, QisoW, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									end
								end	
							elseif (GotItemReady(3077) or GotItemReady(3074)) then
								if CalcDamage(myHero, Enemy, QisoTiam, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end	
							elseif CalcDamage(myHero, Enemy, Qiso, 0) > EnemyDefStat then
								if ValidTarget(Enemy, QRange) then
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								elseif Ename == "KhazixE" then
									if ValidTarget(Enemy, 580) and EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								elseif EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								end	
							end
						elseif GotPassive() then
							if WReady() then
								if (GotItemReady(3077) or GotItemReady(3074)) then	
									if CalcDamage(myHero, Enemy, QTiamW, PThunder) > EnemyDefStat then
										if ValidTarget(Enemy, QRange) then
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										elseif Ename == "KhazixE" then
											if ValidTarget(Enemy, 580) and EReady() then
												CastEPos(Enemy)
												CastQ(Enemy)
												CastOffensiveItems()
												ifInRangeAttack(Enemy)
												CastW(Enemy)
											end
										elseif EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									end	
								elseif CalcDamage(myHero, Enemy, QW, PThunder) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									end
								end	
							elseif (GotItemReady(3077) or GotItemReady(3074)) then
								if CalcDamage(myHero, Enemy, QTiam, PThunder) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								end		
							elseif CalcDamage(myHero, Enemy, Q, PThunder) > EnemyDefStat then
								if ValidTarget(Enemy, QRange) then
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								elseif Ename == "KhazixE" then
									if ValidTarget(Enemy, 580) and EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								elseif EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								end
							end
						elseif WReady() then
							if (GotItemReady(3077) or GotItemReady(3074)) then
								if CalcDamage(myHero, Enemy, QTiamW, 0) > EnemyDefStat then
									if ValidTarget(Enemy, QRange) then
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									elseif Ename == "KhazixE" then
										if ValidTarget(Enemy, 580) and EReady() then
											CastEPos(Enemy)
											CastQ(Enemy)
											CastOffensiveItems()
											ifInRangeAttack(Enemy)
											CastW(Enemy)
										end
									elseif EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									end
								end
							elseif CalcDamage(myHero, Enemy, QW, 0) > EnemyDefStat then
								if ValidTarget(Enemy, QRange) then
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
									CastW(Enemy)
								elseif Ename == "KhazixE" then
									if ValidTarget(Enemy, 580) and EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
										CastW(Enemy)
									end
								elseif EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
									CastW(Enemy)
								end
							end	
						elseif (GotItemReady(3077) or GotItemReady(3074)) then
							if CalcDamage(myHero, Enemy, QTiam, 0) > EnemyDefStat then
								if ValidTarget(Enemy, QRange) then
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								elseif Ename == "KhazixE" then
									if ValidTarget(Enemy, 580) and EReady() then
										CastEPos(Enemy)
										CastQ(Enemy)
										CastOffensiveItems()
										ifInRangeAttack(Enemy)
									end
								elseif EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								end
							end	
						elseif CalcDamage(myHero, Enemy, Q, 0) > EnemyDefStat then
							if ValidTarget(Enemy, QRange) then
								CastQ(Enemy)
								CastOffensiveItems()
								ifInRangeAttack(Enemy)
							elseif Ename == "KhazixE" then
								if ValidTarget(Enemy, 580) and EReady() then
									CastEPos(Enemy)
									CastQ(Enemy)
									CastOffensiveItems()
									ifInRangeAttack(Enemy)
								end
							elseif EReady() then
								CastEPos(Enemy)
								CastQ(Enemy)
								CastOffensiveItems()
								ifInRangeAttack(Enemy)
							end	
						end	
					end				
				end
			end		
		end
	end
end	


local function autoQSS()
	for a=1, 39 do
		local checkCC = GotBuff(myHero, CCbuffnames[a])
		if checkCC ~= 0 and khazix.Misc.AutoQSS:Value() then
			DelayAction(
				function()
					CastAntiCCItems()
				end, 200) --- little humanizer
		end
	end
end


-- local function AutoIgn()
    -- for _,Enemy in pairs(GetEnemyHeroes()) do
        -- if Ignite and khazix.Misc.AutoIgnite:Value() then
			-- local EnemyDefStat = GetCurrentHP(Enemy)+GetDmgShield(Enemy)
            -- if IsReady(Ignite) and 20*GetLevel(myHero)+50 > EnemyDefStat+(GetHPRegen(Enemy)*3) and ValidTarget(Enemy, 600) then
              -- CastTargetSpell(Enemy, Ignite)
          -- end
        -- end 
    -- end
-- end						


	
OnTick(function(myHero)
    if not IsDead(myHero) then
		AARange = GetRange(myHero)
		QRange = GetCastRange(myHero, _Q)
		WRange = GetCastRange(myHero, _W)
		Qlvl = GetCastLevel(myHero, _Q)
		Wlvl = GetCastLevel(myHero, _W)
		Elvl = GetCastLevel(myHero, _E)
		--local Rlvl = GetCastRange(myHero, _R)
		QName = GetCastName(myHero, _Q)
		EName = GetCastName(myHero, _E)
		--local unit = GetCurrentTarget()
		KS()
		Combo()	
		--AutoIgn()
		PredatorMode()
		autoQSS()
    end
end)

PrintChat("[InnateSeries] Kha'zix - Loaded, have fun")

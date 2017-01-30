--         _____   ______  _   _   _____            _____          --
--        |  __ \ |  ____|| \ | | / ____|    /\    |  __ \         --
--        | |__) || |__   |  \| || |  __    /  \   | |__) |        --
--        |  _  / |  __|  | . ` || | |_ |  / /\ \  |  _  /         --
--        | | \ \ | |____ | |\  || |__| | / ____ \ | | \ \         --
--        |_|  \_\|______||_| \_| \_____|/_/    \_\|_|  \_\        --                                                
--   _   _          ___     _    _        _        _ _             --
--  | |_| |_  ___  | _ \_ _(_)__| |___ __| |_ __ _| | |_____ _ _   --
--  |  _| ' \/ -_) |  _/ '_| / _` / -_|_-<  _/ _` | | / / -_) '_|  --
--   \__|_||_\___| |_| |_| |_\__,_\___/__/\__\__,_|_|_\_\___|_|    --
--                           ___                        __         --
--                          /\_ \                      /\ \        --
--        __   __  __    ___\//\ \    __  __     __    \_\ \       --
--      /'__`\/\ \/\ \  / __`\\ \ \  /\ \/\ \  /'__`\  /'_` \      --
--     /\  __/\ \ \_/ |/\ \L\ \\_\ \_\ \ \_/ |/\  __/ /\ \L\ \     --
--     \ \____\\ \___/ \ \____//\____\\ \___/ \ \____\\ \___,_\    --
--      \/____/ \/__/   \/___/ \/____/ \/__/   \/____/ \/__,_ /    --


require("Inspired")
require("DamageLib")

class "Rengar"
function Rengar:__init()
  Rengo = MenuConfig("Rengar - The Pridestalker", "Rengar")
  Rengo:Menu("Combo", "Combo")
  Rengo.Combo:DropDown("combo_mode", "One Shot Mode", 1, {"Q-E-W", "E-Q-W"})
  Rengo.Combo:KeyBinding("combo_mode_change", "Change One Shot Mode", string.byte("T"), true, function(oneshotmode_change)
	local priority = Rengo.Combo.combo_mode:Value()
	Rengo.Combo.combo_mode:Value(priority+1)
	if Rengo.Combo.combo_mode:Value() == 3 then Rengo.Combo.combo_mode:Value(1) end
	if Rengo.Combo.combo_mode:Value() == 1 then
		PrintChat("<font color='#f3f3f3'>One Shot Mode changed to </font><font color='#af0000'>[Q-E-W]</font>")
	elseif Rengo.Combo.combo_mode:Value() == 2 then
		PrintChat("<font color='#f3f3f3'>One Shot Mode changed to </font><font color='#af0000'>[E-Q-W]</font>")
	end
end)
  Rengo.Combo:DropDown("empowered_prioritize", "Empowered Prioritize:", 1, {"Q", "E", "W"})
  Rengo.Combo:KeyBinding("empowered_prioritize_key", "Toggle Empowered Priority", string.byte("G"), true, function(priority_change)
	local priority = Rengo.Combo.empowered_prioritize:Value()
	Rengo.Combo.empowered_prioritize:Value(priority+1)
	if Rengo.Combo.empowered_prioritize:Value() == 4 then Rengo.Combo.empowered_prioritize:Value(1) end
	if Rengo.Combo.empowered_prioritize:Value() == 1 then
		PrintChat("<font color='#f3f3f3'>Empowered Priorty changed to </font><font color='#af0000'>[Q]</font>")
	elseif Rengo.Combo.empowered_prioritize:Value() == 2 then
		PrintChat("<font color='#f3f3f3'>Empowered Priorty changed to </font><font color='#af0000'>[E]</font>")
	elseif Rengo.Combo.empowered_prioritize:Value() == 3 then
		PrintChat("<font color='#f3f3f3'>Empowered Priorty changed to </font><font color='#af0000'>[W]</font>")
	end
end)
  Rengo.Combo:Boolean("one_shotable", "Draw One Shotable Text", true)
  Rengo.Combo:Info("empoweredW_info", "Use empowered W if")
  Rengo.Combo:Slider("empoweredW", "%HP <", 20, 0, 90, 1)

  Rengo:Menu("Harass", "Harass")
  Rengo.Harass:Boolean("Q", "Use Q", true)
  Rengo.Harass:Boolean("W", "Use W", true)
  Rengo.Harass:Boolean("E", "Use E", true)

  Rengo:Menu("Misc", "Misc")
  if Ignite ~= nil then Rengo.Misc:Boolean("Autoignite", "Auto Ignite", true) end
  Rengo.Misc:Boolean("Autolvl", "Auto level", true)
  Rengo.Misc:DropDown("Autolvltable", "Priority", 1, {"Q-E-W", "Q-W-E"})

  Rengo:Menu("Drawings", "Drawings")
  Rengo.Drawings:Boolean("W", "Draw W Range", true)
  Rengo.Drawings:Boolean("E", "Draw E Range", true)
  Rengo.Drawings:ColorPick("color", "Color Picker", {255,255,255,0})
  
  
  	OnTick(function(myHero) self:OnTick(myHero) end)
	OnDraw(function(myHero) self:Drawings(myHero) end)
end
  

function Rengar:OnTick(myHero)
		if IOW:Mode() == "Combo" then
			self:Combo()
		end
		if IOW:Mode() == "Harass" then
			self:Harass()
		end
  
	    self:Checks()
	    self:Autolevel()
	    self:Autoignite()
end


function Rengar:Checks()
		target = GetCurrentTarget()
		unit = GetCurrentTarget()

		lastlevel = GetLevel(myHero)-1
		Ferocity = GetCurrentMana(myHero)
		AttackRange = GetRange(myHero)
		MousePos = GetMousePos()
		Hydra = GetItemSlot(myHero, 3074)
		Tiamat = GetItemSlot(myHero, 3077)
		YG = GetItemSlot(myHero, 3142)

		EPred = GetPredictionForPlayer(myHeroPos(), unit, GetMoveSpeed(unit), 1500, 250, GetCastRange(myHero,_E), 80, true, true)
end

--[[ Q cast
function Rengar:CastQ(unit, delay, validrange)
	if ValidTarget(unit, validrange) then
	    if CanUseSpell(myHero, _Q) == READY then
	      CastSpell(_Q)
	      DelayAction(function() AttackUnit(unit) end, delay*0.001)
	  end
	end
end ]]--

function Rengar:AutoQ()
	local AArange = GetRange(myHero)
	if Rengo.Combo.combo_mode:Value() == 2 then
		self:CastE(target, 1, 1000)
		if ValidTarget(target, AArange+50) then
		    if CanUseSpell(myHero, _Q) == READY then
		      DelayAction(function() CastSpell(_Q) end, 40*0.001)
		      DelayAction(function() AttackUnit(target) end, 10*0.001)
		  end
		end
	elseif Rengo.Combo.combo_mode:Value() == 1 then
		if ValidTarget(target, AArange+50) then
		    if CanUseSpell(myHero, _Q) == READY then
		      CastSpell(_Q)
		      DelayAction(function() AttackUnit(target) end, 10*0.001)
		    end
		end
	end
end

-- E cast
function Rengar:CastE(unit, delay, validrange)
  if ValidTarget(unit, validrange) then
    if CanUseSpell(myHero, _E) == READY then
    	DelayAction(function() CastSkillShot(_E, EPred.PredPos.x, EPred.PredPos.y, EPred.PredPos.z) end, delay*0.001)
    end
  end
end

-- W cast
function Rengar:CastW(unit, delay, validrange)
  if ValidTarget(unit, validrange) then
    if CanUseSpell(myHero, _W) == READY then
     DelayAction(function() CastSpell(_W) end, delay*0.001)
    end
	end
end

-- Tiamat and Hydra Cast
function Rengar:CastTH(unit, delay, validrange)
if ValidTarget(unit, validrange) then
	  if CanUseSpell(myHero, Hydra) == READY and Hydra ~= 0 then
	    DelayAction(function() CastSpell(Hydra) end, delay*0.001)
	  elseif CanUseSpell(myHero, Tiamat) == READY and Tiamat ~= 0 then
	    DelayAction(function() CastSpell(Tiamat) end, delay*0.001)
	  end
	end
end

function Rengar:Combo()
	local Rpressed = 0

	if CanUseSpell(myHero, _R) == READYNONCAST and GotBuff(myHero,"RengarR") then
		Rpressed = 1
		if CanUseSpell(myHero, YG) == READY and YG ~= 0 then DelayAction(function() CastSpell(YG) end, 10*0.001) end
		if ValidTarget(target, AttackRange) then
	  		if Rengo.Combo.combo_mode:Value() == 1 then
		    	self:AutoQ()
		        self:CastE(target, 65, 1000)
		        self:CastTH(target, 5, 400)
		        self:CastW(target, 15, 500)
		        
							-- If target didn't die from One Shot Combo --
		        if not IsDead(target) then
		    	self:AutoQ()
		        self:CastE(target, 1, 1000)
		        self:CastTH(target, 1, 400)
		        self:CastW(target, 1, 500)
		        end

    		elseif Rengo.Combo.combo_mode:Value() == 2 then
		    	self:CastE(target, 1, 1000)
		    	self:CastW(target, 20, 500)
		    	
		        self:CastTH(target, 1, 400)
				-- If target didn't die from One Shot Combo --
		        if not IsDead(target) then
		    	
		        self:CastE(target, 1, 1000)
		        self:CastTH(target, 1, 400)
		        self:CastW(target, 1, 500)
	    		end
	    	end
        end
    else
    	Rpressed = 0
    end

    if Rpressed == 0 then
	  	if Ferocity == 5 and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 > Rengo.Combo.empoweredW:Value() then
			if Rengo.Combo.empowered_prioritize:Value() == 1 then
				if ValidTarget(target, AttackRange) then
					self:AutoQ()
				else
					self:CastE(target, 1, 1000)
				end
			elseif Rengo.Combo.empowered_prioritize:Value() == 2 then
				self:CastE(target, 1, 1000)
			elseif Rengo.Combo.empowered_prioritize:Value() == 3 then
	        	self:CastW(target, 1, 500)
	        end
	    elseif Ferocity == 5 and (GetCurrentHP(myHero)/GetMaxHP(myHero))*100 < Rengo.Combo.empoweredW:Value() then
	    	self:CastW(target, 1, 100000)
		end

		if Ferocity < 5 then
	    	self:AutoQ()
	        self:CastE(target, 10, 1000)
	        self:CastTH(target, 10, 400)
	        self:CastW(target, 10, 500)
		end
	end
end

function Rengar:Harass()
    if Rengo.Harass.E:Value() then
    	self:CastE(target, 10, 1000)
    end
	
    if Rengo.Harass.W:Value() then
    	self:CastW(target, 10, 500)
    end

    if Rengo.Harass.Q:Value() then
    	self:AutoQ()
	end
end

function Rengar:Drawings()
	self:DrawText_One_Shot()
	self:Ranges()
end

function Rengar:Is_OneShotable(enemy)
	local Ferocity = GetCurrentMana(myHero)
	local Qdmg = getdmg("Q", enemy, myHero, 1) 
	local EmpQdmg = getdmg("Q", enemy, myHero, 3)
	local Wdmg = getdmg("W", enemy, myHero, 1)
	local Edmg = getdmg("E", enemy, myHero, 1)
	local EmpEdmg = getdmg("Q", enemy, myHero, 3)
	local THdmg = CalcDamage(myHero, enemy, (GetBonusDmg(myHero) + GetBaseDamage(myHero)), 0)

	if Ferocity == 5 then
		if EmpQdmg + Wdmg + Edmg + THdmg + 250 > GetCurrentHP(enemy) then
			return "EmpQWE OneShot!"
		elseif EmpQdmg + Wdmg + Edmg + THdmg + Qdmg + 250 > GetCurrentHP(enemy) then
			return "EmpQWE+Q OneShot!"
		else
			return 'Not One Shotable'
		end
	elseif Ferocity < 5 then
		if Qdmg + Wdmg + Edmg + THdmg + 250 > GetCurrentHP(enemy) then
			return "QWE OneShot!"
		elseif Qdmg + Wdmg + Edmg + THdmg + Qdmg + 250 > GetCurrentHP(enemy) then
			return "QWE+Q OneShot!"
		elseif Qdmg + Wdmg + Edmg + THdmg + EmpQdmg + 250 > GetCurrentHP(enemy) then
			return "QWE+EmpQ OneShot!"
		else
			return 'Not One Shotable'
		end
	end
end

function Rengar:DrawText_One_Shot()
	if Rengo.Combo.one_shotable:Value() then
		for _, enemy in pairs(GetEnemyHeroes()) do
			if ValidTarget(enemy) then
			    local enemyPos = GetOrigin(enemy)
			    local drawpos = WorldToScreen(1,enemyPos.x, enemyPos.y, enemyPos.z)
			    local enemyText = self:Is_OneShotable(enemy)
			    DrawText(enemyText, 12, drawpos.x-60, drawpos.y, GoS.White)
			end
		end
	end
end

-- Deftsu <3
function Rengar:Autoignite()
    for i,enemy in pairs(GetEnemyHeroes()) do
    	
		if Ignite and Rengo.Misc.Autoignite:Value() then
	          if IsReady(Ignite) and 20*GetLevel(myHero)+50 > GetHP(enemy)+GetHPRegen(enemy)*2.5 and ValidTarget(enemy, 600) then
	          CastTargetSpell(enemy, Ignite)
	          end
	    end
	end
end

-- Deftsu <3
function Rengar:Ranges()
	local col = Rengo.Drawings.color:Value()
	local pos = GetOrigin(myHero)
	if Rengo.Drawings.W:Value() then DrawCircle(pos,500,1,0,col) end
	if Rengo.Drawings.E:Value() then DrawCircle(pos,1000,1,0,col) end
end

-- Deftsu <3
function Rengar:Autolevel()
	if Rengo.Misc.Autolvl:Value() then  
	  if GetLevel(myHero) > lastlevel then
	    if Rengo.Misc.Autolvltable:Value() == 1 then leveltable = {_Q, _W, _E, _Q, _Q, _R, _Q, _E, _Q, _E, _R, _E, _E, _W, _W, _R, _W, _W}
	    elseif Rengo.Misc.Autolvltable:Value() == 2 then leveltable = {_Q, _W, _E, _Q, _Q, _R, _Q, _W, _Q, _W, _R, _W, _W, _E, _E, _R, _E, _E}
	    end
	    DelayAction(function() LevelSpell(leveltable[GetLevel(myHero)]) end, math.random(1000,3000)*0.001)
	    lastlevel = GetLevel(myHero)
	  end
	end
end

if _G[GetObjectName(myHero)] then
_G[GetObjectName(myHero)]()
end

PrintChat("<font color='#af0000'>Rengar - The Pridestalker</font> | <font color='#00d12d'>Loaded!</font>")

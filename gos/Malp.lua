function _Malphite:OnTick()
	self:Combo()
	self:FlashCombo()
	self:Harass()
	self:LaneClear()
	self:TowerCC()
end

function _Malphite:Menu()
	menu = scriptConfig("Support Heroes", "SupportHeroesMenuMalph")

	_Activator:Menu()

	menu:addSubMenu("[" .. myHero.charName .. "] - Auto-CC Under Tower", "snare")
		menu.snare:addParam("info", "           -- Auto-CC Enemies --", SCRIPT_PARAM_INFO, "")
		if enemyCount > 0 then
			for i = 1, enemyCount do
			local unit = enemyHeroes[i]
				menu.snare:addParam("" .. unit.charName, "" .. unit.charName, SCRIPT_PARAM_ONOFF, true)
			end
		end
		menu.snare:addParam("settings", "                    -- Settings --", SCRIPT_PARAM_INFO, "")
		menu.snare:addParam("qsnare", "Use Q", SCRIPT_PARAM_ONOFF, true)

	menu:addSubMenu("[" .. myHero.charName .. "] - Auto-Interrupt", "interrupt")
        menu.interrupt:addParam("spells", "           -- Auto Interrupt Spells --", SCRIPT_PARAM_INFO, "")
        if enemyCount > 0 then
        	for i = 1, enemyCount do
            	local unit = enemyHeroes[i]
                if Interrupt[unit.charName] ~= nil then
                    menu.interrupt:addParam("" .. unit.charName, "" .. unit.charName, SCRIPT_PARAM_INFO, "")
                    menu.interrupt:addParam("spell".. Interrupt[unit.charName].stop.spellName,"".. Interrupt[unit.charName].stop.name, SCRIPT_PARAM_ONOFF, true)
                    menu.interrupt:addParam("empty", "", SCRIPT_PARAM_INFO,"")
                end
            end
        end
		menu.interrupt:addParam("settings", "                -- Settings --", SCRIPT_PARAM_INFO, "")
		menu.interrupt:addParam("rinterrupt", "Use R", SCRIPT_PARAM_ONOFF, true)

	menu:addSubMenu("[" .. myHero.charName .. "] - Draw Settings", "draw")
		menu.draw:addParam("spelldraws", "                -- Spell Draws --", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawq", "Draw Q", SCRIPT_PARAM_ONOFF, true)
		menu.draw:addParam("colorq", "Color Q", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("draww", "Draw W", SCRIPT_PARAM_ONOFF, true)
		menu.draw:addParam("colorw", "Color W", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawe", "Draw E", SCRIPT_PARAM_ONOFF, true)
		menu.draw:addParam("colore", "Color E", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawr", "Draw R", SCRIPT_PARAM_ONOFF, true)
		menu.draw:addParam("colorr", "Color R", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("miscellaneousdraws", "                -- Flash Draws --", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawrflash", "Draw Flash - R", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorrflash", "Color Flash - R", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawitem", "                -- Item Draws --", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawfotm", "Draw Face of the Mountain", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorfotm", "Color Face of the Mountain", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawlois", "Draw Locket of the Iron Solari", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorlois", "Color Locket of the Iron Solari", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawmikaels", "Draw Mikaels Crucible", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorqmikaels", "Color Mikaels Crucible", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawsumm", "                -- Summoner Draws --", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawexhaust", "Draw Exhaust", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorexhaust", "Color Exhaust", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawheal", "Draw Heal", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorheal", "Color Heal", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("drawignite", "Draw Ignite", SCRIPT_PARAM_ONOFF, false)
		menu.draw:addParam("colorignite", "Color Ignite", SCRIPT_PARAM_COLOR, { 255, 0x66, 0x33, 0x00 })
		menu.draw:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("miscellaneousdraws", "            -- Miscellaneous Draws --", SCRIPT_PARAM_INFO, "")
		menu.draw:addParam("drawtarget", "Draw Target", SCRIPT_PARAM_ONOFF, true)
		menu.draw:addParam("drawpermashow", "Draw Permashow (Reload)", SCRIPT_PARAM_ONOFF, true)

	menu:addSubMenu("[" .. myHero.charName .. "] - Farm Settings", "farm")
		menu.farm:addParam("laneclear", "                    -- Lane Clear --", SCRIPT_PARAM_INFO, "")
		menu.farm:addParam("elaneclear", "Use E", SCRIPT_PARAM_ONOFF, true)
		menu.farm:addParam("eclearmana", "Minimum Mana", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)

	menu:addSubMenu("[" .. myHero.charName .. "] - Flash Settings", "flash")
		menu.flash:addParam("rflash", "Use Flash - R", SCRIPT_PARAM_ONOFF, true)

	menu:addSubMenu("[" .. myHero.charName .. "] - Humanizer", "humanizer")
		menu.humanizer:addParam("interruptDelay", "Auto-Interrupt Delay (ms)", SCRIPT_PARAM_SLICE, 200, 0, 500, 0)
		menu.humanizer:addParam("snareDelay", "Auto-CC Delay (ms)", SCRIPT_PARAM_SLICE, 0, 0, 500, 0)
		menu.humanizer:addParam("shieldDelay", "Auto Shield Delay (ms)", SCRIPT_PARAM_SLICE, 50, 0, 500, 0)

	menu:addSubMenu("[" .. myHero.charName .. "] - Key Settings", "key")
		menu.key:addParam("combatkeys", "               -- Combat Keys --", SCRIPT_PARAM_INFO, "")
		menu.key:addParam("comboKey", "Combo Key", SCRIPT_PARAM_ONKEYDOWN, false, 32)
		menu.key:addParam("harassKey", "Harass Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
		menu.key:addParam("harassToggle", "Harass Toggle", SCRIPT_PARAM_ONKEYTOGGLE, false, string.byte("T"))
		menu.key:addParam("clearKey", "Lane Clear Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
		menu.key:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.key:addParam("miscellaneouskeys", "           -- Miscellaneous Keys --", SCRIPT_PARAM_INFO, "")
		menu.key:addParam("flashKey", "Flash Key", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("H"))
        menu.key:addParam("castWard", "Ward Casting", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("O"))

	menu:addSubMenu("[" .. myHero.charName .. "] - Spell Settings", "spell")
		menu.spell:addSubMenu("[" .. myHero.charName .. "] - Q", "q")
		menu.spell.q:addParam("qcombo", "Combo", SCRIPT_PARAM_ONOFF, true)
		menu.spell.q:addParam("qcombomana", "[Combo] Mana > X%", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		menu.spell.q:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.spell.q:addParam("qharass", "Harass", SCRIPT_PARAM_ONOFF, true)
		menu.spell.q:addParam("qharassmana", "[Harass] Mana > X%", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
		menu.spell:addSubMenu("[" .. myHero.charName .. "] - W", "w")
		menu.spell.w:addParam("wuse", "Use W On AA's", SCRIPT_PARAM_ONOFF, true)
		menu.spell.w:addParam("wmana", "Mana > X%", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
		menu.spell:addSubMenu("[" .. myHero.charName .. "] - E", "e")
		menu.spell.e:addParam("ecombo", "Combo", SCRIPT_PARAM_ONOFF, true)
		menu.spell.e:addParam("ecombomana", "[Combo] Mana > X%", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		menu.spell.e:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.spell.e:addParam("eharass", "Harass", SCRIPT_PARAM_ONOFF, true)
		menu.spell.e:addParam("eharassmana", "[Harass] Mana > X%", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
		menu.spell:addSubMenu("[" .. myHero.charName .. "] - R", "r")
		menu.spell.r:addParam("rcombo", "Combo", SCRIPT_PARAM_ONOFF, true)
		menu.spell.r:addParam("rcombomana", "[Combo] Mana > X%", SCRIPT_PARAM_SLICE, 0, 0, 100, 0)
		menu.spell.r:addParam("rmpty", "", SCRIPT_PARAM_INFO, "")
		menu.spell.r:addParam("rharass", "Harass", SCRIPT_PARAM_ONOFF, true)
		menu.spell.r:addParam("rharassmana", "[Harass] Mana > X%", SCRIPT_PARAM_SLICE, 25, 0, 100, 0)
		menu.spell.r:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.spell.r:addParam("mindistance", "Min Enemy Distance", SCRIPT_PARAM_SLICE, 500, 0, 1000, 0)
		menu.spell.r:addParam("amountenemies", "Only Ult If X Enemies", SCRIPT_PARAM_SLICE, 2, 0, 5, 0)

   menu:addSubMenu("[" .. myHero.charName .. "] - Target Selector", "target")
		menu.target:addParam("targetinfo", "Default Target Select Is LeastCast", SCRIPT_PARAM_INFO, "")
		menu.target:addParam("empty", "", SCRIPT_PARAM_INFO, "")
		menu.target:addParam("focus", "Focus Selected Target", SCRIPT_PARAM_ONOFF, true)
		menu.target:addParam("sac", "Use SAC:R Target Instead", SCRIPT_PARAM_ONOFF, false)

   menu:addSubMenu("Orbwalk Settings", "orb")

   UPL:AddToMenu(menu)

   menu:addParam("empty", "", SCRIPT_PARAM_INFO, "")
   menu:addParam("infobox", "            Support Heroes: " .. myHero.charName .. "           ", SCRIPT_PARAM_INFO, "")
   menu:addParam("infobox2", "                      Version:  " .. scriptVersion .. "         ", SCRIPT_PARAM_INFO, "")

   if menu.draw.drawpermashow then
	 menu:permaShow("infobox")
	 menu.key:permaShow("comboKey")
	 menu.key:permaShow("harassKey")
	 menu.key:permaShow("harassToggle")
	 menu.key:permaShow("clearKey")
   end
end

function _Malphite:Combo()
	if Target == nil then return end
	if menu.key.comboKey then
		if IsReady(_Q) and menu.spell.q.qcombo and (100 * myHero.mana / myHero.maxMana)>= menu.spell.q.qcombomana and (GetDistance(Target) < self.SpellQ.range) then
			if ValidTarget(Target) then
				CastSpell(_Q, Target)
			end
		end
		if IsReady(_E) and menu.spell.e.ecombo and (100 * myHero.mana / myHero.maxMana)>= menu.spell.e.ecombomana and (GetDistance(Target) < self.SpellE.range) then
			if ValidTarget(Target) then
				CastSpell(_E)
			end
		end
		if enemyCount > 0 then
			for i = 1, enemyCount do
			local unit = enemyHeroes[i]
				if IsReady(_R) and menu.spell.r.rcombo and (100 * myHero.mana / myHero.maxMana)>= menu.spell.r.rcombomana and (GetDistance(Target) < 1000) then
					if ValidTarget(Target) then
						local CastPosition, HitChance = UPL:Predict(_R, myHero, unit)
						if HitChance > 0 then
							local AOECastPosition, MainTargetHitChance, nTargets = VPred:GetCircularAOECastPosition(unit, 0.25, 300, 1000, 1500, myHero)
							if nTargets >= menu.spell.r.amountenemies and GetDistance(unit) >= menu.spell.r.mindistance then
							CastSpell(_R, CastPosition.x, CastPosition.z)
							end
						end
					end
				end
			end
		end
	end
end

function _Malphite:FlashCombo()
	if Target == nil then return end
	if IsReady(sflash) and IsReady(_R) and GetDistance(Target) <= 425 + self.SpellR.range then
		if GetDistance(Target) < 425 then
			flashPos = myHero + (GetDistance(Target) - 50) * (Vector(Target) - Vector(myHero)):normalized()
		else
			flashPos = myHero + 425 * (Vector(Target) - Vector(myHero)):normalized()
		end
		if menu.key.flashKey then
			local CastPosition, HitChance = UPL:Predict(_R, flashPos, Target)
			if HitChance >= 2 and type(CastPosition.x) == "number" and type(CastPosition.z) == "number" then
				flashPos = myHero + 425 * (Vector(CastPosition) - Vector(myHero)):normalized()
				CastSpell(sflash, flashPos.x, flashPos.z)
				_Tech:FlashComboPosition(_R, CastPosition.x, CastPosition.z)
			end
		end
	end
	if menu.key.flashKey and IsReady(sflash) and IsReady(_R) then
		myHero:MoveTo(mousePos.x, mousePos.z)
	end
end

function _Malphite:Harass()
	if Target == nil then return end
	if menu.key.harassKey or menu.key.harassToggle then
		if IsReady(_Q) and menu.spell.q.qharass and (100 * myHero.mana / myHero.maxMana)>= menu.spell.q.qharassmana and (GetDistance(Target) < self.SpellQ.range) then
			if ValidTarget(Target) then
				CastSpell(_Q, Target)
			end
		end
		if IsReady(_E) and menu.spell.e.eharass and (100 * myHero.mana / myHero.maxMana)>= menu.spell.e.eharassmana and (GetDistance(Target) < self.SpellE.range) then
			if ValidTarget(Target) then
				CastSpell(_E)
			end
		end
		if enemyCount > 0 then
			for i = 1, enemyCount do
			local unit = enemyHeroes[i]
				if IsReady(_R) and menu.spell.r.rharass and (100 * myHero.mana / myHero.maxMana)>= menu.spell.r.rharassmana and (GetDistance(Target) < 1000) then
					if ValidTarget(Target) then
						local CastPosition, HitChance = UPL:Predict(_R, myHero, unit)
						if HitChance > 0 then
							local AOECastPosition, MainTargetHitChance, nTargets = VPred:GetCircularAOECastPosition(unit, 0.25, 300, 1000, 1500, myHero)
							if nTargets >= menu.spell.r.amountenemies and GetDistance(unit) >= menu.spell.r.mindistance then
							CastSpell(_R, CastPosition.x, CastPosition.z)
							end
						end
					end
				end
			end
		end
	end
end

function _Malphite:LaneClear()
	for i, Minion in pairs(enemyMinions.objects) do
		if (Minion ~= nil) then
			if menu.key.clearKey then
				if IsReady(_E) and menu.farm.elaneclear and (100 * myHero.mana / myHero.maxMana)>= menu.farm.eclearmana then
					CastSpell(_E)
				end
			end
		end
	end
end

function _Malphite:OnDraw()
	if Target == nil then return end
	if menu.draw.drawtarget and ValidTarget(Target) and Target.type == myHero.type then
		_PentagonRot:DrawTriangle(Target, ARGB(255, 255, 0, 0), 2, 50, 5, 0, 0)
	end
	if menu.draw.drawrflash and menu.flash.rflash and IsReady(sflash) and IsReady(_R) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, (1000 + 425), ARGB(table.unpack(menu.draw.colorrflash)))
	end
	local slot = _Tech:CustomGetInventorySlotItem("HealthBomb", myHero)
	if menu.draw.drawfotm and slot ~= nil and IsReady(slot) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 750, ARGB(table.unpack(menu.draw.colorfotm)))
	end
	local slot = _Tech:CustomGetInventorySlotItem("IronStylus", myHero)
	if menu.draw.drawlois and slot ~= nil and IsReady(slot) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 750, ARGB(table.unpack(menu.draw.colorlois)))
	end
	local slot = _Tech:CustomGetInventorySlotItem("ItemMorellosBane", myHero)
	if menu.draw.drawmikaels and slot ~= nil and IsReady(slot) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 750, ARGB(table.unpack(menu.draw.colormikaels)))
	end
	if menu.draw.drawexhaust and sexhaust ~= nil and IsReady(sexhaust) then
	   _Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 650, ARGB(table.unpack(menu.draw.colorexhaust)))
	end
	if menu.draw.drawheal and sheal ~= nil and IsReady(sheal) then
	   _Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 850, ARGB(table.unpack(menu.draw.colorheal)))
	end
	if menu.draw.drawignite and signite ~= nil and IsReady(signite) then
	   _Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 600, ARGB(table.unpack(menu.draw.colorignite)))
	end
	if menu.draw.drawq and IsReady(_Q) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellQ.range, ARGB(table.unpack(menu.draw.colorq)))
	end
	if menu.draw.draww and IsReady(_W) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellW.range, ARGB(table.unpack(menu.draw.colorw)))
	end
	if menu.draw.drawe and IsReady(_E) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, self.SpellE.range, ARGB(table.unpack(menu.draw.colore)))
	end
	if menu.draw.drawr and IsReady(_R) then
		_Tech:DrawCircle(myHero.x, myHero.y, myHero.z, 1000, ARGB(table.unpack(menu.draw.colorr)))
	end
end

function _Malphite:ProcessAttack(object,spell)
	if Target == nil then return end
	if IsReady(_W) and spell.target and GetDistance(Target) <= self.SpellW.range then
		if object.team == TEAM_ENEMY and spell.name:lower():find("attack") then
			if spell.target.type == myHero.type then
				if (100 * myHero.mana / myHero.maxMana) >= menu.spell.w.wmana and menu.spell.w.wuse then
				CastSpell(_W)
				end
			end
		end
	end
end

function _Malphite:ProcessSpell(object, spell)
    if enemyCount > 0 then
        for i = 1, enemyCount do
        local unit = enemyHeroes[i]
            if Interrupt[unit.charName] ~= nil then
                if menu.interrupt["spell".. Interrupt[unit.charName].stop.spellName] and spell.name == Interrupt[unit.charName].stop.spellName then
                    if IsReady(_R) and menu.interrupt.rinterrupt and GetDistance(object) <= self.SpellR.range then
                        local CastPosition, HitChance = UPL:Predict(_R, myHero, object)
				        if HitChance > 0 then
                        DelayAction(function() CastSpell(_R, CastPosition.x, CastPosition.z) end, menu.humanizer.interruptDelay / 1000)
                        end
                    end
                end
            end
	    end
	end
end

function _Malphite:TowerCC()
	if Target == nil then return end
	for i = 1, enemyCount do
	local unit = enemyHeroes[i]
		for i = 1, towerCount do
			local tower = towers[i]
			if tower and tower.team == myHero.team and (GetDistance(tower, unit) <= 775) then
				if menu.snare.qsnare and menu.snare["" ..unit.charName] then
					CastSpell(_Q, unit)
				end
			end
		end
	end
end

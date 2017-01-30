local v = 1
GetWebResultAsync("https://raw.githubusercontent.com/LoggeL/GoS/master/v/dev.version", function(num)
	if v < tonumber(num) then
		DownloadFileAsync("https://raw.githubusercontent.com/LoggeL/GoS/master/Dev.lua", SCRIPT_PATH .. "Dev.lua", function() PrintChat("[Dev] Updated") end)
	end
end)

local res = GetResolution()
local o = {}
local s = {}
local u = {}
local ind = 0
local str = {[0]="Q",[1]="W",[2]="E",[3]="R"}
local M = Menu("Dev","Dev")
M:SubMenu("G","Global")
M.G:Slider("T","Time for clear",5,1,30,1)
M:SubMenu("S","Spells")
M.S:Boolean("E","Enable",false)
M.S:Boolean("AA", "Exclude AA", true)
M.S:Boolean("oH", "Only Heroes", true)
M.S:Boolean("mH", "Register myHero", true)
M.S:Boolean("rE", "Register Enemy", false)
M.S:Boolean("rA", "Register Ally", false)
M.S:Boolean("pC", "Print Names", false)
M.S:Boolean("sS", "Save SpellInfo", true)
M.S:Info("","-----------")
M.S:Boolean("dSN","Draw SpellName",true)
M.S:Boolean("dSP","Draw StartPos (Green)",true)
M.S:Boolean("dEP","Draw EndPos (Red)",true)
M.S:Boolean("dL","Draw Line (Yellow)",true)
M.S:Boolean("dD", "Draw Details",false)
M:SubMenu("O","Objects")
M.O:Boolean("E","Enable",false)
M.O:Boolean("oM", "only Missiles", true)
M.O:Boolean("omH", "only my Missiles", true)
M.O:Boolean("nAA", "Don't check AA", true)
M.O:Boolean("eO", "Extra Objects", false)
M.O:Boolean("cmH", "EO [myHero]", true)
M.O:Info("","-----------")
M.O:Boolean("dN", "Draw Name", true)
M.O:Boolean("dH", "Draw HitBox", true)
M.O:Boolean("sO", "Save ObjectInfo", true)
M.O:Boolean("dSP","Draw SartPos (Blue)",true)
M.O:Boolean("dEP","Draw EndPos (Black)",true)
M.O:Boolean("dL","Draw Line (White)",true)
M:SubMenu("U","Unit info")
M.U:Boolean("E", "Enable", false)
M.U:Boolean("dmH", "Draw only myHero", true)
M.U:Boolean("dIS", "Draw ItemSlots", false)
M.U:Boolean("dCS", "Draw CastSlots", false)

DelayAction(function()
	u[myHero.networkID] = myHero
	if GetAllyHeroes()[1] or GetEnemyHeroes()[1] then
		M.U:SubMenu("U","Extra Units")
		M.O:SubMenu("U","Extra Objects Units")
		M.O.U:Boolean("E","Enable (lag)",false)
		for _,i in pairs(GetAllyHeroes()) do
			M.U.U:Boolean(i.networkID,i.name,false)
			M.O.U:Boolean(i.networkID,i.name,false)
			u[i.networkID] = i
		end
		if GetAllyHeroes()[1] and GetEnemyHeroes()[1] then M.O.U:Info("","------------") M.U.U:Info("","------------") end
		for _,i in pairs(GetEnemyHeroes()) do
			M.U.U:Boolean(i.networkID,i.name,false)
			M.O.U:Boolean(i.networkID,i.name,false)
			u[i.networkID] = i
		end
	end
end)
	
OnProcessSpell(function(unit,spellProc)
	if not M.S.E:Value() then return end
	if M.S.AA:Value() and spellProc.name:lower():find("attack") then return end
	if not unit.isHero and M.S.oH:Value() then return end
	if not ((unit.isMe and M.S.mH:Value()) or (unit.team == MINION_ENEMY and M.S.rE:Value()) or (unit.team == MINION_ALLY and M.S.rA:Value())) then return end
	if M.S.pC:Value() then PrintChat(unit.name.." casted "..spellProc.name) end
	s[GetGameTimer()] = {u = unit, s = spellProc}
	if M.S.sS:Value() then 
		if not M.S.S then M.S:SubMenu("S","Saved Spells") end
		if not M.S.S[spellProc.name] then 
			M.S.S:SubMenu(spellProc.name,spellProc.name) 
			M.S.S[spellProc.name]:Info("1","windUpTime: "..spellProc.windUpTime)
			M.S.S[spellProc.name]:Info("2","animationTime: "..spellProc.animationTime)
			M.S.S[spellProc.name]:Info("3","castSpeed: "..spellProc.castSpeed)
		end
	end
end)

OnDraw(function()
	local off = 0 
	for _,i in pairs(s) do
		if M.S.dSN:Value() and i.s.name then DrawText(i.s.name,20,WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y+off,GoS.White) off = off + 30 end
		if M.S.dSP:Value() and i.s.startPos then DrawCircle(i.s.startPos,50,0,3,GoS.Green) end
		if M.S.dEP:Value() and i.s.endPos then DrawCircle(i.s.endPos,50,0,3,GoS.Red) end
		if M.S.dL:Value() and i.s.endPos and i.s.startPos then DrawLine(WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y,WorldToScreen(0,i.s.endPos).x,WorldToScreen(0,i.s.endPos).y,1,GoS.Yellow) end
		if M.S.dD:Value() then
			if i.s.target and i.s.target.name then DrawText("target: "..i.s.target.name or "none",20,WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y+off,GoS.White) off = off + 30 end
			if i.s.windUpTime  then DrawText("windUpTime: "..i.s.windUpTime,20,WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y+off,GoS.White) off = off + 30 end
			if i.s.animationTime   then DrawText("animationTime: "..i.s.animationTime,20,WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y+off,GoS.White) off = off + 30 end
			if i.s.castSpeed   then DrawText("castSpeed: "..i.s.castSpeed,20,WorldToScreen(0,i.s.startPos).x,WorldToScreen(0,i.s.startPos).y+off,GoS.White) off = off + 30 end
		end
		off = 0
	end
	for _,i in pairs(o) do
		off = 0 
		if M.O.dH:Value() then DrawCircle(i.o.pos,GetHitBox(i.o),3,3,GoS.White) end
		if M.O.dN:Value() and i.o.isSpell then DrawText("name: "..i.o.spellName,20,i.o.pos2D.x,i.o.pos2D.y+off,GoS.White) off = off + 30
		elseif M.O.dN:Value() then DrawText("name: "..i.o.name,20,i.o.pos2D.x,i.o.pos2D.y+off,GoS.White) off = off + 30 end
		if M.O.dSP:Value() and i.o.startPos then DrawCircle(i.o.startPos,50,2,3,GoS.Blue) end
		if M.O.dEP:Value() and i.o.endPos then DrawCircle(i.o.endPos,50,2,3,GoS.Black) end
		if M.O.dL:Value() and i.o.endPos and i.o.startPos then DrawLine(WorldToScreen(0,i.o.startPos).x,WorldToScreen(0,i.o.startPos).y,WorldToScreen(0,i.o.endPos).x,WorldToScreen(0,i.o.endPos).y,2,GoS.White) end
		off = 0
	end
	for _,i in pairs(u) do
		off = 0
		if M.U.dmH:Value() and not i.isMe then i = myHero end
		if not M.U.E:Value() then return end
		if i.pos2D.x > 0 and i.pos2D.y > 0 and i.pos2D.x < res.x and i.pos2D.y < res.y and ((M.U.U[i.networkID] and M.U.U[i.networkID]:Value()) or i.isMe) then
			if M.U.dIS:Value() then
				for y = 6,12,1 do
					if GetItemID(i,y) > 0 then
						DrawText("Slot "..y..": "..GetItemID(i,y),20,i.pos2D.x,i.pos2D.y+off,GoS.White) off = off + 20
					end
				end
			end
			if M.U.dCS:Value() then
				for y=0,3 do
					DrawText("_"..str[y]..": "..GetCastName(i,y),20,i.pos2D.x,i.pos2D.y+off,GoS.White) off = off + 20
				end
			end
		end
		off = 0
	end
end)

OnCreateObj(function(Object)
	if not M.O.E:Value() then return end
	local found = false
	DelayAction(function()
		if Object.name ~= "missile" and M.O.oM:Value() then return end
		if Object.name == "missile" and M.O.oM:Value() and Object.isSpell then
			if M.O.omH:Value() and GetObjectSpellOwner(Object) ~= myHero then return end
			if M.O.nAA:Value() and Object.spellName:lower():find("attack") then return end
			found = true
		elseif M.O.eO:Value() and not M.O.oM:Value() then
			if M.O.cmH:Value() and GetObjectBaseName(Object):lower():find(GetObjectName(myHero):lower()) then found = true end
			if M.O.U and M.O.U.E and M.O.U.E:Value() then
				for _,i in pairs(GetAllyHeroes()) do 
					if M.O.U[i.networkID]:Value() and GetObjectBaseName(Object):lower():find(GetObjectName(i):lower()) then found = true end
				end
				for _,i in pairs(GetEnemyHeroes()) do 
					if M.O.U[i.networkID]:Value() and GetObjectBaseName(Object):lower():find(GetObjectName(i):lower()) then found = true end
				end
			end
		end
		if not found then return end
		o[GetGameTimer()] = {o = Object, n = Object.name}
		if M.O.sO:Value() then
			if not M.O.O then M.O:SubMenu("O","Saved Objects") end
			if Object.name == "missile" then n = Object.spellName else n = Object.name end
			if M.O.O[n] then return end
			M.O.O:SubMenu(n,n) 
			M.O.O[n]:Info("1","HitBox: "..GetHitBox(Object))
			if Object and Object.isSpell then
				M.O.O[n]:Info("3","SpellName: "..Object.spellName)
			end
		end
	end)
end)

OnTick(function()
	for _,i in pairs(s) do
		if _ + M.G.T:Value() < GetGameTimer() then 
			s[_] = nil
		end
	end
		for _,i in pairs(o) do
		if _ + M.G.T:Value() < GetGameTimer() or i.o.name ~= i.n then 
			o[_] = nil
		end
	end
end)

local menu = MenuElement({id = "GSOMenu", name = "SHİTORB", type = MENU}) --Gamestron
        menu:MenuElement({id = "combo", name = "Combo Key", key = string.byte(" ")})
        menu:MenuElement({id = "wind", name = "ExtraWindupTime", value = 120, min = 0, max = 300, step = 10})

function ValidTarget(range, enemy)
      if enemy.distance < range and enemy.valid and not enemy.dead and enemy.isTargetable and enemy.visible then
              return true
      end
      return false
end

function GetAATarget(range)
        local t = nil
        num = 10000
        for i = 1, Game.HeroCount() do
                local enemy = Game.Hero(i)
                if enemy.isEnemy then
                        local armor = enemy.armor
                        local hp = enemy.health * (armor/(armor+100))
                        if ValidTarget(range+enemy.boundingRadius, enemy) then
                                if hp < num then
                                        num = hp
                                        t = enemy
                                end
                        end
                end
        end
        return t
end

local lastaa = 0
local function Attack(t)
        if t == nil or os.clock() < lastaa + myHero.attackData.animationTime then
                return
        end
        local mPos = mousePos
        Control.SetCursorPos(t.pos)
        Control.mouse_event(0x0008)
        Control.mouse_event(0x0010)
        lastaa = os.clock()
        DelayAction(function()
                Control.SetCursorPos(mPos)
        end,0.001)
end

local lastmove = 0
local wind = menu.wind:Value()*0.001
local function Move()
        if os.clock() < lastaa + myHero.attackData.windUpTime + wind or os.clock() < lastmove + 0.2 then
                return
        end
        Control.mouse_event(0x0008)
        Control.mouse_event(0x0010)
        lastmove = os.clock()
end

Callback.Add("Tick", function()
        wind = menu.wind:Value()*0.005
        if menu.combo:Value() then
                local t = GetAATarget(myHero.range + myHero.boundingRadius)
                Move()
                Attack(t)
        end
end)

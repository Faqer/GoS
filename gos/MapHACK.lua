local unittraveled = 0
local MissTimer = {}
local MissSec = {}
local ticks = {}
 
OnTick(function(myHero)
        for i,enemy in pairs(GetEnemyHeroes()) do
                if IsVisible(enemy) == false and IsDead(enemy) == false then
                        if ticks[i] == nil then
                        ticks[i] = GetTickCount()
                        end
                        MissTimer[i] = GetTickCount() - ticks[i]                  
                        MissSec[i] =  MissTimer[i]/1000
                else
                        ticks[i] = nil
                        MissTimer[i] = nil
                        MissSec[i] = 0
                end
        end
end)

OnDraw(function(myHero)
    for i,enemy in pairs(GetEnemyHeroes()) do
        if enemy ~= nil and IsDead(enemy) == false and IsVisible(enemy) == false then
          if MissSec[i] == nil then
          MissSec[i] = 0
          end
          unittraveled = GetMoveSpeed(enemy)*MissSec[i]
          if unittraveled > 50 and unittraveled < 10000 then
          DrawCircle(GetOrigin(enemy), unittraveled,1,0,0xffffffff)
          end
        end
    end
end)

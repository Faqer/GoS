local vayne, tristana = false, false

if myHero.charName == "Tristana" then
        tristana = true
elseif myHero.charName == "Vayne" then
        vayne = true
end

if not vayne and not tristana then
        return
end

local lastaa = 0
local lastmove = 0
local anim = 0
local wind = 0
local ewin = 0
local hum = 0
local ean = 0

menu = MenuConfig("GSO", "GamSterOn Vayne")
    menu:KeyBinding("combo", "Combo", 32)
    menu:Slider("hum", "Humanizer",175,50,300,5)
    menu:Slider("win", "ExtraWindUp",25,0,75,5)
    menu:Slider("ean", "ExtraAnim",50,0,100,10)

OnProcessSpellAttack(function(unit, aa)
        if unit == myHero then
                anim = aa.animationTime * 1000
                wind = aa.windUpTime * 1000
                lastaa = GetTickCount()
        end
end)

function Orb()
        if vayne then
                if IsReady(_Q) and GetTickCount() + ewin > lastaa + wind and GetTickCount() < lastaa + (anim*0.75) then
                        CastSkillShot(_Q, GetMousePos())
                        lastaa = 0
                end
        end
        local t = GetAATarget(myHero.range + myHero.boundingRadius)
        if t == nil then
                if GetTickCount() + ewin > lastaa + wind and GetTickCount() > lastmove + menu.hum:Value() then
                        lastmove = GetTickCount()
                        MoveToXYZ(GetMousePos())
                end
                return
        end
        if tristana then
                if IsReady(_Q) and GetTickCount() + ewin > lastaa + wind and GetTickCount() < lastaa + (anim*0.75) then
                        CastSpell(_Q)
                end
        end
        if GetTickCount() + ean > lastaa + anim then
                if tristana then
                        if IsReady(_E) then
                                CastTargetSpell(t, _E)
                        end
                end
                AttackUnit(t)
                return
        end
        if GetTickCount() + ewin > lastaa + wind then
                if GetTickCount() > lastmove + menu.hum:Value() then
                        lastmove = GetTickCount()
                        MoveToXYZ(GetMousePos())
                end
        end
end

OnTick(function()
        ewin = 75 - menu.win:Value()
        ean = 100 - menu.ean:Value()
        hum = menu.hum:Value()
        if menu.combo:Value() then
                Orb()
        end
end)

function GetAATarget(r)
        local t = nil
        num = 10000
        for i, enemy in pairs(GetEnemyHeroes()) do
                if ValidTarget(enemy, r + enemy.boundingRadius) then
                        local arm = enemy.armor
                        local hp = enemy.health * (arm/(arm+100))
                        if hp < num then
                                num = hp
                                t = enemy
                        end
                end
        end
        return t
end

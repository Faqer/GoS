--[[------------------------------------------------------------------------------------------------------------------------------------------
          _____                   _____                   _____            _____                   _____                   _____          
         /\    \                 /\    \                 /\    \          /\    \                 /\    \                 /\    \         
        /::\____\               /::\    \               /::\____\        /::\    \               /::\    \               /::\    \        
       /:::/    /              /::::\    \             /::::|   |        \:::\    \             /::::\    \              \:::\    \       
      /:::/    /              /::::::\    \           /:::::|   |         \:::\    \           /::::::\    \              \:::\    \      
     /:::/    /              /:::/\:::\    \         /::::::|   |          \:::\    \         /:::/\:::\    \              \:::\    \     
    /:::/____/              /:::/__\:::\    \       /:::/|::|   |           \:::\    \       /:::/__\:::\    \              \:::\    \    
   /::::\    \             /::::\   \:::\    \     /:::/ |::|   |           /::::\    \     /::::\   \:::\    \             /::::\    \   
  /::::::\    \   _____   /::::::\   \:::\    \   /:::/  |::|   | _____    /::::::\    \   /::::::\   \:::\    \   ____    /::::::\    \  
 /:::/\:::\    \ /\    \ /:::/\:::\   \:::\    \ /:::/   |::|   |/\    \  /:::/\:::\    \ /:::/\:::\   \:::\    \ /\   \  /:::/\:::\    \ 
/:::/  \:::\    /::\____/:::/__\:::\   \:::\____/:: /    |::|   /::\____\/:::/  \:::\____/:::/  \:::\   \:::\____/::\   \/:::/  \:::\____\
\::/    \:::\  /:::/    \:::\   \:::\   \::/    \::/    /|::|  /:::/    /:::/    \::/    \::/    \:::\  /:::/    \:::\  /:::/    \::/    /
 \/____/ \:::\/:::/    / \:::\   \:::\   \/____/ \/____/ |::| /:::/    /:::/    / \/____/ \/____/ \:::\/:::/    / \:::\/:::/    / \/____/ 
          \::::::/    /   \:::\   \:::\    \             |::|/:::/    /:::/    /                   \::::::/    /   \::::::/    /          
           \::::/    /     \:::\   \:::\____\            |::::::/    /:::/    /                     \::::/    /     \::::/____/           
           /:::/    /       \:::\   \::/    /            |:::::/    /\::/    /                      /:::/    /       \:::\    \           
          /:::/    /         \:::\   \/____/             |::::/    /  \/____/                      /:::/    /         \:::\    \          
         /:::/    /           \:::\    \                 /:::/    /                               /:::/    /           \:::\    \         
        /:::/    /             \:::\____\               /:::/    /                               /:::/    /             \:::\____\        
        \::/    /               \::/    /               \::/    /                                \::/    /               \::/    /        
         \/____/                 \/____/                 \/____/                                  \/____/                 \/____/         
          _____                   _____                   _____                   _____    _____                   _____                  
         /\    \                 /\    \                 /\    \                 /\    \  /\    \                 /\    \                 
        /::\    \               /::\    \               /::\    \               /::\____\/::\    \               /::\    \                
        \:::\    \             /::::\    \             /::::\    \             /:::/    /\:::\    \             /::::\    \               
         \:::\    \           /::::::\    \           /::::::\    \           /:::/    /  \:::\    \           /::::::\    \              
          \:::\    \         /:::/\:::\    \         /:::/\:::\    \         /:::/    /    \:::\    \         /:::/\:::\    \             
           \:::\    \       /:::/__\:::\    \       /:::/__\:::\    \       /:::/    /      \:::\    \       /:::/__\:::\    \            
           /::::\    \     /::::\   \:::\    \     /::::\   \:::\    \     /:::/    /       /::::\    \     /::::\   \:::\    \           
  ____    /::::::\    \   /::::::\   \:::\    \   /::::::\   \:::\    \   /:::/    ____    /::::::\    \   /::::::\   \:::\    \          
 /\   \  /:::/\:::\    \ /:::/\:::\   \:::\____\ /:::/\:::\   \:::\    \ /:::/    /\   \  /:::/\:::\    \ /:::/\:::\   \:::\    \         
/::\   \/:::/  \:::\____/:::/  \:::\   \:::|    /:::/__\:::\   \:::\____/:::/____/::\   \/:::/  \:::\____/:::/  \:::\   \:::\____\        
\:::\  /:::/    \::/    \::/   |::::\  /:::|____\:::\   \:::\   \::/    \:::\    \:::\  /:::/    \::/    \::/    \:::\  /:::/    /        
 \:::\/:::/    / \/____/ \/____|:::::\/:::/    / \:::\   \:::\   \/____/ \:::\    \:::\/:::/    / \/____/ \/____/ \:::\/:::/    /         
  \::::::/    /                |:::::::::/    /   \:::\   \:::\    \      \:::\    \::::::/    /                   \::::::/    /          
   \::::/____/                 |::|\::::/    /     \:::\   \:::\____\      \:::\    \::::/____/                     \::::/    /           
    \:::\    \                 |::| \::/____/       \:::\   \::/    /       \:::\    \:::\    \                     /:::/    /            
     \:::\    \                |::|  ~|              \:::\   \/____/         \:::\    \:::\    \                   /:::/    /             
      \:::\    \               |::|   |               \:::\    \              \:::\    \:::\    \                 /:::/    /              
       \:::\____\              \::|   |                \:::\____\              \:::\____\:::\____\               /:::/    /               
        \::/    /               \:|   |                 \::/    /               \::/    /\::/    /               \::/    /                
         \/____/                 \|___|                  \/____/                 \/____/  \/____/                 \/____/                 
--------------------------------------------------------------------------------------------------------------------------------------------]]
--ver. 0.8

if myHero.charName ~= "Irelia" then return end

local version = "0.8"
local scriptname = "Hentai Irelia"
local developer = "remembermyhentai"
local contact = "skype xd_kikass"
local HITEN = false
local FOCUSED = nil
local REGEN, FONTAN = false
local POTS = {"ItemCrystalFlask", "RegenerationPotion", "ItemMiniRegenPotion", "ItemCrystalFlaskJungle", "ItemDarkCrystalFlask"}
local lowBase = {["x"] = 406, ["z"] = 424}
local upBase = {["x"] = 14322, ["z"] = 14394}
local ATTACKITEMS = {"ItemTiamatCleave", "ItemTitanicHydraCleave", "BilgewaterCutlass", "YoumusBlade", "HextechGunblade", "ItemSwordOfFeastAndFamine"}
local TIAMAT, TITANIC, CUTLASS, YOUMU, GUNBLADE, BOTRK, QSS, DERVISH = false
local SHEENREADY = true
local SHEENLIST = {"sheen", "itemfrozenfist", "lichbane"}
local TIAMATSLOT, TITANICSLOT, CUTLASSSLOT, YOUMUSLOT, GUNBLADESLOT, BOTRKSLOT, QSSSLOT, DERVISHSLOT, SMITESLOT
local SMITELIST = {"summonersmite", "s5_summonersmiteplayerganker", "s5_summonersmiteduel"}
local SMITEFOCUS = {"SRU_Blue1.1.1", "SRU_Blue7.1.1", "SRU_Murkwolf2.1.1", "SRU_Murkwolf8.1.1", "SRU_Gromp13.1.1", "SRU_Gromp14.1.1", "Sru_Crab16.1.1", 
"Sru_Crab15.1.1", "SRU_Red10.1.1", "SRU_Red4.1.1", "SRU_Krug11.1.2", "SRU_Krug5.1.2", "SRU_Razorbeak9.1.1", "SRU_Razorbeak3.1.1", "SRU_Dragon6.1.1", 
"SRU_Baron12.1.1", "TT_NWraith1.1.1", "TT_NGolem2.1.1", "TT_NWolf3.1.1", "TT_NWraith4.1.1", "TT_NGolem5.1.1", "TT_NWolf6.1.1", "TT_Spiderboss8.1.1"}
local ANTICCITEMS = {"QuicksilverSash", "ItemDervishBlade"}
local SMITE, ATTACKSMITE = false
local UNDERCC = false
local CCSPELLS = {"MordekaiserChildrenOfTheGrave", "SkarnerImpale", "LuxLightBindingMis", "Wither", "SonaCrescendo", "DarkBindingMissile", "CurseoftheSadMummy",
"EnchantedCrystalArrow", "BlindingDart", "LuluWTwo", "AhriSeduce", "CassiopeiaPetrifyingGaze", "Terrify", "HowlingGale", "JaxCounterStrike", "KennenShurikenStorm",
"LeblancSoulShackle", "LeonaSolarFlare", "LissandraR", "AlZaharNetherGrasp", "MonkeyKingDecoy", "NamiQ", "OrianaDetonateCommand", "Pantheon_LeapBash", "PuncturingTaunt",
"SejuaniGlacialPrisonStart", "SwainShadowGrasp", "Imbue", "ThreshQ", "UrgotSwap2", "VarusR", "VeigarEventHorizon", "ViR", "InfiniteDuress", "ZyraGraspingRoots",
"paranoiamisschance", "puncturingtauntarmordebuff", "surpression", "zedulttargetmark", "enchantedcrystalarrow", "nasusw"}
local AttackResets = {"dariusnoxiantacticsonh", "fioraflurry", "garenq", "hecarimrapidslash", "jaxempowertwo", "jaycehypercharge", "leonashieldofdaybreak", 
"luciane", "lucianq", "lucianw", "monkeykingdoubleattack", "mordekaisermaceofspades", "nasusq", "nautiluspiercinggaze", "netherblade", "parley", 
"poppydevastatingblow", "powerfist", "renektonpreexecute", "rengarq", "shyvanadoubleattack", "sivirw", "takedown", "talonnoxiandiplomacy", "trundletrollsmash", 
"vaynetumble", "vie", "volibearq", "xenzhaocombotarget", "yorickspectral", "reksaiq"}
local NoAttacks = {"jarvanivcataclysmattack", "monkeykingdoubleattack", "shyvanadoubleattack", "shyvanadoubleattackdragon", "zyragraspingplantattack", 
"zyragraspingplantattack2", "zyragraspingplantattackfire", "zyragraspingplantattack2fire", "viktorpowertransfer", "sivirwattackbounce"}
local Attacks = {"caitlynheadshotmissile", "frostarrow", "garenslash2", "kennenmegaproc", "lucianpassiveattack", "masteryidoublestrike", "quinnwenhanced", 
"renektonexecute", "renektonsuperexecute", "rengarnewpassivebuffdash", "trundleq", "xenzhaothrust", "xenzhaothrust2", "xenzhaothrust3", "viktorqbuff"}


function OnLoad()
  
  AddApplyBuffCallback(Buff_Add)
  AddRemoveBuffCallback(Buff_Rem)
  AddRemoveBuffCallback(SpellBladeCD)
  AddProcessAttackCallback(Irelia_ProcessAttack)

  
  Menu = scriptConfig("[Hentai Irelia]", "HentaiIrelia")
  Menu:addSubMenu("[Key Binds]", "Key")
  Menu.Key:addParam("combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, string.byte(" "))
  Menu.Key:addParam("harras", "Harras", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("C"))
  Menu.Key:addParam("lasthit", "Lasthit", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("X"))
  Menu.Key:addParam("laneclear", "Laneclear/Jungleclear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("V"))
  Menu.Key:addParam("flee", "Flee", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("T"))
  Menu.Key:addParam("heal", "Heal up with ult", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("H"))

  Menu:addSubMenu("[Combo]", "Combo")
  Menu.Combo:addParam("focus", "Focus selected target/stick", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useGapCloser", "Use Gap Closer", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useEstun", "Use E only for stun", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useR", "Use R", SCRIPT_PARAM_ONOFF, true)
  Menu.Combo:addParam("useRLogic", "Use R with logic", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Harras]", "Harras")
  Menu.Harras:addParam("useGapCloser", "Use Gap Closer", SCRIPT_PARAM_ONOFF, true)
  Menu.Harras:addParam("useEstun", "Use E only for stun", SCRIPT_PARAM_ONOFF, true)
  Menu.Harras:addParam("useQ", "Use Q", SCRIPT_PARAM_ONOFF, true)
  Menu.Harras:addParam("useW", "Use W", SCRIPT_PARAM_ONOFF, true)
  Menu.Harras:addParam("useE", "Use E", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Farm]", "Farm")
  Menu.Farm:addSubMenu("[Lasthit]", "Lasthit")
  Menu.Farm.Lasthit:addParam("lasthitQ", "Use Q for lasthit", SCRIPT_PARAM_ONOFF, true)
  Menu.Farm.Lasthit:addParam("lasthitQmana", "% Mana for lasthit", SCRIPT_PARAM_SLICE, 60, 0, 100, 0)
  Menu.Farm:addSubMenu("[Clear]", "Laneclear")
  Menu.Farm.Laneclear:addParam("laneclearQ", "Use Q for clear", SCRIPT_PARAM_ONOFF, true)
  Menu.Farm.Laneclear:addParam("laneclearW", "Use W for clear", SCRIPT_PARAM_ONOFF, true)
  Menu.Farm.Laneclear:addParam("laneclearE", "Use E for clear", SCRIPT_PARAM_ONOFF, true)
  Menu.Farm.Laneclear:addParam("laneclearR", "Use R for clear", SCRIPT_PARAM_ONOFF, false)
  Menu.Farm.Laneclear:addParam("laneclearMana", "% Mana for clear", SCRIPT_PARAM_SLICE, 30, 0, 100, 0)

  Menu:addSubMenu("[Draws]", "Draws")
  Menu.Draws:addParam("drawQ", "Draw Q range", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("drawR", "Draw R range", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("drawGC", "Draw Gapcloser lines", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("drawHP", "Draw damage on HP bars", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("DrawSmite", "Draw Smite range", SCRIPT_PARAM_ONOFF, true) 
  Menu.Draws:addParam("DrawSmiteable", "Draw if jungle mob is Smiteable ", SCRIPT_PARAM_ONOFF, true)
  Menu.Draws:addParam("DrawSmiteStatus", "Draw Smite Status on window", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Auto]", "Auto")
  Menu.Auto:addParam("stunE", "Auto E stun", SCRIPT_PARAM_ONOFF, true)
  Menu.Auto:addParam("autoPots", "Auto Potions usage", SCRIPT_PARAM_ONOFF, true)
  Menu.Auto:addParam("autoPotsHealth", "% Health for autopots", SCRIPT_PARAM_SLICE, 75, 0, 100, 0)

  Menu:addSubMenu("[Item Usage]", "Item")
  Menu.Item:addParam("UseItem", "Enable Item Usage", SCRIPT_PARAM_ONOFF, true)
  Menu.Item:addSubMenu("[Offensive Items]", "AttackItem")
  Menu.Item.AttackItem:addParam("UseTiamat", "Use Tiamat/Hydra", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseTitanic", "Use Titanic Hydra", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseCutlass", "Use Bilgewater Cutlass", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseBOTRK", "Use BOTRK", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseYoumu", "Use Youmus Blade", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.AttackItem:addParam("UseGunblade", "Use Hextech Gunblade", SCRIPT_PARAM_ONOFF, true)
  Menu.Item:addSubMenu("[Anti CC]", "DefItem")
  Menu.Item.DefItem:addParam("EnableACC", "Enable AntiCC", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.DefItem:addParam("UseQSS", "Use Quicksilver Sash", SCRIPT_PARAM_ONOFF, true)
  Menu.Item.DefItem:addParam("UseDervish", "Use Dervish Blade", SCRIPT_PARAM_ONOFF, true)

  Menu:addSubMenu("[Smite Usage]", "Smite")
  Menu.Smite:addParam("UseSmite", "Enable Smite usage", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("N"))
  Menu.Smite:addParam("UseSmiteCombo", "Use Smite in combo", SCRIPT_PARAM_ONKEYTOGGLE, true, string.byte("M"))
  Menu.Smite:addParam("SRUBaron", "Smite Baron", SCRIPT_PARAM_ONOFF, true)
  Menu.Smite:addParam("SRUDragon", "Smite Dragon", SCRIPT_PARAM_ONOFF, true)
  Menu.Smite:addParam("SRURed", "Smite Red Buff", SCRIPT_PARAM_ONOFF, true)
  Menu.Smite:addParam("SRUBlue", "Smite Blue Buff", SCRIPT_PARAM_ONOFF, true)
  Menu.Smite:addParam("SRURazorbeak", "Smite Wraith", SCRIPT_PARAM_ONOFF, false)
  Menu.Smite:addParam("SRUMurkwolf", "Smite Wolf", SCRIPT_PARAM_ONOFF, false)
  Menu.Smite:addParam("SRUKrug", "Smite Golem", SCRIPT_PARAM_ONOFF, false)
  Menu.Smite:addParam("SRUGromp", "Smite Gromp", SCRIPT_PARAM_ONOFF, false)

  Menu:addSubMenu("[Killsteal]", "KS")
  Menu.KS:addParam("ksQ", "Use Q for killsteal", SCRIPT_PARAM_ONOFF, true)
  Menu.KS:addParam("ksE", "Use E for killsteal", SCRIPT_PARAM_ONOFF, true)
  Menu.KS:addParam("ksIgnite", "Use Ignite for killsteal", SCRIPT_PARAM_ONOFF, true)
  Menu.KS:addParam("UseItems", "Use Items in Killsteal", SCRIPT_PARAM_ONOFF, true) 
  Menu.KS:addParam("UseSmiteKS", "Use Smite in Killsteal", SCRIPT_PARAM_ONOFF, true) 

  Menu:addParam("info1", "", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info2", ""..scriptname.." [ver. "..version.."]", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info3", "Created by "..developer.."", SCRIPT_PARAM_INFO, "")
  Menu:addParam("info4", "Contact me: "..contact.."", SCRIPT_PARAM_INFO, "")

  
  igniteslot = FindSlotByName("summonerdot")

  
  PrintChat("<font color = \"#B13070\">[HENTAI IRELIA]</font> <font color = \"#4DFF4D\">LOADED</font>")
end


function OnTick()
  if FOCUSED ~= nil then
    if FOCUSED.dead or not FOCUSED.visible then
      FOCUSED = nil
    end
  end
  
  if Menu.Key.heal then
    HealUp()
  end
  
  local tsTarget = GetHentaiTarget(1300)
  local ctsTarget = GetHentaiTarget(650)
  if tsTarget ~= nil then
    HentaiTarget = tsTarget
  end
  if ctsTarget ~= nil then
    cHentaiTarget = ctsTarget
  end

  
  if Menu.Key.lasthit then
    Lasthit()
  end

  
  if Menu.Key.laneclear then
    Laneclear()
  end

  
  if Menu.Auto.stunE then
    AutoStun()
  end

  
  if Menu.Key.combo then
    Combo()
  end

  
  if Menu.Key.harras then
    Harras()
  end  

  
  if (Menu.Item.UseItem) then
    FindItems()
  end

  
  GetSmiteSlot()
  if SMITE then
    if Menu.Smite.UseSmite then
      AutoSmite()
    end
  end

  
  if UNDERCC and Menu.Item.UseItem and Menu.Item.DefItem.EnableACC then
    if Menu.Item.DefItem.UseQSS and QSS then
      CastQSS()
    end
    if Menu.Item.DefItem.UseDervish and DERVISH then
      CastDervish()
    end
  end

  
  Killsteal()
  AutoIgnite()

  
  if Menu.Auto.autoPots then
    CheckFountain()
  end
  if (Menu.Auto.autoPots and not REGEN) and not FONTAN then
    AutoPotion()
  end  

  
  if (Menu.Key.flee) then
    Flee()
  end  
end


function OnDraw()
  if not myHero.dead then
    
    if Menu.Draws.drawQ then
      DrawFPSCircle(myHero.x, myHero.z, 650, ARGB(255,100,50,255), 3)
    end
    if Menu.Draws.drawR then
      DrawFPSCircle(myHero.x, myHero.z, 1000, ARGB(120,100,50,255), 3)
    end
    if Menu.Draws.drawGC then
      GapcloseLines()
    end
    if Menu.Draws.drawHP then
      DrawHPdmg()
    end
    if SMITE then
      if Menu.Draws.DrawSmite then
        DrawFPSCircle(myHero.x, myHero.z, 500, ARGB(230,255,55,00), 3)
      end
      if Menu.Draws.DrawSmiteStatus then
        if Menu.Smite.UseSmite then
          DrawText ("USE SMITE [N]", 20, 150, 120, 0xFF00FF00)
        else
          DrawText ("DON'T USE SMITE [N]", 20, 150, 120, 0xFFFF0000)
        end
        if Menu.Smite.UseSmiteCombo then
          DrawText ("USE SMITE in SBTW [M]", 20, 150, 100, 0xFF00FF00)
        else
          DrawText ("DON'T USE SMITE in SBTW [M]", 20, 150, 100, 0xFFFF0000)
        end
      end
      if Menu.Draws.DrawSmiteable then
        DrawSmiteable()
      end
    end
    DrawSelectedTarget()
  end
end


function HealUp()
  if not CanCast(_R) then return end
  ultLaneclear()
  for i,enemy in pairs(GetEnemyHeroes()) do
    if not enemy.dead and enemy.visible then
      if GetRastoyanie(myHero, enemy) < 950 then
        CastR(enemy.x, enemy.z)
      end
    end
  end
end


function OnWndMsg(msg, key)
  if msg == WM_LBUTTONDOWN and Menu.Combo.focus and not myHero.dead then
    for i, pussy in ipairs(GetEnemyHeroes()) do
      if GetRastoyanie(mousePos, pussy) <= 120 and isValid(pussy) and not CheckInvul(pussy) then
        if FOCUSED ~= pussy then
          FOCUSED = pussy
          print("<font color = \"#B13070\">[HENTAI IRELIA]</font> focus "..pussy.charName)
        else
          FOCUSED = nil
          print("<font color = \"#B13070\">[HENTAI IRELIA]</font> stop focus "..pussy.charName)
        end
      end
    end
  end
end

local invul = {"undyingrage", "sionpassivezombie", "aatroxpassivedeath", "chronoshift", "judicatorintervention"}

function CheckInvul(unit)
  for i,buff in pairs(invul) do
    if TargetHaveBuff(buff, unit) then
      return true
    end
  end
    return false
end

function DrawSelectedTarget()
  if not Menu.Combo.focus then return end
  local target = FOCUSED
  if target == nil then return end
  if (target ~= nil and target.type == myHero.type and target.team ~= myHero.team) then
    DrawFPSCircle(target.x, target.z, 150, ARGB(255,255,0,0), 4)
    local posMinion = WorldToScreen(D3DXVECTOR3(target.x, target.y, target.z))
    DrawText("FOCUS!", 20, posMinion.x, posMinion.y, ARGB(255,255,255,255))
  end
end

function GetHentaiTarget(range)
  local selectedTarget = FOCUSED
  if selectedTarget ~= nil and Menu.Combo.focus then
    if selectedTarget.type == myHero.type and selectedTarget.team ~= myHero.team and isValid(selectedTarget, range + 100) and not CheckInvul(enemy) then
      return selectedTarget
    end
  end
  local hentaiTarget = nil
  local lessCast = 0
  for i = 1, #GetEnemyHeroes() do
    local enemy = GetEnemyHeroes()[i]
    if isValid(enemy, range) and not CheckInvul(enemy) then
      local kArmor = (100+enemy.armor)/100
      local kKillable = kArmor*enemy.health
      if kKillable <= lessCast or lessCast == 0 then
        hentaiTarget = enemy
        lessCast = kKillable
      end
    end
  end
  return hentaiTarget
end

function isValid(object, range)
  return object ~= nil and object.valid and object.visible and not object.dead and object.bInvulnerable == 0
   and object.bTargetable and (range == nil or GetRastoyanie(object, myHero) <= range)
end


function DrawHPdmg()
  for i, HPbarEnemyChamp in pairs(GetEnemyHeroes()) do
    if not HPbarEnemyChamp.dead and HPbarEnemyChamp.visible then
      local dmg = myHero:CalcDamage(HPbarEnemyChamp, myHero.totalDamage)
      if myHero:CanUseSpell(_Q) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetQDamage(HPbarEnemyChamp)
      end
      if myHero:CanUseSpell(_W) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetWDamage()
      end
      if myHero:CanUseSpell(_R) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetRDamage(HPbarEnemyChamp)
      end
      if myHero:CanUseSpell(_E) == READY and not HPbarEnemyChamp.dead then
        dmg = dmg + GetEDamage(HPbarEnemyChamp)
      end
      if TIAMAT then
        if CanCast(TIAMATSLOT) then
          dmg = dmg + GetTiamatDamage(HPbarEnemyChamp)
        end
      end
      if CUTLASS then
        if CanCast(CUTLASSSLOT) then
          dmg = dmg + GetCutlassDamage(HPbarEnemyChamp)
        end
      end
      if BOTRK then
        if CanCast(BOTRKSLOT) then
          dmg = dmg + GetBOTRKDamage(HPbarEnemyChamp)
        end
      end
      if GUNBLADE then
        if CanCast(GUNBLADESLOT) then
          dmg = dmg + GetGunbladeDamage(HPbarEnemyChamp)
        end
      end
      if SMITE and ATTACKSMITE then
        if CanCast(SMITESLOT) then
          dmg = dmg + GetAttackSmiteDamage()
        end
      end
      if igniteslot ~= nil then
        if CanCast(igniteslot) then
          dmg = dmg + (50 + 20*myHero.level)
        end
      end
      DrawLineHPBar(dmg, "", HPbarEnemyChamp, HPbarEnemyChamp.team)
    end
  end
end


function CanCast(spell)
  return myHero:CanUseSpell(spell) == READY
end


function FindItems()
  if (Menu.Item.AttackItem.UseTiamat) then
    GetTiamat()
  end
  if (Menu.Item.AttackItem.UseTitanic) then
    GetTitanic()
  end
  if (Menu.Item.AttackItem.UseBOTRK) then
    GetBOTRK()
  end
  if (Menu.Item.AttackItem.UseCutlass) then
    GetCutlass()
  end
  if (Menu.Item.AttackItem.UseYoumu) then
    GetYoumu()
  end
  if (Menu.Item.AttackItem.UseGunblade) then
    GetGunblade()
  end
  if (Menu.Item.DefItem.UseQSS) then
    GetQSS()
  end
  if (Menu.Item.DefItem.UseDervish) then
    GetDervish()
  end
end

function GetTiamat()
  local slot = GetItem(ATTACKITEMS[1])
  if (slot ~= nil) then
    TIAMAT = true
    TIAMATSLOT = slot
  else
    TIAMAT = false
  end
end

function GetTitanic()
  local slot = GetItem(ATTACKITEMS[2])
  if (slot ~= nil) then
    TITANIC = true
    TITANICSLOT = slot
  else
    TITANIC = false
  end
end

function GetCutlass()
  local slot = GetItem(ATTACKITEMS[3])
  if (slot ~= nil) then
    CUTLASS = true
    CUTLASSSLOT = slot
  else
    CUTLASS = false
  end
end

function GetYoumu()
  local slot = GetItem(ATTACKITEMS[4])
  if (slot ~= nil) then
    YOUMU = true
    YOUMUSLOT = slot
  else
    YOUMU = false
  end
end

function GetGunblade()
  local slot = GetItem(ATTACKITEMS[5])
  if (slot ~= nil) then
    GUNBLADE = true
    GUNBLADESLOT = slot
  else
    GUNBLADE = false
  end
end

function GetBOTRK()
  local slot = GetItem(ATTACKITEMS[6])
  if (slot ~= nil) then
    BOTRK = true
    BOTRKSLOT = slot
  else
    BOTRK = false
  end
end

function GetQSS()
  local slot = GetItem(ANTICCITEMS[1])
  if (slot ~= nil) then
    QSS = true
    QSSSLOT = slot
  else
    QSS = false
  end
end

function GetDervish()
  local slot = GetItem(ANTICCITEMS[2])
  if (slot ~= nil) then
    DERVISH = true
    DERVISHSLOT = slot
  else
    DERVISH = false
  end
end

function CastTiamat()
  if TIAMAT then
    if (CanCast(TIAMATSLOT)) then
      CastSpell(TIAMATSLOT)
    end
  end
end

function CastYoumu()
  if YOUMU then
    if (CanCast(YOUMUSLOT)) then
      CastSpell(YOUMUSLOT)
    end
  end
end

function CastBOTRK(target)
  if BOTRK then
    if (CanCast(BOTRKSLOT)) then
      CastSpell(BOTRKSLOT, target)
    end
  end
end

function CastTITANIC()
  if TITANIC then
    if (CanCast(TITANICSLOT)) then
      CastSpell(TITANICSLOT)
    end
  end
end

function CastCutlass(target)
  if CUTLASS then
    if (CanCast(CUTLASSSLOT)) then
      CastSpell(CUTLASSSLOT, target)
    end
  end
end

function CastGunblade(target)
  if GUNBLADE then
    if (CanCast(GUNBLADESLOT)) then
      CastSpell(GUNBLADESLOT, target)
    end
  end
end

function CastQSS()
  if QSS then
    if CanCast(QSSSLOT) then
      CastSpell(QSSSLOT)
    end
  end
end

function CastDervish()
  if DERVISH then
    if CanCast(DERVISHSLOT) then
      CastSpell(DERVISHSLOT)
    end
  end
end

function GetTiamatDamage(unit)
  local Dmg = myHero:CalcDamage(unit, myHero.totalDamage*0.6)
  return Dmg
end

function GetBOTRKDamage(unit)
  local Dmg = myHero:CalcDamage(unit, unit.maxHealth*0.1)
  return Dmg
end

function GetCutlassDamage(unit)
  local Dmg = myHero:CalcMagicDamage(unit, 100)
  return Dmg
end

function GetGunbladeDamage(unit)
  local Dmg = myHero:CalcMagicDamage(unit, 150+myHero.ap*0.4)
  return Dmg
end


function CastSmite(target)
  if CanCast(SMITESLOT) then
    CastSpell(SMITESLOT, target)
  end
end

function GetAttackSmiteDamage(unit)
  if SMITE and ATTACKSMITE then
    SmiteDmg = 20 + 8*myHero.level
    return SmiteDmg
  end
end

function GetSmiteDamage(unit)
  if SMITE then
    local SmiteDamage
    if myHero.level <= 4 then
      SmiteDamage = 370 + (myHero.level*20)
    end
    if myHero.level > 4 and myHero.level <= 9 then
      SmiteDamage = 330 + (myHero.level*30)
    end
    if myHero.level > 9 and myHero.level <= 14 then
      SmiteDamage = 240 + (myHero.level*40)
    end
    if myHero.level > 14 then
      SmiteDamage = 100 + (myHero.level*50)
    end
    return SmiteDamage
  end
end

function GetSmiteSlot()
  for i=1, 3 do
    if FindSlotByName(SMITELIST[i]) ~= nil then
      SMITESLOT = FindSlotByName(SMITELIST[i])
      SMITE = true
      if i == 2 or i == 3 then
        ATTACKSMITE = true
      else
        ATTACKSMITE = false
      end
    end
  end
end

function AutoSmite()
  local SmiteDmg = GetSmiteDamage()
  for _, minion in pairs(minionManager(MINION_JUNGLE, 500, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    if not minion.dead and minion.visible and ValidTarget(minion, 500) then
      if Menu.Smite[minion.charName:gsub("_", "")] then
        if CanCast(SMITESLOT) and GetRastoyanie(myHero, minion) <= 500 and SmiteDmg >= minion.health then
          CastSpell(SMITESLOT, minion)
        end
      end
    end
  end
end

function DrawSmiteable()
  local SmiteDmg = GetSmiteDamage()
  for _, minion in pairs(minionManager(MINION_JUNGLE, 500, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    for j = 1, #SMITEFOCUS do
      if minion.name == SMITEFOCUS[j] then
        if not minion.dead and minion.visible and ValidTarget(minion, 500) then
          if CanCast(SMITESLOT) and GetRastoyanie(myHero, minion) <= 500 and SmiteDmg >= minion.health then
            local posMinion = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
            DrawText("SMITE!", 20, posMinion.x, posMinion.y, ARGB(255,255,0,0))
          end
        end
      end
    end
  end
end


function isValid(object, range)
  return object ~= nil and object.valid and object.visible and not object.dead and object.bInvulnerable == 0
   and object.bTargetable and (range == nil or GetRastoyanie(object, myHero) <= range)
end

local invul = {"undyingrage", "sionpassivezombie", "aatroxpassivedeath", "chronoshift", "judicatorintervention"}

function CheckInvul(unit)
  for i,buff in pairs(invul) do
    if TargetHaveBuff(buff, unit) then
      return true
    end
  end
    return false
end


function Irelia_ProcessAttack(unit, spell)
  if not unit.isMe then return end
  if unit == myHero and isAutoAttack(spell.name) and spell.target and spell.target.type ~= myHero.type and Menu.Key.laneclear then
    local AADmg = myHero:CalcDamage(spell.target, myHero.totalDamage)
    if AADmg < spell.target.health then
      CastTITANIC()
    end
  end
  if unit == myHero and isAutoAttack(spell.name) and spell.target and spell.target.type == myHero.type and Menu.Key.combo then
    local AADmg = myHero:CalcDamage(spell.target, myHero.totalDamage)
    if AADmg < spell.target.health then
      CastTITANIC()
    end
  end
  if unit == myHero and isAutoAttack(spell.name) and spell.target and spell.target.type == myHero.type and Menu.Key.harras then
    local AADmg = myHero:CalcDamage(spell.target, myHero.totalDamage)
    if AADmg < spell.target.health then
      CastTITANIC()
    end
  end
end


function isAutoAttack(name)
  local lName = string.lower(name)
  return (string.find(lName, "attack") and not table.contains(NoAttacks,lName)) or table.contains(Attacks,lName)
end


function Combo()
  if (Menu.Combo.useGapCloser) then
    if (ValidTarget(HentaiTarget, 1300) and HentaiTarget.type == myHero.type) then
      local rastoyanie = math.sqrt((HentaiTarget.x-myHero.x)*(HentaiTarget.x-myHero.x) + (HentaiTarget.z-myHero.z)*(HentaiTarget.z-myHero.z))
      if (rastoyanie > 650) then
        Gapclose()
      else
        if (ValidTarget(cHentaiTarget, 650) and cHentaiTarget.type == myHero.type) then
          if GetRastoyanie(myHero, cHentaiTarget) <= 130 then
            CastYoumu()
          end
          if GetRastoyanie(myHero, cHentaiTarget) < 400 then
            if Menu.Smite.UseSmiteCombo then
              if SMITE and ATTACKSMITE then
                CastSmite(cHentaiTarget)
              end
            end
            if Menu.Item.UseItem then
              CastTiamat()
              CastBOTRK(cHentaiTarget)
              CastCutlass(cHentaiTarget)
              CastGunblade(cHentaiTarget)
            end
          end
          if (myHero:CanUseSpell(_W) == READY and Menu.Combo.useW) then
            CastW()
          end
          if (myHero:CanUseSpell(_Q) == READY and Menu.Combo.useQ) then
            CastQ(cHentaiTarget)
          end
          if (myHero:CanUseSpell(_R) == READY and Menu.Combo.useR) then
            if not Menu.Combo.useRLogic then
              CastR(cHentaiTarget.x, cHentaiTarget.z)
            else
              if SHEENREADY then
                CastR(cHentaiTarget.x, cHentaiTarget.z)
              end
            end
          end  
          if (not Menu.Combo.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Combo.useE) then
            CastE(cHentaiTarget)
          elseif (Menu.Combo.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Combo.useE) then
            if ((((myHero.health*100)/myHero.maxHealth) < ((cHentaiTarget.health*100)/cHentaiTarget.maxHealth)) 
              and ValidTarget(cHentaiTarget, 425)) then
              CastE(cHentaiTarget)
            end
          end  
        end
      end    
    end
  else
    if (ValidTarget(cHentaiTarget, 650) and cHentaiTarget.type == myHero.type) then
      if GetRastoyanie(myHero, cHentaiTarget) <= 130 then
        CastYoumu()
      end
      if GetRastoyanie(myHero, cHentaiTarget) < 400 then
        if Menu.Smite.UseSmiteCombo then
          if SMITE and ATTACKSMITE then
            CastSmite(cHentaiTarget)
          end
        end
        if Menu.Item.UseItem then
          CastTiamat()
          CastBOTRK(cHentaiTarget)
          CastCutlass(cHentaiTarget)
          CastGunblade(cHentaiTarget)
        end
      end
      if (myHero:CanUseSpell(_W) == READY and Menu.Combo.useW) then
        CastW()
      end
      if (myHero:CanUseSpell(_Q) == READY and Menu.Combo.useQ) then
       CastQ(cHentaiTarget)
      end
      if (myHero:CanUseSpell(_R) == READY and Menu.Combo.useR) then
        if not Menu.Combo.useRLogic then
          CastR(cHentaiTarget.x, cHentaiTarget.z)
        else
          if SHEENREADY then
            CastR(cHentaiTarget.x, cHentaiTarget.z)
          end
        end
      end   
      if (not Menu.Combo.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Combo.useE) then
        CastE(cHentaiTarget)
      elseif (Menu.Combo.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Combo.useE) then
        if ((((myHero.health*100)/myHero.maxHealth) < ((cHentaiTarget.health*100)/cHentaiTarget.maxHealth)) 
          and ValidTarget(cHentaiTarget, 425)) then
          CastE(cHentaiTarget)
        end
      end
    end
  end  
end


function Harras()
  if (Menu.Harras.useGapCloser) then
    if (ValidTarget(HentaiTarget, 1300) and HentaiTarget.type == myHero.type) then
      local rastoyanie = math.sqrt((HentaiTarget.x-myHero.x)*(HentaiTarget.x-myHero.x) + (HentaiTarget.z-myHero.z)*(HentaiTarget.z-myHero.z))
      if (rastoyanie > 650) then
        Gapclose()
      else
        if (ValidTarget(cHentaiTarget, 650) and cHentaiTarget.type == myHero.type) then
          if (myHero:CanUseSpell(_W) == READY and Menu.Harras.useW) then
            CastW()
          end
          if (myHero:CanUseSpell(_Q) == READY and Menu.Harras.useQ) then
            CastQ(cHentaiTarget)
          end
          if (not Menu.Harras.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Harras.useE) then
            CastE(cHentaiTarget)
          elseif (Menu.Harras.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Harras.useE) then
            if ((((myHero.health*100)/myHero.maxHealth) < ((cHentaiTarget.health*100)/cHentaiTarget.maxHealth)) 
              and ValidTarget(cHentaiTarget, 425)) then
              CastE(cHentaiTarget)
            end
          end  
        end
      end    
    end
  else
    if (ValidTarget(cHentaiTarget, 650) and cHentaiTarget.type == myHero.type) then
      if (myHero:CanUseSpell(_W) == READY and Menu.Harras.useW) then
        CastW()
      end
      if (myHero:CanUseSpell(_Q) == READY and Menu.Harras.useQ) then
       CastQ(cHentaiTarget)
      end 
      if (not Menu.Harras.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Harras.useE) then
        CastE(cHentaiTarget)
      elseif (Menu.Harras.useEstun and myHero:CanUseSpell(_E) == READY and Menu.Harras.useE) then
        if ((((myHero.health*100)/myHero.maxHealth) < ((cHentaiTarget.health*100)/cHentaiTarget.maxHealth)) 
          and ValidTarget(cHentaiTarget, 425)) then
          CastE(cHentaiTarget)
        end
      end
    end
  end  
end


function Killsteal()
  for i,enemy in pairs(GetEnemyHeroes()) do
    if not CheckInvul(enemy) then
      if (ValidTarget(enemy, 650)) then
        local qDmg = GetQDamage(enemy)
        local wDmg = GetWDamage()
        local eDmg = GetEDamage(enemy)
        if (ValidTarget(enemy, 425) and myHero:CanUseSpell(_E) == READY and eDmg >= enemy.health and Menu.KS.ksE) then
          CastE(enemy)
        end
        if (myHero:CanUseSpell(_Q) == READY and qDmg >= enemy.health and Menu.KS.ksQ) then
          CastQ(enemy)
        end
        if ((wDmg + qDmg) >= enemy.health and myHero and myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and Menu.KS.ksQ) then
          CastW()
          DelayAction(function() CastQ(enemy) end, 0.3)
        end
      end
      if GetRastoyanie(myHero, enemy) <= 400 then
        if TIAMAT and Menu.KS.UseItems then
          local TiamatDamage = GetTiamatDamage(enemy)
          if TiamatDamage >= enemy.health and CanCast(TIAMATSLOT) and not enemy.dead then
            CastTiamat()
          end
        end
      end
      if GetRastoyanie(myHero, enemy) <= 500 then
        if SMITE and ATTACKSMITE and Menu.KS.UseSmiteKS then
          local SmiteDmg = GetAttackSmiteDamage()
          if SmiteDmg >= enemy.health and CanCast(SMITESLOT) and not enemy.dead then
            CastSmite(enemy)
          end
        end
      end
      if GetRastoyanie(myHero, enemy) <= 550 then
        if BOTRK and Menu.KS.UseItems then
          local BOTRKDamage = GetBOTRKDamage(enemy)
          if BOTRKDamage >= enemy.health and CanCast(BOTRKSLOT) and not enemy.dead then
            CastBOTRK(enemy)
          end
        end
        if CUTLASS and Menu.KS.UseItems then
          local CutlassDamage = GetCutlassDamage(enemy)
          if CutlassDamage >= enemy.health and CanCast(CUTLASSSLOT) and not enemy.dead then
            CastCutlass(enemy)
          end
        end
      end
      if GetRastoyanie(myHero, enemy) <= 700 then
        if GUNBLADE and Menu.KS.UseItems then
          local GunbladeDamage = GetGunbladeDamage(enemy)
          if GunbladeDamage >= enemy.health and CanCast(GUNBLADESLOT) and not enemy.dead then
            CastGunblade(enemy)
          end
        end
      end
    end
  end       
end


function AutoIgnite()
  if igniteslot == nil then return end
  for i,enemy in pairs(GetEnemyHeroes()) do
    if not enemy.dead and enemy.visible then
      local rastoyanie = math.sqrt((enemy.x-myHero.x)*(enemy.x-myHero.x) + (enemy.z-myHero.z)*(enemy.z-myHero.z))
      if rastoyanie <= 600 then
        if ((50 + (20*myHero.level)) >= enemy.health and igniteslot ~= nil and myHero:CanUseSpell(igniteslot) == READY and
          ValidTarget(enemy, 600)) then 
          CastSpell(igniteslot, enemy)
        end
      end
    end
  end
end


function AutoPotion()
  for i=1, 5 do
    local pot = GetItem(POTS[i])
    if (pot ~= nil) then
      if (((myHero.health*100)/myHero.maxHealth) <= Menu.Auto.autoPotsHealth and not REGEN) then
        CastSpell(pot)
      end
    end
  end
end


function Gapclose()
  if (ValidTarget(HentaiTarget, 1300) and HentaiTarget.type == myHero.type) then
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      if (ValidTarget(minion, 650)) then
        local rastoyanie = math.sqrt((HentaiTarget.x-minion.x)*(HentaiTarget.x-minion.x) + (HentaiTarget.z-minion.z)*(HentaiTarget.z-minion.z))
        local rastoyanieHentai = math.sqrt((HentaiTarget.x-myHero.x)*(HentaiTarget.x-myHero.x) + (HentaiTarget.z-myHero.z)*(HentaiTarget.z-myHero.z))
        local rastoyanieLoli = math.sqrt((minion.x-myHero.x)*(minion.x-myHero.x) + (minion.z-myHero.z)*(minion.z-myHero.z))
        local qDmg = GetQDamage(minion)
        local wDmg = GetWDamage()
        local rDmg = GetRDamage(minion)
        if ((rastoyanie <= 650) and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_W) == READY and ((qDmg + wDmg + rDmg) >= minion.health)
         and not (rDmg >= minion.health) and myHero:CanUseSpell(_Q) == READY and not ((wDmg + qDmg) >= minion.health)) then
          CastR(minion.x, minion.z)
          DelayAction(function() CastQ(minion) end, 0.5)
          DelayAction(function() CastQ(HentaiTarget) end, 0.3)
        elseif ((rastoyanie <= 650) and myHero:CanUseSpell(_W) == READY and (qDmg + wDmg) >= minion.health and myHero:CanUseSpell(_Q) == READY) then
          CastW()
          DelayAction(function() CastQ(minion) end, 0.3)
          if (rastoyanieLoli < rastoyanieHentai and rastoyanieHentai > 650) then
            DelayAction(function() CastQ(minion) end, 0.025)
          end  
          DelayAction(function() CastQ(HentaiTarget) end, 0.3)
        elseif ((rastoyanie <= 650) and qDmg >= minion.health and myHero:CanUseSpell(_Q) == READY) then
          CastQ(minion)
          if (rastoyanieLoli < rastoyanieHentai and rastoyanieHentai > 650) then
            DelayAction(function() CastQ(minion) end, 0.025)
          end  
          DelayAction(function() CastQ(HentaiTarget) end, 0.3)
        end
      end
    end
  end
end

function GapcloseLines()
  if (ValidTarget(HentaiTarget, 1300) and HentaiTarget.type == myHero.type) then
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      if (ValidTarget(minion, 650)) then
        local rastoyanie = math.sqrt((HentaiTarget.x-minion.x)*(HentaiTarget.x-minion.x) + (HentaiTarget.z-minion.z)*(HentaiTarget.z-minion.z))
        local rastoyanieHentai = math.sqrt((HentaiTarget.x-myHero.x)*(HentaiTarget.x-myHero.x) + (HentaiTarget.z-myHero.z)*(HentaiTarget.z-myHero.z))
        local rastoyanieLoli = math.sqrt((minion.x-myHero.x)*(minion.x-myHero.x) + (minion.z-myHero.z)*(minion.z-myHero.z))
        local qDmg = GetQDamage(minion)
        local wDmg = GetWDamage()
        local rDmg = GetRDamage(minion)
        local posMe = WorldToScreen(D3DXVECTOR3(myHero.x, myHero.y, myHero.z))
        local posMinion = WorldToScreen(D3DXVECTOR3(minion.x, minion.y, minion.z))
        local posHero = WorldToScreen(D3DXVECTOR3(HentaiTarget.x, HentaiTarget.y, HentaiTarget.z))
        if GetRastoyanie(HentaiTarget, myHero) <= 650 then return end
        if ((rastoyanie <= 650) and myHero:CanUseSpell(_R) == READY and myHero:CanUseSpell(_W) == READY and ((qDmg + wDmg + rDmg) >= minion.health)
         and not (rDmg >= minion.health) and myHero:CanUseSpell(_Q) == READY) then
          DrawLine(posMe.x, posMe.y, posMinion.x, posMinion.y, 1, ARGB(255,100,50,255))
          DrawLine(posMinion.x, posMinion.y, posHero.x, posHero.y, 1, ARGB(255,100,50,255))
        elseif ((rastoyanie <= 650) and myHero:CanUseSpell(_W) == READY and (qDmg + wDmg) >= minion.health and myHero:CanUseSpell(_Q) == READY) then
          DrawLine(posMe.x, posMe.y, posMinion.x, posMinion.y, 1, ARGB(255,100,50,255))
          if (rastoyanieLoli < rastoyanieHentai and rastoyanieHentai > 650) then
            DrawLine(posMe.x, posMe.y, posMinion.x, posMinion.y, 1, ARGB(255,100,50,255))
          end  
          DrawLine(posMinion.x, posMinion.y, posHero.x, posHero.y, 1, ARGB(255,100,50,255))
        elseif ((rastoyanie <= 650) and qDmg >= minion.health and myHero:CanUseSpell(_Q) == READY) then
          DrawLine(posMe.x, posMe.y, posMinion.x, posMinion.y, 1, ARGB(255,100,50,255))
          if (rastoyanieLoli < rastoyanieHentai and rastoyanieHentai > 650) then
            DrawLine(posMe.x, posMe.y, posMinion.x, posMinion.y, 1, ARGB(255,100,50,255))
          end  
          DrawLine(posMinion.x, posMinion.y, posHero.x, posHero.y, 1, ARGB(255,100,50,255))
        end
      end
    end
  end
end


function Flee()
  local wDmg = GetWDamage()
  local rastoyanie = math.sqrt((mousePos.x-myHero.x)*(mousePos.x-myHero.x) + (mousePos.z-myHero.z)*(mousePos.z-myHero.z))
  myHero:MoveTo(mousePos.x,mousePos.z)
  for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if (ValidTarget(minion, 650)) then
      local rastoyanieHentai = math.sqrt((mousePos.x-minion.x)*(mousePos.x-minion.x) + (minion.z-myHero.z)*(minion.z-myHero.z))
      local qDmg = GetQDamage(minion)
      if (rastoyanieHentai < rastoyanie) then
        if (myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_Q) == READY and (wDmg + qDmg) >= minion.health and not (qDmg >= minion.health)) then
          CastW()
          DelayAction(function() CastQ(minion) end, 0.3)
        end
        if CanCast(_Q) and qDmg >= minion.health and rastoyanieHentai < rastoyanie then
          CastQ(minion)
        end
        if (myHero:CanUseSpell(_Q) == READY and rastoyanieHentai < rastoyanie) then
          CastQ(minion)
        end  
      end
    end
  end
  for _, minion in pairs(minionManager(MINION_JUNGLE, 650, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    if (ValidTarget(minion, 650)) then
      local rastoyanieHentai = math.sqrt((mousePos.x-minion.x)*(mousePos.x-minion.x) + (minion.z-myHero.z)*(minion.z-myHero.z))
      local qDmg = GetQDamage(minion)
      if (rastoyanieHentai < rastoyanie) then
        if (myHero:CanUseSpell(_W) == READY and myHero:CanUseSpell(_Q) == READY and (wDmg + qDmg) >= minion.health and not (qDmg >= minion.health)) then
          CastW()
          DelayAction(function() CastQ(minion) end, 0.3)
        end
        if (myHero:CanUseSpell(_Q) == READY) then
          CastQ(minion)
        end  
      end
    end
  end
end


function Lasthit()
  if (Menu.Farm.Lasthit.lasthitQ) then
    qFarm()
  end
end


function Laneclear()
  if (((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Laneclear.laneclearMana) then
    if (Menu.Farm.Laneclear.laneclearR) then
      ultLaneclear()
    end  
    if (Menu.Farm.Laneclear.laneclearQ) then
      qLaneclear()
    end
    if (not Menu.Farm.Laneclear.laneclearQ and Menu.Farm.Laneclear.laneclearW) then
      CastW()
    end
  end
  Jungleclear()
end

function Jungleclear()
  if ((myHero.mana*100)/myHero.maxMana) < Menu.Farm.Laneclear.laneclearMana then return end
  for _, minion in pairs(minionManager(MINION_JUNGLE, 650, myHero, MINION_SORT_MAXHEALTH_DEC).objects) do
    if not minion.dead and minion.visible and ValidTarget(minion, 650) then
      if Menu.Farm.Laneclear.laneclearW and GetRastoyanie(myHero, minion) <= 130 then
        CastW()
      end
      if Menu.Farm.Laneclear.laneclearQ then
        CastQ(minion)
      end
      if Menu.Farm.Laneclear.laneclearE and GetRastoyanie(myHero, minion) <= 130 then
        CastE(minion)
      end
      if Menu.Farm.Laneclear.laneclearR then
        CastR(minion.x, minion.z)
      end
    end
  end
end


function AutoStun()
  for i,enemy in pairs(GetEnemyHeroes()) do
    if (not enemy.dead and enemy.visible) then
      local rastoyanie = math.sqrt((enemy.x-myHero.x)*(enemy.x-myHero.x) + (enemy.z-myHero.z)*(enemy.z-myHero.z))
      if (ValidTarget(enemy, 420)) then
        if (rastoyanie <= 420) then
          if (myHero:CanUseSpell(_E) == READY and (((myHero.health*100)/myHero.maxHealth) < ((enemy.health*100)/enemy.maxHealth))) then
            CastE(enemy)
          end
        end
      end
    end
  end
end


function qFarm()
  if HITEN then
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local qDmg = GetQDamage(minion)
      local wDmg = GetWDamage()
      if (myHero:CanUseSpell(_Q) == READY and (minion.health <= (qDmg + wDmg)) and not minion.dead
        and ((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Lasthit.lasthitQmana) then
        CastQ(minion)
      end
    end
  else
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local qDmg = GetQDamage(minion)
      if (myHero:CanUseSpell(_Q) == READY and (minion.health <= qDmg) and not minion.dead
        and ((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Lasthit.lasthitQmana) then
        CastQ(minion)
      end
    end
  end
end

function qLaneclear()
  if HITEN then
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local qDmg = GetQDamage(minion)
      local wDmg = GetWDamage()
      if (myHero:CanUseSpell(_Q) == READY and (minion.health < (qDmg + wDmg)) and not minion.dead
        and ((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Laneclear.laneclearMana) then
        CastQ(minion)
      end
    end
  else
    for _, minion in pairs(minionManager(MINION_ENEMY, 650, myHero, MINION_SORT_HEALTH_ASC).objects) do
      local qDmg = GetQDamage(minion)
      local wDmg = GetWDamage(minion)
      if (myHero:CanUseSpell(_Q) == READY and myHero:CanUseSpell(_W) == READY and (minion.health <= (qDmg+wDmg)) and not minion.dead
        and ((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Laneclear.laneclearMana and Menu.Farm.Laneclear.laneclearW) then
        CastW()
        DelayAction(function() CastQ(minion) end, 0.3)
      end
      if (myHero:CanUseSpell(_Q) == READY and (minion.health <= (qDmg)) and not minion.dead
       and ((myHero.mana*100)/myHero.maxMana) >= Menu.Farm.Laneclear.laneclearMana) then
        CastQ(minion)
      end
    end
  end
end


function ultLaneclear()
  for _, minion in pairs(minionManager(MINION_ENEMY, 625, myHero, MINION_SORT_HEALTH_ASC).objects) do
    if (myHero:CanUseSpell(_R) == READY and not minion.dead) then
      CastR(minion.x, minion.z)
    end
  end
end


function GetHPBarPos(enemy)
  enemy.barData = {PercentageOffset = {x = -0.05, y = 0}}
  local barPos = GetUnitHPBarPos(enemy)
  local barPosOffset = GetUnitHPBarOffset(enemy)
  local barOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
  local barPosPercentageOffset = { x = enemy.barData.PercentageOffset.x, y = enemy.barData.PercentageOffset.y }
  local BarPosOffsetX = -50
  local BarPosOffsetY = 46
  local CorrectionY = 39
  local StartHpPos = 31 
  barPos.x = math.floor(barPos.x + (barPosOffset.x - 0.5 + barPosPercentageOffset.x) * BarPosOffsetX + StartHpPos)
  barPos.y = math.floor(barPos.y + (barPosOffset.y - 0.5 + barPosPercentageOffset.y) * BarPosOffsetY + CorrectionY)
  local StartPos = Vector(barPos.x , barPos.y, 0)
  local EndPos = Vector(barPos.x + 108 , barPos.y , 0)    
  return Vector(StartPos.x, StartPos.y, 0), Vector(EndPos.x, EndPos.y, 0)
end

function DrawLineHPBar(damage, text, unit, enemyteam)
  if unit.dead or not unit.visible then return end
  local p = WorldToScreen(D3DXVECTOR3(unit.x, unit.y, unit.z))
  if not OnScreen(p.x, p.y) then return end
  local thedmg = 0
  local line = 2
  local linePosA  = {x = 0, y = 0 }
  local linePosB  = {x = 0, y = 0 }
  local TextPos   = {x = 0, y = 0 }

  if damage >= unit.health then
    thedmg = unit.health - 1
    text = "KILLABLE!"
  else
    thedmg = damage
    text = "Possible Damage"
  end

  thedmg = math.round(thedmg)

  local StartPos, EndPos = GetHPBarPos(unit)
  local Real_X = StartPos.x + 24
  local Offs_X = (Real_X + ((unit.health - thedmg) / unit.maxHealth) * (EndPos.x - StartPos.x - 2))
  if Offs_X < Real_X then Offs_X = Real_X end 
  local mytrans = 350 - math.round(255*((unit.health-thedmg)/unit.maxHealth))
  if mytrans >= 255 then mytrans=254 end
  local my_bluepart = math.round(400*((unit.health-thedmg)/unit.maxHealth))
  if my_bluepart >= 255 then my_bluepart=254 end

  if enemyteam then
    linePosA.x = Offs_X-150
    linePosA.y = (StartPos.y-(30+(line*15)))    
    linePosB.x = Offs_X-150
    linePosB.y = (StartPos.y-10)
    TextPos.x = Offs_X-148
    TextPos.y = (StartPos.y-(30+(line*15)))
  else
    linePosA.x = Offs_X-125
    linePosA.y = (StartPos.y-(30+(line*15)))    
    linePosB.x = Offs_X-125
    linePosB.y = (StartPos.y-15)

    TextPos.x = Offs_X-122
    TextPos.y = (StartPos.y-(30+(line*15)))
  end

  DrawLine(linePosA.x, linePosA.y, linePosB.x, linePosB.y , 2, ARGB(mytrans, 255, my_bluepart, 0))
  DrawText(tostring(thedmg).." "..tostring(text), 15, TextPos.x, TextPos.y , ARGB(mytrans, 255, my_bluepart, 0))
end


function DrawLineA(x1, y1, x2, y2, color)
  DrawLine(x1, y1, x2, y2, 1, color)
end

function DrawFPSCircle(xCoordinate, zCoordinate, radius, color, quality)
  for i=-radius*math.cos(math.pi/4), radius*math.cos(math.pi/4)-1, radius*math.cos(math.pi/4)/quality do
    local nigger = WorldToScreen(D3DXVECTOR3((xCoordinate+i), myHero.y, (zCoordinate + math.sqrt(radius*radius-i*i))))
    local stalin = WorldToScreen(D3DXVECTOR3((xCoordinate+i), myHero.y, (zCoordinate - math.sqrt(radius*radius-i*i))))
    local hentai = WorldToScreen(D3DXVECTOR3((xCoordinate+i+radius*math.cos(math.pi/4)/quality), myHero.y, 
      (zCoordinate + math.sqrt(radius*radius-(i+radius*math.cos(math.pi/4)/quality)*(i+radius*math.cos(math.pi/4)/quality)))))
    local ebola = WorldToScreen(D3DXVECTOR3((xCoordinate+i+radius*math.cos(math.pi/4)/quality), myHero.y, 
      (zCoordinate - math.sqrt(radius*radius-(i+radius*math.cos(math.pi/4)/quality)*(i+radius*math.cos(math.pi/4)/quality)))))

    if (nigger.x>0 and nigger.x<WINDOW_W) and (nigger.y>0 and nigger.y<WINDOW_H) and (hentai.x>0 and hentai.x<WINDOW_W) and (hentai.y>0 and hentai.y<WINDOW_H) then
      DrawLineA(nigger.x,nigger.y,hentai.x,hentai.y, color)
    end
    if (stalin.x>0 and stalin.x<WINDOW_W) and (stalin.y>0 and stalin.y<WINDOW_H) and (ebola.x>0 and ebola.x<WINDOW_W) and (ebola.y>0 and ebola.y<WINDOW_H) then
      DrawLineA(stalin.x,stalin.y,ebola.x,ebola.y, color)
    end
  end

  for i=-radius*math.cos(math.pi/4), radius*math.cos(math.pi/4)-1, radius*math.cos(math.pi/4)/quality do
    local nigger = WorldToScreen(D3DXVECTOR3((xCoordinate+math.sqrt(radius*radius-i*i)), myHero.y, (zCoordinate + i)))
    local stalin = WorldToScreen(D3DXVECTOR3((xCoordinate-math.sqrt(radius*radius-i*i)), myHero.y, (zCoordinate +i)))
    local hentai = WorldToScreen(D3DXVECTOR3((xCoordinate+math.sqrt(radius*radius-(i+radius*math.cos(math.pi/4)/quality)*(i+radius*math.cos(math.pi/4)/quality))), 
      myHero.y, (zCoordinate + i+radius*math.cos(math.pi/4)/quality)))
    local ebola = WorldToScreen(D3DXVECTOR3((xCoordinate-math.sqrt(radius*radius-(i+radius*math.cos(math.pi/4)/quality)*(i+radius*math.cos(math.pi/4)/quality))), 
      myHero.y, (zCoordinate + i+radius*math.cos(math.pi/4)/quality)))

    if (nigger.x>0 and nigger.x<WINDOW_W) and (nigger.y>0 and nigger.y<WINDOW_H) and (hentai.x>0 and hentai.x<WINDOW_W) and (hentai.y>0 and hentai.y<WINDOW_H) then
      DrawLineA(nigger.x,nigger.y,hentai.x,hentai.y, color)
    end
    if (stalin.x>0 and stalin.x<WINDOW_W) and (stalin.y>0 and stalin.y<WINDOW_H) and (ebola.x>0 and ebola.x<WINDOW_W) and (ebola.y>0 and ebola.y<WINDOW_H) then
      DrawLineA(stalin.x,stalin.y,ebola.x,ebola.y, color)
    end
  end
end


function GetQDamage(unit)
  
  local Qlvl = myHero:GetSpellData(_Q).level
  if Qlvl < 1 then return 0 end
  local QDmg = {20, 50, 80, 110, 140}
  local QDmgMod = 1
  local DmgRaw = QDmg[Qlvl] + myHero.totalDamage * QDmgMod
  local Dmg = myHero:CalcDamage(unit, DmgRaw)
  return Dmg
end

function GetWDamage()
  
  local Wlvl = myHero:GetSpellData(_W).level
  if Wlvl < 1 then return 0 end
  local WDmg = {15, 30, 45, 60, 75}
  return WDmg[Wlvl]
end

function GetEDamage(unit)
  
  local Elvl = myHero:GetSpellData(_E).level
  if Elvl < 1 then return 0 end
  local EDmg = {80, 120, 160, 200, 240}
  local EDmgMod = 0.5
  local DmgRaw = EDmg[Elvl] + myHero.ap * EDmgMod
  local Dmg = myHero:CalcMagicDamage(unit, DmgRaw)
  return Dmg
end

function GetRDamage(unit)
  
  local Rlvl = myHero:GetSpellData(_R).level
  if Rlvl < 1 then return 0 end
  local RDmg = {80, 120, 160}
  local RDmgMod = 0.6
  local DmgRaw = RDmg[Rlvl] + myHero.totalDamage * RDmgMod
  local Dmg = myHero:CalcDamage(unit, DmgRaw)
  return Dmg
end


function CastQ(unit)
  if (myHero:CanUseSpell(_Q) == READY and ValidTarget(unit, 650)) then
    CastSpell(_Q, unit)
  end
end

function CastW()
  if (myHero:CanUseSpell(_W) == READY) then
    CastSpell(_W)
  end  
end

function CastE(unit)
  if (myHero:CanUseSpell(_E) == READY and ValidTarget(unit, 625)) then
    CastSpell(_E, unit)
  end
end

function CastR(targetX, targetZ)
  if(myHero:CanUseSpell(_R) == READY) then
    CastSpell(_R, targetX, targetZ)
  end
end


function Buff_Add(unit, target, buff)
  if target then
    if not (unit.isMe or target.isMe) then return end
  else
    if not unit.isMe then return end
  end
  if (buff.name == "ireliahitenstylecharged" and unit.isMe) then
    HITEN = true
  end
  for i=1, 5 do
    if (buff.name == POTS[i] and unit.isMe) then
      REGEN = true
    end
  end
  for j = 1, #CCSPELLS do
    if target then
      if target.isMe and buff.name == CCSPELLS[j] then
        UNDERCC = true
      end
    end
  end
  for m = 1, #SHEENLIST do
    if unit.isMe and buff.name == SHEENLIST[m] then
      SHEENREADY = false
    end
  end
end

function Buff_Rem(unit, buff)
  if not unit.isMe then return end
  if (buff.name == "ireliahitenstylecharged" and unit.isMe) then
    HITEN = false
  end
  for i=1, 5 do
    if (buff.name == POTS[i] and unit.isMe) then
      REGEN = false
    end
  end
  for j = 1, #CCSPELLS do
    if unit.isMe and buff.name == CCSPELLS[j] then
      UNDERCC = false
    end
  end
end

function SpellBladeCD(unit, buff)
  if not unit.isMe then return end
  for i = 1, #SHEENLIST do
    if unit.isMe and buff.name == SHEENLIST[i] then
      SHEENREADY = false
      DelayAction(function() SHEENREADY = true end, 1.6)
    end
  end
end


function FindSlotByName(name)
  if name ~= nil then
    for i=0, 12 do
      if string.lower(myHero:GetSpellData(i).name) == string.lower(name) then
        return i
      end
    end
  end  
  return nil
end

function GetItem(name)
  local slot = FindSlotByName(name)
  return slot 
end


function GetRastoyanie(a, b)
  local rastoyanie = math.sqrt((b.x-a.x)*(b.x-a.x) + (b.z-a.z)*(b.z-a.z))
  return rastoyanie
end


function CheckFountain()
  if not GetGame().map.index == 15 then return end
  if myHero.team == 100 then
    local rastoyanieDown = math.sqrt((myHero.x-lowBase.x)*(myHero.x-lowBase.x) + (myHero.z-lowBase.z)*(myHero.z-lowBase.z))
    if rastoyanieDown < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  elseif myHero.team == 200 then
    local rastoyanieUp = math.sqrt((myHero.x-upBase.x)*(myHero.x-upBase.x) + (myHero.z-upBase.z)*(myHero.z-upBase.z))
    if rastoyanieUp < 900 then
      FONTAN = true
    else
      FONTAN = false
    end
  end
end

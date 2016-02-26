function Aktif()
    PrintChat("kUtility Aktif Edildi iyi Oyunlar ")
end

function OnLoad()
    Aktif()
end

function OnLoad()
  Menu = scriptConfig("Blitzcrank", "Blitzcrank")
  Menu:addSubMenu("[Blitzcrank - Skill Mesafeleri]", "drawings")
	Menu:addSubMenu("[Blitzcrank - Kombo Ayarlari]", "Combo")
	Menu:addSubMenu("[Blitzcrank - Diger Ayarlar]", "Others")
	Menu:addSubMenu("[Blitzcrank - Ulti Ayarlari]", "UltiOption")
Menu.Others:addParam("Autolevel", "Oto level Gelistirme", SCRIPT_PARAM_LIST, 1, {"Kapali", "Q>E>R>W", "Q>W>R>E"})
  Menu.drawings:addParam("Q", "Q Menzili", SCRIPT_PARAM_ONOFF, true)
  Menu.drawings:addParam("E", "E Menzili", SCRIPT_PARAM_ONOFF, true)
  Menu.drawings:addParam("R", "R Menzili", SCRIPT_PARAM_ONOFF, true)
	 Menu.Combo:addParam("useQ", "Q Kullan", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("useW", "W Kullan", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("useE", "E Kullan", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("useR", "R Kullan", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("useitems", "Item Kullan", SCRIPT_PARAM_ONOFF, true)
    Menu.Combo:addParam("ignite", "Tutustur Kullan", SCRIPT_PARAM_ONOFF, true)
		Menu.UltiOption:addParam("KsR", "Ulti ile Killcalma ", SCRIPT_PARAM_ONOFF, true)
		Menu.UltiOption:addParam("SilenceR", "Sessiz Ulti Modu ", SCRIPT_PARAM_ONOFF, true)

end
function OnDraw()
  if myHero.dead then return end
  if Menu.drawings.R then DrawCircle(myHero.x, myHero.y, myHero.z, 590, ARGB(25 , 255,0,0)) end
  if Menu.drawings.E then DrawCircle(myHero.x, myHero.y, myHero.z, 200, ARGB(25 , 255,0,0)) end
  if Menu.drawings.Q then DrawCircle(myHero.x, myHero.y, myHero.z, 900, ARGB(25 , 255,0,0)) end
end

levelSequence = {
        QE = {1,3,2,1,1,4,1,3,1,3,4,3,3,2,2,4,2,2},
        QW = {1,2,3,1,1,4,1,2,1,2,4,2,2,3,3,4,3,3}
}

function OnTick()

if myHero.dead then return end

if Menu.Others.Autolevel == 2 then

autoLevelSetSequence(QE)

elseif Menu.Others.Autolevel == 3 then

autoLevelSetSequence(QW)

else

autoLevelSetSequence(nil)

end
end
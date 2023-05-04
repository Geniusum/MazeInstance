-- MazeInstance OS Gui

-- Make GUI

-- Init wallpapers

wallpaper_1 = paintutils.loadImage("MazeInstance/assets/wallpaper_1.nfp")
icon_1 = paintutils.loadImage("MazeInstance/assets/icon_1.nfp")

function load_wallpaper_1()
    term.setCursorPos(1, 1)
    paintutils.drawImage(wallpaper_1, 1, 1)
end

function load_icon_1()
    term.setCursorPos(1, 1)
    paintutils.drawImage(icon_1, 1, 1)
end

load_wallpaper_1()
load_icon_1()

-- Init buttons

local button_menu = {}
button_menu.x = 1
button_menu.y = 19
button_menu.width = 4
button_menu.height = 1
button_menu.color = colors.orange
button_menu.text = " MI"
button_menu.textColor = colors.white

local bottom_bar = {}
bottom_bar.x = 5
bottom_bar.y = 19
bottom_bar.width = 46
bottom_bar.height = 1
bottom_bar.color = colors.yellow

function showDesktop()
  paintutils.drawFilledBox(button_menu.x, button_menu.y, button_menu.x + button_menu.width, button_menu.y + button_menu.height, button_menu.color)
  term.setCursorPos(button_menu.x + (button_menu.width - string.len(button_menu.text)) / 2, button_menu.y + button_menu.height / 2)
  term.setTextColor(button_menu.textColor)
  term.write(button_menu.text)
    
  paintutils.drawFilledBox(bottom_bar.x, bottom_bar.y, bottom_bar.x + bottom_bar.width, bottom_bar.y + bottom_bar.height, bottom_bar.color)
  
  local time = os.time()

  local formattedTime = string.format("%02d:%02d", math.floor(time / 3600) % 12, math.floor(time / 60) % 60)
  term.setCursorPos(46, 19)
  term.setTextColor(colors.black)
  term.write(formattedTime)
end

function clickHandler(event, x, y)
  if x >= button_menu.x and x <= button_menu.x + button_menu.width - 1 and y == button_menu.y + button_menu.height - 1 then
    -- Ajoutez ici le code à exécuter lorsque le bouton est cliqué
    print("Le bouton a été cliqué !")
  end
end

function main()
  showDesktop()
  while true do
    showDesktop()
    local event, p1, p2, p3, p4, p5 = os.pullEvent()
    if event == "mouse_click" then
      clickHandler(event, p2, p3)
    end
  end
end

main()

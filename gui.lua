-- MazeInstance OS Gui

-- Make GUI

-- Init wallpapers

wallpaper_1 = paintutils.loadImage("MazeInstance/assets/wallpaper_1.nfp")

function load_wallpaper_1()
    term.setCursorPos(1, 1)
    paintutils.drawImage(wallpaper_1, 1, 1)
end

load_wallpaper_1()

-- Init buttons

local button = {}
button.x = 1
button.y = 18
button.width = 3
button.height = 1
button.color = colors.yellow
button.text = "MI"
button.textColor = colors.black

function drawButton()
  paintutils.drawFilledBox(button.x, button.y, button.x + button.width, button.y + button.height, button.color)
  term.setCursorPos(button.x + (button.width - string.len(button.text)) / 2, button.y + button.height / 2)
  term.setTextColor(button.textColor)
  term.write(button.text)
end

function clickHandler(event, x, y)
  if x >= button.x and x <= button.x + button.width - 1 and y == button.y + button.height - 1 then
    -- Ajoutez ici le code à exécuter lorsque le bouton est cliqué
    print("Le bouton a été cliqué !")
  end
end

function main()
  drawButton()
  while true do
    local event, p1, p2, p3, p4, p5 = os.pullEvent()
    if event == "mouse_click" then
      clickHandler(event, p2, p3)
    end
  end
end

main()

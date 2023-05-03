-- MazeInstance OS Gui

-- Make GUI

-- Init wallpapers

wallpaper_1 = paintutils.loadImage("./assets/wallpaper_1.nfp")

function load_wallpaper_1()
    term.setCursorPos(1, 1)
    paintutils.drawImage(wallpaper_1, 1, 1)
end

load_wallpaper_1()

while true do
    i=1
end

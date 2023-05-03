-- MazeInstance OS Installer

print("MazeInstance OS Installer")

sleep(1)

-- Verification of rget existants

function file_exists(file)
    local f = io.open(file, "r")
    if f then
        f:close()
        return true
    end
    return false
end

rget_existants = file_exists("rget.lua")

if rget_existants == false then
    print("[INFO] Program missing : rget is not installed on your computer.")
    sleep(1)
    print("[INFO] Installation of rget.")
    print("")
    shell.run("wget get https://raw.githubusercontent.com/Geniusum/CraftOS_Programs/main/rget.lua rget.lua")
    print("")
    print("[INFO] rget has installed.")
end

-- Now rget is ready, go install the OS !

print("[INFO] Installation of OS...")
print("")

shell.run("rget Geniusum MazeInstance OS startup.lua startup.lua")
shell.run("mkdir MazeInstance")    
shell.run("cd MazeInstance")
shell.run("mkdir system lib update files assets")
shell.run("cd update")
shell.run("copy ../../rget.lua .")
shell.run("rget Geniusum MazeInstance OS updater.lua updater.lua")
shell.run("cd ..")
shell.run("cd lib")
shell.run("../../rget.lua Geniusum MazeInstance OS lib-const-var.lua const_var.lua")
shell.run("cd ..")
shell.run("cd assets")
shell.run("../../rget.lua Geniusum MazeInstance OS wallpaper_1 wallpaper_1.nfp")
shell.run("cd ..")
shell.run("cd system")
shell.run("../../rget.lua Geniusum MazeInstance OS gui.lua gui.lua")
shell.run("../../rget.lua Geniusum MazeInstance OS start.lua start.lua")

print("")
print("[INFO] Installation completed !")
print("")
sleep(0.8)

print("[INFO] Running OS...")
shell.run("system/start.lua")

-- MazeInstance OS Updater


print("MazeInstance OS Updater")

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

-- Now rget is ready, go update the OS !

print("[INFO] Update of OS...")

shell.run("cd ../../")
shell.run("delete MazeInstance")
shell.run("mkdir MazeInstance")    
shell.run("cd MazeInstance")
shell.run("mkdir system lib update files assets")
shell.run("cd update")
shell.run("copy ../../rget.lua .")
shell.run("rget Geniusum MazeInstance OS updater.lua updater.lua")
shell.run("cd ..")

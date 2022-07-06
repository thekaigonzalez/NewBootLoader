require "sysmgr.external" -- Include()
local yaml = require("include.yaml")

package.cpath = package.cpath .. ";cons/?.so"
local lfs = require "lfs"

local recs = {}

function string.starts(String,Start)
    return string.sub(String,1,string.len(Start))==Start
 end
 

for file in lfs.dir('recipes/') do
    print(file==".")
    if (not string.starts(file, ".")) then
        table.insert (recs, file)
    end
end

local Actions = require "sysmgr.action_mgr" -- Action()
local color = Include "colorLib"
local menu = Include "libmenu"
local rpy = Include "librecipy"
local prompt = Include "prompted"

local system = {}

function system:failure(msg)
    print("\27[31mExiting:\27[0m " .. msg)
    os.exit(-1)
end

Actions:Action('LegacySetup', function ()
    print("Welcome to the legacy setup!")
    print("Type the name of a recipe to run.")
    io.write("recipe> ")
    local s = io.read()

    local repice = rpy:RecipeSkel(s)

    print(repice.name)

end)

function system:_expose()
    print("Welcome to the " .. color:colorful("New Boot Loader!"))

    print("How would you like to install a system?\n")

    menu.file = "share/menu.yml"

    menu:sequence() -- Show the menu

    local choice = prompt(">")

    
    if tonumber(choice) == nil then
        system:failure("option must be a number")
    end

    -- If it's more than one character (most likely not a number)
    if #choice > 1 then
        system:failure("only one character input allowed.")
    end

    -- If the choice is out of range
    if #choice > menu.pos then
        system:failure("Only options between 1-" .. tostring(menu.pos))
    end

    Actions:RunAction(menu.cltor[choice])
end

function system:start()
    system:_expose()
end

return system

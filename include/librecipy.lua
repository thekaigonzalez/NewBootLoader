-- Recipy, the utility to construct build systems for bootloader systems.
-- Essentially, the "docker" of Kux.

local yml = Include "yaml"

local rpy = {}

function rpy:RecipeSkel(name)
    -- returns a basis of a recipe file (Shared)

    local f = io.open("recipes/" .. name .. ".yml", "r")

    local skel = {}

    if (f ~= nil) then
        local skeleton = yml.eval(f:read())

        skel['name'] = skeleton['info']['name']
        skel['desc'] = skeleton['info']['desc']

        skel['instructions'] = skeleton['instructions']

        skel['type'] = skeleton['info']['type']
    end

    return skel
end

--[[ Typical functions ]]
function rpy:DispName(name)
    return rpy:RecipeSkel(name).name or nil
end

function rpy:Description(name)
    return rpy:RecipeSkel(name).desc or nil
end

function rpy:Instructions(name)
    return rpy:RecipeSkel(name).instructions or nil
end

function rpy:Type(name)
    return rpy:RecipeSkel(name).type or nil
end

return rpy

-- CoLoRiZe your terminal!
-- (Written for NBL)

-- Based on Colorama

--[[

Reference:

BLACK           = 30
RED             = 31
GREEN           = 32
YELLOW          = 33
BLUE            = 34
MAGENTA         = 35
CYAN            = 36
WHITE           = 37
RESET           = 39

]]
local lib = {}


function lib:colorful(string)
    local final = ""
    string:gsub(".", function(c)
        -- Pop Random Numbers
        math.random(); math.random(); math.random()
        local color = math.random(31, 36)
        final = final .. "\27[" .. tostring(color) .. "m" .. c .. "\27[0m"
    end)
    return final
end

return lib

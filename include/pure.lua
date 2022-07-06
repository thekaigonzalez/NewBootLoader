-- PuRE

-- Organic filesystem functions

-- inspired by file.lua

---@diagnostic disable: need-check-nil

---@diagnostic disable-next-line: lowercase-global
function copy(src, dest)
    local f = io.open(src, "r")
    
    local content = f:read "a"
    
    local f2 = io.open(dest, "w")

    f2:write(content)

    f:close()
    f2:close()
end
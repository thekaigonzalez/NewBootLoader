local menu = {}

menu.file = ""
menu.pos = 0
menu.cltor = {}

function menu:sequence()
    local yl = Include "yaml"

    local f = io.open(menu.file) or nil

    if (f == nil) then
        print("error: can not continue, `skel' menu.yml not found.")
    else
        local menu_meta = yl.eval(f:read("a"))

        for k, _ in pairs(menu_meta["entries"]) do
            local tab = menu_meta["entries"][k]
            menu.pos = menu.pos + 1

            --- Display menu items and add them to the collector
            local position = tostring(menu.pos)
            print("[" .. position .. "]: " .. tab["description"])

            menu.cltor[position] = tab["action"]

        end
    end
end

return menu

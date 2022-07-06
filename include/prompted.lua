return function (text)
    io.write(text .. " ")
    local success,result = pcall(function ()
        local input = io.read()

        return input
    end)

    if success then
        return result
    end
end
local amgvm = {}

amgvm.__actions = {}

-- Quick Hook manager

function amgvm:Action(name, cb)
    amgvm.__actions[name] = cb
end

function amgvm:RunAction(name)
    amgvm.__actions[name]()
    -- if not pcall(function() amgvm.__actions[name]();end)then print("hook return error");end
end

return amgvm
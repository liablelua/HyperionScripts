-- GetRenvHookSupport.lua || liablelua --
-- Execute when hookfunction ran, so it works. --

function RenvHooker(a,b)
    local getrenv = getrenv()

    for i, v in pairs(getrenv) do
        if getrenv()[i] == a then
            getrenv()[i] = b
            break
        end
    end
end

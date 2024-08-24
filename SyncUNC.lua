_G.realLS = function() error("Loadstring failed") end

assert(a, b) = function()
    if a == nil or a == false then
        error(b)
    end
end

loadstring = function(txt)
    local ask = "loadstring,"..code
    local Request = request({
        Url = "http://localhost:3000",
        Method = "POST",
        Body = ask
    })
    return _G.realLS
end

loadfile = function(file)
    return loadstring(readfile(file))
end

identifyexecutor = function()
    return "Sync", "v1.0"
end

getexecutorname = function()
    return "Sync"
end

getexecutorversion = function()
    return "v1.0"
end

_G.realLS = function() error("Loadstring failed") end

getgenv().assert = function(a, b)
    if a == nil or a == false then
        error(b)
    end
end

getgenv().loadstring = function(txt)
    local ask = "loadstring,"..code
    local Request = request({
        Url = "http://localhost:3000",
        Method = "POST",
        Body = ask
    })
    return _G.realLS
end

getgenv().consolecreate = function()
    local ask = "consolecreate,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

getgenv().consoledestroy = function()
    local ask = "consoledestroy,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

getgenv().consoleclear = function()
    local ask = "consoleclear,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

getgenv().consoleinput = function()
    local ask = "consoleinput,"
    return request({
        Url = server,
        Method = "POST",
        Body = ask
    }).Body
end

getgenv().consoleprint = function(print)
    local ask = "consoleprint,"..print
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

getgenv().consolesettitle = function(title)
    local ask = "consolesettitle,"..title
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

getgenv().loadfile = function(file)
    return loadstring(readfile(file))
end

getgenv().identifyexecutor = function()
    return "Sync", "v1.0"
end

getgenv().getexecutorname = function()
    return "Sync"
end

getgenv().getexecutorversion = function()
    return "v1.0"
end

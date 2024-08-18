local HttpService = game:GetService("HttpService")
local server = "http://localhost:3000/"

writefile = function(path, content)
    local ask = "writefile,"..path..","..content
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

deletefile = function(path)
    local ask = "deletefile,"..path
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

delfile = deletefile

isfile = function(path)
    local ask = "isfile,"..path
    local File = request({
        Url = server,
        Method = "POST",
        Body = ask
    })
    if File.Body == "1" then return true else return false end
end

function HttpGet(string) -- temporary
    return request({
        Url = string,
        Method = "GET"
    }).Body
end

-- Init

local HttpService = game:GetService("HttpService")
local server = "http://localhost:3000/"

-- Modules

local syn = {}

-- Variables

local clones = {}
local protected = {}
local hui = Instance.new("Folder")
hui.Name = '\0'


-- Globals

_G.loadstringFunc = function() end

-- Functions

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

makefolder = function(path)
    local ask = "makefolder,"..path
    local File = request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

isfolder = function(path)
    local ask = "isfolder,"..path
    local File = request({
        Url = server,
        Method = "POST",
        Body = ask
    })
    if File.Body == "1" then return true else return false end
end

readfile = function(path)
    local ask = "readfile,"..path
    local File = request({
        Url = server,
        Method = "POST",
        Body = ask
    })
    return File.Body
end

appendfile = function(path, content)
    local ask = "appendfile,"..path..","..content
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

deletefolder = function(path)
    local ask = "deletefolder,"..path
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

delfolder = deletefolder

listfiles = function(path)
    local ask = "listfiles,"..path
    local Request = request({
        Url = server,
        Method = "POST",
        Body = ask
    }).Body
    local table1 = {}
    local Files = string.split(Request, ",")
    for i, v in pairs(Files) do
        table.insert(table1, v)
    end
    return table1
end

loadfile = function(path)
    return loadstring(readfile(path))()
end

consolecreate = function()
    local ask = "consolecreate,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

consoledestroy = function()
    local ask = "consoledestroy,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

consoleclear = function()
    local ask = "consoleclear,"
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

consoleinput = function()
    local ask = "consoleinput,"
    return request({
        Url = server,
        Method = "POST",
        Body = ask
    }).Body
end

consoleprint = function(print)
    local ask = "consoleprint,"..print
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

consolesettitle = function(title)
    local ask = "consolesettitle,"..title
    request({
        Url = server,
        Method = "POST",
        Body = ask
    })
end

identifyexecutor = function()
    return "Sync", "v1.0"
end

loadstring = function(code)
    local ask = "loadstring,"..code
    local Request = request({
        Url = server,
        Method = "POST",
        Body = ask
    })
    return _G.loadstringFunc
end

cloneref = function(x)
    return x
end

gethui = function()
	local s, H = pcall(function()
		return game:GetService("CoreGui").RobloxGui
	end)
	if H then
		if not hui.Parent then
			hui.Parent = H.Parent
		end
		return hui
	else
		if not hui.Parent then
			hui.Parent = game:GetService("Players").LocalPlayer.PlayerGui
		end
	end
	return hui
end

syn.protect_gui = function(gui)
    if protected[gui] == nil then
        protected[gui] = {
            Gui = gui,
            Name = gui.Name,
            Parent = gui.Parent
        }
    
        gui.Name = HttpService:GenerateGuid()
    
        gui.Parent = gethui()
    end
end

syn.unprotect_gui = function(gui)
    if protected[gui] ~= nil then
        gui.Name = protected[gui].Name
        gui.Parent = protected[gui].Parent
        protected[gui] = nil
    end
end

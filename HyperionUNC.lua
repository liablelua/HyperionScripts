--// Hyperion UNC \\--

local Version = "1.0.0"

-- Standard

function identifyexecutor()
    return "Hyperion", Version
end

function printidentity()
    number = string.match(getidentity(),"%d+")
    return tonumber(number)
end

-- Clipboard

local VIM = Instance.new("VirtualInputManager")
local Clipboard = Instance.new("ScreenGui")
local ClipboardBox = Instance.new('TextBox', ClipboardUI)
ClipboardBox.Position = UDim2.new(math.huge(), 0, math.huge(), 0)
local ClipboardQueue = Queue.new()

setclipboard = function(data)
	repeat task.wait() until ClipboardQueue:Current()[1] == data or ClipboardQueue:IsEmpty()
	ClipboardQueue:Queue(data)
	local old = game:GetService("UserInputService"):GetFocusedTextBox()
	local copy = ClipboardQueue:Current()[1]
	ClipboardBox:CaptureFocus()
	ClipboardBox.Text = copy
	local KeyCode = Enum.KeyCode
	local Keys = {KeyCode.RightControl, KeyCode.A}
	local Keys2 = {KeyCode.RightControl, KeyCode.C, KeyCode.V}

	for _, v in ipairs(Keys) do
		vim:SendKeyEvent(true, v, false, game)
		task.wait()
	end

	for _, v in ipairs(Keys) do
		vim:SendKeyEvent(false, v, false, game)
		task.wait()
	end

	for _, v in ipairs(Keys2) do
		vim:SendKeyEvent(true, v, false, game)
		task.wait()
	end

	for _, v in ipairs(Keys2) do
		vim:SendKeyEvent(false, v, false, game)
		task.wait()
	end

	ClipboardBox.Text = ''
	if old then old:CaptureFocus() end
	task.wait(.20)
	ClipboardQueue:Update()
end

-- Cloneref

cloneref = function(clone)
    return clone
end

-- get shit

local renv = {
	print, warn, error, assert, collectgarbage, load, require, select, tonumber, tostring, type, xpcall, pairs, next, ipairs,
	newproxy, rawequal, rawget, rawset, rawlen, setmetatable, PluginManager,
	coroutine.create, coroutine.resume, coroutine.running, coroutine.status, coroutine.wrap, coroutine.yield,
	bit32.arshift, bit32.band, bit32.bnot, bit32.bor, bit32.btest, bit32.extract, bit32.lshift, bit32.replace, bit32.rshift, bit32.xor,
	math.abs, math.acos, math.asin, math.atan, math.atan2, math.ceil, math.cos, math.cosh, math.deg, math.exp, math.floor, math.fmod, math.frexp, math.ldexp, math.log, math.log10, math.max, math.min, math.modf, math.pow, math.rad, math.random, math.randomseed, math.sin, math.sinh, math.sqrt, math.tan, math.tanh,
	string.byte, string.char, string.find, string.format, string.gmatch, string.gsub, string.len, string.lower, string.match, string.pack, string.packsize, string.rep, string.reverse, string.sub, string.unpack, string.upper,
	table.concat, table.insert, table.pack, table.remove, table.sort, table.unpack,
	utf8.char, utf8.charpattern, utf8.codepoint, utf8.codes, utf8.len, utf8.nfdnormalize, utf8.nfcnormalize,
	os.clock, os.date, os.difftime, os.time,
	delay, elapsedTime, require, spawn, tick, time, typeof, UserSettings, version, wait,
	task.defer, task.delay, task.spawn, task.wait,
	debug.traceback, debug.profilebegin, debug.profileend
}

if getgenv().getrenv and #getgenv().getrenv() == 0 or not getgenv().getrenv then
	getgenv().getrenv = nil
	getgenv().getrenv = function() -- Override incognito's getrenv
		return renv -- couldn't think of a better way to implement it
	end
end

local getgenv = getgenv or function() return getfenv(1) end
getgenv().getgenv = getgenv

-- file system (requires running hyperion as admin to run the server)

local HttpService = game:GetService("HttpService")
local server = "http://localhost:3000/"

writefile = function(path, content)
    local ask = "writefile,"..path..","..content
    HttpService:PostAsync(server, ask)
    print('test')
end

print("✅ Testing Finished")

--\\ Hyperion UNC //--

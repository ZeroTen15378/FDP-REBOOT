local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

OrionLib:MakeNotification({
	Name = "脚本加载完毕！：",
	Content = "Modified By ZT(Current Owner)",
	Image = "rbxassetid://4483345998",
	Time = 5
})

local Window = OrionLib:MakeWindow({Name = "ZT-SH", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest", IntroText = "UPDATED ALPHA 1"})

local Tab1 = Window:MakeTab({
    Name = "通用功能",
    Icon = "rbxassetid://7733960981",
    PremiumOnly = false
})

Tab1:AddSlider({
	Name = "移动速度",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "速度",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
		game.Players.LocalPlayer.Character.HumanoidRootPart.CustomPhysicalProperties = PhysicalProperties.new(9e99, 9e99, 9e99, 9e99, 9e99)
	end    
})

Tab1:AddSlider({
	Name = "跳跃力度",
	Min = 0,
	Max = 500,
	Default = 16,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "大小",
	Callback = function(Value)
		game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
	end    
})

Tab1:AddSlider({
	Name = "地图重力",
	Min = 0,
	Max = 500,
	Default = 126,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "大小",
	Callback = function(Value)
	    game.Workspace.Gravity = Value
	end    
})

Tab1:AddSlider({
	Name = "角色生命",
	Min = 0,
	Max = 500,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "生命",
	Callback = function(Value)
	    wuhughiusahiwu = Value
		game.Players.LocalPlayer.Character.Humanoid.Health = Value
	end    
})

Tab1:AddToggle({
    Name = "锁定生命",
	Default = false,
	Callback = function(Value)
	    while Value == true do
		    wait(1)
		    if Value == true then
	    	    game.Players.LocalPlayer.Character.Humanoid.Health = wuhughiusahiwu
			end
		end
	end
})

Tab1:AddSlider({
	Name = "视野缩放",
	Min = 0,
	Max = 500,
	Default = 52,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "缩放",
	Callback = function(Value)
	    wuhu123ghiusahiwu = Value
		game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = Value
	end    
})

Tab1:AddToggle({
    Name = "锁定缩放",
    Callback = function(Value)
	    while Value == true do
		    wait(1)
			if Value == true then
			    game:GetService("Players").LocalPlayer.CameraMaxZoomDistance = wuhu123ghiusahiwu
			end
		end
    end    
})

Tab1:AddSlider({
	Name = "甩人力度",
	Min = 0,
	Max = 1000,
	Default = 0,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "甩人力度",
	Callback = function(Value)
		swdawdpower = Value
	end    
})

Tab1:AddToggle({
    Name = "甩人",
	Default = false,
    Callback = function(Value)
	    swdawdt = Value
		while swdawdt == true do
			wait(1)
			if swdawdt == true then
		        power = swdawdpower
     		    game:GetService("RunService").Stepped:connect(function()
      		    game.Players.LocalPlayer.Character.Head.CanCollide = false
      		    game.Players.LocalPlayer.Character.Torso.CanCollide = false
       		    game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
       		    game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
       		    end)
       		    wait(1)
       		    local bambam = Instance.new("BodyThrust")
       	    	bambam.Parent = game.Players.LocalPlayer.Character.HumanoidRootPart
       		    bambam.Force = Vector3.new(power,0,power)
      	    	bambam.Location = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
			end
        end
    end
})

Tab1:AddTextbox({
    Name = "范围",
    Default = "",
    TextDisappear = true,
    Callback = function(Value)
        _G.HeadSize = Value
        _G.Disabled = true
        game:GetService("RunService").RenderStepped:connect(function()
        if _G.Disabled then
            for i,v in next, game:GetService("Players"):GetPlayers() do
                if v.Name ~= game:GetService("Players").LocalPlayer.Name then
                pcall(function()
                    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)
                    v.Character.HumanoidRootPart.Transparency = 0.7
                    v.Character.HumanoidRootPart.CanCollide = false
                    end)
                    end
                end
            end
        end)
    end   
})

Tab1:AddButton({
    Name = "连跳",
	Callback = function()
	    game:GetService("UserInputService").JumpRequest:connect(function()
		    game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")		
	    end)
	end
})
	   
Tab1:AddButton({
    Name = "夜视",
    Callback = function()
        local lighting = game.Lighting
        lighting.Brightness = 2
        lighting.ClockTime = 14
        lighting.FogEnd = 100000
        lighting.GlobalShadows = false
        lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
    end    
})

Tab1:AddButton({
    Name = "优化帧数",
	Callback = function()
	    local ToDisable = {
        Textures = true,
        VisualEffects = true,
        Parts = true,
        Particles = true,
        Sky = true
        }

        local ToEnable = {
        FullBright = false
        }

        local Stuff = {}
        
        for _, v in next, game:GetDescendants() do
            if ToDisable.Parts then
                if v:IsA("Part") or v:IsA("Union") or v:IsA("BasePart") then
                    v.Material = Enum.Material.SmoothPlastic
                    table.insert(Stuff, 1, v)
                end
            end
          
            if ToDisable.Particles then
                if v:IsA("ParticleEmitter") or v:IsA("Smoke") or v:IsA("Explosion") or v:IsA("Sparkles") or v:IsA("Fire") then
                    v.Enabled = false
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.VisualEffects then
                if v:IsA("BloomEffect") or v:IsA("BlurEffect") or v:IsA("DepthOfFieldEffect") or v:IsA("SunRaysEffect") then
                    v.Enabled = false
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.Textures then
                if v:IsA("Decal") or v:IsA("Texture") then
                    v.Texture = ""
                    table.insert(Stuff, 1, v)
                end
            end
            
            if ToDisable.Sky then
               if v:IsA("Sky") then
                    v.Parent = nil
                    table.insert(Stuff, 1, v)
                end
                    end
        end
        
        game:GetService("TestService"):Message("Effects Disabler Script : Successfully disabled "..#Stuff.." assets / effects. Settings :")
        
        for i, v in next, ToDisable do
            print(tostring(i)..": "..tostring(v))
        end
        if ToEnable.FullBright then
            local Lighting = game:GetService("Lighting")
            Lighting.FogColor = Color3.fromRGB(255, 255, 255)
            Lighting.FogEnd = math.huge
            Lighting.FogStart = math.huge
            Lighting.Ambient = Color3.fromRGB(255, 255, 255)
            Lighting.Brightness = 5
            Lighting.ColorShift_Bottom = Color3.fromRGB(255, 255, 255)
            Lighting.ColorShift_Top = Color3.fromRGB(255, 255, 255)
            Lighting.OutdoorAmbient = Color3.fromRGB(255, 255, 255)
            Lighting.Outlines = true
        end
    end
})

Tab1:AddButton({
    Name = "传送工具",
	Callback = function()
	    mouse = game.Players.LocalPlayer:GetMouse()
        tool = Instance.new("Tool")
        tool.RequiresHandle = false
        tool.Name = "Click Teleport"
        tool.Activated:connect(
        function()
            local pos = mouse.Hit + Vector3.new(0, 2.5, 0)
            pos = CFrame.new(pos.X, pos.Y, pos.Z)
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
        end)
        tool.Parent = game.Players.LocalPlayer.Backpack
    end
})

local Tab2 = Window:MakeTab({
    Name = "绘制自瞄",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab2:AddButton({
    Name = "绘制",
    Callback = function()
        loadstring(game:HttpGet(("https://pastebin.com/raw/vTTE8LhN")))()
    end
})

Tab2:AddSlider({
	Name = "自瞄距离",
	Min = 1,
	Max = 1000,
	Default = 100,
	Color = Color3.fromRGB(255,255,255),
	Increment = 1,
	ValueName = "自瞄距离",
	Callback = function(Value)
		AimbotDistance = Value
    end    
})
Tab2:AddToggle({
    Name = "队伍检测",
	Default = false,
    Callback = function(Value)
        AimbotTeamCheak = Value
    end
})
Tab2:AddToggle({
    Name = "右键自瞄",
	Default = false,
    Callback = function (Value)
        local Camera = workspace.CurrentCamera
        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local TweenService = game:GetService("TweenService")
        local LocalPlayer = Players.LocalPlayer
        local Holding = false
        local AimbotT = Value
        
        _G.AimbotEnabled = AimbotT
        _G.TeamCheck = AimbotTeamCheak -- If set to true then the script would only lock your aim at enemy team members.
        _G.AimPart = "Head" -- Where the aimbot script would lock at.
        _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
        
        local function GetClosestPlayer()
        local MaximumDistance = AimbotDistance
        local Target = nil
          
        coroutine.wrap(function()
            wait(20); MaximumDistance = AimbotDistance -- Reset the MaximumDistance so that the Aimbot doesn't remember it as a very small variable and stop capturing players...
        end)()
        
        for _, v in next, Players:GetPlayers() do
        	if v.Name ~= LocalPlayer.Name then
        		if _G.TeamCheck == true then
        			if v.Team ~= LocalPlayer.Team then
        				if v.Character ~= nil then
        					if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
        						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
        							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
        							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
        								
       								if VectorDistance < MaximumDistance then
       									Target = v
                       					MaximumDistance = VectorDistance
        							end
        						end
        					end
        				end
        			end
        		else
        			if v.Character ~= nil then
        				if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
       						if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
       							local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
       							local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
   							
							    if VectorDistance < MaximumDistance then
        							Target = v
                       					MaximumDistance = VectorDistance
        						end
        					end
        				end
        			end
        		end
        	end
        end
        return Target
        end
        
        UserInputService.InputBegan:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = true
            end
        end)
        
        UserInputService.InputEnded:Connect(function(Input)
            if Input.UserInputType == Enum.UserInputType.MouseButton2 then
                Holding = false
            end
        end)
        
        RunService.RenderStepped:Connect(function()
            if Holding == true and _G.AimbotEnabled == true then
                TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
            end
        end)
    end
})

local Tab3 = Window:MakeTab({
    Name = "监狱人生",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab3:AddDropdown({
    Name = "阵容",
    Default = "",
    Options = {"警察","囚犯","罪犯"},
    Callback = function(Value)
        if Value == "警察" then
            workspace.Remote.TeamEvent:FireServer("Bright blue")
        elseif Value == "囚犯" then
            workspace.Remote.TeamEvent:FireServer("Bright orange")
        elseif Value == "罪犯" then
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976.125183, 109.123924, 2059.99536)
        end
    end
})

Tab3:AddButton({
    Name = "逮捕罪犯（警察）",
    Callback = function()
        local Player = game.Players.LocalPlayer
        local cpos = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
        if v.Name ~= Player.Name then
            local i = 10
            repeat
            wait(1)
            i = i-1
            game:GetService("Workspace").Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
            Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
            until i == 0
        end
        end
        Player.Character.HumanoidRootPart.CFrame = cpos
    end
})
Tab3:AddButton({
    Name = "添加近战武器",
	Callback = function()
		local replicatedStorage = game:GetService("ReplicatedStorage")
        		local players = game:GetService("Players")
		local localPlayer = players.LocalPlayer
        
		local tools = replicatedStorage.Tools:GetChildren()
        
		for _, tool in pairs(tools) do
        local newTool = tool:Clone()
  		newTool.Parent = localPlayer.Backpack
        end
	end
})
Tab3:AddButton({
    Name = "隐身",
    Callback = function()
        local player = game.Players.LocalPlayer
        position = player.Character.HumanoidRootPart.Position
        wait(1)
        player.Character:MoveTo(position + Vector3.new(0, 1000000, 0))
        wait(1)
        humanoidrootpart = player.Character.HumanoidRootPart:clone()
        wait(1)
        player.Character.HumanoidRootPart:Destroy()
        humanoidrootpart.Parent = player.Character
        player.Character:MoveTo(position)
        wait(1)
        game.Players.LocalPlayer.Character.Torso.Transparency = 1
        game.Players.LocalPlayer.Character.Head.Transparency  = 1
        game.Players.LocalPlayer.Character["Left Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Arm"].Transparency = 1
        game.Players.LocalPlayer.Character["Left Leg"].Transparency = 1
        game.Players.LocalPlayer.Character["Right Leg"].Transparency = 1
        game.Players.LocalPlayer.Character.Humanoid:RemoveAccessories()
        game.Players.LocalPlayer.Character.Head.face:Remove()
    end
        })

Tab3:AddButton({
	Name = "PrizzLife",
	Callback = function()
      		loadstring(game:HttpGet('https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua'))()
  	end    
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]
})

--[[
Name = <string> - The name of the button.
Callback = <function> - The function of the button.
]]

local Tab4 = Window:MakeTab({
    Name = "Race Clicker",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab4:AddParagraph("自动挂机要先开启Auto Race","")

Tab4:AddToggle({
    Name = "自动挂机",
    Default = false,
    Callback = function(Value)
		AutoAFK1145wt = Value
		while AutoAFK1145wt == true do
		    wait(0.5)
			if AutoAFK1145wt == true then
	    		local Tp1 = game:GetService("Players")
    			local Tp2 = Tp1.LocalPlayer.Character.HumanoidRootPart
    			local Tp3 = CFrame.new(-442200, 4, 4)
				Tp2.CFrame = Tp3    
			end
		end
    end    
})

local Tab5 = Window:MakeTab({
    Name = "俄亥俄州",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab5:AddButton({
	Name = "ZT-Ohio",
	Callback = function()
      		loadstring(game:HttpGet("https://raw.githubusercontent.com/ZeroTen15378/FDP-REBOOT/refs/heads/main/FDP%20OHIO.LUA"))()
  	end    
})

local Tab6 = Window:MakeTab({
    Name = "脚本中心",
    Icon = "rbxassetid://4483345998",
    PremiumOnly = false
})

Tab6:AddButton({
	Name = "情云",
	Callback = function()
      		loadstring(utf8.char((function() return table.unpack({108,111,97,100,115,116,114,105,110,103,40,103,97,109,101,58,72,116,116,112,71,101,116,40,34,104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,67,104,105,110,97,81,89,47,45,47,109,97,105,110,47,37,69,54,37,56,51,37,56,53,37,69,52,37,66,65,37,57,49,34,41,41,40,41})end)()))()
  	end    
})
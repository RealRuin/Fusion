if game:GetService("CoreGui"):FindFirstChild("FUSION") then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Fusion",
        Text = "Fusion is already loaded",
        Duration = 3
    })
    return
end

local exec, ver = identifyexecutor()

task.wait()

if exec == nil then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Fusion";
        Text = "Use an executor";
        Duration = 5
    })
    return
end

local Bracket = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Bracket/main/BracketV33.lua"))()

local CoreGui = game:GetService("CoreGui")

local Fusion = nil

for _, gui in ipairs(CoreGui:GetChildren()) do
    if gui:IsA("ScreenGui") and gui.Name:match("^Bracket ") then
        Fusion = gui
        break
    end
end

local Window = Bracket:Window({Name = "Fusion v0.3 | " .. game.Players.LocalPlayer.DisplayName,Enabled = true,Color = Color3.new(1,0.5,0.25),Size = UDim2.new(0,496,0,496),Position = UDim2.new(0.5,-248,0.5,-248)}) do

    local Tab = Window:Tab({Name = "Main"}) do

        local ScriptSection = Tab:Section({Name = "Scripts"}) do

            ScriptSection:Label({Text = "Universal scripts for just about any game"})

            ScriptSection:Button({Name = "Infinite Yield",Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end})

            ScriptSection:Button({Name = "Dex++",Callback = function()
                loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))() end})
        end

        local PlayerSection = Tab:Section({Name = "Player",Side = "Left"}) do

            PlayerSection:Toggle({Name = "Animate",Value = game.Players.LocalPlayer.Character.Animate.Enabled,Callback = function(bool)
                game.Players.LocalPlayer.Character.Animate.Enabled = bool end})

            PlayerSection:Toggle({Name = "UseJumpPower",Value = game.Players.LocalPlayer.Character.Humanoid.UseJumpPower,Callback = function(bool)
                game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = bool end})

            PlayerSection:Toggle({Name = "DevEnableMouseLock",Value = game.Players.LocalPlayer.DevEnableMouseLock,Callback = function(bool)
                game.Players.LocalPlayer.DevEnableMouseLock = bool end})

            PlayerSection:Slider({Name = "HipHeight",Min = 0,Max = 200,Precise = 1,Value = game.Players.LocalPlayer.Character.Humanoid.HipHeight,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.HipHeight = value end})

            PlayerSection:Slider({Name = "JumpPower",Min = 0,Max = 200,Precise = 1,Value = game.Players.LocalPlayer.Character.Humanoid.JumpPower,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = value end})

            PlayerSection:Slider({Name = "JumpHeight",Min = 0,Max = 200,Precise = 1,Value = game.Players.LocalPlayer.Character.Humanoid.JumpHeight,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value end})

            PlayerSection:Slider({Name = "WalkSpeed",Min = 0,Max = 200,Precise = 1,Value = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value end})

            PlayerSection:Slider({Name = "MaxSlopeAngle",Min = 0,Max = 90,Precise = 1,Value = game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.MaxSlopeAngle = value end})

            PlayerSection:Button({Name = "Set Health To 0",Callback = function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0 end})

            PlayerSection:Button({Name = "Teleport To FPDH",Callback = function()
                local FPDH = game.Workspace.FallenPartsDestroyHeight + 4
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, FPDH, 0) end})
        end

        local ESPSection = Tab:Section({Name = "Visuals",Side = "Left"}) do

            ESPSection:Toggle({Name = "Player Highlights",Value = false,Callback = function(bool)
                if bool then
                    for _, plr in pairs(game.Players:GetChildren()) do
                        if plr ~= game.Players.LocalPlayer then
                            local esp = Instance.new("Highlight")
                            esp.Parent = plr.Character
                            esp.Name = "FusionEsp"
                            esp.FillColor = Color3.fromRGB(0,0,255)
                        end
                    end
                else
                    for _, plr in pairs(game.Players:GetChildren()) do
                        if plr ~= game.Players.LocalPlayer then
                            plr.Character:FindFirstChild("FusionEsp"):Destroy()
                        end
                    end
                end
            end})
        end

        local WorkspaceSection = Tab:Section({Name = "Workspace",Side = "Left"}) do

            WorkspaceSection:Toggle({Name = "StreamingEnabled",Value = game.Workspace.StreamingEnabled,Callback = function(bool)
                game.Workspace.StreamingEnabled = bool end})

            WorkspaceSection:Slider({Name = "Gravity",Min = 0,Max = 250,Precise = 1,Value = game.Workspace.Gravity,Callback = function(value)
                game.Workspace.Gravity = value end})

            WorkspaceSection:Dropdown({Name = "LuauTypeCheckMode",List = {
                {
                    Name = "Default",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.LuauTypeCheckMode = Enum.LuauTypeCheckMode.Default
                    end
                },
                {
                    Name = "NoCheck",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.LuauTypeCheckMode = Enum.LuauTypeCheckMode.NoCheck
                    end
                },
                {
                    Name = "Nonstrict",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.LuauTypeCheckMode = Enum.LuauTypeCheckMode.Nonstrict
                    end
                },
                {
                    Name = "Strict",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.LuauTypeCheckMode = Enum.LuauTypeCheckMode.Strict
                    end
                }
            }})
        end

        local LightingSection = Tab:Section({Name = "Lighting"}) do

            local h,s,v = game.Lighting.Ambient:ToHSV()

            LightingSection:Colorpicker({Name = "Ambient",Value = {h,s,v,0,false},Callback = function(hsvar,color)
                game.Lighting.Ambient = color end})

            local h1,s1,v1 = game.Lighting.ColorShift_Bottom:ToHSV()

            LightingSection:Colorpicker({Name = "ColorShift_Bottom",Value = {h1,s1,v1,0,false},Callback = function(hsvar,color)
                game.Lighting.ColorShift_Bottom = color end})

            local h2,s2,v2 = game.Lighting.ColorShift_Top:ToHSV()

            LightingSection:Colorpicker({Name = "ColorShift_Top",Value = {h2,s2,v2,0,false},Callback = function(hsvar,color)
                game.Lighting.ColorShift_Top = color end})

            local h3,s3,v3 = game.Lighting.OutdoorAmbient:ToHSV()

            LightingSection:Colorpicker({Name = "OutdoorAmbient",Value = {h3,s3,v3,0,false},Callback = function(hsvar,color)
                game.Lighting.OutdoorAmbient = color end})

            local h4,s4,v4 = game.Lighting.FogColor:ToHSV()

            LightingSection:Colorpicker({Name = "FogColor",Value = {h4,s4,v4,0,false},Callback = function(hsvar,color)
                game.Lighting.FogColor = color end})

            local h5,s5,v5 = game.Lighting.ShadowColor:ToHSV()

            LightingSection:Colorpicker({Name = "ShadowColor",Value = {h5,s5,v5,0,false},Callback = function(hsvar,color)
                game.Lighting.ShadowColor = color end})

            LightingSection:Toggle({Name = "GlobalShadows",Value = game.Lighting.GlobalShadows,Callback = function(bool)
                game.Lighting.GlobalShadows = bool end})

            LightingSection:Toggle({Name = "PrioritizeLightingQuality",Value = game.Lighting.PrioritizeLightingQuality,Callback = function(bool)
                game.Lighting.PrioritizeLightingQuality = bool end})

            LightingSection:Slider({Name = "Brightness",Min = 0,Max = 6,Precise = 1,Value = game.Lighting.Brightness,Callback = function(value)
                game.Lighting.Brightness = value end})

            LightingSection:Slider({Name = "ShadowSoftness",Min = 0,Max = 1,Precise = 3,Value = game.Lighting.ShadowSoftness,Callback = function(value)
                game.Lighting.ShadowSoftness = value end})

            LightingSection:Slider({Name = "ExposureCompensation",Min = 0,Max = 6,Precise = 1,Value = game.Lighting.ExposureCompensation,Callback =function(value)
                game.Lighting.ExposureCompensation = value end})

            LightingSection:Slider({Name = "EnvironmentDiffuseScale",Min = 0,Max = 1,Precise = 1,Value = game.Lighting.EnvironmentDiffuseScale,Callback = function(value)
                game.Lighting.EnvironmentDiffuseScale = value end})

            LightingSection:Slider({Name = "EnvironmentSpecularScale",Min = 0,Max = 1,Precise = 1,Value = game.Lighting.EnvironmentSpecularScale,Callback = function(value)
                game.Lighting.EnvironmentSpecularScale = value end})

            LightingSection:Dropdown({Name = "Technology",List = {
                {
                    Name = "Compatibility",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Compatibility
                    end
                },
                {
                    Name = "Future",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Future
                    end
                },
                {
                    Name = "Legacy",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Legacy
                    end
                },
                {
                    Name = "ShadowMap",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.ShadowMap
                    end
                },
                {
                    Name = "Unified",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Unified
                    end
                },
                {
                    Name = "Voxel",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Lighting.Technology = Enum.Technology.Voxel
                    end
                }
            }})
        end

        local CameraSection = Tab:Section({Name = "Camera",Side = "Right"}) do

            CameraSection:Slider({Name = "FieldOfView",Min = 0,Max = 120,Value = game.Workspace.CurrentCamera.FieldOfView,Callback = function(value)
                game.Workspace.CurrentCamera.FieldOfView = value end})

            CameraSection:Dropdown({Name = "CameraType",List = {
                {
                    Name = "Attach",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Attach
                    end
                },
                {
                    Name = "Custom",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                    end
                },
                {
                    Name = "Fixed",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Fixed
                    end
                },
                {
                    Name = "Follow",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Follow
                    end
                },
                {
                    Name = "Orbital",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Orbital
                    end
                },
                {
                    Name = "Scriptable",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Scriptable
                    end
                },
                {
                    Name = "Track",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Track
                    end
                },
                {
                    Name = "Watch",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Watch
                    end
                }
            }})
        end
    end

    local OptionsTab = Window:Tab({Name = "Options"}) do
        local MenuSection = OptionsTab:Section({Name = "Menu",Side = "Left"}) do
            local UIToggle = MenuSection:Toggle({Name = "UI Enabled",Flag = "UI/Enabled",IgnoreFlag = true,
            Value = Window.Enabled,Callback = function(Bool) Window.Enabled = Bool end})
            local UIKeybind = UIToggle:Keybind({Value = "End",Flag = "UI/Keybind",DoNotClear = true})
            UIToggle:Colorpicker({Flag = "UI/Color",Value = {1,0.25,1,0,true},
            Callback = function(HSVAR,Color) Window.Color = Color end})
            MenuSection:Toggle({Name = "Open On Load",Flag = "UI/OOL",Value = true})
            MenuSection:Toggle({Name = "Blur Gameplay",Flag = "UI/Blur",Value = false,
            Callback = function(Bool) Window.Blur = Bool end})

            MenuSection:Button({Name = "Unload UI",Callback = function()
                Window.Enabled = false

                UIKeybind.Value = "NONE"

                task.defer(function()
                    Fusion:Destroy()
                end)
            end})
        end

        OptionsTab:AddConfigSection("FusionConfigs","Left")

        local BackgroundSection = OptionsTab:Section({Name = "Customize",Side = "Right"}) do
            BackgroundSection:Colorpicker({Name = "Background Color",Flag = "Background/Color",Value = {1,1,0,0,false},
            Callback = function(HSVAR,Color) Window.Background.ImageColor3 = Color
            Window.Background.ImageTransparency = HSVAR[4] end})
            BackgroundSection:Colorpicker({Name = "Pattern Color",Value = {0,0,0,0,false},Callback = function(hsvar,color)
                Window.Background.BackgroundColor3 = color end})
            BackgroundSection:Colorpicker({Name = "Section Border Color",Value = {0,0,0,0,false},Callback = function(hsvar,color)
                for _, first in ipairs(Fusion.Window.TabContainer:GetChildren()) do
                    if first:IsA("ScrollingFrame") and first.Name:match("Tab") then
                        for _, second in ipairs(first:GetChildren()) do
                            if second:IsA("Frame") and second.Name:match("LeftSide") then
                                for _, third in ipairs(second:GetChildren()) do
                                    if third:IsA("Frame") and third.Name:match("Section") then
                                        third.Stroke.Color = color
                                    end
                                end
                            end
                            if second:IsA("Frame") and second.Name:match("RightSide") then
                                for _, third in ipairs(second:GetChildren()) do
                                    if third:IsA("Frame") and third.Name:match("Section") then
                                        third.Stroke.Color = color
                                    end
                                end
                            end
                        end
                    end
                end
            end})
            BackgroundSection:Textbox({HideName = true,Flag = "Background/CustomImage",Placeholder = "rbxassetid://ImageId",
            Callback = function(String,EnterPressed) if EnterPressed then Window.Background.Image = String end end})
            BackgroundSection:Dropdown({HideName = true,Flag = "Background/Image",List = {
                {
                    Name = "Legacy",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://2151741365"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Hearts",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://6073763717"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Abstract",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://6073743871"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Hexagon",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://6073628839"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Circles",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://6071579801"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Lace With Flowers",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://6071575925"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Floral",
                    Mode = "Button",
                    Value = true,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://5553946656"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Halloween",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://11113209821"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                },
                {
                    Name = "Christmas",
                    Mode = "Button",
                    Value = false,
                    Callback = function()
                        Window.Background.Image = "rbxassetid://11711560928"
                        Window.Flags["Background/CustomImage"] = ""
                    end
                }
            }})

            BackgroundSection:Slider({Name = "Tile Offset",Flag = "Background/Offset",Wide = true,Min = 74,Max = 296,Value = 74,Callback = function(Number)
                Window.Background.TileSize = UDim2.fromOffset(Number,Number) end})
        end
    end
end

Fusion.Window.Background.BackgroundColor3 = Color3.fromRGB(30, 30, 30)

Fusion.Window.Version.Text = (exec .. " " .. ver)
Fusion.Name = "FUSION"

for _, first in ipairs(Fusion.Window.TabContainer:GetChildren()) do
    if first:IsA("ScrollingFrame") and first.Name:match("Tab") then
        for _, second in ipairs(first:GetChildren()) do
            if second:IsA("Frame") and second.Name:match("LeftSide") then
                for _, third in ipairs(second:GetChildren()) do
                    if third:IsA("Frame") and third.Name:match("Section") then
                        third.Stroke.Color = Color3.fromRGB(60,60,60)
                    end
                end
            end
            if second:IsA("Frame") and second.Name:match("RightSide") then
                for _, third in ipairs(second:GetChildren()) do
                    if third:IsA("Frame") and third.Name:match("Section") then
                        third.Stroke.Color = Color3.fromRGB(60,60,60)
                    end
                end
            end
        end
    end
end

Window:SetValue("Background/Offset",74)
Window:AutoLoadConfig("Ruined")
Window:SetValue("UI/Enabled",Window.Flags["UI/OOL"])

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Fusion";
    Text = "GUI Loaded";
    Duration = 5
})
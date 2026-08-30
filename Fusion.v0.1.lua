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

local Window = Bracket:Window({Name = "Fusion v0.1",Enabled = true,Color = Color3.new(1,0.5,0.25),Size = UDim2.new(0,496,0,496),Position = UDim2.new(0.5,-248,0.5,-248)}) do

    local Tab = Window:Tab({Name = "Main"}) do

        local ScriptSection = Tab:Section({Name = "Scripts"}) do

            ScriptSection:Label({Text = "Universal scripts for just about any game"})

            ScriptSection:Button({Name = "Infinite Yield",Callback = function()
                loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))() end})

            ScriptSection:Button({Name = "Dex++",Callback = function()
                loadstring(game:HttpGet("https://github.com/AZYsGithub/DexPlusPlus/releases/latest/download/out.lua"))() end})
        end

        local PlayerSection = Tab:Section({Name = "Player",Side = "Left"}) do

            PlayerSection:Button({Name = "Set Health To 0",Callback = function()
                game.Players.LocalPlayer.Character.Humanoid.Health = 0 end})

            PlayerSection:Button({Name = "Teleport to FPDH",Callback = function()
                local FPDH = game.Workspace.FallenPartsDestroyHeight + 4
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, FPDH, 0) end})

            PlayerSection:Toggle({Name = "UseJumpPower",Value = false,Callback = function(bool)
                game.Players.LocalPlayer.Character.Humanoid.UseJumpPower = bool end})

            PlayerSection:Slider({Name = "WalkSpeed",Min = 0,Max = 200,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value end})

            PlayerSection:Slider({Name = "JumpPower",Min = 0,Max = 200,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpPower = value end})

            PlayerSection:Slider({Name = "JumpHeight",Min = 0,Max = 200,Callback = function(value)
                game.Players.LocalPlayer.Character.Humanoid.JumpHeight = value end})
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

        local BackgroundSection = OptionsTab:Section({Name = "Background",Side = "Right"}) do
            BackgroundSection:Colorpicker({Name = "Color",Flag = "Background/Color",Value = {1,1,0,0,false},
            Callback = function(HSVAR,Color) Window.Background.ImageColor3 = Color
            Window.Background.ImageTransparency = HSVAR[4] end})
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

Fusion.Window.Version.Text = (exec .. " " .. ver)

Window:SetValue("Background/Offset",74)
Window:AutoLoadConfig("Ruined")
Window:SetValue("UI/Enabled",Window.Flags["UI/OOL"])

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Fusion";
    Text = "GUI Loaded";
    Duration = 5
})
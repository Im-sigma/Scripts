local speeds = 1
local speaker = game:GetService("Players").LocalPlayer
local chr = speaker.Character
local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")
local nowe = false
local function toggleFly()
    if nowe then
        nowe = false
        speaker.Character.Humanoid.PlatformStand = false
        game.Players.LocalPlayer.Character.Animate.Disabled = false
    else
        nowe = true
        game.Players.LocalPlayer.Character.Animate.Disabled = true
        for i = 1, speeds do
            spawn(function()
                local hb = game:GetService("RunService").Heartbeat	
                local tpwalking = true
                while tpwalking and hb:Wait() and chr and hum and hum.Parent do
                    if hum.MoveDirection.Magnitude > 0 then
                        chr:TranslateBy(hum.MoveDirection)
                    end
                end
            end)
        end
    end
end
local function changeSpeed(amount)
    speeds = math.max(1, speeds + amount)
    game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.speed.Text = tostring(speeds)
end
game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.onof.MouseButton1Down:Connect(toggleFly)
game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.plus.MouseButton1Down:Connect(function() changeSpeed(1) end)
game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.mine.MouseButton1Down:Connect(function() changeSpeed(-1) end)
game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.up.MouseButton1Down:Connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 2, 0)
end)
game.Players.LocalPlayer.PlayerGui.FlyUI.Frame.down.MouseButton1Down:Connect(function()
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, -2, 0)
end)

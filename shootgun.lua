task.spawn(function()
    while true do
        if getgenv().NoCD_DualFlintlock then
            local character = Workspace:FindFirstChild("Characters"):FindFirstChild(characterName)
            if character then
                local dualFlintlock = character:FindFirstChild("Dual Flintlock")
                if dualFlintlock and dualFlintlock:GetAttribute("LocalShotsLeft") ~= nil then
                    dualFlintlock:SetAttribute("LocalShotsLeft", math.huge)
                end
            end
        end
        task.wait(0.1)
    end
end)

task.spawn(function()
    while true do
        if getgenv().NoCD_Dragonstorm then
            local character = Workspace:FindFirstChild("Characters"):FindFirstChild(characterName)
            if character then
                local dragonstorm = character:FindFirstChild("Dragonstorm")
                if dragonstorm then
                    if dragonstorm:GetAttribute("LocalOverheat") ~= nil then
                        dragonstorm:SetAttribute("LocalOverheat", 0.1)
                    end
                    if dragonstorm:GetAttribute("Overheat") ~= nil then
                        dragonstorm:SetAttribute("Overheat", 0.1)
                    end
                end
            end
        end
        task.wait(0.1)
    end
end)

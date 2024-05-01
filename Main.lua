local ESPWindow = Instance.new("Frame")
ESPWindow.Name = "ESPWindow"
ESPWindow.Size = UDim2.new(0, 200, 0, 100)
ESPWindow.Position = UDim2.new(0.5, -100, 0.5, -50)
ESPWindow.AnchorPoint = Vector2.new(0.5, 0.5)
ESPWindow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ESPWindow.BackgroundTransparency = 0.5
ESPWindow.Parent = ScreenGui

local ESPButton = Instance.new("TextButton")
ESPButton.Name = "ESPButton"
ESPButton.Size = UDim2.new(0, 150, 0, 50)
ESPButton.Position = UDim2.new(0.5, -75, 0.5, -25)
ESPButton.AnchorPoint = Vector2.new(0.5, 0.5)
ESPButton.BackgroundColor3 = Color3.fromRGB(100, 200, 100)
ESPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
ESPButton.Text = "ESP"
ESPButton.Font = Enum.Font.SourceSans
ESPButton.TextSize = 20
ESPButton.Parent = ESPWindow

local ESPEnabled = false
local function toggleESP()
    ESPEnabled = not ESPEnabled
    if ESPEnabled then
        ESPButton.Text = "ESP ON"
        -- Code pour activer l'ESP
    else
        ESPButton.Text = "ESP OFF"
        -- Code pour désactiver l'ESP
    end
end

ESPButton.MouseButton1Click:Connect(toggleESP)

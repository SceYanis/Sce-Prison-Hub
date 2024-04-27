local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Sce Prison Hub", "DarkTheme")

local screenWidth = game:GetService("GuiService").AbsoluteWindowSize.X
local screenHeight = game:GetService("GuiService").AbsoluteWindowSize.Y

Window.Position = UDim2.new(0.5, -(Window.AbsoluteSize.X / 2), 0.5, -(Window.AbsoluteSize.Y / 2))

local Tab = Window:NewTab("vie en prison à la bibliothèque")
local Section = Tab:NewSection("Script de vie en prison sans clé")

Section:NewButton("Tiger Admin", "ButtonInfo", function()
    loadstring(game:HttpGet("https://scriptblox.com/raw/Prison-Life-Tiger-admin-free-10333"))()
end)

Section:NewButton("Prisonware", "ButtonInfo", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Denverrz/scripts/master/PRISONWARE_v1.3.txt"))()
end)

local function closeWindow()
    Window:Close()
end

local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Position = UDim2.new(0, 10, 0, 10)
closeButton.Text = "X"
closeButton.TextColor3 = Color3.new(1, 1, 1)
closeButton.BackgroundColor3 = Color3.new(1, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Parent = Window

closeButton.MouseButton1Click:Connect(closeWindow)

local dragInput
local dragStart
local startPos

local function updateWindowPosition(x, y)
    local screenWidth = game:GetService("GuiService").AbsoluteWindowSize.X
    local screenHeight = game:GetService("GuiService").AbsoluteWindowSize.Y
    
    Window.Position = UDim2.new(0, x * screenWidth, 0, y * screenHeight)
end

local function updateDrag(input)
    local delta = input.Position - dragStart
    updateWindowPosition((startPos.X.Offset + delta.X) / screenWidth, (startPos.Y.Offset + delta.Y) / screenHeight)
end

Window.TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragStart = input.Position
        startPos = Window.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragInput = nil
            end
        end)
    end
end)

Window.TopBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if dragInput and input == dragInput then
        updateDrag(input)
    end
end)

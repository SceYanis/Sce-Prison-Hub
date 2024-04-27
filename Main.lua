local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("Sce Prison Hub", "DarkTheme")
local Tab = Window:NewTab("vie en prison à la bibliothèque")
local Section = Tab:NewSection("Script de vie en prison sans clé")

Section:NewButton("Tiger Admin", "BoutonInfo", function()
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

local function updateWindowPosition(x, y)
    local screenWidth = game:GetService("GuiService").AbsoluteWindowSize.X
    local screenHeight = game:GetService("GuiService").AbsoluteWindowSize.Y
    
    Window.Position = UDim2.new(0, x * screenWidth, 0, y * screenHeight)
end

local joystickSize = UDim2.new(0, 100, 0, 100)
local joystick = Instance.new("Frame")
joystick.Size = joystickSize
joystick.Position = UDim2.new(0, 20, 0, 20)
joystick.BackgroundTransparency = 0.5
joystick.BackgroundColor3 = Color3.new(0, 0, 0)
joystick.Parent = Window

local joystickButton = Instance.new("TextButton")
joystickButton.Size = UDim2.new(0, 50, 0, 50)
joystickButton.Position = UDim2.new(0.5, -25, 0.5, -25)
joystickButton.Text = ""
joystickButton.Parent = joystick

local joystickDragging = false

joystickButton.MouseButton1Down:Connect(function()
    joystickDragging = true
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if joystickDragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        local center = joystickButton.AbsolutePosition + joystickButton.AbsoluteSize / 2
        local cursorPosition = input.Position
        local relativePosition = cursorPosition - center
        local distance = relativePosition.magnitude
        local maxDistance = joystickButton.AbsoluteSize.X / 2
        if distance > maxDistance then
            relativePosition = relativePosition.unit * maxDistance
        end
        joystickButton.Position = joystickButton.Position + UDim2.new(0, relativePosition.X, 0, relativePosition.Y)
        updateWindowPosition(relativePosition.X / (maxDistance * 2), relativePosition.Y / (maxDistance * 2))
    end
end)

game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        joystickDragging = false
        joystickButton.Position = UDim2.new(0.5, -25, 0.5, -25)
        updateWindowPosition(0, 0)
    end
end)

local JoystickWindow = Library.CreateLib("Joystick", "DarkTheme")
JoystickWindow:SetTitle("Joystick")
JoystickWindow:SetPosition(UDim2.new(0, 10, 0, 10))
JoystickWindow:SetSize(UDim2.new(0, 150, 0, 150))
JoystickWindow:MakeDraggable()

local function updateMainWindowPosition(x, y)
    local screenWidth = game:GetService("GuiService").AbsoluteWindowSize.X
    local screenHeight = game:GetService("GuiService").AbsoluteWindowSize.Y
    
    Window.Position = UDim2.new(x, 0, y, 0)
end

local joystickButtonJoystickWindow = Instance.new("TextButton")
joystickButtonJoystickWindow.Size = UDim2.new(0, 50, 0, 50)
joystickButtonJoystickWindow.Position = UDim2.new(0.5, -25, 0.5, -25)
joystickButtonJoystickWindow.Text = ""
joystickButtonJoystickWindow.Parent = JoystickWindow

local joystickDraggingJoystickWindow = false

joystickButtonJoystickWindow.MouseButton1Down:Connect(function()
    joystickDraggingJoystickWindow = true
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if joystickDraggingJoystickWindow and input.UserInputType == Enum.UserInputType.MouseMovement then
        local center = joystickButtonJoystickWindow.AbsolutePosition + joystickButtonJoystickWindow.AbsoluteSize / 2
        local cursorPosition = input.Position
        local relativePosition = cursorPosition - center
        local distance = relativePosition.magnitude
        local maxDistance = joystickButtonJoystickWindow.AbsoluteSize.X / 2
        if distance >

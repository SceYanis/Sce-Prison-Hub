if not getconnections or not hookmetamethod or not getnamecallmethod or not ((getgenv and getgenv()) or _G) then
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Sce Hub",Text = "L'exécuteur n'est pas pris en charge !",Duration = 10,})
end

if not workspace:FindFirstChild("Criminals Spawn") or not workspace:FindFirstChild("Criminals Spawn"):FindFirstChild("SpawnLocation") then
	game:GetService("StarterGui"):SetCore("SendNotification", {Title = "Sce Hub",Text = "Les criminels ne sont pas trouvés ! Veuillez vous réinscrire.",Duration = 10,})
end

game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart")

if game:FindFirstChild("Sce_revamp_loaded") then 
	((getgenv and getgenv()) or _G).NotifTiger("L'administrateur Sce est déjà exécuté !",false) 
	return warn("Déjà chargé") 
end

local Player, plr, Folder = game:GetService("Players").LocalPlayer, game:GetService("Players").LocalPlayer, Instance.new("Folder", game)
local OldHook, hookmeta, getnamecallmethod = nil, hookmetamethod, getnamecallmethod
local HasGamepass, UserInputService = game:GetService("MarketplaceService"):UserOwnsGamePassAsync(Player.UserId, 96651), game:GetService("UserInputService")
local GlobalVar = ((getgenv and getgenv()) or _G)
local unloaded = false
local CriminalCFRAME = workspace["Criminals Spawn"].SpawnLocation.CFrame
local API_Prem = loadstring(game:HttpGet("https://raw.githubusercontent.com/dalloc2/Roblox/main/Listing.lua"))()
local PremiumActivated = API_Prem.CheckPremium()

local Temp = {}
local API = {}
local Reload_Guns = {}
local Prefix = "!"

Folder.Name = "Sce_revamp_loaded"
local ScreenGui = Instance.new("ScreenGui")
local CmdBarFrame = Instance.new("Frame")
local UICorner = Instance.new("UICorner")
local Out = Instance.new("ImageLabel")
local UICorner_2 = Instance.new("UICorner")
local CommandBar = Instance.new("TextBox")
local UIStroke = Instance.new("UIStroke")
local Commands = Instance.new("ImageLabel")
local UICorner_3 = Instance.new("UICorner")
local UIStroke_2 = Instance.new("UIStroke")
local CommandsList = Instance.new("ScrollingFrame")
local UIListLayout = Instance.new("UIListLayout")
local TEMP_CMD = Instance.new("TextLabel")
local SearchBar = Instance.new("TextBox")

ScreenGui.Parent = (game:GetService("CoreGui") or gethui())
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Name = tostring(math.random())

CmdBarFrame.Name = "CmdBarFrame"
CmdBarFrame.Parent = ScreenGui
CmdBarFrame.AnchorPoint = Vector2.new(0.5, 0.5)
CmdBarFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CmdBarFrame.BackgroundTransparency = 1.000
CmdBarFrame.BorderSizePixel = 0
CmdBarFrame.Position = UDim2.new(0.5, 0, 0.9, 0)
CmdBarFrame.Position = CmdBarFrame.Position + UDim2.new(0,0,1.1,0)
CmdBarFrame.Size = UDim2.new(0, 577, 0, 65)

UICorner.CornerRadius = UDim.new(0, 3)
UICorner.Parent = CmdBarFrame

Out.Name = "Out"
Out.Parent = CmdBarFrame
Out.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Out.Position = UDim2.new(0.02, 0, 0.02, 0)
Out.Size = UDim2.new(0.974, 0, 0.945, 0)
Out.Image = "rbxassetid://11789397066"
Out.ImageTransparency = 0.240

UICorner_2.CornerRadius = UDim.new(0, 6)
UICorner_2.Parent = Out

CommandBar.Name = "CommandBar"
CommandBar.Parent = Out
CommandBar.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.BackgroundTransparency = 1.000
CommandBar.BorderSizePixel = 0
CommandBar.Position = UDim2.new(0.036, 0, 0.128, 0)
CommandBar.Size = UDim2.new(0, 519, 0, 46)
CommandBar.Font = Enum.Font.SourceSans
CommandBar.PlaceholderColor3 = Color3.fromRGB(178, 178, 178)
CommandBar.PlaceholderText = "Barre de commandes"
CommandBar.Text = ""
CommandBar.TextColor3 = Color3.fromRGB(255, 255, 255)
CommandBar.TextSize = 24
CommandBar.TextTransparency = 0.140
CommandBar.TextWrapped = true

UIStroke.Parent = Out

Commands.Name = "Commands"
Commands.Parent = ScreenGui
Commands.AnchorPoint = Vector2.new(0.5, 0.5)
Commands.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Commands.Position = UDim2.new(0.5, 0, 0.5, 0)
Commands.Size = UDim2.new(0, 455, 0, 297)
Commands.Image = "rbxassetid://12011977394"
Commands.ImageTransparency = 0.200
Commands.Visible = false

UICorner_3.CornerRadius = UDim.new(0, 6)
UICorner_3.Parent = Commands

UIStroke_2.Parent = Commands

CommandsList.Parent = Commands
CommandsList.Active = true
CommandsList.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
CommandsList.BackgroundTransparency = 1.000
CommandsList.Position = UDim2.new(0, 0, 0.077, 0)
CommandsList.Size = UDim2.new(0, 455, 0, 274)
CommandsList.ScrollBarThickness = 5
CommandsList.AutomaticCanvasSize = "Y"

UIListLayout.Parent = CommandsList
UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIListLayout.Padding = UDim.new(0, 8)

TEMP_CMD.Parent = Folder
TEMP_CMD.BackgroundColor3 = Color3.fromRGB(62, 62, 62)
TEMP_CMD.BackgroundTransparency = 0.750
TEMP_CMD.Size = UDim2.new(0, 455, 0, 14)
TEMP_CMD.Font = Enum.Font.SourceSans
TEMP_CMD.Text = "sexe"
TEMP_CMD.TextColor3 = Color3.fromRGB(255, 0, 0) 

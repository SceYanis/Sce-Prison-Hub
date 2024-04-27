local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local ScePrisonHub = Library.CreateLib("Sce Prison Hub", "BloodTheme")
local Principal = ScePrisonHub:NewTab("Principal")
local Scripts = ScePrisonHub:NewTab("Scripts")
local PlayerSection = Principal:NewSection("Joueur")
local GunSection = Principal:NewSection("Armes")
local TeamSection = Principal:NewSection("Équipe")
local AdminSection = Scripts:NewSection("Scripts d'administration")
local UsefulSection = Scripts:NewSection("Scripts utiles")

PlayerSection:NewSlider("Walkspeed", "Modifie votre vitesse de marche.", 200, 16, function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)
PlayerSection:NewSlider("Jump Power", "Modifie votre Jumppower.", 200, 50, function(s)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = s
end)

GunSection:NewButton("Obtenez un fusil de chasse", "Obtenez l'arme Remington 870 dans votre inventaire.", function()
    local args = {
        [1] = workspace.Prison_ITEMS.giver:FindFirstChild("Remington 870").ITEMPICKUP
    }
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

GunSection:NewButton("Obtenir un pistolet", "Obtenir l'arme M9 dans votre inventaire.", function()
    local args = {
        [1] = workspace.Prison_ITEMS.giver.M9.ITEMPICKUP
    }
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

GunSection:NewButton("Obtenez l'Ak-47", "Obtenez l'arme Ak-47 dans votre inventaire.", function()
    local args = {
        [1] = workspace.Prison_ITEMS.giver:FindFirstChild("AK-47").ITEMPICKUP
    }
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

GunSection:NewButton("Obtenez M4A1", "Vous avez besoin du gamepass Riot Police.", function()
    local args = {
        [1] = workspace.Prison_ITEMS.giver.M4A1.ITEMPICKUP
    }
    workspace.Remote.ItemHandler:InvokeServer(unpack(args))
end)

GunSection:NewDropdown("Gun Mod", "Rend le pistolet vraiment maîtrisé.", {"M9", "Remington 870", "AK-47", "Taser"}, function(v)
    local module = nil
    if game:GetService("Players").LocalPlayer.Backpack:FindFirstChild(v) then
        module = require(game:GetService("Players").LocalPlayer.Backpack[v].GunStates)
    elseif game:GetService("Players").LocalPlayer.Character:FindFirstChild(v) then
        module = require(game:GetService("Players").LocalPlayer.Character[v].GunStates)
    end
    if module then
        module["MaxAmmo"] = math.huge
        module["CurrentAmmo"] = math.huge
        module["StoredAmmo"] = math.huge
        module["FireRate"] = 0.000001
        module["Spread"] = 0
        module["Range"] = math.huge
        module["Bullets"] = 10
        module["ReloadTime"] = 0.000001
        module["AutoFire"] = true
    end
end)

TeamSection:NewButton("Passer à l'équipe des détenus", "Passer à l'équipe des détenus.", function()
    local args = {
        [1] = "Orange vif"
    }
    workspace.Remote.TeamEvent:FireServer(unpack(args))
    args[1] = PlayerName
    workspace.Remote.loadchar:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Passer à l'équipe des gardes", "Passer à l'équipe des gardes.", function()
    local args = {
        [1] = "Bleu vif"
    }
    workspace.Remote.TeamEvent:FireServer(unpack(args))
    args[1] = PlayerName
    workspace.Remote.loadchar:InvokeServer(unpack(args))
end)

TeamSection:NewButton("Passer à l'équipe neutre", "Passer à l'équipe neutre.", function()
    local args = {
        [1] = game:GetService("Players").LocalPlayer,
        [2] = "Gris pierre moyen"
    }
    workspace.Remote.loadchar:InvokeServer(unpack(args))
    args[1] = PlayerName
    workspace.Remote.loadchar:InvokeServer(unpack(args))
end)

AdminSection:NewButton("Inf Yield", "Script d'administration Nice FE.", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
end)

AdminSection:NewButton("Fates Admin", "L'un des meilleurs scripts d'administration FE.", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/fatesc/fates-admin/main/main.lua"))()
end)

UsefulSection:NewButton("DarkDex", "Vous permet de tout voir dans le jeu.", function()
    loadstring(game:HttpGet("https://gist.githubusercontent.com/DinosaurXxX/b757fe011e7e600c0873f967fe427dc2/raw/ee5324771f017073fc30e640323ac2a9b3bfc550/dark%2520dex%2520v4"))()
end)

UsefulSection:NewButton("SimpleSpy", "Un incontournable pour créer des exploits Roblox.", function()
    loadstring(game:HttpGet("https://github.com/exxtremestuffs/SimpleSpySource/raw/master/SimpleSpy.lua"))()
end)

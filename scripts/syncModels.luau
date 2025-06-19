local fs = require("@lune/fs")
local roblox = require("@lune/roblox")

local file = fs.readFile("game.rbxl")
local game = roblox.deserializePlace(file)
 
-- Make sure a directory exists to save our models in
if not fs.isDir("./models") then
	fs.writeDir("./models")
end

fs.writeFile("./models/Workspace.rbxm", roblox.serializeModel({ game.Workspace }))
fs.writeFile("./models/Lighting.rbxm", roblox.serializeModel({ game:GetService("Lighting") }))
fs.writeFile("./models/ServerStorage.rbxm", roblox.serializeModel({ game:GetService("ServerStorage") }))

if game:GetService("ReplicatedStorage"):FindFirstChild("Assets") then
    fs.writeFile(`./models/Assets.rbxm`, roblox.serializeModel({ game:GetService("ReplicatedStorage").Assets }))
end

print("Synced Models!")
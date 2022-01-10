local ContactButton = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhoneCallEvent = ReplicatedStorage:WaitForChild("PhoneCallEvent")
local caller = game.Players.LocalPlayer.UserId
local LocalPlayer = game.Players.LocalPlayer
 

ContactButton.MouseButton1Click:Connect(function()
	receiver = ContactButton:WaitForChild("Username").Text
	print("Attempting to call " .. receiver)
	PhoneCallEvent:FireServer(receiver)
end)


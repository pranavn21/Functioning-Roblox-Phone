-- PASTE THIS ALONG WITH THE OTHER 3 SCRIPTS TO "ServerScriptService" or the phone will not work!

local ReplicatedStorage = game:GetService("ReplicatedStorage")local OnCallDeclinedEvent = ReplicatedStorage:WaitForChild("OnCallDeclinedEvent")

OnCallDeclinedEvent.OnServerEvent:Connect(function(player, otherUser)
	
	print("Sever fired!") --removed this
	
	local success, errormessage = pcall(function()
		other = game.Players:FindFirstChild(otherUser)
	end)

	if success then
		OnCallDeclinedEvent:FireClient(other)
	else
		warn(errormessage)
	end
	
end)


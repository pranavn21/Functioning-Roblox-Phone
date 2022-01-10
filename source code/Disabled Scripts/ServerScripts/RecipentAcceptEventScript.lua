-- PASTE THIS ALONG WITH THE OTHER 3 SCRIPTS TO "ServerScriptService" or the phone will not work!

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RecipentAcceptEvent = ReplicatedStorage:WaitForChild("RecipentAcceptEvent")

RecipentAcceptEvent.OnServerEvent:Connect(function(player, CallerName)
	
	local success, errormessage = pcall(function()
		caller = game.Players:FindFirstChild(CallerName)
	end)
	
	if success then
		RecipentAcceptEvent:FireClient(caller)
	else
		warn(errormessage)
	end
end)

-- PASTE THIS ALONG WITH THE OTHER 3 SCRIPTS TO "ServerScriptService" or the phone will not work!

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhoneCallEvent = ReplicatedStorage:WaitForChild("PhoneCallEvent")

PhoneCallEvent.OnServerEvent:Connect(function(player, receiver)
	print("Ringing a call to " .. receiver)
	
	
	local success, errormessage = pcall(function()
		ReceiverPlayer = game.Players:FindFirstChild(receiver)
	   
		
	end)
	
	if success then
		PhoneCallEvent:FireClient(ReceiverPlayer, "Receiver", player.Name) --otherName
		PhoneCallEvent:FireClient(player, "Caller", receiver)
		
		print("Phone is ringing ok")
	else
		warn(errormessage)
	end
	
	
end)

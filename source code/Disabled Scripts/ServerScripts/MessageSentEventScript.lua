-- PASTE THIS ALONG WITH THE OTHER 3 SCRIPTS TO "ServerScriptService" or the phone will not work!

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessageSentEvent = ReplicatedStorage:WaitForChild("MessageSentEvent")
local TextService = game:GetService("TextService")


local function getTextObject(message, fromPlayerId)
	local textObject
	local success, errorMessage = pcall(function()
		textObject = TextService:FilterStringAsync(message, fromPlayerId)
	end)
	if success then
		return textObject
	elseif errorMessage then
		print("Error generating TextFilterResult:", errorMessage)
	end

	return "Text message failed to send!"
end

local function getFilteredMessage(textObject)
	local filteredMessage
	local success, errorMessage = pcall(function()
		filteredMessage = textObject:GetNonChatStringForBroadcastAsync()
	end)
	if success then
		return filteredMessage
	elseif errorMessage then
		print("Error filtering message:", errorMessage)
	end

	return "Text message failed to filter " .. filteredMessage
end

MessageSentEvent.OnServerEvent:Connect(function(player, messageReceiver, messageToSend)

	local success, errormessage = pcall(function()
		messageReceiverUser = game.Players:FindFirstChild(messageReceiver)
	end)

	if success then

		if messageToSend ~= "" and messageToSend ~= nil then

			local messageObject = getTextObject(messageToSend, player.UserId)
			local filteredText = ""
			filteredText = getFilteredMessage(messageObject) --
			messageToSend = filteredText

			print("Filtered text is .." .. messageToSend)

			MessageSentEvent:FireClient(player, messageToSend, "Caller")
			
			local phone = player.Backpack:FindFirstChild("iExotic 11 Pro Max")
			if phone == nil then --if not in backpack
				phone = player.Character:FindFirstChild("iExotic 11 Pro Max")
			end
			
			local messageReceiver = phone.Frame.CallOn.OnCall.CallerName.Text
			MessageSentEvent:FireClient(messageReceiverUser, messageToSend, "Receiver")
		else
			print("Message empty or nil")
		end

	else
		warn(errormessage)
	end
end)


local ReplicatedStorage = game:GetService("ReplicatedStorage")
local MessageSentEvent = ReplicatedStorage:WaitForChild("MessageSentEvent")
local LocalPlayer = game.Players.LocalPlayer
local OnCall = LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall
local submitButton = OnCall.SubmitButton
local messageLabel = submitButton.Parent.message
local otherMessageTemplate = OnCall.MessageTemplates.OtherMessage
local ownMessageTemplate = OnCall.MessageTemplates.OwnMessage
local count = 0

submitButton.MouseButton1Click:Connect(function()
	local messageToSend  = messageLabel.Text

	if messageToSend ~= "" and messageToSend ~= nil then
		local messageReceiver = OnCall.CallerName.Text
		MessageSentEvent:FireServer(messageReceiver, messageToSend)
	end
end)

MessageSentEvent.OnClientEvent:Connect(function(messageToSend, identity)
print("The filtered message is ".. messageToSend)
	if identity == "Receiver" then
		print("Received message!")
			local messageFrame = otherMessageTemplate:Clone()
			local messageFrame2 = otherMessageTemplate:Clone()
			messageFrame.OtherText.Text = messageToSend
			messageFrame.Parent = OnCall.CallMessage
			messageFrame.OtherText.Visible = true

			local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
			if phone == nil then --if not in backpack
				phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
			end

			messageFrame2.OtherText.Text = messageToSend
			messageFrame2.Parent = phone.Frame.CallOn.OnCall.CallMessage
			messageFrame2.OtherText.Visible = true

			print(messageFrame2.Parent)
			count = 0
	elseif identity == "Caller" then
		local messageFrame = ownMessageTemplate:Clone()
		local messageFrame2 = ownMessageTemplate:Clone()


		messageFrame.OwnText.Text = messageToSend
		print(messageFrame.OwnText.Text)--rmove
		messageFrame.Parent = OnCall.CallMessage
		messageFrame.OwnText.Visible = true

		local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
		if phone == nil then --if not in backpack
			phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
		end

		messageFrame2.OwnText.Text = messageToSend
		print(messageFrame2.OwnText.Text)--rmove
		messageFrame2.Parent = phone.Frame.CallOn.OnCall.CallMessage
		messageFrame2.OwnText.Visible = true
	end
end)
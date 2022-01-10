local ContactButton = script.Parent
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PhoneCallEvent = ReplicatedStorage:WaitForChild("PhoneCallEvent")
local LocalPlayer = game.Players.LocalPlayer
local RecipentAcceptEvent = ReplicatedStorage:WaitForChild("RecipentAcceptEvent")
local OnCallDeclinedEvent = ReplicatedStorage:WaitForChild("OnCallDeclinedEvent")

PhoneCallEvent.OnClientEvent:Connect(function(identity, otherName) --otherName gives the other person's name
	print(game.Players.LocalPlayer.Name .. " " .. identity)
	
	local otherPlayer = game.Players:FindFirstChild(otherName) --gets the other player
	
	if identity == "Caller" then
		if LocalPlayer.PlayerGui.ScreenGui:FindFirstChild("Frame") ~= nil then
			Calling = LocalPlayer.PlayerGui.ScreenGui.Frame.Calling
		elseif LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame") ~= nil then
			Calling = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame").Calling.Visible
		end
		
		Calling.Visible = true
		
		Calling.ReceiverName.Text = otherPlayer.Name
		if LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame") ~= nil then
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame").Calling.ReceiverName.Text = otherPlayer.Name
		elseif LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame") ~= nil then
			LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max"):FindFirstChild("Frame").Calling.ReceiverName.Text = otherPlayer.Name
		end
		
		local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(otherPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 
			-- Set the ImageLabel's content to the user thumbnail
		Calling.ReceiverAvatar.Image = content
			

			
		
		
		
	elseif identity == "Receiver" then
			local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
			if phone == nil then --if not in backpack
				phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
			end
			
			if phone == nil then
				print("Player does not have a phone")
			else
				phone.Ringtone:Play()
				phone.Frame.Incoming.Visible = true
				LocalPlayer.PlayerGui.ScreenGui:WaitForChild("Frame").Incoming.Visible = true
				
				phone.Frame.Incoming.CallerName.Text =  otherPlayer.Name
				LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.CallerName.Text =  otherPlayer.Name
				
			local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(otherPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 
			-- Set the ImageLabel's content to the user thumbnail
			phone.Frame.Incoming.CallerAvatar.Image = content

			end 
			

		end
	
end)

		LocalPlayer.PlayerGui:WaitForChild("ScreenGui"):WaitForChild("Frame").Calling.Decline.MouseButton1Click:Connect(function()
			Calling.Visible = false
			-- PUT HERE ANOTHER SERVEN EVENT TO STOP CALL??
		end)
		
		LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.Decline.MouseButton1Click:Connect(function()
			LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.Visible = false
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Frame.Incoming.Visible = false --since the gui is cloned from here
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Ringtone:Stop()
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Ringtone.TimePosition = 0 --sets ringtone to start
	-- PUT HERE ANOTHER SERVEN EVENT TO STOP CALL??
	local otherUser = LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.CallerName.Text
	print("Other user is " .. otherUser)
	print("Trying fire server")
	OnCallDeclinedEvent:FireServer(otherUser)
		end)
		
		LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.Accept.MouseButton1Click:Connect(function()
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.Visible = true
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Frame.CallOn.OnCall.Visible = true
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Ringtone:Stop()
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Ringtone.TimePosition = 0
			LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.Visible = false
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Frame.Incoming.Visible = false
			local CallerName = LocalPlayer.PlayerGui.ScreenGui.Frame.Incoming.CallerName.Text
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallerName.Text = CallerName
			LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Frame.CallOn.OnCall.CallerName.Text = CallerName
			
			
			RecipentAcceptEvent:FireServer(CallerName) --tell the server that the recipent has accepted the call so that server contacts caller
		end)
		
	
		RecipentAcceptEvent.OnClientEvent:Connect(function()		-- this is for the caller
			local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
			if phone == nil then --if not in backpack
				phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
			end
			
			phone.Frame.CallOn.OnCall.Visible = true
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.Visible = true
			phone.Frame.Calling.Visible = false
			local receiverName = phone.Frame.Calling.ReceiverName.Text

			print("Receiver name is ".. receiverName)
			LocalPlayer.PlayerGui.ScreenGui.Frame.Calling.Visible = false
			phone.Frame.CallOn.OnCall.CallerName.Text = receiverName
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallerName.Text = receiverName
		end)

		LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.Decline.MouseButton1Click:Connect(function()
			local otherUser = LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallerName.Text
			print("Other user is " .. otherUser)
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.Visible = false
	
			local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
			if phone == nil then --if not in backpack
				phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
			end
	
			phone.Frame.CallOn.OnCall.Visible = false --since the gui is cloned from here
			print("Trying fire server")
			
			LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallMessage:ClearAllChildren()
			local listLayout = Instance.new("UIListLayout")
			local listLayout2 = Instance.new("UIListLayout")
			phone.Frame.CallOn.OnCall.CallMessage:ClearAllChildren()
	
			listLayout.SortOrder = Enum.SortOrder.LayoutOrder
			listLayout2.SortOrder = Enum.SortOrder.LayoutOrder
			listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			listLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
			listLayout.Parent = LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallMessage
			listLayout2.Parent = phone.Frame.CallOn.OnCall.CallMessage
	
			OnCallDeclinedEvent:FireServer(otherUser)
			-- PUT HERE ANOTHER SERVEN EVENT TO STOP CALL??
end)

OnCallDeclinedEvent.OnClientEvent:Connect(function()	
	LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.Visible = false
	
	LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallMessage:ClearAllChildren()
	local listLayout = Instance.new("UIListLayout")
	local listLayout2 = Instance.new("UIListLayout")
	listLayout.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout.Parent = LocalPlayer.PlayerGui.ScreenGui.Frame.CallOn.OnCall.CallMessage
	
	local phone = LocalPlayer.Backpack:FindFirstChild("iExotic 11 Pro Max")
	if phone == nil then --if not in backpack
		phone = LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max")
	end
	phone.Frame.CallOn.OnCall.CallMessage:ClearAllChildren()
	listLayout2.SortOrder = Enum.SortOrder.LayoutOrder
	listLayout2.HorizontalAlignment = Enum.HorizontalAlignment.Center
	listLayout2.Parent = phone.Frame.CallOn.OnCall.CallMessage
	phone.Frame.CallOn.OnCall.Visible = false 
	--
end)
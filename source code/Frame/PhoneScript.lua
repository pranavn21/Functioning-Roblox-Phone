local Frame = script.Parent
local PhoneButton = Frame:WaitForChild("HomeScreenApps"):WaitForChild("Phone")
local BackButton = Frame:WaitForChild("PhonePage"):WaitForChild("Back")
local HomeScreenApps = Frame:WaitForChild("HomeScreenApps"):GetChildren()

local Contact = Frame.PhonePage:WaitForChild("Contact")
local PeopleFrame = Frame.PhonePage:WaitForChild("PeopleFrame")



PhoneButton.MouseButton1Click:Connect(function()
	local PhonePage = Frame.PhonePage:GetChildren()
	for _,v in pairs (PhonePage)do
		v.Visible = true
	end
	
	 Frame.PhonePage.Contact.Visible = false -- needs to stay false always
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = false
	end
	
	local players = game.Players:GetChildren()
	
	for _, v in pairs (players) do
		if (v.Backpack:FindFirstChild("iExotic 11 Pro Max") or v.Character:FindFirstChild("iExotic 11 Pro Max")) and PeopleFrame:FindFirstChild(v.Name) == nil and v.Name ~= game.Players.LocalPlayer.Name then
			local newContact = Contact:Clone()
			newContact.Parent = PeopleFrame
			newContact.Visible = true
			
			local content, isReady = game:GetService("Players"):GetUserThumbnailAsync(v.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420)
 
			-- Set the ImageLabel's content to the user thumbnail
			local imageLabel = newContact.Avatar
			imageLabel.Image = content
			
			newContact.ID.Text = v.UserId
			newContact.Username.Text = v.Name
			newContact.Name = v.Name
		end
	end
	
	
end)

BackButton.MouseButton1Click:Connect(function()
	local PhonePage = Frame.PhonePage:GetChildren()
	for _,v in pairs (PhonePage)do
		v.Visible = false
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = true
	end
end)


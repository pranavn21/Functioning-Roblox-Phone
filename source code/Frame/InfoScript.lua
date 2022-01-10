local Frame = script.Parent
local InfoButton = Frame:WaitForChild("HomeScreenApps"):WaitForChild("Info")
local BackButton = Frame.InfoPage:WaitForChild("Back")
local HomeScreenApps = Frame:WaitForChild("HomeScreenApps"):GetChildren()


InfoButton.MouseButton1Click:Connect(function()
	local InfoPage = Frame.InfoPage:GetChildren()
	for _,v in pairs (InfoPage)do
		v.Visible = true
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = false
	end
end)

BackButton.MouseButton1Click:Connect(function()
	local InfoPage = Frame.InfoPage:GetChildren()
	for _,v in pairs (InfoPage)do
		v.Visible = false
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = true
	end
end)
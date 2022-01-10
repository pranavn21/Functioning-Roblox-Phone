local Frame = script.Parent
local ClockButton = Frame:WaitForChild("HomeScreenApps"):WaitForChild("Clock")
local BackButton = Frame.ClockPage:WaitForChild("Back")
local ClockScreen = Frame.ClockPage:WaitForChild("ClockScreen")
local LocalClockTime = Frame.ClockPage:WaitForChild("LocalClockTime")
local GameClock = Frame.ClockPage:WaitForChild("LocalClockTime")
local LocalClockDate = Frame.ClockPage:WaitForChild("LocalClockDate")
local LocalClockDay = Frame.ClockPage:WaitForChild("LocalClockDay")
local HomeScreenApps = Frame:WaitForChild("HomeScreenApps"):GetChildren()


ClockButton.MouseButton1Click:Connect(function()
	local ClockPage = Frame.ClockPage:GetChildren()
	for _,v in pairs (ClockPage)do
		v.Visible = true
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = false
		print(v.Visible)
	end
end)

BackButton.MouseButton1Click:Connect(function()
	local ClockPage = Frame.ClockPage:GetChildren()
	for _,v in pairs (ClockPage)do
		v.Visible = false
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = true
	end
end)

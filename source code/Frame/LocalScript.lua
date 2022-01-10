local Frame = script.Parent
local lockHomeButton = Frame.LockScreenHome
local HomeScreen = Frame.Home

local mainHomeButton = Frame.HomeButton

lockHomeButton.MouseButton1Click:Connect(function()
	HomeScreen.Visible = true
	local homeapp = Frame.HomeScreenApps:GetChildren()
	
	for _, v in pairs (homeapp)do
		v.Visible = true
	end
	end)

mainHomeButton.MouseButton1Click:Connect(function()
	HomeScreen.Visible = false
	
	local homeapp = Frame.HomeScreenApps:GetChildren()
	local InfoPage = Frame.InfoPage:GetChildren()
	local MusicPage = Frame.MusicPage:GetChildren()
	local NotesPage = Frame.NotesPage:GetChildren()
	local ClockPage = Frame.ClockPage:GetChildren()
	local PhonePage = Frame.PhonePage:GetChildren()
	
	for _, v in pairs (homeapp)do
		v.Visible = false
	end
	for _, v in pairs (InfoPage)do
		v.Visible = false
	end
	for _, v in pairs (MusicPage)do
		v.Visible = false
	end
	for _, v in pairs (NotesPage)do
		v.Visible = false
	end
	for _, v in pairs (ClockPage)do
		v.Visible = false
	end
	for _, v in pairs (PhonePage)do
		v.Visible = false
	end
end)
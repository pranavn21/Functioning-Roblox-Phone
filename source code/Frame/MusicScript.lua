local Frame = script.Parent
local MusicButton = Frame.HomeScreenApps:WaitForChild("Music")
local MusicScreen = Frame.MusicPage:WaitForChild("MusicScreen")
local BackButton = Frame.MusicPage:WaitForChild("Back")
local PlayButton = Frame.MusicPage:WaitForChild("Play")
local MusicIDLabel = Frame.MusicPage:WaitForChild("MusicID")
local Music = game.Players.LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").Music
local MusicName = Frame.MusicPage:WaitForChild("MusicName")
local MusicNameValue = game.Players.LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").MusicNameValue

local PauseButton = Frame.MusicPage:WaitForChild("Pause")
local LoopButton = Frame.MusicPage:WaitForChild("Loop")
local Looped = Frame.MusicPage:WaitForChild("Looped")
local HomeScreenApps = Frame:WaitForChild("HomeScreenApps"):GetChildren()


MusicButton.MouseButton1Click:Connect(function()
	local MusicPage = Frame.MusicPage:GetChildren()
	for _,v in pairs (MusicPage) do
		v.Visible = true		
	end
	
	if Music.Looped then
		Looped.Text = "ON"
		else
		Looped.Text = "OFF"
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = false
	end
	
end)

BackButton.MouseButton1Click:Connect(function()
	local MusicPage = Frame.MusicPage:GetChildren()
	for _,v in pairs (MusicPage)do
		v.Visible = false
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = true
	end
end)

PlayButton.MouseButton1Click:Connect(function()
	
	local success, errormessage = pcall(function()
		local ID = MusicIDLabel.Text
		name = game:GetService("MarketplaceService"):GetProductInfo(ID).Name
		Music.SoundId = "rbxassetid://"..ID
		Music:Play()
	end)
	
	if success then
		print("sucess playing music")
		MusicName.Visible = true
		MusicName.Text = "Now Playing " .. name
		MusicNameValue.Value = MusicName.Text
	else
		warn(errormessage)
	end

end)

PauseButton.MouseButton1Click:Connect(function()
	Music.Playing = not Music.Playing
	
	if Music.Playing then 
		PauseButton.Image = "rbxgameasset://Images/pause"
	else
		PauseButton.Image = "rbxgameasset://Images/resume play"
	end
	
end)

LoopButton.MouseButton1Click:Connect(function()
	Music.Looped = not Music.Looped
	
	if Music.Looped then
		Looped.Text = "ON"
	else
		Looped.Text = "OFF"
	end
end)


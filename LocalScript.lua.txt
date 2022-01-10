--YOU NEED A SCREENGUI CALLED "ScreenGui"

local Tool = script.Parent
local Frame = Tool:WaitForChild("Frame") --Frame that will be copied

local Frame = script.Parent.Frame



if Frame then
	print("Found frame")
end

local Player = game.Players.LocalPlayer
local ScreenGui = Player.PlayerGui:WaitForChild("ScreenGui") -- Gui where it gonna be copied savage


Tool.Equipped:Connect(function(mouse)
    print(Tool.Name.. " was equipped by " .. game.Players.LocalPlayer.Name)
    newFrame = Frame:Clone()
	newFrame.Parent = ScreenGui
	newFrame.Active = true
	newFrame.Selectable = true
	newFrame.Draggable = true
	--while wait(1) do
	--	newFrame.Time.Text = game.Lighting.TimeOfDay
	--end
	local MusicName = newFrame.MusicPage:WaitForChild("MusicName")
	local MusicNameValue = script.Parent.MusicNameValue
	MusicName.Text = MusicNameValue.Value
	
	if MusicName.Parent.MusicScreen.Visible then
		MusicName.Visible = true
	end
end)

Tool.Unequipped:Connect(function(mouse)
	newFrame:Destroy()
end)
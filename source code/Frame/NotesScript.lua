local Frame = script.Parent
local NotesButton = Frame:WaitForChild("HomeScreenApps"):WaitForChild("Notes")
local BackButton = Frame.NotesPage:WaitForChild("Back")
local SaveButton = Frame.NotesPage:WaitForChild("Save")
local Notes = Frame.NotesPage:WaitForChild("Notes")
local Notes = Frame.NotesPage:WaitForChild("Notes")
local NotesValue = game.Players.LocalPlayer.Character:FindFirstChild("iExotic 11 Pro Max").NotesValue
local HomeScreenApps = Frame:WaitForChild("HomeScreenApps"):GetChildren()

NotesButton.MouseButton1Click:Connect(function()
	local NotesPage = Frame.NotesPage:GetChildren()
	for _,v in pairs (NotesPage)do
		v.Visible = true
	end
	Notes.Text = NotesValue.Value
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = false
	end
end)

BackButton.MouseButton1Click:Connect(function()
	local NotesPage = Frame.NotesPage:GetChildren()
	for _,v in pairs (NotesPage)do
		v.Visible = false
	end
	
	for _,v in pairs (HomeScreenApps)do
		v.Visible = true
	end
end)

SaveButton.MouseButton1Click:Connect(function()
	NotesValue.Value = Notes.Text
end)
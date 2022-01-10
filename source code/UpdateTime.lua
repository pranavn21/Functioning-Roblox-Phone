local Tool = script.Parent



	
Tool.Equipped:Connect(function(idk)
	local Frame = game.Players.LocalPlayer.PlayerGui.ScreenGui:WaitForChild("Frame")
	Frame.Owner.Text = game.Players.LocalPlayer.Name .. "'s iExotic 11 Pro Max"
	Frame.InfoPage:WaitForChild("OwnerInInfo").Text = game.Players.LocalPlayer.Name .. "'s iExotic 11 Pro Max"
	
	while wait(1) do
	Frame:WaitForChild("Time").Text = Convert24To12(game.Lighting.TimeOfDay)
	end
end)

function Convert24To12(time24)
	local hour = tonumber(string.sub(time24, 1 ,2))
	local others = string.sub(time24,3, (string.len(time24)-3))
	local newHour
	
	if hour == 0 then
		newHour = "12"..others.. " AM"
	elseif hour > 0 and hour < 12 then
		newHour = string.sub(time24, 2, (string.len(time24)-3)).. " AM"
	elseif hour == 12 then
		newHour = string.sub(time24,1, (string.len(time24)-3)).. " PM"
	elseif hour > 12 and hour < 24 then
		local hourNum = tonumber(hour)
		newHour = (hourNum-12) ..others.. " PM"
	end
	
	return newHour
end

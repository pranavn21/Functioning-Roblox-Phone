local Frame = script.Parent
local ClockButton = Frame:WaitForChild("HomeScreenApps"):WaitForChild("Clock")
local BackButton = Frame.ClockPage:WaitForChild("Back")
local ClockScreen = Frame.ClockPage:WaitForChild("ClockScreen")
local LocalClockTime = Frame.ClockPage:WaitForChild("LocalClockTime")
local GameClock = Frame.ClockPage:WaitForChild("GameClock")
local LocalClockDate = Frame.ClockPage:WaitForChild("LocalClockDate")
local LocalClockDay = Frame.ClockPage:WaitForChild("LocalClockDay")




function Convert24To12(time24)
	local hour = tonumber(string.sub(time24, 1 ,2))
	local others = string.sub(time24,3, string.len(time24))
	local newHour
	
	if hour == 0 then
		newHour = "12"..others.. " AM"
	elseif hour > 0 and hour < 12 then
		newHour = string.sub(time24, 2, string.len(time24)).. " AM"
	elseif hour == 12 then
		newHour = string.sub(time24,1, string.len(time24)).. " PM"
	elseif hour > 12 and hour < 24 then
		local hourNum = tonumber(hour)
		newHour = (hourNum-12) ..others.. " PM"
	end
	
	return newHour
end

function RealTimeCon()
	local var = os.date("*t", os.time())
	local hour12
	local AMorPM
	
	if var["hour"] == 0 then
		hour12 = 12
		AMorPM = "AM"
	elseif var["hour"] < 13 then
		hour12 = var["hour"]
		AMorPM = "AM"
	else
		hour12 = var["hour"]-12
		AMorPM = "PM"
	end
	
	local sec = var["sec"]
	if sec < 10 then
		sec = "0"..sec
	end
	
	LocalClockTime.Text = hour12..":"..var["min"]..":"..sec.." "..AMorPM
	
	-- FOR DATE
	
	local month
	if var["month"] == 1 then
		month = "January"
	elseif var["month"] == 2 then
		month = "February"
	elseif var["month"] == 3 then
		month = "March"
	elseif var["month"] == 4 then
		month = "April"
	elseif var["month"] == 5 then
		month = "May"
	elseif var["month"] == 6 then
		month = "May"
	elseif var["month"] == 7 then
		month = "July"
	elseif var["month"] == 8 then
		month = "August"
	elseif var["month"] == 9 then
		month = "September"
	elseif var["month"] == 10 then
		month = "October"
	elseif var["month"] == 11 then
		month = "November"
	else 
		month = "December"
	end
	
	LocalClockDate.Text = month .. " " .. var["day"] .. ", " .. var["year"]
	
	-- FOR DAY
	
	local day
	if var["wday"] == 1 then
		day = "Sunday"
	elseif var["wday"] == 2 then
		day = "Monday"
	elseif var["wday"] == 3 then
		day = "Tuesday"
	elseif var["wday"] == 4 then
		day = "Wednesday"
	elseif var["wday"] == 5 then
		day = "Thursday"
	elseif var["wday"] == 6 then
		day = "Friday"
	else
		day = "Saturday"
	end
	
	LocalClockDay.Text = day
end


	while true do
		wait(1)
		if ClockScreen.Visible then
			local success, errormessage = pcall(function()
			RealTimeCon()
			GameClock.Text = Convert24To12(game.Lighting.TimeOfDay)
			end)
			
			if not success then
				print(errormessage)
			end
			
		end
	end
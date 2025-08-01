set today to current date
set todayWeekday to weekday of today as integer
set daysUntilSunday to (8 - todayWeekday) mod 7
set nextSunday to today + (daysUntilSunday * days)
set weekDates to {}
repeat with i from 0 to 6
	set currentDate to nextSunday + (i * days)
	set end of weekDates to currentDate
end repeat

return weekDates

on replaceText(findText, replaceWith)
	tell application "System Events"
		keystroke "f" using {command down} -- Cmd+F
		delay 0.2
		keystroke findText
		delay 0.5
		key code 53 -- Esc
		delay 0.2
		key code 51 -- Delete
		delay 0.1
		keystroke replaceWith
	end tell
end replaceText

tell application "System Events"
	tell application process "Notes"
		set frontmost to true
	end tell
	
	delay 1
	my replaceText("dd/mm/aa", "03/08/25")
	delay 0.2
	my replaceText("dd/mm/aa", "09/08/25")
end tell
set today to current date
set todayWeekday to weekday of today as integer
set daysUntilSunday to (8 - todayWeekday) mod 7
set nextSunday to today + (daysUntilSunday * days)
set {year:y} to nextSunday
set firstOfYear to date ("1/1/" & y)
set firstWeekday to weekday of firstOfYear as integer
set diffDays to (nextSunday - firstOfYear) / days
set weekNumber to (diffDays + firstWeekday - 1) div 7 + 1
return weekNumber
set weekDates to {}
repeat with i from 0 to 6
	set currentDate to nextSunday + (i * days)
	set end of weekDates to currentDate
end repeat

on pad2(num)
	-- Convert number to string with leading zero if needed.
	return text -2 thru -1 of ("0" & num)
end pad2

on formatDateNoYear(d)
	set dayNum to day of d
	set dayStr to pad2(dayNum)
	set monthNum to month of d as integer
	set monthStr to pad2(monthNum)
	return dayStr & "/" & monthStr
end formatDateNoYear

on formatDateWithYear(d)
	set dayNum to day of d
	set dayStr to pad2(dayNum)
	set monthNum to month of d as integer
	set monthStr to pad2(monthNum)
	set yearNum to (year of d) mod 100
	return dayStr & "/" & monthStr & "/" & yearNum
end formatDateWithYear

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
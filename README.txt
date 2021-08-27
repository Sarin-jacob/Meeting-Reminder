============Meeting Reminder===============

To install the prgrm right click run.ps1 file and click 'Run with Powershell'.
The programe will ask user to input course name and time(24hrs) and links for the meetings.
if there are multiple link for a meeting please enter that course with slightly diff name.
Meeting links can be copied and paste using 'ctlr+V'

To change timetable open cmd and enter "python C:\class_timer\add_data.py"
To uninstall the programe run del.bat as administrator or Open cmd as Administrator and run
following commands:
-----------------------------
rmdir /s /q "C:\class_timer"
schtasks /delete /TN "Meeting Reminder" /f
-----------------------------
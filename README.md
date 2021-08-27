# Meeting Reminder
## Installation & Setup
---
Download and Extract the [PopMeet.zip](url) file then
* Run the `run.ps1` file with **PowerShell** by clickin *' run with PowerShell '* from the contex menu (Right clicking)<br><br>
![context menu](https://www.tenforums.com/attachments/tutorials/161429d1509470221-powershell-scripting-update-windows-10-usb-install-media-image.png)
---
The programe will ask user to input course name and time (24hrs). It should be entered in the give form.
>`lab 14.30`


```
Enter time table  format :: course<space>hour<.>min eg:lab 14.30

Enter Courses and Timing(24hrs) for Monday       press Enter after done

Science 10.45
```
***
Meeting links can be copied and paste using '`ctlr + V`' shortcut.


```
Enter Meeting link for english_2 :
meeting url goes here

Enter Meeting link for math :


Enter Meeting link for english :
web.smthing.smthing

Enter Meeting link for lab :
we need offline classes!!

Enter Meeting link for science :
```
<p style="color:lightgreen">
<b> &emsp;&emsp;&emsp;Note : </b>&thinsp; If there are multiple link for a course, please enter that course with slightly different name so that it appears as diffrent course.</p>


If there is any error in  the *time table* or If you need to change the time table, Run the following Command on cmd.
```
python C:\class_timer\add_data.py
```

---
There are two choice of notification sounds are available now. 
-![Notification]()

You can add another notification by:
-   Copy the `.wav` file to `C:\class_timer\sound\`
-   Opening `popup.py` file located at `C:\class_timer`
-   Find `.wav` & change the name to the one you copied.
---
Provide the Administrative password when asked. This is for creating new task.
this task runs the `do.pyw` file at startup.

You can change the task by going to<br>
&emsp; Windows Task Scheduler --> Meeting Reminder --> Properties
![task scheduler]()

---
## Uninstalling
To uninstall the programe run `del.bat` as administrator
##### &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; OR 
 Open cmd as Administrator and run
following commands:
```
rmdir /s /q "C:\class_timer"
schtasks /delete /TN "Meeting Reminder" /f
```


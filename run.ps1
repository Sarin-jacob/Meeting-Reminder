param([switch]$Elevated)
function Test-Admin {
$currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())

$currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}
if ((Test-Admin) -eq $false)
{
if ($elevated) {
# tried to elevate, did not work, aborting

}
else {
Expand-Archive -Path "popup.zip" -DestinationPath "c:/class_timer"
timeout 3
Set-executionpolicy remotesigned -Scope CurrentUser
Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}
Exit
}




cd c:/class_timer
$p = iex 'python -V'
if ( -not ($p -like 'Python 3*')){
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri "https://www.python.org/ftp/python/3.9.6/python-3.9.6-amd64.exe" -OutFile "c:/temp/python-3.9.6.exe"
c:/temp/python-3.9.6.exe /quiet InstallAllUsers=0 PrependPath=1 Include_test=0
echo "`n `t Do Not skip Countdown its necessary!"
timeout 120
pause
}
echo "`nPlease Note: The following command will let you add the time table and to go to next day just press 'Enter'. `n`tAfter this you can enter the links for the appropriate classes. so do collect the meeting links before proceding.`n`t In case time table was not added correctly or the success msg didnt come. You can open cmd n enter `n`t'python c:\class_timer\add_data.py'`n."
pause
python c:/class_timer/add_data.py

timeout 1
echo "`nChoose which one of the following as the notification sound"
$PlayWav=New-Object System.Media.SoundPlayer
echo "`nFirst One"
$PlayWav.SoundLocation="C:/class_timer/sound/pleasant.wav"
$PlayWav.playsync()
echo "`nSecond One"
$PlayWav.SoundLocation="C:/class_timer/sound/bike.wav"
$PlayWav.playsync()

$again=Read-Host -Prompt 'Press 0 to play again'
if($again -eq 0){
echo "`nFirst One"
$PlayWav.SoundLocation="C:/class_timer/sound/pleasant.wav"
$PlayWav.playsync()
echo "`nSecond One"
$PlayWav.SoundLocation="C:/class_timer/sound/bike.wav"
$PlayWav.playsync()
}

$sound=Read-Host -Prompt 'Press 1 for the first one or 2 for the second one '
if ($sound -eq 2){
(Get-Content c:\class_timer\popup.py) -replace 'pleasant.wav', 'bike.wav' | Set-Content c:\class_timer\popup.py
}


timeout 3
echo "`nFor the script to run on start up it must be added to task scheduler. but authentication is necessary to create the task.`n NB : the required password is the password of administrator,which is usually the password used to log on to computer(not the pin). `n"

pause
$comp= cmd.exe /c echo %COMPUTERNAME%
$uses = cmd.exe /c  echo %USERNAME%
schtasks /create /xml "c:/class_timer/Meeting_Reminder.xml" /tn "Meeting Reminder" /ru "$comp\$uses"
Start-ScheduledTask -TaskName "Meeting Reminder"
echo "Pogramme ended!"
timeout 5
stop-process -Id $PID
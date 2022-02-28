rem =================================================================================================
rem = Sorry for my shitcoding and my English... This is my first program, and yea... batch language =
rem =================================================================================================

@ECHO OFF>nul
@title pod0cleaner - by Bogdan Taran
@chcp 866
cls
@COLOR A
:ask
cls
REM Admin perms check
NET SESSION >nul 2>&1

ECHO ÉÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ»
ECHO ³ ÛÛ²ÛÛÛ  ²ÛÛÛÛÛÜ  ÜÛÛÛÛÜ   ÛÛ²    ²ÛÛÛÛÛ ÜÜÜ       ÛÛÛÜ    Û ²ÛÛÛÛÛ  ÛÛßÛÛÛ  ³
ECHO ³²ÛÛ°  ÛÛ±±ÛÛß ÛÛÝ±ÛÛß ßÛ  ²ÛÛ±    ²Û   ß±ÛÛÛÛÜ     ÛÛ ßÛ   Û ²Û   ß ²ÛÛ ± ÛÛ±³
ECHO ³²ÛÛ° ÛÛ²±°ÛÛ   ÛÝ±²Û    Ü ±ÛÛ°    ±ÛÛÛ  ±ÛÛ  ßÛÜ  ²ÛÛ  ßÛ ÛÛ±±ÛÛÛ   ²ÛÛ °ÜÛ ±³
ECHO ³±ÛÛÜÛ²± ±°²ÛÜ   Ý±²²Ü ÜÛÛ±±ÛÛ°    ±²Û  Ü°ÛÛÜÜÜÜÛÛ ²ÛÛ±  ÞÝÛÛ±±²Û  Ü ±ÛÛßßÛÜ  ³
ECHO ³±ÛÛ± °  °°±ÛÛÛÛ² ± ²ÛÛÛß °°ÛÛÛÛÛÛ±°±ÛÛÛÛ±²Û   ²ÛÛ±±ÛÛ°   ²ÛÛ°°±ÛÛÛÛ±°ÛÛ² ±ÛÛ±³
ECHO ³±²±° °  ° ±±²  ± ° °± ±  °° ±°²  °°° ±° °±±   ²±Û°° ±°   ± ± °° ±° °° ±² °±²°³
ECHO ³°± °      ° ±  ±   °  ±   ° ° ±  ° ° °  ° ±   ±± °° °°   ° ±° ° °  °  °± ° ±°³
ECHO ³°°        ° °  ° °          ° °      °    °   ±      °   ° °    °     °°   ° ³
ECHO ³            °    ° °          °  °   °  °     °  °         °    °  °   °     ³
ECHO ³          °      °                                                           ³
ECHO ³                                                                             ³
ECHO ³                                                                             ³
ECHO ³1 - Start clean                                                              ³
ECHO ³2 - Secret Fodler                                                            ³
ECHO ³3 - Functional                                                               ³
ECHO ³4 - Clear folder temp  
ECHO i5 - Exit.                                                                 ³
ECHO ÈÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ¼
SET /p doset="Your choice: " 
ECHO.
IF "%doset%"=="1" (goto da)
IF "%doset%"=="2" (goto hider)
IF "%doset%"=="3" (goto list)
IF "%doset%"=="4" (goto clear)
IF "%doset%"=="5" (exit)
:da
cls
title Cleaning...
echo Cleaning...
REM I think there are all windows history directories... 
	(
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\BagMRU" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\BagMRU" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\Shell\Bags" /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\FirstFolder" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSavePidlMRU"
	REG DELETE "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist" /f
	REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\UserAssist"
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\AppCompatCache" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Control\Session Manager\AppCompatCache" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications" /f
	REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\RADAR\HeapLeakDetection\DiagnosedApplications"
	FOR /F "tokens=2" %%i IN ('whoami /user /fo table /nh') DO SET usersid=%%i
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Search\RecentApps"
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\bam\UserSettings\%usersid%" /va /f
	REG DELETE "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\bam\UserSettings\%usersid%" /va /f
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" /va /f
	REG DELETE  "HKEY_USERS\%usersid%\Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers" /va /f
	REG DELETE "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f
	REG ADD "HKEY_USERS\%usersid%\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2"
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\*.*
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\CustomDestinations\*.*
	DEL /f /q %APPDATA%\Microsoft\Windows\Recent\AutomaticDestinations\*.*
	DEL /f /q %systemroot%\Panther\*.*
	DEL /f /q %systemroot%\appcompat\Programs\*.txt
	DEL /f /q %systemroot%\appcompat\Programs\*.xml
	DEL /f /q %systemroot%\appcompat\Programs\Install\*.txt
	DEL /f /q %systemroot%\appcompat\Programs\Install\*.xml
	DEL /f /q %systemroot%\Prefetch\*.pf
	DEL /f /q %systemroot%\Prefetch\*.ini
	DEL /f /q %systemroot%\Prefetch\*.7db
	DEL /f /q %systemroot%\Prefetch\*.ebd
	DEL /f /q %systemroot%\Prefetch\*.bin
	DEL /f /q %systemroot%\Prefetch\*.db
	DEL /f /q %systemroot%\Prefetch\ReadyBoot\*.fx
	DEL /f /q %systemroot%\Minidump\*.*
	FOR /F "tokens=*" %%G in ('wevtutil.exe el') DO (call :do_clear "%%G")
	)>nul 2>&1
ECHO.
cls
echo Done...
PAUSE>nul
goto ask
:hider
title Secret Folder...
cls
@reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v Hidden /t REG_DWORD /d 2 /f
@reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v ShowSuperHidden /t REG_DWORD /d 1 /f
@if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
@if NOT EXIST Secret goto MDPrivate
:CONFIRM
echo Do you want to hide folder? (Yes/No)
set/p "cho=>"
if %cho%==„  goto LOCK
if %cho%==„ goto LOCK
if %cho%==¤  goto LOCK
if %cho%==¤ goto LOCK
if %cho%==Yes goto LOCK
if %cho%==yes goto LOCK
if %cho%==Y goto LOCK
if %cho%==y goto LOCK
if %cho%==¥â goto ask
if %cho%== goto ask
if %cho%==­¥â goto ask
if %cho%==­ goto ask
if %cho%==No goto ask
if %cho%==no goto ask
if %cho%==N goto ask
if %cho%==n goto ask
cls
pause>nul
goto CONFIRM
:LOCK
ren Secret "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder was hided!
pause>nul
goto ask
:UNLOCK
cls
echo Enter password:
set/p "pass=>"
if NOT %pass%==topsecret goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Secret
echo Folder was showed!
pause>nul
goto ask
:FAIL
echo !!!Wrong password!!!
echo 
pause>nul
goto unlock
:MDPrivate
md Secret
goto CONFIRM

:list
@title pod0cleaner - by Bogdan Taran
start https://github.com/loskal1/zer0/blob/master/README.md
cls
goto ask
:do_clear
cls
@ECHO OFF
ECHO Žç¨áâª  ¦ãà­ «  %1
wevtutil.exe cl %1
GOTO :eof
:errNoAdmin
title !!!!!!!!!!!!!!!ERROR!!!!!!!!!!!!!!!
cls
@ECHO OFF
COLOR 4
ECHO You must to start program as administrator.
ECHO.
PAUSE
exit
 :clear
@title Clear 
cls
@ECHO OFF
ECHO Cleaning folder Temp
del C:\Users\%username%\AppData\Local\Temp /f /s /q

rd C:\Users\%username%\AppData\Local\Temp /s /q

del c:\Windows\Temp /f /s /q

rd c:\Windows\Temp /s /q

ECHO.
PAUSE
exit
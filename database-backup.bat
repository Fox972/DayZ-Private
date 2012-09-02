@echo off 
color 1e

echo ©©©       DayZ Database Backup Script by ShadowDuke        ©©©
echo ©©©                                                        ©©©
echo ©©©                                                        ©©©
echo ©©© This Script will backup your database every 10 minutes ©©©
echo ©©©    to the following directory \#BACKUP#\data\dayz\     ©©©
echo ©©©   To end this Script, just close it or press ctrl+c!   ©©©
echo ©©©                                                        ©©©
echo.
echo.

SET SOURCE="server_setup\xampp\mysql\data\dayz"
SET TARGET="#BACKUP#\data\dayz"

echo Do you want to backup your DayZ Database?
echo.
echo [Y/N]
echo.
echo.

set /p copy=
if /i %copy%==Y goto Y
exit

:Y
xcopy "%SOURCE%" "%TARGET%" /s /i /q /y

REM set timeout /T <seconds> to your choice
timeout /T 600  > nul
for /L %%N IN (1, 1, 1) DO goto Y

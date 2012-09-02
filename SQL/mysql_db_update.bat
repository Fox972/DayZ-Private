@echo off
cd ..
cd server_setup\xampp
start /min mysql_start.bat
cd ..
cd ..
cd SQL
echo Enter the name of the update you want to install
echo remember to add the extension (.sql) and press Enter
echo.
set /p filename="Enter file name:  "
echo.
ECHO Running update %filename%
mysql -u root -p123456 --port 3306 dayz < %filename%
cd ..
cd server_setup\xampp
start /min mysql_stop.bat
echo Update completed!
pause
taskkill /IM cmd.exe /F &
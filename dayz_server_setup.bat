@echo off
echo #########################################################################
echo #                                                                       #
echo #         Welcome in Guru Abdul's DayZ server instalation.              #
echo #     This little script will help you to start up a DayZ server.       #
echo #       If you have any trouble, please report on Tunngle forum.        #
echo #                                                                       #
echo #                                        Installer created by ConanHUN  #
echo #                                               modified by ShadowDuke  #
echo #########################################################################
echo.
if exist server_setup\perl\bin\perl.exe (goto menu) else (goto perl)
if exist server_setup\xampp\xampp_start.exe (goto menu) else (goto xampp)

:instance
cls
echo Choose your instance ID for this server (1-999...)
set /P instance=Instance ID: 
echo.
echo How many CPU cores you wanna use for the server? (recommended: 2+)
set /P core=CPU core(s): 

del MPMissions\DayZAbdul_%instance%.Chernarus.pbo
taskkill /IM mysql.exe /F &
taskkill /IM mysqld.exe /F &
@start server_setup\xampp\mysql\bin\mysqld.exe --defaults-file=server_setup\xampp\mysql\bin\my.ini
cls
echo "Please wait...Loading"
ping -n 10 127.0.0.1>nul
 
server_setup\BatchSubstitute.bat "123" %instance% server_setup\sql\instance.sql>server_setup\sql\instance_%instance%.sql & server_setup\xampp\mysql\bin\mysql.exe -u dayz -p123456 --port 3306 dayz < server_setup\sql\instance_%instance%.sql & taskkill /IM mysqld.exe /F & server_setup\BatchSubstitute.bat "instanceid" %instance% server_setup\config.cfg>Sanctuary\config.cfg & server_setup\BatchSubstitute.bat "vehicles.pl 123" "vehicles.pl %instance%" server_setup\server.cfg>server_setup\server_core.bak & server_setup\BatchSubstitute.bat "corenumber" %core% server_setup\server_core.bak>dayz_server.bat & server_setup\BatchSubstitute.bat "123" %instance% server_setup\init.cfg>server_setup\DayZAbdul.Chernarus\init.sqf & server_setup\cpbo.exe -p server_setup\DayZAbdul.Chernarus MPMissions\DayZAbdul_%instance%.Chernarus.pbo & del server_setup\*.bak & pause & start dayz_server_setup.bat

:perl
echo Looks like this is the first time that you run the installation.
echo If you ready to install, press any key to continue. (1GB free space need)
pause
server_setup\tools\dotNetFx45_Full_setup.exe & server_setup\tools\vcredist_x86.exe & server_setup\patch\ARMA2_OA_Build_96493.exe & server_setup\vehicle_fix.reg
server_setup\rar.exe x server_setup\perl.rar server_setup\ & cls & if exist server_setup\xampp\xampp_start.exe (goto menu) else (goto xampp)

:xampp
server_setup\rar.exe x server_setup\xampp.rar server_setup\ & cls & goto updates

:updates
cd server_setup\xampp
start /min mysql_start.bat
cd ..
cd ..
cd SQL
echo Installing database update v2.4. This may take up a minute.
ping 127.0.0.1 -n 5 >NUL
mysql -u root -p123456 --port 3306 dayz < dayz2_4.sql
echo DB Update v2.3 Completed successfully
ping 127.0.0.1 -n 1 >NUL
cd ..
cd server_setup\xampp
start /min mysql_stop.bat
taskkill /IM cmd.exe /F &

:menu
cls
echo Welcome in the Server Setup menu. 
echo This little script help you to start your own DayZ (Lingor) server.
echo.
echo 0 - Reinstall the server
echo.
echo 1 - Change your ArmA 2 and OA CD keys
echo 2 - Generate DayZ Server starter and instance file
echo 3 - Install the latest supported Beta patch (96493)
echo 4 - If you don't see any vehicles, select this to fix it
echo 5 - Read infos about Online Server!
echo 6 - Edit server config file
echo 7 - Clean objects database
echo 8 - Install database updates
echo 9 - Switch between Online / LAN mode
echo.
echo A - Start the server
echo B - Stop all servers
echo C - If you're running Windows 2008 Server, press here!


echo.
set /P menu=Select a number: 
if "%menu%"=="0" goto reinstall
if "%menu%"=="1" start server_setup\arma2_keygen.exe & server_setup\cdkey_changer.bat & goto menu
if "%menu%"=="2" goto instance
if "%menu%"=="3" cls & echo Please wait... & server_setup\patch\ARMA2_OA_Build_96493.exe & server_setup\BatchSubstitute.bat "96476" "96493" Sanctuary\config.cfg>Sanctuary\config2.cfg & del Sanctuary\config.cfg & ren Sanctuary\config2.cfg config.cfg & goto menu
if "%menu%"=="4" server_setup\vehicle_fix.reg & cls & echo Vehicle fix installed. & pause & goto menu
if "%menu%"=="5" goto badkey
if "%menu%"=="6" server_setup\notepad\notepad++.exe Sanctuary\config.cfg & goto menu
if "%menu%"=="7" goto clean
if "%menu%"=="8" goto updates
if "%menu%"=="9" goto lanmode

if "%menu%"=="a" goto startserer
if "%menu%"=="b" goto stopserver
if "%menu%"=="c" goto win2k8server


:reinstall
cls
echo Are you sure you want to reinstall the DayZ Server?
echo.
set /P reinstall=Yes or no: 
if "%reinstall%"=="yes" RD /S /Q server_setup\xampp & taskkill /IM mysql.exe /F & taskkill /IM mysqld.exe /F & goto xampp & goto menu
if "%reinstall%"=="no" goto menu

:win2k8server
cls
echo Moving @Arma2NET files to \expansion\beta?
echo.
echo [Y/N]
set /p move=
if /i %move%==Y goto Y
exit

:Y
move @Arma2NET\*.* expansion\beta\
move @Arma2NET\AddIns expansion\beta\
rmdir /s /q @Arma2NET\
echo Update completed!
pause
goto menu

:clean
cls
echo Are you sure you want to clean the objects database?
echo.
set /P clean=Yes or no: 
if "%clean%"=="yes" taskkill /IM mysqld.exe /F & @start server_setup\xampp\mysql\bin\mysqld.exe --defaults-file=server_setup\xampp\mysql\bin\my.ini & cls & echo "Please wait...Loading" & ping -n 10 127.0.0.1>nul & server_setup\xampp\mysql\bin\mysql.exe -u root -p123456 --port 3306 dayz < server_setup\sql\clean.sql & echo Object table cleaned! & pause & goto menu
if "%clean%"=="no" goto menu

:badkey
cls
echo Block the following ports:
echo UDP 29910 outbound port in your Firewall software.
echo.
echo 27900 - Online server list (just to block online server list, not needed though)
echo 29910 - Key server
echo.
echo Online - block 29910 (so people with non legit keys can connect, too)
echo LAN 	- block both ports
echo.
echo If you are use Windows Firewall in Windows, just press any key to open the 
echo Firewall manager.
pause
echo.
echo What is the Windows partition? (C, D, E, etc...)
set /P drive=Select the partition: 
mmc %drive%:\Windows\system32\wf.msc
cls
goto menu

:time
cls
echo You can change the time on your server and can set 
echo different time every instance.
echo.
echo Example: To achieve GMT-3 for a server located in Poland GMT+1, you should use -4 as timezone.
echo.
set /P instance=Your instance ID: 
set /P time=Set the timezone on your instance:  
cls
echo Instance ID: %instance%
echo Timezone: %time%
echo.
echo Is this correct? (yes/no)
echo.

:lanmode
cls
echo BattlEye is forced "always on"
echo You can disable it through config though
echo.
echo [Cherno/Lingor]
echo.
echo.
set /p Choice=
if /i %Choice%==Cherno goto Cherno
if /i %Choice%==Lingor goto Lingor
:Cherno
echo 1 - Online (BattlEye=on)
echo 2 - LAN (Tunngle, BattlEye=on)
echo.
set /P lanmode=Select a number: 
if "%lanmode%"=="1" server_setup\BatchSubstitute.bat "127.0.0.1" "arma2oapc.master.gamespy.com" Sanctuary\config.cfg>Sanctuary\config2.cfg & server_setup\BatchSubstitute.bat "BattlEye" "BattlEye" Sanctuary\config2.cfg>Sanctuary\config.cfg & del Sanctuary\config2.cfg & goto menu
if "%lanmode%"=="2" server_setup\BatchSubstitute.bat "arma2oapc.master.gamespy.com" "127.0.0.1" Sanctuary\config.cfg>Sanctuary\config2.cfg & server_setup\BatchSubstitute.bat "BattlEye" "BattlEye" Sanctuary\config2.cfg>SSanctuary\config.cfg & del Sanctuary\config2.cfg & goto menu
:Lingor
echo 1 - Online (BattlEye=on)
echo 2 - LAN (Tunngle, BattlEye=on)
echo.
set /P lanmode=Select a number: 
if "%lanmode%"=="1" server_setup\BatchSubstitute.bat "127.0.0.1" "arma2oapc.master.gamespy.com" Sanctuary\config_lingor.cfg>Saintly\config_lingor2.cfg & server_setup\BatchSubstitute.bat "BattlEye" "BattlEye" Sanctuary\config_lingor2.cfg>SSanctuary\config_lingor.cfg & del Sanctuary\config_lingor2.cfg & goto menu
if "%lanmode%"=="2" server_setup\BatchSubstitute.bat "arma2oapc.master.gamespy.com" "127.0.0.1" Sanctuary\config_lingor.cfg>Saintly\config_lingor2.cfg & server_setup\BatchSubstitute.bat "BattlEye" "BattlEye" Sanctuary\config_lingor2.cfg>SSanctuary\config_lingor.cfg & del Sanctuary\config_lingor2.cfg & goto menu

:startserer
cls
if exist dayz_server.bat (dayz_server.bat) else (goto instance)

:stopserver
cls
taskkill /IM arma2oaserver.exe /F
goto menu

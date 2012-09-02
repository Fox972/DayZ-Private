@echo off
taskkill /IM mysql.exe /F &
taskkill /IM mysqld.exe /F &
taskkill /IM arma2oaserver.exe /F &
@start server_setup\xampp\mysql\bin\mysqld.exe --defaults-file=server_setup\xampp\mysql\bin\my.ini
cls
echo "Please wait...Loading"
ping -n 10 127.0.0.1>nul
"Expansion\beta\arma2oaserver.exe" -port=2302 "-config=Sanctuary\config.cfg" "-cfg=Sanctuary\basic.cfg" "-profiles=Sanctuary" -name=Sanctuary "-mod=@CBA;@CBA_OA;@CBA_A2;@Arma2NET;@DayZ;@Sanctuary;" -cpuCount=4 -maxMem=1578

cd server_setup\xampp & mysql_stop.bat
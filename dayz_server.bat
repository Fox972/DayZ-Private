@echo off
taskkill /IM mysql.exe /F &
taskkill /IM mysqld.exe /F &
taskkill /IM arma2oaserver.exe /F &
@start server_setup\xampp\mysql\bin\mysqld.exe --defaults-file=server_setup\xampp\mysql\bin\my.ini
cls
echo "Please wait...Loading"
ping -n 10 127.0.0.1>nul
server_setup\perl\bin\perl -w vehicles.pl --cleanup 1 --world chernarus dayz root 123456
"Expansion\beta\arma2oaserver.exe" -port=2302 "-config=Sanctuary\config.cfg" "-cfg=Sanctuary\basic.cfg" "-profiles=Sanctuary" -name=Sanctuary "-mod=@Arma2NET;@CBA;@CBA_OA;@CBA_A2;@DayZ;@Sanctuary;" -cpuCount=2 -maxMem=1578 -exThreads=1
cd server_setup\xampp & mysql_stop.bat
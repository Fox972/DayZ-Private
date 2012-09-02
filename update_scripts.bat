@echo off
util\wget.exe -N http://dayz-community-banlist.googlecode.com/git/filters/scripts.txt
util\wget.exe -N http://dayz-community-banlist.googlecode.com/git/filters/remoteexec.txt
util\wget.exe -N http://dayz-community-banlist.googlecode.com/git/filters/createvehicle.txt
move /y scripts.txt sanctuary/BattlEye/
move /y remoteexec.txt sanctuary/BattlEye/
move /y createvehicle.txt sanctuary/BattlEye/
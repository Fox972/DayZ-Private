**DayZ-Private**
================

**1.**
Copy all files to ArmA2 main directory. (Steam Arma2OA dir)

**2.**
Run **dayz_server_setup.bat** and follow instructions

**3.**
Start Server with **dayz_server.bat** to spawn Vehicles, see N O T E S

**4.**
Start Game with **dayz_game.bat**


**DayZ-Lingor Island**
======================

**To make a Lingor Server, you have to do step 1 and 2 from DayZ-Private aswell**

**1.**
Download Lingor Island v.034 http://www.load.to/ggWB6nQmt1/DayZ_Lingor_Island_034_full.part1.rar & http://www.load.to/jgBcQKnZE8/DayZ_Lingor_Island_034_full.part2.rar

Mirror: http://jumbofiles.com/m9lln7c1ejrh

Extract **DayZ_Lingor_Island.rar** to your ArmA2 directory

**1a.**
Download Lingor Island Update (033_to_034) http://www.load.to/fM6O6dE1zw/DayZ_Lingor_Island_033_to_034_Patch.rar

Read **Readme!!!.txt** in Update Archive

**For Server:**

**2.**
Backup your old database and/or create a new one, with dayz (db-name)

**3.**
Execute SQL File **\server_setup\sql\lingor_spawns.sql** in your SQL Databse

**4.**
Edit **dayz_lingor_server.bat** for your cpu cores, etc.

	-cpuCount=4 -maxMem=1578
	
**5.**
Start Server with **dayz_lingor_server.bat**

**For Client:**

**6.**
Start Game with **dayz_lingor_game.bat** (maybe edit before, for cpu cores, e.g.)

**Batch files for easier setup will be changed in the future**


**N O T E S**
=============

To run the Server without the vehicle spawn script, start with **dayz_server_wo_vehicles.bat**

If you have problems spawning the vehicles.

* Edit vehicles.pl in main arma2 directory
* Go to line 30 (**args{'instance'} : '1',**) and enter the Number for Instance you chose in the Setup before.
* Go to line 31 (**$args{'limit'} : '50',**) and enter a Number for how many vehicles you like to spawn.
* If you need to change the port, db-name, login etc. look at the lines below.
* Now save the file and run Server with **dayz_server.bat**

**About the Vehicle Sapwn Script:**

Lets say you chose to Spawn 50 vehicles. You will notice, that the spawn script wont spawn the whole
50 vehicles at once. Just close the Server and keep starting dayz_server.bat until you reached the
Number for the vehicles you want to spawn.

**Manual applying SQL Databse Updates**

Apply sql-db (e.g. dayz2_3.sql) execute it in navicat or what sql program you are using.

or to apply updates, create database named "dayz" in sql - go /SQL/ and start mysql_db_update.bat and follow instructions.

**Custom Loadout**
==================

* Open database `dayz` and start editing the `instances` table.
* Default is []

**Example**

	[["ItemMap","ItemCompass","ItemMatchbox","FoodCanBakedBeans","ItemKnife","FoodCanBakedBeans"],["ItemTent","ItemBandage","ItemBandage"]]
	
**Timezone**
============
* Open database `dayz` and start editing the `instances` table.
* Now set the timezone for your instance by inputing a desired integer into the field (NOTE: The timezone is relative to your mysql server).

**Example**

	To achieve GMT-3 for a server located in Poland GMT+1, you should use -4 as timezone
	
**Troubleshooting & FAQ**
========================

* For Windows 2008 Server (or similar) start dayz_server_setup.bat and press "C"!
* To run more Servers you just need a separate arma2oa install (arma2oaserver.exe) and own configs.
* To host a Server online, look at dayz_server_setup.bat, press 9 & 5 and dont forget to open ports regarding your DMZ.


***©Special Thanks to the following people©***

*Guru Abdul*, *ConanHUN* & *ayan4m1*
SET FOREIGN_KEY_CHECKS=0;
CREATE DATABASE  IF NOT EXISTS `dayz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dayz`;

-- ----------------------------
-- Table structure for `instances`
-- ----------------------------
DROP TABLE IF EXISTS `instances`;
CREATE TABLE `instances` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `instance` int(2) unsigned NOT NULL COMMENT 'Identification number for instance',
  `timezone` int(1) NOT NULL DEFAULT '0' COMMENT 'Set the timezone for the instance relative to the DB time',
  `loadout` varchar(1024) NOT NULL DEFAULT '[]' COMMENT 'Starting inventory for every player. Has to be a valid inventory string to work',
  `mvisibility` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Sets which messages will be executed by the scheduler',
  `reserverd` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Not yet implemented',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of instances
-- ----------------------------
INSERT INTO `instances` VALUES ('1', '1', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('2', '2', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('3', '3', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('4', '4', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('5', '5', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('6', '6', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('7', '7', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('8', '8', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('9', '9', '0', '[]', '0', '0');
INSERT INTO `instances` VALUES ('10', '10', '0', '[]', '0', '0');

-- ----------------------------
-- Table structure for `log_code`
-- ----------------------------
DROP TABLE IF EXISTS `log_code`;
CREATE TABLE `log_code` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_log_code` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_code
-- ----------------------------
INSERT INTO `log_code` VALUES ('1', 'Login', 'Player has logged in');
INSERT INTO `log_code` VALUES ('2', 'Logout', 'Player has logged out');
INSERT INTO `log_code` VALUES ('3', 'Ban', 'Player was banned');
INSERT INTO `log_code` VALUES ('4', 'Connect', 'Player has connected');
INSERT INTO `log_code` VALUES ('5', 'Disconnect', 'Player has disconnected');

-- ----------------------------
-- Table structure for `log_entry`
-- ----------------------------
DROP TABLE IF EXISTS `log_entry`;
CREATE TABLE `log_entry` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `profile_id` int(11) unsigned NOT NULL,
  `log_code_id` int(11) unsigned NOT NULL,
  `text` varchar(1024) DEFAULT '',
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_entry
-- ----------------------------

-- ----------------------------
-- Table structure for `main`
-- ----------------------------
DROP TABLE IF EXISTS `main`;
CREATE TABLE `main` (
  `id` int(8) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(128) NOT NULL COMMENT 'Player ID generated from CDKEY used for identification',
  `name` varchar(32) NOT NULL DEFAULT 'GI Joe' COMMENT 'Name of the player',
  `pos` varchar(255) NOT NULL DEFAULT '[]' COMMENT 'Position of the player. [] means random at the beach',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `backpack` varchar(2048) NOT NULL DEFAULT '[]',
  `medical` varchar(255) NOT NULL DEFAULT '[false|false|false|false|false|false|false|12000|[]|[0|0]|0]' COMMENT 'Medical values of the player. [] means defaults',
  `death` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Is player dead? 0 for alive, 1 for dead',
  `model` varchar(128) NOT NULL DEFAULT 'Survivor2_DZ' COMMENT 'Model of the player',
  `state` varchar(128) NOT NULL DEFAULT '[""|"aidlpercmstpsnonwnondnon_player_idlesteady04"|36]' COMMENT 'Last state the player was in',
  `humanity` int(2) NOT NULL DEFAULT '2500',
  `hkills` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Human kills',
  `bkills` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Bandit kills',
  `kills` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Zombie kills',
  `hs` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Zombie headshots',
  `late` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Last time player ate in mins',
  `ldrank` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Last time player drank in mins',
  `stime` int(2) unsigned NOT NULL DEFAULT '0' COMMENT 'Playtime in minutes',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update to the player data',
  `survival` datetime NOT NULL COMMENT 'Creation date of the account used to calculate survival time',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of main
-- ----------------------------

-- ----------------------------
-- Table structure for `objects`
-- ----------------------------
DROP TABLE IF EXISTS `objects`;
CREATE TABLE `objects` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(50) NOT NULL DEFAULT '0' COMMENT 'Object game generated ID',
  `pos` varchar(255) NOT NULL DEFAULT '[]' COMMENT 'Postition of the object',
  `inventory` varchar(2048) NOT NULL DEFAULT '[]',
  `health` varchar(1024) NOT NULL DEFAULT '[]' COMMENT 'Broken parts of the object',
  `fuel` double NOT NULL DEFAULT '0' COMMENT 'Ammount of fuel. 0-1',
  `damage` double NOT NULL DEFAULT '0' COMMENT 'Overall damage value. 0-1',
  `otype` varchar(255) NOT NULL DEFAULT 'none' COMMENT 'Type of the object',
  `oid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Owner of the object. Only relevant for tents',
  `instance` int(11) unsigned NOT NULL DEFAULT '0' COMMENT 'Instance number in which object resides',
  `lastupdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last update to the object',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of objects
-- ----------------------------

-- ----------------------------
-- Table structure for `scheduler`
-- ----------------------------
DROP TABLE IF EXISTS `scheduler`;
CREATE TABLE `scheduler` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(1024) NOT NULL COMMENT 'Text of the message',
  `mtype` varchar(1) NOT NULL DEFAULT 'm' COMMENT 'Type of the message: g Global, m Side, l Logic, s Script',
  `looptime` int(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The time delay before the message is executed again. 0 means message will be executed only ones',
  `mstart` int(3) unsigned NOT NULL DEFAULT '10' COMMENT 'The time before the message is processed in seconds',
  `visibility` int(1) unsigned NOT NULL DEFAULT '0' COMMENT 'Set on which instance message will be executed',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scheduler
-- ----------------------------
INSERT INTO `scheduler` VALUES ('4', 'Hello! I\'m your new scheduler system!', 'l', '0', '3', '0');

-- ----------------------------
-- Table structure for `spawns`
-- ----------------------------
DROP TABLE IF EXISTS `spawns`;
CREATE TABLE `spawns` (
  `id` int(2) unsigned NOT NULL AUTO_INCREMENT,
  `pos` varchar(128) NOT NULL COMMENT 'Spawn location',
  `otype` varchar(128) NOT NULL DEFAULT 'Smallboat_1' COMMENT 'Type of the spawning object',
  `uuid` int(2) unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of spawns
-- ----------------------------
INSERT INTO `spawns` VALUES ('1', '[0,[12140.168, 12622.802,0]]', 'UAZ_Unarmed_TK_EP1', '1');
INSERT INTO `spawns` VALUES ('2', '[0,[6279.4966, 7810.3691,0]]', 'UAZ_Unarmed_TK_CIV_EP1', '2');
INSERT INTO `spawns` VALUES ('3', '[0,[6865.2432, 2481.6943,0]]', 'UAZ_Unarmed_UN_EP1', '3');
INSERT INTO `spawns` VALUES ('4', '[157,[3693.0386, 5969.1489,0]]', 'UAZ_RU', '4');
INSERT INTO `spawns` VALUES ('5', '[100,[13292.147, 11938.206, 0]]', 'UAZ_Unarmed_TK_CIV_EP1', '5');
INSERT INTO `spawns` VALUES ('6', '[223,[4817.6572, 2556.5034,0]]', 'UAZ_INS', '6');
INSERT INTO `spawns` VALUES ('7', '[-23,[8120.3057, 9305.4912]]', 'UAZ_Unarmed_TK_EP1', '7');
INSERT INTO `spawns` VALUES ('8', '[0,[3312.2793, 11270.755,0]]', 'ATV_US_EP1', '8');
INSERT INTO `spawns` VALUES ('9', '[50,[3684.0366, 5999.0117,0]]', 'ATV_US_EP1', '9');
INSERT INTO `spawns` VALUES ('10', '[202,[11464.035, 11381.071,0]]', 'ATV_CZ_EP1', '10');
INSERT INTO `spawns` VALUES ('11', '[-107,[11459.299, 11386.546,0]]', 'ATV_US_EP1', '11');
INSERT INTO `spawns` VALUES ('12', '[-25,[8856.8359, 2893.7903,0]]', 'ATV_CZ_EP1', '12');
INSERT INTO `spawns` VALUES ('13', '[-7,[12869.565, 4450.4077,0]]', 'SkodaBlue', '13');
INSERT INTO `spawns` VALUES ('14', '[223,[6288.416, 7834.3521,0]]', 'Skoda', '14');
INSERT INTO `spawns` VALUES ('15', '[-54,[8125.7075, 3166.3708,0]]', 'SkodaGreen', '15');
INSERT INTO `spawns` VALUES ('16', '[-76,[8854.9082, 2891.5762,0]]', 'ATV_US_EP1', '16');
INSERT INTO `spawns` VALUES ('17', '[-69,[11945.78, 9099.3633,0]]', 'TT650_Ins', '17');
INSERT INTO `spawns` VALUES ('18', '[-209,[6592.686, 2906.8245,0]]', 'TT650_TK_EP1', '18');
INSERT INTO `spawns` VALUES ('19', '[372,[8762.8516, 11727.877,0]]', 'TT650_TK_CIV_EP1', '19');
INSERT INTO `spawns` VALUES ('20', '[52,[8713.4893, 7103.0518,0]]', 'TT650_TK_CIV_EP1', '20');
INSERT INTO `spawns` VALUES ('21', '[50,[8040.6777, 7086.5356,0]]', 'Old_bike_TK_CIV_EP1', '21');
INSERT INTO `spawns` VALUES ('22', '[-44,[7943.5068, 6988.1763,0]]', 'Old_bike_TK_CIV_EP1', '22');
INSERT INTO `spawns` VALUES ('23', '[201,[8070.6958, 3358.7793,0]]', 'Old_bike_TK_INS_EP1', '23');
INSERT INTO `spawns` VALUES ('24', '[179,[3474.3989, 2562.4915,0]]', 'Old_bike_TK_INS_EP1', '24');
INSERT INTO `spawns` VALUES ('25', '[-124,[1773.9318, 2351.6221,0]]', 'Old_bike_TK_INS_EP1', '25');
INSERT INTO `spawns` VALUES ('26', '[0,[3699.9189, 2474.2119,0]]', 'Old_bike_TK_CIV_EP1', '26');
INSERT INTO `spawns` VALUES ('27', '[73,[8350.0947, 2480.542,0]]', 'Old_bike_TK_CIV_EP1', '27');
INSERT INTO `spawns` VALUES ('28', '[35,[8345.7227, 2482.6855,0]]', 'Old_bike_TK_INS_EP1', '28');
INSERT INTO `spawns` VALUES ('29', '[23,[3203.0916, 3988.6379,0]]', 'Old_bike_TK_CIV_EP1', '29');
INSERT INTO `spawns` VALUES ('30', '[-169,[2782.7134, 5285.5342,0]]', 'Old_bike_TK_INS_EP1', '30');
INSERT INTO `spawns` VALUES ('31', '[-205,[8680.75, 2445.5315,0]]', 'Old_bike_TK_INS_EP1', '31');
INSERT INTO `spawns` VALUES ('32', '[0,[12158.999, 3468.7563,0]]', 'Old_bike_TK_CIV_EP1', '32');
INSERT INTO `spawns` VALUES ('33', '[-110,[11984.01, 3835.9231,0]]', 'Old_bike_TK_INS_EP1', '33');
INSERT INTO `spawns` VALUES ('34', '[-105,[10153.068, 2219.3547,0]]', 'Old_bike_TK_CIV_EP1', '34');
INSERT INTO `spawns` VALUES ('35', '[0,[11251.41, 4274.8184, 19.607342]]', 'UH1H_DZ', '35');
INSERT INTO `spawns` VALUES ('36', '[-121,[4523.5947, 10782.407,0]]', 'UH1H_DZ', '36');
INSERT INTO `spawns` VALUES ('37', '[89,[6855.33,11433,0.00137329]]', 'UH1H_DZ', '37');
INSERT INTO `spawns` VALUES ('38', '[-162,[10510.669, 2294.2346, 10.909807]]', 'UH1H_DZ', '38');
INSERT INTO `spawns` VALUES ('39', '[0,[6404.6675, 2767.1914, 10.798054]]', 'UH1H_DZ', '39');
INSERT INTO `spawns` VALUES ('40', '[-16,[2045.3989, 7267.4165,0]]', 'hilux1_civil_3_open', '40');
INSERT INTO `spawns` VALUES ('41', '[133,[8310.9902, 3348.3579,0]]', 'hilux1_civil_3_open', '41');
INSERT INTO `spawns` VALUES ('42', '[124,[11309.963, 6646.3989,0]]', 'hilux1_civil_3_open', '42');
INSERT INTO `spawns` VALUES ('43', '[6,[11240.744, 5370.6128,0]]', 'hilux1_civil_3_open', '43');
INSERT INTO `spawns` VALUES ('44', '[-130,[3762.5764, 8736.1709,0]]', 'Ikarus_TK_CIV_EP1', '44');
INSERT INTO `spawns` VALUES ('45', '[-81,[10628.433, 8037.8188,0]]', 'Ikarus', '45');
INSERT INTO `spawns` VALUES ('46', '[-115,[4580.3203, 4515.9282,0]]', 'Ikarus', '46');
INSERT INTO `spawns` VALUES ('47', '[-27,[6040.0923, 7806.5439,0]]', 'Ikarus_TK_CIV_EP1', '47');
INSERT INTO `spawns` VALUES ('48', '[76,[10314.745, 2147.5374,0]]', 'Ikarus', '48');
INSERT INTO `spawns` VALUES ('49', '[59,[6705.8887, 2991.9358,0]]', 'Ikarus_TK_CIV_EP1', '49');
INSERT INTO `spawns` VALUES ('50', '[-165,[9681.8213, 8947.2354,0]]', 'Tractor', '50');
INSERT INTO `spawns` VALUES ('51', '[-98,[3825.1318, 8941.4873,0]]', 'Tractor', '51');
INSERT INTO `spawns` VALUES ('52', '[19,[11246.52, 7534.7954,0]]', 'Tractor', '52');
INSERT INTO `spawns` VALUES ('53', '[0,[11066.828, 7915.2275,0]]', 'S1203_TK_CIV_EP1', '53');
INSERT INTO `spawns` VALUES ('54', '[-8,[12058.555, 3577.8667,0]]', 'S1203_TK_CIV_EP1', '54');
INSERT INTO `spawns` VALUES ('55', '[218,[11940.854, 8872.8389,0]]', 'S1203_TK_CIV_EP1', '55');
INSERT INTO `spawns` VALUES ('56', '[-14,[13386.471, 6604.0098,0]]', 'S1203_TK_CIV_EP1', '56');
INSERT INTO `spawns` VALUES ('57', '[178,[13276.482, 6098.4463,0]]', 'V3S_Civ', '57');
INSERT INTO `spawns` VALUES ('58', '[-22,[1890.9952, 12417.333,0]]', 'UralCivil2', '58');
INSERT INTO `spawns` VALUES ('59', '[226,[1975.1283, 9150.0195,0]]', 'car_hatchback', '59');
INSERT INTO `spawns` VALUES ('60', '[-45,[7429.4849, 5157.8682,0]]', 'car_hatchback', '60');
INSERT INTO `spawns` VALUES ('61', '[0,[8317.2676, 2348.6055,0]]', 'Fishing_Boat', '61');
INSERT INTO `spawns` VALUES ('62', '[0,[13222.181, 10015.431,0]]', 'Fishing_Boat', '62');
INSERT INTO `spawns` VALUES ('63', '[55,[13454.882, 13731.796,0]]', 'PBX', '63');
INSERT INTO `spawns` VALUES ('64', '[-115,[14417.589, 12886.104,0]]', 'Smallboat_1', '64');
INSERT INTO `spawns` VALUES ('65', '[268,[13098.13, 8250.8828,0]]', 'Smallboat_1', '65');
INSERT INTO `spawns` VALUES ('66', '[-155,[9731.1514, 8937.7998,0]]', 'Volha_2_TK_CIV_EP1', '66');
INSERT INTO `spawns` VALUES ('67', '[-23,[9715.0352, 6522.8286,0]]', 'Volha_1_TK_CIV_EP1', '67');
INSERT INTO `spawns` VALUES ('68', '[-119,[2614.0862, 5079.6357,0]]', 'Volha_1_TK_CIV_EP1', '68');
INSERT INTO `spawns` VALUES ('69', '[18,[10827.634, 2701.5688,0]]', 'Volha_2_TK_CIV_EP1', '69');
INSERT INTO `spawns` VALUES ('70', '[-138,[5165.7231, 2375.7642,0]]', 'Volha_1_TK_CIV_EP1', '70');
INSERT INTO `spawns` VALUES ('71', '[-153,[1740.8503, 3622.6938,0]]', 'Volha_2_TK_CIV_EP1', '71');
INSERT INTO `spawns` VALUES ('72', '[266,[9157.8408, 11019.819,0]]', 'SUV_TK_CIV_EP1', '72');
INSERT INTO `spawns` VALUES ('73', '[222,[12360.468, 10817.882,0]]', 'car_sedan', '73');

-- ----------------------------
-- Procedure structure for `delO`
-- ----------------------------
DROP PROCEDURE IF EXISTS `delO`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delO`(in myuid varchar(50))
begin
  delete from objects where uid = myuid;
  delete from objects where uid not like '%.%' and convert(uid, unsigned integer) between (convert(myuid, unsigned integer) - 2) and (convert(myuid, unsigned integer) + 2);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getLoadout`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getLoadout`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getLoadout`(IN myinstance INT)
BEGIN
    SELECT IF((SELECT loadout FROM instances WHERE instance=myinstance) IS NULL,"[]",(SELECT loadout FROM instances WHERE instance=myinstance));
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getO`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getO`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getO`(in myinstance int, in page int)
begin
  set @i = myinstance;
  set @s = 5;
  set @p = (page * @s);
  prepare stmt1 from 'SELECT id,otype,oid,pos,inventory,health,fuel,damage FROM objects WHERE instance=? LIMIT ?, ?';
  execute stmt1 using @i,@p,@s;
  deallocate prepare stmt1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getOC`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getOC`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getOC`(in myinstance int)
begin
  select floor(count(*) / 5) from objects where instance = myinstance;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getTasks`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getTasks`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTasks`(in myinstance int, in page int)
begin
  set @i = myinstance;
  set @s = 10;
  set @p = (page * @s);
  prepare stmt1 from 'SELECT message,mtype,looptime,mstart FROM scheduler JOIN instances ON mvisibility=visibility WHERE instance=? LIMIT ?, ?';
  execute stmt1 using @i,@p,@s;
  deallocate prepare stmt1;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getTC`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getTC`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getTC`(in myinstance int)
begin
  select floor(count(*) / 10) from scheduler join instances on mvisibility = visibility where instance = myinstance;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `getTime`
-- ----------------------------
DROP PROCEDURE IF EXISTS `getTime`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `getTime`(IN myinstance INT)
BEGIN
      SELECT DATE_FORMAT(NOW(),'%d-%m-%Y'), TIME_FORMAT(CURRENT_TIMESTAMP + INTERVAL (SELECT if((SELECT timezone FROM instances WHERE instance=myinstance) IS NULL,0,(SELECT timezone FROM instances WHERE instance=myinstance))) HOUR,'%T');
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `insOselI`
-- ----------------------------
DROP PROCEDURE IF EXISTS `insOselI`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `insOselI`(IN myuid VARCHAR(50),IN mytype VARCHAR(255),IN myhealth VARCHAR(1024),IN myhp DOUBLE,IN myfuel DOUBLE,IN myowner INT,IN mypos VARCHAR(255),IN myinstance INT)
BEGIN

      INSERT INTO objects (uid,otype,health,damage,oid,pos,fuel,instance) VALUES (myuid,mytype,myhealth,myhp,myowner,mypos,myfuel,myinstance);

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `insUNselI`
-- ----------------------------
DROP PROCEDURE IF EXISTS `insUNselI`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `insUNselI`(IN myuid INT,IN myname VARCHAR(255))
BEGIN
      INSERT INTO main (uid, name,survival) VALUES (myuid, myname,NOW());
      SELECT LAST_INSERT_ID();
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `logLogin`
-- ----------------------------
DROP PROCEDURE IF EXISTS `logLogin`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logLogin`(in unique_id varchar(50))
begin
  insert into
    log_entry (profile_id, log_code_id)
  values (unique_id, 1); --
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `logLogout`
-- ----------------------------
DROP PROCEDURE IF EXISTS `logLogout`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `logLogout`(in unique_id varchar(50))
begin
  insert into
    log_entry (profile_id, log_code_id)
  values (unique_id, 2); --
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `selIIBSM`
-- ----------------------------
DROP PROCEDURE IF EXISTS `selIIBSM`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `selIIBSM`(IN myuid INT)
BEGIN
      SELECT id, inventory, backpack, FLOOR(TIME_TO_SEC(TIMEDIFF(NOW(),survival))/60), model, late, ldrank FROM main WHERE uid=myuid AND death=0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `selIPIBMSSS`
-- ----------------------------
DROP PROCEDURE IF EXISTS `selIPIBMSSS`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `selIPIBMSSS`(IN myuid INT)
BEGIN
      SELECT id, pos, inventory, backpack, medical, FLOOR(TIME_TO_SEC(TIMEDIFF(NOW(),survival))/60), kills, state, late, ldrank, hs, hkills, bkills FROM main WHERE uid=myuid AND death=0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `selMPSSH`
-- ----------------------------
DROP PROCEDURE IF EXISTS `selMPSSH`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `selMPSSH`(IN myid INT)
BEGIN
      SELECT medical, pos, kills, state, humanity, hs, hkills, bkills FROM main WHERE id=myid AND death=0;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `setCD`
-- ----------------------------
DROP PROCEDURE IF EXISTS `setCD`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `setCD`(IN myid INT)
BEGIN
      UPDATE main SET death=1 WHERE id=myid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `update`
-- ----------------------------
DROP PROCEDURE IF EXISTS `update`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `update`(IN myid INT, IN mypos VARCHAR(255), IN myinv VARCHAR(2048), IN myback VARCHAR(2048), IN mymed VARCHAR(1024), IN myate INT, IN mydrank INT, IN mytime INT, IN mymod VARCHAR(255), IN myhum INT,IN myk INT, IN myhs INT, IN myhk INT,IN mybk INT,IN mystate VARCHAR(255))
BEGIN

      UPDATE main SET kills=kills+myk,hs=hs+myhs,bkills=bkills+mybk,hkills=hkills+myhk,humanity=humanity+myhum,

                      state=mystate,model=if(mymod='any',model,mymod),late=if(myate=-1,0,late+myate),ldrank=if(mydrank=-1,0,ldrank+mydrank),stime=stime+mytime,

                      pos=if(mypos='[]',pos,mypos),medical=if(mymed='[]',medical,mymed),

                      backpack=if(myback='[]',backpack,myback),inventory=if(myinv='[]',inventory,myinv)

                  WHERE id=myid;

END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updIH`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updIH`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `updIH`(IN myid INT,IN myhealth VARCHAR(2048),IN myhp DOUBLE)
BEGIN
      UPDATE objects SET health=myhealth,damage=myhp WHERE id=myid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updII`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updII`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `updII`(IN myid INT,IN myinv VARCHAR(1024))
BEGIN
      UPDATE objects SET inventory=myinv WHERE id=myid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updIPF`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updIPF`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `updIPF`(IN myid INT,IN mypos VARCHAR(255),IN myfuel DOUBLE)
BEGIN
      UPDATE objects SET pos=if(mypos='[]',pos,mypos),fuel=myfuel WHERE id=myid;
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updUI`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updUI`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `updUI`(in myuid varchar(50), in myinv varchar(2048))
begin
  update objects set inventory = myinv where uid not like '%.%' and convert(uid, unsigned integer) between (convert(myuid, unsigned integer) - 2) and (convert(myuid, unsigned integer) + 2);
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for `updV`
-- ----------------------------
DROP PROCEDURE IF EXISTS `updV`;
DELIMITER ;;
CREATE DEFINER=`dayz`@`localhost` PROCEDURE `updV`(IN myuid VARCHAR(50),IN mytype VARCHAR(255) ,IN mypos VARCHAR(255), IN myhealth VARCHAR(1024))
BEGIN

      UPDATE objects SET otype=if(mytype='',otype,mytype),health=myhealth,pos=if(mypos='[]',pos,mypos) WHERE uid=myuid;

END
;;
DELIMITER ;

/*
Navicat MySQL Data Transfer

Source Server         : dayz
Source Server Version : 50516
Source Host           : localhost:3306
Source Database       : dayz

Target Server Type    : MYSQL
Target Server Version : 50516
File Encoding         : 65001

Date: 2012-08-24 05:52:47
*/

SET FOREIGN_KEY_CHECKS=0;

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
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

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

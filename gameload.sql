/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50626
Source Host           : 49.234.120.252:3306
Source Database       : gameload

Target Server Type    : MYSQL
Target Server Version : 50626
File Encoding         : 65001

Date: 2019-12-11 10:05:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `t_card`
-- ----------------------------
DROP TABLE IF EXISTS `t_card`;
CREATE TABLE `t_card` (
  `card_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `card_number` varchar(20) DEFAULT NULL,
  `card_password` varchar(20) DEFAULT NULL,
  `card_amount` decimal(8,2) DEFAULT NULL,
  `card_proId` bigint(20) NOT NULL,
  `card_start_time` datetime DEFAULT NULL,
  `card_end_time` datetime DEFAULT NULL,
  `card_status` varchar(4) DEFAULT NULL,
  `card_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`card_id`),
  KEY `fk_card_province` (`card_proId`),
  CONSTRAINT `fk_card_province` FOREIGN KEY (`card_proId`) REFERENCES `t_province` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_card
-- ----------------------------
INSERT INTO `t_card` VALUES ('1', 'gwt7eIYeXQDG3ie3LsIG', 'tqpOA6', '100.00', '11', '2019-12-08 15:54:48', '2020-01-30 00:00:00', '12', '2019-12-08 15:54:48');
INSERT INTO `t_card` VALUES ('2', 'QPfYeNNjAOCZzZ0IewDu', 'iMN9WX', '100.00', '11', '2019-12-08 15:54:48', '2020-01-30 00:00:00', '13', '2019-12-08 15:54:48');
INSERT INTO `t_card` VALUES ('3', 'zQGawt0pLwdSH9tfppp3', 'tiLyDV', '100.00', '11', '2019-12-08 15:54:48', '2020-01-30 00:00:00', '12', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('4', 'aGIJhbU0w6Oju4rWAkJx', 'DnkfrZ', '100.00', '11', '2019-12-08 15:54:49', '2020-01-30 00:00:00', '10', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('5', 'zRwBVrPORtusT52G83cf', 'YwGqJG', '100.00', '11', '2019-12-08 15:54:49', '2020-01-30 00:00:00', '10', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('6', 'F9RXC2t243LzLUMmtrPK', 'g4zMj7', '100.00', '11', '2019-12-08 15:54:49', '2020-01-30 00:00:00', '10', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('7', 'e45XpATMwxdsq1gz5S24', 'owX7W0', '100.00', '11', '2019-12-08 15:54:49', '2020-01-30 00:00:00', '10', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('8', 'VRtTUPr8gX3RMRK7MJo9', 'pzrSLH', '100.00', '11', '2019-12-08 15:54:49', '2020-01-30 00:00:00', '10', '2019-12-08 15:54:49');
INSERT INTO `t_card` VALUES ('13', 'gShV3OppA3L0nBRPHEUE', 'NUuB8t', '10.00', '22', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:50');
INSERT INTO `t_card` VALUES ('14', 'NsuKmUOb1BHgAe3KFZfS', '5OXXRm', '10.00', '22', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:50');
INSERT INTO `t_card` VALUES ('15', 'QQdDqgjXtUpQ2Bv9oUr0', 'HdRaP5', '10.00', '23', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:51');
INSERT INTO `t_card` VALUES ('16', 'b0Aq6mItzbricMgmLldE', 'fuXg26', '10.00', '23', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:51');
INSERT INTO `t_card` VALUES ('17', 'm7ZavjqcVqUjOSvCw3ma', 'BAP85Z', '10.00', '31', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:51');
INSERT INTO `t_card` VALUES ('18', 'zOjzo46YVbnAzxcd3loM', '9ItnFN', '10.00', '31', '2019-12-09 00:00:00', '2019-12-09 01:00:00', '14', '2019-12-08 21:53:51');
INSERT INTO `t_card` VALUES ('19', 'RxzvoWy1vtjfvedJjs19', 'CkKQ8f', '5.00', '62', '2019-12-11 00:00:00', '2019-12-12 00:00:00', '10', '2019-12-10 17:20:15');
INSERT INTO `t_card` VALUES ('20', 'o0lBRFeANCQdsv9Tyq4L', 'i9H8HK', '5.00', '62', '2019-12-11 00:00:00', '2019-12-12 00:00:00', '10', '2019-12-10 17:20:15');
INSERT INTO `t_card` VALUES ('21', '6BNhU0togoqfWerWNCdb', '192TZZ', '5.00', '63', '2019-12-11 00:00:00', '2019-12-12 00:00:00', '10', '2019-12-10 17:20:15');
INSERT INTO `t_card` VALUES ('22', 'red0XUL6UMsDrdBJdhSm', 'BOMrVW', '5.00', '63', '2019-12-11 00:00:00', '2019-12-12 00:00:00', '10', '2019-12-10 17:20:15');

-- ----------------------------
-- Table structure for `t_city`
-- ----------------------------
DROP TABLE IF EXISTS `t_city`;
CREATE TABLE `t_city` (
  `city_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `city_name` varchar(10) DEFAULT NULL,
  `city_provId` bigint(20) NOT NULL,
  `city_areaCode` varchar(5) DEFAULT NULL,
  `city_postCode` varchar(6) DEFAULT NULL,
  PRIMARY KEY (`city_id`),
  KEY `fk_city_province` (`city_provId`),
  CONSTRAINT `fk_city_province` FOREIGN KEY (`city_provId`) REFERENCES `t_province` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_city
-- ----------------------------

-- ----------------------------
-- Table structure for `t_exchange`
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange`;
CREATE TABLE `t_exchange` (
  `e_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `e_provId` bigint(20) NOT NULL,
  `e_charge` decimal(8,2) DEFAULT NULL,
  `e_create_time` datetime DEFAULT NULL,
  `e_update_time` datetime DEFAULT NULL,
  `e_status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`e_id`),
  KEY `fk_exchange_city` (`e_provId`),
  CONSTRAINT `fk_exchange_city` FOREIGN KEY (`e_provId`) REFERENCES `t_province` (`pro_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_exchange
-- ----------------------------
INSERT INTO `t_exchange` VALUES ('1', '11', '10.00', '2019-12-07 14:49:59', '2019-12-07 14:50:02', '20');
INSERT INTO `t_exchange` VALUES ('2', '12', '12.00', '2019-12-07 14:49:06', '2019-12-10 17:19:03', '20');
INSERT INTO `t_exchange` VALUES ('3', '13', '10.00', '2019-12-07 14:49:23', '2019-12-07 14:49:27', '20');
INSERT INTO `t_exchange` VALUES ('4', '14', '8.00', '2019-12-07 14:50:25', '2019-12-07 14:50:27', '20');
INSERT INTO `t_exchange` VALUES ('5', '15', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '21');
INSERT INTO `t_exchange` VALUES ('6', '36', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '20');
INSERT INTO `t_exchange` VALUES ('7', '42', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '21');
INSERT INTO `t_exchange` VALUES ('8', '43', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '21');
INSERT INTO `t_exchange` VALUES ('9', '51', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '20');
INSERT INTO `t_exchange` VALUES ('10', '52', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '21');
INSERT INTO `t_exchange` VALUES ('11', '21', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '21');
INSERT INTO `t_exchange` VALUES ('12', '22', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '20');
INSERT INTO `t_exchange` VALUES ('13', '64', '5.00', '2019-12-07 14:50:41', '2019-12-07 14:50:44', '20');
INSERT INTO `t_exchange` VALUES ('15', '32', '5.00', '2019-12-07 20:16:40', '2019-12-07 21:26:26', '20');

-- ----------------------------
-- Table structure for `t_expense`
-- ----------------------------
DROP TABLE IF EXISTS `t_expense`;
CREATE TABLE `t_expense` (
  `exp_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `exp_userId` bigint(20) NOT NULL,
  `exp_gameId` bigint(20) NOT NULL,
  `exp_monetary` decimal(8,2) DEFAULT NULL,
  `exp_operation` varchar(4) DEFAULT NULL,
  `exp_create_time` datetime DEFAULT NULL,
  `exp_update_time` datetime DEFAULT NULL,
  `exp_downloads` int(11) DEFAULT NULL,
  `exp_status` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`exp_id`),
  KEY `fk_expense_user` (`exp_userId`),
  KEY `fk_expense_game` (`exp_gameId`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_expense
-- ----------------------------
INSERT INTO `t_expense` VALUES ('1', '18', '3', '58.00', '31', '2019-12-10 13:32:42', '2019-12-10 13:34:39', '3', '14');
INSERT INTO `t_expense` VALUES ('2', '18', '3', '58.00', '31', '2019-12-10 13:45:52', '2019-12-10 13:47:22', '3', '14');
INSERT INTO `t_expense` VALUES ('3', '18', '1', '58.00', '31', '2019-12-10 13:52:51', '2019-12-10 13:53:10', '3', '14');
INSERT INTO `t_expense` VALUES ('4', '18', '1', '58.00', '31', '2019-12-10 13:53:15', '2019-12-10 13:53:25', '3', '14');
INSERT INTO `t_expense` VALUES ('5', '18', '5', '10.00', '31', '2019-12-10 14:42:12', '2019-12-10 14:42:12', '1', '13');
INSERT INTO `t_expense` VALUES ('6', '1', '14', '98.00', '31', '2019-12-10 16:00:53', '2019-12-10 16:04:15', '3', '14');
INSERT INTO `t_expense` VALUES ('7', '1', '11', '2.00', '31', '2019-12-10 16:08:55', '2019-12-10 16:10:57', '2', '13');
INSERT INTO `t_expense` VALUES ('8', '3', '11', '2.00', '31', '2019-12-11 09:02:10', '2019-12-11 09:02:10', '1', '13');

-- ----------------------------
-- Table structure for `t_game`
-- ----------------------------
DROP TABLE IF EXISTS `t_game`;
CREATE TABLE `t_game` (
  `g_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `g_name` varchar(10) DEFAULT NULL,
  `g_type` bigint(20) NOT NULL,
  `g_status` varchar(4) DEFAULT NULL,
  `g_cover` varchar(50) DEFAULT NULL,
  `g_screen` varchar(150) NOT NULL,
  `g_currency` decimal(8,2) DEFAULT NULL,
  `g_tariffe` decimal(8,2) DEFAULT NULL,
  `g_developers` varchar(20) DEFAULT NULL,
  `g_filing` varchar(50) DEFAULT NULL,
  `g_detail` varchar(100) DEFAULT NULL,
  `g_introduction` varchar(100) DEFAULT NULL,
  `g_create_time` datetime DEFAULT NULL,
  `g_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  KEY `fk_game_gameType` (`g_type`),
  CONSTRAINT `fk_game_gameType` FOREIGN KEY (`g_type`) REFERENCES `t_game_type` (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_game
-- ----------------------------
INSERT INTO `t_game` VALUES ('1', '欢乐斗地主', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('2', '欢乐麻将全集', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('3', 'NBA2K', '3', '20', '9679982870.jpg', '9679982870.jpg|9679982870.jpg|9679982870.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('4', '3D魔法少女', '8', '20', '1464162998294.jpg', '1464162998294.jpg|1464162998294.jpg|1464162998294.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('5', '穿越火线', '2', '20', '1464839498389.jpg', '1464839498389.jpg|1464839498389.jpg|1464839498389.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('6', '斗地主', '1', '21', '1440658703723.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-10 17:18:28');
INSERT INTO `t_game` VALUES ('7', '掼蛋', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('8', '五子棋', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('9', '三国杀', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('10', '象棋', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('11', '飞行棋', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '2.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('12', '狼人杀', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('13', '德州扑克', '1', '20', '1430727532556.jpg', '1430727532556.jpg|1430727532556.jpg|1430727532556.jpg', '58.00', '10.00', '腾讯', '文网游备字〔2016〕Ｍ-CBG 0011 号', '欢乐斗地主有天地癞子多倍的模式，玩法多样', '欢乐斗地主是最近流行的扑克牌新玩法', '2019-12-06 00:09:42', '2019-12-06 00:09:44');
INSERT INTO `t_game` VALUES ('14', '绝地求生', '3', '21', 't01388d8bbf164ae3b8.jpg', 't01ad80173327823bc8.jpg|t0133ad9bbccbc89a71.jpg|t01ad80173327823bc8.jpg', '98.00', '20.00', '蓝洞', '文网游备字〔2016〕Ｍ-CBG 0011 号', '100人决战到天明', '吃鸡游戏', '2019-12-06 15:54:50', '2019-12-07 02:35:01');

-- ----------------------------
-- Table structure for `t_game_type`
-- ----------------------------
DROP TABLE IF EXISTS `t_game_type`;
CREATE TABLE `t_game_type` (
  `gt_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gt_name` varchar(20) DEFAULT NULL,
  `gt_status` varchar(4) DEFAULT NULL,
  `gt_picture` varchar(50) DEFAULT NULL,
  `gt_create_time` datetime DEFAULT NULL,
  `gt_update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`gt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_game_type
-- ----------------------------
INSERT INTO `t_game_type` VALUES ('1', '棋牌桌游', '20', '1430727532556.jpg', '2019-12-05 09:34:37', '2019-12-10 17:16:34');
INSERT INTO `t_game_type` VALUES ('2', '动作射击', '21', '1464839498389.jpg', '2019-12-05 09:35:42', '2019-12-05 09:35:46');
INSERT INTO `t_game_type` VALUES ('3', '体育竞技', '20', '9679982870.jpg', '2019-12-05 09:36:13', '2019-12-05 09:36:17');
INSERT INTO `t_game_type` VALUES ('4', '角色扮演', '20', '1464919899197.jpg', '2019-12-05 09:38:13', '2019-12-05 09:38:16');
INSERT INTO `t_game_type` VALUES ('5', '休闲益智', '20', '1475904797130.jpg', '2019-12-05 09:38:41', '2019-12-05 09:38:44');
INSERT INTO `t_game_type` VALUES ('6', 'MOBA', '20', '1464842544378.jpg', '2019-12-05 09:40:36', '2019-12-05 09:40:39');
INSERT INTO `t_game_type` VALUES ('7', '卡牌回合制', '20', '1480313735992.jpg', '2019-12-05 09:42:08', '2019-12-05 09:42:11');
INSERT INTO `t_game_type` VALUES ('8', '经营养成', '21', '1464162998294.jpg', '2019-12-05 09:42:54', '2019-12-10 17:16:44');
INSERT INTO `t_game_type` VALUES ('9', '独立游戏', '20', '1477057087571.jpg', '2019-12-05 09:43:44', '2019-12-05 09:43:47');
INSERT INTO `t_game_type` VALUES ('13', '横版过关', '20', 'timg.jpg', '2019-12-05 16:57:30', '2019-12-05 20:00:49');

-- ----------------------------
-- Table structure for `t_manager`
-- ----------------------------
DROP TABLE IF EXISTS `t_manager`;
CREATE TABLE `t_manager` (
  `m_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `m_account` varchar(10) DEFAULT NULL,
  `m_password` varchar(15) DEFAULT NULL,
  `m_mail` varchar(25) DEFAULT NULL,
  `m_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_manager
-- ----------------------------
INSERT INTO `t_manager` VALUES ('1', 'aaa', 'aaa', '1639782681@qq.com', '2019-12-02 11:32:01');
INSERT INTO `t_manager` VALUES ('2', 'admin', '123456', '1639782681@qq.com', '2019-12-03 11:26:46');

-- ----------------------------
-- Table structure for `t_mobile`
-- ----------------------------
DROP TABLE IF EXISTS `t_mobile`;
CREATE TABLE `t_mobile` (
  `mobile_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mobile_number` varchar(7) DEFAULT NULL,
  `mobile_city` bigint(20) DEFAULT NULL,
  `mobile_type` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`mobile_id`),
  KEY `fk_mobile_city` (`mobile_city`),
  CONSTRAINT `fk_mobile_city` FOREIGN KEY (`mobile_city`) REFERENCES `t_city` (`city_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_mobile
-- ----------------------------

-- ----------------------------
-- Table structure for `t_prepaid`
-- ----------------------------
DROP TABLE IF EXISTS `t_prepaid`;
CREATE TABLE `t_prepaid` (
  `prep_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `prep_userId` bigint(20) NOT NULL,
  `prep_cardId` bigint(20) NOT NULL,
  `prep_create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`prep_id`),
  KEY `fk_prepaid_user` (`prep_userId`),
  KEY `fk_prepaid_card` (`prep_cardId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_prepaid
-- ----------------------------
INSERT INTO `t_prepaid` VALUES ('1', '18', '1', '2019-12-09 17:22:32');
INSERT INTO `t_prepaid` VALUES ('3', '3', '2', '2019-12-10 15:54:24');
INSERT INTO `t_prepaid` VALUES ('4', '1', '3', '2019-12-10 15:56:51');

-- ----------------------------
-- Table structure for `t_province`
-- ----------------------------
DROP TABLE IF EXISTS `t_province`;
CREATE TABLE `t_province` (
  `pro_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pro_name` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_province
-- ----------------------------
INSERT INTO `t_province` VALUES ('11', '北京市');
INSERT INTO `t_province` VALUES ('12', '天津市');
INSERT INTO `t_province` VALUES ('13', '河北省');
INSERT INTO `t_province` VALUES ('14', '山西省');
INSERT INTO `t_province` VALUES ('15', '内蒙古自治区');
INSERT INTO `t_province` VALUES ('21', '辽宁省');
INSERT INTO `t_province` VALUES ('22', '吉林省');
INSERT INTO `t_province` VALUES ('23', '黑龙江省');
INSERT INTO `t_province` VALUES ('31', '上海市');
INSERT INTO `t_province` VALUES ('32', '江苏省');
INSERT INTO `t_province` VALUES ('33', '浙江省');
INSERT INTO `t_province` VALUES ('34', '安徽省');
INSERT INTO `t_province` VALUES ('35', '福建省');
INSERT INTO `t_province` VALUES ('36', '江西省');
INSERT INTO `t_province` VALUES ('37', '山东省');
INSERT INTO `t_province` VALUES ('41', '河南省');
INSERT INTO `t_province` VALUES ('42', '湖北省');
INSERT INTO `t_province` VALUES ('43', '湖南省');
INSERT INTO `t_province` VALUES ('44', '广东省');
INSERT INTO `t_province` VALUES ('45', '广西自治区');
INSERT INTO `t_province` VALUES ('46', '海南省');
INSERT INTO `t_province` VALUES ('50', '重庆市');
INSERT INTO `t_province` VALUES ('51', '四川省');
INSERT INTO `t_province` VALUES ('52', '贵州省');
INSERT INTO `t_province` VALUES ('53', '云南省');
INSERT INTO `t_province` VALUES ('54', '西藏自治区');
INSERT INTO `t_province` VALUES ('61', '陕西省');
INSERT INTO `t_province` VALUES ('62', '甘肃省');
INSERT INTO `t_province` VALUES ('63', '青海省');
INSERT INTO `t_province` VALUES ('64', '宁夏自治区');
INSERT INTO `t_province` VALUES ('65', '新疆自治区');
INSERT INTO `t_province` VALUES ('81', '香港特别行政区');
INSERT INTO `t_province` VALUES ('82', '澳门特别行政区');
INSERT INTO `t_province` VALUES ('83', '台湾省');

-- ----------------------------
-- Table structure for `t_user`
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user` (
  `u_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `u_account` varchar(15) DEFAULT NULL,
  `u_password` varchar(15) DEFAULT NULL,
  `u_birth` date DEFAULT NULL,
  `u_mail` varchar(20) DEFAULT NULL,
  `u_tariffe` decimal(8,2) DEFAULT NULL,
  `u_currency` decimal(8,2) DEFAULT NULL,
  `u_cardAmount` decimal(8,2) DEFAULT NULL,
  `u_status` varchar(4) DEFAULT NULL,
  `u_create_time` datetime DEFAULT NULL,
  `u_sex` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES ('1', 'aaa', '123456', '2019-12-04', '1639782681@qq.com', '100.00', null, '0.00', '11', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('2', 'aab', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', null, null, '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('3', 'aaq', 'aaq', '2019-12-04', '1639782681@qq.com', '100.00', null, '98.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('4', 'aaz', 'aab', '2019-12-04', '1639782681@qq.com', null, null, null, '11', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('5', 'aac', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', null, null, '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('6', 'aad', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', null, null, '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('7', 'aae', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', null, null, '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('8', 'aaf', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('9', 'aag', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('10', 'aah', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('11', 'aai', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('12', 'aaj', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('13', 'aak', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('14', 'aal', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('15', 'aam', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('16', 'aan', 'aab', '2019-12-04', '1639782681@qq.com', '100.00', '100.00', '100.00', '10', '2019-12-04 10:13:58', '1');
INSERT INTO `t_user` VALUES ('18', 'root', '123456', '2019-12-08', '1178885073@qq.com', '40.00', '26.00', '0.00', '10', '2019-12-09 11:55:26', '1');

-- ----------------------------
-- Event structure for `event_card_status`
-- ----------------------------
DROP EVENT IF EXISTS `event_card_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `event_card_status` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-08 22:00:00' ON COMPLETION NOT PRESERVE ENABLE DO begin
update t_card set card_status = '14' 
where timestampdiff(SECOND,current_timestamp,card_end_time) < 0;

update t_card set card_status = '12'
where card_id in
(select t.card_id from 
		(	select  u_id,u_cardAmount,
			c.card_id,c.card_status
			from t_prepaid 
			inner join t_user on prep_userId = u_id
			 inner join t_card c on prep_cardId = c.card_id
			where u_cardAmount = '0' and c.card_status = '13'
	) t 
);
end
;;
DELIMITER ;

-- ----------------------------
-- Event structure for `event_expense_status`
-- ----------------------------
DROP EVENT IF EXISTS `event_expense_status`;
DELIMITER ;;
CREATE DEFINER=`root`@`%` EVENT `event_expense_status` ON SCHEDULE EVERY 1 SECOND STARTS '2019-12-10 13:40:00' ON COMPLETION NOT PRESERVE ENABLE DO update t_expense set exp_status = '14'
where timestampdiff(DAY,current_timestamp,exp_create_time) > 1 or exp_downloads > 2
;;
DELIMITER ;

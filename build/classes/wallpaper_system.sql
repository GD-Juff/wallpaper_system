/*
Navicat MySQL Data Transfer

Source Server         : MySQL
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : wallpaper_system

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2019-11-01 22:35:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for admin_info
-- ----------------------------
DROP TABLE IF EXISTS `admin_info`;
CREATE TABLE `admin_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `adminname` varchar(11) NOT NULL,
  `password` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_info
-- ----------------------------
INSERT INTO `admin_info` VALUES ('1', 'gt123', '123');

-- ----------------------------
-- Table structure for message_status
-- ----------------------------
DROP TABLE IF EXISTS `message_status`;
CREATE TABLE `message_status` (
  `readstatus_id` char(1) NOT NULL,
  `readstatus` varchar(10) NOT NULL,
  PRIMARY KEY (`readstatus_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message_status
-- ----------------------------
INSERT INTO `message_status` VALUES ('1', '审核通过');
INSERT INTO `message_status` VALUES ('2', '审核不通过');
INSERT INTO `message_status` VALUES ('3', '已通知');

-- ----------------------------
-- Table structure for picture
-- ----------------------------
DROP TABLE IF EXISTS `picture`;
CREATE TABLE `picture` (
  `pic_id` int(11) NOT NULL AUTO_INCREMENT,
  `pic_type` varchar(50) NOT NULL,
  `pic_name` varchar(100) NOT NULL,
  `pic_content` varchar(255) NOT NULL,
  `pic_src` varchar(255) DEFAULT NULL,
  `account` varchar(255) NOT NULL,
  `pic_status` char(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`pic_id`),
  KEY `picture_status` (`pic_status`),
  CONSTRAINT `picture_ibfk_1` FOREIGN KEY (`pic_status`) REFERENCES `picture_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture
-- ----------------------------
INSERT INTO `picture` VALUES ('1', '明星', '李现', '李现，影视男演员，出生于湖北省咸宁市，毕业于北京电影学院。', '李现11dbe6e1-c501-4055-89c9-9a4cc41e6130.jpg', '锋', '2');
INSERT INTO `picture` VALUES ('26', '风景', '古木阴中系短篷', '古木阴中系短篷', '古木阴中系短篷391f8717-ad8e-439f-8b84-e5675a64e97c_风景1.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('27', '风景', '绿树阴浓夏日长', '绿树阴浓夏日长', '绿树阴浓夏日长ad99ea83-9681-4586-8b63-6e4bf599e362_风景.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('28', '风景', '吹面不寒杨柳风', '吹面不寒杨柳风', '吹面不寒杨柳风00f0b1a4-5a0a-4e79-a2ea-504506d81bcd_风景3.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('29', '风景', '楼台倒影入池塘', '楼台倒影入池塘', '楼台倒影入池塘f860527a-e040-4aa5-b3d2-d204d96b1602_风景4.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('30', '风景', '满架蔷薇一院香', '满架蔷薇一院香', '满架蔷薇一院香6597a54e-40f8-44a1-b149-65c2de3386b1_风景5.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('31', '风景', '长江大桥', '长江大桥', '长江大桥2b523559-9ffa-4a98-9fc3-e50e0cc4a69f_风景6.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('32', '明星', '篮球明星', '篮球明星艾弗森', '篮球明星3c203b73-52e6-42a5-90b7-df22c80f2c2f_明星1.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('33', '明星', '彭于晏', '彭于晏', '彭于晏ead3781c-85b1-4562-8031-6232c1a8a8a1_明星2.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('34', '明星', '女明星', '中国女明星', '女明星d8331ba3-c25b-44af-954b-95b0a24ca76d_明星3.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('35', '明星', '艾薇儿', '艾薇儿', '艾薇儿06aff9cb-9148-43e7-977e-d4ad171cc581_明星4.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('36', '风景', '女明星', '中国女明星', '女明星0e700430-042c-4f49-99ea-8962eb046fb9_明星5.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('37', '卡通', '千与千寻', '宫崎骏', '千与千寻fc1d08b8-dbaf-4583-9e55-60c29bc401dd_动漫1.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('38', '卡通', '天空之城', '天宫之城', '天空之城732cec1d-49f5-48ec-9c7d-7ff1fa15ebe3_动漫2.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('39', '卡通', '起风了', '宫崎骏经典之作', '起风了e8b2c798-980a-423f-a743-7d35005f2c60_动漫3.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('40', '卡通', '魔女', '魔女斗篷', '魔女2afd5dac-4136-4e39-b78c-b280f6fa0205_动漫4.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('41', '动物', '猫猫', '可爱的小喵喵', '猫猫0c556930-8983-491c-b0ff-eba5338f4e7c_动物1.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('42', '动物', '猫猫', '可爱的小喵喵', '猫猫d9f15e31-6dda-4694-83f1-3f624a373903_动物1.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('43', '动物', '狗狗', '可爱的小狗狗', '狗狗ee65196f-5825-499d-b589-478c519d4070_动物2.jpg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('44', '风景', '长颈鹿', '可爱的长颈鹿', '长颈鹿e57c0130-842a-4c5a-8953-78e043909509_动物5.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('45', '动物', '狐狸', '可爱的狐狸', '狐狸5697cbf4-a946-4f17-a776-42810c98a686_动物4.jpeg', 'gt0001', '2');
INSERT INTO `picture` VALUES ('47', '风景', '全明星', '全明星', '全明星4c66bffb-1bb9-4c40-81b3-37ce9881df15_运动6.jpg', 'gt0002', '2');

-- ----------------------------
-- Table structure for picture_status
-- ----------------------------
DROP TABLE IF EXISTS `picture_status`;
CREATE TABLE `picture_status` (
  `id` char(1) NOT NULL,
  `picture_status` varchar(10) NOT NULL DEFAULT '',
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of picture_status
-- ----------------------------
INSERT INTO `picture_status` VALUES ('1', '审核中');
INSERT INTO `picture_status` VALUES ('2', '展示');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `assist` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', '1');
INSERT INTO `users` VALUES ('2', '1');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) DEFAULT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `head_src` varchar(255) DEFAULT NULL,
  `userstatus` char(1) NOT NULL DEFAULT '0' COMMENT '0.正常\r\n1.冻结',
  PRIMARY KEY (`id`),
  KEY `user_info_ibfk_1` (`userstatus`) USING BTREE,
  KEY `account` (`account`),
  CONSTRAINT `user_info_ibfk_1` FOREIGN KEY (`userstatus`) REFERENCES `user_status` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'gt0001', '锋', '123', '锋9b1e3b3c-e811-44cc-9603-749ae9d36968_hdImg_abcab7d3d71a85396e7905fbecc738031531916999155.jpg', '0');
INSERT INTO `user_info` VALUES ('2', 'gt0002', '测试用户', '123', '测试用户2a86c670-f6e8-4c2b-b825-719e33b3991a_动物1.jpeg', '0');

-- ----------------------------
-- Table structure for user_message
-- ----------------------------
DROP TABLE IF EXISTS `user_message`;
CREATE TABLE `user_message` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(255) NOT NULL,
  `pic_id` int(11) DEFAULT NULL,
  `read_status` char(1) NOT NULL,
  PRIMARY KEY (`msg_id`),
  KEY `pic_id` (`pic_id`) USING BTREE,
  KEY `read_status` (`read_status`) USING BTREE,
  CONSTRAINT `message_ibfk_1` FOREIGN KEY (`pic_id`) REFERENCES `picture` (`pic_id`) ON DELETE SET NULL ON UPDATE NO ACTION,
  CONSTRAINT `message_ibfk_2` FOREIGN KEY (`read_status`) REFERENCES `message_status` (`readstatus_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_message
-- ----------------------------
INSERT INTO `user_message` VALUES ('1', 'gt0001', '36', '3');
INSERT INTO `user_message` VALUES ('2', 'gt0001', '35', '3');
INSERT INTO `user_message` VALUES ('3', 'gt0001', '34', '3');
INSERT INTO `user_message` VALUES ('4', 'gt0001', '33', '3');
INSERT INTO `user_message` VALUES ('5', 'gt0001', '32', '3');
INSERT INTO `user_message` VALUES ('6', 'gt0001', '31', '3');
INSERT INTO `user_message` VALUES ('7', 'gt0001', '30', '3');
INSERT INTO `user_message` VALUES ('8', 'gt0001', '29', '3');
INSERT INTO `user_message` VALUES ('9', 'gt0001', '26', '3');
INSERT INTO `user_message` VALUES ('10', 'gt0001', '27', '3');
INSERT INTO `user_message` VALUES ('11', 'gt0001', '28', '3');
INSERT INTO `user_message` VALUES ('12', 'gt0001', '40', '3');
INSERT INTO `user_message` VALUES ('13', 'gt0001', '39', '3');
INSERT INTO `user_message` VALUES ('14', 'gt0001', '38', '3');
INSERT INTO `user_message` VALUES ('15', 'gt0001', '37', '3');
INSERT INTO `user_message` VALUES ('16', 'gt0001', '45', '3');
INSERT INTO `user_message` VALUES ('17', 'gt0001', '44', '3');
INSERT INTO `user_message` VALUES ('18', 'gt0001', '43', '3');
INSERT INTO `user_message` VALUES ('19', 'gt0001', '42', '3');
INSERT INTO `user_message` VALUES ('20', 'gt0001', '41', '3');
INSERT INTO `user_message` VALUES ('21', 'gt0001', '43', '3');
INSERT INTO `user_message` VALUES ('22', 'gt0001', '42', '3');
INSERT INTO `user_message` VALUES ('23', 'gt0001', '41', '3');
INSERT INTO `user_message` VALUES ('24', 'gt0001', '37', '3');
INSERT INTO `user_message` VALUES ('25', 'gt0001', '38', '3');
INSERT INTO `user_message` VALUES ('26', 'gt0001', '35', '3');
INSERT INTO `user_message` VALUES ('27', 'gt0001', '34', '3');
INSERT INTO `user_message` VALUES ('28', 'gt0001', '33', '3');
INSERT INTO `user_message` VALUES ('29', 'gt0002', '47', '3');

-- ----------------------------
-- Table structure for user_status
-- ----------------------------
DROP TABLE IF EXISTS `user_status`;
CREATE TABLE `user_status` (
  `id` char(1) NOT NULL,
  `userstatus` varchar(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_status
-- ----------------------------
INSERT INTO `user_status` VALUES ('0', '正常');
INSERT INTO `user_status` VALUES ('1', '冻结');

-- ----------------------------
-- Function structure for getID
-- ----------------------------
DROP FUNCTION IF EXISTS `getID`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `getID`() RETURNS varchar(255) CHARSET utf8
return (select max(id) from users)
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `setAccount`;
DELIMITER ;;
CREATE TRIGGER `setAccount` BEFORE INSERT ON `user_info` FOR EACH ROW begin
insert into users (assist) values ("1");
set new.account = getID();
 set new.account = concat('gt000',new.account);
end
;;
DELIMITER ;

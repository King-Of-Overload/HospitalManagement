/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50505
 Source Host           : localhost
 Source Database       : hospital

 Target Server Type    : MySQL
 Target Server Version : 50505
 File Encoding         : utf-8

 Date: 05/27/2018 07:24:00 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `dept`
-- ----------------------------
DROP TABLE IF EXISTS `dept`;
CREATE TABLE `dept` (
  `deptId` int(11) NOT NULL AUTO_INCREMENT,
  `deptName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`deptId`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `dept`
-- ----------------------------
BEGIN;
INSERT INTO `dept` VALUES ('1', '内科'), ('2', '外科'), ('3', '妇产科'), ('4', '男科'), ('5', '儿科'), ('6', '五官科'), ('7', '肿瘤科'), ('8', '皮肤科'), ('9', '中医科'), ('10', '传染科'), ('11', '精神心理科'), ('12', '整形美容科'), ('13', '营养科'), ('14', '生殖中心'), ('15', '麻醉医学科'), ('16', '医学影像科');
COMMIT;

-- ----------------------------
--  Table structure for `dignost`
-- ----------------------------
DROP TABLE IF EXISTS `dignost`;
CREATE TABLE `dignost` (
  `pathId` varchar(255) COLLATE utf8_bin NOT NULL,
  `pathHistory` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pathAllergy` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pathSymptom` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `pathAnalyse` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `doctorId` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`pathId`),
  KEY `doctorId` (`doctorId`),
  CONSTRAINT `dignost_ibfk_1` FOREIGN KEY (`doctorId`) REFERENCES `doctor` (`doctorId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `dignost`
-- ----------------------------
BEGIN;
INSERT INTO `dignost` VALUES ('14574c1d989747fdabcf8dc2c27e3545', null, null, null, null, '68679787807'), ('224f6f498de540ea94b3561d1f99a8bb', '痔疮', '无', '内痔加外痔', '病原体引起', '68679787807'), ('5ffb16d76fc64b37a3e213a58f6c0eec', null, null, null, null, '68679787807'), ('9b5110f7641b4b50ab26bd18915496cd', null, null, null, null, '574576575667'), ('ace6735ad89348feb99fd7ac68cb5652', '无', '无', '发烧', '无', '68679787807'), ('bd49c41304eb448eb9217c7051ccf15b', null, null, null, null, '68679787807'), ('bfb28edaf7e148c3b2ffff845df425b6', null, null, null, null, '68679787807'), ('c8af1cc22c4b42f4b51938e0ba102f58', null, null, null, null, '68679787807'), ('f20cd44f338c4d0ca7dbad7c2b505b76', null, null, null, null, '98769869789');
COMMIT;

-- ----------------------------
--  Table structure for `doctor`
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `doctorId` varchar(50) COLLATE utf8_bin NOT NULL,
  `doctorName` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `doctorPassword` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `deptId` int(11) NOT NULL,
  `doctorSpecial` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`doctorId`),
  KEY `deptId` (`deptId`),
  CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`deptId`) REFERENCES `dept` (`deptId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `doctor`
-- ----------------------------
BEGIN;
INSERT INTO `doctor` VALUES ('2143443636', '霍思邈', 'huosimiao', '2', '神经外科'), ('44532423232', '皇太子', 'huangtaizi', '1', '心脏内科'), ('53423423524', '华佗', 'huatuo', '1', '血液内科'), ('574576575667', '沈佳斌', 'shajiba', '14', '尿液收集'), ('67567567858', '安忠根', 'anzhonggen', '2', '心胸外科'), ('68679787807', '奉达熙', 'fengdaxi', '2', '心胸外科'), ('87834324424', '王虹', 'wanghong', '6', '眼科'), ('98769869789', '吴震', 'wuzhen', '5', '小儿内科');
COMMIT;

-- ----------------------------
--  Table structure for `patient`
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `patientId` int(11) NOT NULL AUTO_INCREMENT,
  `patientName` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `patientSex` varchar(5) COLLATE utf8_bin DEFAULT NULL,
  `patientAge` int(11) DEFAULT NULL,
  `patientAddress` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `pathId` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`patientId`),
  KEY `pathId` (`pathId`),
  CONSTRAINT `patient_ibfk_2` FOREIGN KEY (`pathId`) REFERENCES `dignost` (`pathId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `patient`
-- ----------------------------
BEGIN;
INSERT INTO `patient` VALUES ('3', '冯志林', '女', '55', '浙江省杭州市', '9b5110f7641b4b50ab26bd18915496cd'), ('4', '王八', '男', '45', '浙江省杭州市朝晖五区', 'f20cd44f338c4d0ca7dbad7c2b505b76'), ('5', '画扇悲风殇月夜', '女', '20', '江苏省扬州市广陵区5号', '224f6f498de540ea94b3561d1f99a8bb'), ('6', '奈何亦是泪 ', '男', '18', '江苏省苏州市相城区8号', '5ffb16d76fc64b37a3e213a58f6c0eec'), ('7', '小蛮', '女', '26', '江苏省扬州市瘦西湖区8号', 'ace6735ad89348feb99fd7ac68cb5652'), ('8', '你若安好', '男', '34', '江苏省南通市', 'bd49c41304eb448eb9217c7051ccf15b'), ('9', '便是晴天', '男', '26', '浙江省绍兴市越城区', '14574c1d989747fdabcf8dc2c27e3545'), ('10', '胡爱萍', '女', '38', '江苏省盐城市', 'c8af1cc22c4b42f4b51938e0ba102f58'), ('11', '曹留美', '女', '46', '江苏省南京市', 'bfb28edaf7e148c3b2ffff845df425b6');
COMMIT;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `uId` int(4) NOT NULL AUTO_INCREMENT,
  `uname` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `upassword` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `uoffice` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `uStatus` int(5) DEFAULT NULL,
  PRIMARY KEY (`uId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', '唐雨柔', 'tangyurou', '挂号员', '1'), ('2', '美小护', 'meixiaohu', '药房人员', '1'), ('3', 'admin', 'admin', '管理员', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

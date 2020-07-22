/*
Navicat MySQL Data Transfer

Source Server         : Wen
Source Server Version : 50720
Source Host           : 127.0.0.1:3306
Source Database       : personnel

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2020-07-22 16:49:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `base_name` varchar(255) DEFAULT NULL,
  `is_del` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES ('1', '0', '等级', '0');
INSERT INTO `base` VALUES ('2', '1', 'boos', '1');
INSERT INTO `base` VALUES ('3', '1', '管理员', '1');
INSERT INTO `base` VALUES ('4', '0', '部门', '0');
INSERT INTO `base` VALUES ('5', '4', '运营部', '1');
INSERT INTO `base` VALUES ('6', '4', '财务部', '1');
INSERT INTO `base` VALUES ('7', '4', '总公办', '1');
INSERT INTO `base` VALUES ('8', '4', '市场部', '1');
INSERT INTO `base` VALUES ('9', '4', '教学部', '1');
INSERT INTO `base` VALUES ('10', '4', '测试部门', '1');
INSERT INTO `base` VALUES ('11', '4', '技术部', '1');
INSERT INTO `base` VALUES ('12', '11', '总经理', '1');
INSERT INTO `base` VALUES ('13', '11', '经理', '1');
INSERT INTO `base` VALUES ('14', '11', '主管', '1');
INSERT INTO `base` VALUES ('15', '6', '总经理', '1');
INSERT INTO `base` VALUES ('16', '6', '经理', '1');
INSERT INTO `base` VALUES ('17', '5', '总经理', '1');
INSERT INTO `base` VALUES ('18', '5', '经理', '1');
INSERT INTO `base` VALUES ('19', '5', '主管', '1');
INSERT INTO `base` VALUES ('20', '13', '员工1', '1');
INSERT INTO `base` VALUES ('21', '13', '员工2', '1');
INSERT INTO `base` VALUES ('22', '13', '员工3', '1');
INSERT INTO `base` VALUES ('23', '16', '员工1', '1');
INSERT INTO `base` VALUES ('24', '16', '员工2', '1');
INSERT INTO `base` VALUES ('25', '16', '员工3', '1');
INSERT INTO `base` VALUES ('26', '1', '员工', '1');

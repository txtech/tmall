/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50719
Source Host           : localhost:3306
Source Database       : tmall

Target Server Type    : MYSQL
Target Server Version : 50719
File Encoding         : 65001

Date: 2020-08-18 16:45:59
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cartitem
-- ----------------------------
DROP TABLE IF EXISTS `cartitem`;
CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `number` int(11) NOT NULL DEFAULT '0',
  `sum` decimal(10,2) NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartitem_product` (`pid`),
  KEY `fk_cartitem_user` (`uid`),
  CONSTRAINT `fk_cartitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_cartitem_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cartitem
-- ----------------------------
INSERT INTO `cartitem` VALUES ('1', '1', '1', '1', '1998.00', '2019-03-21 15:49:39');
INSERT INTO `cartitem` VALUES ('2', '1', '1', '2', '1997.00', null);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `recommend` int(11) NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'demo', '99', null);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `content` text,
  `createDate` datetime DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_product` (`pid`),
  KEY `fk_comment_user` (`uid`),
  CONSTRAINT `fk_comment_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS `config`;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `cname` varchar(255) DEFAULT NULL,
  `value` text,
  `rate` int(11) NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of config
-- ----------------------------
INSERT INTO `config` VALUES ('1', 'website_name', '网站名称', '厦门鸿泥雪爪商贸有限公司', '100', null);
INSERT INTO `config` VALUES ('2', 'index_description', '首页描述', '厦门鸿泥雪爪商贸有限公司', '50', null);
INSERT INTO `config` VALUES ('3', 'index_keyword', '首页关键词', '厦门鸿泥雪爪商贸有限公司', '25', null);
INSERT INTO `config` VALUES ('4', 'index_title', '首页标题', '厦门鸿泥雪爪商贸有限公司', '12', null);
INSERT INTO `config` VALUES ('5', 'path_product_img', '产品图片存放目录', 'pictures/product/', '6', null);
INSERT INTO `config` VALUES ('6', 'path_category_img', '分类图片存放目录', 'pictures/category/', '5', null);
INSERT INTO `config` VALUES ('7', 'index_code	', '备案号', '闽ICP备3333333号-1', '0', null);
INSERT INTO `config` VALUES ('8', 'index_svMerchNo', '商户编号', '66672002433333', '0', null);
INSERT INTO `config` VALUES ('9', 'idex_privateKey', '私钥', 'MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDdKhkwEm+pWHB9\r\nYKI5F9f+ZAX5dNHZFiLDAZ+rIhZ+yvuFEfn6OOqsEFIUCnaviefsj0oW3qRAjTO6\r\nBuRYERWs4hR3luIW6YKdAN5Z5wo+r92cXZjp8OpLL13ELsKm/bm9zeU4tKhyZS7E\r\nJT+3/7wlNvFuHaDtw5/amW1nqrcdNL54HesIcLams7m4iJTp3UhyhbuIKlrW8XUF\r\nv4EEFZ0A5TSzoKtutEDB/pU2S6URhl2xzCckCtlAwAn+b/D/2nhK1Bo0s6PBz9+x\r\n26/2bH3aC98FEnCHb0gSRV1tjtZFfi3/QYMYXF87BYsant+obuggAtTXUZeYlClY\r\n5nBI0+KRAgMBAAECggEAA7LYiP1F8McR2obrL5k+e3qgvvM9Lyw3mJtGWE5Rof0z\r\nB56tV4nsIsSDGuKx6W2c+0/KJWfDx3CVFN9YokBm5GVDglx7m3Z8QLPrBAXhHftC\r\n8YJ/NCpbQLaiEs3VY4WKvanb037x8jfO+GjHEASu2NB6aSUFs/Q5kCZQthMczNg0\r\n/RIMFEl5LzHqU5T5S+u7eu9AREnwDtgiH/w/jFb5iDTCNoez3D/+LU61JoLBZNYI\r\nQwQxNm7uV/gDDF5rU0ZFbgTLZ9VfWEPGT+j7+nflnswFeCFMTl9YlRkxE143rmAU\r\n7j6tkw7lbOt9y0WGkNpbr8YAIjbARN/dOQIDdtJgIQKBgQD+xpU1jQVNmJVHgmvs\r\nAc2IZZyvRLPcI7RFjgLLtu5qtskyMUNjKw3FlGSeLtjz5Totdx+ZXBxO4KSp2wat\r\nJ1znytTAY+k2MOTvlqNC6Vh9nHdKTysqJ0faakDMZ3clleXMd4qE3lmYVeMGyKh6\r\nuQPlBu03UpddPAifk6vMff93dwKBgQDeOisCe/3AuU6suRQLu+imM4NlIVAbeyLM\r\nZ0yzS6EnROcfo41O0MPP5XQEwlTRCO2RJvKSxgeV2BUQoiJURH9EwOEezr2KJa2b\r\nKHcM8gMpp7U4LchXRSPva87Nn3viENGJKXD2WLuoGxxG8eNHaofZfZhwnyYHD+ac\r\nQLxl7taINwKBgBpicGNaVllB2vvL2udXDHT6qO5RvBqpK+skGNAGAszUXyOujF8B\r\nv2xdwMnM6jTf4VWCB6i3LEtS4lqgzyExeWKb08qUzjsJdzwEqqWsSri/cm8kocC8\r\nzqkk5c8FTAZ9bo3tN1ApQrgO9PLn5uLGtEuMmxZmnDxQkkgMX/dOeR1jAoGAJTpz\r\naBgje3zPvEnJHOoe4HDyyydYhzIKs1l+1O6PkceOPJOmoZSBqTtUQ1PW56nqOo3e\r\nx03biXPIm5+9xoYvF/KEBCg4QoNrYPnXb9i/ROQujLnGvS/9BCf4XiQgmc+deq/x\r\nl6Nn1JKuGwh8vcMP/RR4TC2tLjOwu25w4Vawo+MCgYBGhNA6MDQLwmSlFPOm5Mlp\r\nFe6s+Zd+qo5KIK2ckJah7AuT8Tjd/TKbxOVAPAT2wg90/Hruq3Bd/MuzIwWuIuRN\r\npmJMPf5nVJUrCiYaFriKnwpwvatJb8jEEpZIUXpiozrapSPayS14OCyyrSezW4pJ\r\n', '0', null);

-- ----------------------------
-- Table structure for orderitem
-- ----------------------------
DROP TABLE IF EXISTS `orderitem`;
CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) DEFAULT NULL,
  `pid` int(11) DEFAULT NULL,
  `cmid` int(11) DEFAULT NULL,
  `number` int(11) unsigned NOT NULL DEFAULT '0',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_orderitem_product` (`pid`),
  KEY `fk_orderitem_order` (`oid`),
  KEY `fk_orderitem_comment` (`cmid`),
  CONSTRAINT `fk_orderitem_comment` FOREIGN KEY (`cmid`) REFERENCES `comment` (`id`),
  CONSTRAINT `fk_orderitem_order` FOREIGN KEY (`oid`) REFERENCES `order_` (`id`),
  CONSTRAINT `fk_orderitem_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of orderitem
-- ----------------------------
INSERT INTO `orderitem` VALUES ('1', '1', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('2', '2', '1', null, '1', '1998.00', null);
INSERT INTO `orderitem` VALUES ('3', '3', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('4', '4', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('5', '5', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('6', '6', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('7', '7', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('8', '7', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('9', '8', '1', null, '4', '7996.00', null);
INSERT INTO `orderitem` VALUES ('10', '8', '1', null, '4', '7996.00', null);
INSERT INTO `orderitem` VALUES ('11', '9', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('12', '9', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('13', '10', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('14', '10', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('15', '11', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('16', '12', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('17', '12', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('18', '12', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('19', '13', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('20', '13', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('21', '14', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('22', '14', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('23', '15', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('24', '15', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('25', '16', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('26', '16', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('27', '17', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('28', '17', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('29', '18', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('30', '18', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('31', '19', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('32', '19', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('33', '19', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('34', '19', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('35', '20', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('36', '20', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('37', '20', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('38', '20', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('39', '20', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('40', '21', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('41', '21', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('42', '21', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('43', '21', '1', null, '1', '1999.00', null);
INSERT INTO `orderitem` VALUES ('44', '21', '1', null, '1', '1999.00', null);

-- ----------------------------
-- Table structure for order_
-- ----------------------------
DROP TABLE IF EXISTS `order_`;
CREATE TABLE `order_` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `orderCode` varchar(255) NOT NULL DEFAULT '',
  `sum` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `totalNumber` int(11) unsigned NOT NULL DEFAULT '0',
  `address` varchar(255) DEFAULT '',
  `post` varchar(255) DEFAULT '',
  `receiver` varchar(255) DEFAULT '',
  `mobile` varchar(255) DEFAULT '',
  `userMessage` varchar(255) DEFAULT '',
  `createDate` datetime DEFAULT NULL,
  `payDate` datetime DEFAULT NULL,
  `deliverDate` datetime DEFAULT NULL,
  `confirmDate` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_order_user` (`uid`),
  CONSTRAINT `fk_order_user` FOREIGN KEY (`uid`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_
-- ----------------------------
INSERT INTO `order_` VALUES ('1', '1', '201903181345087091212085421', '1999.00', '1', 'dddd', '', 'test', '15988888888', '', '2019-03-18 13:45:08', '2019-03-18 13:45:19', null, null, 'waitDeliver', null);
INSERT INTO `order_` VALUES ('2', '1', '201903211549388471890426437', '1998.00', '1', '漳州漳州漳州漳州漳州', '360000', '漳州', '15559557090', '', '2019-03-21 15:49:39', '2019-03-21 15:53:04', null, null, 'waitDeliver', null);
INSERT INTO `order_` VALUES ('3', '1', '202008111902212991186173118', '1999.00', '1', '321321', '356000', '321321', '15559557090', '', '2020-08-11 19:02:21', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('4', '1', '20200811190413414672669257', '1999.00', '1', '32132132', '3213213', '321321321', '15559557090', '', '2020-08-11 19:04:13', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('5', '1', '20200811190413414672669257', '1999.00', '1', '32132132', '3213213', '321321321', '15559557090', '', '2020-08-11 19:04:13', null, null, null, 'waitComment', null);
INSERT INTO `order_` VALUES ('6', '1', '20200811190413414672669257', '1999.00', '1', '32132132', '3213213', '321321321', '15559557090', '', '2020-08-11 19:04:13', null, null, '2020-08-11 19:18:17', 'waitComment', null);
INSERT INTO `order_` VALUES ('7', '1', '202008111937328731141773547', '3998.00', '2', '3213213213', '356000', '林', '15559557090', '', '2020-08-11 19:37:33', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('8', '1', '20200811193822702136544057', '15992.00', '2', '321321321', '356000', '林', '15559557000', '', '2020-08-11 19:38:23', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('9', '1', '20200811194226820201004695', '3998.00', '2', '32432432', '356000', '林', '15559557090', '', '2020-08-11 19:42:27', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('10', '1', '202008111956327361737165898', '3998.00', '2', '321321', '356000', '321321', '15559557090', '', '2020-08-11 19:56:33', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('11', '1', '202008111958398612117841962', '1999.00', '1', '54654', '356000', '林', '15559557000', '', '2020-08-11 19:58:40', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('12', '1', '202008111959041861352577048', '5997.00', '3', '321321321', '356000', '321321', '15559557090', '', '2020-08-11 19:59:04', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('13', '1', '20200811200018754323776748', '3998.00', '2', '2332312', '3213213', '林', '15559557090', '', '2020-08-11 20:00:19', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('14', '1', '20200811204114157364457971', '3998.00', '2', '321321321', '356000', '林', '15559557000', '', '2020-08-11 20:41:14', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('15', '1', '20200811204248804540593432', '3998.00', '2', '321321321', '356000', '林', '15559557000', '', '2020-08-11 20:42:49', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('16', '1', '202008112043242921083619119', '3998.00', '2', '321321321', '356000', '林', '15559557000', '', '2020-08-11 20:43:24', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('17', '1', '2020081120435134547074958', '3998.00', '2', '321321321', '356000', '林', '15559557000', '', '2020-08-11 20:43:51', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('18', '1', '202008112044211201199366324', '3998.00', '2', '43243243', '356000', '林', '15559557000', '', '2020-08-11 20:44:21', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('19', '1', '202008112045172391270832028', '7996.00', '4', '321321', '356000', '林', '15559557000', '', '2020-08-11 20:45:17', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('20', '1', '2020081120503753372596065', '9995.00', '5', '432432', '356000', '林', '15559557090', '', '2020-08-11 20:50:38', null, null, null, 'waitPay', null);
INSERT INTO `order_` VALUES ('21', '1', '20200811205128932674488401', '9995.00', '5', '43243242', '356000', '林', '15559557090', '', '2020-08-11 20:51:29', null, null, null, 'waitPay', null);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `subTitle` varchar(255) NOT NULL DEFAULT '',
  `originalPrice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `nowPrice` decimal(10,2) unsigned NOT NULL DEFAULT '0.00',
  `stock` int(11) unsigned NOT NULL DEFAULT '0',
  `imgid` int(11) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `commentCount` int(11) unsigned NOT NULL DEFAULT '0',
  `saleCount` int(11) unsigned NOT NULL DEFAULT '0',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_category` (`cid`),
  KEY `fk_product_product_image` (`imgid`),
  CONSTRAINT `fk_product_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '1', '华为手机', 'MATE 20', '1999.00', '1999.00', '53', null, '2019-03-18 13:44:03', '0', '42', null);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_product_image` (`pid`),
  CONSTRAINT `fk_product_image` FOREIGN KEY (`pid`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_image
-- ----------------------------

-- ----------------------------
-- Table structure for property
-- ----------------------------
DROP TABLE IF EXISTS `property`;
CREATE TABLE `property` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_category` (`cid`),
  CONSTRAINT `fk_property_category` FOREIGN KEY (`cid`) REFERENCES `category` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property
-- ----------------------------
INSERT INTO `property` VALUES ('1', '1', '颜色', null);

-- ----------------------------
-- Table structure for property_value
-- ----------------------------
DROP TABLE IF EXISTS `property_value`;
CREATE TABLE `property_value` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `ptid` int(11) DEFAULT NULL,
  `value` varchar(255) NOT NULL DEFAULT '',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_property_value_property` (`ptid`),
  KEY `fk_property_value_product` (`pid`),
  CONSTRAINT `fk_property_value_product` FOREIGN KEY (`pid`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_property_value_property` FOREIGN KEY (`ptid`) REFERENCES `property` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of property_value
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT '',
  `password` varchar(255) DEFAULT '',
  `group_` varchar(255) NOT NULL DEFAULT 'user',
  `deleteAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '614344bd47ad633f4a39461e5b3cc114', 'superAdmin', null);
INSERT INTO `user` VALUES ('2', '1234', '48649abf6913d0e3d51a5893f997d791', 'user', null);
INSERT INTO `user` VALUES ('3', '333', 'f08fc098b01ed1edf6129972e70643c2', 'user', null);

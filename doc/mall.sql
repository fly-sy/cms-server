/*
Navicat MySQL Data Transfer

Source Server         : ssr
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : mall

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2019-05-23 02:58:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS `comments`;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `artid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comments
-- ----------------------------
INSERT INTO `comments` VALUES ('1', '匿名用户', '2018-07-15 14:49:11', '1', '0', '2');
INSERT INTO `comments` VALUES ('2', '匿名用户', '2018-07-15 14:49:13', '2', '0', '2');
INSERT INTO `comments` VALUES ('3', '匿名用户', '2018-07-15 14:49:15', '3', '0', '2');
INSERT INTO `comments` VALUES ('4', '匿名用户', '2018-07-15 14:49:16', '4', '0', '2');
INSERT INTO `comments` VALUES ('5', '匿名用户', '2018-07-15 16:13:48', 'ssss', '0', '12');
INSERT INTO `comments` VALUES ('6', '匿名用户', '2018-07-15 16:13:51', 'ssss', '0', '12');
INSERT INTO `comments` VALUES ('7', '匿名用户', '2018-07-15 16:14:00', '11', '0', '12');
INSERT INTO `comments` VALUES ('8', '匿名用户', '2018-07-15 16:36:55', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('9', '匿名用户', '2018-07-15 18:14:19', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('10', '匿名用户', '2018-07-15 18:14:23', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('11', '匿名用户', '2018-07-15 18:14:24', 'dddd', '0', '1');
INSERT INTO `comments` VALUES ('12', '匿名用户', '2018-07-15 19:35:54', '2222', '0', '1');
INSERT INTO `comments` VALUES ('13', '匿名用户', '2018-07-15 19:35:56', 'ddddd', '0', '1');
INSERT INTO `comments` VALUES ('14', '匿名用户', '2018-07-15 19:35:59', 'ssss', '0', '1');

-- ----------------------------
-- Table structure for girds
-- ----------------------------
DROP TABLE IF EXISTS `girds`;
CREATE TABLE `girds` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `to` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `src` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of girds
-- ----------------------------
INSERT INTO `girds` VALUES ('1', '/home/newslist', '新闻资讯', '/home/gird/menu1.png', '0');
INSERT INTO `girds` VALUES ('2', '/home/photolist', '图片分享', '/home/gird/menu2.png', '0');
INSERT INTO `girds` VALUES ('3', '/home/goodslist', '商品购买', '/home/gird/menu3.png', '0');
INSERT INTO `girds` VALUES ('4', '/home/newslist', '留言反馈', '/home/gird/menu4.png', '0');
INSERT INTO `girds` VALUES ('5', '/home/newslist', '视频区域', '/home/gird/menu5.png', '0');
INSERT INTO `girds` VALUES ('6', '/home/newslist', '联系我们', '/home/gird/menu6.png', '0');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `sell_price` decimal(10,0) DEFAULT NULL,
  `market_price` decimal(10,0) DEFAULT NULL,
  `stock_quantity` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `thumb_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', '荣耀10', '2018-07-15 19:14:00', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '101');
INSERT INTO `goods` VALUES ('2', 'HUAWEI P20', '2018-07-15 19:14:00', 'HUAWEI P20 6GB+64GB 全网通版（极光色）', '3000', '/goods/images/2.jpg', '3788', '4000', '10', '0', '102');
INSERT INTO `goods` VALUES ('3', '荣耀V10', '2018-07-15 19:14:00', '荣耀V10 全网通标配版 4GB+64GB（魅丽红）', '100', '/goods/images/3.jpg', '1999', '2200', '100', '0', '103');
INSERT INTO `goods` VALUES ('4', '荣耀10 ', '2018-07-15 19:26:27', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '104');
INSERT INTO `goods` VALUES ('5', '荣耀10 ', '2018-07-15 19:33:13', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '105');
INSERT INTO `goods` VALUES ('6', '荣耀10 ', '2018-07-15 19:33:14', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '106');
INSERT INTO `goods` VALUES ('7', '荣耀10 ', '2018-07-15 19:33:15', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '107');
INSERT INTO `goods` VALUES ('8', '荣耀10 ', '2018-07-15 19:33:15', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '108');
INSERT INTO `goods` VALUES ('9', '荣耀10 ', '2018-07-15 19:33:16', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '109');
INSERT INTO `goods` VALUES ('10', '荣耀10 ', '2018-07-15 19:33:16', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '299', '/goods/images/1.jpg', '2599', '3000', '60', '0', '110');

-- ----------------------------
-- Table structure for goods_info
-- ----------------------------
DROP TABLE IF EXISTS `goods_info`;
CREATE TABLE `goods_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` datetime DEFAULT NULL,
  `sell_price` decimal(10,0) DEFAULT NULL,
  `market_price` decimal(10,0) DEFAULT NULL,
  `stock_quantity` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `goods_no` varchar(255) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of goods_info
-- ----------------------------
INSERT INTO `goods_info` VALUES ('1', '荣耀10', '2018-07-15 19:14:00', '2599', '3000', '60', '0', 'SD3345678902', '1');
INSERT INTO `goods_info` VALUES ('2', 'HUAWEI P20', '2018-07-15 19:14:00', '3788', '4000', '10', '0', 'SD3345678902', '2');
INSERT INTO `goods_info` VALUES ('3', '荣耀V10', '2018-07-15 19:14:00', '1999', '2200', '100', '0', 'SD3345678902', '3');
INSERT INTO `goods_info` VALUES ('4', '荣耀10 ', '2018-07-15 19:26:27', '2599', '3000', '60', '0', 'SD3345678902', '4');
INSERT INTO `goods_info` VALUES ('5', '荣耀10 ', '2018-07-15 19:33:13', '2599', '3000', '60', '0', 'SD3345678902', '5');
INSERT INTO `goods_info` VALUES ('6', '荣耀10 ', '2018-07-15 19:33:14', '2599', '3000', '60', '0', 'SD3345678902', '6');
INSERT INTO `goods_info` VALUES ('7', '荣耀10 ', '2018-07-15 19:33:15', '2599', '3000', '60', '0', 'SD3345678902', '7');
INSERT INTO `goods_info` VALUES ('8', '荣耀10 ', '2018-07-15 19:33:15', '2599', '3000', '60', '0', 'SD3345678902', '8');
INSERT INTO `goods_info` VALUES ('9', '荣耀10 ', '2018-07-15 19:33:16', '2599', '3000', '60', '0', 'SD3345678902', '9');
INSERT INTO `goods_info` VALUES ('10', '荣耀10 ', '2018-07-15 19:33:16', '2599', '3000', '60', '0', 'SD3345678902', '10');

-- ----------------------------
-- Table structure for good_desc
-- ----------------------------
DROP TABLE IF EXISTS `good_desc`;
CREATE TABLE `good_desc` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `desc_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good_desc
-- ----------------------------
INSERT INTO `good_desc` VALUES ('0', '荣耀10 AI摄影手机 6GB+64GB 幻影蓝 全网通 双卡双待 高配版 荣耀 10GT', '限时下单立减100，到手价2499元，赠荣耀耳机+运动臂带，享双倍积分，晒单赢499元美食卡，现货速发！', '0', '1');

-- ----------------------------
-- Table structure for imgs_class
-- ----------------------------
DROP TABLE IF EXISTS `imgs_class`;
CREATE TABLE `imgs_class` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_class
-- ----------------------------
INSERT INTO `imgs_class` VALUES ('1', '美女', '0');
INSERT INTO `imgs_class` VALUES ('2', '宠物', '0');
INSERT INTO `imgs_class` VALUES ('3', '家具', '0');
INSERT INTO `imgs_class` VALUES ('4', '运动', '0');
INSERT INTO `imgs_class` VALUES ('5', '数码', '0');
INSERT INTO `imgs_class` VALUES ('6', '乐器', '0');
INSERT INTO `imgs_class` VALUES ('7', '游戏', '0');

-- ----------------------------
-- Table structure for imgs_data
-- ----------------------------
DROP TABLE IF EXISTS `imgs_data`;
CREATE TABLE `imgs_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  `class_id` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_data
-- ----------------------------
INSERT INTO `imgs_data` VALUES ('1', '教师节快乐', '/share/images/1.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('2', '教师节快乐', '/share/images/2.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('3', '教师节快乐', '/share/images/3.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('4', '教师节快乐', '/share/images/4.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('5', '教师节快乐', '/share/images/5.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('6', '教师节快乐', '/share/images/6.jpg', '好好学习，天天向上', '0', '1');
INSERT INTO `imgs_data` VALUES ('7', '教师节快乐', '/share/images/7.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('8', '教师节快乐', '/share/images/8.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('9', '教师节快乐', '/share/images/9.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('10', '教师节快乐', '/share/images/10.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('11', '教师节快乐', '/share/images/11.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('12', '教师节快乐', '/share/images/12.jpg', '好好学习，天天向上', '0', '2');
INSERT INTO `imgs_data` VALUES ('13', '教师节快乐', '/share/images/13.jpg', '好好学习，天天向上', '0', '3');
INSERT INTO `imgs_data` VALUES ('14', '教师节快乐', 'http://localhost:5000/share/images/14.jpg', '好好学习，天天向上', '0', '3');

-- ----------------------------
-- Table structure for imgs_info
-- ----------------------------
DROP TABLE IF EXISTS `imgs_info`;
CREATE TABLE `imgs_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(255) DEFAULT NULL,
  `info_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_info
-- ----------------------------
INSERT INTO `imgs_info` VALUES ('1', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '2');
INSERT INTO `imgs_info` VALUES ('2', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '1');
INSERT INTO `imgs_info` VALUES ('3', '教师节快乐', '3', '2018-07-10 15:53:46', '难忘的校园时光，有着难忘的师生情怀；坦诚的学生时代，有着您孜孜不倦的...', '0', '3');

-- ----------------------------
-- Table structure for imgs_thumbs
-- ----------------------------
DROP TABLE IF EXISTS `imgs_thumbs`;
CREATE TABLE `imgs_thumbs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `src` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  `thumbs_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of imgs_thumbs
-- ----------------------------
INSERT INTO `imgs_thumbs` VALUES ('1', '/share/images/1.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('2', '/share/images/2.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('3', '/share/images/3.jpg', '0', '1');
INSERT INTO `imgs_thumbs` VALUES ('4', '/share/images/4.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('5', '/share/images/5.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('6', '/share/images/6.jpg', '0', '2');
INSERT INTO `imgs_thumbs` VALUES ('7', '/share/ithumbs/images/5.jpg', '0', '3');
INSERT INTO `imgs_thumbs` VALUES ('8', '/share/ithumbs/images/6.jpg', '0', '101');
INSERT INTO `imgs_thumbs` VALUES ('9', '/share/ithumbs/images/7.jpg', '0', '101');
INSERT INTO `imgs_thumbs` VALUES ('10', '/share/ithumbs/images/8.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('11', '/share/ithumbs/images/9.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('12', '/share/ithumbs/images/10.jpg', '0', '102');
INSERT INTO `imgs_thumbs` VALUES ('13', '/share/ithumbs/images/11.jpg', '0', '103');
INSERT INTO `imgs_thumbs` VALUES ('14', '/share/ithumbs/images/12.jpg', '0', '103');
INSERT INTO `imgs_thumbs` VALUES ('15', '/share/ithumbs/images/13.jpg', '0', '103');

-- ----------------------------
-- Table structure for lunbo
-- ----------------------------
DROP TABLE IF EXISTS `lunbo`;
CREATE TABLE `lunbo` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `img` varchar(255) DEFAULT NULL,
  `isdel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of lunbo
-- ----------------------------
INSERT INTO `lunbo` VALUES ('1', '/home/lunbo/1.jpg', '0');
INSERT INTO `lunbo` VALUES ('2', '/home/lunbo/2.jpg', '0');
INSERT INTO `lunbo` VALUES ('3', '/home/lunbo/3.jpg', '0');

-- ----------------------------
-- Table structure for news
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `add_time` varchar(255) DEFAULT NULL,
  `zhaiyao` varchar(255) DEFAULT NULL,
  `click` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `isdel` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:46', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/1.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');
INSERT INTO `news` VALUES ('2', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:47', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/2.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');
INSERT INTO `news` VALUES ('3', '习近平出席中阿合作论坛会议发表重要讲话', '2018-07-10 15:53:48', '习近平提出的“晋江经验”  一座城的坚守与匠心', '1', '/news/images/3.jpg', '　　编者按 晋江是一个创造奇迹的地方，这座县级市以福建省二百分之一的面积创造了全省十六分之一的GDP。习近平同志在福建工作时，6年间7次去晋江调研，2002年亲自总结提炼了“晋江经验”：“六个始终坚持”和“处理好五大关系”。\n\n', '0');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `ctime` varchar(255) DEFAULT NULL,
  `isdel` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '奥迪', '2018-07-10 14:01:12', '0');
INSERT INTO `product` VALUES ('2', '宝马', '2018-07-10 14:01:19', '0');
INSERT INTO `product` VALUES ('3', '大众', '2018-07-10 14:01:43', '0');

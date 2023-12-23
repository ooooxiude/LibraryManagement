/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80013
 Source Host           : localhost:3306
 Source Schema         : jsp_library_management

 Target Server Type    : MySQL
 Target Server Version : 80013
 File Encoding         : 65001

 Date: 23/05/2021 11:13:59
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `bookid` int(11) NOT NULL AUTO_INCREMENT,
  `bookname` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  `author` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `publish` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `categoryid` int(11) NOT NULL,
  `booklink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `deadline` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`bookid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '水浒传', 23.00, '施耐庵', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:09');
INSERT INTO `book` VALUES (2, '西游记', 25.00, '吴承恩', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:13');
INSERT INTO `book` VALUES (3, '红楼梦', 35.00, '曹雪芹', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:17');
INSERT INTO `book` VALUES (4, '三国演义', 28.00, '罗贯中', '人民文学出版社', 0, 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 20:56:15');
INSERT INTO `book` VALUES (23, '1', 1.00, '1', '1', 1, '1', '2021-05-23 08:47:59');

-- ----------------------------
-- Table structure for bookshelf
-- ----------------------------
DROP TABLE IF EXISTS `bookshelf`;
CREATE TABLE `bookshelf`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `booklink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `adddate` datetime(0) NULL DEFAULT NULL,
  `removedate` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `fk_self_bookid`(`bookid`) USING BTREE,
  INDEX `fk_self_userid`(`userid`) USING BTREE,
  CONSTRAINT `fk_self_bookid` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_self_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bookshelf
-- ----------------------------
INSERT INTO `bookshelf` VALUES (13, 1, 1, '水浒传', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:10', NULL);
INSERT INTO `bookshelf` VALUES (14, 1, 4, '三国演义', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:41', NULL);
INSERT INTO `bookshelf` VALUES (15, 1, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:58', NULL);
INSERT INTO `bookshelf` VALUES (17, 1, 2, '西游记', NULL, '2021-05-23 08:51:46', NULL);

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `commentid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `comment` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`commentid`) USING BTREE,
  INDEX `fk_comm_userid`(`userid`) USING BTREE,
  INDEX `fk_comm_bookid`(`bookid`) USING BTREE,
  CONSTRAINT `fk_comm_bookid` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comm_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES (6, 1, '2001', 4, '三国演义', '非常好', '2021-05-22 20:35:58');
INSERT INTO `comment` VALUES (7, 1, '2001', 1, '水浒传', '值得一看！', '2021-05-23 08:50:35');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record`  (
  `borrowid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `bookname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `booklink` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `borrowtime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`borrowid`) USING BTREE,
  INDEX `fk_rec_userid`(`userid`) USING BTREE,
  INDEX `fk_rec_bookid`(`bookid`) USING BTREE,
  CONSTRAINT `fk_rec_bookid` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_rec_userid` FOREIGN KEY (`userid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES (3, 1, 4, '三国演义', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:41');
INSERT INTO `record` VALUES (4, 1, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-22 23:20:58');
INSERT INTO `record` VALUES (6, 1, 2, '西游记', 'http://www.sdmzh.com.cn/yd/hlmyd/hl', '2021-05-23 08:51:46');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `isadmin` int(1) NOT NULL,
  PRIMARY KEY (`userid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 201720732 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '2001', '123456', '123456@qq.com', '1234567', 0);
INSERT INTO `user` VALUES (5, 'admin', 'admin', '123456@qq.com', '123456', 1);

SET FOREIGN_KEY_CHECKS = 1;

/*
 Navicat MySQL Data Transfer

 Source Server         : root
 Source Server Type    : MySQL
 Source Server Version : 50736
 Source Host           : localhost:3306
 Source Schema         : society

 Target Server Type    : MySQL
 Target Server Version : 50736
 File Encoding         : 65001

 Date: 22/01/2022 13:44:22
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for academies
-- ----------------------------
DROP TABLE IF EXISTS `academies`;
CREATE TABLE `academies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '1 可用 2 不可用 -1删除',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='学院表';

-- ----------------------------
-- Records of academies
-- ----------------------------
BEGIN;
INSERT INTO `academies` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (1, '人工智能学院学院', 2, 1, '2022-01-21 12:49:22');
INSERT INTO `academies` (`id`, `name`, `sort`, `status`, `create_time`) VALUES (2, '计算机学院', 1, 1, '2022-01-21 12:47:59');
COMMIT;

-- ----------------------------
-- Table structure for activities
-- ----------------------------
DROP TABLE IF EXISTS `activities`;
CREATE TABLE `activities` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `apply_end_time` datetime NOT NULL,
  `apply_start_time` datetime NOT NULL,
  `content` text NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activities
-- ----------------------------
BEGIN;
INSERT INTO `activities` (`id`, `society_id`, `name`, `apply_end_time`, `apply_start_time`, `content`, `create_by`, `create_time`, `status`) VALUES (1, 1, '活动2', '2022-04-26 00:00:00', '2022-01-01 00:00:00', '<p>这是活动2的内容哦</p>', 'test1', '2021-12-02 12:04:57', 1);
INSERT INTO `activities` (`id`, `society_id`, `name`, `apply_end_time`, `apply_start_time`, `content`, `create_by`, `create_time`, `status`) VALUES (2, 1, '活动1', '2022-09-12 00:00:00', '2022-01-02 00:00:00', '<p>这是活动1的内容哦</p><p><img src=\"/uploads/194635c2135e05e618cd3b856327dfff.png\" style=\"max-width:100%;\"><br></p>', 'test2', '2021-12-05 12:25:38', 1);
INSERT INTO `activities` (`id`, `society_id`, `name`, `apply_end_time`, `apply_start_time`, `content`, `create_by`, `create_time`, `status`) VALUES (3, 2, 'test', '2022-03-23 00:00:00', '2022-01-03 00:00:00', '<p><br></p>', 'test3', '2021-12-09 18:32:56', 1);
COMMIT;

-- ----------------------------
-- Table structure for articles
-- ----------------------------
DROP TABLE IF EXISTS `articles`;
CREATE TABLE `articles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `abstract` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `edit_time` datetime NOT NULL,
  `edit_by` varchar(45) NOT NULL,
  `society_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of articles
-- ----------------------------
BEGIN;
INSERT INTO `articles` (`id`, `title`, `abstract`, `content`, `create_time`, `create_by`, `edit_time`, `edit_by`, `society_id`, `status`) VALUES (1, '第一篇文章测试', 'test第一遍文章', '<p>测试第一篇文章</p>', '2022-01-20 01:47:26', 'test1', '2022-01-20 10:31:07', 'test1', 1, 1);
INSERT INTO `articles` (`id`, `title`, `abstract`, `content`, `create_time`, `create_by`, `edit_time`, `edit_by`, `society_id`, `status`) VALUES (2, 'test有图片的发布文章  长开头长开头长开头长开头长开头长开头', '测试 摘要', '<p>这是一篇测试文章</p><p>测试测试</p><p>测试</p><p><img src=\"/uploads/194635c2135e05e618cd3b856327dfff.png\" style=\"max-width:100%;\"><img src=\"public/uploads/articles/3b27386fc49e60763fe153c2ac85635d.png\" style=\"line-height: 20px; max-width: 100%;\"></p><p><img src=\"public/uploads/articles/931d194a91016b64fe6135426be3e554.png\" style=\"line-height: 20px; max-width: 100%;\"><br></p>', '2022-01-19 01:48:18', 'test1', '2022-01-20 18:12:46', 'test1', 1, 1);
INSERT INTO `articles` (`id`, `title`, `abstract`, `content`, `create_time`, `create_by`, `edit_time`, `edit_by`, `society_id`, `status`) VALUES (3, '果壳社团开始招新啦', '果壳社团', '<p>果壳社团开始招新啦</p><p><img src=\"/index/images/lunbo3.jpg\" style=\"max-width:100%;\"><br></p>', '2022-01-18 10:50:33', 'test1', '2022-01-20 10:50:33', 'test1', 2, 1);
INSERT INTO `articles` (`id`, `title`, `abstract`, `content`, `create_time`, `create_by`, `edit_time`, `edit_by`, `society_id`, `status`) VALUES (4, '社团简介', '简介', '<p><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\">中心简介</psegoe></p><p></p><p><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\"><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\">CENTER OUTLINE</psegoe></psegoe></p><p></p><p><span><span>果壳志愿者服务中心一直秉承</span><span times=\"\" new=\"\">“</span><span>立足校园、发挥优势、奉献爱心、服务社会</span><span times=\"\" new=\"\">”</span><span>为宗旨，倡导</span><span times=\"\" new=\"\">“</span><span>奉献、友爱、互助、进步</span><span times=\"\" new=\"\">”</span><span>的青年志愿者精神，鼓励广大志愿者在服务他人、服务社会的同时，提高自我，发展自我，锻炼自我，奋发成长，立志培养具有强烈的社会责任感与拥有高尚道德情操的志愿者，形成果壳一道亮丽的志愿风景线。</span></span></p><p><span><span><br></span></span></p><p><span><span></span></span></p><p><span></span></p><p><span></span></p><p><strong><span>常委层骨干介绍——主任层</span></strong><span></span></p><p><span><br></span></p><p><span><img width=\"536\" height=\"407\" title=\"1013_1.jpg\" alt=\"1013_1.jpg\" src=\"public/uploads/articles/3b27386fc49e60763fe153c2ac85635d.png\"></span></p><p><span>主任<br></span></p><p><span></span></p><p><span>李xx，男，汉族，共青团员，研一在读。曾任班级班长，有较丰富的公益志愿服务</span><span>组织</span><span>经验，</span><span>如</span><span>曾获青年志愿者服务中心“先进个人”称号、“优秀志愿者”称号</span><span>。</span></p><p><span></span><br></p><p><br></p><p>', '2022-01-17 20:39:32', 'test1', '2022-01-20 20:39:32', 'test1', 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `filesize` varchar(45) NOT NULL,
  `random_name` varchar(100) NOT NULL,
  `society_id` int(11) NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attachments
-- ----------------------------
BEGIN;
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (1, 'user4.png', '21884', 'd26b7937cd11b3abe0465e0141a68252.png', 1, '陈光炜1', '2021-12-12 23:42:20', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (2, 'user5.png', '17854', 'f97a2f3ef0320b4c2a500645ec9d78d8.png', 1, '陈光炜1', '2021-12-12 23:51:59', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (3, 'user3.png', '18931', '931d194a91016b64fe6135426be3e554.png', 1, '陈光炜1', '2021-12-12 23:51:59', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (4, 'user4.png', '21884', 'd26b7937cd11b3abe0465e0141a68252.png', 1, '陈光炜1', '2021-12-12 23:51:59', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (5, 'user2.png', '21735', '06e5eeefd8346fbe82359c015900a058.png', 1, '陈光炜1', '2021-12-12 23:52:01', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (6, 'user1.png', '21032', '3b27386fc49e60763fe153c2ac85635d.png', 1, '陈光炜1', '2021-12-12 23:52:02', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (7, 'user5.png', '17854', 'f97a2f3ef0320b4c2a500645ec9d78d8.png', 1, '陈光炜1', '2021-12-12 23:55:09', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (8, '高级软件工程开题报告【new】.doc', '338944', 'ae5dcd62f24c52280387406496ac0782.doc', 1, '陈光炜1', '2021-12-12 23:55:54', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (11, 'user4.png', '21884', 'd26b7937cd11b3abe0465e0141a68252.png', 1, '陈光炜1', '2021-12-13 00:04:24', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (12, 'user5.png', '17854', 'f97a2f3ef0320b4c2a500645ec9d78d8.png', 1, '陈光炜1', '2021-12-13 00:04:24', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (13, 'user1.png', '21032', '3b27386fc49e60763fe153c2ac85635d.png', 1, '陈光炜1', '2021-12-15 00:54:43', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (14, 'e27e8575cb467e1d91a7a3b4e19f1292.jpg', '641437', 'a9f2603280e1fa7adccc5890c822d2b7.jpg', 2, '程哥哥', '2022-01-21 13:14:07', 1);
INSERT INTO `attachments` (`id`, `name`, `filesize`, `random_name`, `society_id`, `create_by`, `create_time`, `status`) VALUES (15, '紧急通知.txt', '379', '1998366fac4e44d7e7c8f758faf2fcfe.txt', 2, '程哥哥', '2022-01-21 13:16:34', 1);
COMMIT;

-- ----------------------------
-- Table structure for cons
-- ----------------------------
DROP TABLE IF EXISTS `cons`;
CREATE TABLE `cons` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `activity_id` int(11) NOT NULL DEFAULT '0',
  `society_id` int(11) NOT NULL DEFAULT '0',
  `student_no` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cons
-- ----------------------------
BEGIN;
INSERT INTO `cons` (`id`, `activity_id`, `society_id`, `student_no`, `name`, `start_time`, `status`, `create_time`) VALUES (1, 1, 0, '987654321', '小明', '2022-01-22 13:37:59', 3, '2022-01-22 13:37:59');
COMMIT;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(4) NOT NULL COMMENT '1 可用 2 不可用 -1删除',
  `society_id` int(11) NOT NULL COMMENT 'refe society',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of departments
-- ----------------------------
BEGIN;
INSERT INTO `departments` (`id`, `name`, `sort`, `status`, `society_id`, `create_time`) VALUES (1, '宣传部', 1, 1, 2, '2021-12-25 17:43:51');
INSERT INTO `departments` (`id`, `name`, `sort`, `status`, `society_id`, `create_time`) VALUES (2, '策划部', 1, 1, 1, '2021-12-25 17:43:51');
INSERT INTO `departments` (`id`, `name`, `sort`, `status`, `society_id`, `create_time`) VALUES (3, '秘书部', 1, 1, 1, '2021-12-25 17:43:51');
INSERT INTO `departments` (`id`, `name`, `sort`, `status`, `society_id`, `create_time`) VALUES (4, '培训部', 1, 1, 1, '2021-12-25 17:43:51');
COMMIT;

-- ----------------------------
-- Table structure for introduces
-- ----------------------------
DROP TABLE IF EXISTS `introduces`;
CREATE TABLE `introduces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society_id` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of introduces
-- ----------------------------
BEGIN;
INSERT INTO `introduces` (`id`, `society_id`, `content`, `create_by`, `create_time`, `status`) VALUES (2, 1, '<p>test</p><p></p><ol><li><span style=\"line-height: 1.5;\">第一遍社团简介222333</span></li><li><span style=\"line-height: 1.5;\">324123</span></li><li><span style=\"line-height: 1.5;\">3412</span></li><li><span style=\"line-height: 1.5;\">锐23</span><img src=\"/uploads/articles/e27e8575cb467e1d91a7a3b4e19f1292.jpg\" style=\"max-width:100%;\"></li></ol><p></p>', '陈光炜1', '2018-03-17 22:16:50', 1);
INSERT INTO `introduces` (`id`, `society_id`, `content`, `create_by`, `create_time`, `status`) VALUES (3, 2, '<div>简介</div><div><a href=\"http://localhost:3000/index/society/2\">国科大科研社团 \n                  </a></div><div><a href=\"http://localhost:3000/index/society/2\">国科大科研社团&nbsp;</a></div><div><a href=\"http://localhost:3000/index/society/2\">国科大科研社团 \n                  </a></div><div><a href=\"http://localhost:3000/index/society/2\">国科大科研社团</a></div><div><a href=\"http://localhost:3000/index/society/2\">&nbsp;</a><a href=\"http://localhost:3000/index/society/2\">国科大科研社团 \n                  </a></div><p><br></p><p><br></p><p><br></p><p><br></p>', 'test1', '2022-01-19 22:32:13', 1);
COMMIT;

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobs
-- ----------------------------
BEGIN;
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (28, '部长', 1);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (29, '副部长', 1);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (30, '理事', 1);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (34, '部长', 3);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (35, '副部长', 3);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (36, '理事', 3);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (37, '部长', 4);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (38, '副部长', 4);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (39, '理事', 4);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (47, '部长', 2);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (48, '副部长', 2);
INSERT INTO `jobs` (`id`, `name`, `department_id`) VALUES (49, '理事', 2);
COMMIT;

-- ----------------------------
-- Table structure for levels
-- ----------------------------
DROP TABLE IF EXISTS `levels`;
CREATE TABLE `levels` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society_id` int(11) NOT NULL DEFAULT '0',
  `student_no` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `sex` tinyint(4) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `academy_id` int(11) DEFAULT NULL,
  `major_id` int(11) DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `native_place` varchar(100) DEFAULT NULL,
  `emer_name` varchar(15) DEFAULT NULL,
  `emer_phone` varchar(15) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of levels
-- ----------------------------
BEGIN;
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (5, 1, '201430350301', 'test1', '2018-01-10 00:00:00', '2019-12-01 00:00:00', 1, '18819260875', 4, 13, '809871527@qq.com', '', '', '', '', 1, '2018-03-14 15:48:41', '2018-03-14 15:48:41');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (6, 1, '201430350302', 'test2', NULL, NULL, 1, '', 0, 0, '', '', '', '', '', 1, '2018-03-11 16:44:43', '2018-03-11 16:44:43');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (7, 1, '201430350303', 'test3', '2018-02-08 00:00:00', '2018-09-05 00:00:00', 2, '', 0, 0, '', '', '', '', '', 2, '2018-03-11 16:48:15', '2018-03-11 16:48:15');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (8, 1, '201430350308', 'test4', NULL, NULL, NULL, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 3, '2021-11-18 23:39:55', '2021-11-18 23:39:55');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (9, 0, '2017403603', '李航程', '2022-01-21 15:35:24', '2022-01-21 15:35:24', NULL, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 3, '2022-01-21 15:35:24', '2022-01-21 15:35:24');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (10, 2, '2017403605', '史xxx', '2022-01-19 00:00:00', '2024-01-11 00:00:00', 1, '15366985265', 2, 28, '705328644@qq.com', '国科大雁栖湖', '浙江嘉兴', NULL, NULL, 2, '2022-01-21 17:47:53', '2022-01-21 17:47:53');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (11, 2, '2017402522', '廖晶', '2022-01-21 00:00:00', '2022-01-21 00:00:00', 1, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 1, '2022-01-21 17:51:13', '2022-01-21 17:51:13');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (12, 2, '147258369', '严xx', '2022-01-21 20:45:15', '2022-01-21 20:45:15', NULL, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 3, '2022-01-21 20:45:15', '2022-01-21 20:45:15');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (13, 1, '147258369', '严xx', '2022-01-21 20:45:19', '2022-01-21 20:45:19', NULL, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 3, '2022-01-21 20:45:19', '2022-01-21 20:45:19');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (14, 2, '369258147', '石xx', '2022-01-21 00:00:00', '2022-01-21 00:00:00', 1, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 1, '2022-01-21 20:48:42', '2022-01-21 20:48:42');
INSERT INTO `levels` (`id`, `society_id`, `student_no`, `name`, `start_time`, `end_time`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`) VALUES (15, 2, '987654321', '小明', '2022-01-22 00:00:00', '2022-01-22 00:00:00', 1, NULL, 0, 0, NULL, ' ', ' ', ' ', ' ', 1, '2022-01-22 13:39:54', '2022-01-22 13:39:54');
COMMIT;

-- ----------------------------
-- Table structure for majors
-- ----------------------------
DROP TABLE IF EXISTS `majors`;
CREATE TABLE `majors` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `academy_id` int(11) NOT NULL COMMENT 'refe academy',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='专业表';

-- ----------------------------
-- Records of majors
-- ----------------------------
BEGIN;
INSERT INTO `majors` (`id`, `name`, `academy_id`) VALUES (26, '计算机科学与技术', 2);
INSERT INTO `majors` (`id`, `name`, `academy_id`) VALUES (27, '计算机软件与理论', 2);
INSERT INTO `majors` (`id`, `name`, `academy_id`) VALUES (28, '电子信息', 2);
INSERT INTO `majors` (`id`, `name`, `academy_id`) VALUES (35, '人工智能', 1);
INSERT INTO `majors` (`id`, `name`, `academy_id`) VALUES (36, '电子信息', 1);
COMMIT;

-- ----------------------------
-- Table structure for menu_lists
-- ----------------------------
DROP TABLE IF EXISTS `menu_lists`;
CREATE TABLE `menu_lists` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `css_class` varchar(45) NOT NULL DEFAULT '' COMMENT '图标样式',
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `url` varchar(45) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of menu_lists
-- ----------------------------
BEGIN;
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (1, 0, '个人中心', 'fa-home', 1, '\'\'', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (2, 0, '我的社团', 'fa-laptop', 2, '', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (3, 0, '社团管理', 'fa-book', 3, '', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (4, 0, '系统设置', 'fa-cogs', 4, '', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (5, 1, '个人中心', '', 1, '/admin/my', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (6, 1, '修改密码', '', 3, '/admin/my/password', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (7, 2, '投票系统', '', 5, '/admin/votes', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (8, 2, '活动通知', '', 4, '/admin/my/activity', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (9, 2, '社员通讯录', '', 1, '/admin/my/staff', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (10, 2, '公告通知', '', 3, '/admin/my/article', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (11, 3, '社员管理', '', 1, '/admin/staffs', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (12, 3, '会员管理', '', 2, '/admin/levels', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (13, 3, '部门管理', '', 3, '/admin/departments', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (14, 3, '活动管理', '', 5, '/admin/activities', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (15, 3, '公告通知', '', 4, '/admin/articles', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (16, 3, '文件管理', '', 6, '/admin/attachments', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (17, 3, '轮播图片', '', 7, '/admin/sliders', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (18, 4, '社团管理', '', 1, '/admin/societies', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (19, 4, '学院专业管理', '', 3, '/admin/academies', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (21, 4, '网站设置', '', 5, '/admin/settings', 2);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (22, 4, '用户管理', '', 2, '/admin/users', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (23, 1, '修改信息', '', 2, '/admin/my/edit', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (24, 2, '会员通讯录', '', 2, '/admin/my/level', 1);
INSERT INTO `menu_lists` (`id`, `pid`, `name`, `css_class`, `sort`, `url`, `status`) VALUES (25, 3, '社团简介', '', 8, '/admin/introduces', 1);
COMMIT;

-- ----------------------------
-- Table structure for sliders
-- ----------------------------
DROP TABLE IF EXISTS `sliders`;
CREATE TABLE `sliders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society_id` int(11) NOT NULL,
  `href` varchar(45) NOT NULL,
  `random_name` varchar(45) NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `sort` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sliders
-- ----------------------------
BEGIN;
INSERT INTO `sliders` (`id`, `society_id`, `href`, `random_name`, `create_by`, `create_time`, `sort`, `status`) VALUES (8, 2, 'https://welcome.ucas.edu.cn/index.php/zh-cn/', '3c2e21673f2584d7120aa57b1c9d0972.jpg', 'test1', '2022-01-01 23:01:03', 0, 1);
INSERT INTO `sliders` (`id`, `society_id`, `href`, `random_name`, `create_by`, `create_time`, `sort`, `status`) VALUES (9, 2, 'https://foreign.ucas.ac.cn/index.php/zh-cn/', '8c7a0b2de3e77c825a8b551c0f79b151.jpg', 'test1', '2022-01-01 23:01:46', 1, 1);
INSERT INTO `sliders` (`id`, `society_id`, `href`, `random_name`, `create_by`, `create_time`, `sort`, `status`) VALUES (10, 2, 'https://www.ucas.ac.cn/', '93d1578873e0c2212899097d72172c59.jpg', 'test1', '2022-01-01 23:34:57', 2, 1);
INSERT INTO `sliders` (`id`, `society_id`, `href`, `random_name`, `create_by`, `create_time`, `sort`, `status`) VALUES (11, 2, 'https://onestop.ucas.ac.cn/home/index', '76a87508713dca37016e51ab387b9237.jpg', 'test1', '2022-01-01 23:35:23', 3, 1);
COMMIT;

-- ----------------------------
-- Table structure for staffs
-- ----------------------------
DROP TABLE IF EXISTS `staffs`;
CREATE TABLE `staffs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `student_no` varchar(12) NOT NULL,
  `user_id` int(11) NOT NULL,
  `society_id` int(11) NOT NULL,
  `department_id` int(11) NOT NULL,
  `job_id` int(11) NOT NULL,
  `society_admin` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1 社团管理员 2 不是',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staffs
-- ----------------------------
BEGIN;
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (1, 'test1', '201430350301', 0, 0, 4, 37, 1, '2020-03-14 01:00:00', '2021-09-18 01:00:00', '2021-11-11 21:22:28', 1);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (2, 'test2', '201430350301', 1, 2, 2, 32, 1, '2020-03-15 00:00:00', '2022-03-03 00:00:00', '2021-03-09 13:25:14', 1);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (3, 'test3', '201430350303', 3, 1, 3, 35, 1, '2020-03-15 00:00:00', '2022-03-03 00:00:00', '2021-03-13 17:46:46', 1);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (4, 'test4', '201430350304', 4, 1, 4, 37, 2, '2020-03-15 00:00:00', '2021-03-03 00:00:00', '2021-03-17 13:39:30', 2);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (5, 'test5', '201430350301', 1, 3, 4, 37, 2, '2020-03-15 00:00:00', '2022-03-03 00:00:00', '2021-03-10 17:28:20', 1);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (6, 'test6', '201430350302', 2, 2, 1, 28, 2, '2020-03-13 00:00:00', '2022-06-01 00:00:00', '2021-03-13 17:50:11', 1);
INSERT INTO `staffs` (`id`, `name`, `student_no`, `user_id`, `society_id`, `department_id`, `job_id`, `society_admin`, `start_time`, `end_time`, `create_time`, `status`) VALUES (7, 'test7', '201430350303', 3, 1, 2, 48, 2, '2020-03-01 00:00:00', '2022-03-16 00:00:00', '2021-03-17 22:51:03', 1);
COMMIT;

-- ----------------------------
-- Table structure for stu_societies
-- ----------------------------
DROP TABLE IF EXISTS `stu_societies`;
CREATE TABLE `stu_societies` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(45) NOT NULL DEFAULT ' ',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int(11) NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 可用 2 不可用 -1删除',
  `society_type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 校级 2 院级 3 其他',
  `create_time` datetime NOT NULL,
  `num_of_people` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='社团表';

-- ----------------------------
-- Records of stu_societies
-- ----------------------------
BEGIN;
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (0, 'default_logo.png', '暂未加入社团', 1, 1, 1, '2021-12-27 01:27:45', NULL);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (1, 'dd8816595ccf58938da3fbc623a706da.png', '果壳剧社', 1, 1, 1, '2016-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (2, '07e800820e58a85f44a0f83487aa2b17.jpg', '国科大科研社团', 2, 1, 2, '2017-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (3, 'default_logo.png', '开源软件协会', 2, 1, 2, '2018-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (4, '06e5eeefd8346fbe82359c015900a058.png', '果壳爱跑协会', 1, 2, 3, '2019-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (5, 'e56e6388514bd25ce5cc85296df410a8.jpg', '京文化交流协会', 1, 1, 2, '2017-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (6, '60b2c58785f96f64a97706bb351c7e3e.jpg', '青年志愿者协会', 1, 1, 2, '2018-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (7, 'd6e4ffbf1ef1b8fff65ba7d3b6a64dd8.jpg', '科苑棋牌协会', 1, 1, 2, '2018-12-19 11:38:59', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (8, 'default_logo.png', '科幻协会', 1, 1, 1, '2018-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (9, 'default_logo.png', '天文协会', 1, 1, 1, '2016-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (10, 'default_logo.png', '乒乓球协会', 1, 1, 1, '2019-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (11, 'default_logo.png', '鸿雁舞蹈社', 1, 1, 1, '2016-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (12, 'default_logo.png', '掠风骑行协会', 1, 1, 1, '2017-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (13, 'default_logo.png', 'UCAS摄影协会', 1, 1, 1, '2014-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (14, 'default_logo.png', '尤克里里吉他社', 1, 1, 1, '2013-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (15, 'default_logo.png', '羽毛球协会', 1, 1, 1, '2015-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (16, 'default_logo.png', '滑板社', 1, 1, 1, '2014-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (17, 'default_logo.png', '人工智能协会', 1, 1, 1, '2018-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (18, 'default_logo.png', '广播站', 1, 1, 1, '2019-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (19, 'default_logo.png', '弘毅传统文化协会', 1, 1, 1, '2020-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (20, 'default_logo.png', '雁栖武术协会', 1, 1, 1, '2017-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (21, 'default_logo.png', '创新创业联合会', 1, 1, 1, '2016-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (22, 'default_logo.png', '动漫协会', 1, 1, 1, '2014-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (23, 'default_logo.png', '燕台书画社', 1, 1, 1, '2015-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (24, 'default_logo.png', '足球协会', 1, 1, 1, '2016-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (25, 'default_logo.png', '知识产权学社', 1, 1, 1, '2017-11-16 23:50:10', 1);
INSERT INTO `stu_societies` (`id`, `logo`, `name`, `sort`, `status`, `society_type`, `create_time`, `num_of_people`) VALUES (26, 'default_logo.png', '计算机学院艺术团男男女女', 1, 1, 1, '2018-11-16 23:50:10', 1);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `student_no` varchar(15) NOT NULL,
  `password` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(45) NOT NULL,
  `sex` tinyint(4) NOT NULL DEFAULT '1',
  `phone` varchar(15) NOT NULL DEFAULT '',
  `academy_id` int(11) NOT NULL DEFAULT '0',
  `major_id` int(11) NOT NULL DEFAULT '0',
  `mail` varchar(45) NOT NULL DEFAULT '',
  `location` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `native_place` varchar(100) NOT NULL DEFAULT '' COMMENT '籍贯',
  `emer_name` varchar(15) NOT NULL DEFAULT '',
  `emer_phone` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `system_admin` tinyint(4) DEFAULT '2',
  `user_pic` varchar(45) NOT NULL DEFAULT 'default_pic.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (1, '201430350301', '4d9012b4a77a9524d675dad27c3276ab5705e5e8', '程哥哥', 1, '17369427329', 1, 35, '705328646@qq.com', '国科大雁栖湖西区', '湖南永州', '李友林', '13637463186', 1, '2018-03-15 04:30:14', '2022-01-22 11:33:26', 1, 'b67b22c0928d69ef83fab84ec1997aa1.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (2, '201430350302', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'test2', 1, '', 0, 0, '', '', '', '', '', 1, '2018-03-13 17:58:27', '2018-03-15 16:29:33', 2, 'd26b7937cd11b3abe0465e0141a68252.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (3, '201430350303', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'test3', 2, '', 0, 0, '', '', '', '', '', 1, '2018-03-06 23:18:18', '2018-03-06 23:18:18', 2, 'defaudefault_pic.pnglt_pic');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (4, '201430350304', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'test4', 1, '', 0, 0, '', '', '', '', '', 1, '2018-03-07 01:07:40', '2018-03-07 01:07:40', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (5, '201423412323', '7c4a8d09ca3762af61e59520943dc26494f8941b', '12341', 1, '18868687878', 0, 0, '', '', '', '', '', 1, '2021-10-29 22:47:09', '2021-10-29 22:47:09', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (6, '201430350309', '7c4a8d09ca3762af61e59520943dc26494f8941b', 'adasd', 1, '', 0, 0, '', '', '', '', '', 1, '2021-11-18 23:35:16', '2021-11-18 23:35:16', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (7, '201430350388', 'f10e2821bbbea527ea02200352313bc059445190', 'asdasd', 1, '18868688888', 0, 0, '', '', '', '', '', 1, '2021-11-25 20:55:52', '2021-11-25 20:55:52', 1, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (8, '201430350555', '8cb2237d0679ca88db6464eac60da96345513964', '严愉程', 1, '18868682378', 0, 0, '', '', '', '', '', 1, '2021-12-27 00:12:21', '2021-12-27 00:12:21', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (9, '2017403603', '7c4a8d09ca3762af61e59520943dc26494f8941b', '李航程', 1, '17369427320', 2, 26, '70532864@qq.com', '国科大雁栖湖', '湖南长沙', '李xxx', '13954456392', 1, '2022-01-21 15:34:27', '2022-01-21 15:39:14', 2, '3b27386fc49e60763fe153c2ac85635d.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (10, '2017402522', '7c4a8d09ca3762af61e59520943dc26494f8941b', '廖晶', 2, '13974450407', 1, 36, '152444985@qq.com', '张家界水文站', '湖南张家界', '', '', 1, '2022-01-21 17:43:42', '2022-01-21 17:59:03', 2, 'f97a2f3ef0320b4c2a500645ec9d78d8.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (11, '147258369', '7c4a8d09ca3762af61e59520943dc26494f8941b', '严xx', 1, '1234567896', 0, 0, '', '', '', '', '', 1, '2022-01-21 20:44:59', '2022-01-21 20:44:59', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (12, '369258147', '7c4a8d09ca3762af61e59520943dc26494f8941b', '石xx', 1, '123456789', 0, 0, '', '', '', '', '', 1, '2022-01-21 20:46:54', '2022-01-21 20:46:54', 2, 'default_pic.png');
INSERT INTO `users` (`id`, `student_no`, `password`, `name`, `sex`, `phone`, `academy_id`, `major_id`, `mail`, `location`, `native_place`, `emer_name`, `emer_phone`, `status`, `create_time`, `update_time`, `system_admin`, `user_pic`) VALUES (13, '987654321', '7c4a8d09ca3762af61e59520943dc26494f8941b', '小明', 1, '17369512485', 0, 0, '', '', '', '', '', 1, '2022-01-22 13:29:53', '2022-01-22 13:29:53', 2, 'default_pic.png');
COMMIT;

-- ----------------------------
-- Table structure for vote_options
-- ----------------------------
DROP TABLE IF EXISTS `vote_options`;
CREATE TABLE `vote_options` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `vote_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_options
-- ----------------------------
BEGIN;
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (11, '33', 2);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (12, '44', 2);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (19, '选项1', 4);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (20, '选项2', 4);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (21, '选项3', 4);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (25, '11', 1);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (26, '22', 1);
INSERT INTO `vote_options` (`id`, `name`, `vote_id`) VALUES (27, '33', 1);
COMMIT;

-- ----------------------------
-- Table structure for vote_records
-- ----------------------------
DROP TABLE IF EXISTS `vote_records`;
CREATE TABLE `vote_records` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vote_id` int(11) NOT NULL,
  `vote_option_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of vote_records
-- ----------------------------
BEGIN;
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (1, 4, 20, 1, '2022-01-16 02:55:42');
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (2, 4, 21, 1, '2022-01-16 02:55:43');
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (3, 2, 11, 2, '2022-01-16 02:59:22');
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (4, 4, 19, 2, '2022-01-16 03:09:02');
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (5, 4, 20, 2, '2022-01-16 03:09:02');
INSERT INTO `vote_records` (`id`, `vote_id`, `vote_option_id`, `user_id`, `create_time`) VALUES (6, 2, 11, 1, '2022-01-21 13:04:26');
COMMIT;

-- ----------------------------
-- Table structure for votes
-- ----------------------------
DROP TABLE IF EXISTS `votes`;
CREATE TABLE `votes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `society_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of votes
-- ----------------------------
BEGIN;
INSERT INTO `votes` (`id`, `society_id`, `name`, `content`, `start_time`, `end_time`, `user_id`, `create_by`, `create_time`) VALUES (1, 2, '第一个投票', '<p>test&nbsp;</p><p><img src=\"/uploads/articles/f97a2f3ef0320b4c2a500645ec9d78d8.png\" style=\"max-width:100%;\"><br></p>', '2021-03-18 00:00:00', '2022-03-21 00:00:00', 2, '程哥哥2', '2022-01-15 16:46:47');
INSERT INTO `votes` (`id`, `society_id`, `name`, `content`, `start_time`, `end_time`, `user_id`, `create_by`, `create_time`) VALUES (2, 2, '第二个投票1', '<p>test&nbsp;</p><p><img src=\"/uploads/articles/f97a2f3ef0320b4c2a500645ec9d78d8.png\" style=\"max-width:100%;\"><img src=\"/uploads/articles/194635c2135e05e618cd3b856327dfff.png\" style=\"line-height: 20px; max-width: 100%;\"><br></p>', '2021-03-15 00:00:00', '2022-01-30 00:00:00', 2, '程哥哥2', '2021-01-15 16:47:56');
INSERT INTO `votes` (`id`, `society_id`, `name`, `content`, `start_time`, `end_time`, `user_id`, `create_by`, `create_time`) VALUES (4, 2, 'test时间是否合法', '<p>&lt;script&gt;alert(\'\'66\");&lt;/script&gt;</p>', '2021-03-14 00:00:00', '2022-01-18 00:00:00', 1, '程哥哥1', '2022-01-16 01:30:38');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;

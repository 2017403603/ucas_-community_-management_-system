-- MySQL dump 10.13  Distrib 8.0.26, for Linux (x86_64)
--
-- Host: localhost    Database: society
-- ------------------------------------------------------
-- Server version	8.0.26-0ubuntu0.20.04.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `academies`
--

DROP TABLE IF EXISTS `academies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academies` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '1 可用 2 不可用 -1删除',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3 COMMENT='学院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academies`
--

LOCK TABLES `academies` WRITE;
/*!40000 ALTER TABLE `academies` DISABLE KEYS */;
INSERT INTO `academies` VALUES (1,'数学与信息软件学院',1,1,'2018-03-06 15:13:54');
/*!40000 ALTER TABLE `academies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `activities`
--

DROP TABLE IF EXISTS `activities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `society_id` int NOT NULL,
  `name` varchar(100) NOT NULL,
  `apply_end_time` datetime NOT NULL,
  `apply_start_time` datetime NOT NULL,
  `content` text NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activities`
--

LOCK TABLES `activities` WRITE;
/*!40000 ALTER TABLE `activities` DISABLE KEYS */;
INSERT INTO `activities` VALUES (1,1,'活动2','2018-04-26 00:00:00','2018-04-05 00:00:00','<p>这是活动1的内容哦</p>','陈光炜1','2018-03-12 12:04:57',1),(2,1,'活动1','2018-09-12 00:00:00','2018-04-05 00:00:00','<p>这是活动1的内容哦</p><p><img src=\"/uploads/194635c2135e05e618cd3b856327dfff.png\" style=\"max-width:100%;\"><br></p>','陈光炜1','2018-03-12 12:25:38',1),(3,2,'test','2018-03-23 00:00:00','2018-03-15 00:00:00','<p><br></p>','陈光炜1','2018-03-15 18:32:56',1);
/*!40000 ALTER TABLE `activities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `articles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `abstract` varchar(255) NOT NULL DEFAULT '',
  `content` text NOT NULL,
  `create_time` datetime NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `edit_time` datetime NOT NULL,
  `edit_by` varchar(45) NOT NULL,
  `society_id` int NOT NULL,
  `status` tinyint NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `articles`
--

LOCK TABLES `articles` WRITE;
/*!40000 ALTER TABLE `articles` DISABLE KEYS */;
INSERT INTO `articles` VALUES (1,'test发布文章','test第一遍文章','<p>测试第一篇文章</p>','2018-03-12 01:47:26','陈光炜1','2018-03-12 10:31:07','陈光炜1',1,1),(2,'test有图片的发布文章  长开头长开头长开头长开头长开头长开头','测试 摘要','<p>这是一篇测试文章</p><p>测试测试</p><p>测试</p><p><img src=\"/uploads/194635c2135e05e618cd3b856327dfff.png\" style=\"max-width:100%;\"><img src=\"/uploads/12df77915edf64d9625c3b1769210425.png\" style=\"line-height: 20px; max-width: 100%;\"></p><p><img src=\"/uploads/40b82ef6d52199d440dd954d3a4977c2.gif\" style=\"line-height: 20px; max-width: 100%;\"><br></p>','2018-03-12 01:48:18','陈光炜1','2018-03-17 18:12:46','陈光炜1',1,1),(3,'红会文章','红会','<p>数学与信息学院 红十字会</p><p><img src=\"/uploads/5e6f55d3beb7da337645b5d37bbb1736.png\" style=\"max-width:100%;\"><br></p>','2018-03-12 10:50:33','陈光炜1','2018-03-12 10:50:33','陈光炜1',2,1),(4,'社团简介','111','<p><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\">中心简介</psegoe></p><p></p><p><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\"><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\">CENTER OUTLINE</psegoe></psegoe></p><p></p><p><span><span>华南农业大学青年志愿者服务中心一直秉承</span><span times=\"\" new=\"\">“</span><span>立足校园、发挥优势、奉献爱心、服务社会</span><span times=\"\" new=\"\">”</span><span>为宗旨，倡导</span><span times=\"\" new=\"\">“</span><span>奉献、友爱、互助、进步</span><span times=\"\" new=\"\">”</span><span>的青年志愿者精神，鼓励广大志愿者在服务他人、服务社会的同时，提高自我，发展自我，锻炼自我，奋发成长，立志培养具有强烈的社会责任感与拥有高尚道德情操的志愿者，形成华农一道亮丽的志愿风景线。</span></span></p><p><span><span><br></span></span></p><p><span><span></span></span></p><p><span></span></p><p><span></span></p><p><strong><span>常委层骨干介绍——主任层</span></strong><span></span></p><p><span><br></span></p><p><span><img width=\"536\" height=\"407\" title=\"1013_1.jpg\" alt=\"1013_1.jpg\" src=\"http://www.volunteer.com/ueditor/php/upload/image/20161224/1482593484146306.jpg\"></span></p><p><span>主任<br></span></p><p><span></span></p><p><span>方健聪，男，汉族，共青团员，本科在读。华南农业大学工程学院2014级电气工程及其自动化专业学生，现任华南农业大学青年志愿者服务中心主任，曾任班级班长，有较丰富的公益志愿服务</span><span>组织</span><span>经验，</span><span>如</span><span>曾参与2015广州马拉松赛华农志愿者招募工作，组织开展第27届华南农业大学紫荆科技文化节志愿者招募工作、“雷锋一条街”组织策划工作等。曾获2014~2015年华南农业大学青年志愿者服务中心“先进个人”称号、2014、2015年广州马拉松赛“优秀志愿者”称号</span><span>。</span></p><p><span></span><br></p><p><br></p><p><img width=\"544\" height=\"353\" title=\"226445307945408829.jpg\" alt=\"226445307945408829.jpg\" src=\"http://www.volunteer.com/ueditor/php/upload/image/20161224/1482593486744834.jpg\"></p><p><span></span></p><p><span></span></p><p><span></span></p><p><span>副主任<br></span></p><p><span></span></p><p><span>范路瑜</span><span>，女，汉族，共青团员，本科在读。华南农业大学</span><span>资源环境</span><span>学院201</span><span>4</span><span>级</span><span>资源环境科学</span><span>专业学生，现任华南农业大学青年志愿者服务中心副主任，曾参与201</span><span>5</span><span>广州马拉松赛华农志愿者招募工作</span><span>、2015华农紫荆科技文化艺术节志愿者招募工作，</span><span>曾组织开展201</span><span>6华南农业大学迎接新生志愿活动</span><span>、201</span><span>6“青春伴夕阳，圆老人婚纱梦”项目活动等。曾获</span><span>201</span><span>4</span><span>年寒假招生“优秀志愿者”称号；<span times=\"\" new=\"\">201</span></span><span>4</span><span>年广州国际马拉松赛“优秀志愿者”称号</span><span>；</span><span>201</span><span>4</span><span>~201</span><span>5、<span times=\"\" new=\"\">2015</span>～<span times=\"\" new=\"\">2016</span></span><span>年华南农业大学青年志愿者服务中心“先进个人”称号</span><span>；校级三等奖学金；大学生创新创业项目校级三等奖</span><span>等。</span></p><p><span></span><br></p><p><br></p><p><img width=\"540\" height=\"375\" title=\"IMG_6105.JPG\" alt=\"IMG_6105.JPG\" src=\"http://www.volunteer.com/ueditor/php/upload/image/20161224/1482593487798522.jpg\"><br></p><p><span>副主任</span></p><p><span></span></p><p><span>黄嘉禧，女，汉族，共青团员，本科在读。华南农业大学公共管理学院2014级劳动与社会保障专业学生，现任华南农业大学青年志愿者服务中心副主任，负责过2015年国际旅游博览会华农志愿者招募工作，2016年第八期“行走计划”社区探访服务活动志愿者招募工作等。曾获2014-2015年华南农业大学青年志愿者服务中心“先进个人”称号，2016年广州国际马拉松赛“优秀志愿者”称号，两次获寒假招生宣传“优秀志愿者”称号，2016年华南农业大学“丁颖杯”发明创意大赛三等奖，2014-2015年度华南农业大学二等奖学金，“三好学生”荣誉称号。</span></p><p><span></span><br></p><p><span><br></span></p><p><img width=\"535\" height=\"370\" title=\"IMG_6184.jpg\" alt=\"IMG_6184.jpg\" src=\"http://www.volunteer.com/ueditor/php/upload/image/20161224/1482593489380803.jpg\" border=\"0\" vspace=\"0\"></p><p><span>副主任</span></p><p><span></span></p><p><span>吴沅怡，女，汉族，预备党员，本科在读。华南农业大学人文与法学院2014级法学专业学生，现任华南农业大学青年志愿者服务中心副主任。热衷志愿服务，曾组织开展<span>2014</span>年第五届天使行动旧衣回收、<span>2015</span>年广州马拉松赛、第十二届中国国际中小企业博览会、<span>2016</span>年竹蜻蜓暑期支教等志愿服务活动；曾获<span>2014-2015</span>年华南农业大学青年志愿者服务中心“先进个人”、<span>2014-2015</span>年广州优秀地铁志愿者、<span>2015</span>年广州马拉松赛“优秀志愿者”、<span>2015</span>年三下乡“优秀个人”等称号。积极参与学生工作，曾获<span>2014-2015</span>年人文与法学学院“优秀干事”、“优秀团干部”、<span>2015-2016</span>年度华南农业大学“优秀学生干部”等称号。专注专业学习，曾获<span>2014-2015</span>学年“国家奖学金”、“三号学生标兵”，并在<span>2014</span>年于广东海迪森律师事务所、<span>2015</span>年于广州仲裁委员会进行暑假实习工作。</span></p><p><br></p><p><br></p><p><img width=\"529\" height=\"407\" title=\"867696600991271017.jpg\" alt=\"867696600991271017.jpg\" src=\"http://www.volunteer.com/ueditor/php/upload/image/20161224/1482593490215003.jpg\"></p><p><span>副主任</span></p><p><span></span></p><p><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\"><psegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" line-height:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" 0px;=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\"><divsegoe ui\',=\"\" \'dejavu=\"\" sans\',=\"\" \'trebuchet=\"\" ms\',=\"\" verdana,=\"\" sans-serif;=\"\" font-style:=\"\" normal;=\"\" font-variant:=\"\" font-weight:=\"\" letter-spacing:=\"\" orphans:=\"\" auto;=\"\" text-align:=\"\" start;=\"\" text-indent:=\"\" 0px;=\"\" text-transform:=\"\" none;=\"\" white-space:=\"\" widows:=\"\" 1;=\"\" word-spacing:=\"\" -webkit-text-stroke-width:=\"\" 0px;\"=\"\"></divsegoe></psegoe></psegoe></p><p><span>张金钊，男，汉族，共青团员，本科在读。华南农业大学数学与信息（软件）学院2014级网络工程专业学生，现任华南农业大学青年志愿者服务中心副主任，参与过各类志愿服务活动，也曾负责2015“</span><span>华南农业大学第六届天使行动旧衣捐赠志愿服务活动</span><span>”、2015年</span><span>华南农业大学青年志愿服务团队创“益”大赛、</span><span>2016年华南农业大学青年志愿者服务中心招新等活动，曾获2014年广州国际马拉松优秀志愿者称号，2015-2016年度数学与信息（软件）学院优秀学生干部称号等。</span></p>','2018-03-17 20:39:32','陈光炜1','2018-03-17 20:39:32','陈光炜1',1,1);
/*!40000 ALTER TABLE `articles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attachments`
--

DROP TABLE IF EXISTS `attachments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attachments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `filesize` varchar(45) NOT NULL,
  `random_name` varchar(100) NOT NULL,
  `society_id` int NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attachments`
--

LOCK TABLES `attachments` WRITE;
/*!40000 ALTER TABLE `attachments` DISABLE KEYS */;
INSERT INTO `attachments` VALUES (1,'user4.png','21884','d26b7937cd11b3abe0465e0141a68252.png',1,'陈光炜1','2018-03-12 23:42:20',1),(2,'user5.png','17854','f97a2f3ef0320b4c2a500645ec9d78d8.png',1,'陈光炜1','2018-03-12 23:51:59',1),(3,'user3.png','18931','931d194a91016b64fe6135426be3e554.png',1,'陈光炜1','2018-03-12 23:51:59',1),(4,'user4.png','21884','d26b7937cd11b3abe0465e0141a68252.png',1,'陈光炜1','2018-03-12 23:51:59',1),(5,'user2.png','21735','06e5eeefd8346fbe82359c015900a058.png',1,'陈光炜1','2018-03-12 23:52:01',1),(6,'user1.png','21032','3b27386fc49e60763fe153c2ac85635d.png',1,'陈光炜1','2018-03-12 23:52:02',1),(7,'user5.png','17854','f97a2f3ef0320b4c2a500645ec9d78d8.png',1,'陈光炜1','2018-03-12 23:55:09',1),(8,'陈光炜开题报告【new】.doc','338944','ae5dcd62f24c52280387406496ac0782.doc',1,'陈光炜1','2018-03-12 23:55:54',1),(11,'user4.png','21884','d26b7937cd11b3abe0465e0141a68252.png',1,'陈光炜1','2018-03-13 00:04:24',1),(12,'user5.png','17854','f97a2f3ef0320b4c2a500645ec9d78d8.png',1,'陈光炜1','2018-03-13 00:04:54',1),(13,'user1.png','21032','3b27386fc49e60763fe153c2ac85635d.png',1,'陈光炜1','2018-03-15 00:54:43',1);
/*!40000 ALTER TABLE `attachments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint NOT NULL COMMENT '1 可用 2 不可用 -1删除',
  `society_id` int NOT NULL COMMENT 'refe society',
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COMMENT='部门表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'宣传部',1,1,2,'2018-03-06 17:43:31'),(2,'策划部',1,1,1,'2018-03-06 17:43:51'),(3,'秘书部',1,1,1,'2018-03-06 17:44:00'),(4,'培训部',1,1,1,'2018-03-06 17:44:07');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `introduces`
--

DROP TABLE IF EXISTS `introduces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `introduces` (
  `id` int NOT NULL AUTO_INCREMENT,
  `society_id` int NOT NULL,
  `content` text NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `introduces`
--

LOCK TABLES `introduces` WRITE;
/*!40000 ALTER TABLE `introduces` DISABLE KEYS */;
INSERT INTO `introduces` VALUES (2,1,'<p>test</p><p></p><ol><li><span style=\"line-height: 1.5;\">第一遍社团简介222333</span></li><li><span style=\"line-height: 1.5;\">324123</span></li><li><span style=\"line-height: 1.5;\">3412</span></li><li><span style=\"line-height: 1.5;\">锐23</span><img src=\"/uploads/articles/e27e8575cb467e1d91a7a3b4e19f1292.jpg\" style=\"max-width:100%;\"></li></ol><p></p>','陈光炜1','2018-03-17 22:16:50',1);
/*!40000 ALTER TABLE `introduces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
INSERT INTO `jobs` VALUES (28,'部长',1),(29,'副部长',1),(30,'理事',1),(34,'部长',3),(35,'副部长',3),(36,'理事',3),(37,'部长',4),(38,'副部长',4),(39,'理事',4),(47,'部长',2),(48,'副部长',2),(49,'理事',2);
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `levels`
--

DROP TABLE IF EXISTS `levels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `levels` (
  `id` int NOT NULL AUTO_INCREMENT,
  `society_id` int NOT NULL DEFAULT '0',
  `student_no` varchar(15) NOT NULL,
  `name` varchar(45) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `sex` tinyint DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `academy_id` int DEFAULT NULL,
  `major_id` int DEFAULT NULL,
  `mail` varchar(45) DEFAULT NULL,
  `location` varchar(100) DEFAULT NULL,
  `native_place` varchar(100) DEFAULT NULL,
  `emer_name` varchar(15) DEFAULT NULL,
  `emer_phone` varchar(15) DEFAULT NULL,
  `status` tinyint NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `levels`
--

LOCK TABLES `levels` WRITE;
/*!40000 ALTER TABLE `levels` DISABLE KEYS */;
INSERT INTO `levels` VALUES (5,1,'201430350301','陈光炜','2018-01-10 00:00:00','2019-12-01 00:00:00',1,'18819260875',4,13,'809871527@qq.com','','','','',1,'2018-03-14 15:48:41','2018-03-14 15:48:41'),(6,1,'201430350302','陈光炜2',NULL,NULL,1,'',0,0,'','','','','',1,'2018-03-11 16:44:43','2018-03-11 16:44:43'),(7,1,'201430350303','陈光炜2','2018-02-08 00:00:00','2018-09-05 00:00:00',2,'',0,0,'','','','','',2,'2018-03-11 16:48:15','2018-03-11 16:48:15'),(8,1,'201430350308','陈光炜1',NULL,NULL,NULL,NULL,0,0,NULL,' ',' ',' ',' ',3,'2021-11-18 23:39:55','2021-11-18 23:39:55');
/*!40000 ALTER TABLE `levels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `majors`
--

DROP TABLE IF EXISTS `majors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `majors` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `academy_id` int NOT NULL COMMENT 'refe academy',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3 COMMENT='专业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `majors`
--

LOCK TABLES `majors` WRITE;
/*!40000 ALTER TABLE `majors` DISABLE KEYS */;
INSERT INTO `majors` VALUES (20,'网络工程',1),(21,'软件工程',1),(22,'信息与管理技术',1),(23,'计算机与科学',1),(24,'统计学',1),(25,'经济学',1);
/*!40000 ALTER TABLE `majors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_lists`
--

DROP TABLE IF EXISTS `menu_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_lists` (
  `id` int NOT NULL AUTO_INCREMENT,
  `pid` int NOT NULL DEFAULT '0',
  `name` varchar(45) NOT NULL,
  `css_class` varchar(45) NOT NULL DEFAULT '' COMMENT '图标样式',
  `sort` tinyint NOT NULL DEFAULT '1',
  `url` varchar(45) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_lists`
--

LOCK TABLES `menu_lists` WRITE;
/*!40000 ALTER TABLE `menu_lists` DISABLE KEYS */;
INSERT INTO `menu_lists` VALUES (1,0,'个人中心','fa-home',1,'\'\'',1),(2,0,'我的社团','fa-laptop',2,'',1),(3,0,'社团管理','fa-book',3,'',1),(4,0,'系统设置','fa-cogs',4,'',1),(5,1,'个人中心','',1,'/admin/my',1),(6,1,'修改密码','',3,'/admin/my/password',1),(7,2,'投票系统','',5,'/admin/votes',1),(8,2,'活动通知','',4,'/admin/my/activity',1),(9,2,'社员通讯录','',1,'/admin/my/staff',1),(10,2,'公告通知','',3,'/admin/my/article',1),(11,3,'社员管理','',1,'/admin/staffs',1),(12,3,'会员管理','',2,'/admin/levels',1),(13,3,'部门管理','',3,'/admin/departments',1),(14,3,'活动管理','',5,'/admin/activities',1),(15,3,'公告通知','',4,'/admin/articles',1),(16,3,'文件管理','',6,'/admin/attachments',1),(17,3,'轮播图片','',7,'/admin/sliders',1),(18,4,'社团管理','',1,'/admin/societies',1),(19,4,'学院专业管理','',3,'/admin/academies',1),(21,4,'网站设置','',5,'/admin/settings',2),(22,4,'用户管理','',2,'/admin/users',1),(23,1,'修改信息','',2,'/admin/my/edit',1),(24,2,'会员通讯录','',2,'/admin/my/level',1),(25,3,'社团简介','',8,'/admin/introduces',1);
/*!40000 ALTER TABLE `menu_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sliders`
--

DROP TABLE IF EXISTS `sliders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sliders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `society_id` int NOT NULL,
  `href` varchar(45) NOT NULL,
  `random_name` varchar(45) NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  `sort` tinyint NOT NULL DEFAULT '1',
  `status` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sliders`
--

LOCK TABLES `sliders` WRITE;
/*!40000 ALTER TABLE `sliders` DISABLE KEYS */;
INSERT INTO `sliders` VALUES (1,1,'http://127.0.0.1:3000/admin/sliders/new','6d061abd7e3c4d052888a854322183cc.jpg','陈光炜1','2018-03-17 13:18:36',2,2),(2,1,'http://127.0.0.1:3000/admin/sliders/new','7e711168912aefed1ca6a224e1101883.jpg','陈光炜1','2018-03-17 13:19:14',1,1),(3,1,'http://127.0.0.1:3000/index/index','b7cc87bead04d379c7a16f734d6d5780.jpg','陈光炜1','2018-03-17 13:45:27',1,1),(6,2,'http://www.jb51.net/web/113507.html','7e711168912aefed1ca6a224e1101883.jpg','陈光炜1','2018-03-17 18:17:37',1,1),(7,2,'http://www.jb51.net/web/113507.html','7e711168912aefed1ca6a224e1101883.jpg','陈光炜1','2018-03-17 18:17:47',1,1);
/*!40000 ALTER TABLE `sliders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staffs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `student_no` varchar(12) NOT NULL,
  `user_id` int NOT NULL,
  `society_id` int NOT NULL,
  `department_id` int NOT NULL,
  `job_id` int NOT NULL,
  `society_admin` tinyint NOT NULL DEFAULT '2' COMMENT '1 社团管理员 2 不是',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `create_time` datetime NOT NULL,
  `status` tinyint NOT NULL DEFAULT '2',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'陈光炜1','201430350301',1,1,4,37,1,'2018-03-14 01:00:00','2019-09-18 01:00:00','2021-11-11 21:22:28',1),(2,'陈光炜1','201430350301',1,2,2,32,1,'2018-03-15 00:00:00','2019-03-03 00:00:00','2018-03-09 13:25:14',1),(3,'陈光炜3','201430350303',3,1,3,35,1,'2018-03-15 00:00:00','2019-03-03 00:00:00','2018-03-13 17:46:46',1),(4,'陈光炜4','201430350304',4,1,4,37,2,'2018-03-15 00:00:00','2019-03-03 00:00:00','2018-03-17 13:39:30',2),(5,'陈光炜1','201430350301',1,3,4,37,2,'2018-03-15 00:00:00','2019-03-03 00:00:00','2018-03-10 17:28:20',1),(6,'陈光炜2','201430350302',2,2,1,28,2,'2018-03-13 00:00:00','2018-06-01 00:00:00','2018-03-13 17:50:11',1),(7,'陈光炜3','201430350303',3,1,2,48,2,'2018-03-01 00:00:00','2018-03-16 00:00:00','2018-03-17 22:51:03',1);
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu_societies`
--

DROP TABLE IF EXISTS `stu_societies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stu_societies` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `logo` varchar(45) NOT NULL DEFAULT ' ',
  `name` varchar(45) NOT NULL COMMENT '名称',
  `sort` int NOT NULL DEFAULT '1' COMMENT '排序',
  `status` tinyint NOT NULL DEFAULT '1' COMMENT '1 可用 2 不可用 -1删除',
  `society_type` tinyint NOT NULL DEFAULT '1' COMMENT '1 校级 2 院级 3 其他',
  `create_time` datetime NOT NULL,
  `num_of_people` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='社团表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu_societies`
--

LOCK TABLES `stu_societies` WRITE;
/*!40000 ALTER TABLE `stu_societies` DISABLE KEYS */;
INSERT INTO `stu_societies` VALUES (1,'dd8816595ccf58938da3fbc623a706da.png','易班',1,1,1,'2018-02-19 11:38:59',1),(2,'07e800820e58a85f44a0f83487aa2b17.jpg','数信红会',2,1,2,'2018-02-18 21:34:55',1),(3,'default_logo.png','农学院红会1234',2,1,2,'2018-02-18 21:35:15',1),(4,'06e5eeefd8346fbe82359c015900a058.png','蓝球协会',1,2,3,'2018-02-18 23:00:01',1),(5,'e56e6388514bd25ce5cc85296df410a8.jpg','动漫协会',1,1,2,'2018-03-16 23:49:47',1),(6,'60b2c58785f96f64a97706bb351c7e3e.jpg','书法社',1,1,2,'2018-03-16 23:50:10',1),(7,'d6e4ffbf1ef1b8fff65ba7d3b6a64dd8.jpg','篮球协会',1,1,2,'2018-03-16 23:51:24',1);
/*!40000 ALTER TABLE `stu_societies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_no` varchar(15) NOT NULL,
  `password` varchar(45) NOT NULL DEFAULT '',
  `name` varchar(45) NOT NULL,
  `sex` tinyint NOT NULL DEFAULT '1',
  `phone` varchar(15) NOT NULL DEFAULT '',
  `academy_id` int NOT NULL DEFAULT '0',
  `major_id` int NOT NULL DEFAULT '0',
  `mail` varchar(45) NOT NULL DEFAULT '',
  `location` varchar(100) NOT NULL DEFAULT '' COMMENT '详细地址',
  `native_place` varchar(100) NOT NULL DEFAULT '' COMMENT '籍贯',
  `emer_name` varchar(15) NOT NULL DEFAULT '',
  `emer_phone` varchar(15) NOT NULL DEFAULT '',
  `status` tinyint NOT NULL DEFAULT '1',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `system_admin` tinyint DEFAULT '2',
  `user_pic` varchar(45) NOT NULL DEFAULT 'default_pic.png',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'201430350301','4d9012b4a77a9524d675dad27c3276ab5705e5e8','陈光炜1',2,'18819260875',1,21,'809871527@qq.com','广州市华南农业大学华山区17栋','广东汕头1','陈光洪','13697467349',1,'2018-03-15 04:30:14','2021-11-18 20:10:23',1,'931d194a91016b64fe6135426be3e554.png'),(2,'201430350302','7c4a8d09ca3762af61e59520943dc26494f8941b','陈光炜2',1,'',0,0,'','','','','',1,'2018-03-13 17:58:27','2018-03-15 16:29:33',2,'d26b7937cd11b3abe0465e0141a68252.png'),(3,'201430350303','7c4a8d09ca3762af61e59520943dc26494f8941b','陈光炜3',2,'',0,0,'','','','','',1,'2018-03-06 23:18:18','2018-03-06 23:18:18',2,'defaudefault_pic.pnglt_pic'),(4,'201430350304','7c4a8d09ca3762af61e59520943dc26494f8941b','陈光炜4',1,'',0,0,'','','','','',1,'2018-03-07 01:07:40','2018-03-07 01:07:40',2,'default_pic.png'),(5,'201423412323','7c4a8d09ca3762af61e59520943dc26494f8941b','12341',1,'18868687878',0,0,'','','','','',1,'2021-10-29 22:47:09','2021-10-29 22:47:09',2,'default_pic.png'),(6,'201430350309','7c4a8d09ca3762af61e59520943dc26494f8941b','adasd',1,'',0,0,'','','','','',1,'2021-11-18 23:35:16','2021-11-18 23:35:16',2,'default_pic.png');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_options`
--

DROP TABLE IF EXISTS `vote_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote_options` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `vote_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_options`
--

LOCK TABLES `vote_options` WRITE;
/*!40000 ALTER TABLE `vote_options` DISABLE KEYS */;
INSERT INTO `vote_options` VALUES (11,'33',2),(12,'44',2),(19,'选项1',4),(20,'选项2',4),(21,'选项3',4),(25,'11',1),(26,'22',1),(27,'33',1);
/*!40000 ALTER TABLE `vote_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote_records`
--

DROP TABLE IF EXISTS `vote_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote_records` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vote_id` int NOT NULL,
  `vote_option_id` int NOT NULL,
  `user_id` int NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote_records`
--

LOCK TABLES `vote_records` WRITE;
/*!40000 ALTER TABLE `vote_records` DISABLE KEYS */;
INSERT INTO `vote_records` VALUES (1,4,20,1,'2018-03-16 02:55:42'),(2,4,21,1,'2018-03-16 02:55:43'),(3,2,11,2,'2018-03-16 02:59:22'),(4,4,19,2,'2018-03-16 03:09:02'),(5,4,20,2,'2018-03-16 03:09:02');
/*!40000 ALTER TABLE `vote_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votes`
--

DROP TABLE IF EXISTS `votes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `votes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `society_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `content` text NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `user_id` int NOT NULL,
  `create_by` varchar(45) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votes`
--

LOCK TABLES `votes` WRITE;
/*!40000 ALTER TABLE `votes` DISABLE KEYS */;
INSERT INTO `votes` VALUES (1,2,'第一个投票','<p>test&nbsp;</p><p><img src=\"/uploads/articles/f97a2f3ef0320b4c2a500645ec9d78d8.png\" style=\"max-width:100%;\"><br></p>','2018-03-18 00:00:00','2018-03-21 00:00:00',2,'陈光炜2','2018-03-15 16:46:47'),(2,2,'第二个投票1','<p>test&nbsp;</p><p><img src=\"/uploads/articles/f97a2f3ef0320b4c2a500645ec9d78d8.png\" style=\"max-width:100%;\"><img src=\"/uploads/articles/194635c2135e05e618cd3b856327dfff.png\" style=\"line-height: 20px; max-width: 100%;\"><br></p>','2018-03-15 00:00:00','2018-03-30 00:00:00',2,'陈光炜2','2018-03-15 16:47:56'),(4,2,'test时间是否合法','<p>&lt;script&gt;alert(\'\'66\");&lt;/script&gt;</p>','2018-03-14 00:00:00','2018-03-18 00:00:00',1,'陈光炜1','2018-03-16 01:30:38');
/*!40000 ALTER TABLE `votes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19  0:06:00

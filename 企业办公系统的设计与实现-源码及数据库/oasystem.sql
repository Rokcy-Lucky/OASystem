-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oasystem
-- ------------------------------------------------------
-- Server version	5.7.16-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_accessoryfile`
--

DROP TABLE IF EXISTS `t_accessoryfile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_accessoryfile` (
  `t_accessoryfile_id` int(11) NOT NULL,
  `t_fileinfo_id` int(11) DEFAULT NULL,
  `t_accessoryfile_name` varchar(50) DEFAULT NULL,
  `t_accessoryfile_size` int(11) DEFAULT NULL,
  `t_fileinfo_filetypeid` int(11) DEFAULT NULL,
  `t_accessoryfile_createdate` datetime DEFAULT NULL,
  `t_accessoryfile_path` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`t_accessoryfile_id`),
  KEY `fk_t_fileinfo_id` (`t_fileinfo_id`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`),
  CONSTRAINT `fk_t_fileinfo_id` FOREIGN KEY (`t_fileinfo_id`) REFERENCES `t_fileinfo` (`t_fileinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_accessoryfile_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_accessoryfile`
--

LOCK TABLES `t_accessoryfile` WRITE;
/*!40000 ALTER TABLE `t_accessoryfile` DISABLE KEYS */;
INSERT INTO `t_accessoryfile` VALUES (1,1,'文档txt',30,1,'2019-05-02 15:09:53','D://jhojhojknkj'),(3,3,'文件excel',100,3,'2019-05-02 15:11:03','D://jhojhojknkj');
/*!40000 ALTER TABLE `t_accessoryfile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_branchinfo`
--

DROP TABLE IF EXISTS `t_branchinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_branchinfo` (
  `t_branchinfo_id` int(11) NOT NULL,
  `t_branchinfo_name` varchar(50) DEFAULT NULL,
  `t_branchinfo_shortname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_branchinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_branchinfo`
--

LOCK TABLES `t_branchinfo` WRITE;
/*!40000 ALTER TABLE `t_branchinfo` DISABLE KEYS */;
INSERT INTO `t_branchinfo` VALUES (1,'淘宝网','淘宝'),(2,'天猫购物','天猫'),(3,'阿里巴巴国际交易市场','阿里国际'),(4,'蚂蚁金服','蚂蚁金服'),(5,'支付宝','支付宝'),(6,'团购网站聚划算','聚划算'),(7,'全球速卖通','速通'),(8,'天猫国际','天猫国际');
/*!40000 ALTER TABLE `t_branchinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_departinfo`
--

DROP TABLE IF EXISTS `t_departinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_departinfo` (
  `t_departinfo_id` int(11) NOT NULL,
  `t_departinfo_name` varchar(50) DEFAULT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_departinfo_tel` bigint(20) DEFAULT NULL,
  `t_departinfo_mobiletel` bigint(20) DEFAULT NULL,
  `t_departinfo_faxes` bigint(20) DEFAULT NULL,
  `t_branchinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_departinfo_id`),
  KEY `fk_t_userinfo_id` (`t_userinfo_id`),
  KEY `fk_t_branchinfo_id` (`t_branchinfo_id`),
  CONSTRAINT `fk_t_branchinfo_id` FOREIGN KEY (`t_branchinfo_id`) REFERENCES `t_branchinfo` (`t_branchinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_departinfo`
--

LOCK TABLES `t_departinfo` WRITE;
/*!40000 ALTER TABLE `t_departinfo` DISABLE KEYS */;
INSERT INTO `t_departinfo` VALUES (1,'研发部1',1,87784070,18200291077,87784070,1),(2,'销售部1',2,87784000,18200291076,87784000,2),(3,'财务部1',3,87700000,18200291075,87700000,3),(4,'技术部1',4,87000000,18200291074,8700000,4),(5,'研发部2',1,87784070,18200291077,87784070,1),(6,'销售部2',2,87784000,18200291076,87784000,2),(7,'财务部2',3,87700000,18200291075,87700000,3),(8,'技术部2',4,87000000,18200291074,8700000,4);
/*!40000 ALTER TABLE `t_departinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_fileinfo`
--

DROP TABLE IF EXISTS `t_fileinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_fileinfo` (
  `t_fileinfo_id` int(11) NOT NULL,
  `t_fileinfo_name` varchar(50) DEFAULT NULL,
  `t_fileinfo_filetypeid` int(11) DEFAULT NULL,
  `t_fileinfo_remark` varchar(50) DEFAULT NULL,
  `t_fileinfo_owner` varchar(50) DEFAULT NULL,
  `t_fileinfo_createdate` datetime DEFAULT NULL,
  `t_fileinfo_parentid` int(11) DEFAULT NULL,
  `t_fileinfo_filepath` varchar(200) DEFAULT NULL,
  `t_fileinfo_ifdelete` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_fileinfo_id`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`),
  CONSTRAINT `t_fileinfo_ibfk_1` FOREIGN KEY (`t_fileinfo_filetypeid`) REFERENCES `t_filetypeinfo` (`t_fileinfo_filetypeid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_fileinfo`
--

LOCK TABLES `t_fileinfo` WRITE;
/*!40000 ALTER TABLE `t_fileinfo` DISABLE KEYS */;
INSERT INTO `t_fileinfo` VALUES (1,'file1',1,'备注1','孙楷','2019-05-02 00:00:00',1,'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\阿里国际交易1.docx',2),(2,'file3',3,'备注3','孙楷','2019-05-02 00:00:00',1,'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\阿里国际交易2.docx',2),(3,'天猫购物.txt',1,'78978','张三','2019-05-07 09:53:27',1,'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\天猫购物.docx',2),(4,'阿里购物.txt',1,'23423423','张三','2019-05-08 18:31:45',NULL,'D:\\1MyInstall\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\阿里购物.txt',1),(5,'查询.txt',1,'123','张三','2019-05-12 17:33:04',NULL,'D:\\JavaEE\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\查询.txt',2),(6,'天猫购物.txt',1,'78978','张三','2019-05-07 09:53:27',1,'C:\\Users\\Administrator\\Desktop\\share小分队\\Office\\OfficeAutomationSystem\\WebRoot\\upload\\天猫购物.docx',2),(7,'阿里购物.txt',1,'23423423','张三','2019-05-08 18:31:45',NULL,'D:\\1MyInstall\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\阿里购物.txt',1),(8,'查询.txt',1,'123','张三','2019-05-12 17:33:04',NULL,'D:\\JavaEE\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\查询.txt',2);
/*!40000 ALTER TABLE `t_fileinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_filetypeinfo`
--

DROP TABLE IF EXISTS `t_filetypeinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_filetypeinfo` (
  `t_fileinfo_filetypeid` int(11) NOT NULL,
  `t_filetypeinfo_name` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_image` varchar(50) DEFAULT NULL,
  `t_filetypeinfo_suffix` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_fileinfo_filetypeid`),
  KEY `t_fileinfo_filetypeid` (`t_fileinfo_filetypeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_filetypeinfo`
--

LOCK TABLES `t_filetypeinfo` WRITE;
/*!40000 ALTER TABLE `t_filetypeinfo` DISABLE KEYS */;
INSERT INTO `t_filetypeinfo` VALUES (1,'txt','images\\txt.jpg','.txt'),(2,'word','images\\word.jpg','.word'),(3,'excel','images\\excel.jpg','.sxml');
/*!40000 ALTER TABLE `t_filetypeinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_loginlog`
--

DROP TABLE IF EXISTS `t_loginlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_loginlog` (
  `t_loginlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_loginlog_time` datetime DEFAULT NULL,
  `t_loginlog_ifsuccess` int(11) DEFAULT NULL,
  `t_loginlog_userip` varchar(100) DEFAULT NULL,
  `t_loginlog_desc` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`t_loginlog_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_loginlog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_loginlog`
--

LOCK TABLES `t_loginlog` WRITE;
/*!40000 ALTER TABLE `t_loginlog` DISABLE KEYS */;
INSERT INTO `t_loginlog` VALUES (1,2,'2019-05-01 16:24:03',1,'shishe','不存在'),(2,4,'2019-05-05 16:26:24',0,'232','不存在'),(3,1,'2019-05-09 18:40:43',NULL,'127.0.0.1',NULL),(4,1,'2019-05-12 09:32:36',NULL,'127.0.0.1',NULL),(5,1,'2019-05-12 09:37:36',NULL,'127.0.0.1',NULL),(6,1,'2019-05-12 14:12:35',NULL,'127.0.0.1',NULL),(7,1,'2019-05-12 15:34:29',NULL,'127.0.0.1',NULL),(8,1,'2019-05-12 15:52:06',NULL,'127.0.0.1',NULL),(9,1,'2019-05-12 15:58:54',NULL,'127.0.0.1',NULL),(10,1,'2019-05-12 17:18:49',NULL,'127.0.0.1',NULL),(11,1,'2019-05-12 17:21:32',NULL,'127.0.0.1',NULL),(12,1,'2019-05-12 19:10:25',NULL,'127.0.0.1',NULL),(13,1,'2019-05-14 14:57:39',NULL,'0:0:0:0:0:0:0:1',NULL),(14,1,'2019-05-14 15:14:43',NULL,'0:0:0:0:0:0:0:1',NULL),(15,1,'2019-05-14 15:21:43',NULL,'0:0:0:0:0:0:0:1',NULL);
/*!40000 ALTER TABLE `t_loginlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_manage`
--

DROP TABLE IF EXISTS `t_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_manage` (
  `t_manage_id` int(11) NOT NULL,
  `t_manage_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`t_manage_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_manage`
--

LOCK TABLES `t_manage` WRITE;
/*!40000 ALTER TABLE `t_manage` DISABLE KEYS */;
INSERT INTO `t_manage` VALUES (1,'人事管理 '),(2,'日程管理'),(3,'文档管理'),(4,'消息传递'),(5,'系统管理'),(6,'考勤管理'),(7,'个人考勤管理');
/*!40000 ALTER TABLE `t_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_manage_power`
--

DROP TABLE IF EXISTS `t_manage_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_manage_power` (
  `t_manage_power_id` int(11) NOT NULL,
  `t_manage_id` int(11) NOT NULL,
  `t_power_id` int(11) NOT NULL,
  PRIMARY KEY (`t_manage_power_id`),
  KEY `t_manage_id` (`t_manage_id`),
  KEY `t_power_id` (`t_power_id`),
  CONSTRAINT `t_manage_power_ibfk_1` FOREIGN KEY (`t_manage_id`) REFERENCES `t_manage` (`t_manage_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_manage_power_ibfk_2` FOREIGN KEY (`t_power_id`) REFERENCES `t_power` (`t_power_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_manage_power`
--

LOCK TABLES `t_manage_power` WRITE;
/*!40000 ALTER TABLE `t_manage_power` DISABLE KEYS */;
INSERT INTO `t_manage_power` VALUES (1,1,1),(2,1,2),(3,1,3),(4,2,4),(6,2,6),(7,3,7),(8,3,9),(9,3,10),(10,4,11),(12,5,13),(13,5,14),(14,5,15),(16,6,16),(17,6,17),(18,7,18);
/*!40000 ALTER TABLE `t_manage_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_manualsign`
--

DROP TABLE IF EXISTS `t_manualsign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_manualsign` (
  `t_manualsign_id` int(11) DEFAULT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_manualsign_time` datetime DEFAULT NULL,
  `t_manualsign_desc` varchar(200) DEFAULT NULL,
  `t_manualsign_tag` int(11) DEFAULT NULL,
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_manualsign_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_manualsign`
--

LOCK TABLES `t_manualsign` WRITE;
/*!40000 ALTER TABLE `t_manualsign` DISABLE KEYS */;
INSERT INTO `t_manualsign` VALUES (1,1,'2019-05-02 15:23:47','hiknbi',888),(2,3,'2019-05-02 15:24:20','hjokmn',888),(3,5,'2019-05-02 15:24:38','hykjhn',888),(4,2,'2019-05-02 15:24:55','tyihn',888),(5,4,'2019-05-02 15:25:10','dsgfv',888),(6,1,'2019-05-12 17:21:37',NULL,NULL),(7,1,'2019-05-12 17:23:14',NULL,NULL),(8,1,'2019-05-14 15:08:22',NULL,NULL),(9,2,'2019-05-14 15:58:15',NULL,NULL),(10,2,'2019-05-14 15:58:20',NULL,NULL),(11,2,'2019-05-14 15:58:21',NULL,NULL),(12,2,'2019-05-14 15:58:22',NULL,NULL),(13,2,'2019-05-14 16:01:21',NULL,NULL),(14,2,'2019-05-14 16:01:24',NULL,NULL),(NULL,5,'2019-05-31 11:24:55',NULL,NULL);
/*!40000 ALTER TABLE `t_manualsign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_meetinginfo`
--

DROP TABLE IF EXISTS `t_meetinginfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_meetinginfo` (
  `t_meetinginfo_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_meetinginfo_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`t_meetinginfo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_meetinginfo`
--

LOCK TABLES `t_meetinginfo` WRITE;
/*!40000 ALTER TABLE `t_meetinginfo` DISABLE KEYS */;
INSERT INTO `t_meetinginfo` VALUES (1,'部门会议'),(2,'机构会议'),(3,'公司会议');
/*!40000 ALTER TABLE `t_meetinginfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_message` (
  `t_message_id` int(11) NOT NULL,
  `t_message_title` varchar(100) DEFAULT NULL,
  `t_message_content` varchar(255) DEFAULT NULL,
  `t_messagetype_id` int(11) DEFAULT NULL,
  `t_message_begintime` datetime DEFAULT NULL,
  `t_message_endtime` datetime DEFAULT NULL,
  `t_userinfo_id` varchar(50) DEFAULT NULL,
  `t_message_ifpublish` int(11) DEFAULT NULL,
  `t_message_recordtime` datetime DEFAULT NULL,
  PRIMARY KEY (`t_message_id`),
  KEY `t_messagetype_id` (`t_messagetype_id`),
  CONSTRAINT `t_message_ibfk_1` FOREIGN KEY (`t_messagetype_id`) REFERENCES `t_messagetype` (`t_messagetype_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

LOCK TABLES `t_message` WRITE;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (1,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(2,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(3,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(4,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(5,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(6,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(7,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(8,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(9,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(10,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(11,'会议','消息内容',1,'2019-05-02 15:30:05','2019-05-12 15:30:11','3',1,'2019-05-02 15:30:25'),(12,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(13,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43'),(14,'会议','消息内容',1,'2019-05-02 15:30:05','2019-05-12 15:30:11','3',1,'2019-05-02 15:30:25'),(15,'会议','消息内容',1,'2019-05-02 12:28:04','2019-05-12 15:28:20','1',1,'2019-05-02 10:28:53'),(16,'会议','消息内容',2,'2019-05-02 13:29:21','2019-05-12 15:29:32','2',1,'2019-05-02 13:29:43');
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_messagetouser`
--

DROP TABLE IF EXISTS `t_messagetouser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_messagetouser` (
  `t_messagetouser_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_message_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) NOT NULL,
  `t_id_read` int(11) NOT NULL,
  PRIMARY KEY (`t_messagetouser_id`),
  KEY `k_t_message_id` (`t_message_id`),
  KEY `k_t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `k_t_message_id` FOREIGN KEY (`t_message_id`) REFERENCES `t_message` (`t_message_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `k_t_userinfo_id` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_messagetouser`
--

LOCK TABLES `t_messagetouser` WRITE;
/*!40000 ALTER TABLE `t_messagetouser` DISABLE KEYS */;
INSERT INTO `t_messagetouser` VALUES (1,2,2,1),(2,3,2,1),(3,1,4,0);
/*!40000 ALTER TABLE `t_messagetouser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_messagetype`
--

DROP TABLE IF EXISTS `t_messagetype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_messagetype` (
  `t_messagetype_id` int(11) DEFAULT NULL,
  `t_messagetype_name` varchar(50) DEFAULT NULL,
  `t_messagetype_desc` varchar(50) DEFAULT NULL,
  KEY `t_messagetype_id` (`t_messagetype_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_messagetype`
--

LOCK TABLES `t_messagetype` WRITE;
/*!40000 ALTER TABLE `t_messagetype` DISABLE KEYS */;
INSERT INTO `t_messagetype` VALUES (1,'公告消息','公告'),(2,'新闻消息','新闻'),(3,'奖惩消息','奖惩');
/*!40000 ALTER TABLE `t_messagetype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_mynote`
--

DROP TABLE IF EXISTS `t_mynote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_mynote` (
  `t_mynote_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_mynote_title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `t_mynote_content` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `t_mynote_createtime` datetime NOT NULL,
  `t_mynote_createuser` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`t_mynote_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_mynote`
--

LOCK TABLES `t_mynote` WRITE;
/*!40000 ALTER TABLE `t_mynote` DISABLE KEYS */;
INSERT INTO `t_mynote` VALUES (1,'记事本','查看报告','2019-05-02 16:29:28','罗丽'),(2,'记事本','参加会议','2019-05-03 16:29:28','罗丽'),(3,'记事本','查看报告','2019-05-02 16:29:28','罗丽'),(4,'记事本','参加会议','2019-05-03 16:29:28','罗丽'),(5,'记事本','查看报告','2019-05-05 16:29:28','罗丽'),(6,'记事本','参加会议','2019-05-06 16:29:28','罗丽'),(7,'记事本','查看报告','2019-05-07 16:29:28','罗丽'),(8,'记事本','参加会议','2019-05-08 16:29:28','罗丽');
/*!40000 ALTER TABLE `t_mynote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_operatelog`
--

DROP TABLE IF EXISTS `t_operatelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_operatelog` (
  `t_operatelog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_userinfo_id` int(11) NOT NULL,
  `t_operatelog_name` varchar(50) NOT NULL,
  `t_operatelog_objectid` varchar(50) NOT NULL,
  `t_operatelog_desc` varchar(200) NOT NULL,
  `t_operatelog_time` datetime NOT NULL,
  PRIMARY KEY (`t_operatelog_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_operatelog_ibfk_1` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_operatelog`
--

LOCK TABLES `t_operatelog` WRITE;
/*!40000 ALTER TABLE `t_operatelog` DISABLE KEYS */;
INSERT INTO `t_operatelog` VALUES (1,2,'登录','登录qq','速度速度','2019-05-21 16:35:16'),(2,3,'注册','注册微信','收到收到','2019-05-13 16:36:03');
/*!40000 ALTER TABLE `t_operatelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_operationlog`
--

DROP TABLE IF EXISTS `t_operationlog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_operationlog` (
  `t_operationlog_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_operationlog_name` varchar(50) NOT NULL,
  `t_operationlog_username` varchar(22) NOT NULL,
  `t_operationlog_time` datetime NOT NULL,
  `t_operationlog_content` text NOT NULL,
  PRIMARY KEY (`t_operationlog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=423 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_operationlog`
--

LOCK TABLES `t_operationlog` WRITE;
/*!40000 ALTER TABLE `t_operationlog` DISABLE KEYS */;
INSERT INTO `t_operationlog` VALUES (1,'查询','张三','2019-05-12 09:37:36','findManagePower[参数1，类型：String，值：(getBytes : [B@5cc70d27)]'),(2,'查询','张三','2019-05-12 09:37:39','findLogBean[参数1，类型：BindingAwareModelMap，值：]'),(3,'查询','张三','2019-05-12 09:39:10','findManagePower[参数1，类型：String，值：(getBytes : [B@2fa3f095)]'),(4,'查询','小丽','2019-05-12 09:39:18','findFileDetailsInfo'),(5,'查询','小丽','2019-05-12 09:39:18','findAllFilecount'),(6,'查询','张三','2019-05-12 14:12:48','findAllDepart'),(7,'查询','张三','2019-05-12 14:12:53','findFileDetailsInfo'),(8,'查询','张三','2019-05-12 14:12:53','findAllFilecount'),(9,'查询','张三','2019-05-12 14:12:55','findFileDetailsInfo'),(10,'查询','张三','2019-05-12 14:12:55','findAllFilecount'),(11,'查询','张三','2019-05-12 14:14:05','findFileDetailsInfo'),(12,'查询','张三','2019-05-12 14:14:05','findAllFilecount'),(13,'查询','张三','2019-05-12 14:14:08','findFileDetailsInfo'),(14,'查询','张三','2019-05-12 14:14:08','findAllFilecount'),(15,'查询','张三','2019-05-12 14:14:12','findFileDetailsInfo'),(16,'查询','张三','2019-05-12 14:14:12','findAllFilecount'),(17,'查询','张三','2019-05-12 14:14:31','findRole'),(18,'查询','张三','2019-05-12 14:14:31','findUser[参数1，类型：String，值：(getBytes : [B@2b129e33)]'),(19,'查询','张三','2019-05-12 14:14:31','findUser[参数1，类型：String，值：(getBytes : [B@87497b8)]'),(20,'查询','张三','2019-05-12 14:18:39','findRole'),(21,'查询','张三','2019-05-12 14:18:39','findUser[参数1，类型：String，值：(getBytes : [B@2adb087b)]'),(22,'查询','张三','2019-05-12 14:18:39','findUser[参数1，类型：String，值：(getBytes : [B@2ab86f27)]'),(23,'修改','张三','2019-05-12 14:20:16','myNoteUpdate[参数1，类型：MyNoteBean，值：(getT_mynote_content : 我不想上班，说的是)(getT_mynote_title : 记事本)(getT_mynote_id : 1)]'),(24,'查询','张三','2019-05-12 14:20:43','findLogBean[参数1，类型：BindingAwareModelMap，值：]'),(25,'查询','张三','2019-05-12 14:22:23','findAllDepart'),(26,'查询','张三','2019-05-12 14:22:31','findFileDetailsInfo'),(27,'查询','张三','2019-05-12 14:22:31','findAllFilecount'),(28,'查询','张三','2019-05-12 14:22:32','findFileDetailsInfo'),(29,'查询','张三','2019-05-12 14:22:33','findAllFilecount'),(30,'查询','张三','2019-05-12 14:22:35','findFileDetailsInfo'),(31,'查询','张三','2019-05-12 14:22:35','findAllFilecount'),(32,'查询','张三','2019-05-12 14:22:45','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@551d7eed)]'),(33,'查询','张三','2019-05-12 14:22:46','findUserSendMessage[参数1，类型：Integer，值：]'),(34,'查询','张三','2019-05-12 14:22:46','findSendCount[参数1，类型：Integer，值：]'),(35,'查询','张三','2019-05-12 14:22:46','findUserHoldMessage[参数1，类型：Integer，值：]'),(36,'查询','张三','2019-05-12 14:22:46','findHoldCount[参数1，类型：Integer，值：]'),(37,'查询','张三','2019-05-12 14:22:50','findRole'),(38,'查询','张三','2019-05-12 14:22:50','findUser[参数1，类型：String，值：(getBytes : [B@52e80601)]'),(39,'查询','张三','2019-05-12 14:22:50','findUser[参数1，类型：String，值：(getBytes : [B@19f370cf)]'),(40,'查询','张三','2019-05-12 14:24:11','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@5acba4e0)]'),(41,'查询','张三','2019-05-12 14:24:11','findUserSendMessage[参数1，类型：Integer，值：]'),(42,'查询','张三','2019-05-12 14:24:11','findSendCount[参数1，类型：Integer，值：]'),(43,'查询','张三','2019-05-12 14:24:11','findUserHoldMessage[参数1，类型：Integer，值：]'),(44,'查询','张三','2019-05-12 14:24:11','findHoldCount[参数1，类型：Integer，值：]'),(45,'刪除','张三','2019-05-12 14:24:13','deleteMessage[参数1，类型：Integer，值：]'),(46,'查询','张三','2019-05-12 14:24:13','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@500e9783)]'),(47,'查询','张三','2019-05-12 14:24:13','findUserSendMessage[参数1，类型：Integer，值：]'),(48,'查询','张三','2019-05-12 14:24:13','findSendCount[参数1，类型：Integer，值：]'),(49,'查询','张三','2019-05-12 14:24:13','findUserHoldMessage[参数1，类型：Integer，值：]'),(50,'查询','张三','2019-05-12 14:24:13','findHoldCount[参数1，类型：Integer，值：]'),(51,'查询','张三','2019-05-12 15:50:07','findRole'),(52,'查询','张三','2019-05-12 15:50:07','findUser[参数1，类型：String，值：(getBytes : [B@470dceea)]'),(53,'查询','张三','2019-05-12 15:50:07','findUser[参数1，类型：String，值：(getBytes : [B@593ee5ef)]'),(54,'查询','张三','2019-05-12 15:52:06','findManagePower[参数1，类型：String，值：(getBytes : [B@904d2f7)]'),(55,'查询','张三','2019-05-12 16:55:47','findAllDepart'),(56,'查询','张三','2019-05-12 16:56:00','findSchedule[参数1，类型：ScheduleOb，值：(getT_schedule_begintime : 2019-05-06)(getT_schedule_endtime : 2019-05-07)(getT_branchinfo_id : 0)(getT_departinfo_id : 0)(getT_userinfo_id : 0)]'),(57,'查询','张三','2019-05-12 17:00:35','findSchedule[参数1，类型：ScheduleOb，值：]'),(58,'查询','张三','2019-05-12 17:18:52','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@ca623ab)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@525759f)(getCookies : [Ljavax.servlet.http.Cookie;@55472b36)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@6d3b9322)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@503d5e55)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13165)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@7e9a4040)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@1268da3e)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@237bf9d2)][参数2，类型：BindingAwareModelMap，值：]'),(59,'查询','张三','2019-05-12 17:18:55','findAllDepart'),(60,'查询','张三','2019-05-12 17:18:58','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@ca623ab)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@525759f)(getCookies : [Ljavax.servlet.http.Cookie;@1422a68b)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@4ef92171)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@42b03213)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13165)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@47b1bc2b)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@46a64ca8)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@237bf9d2)][参数2，类型：BindingAwareModelMap，值：]'),(61,'查询','张三','2019-05-12 17:19:00','findAllDepart'),(62,'查询','张三','2019-05-12 17:21:32','findManagePower[参数1，类型：String，值：(getBytes : [B@78854254)]'),(63,'查询','张三','2019-05-12 17:22:07','findRole'),(64,'查询','张三','2019-05-12 17:22:07','findUser[参数1，类型：String，值：(getBytes : [B@50f92e1f)]'),(65,'查询','张三','2019-05-12 17:22:07','findUser[参数1，类型：String，值：(getBytes : [B@704adaf1)]'),(66,'查询','张三','2019-05-12 17:23:52','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@656e1b9c)]'),(67,'查询','张三','2019-05-12 17:23:52','findUserSendMessage[参数1，类型：Integer，值：]'),(68,'查询','张三','2019-05-12 17:23:52','findSendCount[参数1，类型：Integer，值：]'),(69,'查询','张三','2019-05-12 17:23:52','findUserHoldMessage[参数1，类型：Integer，值：]'),(70,'查询','张三','2019-05-12 17:23:52','findHoldCount[参数1，类型：Integer，值：]'),(71,'查询','张三','2019-05-12 17:24:36','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@da9f057)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@668b7397)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@51877241)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@3f5bc75b)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7d32b3af)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]'),(72,'查询','张三','2019-05-12 17:24:37','findAllDepart'),(73,'查询','张三','2019-05-12 17:24:41','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@44a69c59)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@3fd5ea7b)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@3028b48b)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@3f98835e)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@4fac84a0)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]'),(74,'查询','张三','2019-05-12 17:24:42','findAllDepart'),(75,'查询','张三','2019-05-12 17:24:44','findFileDetailsInfo'),(76,'查询','张三','2019-05-12 17:24:44','findAllFilecount'),(77,'查询','张三','2019-05-12 17:24:46','findFileDetailsInfo'),(78,'查询','张三','2019-05-12 17:24:46','findAllFilecount'),(79,'查询','张三','2019-05-12 17:24:53','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@464e3eb1)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getContentLengthLong : -1)(getLocalName : QH-20160705SBEG)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@339ba537)(getCookies : [Ljavax.servlet.http.Cookie;@2fb60da9)(getAllowTrace : false)(getLocalPort : 8080)(getAttributeNames : java.util.Collections$3@115436e8)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@717c67b3)(getDispatcherType : REQUEST)(getRequestedSessionId : 372FF865A0C6001FB7A5BEA981AD4765)(getLocalAddr : 127.0.0.1)(getRemotePort : 13424)(getRemoteHost : 127.0.0.1)(getRemoteAddr : 127.0.0.1)(getLocales : java.util.Collections$3@70e2e568)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@6fa67598)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@40187055)][参数2，类型：BindingAwareModelMap，值：]'),(80,'查询','张三','2019-05-12 17:25:07','findFileDetailsInfo'),(81,'查询','张三','2019-05-12 17:25:07','findAllFilecount'),(82,'查询','张三','2019-05-12 17:25:22','findFileDetailsInfo'),(83,'查询','张三','2019-05-12 17:25:22','findAllFilecount'),(84,'查询','张三','2019-05-12 17:25:51','findFileDetailsInfo'),(85,'查询','张三','2019-05-12 17:25:51','findAllFilecount'),(86,'查询','张三','2019-05-12 17:28:01','findFileDetailsInfo'),(87,'查询','张三','2019-05-12 17:28:01','findAllFilecount'),(88,'查询','张三','2019-05-12 17:28:57','findFileDetailsInfo'),(89,'查询','张三','2019-05-12 17:28:57','findAllFilecount'),(90,'添加','张三','2019-05-12 17:33:04','addFile[参数1，类型：FileInfoBean，值：(getT_fileinfo_owner : 张三)(getT_fileinfo_createdate : 2019-05-12 17:33:04)(getT_fileinfo_filepath : D:\\JavaEE\\apache-tomcat-8.0.33\\wtpwebapps\\OfficeAutomationSystem\\upload\\查询.txt)(getT_fileinfo_remark : 123)(getT_fileinfo_filetypeid : 1)(getT_fileinfo_parentid : 0)(getT_fileinfo_id : 123)(getT_fileinfo_ifdelete : 2)(getT_fileinfo_name : 查询.txt)]'),(91,'查询','张三','2019-05-12 17:33:04','findFileDetailsInfo'),(92,'查询','张三','2019-05-12 17:33:04','findAllFilecount'),(93,'查询','张三','2019-05-12 17:34:50','findFileDetailsInfo'),(94,'查询','张三','2019-05-12 17:34:50','findAllFilecount'),(95,'查询','张三','2019-05-12 17:34:52','findFileDetailsInfo'),(96,'查询','张三','2019-05-12 17:34:52','findAllFilecount'),(97,'查询','张三','2019-05-12 17:34:53','findFileDetailsInfo'),(98,'查询','张三','2019-05-12 17:34:53','findAllFilecount'),(99,'查询','张三','2019-05-12 17:34:54','findFileDetailsInfo'),(100,'查询','张三','2019-05-12 17:34:54','findAllFilecount'),(101,'查询','张三','2019-05-12 17:34:54','findFileDetailsInfo'),(102,'查询','张三','2019-05-12 17:34:54','findAllFilecount'),(103,'查询','张三','2019-05-12 17:34:56','findFileDetailsInfo'),(104,'查询','张三','2019-05-12 17:34:56','findAllFilecount'),(105,'查询','张三','2019-05-12 17:35:28','findAllDepart'),(106,'查询','张三','2019-05-12 19:43:01','findRole'),(107,'查询','张三','2019-05-12 19:43:01','findUser[参数1，类型：String，值：(getBytes : [B@755008bf)]'),(108,'查询','张三','2019-05-12 19:43:01','findUser[参数1，类型：String，值：(getBytes : [B@537cb869)]'),(109,'查询','张三','2019-05-12 19:43:04','findRole'),(110,'查询','张三','2019-05-12 19:43:04','findUser[参数1，类型：String，值：(getBytes : [B@19c6a6be)]'),(111,'查询','张三','2019-05-12 19:43:04','findUser[参数1，类型：String，值：(getBytes : [B@35d0208f)]'),(112,'查询','张三','2019-05-12 19:43:06','findUserRole[参数1，类型：String，值：(getBytes : [B@4d18c2da)]'),(113,'查询','张三','2019-05-12 19:43:12','findRole'),(114,'查询','张三','2019-05-12 19:43:12','findUser[参数1，类型：String，值：(getBytes : [B@56222b01)]'),(115,'查询','张三','2019-05-12 19:43:12','findUser[参数1，类型：String，值：(getBytes : [B@7e9f201d)]'),(116,'查询','张三','2019-05-12 19:43:21','findUserRole[参数1，类型：String，值：(getBytes : [B@dd0ec73)]'),(117,'查询','张三','2019-05-12 19:43:25','findRole'),(118,'查询','张三','2019-05-12 19:43:25','findUser[参数1，类型：String，值：(getBytes : [B@47957cd3)]'),(119,'查询','张三','2019-05-12 19:43:25','findUser[参数1，类型：String，值：(getBytes : [B@61e17170)]'),(120,'查询','张三','2019-05-12 19:43:30','findUserRole[参数1，类型：String，值：(getBytes : [B@25a91e12)]'),(121,'查询','张三','2019-05-12 19:43:32','findRole'),(122,'查询','张三','2019-05-12 19:43:32','findUser[参数1，类型：String，值：(getBytes : [B@1a321fe)]'),(123,'查询','张三','2019-05-12 19:43:32','findUser[参数1，类型：String，值：(getBytes : [B@58e94c06)]'),(124,'查询','张三','2019-05-14 14:58:00','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@63bc67ac)]'),(125,'查询','张三','2019-05-14 14:58:00','findUserSendMessage[参数1，类型：Integer，值：]'),(126,'查询','张三','2019-05-14 14:58:00','findSendCount[参数1，类型：Integer，值：]'),(127,'查询','张三','2019-05-14 14:58:00','findUserHoldMessage[参数1，类型：Integer，值：]'),(128,'查询','张三','2019-05-14 14:58:01','findHoldCount[参数1，类型：Integer，值：]'),(129,'查询','张三','2019-05-14 14:58:17','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@2000e0d4)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@284256a0)(getLocalName : 0:0:0:0:0:0:0:1)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@7e8bd0c)(getCookies : [Ljavax.servlet.http.Cookie;@20c9eb65)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@1a845e8a)(getDispatcherType : REQUEST)(getRequestedSessionId : F7DA0DF16FBCD279763FCFDBA3DD78CA)(getLocales : java.util.Collections$3@797d1a25)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 62808)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@3bbfd8db)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@54c28e0a)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(130,'查询','张三','2019-05-14 14:58:18','findAllDepart'),(131,'查询','张三','2019-05-14 14:58:41','findManagePower[参数1，类型：String，值：(getBytes : [B@162009d1)]'),(132,'查询','张三','2019-05-14 14:58:49','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@38ffce51)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@6d75dda7)(getLocalName : 0:0:0:0:0:0:0:1)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@7e8bd0c)(getCookies : [Ljavax.servlet.http.Cookie;@6bb96979)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@4f4c1578)(getDispatcherType : REQUEST)(getRequestedSessionId : F7DA0DF16FBCD279763FCFDBA3DD78CA)(getLocales : java.util.Collections$3@907c786)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 62808)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@4adcbbe4)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@54c28e0a)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(133,'查询','张三','2019-05-14 14:59:21','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@3634066b)]'),(134,'查询','张三','2019-05-14 14:59:22','findUserSendMessage[参数1，类型：Integer，值：]'),(135,'查询','张三','2019-05-14 14:59:22','findSendCount[参数1，类型：Integer，值：]'),(136,'查询','张三','2019-05-14 14:59:22','findUserHoldMessage[参数1，类型：Integer，值：]'),(137,'查询','张三','2019-05-14 14:59:22','findHoldCount[参数1，类型：Integer，值：]'),(138,'查询','张三','2019-05-14 14:59:32','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@13ed7808)]'),(139,'查询','张三','2019-05-14 14:59:32','findUserSendMessage[参数1，类型：Integer，值：]'),(140,'查询','张三','2019-05-14 14:59:33','findSendCount[参数1，类型：Integer，值：]'),(141,'查询','张三','2019-05-14 14:59:33','findUserHoldMessage[参数1，类型：Integer，值：]'),(142,'查询','张三','2019-05-14 14:59:33','findHoldCount[参数1，类型：Integer，值：]'),(143,'查询','张三','2019-05-14 14:59:34','findMessageType'),(144,'查询','张三','2019-05-14 14:59:34','findMaxMessageid'),(145,'查询','张三','2019-05-14 14:59:45','findRole'),(146,'查询','张三','2019-05-14 14:59:45','findUser[参数1，类型：String，值：(getBytes : [B@1e7389d)]'),(147,'查询','张三','2019-05-14 14:59:45','findUser[参数1，类型：String，值：(getBytes : [B@20e95cb6)]'),(148,'查询','张三','2019-05-14 15:00:18','findFileDetailsInfo'),(149,'查询','张三','2019-05-14 15:00:19','findAllFilecount'),(150,'查询','张三','2019-05-14 15:00:25','findFileDetailsInfo'),(151,'查询','张三','2019-05-14 15:00:25','findAllFilecount'),(152,'查询','张三','2019-05-14 15:00:26','findFileDetailsInfo'),(153,'查询','张三','2019-05-14 15:00:26','findAllFilecount'),(154,'查询','张三','2019-05-14 15:04:21','findManagePower[参数1，类型：String，值：(getBytes : [B@774206b0)]'),(155,'查询','张三','2019-05-14 15:04:27','findRole'),(156,'查询','张三','2019-05-14 15:04:27','findUser[参数1，类型：String，值：(getBytes : [B@72f895ea)]'),(157,'查询','张三','2019-05-14 15:04:27','findUser[参数1，类型：String，值：(getBytes : [B@695d0386)]'),(158,'查询','张三','2019-05-14 15:04:55','findManagePower[参数1，类型：String，值：(getBytes : [B@607b7e61)]'),(159,'查询','张三','2019-05-14 15:04:57','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@cd710f3)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@4483f1fd)(getLocalName : 0:0:0:0:0:0:0:1)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@7e8bd0c)(getCookies : [Ljavax.servlet.http.Cookie;@cf8c7)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@b1a8bf7)(getDispatcherType : REQUEST)(getRequestedSessionId : F7DA0DF16FBCD279763FCFDBA3DD78CA)(getLocales : java.util.Collections$3@3ffe42ef)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 63653)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@642950f4)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@54c28e0a)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(160,'查询','张三','2019-05-14 15:05:14','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@628f4b5c)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@68e58bbb)(getLocalName : 0:0:0:0:0:0:0:1)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@7e8bd0c)(getCookies : [Ljavax.servlet.http.Cookie;@178f1ace)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@796b15a2)(getDispatcherType : REQUEST)(getRequestedSessionId : F7DA0DF16FBCD279763FCFDBA3DD78CA)(getLocales : java.util.Collections$3@61a67478)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 63653)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@255a83a4)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@54c28e0a)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(161,'查询','张三','2019-05-14 15:19:07','findManagePower[参数1，类型：String，值：(getBytes : [B@2b6e9c3b)]'),(162,'查询','张三','2019-05-14 15:19:25','findManagePower[参数1，类型：String，值：(getBytes : [B@27ed9b16)]'),(163,'查询','张三','2019-05-14 15:19:44','findManagePower[参数1，类型：String，值：(getBytes : [B@266350c5)]'),(164,'查询','张三','2019-05-14 15:19:51','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@3d58f7ff)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@1e0c5549)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@5219d738)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@2804258b)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@545e9bdf)(getDispatcherType : REQUEST)(getRequestedSessionId : A88D403CAD34721AE37EEC498D1A51A7)(getLocales : java.util.Collections$3@3e20351)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 65342)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@1f5eb402)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@167fe21f)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(165,'查询','张三','2019-05-14 15:19:55','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@19381cbe)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@5f72aa13)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@5fc9bc7f)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@2804258b)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@6d4446d3)(getDispatcherType : REQUEST)(getRequestedSessionId : A88D403CAD34721AE37EEC498D1A51A7)(getLocales : java.util.Collections$3@34406a29)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 65342)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7ea87c80)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@167fe21f)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(166,'查询','张三','2019-05-14 15:19:58','findManagePower[参数1，类型：String，值：(getBytes : [B@6c73ad4f)]'),(167,'查询','张三','2019-05-14 15:20:13','findManagePower[参数1，类型：String，值：(getBytes : [B@5ab9adca)]'),(168,'查询','张三','2019-05-14 15:20:24','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@658ef63c)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@73064957)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@4b77015b)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@2804258b)(getAllowTrace : false)(getLocalPort : 8080)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@5e61cdb8)(getDispatcherType : REQUEST)(getRequestedSessionId : A88D403CAD34721AE37EEC498D1A51A7)(getLocales : java.util.Collections$3@4c4cff5e)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 49160)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@d415b71)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@167fe21f)(getParts : [])][参数2，类型：BindingAwareModelMap，值：]'),(169,'查询','张三','2019-05-14 15:20:41','findManagePower[参数1，类型：String，值：(getBytes : [B@1cd2d553)]'),(170,'查询','张三','2019-05-14 15:20:46','findManagePower[参数1，类型：String，值：(getBytes : [B@6f1cabc4)]'),(171,'查询','张三','2019-05-14 15:20:57','findManagePower[参数1，类型：String，值：(getBytes : [B@29b84334)]'),(172,'查询','张三','2019-05-14 15:21:55','findManagePower[参数1，类型：String，值：(getBytes : [B@7a851520)]'),(173,'查询','张三','2019-05-14 15:21:59','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@26b522ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@5cdfc0d8)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@6e2ae199)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@437cc908)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 49307)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7814ec24)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@410bfc96)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@1832984b)(getDispatcherType : REQUEST)(getRequestedSessionId : 2A1EB4E8BA5854BEB812F8C38E358E7A)][参数2，类型：BindingAwareModelMap，值：]'),(174,'查询','张三','2019-05-14 15:22:25','findManagePower[参数1，类型：String，值：(getBytes : [B@404ad8d)]'),(175,'查询','张三','2019-05-14 15:22:45','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@521632ba)]'),(176,'查询','张三','2019-05-14 15:22:45','findUserSendMessage[参数1，类型：Integer，值：]'),(177,'查询','张三','2019-05-14 15:22:45','findSendCount[参数1，类型：Integer，值：]'),(178,'查询','张三','2019-05-14 15:22:45','findUserHoldMessage[参数1，类型：Integer，值：]'),(179,'查询','张三','2019-05-14 15:22:45','findHoldCount[参数1，类型：Integer，值：]'),(180,'查询','张三','2019-05-14 15:22:49','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@385742b5)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@16f039a6)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@708d5602)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@75336263)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 49408)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7773d49a)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@410bfc96)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@6059fedb)(getDispatcherType : REQUEST)(getRequestedSessionId : 2A1EB4E8BA5854BEB812F8C38E358E7A)][参数2，类型：BindingAwareModelMap，值：]'),(181,'查询','张三','2019-05-14 15:23:22','findManagePower[参数1，类型：String，值：(getBytes : [B@382c2b60)]'),(182,'查询','张三','2019-05-14 15:25:19','findManagePower[参数1，类型：String，值：(getBytes : [B@4920aed)]'),(183,'查询','张三','2019-05-14 15:25:33','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@79b617ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@4a42aa23)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@33ff44df)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@73207099)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 49718)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@3a600074)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@410bfc96)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@652cb6a9)(getDispatcherType : REQUEST)(getRequestedSessionId : 2A1EB4E8BA5854BEB812F8C38E358E7A)][参数2，类型：BindingAwareModelMap，值：]'),(184,'查询','张三','2019-05-14 15:25:39','findRole'),(185,'查询','张三','2019-05-14 15:25:40','findUser[参数1，类型：String，值：(getBytes : [B@35d9265b)]'),(186,'查询','张三','2019-05-14 15:25:40','findUser[参数1，类型：String，值：(getBytes : [B@299016d)]'),(187,'查询','张三','2019-05-14 15:25:49','findAllDepart'),(188,'查询','张三','2019-05-14 15:25:49','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@26b522ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@4aeea4b3)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@a81ad0d)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@4488ba26)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 49764)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@342e4bd3)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@410bfc96)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@b5aaad9)(getDispatcherType : REQUEST)(getRequestedSessionId : 2A1EB4E8BA5854BEB812F8C38E358E7A)][参数2，类型：BindingAwareModelMap，值：]'),(189,'查询','张三','2019-05-14 15:30:47','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@25549be8)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@3c93718c)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@9b1c0d7)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@2524c2f9)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 50308)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@242e866e)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@3968c76)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@42653ab)(getDispatcherType : REQUEST)(getRequestedSessionId : EE0097E7E430D152CEB4443F4F9C33C9)][参数2，类型：BindingAwareModelMap，值：]'),(190,'查询','张三','2019-05-14 15:31:08','findAllDepart'),(191,'查询','张三','2019-05-14 15:31:53','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@6cf6f8f3)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@4b50faf4)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@3c201bfb)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@242f293b)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 50442)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@7fc57c2d)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@3968c76)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@330ebe7b)(getDispatcherType : REQUEST)(getRequestedSessionId : EE0097E7E430D152CEB4443F4F9C33C9)][参数2，类型：BindingAwareModelMap，值：]'),(192,'查询','张三','2019-05-14 15:32:26','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@26b522ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@48a01bfb)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@7e5380ae)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@6ec8cf48)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 50502)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@b92be1b)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@3968c76)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@43a51351)(getDispatcherType : REQUEST)(getRequestedSessionId : EE0097E7E430D152CEB4443F4F9C33C9)][参数2，类型：BindingAwareModelMap，值：]'),(193,'查询','张三','2019-05-14 15:32:56','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@79b617ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@6558bcbc)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@1b6f8923)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@3d8b0b15)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 50551)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@2587f335)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@3968c76)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@59a1665)(getDispatcherType : REQUEST)(getRequestedSessionId : EE0097E7E430D152CEB4443F4F9C33C9)][参数2，类型：BindingAwareModelMap，值：]'),(194,'查询','张三','2019-05-14 15:33:17','findAllDepart'),(195,'查询','张三','2019-05-14 15:33:33','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@79b617ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@51da196f)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@2e1b671f)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@6d6b16d1)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 50596)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@5754ed82)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@3968c76)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@56c49766)(getDispatcherType : REQUEST)(getRequestedSessionId : EE0097E7E430D152CEB4443F4F9C33C9)][参数2，类型：BindingAwareModelMap，值：]'),(196,'查询','张三','2019-05-14 15:33:35','findAllDepart'),(197,'查询','张三','2019-05-14 15:37:50','findFileDetailsInfo'),(198,'查询','张三','2019-05-14 15:37:50','findAllFilecount'),(199,'查询','张三','2019-05-14 15:38:12','findFileDetailsInfo'),(200,'查询','张三','2019-05-14 15:38:12','findAllFilecount'),(201,'查询','张三','2019-05-14 15:38:40','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@11ed0645)]'),(202,'查询','张三','2019-05-14 15:38:40','findUserSendMessage[参数1，类型：Integer，值：]'),(203,'查询','张三','2019-05-14 15:38:40','findSendCount[参数1，类型：Integer，值：]'),(204,'查询','张三','2019-05-14 15:38:40','findUserHoldMessage[参数1，类型：Integer，值：]'),(205,'查询','张三','2019-05-14 15:38:41','findHoldCount[参数1，类型：Integer，值：]'),(206,'查询','张三','2019-05-14 15:39:09','findManagePower[参数1，类型：String，值：(getBytes : [B@2119e106)]'),(207,'查询','张三','2019-05-14 15:39:25','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@595f0ff1)]'),(208,'查询','张三','2019-05-14 15:39:25','findUserSendMessage[参数1，类型：Integer，值：]'),(209,'查询','张三','2019-05-14 15:39:25','findSendCount[参数1，类型：Integer，值：]'),(210,'查询','张三','2019-05-14 15:39:25','findUserHoldMessage[参数1，类型：Integer，值：]'),(211,'查询','张三','2019-05-14 15:39:25','findHoldCount[参数1，类型：Integer，值：]'),(212,'查询','张三','2019-05-14 15:39:29','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@5da2c172)]'),(213,'查询','张三','2019-05-14 15:39:29','findUserSendMessage[参数1，类型：Integer，值：]'),(214,'查询','张三','2019-05-14 15:39:29','findSendCount[参数1，类型：Integer，值：]'),(215,'查询','张三','2019-05-14 15:39:29','findUserHoldMessage[参数1，类型：Integer，值：]'),(216,'查询','张三','2019-05-14 15:39:29','findHoldCount[参数1，类型：Integer，值：]'),(217,'查询','张三','2019-05-14 15:39:50','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@74081809)]'),(218,'查询','张三','2019-05-14 15:39:50','findUserSendMessage[参数1，类型：Integer，值：]'),(219,'查询','张三','2019-05-14 15:39:50','findSendCount[参数1，类型：Integer，值：]'),(220,'查询','张三','2019-05-14 15:39:50','findUserHoldMessage[参数1，类型：Integer，值：]'),(221,'查询','张三','2019-05-14 15:39:50','findHoldCount[参数1，类型：Integer，值：]'),(222,'查询','张三','2019-05-14 15:39:59','findRole'),(223,'查询','张三','2019-05-14 15:39:59','findUser[参数1，类型：String，值：(getBytes : [B@63a38505)]'),(224,'查询','张三','2019-05-14 15:39:59','findUser[参数1，类型：String，值：(getBytes : [B@29ba673f)]'),(225,'查询','张三','2019-05-14 15:53:26','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@79b617ee)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@7861f900)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@325cee5c)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@44d20387)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53211)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@b19d8d0)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@7cc7894a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@29bca680)(getDispatcherType : REQUEST)(getRequestedSessionId : 7D4D4DCEB4F79EB8FBAF308122EA689C)][参数2，类型：BindingAwareModelMap，值：]'),(226,'查询','张三','2019-05-14 15:53:38','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@500f796)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@1a32ab8)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@4cda3600)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@47014518)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53206)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@45bfb629)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@7cc7894a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@5dd1a2cc)(getDispatcherType : REQUEST)(getRequestedSessionId : 7D4D4DCEB4F79EB8FBAF308122EA689C)][参数2，类型：BindingAwareModelMap，值：]'),(227,'查询','张三','2019-05-14 15:53:44','findAllDepart'),(228,'查询','张三','2019-05-14 15:53:47','findAllDepart'),(229,'查询','张三','2019-05-14 15:54:04','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@25549be8)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@41ec6355)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@17f383c6)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@438e04f0)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53211)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@d26032f)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@7cc7894a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@2ff22f15)(getDispatcherType : REQUEST)(getRequestedSessionId : 7D4D4DCEB4F79EB8FBAF308122EA689C)][参数2，类型：BindingAwareModelMap，值：]'),(230,'查询','张三','2019-05-14 15:54:08','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@385742b5)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@5b8a8dcf)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@270e4bcf)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@5ee6e49c)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53211)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@3a0a5d09)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@7cc7894a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@35615b72)(getDispatcherType : REQUEST)(getRequestedSessionId : 7D4D4DCEB4F79EB8FBAF308122EA689C)][参数2，类型：BindingAwareModelMap，值：]'),(231,'查询','张三','2019-05-14 15:54:13','findAllDepart'),(232,'查询','张三','2019-05-14 15:54:15','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@25549be8)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@395d85b2)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@7d7ea089)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@1e9e9b51)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53211)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@21628fee)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@7cc7894a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@74c7fe65)(getDispatcherType : REQUEST)(getRequestedSessionId : 7D4D4DCEB4F79EB8FBAF308122EA689C)][参数2，类型：BindingAwareModelMap，值：]'),(233,'查询','张三','2019-05-14 15:54:18','findUpdate[参数1，类型：Integer，值：]'),(234,'修改','张三','2019-05-14 15:54:18','findUpdate[参数1，类型：Integer，值：]'),(235,'查询','张三','2019-05-14 15:54:20','findAllDepart'),(236,'查询','张三','2019-05-14 15:54:26','findSchedule[参数1，类型：ScheduleOb，值：(getT_branchinfo_id : 0)(getT_schedule_begintime : )(getT_schedule_endtime : )(getT_departinfo_id : 0)(getT_userinfo_id : 0)]'),(237,'查询','张三','2019-05-14 15:54:29','findAllDepart'),(238,'查询','张三','2019-05-14 15:54:41','findFileDetailsInfo'),(239,'查询','张三','2019-05-14 15:54:41','findAllFilecount'),(240,'查询','张三','2019-05-14 15:54:47','findFileDetailsInfo'),(241,'查询','张三','2019-05-14 15:54:47','findAllFilecount'),(242,'查询','张三','2019-05-14 15:54:55','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@129836d3)]'),(243,'查询','张三','2019-05-14 15:54:55','findUserSendMessage[参数1，类型：Integer，值：]'),(244,'查询','张三','2019-05-14 15:54:55','findSendCount[参数1，类型：Integer，值：]'),(245,'查询','张三','2019-05-14 15:54:55','findUserHoldMessage[参数1，类型：Integer，值：]'),(246,'查询','张三','2019-05-14 15:54:55','findHoldCount[参数1，类型：Integer，值：]'),(247,'查询','张三','2019-05-14 15:54:58','findMessageType'),(248,'查询','张三','2019-05-14 15:54:58','findMaxMessageid'),(249,'查询','张三','2019-05-14 15:55:00','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@beb6d5a)]'),(250,'查询','张三','2019-05-14 15:55:00','findUserSendMessage[参数1，类型：Integer，值：]'),(251,'查询','张三','2019-05-14 15:55:00','findSendCount[参数1，类型：Integer，值：]'),(252,'查询','张三','2019-05-14 15:55:00','findUserHoldMessage[参数1，类型：Integer，值：]'),(253,'查询','张三','2019-05-14 15:55:00','findHoldCount[参数1，类型：Integer，值：]'),(254,'修改','张三','2019-05-14 15:55:02','selectUpdateMessage[参数1，类型：Integer，值：]'),(255,'修改','张三','2019-05-14 15:55:02','selectUpdateMessageType[参数1，类型：Integer，值：]'),(256,'查询','张三','2019-05-14 15:55:02','findMessageType'),(257,'查询','张三','2019-05-14 15:55:10','findRole'),(258,'查询','张三','2019-05-14 15:55:10','findUser[参数1，类型：String，值：(getBytes : [B@5fcbf5fd)]'),(259,'查询','张三','2019-05-14 15:55:10','findUser[参数1，类型：String，值：(getBytes : [B@159c8823)]'),(260,'查询','张三','2019-05-14 15:55:13','findRole'),(261,'查询','张三','2019-05-14 15:55:13','findUser[参数1，类型：String，值：(getBytes : [B@46d7d1e8)]'),(262,'查询','张三','2019-05-14 15:55:13','findUser[参数1，类型：String，值：(getBytes : [B@561d014)]'),(263,'查询','张三','2019-05-14 15:55:15','findUserRole[参数1，类型：String，值：(getBytes : [B@1e754e88)]'),(264,'查询','张三','2019-05-14 15:55:19','findRole'),(265,'查询','张三','2019-05-14 15:55:19','findUser[参数1，类型：String，值：(getBytes : [B@3d54d64f)]'),(266,'查询','张三','2019-05-14 15:55:20','findUser[参数1，类型：String，值：(getBytes : [B@2d9fe2fd)]'),(267,'查询','张三','2019-05-14 15:55:22','findRole'),(268,'查询','张三','2019-05-14 15:55:22','findUser[参数1，类型：String，值：(getBytes : [B@21fc5280)]'),(269,'查询','张三','2019-05-14 15:55:22','findUser[参数1，类型：String，值：(getBytes : [B@7e447d46)]'),(270,'查询','张三','2019-05-14 15:55:31','findRole'),(271,'查询','张三','2019-05-14 15:55:31','findUser[参数1，类型：String，值：(getBytes : [B@21ecfe6a)]'),(272,'查询','张三','2019-05-14 15:55:31','findUser[参数1，类型：String，值：(getBytes : [B@3d61f024)]'),(273,'查询','张三','2019-05-14 15:55:33','findRole'),(274,'查询','张三','2019-05-14 15:55:33','findUser[参数1，类型：String，值：(getBytes : [B@1fc1bb1)]'),(275,'查询','张三','2019-05-14 15:55:33','findUser[参数1，类型：String，值：(getBytes : [B@6c252321)]'),(276,'查询','小丽','2019-05-14 15:56:28','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@69fc719a)]'),(277,'查询','小丽','2019-05-14 15:56:28','findUserSendMessage[参数1，类型：Integer，值：]'),(278,'查询','小丽','2019-05-14 15:56:28','findSendCount[参数1，类型：Integer，值：]'),(279,'查询','小丽','2019-05-14 15:56:28','findUserHoldMessage[参数1，类型：Integer，值：]'),(280,'查询','小丽','2019-05-14 15:56:28','findHoldCount[参数1，类型：Integer，值：]'),(281,'查询','小丽','2019-05-14 15:56:33','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@2d134843)]'),(282,'查询','小丽','2019-05-14 15:56:33','findUserSendMessage[参数1，类型：Integer，值：]'),(283,'查询','小丽','2019-05-14 15:56:33','findSendCount[参数1，类型：Integer，值：]'),(284,'查询','小丽','2019-05-14 15:56:33','findUserHoldMessage[参数1，类型：Integer，值：]'),(285,'查询','小丽','2019-05-14 15:56:33','findHoldCount[参数1，类型：Integer，值：]'),(286,'查询','小丽','2019-05-14 15:56:38','findFileDetailsInfo'),(287,'查询','小丽','2019-05-14 15:56:38','findAllFilecount'),(288,'查询','小丽','2019-05-14 15:56:39','findFileDetailsInfo'),(289,'查询','小丽','2019-05-14 15:56:39','findAllFilecount'),(290,'查询','小丽','2019-05-14 15:56:43','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@4f9c237f)]'),(291,'查询','小丽','2019-05-14 15:56:43','findUserSendMessage[参数1，类型：Integer，值：]'),(292,'查询','小丽','2019-05-14 15:56:43','findSendCount[参数1，类型：Integer，值：]'),(293,'查询','小丽','2019-05-14 15:56:43','findUserHoldMessage[参数1，类型：Integer，值：]'),(294,'查询','小丽','2019-05-14 15:56:43','findHoldCount[参数1，类型：Integer，值：]'),(295,'查询','小丽','2019-05-14 15:58:12','findManagePower[参数1，类型：String，值：(getBytes : [B@13eab758)]'),(296,'查询','小丽','2019-05-14 15:58:26','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@609a3561)]'),(297,'查询','小丽','2019-05-14 15:58:26','findUserSendMessage[参数1，类型：Integer，值：]'),(298,'查询','小丽','2019-05-14 15:58:26','findSendCount[参数1，类型：Integer，值：]'),(299,'查询','小丽','2019-05-14 15:58:26','findUserHoldMessage[参数1，类型：Integer，值：]'),(300,'查询','小丽','2019-05-14 15:58:26','findHoldCount[参数1，类型：Integer，值：]'),(301,'查询','张三','2019-05-14 15:59:26','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@25549be8)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@54d44bb)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@b1ff0ba)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@24c9a037)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53907)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@538a6c1)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@6a3f4241)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@1e51e59c)(getDispatcherType : REQUEST)(getRequestedSessionId : 5752D1134E8E624B6E09336B41CA2935)][参数2，类型：BindingAwareModelMap，值：]'),(302,'查询','张三','2019-05-14 15:59:31','findAllBranchPage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@385742b5)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@689c7bc9)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@2ee1a23f)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@58acd642)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53907)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@70931d67)(getRequestURI : /OfficeAutomationSystem/branch_management.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/branch_management.do)(getServletPath : /branch_management.do)(getSession : org.apache.catalina.session.StandardSessionFacade@6a3f4241)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@3a5cb179)(getDispatcherType : REQUEST)(getRequestedSessionId : 5752D1134E8E624B6E09336B41CA2935)][参数2，类型：BindingAwareModelMap，值：]'),(303,'查询','张三','2019-05-14 15:59:34','findAllDepart'),(304,'查询','张三','2019-05-14 15:59:38','findAllDepart'),(305,'查询','张三','2019-05-14 15:59:46','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@500f796)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@265505b9)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@4db9a610)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@1dc590ce)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 53907)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@6ac31fb0)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@6a3f4241)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@64b5a79c)(getDispatcherType : REQUEST)(getRequestedSessionId : 5752D1134E8E624B6E09336B41CA2935)][参数2，类型：BindingAwareModelMap，值：]'),(306,'查询','张三','2019-05-14 15:59:48','findUpdate[参数1，类型：Integer，值：]'),(307,'修改','张三','2019-05-14 15:59:48','findUpdate[参数1，类型：Integer，值：]'),(308,'查询','张三','2019-05-14 15:59:50','findAllDepart'),(309,'查询','张三','2019-05-14 15:59:52','findSchedule[参数1，类型：ScheduleOb，值：(getT_branchinfo_id : 0)(getT_schedule_begintime : )(getT_schedule_endtime : )(getT_departinfo_id : 0)(getT_userinfo_id : 0)]'),(310,'查询','张三','2019-05-14 16:00:01','findFileDetailsInfo'),(311,'查询','张三','2019-05-14 16:00:01','findAllFilecount'),(312,'查询','张三','2019-05-14 16:00:07','findFileDetailsInfo'),(313,'查询','张三','2019-05-14 16:00:07','findAllFilecount'),(314,'查询','张三','2019-05-14 16:00:07','findFileDetailsInfo'),(315,'查询','张三','2019-05-14 16:00:07','findAllFilecount'),(316,'查询','张三','2019-05-14 16:00:09','findFileDetailsInfo'),(317,'查询','张三','2019-05-14 16:00:09','findAllFilecount'),(318,'查询','张三','2019-05-14 16:00:15','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@6e2a1a93)]'),(319,'查询','张三','2019-05-14 16:00:15','findUserSendMessage[参数1，类型：Integer，值：]'),(320,'查询','张三','2019-05-14 16:00:16','findSendCount[参数1，类型：Integer，值：]'),(321,'查询','张三','2019-05-14 16:00:16','findUserHoldMessage[参数1，类型：Integer，值：]'),(322,'查询','张三','2019-05-14 16:00:16','findHoldCount[参数1，类型：Integer，值：]'),(323,'修改','张三','2019-05-14 16:00:20','selectUpdateMessage[参数1，类型：Integer，值：]'),(324,'修改','张三','2019-05-14 16:00:20','selectUpdateMessageType[参数1，类型：Integer，值：]'),(325,'查询','张三','2019-05-14 16:00:21','findMessageType'),(326,'查询','张三','2019-05-14 16:00:27','findRole'),(327,'查询','张三','2019-05-14 16:00:27','findUser[参数1，类型：String，值：(getBytes : [B@1f02440e)]'),(328,'查询','张三','2019-05-14 16:00:28','findUser[参数1，类型：String，值：(getBytes : [B@133c5918)]'),(329,'查询','张三','2019-05-14 16:00:29','findRole'),(330,'查询','张三','2019-05-14 16:00:29','findUser[参数1，类型：String，值：(getBytes : [B@41c8731a)]'),(331,'查询','张三','2019-05-14 16:00:29','findUser[参数1，类型：String，值：(getBytes : [B@1576931a)]'),(332,'查询','张三','2019-05-14 16:00:31','findUserRole[参数1，类型：String，值：(getBytes : [B@321f65a7)]'),(333,'查询','张三','2019-05-14 16:00:34','findRole'),(334,'查询','张三','2019-05-14 16:00:34','findUser[参数1，类型：String，值：(getBytes : [B@6cfefeb9)]'),(335,'查询','张三','2019-05-14 16:00:34','findUser[参数1，类型：String，值：(getBytes : [B@77bf8f43)]'),(336,'查询','小丽','2019-05-14 16:01:03','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@25549be8)(getProtocol : HTTP/1.1)(getContentLength : -1)(getLocale : zh_CN)(getAttributeNames : java.util.Collections$3@7eccc394)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@2d294844)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@61871ce0)(getAllowTrace : false)(getLocalPort : 8080)(getLocales : java.util.Collections$3@2499cc86)(getParameterMap : {})(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRemotePort : 54058)(getLocalAddr : 0:0:0:0:0:0:0:1)(getServerName : localhost)(getServerPort : 8080)(getContextPath : /OfficeAutomationSystem)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@11af9398)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@9e7325a)(getParts : [])(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@6eeb304a)(getDispatcherType : REQUEST)(getRequestedSessionId : C97F2294B9BBD39EADDC53D51C863935)][参数2，类型：BindingAwareModelMap，值：]'),(337,'查询','小丽','2019-05-14 16:01:05','findAllDepart'),(338,'查询','小丽','2019-05-14 16:01:10','findFileDetailsInfo'),(339,'查询','小丽','2019-05-14 16:01:10','findAllFilecount'),(340,'查询','小丽','2019-05-14 16:01:12','findFileDetailsInfo'),(341,'查询','小丽','2019-05-14 16:01:12','findAllFilecount'),(342,'查询','小丽','2019-05-14 16:01:16','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@29f9adce)]'),(343,'查询','小丽','2019-05-14 16:01:16','findUserSendMessage[参数1，类型：Integer，值：]'),(344,'查询','小丽','2019-05-14 16:01:16','findSendCount[参数1，类型：Integer，值：]'),(345,'查询','小丽','2019-05-14 16:01:16','findUserHoldMessage[参数1，类型：Integer，值：]'),(346,'查询','小丽','2019-05-14 16:01:16','findHoldCount[参数1，类型：Integer，值：]'),(347,'查询','罗丽','2019-05-31 11:22:30','findManagePower[参数1，类型：String，值：(getBytes : [B@391a78a3)]'),(348,'查询','罗丽','2019-05-31 11:22:34','findFileDetailsInfo'),(349,'查询','罗丽','2019-05-31 11:22:34','findAllFilecount'),(350,'查询','罗丽','2019-05-31 11:22:36','findAllMySchedulePage[参数1，类型：RequestFacade，值：(getMethod : GET)(getScheme : http)(getInputStream : org.apache.catalina.connector.CoyoteInputStream@117379bb)(getProtocol : HTTP/1.1)(getLocale : zh_CN)(getContentLength : -1)(getAttributeNames : java.util.Collections$3@71157334)(getLocalName : 0:0:0:0:0:0:0:1)(getCookies : [Ljavax.servlet.http.Cookie;@305c09ea)(getServletContext : org.apache.catalina.core.ApplicationContextFacade@3bce48ce)(getLocalPort : 8080)(getAllowTrace : false)(getHeaderNames : org.apache.tomcat.util.http.NamesEnumerator@6ffcac82)(getContextPath : /OfficeAutomationSystem)(getRequestURL : http://localhost:8080/OfficeAutomationSystem/my_schedule.do)(getServletPath : /my_schedule.do)(getSession : org.apache.catalina.session.StandardSessionFacade@2060bea0)(getRequestURI : /OfficeAutomationSystem/my_schedule.do)(getParts : [])(getRemotePort : 51056)(getLocalAddr : 0:0:0:0:0:0:0:1)(getParameterMap : {})(getServerName : localhost)(getServerPort : 8080)(getLocales : java.util.Collections$3@6aed1586)(getRemoteAddr : 0:0:0:0:0:0:0:1)(getRemoteHost : 0:0:0:0:0:0:0:1)(getRequestedSessionId : C208D075A8145236A8BEA151083BD224)(getCharacterEncoding : UTF-8)(getParameterNames : java.util.Collections$3@303b473c)(getDispatcherType : REQUEST)][参数2，类型：BindingAwareModelMap，值：]'),(351,'查询','罗丽','2019-05-31 11:22:37','findAllDepart'),(352,'查询','罗丽','2019-05-31 11:23:10','findManagePower[参数1，类型：String，值：(getBytes : [B@36a62b02)]'),(353,'查询','罗丽','2019-05-31 11:23:56','findFileDetailsInfo'),(354,'查询','罗丽','2019-05-31 11:23:56','findAllFilecount'),(355,'查询','罗丽','2019-05-31 11:24:19','findFileDetailsInfo'),(356,'查询','罗丽','2019-05-31 11:24:19','findAllFilecount'),(357,'查询','罗丽','2019-05-31 11:24:47','findMessageUserinfoid[参数1，类型：String，值：(getBytes : [B@f7ca466)]'),(358,'查询','罗丽','2019-05-31 11:24:47','findUserSendMessage[参数1，类型：Integer，值：]'),(359,'查询','罗丽','2019-05-31 11:24:47','findSendCount[参数1，类型：Integer，值：]'),(360,'查询','罗丽','2019-05-31 11:24:47','findUserHoldMessage[参数1，类型：Integer，值：]'),(361,'查询','罗丽','2019-05-31 11:24:47','findHoldCount[参数1，类型：Integer，值：]'),(362,'查询','张三','2019-05-31 11:27:17','findRole'),(363,'查询','张三','2019-05-31 11:27:17','findUser[参数1，类型：String，值：(getBytes : [B@4f1e168a)]'),(364,'查询','张三','2019-05-31 11:27:17','findUser[参数1，类型：String，值：(getBytes : [B@4f3fc9ad)]'),(365,'查询','张三','2019-05-31 11:27:17','findUser[参数1，类型：String，值：(getBytes : [B@50d8f6d4)]'),(366,'查询','张三','2019-05-31 11:27:21','findUserRole[参数1，类型：String，值：(getBytes : [B@1ee0ce0f)]'),(367,'修改','张三','2019-05-31 11:27:23','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 女)(getT_userstate_id : 3)(getT_userinfo_id : 2)(getT_roleinfo_id : 3)(getT_departinfo_id : 2)(getT_userinfo_name : 小丽)(getT_userinfo_password : 123)]'),(368,'查询','张三','2019-05-31 11:27:23','findRole'),(369,'查询','张三','2019-05-31 11:27:23','findUser[参数1，类型：String，值：(getBytes : [B@5281c812)]'),(370,'查询','张三','2019-05-31 11:27:23','findUser[参数1，类型：String，值：(getBytes : [B@63d1c64d)]'),(371,'查询','张三','2019-05-31 11:27:23','findUser[参数1，类型：String，值：(getBytes : [B@4f3b0525)]'),(372,'查询','张三','2019-05-31 11:27:25','findUserRole[参数1，类型：String，值：(getBytes : [B@3d8424b3)]'),(373,'修改','张三','2019-05-31 11:27:28','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 4)(getT_roleinfo_id : 3)(getT_departinfo_id : 4)(getT_userinfo_name : 程璧)(getT_userinfo_password : 123)]'),(374,'查询','张三','2019-05-31 11:27:28','findRole'),(375,'查询','张三','2019-05-31 11:27:28','findUser[参数1，类型：String，值：(getBytes : [B@1e3d3528)]'),(376,'查询','张三','2019-05-31 11:27:28','findUser[参数1，类型：String，值：(getBytes : [B@1bb3e7b4)]'),(377,'查询','张三','2019-05-31 11:27:28','findUser[参数1，类型：String，值：(getBytes : [B@7eb5c160)]'),(378,'查询','张三','2019-05-31 11:27:29','findUserRole[参数1，类型：String，值：(getBytes : [B@4fc42e1e)]'),(379,'修改','张三','2019-05-31 11:27:32','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 女)(getT_userstate_id : 3)(getT_userinfo_id : 5)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 罗丽)(getT_userinfo_password : 123)]'),(380,'查询','张三','2019-05-31 11:27:32','findRole'),(381,'查询','张三','2019-05-31 11:27:32','findUser[参数1，类型：String，值：(getBytes : [B@7f99831e)]'),(382,'查询','张三','2019-05-31 11:27:32','findUser[参数1，类型：String，值：(getBytes : [B@17eff924)]'),(383,'查询','张三','2019-05-31 11:27:32','findUser[参数1，类型：String，值：(getBytes : [B@51bc6705)]'),(384,'查询','张三','2019-05-31 11:27:33','findUserRole[参数1，类型：String，值：(getBytes : [B@5ee5d80a)]'),(385,'修改','张三','2019-05-31 11:27:35','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 6)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 黄强)(getT_userinfo_password : 123)]'),(386,'查询','张三','2019-05-31 11:27:35','findRole'),(387,'查询','张三','2019-05-31 11:27:35','findUser[参数1，类型：String，值：(getBytes : [B@57c6b928)]'),(388,'查询','张三','2019-05-31 11:27:35','findUser[参数1，类型：String，值：(getBytes : [B@75f48133)]'),(389,'查询','张三','2019-05-31 11:27:35','findUser[参数1，类型：String，值：(getBytes : [B@77ec474)]'),(390,'查询','张三','2019-05-31 11:27:37','findUserRole[参数1，类型：String，值：(getBytes : [B@65645b95)]'),(391,'查询','张三','2019-05-31 11:27:39','findRole'),(392,'查询','张三','2019-05-31 11:27:40','findUser[参数1，类型：String，值：(getBytes : [B@1fe87dae)]'),(393,'查询','张三','2019-05-31 11:27:40','findUser[参数1，类型：String，值：(getBytes : [B@3df909ea)]'),(394,'查询','张三','2019-05-31 11:27:40','findUser[参数1，类型：String，值：(getBytes : [B@66678ff1)]'),(395,'查询','张三','2019-05-31 11:27:42','findUserRole[参数1，类型：String，值：(getBytes : [B@7c19a59a)]'),(396,'修改','张三','2019-05-31 11:27:44','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 7)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 黄明)(getT_userinfo_password : 123)]'),(397,'查询','张三','2019-05-31 11:27:44','findRole'),(398,'查询','张三','2019-05-31 11:27:44','findUser[参数1，类型：String，值：(getBytes : [B@41c7573e)]'),(399,'查询','张三','2019-05-31 11:27:44','findUser[参数1，类型：String，值：(getBytes : [B@4412e1e0)]'),(400,'查询','张三','2019-05-31 11:27:44','findUser[参数1，类型：String，值：(getBytes : [B@dd08261)]'),(401,'查询','张三','2019-05-31 11:27:47','findUserRole[参数1，类型：String，值：(getBytes : [B@59e55a47)]'),(402,'修改','张三','2019-05-31 11:27:49','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 11)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 黄倩)(getT_userinfo_password : 123)]'),(403,'查询','张三','2019-05-31 11:27:49','findRole'),(404,'查询','张三','2019-05-31 11:27:49','findUser[参数1，类型：String，值：(getBytes : [B@41ef2c00)]'),(405,'查询','张三','2019-05-31 11:27:49','findUser[参数1，类型：String，值：(getBytes : [B@59b08bf2)]'),(406,'查询','张三','2019-05-31 11:27:49','findUser[参数1，类型：String，值：(getBytes : [B@6de29192)]'),(407,'查询','张三','2019-05-31 11:27:50','findUserRole[参数1，类型：String，值：(getBytes : [B@1ee2677)]'),(408,'修改','张三','2019-05-31 11:27:53','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 9)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 黄希)(getT_userinfo_password : 123)]'),(409,'查询','张三','2019-05-31 11:27:53','findRole'),(410,'查询','张三','2019-05-31 11:27:53','findUser[参数1，类型：String，值：(getBytes : [B@69dc45db)]'),(411,'查询','张三','2019-05-31 11:27:53','findUser[参数1，类型：String，值：(getBytes : [B@19eb931f)]'),(412,'查询','张三','2019-05-31 11:27:53','findUser[参数1，类型：String，值：(getBytes : [B@4b2af5c2)]'),(413,'查询','张三','2019-05-31 11:27:55','findUserRole[参数1，类型：String，值：(getBytes : [B@2f3e9232)]'),(414,'修改','张三','2019-05-31 11:27:57','userUpdate[参数1，类型：UserBean，值：(getT_userinfo_gender : 男)(getT_userstate_id : 3)(getT_userinfo_id : 10)(getT_roleinfo_id : 3)(getT_departinfo_id : 1)(getT_userinfo_name : 黄牛)(getT_userinfo_password : 123)]'),(415,'查询','张三','2019-05-31 11:27:57','findRole'),(416,'查询','张三','2019-05-31 11:27:57','findUser[参数1，类型：String，值：(getBytes : [B@5bdb3db4)]'),(417,'查询','张三','2019-05-31 11:27:57','findUser[参数1，类型：String，值：(getBytes : [B@4fa24b75)]'),(418,'查询','张三','2019-05-31 11:27:57','findUser[参数1，类型：String，值：(getBytes : [B@472c2f73)]'),(419,'查询','张三','2019-05-31 11:27:59','findRole'),(420,'查询','张三','2019-05-31 11:27:59','findUser[参数1，类型：String，值：(getBytes : [B@2f0615c1)]'),(421,'查询','张三','2019-05-31 11:27:59','findUser[参数1，类型：String，值：(getBytes : [B@7dae36b2)]'),(422,'查询','张三','2019-05-31 11:27:59','findUser[参数1，类型：String，值：(getBytes : [B@520ad584)]');
/*!40000 ALTER TABLE `t_operationlog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_power`
--

DROP TABLE IF EXISTS `t_power`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_power` (
  `t_power_id` int(11) NOT NULL,
  `t_power_name` varchar(50) CHARACTER SET utf8 NOT NULL,
  `t_power_uri` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`t_power_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_power`
--

LOCK TABLES `t_power` WRITE;
/*!40000 ALTER TABLE `t_power` DISABLE KEYS */;
INSERT INTO `t_power` VALUES (1,'机构管理','branch_management.do'),(2,'部门管理','depart_management.do'),(3,'员工管理','user_management.do'),(4,'我的日程','my_schedule.do'),(6,'我的便签','my_note.do'),(7,'文件管理','file_management.do'),(9,'回收站','trash.do'),(10,'文件搜索','file_search.do'),(11,'消息管理','message_management.do'),(13,'角色管理','role_management.do'),(14,'登录日志','login_log.do'),(15,'操作日志','operate_log.do'),(16,'考勤','manualsign.do'),(17,'考勤历史记录查询','manualsign.do'),(18,'员工签到签退','signin.do');
/*!40000 ALTER TABLE `t_power` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_precontract`
--

DROP TABLE IF EXISTS `t_precontract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_precontract` (
  `t_precontract_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_schedule_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) NOT NULL,
  PRIMARY KEY (`t_precontract_id`),
  KEY `t_schedule_id` (`t_schedule_id`),
  KEY `t_userinfo_id` (`t_userinfo_id`),
  CONSTRAINT `t_precontract_ibfk_1` FOREIGN KEY (`t_schedule_id`) REFERENCES `t_schedule` (`t_schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_precontract_ibfk_2` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_precontract`
--

LOCK TABLES `t_precontract` WRITE;
/*!40000 ALTER TABLE `t_precontract` DISABLE KEYS */;
INSERT INTO `t_precontract` VALUES (1,2,3),(2,1,4),(3,1,5);
/*!40000 ALTER TABLE `t_precontract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_roleinfo`
--

DROP TABLE IF EXISTS `t_roleinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_roleinfo` (
  `t_roleinfo_id` int(11) NOT NULL,
  `t_roleinfo_name` varchar(50) DEFAULT NULL,
  `t_roleinfo_desc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_roleinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_roleinfo`
--

LOCK TABLES `t_roleinfo` WRITE;
/*!40000 ALTER TABLE `t_roleinfo` DISABLE KEYS */;
INSERT INTO `t_roleinfo` VALUES (1,'总经理','总经理'),(2,'部门经理','部门经理'),(3,'普通员工','普通员工');
/*!40000 ALTER TABLE `t_roleinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_roleinfo_manage`
--

DROP TABLE IF EXISTS `t_roleinfo_manage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_roleinfo_manage` (
  `t_roleinfo_manage_id` int(11) NOT NULL,
  `t_roleinfo_id` int(11) NOT NULL,
  `t_manage_id` int(11) NOT NULL,
  PRIMARY KEY (`t_roleinfo_manage_id`),
  KEY `t_roleinfo_id` (`t_roleinfo_id`),
  KEY `t_manage_id` (`t_manage_id`),
  CONSTRAINT `t_roleinfo_manage_ibfk_1` FOREIGN KEY (`t_roleinfo_id`) REFERENCES `t_roleinfo` (`t_roleinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_roleinfo_manage_ibfk_2` FOREIGN KEY (`t_manage_id`) REFERENCES `t_manage` (`t_manage_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_roleinfo_manage`
--

LOCK TABLES `t_roleinfo_manage` WRITE;
/*!40000 ALTER TABLE `t_roleinfo_manage` DISABLE KEYS */;
INSERT INTO `t_roleinfo_manage` VALUES (1,1,1),(2,1,2),(3,1,3),(4,1,4),(5,1,5),(6,1,6),(7,2,2),(8,2,3),(9,2,4),(10,2,7);
/*!40000 ALTER TABLE `t_roleinfo_manage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_roleright`
--

DROP TABLE IF EXISTS `t_roleright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_roleright` (
  `t_roleright_id` int(11) NOT NULL,
  `t_roleinfo_id` int(11) DEFAULT NULL,
  `t_roleright_uri` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_roleright_id`),
  KEY `fk_t_roleinfo_id` (`t_roleinfo_id`),
  CONSTRAINT `fk_t_roleinfo_id` FOREIGN KEY (`t_roleinfo_id`) REFERENCES `t_roleinfo` (`t_roleinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_roleright`
--

LOCK TABLES `t_roleright` WRITE;
/*!40000 ALTER TABLE `t_roleright` DISABLE KEYS */;
INSERT INTO `t_roleright` VALUES (1,1,'/oasystem/ManagerAction.do'),(2,2,'/oasystem/UserAction.do');
/*!40000 ALTER TABLE `t_roleright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_schedule`
--

DROP TABLE IF EXISTS `t_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_schedule` (
  `t_schedule_id` int(11) NOT NULL,
  `t_schedule_title` varchar(50) NOT NULL,
  `t_schedule_address` varchar(50) NOT NULL,
  `t_meetinginfo_id` int(11) NOT NULL,
  `t_schedule_begintime` datetime NOT NULL,
  `t_schedule_endtime` datetime NOT NULL,
  `t_schedule_content` varchar(500) NOT NULL,
  `t_schedule_createuser` varchar(50) NOT NULL,
  `t_schedule_createtime` datetime NOT NULL,
  `t_schedule_ifprivate` int(11) NOT NULL,
  PRIMARY KEY (`t_schedule_id`),
  KEY `t_meetinginfo_id` (`t_meetinginfo_id`),
  CONSTRAINT `t_schedule_ibfk_1` FOREIGN KEY (`t_meetinginfo_id`) REFERENCES `t_meetinginfo` (`t_meetinginfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_schedule`
--

LOCK TABLES `t_schedule` WRITE;
/*!40000 ALTER TABLE `t_schedule` DISABLE KEYS */;
INSERT INTO `t_schedule` VALUES (1,'会议','5号会议室',2,'2019-05-02 16:37:59','2019-05-02 18:38:04','季度总结1','张经理','2019-05-04 16:39:30',1),(2,'考察','公司科创部',3,'2019-05-05 16:40:10','2019-05-06 16:40:14','考察学习1','孙总','2019-05-06 18:41:09',0),(3,'会议','2号会议室',2,'2019-05-02 16:37:59','2019-05-02 18:38:04','季度总结2','张经理','2019-05-04 16:39:30',1),(4,'考察','公司科创部',3,'2019-05-05 16:40:10','2019-05-06 16:40:14','考察学习2','孙总','2019-05-06 18:41:09',0),(5,'会议','1号会议室',2,'2019-05-02 16:37:59','2019-05-02 18:38:04','季度总结3','张经理','2019-05-04 16:39:30',1),(6,'考察','公司科创部',3,'2019-05-05 16:40:10','2019-05-06 16:40:14','考察学习3','孙总','2019-05-06 18:41:09',0),(7,'会议','1号会议室',2,'2019-05-02 16:37:59','2019-05-02 18:38:04','季度总结4','张经理','2019-05-04 16:39:30',1),(8,'考察','公司科创部',3,'2019-05-05 16:40:10','2019-05-06 16:40:14','考察学习4','孙总','2019-05-06 18:41:09',0);
/*!40000 ALTER TABLE `t_schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_scheduleob`
--

DROP TABLE IF EXISTS `t_scheduleob`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_scheduleob` (
  `t_scheduleob_id` int(11) NOT NULL AUTO_INCREMENT,
  `t_departinfo_id` int(11) NOT NULL,
  `t_schedule_id` int(11) NOT NULL,
  `t_userinfo_id` int(11) DEFAULT NULL,
  `t_branchinfo_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_scheduleob_id`),
  KEY `t_scheduleob_ibfk_1` (`t_departinfo_id`),
  KEY `t_scheduleob_ibfk_2` (`t_schedule_id`),
  KEY `t_scheduleob_ibfk_3` (`t_userinfo_id`),
  KEY `t_scheduleob_ibfk_4` (`t_branchinfo_id`),
  CONSTRAINT `t_scheduleob_ibfk_1` FOREIGN KEY (`t_departinfo_id`) REFERENCES `t_departinfo` (`t_departinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_2` FOREIGN KEY (`t_schedule_id`) REFERENCES `t_schedule` (`t_schedule_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_3` FOREIGN KEY (`t_userinfo_id`) REFERENCES `t_userinfo` (`t_userinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `t_scheduleob_ibfk_4` FOREIGN KEY (`t_branchinfo_id`) REFERENCES `t_branchinfo` (`t_branchinfo_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_scheduleob`
--

LOCK TABLES `t_scheduleob` WRITE;
/*!40000 ALTER TABLE `t_scheduleob` DISABLE KEYS */;
INSERT INTO `t_scheduleob` VALUES (1,1,1,4,3),(3,1,2,3,4),(4,1,2,2,2);
/*!40000 ALTER TABLE `t_scheduleob` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_userinfo`
--

DROP TABLE IF EXISTS `t_userinfo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_userinfo` (
  `t_userinfo_id` int(11) NOT NULL,
  `t_userinfo_name` varchar(50) DEFAULT NULL,
  `t_userinfo_password` varchar(50) DEFAULT NULL,
  `t_departinfo_id` int(11) DEFAULT NULL,
  `t_userinfo_gender` varchar(10) DEFAULT NULL,
  `t_roleinfo_id` int(11) DEFAULT NULL,
  `t_userstate_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`t_userinfo_id`),
  KEY `fk1_t_roleinfo_id` (`t_roleinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_userinfo`
--

LOCK TABLES `t_userinfo` WRITE;
/*!40000 ALTER TABLE `t_userinfo` DISABLE KEYS */;
INSERT INTO `t_userinfo` VALUES (1,'张三','123',1,'男',1,1),(2,'小丽','123',2,'女',3,3),(3,'陈晨','123',3,'男',1,1),(4,'程璧','123',4,'男',3,3),(5,'罗丽','123',1,'女',3,3),(6,'黄强','123',1,'男',3,3),(7,'黄明','123',1,'男',3,3),(8,'黄亚星','123',1,'男',2,1),(9,'黄希','123',1,'男',3,3),(10,'黄牛','123',1,'男',3,3),(11,'黄倩','123',1,'男',3,3);
/*!40000 ALTER TABLE `t_userinfo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_userstate`
--

DROP TABLE IF EXISTS `t_userstate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_userstate` (
  `t_userstate_id` int(11) NOT NULL,
  `t_userstate_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`t_userstate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_userstate`
--

LOCK TABLES `t_userstate` WRITE;
/*!40000 ALTER TABLE `t_userstate` DISABLE KEYS */;
INSERT INTO `t_userstate` VALUES (0,'被屏蔽'),(1,'正常状态');
/*!40000 ALTER TABLE `t_userstate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_worktime`
--

DROP TABLE IF EXISTS `t_worktime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `t_worktime` (
  `t_worktime_id` int(11) DEFAULT NULL,
  `t_worktime_ondutytime` varchar(50) DEFAULT NULL,
  `t_worktime_offdutytime` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_worktime`
--

LOCK TABLES `t_worktime` WRITE;
/*!40000 ALTER TABLE `t_worktime` DISABLE KEYS */;
INSERT INTO `t_worktime` VALUES (1,'8:00','17:00'),(2,'8:00','19:00'),(3,'19:00','7:00'),(4,'19:00','5:00');
/*!40000 ALTER TABLE `t_worktime` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-12  9:13:52

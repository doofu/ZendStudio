-- MySQL dump 10.13  Distrib 5.6.17, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: zentao
-- ------------------------------------------------------
-- Server version	5.6.17-0ubuntu0.14.04.1

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
-- Current Database: `zentao`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `zentao` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `zentao`;

--
-- Table structure for table `zt_action`
--

DROP TABLE IF EXISTS `zt_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_action` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `objectType` varchar(30) NOT NULL DEFAULT '',
  `objectID` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` varchar(255) NOT NULL,
  `project` mediumint(9) NOT NULL,
  `actor` varchar(30) NOT NULL DEFAULT '',
  `action` varchar(30) NOT NULL DEFAULT '',
  `date` datetime NOT NULL,
  `comment` text NOT NULL,
  `extra` varchar(255) NOT NULL,
  `read` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_action`
--

LOCK TABLES `zt_action` WRITE;
/*!40000 ALTER TABLE `zt_action` DISABLE KEYS */;
INSERT INTO `zt_action` VALUES (1,'user',1,',0,',0,'root','login','2014-07-28 15:05:06','','','0'),(2,'user',1,',0,',0,'root','login','2014-07-28 15:16:39','','','0');
/*!40000 ALTER TABLE `zt_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_bug`
--

DROP TABLE IF EXISTS `zt_bug`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_bug` (
  `id` mediumint(8) NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toTask` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `toStory` mediumint(8) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `severity` tinyint(4) NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `os` varchar(30) NOT NULL DEFAULT '',
  `browser` varchar(30) NOT NULL DEFAULT '',
  `hardware` varchar(30) NOT NULL,
  `found` varchar(30) NOT NULL DEFAULT '',
  `steps` text NOT NULL,
  `status` enum('active','resolved','closed') NOT NULL DEFAULT 'active',
  `confirmed` tinyint(1) NOT NULL DEFAULT '0',
  `activatedCount` smallint(6) NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `openedBuild` varchar(255) NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `resolvedBy` varchar(30) NOT NULL DEFAULT '',
  `resolution` varchar(30) NOT NULL DEFAULT '',
  `resolvedBuild` varchar(30) NOT NULL DEFAULT '',
  `resolvedDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `duplicateBug` mediumint(8) unsigned NOT NULL,
  `linkBug` varchar(255) NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `caseVersion` smallint(6) NOT NULL DEFAULT '1',
  `result` mediumint(8) unsigned NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_bug`
--

LOCK TABLES `zt_bug` WRITE;
/*!40000 ALTER TABLE `zt_bug` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_bug` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_build`
--

DROP TABLE IF EXISTS `zt_build`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_build` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(150) NOT NULL,
  `scmPath` char(255) NOT NULL,
  `filePath` char(255) NOT NULL,
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `builder` char(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_build`
--

LOCK TABLES `zt_build` WRITE;
/*!40000 ALTER TABLE `zt_build` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_build` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_burn`
--

DROP TABLE IF EXISTS `zt_burn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_burn` (
  `project` mediumint(8) unsigned NOT NULL,
  `date` date NOT NULL,
  `left` float NOT NULL,
  `consumed` float NOT NULL,
  PRIMARY KEY (`project`,`date`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_burn`
--

LOCK TABLES `zt_burn` WRITE;
/*!40000 ALTER TABLE `zt_burn` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_burn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_case`
--

DROP TABLE IF EXISTS `zt_case`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_case` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(30) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `precondition` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `type` char(30) NOT NULL DEFAULT '1',
  `stage` varchar(255) NOT NULL,
  `howRun` varchar(30) NOT NULL,
  `scriptedBy` varchar(30) NOT NULL,
  `scriptedDate` date NOT NULL,
  `scriptStatus` varchar(30) NOT NULL,
  `scriptLocation` varchar(255) NOT NULL,
  `status` char(30) NOT NULL DEFAULT '1',
  `frequency` enum('1','2','3') NOT NULL DEFAULT '1',
  `order` tinyint(30) unsigned NOT NULL DEFAULT '0',
  `openedBy` char(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `lastEditedBy` char(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `linkCase` varchar(255) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_case`
--

LOCK TABLES `zt_case` WRITE;
/*!40000 ALTER TABLE `zt_case` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_case` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_casestep`
--

DROP TABLE IF EXISTS `zt_casestep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_casestep` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(3) unsigned NOT NULL DEFAULT '0',
  `desc` text NOT NULL,
  `expect` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_casestep`
--

LOCK TABLES `zt_casestep` WRITE;
/*!40000 ALTER TABLE `zt_casestep` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_casestep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_company`
--

DROP TABLE IF EXISTS `zt_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_company` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(120) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `fax` char(20) DEFAULT NULL,
  `address` char(120) DEFAULT NULL,
  `zipcode` char(10) DEFAULT NULL,
  `website` char(120) DEFAULT NULL,
  `backyard` char(120) DEFAULT NULL,
  `guest` enum('1','0') NOT NULL DEFAULT '0',
  `admins` char(255) DEFAULT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_company`
--

LOCK TABLES `zt_company` WRITE;
/*!40000 ALTER TABLE `zt_company` DISABLE KEYS */;
INSERT INTO `zt_company` VALUES (1,'zzz',NULL,NULL,NULL,NULL,NULL,NULL,'0',',root,','0');
/*!40000 ALTER TABLE `zt_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_config`
--

DROP TABLE IF EXISTS `zt_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_config` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `owner` char(30) NOT NULL DEFAULT '',
  `module` varchar(30) NOT NULL,
  `section` char(30) NOT NULL DEFAULT '',
  `key` char(30) NOT NULL DEFAULT '',
  `value` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique` (`owner`,`module`,`section`,`key`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_config`
--

LOCK TABLES `zt_config` WRITE;
/*!40000 ALTER TABLE `zt_config` DISABLE KEYS */;
INSERT INTO `zt_config` VALUES (1,'system','common','global','version','6.0'),(2,'system','common','global','flow','full');
/*!40000 ALTER TABLE `zt_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_dept`
--

DROP TABLE IF EXISTS `zt_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_dept` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(60) NOT NULL,
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `position` char(30) NOT NULL DEFAULT '',
  `function` char(255) NOT NULL DEFAULT '',
  `manager` char(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_dept`
--

LOCK TABLES `zt_dept` WRITE;
/*!40000 ALTER TABLE `zt_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_doc`
--

DROP TABLE IF EXISTS `zt_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_doc` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL,
  `lib` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(255) NOT NULL,
  `digest` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `views` smallint(5) unsigned NOT NULL,
  `addedBy` varchar(30) NOT NULL,
  `addedDate` datetime NOT NULL,
  `editedBy` varchar(30) NOT NULL,
  `editedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_doc`
--

LOCK TABLES `zt_doc` WRITE;
/*!40000 ALTER TABLE `zt_doc` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_doclib`
--

DROP TABLE IF EXISTS `zt_doclib`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_doclib` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_doclib`
--

LOCK TABLES `zt_doclib` WRITE;
/*!40000 ALTER TABLE `zt_doclib` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_doclib` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_effort`
--

DROP TABLE IF EXISTS `zt_effort`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_effort` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `user` char(30) NOT NULL DEFAULT '',
  `todo` enum('1','0') NOT NULL DEFAULT '1',
  `date` date NOT NULL DEFAULT '0000-00-00',
  `begin` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `end` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `type` enum('1','2','3') NOT NULL DEFAULT '1',
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  `status` enum('1','2','3') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `user` (`user`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_effort`
--

LOCK TABLES `zt_effort` WRITE;
/*!40000 ALTER TABLE `zt_effort` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_effort` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_extension`
--

DROP TABLE IF EXISTS `zt_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_extension` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  `code` varchar(30) NOT NULL,
  `version` varchar(50) NOT NULL,
  `author` varchar(100) NOT NULL,
  `desc` text NOT NULL,
  `license` text NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'extension',
  `site` varchar(150) NOT NULL,
  `zentaoCompatible` varchar(100) NOT NULL,
  `installedTime` datetime NOT NULL,
  `depends` varchar(100) NOT NULL,
  `dirs` text NOT NULL,
  `files` text NOT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `name` (`name`),
  KEY `addedTime` (`installedTime`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_extension`
--

LOCK TABLES `zt_extension` WRITE;
/*!40000 ALTER TABLE `zt_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_extension` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_file`
--

DROP TABLE IF EXISTS `zt_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_file` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `pathname` char(50) NOT NULL,
  `title` char(90) NOT NULL,
  `extension` char(30) NOT NULL,
  `size` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `objectType` char(30) NOT NULL,
  `objectID` mediumint(9) NOT NULL,
  `addedBy` char(30) NOT NULL DEFAULT '',
  `addedDate` datetime NOT NULL,
  `downloads` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `extra` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_file`
--

LOCK TABLES `zt_file` WRITE;
/*!40000 ALTER TABLE `zt_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_group`
--

DROP TABLE IF EXISTS `zt_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(30) NOT NULL,
  `role` char(30) NOT NULL DEFAULT '',
  `desc` char(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_group`
--

LOCK TABLES `zt_group` WRITE;
/*!40000 ALTER TABLE `zt_group` DISABLE KEYS */;
INSERT INTO `zt_group` VALUES (1,'管理员','admin','系统管理员'),(2,'研发','dev','研发人员'),(3,'测试','qa','测试人员'),(4,'项目经理','pm','项目经理'),(5,'产品经理','po','产品经理'),(6,'研发主管','td','研发主管'),(7,'产品主管','pd','产品主管'),(8,'测试主管','qd','测试主管'),(9,'高层管理','top','高层管理'),(10,'其他','','其他'),(11,'guest','guest','For guest');
/*!40000 ALTER TABLE `zt_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_grouppriv`
--

DROP TABLE IF EXISTS `zt_grouppriv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_grouppriv` (
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` char(30) NOT NULL DEFAULT '',
  `method` char(30) NOT NULL DEFAULT '',
  UNIQUE KEY `group` (`group`,`module`,`method`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_grouppriv`
--

LOCK TABLES `zt_grouppriv` WRITE;
/*!40000 ALTER TABLE `zt_grouppriv` DISABLE KEYS */;
INSERT INTO `zt_grouppriv` VALUES (1,'action','hideAll'),(1,'action','hideOne'),(1,'action','trash'),(1,'action','undelete'),(1,'admin','checkDB'),(1,'admin','index'),(1,'api','getModel'),(1,'bug','activate'),(1,'bug','assignTo'),(1,'bug','batchClose'),(1,'bug','batchEdit'),(1,'bug','browse'),(1,'bug','close'),(1,'bug','confirmBug'),(1,'bug','confirmStoryChange'),(1,'bug','create'),(1,'bug','customFields'),(1,'bug','delete'),(1,'bug','deleteTemplate'),(1,'bug','edit'),(1,'bug','export'),(1,'bug','index'),(1,'bug','report'),(1,'bug','resolve'),(1,'bug','saveTemplate'),(1,'bug','view'),(1,'build','create'),(1,'build','delete'),(1,'build','edit'),(1,'build','view'),(1,'company','browse'),(1,'company','create'),(1,'company','delete'),(1,'company','dynamic'),(1,'company','edit'),(1,'company','index'),(1,'company','view'),(1,'convert','checkBugFree'),(1,'convert','checkConfig'),(1,'convert','checkRedmine'),(1,'convert','convertBugFree'),(1,'convert','convertRedmine'),(1,'convert','execute'),(1,'convert','index'),(1,'convert','selectSource'),(1,'convert','setBugfree'),(1,'convert','setConfig'),(1,'convert','setRedmine'),(1,'dept','browse'),(1,'dept','delete'),(1,'dept','manageChild'),(1,'dept','updateOrder'),(1,'doc','browse'),(1,'doc','create'),(1,'doc','createLib'),(1,'doc','delete'),(1,'doc','deleteLib'),(1,'doc','edit'),(1,'doc','editLib'),(1,'doc','index'),(1,'doc','view'),(1,'editor','delete'),(1,'editor','edit'),(1,'editor','extend'),(1,'editor','index'),(1,'editor','newPage'),(1,'editor','save'),(1,'extension','activate'),(1,'extension','browse'),(1,'extension','deactivate'),(1,'extension','erase'),(1,'extension','install'),(1,'extension','obtain'),(1,'extension','structure'),(1,'extension','uninstall'),(1,'extension','upgrade'),(1,'extension','upload'),(1,'file','delete'),(1,'file','download'),(1,'file','edit'),(1,'group','browse'),(1,'group','copy'),(1,'group','create'),(1,'group','delete'),(1,'group','edit'),(1,'group','manageMember'),(1,'group','managePriv'),(1,'index','index'),(1,'mail','detect'),(1,'mail','edit'),(1,'mail','index'),(1,'mail','save'),(1,'mail','test'),(1,'misc','ping'),(1,'my','bug'),(1,'my','changePassword'),(1,'my','dynamic'),(1,'my','editProfile'),(1,'my','index'),(1,'my','profile'),(1,'my','project'),(1,'my','story'),(1,'my','task'),(1,'my','testCase'),(1,'my','testTask'),(1,'my','todo'),(1,'product','browse'),(1,'product','close'),(1,'product','create'),(1,'product','delete'),(1,'product','doc'),(1,'product','dynamic'),(1,'product','edit'),(1,'product','index'),(1,'product','order'),(1,'product','project'),(1,'product','roadmap'),(1,'product','view'),(1,'productplan','batchUnlinkStory'),(1,'productplan','browse'),(1,'productplan','create'),(1,'productplan','delete'),(1,'productplan','edit'),(1,'productplan','linkStory'),(1,'productplan','unlinkStory'),(1,'productplan','view'),(1,'project','activate'),(1,'project','browse'),(1,'project','bug'),(1,'project','build'),(1,'project','burn'),(1,'project','burnData'),(1,'project','close'),(1,'project','computeBurn'),(1,'project','create'),(1,'project','delete'),(1,'project','doc'),(1,'project','dynamic'),(1,'project','edit'),(1,'project','grouptask'),(1,'project','importBug'),(1,'project','importtask'),(1,'project','index'),(1,'project','linkStory'),(1,'project','manageMembers'),(1,'project','manageProducts'),(1,'project','order'),(1,'project','putoff'),(1,'project','start'),(1,'project','story'),(1,'project','suspend'),(1,'project','task'),(1,'project','team'),(1,'project','testtask'),(1,'project','unlinkMember'),(1,'project','unlinkStory'),(1,'project','view'),(1,'qa','index'),(1,'release','browse'),(1,'release','create'),(1,'release','delete'),(1,'release','edit'),(1,'release','export'),(1,'release','view'),(1,'report','bugAssign'),(1,'report','bugSummary'),(1,'report','index'),(1,'report','productInfo'),(1,'report','projectDeviation'),(1,'report','workload'),(1,'search','buildForm'),(1,'search','buildQuery'),(1,'search','deleteQuery'),(1,'search','saveQuery'),(1,'search','select'),(1,'story','activate'),(1,'story','batchClose'),(1,'story','batchCreate'),(1,'story','batchEdit'),(1,'story','change'),(1,'story','close'),(1,'story','create'),(1,'story','delete'),(1,'story','edit'),(1,'story','export'),(1,'story','report'),(1,'story','review'),(1,'story','tasks'),(1,'story','view'),(1,'svn','apiSync'),(1,'svn','cat'),(1,'svn','diff'),(1,'task','activate'),(1,'task','assignTo'),(1,'task','batchClose'),(1,'task','batchCreate'),(1,'task','batchEdit'),(1,'task','cancel'),(1,'task','close'),(1,'task','confirmStoryChange'),(1,'task','create'),(1,'task','delete'),(1,'task','deleteEstimate'),(1,'task','edit'),(1,'task','editEstimate'),(1,'task','export'),(1,'task','finish'),(1,'task','recordEstimate'),(1,'task','report'),(1,'task','start'),(1,'task','view'),(1,'testcase','batchCreate'),(1,'testcase','batchEdit'),(1,'testcase','browse'),(1,'testcase','confirmStoryChange'),(1,'testcase','create'),(1,'testcase','delete'),(1,'testcase','edit'),(1,'testcase','export'),(1,'testcase','index'),(1,'testcase','view'),(1,'testtask','batchAssign'),(1,'testtask','batchRun'),(1,'testtask','browse'),(1,'testtask','cases'),(1,'testtask','close'),(1,'testtask','create'),(1,'testtask','delete'),(1,'testtask','edit'),(1,'testtask','index'),(1,'testtask','linkcase'),(1,'testtask','results'),(1,'testtask','runcase'),(1,'testtask','start'),(1,'testtask','unlinkcase'),(1,'testtask','view'),(1,'todo','batchCreate'),(1,'todo','batchEdit'),(1,'todo','batchFinish'),(1,'todo','create'),(1,'todo','delete'),(1,'todo','edit'),(1,'todo','export'),(1,'todo','finish'),(1,'todo','import2Today'),(1,'todo','view'),(1,'tree','browse'),(1,'tree','browseTask'),(1,'tree','delete'),(1,'tree','edit'),(1,'tree','fix'),(1,'tree','manageChild'),(1,'tree','updateOrder'),(1,'user','batchCreate'),(1,'user','batchEdit'),(1,'user','bug'),(1,'user','create'),(1,'user','delete'),(1,'user','deleteContacts'),(1,'user','dynamic'),(1,'user','edit'),(1,'user','manageContacts'),(1,'user','profile'),(1,'user','project'),(1,'user','story'),(1,'user','task'),(1,'user','testCase'),(1,'user','testTask'),(1,'user','todo'),(1,'user','unlock'),(1,'user','view'),(2,'api','getModel'),(2,'bug','activate'),(2,'bug','assignTo'),(2,'bug','batchClose'),(2,'bug','batchEdit'),(2,'bug','browse'),(2,'bug','close'),(2,'bug','confirmBug'),(2,'bug','confirmStoryChange'),(2,'bug','create'),(2,'bug','customFields'),(2,'bug','deleteTemplate'),(2,'bug','edit'),(2,'bug','export'),(2,'bug','index'),(2,'bug','report'),(2,'bug','resolve'),(2,'bug','saveTemplate'),(2,'bug','view'),(2,'build','create'),(2,'build','delete'),(2,'build','edit'),(2,'build','view'),(2,'company','browse'),(2,'company','dynamic'),(2,'company','index'),(2,'company','view'),(2,'doc','browse'),(2,'doc','create'),(2,'doc','edit'),(2,'doc','index'),(2,'doc','view'),(2,'file','download'),(2,'file','edit'),(2,'group','browse'),(2,'index','index'),(2,'misc','ping'),(2,'my','bug'),(2,'my','changePassword'),(2,'my','dynamic'),(2,'my','editProfile'),(2,'my','index'),(2,'my','profile'),(2,'my','project'),(2,'my','story'),(2,'my','task'),(2,'my','todo'),(2,'product','browse'),(2,'product','doc'),(2,'product','dynamic'),(2,'product','index'),(2,'product','project'),(2,'product','roadmap'),(2,'product','view'),(2,'productplan','browse'),(2,'productplan','view'),(2,'project','browse'),(2,'project','bug'),(2,'project','build'),(2,'project','burn'),(2,'project','burnData'),(2,'project','computeBurn'),(2,'project','doc'),(2,'project','dynamic'),(2,'project','grouptask'),(2,'project','importBug'),(2,'project','importtask'),(2,'project','index'),(2,'project','story'),(2,'project','task'),(2,'project','team'),(2,'project','testtask'),(2,'project','view'),(2,'qa','index'),(2,'release','browse'),(2,'release','export'),(2,'release','view'),(2,'report','bugAssign'),(2,'report','bugSummary'),(2,'report','index'),(2,'report','productInfo'),(2,'report','projectDeviation'),(2,'report','workload'),(2,'search','buildForm'),(2,'search','buildQuery'),(2,'search','deleteQuery'),(2,'search','saveQuery'),(2,'search','select'),(2,'story','export'),(2,'story','report'),(2,'story','tasks'),(2,'story','view'),(2,'svn','apiSync'),(2,'svn','cat'),(2,'svn','diff'),(2,'task','activate'),(2,'task','assignTo'),(2,'task','batchClose'),(2,'task','batchCreate'),(2,'task','batchEdit'),(2,'task','cancel'),(2,'task','close'),(2,'task','confirmStoryChange'),(2,'task','create'),(2,'task','deleteEstimate'),(2,'task','edit'),(2,'task','editEstimate'),(2,'task','export'),(2,'task','finish'),(2,'task','recordEstimate'),(2,'task','report'),(2,'task','start'),(2,'task','view'),(2,'testcase','browse'),(2,'testcase','export'),(2,'testcase','index'),(2,'testcase','view'),(2,'testtask','browse'),(2,'testtask','cases'),(2,'testtask','create'),(2,'testtask','edit'),(2,'testtask','index'),(2,'testtask','results'),(2,'testtask','view'),(2,'todo','batchCreate'),(2,'todo','batchEdit'),(2,'todo','batchFinish'),(2,'todo','create'),(2,'todo','delete'),(2,'todo','edit'),(2,'todo','export'),(2,'todo','finish'),(2,'todo','import2Today'),(2,'todo','view'),(2,'user','bug'),(2,'user','deleteContacts'),(2,'user','dynamic'),(2,'user','manageContacts'),(2,'user','profile'),(2,'user','project'),(2,'user','story'),(2,'user','task'),(2,'user','testCase'),(2,'user','testTask'),(2,'user','todo'),(2,'user','view'),(3,'api','getModel'),(3,'bug','activate'),(3,'bug','assignTo'),(3,'bug','batchClose'),(3,'bug','batchEdit'),(3,'bug','browse'),(3,'bug','close'),(3,'bug','confirmBug'),(3,'bug','confirmStoryChange'),(3,'bug','create'),(3,'bug','customFields'),(3,'bug','deleteTemplate'),(3,'bug','edit'),(3,'bug','export'),(3,'bug','index'),(3,'bug','report'),(3,'bug','resolve'),(3,'bug','saveTemplate'),(3,'bug','view'),(3,'build','create'),(3,'build','edit'),(3,'build','view'),(3,'company','browse'),(3,'company','dynamic'),(3,'company','index'),(3,'company','view'),(3,'doc','browse'),(3,'doc','create'),(3,'doc','edit'),(3,'doc','editLib'),(3,'doc','index'),(3,'doc','view'),(3,'file','download'),(3,'file','edit'),(3,'group','browse'),(3,'index','index'),(3,'misc','ping'),(3,'my','bug'),(3,'my','changePassword'),(3,'my','dynamic'),(3,'my','editProfile'),(3,'my','index'),(3,'my','profile'),(3,'my','project'),(3,'my','story'),(3,'my','task'),(3,'my','testCase'),(3,'my','testTask'),(3,'my','todo'),(3,'product','browse'),(3,'product','doc'),(3,'product','dynamic'),(3,'product','index'),(3,'product','project'),(3,'product','roadmap'),(3,'product','view'),(3,'productplan','browse'),(3,'productplan','view'),(3,'project','browse'),(3,'project','bug'),(3,'project','build'),(3,'project','burn'),(3,'project','burnData'),(3,'project','computeBurn'),(3,'project','doc'),(3,'project','dynamic'),(3,'project','grouptask'),(3,'project','importBug'),(3,'project','importtask'),(3,'project','index'),(3,'project','story'),(3,'project','task'),(3,'project','team'),(3,'project','testtask'),(3,'project','view'),(3,'qa','index'),(3,'release','browse'),(3,'release','export'),(3,'release','view'),(3,'report','bugAssign'),(3,'report','bugSummary'),(3,'report','index'),(3,'report','productInfo'),(3,'report','projectDeviation'),(3,'report','workload'),(3,'search','buildForm'),(3,'search','buildQuery'),(3,'search','deleteQuery'),(3,'search','saveQuery'),(3,'search','select'),(3,'story','export'),(3,'story','report'),(3,'story','tasks'),(3,'story','view'),(3,'svn','apiSync'),(3,'svn','cat'),(3,'svn','diff'),(3,'task','activate'),(3,'task','assignTo'),(3,'task','batchClose'),(3,'task','batchCreate'),(3,'task','batchEdit'),(3,'task','cancel'),(3,'task','close'),(3,'task','confirmStoryChange'),(3,'task','create'),(3,'task','deleteEstimate'),(3,'task','edit'),(3,'task','editEstimate'),(3,'task','export'),(3,'task','finish'),(3,'task','recordEstimate'),(3,'task','report'),(3,'task','start'),(3,'task','view'),(3,'testcase','batchCreate'),(3,'testcase','batchEdit'),(3,'testcase','browse'),(3,'testcase','confirmStoryChange'),(3,'testcase','create'),(3,'testcase','edit'),(3,'testcase','export'),(3,'testcase','index'),(3,'testcase','view'),(3,'testtask','batchAssign'),(3,'testtask','batchRun'),(3,'testtask','browse'),(3,'testtask','cases'),(3,'testtask','close'),(3,'testtask','create'),(3,'testtask','edit'),(3,'testtask','index'),(3,'testtask','linkcase'),(3,'testtask','results'),(3,'testtask','runcase'),(3,'testtask','start'),(3,'testtask','unlinkcase'),(3,'testtask','view'),(3,'todo','batchCreate'),(3,'todo','batchEdit'),(3,'todo','batchFinish'),(3,'todo','create'),(3,'todo','delete'),(3,'todo','edit'),(3,'todo','export'),(3,'todo','finish'),(3,'todo','import2Today'),(3,'todo','view'),(3,'tree','browse'),(3,'tree','browseTask'),(3,'tree','edit'),(3,'tree','fix'),(3,'tree','manageChild'),(3,'tree','updateOrder'),(3,'user','bug'),(3,'user','deleteContacts'),(3,'user','dynamic'),(3,'user','manageContacts'),(3,'user','profile'),(3,'user','project'),(3,'user','story'),(3,'user','task'),(3,'user','testCase'),(3,'user','testTask'),(3,'user','todo'),(3,'user','view'),(4,'action','hideAll'),(4,'action','hideOne'),(4,'action','trash'),(4,'action','undelete'),(4,'admin','index'),(4,'api','getModel'),(4,'bug','activate'),(4,'bug','assignTo'),(4,'bug','batchClose'),(4,'bug','batchEdit'),(4,'bug','browse'),(4,'bug','close'),(4,'bug','confirmBug'),(4,'bug','confirmStoryChange'),(4,'bug','create'),(4,'bug','customFields'),(4,'bug','delete'),(4,'bug','deleteTemplate'),(4,'bug','edit'),(4,'bug','export'),(4,'bug','index'),(4,'bug','report'),(4,'bug','resolve'),(4,'bug','saveTemplate'),(4,'bug','view'),(4,'build','create'),(4,'build','delete'),(4,'build','edit'),(4,'build','view'),(4,'company','browse'),(4,'company','dynamic'),(4,'company','index'),(4,'company','view'),(4,'doc','browse'),(4,'doc','create'),(4,'doc','createLib'),(4,'doc','delete'),(4,'doc','deleteLib'),(4,'doc','edit'),(4,'doc','editLib'),(4,'doc','index'),(4,'doc','view'),(4,'extension','browse'),(4,'extension','obtain'),(4,'extension','structure'),(4,'file','delete'),(4,'file','download'),(4,'file','edit'),(4,'group','browse'),(4,'index','index'),(4,'misc','ping'),(4,'my','bug'),(4,'my','changePassword'),(4,'my','dynamic'),(4,'my','editProfile'),(4,'my','index'),(4,'my','profile'),(4,'my','project'),(4,'my','story'),(4,'my','task'),(4,'my','testCase'),(4,'my','testTask'),(4,'my','todo'),(4,'product','browse'),(4,'product','doc'),(4,'product','dynamic'),(4,'product','index'),(4,'product','project'),(4,'product','roadmap'),(4,'product','view'),(4,'productplan','browse'),(4,'productplan','view'),(4,'project','activate'),(4,'project','browse'),(4,'project','bug'),(4,'project','build'),(4,'project','burn'),(4,'project','burnData'),(4,'project','close'),(4,'project','computeBurn'),(4,'project','create'),(4,'project','delete'),(4,'project','doc'),(4,'project','dynamic'),(4,'project','edit'),(4,'project','grouptask'),(4,'project','importBug'),(4,'project','importtask'),(4,'project','index'),(4,'project','linkStory'),(4,'project','manageMembers'),(4,'project','manageProducts'),(4,'project','order'),(4,'project','putoff'),(4,'project','start'),(4,'project','story'),(4,'project','suspend'),(4,'project','task'),(4,'project','team'),(4,'project','testtask'),(4,'project','unlinkMember'),(4,'project','unlinkStory'),(4,'project','view'),(4,'qa','index'),(4,'release','browse'),(4,'release','export'),(4,'release','view'),(4,'report','bugAssign'),(4,'report','bugSummary'),(4,'report','index'),(4,'report','productInfo'),(4,'report','projectDeviation'),(4,'report','workload'),(4,'search','buildForm'),(4,'search','buildQuery'),(4,'search','deleteQuery'),(4,'search','saveQuery'),(4,'search','select'),(4,'story','export'),(4,'story','report'),(4,'story','tasks'),(4,'story','view'),(4,'svn','apiSync'),(4,'svn','cat'),(4,'svn','diff'),(4,'task','activate'),(4,'task','assignTo'),(4,'task','batchClose'),(4,'task','batchCreate'),(4,'task','batchEdit'),(4,'task','cancel'),(4,'task','close'),(4,'task','confirmStoryChange'),(4,'task','create'),(4,'task','delete'),(4,'task','deleteEstimate'),(4,'task','edit'),(4,'task','editEstimate'),(4,'task','export'),(4,'task','finish'),(4,'task','recordEstimate'),(4,'task','report'),(4,'task','start'),(4,'task','view'),(4,'testcase','browse'),(4,'testcase','export'),(4,'testcase','index'),(4,'testcase','view'),(4,'testtask','browse'),(4,'testtask','cases'),(4,'testtask','create'),(4,'testtask','edit'),(4,'testtask','index'),(4,'testtask','results'),(4,'testtask','view'),(4,'todo','batchCreate'),(4,'todo','batchEdit'),(4,'todo','batchFinish'),(4,'todo','create'),(4,'todo','delete'),(4,'todo','edit'),(4,'todo','export'),(4,'todo','finish'),(4,'todo','import2Today'),(4,'todo','view'),(4,'tree','browse'),(4,'tree','browseTask'),(4,'tree','delete'),(4,'tree','edit'),(4,'tree','fix'),(4,'tree','manageChild'),(4,'tree','updateOrder'),(4,'user','bug'),(4,'user','deleteContacts'),(4,'user','dynamic'),(4,'user','manageContacts'),(4,'user','profile'),(4,'user','project'),(4,'user','story'),(4,'user','task'),(4,'user','testCase'),(4,'user','testTask'),(4,'user','todo'),(4,'user','view'),(5,'action','hideAll'),(5,'action','hideOne'),(5,'action','trash'),(5,'action','undelete'),(5,'admin','index'),(5,'api','getModel'),(5,'bug','activate'),(5,'bug','assignTo'),(5,'bug','batchClose'),(5,'bug','batchEdit'),(5,'bug','browse'),(5,'bug','close'),(5,'bug','confirmBug'),(5,'bug','confirmStoryChange'),(5,'bug','create'),(5,'bug','customFields'),(5,'bug','deleteTemplate'),(5,'bug','edit'),(5,'bug','export'),(5,'bug','index'),(5,'bug','report'),(5,'bug','resolve'),(5,'bug','saveTemplate'),(5,'bug','view'),(5,'build','view'),(5,'company','browse'),(5,'company','dynamic'),(5,'company','index'),(5,'company','view'),(5,'doc','browse'),(5,'doc','create'),(5,'doc','createLib'),(5,'doc','delete'),(5,'doc','deleteLib'),(5,'doc','edit'),(5,'doc','editLib'),(5,'doc','index'),(5,'doc','view'),(5,'extension','browse'),(5,'extension','obtain'),(5,'extension','structure'),(5,'file','delete'),(5,'file','download'),(5,'file','edit'),(5,'group','browse'),(5,'index','index'),(5,'misc','ping'),(5,'my','bug'),(5,'my','changePassword'),(5,'my','dynamic'),(5,'my','editProfile'),(5,'my','index'),(5,'my','profile'),(5,'my','project'),(5,'my','story'),(5,'my','task'),(5,'my','testCase'),(5,'my','testTask'),(5,'my','todo'),(5,'product','browse'),(5,'product','close'),(5,'product','create'),(5,'product','delete'),(5,'product','doc'),(5,'product','dynamic'),(5,'product','edit'),(5,'product','index'),(5,'product','order'),(5,'product','project'),(5,'product','roadmap'),(5,'product','view'),(5,'productplan','batchUnlinkStory'),(5,'productplan','browse'),(5,'productplan','create'),(5,'productplan','delete'),(5,'productplan','edit'),(5,'productplan','linkStory'),(5,'productplan','unlinkStory'),(5,'productplan','view'),(5,'project','browse'),(5,'project','bug'),(5,'project','build'),(5,'project','burn'),(5,'project','burnData'),(5,'project','doc'),(5,'project','dynamic'),(5,'project','grouptask'),(5,'project','index'),(5,'project','linkStory'),(5,'project','manageProducts'),(5,'project','story'),(5,'project','task'),(5,'project','team'),(5,'project','testtask'),(5,'project','unlinkStory'),(5,'project','view'),(5,'qa','index'),(5,'release','browse'),(5,'release','create'),(5,'release','delete'),(5,'release','edit'),(5,'release','export'),(5,'release','view'),(5,'report','bugAssign'),(5,'report','bugSummary'),(5,'report','index'),(5,'report','productInfo'),(5,'report','projectDeviation'),(5,'report','workload'),(5,'search','buildForm'),(5,'search','buildQuery'),(5,'search','deleteQuery'),(5,'search','saveQuery'),(5,'search','select'),(5,'story','activate'),(5,'story','batchClose'),(5,'story','batchCreate'),(5,'story','batchEdit'),(5,'story','change'),(5,'story','close'),(5,'story','create'),(5,'story','delete'),(5,'story','edit'),(5,'story','export'),(5,'story','report'),(5,'story','review'),(5,'story','tasks'),(5,'story','view'),(5,'svn','apiSync'),(5,'svn','cat'),(5,'svn','diff'),(5,'task','deleteEstimate'),(5,'task','editEstimate'),(5,'task','export'),(5,'task','recordEstimate'),(5,'task','report'),(5,'task','view'),(5,'testcase','browse'),(5,'testcase','export'),(5,'testcase','index'),(5,'testcase','view'),(5,'testtask','browse'),(5,'testtask','cases'),(5,'testtask','index'),(5,'testtask','results'),(5,'testtask','view'),(5,'todo','batchCreate'),(5,'todo','batchEdit'),(5,'todo','batchFinish'),(5,'todo','create'),(5,'todo','delete'),(5,'todo','edit'),(5,'todo','export'),(5,'todo','finish'),(5,'todo','import2Today'),(5,'todo','view'),(5,'tree','browse'),(5,'tree','browseTask'),(5,'tree','delete'),(5,'tree','edit'),(5,'tree','fix'),(5,'tree','manageChild'),(5,'tree','updateOrder'),(5,'user','bug'),(5,'user','deleteContacts'),(5,'user','dynamic'),(5,'user','manageContacts'),(5,'user','profile'),(5,'user','project'),(5,'user','story'),(5,'user','task'),(5,'user','testCase'),(5,'user','testTask'),(5,'user','todo'),(5,'user','view'),(6,'action','hideAll'),(6,'action','hideOne'),(6,'action','trash'),(6,'action','undelete'),(6,'admin','index'),(6,'api','getModel'),(6,'bug','activate'),(6,'bug','assignTo'),(6,'bug','batchClose'),(6,'bug','batchEdit'),(6,'bug','browse'),(6,'bug','close'),(6,'bug','confirmBug'),(6,'bug','confirmStoryChange'),(6,'bug','create'),(6,'bug','customFields'),(6,'bug','delete'),(6,'bug','deleteTemplate'),(6,'bug','edit'),(6,'bug','export'),(6,'bug','index'),(6,'bug','report'),(6,'bug','resolve'),(6,'bug','saveTemplate'),(6,'bug','view'),(6,'build','create'),(6,'build','delete'),(6,'build','edit'),(6,'build','view'),(6,'company','browse'),(6,'company','dynamic'),(6,'company','index'),(6,'company','view'),(6,'doc','browse'),(6,'doc','create'),(6,'doc','createLib'),(6,'doc','delete'),(6,'doc','deleteLib'),(6,'doc','edit'),(6,'doc','editLib'),(6,'doc','index'),(6,'doc','view'),(6,'extension','browse'),(6,'extension','obtain'),(6,'extension','structure'),(6,'file','delete'),(6,'file','download'),(6,'file','edit'),(6,'group','browse'),(6,'index','index'),(6,'misc','ping'),(6,'my','bug'),(6,'my','changePassword'),(6,'my','dynamic'),(6,'my','editProfile'),(6,'my','index'),(6,'my','profile'),(6,'my','project'),(6,'my','story'),(6,'my','task'),(6,'my','testCase'),(6,'my','testTask'),(6,'my','todo'),(6,'product','browse'),(6,'product','doc'),(6,'product','dynamic'),(6,'product','index'),(6,'product','project'),(6,'product','roadmap'),(6,'product','view'),(6,'productplan','browse'),(6,'productplan','view'),(6,'project','activate'),(6,'project','browse'),(6,'project','bug'),(6,'project','build'),(6,'project','burn'),(6,'project','burnData'),(6,'project','close'),(6,'project','computeBurn'),(6,'project','create'),(6,'project','delete'),(6,'project','doc'),(6,'project','dynamic'),(6,'project','edit'),(6,'project','grouptask'),(6,'project','importBug'),(6,'project','importtask'),(6,'project','index'),(6,'project','linkStory'),(6,'project','manageMembers'),(6,'project','manageProducts'),(6,'project','order'),(6,'project','putoff'),(6,'project','start'),(6,'project','story'),(6,'project','suspend'),(6,'project','task'),(6,'project','team'),(6,'project','testtask'),(6,'project','unlinkMember'),(6,'project','unlinkStory'),(6,'project','view'),(6,'qa','index'),(6,'release','browse'),(6,'release','export'),(6,'release','view'),(6,'report','bugAssign'),(6,'report','bugSummary'),(6,'report','index'),(6,'report','productInfo'),(6,'report','projectDeviation'),(6,'report','workload'),(6,'search','buildForm'),(6,'search','buildQuery'),(6,'search','deleteQuery'),(6,'search','saveQuery'),(6,'search','select'),(6,'story','export'),(6,'story','report'),(6,'story','tasks'),(6,'story','view'),(6,'svn','apiSync'),(6,'svn','cat'),(6,'svn','diff'),(6,'task','activate'),(6,'task','assignTo'),(6,'task','batchClose'),(6,'task','batchCreate'),(6,'task','batchEdit'),(6,'task','cancel'),(6,'task','close'),(6,'task','confirmStoryChange'),(6,'task','create'),(6,'task','delete'),(6,'task','deleteEstimate'),(6,'task','edit'),(6,'task','editEstimate'),(6,'task','export'),(6,'task','finish'),(6,'task','recordEstimate'),(6,'task','report'),(6,'task','start'),(6,'task','view'),(6,'testcase','browse'),(6,'testcase','export'),(6,'testcase','index'),(6,'testcase','view'),(6,'testtask','browse'),(6,'testtask','cases'),(6,'testtask','create'),(6,'testtask','edit'),(6,'testtask','index'),(6,'testtask','results'),(6,'testtask','view'),(6,'todo','batchCreate'),(6,'todo','batchEdit'),(6,'todo','batchFinish'),(6,'todo','create'),(6,'todo','delete'),(6,'todo','edit'),(6,'todo','export'),(6,'todo','finish'),(6,'todo','import2Today'),(6,'todo','view'),(6,'user','bug'),(6,'user','deleteContacts'),(6,'user','dynamic'),(6,'user','manageContacts'),(6,'user','profile'),(6,'user','project'),(6,'user','story'),(6,'user','task'),(6,'user','testCase'),(6,'user','testTask'),(6,'user','todo'),(6,'user','view'),(7,'action','hideAll'),(7,'action','hideOne'),(7,'action','trash'),(7,'action','undelete'),(7,'admin','checkDB'),(7,'admin','index'),(7,'api','getModel'),(7,'bug','activate'),(7,'bug','assignTo'),(7,'bug','batchClose'),(7,'bug','batchEdit'),(7,'bug','browse'),(7,'bug','close'),(7,'bug','confirmBug'),(7,'bug','confirmStoryChange'),(7,'bug','create'),(7,'bug','customFields'),(7,'bug','delete'),(7,'bug','deleteTemplate'),(7,'bug','edit'),(7,'bug','export'),(7,'bug','index'),(7,'bug','report'),(7,'bug','resolve'),(7,'bug','saveTemplate'),(7,'bug','view'),(7,'build','view'),(7,'company','browse'),(7,'company','dynamic'),(7,'company','index'),(7,'company','view'),(7,'doc','browse'),(7,'doc','create'),(7,'doc','createLib'),(7,'doc','delete'),(7,'doc','deleteLib'),(7,'doc','edit'),(7,'doc','editLib'),(7,'doc','index'),(7,'doc','view'),(7,'extension','browse'),(7,'extension','obtain'),(7,'extension','structure'),(7,'file','delete'),(7,'file','download'),(7,'file','edit'),(7,'group','browse'),(7,'index','index'),(7,'misc','ping'),(7,'my','bug'),(7,'my','changePassword'),(7,'my','dynamic'),(7,'my','editProfile'),(7,'my','index'),(7,'my','profile'),(7,'my','project'),(7,'my','story'),(7,'my','task'),(7,'my','testCase'),(7,'my','testTask'),(7,'my','todo'),(7,'product','browse'),(7,'product','close'),(7,'product','create'),(7,'product','delete'),(7,'product','doc'),(7,'product','dynamic'),(7,'product','edit'),(7,'product','index'),(7,'product','order'),(7,'product','project'),(7,'product','roadmap'),(7,'product','view'),(7,'productplan','batchUnlinkStory'),(7,'productplan','browse'),(7,'productplan','create'),(7,'productplan','delete'),(7,'productplan','edit'),(7,'productplan','linkStory'),(7,'productplan','unlinkStory'),(7,'productplan','view'),(7,'project','browse'),(7,'project','bug'),(7,'project','build'),(7,'project','burn'),(7,'project','burnData'),(7,'project','doc'),(7,'project','dynamic'),(7,'project','grouptask'),(7,'project','index'),(7,'project','linkStory'),(7,'project','manageProducts'),(7,'project','story'),(7,'project','task'),(7,'project','team'),(7,'project','testtask'),(7,'project','unlinkStory'),(7,'project','view'),(7,'qa','index'),(7,'release','browse'),(7,'release','create'),(7,'release','delete'),(7,'release','edit'),(7,'release','export'),(7,'release','view'),(7,'report','bugAssign'),(7,'report','bugSummary'),(7,'report','index'),(7,'report','productInfo'),(7,'report','projectDeviation'),(7,'report','workload'),(7,'search','buildForm'),(7,'search','buildQuery'),(7,'search','deleteQuery'),(7,'search','saveQuery'),(7,'search','select'),(7,'story','activate'),(7,'story','batchClose'),(7,'story','batchCreate'),(7,'story','batchEdit'),(7,'story','change'),(7,'story','close'),(7,'story','create'),(7,'story','delete'),(7,'story','edit'),(7,'story','export'),(7,'story','report'),(7,'story','review'),(7,'story','tasks'),(7,'story','view'),(7,'svn','apiSync'),(7,'svn','cat'),(7,'svn','diff'),(7,'task','deleteEstimate'),(7,'task','editEstimate'),(7,'task','export'),(7,'task','recordEstimate'),(7,'task','report'),(7,'task','view'),(7,'testcase','browse'),(7,'testcase','export'),(7,'testcase','index'),(7,'testcase','view'),(7,'testtask','browse'),(7,'testtask','cases'),(7,'testtask','index'),(7,'testtask','results'),(7,'testtask','view'),(7,'todo','batchCreate'),(7,'todo','batchEdit'),(7,'todo','batchFinish'),(7,'todo','create'),(7,'todo','delete'),(7,'todo','edit'),(7,'todo','export'),(7,'todo','finish'),(7,'todo','import2Today'),(7,'todo','view'),(7,'tree','browse'),(7,'tree','browseTask'),(7,'tree','delete'),(7,'tree','edit'),(7,'tree','fix'),(7,'tree','manageChild'),(7,'tree','updateOrder'),(7,'user','bug'),(7,'user','deleteContacts'),(7,'user','dynamic'),(7,'user','manageContacts'),(7,'user','profile'),(7,'user','project'),(7,'user','story'),(7,'user','task'),(7,'user','testCase'),(7,'user','testTask'),(7,'user','todo'),(7,'user','view'),(8,'action','hideAll'),(8,'action','hideOne'),(8,'action','trash'),(8,'action','undelete'),(8,'admin','index'),(8,'bug','activate'),(8,'bug','assignTo'),(8,'bug','batchClose'),(8,'bug','batchEdit'),(8,'bug','browse'),(8,'bug','close'),(8,'bug','confirmBug'),(8,'bug','confirmStoryChange'),(8,'bug','create'),(8,'bug','customFields'),(8,'bug','delete'),(8,'bug','deleteTemplate'),(8,'bug','edit'),(8,'bug','export'),(8,'bug','index'),(8,'bug','report'),(8,'bug','resolve'),(8,'bug','saveTemplate'),(8,'bug','view'),(8,'build','create'),(8,'build','delete'),(8,'build','edit'),(8,'build','view'),(8,'company','browse'),(8,'company','dynamic'),(8,'company','index'),(8,'company','view'),(8,'doc','browse'),(8,'doc','create'),(8,'doc','createLib'),(8,'doc','delete'),(8,'doc','deleteLib'),(8,'doc','edit'),(8,'doc','editLib'),(8,'doc','index'),(8,'doc','view'),(8,'extension','browse'),(8,'extension','obtain'),(8,'extension','structure'),(8,'file','delete'),(8,'file','download'),(8,'file','edit'),(8,'group','browse'),(8,'index','index'),(8,'misc','ping'),(8,'my','bug'),(8,'my','changePassword'),(8,'my','dynamic'),(8,'my','editProfile'),(8,'my','index'),(8,'my','profile'),(8,'my','project'),(8,'my','story'),(8,'my','task'),(8,'my','testCase'),(8,'my','testTask'),(8,'my','todo'),(8,'product','browse'),(8,'product','doc'),(8,'product','dynamic'),(8,'product','index'),(8,'product','project'),(8,'product','roadmap'),(8,'product','view'),(8,'productplan','browse'),(8,'productplan','view'),(8,'project','bug'),(8,'project','build'),(8,'project','burn'),(8,'project','burnData'),(8,'project','doc'),(8,'project','dynamic'),(8,'project','grouptask'),(8,'project','importBug'),(8,'project','importtask'),(8,'project','index'),(8,'project','story'),(8,'project','task'),(8,'project','team'),(8,'project','testtask'),(8,'project','view'),(8,'qa','index'),(8,'release','browse'),(8,'release','export'),(8,'release','view'),(8,'report','bugAssign'),(8,'report','bugSummary'),(8,'report','index'),(8,'report','productInfo'),(8,'report','projectDeviation'),(8,'report','workload'),(8,'search','buildForm'),(8,'search','buildQuery'),(8,'search','deleteQuery'),(8,'search','saveQuery'),(8,'search','select'),(8,'story','export'),(8,'story','report'),(8,'story','tasks'),(8,'story','view'),(8,'svn','apiSync'),(8,'svn','cat'),(8,'svn','diff'),(8,'task','activate'),(8,'task','assignTo'),(8,'task','batchClose'),(8,'task','batchCreate'),(8,'task','batchEdit'),(8,'task','cancel'),(8,'task','close'),(8,'task','confirmStoryChange'),(8,'task','create'),(8,'task','delete'),(8,'task','deleteEstimate'),(8,'task','edit'),(8,'task','editEstimate'),(8,'task','export'),(8,'task','finish'),(8,'task','recordEstimate'),(8,'task','report'),(8,'task','start'),(8,'task','view'),(8,'testcase','batchCreate'),(8,'testcase','batchEdit'),(8,'testcase','browse'),(8,'testcase','confirmStoryChange'),(8,'testcase','create'),(8,'testcase','delete'),(8,'testcase','edit'),(8,'testcase','export'),(8,'testcase','index'),(8,'testcase','view'),(8,'testtask','batchAssign'),(8,'testtask','batchRun'),(8,'testtask','browse'),(8,'testtask','cases'),(8,'testtask','close'),(8,'testtask','create'),(8,'testtask','delete'),(8,'testtask','edit'),(8,'testtask','index'),(8,'testtask','linkcase'),(8,'testtask','results'),(8,'testtask','runcase'),(8,'testtask','start'),(8,'testtask','unlinkcase'),(8,'testtask','view'),(8,'todo','batchCreate'),(8,'todo','batchEdit'),(8,'todo','create'),(8,'todo','delete'),(8,'todo','edit'),(8,'todo','export'),(8,'todo','finish'),(8,'todo','import2Today'),(8,'todo','view'),(8,'tree','browse'),(8,'tree','browseTask'),(8,'tree','delete'),(8,'tree','edit'),(8,'tree','fix'),(8,'tree','manageChild'),(8,'tree','updateOrder'),(8,'user','bug'),(8,'user','deleteContacts'),(8,'user','dynamic'),(8,'user','manageContacts'),(8,'user','profile'),(8,'user','project'),(8,'user','story'),(8,'user','task'),(8,'user','testCase'),(8,'user','testTask'),(8,'user','todo'),(8,'user','view'),(9,'action','hideAll'),(9,'action','hideOne'),(9,'action','trash'),(9,'action','undelete'),(9,'admin','index'),(9,'api','getModel'),(9,'bug','browse'),(9,'bug','customFields'),(9,'bug','export'),(9,'bug','index'),(9,'bug','report'),(9,'bug','view'),(9,'build','view'),(9,'company','browse'),(9,'company','dynamic'),(9,'company','edit'),(9,'company','index'),(9,'company','view'),(9,'dept','browse'),(9,'dept','delete'),(9,'dept','manageChild'),(9,'dept','updateOrder'),(9,'doc','browse'),(9,'doc','index'),(9,'doc','view'),(9,'extension','browse'),(9,'extension','obtain'),(9,'extension','structure'),(9,'file','delete'),(9,'file','download'),(9,'file','edit'),(9,'group','browse'),(9,'index','index'),(9,'misc','ping'),(9,'my','bug'),(9,'my','changePassword'),(9,'my','dynamic'),(9,'my','editProfile'),(9,'my','index'),(9,'my','profile'),(9,'my','project'),(9,'my','story'),(9,'my','task'),(9,'my','testCase'),(9,'my','testTask'),(9,'my','todo'),(9,'product','browse'),(9,'product','doc'),(9,'product','dynamic'),(9,'product','index'),(9,'product','project'),(9,'product','roadmap'),(9,'product','view'),(9,'productplan','browse'),(9,'productplan','view'),(9,'project','browse'),(9,'project','bug'),(9,'project','build'),(9,'project','burn'),(9,'project','burnData'),(9,'project','computeBurn'),(9,'project','doc'),(9,'project','dynamic'),(9,'project','grouptask'),(9,'project','index'),(9,'project','story'),(9,'project','task'),(9,'project','team'),(9,'project','view'),(9,'qa','index'),(9,'release','browse'),(9,'release','export'),(9,'release','view'),(9,'report','bugAssign'),(9,'report','bugSummary'),(9,'report','index'),(9,'report','productInfo'),(9,'report','projectDeviation'),(9,'report','workload'),(9,'search','buildForm'),(9,'search','buildQuery'),(9,'search','deleteQuery'),(9,'search','saveQuery'),(9,'search','select'),(9,'story','export'),(9,'story','report'),(9,'story','review'),(9,'story','tasks'),(9,'story','view'),(9,'svn','apiSync'),(9,'svn','cat'),(9,'svn','diff'),(9,'task','deleteEstimate'),(9,'task','editEstimate'),(9,'task','export'),(9,'task','recordEstimate'),(9,'task','report'),(9,'task','view'),(9,'testcase','browse'),(9,'testcase','export'),(9,'testcase','index'),(9,'testcase','view'),(9,'testtask','browse'),(9,'testtask','cases'),(9,'testtask','index'),(9,'testtask','results'),(9,'testtask','view'),(9,'todo','batchCreate'),(9,'todo','batchEdit'),(9,'todo','batchFinish'),(9,'todo','create'),(9,'todo','delete'),(9,'todo','edit'),(9,'todo','export'),(9,'todo','finish'),(9,'todo','import2Today'),(9,'todo','view'),(9,'user','bug'),(9,'user','dynamic'),(9,'user','profile'),(9,'user','project'),(9,'user','story'),(9,'user','task'),(9,'user','testCase'),(9,'user','testTask'),(9,'user','todo'),(9,'user','view'),(10,'api','getModel'),(10,'bug','activate'),(10,'bug','browse'),(10,'bug','close'),(10,'bug','create'),(10,'bug','edit'),(10,'bug','index'),(10,'bug','report'),(10,'bug','view'),(10,'build','view'),(10,'company','browse'),(10,'company','dynamic'),(10,'company','index'),(10,'company','view'),(10,'doc','browse'),(10,'doc','index'),(10,'doc','view'),(10,'file','download'),(10,'index','index'),(10,'misc','ping'),(10,'my','changePassword'),(10,'my','dynamic'),(10,'my','editProfile'),(10,'my','index'),(10,'my','profile'),(10,'my','task'),(10,'my','todo'),(10,'product','browse'),(10,'product','doc'),(10,'product','dynamic'),(10,'product','index'),(10,'product','roadmap'),(10,'product','view'),(10,'productplan','browse'),(10,'productplan','view'),(10,'project','browse'),(10,'project','bug'),(10,'project','build'),(10,'project','burn'),(10,'project','doc'),(10,'project','dynamic'),(10,'project','grouptask'),(10,'project','index'),(10,'project','story'),(10,'project','task'),(10,'project','team'),(10,'project','testtask'),(10,'project','view'),(10,'qa','index'),(10,'release','browse'),(10,'release','view'),(10,'report','bugAssign'),(10,'report','bugSummary'),(10,'report','index'),(10,'report','productInfo'),(10,'report','projectDeviation'),(10,'report','workload'),(10,'search','buildForm'),(10,'search','buildQuery'),(10,'search','deleteQuery'),(10,'search','saveQuery'),(10,'story','tasks'),(10,'story','view'),(10,'task','deleteEstimate'),(10,'task','editEstimate'),(10,'task','recordEstimate'),(10,'task','view'),(10,'todo','batchCreate'),(10,'todo','batchEdit'),(10,'todo','batchFinish'),(10,'todo','create'),(10,'todo','delete'),(10,'todo','edit'),(10,'todo','export'),(10,'todo','finish'),(10,'todo','import2Today'),(10,'todo','view'),(10,'user','bug'),(10,'user','dynamic'),(10,'user','profile'),(10,'user','project'),(10,'user','story'),(10,'user','task'),(10,'user','testCase'),(10,'user','testTask'),(10,'user','todo'),(10,'user','view'),(11,'bug','browse'),(11,'bug','index'),(11,'bug','report'),(11,'bug','view'),(11,'build','view'),(11,'company','browse'),(11,'company','dynamic'),(11,'company','index'),(11,'company','view'),(11,'doc','browse'),(11,'doc','index'),(11,'doc','view'),(11,'file','download'),(11,'group','browse'),(11,'index','index'),(11,'misc','ping'),(11,'my','index'),(11,'product','browse'),(11,'product','doc'),(11,'product','dynamic'),(11,'product','index'),(11,'product','roadmap'),(11,'product','view'),(11,'productplan','browse'),(11,'productplan','view'),(11,'project','browse'),(11,'project','bug'),(11,'project','build'),(11,'project','burn'),(11,'project','doc'),(11,'project','dynamic'),(11,'project','grouptask'),(11,'project','index'),(11,'project','story'),(11,'project','task'),(11,'project','team'),(11,'project','testtask'),(11,'project','view'),(11,'qa','index'),(11,'release','browse'),(11,'release','view'),(11,'report','bugAssign'),(11,'report','bugSummary'),(11,'report','index'),(11,'report','productInfo'),(11,'report','projectDeviation'),(11,'report','workload'),(11,'search','buildForm'),(11,'search','buildQuery'),(11,'story','tasks'),(11,'story','view'),(11,'svn','cat'),(11,'svn','diff'),(11,'task','recordEstimate'),(11,'task','view'),(11,'testcase','browse'),(11,'testcase','index'),(11,'testcase','view'),(11,'testtask','browse'),(11,'testtask','cases'),(11,'testtask','index'),(11,'testtask','results'),(11,'testtask','view'),(11,'user','bug'),(11,'user','dynamic'),(11,'user','profile'),(11,'user','project'),(11,'user','story'),(11,'user','task'),(11,'user','testCase'),(11,'user','testTask'),(11,'user','todo'),(11,'user','view');
/*!40000 ALTER TABLE `zt_grouppriv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_history`
--

DROP TABLE IF EXISTS `zt_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_history` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `action` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `field` varchar(30) NOT NULL DEFAULT '',
  `old` text NOT NULL,
  `new` text NOT NULL,
  `diff` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_history`
--

LOCK TABLES `zt_history` WRITE;
/*!40000 ALTER TABLE `zt_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_lang`
--

DROP TABLE IF EXISTS `zt_lang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_lang` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `section` varchar(30) NOT NULL,
  `key` varchar(60) NOT NULL,
  `value` text NOT NULL,
  `system` enum('0','1') NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `lang` (`lang`,`module`,`section`,`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_lang`
--

LOCK TABLES `zt_lang` WRITE;
/*!40000 ALTER TABLE `zt_lang` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_lang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_module`
--

DROP TABLE IF EXISTS `zt_module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_module` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `root` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` char(60) NOT NULL DEFAULT '',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `path` char(255) NOT NULL DEFAULT '',
  `grade` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `order` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_module`
--

LOCK TABLES `zt_module` WRITE;
/*!40000 ALTER TABLE `zt_module` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_product`
--

DROP TABLE IF EXISTS `zt_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_product` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `PO` varchar(30) NOT NULL,
  `QD` varchar(30) NOT NULL,
  `RD` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `createdBy` varchar(30) NOT NULL,
  `createdDate` datetime NOT NULL,
  `createdVersion` varchar(20) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_product`
--

LOCK TABLES `zt_product` WRITE;
/*!40000 ALTER TABLE `zt_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_productplan`
--

DROP TABLE IF EXISTS `zt_productplan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_productplan` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL,
  `title` varchar(90) NOT NULL,
  `desc` text NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_productplan`
--

LOCK TABLES `zt_productplan` WRITE;
/*!40000 ALTER TABLE `zt_productplan` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_productplan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_project`
--

DROP TABLE IF EXISTS `zt_project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_project` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `isCat` enum('1','0') NOT NULL DEFAULT '0',
  `catID` mediumint(8) unsigned NOT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'sprint',
  `parent` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(90) NOT NULL,
  `code` varchar(45) NOT NULL,
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `days` smallint(5) unsigned NOT NULL,
  `status` varchar(10) NOT NULL,
  `statge` enum('1','2','3','4','5') NOT NULL DEFAULT '1',
  `pri` enum('1','2','3','4') NOT NULL DEFAULT '1',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `openedVersion` varchar(20) NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` int(10) unsigned NOT NULL DEFAULT '0',
  `canceledBy` varchar(30) NOT NULL DEFAULT '',
  `canceledDate` int(10) unsigned NOT NULL DEFAULT '0',
  `PO` varchar(30) NOT NULL DEFAULT '',
  `PM` varchar(30) NOT NULL DEFAULT '',
  `QD` varchar(30) NOT NULL DEFAULT '',
  `RD` varchar(30) NOT NULL DEFAULT '',
  `team` varchar(30) NOT NULL,
  `acl` enum('open','private','custom') NOT NULL DEFAULT 'open',
  `whitelist` varchar(255) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `project` (`type`,`parent`,`begin`,`end`,`status`,`statge`,`pri`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_project`
--

LOCK TABLES `zt_project` WRITE;
/*!40000 ALTER TABLE `zt_project` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_projectproduct`
--

DROP TABLE IF EXISTS `zt_projectproduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_projectproduct` (
  `project` mediumint(8) unsigned NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  PRIMARY KEY (`project`,`product`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_projectproduct`
--

LOCK TABLES `zt_projectproduct` WRITE;
/*!40000 ALTER TABLE `zt_projectproduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_projectproduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_projectstory`
--

DROP TABLE IF EXISTS `zt_projectstory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_projectstory` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `product` mediumint(8) unsigned NOT NULL,
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` smallint(6) NOT NULL DEFAULT '1',
  UNIQUE KEY `project` (`project`,`story`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_projectstory`
--

LOCK TABLES `zt_projectstory` WRITE;
/*!40000 ALTER TABLE `zt_projectstory` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_projectstory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_release`
--

DROP TABLE IF EXISTS `zt_release`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_release` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` mediumint(8) unsigned NOT NULL,
  `name` char(30) NOT NULL DEFAULT '',
  `date` date NOT NULL,
  `stories` text NOT NULL,
  `bugs` text NOT NULL,
  `desc` text NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_release`
--

LOCK TABLES `zt_release` WRITE;
/*!40000 ALTER TABLE `zt_release` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_release` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_story`
--

DROP TABLE IF EXISTS `zt_story`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_story` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `product` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `plan` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `source` varchar(20) NOT NULL,
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `type` varchar(30) NOT NULL DEFAULT '',
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `estimate` float unsigned NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '',
  `stage` varchar(30) NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `openedBy` varchar(30) NOT NULL DEFAULT '',
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL DEFAULT '',
  `assignedDate` datetime NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL DEFAULT '',
  `lastEditedDate` datetime NOT NULL,
  `reviewedBy` varchar(255) NOT NULL,
  `reviewedDate` date NOT NULL,
  `closedBy` varchar(30) NOT NULL DEFAULT '',
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `toBug` mediumint(9) NOT NULL,
  `childStories` varchar(255) NOT NULL,
  `linkStories` varchar(255) NOT NULL,
  `duplicateStory` mediumint(8) unsigned NOT NULL,
  `version` smallint(6) NOT NULL DEFAULT '1',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `product` (`product`,`module`,`plan`,`type`,`pri`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_story`
--

LOCK TABLES `zt_story` WRITE;
/*!40000 ALTER TABLE `zt_story` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_story` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_storyspec`
--

DROP TABLE IF EXISTS `zt_storyspec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_storyspec` (
  `story` mediumint(9) NOT NULL,
  `version` smallint(6) NOT NULL,
  `title` varchar(90) NOT NULL,
  `spec` text NOT NULL,
  `verify` text NOT NULL,
  UNIQUE KEY `story` (`story`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_storyspec`
--

LOCK TABLES `zt_storyspec` WRITE;
/*!40000 ALTER TABLE `zt_storyspec` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_storyspec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_task`
--

DROP TABLE IF EXISTS `zt_task`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_task` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `module` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `story` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `storyVersion` smallint(6) NOT NULL DEFAULT '1',
  `fromBug` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `type` varchar(20) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `estimate` float unsigned NOT NULL,
  `consumed` float unsigned NOT NULL,
  `left` float unsigned NOT NULL,
  `deadline` date NOT NULL,
  `status` enum('wait','doing','done','cancel','closed') NOT NULL DEFAULT 'wait',
  `statusCustom` tinyint(3) unsigned NOT NULL,
  `mailto` varchar(255) NOT NULL DEFAULT '',
  `desc` text NOT NULL,
  `openedBy` varchar(30) NOT NULL,
  `openedDate` datetime NOT NULL,
  `assignedTo` varchar(30) NOT NULL,
  `assignedDate` datetime NOT NULL,
  `estStarted` date NOT NULL,
  `realStarted` date NOT NULL,
  `finishedBy` varchar(30) NOT NULL,
  `finishedDate` datetime NOT NULL,
  `canceledBy` varchar(30) NOT NULL,
  `canceledDate` datetime NOT NULL,
  `closedBy` varchar(30) NOT NULL,
  `closedDate` datetime NOT NULL,
  `closedReason` varchar(30) NOT NULL,
  `lastEditedBy` varchar(30) NOT NULL,
  `lastEditedDate` datetime NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `statusOrder` (`statusCustom`),
  KEY `type` (`type`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_task`
--

LOCK TABLES `zt_task` WRITE;
/*!40000 ALTER TABLE `zt_task` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_task` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_taskestimate`
--

DROP TABLE IF EXISTS `zt_taskestimate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_taskestimate` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `date` date NOT NULL,
  `left` float unsigned NOT NULL DEFAULT '0',
  `consumed` float unsigned NOT NULL,
  `account` char(30) NOT NULL DEFAULT '',
  `work` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `task` (`task`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_taskestimate`
--

LOCK TABLES `zt_taskestimate` WRITE;
/*!40000 ALTER TABLE `zt_taskestimate` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_taskestimate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_team`
--

DROP TABLE IF EXISTS `zt_team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_team` (
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `role` char(30) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `days` smallint(5) unsigned NOT NULL,
  `hours` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`project`,`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_team`
--

LOCK TABLES `zt_team` WRITE;
/*!40000 ALTER TABLE `zt_team` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_testresult`
--

DROP TABLE IF EXISTS `zt_testresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_testresult` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `run` mediumint(8) unsigned NOT NULL,
  `case` mediumint(8) unsigned NOT NULL,
  `version` smallint(5) unsigned NOT NULL,
  `caseResult` char(30) NOT NULL,
  `stepResults` text NOT NULL,
  `lastRunner` varchar(30) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `run` (`run`),
  KEY `case` (`case`,`version`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_testresult`
--

LOCK TABLES `zt_testresult` WRITE;
/*!40000 ALTER TABLE `zt_testresult` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_testresult` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_testrun`
--

DROP TABLE IF EXISTS `zt_testrun`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_testrun` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `task` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `case` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `version` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `assignedTo` char(30) NOT NULL DEFAULT '',
  `lastRunner` varchar(30) NOT NULL,
  `lastRunDate` datetime NOT NULL,
  `lastRunResult` char(30) NOT NULL,
  `status` char(30) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task` (`task`,`case`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_testrun`
--

LOCK TABLES `zt_testrun` WRITE;
/*!40000 ALTER TABLE `zt_testrun` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_testrun` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_testtask`
--

DROP TABLE IF EXISTS `zt_testtask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_testtask` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(90) NOT NULL,
  `product` mediumint(8) unsigned NOT NULL,
  `project` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `build` char(30) NOT NULL,
  `owner` varchar(30) NOT NULL,
  `pri` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `begin` date NOT NULL,
  `end` date NOT NULL,
  `desc` text NOT NULL,
  `report` text NOT NULL,
  `status` char(30) NOT NULL,
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_testtask`
--

LOCK TABLES `zt_testtask` WRITE;
/*!40000 ALTER TABLE `zt_testtask` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_testtask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_todo`
--

DROP TABLE IF EXISTS `zt_todo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_todo` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `date` date NOT NULL DEFAULT '0000-00-00',
  `begin` smallint(4) unsigned zerofill NOT NULL,
  `end` smallint(4) unsigned zerofill NOT NULL,
  `type` char(10) NOT NULL,
  `idvalue` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `pri` tinyint(3) unsigned NOT NULL,
  `name` char(150) NOT NULL,
  `desc` text NOT NULL,
  `status` char(20) NOT NULL DEFAULT '',
  `private` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_todo`
--

LOCK TABLES `zt_todo` WRITE;
/*!40000 ALTER TABLE `zt_todo` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_todo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_user`
--

DROP TABLE IF EXISTS `zt_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_user` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `dept` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `account` char(30) NOT NULL DEFAULT '',
  `password` char(32) NOT NULL DEFAULT '',
  `role` char(10) NOT NULL DEFAULT '',
  `realname` char(30) NOT NULL DEFAULT '',
  `nickname` char(60) NOT NULL DEFAULT '',
  `commiter` varchar(100) NOT NULL,
  `avatar` char(30) NOT NULL DEFAULT '',
  `birthday` date NOT NULL DEFAULT '0000-00-00',
  `gender` enum('f','m') NOT NULL DEFAULT 'f',
  `email` char(90) NOT NULL DEFAULT '',
  `skype` char(90) NOT NULL DEFAULT '',
  `qq` char(20) NOT NULL DEFAULT '',
  `yahoo` char(90) NOT NULL DEFAULT '',
  `gtalk` char(90) NOT NULL DEFAULT '',
  `wangwang` char(90) NOT NULL DEFAULT '',
  `mobile` char(11) NOT NULL DEFAULT '',
  `phone` char(20) NOT NULL DEFAULT '',
  `address` char(120) NOT NULL DEFAULT '',
  `zipcode` char(10) NOT NULL DEFAULT '',
  `join` date NOT NULL DEFAULT '0000-00-00',
  `visits` mediumint(8) unsigned NOT NULL DEFAULT '0',
  `ip` char(15) NOT NULL DEFAULT '',
  `last` int(10) unsigned NOT NULL DEFAULT '0',
  `fails` tinyint(5) NOT NULL DEFAULT '0',
  `locked` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `deleted` enum('0','1') NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `account` (`account`),
  KEY `dept` (`dept`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_user`
--

LOCK TABLES `zt_user` WRITE;
/*!40000 ALTER TABLE `zt_user` DISABLE KEYS */;
INSERT INTO `zt_user` VALUES (1,0,'root','63a9f0ea7bb98050796b649e85481845','','root','','','','0000-00-00','','','','','','','','','','','','0000-00-00',2,'127.0.0.1',1406531799,0,'0000-00-00 00:00:00','0');
/*!40000 ALTER TABLE `zt_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_usercontact`
--

DROP TABLE IF EXISTS `zt_usercontact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_usercontact` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `listName` varchar(60) NOT NULL,
  `userList` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_usercontact`
--

LOCK TABLES `zt_usercontact` WRITE;
/*!40000 ALTER TABLE `zt_usercontact` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_usercontact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_usergroup`
--

DROP TABLE IF EXISTS `zt_usergroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_usergroup` (
  `account` char(30) NOT NULL DEFAULT '',
  `group` mediumint(8) unsigned NOT NULL DEFAULT '0',
  UNIQUE KEY `account` (`account`,`group`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_usergroup`
--

LOCK TABLES `zt_usergroup` WRITE;
/*!40000 ALTER TABLE `zt_usergroup` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_usergroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_userquery`
--

DROP TABLE IF EXISTS `zt_userquery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_userquery` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `module` varchar(30) NOT NULL,
  `title` varchar(90) NOT NULL,
  `form` text NOT NULL,
  `sql` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`),
  KEY `module` (`module`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_userquery`
--

LOCK TABLES `zt_userquery` WRITE;
/*!40000 ALTER TABLE `zt_userquery` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_userquery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zt_usertpl`
--

DROP TABLE IF EXISTS `zt_usertpl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `zt_usertpl` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `account` char(30) NOT NULL,
  `type` char(30) NOT NULL,
  `title` varchar(150) NOT NULL,
  `content` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `account` (`account`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zt_usertpl`
--

LOCK TABLES `zt_usertpl` WRITE;
/*!40000 ALTER TABLE `zt_usertpl` DISABLE KEYS */;
/*!40000 ALTER TABLE `zt_usertpl` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-28 15:25:17

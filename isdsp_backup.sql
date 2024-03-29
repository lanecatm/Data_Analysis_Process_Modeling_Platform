-- MySQL dump 10.13  Distrib 5.7.13, for osx10.11 (x86_64)
--
-- Host: localhost    Database: isdsp_dev
-- ------------------------------------------------------
-- Server version	5.7.13

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
-- Table structure for table `caseinformation`
--

DROP TABLE IF EXISTS `caseinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `caseinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `CaseName` varchar(50) DEFAULT NULL,
  `KeyWords` varchar(100) DEFAULT NULL,
  `InitiatorID` int(11) DEFAULT NULL,
  `InitiatorDate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `caseinformation`
--

LOCK TABLES `caseinformation` WRITE;
/*!40000 ALTER TABLE `caseinformation` DISABLE KEYS */;
INSERT INTO `caseinformation` VALUES (11,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,NULL,' ',1,'2017-04-07 00:00:00'),(12,'0',3,NULL,' ',1,'2017-04-07 00:00:00'),(13,'0',3,NULL,' ',1,'2017-04-07 00:00:00'),(14,'0',3,NULL,' ',1,'2017-04-07 00:00:00'),(15,'9',3,NULL,' ',1,'2017-04-07 00:00:00'),(16,'0',3,NULL,' ',1,'2017-04-08 00:00:00'),(17,'0',3,NULL,' ',1,'2017-04-08 00:00:00'),(18,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,NULL,' ',1,'2017-04-08 00:00:00'),(19,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,NULL,' ',1,'2017-04-08 00:00:00');
/*!40000 ALTER TABLE `caseinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department_informations`
--

DROP TABLE IF EXISTS `department_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `parent_department_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `layer` int(11) DEFAULT NULL,
  `manager_id` int(11) DEFAULT NULL,
  `vice_manager_id` int(11) DEFAULT NULL,
  `duty` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_department_informations_on_manager_id` (`manager_id`),
  KEY `index_department_informations_on_parent_department_id` (`parent_department_id`),
  KEY `index_department_informations_on_vice_manager_id` (`vice_manager_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_informations`
--

LOCK TABLES `department_informations` WRITE;
/*!40000 ALTER TABLE `department_informations` DISABLE KEYS */;
INSERT INTO `department_informations` VALUES (1,'All',NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 18:36:53','2017-04-07 18:36:53'),(2,'Department1',NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 18:37:01','2017-04-07 18:37:01'),(3,'Department2',NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 18:37:05','2017-04-07 18:37:05');
/*!40000 ALTER TABLE `department_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `javaclassmethod`
--

DROP TABLE IF EXISTS `javaclassmethod`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `javaclassmethod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `ClassName` varchar(50) DEFAULT NULL,
  `ClassURL` mediumtext,
  `MethodName` varchar(100) DEFAULT NULL,
  `UserName` varchar(50) DEFAULT NULL,
  `Password` varchar(50) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  `InputXMLID` int(11) DEFAULT NULL,
  `OutputXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `javaclassmethod`
--

LOCK TABLES `javaclassmethod` WRITE;
/*!40000 ALTER TABLE `javaclassmethod` DISABLE KEYS */;
/*!40000 ALTER TABLE `javaclassmethod` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packageinformation`
--

DROP TABLE IF EXISTS `packageinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packageinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `PackageID` int(11) NOT NULL DEFAULT '0',
  `PackageName` varchar(50) DEFAULT NULL,
  `Description` mediumtext,
  `DurationUnit` varchar(1) DEFAULT NULL,
  `CostUnit` float DEFAULT NULL,
  `AuthorID` int(11) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `GoalOWLURI` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packageinformation`
--

LOCK TABLES `packageinformation` WRITE;
/*!40000 ALTER TABLE `packageinformation` DISABLE KEYS */;
INSERT INTO `packageinformation` VALUES (1,2,'IP','IP','s',12,0,'2013-07-22 14:16:01','');
/*!40000 ALTER TABLE `packageinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person_informations`
--

DROP TABLE IF EXISTS `person_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `person_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `person_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `technical_post` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_informations`
--

LOCK TABLES `person_informations` WRITE;
/*!40000 ALTER TABLE `person_informations` DISABLE KEYS */;
INSERT INTO `person_informations` VALUES (1,'Admin','Admin',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 18:35:12','2017-04-07 18:35:12');
/*!40000 ALTER TABLE `person_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process_informations`
--

DROP TABLE IF EXISTS `process_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `creater_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `is_shared` tinyint(1) DEFAULT NULL,
  `parent_case_id` int(11) DEFAULT NULL,
  `persistent` tinyint(1) DEFAULT NULL,
  `state` text COLLATE utf8_unicode_ci,
  `case_type` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `process_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_process_informations_on_creater_id` (`creater_id`),
  KEY `index_process_informations_on_parent_case_id` (`parent_case_id`),
  KEY `index_process_informations_on_process_id` (`process_id`),
  KEY `index_process_informations_on_process_type_and_process_id` (`process_type`),
  KEY `index_process_informations_on_user_id` (`user_id`),
  KEY `index_process_informations_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_informations`
--

LOCK TABLES `process_informations` WRITE;
/*!40000 ALTER TABLE `process_informations` DISABLE KEYS */;
INSERT INTO `process_informations` VALUES (1,3,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 10:50:40','2017-04-07 10:50:40',NULL,NULL),(2,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 13:57:34','2017-04-07 13:57:34',NULL,NULL),(3,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 14:11:18','2017-04-07 14:11:18',NULL,NULL),(4,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 14:16:51','2017-04-07 14:16:51',NULL,NULL),(5,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 15:01:31','2017-04-07 15:01:31',NULL,NULL),(6,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 15:03:23','2017-04-07 15:03:23',NULL,NULL),(7,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 15:05:03','2017-04-07 15:05:03',NULL,NULL),(8,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 15:06:56','2017-04-07 15:06:56',NULL,NULL),(9,4,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,'2017-04-07 15:09:02','2017-04-07 15:09:02',NULL,NULL);
/*!40000 ALTER TABLE `process_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processactivityinformation`
--

DROP TABLE IF EXISTS `processactivityinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processactivityinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ActivityName` varchar(50) DEFAULT NULL,
  `ActivityType` smallint(6) DEFAULT NULL,
  `ActivityImplementation` smallint(6) DEFAULT NULL,
  `Layer` smallint(6) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `ChoiceManager` tinyint(1) DEFAULT NULL,
  `StartTime` float DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  `IconID` int(11) DEFAULT NULL,
  `ActivityURL` tinytext,
  `MultiPersonMode` int(11) DEFAULT NULL,
  `SubmitPersonNumber` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `isCallback` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processactivityinformation`
--

LOCK TABLES `processactivityinformation` WRITE;
/*!40000 ALTER TABLE `processactivityinformation` DISABLE KEYS */;
INSERT INTO `processactivityinformation` VALUES (28,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Completed',0),(29,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Completed',0),(30,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Completed',0),(31,'0',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(32,'0',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(33,'0',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(34,'0',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(35,'0',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(36,'0',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(37,'0',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(38,'0',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(39,'0',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(40,'9',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(41,'9',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(42,'9',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(43,'0',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(44,'0',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(45,'0',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(46,'0',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(47,'0',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(48,'0',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(49,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(50,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Waiting',0),(51,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Waiting',0),(52,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,'start',1,0,1,-1,'开始活动',0,0,0,0,'None',0,0,0,0,'Completed',0),(53,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,'end',2,0,1,-1,'结束活动',0,0,0,0,'None',0,0,0,0,'Completed',0),(54,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,'getAddress',3,2,1,-1,'activity',0,0,0,0,'none',0,0,0,1,'Completed',0);
/*!40000 ALTER TABLE `processactivityinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processactivityinputmapping`
--

DROP TABLE IF EXISTS `processactivityinputmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processactivityinputmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `DataflowID` int(11) NOT NULL,
  `InputSchema` mediumtext,
  `InputXML` mediumtext,
  `XSLT` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processactivityinputmapping`
--

LOCK TABLES `processactivityinputmapping` WRITE;
/*!40000 ALTER TABLE `processactivityinputmapping` DISABLE KEYS */;
INSERT INTO `processactivityinputmapping` VALUES (10,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(11,'0',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(12,'0',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(13,'0',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(14,'9',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(15,'0',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(16,'0',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(17,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n'),(18,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `processactivityinputmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processactivityinvokingapplication`
--

DROP TABLE IF EXISTS `processactivityinvokingapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processactivityinvokingapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `InvocationType` smallint(6) DEFAULT NULL,
  `InputXMLID` int(11) DEFAULT NULL,
  `OutputXMLID` int(11) DEFAULT NULL,
  `ActualStartDate` datetime DEFAULT NULL,
  `ActualEndDate` datetime DEFAULT NULL,
  `Result` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processactivityinvokingapplication`
--

LOCK TABLES `processactivityinvokingapplication` WRITE;
/*!40000 ALTER TABLE `processactivityinvokingapplication` DISABLE KEYS */;
/*!40000 ALTER TABLE `processactivityinvokingapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processapplication`
--

DROP TABLE IF EXISTS `processapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ApplicationID` smallint(6) NOT NULL DEFAULT '0',
  `Description` varchar(50) DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processapplication`
--

LOCK TABLES `processapplication` WRITE;
/*!40000 ALTER TABLE `processapplication` DISABLE KEYS */;
INSERT INTO `processapplication` VALUES (11,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',12,'IpAddressSearchWebService:getCountryCityByIp'),(12,'0',12,'IpAddressSearchWebService:getCountryCityByIp'),(13,'0',12,'IpAddressSearchWebService:getCountryCityByIp'),(14,'0',12,'IpAddressSearchWebService:getCountryCityByIp'),(15,'9',12,'IpAddressSearchWebService:getCountryCityByIp'),(16,'0',12,'IpAddressSearchWebService:getCountryCityByIp'),(17,'0',12,'IpAddressSearchWebService:getCountryCityByIp'),(18,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',12,'IpAddressSearchWebService:getCountryCityByIp'),(19,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',12,'IpAddressSearchWebService:getCountryCityByIp');
/*!40000 ALTER TABLE `processapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processcondition`
--

DROP TABLE IF EXISTS `processcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ConditionRepresentation` varchar(200) DEFAULT NULL,
  `ConditionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processcondition`
--

LOCK TABLES `processcondition` WRITE;
/*!40000 ALTER TABLE `processcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `processcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processcontrolflowcondition`
--

DROP TABLE IF EXISTS `processcontrolflowcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processcontrolflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '0',
  `ControlFlowID` smallint(6) NOT NULL DEFAULT '0',
  `ConditionID` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processcontrolflowcondition`
--

LOCK TABLES `processcontrolflowcondition` WRITE;
/*!40000 ALTER TABLE `processcontrolflowcondition` DISABLE KEYS */;
INSERT INTO `processcontrolflowcondition` VALUES (1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,0),(2,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,0),(3,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',4,0),(4,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',5,0),(5,'0',2,0),(6,'0',3,0),(7,'0',4,0),(8,'0',5,0),(9,'0',2,0),(10,'0',3,0),(11,'0',4,0),(12,'0',5,0),(13,'0',2,0),(14,'0',3,0),(15,'0',4,0),(16,'0',5,0),(17,'9',2,0),(18,'9',3,0),(19,'9',4,0),(20,'9',5,0),(21,'0',2,0),(22,'0',3,0),(23,'0',4,0),(24,'0',5,0),(25,'0',2,0),(26,'0',3,0),(27,'0',4,0),(28,'0',5,0),(29,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,0),(30,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,0),(31,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',4,0),(32,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',5,0),(33,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,0),(34,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,0),(35,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',4,0),(36,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',5,0);
/*!40000 ALTER TABLE `processcontrolflowcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processevent`
--

DROP TABLE IF EXISTS `processevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `EventRepresentation` longtext,
  `ExpressionforParse` longtext,
  `EventType` smallint(6) DEFAULT NULL,
  `LogicType` smallint(6) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `EventName` varchar(20) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=325 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processevent`
--

LOCK TABLES `processevent` WRITE;
/*!40000 ALTER TABLE `processevent` DISABLE KEYS */;
INSERT INTO `processevent` VALUES (163,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-07 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(164,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-07 00:00:00','Started(1)','活动(1)已经运行'),(165,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,'EndOf(1)','EndOf(1)',1,0,1,1,'2017-04-07 00:00:00','EndOf(1)','活动(1)结束'),(166,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-07 00:00:00','Overtime(1)','活动(1)已经超时'),(167,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-07 00:00:00','Aborted(1)','活动(1)已经被放弃'),(168,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-07 00:00:00','Error(1)','活动(1)处于错误状态'),(169,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',7,'Initialized(2)','Initialized(2)',1,0,2,1,'2017-04-07 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(170,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-07 00:00:00','Started(2)','活动(2)已经运行'),(171,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',9,'EndOf(2)','EndOf(2)',1,0,2,1,'2017-04-07 00:00:00','EndOf(2)','活动(2)结束'),(172,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-07 00:00:00','Overtime(2)','活动(2)已经超时'),(173,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-07 00:00:00','Aborted(2)','活动(2)已经被放弃'),(174,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-07 00:00:00','Error(2)','活动(2)处于错误状态'),(175,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',13,'Initialized(3)','Initialized(3)',1,0,3,1,'2017-04-07 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(176,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',14,'Started(3)','Started(3)',1,0,3,1,'2017-04-07 00:00:00','Started(3)','活动(3)已经运行'),(177,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',15,'EndOf(3)','EndOf(3)',1,0,3,1,'2017-04-07 00:00:00','EndOf(3)','活动(3)结束'),(178,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-07 00:00:00','Overtime(3)','活动(3)已经超时'),(179,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-07 00:00:00','Aborted(3)','活动(3)已经被放弃'),(180,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-07 00:00:00','Error(3)','活动(3)处于错误状态'),(181,'0',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-07 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(182,'0',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-07 00:00:00','Started(1)','活动(1)已经运行'),(183,'0',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-07 00:00:00','EndOf(1)','活动(1)结束'),(184,'0',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-07 00:00:00','Overtime(1)','活动(1)已经超时'),(185,'0',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-07 00:00:00','Aborted(1)','活动(1)已经被放弃'),(186,'0',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-07 00:00:00','Error(1)','活动(1)处于错误状态'),(187,'0',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-07 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(188,'0',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-07 00:00:00','Started(2)','活动(2)已经运行'),(189,'0',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-07 00:00:00','EndOf(2)','活动(2)结束'),(190,'0',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-07 00:00:00','Overtime(2)','活动(2)已经超时'),(191,'0',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-07 00:00:00','Aborted(2)','活动(2)已经被放弃'),(192,'0',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-07 00:00:00','Error(2)','活动(2)处于错误状态'),(193,'0',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-07 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(194,'0',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-07 00:00:00','Started(3)','活动(3)已经运行'),(195,'0',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-07 00:00:00','EndOf(3)','活动(3)结束'),(196,'0',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-07 00:00:00','Overtime(3)','活动(3)已经超时'),(197,'0',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-07 00:00:00','Aborted(3)','活动(3)已经被放弃'),(198,'0',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-07 00:00:00','Error(3)','活动(3)处于错误状态'),(199,'0',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-07 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(200,'0',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-07 00:00:00','Started(1)','活动(1)已经运行'),(201,'0',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-07 00:00:00','EndOf(1)','活动(1)结束'),(202,'0',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-07 00:00:00','Overtime(1)','活动(1)已经超时'),(203,'0',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-07 00:00:00','Aborted(1)','活动(1)已经被放弃'),(204,'0',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-07 00:00:00','Error(1)','活动(1)处于错误状态'),(205,'0',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-07 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(206,'0',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-07 00:00:00','Started(2)','活动(2)已经运行'),(207,'0',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-07 00:00:00','EndOf(2)','活动(2)结束'),(208,'0',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-07 00:00:00','Overtime(2)','活动(2)已经超时'),(209,'0',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-07 00:00:00','Aborted(2)','活动(2)已经被放弃'),(210,'0',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-07 00:00:00','Error(2)','活动(2)处于错误状态'),(211,'0',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-07 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(212,'0',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-07 00:00:00','Started(3)','活动(3)已经运行'),(213,'0',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-07 00:00:00','EndOf(3)','活动(3)结束'),(214,'0',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-07 00:00:00','Overtime(3)','活动(3)已经超时'),(215,'0',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-07 00:00:00','Aborted(3)','活动(3)已经被放弃'),(216,'0',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-07 00:00:00','Error(3)','活动(3)处于错误状态'),(217,'0',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-07 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(218,'0',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-07 00:00:00','Started(1)','活动(1)已经运行'),(219,'0',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-07 00:00:00','EndOf(1)','活动(1)结束'),(220,'0',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-07 00:00:00','Overtime(1)','活动(1)已经超时'),(221,'0',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-07 00:00:00','Aborted(1)','活动(1)已经被放弃'),(222,'0',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-07 00:00:00','Error(1)','活动(1)处于错误状态'),(223,'0',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-07 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(224,'0',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-07 00:00:00','Started(2)','活动(2)已经运行'),(225,'0',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-07 00:00:00','EndOf(2)','活动(2)结束'),(226,'0',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-07 00:00:00','Overtime(2)','活动(2)已经超时'),(227,'0',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-07 00:00:00','Aborted(2)','活动(2)已经被放弃'),(228,'0',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-07 00:00:00','Error(2)','活动(2)处于错误状态'),(229,'0',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-07 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(230,'0',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-07 00:00:00','Started(3)','活动(3)已经运行'),(231,'0',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-07 00:00:00','EndOf(3)','活动(3)结束'),(232,'0',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-07 00:00:00','Overtime(3)','活动(3)已经超时'),(233,'0',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-07 00:00:00','Aborted(3)','活动(3)已经被放弃'),(234,'0',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-07 00:00:00','Error(3)','活动(3)处于错误状态'),(235,'9',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-07 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(236,'9',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-07 00:00:00','Started(1)','活动(1)已经运行'),(237,'9',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-07 00:00:00','EndOf(1)','活动(1)结束'),(238,'9',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-07 00:00:00','Overtime(1)','活动(1)已经超时'),(239,'9',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-07 00:00:00','Aborted(1)','活动(1)已经被放弃'),(240,'9',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-07 00:00:00','Error(1)','活动(1)处于错误状态'),(241,'9',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-07 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(242,'9',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-07 00:00:00','Started(2)','活动(2)已经运行'),(243,'9',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-07 00:00:00','EndOf(2)','活动(2)结束'),(244,'9',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-07 00:00:00','Overtime(2)','活动(2)已经超时'),(245,'9',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-07 00:00:00','Aborted(2)','活动(2)已经被放弃'),(246,'9',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-07 00:00:00','Error(2)','活动(2)处于错误状态'),(247,'9',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-07 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(248,'9',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-07 00:00:00','Started(3)','活动(3)已经运行'),(249,'9',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-07 00:00:00','EndOf(3)','活动(3)结束'),(250,'9',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-07 00:00:00','Overtime(3)','活动(3)已经超时'),(251,'9',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-07 00:00:00','Aborted(3)','活动(3)已经被放弃'),(252,'9',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-07 00:00:00','Error(3)','活动(3)处于错误状态'),(253,'0',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-08 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(254,'0',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-08 00:00:00','Started(1)','活动(1)已经运行'),(255,'0',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-08 00:00:00','EndOf(1)','活动(1)结束'),(256,'0',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-08 00:00:00','Overtime(1)','活动(1)已经超时'),(257,'0',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-08 00:00:00','Aborted(1)','活动(1)已经被放弃'),(258,'0',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-08 00:00:00','Error(1)','活动(1)处于错误状态'),(259,'0',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-08 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(260,'0',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-08 00:00:00','Started(2)','活动(2)已经运行'),(261,'0',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-08 00:00:00','EndOf(2)','活动(2)结束'),(262,'0',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-08 00:00:00','Overtime(2)','活动(2)已经超时'),(263,'0',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-08 00:00:00','Aborted(2)','活动(2)已经被放弃'),(264,'0',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-08 00:00:00','Error(2)','活动(2)处于错误状态'),(265,'0',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-08 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(266,'0',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-08 00:00:00','Started(3)','活动(3)已经运行'),(267,'0',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-08 00:00:00','EndOf(3)','活动(3)结束'),(268,'0',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-08 00:00:00','Overtime(3)','活动(3)已经超时'),(269,'0',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-08 00:00:00','Aborted(3)','活动(3)已经被放弃'),(270,'0',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-08 00:00:00','Error(3)','活动(3)处于错误状态'),(271,'0',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-08 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(272,'0',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-08 00:00:00','Started(1)','活动(1)已经运行'),(273,'0',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-08 00:00:00','EndOf(1)','活动(1)结束'),(274,'0',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-08 00:00:00','Overtime(1)','活动(1)已经超时'),(275,'0',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-08 00:00:00','Aborted(1)','活动(1)已经被放弃'),(276,'0',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-08 00:00:00','Error(1)','活动(1)处于错误状态'),(277,'0',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-08 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(278,'0',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-08 00:00:00','Started(2)','活动(2)已经运行'),(279,'0',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-08 00:00:00','EndOf(2)','活动(2)结束'),(280,'0',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-08 00:00:00','Overtime(2)','活动(2)已经超时'),(281,'0',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-08 00:00:00','Aborted(2)','活动(2)已经被放弃'),(282,'0',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-08 00:00:00','Error(2)','活动(2)处于错误状态'),(283,'0',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-08 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(284,'0',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-08 00:00:00','Started(3)','活动(3)已经运行'),(285,'0',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-08 00:00:00','EndOf(3)','活动(3)结束'),(286,'0',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-08 00:00:00','Overtime(3)','活动(3)已经超时'),(287,'0',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-08 00:00:00','Aborted(3)','活动(3)已经被放弃'),(288,'0',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-08 00:00:00','Error(3)','活动(3)处于错误状态'),(289,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-08 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(290,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-08 00:00:00','Started(1)','活动(1)已经运行'),(291,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,'EndOf(1)','EndOf(1)',1,0,1,0,'2017-04-08 00:00:00','EndOf(1)','活动(1)结束'),(292,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-08 00:00:00','Overtime(1)','活动(1)已经超时'),(293,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-08 00:00:00','Aborted(1)','活动(1)已经被放弃'),(294,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-08 00:00:00','Error(1)','活动(1)处于错误状态'),(295,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',7,'Initialized(2)','Initialized(2)',1,0,2,0,'2017-04-08 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(296,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-08 00:00:00','Started(2)','活动(2)已经运行'),(297,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',9,'EndOf(2)','EndOf(2)',1,0,2,0,'2017-04-08 00:00:00','EndOf(2)','活动(2)结束'),(298,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-08 00:00:00','Overtime(2)','活动(2)已经超时'),(299,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-08 00:00:00','Aborted(2)','活动(2)已经被放弃'),(300,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-08 00:00:00','Error(2)','活动(2)处于错误状态'),(301,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',13,'Initialized(3)','Initialized(3)',1,0,3,0,'2017-04-08 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(302,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',14,'Started(3)','Started(3)',1,0,3,0,'2017-04-08 00:00:00','Started(3)','活动(3)已经运行'),(303,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',15,'EndOf(3)','EndOf(3)',1,0,3,0,'2017-04-08 00:00:00','EndOf(3)','活动(3)结束'),(304,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-08 00:00:00','Overtime(3)','活动(3)已经超时'),(305,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-08 00:00:00','Aborted(3)','活动(3)已经被放弃'),(306,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-08 00:00:00','Error(3)','活动(3)处于错误状态'),(307,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,'Initialized(1)','Initialized(1)',1,0,1,0,'2017-04-08 00:00:00','Initialized(1)','活动(1)成功进行初始化'),(308,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,'Started(1)','Started(1)',1,0,1,0,'2017-04-08 00:00:00','Started(1)','活动(1)已经运行'),(309,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,'EndOf(1)','EndOf(1)',1,0,1,1,'2017-04-08 00:00:00','EndOf(1)','活动(1)结束'),(310,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',4,'Overtime(1)','Overtime(1)',1,0,1,0,'2017-04-08 00:00:00','Overtime(1)','活动(1)已经超时'),(311,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',5,'Aborted(1)','Aborted(1)',1,0,1,0,'2017-04-08 00:00:00','Aborted(1)','活动(1)已经被放弃'),(312,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',6,'Error(1)','Error(1)',1,0,1,0,'2017-04-08 00:00:00','Error(1)','活动(1)处于错误状态'),(313,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',7,'Initialized(2)','Initialized(2)',1,0,2,1,'2017-04-08 00:00:00','Initialized(2)','活动(2)成功进行初始化'),(314,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',8,'Started(2)','Started(2)',1,0,2,0,'2017-04-08 00:00:00','Started(2)','活动(2)已经运行'),(315,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',9,'EndOf(2)','EndOf(2)',1,0,2,1,'2017-04-08 00:00:00','EndOf(2)','活动(2)结束'),(316,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',10,'Overtime(2)','Overtime(2)',1,0,2,0,'2017-04-08 00:00:00','Overtime(2)','活动(2)已经超时'),(317,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',11,'Aborted(2)','Aborted(2)',1,0,2,0,'2017-04-08 00:00:00','Aborted(2)','活动(2)已经被放弃'),(318,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',12,'Error(2)','Error(2)',1,0,2,0,'2017-04-08 00:00:00','Error(2)','活动(2)处于错误状态'),(319,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',13,'Initialized(3)','Initialized(3)',1,0,3,1,'2017-04-08 00:00:00','Initialized(3)','活动(3)成功进行初始化'),(320,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',14,'Started(3)','Started(3)',1,0,3,1,'2017-04-08 00:00:00','Started(3)','活动(3)已经运行'),(321,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',15,'EndOf(3)','EndOf(3)',1,0,3,1,'2017-04-08 00:00:00','EndOf(3)','活动(3)结束'),(322,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',16,'Overtime(3)','Overtime(3)',1,0,3,0,'2017-04-08 00:00:00','Overtime(3)','活动(3)已经超时'),(323,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',17,'Aborted(3)','Aborted(3)',1,0,3,0,'2017-04-08 00:00:00','Aborted(3)','活动(3)已经被放弃'),(324,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',18,'Error(3)','Error(3)',1,0,3,0,'2017-04-08 00:00:00','Error(3)','活动(3)处于错误状态');
/*!40000 ALTER TABLE `processevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processflow`
--

DROP TABLE IF EXISTS `processflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelType` smallint(6) NOT NULL DEFAULT '0',
  `ProcessID` varchar(50) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) DEFAULT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `FromObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectId1` int(11) NOT NULL DEFAULT '0',
  `ToObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectID2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processflow`
--

LOCK TABLES `processflow` WRITE;
/*!40000 ALTER TABLE `processflow` DISABLE KEYS */;
INSERT INTO `processflow` VALUES (8,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',7,-1,2,1,3,1,2),(9,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',6,-1,2,1,1,1,3),(10,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,-1,2,1,0,1,3),(11,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',5,-1,1,2,2,1,2),(12,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',4,-1,1,1,3,2,2),(13,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',3,-1,1,2,1,1,3),(14,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,-1,1,1,1,2,1),(15,1,'0',7,-1,2,1,3,1,2),(16,1,'0',6,-1,2,1,1,1,3),(17,1,'0',1,-1,2,1,0,1,3),(18,1,'0',5,-1,1,2,2,1,2),(19,1,'0',4,-1,1,1,3,2,2),(20,1,'0',3,-1,1,2,1,1,3),(21,1,'0',2,-1,1,1,1,2,1),(22,1,'0',7,-1,2,1,3,1,2),(23,1,'0',6,-1,2,1,1,1,3),(24,1,'0',1,-1,2,1,0,1,3),(25,1,'0',5,-1,1,2,2,1,2),(26,1,'0',4,-1,1,1,3,2,2),(27,1,'0',3,-1,1,2,1,1,3),(28,1,'0',2,-1,1,1,1,2,1),(29,1,'0',7,-1,2,1,3,1,2),(30,1,'0',6,-1,2,1,1,1,3),(31,1,'0',1,-1,2,1,0,1,3),(32,1,'0',5,-1,1,2,2,1,2),(33,1,'0',4,-1,1,1,3,2,2),(34,1,'0',3,-1,1,2,1,1,3),(35,1,'0',2,-1,1,1,1,2,1),(36,1,'9',7,-1,2,1,3,1,2),(37,1,'9',6,-1,2,1,1,1,3),(38,1,'9',1,-1,2,1,0,1,3),(39,1,'9',5,-1,1,2,2,1,2),(40,1,'9',4,-1,1,1,3,2,2),(41,1,'9',3,-1,1,2,1,1,3),(42,1,'9',2,-1,1,1,1,2,1),(43,1,'0',7,-1,2,1,3,1,2),(44,1,'0',6,-1,2,1,1,1,3),(45,1,'0',1,-1,2,1,0,1,3),(46,1,'0',5,-1,1,2,2,1,2),(47,1,'0',4,-1,1,1,3,2,2),(48,1,'0',3,-1,1,2,1,1,3),(49,1,'0',2,-1,1,1,1,2,1),(50,1,'0',7,-1,2,1,3,1,2),(51,1,'0',6,-1,2,1,1,1,3),(52,1,'0',1,-1,2,1,0,1,3),(53,1,'0',5,-1,1,2,2,1,2),(54,1,'0',4,-1,1,1,3,2,2),(55,1,'0',3,-1,1,2,1,1,3),(56,1,'0',2,-1,1,1,1,2,1),(57,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',7,-1,2,1,3,1,2),(58,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',6,-1,2,1,1,1,3),(59,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,-1,2,1,0,1,3),(60,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',5,-1,1,2,2,1,2),(61,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',4,-1,1,1,3,2,2),(62,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',3,-1,1,2,1,1,3),(63,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,-1,1,1,1,2,1),(64,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',7,-1,2,1,3,1,2),(65,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',6,-1,2,1,1,1,3),(66,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,-1,2,1,0,1,3),(67,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',5,-1,1,2,2,1,2),(68,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',4,-1,1,1,3,2,2),(69,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',3,-1,1,2,1,1,3),(70,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,-1,1,1,1,2,1);
/*!40000 ALTER TABLE `processflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processflowobjectcontrol`
--

DROP TABLE IF EXISTS `processflowobjectcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processflowobjectcontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `Privilege` smallint(6) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `State` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processflowobjectcontrol`
--

LOCK TABLES `processflowobjectcontrol` WRITE;
/*!40000 ALTER TABLE `processflowobjectcontrol` DISABLE KEYS */;
INSERT INTO `processflowobjectcontrol` VALUES (28,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',7,2,1,0,'2017-04-07 00:00:00','InActive'),(29,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',6,1,1,0,'2017-04-07 00:00:00','InActive'),(30,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,2,1,0,'2017-04-07 00:00:00','InActive'),(31,'0',7,2,1,0,'2017-04-07 00:00:00','InActive'),(32,'0',6,1,1,0,'2017-04-07 00:00:00','InActive'),(33,'0',1,2,1,0,'2017-04-07 00:00:00','InActive'),(34,'0',7,2,1,0,'2017-04-07 00:00:00','InActive'),(35,'0',6,1,1,0,'2017-04-07 00:00:00','InActive'),(36,'0',1,2,1,0,'2017-04-07 00:00:00','InActive'),(37,'0',7,2,1,0,'2017-04-07 00:00:00','InActive'),(38,'0',6,1,1,0,'2017-04-07 00:00:00','InActive'),(39,'0',1,2,1,0,'2017-04-07 00:00:00','InActive'),(40,'9',7,2,1,0,'2017-04-07 00:00:00','InActive'),(41,'9',6,1,1,0,'2017-04-07 00:00:00','InActive'),(42,'9',1,2,1,0,'2017-04-07 00:00:00','InActive'),(43,'0',7,2,1,0,'2017-04-08 00:00:00','InActive'),(44,'0',6,1,1,0,'2017-04-08 00:00:00','InActive'),(45,'0',1,2,1,0,'2017-04-08 00:00:00','InActive'),(46,'0',7,2,1,0,'2017-04-08 00:00:00','InActive'),(47,'0',6,1,1,0,'2017-04-08 00:00:00','InActive'),(48,'0',1,2,1,0,'2017-04-08 00:00:00','InActive'),(49,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',7,2,1,0,'2017-04-08 00:00:00','InActive'),(50,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',6,1,1,0,'2017-04-08 00:00:00','InActive'),(51,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,2,1,0,'2017-04-08 00:00:00','InActive'),(52,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',7,2,1,0,'2017-04-08 00:00:00','InActive'),(53,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',6,1,1,0,'2017-04-08 00:00:00','InActive'),(54,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,2,1,0,'2017-04-08 00:00:00','InActive');
/*!40000 ALTER TABLE `processflowobjectcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processflowobjects`
--

DROP TABLE IF EXISTS `processflowobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processflowobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `DroolsRuleID` int(11) NOT NULL DEFAULT '0',
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `FromActivityID` int(11) NOT NULL DEFAULT '0',
  `ToActivityID` int(11) NOT NULL DEFAULT '0',
  `XSLTO2M` longtext,
  `XSLTM2I` longtext,
  `OXMLID` int(11) DEFAULT NULL,
  `MXMLID` int(11) DEFAULT NULL,
  `IXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processflowobjects`
--

LOCK TABLES `processflowobjects` WRITE;
/*!40000 ALTER TABLE `processflowobjects` DISABLE KEYS */;
INSERT INTO `processflowobjects` VALUES (28,1,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,0,3,NULL,NULL,NULL,NULL,NULL),(29,2,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',6,1,3,NULL,NULL,NULL,0,0),(30,3,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',7,3,2,NULL,NULL,0,0,NULL),(31,1,'0',1,0,3,NULL,NULL,NULL,NULL,NULL),(32,2,'0',6,1,3,NULL,NULL,NULL,0,0),(33,3,'0',7,3,2,NULL,NULL,0,0,NULL),(34,1,'0',1,0,3,NULL,NULL,NULL,NULL,NULL),(35,2,'0',6,1,3,NULL,NULL,NULL,0,0),(36,3,'0',7,3,2,NULL,NULL,0,0,NULL),(37,1,'0',1,0,3,NULL,NULL,NULL,NULL,NULL),(38,2,'0',6,1,3,NULL,NULL,NULL,0,0),(39,3,'0',7,3,2,NULL,NULL,0,0,NULL),(40,1,'9',1,0,3,NULL,NULL,NULL,NULL,NULL),(41,2,'9',6,1,3,NULL,NULL,NULL,0,0),(42,3,'9',7,3,2,NULL,NULL,0,0,NULL),(43,1,'0',1,0,3,NULL,NULL,NULL,NULL,NULL),(44,2,'0',6,1,3,NULL,NULL,NULL,0,0),(45,3,'0',7,3,2,NULL,NULL,0,0,NULL),(46,1,'0',1,0,3,NULL,NULL,NULL,NULL,NULL),(47,2,'0',6,1,3,NULL,NULL,NULL,0,0),(48,3,'0',7,3,2,NULL,NULL,0,0,NULL),(49,1,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,0,3,NULL,NULL,NULL,NULL,NULL),(50,2,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',6,1,3,NULL,NULL,NULL,0,0),(51,3,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',7,3,2,NULL,NULL,0,0,NULL),(52,1,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,0,3,NULL,NULL,NULL,NULL,NULL),(53,2,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',6,1,3,NULL,NULL,NULL,0,0),(54,3,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',7,3,2,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `processflowobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processinformation`
--

DROP TABLE IF EXISTS `processinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ProcessName` varchar(50) DEFAULT NULL,
  `Source` smallint(6) DEFAULT NULL,
  `CaseType` smallint(6) DEFAULT NULL,
  `ParentCaseID` varchar(50) DEFAULT NULL,
  `MaximalLayer` smallint(6) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `Persistent` tinyint(1) DEFAULT NULL,
  `State` varchar(20) DEFAULT NULL,
  `DurationUnit` varchar(1) DEFAULT NULL,
  `CostUnit` float DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processinformation`
--

LOCK TABLES `processinformation` WRITE;
/*!40000 ALTER TABLE `processinformation` DISABLE KEYS */;
INSERT INTO `processinformation` VALUES (11,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2','wfTest',1,1,'',0,NULL,1,'Completed','0',0,0),(12,'0','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(13,'0','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(14,'0','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(15,'9','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(16,'0','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(17,'0','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(18,'1cbff39c-fc42-4f6b-bbdf-dbc206536781','wfTest',1,1,'',0,NULL,1,'Created','0',0,0),(19,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b','wfTest',1,1,'',0,NULL,1,'Completed','0',0,0);
/*!40000 ALTER TABLE `processinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processinherentvariable`
--

DROP TABLE IF EXISTS `processinherentvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processinherentvariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ValueType` smallint(6) DEFAULT NULL,
  `InitialValue` varchar(50) DEFAULT NULL,
  `Value` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processinherentvariable`
--

LOCK TABLES `processinherentvariable` WRITE;
/*!40000 ALTER TABLE `processinherentvariable` DISABLE KEYS */;
INSERT INTO `processinherentvariable` VALUES (19,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,'address','',4,'',''),(20,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,'ip','',4,'8.8.8.8','8.8.8.8'),(21,'0',2,'address','',4,'',''),(22,'0',1,'ip','',4,'8.8.8.8','8.8.8.8'),(23,'0',2,'address','',4,'',''),(24,'0',1,'ip','',4,'8.8.8.8','8.8.8.8'),(25,'0',2,'address','',4,'',''),(26,'0',1,'ip','',4,'8.8.8.8','8.8.8.8'),(27,'9',2,'address','',4,'',''),(28,'9',1,'ip','',4,'8.8.8.8','8.8.8.8'),(29,'0',2,'address','',4,'',''),(30,'0',1,'ip','',4,'8.8.8.8','8.8.8.8'),(31,'0',2,'address','',4,'',''),(32,'0',1,'ip','',4,'8.8.8.8','8.8.8.8'),(33,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,'address','',4,'',''),(34,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,'ip','',4,'8.8.8.8','8.8.8.8'),(35,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,'address','',4,'',''),(36,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,'ip','',4,'8.8.8.8','8.8.8.8');
/*!40000 ALTER TABLE `processinherentvariable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processlogs`
--

DROP TABLE IF EXISTS `processlogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processlogs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL,
  `log` text,
  `starttime` bigint(20) DEFAULT NULL,
  `endtime` bigint(20) DEFAULT NULL,
  `idletime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processlogs`
--

LOCK TABLES `processlogs` WRITE;
/*!40000 ALTER TABLE `processlogs` DISABLE KEYS */;
INSERT INTO `processlogs` VALUES (8,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2','Process ID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 3, Expression: EndOf(1).\nDO ACTION----action: Activity, object: 3, executed.\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 13, Expression: Initialized(3).\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 14, Expression: Started(3).\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 15, Expression: EndOf(3).\nDO ACTION----action: Activity, object: 2, executed.\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 7, Expression: Initialized(2).\nPROCESS EVENT----ProcessID: f1ee3bb3-f89c-4fe5-9610-413f640c5dd2, EventID: 9, Expression: EndOf(2).\nProcess Complete\n',1491537076988,1491537076988,0),(9,'0',NULL,1491577121038,1491577121204,NULL),(10,'0',NULL,1491577302225,1491577302327,NULL),(11,'0',NULL,1491577458022,1491577458200,NULL),(12,'9',NULL,1491577789863,1491577790580,NULL),(13,'0',NULL,1491629012248,1491629012934,NULL),(14,'0',NULL,1491629120782,1491629261245,NULL),(15,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',NULL,1491629566304,1491629573036,NULL),(16,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b','Process ID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 3, Expression: EndOf(1).\nDO ACTION----action: Activity, object: 3, executed.\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 13, Expression: Initialized(3).\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 14, Expression: Started(3).\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 15, Expression: EndOf(3).\nDO ACTION----action: Activity, object: 2, executed.\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 7, Expression: Initialized(2).\nPROCESS EVENT----ProcessID: 4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b, EventID: 9, Expression: EndOf(2).\nProcess Complete\n',1491630134089,1491630134089,0);
/*!40000 ALTER TABLE `processlogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processobject`
--

DROP TABLE IF EXISTS `processobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `ISInput` tinyint(1) DEFAULT NULL,
  `ISOutput` tinyint(1) DEFAULT NULL,
  `ISVisible` tinyint(1) DEFAULT NULL,
  `ObjectType` smallint(6) DEFAULT NULL,
  `Scope` smallint(6) DEFAULT NULL,
  `PackageObjectID` smallint(6) DEFAULT NULL,
  `State` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processobject`
--

LOCK TABLES `processobject` WRITE;
/*!40000 ALTER TABLE `processobject` DISABLE KEYS */;
INSERT INTO `processobject` VALUES (19,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,'address',0,0,0,1,0,0,0),(20,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,'ip',0,0,0,1,0,0,0),(21,'0',2,'address',0,0,0,1,0,0,0),(22,'0',1,'ip',0,0,0,1,0,0,0),(23,'0',2,'address',0,0,0,1,0,0,0),(24,'0',1,'ip',0,0,0,1,0,0,0),(25,'0',2,'address',0,0,0,1,0,0,0),(26,'0',1,'ip',0,0,0,1,0,0,0),(27,'9',2,'address',0,0,0,1,0,0,0),(28,'9',1,'ip',0,0,0,1,0,0,0),(29,'0',2,'address',0,0,0,1,0,0,0),(30,'0',1,'ip',0,0,0,1,0,0,0),(31,'0',2,'address',0,0,0,1,0,0,0),(32,'0',1,'ip',0,0,0,1,0,0,0),(33,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,'address',0,0,0,1,0,0,0),(34,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,'ip',0,0,0,1,0,0,0),(35,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,'address',0,0,0,1,0,0,0),(36,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,'ip',0,0,0,1,0,0,0);
/*!40000 ALTER TABLE `processobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processprocessecarule`
--

DROP TABLE IF EXISTS `processprocessecarule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processprocessecarule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) NOT NULL DEFAULT '',
  `RuleID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ActionExpression` varchar(200) DEFAULT NULL,
  `Probability` float DEFAULT NULL,
  `ProbabilityCoefficient` float DEFAULT NULL,
  `ActiveTime` datetime DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processprocessecarule`
--

LOCK TABLES `processprocessecarule` WRITE;
/*!40000 ALTER TABLE `processprocessecarule` DISABLE KEYS */;
INSERT INTO `processprocessecarule` VALUES (19,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',1,3,0,'(Activity.3)',0,0,'2017-04-07 00:00:00',1),(20,'f1ee3bb3-f89c-4fe5-9610-413f640c5dd2',2,15,0,'(Activity.2)',0,0,'2017-04-07 00:00:00',1),(21,'0',1,3,0,'(Activity.3)',0,0,'2017-04-07 00:00:00',0),(22,'0',2,15,0,'(Activity.2)',0,0,'2017-04-07 00:00:00',0),(23,'0',1,3,0,'(Activity.3)',0,0,'2017-04-07 00:00:00',0),(24,'0',2,15,0,'(Activity.2)',0,0,'2017-04-07 00:00:00',0),(25,'0',1,3,0,'(Activity.3)',0,0,'2017-04-07 00:00:00',0),(26,'0',2,15,0,'(Activity.2)',0,0,'2017-04-07 00:00:00',0),(27,'9',1,3,0,'(Activity.3)',0,0,'2017-04-07 00:00:00',0),(28,'9',2,15,0,'(Activity.2)',0,0,'2017-04-07 00:00:00',0),(29,'0',1,3,0,'(Activity.3)',0,0,'2017-04-08 00:00:00',0),(30,'0',2,15,0,'(Activity.2)',0,0,'2017-04-08 00:00:00',0),(31,'0',1,3,0,'(Activity.3)',0,0,'2017-04-08 00:00:00',0),(32,'0',2,15,0,'(Activity.2)',0,0,'2017-04-08 00:00:00',0),(33,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',1,3,0,'(Activity.3)',0,0,'2017-04-08 00:00:00',0),(34,'1cbff39c-fc42-4f6b-bbdf-dbc206536781',2,15,0,'(Activity.2)',0,0,'2017-04-08 00:00:00',0),(35,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',1,3,0,'(Activity.3)',0,0,'2017-04-08 00:00:00',1),(36,'4ee9e5b9-7cba-4e3c-8df4-0714bfc7852b',2,15,0,'(Activity.2)',0,0,'2017-04-08 00:00:00',1);
/*!40000 ALTER TABLE `processprocessecarule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processrepeatedinformation`
--

DROP TABLE IF EXISTS `processrepeatedinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `processrepeatedinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ProcessID` varchar(50) DEFAULT NULL,
  `RepeatedType` smallint(6) DEFAULT NULL,
  `RepeatedID1` int(11) DEFAULT NULL,
  `RepeatedID2` int(11) DEFAULT NULL,
  `RepeatedTime` smallint(6) DEFAULT NULL,
  `StartTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Parameter1` varchar(50) DEFAULT NULL,
  `Parameter2` varchar(50) DEFAULT NULL,
  `Parameter3` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processrepeatedinformation`
--

LOCK TABLES `processrepeatedinformation` WRITE;
/*!40000 ALTER TABLE `processrepeatedinformation` DISABLE KEYS */;
/*!40000 ALTER TABLE `processrepeatedinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170320075705'),('20170320075706'),('20170320075707'),('20170320075708'),('20170320075709'),('20170320075710'),('20170320075711'),('20170320075712'),('20170320075713'),('20170322123122'),('20170405022809'),('20170405053607'),('20170406051037'),('20170406051751'),('20170406052745'),('20170406090808');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shared_process_privileges`
--

DROP TABLE IF EXISTS `shared_process_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shared_process_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `process_id` int(11) DEFAULT NULL,
  `edit_department_id` int(11) DEFAULT NULL,
  `execute_department_id` int(11) DEFAULT NULL,
  `delete_department_id` int(11) DEFAULT NULL,
  `is_shared_sample_input` tinyint(1) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_shared_process_privileges_on_delete_department_id` (`delete_department_id`),
  KEY `index_shared_process_privileges_on_edit_department_id` (`edit_department_id`),
  KEY `index_shared_process_privileges_on_execute_department_id` (`execute_department_id`),
  KEY `index_shared_process_privileges_on_process_id` (`process_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shared_process_privileges`
--

LOCK TABLES `shared_process_privileges` WRITE;
/*!40000 ALTER TABLE `shared_process_privileges` DISABLE KEYS */;
/*!40000 ALTER TABLE `shared_process_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemapplicationinformation`
--

DROP TABLE IF EXISTS `systemapplicationinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemapplicationinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `Description` longtext,
  `ApplicationName` varchar(100) DEFAULT NULL,
  `ApplicationType` smallint(6) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemapplicationinformation`
--

LOCK TABLES `systemapplicationinformation` WRITE;
/*!40000 ALTER TABLE `systemapplicationinformation` DISABLE KEYS */;
INSERT INTO `systemapplicationinformation` VALUES (1,12,'','IpAddressSearchWebService:getCountryCityByIp',4,5,6);
/*!40000 ALTER TABLE `systemapplicationinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemschema`
--

DROP TABLE IF EXISTS `systemschema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemschema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `SchemaID` int(11) NOT NULL DEFAULT '0',
  `SchemaName` varchar(100) DEFAULT NULL,
  `description` mediumtext,
  `SchemaText` mediumtext,
  `SchemaType` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemschema`
--

LOCK TABLES `systemschema` WRITE;
/*!40000 ALTER TABLE `systemschema` DISABLE KEYS */;
/*!40000 ALTER TABLE `systemschema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `systemxmldocument`
--

DROP TABLE IF EXISTS `systemxmldocument`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `systemxmldocument` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ObjectID` int(11) DEFAULT NULL,
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `FromSchemaID` int(11) DEFAULT NULL,
  `XML` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `systemxmldocument`
--

LOCK TABLES `systemxmldocument` WRITE;
/*!40000 ALTER TABLE `systemxmldocument` DISABLE KEYS */;
INSERT INTO `systemxmldocument` VALUES (1,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `systemxmldocument` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_algorithms`
--

DROP TABLE IF EXISTS `test_algorithms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `test_algorithms` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `param1` int(11) DEFAULT NULL,
  `param2` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `param3` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `process_information_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_test_algorithms_on_process_information_id` (`process_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_algorithms`
--

LOCK TABLES `test_algorithms` WRITE;
/*!40000 ALTER TABLE `test_algorithms` DISABLE KEYS */;
INSERT INTO `test_algorithms` VALUES (1,NULL,12,NULL,NULL,1,'2017-04-07 10:51:00','2017-04-07 10:51:00'),(2,NULL,22,NULL,NULL,2,'2017-04-07 13:59:51','2017-04-07 13:59:51'),(3,NULL,22,NULL,NULL,3,'2017-04-07 14:11:27','2017-04-07 14:11:27'),(4,NULL,22,NULL,NULL,4,'2017-04-07 14:17:04','2017-04-07 14:17:04'),(5,NULL,22,NULL,NULL,5,'2017-04-07 15:01:42','2017-04-07 15:01:42'),(6,NULL,2,NULL,NULL,6,'2017-04-07 15:03:34','2017-04-07 15:03:34'),(7,NULL,2,NULL,NULL,7,'2017-04-07 15:05:12','2017-04-07 15:05:12'),(8,NULL,3,NULL,NULL,8,'2017-04-07 15:07:05','2017-04-07 15:07:05'),(9,NULL,2,NULL,NULL,9,'2017-04-07 15:09:17','2017-04-07 15:09:17');
/*!40000 ALTER TABLE `test_algorithms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uplaod_files`
--

DROP TABLE IF EXISTS `uplaod_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `uplaod_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text COLLATE utf8_unicode_ci,
  `path` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `process_information_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_uplaod_files_on_process_information_id` (`process_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uplaod_files`
--

LOCK TABLES `uplaod_files` WRITE;
/*!40000 ALTER TABLE `uplaod_files` DISABLE KEYS */;
/*!40000 ALTER TABLE `uplaod_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upload_files`
--

DROP TABLE IF EXISTS `upload_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `upload_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text,
  `path` text,
  `process_information_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_upload_files_on_process_information_id` (`process_information_id`),
  CONSTRAINT `fk_rails_858c62fab4` FOREIGN KEY (`process_information_id`) REFERENCES `process_informations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upload_files`
--

LOCK TABLES `upload_files` WRITE;
/*!40000 ALTER TABLE `upload_files` DISABLE KEYS */;
INSERT INTO `upload_files` VALUES (1,'1.jpeg','/Users/xfhuang/code/Website/analysis_website/public/upload/1.jpeg',1,'2017-04-07 10:50:55','2017-04-07 10:50:55'),(2,'1.jpeg','/Users/xfhuang/code/Website/analysis_website/public/upload/1.jpeg',2,'2017-04-07 13:59:47','2017-04-07 13:59:47'),(3,'4.jpeg','/Users/xfhuang/code/Website/analysis_website/public/upload/4.jpeg',3,'2017-04-07 14:11:24','2017-04-07 14:11:24'),(4,'figure_4.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_4.png',4,'2017-04-07 14:16:58','2017-04-07 14:16:58'),(5,'figure_2png.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_2png.png',5,'2017-04-07 15:01:39','2017-04-07 15:01:39'),(6,'figure_4.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_4.png',6,'2017-04-07 15:03:31','2017-04-07 15:03:31'),(7,'figure_3.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_3.png',7,'2017-04-07 15:05:10','2017-04-07 15:05:10'),(8,'figure_3.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_3.png',8,'2017-04-07 15:07:03','2017-04-07 15:07:03'),(9,'figure_2png.png','/Users/xfhuang/code/Website/analysis_website/public/upload/figure_2png.png',9,'2017-04-07 15:09:07','2017-04-07 15:09:07');
/*!40000 ALTER TABLE `upload_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_categories`
--

DROP TABLE IF EXISTS `workflow_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_categories`
--

LOCK TABLES `workflow_categories` WRITE;
/*!40000 ALTER TABLE `workflow_categories` DISABLE KEYS */;
INSERT INTO `workflow_categories` VALUES (1,'Prediction',NULL,'2017-04-07 10:43:27','2017-04-07 10:43:27'),(2,'Clustering',NULL,'2017-04-07 10:43:27','2017-04-07 10:43:27'),(3,'Classification',NULL,'2017-04-07 10:43:27','2017-04-07 10:43:27'),(4,'Regression',NULL,'2017-04-07 10:43:27','2017-04-07 10:43:27');
/*!40000 ALTER TABLE `workflow_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_comments`
--

DROP TABLE IF EXISTS `workflow_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8_unicode_ci,
  `score` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `comment_parent_id` int(11) DEFAULT NULL,
  `workflow_information_id` int(11) DEFAULT NULL,
  `process_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_comments_on_author_id` (`author_id`),
  KEY `index_workflow_comments_on_comment_parent_id` (`comment_parent_id`),
  KEY `index_workflow_comments_on_process_id` (`process_id`),
  KEY `index_workflow_comments_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_comments`
--

LOCK TABLES `workflow_comments` WRITE;
/*!40000 ALTER TABLE `workflow_comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_information_and_tags`
--

DROP TABLE IF EXISTS `workflow_information_and_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_information_and_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `workflow_tag_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_information_and_tags_on_workflow_information_id` (`workflow_information_id`),
  KEY `index_workflow_information_and_tags_on_workflow_tag_id` (`workflow_tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_information_and_tags`
--

LOCK TABLES `workflow_information_and_tags` WRITE;
/*!40000 ALTER TABLE `workflow_information_and_tags` DISABLE KEYS */;
INSERT INTO `workflow_information_and_tags` VALUES (1,4,1,'2017-04-07 10:44:00','2017-04-07 10:44:00');
/*!40000 ALTER TABLE `workflow_information_and_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_informations`
--

DROP TABLE IF EXISTS `workflow_informations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_informations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `introduction` text COLLATE utf8_unicode_ci,
  `detial_description` text COLLATE utf8_unicode_ci,
  `version_name` text COLLATE utf8_unicode_ci,
  `category_id` int(11) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `last_editor_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `valid_from` datetime DEFAULT NULL,
  `valid_to` datetime DEFAULT NULL,
  `persistent` tinyint(1) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `most_possible_duration` int(11) DEFAULT NULL,
  `minimal_duration` int(11) DEFAULT NULL,
  `maximal_duration` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_informations_on_author_id` (`author_id`),
  KEY `index_workflow_informations_on_category_id` (`category_id`),
  KEY `index_workflow_informations_on_last_editor_id` (`last_editor_id`),
  KEY `index_workflow_informations_on_tag_id` (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_informations`
--

LOCK TABLES `workflow_informations` WRITE;
/*!40000 ALTER TABLE `workflow_informations` DISABLE KEYS */;
INSERT INTO `workflow_informations` VALUES (3,'wfTest','wfTest',NULL,NULL,2,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-05 12:45:43','2017-04-05 12:45:43'),(4,'Prediction based on linear regression','This is a model to predict based on linear regression.','Initialize the model','V 0.0.1',1,NULL,1,1,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-07 10:43:10','2017-04-07 10:44:12');
/*!40000 ALTER TABLE `workflow_informations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_privileges`
--

DROP TABLE IF EXISTS `workflow_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_privileges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `workflow_information_id` int(11) DEFAULT NULL,
  `edit_department_id` int(11) DEFAULT NULL,
  `execute_department_id` int(11) DEFAULT NULL,
  `delete_department_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_workflow_privileges_on_delete_department_id` (`delete_department_id`),
  KEY `index_workflow_privileges_on_edit_department_id` (`edit_department_id`),
  KEY `index_workflow_privileges_on_execute_department_id` (`execute_department_id`),
  KEY `index_workflow_privileges_on_workflow_information_id` (`workflow_information_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_privileges`
--

LOCK TABLES `workflow_privileges` WRITE;
/*!40000 ALTER TABLE `workflow_privileges` DISABLE KEYS */;
INSERT INTO `workflow_privileges` VALUES (1,4,1,1,1,'2017-04-07 10:43:10','2017-04-07 10:43:10');
/*!40000 ALTER TABLE `workflow_privileges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflow_tags`
--

DROP TABLE IF EXISTS `workflow_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflow_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_tags`
--

LOCK TABLES `workflow_tags` WRITE;
/*!40000 ALTER TABLE `workflow_tags` DISABLE KEYS */;
INSERT INTO `workflow_tags` VALUES (1,'linear','2017-04-07 10:44:00','2017-04-07 10:44:00');
/*!40000 ALTER TABLE `workflow_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowactivityinformation`
--

DROP TABLE IF EXISTS `workflowactivityinformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowactivityinformation` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  `ActivityName` varchar(50) DEFAULT NULL,
  `Layer` smallint(6) DEFAULT NULL,
  `ParentID` int(11) DEFAULT NULL,
  `IsComposite` tinyint(1) DEFAULT NULL,
  `Description` mediumtext,
  `ChoiceManager` tinyint(1) NOT NULL,
  `ActivityType` smallint(6) DEFAULT NULL,
  `ActivityImplementation` smallint(6) DEFAULT NULL,
  `StartTime` float DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  `IconID` smallint(6) DEFAULT NULL,
  `ActivityURL` mediumtext,
  `MultiPersonMode` smallint(6) DEFAULT NULL,
  `SubmitPersonNumber` smallint(6) DEFAULT NULL,
  `TWCID` int(11) DEFAULT NULL,
  `IsCallback` tinyint(1) DEFAULT NULL,
  `ObjectList` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowactivityinformation`
--

LOCK TABLES `workflowactivityinformation` WRITE;
/*!40000 ALTER TABLE `workflowactivityinformation` DISABLE KEYS */;
INSERT INTO `workflowactivityinformation` VALUES (1,3,1,'start',1,-1,0,'开始活动',0,1,0,0,0,0,'None',0,0,0,0,'...'),(2,3,2,'end',1,-1,0,'结束活动',0,2,0,0,0,0,'None',0,0,0,0,'...'),(3,3,3,'getAddress',1,-1,0,'activity',0,3,2,0,0,0,'none',0,0,1,0,'...');
/*!40000 ALTER TABLE `workflowactivityinformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowactivityinputmapping`
--

DROP TABLE IF EXISTS `workflowactivityinputmapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowactivityinputmapping` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL,
  `ActivityID` int(11) NOT NULL,
  `DataflowID` int(11) NOT NULL,
  `InputSchema` mediumtext,
  `InputXML` mediumtext,
  `XSLT` mediumtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowactivityinputmapping`
--

LOCK TABLES `workflowactivityinputmapping` WRITE;
/*!40000 ALTER TABLE `workflowactivityinputmapping` DISABLE KEYS */;
INSERT INTO `workflowactivityinputmapping` VALUES (1,3,3,6,'<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<schema xmlns=\"http://www.w3.org/2001/XMLSchema\" xmlns:tns=\"http://www.example.org/DocumentSchema\" targetNamespace=\"http://www.example.org/DocumentSchema\">\r\n   <element name=\"Parameter\" type=\"tns:Parameter\" />\r\n   <complexType name=\"Parameter\">\r\n      <sequence>\r\n         <element name=\"ip\" type=\"tns:ip\" />\r\n      </sequence>\r\n   </complexType>\r\n   <complexType name=\"ip\">\r\n      <sequence>\r\n         <element name=\"NAME\" type=\"string\" />\r\n         <element name=\"TYPE\" type=\"string\" />\r\n         <element name=\"VALUE\" type=\"string\" />\r\n      </sequence>\r\n      <attribute name=\"ObjectID\" type=\"int\" fixed=\"1\" />\r\n   </complexType>\r\n</schema>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<Parameter>\r\n   <ip ObjectID=\"1\">\r\n      <NAME />\r\n      <TYPE />\r\n      <VALUE />\r\n   </ip>\r\n</Parameter>\r\n\r\n','<?xml version=\"1.0\" encoding=\"UTF-8\"?>\r\n<xsl:stylesheet xmlns:xsl=\"http://www.w3.org/1999/XSL/Transform\" version=\"1.0\">\r\n   <xsl:template match=\"/\">\r\n      <INPUT>\r\n         <theIpAddress>\r\n            <NAME>\r\n               <xsl:value-of select=\"Parameter/ip/NAME\" />\r\n            </NAME>\r\n            <TYPE>\r\n               <xsl:value-of select=\"Parameter/ip/TYPE\" />\r\n            </TYPE>\r\n            <VALUE>\r\n               <xsl:value-of select=\"Parameter/ip/VALUE\" />\r\n            </VALUE>\r\n         </theIpAddress>\r\n      </INPUT>\r\n   </xsl:template>\r\n</xsl:stylesheet>\r\n\r\n');
/*!40000 ALTER TABLE `workflowactivityinputmapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowactivityinvokingapplication`
--

DROP TABLE IF EXISTS `workflowactivityinvokingapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowactivityinvokingapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ActivityID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` int(11) NOT NULL DEFAULT '0',
  `InvocationType` smallint(6) DEFAULT NULL,
  `InputSchemaID` int(11) DEFAULT NULL,
  `OutputSchemaID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowactivityinvokingapplication`
--

LOCK TABLES `workflowactivityinvokingapplication` WRITE;
/*!40000 ALTER TABLE `workflowactivityinvokingapplication` DISABLE KEYS */;
INSERT INTO `workflowactivityinvokingapplication` VALUES (1,3,3,12,1,0,0);
/*!40000 ALTER TABLE `workflowactivityinvokingapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowapplication`
--

DROP TABLE IF EXISTS `workflowapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowapplication` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ApplicationID` smallint(6) NOT NULL DEFAULT '0',
  `Description` varchar(50) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowapplication`
--

LOCK TABLES `workflowapplication` WRITE;
/*!40000 ALTER TABLE `workflowapplication` DISABLE KEYS */;
INSERT INTO `workflowapplication` VALUES (1,3,12,'IpAddressSearchWebService:getCountryCityByIp');
/*!40000 ALTER TABLE `workflowapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowcondition`
--

DROP TABLE IF EXISTS `workflowcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ConditionRepresentation` varchar(200) DEFAULT NULL,
  `ConditionName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowcondition`
--

LOCK TABLES `workflowcondition` WRITE;
/*!40000 ALTER TABLE `workflowcondition` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflowcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowcontrolflowcondition`
--

DROP TABLE IF EXISTS `workflowcontrolflowcondition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowcontrolflowcondition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` smallint(6) NOT NULL DEFAULT '0',
  `ControlFlowID` smallint(6) NOT NULL DEFAULT '0',
  `ConditionID` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowcontrolflowcondition`
--

LOCK TABLES `workflowcontrolflowcondition` WRITE;
/*!40000 ALTER TABLE `workflowcontrolflowcondition` DISABLE KEYS */;
INSERT INTO `workflowcontrolflowcondition` VALUES (1,3,2,0),(2,3,3,0),(3,3,4,0),(4,3,5,0);
/*!40000 ALTER TABLE `workflowcontrolflowcondition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowevent`
--

DROP TABLE IF EXISTS `workflowevent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowevent` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `EventName` varchar(50) DEFAULT NULL,
  `Description` varchar(100) DEFAULT NULL,
  `EventRepresentation` longtext,
  `EventType` smallint(6) DEFAULT NULL,
  `LogicType` smallint(6) DEFAULT NULL,
  `ActivityID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowevent`
--

LOCK TABLES `workflowevent` WRITE;
/*!40000 ALTER TABLE `workflowevent` DISABLE KEYS */;
INSERT INTO `workflowevent` VALUES (1,3,1,'Initialized(1)','活动(1)成功进行初始化','Initialized(1)',1,0,1),(2,3,2,'Started(1)','活动(1)已经运行','Started(1)',1,0,1),(3,3,3,'EndOf(1)','活动(1)结束','EndOf(1)',1,0,1),(4,3,4,'Overtime(1)','活动(1)已经超时','Overtime(1)',1,0,1),(5,3,5,'Aborted(1)','活动(1)已经被放弃','Aborted(1)',1,0,1),(6,3,6,'Error(1)','活动(1)处于错误状态','Error(1)',1,0,1),(7,3,7,'Initialized(2)','活动(2)成功进行初始化','Initialized(2)',1,0,2),(8,3,8,'Started(2)','活动(2)已经运行','Started(2)',1,0,2),(9,3,9,'EndOf(2)','活动(2)结束','EndOf(2)',1,0,2),(10,3,10,'Overtime(2)','活动(2)已经超时','Overtime(2)',1,0,2),(11,3,11,'Aborted(2)','活动(2)已经被放弃','Aborted(2)',1,0,2),(12,3,12,'Error(2)','活动(2)处于错误状态','Error(2)',1,0,2),(13,3,13,'Initialized(3)','活动(3)成功进行初始化','Initialized(3)',1,0,3),(14,3,14,'Started(3)','活动(3)已经运行','Started(3)',1,0,3),(15,3,15,'EndOf(3)','活动(3)结束','EndOf(3)',1,0,3),(16,3,16,'Overtime(3)','活动(3)已经超时','Overtime(3)',1,0,3),(17,3,17,'Aborted(3)','活动(3)已经被放弃','Aborted(3)',1,0,3),(18,3,18,'Error(3)','活动(3)处于错误状态','Error(3)',1,0,3);
/*!40000 ALTER TABLE `workflowevent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowflow`
--

DROP TABLE IF EXISTS `workflowflow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowflow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ModelType` smallint(6) NOT NULL DEFAULT '0',
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ParentID` int(11) DEFAULT NULL,
  `Type` smallint(6) NOT NULL DEFAULT '0',
  `FromObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectId1` int(11) NOT NULL DEFAULT '0',
  `ToObjectType` smallint(6) NOT NULL DEFAULT '0',
  `ObjectID2` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowflow`
--

LOCK TABLES `workflowflow` WRITE;
/*!40000 ALTER TABLE `workflowflow` DISABLE KEYS */;
INSERT INTO `workflowflow` VALUES (1,1,3,7,-1,2,1,3,1,2),(2,1,3,6,-1,2,1,1,1,3),(3,1,3,1,-1,2,1,0,1,3),(4,1,3,5,-1,1,2,2,1,2),(5,1,3,4,-1,1,1,3,2,2),(6,1,3,3,-1,1,2,1,1,3),(7,1,3,2,-1,1,1,1,2,1);
/*!40000 ALTER TABLE `workflowflow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowflowobjectcontrol`
--

DROP TABLE IF EXISTS `workflowflowobjectcontrol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowflowobjectcontrol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` smallint(6) NOT NULL DEFAULT '0',
  `Privilege` smallint(6) DEFAULT NULL,
  `ObjectType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowflowobjectcontrol`
--

LOCK TABLES `workflowflowobjectcontrol` WRITE;
/*!40000 ALTER TABLE `workflowflowobjectcontrol` DISABLE KEYS */;
INSERT INTO `workflowflowobjectcontrol` VALUES (1,3,7,2,1,1),(2,3,6,1,1,1),(3,3,1,2,1,1);
/*!40000 ALTER TABLE `workflowflowobjectcontrol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowflowobjects`
--

DROP TABLE IF EXISTS `workflowflowobjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowflowobjects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `FlowID` int(11) NOT NULL DEFAULT '0',
  `DroolsRuleID` int(11) DEFAULT NULL,
  `FromActivityID` int(11) DEFAULT NULL,
  `ToActivityID` int(11) DEFAULT NULL,
  `XSLTO2M` longtext,
  `XSLTM2I` longtext,
  `OXMLID` int(11) DEFAULT NULL,
  `MXMLID` int(11) DEFAULT NULL,
  `IXMLID` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowflowobjects`
--

LOCK TABLES `workflowflowobjects` WRITE;
/*!40000 ALTER TABLE `workflowflowobjects` DISABLE KEYS */;
INSERT INTO `workflowflowobjects` VALUES (1,3,1,1,0,3,'',NULL,NULL,NULL,NULL),(2,3,6,2,1,3,NULL,NULL,NULL,0,0),(3,3,7,3,3,2,NULL,NULL,0,0,NULL);
/*!40000 ALTER TABLE `workflowflowobjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowinherentvariable`
--

DROP TABLE IF EXISTS `workflowinherentvariable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowinherentvariable` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `ObjectID` int(11) NOT NULL DEFAULT '0',
  `ObjectName` varchar(50) DEFAULT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ValueType` smallint(6) DEFAULT NULL,
  `InitialValue` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowinherentvariable`
--

LOCK TABLES `workflowinherentvariable` WRITE;
/*!40000 ALTER TABLE `workflowinherentvariable` DISABLE KEYS */;
INSERT INTO `workflowinherentvariable` VALUES (1,3,2,'address','',4,''),(2,3,1,'ip','',4,'8.8.8.8');
/*!40000 ALTER TABLE `workflowinherentvariable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowobject`
--

DROP TABLE IF EXISTS `workflowobject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowobject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` varchar(50) DEFAULT NULL,
  `ObjectID` int(11) DEFAULT NULL,
  `ObjectName` varchar(100) DEFAULT NULL,
  `ISInput` tinyint(1) DEFAULT NULL,
  `ISOutput` tinyint(1) DEFAULT NULL,
  `ISVisible` tinyint(1) DEFAULT NULL,
  `ObjectType` smallint(6) DEFAULT NULL,
  `Scope` smallint(6) DEFAULT NULL,
  `PackageObjectID` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowobject`
--

LOCK TABLES `workflowobject` WRITE;
/*!40000 ALTER TABLE `workflowobject` DISABLE KEYS */;
INSERT INTO `workflowobject` VALUES (1,'3',2,'address',0,0,0,1,0,0),(2,'3',1,'ip',0,0,0,1,0,0);
/*!40000 ALTER TABLE `workflowobject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workflowprocessecarule`
--

DROP TABLE IF EXISTS `workflowprocessecarule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workflowprocessecarule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `WorkflowID` int(11) NOT NULL DEFAULT '0',
  `RuleID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `ConditionID` int(11) NOT NULL DEFAULT '0',
  `ActionExpression` varchar(200) DEFAULT NULL,
  `Probability` float DEFAULT NULL,
  `ProbabilityCoefficient` float DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflowprocessecarule`
--

LOCK TABLES `workflowprocessecarule` WRITE;
/*!40000 ALTER TABLE `workflowprocessecarule` DISABLE KEYS */;
INSERT INTO `workflowprocessecarule` VALUES (1,3,1,3,0,'(Activity.3)',0,0),(2,3,2,15,0,'(Activity.2)',0,0);
/*!40000 ALTER TABLE `workflowprocessecarule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-08 14:07:26

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department_informations`
--

LOCK TABLES `department_informations` WRITE;
/*!40000 ALTER TABLE `department_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `department_informations` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person_informations`
--

LOCK TABLES `person_informations` WRITE;
/*!40000 ALTER TABLE `person_informations` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process_informations`
--

LOCK TABLES `process_informations` WRITE;
/*!40000 ALTER TABLE `process_informations` DISABLE KEYS */;
/*!40000 ALTER TABLE `process_informations` ENABLE KEYS */;
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
INSERT INTO `schema_migrations` VALUES ('20170320075705'),('20170320075706'),('20170320075707'),('20170320075708'),('20170320075709'),('20170320075710'),('20170320075711'),('20170320075712'),('20170320075713'),('20170322123122'),('20170405022809'),('20170405053607');
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
  `isSharedSampleInput` tinyint(1) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_algorithms`
--

LOCK TABLES `test_algorithms` WRITE;
/*!40000 ALTER TABLE `test_algorithms` DISABLE KEYS */;
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
  PRIMARY KEY (`id`)
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_categories`
--

LOCK TABLES `workflow_categories` WRITE;
/*!40000 ALTER TABLE `workflow_categories` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_information_and_tags`
--

LOCK TABLES `workflow_information_and_tags` WRITE;
/*!40000 ALTER TABLE `workflow_information_and_tags` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_informations`
--

LOCK TABLES `workflow_informations` WRITE;
/*!40000 ALTER TABLE `workflow_informations` DISABLE KEYS */;
INSERT INTO `workflow_informations` VALUES (1,'asegfaw','sadfawefaf',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2017-04-05 12:45:43','2017-04-05 12:45:43');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_privileges`
--

LOCK TABLES `workflow_privileges` WRITE;
/*!40000 ALTER TABLE `workflow_privileges` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workflow_tags`
--

LOCK TABLES `workflow_tags` WRITE;
/*!40000 ALTER TABLE `workflow_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `workflow_tags` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-05 20:46:49

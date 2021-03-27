-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: localhost    Database: discipleship
-- ------------------------------------------------------
-- Server version	8.0.22

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
-- Temporary view structure for view `attendance_view`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `attendance_view` AS SELECT 
 1 AS `meeting_date`,
 1 AS `attendance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `class_attendance_view`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `class_attendance_view` AS SELECT 
 1 AS `meeting_date`,
 1 AS `class_id`,
 1 AS `attendance`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `classes_view`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classes_view` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `leader`,
 1 AS `assistant`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `leader_full_name`,
 1 AS `assistant_full_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `failed_jobs`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `members_view`
--

SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `members_view` AS SELECT 
 1 AS `id`,
 1 AS `first_name`,
 1 AS `middle_name`,
 1 AS `last_name`,
 1 AS `contact_number`,
 1 AS `email`,
 1 AS `member_type`,
 1 AS `class_id`,
 1 AS `created_at`,
 1 AS `updated_at`,
 1 AS `full_name`,
 1 AS `class_name`,
 1 AS `member_type_name`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `migrations`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2014_10_12_200000_add_two_factor_columns_to_users_table',1),(4,'2019_08_19_000000_create_failed_jobs_table',1),(5,'2021_03_15_134022_create_discipleship_table',1),(6,'2021_03_15_134553_create_class_table',1),(7,'2021_03_15_135816_create_attendance_table',1),(8,'2021_03_15_140502_create_setups_table',1),(9,'2021_03_15_142043_create_class_meeting_table',1),(10,'2021_03_15_160156_edit_members_table',2),(11,'2021_03_16_074158_create_members_view',3),(12,'2021_03_16_105836_create_classes_view',4),(13,'2021_03_16_105932_edit_classes_table',5),(14,'2021_03_16_152408_edit_members_middle_name_table',6),(15,'2021_03_18_075919_edit_meetings_table',7),(16,'2021_03_22_173140_create_report_table',8),(17,'2021_03_23_192320_create_attendance_view',9),(18,'2021_03_23_193501_create_class_attendance_view',9);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_attendance`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_attendance` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meeting_id` int NOT NULL,
  `member_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_attendance`
--

LOCK TABLES `tbl_attendance` WRITE;
/*!40000 ALTER TABLE `tbl_attendance` DISABLE KEYS */;
INSERT INTO `tbl_attendance` VALUES (4,3,37,'2021-03-19 09:26:15','2021-03-19 09:26:15'),(5,3,102,'2021-03-19 09:26:15','2021-03-19 09:26:15'),(6,3,36,'2021-03-19 09:26:15','2021-03-19 09:26:15'),(7,3,42,'2021-03-19 09:26:15','2021-03-19 09:26:15'),(8,4,2,'2021-03-19 09:29:43','2021-03-19 09:29:43'),(9,4,60,'2021-03-19 09:29:43','2021-03-19 09:29:43'),(10,4,59,'2021-03-19 09:29:43','2021-03-19 09:29:43'),(11,4,58,'2021-03-19 09:29:43','2021-03-19 09:29:43'),(12,5,22,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(13,5,97,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(14,5,101,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(15,5,95,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(16,5,21,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(17,5,96,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(18,5,100,'2021-03-19 09:32:26','2021-03-19 09:32:26'),(19,6,67,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(20,6,63,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(21,6,8,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(22,6,9,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(23,6,62,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(24,6,66,'2021-03-19 09:34:16','2021-03-19 09:34:16'),(25,7,75,'2021-03-19 09:38:32','2021-03-19 09:38:32'),(26,7,12,'2021-03-19 09:38:32','2021-03-19 09:38:32'),(27,7,74,'2021-03-19 09:38:32','2021-03-19 09:38:32'),(28,7,78,'2021-03-19 09:38:32','2021-03-19 09:38:32'),(30,8,34,'2021-03-19 09:51:42','2021-03-19 09:51:42'),(31,8,30,'2021-03-19 09:51:42','2021-03-19 09:51:42'),(32,8,31,'2021-03-19 09:51:42','2021-03-19 09:51:42'),(33,8,33,'2021-03-19 09:51:42','2021-03-19 09:51:42'),(34,8,4,'2021-03-19 09:51:42','2021-03-19 09:51:42'),(35,9,47,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(36,9,44,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(37,9,45,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(38,9,48,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(39,9,49,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(40,9,5,'2021-03-19 09:53:03','2021-03-19 09:53:03'),(41,10,94,'2021-03-19 10:00:43','2021-03-19 10:00:43'),(42,10,19,'2021-03-19 10:00:43','2021-03-19 10:00:43'),(43,10,20,'2021-03-19 10:00:43','2021-03-19 10:00:43'),(44,10,92,'2021-03-19 10:00:43','2021-03-19 10:00:43'),(45,10,93,'2021-03-19 10:00:43','2021-03-19 10:00:43'),(46,14,80,'2021-03-21 16:24:28','2021-03-21 16:24:28'),(47,14,15,'2021-03-21 16:24:28','2021-03-21 16:24:28'),(48,14,83,'2021-03-21 16:24:28','2021-03-21 16:24:28'),(49,14,84,'2021-03-21 16:24:28','2021-03-21 16:24:28'),(50,14,81,'2021-03-21 16:24:28','2021-03-21 16:24:28'),(51,15,7,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(52,15,52,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(53,15,50,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(54,15,6,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(55,15,51,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(56,15,55,'2021-03-21 17:28:54','2021-03-21 17:28:54'),(57,16,7,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(58,16,52,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(59,16,50,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(60,16,6,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(61,16,53,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(62,16,54,'2021-03-21 18:17:44','2021-03-21 18:17:44'),(63,17,17,'2021-03-21 21:09:22','2021-03-21 21:09:22'),(64,17,18,'2021-03-21 21:09:22','2021-03-21 21:09:22'),(65,17,87,'2021-03-21 21:09:22','2021-03-21 21:09:22'),(66,18,34,'2021-03-22 16:19:29','2021-03-22 16:19:29'),(67,18,31,'2021-03-22 16:19:29','2021-03-22 16:19:29'),(68,18,33,'2021-03-22 16:19:29','2021-03-22 16:19:29'),(69,18,4,'2021-03-22 16:19:29','2021-03-22 16:19:29'),(70,18,32,'2021-03-22 16:19:29','2021-03-22 16:19:29'),(71,19,75,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(72,19,76,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(73,19,12,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(74,19,74,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(75,19,78,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(76,19,14,'2021-03-22 16:21:26','2021-03-22 16:21:26'),(77,7,104,'2021-03-22 16:23:04','2021-03-22 16:23:04'),(78,7,14,'2021-03-22 16:26:17','2021-03-22 16:26:17'),(79,19,104,'2021-03-22 16:27:30','2021-03-22 16:27:30'),(80,20,22,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(81,20,97,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(82,20,101,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(83,20,95,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(84,20,21,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(85,20,100,'2021-03-22 17:00:07','2021-03-22 17:00:07'),(86,21,67,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(87,21,63,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(88,21,8,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(89,21,9,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(90,21,62,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(91,21,66,'2021-03-22 17:09:54','2021-03-22 17:09:54'),(92,22,80,'2021-03-23 18:43:57','2021-03-23 18:43:57'),(93,22,15,'2021-03-23 18:43:57','2021-03-23 18:43:57'),(94,22,83,'2021-03-23 18:43:57','2021-03-23 18:43:57'),(95,22,81,'2021-03-23 18:43:57','2021-03-23 18:43:57'),(96,23,2,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(97,23,61,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(98,23,1,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(99,23,59,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(100,23,56,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(101,23,58,'2021-03-24 16:42:33','2021-03-24 16:42:33'),(102,23,57,'2021-03-24 16:42:33','2021-03-24 16:42:33');
/*!40000 ALTER TABLE `tbl_attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_classes`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_classes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `leader` int DEFAULT NULL,
  `assistant` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_classes`
--

LOCK TABLES `tbl_classes` WRITE;
/*!40000 ALTER TABLE `tbl_classes` DISABLE KEYS */;
INSERT INTO `tbl_classes` VALUES (1,'Group 1',6,7,'2021-03-16 13:33:30','2021-03-17 08:18:36'),(2,'Group 2',1,2,'2021-03-16 13:35:42','2021-03-16 23:07:46'),(3,'Group 3',8,9,'2021-03-16 13:35:56','2021-03-17 08:20:30'),(4,'Group 4',10,11,'2021-03-16 13:36:22','2021-03-17 08:21:04'),(5,'Somanya',23,0,'2021-03-16 13:36:33','2021-03-18 20:51:45'),(6,'Group 5',12,14,'2021-03-16 13:36:47','2021-03-18 20:42:15'),(7,'Group 6',15,16,'2021-03-16 13:36:57','2021-03-18 20:42:39'),(8,'Group 7',17,18,'2021-03-16 13:37:07','2021-03-18 20:42:58'),(9,'Group 8',19,20,'2021-03-16 13:37:17','2021-03-18 20:43:14'),(10,'Group 9',21,22,'2021-03-16 13:37:28','2021-03-18 20:43:27'),(11,'Kafui',4,0,'2021-03-16 14:18:41','2021-03-16 23:25:11'),(12,'Nana Gyan',3,0,'2021-03-16 14:18:52','2021-03-16 23:23:10'),(13,'Kenneth',5,0,'2021-03-16 14:19:03','2021-03-16 23:24:55'),(14,'Koforidua',24,0,'2021-03-18 20:44:55','2021-03-18 20:51:03'),(15,'Ashanti',25,0,'2021-03-18 20:45:15','2021-03-18 20:50:44'),(16,'Western',26,0,'2021-03-18 20:45:23','2021-03-18 20:52:10'),(17,'Northern',27,0,'2021-03-18 20:45:37','2021-03-18 20:51:25');
/*!40000 ALTER TABLE `tbl_classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_meeting`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_meeting` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int NOT NULL,
  `meeting_date` timestamp NOT NULL,
  `comments` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `material_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_meeting`
--

LOCK TABLES `tbl_meeting` WRITE;
/*!40000 ALTER TABLE `tbl_meeting` DISABLE KEYS */;
INSERT INTO `tbl_meeting` VALUES (3,12,'2021-03-14 00:00:00','Was expecting at least 10 to join but two sent PMs to be excused for some other duties.','2021-03-19 09:26:15','2021-03-19 09:26:15',3),(4,2,'2021-03-14 00:00:00','No comment was given','2021-03-19 09:29:43','2021-03-19 09:29:43',3),(5,10,'2021-03-14 00:00:00','We began with sharing personal testimonies about when and how we were saved in Christ. This was to ascertain if all practically understood and what salvation in Jesus meant.\r\n5 out of 7 members could   recall a definite experience where they were convicted of sin and willingly confessed and accepted Jesus as Lord and Savior.\r\nOne person has had no salvation experience and, from her account, is trusting in her works. \r\n\r\nOur focus, as a group, will be on understanding what salvation in Jesus means before moving onto the Assurance of Salvation.','2021-03-19 09:32:26','2021-03-19 09:32:26',3),(6,3,'2021-03-14 00:00:00','It was a very interesting meeting. The participation was good enough. There were responses to questions and they also had some 2 critical questions.\r\n1. Do you loose your salvation?\r\n2. Does the Holy Spirit reside in you immediately you accept Christ as your Lord and personal saviour?\r\nThe time at some point didnt seem enough so we added 20min more.','2021-03-19 09:34:16','2021-03-19 09:34:16',3),(7,6,'2021-03-14 00:00:00','<p>1. Network connectivity was poor. We started late and had intermittent breaks\r\n</p><p>\r\n2. We used the rest of the time to discuss our motivation for participating in the class\r\n</p><p>\r\n3. We didn’t do much with respect to the study material. We hope to do more next week God willing. </p><p>\r\n\r\n4. We have started reading the book of Romans\r\n\r\nThanks.</p>','2021-03-19 09:38:32','2021-03-22 16:26:17',3),(8,11,'2021-03-14 00:00:00','Every one except one person joined. It had network issues with some of them. Generally we started late. Some suggested that we start at 6pm, the time by which most people would have settled. One joined but was driving and could not contribute cos she would be distracted. But I think my class is enthusiastic. Took time to share the reasons for this with them. I believe some might think this material is easy like cheese , bout it is the stressing of the doctrinal points that will make the difference..... I am sure as we go along , people’s contributions will expose the weakness in their understanding and we can help to shape it up. The work is cut for us... not an easy task.','2021-03-19 09:51:42','2021-03-19 09:51:42',3),(9,13,'2021-03-14 00:00:00','1. The class exceeded the stipulated time and tackled A of the material — the theme of salvation, what we are saved from and what we are saved for. \r\n2. We encountered a few internet issues but largely it was smooth. Four out of the 5 participants were in the meeting by 5:13.','2021-03-19 09:53:03','2021-03-19 09:53:03',3),(10,9,'2021-03-14 00:00:00','THE MEMBERS WERE ENTHUSED AND MADE INTERSTING CONTRIBUTIONS.\r\nTHEY SHARED THEIR EXPERIENCES ON RECEIVING SALVATION\r\nTWO OF THEM SHARED ABOUT HOW THEY LOST THEIR FAITH IN CHRIST AT SOME POINT\r\nWE DISCUSSED THE MEANING OF SALVATION\r\nAND AN ASSIGNMENT WAS GIVEN ON  OUR SPIRITUAL STATE PRIOR TO RECEIVING SALAVATION','2021-03-19 10:00:43','2021-03-19 10:00:43',3),(13,17,'2021-03-14 00:00:00','In the northern zone we faced a lot of challenges hear so because of that we couldn\'t meet last  Sunday . but the meeting was rescheduled to take place on Saturday same time. There has been a lot of challenges all around but all thanks to God we had the solutions. As it was generally given that the meeting should happen online, some of  my disciples are not on  social media and others complained of data. Now what we agree on is trough phone call. Here it\'s the discipler  that will now be using airtime and thank God in North here with 50ps credit you can connect at most 6 individuals for more than hours on MTN network. So what I did is, I have some people,  they are also knowledgeable in the word and are willing to assist. So the group is now divided into 4. and that is how  everything went through.','2021-03-19 11:49:02','2021-03-19 11:49:02',3),(14,7,'2021-03-14 00:00:00','<p>There were very good comments coming from&nbsp; the members.&nbsp;<span style=\"font-size: 1rem;\">Only one member had technical challenges during the call.</span></p>','2021-03-21 16:24:28','2021-03-21 16:24:28',3),(15,1,'2021-03-14 00:00:00','<p>1. The class started late. We had to make private calls to members to get them to join in</p><p>2. Most of the members struggled with network issues so we had some going on and off throughout the session.</p><p>3. Participation in the discussion was one sided at a point due to the network challenges&nbsp;</p><p>4. We could not start with the study material as we spent the time discussing the purpose for the class</p><p>5. Our class may have to start the discussion with a brief study of salvation before delving into the assurance of salvation</p>','2021-03-21 17:28:54','2021-03-21 17:28:54',3),(16,1,'2021-03-21 00:00:00','<p>1. The class started a bit late this week. Again we had to make private calls to members to remind them to join in.</p><p>2. We started with the material today and finished with section A (What is salvation?) We had an interesting discussion on it and each member shared their salvation story and made contributions on the scriptures we read.&nbsp;</p><p>3. We believe the class would run smoothly if all members had access to the material during the study</p>','2021-03-21 18:17:44','2021-03-21 18:17:44',3),(17,8,'2021-03-21 00:00:00','<p>Today\'s session was handled by Daniel Offei. We began with a recap of what we did the previous week and went on to our topic of the day. We focused on the conditions necessary for salvation. We shared our personal experiences on how we got saved. One person asked about if the saying \"once saved, forever saved\" is true. Even though not many people made it, we still had a fruitful session.<br></p>','2021-03-21 21:09:22','2021-03-21 21:09:22',3),(18,11,'2021-03-21 00:00:00','<p>I think it was a good meeting.&nbsp;<span style=\"font-size: 1rem;\">The material is apt.&nbsp;</span><span style=\"font-size: 1rem;\">I think people should use your format</span></p>','2021-03-22 16:19:29','2021-03-22 16:19:29',3),(19,6,'2021-03-21 00:00:00','Today\'s class was very interactive. All class members participated in today\'s class. We did not have any network issues. We were able to start on time.&nbsp;','2021-03-22 16:21:26','2021-03-22 16:27:30',3),(20,10,'2021-03-21 00:00:00','<p>One member has opted out of the discipleship classes the inability to carve out time from his busy schedule.&nbsp;<span style=\"font-size: 1rem;\">Another was unable to join owing to poor network connectivity.&nbsp;</span><span style=\"font-size: 1rem;\">One member has been practically unreachable.</span></p><p>Owing to the perceived lack of understanding of what it means to be saved, we began again with Christian salvation. Namely what it means, why everyone needs to be saved, what we are saved&nbsp; from and how to be saved.</p><p>By God\'s grace all members provided answers that showed that they had both an understanding of salvation and had taken the necessary practical steps to believe in Jesus for their salvation.</p><p></p><p>The session ended with how to be assured of salvation by hearing and believing the word of God.</p>','2021-03-22 17:00:06','2021-03-22 17:00:06',3),(21,3,'2021-03-21 00:00:00','Once again we had a very good session. Participation was lively. We managed the time well so we had the opportunity to take lessons from each member before bringing the session to a close. A new, called Ama, member joined','2021-03-22 17:09:54','2021-03-22 17:11:19',3),(22,7,'2021-03-21 00:00:00','<p>a. Paulina confirmed the time wasn\'t good for her. Will engage her for a more comfortable timing.</p><p>b. We had some very good contributions from the group members.</p><p>c. Our session was recorded.&nbsp;<span style=\"font-size: 1rem;\">We used the GCCAMP zoom account because we wanted to share the discussion with those who couldn\'t join</span></p>','2021-03-23 18:43:57','2021-03-23 18:43:57',3),(23,2,'2021-03-21 00:00:00','<p>Class started at about 5:20. We had to wait for members to join before we start.&nbsp;Julia did a recap of last weeks lesson.&nbsp;Class ended around 6:40pm.<br></p>','2021-03-24 16:42:33','2021-03-24 16:42:33',3);
/*!40000 ALTER TABLE `tbl_meeting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_members`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_members` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_number` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `member_type` int NOT NULL DEFAULT '0',
  `class_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_members`
--

LOCK TABLES `tbl_members` WRITE;
/*!40000 ALTER TABLE `tbl_members` DISABLE KEYS */;
INSERT INTO `tbl_members` VALUES (1,'Julia',NULL,'Ntow','0244760142',NULL,1,2,'2021-03-16 22:03:20','2021-03-16 22:03:20'),(2,'Anna','Naa Shomeh','Ocquaye-Nortey','0244685531',NULL,1,2,'2021-03-16 23:07:19','2021-03-16 23:07:19'),(3,'Nana','Baah','Gyan','0200132466',NULL,1,12,'2021-03-16 23:22:39','2021-03-16 23:22:39'),(4,'Kafui',NULL,'Ntow','0200132466',NULL,1,11,'2021-03-16 23:23:57','2021-03-16 23:23:57'),(5,'Kenneth',NULL,'Annoh','0200132466',NULL,1,13,'2021-03-16 23:24:19','2021-03-16 23:24:19'),(6,'Emmanuel',NULL,'Annoh','0244685531',NULL,1,1,'2021-03-17 07:51:10','2021-03-17 07:51:10'),(7,'Agnes',NULL,'Annoh','0244685531',NULL,1,1,'2021-03-17 07:51:10','2021-03-19 09:21:03'),(8,'Harriet',NULL,'Gyan','0244685531',NULL,1,3,'2021-03-17 07:52:32','2021-03-17 07:52:32'),(9,'Maud','Kukua','Fouillard','0244760142',NULL,1,3,'2021-03-17 07:53:48','2021-03-17 07:53:48'),(10,'Amos','Nii Teye','Abladey','0244760142',NULL,1,4,'2021-03-17 07:55:26','2021-03-17 07:55:26'),(11,'Miriam','Naa Aku Shika','Anderson','0244760142',NULL,1,4,'2021-03-17 07:56:35','2021-03-17 07:56:35'),(12,'David','Kwame','Kumador','0200132466',NULL,1,6,'2021-03-17 07:58:05','2021-03-17 07:58:05'),(14,'Nancy',NULL,'Kyei-Mensah','0200132466',NULL,1,6,'2021-03-17 07:58:48','2021-03-17 07:58:48'),(15,'Carl',NULL,'Ashie','0200132466',NULL,1,7,'2021-03-17 07:59:16','2021-03-17 07:59:16'),(16,'Nana Ama',NULL,'Ashie','0200132466',NULL,1,7,'2021-03-17 07:59:43','2021-03-17 07:59:43'),(17,'Daniel',NULL,'Offei','0200132466',NULL,1,8,'2021-03-17 08:00:08','2021-03-17 08:00:08'),(18,'Delphine','Dzifa','Tometey','0200132466',NULL,1,8,'2021-03-17 08:00:56','2021-03-17 08:00:56'),(19,'Egya',NULL,'Ocran','0200132466',NULL,1,9,'2021-03-17 08:01:29','2021-03-17 08:01:29'),(20,'Emmanuel',NULL,'Mensah','0200132466',NULL,1,9,'2021-03-17 08:01:59','2021-03-17 08:01:59'),(21,'Osmond','Kofi','Boakye','0200132466',NULL,1,10,'2021-03-17 08:02:30','2021-03-17 08:02:30'),(22,'Anita','Yaa','Boakye','0200132466',NULL,1,10,'2021-03-17 08:03:10','2021-03-17 08:03:10'),(23,'James',NULL,'Nimutsu','0200132466',NULL,1,5,'2021-03-18 20:46:38','2021-03-18 20:46:38'),(24,'Bryan',NULL,'Dansel','0200132466',NULL,1,14,'2021-03-18 20:47:10','2021-03-18 20:47:10'),(25,'Godwin','Angmor','Kwapong','0200132466',NULL,1,15,'2021-03-18 20:47:42','2021-03-18 20:47:42'),(26,'Bismarck','Kwesi','Anneh-Korley','0200132466',NULL,1,16,'2021-03-18 20:49:13','2021-03-18 20:49:13'),(27,'Mathias',NULL,'Nimobe','0200132466',NULL,1,17,'2021-03-18 20:49:52','2021-03-18 20:49:52'),(28,'Ekow','Krampah','Arthur','0200132466',NULL,2,11,'2021-03-18 20:53:20','2021-03-18 20:53:20'),(29,'Bismark',NULL,'Boadu','0200132466',NULL,2,11,'2021-03-18 20:54:06','2021-03-18 20:54:06'),(30,'Ellen','Akosua Aboagyewah','Tenkorang','0200132466',NULL,2,11,'2021-03-18 20:55:08','2021-03-18 20:55:08'),(31,'Janell',NULL,'Addy-Lamptey','0200132466',NULL,2,11,'2021-03-18 20:56:08','2021-03-18 20:56:08'),(32,'Michael','NanaKwame','Yeboah','0200132466',NULL,2,11,'2021-03-18 20:56:58','2021-03-18 20:56:58'),(33,'Joyceline','Daikie','Teye','0200132466',NULL,2,11,'2021-03-18 20:57:44','2021-03-18 20:57:44'),(34,'Bridget',NULL,'Okae','0200132466',NULL,2,11,'2021-03-18 20:58:22','2021-03-18 20:58:22'),(35,'Jane','Serwaa','Nti','0200132466',NULL,2,12,'2021-03-18 20:59:58','2021-03-18 20:59:58'),(36,'Philip',NULL,'Mensah','0200132466',NULL,2,12,'2021-03-18 21:00:25','2021-03-18 21:00:25'),(37,'Dennis',NULL,'Annang','0200132466',NULL,2,12,'2021-03-18 21:01:02','2021-03-18 21:01:02'),(38,'Isaac',NULL,'Asamani','0200132466',NULL,2,12,'2021-03-18 21:01:34','2021-03-18 21:01:34'),(39,'Rita','Amoah','Oduro','0200132466',NULL,2,12,'2021-03-18 21:02:41','2021-03-18 21:02:41'),(40,'Miriam',NULL,'Awinaba-Musah','0200132466',NULL,2,12,'2021-03-18 21:03:22','2021-03-18 21:03:22'),(41,'Yram',NULL,'Attakumah','0200132466',NULL,2,12,'2021-03-18 21:04:03','2021-03-18 21:04:03'),(42,'Wendy',NULL,'Non-Member','0200132466',NULL,7,12,'2021-03-18 21:04:41','2021-03-19 20:08:33'),(43,'Emefa',NULL,'Non-Member','0200132466',NULL,7,12,'2021-03-18 21:05:14','2021-03-18 21:05:14'),(44,'Benjamin','Nii Odai','Afotey','0200132466',NULL,2,13,'2021-03-18 21:06:40','2021-03-18 21:06:40'),(45,'Charles','Elikplim','Wilson','0200132466',NULL,2,13,'2021-03-18 21:07:30','2021-03-18 21:07:30'),(46,'Emmanuel',NULL,'Wiredu','0200132466',NULL,2,13,'2021-03-18 21:08:23','2021-03-18 21:08:23'),(47,'Amanda',NULL,'Benson-Tambo','0200132466',NULL,2,13,'2021-03-18 21:08:52','2021-03-18 21:08:52'),(48,'Esther','Naa Adorkor','Lomotey','0200132466',NULL,2,13,'2021-03-18 21:09:25','2021-03-18 21:09:25'),(49,'Jennifer','Gyaubea','Bampoh','0200132466',NULL,2,13,'2021-03-18 21:10:09','2021-03-18 21:10:09'),(50,'Clinton',NULL,'Amarh Amihere','0200132466',NULL,2,1,'2021-03-18 21:12:23','2021-03-18 21:12:23'),(51,'Gwendolyn','Dela','Amuzu','0200132466',NULL,2,1,'2021-03-18 21:13:56','2021-03-18 21:13:56'),(52,'Christabel','Ewuraba','Gambrah','0200132466',NULL,2,1,'2021-03-18 21:14:42','2021-03-18 21:14:42'),(53,'Nana Kwame',NULL,'Nyarko-Ansong','0200132466',NULL,2,1,'2021-03-18 21:15:30','2021-03-18 21:15:30'),(54,'Pearl','Ewurabena','Abbeo','0200132466',NULL,2,1,'2021-03-18 21:16:17','2021-03-18 21:16:17'),(55,'Richard',NULL,'Attuquaye','0200132466',NULL,2,1,'2021-03-18 21:18:26','2021-03-18 21:18:26'),(56,'Mame','Twimasiwah','Agyei-Sarpong','0200132466',NULL,2,2,'2021-03-18 21:19:51','2021-03-18 21:19:51'),(57,'Ruth','Naa Ashorkor','Ashitey','0200132466',NULL,2,2,'2021-03-18 21:20:42','2021-03-18 21:20:42'),(58,'Richard','Jnr','Fosu','0200132466',NULL,2,2,'2021-03-18 21:32:10','2021-03-18 21:32:10'),(59,'Justina','Bullock','Merson','0200132466',NULL,2,2,'2021-03-18 21:32:52','2021-03-18 21:32:52'),(60,'Erica',NULL,'Tawiah','0200132466',NULL,2,2,'2021-03-18 21:33:32','2021-03-18 21:33:32'),(61,'Grace',NULL,'Boamah','0200132466',NULL,2,2,'2021-03-18 21:33:58','2021-03-18 21:33:58'),(62,'Samuella',NULL,'Adams','0200132466',NULL,2,3,'2021-03-18 21:35:07','2021-03-18 21:35:07'),(63,'Eunice',NULL,'Annang','0200132466',NULL,2,3,'2021-03-18 21:35:32','2021-03-18 21:35:32'),(64,'Andrew',NULL,'Dartey','0200132466',NULL,2,3,'2021-03-18 21:36:00','2021-03-18 21:36:00'),(65,'Wilson','Mawuli','Kuzagbe','0200132466',NULL,2,3,'2021-03-18 21:37:51','2021-03-18 21:37:51'),(66,'Vanessa','Naki Gomer','Okletey','0200132466',NULL,2,3,'2021-03-18 21:38:41','2021-03-18 21:38:41'),(67,'Charis','Amanorki','Doku','0200132466',NULL,2,3,'2021-03-18 21:39:19','2021-03-18 21:39:19'),(68,'Charlotte','Asantewaa','Agyei','0200132466',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(69,'Jessie','Siyanbade','Ashiabi','0200132467',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(70,'Fred','','Ellis','0200132468',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(71,'Nathalie','Emefa','Mensah','0200132469',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(72,'Adom','Nshira','Takyi-Mensah','0200132470',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(73,'Florence','','Tsifoanya','0200132471',NULL,2,4,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(74,'Juwaid','Agbe','Agbe','0200132472',NULL,2,6,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(75,'Ama','Asantewaa','Asante','0200132473',NULL,2,6,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(76,'Cordelia','','Ellis','0200132474',NULL,2,6,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(77,'Emmanuel','Oduro','Mensah','0200132475',NULL,2,6,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(78,'Kate','Naa Ayichoe','Tagoe-Kumador','0200132476',NULL,2,6,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(79,'Richard','Omari','Abbeo','0200132477',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(80,'Abigail','Naa Ayeley','Annang','0200132478',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(81,'Winnie','Freda','Benson - Tambo','0200132479',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(82,'Princess Sophia','Akua','Kukubor','0200132480',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(83,'Michael','Addo','Offei','0200132481',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(84,'Paulina','','Boakye-Boateng','0200132482',NULL,2,7,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(85,'Richard','','Addo','0200132483',NULL,2,8,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(86,'Jasmine','Eunice','Appiah','0200132484',NULL,2,8,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(87,'Gifty','','Dennis','0200132485',NULL,2,8,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(88,'Moses','','Oclan','0200132486',NULL,2,8,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(89,'Joshua','Favour','Sinclear','0200132487',NULL,2,8,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(90,'Juana','','Adjei','0200132488',NULL,2,9,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(91,'Rebecca','','Arthur','0200132489',NULL,2,9,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(92,'Kezia','Kafui Esi','Dotse','0200132490',NULL,2,9,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(93,'Rebecca','','Mallet','0200132491',NULL,2,9,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(94,'Ebenezer','','Sinclear','0200132492',NULL,2,9,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(95,'Leanzer','Nana Akua Ahenkan','Amanor','0200132493',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(96,'Priscilla','','Avonie','0200132494',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(97,'Beatrice','Agyemang','Frimpong','0200132495',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(98,'Abraham','','Tomety','0200132496',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(99,'Ebenezerlyn','Talata','Tidow','0200132497',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(100,'Serwah','','Annoh','0200132498',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(101,'Godfrey','','Attukwei - Korley','0200132499',NULL,2,10,'2021-03-19 08:25:04','2021-03-19 08:25:04'),(102,'Mina',NULL,'Non-Member','0200132466',NULL,7,12,'2021-03-19 08:47:03','2021-03-19 08:47:03'),(103,'Manuella',NULL,'Gadzetti','0200132466',NULL,2,9,'2021-03-19 10:01:35','2021-03-19 10:01:35'),(104,'Anita',NULL,'Mahama','0200132466',NULL,2,6,'2021-03-22 16:22:13','2021-03-22 16:22:13');
/*!40000 ALTER TABLE `tbl_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_reports`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_reports` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `report_type` int NOT NULL,
  `member_id` int DEFAULT NULL,
  `report_comments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_reports`
--

LOCK TABLES `tbl_reports` WRITE;
/*!40000 ALTER TABLE `tbl_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `tbl_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_setups`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tbl_setups` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_setups`
--

LOCK TABLES `tbl_setups` WRITE;
/*!40000 ALTER TABLE `tbl_setups` DISABLE KEYS */;
INSERT INTO `tbl_setups` VALUES (1,'Teacher','member_type','2021-03-15 20:18:16','2021-03-15 20:18:16'),(2,'Member','member_type','2021-03-15 20:20:31','2021-03-15 20:20:31'),(3,'Assurance of Salvation','material','2021-03-15 20:53:35','2021-03-18 07:55:51'),(4,'Victory Over Sin and Temptation','material','2021-03-15 20:54:50','2021-03-18 07:56:59'),(5,'Water Baptism','material','2021-03-18 07:57:17','2021-03-18 07:57:17'),(6,'Holy Spirit Baptism','material','2021-03-18 07:57:36','2021-03-18 07:57:36'),(7,'Non-Member','member_type','2021-03-18 09:50:19','2021-03-18 09:50:19'),(8,'General','report_type','2021-03-22 17:57:23','2021-03-22 17:57:23'),(9,'Specific','report_type','2021-03-22 17:57:39','2021-03-22 17:57:39'),(10,'Test','test','2021-03-25 10:50:47','2021-03-25 10:50:47');
/*!40000 ALTER TABLE `tbl_setups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'discipleship'
--

--
-- Final view structure for view `attendance_view`
--

/*!50001 DROP VIEW IF EXISTS `attendance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `attendance_view` AS select `m`.`meeting_date` AS `meeting_date`,count(`a`.`member_id`) AS `attendance` from (`tbl_meeting` `m` join `tbl_attendance` `a` on((`m`.`id` = `a`.`meeting_id`))) group by `m`.`meeting_date` order by `m`.`meeting_date` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `class_attendance_view`
--

/*!50001 DROP VIEW IF EXISTS `class_attendance_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `class_attendance_view` AS select `m`.`meeting_date` AS `meeting_date`,`m`.`class_id` AS `class_id`,count(`a`.`member_id`) AS `attendance` from (`tbl_meeting` `m` join `tbl_attendance` `a` on((`m`.`id` = `a`.`meeting_id`))) group by `m`.`meeting_date`,`m`.`class_id` order by `m`.`class_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classes_view`
--

/*!50001 DROP VIEW IF EXISTS `classes_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `classes_view` AS select `c`.`id` AS `id`,`c`.`name` AS `name`,`c`.`leader` AS `leader`,`c`.`assistant` AS `assistant`,`c`.`created_at` AS `created_at`,`c`.`updated_at` AS `updated_at`,concat(`m`.`first_name`,' ',`m`.`last_name`) AS `leader_full_name`,concat(`x`.`first_name`,' ',`x`.`last_name`) AS `assistant_full_name` from ((`tbl_classes` `c` left join `tbl_members` `m` on((`c`.`leader` = `m`.`id`))) left join `tbl_members` `x` on((`c`.`assistant` = `x`.`id`))) order by `c`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `members_view`
--

/*!50001 DROP VIEW IF EXISTS `members_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`admin`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `members_view` AS select `m`.`id` AS `id`,`m`.`first_name` AS `first_name`,`m`.`middle_name` AS `middle_name`,`m`.`last_name` AS `last_name`,`m`.`contact_number` AS `contact_number`,`m`.`email` AS `email`,`m`.`member_type` AS `member_type`,`m`.`class_id` AS `class_id`,`m`.`created_at` AS `created_at`,`m`.`updated_at` AS `updated_at`,concat(`m`.`first_name`,' ',`m`.`last_name`) AS `full_name`,`c`.`name` AS `class_name`,`t`.`name` AS `member_type_name` from ((`tbl_members` `m` left join `tbl_classes` `c` on((`m`.`class_id` = `c`.`id`))) left join `tbl_setups` `t` on((`m`.`member_type` = `t`.`id`))) order by `m`.`first_name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-25 11:01:09

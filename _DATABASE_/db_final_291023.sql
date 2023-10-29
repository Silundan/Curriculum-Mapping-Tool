CREATE DATABASE  IF NOT EXISTS `adelaide_dev` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `adelaide_dev`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: adelaide_dev
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `course_id` int NOT NULL AUTO_INCREMENT,
  `stream_id` int NOT NULL DEFAULT '0',
  `course_code` varchar(5) NOT NULL DEFAULT '0000',
  `course_name` varchar(255) DEFAULT NULL,
  `courselink_href` varchar(255) DEFAULT NULL,
  `units` varchar(45) DEFAULT NULL,
  `term` int DEFAULT '1',
  PRIMARY KEY (`course_id`),
  KEY `fk_course_1_idx` (`stream_id`),
  CONSTRAINT `fk_course_1` FOREIGN KEY (`stream_id`) REFERENCES `course_stream` (`stream_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (0,0,'3313','Software Engineering & Project (Distributed Systems & Networking)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(1,0,'3012','Distributed Systems','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(2,0,'3310','Software Engineering & Project (Artificial Intelligence)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(3,0,'3312','Software Engineering & Project (Cybersecurity)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(4,0,'3006','Software Engineering & Project','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(5,0,'2203','Problem Solving & Software Development','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(6,0,'1010','Puzzle Based Learning','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',1),(8,0,'1106','Introduction to Software Engineering','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(9,0,'3305','Parallel and Distributed Computing','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',1),(10,0,'2201','Algorithm & Data Structure Analysis','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(11,0,'2005','Systems Programming','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',1),(12,0,'1104','Grand Challenges in Computer Science','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(13,0,'3020','Advanced Topics in Computer Science','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(14,1,'1012','Mathematics IB','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(15,0,'2103','Algorithm Design & Data Structures','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(16,0,'3311','Software Engineering & Project (Data Science)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',2),(17,0,'2008','Topics in Computer Science','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(18,2,'1003','Programming (Matlab and Excel)','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(19,0,'3306','Mining Big Data','https://www.adelaide.edu.au/degree-finder/2024/bcmsa_bcmpscadv.html','3',3),(20,0,'2009','Programming for IT Specialists','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',3),(21,0,'3004','Operating Systems','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(22,0,'3316','Evolutionary Computation','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(23,0,'3007','Artificial Intelligence','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(24,0,'3308','Cybersecurity Fundamentals','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(25,3,'2003','Driving Decisions: Accounting and Finance','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(26,0,'3314','Introduction to Statistical Machine Learning','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(27,0,'3314','Introduction to Statistical Machine Learning','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(28,0,'3021','Industry Project in Information Technology','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(29,1,'3025','Professional Practice III','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(30,0,'3307','Secure Programming','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',3),(31,0,'2207','Web & Database Computing','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(32,3,'1002','Design Thinking: Problems to Practice','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',3),(33,0,'1013','Introduction to Computer Systems, Networks and Security','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(34,0,'2208','Databases and Ethical Data','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(35,0,'3315','Computer Vision','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(36,0,'3317','Using Machine Learning Tools','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(37,0,'2000','Computer Systems','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',3),(38,0,'3001','Computer Networks & Applications','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',1),(39,3,'3901','Tech eChallenge','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',3),(40,0,'1014','Information Technology Project','https://www.adelaide.edu.au/degree-finder/2024/bit_binftech.html','3',2),(41,4,'1003','Engineering Technology and Digital Design','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(42,11,'2100','Design Practice','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',1),(43,2,'4010','Defence Leadership','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',1),(44,4,'2002','Materials','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(45,2,'3004','Systems Engineering and Industry Practice','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(46,4,'2004','Industry 4.0','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(47,2,'3305','Human Factors for Decision Making','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',2),(48,4,'2100','Internship','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',1),(49,4,'1007','Defence Industry and Security','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',1),(50,4,'2001','Electrical Principles','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(51,4,'2003','Mechatronics','https://www.adelaide.edu.au/degree-finder/2024/btdi_btechdi.html','3',3),(52,0,'7327','Concepts in Artificial Intelligence and Machine Learning','https://www.adelaide.edu.au/degree-finder/2024/maiml_maiml.html','3',7),(53,0,'7099B','Master Computer Science Research Project - Part B','https://www.adelaide.edu.au/degree-finder/2024/mcoms_mcmpsci.html','6',3),(54,0,'7099A','Master Computer Science Research Project - Part A','https://www.adelaide.edu.au/degree-finder/2024/mcoms_mcmpsci.html','6',3),(55,3,'7022','Creativity and Innovation','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',5),(56,0,'7064','Operating Systems','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(57,0,'7092','Mobile and Wireless Systems','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(58,0,'7039','Computer Networks & Applications','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(59,0,'7023','Software Process Improvement','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(60,6,'5021','Project Management Fundamentals','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(61,0,'7081','Computer Systems','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(62,0,'7098','Master of Computing & Innovation Project','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(63,3,'5036','Entrepreneurial Concepts and Mindset','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',7),(64,0,'7305','Parallel and Distributed Computing','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(65,0,'7202','Foundations of Computer Science','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','6',3),(66,0,'7413','Introduction to Quantum Computing','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(67,0,'7407','Advanced Algorithms','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(68,0,'7015','Software Engineering & Project','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(69,0,'7316','Evolutionary Computation','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(70,0,'7411','Event Driven Computing','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(71,0,'7076','Distributed Systems','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',2),(72,0,'7007','Specialised Programming','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(73,0,'7059','Artificial Intelligence','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',1),(74,0,'7201','Algorithm & Data Structure Analysis','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(75,3,'5038','New Venture Creation','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',7),(76,0,'7315','Computer Vision','https://www.adelaide.edu.au/degree-finder/2024/mcomi_mcompinnov.html','3',3),(77,0,'7101A','Cyber Security Research Project Part A','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','6',7),(78,0,'7101B','Cyber Security Research Project Part B','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','6',7),(79,0,'7106','Hot Topics in IoT Security','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','3',6),(80,0,'7307','Secure Programming','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','3',5),(81,0,'7308','Cybersecurity Fundamentals','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','3',4),(82,0,'7412','Secure Software Engineering','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','3',2),(83,0,'7102A','Cyber Security Industry Project Part A','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','6',7),(84,0,'7102B','Cyber Security Industry Project Part B','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','6',7),(85,0,'7328','Concepts in Cyber Security','https://www.adelaide.edu.au/degree-finder/2024/mcsec_mcybsecu.html','3',7),(86,1,'7098B','Data Science Industry Project Part B','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','6',3),(87,0,'7306','Mining Big Data','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',1),(88,7,'7005','Machine Learning and Artificial Intelligence','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',2),(89,0,'7318','Deep Learning Fundamentals','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',6),(90,0,'7209','Big Data Analysis and Project','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',5),(91,1,'7097B','Data Science Research Project Part B','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','6',7),(92,1,'7027','Mathematical Foundations of Data Science','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',7),(93,0,'7211','Foundations of Computer Science B','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',3),(94,0,'7317','Using Machine Learning Tools PG','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',5),(95,8,'7022','Data Science PG','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',2),(96,0,'7210','Foundations of Computer Science A','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',3),(97,9,'7124','Decision Science PG','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',2),(98,1,'7103','Probability & Statistics PG','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',1),(99,8,'7107','Statistical Modelling and Inference','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',2),(100,0,'7212','Human and Ethical Factors in Computer Science','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',7),(101,1,'7105','Data Literacy','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',4),(102,1,'7097A','Data Science Research Project Part A','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','6',7),(103,0,'7314','Introduction to Statistical Machine Learning','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',2),(104,2,'7111','Internship','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','6',1),(105,1,'7098A','Data Science Industry Project Part A','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','6',3),(106,1,'7107','Data Taming','https://www.adelaide.edu.au/degree-finder/2024/mdsci_mdatasci.html','3',3),(107,2,'1002','Programming (Matlab and C)','https://www.adelaide.edu.au/degree-finder/2024/ucds_ucdatasc.html','3',7),(108,0,'1102','Object Oriented Programming','https://www.adelaide.edu.au/degree-finder/2024/ucds_ucdatasc.html','3',3),(109,1,'1006','Data Taming & Prediction','https://www.adelaide.edu.au/degree-finder/2024/ucds_ucdatasc.html','3',2),(110,0,'1015','Introduction to Applied Programming','https://www.adelaide.edu.au/degree-finder/2024/ucds_ucdatasc.html','3',3),(111,1,'1004','Mathematics for Data Science I','https://www.adelaide.edu.au/degree-finder/2024/ucds_ucdatasc.html','3',3),(112,4,'1004','Artificial Intelligence Technologies','https://www.adelaide.edu.au/degree-finder/2024/uctdi_uctechdi.html','3',2),(113,1,'1013','Mathematics IM','https://www.adelaide.edu.au/degree-finder/2024/uctdi_uctechdi.html','3',3),(114,6,'1001','Foundations of Project Management','https://www.adelaide.edu.au/degree-finder/2024/uctdi_uctechdi.html','3',3),(115,4,'1006','Engineering Mechanics Technology','https://www.adelaide.edu.au/degree-finder/2024/uctdi_uctechdi.html','3',3),(116,4,'1005','Cyber Security','https://www.adelaide.edu.au/degree-finder/2024/uctdi_uctechdi.html','3',3);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_stream`
--

DROP TABLE IF EXISTS `course_stream`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course_stream` (
  `stream_id` int NOT NULL AUTO_INCREMENT,
  `stream_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stream_id`),
  KEY `stream_name_IDX` (`stream_name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_stream`
--

LOCK TABLES `course_stream` WRITE;
/*!40000 ALTER TABLE `course_stream` DISABLE KEYS */;
INSERT INTO `course_stream` VALUES (10,'APP DATA'),(9,'APP MTH'),(5,'COLL'),(0,'COMP SCI'),(2,'ENG'),(3,'ENTREP'),(1,'MATHS'),(11,'MECH ENG'),(7,'PHIL'),(6,'PROJMGNT'),(8,'STATS'),(4,'TECH');
/*!40000 ALTER TABLE `course_stream` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree`
--

DROP TABLE IF EXISTS `degree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree` (
  `degree_id` int NOT NULL AUTO_INCREMENT,
  `name_suffix` varchar(45) DEFAULT NULL,
  `level` int DEFAULT '0',
  PRIMARY KEY (`degree_id`),
  KEY `fk_degree_1_idx` (`level`),
  CONSTRAINT `fk_degree_1` FOREIGN KEY (`level`) REFERENCES `degree_level` (`level`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree`
--

LOCK TABLES `degree` WRITE;
/*!40000 ALTER TABLE `degree` DISABLE KEYS */;
INSERT INTO `degree` VALUES (0,'Computer Science (Advanced)',1),(1,'Information Technology',1),(2,'Technology (Defence Industries)',1),(3,'Artificial Intelligence and Machine Learning',2),(4,'Computer Science',2),(5,'Computing and Innovation',2),(6,'Cyber Security',2),(7,'Data Science',2),(8,'Data Science',0),(9,'Technology (Defence Industries)',0);
/*!40000 ALTER TABLE `degree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_course`
--

DROP TABLE IF EXISTS `degree_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_course` (
  `degree_id` int NOT NULL,
  `course_id` int NOT NULL,
  `type` int DEFAULT '0',
  PRIMARY KEY (`degree_id`,`course_id`),
  KEY `fk_degree_course_2_idx` (`course_id`),
  CONSTRAINT `fk_degree_course_1` FOREIGN KEY (`degree_id`) REFERENCES `degree` (`degree_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_degree_course_2` FOREIGN KEY (`course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_course`
--

LOCK TABLES `degree_course` WRITE;
/*!40000 ALTER TABLE `degree_course` DISABLE KEYS */;
INSERT INTO `degree_course` VALUES (0,2,1),(0,8,1),(0,9,3),(0,10,3),(0,11,3),(0,12,3),(0,13,3),(0,14,0),(0,15,0),(0,16,0),(0,17,0),(0,18,0),(0,19,0),(1,20,3),(1,21,3),(1,22,3),(1,23,3),(1,24,3),(1,25,3),(1,26,3),(1,27,3),(1,28,3),(1,29,3),(1,30,3),(1,31,3),(1,32,3),(1,33,3),(1,34,3),(1,35,3),(1,36,3),(1,37,3),(1,38,3),(1,39,3),(1,40,3),(2,41,3),(2,42,3),(2,43,3),(2,44,3),(2,45,3),(2,46,3),(2,47,3),(2,48,3),(2,49,3),(2,50,3),(2,51,3),(3,52,3),(4,53,3),(4,54,3),(5,55,3),(5,56,3),(5,57,3),(5,58,3),(5,59,3),(5,60,7),(5,61,3),(5,62,3),(5,63,3),(5,64,3),(5,65,3),(5,66,3),(5,67,3),(5,68,3),(5,69,3),(5,70,3),(5,71,3),(5,72,3),(5,73,3),(5,74,3),(5,75,3),(5,76,3),(6,77,7),(6,78,7),(6,79,7),(6,80,7),(6,81,7),(6,82,7),(6,83,7),(6,84,7),(6,85,7),(7,86,7),(7,87,7),(7,88,7),(7,89,7),(7,90,7),(7,91,7),(7,92,3),(7,93,3),(7,94,3),(7,95,3),(7,96,3),(7,97,3),(7,98,3),(7,99,3),(7,100,3),(7,101,3),(7,102,3),(7,103,3),(7,104,3),(7,105,3),(7,106,3),(8,107,3),(8,108,3),(8,109,3),(8,110,3),(8,111,3),(9,112,3),(9,113,3),(9,114,3),(9,115,3),(9,116,3);
/*!40000 ALTER TABLE `degree_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `degree_level`
--

DROP TABLE IF EXISTS `degree_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `degree_level` (
  `level` int NOT NULL,
  `level_type` varchar(45) DEFAULT NULL,
  `level_prefix` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `degree_level`
--

LOCK TABLES `degree_level` WRITE;
/*!40000 ALTER TABLE `degree_level` DISABLE KEYS */;
INSERT INTO `degree_level` VALUES (0,'Undergraduate Certificate','in'),(1,'Bachelor','of'),(2,'Master','of');
/*!40000 ALTER TABLE `degree_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `incompatiable`
--

DROP TABLE IF EXISTS `incompatiable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `incompatiable` (
  `inc_id` int NOT NULL AUTO_INCREMENT,
  `src_course_id` int DEFAULT '0',
  `target_course_id` int DEFAULT '0',
  PRIMARY KEY (`inc_id`),
  KEY `fk_incompatiable_1_idx` (`src_course_id`),
  KEY `fk_incompatiable_2_idx` (`target_course_id`),
  CONSTRAINT `fk_incompatiable_1` FOREIGN KEY (`src_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_incompatiable_2` FOREIGN KEY (`target_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `incompatiable`
--

LOCK TABLES `incompatiable` WRITE;
/*!40000 ALTER TABLE `incompatiable` DISABLE KEYS */;
INSERT INTO `incompatiable` VALUES (2,2,4),(4,4,2);
/*!40000 ALTER TABLE `incompatiable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pre_requisite`
--

DROP TABLE IF EXISTS `pre_requisite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pre_requisite` (
  `pre_req_id` int NOT NULL AUTO_INCREMENT,
  `src_course_id` int DEFAULT '0',
  `target_course_id` int DEFAULT '0',
  PRIMARY KEY (`pre_req_id`),
  KEY `fk_pre_requisite_1_idx` (`src_course_id`),
  KEY `fk_pre_requisite_2_idx` (`target_course_id`),
  CONSTRAINT `fk_pre_requisite_1` FOREIGN KEY (`src_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pre_requisite_2` FOREIGN KEY (`target_course_id`) REFERENCES `course` (`course_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pre_requisite`
--

LOCK TABLES `pre_requisite` WRITE;
/*!40000 ALTER TABLE `pre_requisite` DISABLE KEYS */;
INSERT INTO `pre_requisite` VALUES (1,4,3);
/*!40000 ALTER TABLE `pre_requisite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_id_UNIQUE` (`user_id`),
  UNIQUE KEY `username_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'a1234567@adelaide.edu.au','$2b$10$VOY0wpWif8Yzc5J5tOif8.U.OQp/Sk5SpfM1XOzmzmoxEN8qQhCMC');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'adelaide_dev'
--

--
-- Dumping routines for database 'adelaide_dev'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-29 19:29:12

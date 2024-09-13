-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: ksutt
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `studentid` bigint DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `studentid` (`studentid`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`studentid`) REFERENCES `student` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,1,'Hüppas laua peal ringi nagu ahv'),(2,2,'Käitus viisakalt'),(3,3,'Oli tubli tiimikaaslane'),(4,4,'Röökis nagu segane'),(5,5,'Nuttis nagu beebi'),(6,6,'Küsis õpetajalt, et kas see on roosa?');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!50001 DROP VIEW IF EXISTS `comments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `comments` AS SELECT 
 1 AS `id`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `comment`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `code` varchar(8) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES ('AB','Andmbaasid'),('FM','Filmindus');
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stgroup`
--

DROP TABLE IF EXISTS `stgroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stgroup` (
  `code` varchar(8) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stgroup`
--

LOCK TABLES `stgroup` WRITE;
/*!40000 ALTER TABLE `stgroup` DISABLE KEYS */;
INSERT INTO `stgroup` VALUES ('AM','Automehaanik'),('MM','Multimeedia'),('TV','Televisioon');
/*!40000 ALTER TABLE `stgroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `id` bigint NOT NULL,
  `firstname` varchar(256) DEFAULT NULL,
  `lastname` varchar(256) DEFAULT NULL,
  `groupcode` varchar(8) DEFAULT NULL,
  `birthdate` varchar(16) DEFAULT NULL,
  `Course` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groupcode` (`groupcode`),
  KEY `Course` (`Course`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`groupcode`) REFERENCES `stgroup` (`code`),
  CONSTRAINT `student_ibfk_2` FOREIGN KEY (`Course`) REFERENCES `course` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Kermo','Sutt','MM','2006.08.08','AB'),(2,'Kristofer','Kumari','AM','2006.09.09','FM'),(3,'Dmitri','Zverkov','MM','2006.10.10','AB'),(4,'Dima','Sidorov','AM','2007.08.07','FM'),(5,'Mari','Huaana','MM','2003.01.02','AB'),(6,'Ülle','Doos','AM','2002.01.01','FM'),(7,'Magnus','Petuh','TV','2008.12.12','AB'),(8,'Madis','Medved','AM','2002.11.11','AB'),(9,'Üllar','Rõba','MM','2016.08.01','AB'),(10,'Kris','Kuus','TV','2002.09.11','AB'),(11,'Kalle','Muld','TV','2012.01.02','FM'),(12,'Karl','Vesi','TV','2010.07.06','FM'),(13,'Kaur','Taevas','TV','2004.09.12','FM'),(14,'Melissa','Uks','AM','2008.05.05','AB'),(15,'Karmen','Aken','MM','2008.02.03','AB'),(16,'Kaarel','Monitor','MM','2009.11.02','FM'),(17,'Mari','Kalkulaator','MM','2015.12.11','FM'),(18,'Kätlin','Musi','AM','1969.02.11','FM'),(19,'Kuuritsa','Kana','AM','1999.10.11','AB'),(20,'Ülle','Kink','AM','2002.09.11','AB');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `comments`
--

/*!50001 DROP VIEW IF EXISTS `comments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `comments` AS select `comment`.`studentid` AS `id`,`student`.`firstname` AS `firstname`,`student`.`lastname` AS `lastname`,`comment`.`comment` AS `comment` from (`student` join `comment` on((`student`.`id` = `comment`.`studentid`))) */;
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

-- Dump completed on 2024-09-13 10:04:18

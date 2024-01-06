-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.35

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
-- Table structure for table `tour`
--

DROP TABLE IF EXISTS `tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(229) DEFAULT NULL,
  `city` varchar(229) DEFAULT NULL,
  `img_name` varchar(229) DEFAULT NULL,
  `rating` double DEFAULT NULL,
  `num_of_rate` int DEFAULT NULL,
  `price` double DEFAULT NULL,
  `best_seller` tinyint(1) DEFAULT '0',
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour`
--

LOCK TABLES `tour` WRITE;
/*!40000 ALTER TABLE `tour` DISABLE KEYS */;
INSERT INTO `tour` VALUES (1,'Dreamworld 1 Day Ticket','Gold Coast','package-1.jpg',4.3,382,119,0,'Queensland'),(2,'Sydney Attractions Pass - 3 Attractions','Sydney','package-2.jpg',4.8,16141,147,1,'New South Wales'),(3,'Melbourne Cruising Restaurant for 3 hours including food & beverages','Melbourne','package-3.jpg',4.5,14321,185,1,'Victoria'),(4,'Sydney Tower Eye Entry Tickets','Sydney','package-4.jpg',4.6,5627,33,0,'New South Wales'),(5,'Great Barrier Reef Dreamtime Cruise with Indigenous Sea Rangers','Cairns','package-5.jpg',4.7,20821,239,1,'Queensland'),(6,'Currumbin Wildlife Sanctuary Tickets','Gold Coast','package-6.jpg',4.7,1267,64.95,1,'Queensland');
/*!40000 ALTER TABLE `tour` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-30 13:44:21

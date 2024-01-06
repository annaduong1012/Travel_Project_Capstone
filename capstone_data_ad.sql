-- MySQL dump 10.13  Distrib 8.0.34, for macos13 (arm64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.2.0

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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `failed_login` int DEFAULT '0',
  `img_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Sam','Sangu','sam.sangu@test.com','sams','123456',0,'testimonial-1.jpg'),(2,'Lily','Caya','lilyc@test.com','lilyc','s1873',0,'testimonial-2.jpg'),(3,'Bob','Smith','bobs@test.com','bobs','917264',0,'testimonial-3.jpg'),(4,'James','Abel','jamesa@test.com','jamesa','test1',0,'testimonial-4.jpg');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destination`
--

DROP TABLE IF EXISTS `destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `destination` (
  `id` int NOT NULL AUTO_INCREMENT,
  `state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destination`
--

LOCK TABLES `destination` WRITE;
/*!40000 ALTER TABLE `destination` DISABLE KEYS */;
INSERT INTO `destination` VALUES (1,'Queensland'),(2,'New South Wales'),(3,'Victoria'),(4,'Northern Territory'),(5,'Australian Capital Territory'),(6,'Tasmania'),(7,'South Australia'),(8,'Western Australia');
/*!40000 ALTER TABLE `destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonial`
--

DROP TABLE IF EXISTS `testimonial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonial` (
  `customer_id` int NOT NULL,
  `tour_id` int NOT NULL,
  `feedbacks` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`customer_id`,`tour_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonial`
--

LOCK TABLES `testimonial` WRITE;
/*!40000 ALTER TABLE `testimonial` DISABLE KEYS */;
INSERT INTO `testimonial` VALUES (1,2,'Sydney tour was a delight! Expert guides, iconic landmarks, and a perfect blend of history and fun. Memorable moments captured in every step. A must-do for an enriching Sydney experience!'),(2,5,'Great Barrier Reef tour was a dream come true! Unparalleled beauty underwater, fantastic guides, and a seamless adventure. A bucket-list experience that exceeded expectations. Highly recommend this awe-inspiring journey!'),(3,1,'Dreamworld tour surpassed expectations! Thrilling rides, captivating shows, and an unforgettable day of family fun. A must-visit theme park with something for everyone. Memorable moments created at every turn. 5 stars!'),(4,3,'Melbourne restaurant tour was a culinary delight! A gastronomic journey through diverse flavors, impeccable service, and charming ambiance. Each stop a unique experience, making it a must for food enthusiasts.');
/*!40000 ALTER TABLE `testimonial` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `tour_guide`
--

DROP TABLE IF EXISTS `tour_guide`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_guide` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `location` varchar(45) DEFAULT NULL,
  `img_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_guide`
--

LOCK TABLES `tour_guide` WRITE;
/*!40000 ALTER TABLE `tour_guide` DISABLE KEYS */;
INSERT INTO `tour_guide` VALUES (1,'Lisa','Perth','team-1.jpg'),(2,'John','Melbourne','team-2.jpg'),(3,'Ashlee','Sydney','team-3.jpg'),(4,'Matt','Adelaide','team-4.jpg');
/*!40000 ALTER TABLE `tour_guide` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-04 16:54:26

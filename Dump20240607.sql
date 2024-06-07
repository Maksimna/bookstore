-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstoree
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (' Иван','Иванов','Иванович',1),(' Федор','Федоров','Федорович',2),('Глеб','Глебов','Глебович',3),('Антон','Павлов','Фёдорович',4),('Антон','Чехов','Павлович',5),('Павел','Антонов',NULL,6);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ISBN` char(13) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `price` decimal(10,0) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('1','Евгений Онегин',300,1),('2','Тарас Бульба',400,2),('3','Вишнёвый сад',350,3),('4','Крыжовник',500,4),('5','Чайка',250,5),('5','Чайка',250,6),('1','Чайка',250,7),('15','Чайка',250,8),('15','Чайка',250,9),('15','Чайка',250,10),('5','Чайка',250,11),('5','Чайка',250,12);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books_has_authors`
--

DROP TABLE IF EXISTS `books_has_authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books_has_authors` (
  `books_id` int NOT NULL,
  `authors_id` int NOT NULL,
  PRIMARY KEY (`books_id`,`authors_id`),
  KEY `fk_books_has_authors_authors1_idx` (`authors_id`),
  KEY `fk_books_has_authors_books1_idx` (`books_id`),
  CONSTRAINT `fk_books_has_authors_authors1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_books_has_authors_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books_has_authors`
--

LOCK TABLES `books_has_authors` WRITE;
/*!40000 ALTER TABLE `books_has_authors` DISABLE KEYS */;
INSERT INTO `books_has_authors` VALUES (1,1),(2,2),(3,3),(4,4),(5,5);
/*!40000 ALTER TABLE `books_has_authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `booksales`
--

DROP TABLE IF EXISTS `booksales`;
/*!50001 DROP VIEW IF EXISTS `booksales`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `booksales` AS SELECT 
 1 AS `ISBN`,
 1 AS `НазваниеКниги`,
 1 AS `Цена`,
 1 AS `НомерЗаказа`,
 1 AS `ДатаПродажи`,
 1 AS `НомерПродавца`,
 1 AS `ФамилияПродавца`,
 1 AS `ИмяПродавца`,
 1 AS `ОтчествоПродавца`,
 1 AS `ТелефонПродавца`,
 1 AS `ИмяАвтора`,
 1 AS `ФамилияАвтора`,
 1 AS `Отчество_Автора`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bookshelfs`
--

DROP TABLE IF EXISTS `bookshelfs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelfs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(45) DEFAULT NULL,
  `rows` int NOT NULL,
  `cols` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelfs`
--

LOCK TABLES `bookshelfs` WRITE;
/*!40000 ALTER TABLE `bookshelfs` DISABLE KEYS */;
INSERT INTO `bookshelfs` VALUES (1,'2022-07-30 10:00:00',12,5),(2,'2022-08-15 14:30:00',4,5),(3,'2022-04-1 15:00:00',9,6),(4,'2022-09-6 18:00:00',11,5),(5,'2022-02-21 17:00:00',1,5);
/*!40000 ALTER TABLE `bookshelfs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookshelfs_has_books`
--

DROP TABLE IF EXISTS `bookshelfs_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookshelfs_has_books` (
  `bookshelfs_id` int NOT NULL,
  `books_id` int NOT NULL,
  PRIMARY KEY (`bookshelfs_id`,`books_id`),
  KEY `fk_bookshelfs_has_books_books1_idx` (`books_id`),
  KEY `fk_bookshelfs_has_books_bookshelfs1_idx` (`bookshelfs_id`),
  CONSTRAINT `fk_bookshelfs_has_books_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_bookshelfs_has_books_bookshelfs1` FOREIGN KEY (`bookshelfs_id`) REFERENCES `bookshelfs` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookshelfs_has_books`
--

LOCK TABLES `bookshelfs_has_books` WRITE;
/*!40000 ALTER TABLE `bookshelfs_has_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookshelfs_has_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `patronymic` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Иван','Иванов','Иванович'),(2,'Федор','Федоров','Федорович'),(3,'Александр','Федоров','Антонович'),(4,'Александр','Сергеев','Сергеевич'),(5,'Сергей','Федоров','Антонович');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` datetime NOT NULL,
  `clients_id` int NOT NULL,
  `salesmen_id` int NOT NULL,
  `books_id` int NOT NULL,
  PRIMARY KEY (`id`,`clients_id`,`salesmen_id`,`books_id`),
  KEY `fk_orders_clients1_idx` (`clients_id`),
  KEY `fk_orders_salesmen1_idx` (`salesmen_id`),
  KEY `fk_orders_books1_idx` (`books_id`),
  CONSTRAINT `fk_orders_books1` FOREIGN KEY (`books_id`) REFERENCES `books` (`id`),
  CONSTRAINT `fk_orders_clients1` FOREIGN KEY (`clients_id`) REFERENCES `clients` (`id`),
  CONSTRAINT `fk_orders_salesmen1` FOREIGN KEY (`salesmen_id`) REFERENCES `salesmen` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (11,'2022-08-15 14:30:00',1,1,1),(12,'2022-07-08 16:30:00',2,2,2),(13,'2022-06-09 12:30:00',3,3,3),(14,'2022-05-02 13:30:00',4,4,4),(15,'2022-09-22 16:45:00',5,5,5);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesmen`
--

DROP TABLE IF EXISTS `salesmen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salesmen` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `patronymic` varchar(255) NOT NULL,
  `phon_number` varchar(20) DEFAULT NULL,
  `rate` enum('full','half') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesmen`
--

LOCK TABLES `salesmen` WRITE;
/*!40000 ALTER TABLE `salesmen` DISABLE KEYS */;
INSERT INTO `salesmen` VALUES (1,'Иван','Иванов','Иванович','12365678902','full'),(2,'Федор','Федоров','Федорович','098765432101','full'),(3,'Глеб','Глебов','Глебович','1357924683','half'),(4,'Александр','Александров','Александрович','24680135794','half'),(5,'Сергей','Сергеев','Сергеевич','98765432105','full');
/*!40000 ALTER TABLE `salesmen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `booksales`
--

/*!50001 DROP VIEW IF EXISTS `booksales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `booksales` AS select `b`.`ISBN` AS `ISBN`,`b`.`title` AS `НазваниеКниги`,cast(`b`.`price` as decimal(10,2)) AS `Цена`,`o`.`id` AS `НомерЗаказа`,`o`.`date` AS `ДатаПродажи`,`sm`.`id` AS `НомерПродавца`,`sm`.`surname` AS `ФамилияПродавца`,`sm`.`name` AS `ИмяПродавца`,`sm`.`patronymic` AS `ОтчествоПродавца`,`sm`.`phon_number` AS `ТелефонПродавца`,`a`.`name` AS `ИмяАвтора`,`a`.`surname` AS `ФамилияАвтора`,`a`.`patronymic` AS `Отчество_Автора` from ((((`books` `b` join `orders` `o` on((`b`.`id` = `o`.`books_id`))) join `salesmen` `sm` on((`o`.`salesmen_id` = `sm`.`id`))) join `books_has_authors` `bha` on((`b`.`id` = `bha`.`books_id`))) join `authors` `a` on((`bha`.`authors_id` = `a`.`id`))) */;
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

-- Dump completed on 2024-06-07 14:34:39

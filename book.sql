-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bookstore
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
  `name` varchar(45) DEFAULT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES ('Николай','Васильевич','Гоголь',1),('Николай','Васильевич','Гоголь',2),('Николай','Николайевич','Сергеевич',3),('Александр','Сергеевич','Пушкин',4),('Лев','Николаевич','Толстой',5),('Антон','Павлович','Чехов',6),('Сергей','Антонович','Сергеевич',7);
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorship`
--

DROP TABLE IF EXISTS `authorship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authorship` (
  `books_ISBN` char(13) NOT NULL,
  `authors_id` int NOT NULL,
  PRIMARY KEY (`books_ISBN`,`authors_id`),
  KEY `fk_книги_has_авторы_авторы1_idx` (`authors_id`),
  KEY `fk_книги_has_авторы_книги1_idx` (`books_ISBN`),
  CONSTRAINT `fk_книги_has_авторы_авторы1` FOREIGN KEY (`authors_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `fk_книги_has_авторы_книги1` FOREIGN KEY (`books_ISBN`) REFERENCES `books` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorship`
--

LOCK TABLES `authorship` WRITE;
/*!40000 ALTER TABLE `authorship` DISABLE KEYS */;
INSERT INTO `authorship` VALUES ('1234567890123',1),('1234567890124',2),('1234567890125',3),('1234567890126',4),('1234567890127',5),('1234567890128',6);
/*!40000 ALTER TABLE `authorship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ISBN` char(13) NOT NULL,
  `namebook` varchar(50) DEFAULT NULL,
  `price` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('','упкукпку','290.00'),('1234567890123','Тарас Бульба','255'),('1234567890124','Мёртвые души','400'),('1234567890125','Евгений онегин','555'),('1234567890126','Детсво','325'),('1234567890127','Кавказский пленник','290'),('1234567890128','Вишнёвый сад','326'),('1234967890127','Кавказский пленник','290'),('22441','Мёртвые души','350.00'),('9743161484100','Название Книги','280.00'),('9783161484100','Название Книги','280.00'),('9783661484100','Онегин','280.00'),('ISBNКНИГИ','НазваниеКниги','ЦенаКниги');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `InsertBooks` AFTER INSERT ON `books` FOR EACH ROW BEGIN
    DECLARE error_occurred BOOLEAN DEFAULT FALSE;

    -- Проверка наличия ошибок
    IF NEW.ISBN IS NULL THEN
        SET error_occurred = TRUE;
    END IF;

    IF error_occurred THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ошибка: ISBN не может быть NULL.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `IsbnBooks` AFTER INSERT ON `books` FOR EACH ROW BEGIN
    DECLARE error_occurred BOOLEAN DEFAULT FALSE;
    IF NEW.ISBN IS NULL THEN
        SET error_occurred = TRUE;
    END IF;

    IF error_occurred THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Ошибка: ISBN не может быть NULL.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `orders` char(16) NOT NULL,
  `dateofsale` datetime DEFAULT NULL,
  `thecompositionofsales_id` int NOT NULL,
  PRIMARY KEY (`orders`),
  KEY `fk_продажи_состав продаж1_idx` (`thecompositionofsales_id`),
  CONSTRAINT `fk_продажи_состав продаж1` FOREIGN KEY (`thecompositionofsales_id`) REFERENCES `thecompositionofsales` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES ('1004','2024-05-11 21:56:27',7),('1234567890123456','2024-05-19 17:46:13',11),('1234567890127','2024-05-11 21:59:14',8),('1234667890123456','2024-05-19 17:57:59',17),('1234867890123456','2024-05-19 17:55:34',15),('1234967890127','2024-05-11 22:01:13',10),('1294667890123456','2024-05-19 17:58:27',18),('ORDER001','2022-01-20 15:30:00',1),('ORDER002','2022-03-05 14:25:10',2),('ORDER003','2022-08-13 12:50:00',3),('ORDER004','2022-05-23 17:25:00',4),('ORDER005','2022-10-02 15:28:00',5),('ORDER006','2022-09-06 20:45:00',6),('цйуацуп','2024-05-19 17:48:52',12);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `check_book_price_trigger` BEFORE INSERT ON `sales` FOR EACH ROW BEGIN
    DECLARE book_price DECIMAL(10,2);

    SELECT CAST(price AS DECIMAL(10,2)) INTO book_price
    FROM books
    WHERE ISBN = (SELECT books_ISBN FROM thecompositionofsales WHERE id = NEW.thecompositionofsales_id);

    IF book_price IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Книга с указанным ISBN не найдена.';
    ELSEIF NEW.orders < book_price THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Денег не хватает. Цена книги выше, чем введенная цена.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sellers`
--

DROP TABLE IF EXISTS `sellers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sellers` (
  `number` char(24) NOT NULL,
  `surname` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `patronymic` varchar(45) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `sales_order` char(16) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `fk_продавцы_продажи1_idx` (`sales_order`),
  CONSTRAINT `fk_продавцы_продажи1` FOREIGN KEY (`sales_order`) REFERENCES `sales` (`orders`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sellers`
--

LOCK TABLES `sellers` WRITE;
/*!40000 ALTER TABLE `sellers` DISABLE KEYS */;
INSERT INTO `sellers` VALUES ('1001','Васильевич','Василий','Антонович','126-456-7890','ORDER001'),('1002','Сергевич','Антон','Николаевич','127-456-7890','ORDER002'),('1003','Николаевич','Николай','Сергеевич','128-456-7890','ORDER003'),('1004','Сергевич','Антон','Николаевич','127-456-7890','ORDER004'),('1005','Сергевич','Антон','Николаевич','127-456-7890','ORDER005'),('1006','Сергевич','Антон','Николаевич','127-456-7890','ORDER006'),('1007','Сергевич','Антон','Николаевич','127-456-79890','1234967890127'),('123456789012345678901234','Иванов','Иван','Иванович','123-456-7890','1234567890123456'),('123459789012345678901234','Иванов','Иван','Иванович','123-456-7890','1234867890123456'),('126456789012345678901234','Иванов','Иван','Иванович','123-456-7890','1234667890123456'),('упкц','кцуп','пкуаа','укцкцу','2423534','цйуацуп');
/*!40000 ALTER TABLE `sellers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thecompositionofsales`
--

DROP TABLE IF EXISTS `thecompositionofsales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thecompositionofsales` (
  `number` varchar(45) DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  `books_ISBN` char(13) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_состав продаж_книги1_idx` (`books_ISBN`),
  CONSTRAINT `fk_состав продаж_книги1` FOREIGN KEY (`books_ISBN`) REFERENCES `books` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thecompositionofsales`
--

LOCK TABLES `thecompositionofsales` WRITE;
/*!40000 ALTER TABLE `thecompositionofsales` DISABLE KEYS */;
INSERT INTO `thecompositionofsales` VALUES ('1',1,'1234567890124'),('2',2,'1234567890123'),('3',3,'1234567890125'),('4',4,'1234567890126'),('5',5,'1234567890127'),('6',6,'1234567890128'),(NULL,7,'ISBNКНИГИ'),(NULL,8,'1234567890127'),(NULL,9,'1234567890127'),(NULL,10,'1234967890127'),(NULL,11,'9783161484100'),(NULL,12,''),(NULL,13,'22441'),(NULL,14,'9783161484100'),(NULL,15,'9743161484100'),(NULL,16,'9783661484100'),(NULL,17,'9783661484100'),(NULL,18,'9783661484100'),(NULL,19,'');
/*!40000 ALTER TABLE `thecompositionofsales` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `example_trigger` BEFORE INSERT ON `thecompositionofsales` FOR EACH ROW BEGIN
    IF NEW.books_ISBN IS NULL THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'ISBN книги не может быть NULL.';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'bookstore'
--

--
-- Dumping routines for database 'bookstore'
--
/*!50003 DROP FUNCTION IF EXISTS `CalculateTotalSales` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CalculateTotalSales`(ISBN CHAR(13)) RETURNS decimal(10,2)
    DETERMINISTIC
BEGIN
    DECLARE total_sales DECIMAL(10, 2);

    SELECT SUM(CAST(b.price AS DECIMAL(10, 2)))
    INTO total_sales
    FROM books b
    JOIN thecompositionofsales tcs ON b.ISBN = tcs.books_ISBN
    JOIN sales s ON tcs.id = s.thecompositionofsales_id
    WHERE b.ISBN = ISBN;

    RETURN IFNULL(total_sales, 0);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `BuyBook` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `BuyBook`(
    IN p_ISBN CHAR(13),
    IN p_Namebook VARCHAR(50),
    IN p_Price DECIMAL(10,2),
    IN p_Orders CHAR(16),
    IN p_SellerNumber CHAR(24),
    IN p_Surname VARCHAR(45),
    IN p_Name VARCHAR(45),
    IN p_Patronymic VARCHAR(45),
    IN p_Telephone VARCHAR(20)
)
BEGIN
    DECLARE book_price DECIMAL(10,2);
    DECLARE sale_id INT;

    START TRANSACTION;

    INSERT INTO books (ISBN, namebook, price) VALUES (p_ISBN, p_Namebook, p_Price) 
    ON DUPLICATE KEY UPDATE namebook = VALUES(namebook), price = VALUES(price);

    INSERT INTO thecompositionofsales (books_ISBN) VALUES (p_ISBN);
    SET sale_id = LAST_INSERT_ID();

    INSERT INTO sales (orders, dateofsale, thecompositionofsales_id) VALUES (p_Orders, NOW(), sale_id);

    INSERT INTO sellers (number, surname, name, patronymic, telephone, sales_order) 
    VALUES (p_SellerNumber, p_Surname, p_Name, p_Patronymic, p_Telephone, p_Orders);

    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
/*!50001 VIEW `booksales` AS select `b`.`ISBN` AS `ISBN`,`b`.`namebook` AS `НазваниеКниги`,cast(`b`.`price` as decimal(10,2)) AS `Цена`,`s`.`orders` AS `НомерЗаказа`,`s`.`dateofsale` AS `ДатаПродажи`,`sel`.`number` AS `НомерПродавца`,`sel`.`surname` AS `ФамилияПродавца`,`sel`.`name` AS `ИмяПродавца`,`sel`.`patronymic` AS `ОтчествоПродавца`,`sel`.`telephone` AS `ТелефонПродавца`,`a`.`name` AS `ИмяАвтора`,`a`.`surname` AS `ФамилияАвтора`,`a`.`patronymic` AS `Отчество_Автора` from (((((`books` `b` join `thecompositionofsales` `tcs` on((`b`.`ISBN` = `tcs`.`books_ISBN`))) join `sales` `s` on((`tcs`.`id` = `s`.`thecompositionofsales_id`))) join `sellers` `sel` on((`s`.`orders` = `sel`.`sales_order`))) join `authorship` `auth` on((`b`.`ISBN` = `auth`.`books_ISBN`))) join `authors` `a` on((`auth`.`authors_id` = `a`.`id`))) */;
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

-- Dump completed on 2024-05-22 22:11:32

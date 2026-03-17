-- MySQL dump 10.13  Distrib 8.0.43, for macos15 (arm64)
--
-- Host: 127.0.0.1    Database: swiggy
-- ------------------------------------------------------
-- Server version	8.0.43

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
-- Table structure for table `delivery_partner`
--

DROP TABLE IF EXISTS `delivery_partner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery_partner` (
  `delivery_partner_id` int NOT NULL AUTO_INCREMENT,
  `delivery_partner_name` varchar(100) NOT NULL,
  `delivery_partner_phone_num` varchar(20) DEFAULT NULL,
  `vehicle_time` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`delivery_partner_id`),
  UNIQUE KEY `delivery_partner_phone_num` (`delivery_partner_phone_num`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_partner`
--

LOCK TABLES `delivery_partner` WRITE;
/*!40000 ALTER TABLE `delivery_partner` DISABLE KEYS */;
INSERT INTO `delivery_partner` VALUES (1,'Arun Kumar','9000011111','30 mins'),(2,'Vikram R','9000022222','25 mins'),(3,'Ravi S','9000033333','20 mins'),(4,'Manoj T','9000044444','35 mins'),(5,'Sathish P','9000055555','28 mins'),(6,'Dinesh K','9000066666','22 mins'),(7,'Lokesh M','9000077777','40 mins'),(8,'Ajay V','9000088888','18 mins'),(9,'Hari N','9000099999','33 mins'),(10,'Praveen L','9000000000','27 mins');
/*!40000 ALTER TABLE `delivery_partner` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `res_id` int NOT NULL,
  `item_name` varchar(50) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `is_available` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`menu_id`),
  KEY `fk_menu_restaurant` (`res_id`),
  CONSTRAINT `fk_menu_restaurant` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_chk_1` CHECK ((`price` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,1,'Masala Dosa',80.00,1),(2,1,'Poori',60.00,1),(3,2,'Veg Pizza',250.00,1),(4,2,'Garlic Bread',120.00,1),(5,3,'Chicken Biryani',220.00,1),(6,4,'Zinger Burger',180.00,1),(7,5,'Paneer Pizza',300.00,1),(8,6,'Veg Sub',150.00,1),(9,7,'Mutton Biryani',260.00,1),(10,8,'Idli',40.00,1);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_item_id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(8,2) NOT NULL,
  PRIMARY KEY (`order_item_id`),
  KEY `fk_orderitems_order` (`order_id`),
  KEY `fk_orderitems_menu` (`menu_id`),
  CONSTRAINT `fk_orderitems_menu` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`menu_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_orderitems_order` FOREIGN KEY (`order_id`) REFERENCES `order_table` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `order_items_chk_1` CHECK ((`quantity` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,1,1,1,80.00),(2,1,2,1,60.00),(3,2,3,1,250.00),(4,2,4,1,120.00),(5,3,5,1,220.00),(6,4,6,1,180.00),(7,5,7,1,300.00),(8,6,8,1,150.00),(9,7,9,1,260.00),(10,8,10,1,40.00);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `order_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `res_id` int NOT NULL,
  `delivery_partner_id` int DEFAULT NULL,
  `order_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `total_amount` decimal(8,2) NOT NULL,
  `order_status` enum('Pending','Packed','Out_for_delivery','Delivered','Cancelled') DEFAULT 'Pending',
  PRIMARY KEY (`order_id`),
  KEY `fk_order_user` (`user_id`),
  KEY `fk_order_restaurant` (`res_id`),
  KEY `fk_order_delivery` (`delivery_partner_id`),
  CONSTRAINT `fk_order_delivery` FOREIGN KEY (`delivery_partner_id`) REFERENCES `delivery_partner` (`delivery_partner_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_order_restaurant` FOREIGN KEY (`res_id`) REFERENCES `restaurant` (`res_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `user_table` (`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `order_table_chk_1` CHECK ((`total_amount` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
INSERT INTO `order_table` VALUES (1,1,1,NULL,'2026-02-18 17:34:18',140.00,'Delivered'),(2,2,2,NULL,'2026-02-18 17:34:18',370.00,'Out_for_delivery'),(3,3,3,NULL,'2026-02-18 17:34:18',220.00,'Pending'),(4,4,4,NULL,'2026-02-18 17:34:18',180.00,'Delivered'),(5,5,5,NULL,'2026-02-18 17:34:18',300.00,'Packed'),(6,6,6,NULL,'2026-02-18 17:34:18',150.00,'Cancelled'),(7,7,7,NULL,'2026-02-18 17:34:18',260.00,'Delivered'),(8,8,8,NULL,'2026-02-18 17:34:18',40.00,'Delivered'),(9,9,9,NULL,'2026-02-18 17:34:18',220.00,'Out_for_delivery'),(10,10,10,NULL,'2026-02-18 17:34:18',500.00,'Pending');
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurant`
--

DROP TABLE IF EXISTS `restaurant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurant` (
  `res_id` int NOT NULL AUTO_INCREMENT,
  `res_name` varchar(50) NOT NULL,
  `res_city` varchar(30) DEFAULT NULL,
  `average_rating` decimal(3,2) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`res_id`),
  CONSTRAINT `restaurant_chk_1` CHECK ((`average_rating` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurant`
--

LOCK TABLES `restaurant` WRITE;
/*!40000 ALTER TABLE `restaurant` DISABLE KEYS */;
INSERT INTO `restaurant` VALUES (1,'A2B','Chennai',4.30,1),(2,'Dominos','Chennai',4.10,1),(3,'Meghana Foods','Bangalore',4.50,1),(4,'KFC','Hyderabad',4.00,1),(5,'Pizza Hut','Bangalore',4.20,1),(6,'Subway','Chennai',3.90,1),(7,'Paradise Biryani','Hyderabad',4.60,1),(8,'Saravana Bhavan','Chennai',4.40,1),(9,'Empire Restaurant','Bangalore',4.10,1),(10,'Barbeque Nation','Hyderabad',4.30,1);
/*!40000 ALTER TABLE `restaurant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_table`
--

DROP TABLE IF EXISTS `user_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_table` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(100) DEFAULT NULL,
  `user_phone_number` varchar(20) DEFAULT NULL,
  `user_city` varchar(30) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_table`
--

LOCK TABLES `user_table` WRITE;
/*!40000 ALTER TABLE `user_table` DISABLE KEYS */;
INSERT INTO `user_table` VALUES (1,'Gino','gino@gmail.com','9876543210','Thoothukudi','Anna Nagar','2026-02-18 17:34:18'),(2,'Rahul','rahul@gmail.com','9123456780','Chennai','Velachery','2026-02-18 17:34:18'),(3,'Priya','priya@gmail.com','9988776655','Bangalore','MG Road','2026-02-18 17:34:18'),(4,'Arun','arun@gmail.com','9876512345','Hyderabad','Madhapur','2026-02-18 17:34:18'),(5,'Divya','divya@gmail.com','9090909090','Chennai','Tambaram','2026-02-18 17:34:18'),(6,'Karthik','karthik@gmail.com','8888888888','Bangalore','Whitefield','2026-02-18 17:34:18'),(7,'Sneha','sneha@gmail.com','7777777777','Hyderabad','Gachibowli','2026-02-18 17:34:18'),(8,'Vikram','vikram@gmail.com','6666666666','Chennai','T Nagar','2026-02-18 17:34:18'),(9,'Anu','anu@gmail.com','9555555555','Bangalore','Indiranagar','2026-02-18 17:34:18'),(10,'Suresh','suresh@gmail.com','9444444444','Hyderabad','Kukatpally','2026-02-18 17:34:18'),(11,'gains','gains@gmail.com','9762736778','Nazarath','MillRoll','2026-02-19 18:06:12'),(12,'Reks','Reks@gmail.com','9769736778','Thoothukudi','Snow Nagar','2026-02-19 18:08:12');
/*!40000 ALTER TABLE `user_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_high_spender`
--

DROP TABLE IF EXISTS `vw_high_spender`;
/*!50001 DROP VIEW IF EXISTS `vw_high_spender`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_high_spender` AS SELECT 
 1 AS `user_id`,
 1 AS `user_name`,
 1 AS `total_spend`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_high_spender`
--

/*!50001 DROP VIEW IF EXISTS `vw_high_spender`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_high_spender` AS select `u`.`user_id` AS `user_id`,`u`.`user_name` AS `user_name`,sum(`o`.`total_amount`) AS `total_spend` from (`user_table` `u` join `order_table` `o` on((`u`.`user_id` = `o`.`user_id`))) where (`o`.`order_status` = 'Delivered') group by `o`.`user_id`,`u`.`user_name` having (`total_spend` > 0) */;
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

-- Dump completed on 2026-03-17 19:02:43

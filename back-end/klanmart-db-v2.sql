-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: KLANmart
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) DEFAULT NULL,
  `answer` varchar(250) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`answer_id`),
  KEY `fk_question_ans_idx` (`question_id`),
  KEY `fk_user_question_idx` (`user_id`),
  CONSTRAINT `fk_question_ans` FOREIGN KEY (`question_id`) REFERENCES `question` (`question_id`),
  CONSTRAINT `fk_user_answer` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`product_id`),
  KEY `fk_fav_user_idx` (`user_id`),
  KEY `fk_user_prod` (`product_id`),
  CONSTRAINT `fk_user_fav` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `fk_user_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (1,1),(2,1),(2,2);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `order_time` datetime DEFAULT NULL,
  `order_status` varchar(45) DEFAULT NULL,
  `total_amount` double DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_user_idx` (`user_id`),
  KEY `fk_store_order_idx` (`store_id`),
  KEY `fk_order_prod` (`product_id`),
  CONSTRAINT `fk_order_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_store_order` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `fk_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,1,'2019-10-11 10:15:34','cart',2199,1,1),(2,1,2,'2019-10-12 12:32:45','paid',2199,1,1),(3,1,2,'2019-10-11 10:15:34','delivered',2199,1,1),(4,1,2,'2019-10-11 10:15:34','delivered',2199,1,1),(5,1,2,'2019-10-11 10:15:34','cart',2199,2,2),(6,1,2,'2019-10-11 10:45:14','paid',2199,2,2),(7,1,2,'2019-10-11 10:45:14','paid',2199,2,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `product_name` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `price` double NOT NULL,
  `promotion` varchar(200) DEFAULT NULL,
  `images` json DEFAULT NULL,
  PRIMARY KEY (`product_id`),
  KEY `store_id_idx` (`store_id`),
  CONSTRAINT `fk_store` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,'Long Sleeve T-Shirt Men','2019 Spring Brand Clothing Men Long Sleeve Round Neck T-Shirt',2199,'-10% Special Offer','{\"links\": [\"/blabla\", \"/bloblo\"]}'),(2,2,'Beats Wireless Headphone','Beats by dre Solo3 Wireless Bluetooth Headphone On-Ear Earphones',20300,'-5% Special Offer','{\"images\": [\"/link1\", \"/link2\"]}');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `question` varchar(250) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `fk_user_question_idx` (`user_id`),
  KEY `fk_store_question_idx` (`store_id`),
  CONSTRAINT `fk_store_question` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `fk_user_question` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `comment` varchar(250) DEFAULT NULL,
  `desc_rating` int(11) DEFAULT NULL,
  `comm_rating` int(11) DEFAULT NULL,
  `delivery_rating` int(11) DEFAULT NULL,
  `store_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_store_id_rev_idx` (`store_id`),
  KEY `fk_user_rev_idx` (`user_id`),
  KEY `fk_review_prod` (`product_id`),
  CONSTRAINT `fk_review_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`),
  CONSTRAINT `fk_store_id_rev` FOREIGN KEY (`store_id`) REFERENCES `store` (`store_id`),
  CONSTRAINT `fk_user_rev` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,1,1,'Nice quality. Fast delivery. Thank you',4,4,5,1);
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_name` varchar(200) NOT NULL,
  `reg_date` date DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lng` decimal(11,8) DEFAULT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Trendy Fashion Store','2018-11-12','23, Hyde Park Corner, Colombo-02',6.91798300,79.86088300),(2,'8 Line Tech Store','2019-01-03','210, Main Street, Colombo-11',6.93809800,79.85222800);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `join_date` date DEFAULT NULL,
  `points` int(11) DEFAULT NULL,
  `gender` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `pref_currency` varchar(45) DEFAULT NULL,
  `f_name` varchar(100) DEFAULT NULL,
  `l_name` varchar(100) DEFAULT NULL,
  `mobile_no` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'john@gmail.com','123123','2019-02-01',150,'M','120, Prince Street, Colombo-07','LKR','john','hendry','+94777324845'),(2,'jackie@gmail.com','123123','2019-03-10',NULL,'M','12, Green Lane, Colombo-04',NULL,'Jackie','Chan','+94744584753'),(3,'john@gmail.com','123123','2019-02-01',150,'M','120, Prince Street, Colombo-07','LKR','john','hendry','+94777324845'),(11,'jackie@gmail.com','123123','2019-03-10',NULL,'M','12, Green Lane, Colombo-04',NULL,'Jackie','Chan','+94744584753'),(12,'jackie@gmail.com','123123','2019-03-10',NULL,'M','12, Green Lane, Colombo-04',NULL,'Jackie','Chan','+94744584753'),(13,'kk@gmail.com','123123','2019-03-10',NULL,'M','12, Green Lane, Colombo-04',NULL,'Jackie','Chan','+94744584753'),(14,'kk@gmail.com','123123','2019-03-10',NULL,'M','12, Green Lane, Colombo-04',NULL,'Jackie','Chan','+94744584753');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'KLANmart'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 15:38:39

-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydb
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `idAddress` int NOT NULL,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipCode` int DEFAULT NULL,
  `User_IDuser` int NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Address_User1_idx` (`User_IDuser`),
  CONSTRAINT `fk_Address_User1` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `ISBN` varchar(14) NOT NULL,
  `Category` varchar(45) NOT NULL,
  `Authors_Names` varchar(45) NOT NULL,
  `Title` varchar(45) NOT NULL,
  `Cover_Picture` varchar(100) NOT NULL,
  `Edition` int DEFAULT NULL,
  `Publisher` varchar(45) NOT NULL,
  `Publication_Year` int NOT NULL,
  `Quantity_In_Stock` int NOT NULL,
  `Minimum_Threshold` int DEFAULT NULL,
  `Buying_Price` decimal(2,0) NOT NULL,
  `Selling_Price` decimal(2,0) NOT NULL,
  `Description` longtext,
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES ('9.7808E+12','fiction;espionage','Viet Thanh Nguyen','The Committed','https://images-na.ssl-images-amazon.com/images/I/415A+1TaBGL._SX329_BO1,204,203,200_.jpg',1,'Grove Press',2021,2,1,15,23,'The sequel to The Sympathizer, which won the 2016 Pulitzer Prize in Fiction and went on to sell over a million copies worldwide, The Committed tells the story of the man of two minds as he comes as a refugee to France and turns his hand to capitalism');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `idCard` int NOT NULL,
  `cardType` varchar(45) NOT NULL,
  `expirationDate` date DEFAULT NULL,
  `User_IDuser` int NOT NULL,
  PRIMARY KEY (`idCard`),
  KEY `fk_Card_User_idx` (`User_IDuser`),
  CONSTRAINT `fk_Card_User` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `card`
--

LOCK TABLES `card` WRITE;
/*!40000 ALTER TABLE `card` DISABLE KEYS */;
/*!40000 ALTER TABLE `card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` int NOT NULL,
  `subCost` double NOT NULL,
  `User_IDuser` int NOT NULL,
  `Card_idCard` int NOT NULL,
  `Address_idAddress` int NOT NULL,
  `orderDate` date NOT NULL,
  `Promotion_idPromotion` int DEFAULT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_Order_User1_idx` (`User_IDuser`),
  KEY `fk_Order_Card1_idx` (`Card_idCard`),
  KEY `fk_Order_Address1_idx` (`Address_idAddress`),
  KEY `fk_Order_Promotion1_idx` (`Promotion_idPromotion`),
  CONSTRAINT `fk_Order_Address1` FOREIGN KEY (`Address_idAddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `fk_Order_Card1` FOREIGN KEY (`Card_idCard`) REFERENCES `card` (`idCard`),
  CONSTRAINT `fk_Order_Promotion1` FOREIGN KEY (`Promotion_idPromotion`) REFERENCES `promotion` (`idPromotion`),
  CONSTRAINT `fk_Order_User1` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_has_books`
--

DROP TABLE IF EXISTS `order_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_has_books` (
  `Order_idOrder` int NOT NULL,
  `Books_ISBN` int NOT NULL,
  PRIMARY KEY (`Order_idOrder`,`Books_ISBN`),
  KEY `fk_Order_has_Books_Books1_idx` (`Books_ISBN`),
  KEY `fk_Order_has_Books_Order1_idx` (`Order_idOrder`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_has_books`
--

LOCK TABLES `order_has_books` WRITE;
/*!40000 ALTER TABLE `order_has_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_has_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `idPromotion` int NOT NULL,
  `discount` decimal(10,0) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  PRIMARY KEY (`idPromotion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion`
--

LOCK TABLES `promotion` WRITE;
/*!40000 ALTER TABLE `promotion` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion_has_books`
--

DROP TABLE IF EXISTS `promotion_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion_has_books` (
  `Promotion_idPromotion` int NOT NULL,
  `Books_ISBN` int NOT NULL,
  PRIMARY KEY (`Promotion_idPromotion`,`Books_ISBN`),
  KEY `fk_Promotion_has_Books_Books1_idx` (`Books_ISBN`),
  KEY `fk_Promotion_has_Books_Promotion1_idx` (`Promotion_idPromotion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `promotion_has_books`
--

LOCK TABLES `promotion_has_books` WRITE;
/*!40000 ALTER TABLE `promotion_has_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `promotion_has_books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `IDuser` int NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `userState` varchar(45) NOT NULL DEFAULT 'Active',
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`IDuser`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (,'Aries','Aviles','aries','pass123','1999-01-01',1,'Active','ane.aviles@gmail.com'),(,'Calvin','Butson','cb81','321pass','1999-01-01',0,'Active','calvin.butson@gmail.com');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart` (
  `idUserCart` int NOT NULL,
  `User_IDuser` int NOT NULL,
  `totalPrice` double NOT NULL,
  PRIMARY KEY (`idUserCart`),
  UNIQUE KEY `User_IDuser_UNIQUE` (`User_IDuser`),
  UNIQUE KEY `idUserCart_UNIQUE` (`idUserCart`),
  KEY `fk_UserCart_User1_idx` (`User_IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart_has_books`
--

DROP TABLE IF EXISTS `usercart_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart_has_books` (
  `UserCart_idUserCart` int NOT NULL,
  `Books_ISBN` int NOT NULL,
  PRIMARY KEY (`UserCart_idUserCart`,`Books_ISBN`),
  KEY `fk_UserCart_has_Books_Books1_idx` (`Books_ISBN`),
  KEY `fk_UserCart_has_Books_UserCart1_idx` (`UserCart_idUserCart`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart_has_books`
--

LOCK TABLES `usercart_has_books` WRITE;
/*!40000 ALTER TABLE `usercart_has_books` DISABLE KEYS */;
/*!40000 ALTER TABLE `usercart_has_books` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-29 16:34:09

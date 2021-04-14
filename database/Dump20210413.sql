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

CREATE USER 'adminuser'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON mydb.* to 'adminuser'@'localhost';
FLUSH PRIVILEGES;

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
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `ISBN` varchar(14) NOT NULL,
  `Category` varchar(120) DEFAULT NULL,
  `Authors_Names` varchar(45) NOT NULL,
  `Title` varchar(90) NOT NULL,
  `Cover_Picture` varchar(120) NOT NULL,
  `Edition` int DEFAULT NULL,
  `Publisher` varchar(45) NOT NULL,
  `Publication_Year` int NOT NULL,
  `Quantity_In_Stock` int NOT NULL,
  `Minimum_Threshold` int DEFAULT NULL,
  `Buying_Price` decimal(6,0) NOT NULL,
  `Selling_Price` decimal(6,0) NOT NULL,
  `Description` longtext,
  PRIMARY KEY (`ISBN`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-0062457806','teen & young adult lgbtq+ fiction; teen & young adult friendship fiction; lgbtq+ books','Adam Silvera','They Both Die at the End','https://images-na.ssl-images-amazon.com/images/I/51zJppJNkkL._SX330_BO1,204,203,200_.jpg',2,'Quill Tree Books',2018,7,1,7,11,'On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: Theyre going to die today.'),('978-0062976581','literary graphic novels; philosophy of ethics & morality; happiness self-help','Charlie Mackesy','The Boy, the Mole, the Fox and the Horse','https://images-na.ssl-images-amazon.com/images/I/418D9yYGB3L._SX369_BO1,204,203,200_.jpg',2,'HarperOne',2019,12,1,8,12,'From British illustrator, artist, and author Charlie Mackesy comes a journey for all ages that explores lifes universal lessons, featuring 100 color and black-and-white drawings.'),('978-0063012097','interpersonal; codependency; happiness self-help','Dr. Nicole LePera','How to Do the Work: Recognize Your Patterns, Heal from Your Past, and Create Your Self','https://images-na.ssl-images-amazon.com/images/I/51k0QAGDSkL._SX327_BO1,204,203,200_.jpg',1,'Harper Wave',2021,5,1,11,16,'From Dr. Nicole LePera, creator of \"the holistic psychologist\"\"the online phenomenon with more than two million Instagram followerscomes a revolutionary approach to healing that harnesses the power of the self to produce lasting change.\"'),('978-0358653035','classic literature; fiction; novel; sword & sorcery fantasy; mythology & folk tales','J.R.R. Tolkien','The Lord of the Rings Illustrated Edition','https://images-na.ssl-images-amazon.com/images/I/41vN31PD7SL._SX323_BO1,204,203,200_.jpg',3,'Houghton Mifflin Harcourt',2021,8,1,30,45,'J.R.R. Tolkiens grand masterwork in a new hardcover illustrated with the art created by Tolkien himself as he envisioned Middle-earth'),('978-0394861029','children','Marilyn Sadler','It\'s Not Easy Being a Bunny','https://images-na.ssl-images-amazon.com/images/I/51al5c5C52L._SX365_BO1,204,203,200_.jpg',7,'Random House Books for Young Readers',1983,3,1,4,6,'P.J. Funnybunny doesn\'t want to be a bunny anymore! In this hilarious Beginner Book, a young bunny explores life with different animal friends. This bunny-rific tale of self-discovery makes a perfect gift to fill any Easter basket!'),('978-0440180296','novel; science fiction; satire; metafiction; war story; historical fiction; dark comedy; time travel fiction','Kurt Vonnegut','Slaughterhouse-five','https://images-na.ssl-images-amazon.com/images/I/41Rb55Ct28L._SX328_BO1,204,203,200_.jpg',5,'Dell Publishing',1991,2,1,7,9,'Slaughterhouse-Five, an American classic, is one of the world\'s great antiwar books. Centering on the infamous World War II firebombing of Dresden, the novel is the result of what Vonnegut describes as a twenty-three-year struggle to write a book about what he himself witnessed as an American prisoner of war. It combines science fiction, autobiography, humor, historical fiction, and satire in an account of the life of Billy Pilgrim, a barber\'s son turned draftee turned optometrist turned alien abductee. Billy, like Vonnegut, experiences the destruction of Dresden as a POW, and, as with Vonnegut, it is the defining moment of his life. Unlike the author, he also experiences time travel, or coming \"unstuck in time.\"\" Billy Pilgrim\'s odyssey reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.\"'),('978-0525559474','literary fiction; time travel fiction; women\'s literature & fiction; novel','Matt Haig','The Midnight Library: A Novel','https://images-na.ssl-images-amazon.com/images/I/51Ifl1zXhJL._SX329_BO1,204,203,200_.jpg',1,'Viking',2020,4,1,10,14,'A dazzling novel about all the choices that go into a life well lived, from the internationally bestselling author of Reasons to Stay Alive and How To Stop Time.'),('978-0802157065','fiction;espionage','Viet Thanh Nguyen','The Committed','https://images-na.ssl-images-amazon.com/images/I/415A+1TaBGL._SX329_BO1,204,203,200_.jpg',1,'Grove Press',2021,4,1,15,23,'The sequel to The Sympathizer, which won the 2016 Pulitzer Prize in Fiction and went on to sell over a million copies worldwide, The Committed tells the story of the man of two minds as he comes as a refugee to France and turns his hand to capitalism');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
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
  `cardHolderName` varchar(45) DEFAULT NULL,
  `cardNumber` varchar(70) NOT NULL,
  `cardSecurity` varchar(70) NOT NULL,
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
  `Book_ISBN` varchar(14) NOT NULL,
  PRIMARY KEY (`Order_idOrder`,`Book_ISBN`),
  KEY `fk_Order_has_Books_Books1_idx` (`Book_ISBN`),
  KEY `fk_Order_has_Books_Order1_idx` (`Order_idOrder`),
  CONSTRAINT `fk_Order_has_Books_Books1` FOREIGN KEY (`Book_ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `fk_Order_has_Books_Order1` FOREIGN KEY (`Order_idOrder`) REFERENCES `order` (`idOrder`)
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
  `idPromotion` int NOT NULL AUTO_INCREMENT,
  `discount` decimal(10,0) NOT NULL,
  `dateStart` date NOT NULL,
  `dateEnd` date NOT NULL,
  `hasBeenSent` tinyint NOT NULL,
  `promoCode` varchar(45) NOT NULL,
  PRIMARY KEY (`idPromotion`),
  UNIQUE KEY `idPromotion_UNIQUE` (`idPromotion`),
  UNIQUE KEY `promoCode_UNIQUE` (`promoCode`)
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
  `password` varchar(70) NOT NULL,
  `birthDate` date DEFAULT NULL,
  `isAdmin` tinyint NOT NULL DEFAULT '0',
  `userState` varchar(45) NOT NULL DEFAULT 'Active',
  `email` varchar(45) NOT NULL,
  `isPromotion` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`IDuser`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'Calvin','Butson','cb81','$2a$10$MHkkOXE9ikUsTNEvVwSNT.wJDst0iXVV3VBK4G.gJOvXIMsEiOOwC','1999-01-01',0,'Active','calvin.butson@gmail.com',0),(2,'Example','Test','test1','$2a$10$rFkio6T39ynyDhToSbEey.EwtO17XpFKLcaUohmodTfn.YwqeMebm','2015-06-15',1,'Active','test@gmail.com',0),(3,'Calvin2','Butson','ceb999','$2a$10$w2VSbe4ZNtzSgAgXDfGZI.3r985ys4YR2zG64JCN4iUrEZMVSufPS','1999-10-21',1,'Active','ceb28103@uga.edu',0),(5,'Aries','Aviles','aries','$2a$10$XoJEjaWb0luiU8wjTAA6RuN80V8ghGxX9MIqeA6LucyvUR.rNupYa','1999-01-01',1,'Active','ane.aviles@gmail.com',0);
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
  KEY `fk_UserCart_User1_idx` (`User_IDuser`),
  CONSTRAINT `fk_UserCart_User1` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
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
  `Book_ISBN` varchar(14) NOT NULL,
  PRIMARY KEY (`UserCart_idUserCart`,`Book_ISBN`),
  KEY `fk_UserCart_has_Books_Books1_idx` (`Book_ISBN`),
  KEY `fk_UserCart_has_Books_UserCart1_idx` (`UserCart_idUserCart`),
  CONSTRAINT `fk_UserCart_has_Books_Books1` FOREIGN KEY (`Book_ISBN`) REFERENCES `book` (`ISBN`),
  CONSTRAINT `fk_UserCart_has_Books_UserCart1` FOREIGN KEY (`UserCart_idUserCart`) REFERENCES `usercart` (`idUserCart`)
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

-- Dump completed on 2021-04-13 22:29:32

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
  `idAddress` bigint NOT NULL AUTO_INCREMENT,
  `street` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipCode` int DEFAULT NULL,
  `User_IDuser` bigint NOT NULL,
  PRIMARY KEY (`idAddress`),
  KEY `fk_Address_User1_idx` (`User_IDuser`),
  CONSTRAINT `FKr8pvvu626ueoet11r68nwvvxq` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
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
  `Buying_Price` double NOT NULL,
  `Selling_Price` double NOT NULL,
  `Description` longtext,
  `id` bigint NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ISBN_UNIQUE` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('978-0062457806','teen & young adult lgbtq+ fiction; teen & young adult friendship fiction; lgbtq+ books','Adam Silvera','They Both Die at the End','https://images-na.ssl-images-amazon.com/images/I/51zJppJNkkL._SX330_BO1,204,203,200_.jpg',2,'Quill Tree Books',2018,7,1,7,11,'On September 5, a little after midnight, Death-Cast calls Mateo Torrez and Rufus Emeterio to give them some bad news: They??re going to die today.',1),('978-0062976581','literary graphic novels; philosophy of ethics & morality; happiness self-help','Charlie Mackesy','The Boy, the Mole, the Fox and the Horse','https://images-na.ssl-images-amazon.com/images/I/418D9yYGB3L._SX369_BO1,204,203,200_.jpg',2,'HarperOne',2019,12,1,8,12,'From British illustrator, artist, and author Charlie Mackesy comes a journey for all ages that explores life??s universal lessons, featuring 100 color and black-and-white drawings.',2),('978-0063012097','interpersonal; codependency; happiness self-help','Dr. Nicole LePera','How to Do the Work: Recognize Your Patterns, Heal from Your Past, and Create Your Self','https://images-na.ssl-images-amazon.com/images/I/51k0QAGDSkL._SX327_BO1,204,203,200_.jpg',1,'Harper Wave',2021,5,1,11,16,'From Dr. Nicole LePera, creator of \"the holistic psychologist\"\"??the online phenomenon with more than two million Instagram followers??comes a revolutionary approach to healing that harnesses the power of the self to produce lasting change.\"',3),('978-0358653035','classic literature; fiction; novel; sword & sorcery fantasy; mythology & folk tales','J.R.R. Tolkien','The Lord of the Rings Illustrated Edition','https://images-na.ssl-images-amazon.com/images/I/41vN31PD7SL._SX323_BO1,204,203,200_.jpg',3,'Houghton Mifflin Harcourt',2021,8,1,30,45,'J.R.R. Tolkien??s grand masterwork in a new hardcover illustrated with the art created by Tolkien himself as he envisioned Middle-earth',4),('978-0394861029','children','Marilyn Sadler','It\'s Not Easy Being a Bunny','https://images-na.ssl-images-amazon.com/images/I/51al5c5C52L._SX365_BO1,204,203,200_.jpg',7,'Random House Books for Young Readers',1983,3,1,4,6,'P.J. Funnybunny doesn\'t want to be a bunny anymore! In this hilarious Beginner Book, a young bunny explores life with different animal friends. This bunny-rific tale of self-discovery makes a perfect gift to fill any Easter basket!',5),('978-0440180296','novel; science fiction; satire; metafiction; war story; historical fiction; dark comedy; time travel fiction','Kurt Vonnegut','Slaughterhouse-five','https://images-na.ssl-images-amazon.com/images/I/41Rb55Ct28L._SX328_BO1,204,203,200_.jpg',5,'Dell Publishing',1991,2,1,7,9,'Slaughterhouse-Five, an American classic, is one of the world\'s great antiwar books. Centering on the infamous World War II firebombing of Dresden, the novel is the result of what Vonnegut describes as a twenty-three-year struggle to write a book about what he himself witnessed as an American prisoner of war. It combines science fiction, autobiography, humor, historical fiction, and satire in an account of the life of Billy Pilgrim, a barber\'s son turned draftee turned optometrist turned alien abductee. Billy, like Vonnegut, experiences the destruction of Dresden as a POW, and, as with Vonnegut, it is the defining moment of his life. Unlike the author, he also experiences time travel, or coming \"unstuck in time.\"\" Billy Pilgrim\'s odyssey reflects the mythic journey of our own fractured lives as we search for meaning in what we fear most.\"',6),('978-0525559474','literary fiction; time travel fiction; women\'s literature & fiction; novel','Matt Haig','The Midnight Library: A Novel','https://images-na.ssl-images-amazon.com/images/I/51Ifl1zXhJL._SX329_BO1,204,203,200_.jpg',1,'Viking',2020,4,1,10,14,'A dazzling novel about all the choices that go into a life well lived, from the internationally bestselling author of Reasons to Stay Alive and How To Stop Time.',7),('978-0802157065','fiction;espionage','Viet Thanh Nguyen','The Committed','https://images-na.ssl-images-amazon.com/images/I/415A+1TaBGL._SX329_BO1,204,203,200_.jpg',1,'Grove Press',2021,4,1,15,23,'The sequel to??The Sympathizer, which won the 2016 Pulitzer Prize in Fiction and went on to sell over a million copies worldwide,??The Committed??tells the story of the man of two minds as he comes as a refugee to France and turns his hand to capitalism',8),('978-0553537864','children','Suzanna Lang;Max Lang','Grumpy Monkey','https://images-na.ssl-images-amazon.com/images/I/51KfSQWv8-L._SY498_BO1,204,203,200_.jpg',2,'Random House Books for Young Readers',2018,5,1,4,7.99,'Jim the chimpanzee is in a terrible mood for no good reason. His friends can\'t understand it--how can he be in a bad mood when it\'s SUCH a beautiful day? They have lots of suggestions for how to make him feel better. But Jim can\'t take all the advice...and has a BIT of a meltdown. Could it be that he just needs a day to feel grumpy?',17),('978-0593121962','children','Kristen Bell;Benjamin Hart;Daniel Wiseman','The World Needs More Purple People','https://images-na.ssl-images-amazon.com/images/I/51QmX7S38-L._SX258_BO1,204,203,200_.jpg',1,'Random House Books for Young Readers',2020,8,1,7,9.99,'What is a purple person? Great question. I mean, really great! Because purple people always ask really great questions. They bring their family, friends, and communities together, and they speak up for what??s right. They are kind and hardworking, and they love to laugh (especially at Grandpa??s funny noises)! A purple person is an everyday superhero! How do you become one? That??s the fun part! Penny Purple will lead you through the steps. Get ready to be silly, exercise your curiosity, use your voice, and be inspired.',18),('978-0805047905','children','Bill Martin Jr.;Eric Carle','Brown Bear, Brown Bear, What Do You See?','https://images-na.ssl-images-amazon.com/images/I/51430n+9jlL._SX355_BO1,204,203,200_.jpg',6,'Henry Holt and Co.',1996,3,1,5,11.99,'A big happy frog, a plump purple cat, a handsome blue horse, and a soft yellow duck--all parade across the pages of this delightful book. Children will immediately respond to Eric Carle\'s flat, boldly colored collages. Combined with Bill Martin\'s singsong text, they create unforgettable images of these endearing animals.',19),('978-0451524935','fiction;dystopian fiction;political fiction;science fiction','George Orwell','1984','https://images-na.ssl-images-amazon.com/images/I/41aM4xOZxaL._SX277_BO1,204,203,200_.jpg',2,'Signet Classic',1961,11,1,4,7.99,'Winston Smith toes the Party line, rewriting history to satisfy the demands of the Ministry of Truth. With each lie he writes, Winston grows to hate the Party that seeks power for its own sake and persecutes those who dare to commit thoughtcrimes. But as he starts to think for himself, Winston can??t escape the fact that Big Brother is always watching...',20),('978-0441005901','science fiction;fiction;novel','Frank Herbert','Dune','https://images-na.ssl-images-amazon.com/images/I/41I3oIdYFkL._SX355_BO1,204,203,200_.jpg',4,'Ace',1999,5,1,5,9.99,'Set on the desert planet Arrakis,??Dune??is the story of the boy Paul Atreides, heir to a noble family tasked with ruling an inhospitable world where the only thing of value is the ??spice?? melange, a drug capable of extending life and enhancing consciousness. Coveted across the known universe, melange is a prize worth killing for....',21),('978-0553103540','fiction;fantasy','George R. R. Martin','A Game of Thrownes (Song of Ice and Fire)','https://images-na.ssl-images-amazon.com/images/I/51RbpshZ-LL._SX326_BO1,204,203,200_.jpg',1,'Bantam',1996,8,1,11,21.99,'Winter is coming. Such is the stern motto of House Stark, the northernmost of the fiefdoms that owe allegiance to King Robert Baratheon in far-off King??s Landing. There Eddard Stark of Winterfell rules in Robert??s name. There his family dwells in peace and comfort: his proud wife, Catelyn; his sons Robb, Brandon, and Rickon; his daughters Sansa and Arya; and his bastard son, Jon Snow. Far to the north, behind the towering Wall, lie savage Wildings and worse??unnatural things relegated to myth during the centuries-long summer, but proving all too real and all too deadly in the turning of the season.',22),('978-0385490818','fiction;political fiction;novel','The Handmaid\'s Tale','Margaret Atwood','https://images-na.ssl-images-amazon.com/images/I/41vgWYsM82L._SX323_BO1,204,203,200_.jpg',1,'Knopf Doubleday Publishing Group',1998,4,1,6,11.99,'In Margaret Atwood??s dystopian future, environmental disasters and declining birthrates have led to a Second American Civil War. The result is the rise of the Republic of Gilead, a totalitarian regime that enforces rigid social roles and enslaves the few remaining fertile women. Offred is one of these, a Handmaid bound to produce children for one of Gilead??s commanders. Deprived of her husband, her child, her freedom, and even her own name, Offred clings to her memories and her will to survive. At once a scathing satire, an ominous warning, and a tour de force of narrative suspense,??The Handmaid??s Tale??is a modern classic.',23),('978-1538719671','crime action;thriller;historical thriller;fiction','David Baldacci','A Gambling Man','https://images-na.ssl-images-amazon.com/images/I/51m75WhqUoL._SX329_BO1,204,203,200_.jpg',3,'Grand Central Publishing',2021,7,1,4,14.99,'The 1950s are on the horizon, and Archer is in dire need of a fresh start after a nearly fatal detour in Poca City. So Archer hops on a bus and begins the long journey out west to California, where rumor has it there is money to be made if you??re hard-working, lucky, criminal??or all three.',24),('978-0593087022','thriller;murder thriller;suspense thriller;mystery','','Ocean Prey (A Prey Novel)','https://images-na.ssl-images-amazon.com/images/I/51kCv1KGJ0L._SX329_BO1,204,203,200_.jpg',1,'G.P. Putnam\'s Sons',2021,2,1,9,18.99,'An off-duty Coast Guardsman is fishing with his family when he calls in some suspicious behavior from a nearby boat. It\'s a snazzy craft, slick and outfitted with extra horsepower, and is zipping along until it slows to pick up a surfaced diver . . . a diver who was apparently alone, without his own boat, in the middle of the ocean. None of it makes sense unless there\'s something hinky going on, and his hunch is proved right when all three Guardsmen who come out to investigate are shot and killed.',25),('978-0063059412','war fiction;espionage;thriller;mystery;novel','Kate Quinn','The Rose Code: A Novel','https://images-na.ssl-images-amazon.com/images/I/51t0fe6lW9S._SX328_BO1,204,203,200_.jpg',1,'William Morrow',2021,15,1,10,21.99,'1940. As England prepares to fight the Nazis, three very different women answer the call to mysterious country estate Bletchley Park, where the best minds in Britain train to break German military codes. Vivacious debutante Osla is the girl who has everything??beauty, wealth, and the dashing Prince Philip of Greece sending her roses??but she burns to prove herself as more than a society girl, and puts her fluent German to use as a translator of decoded enemy secrets. Imperious self-made Mab, product of east-end London poverty, works the legendary codebreaking machines as she conceals old wounds and looks for a socially advantageous husband. Both Osla and Mab are quick to see the potential in local village spinster Beth, whose shyness conceals a brilliant facility with puzzles, and soon Beth spreads her wings as one of the Park??s few female cryptanalysts. But war, loss, and the impossible pressure of secrecy will tear the three apart.',26),('978-1250120953','thriller;fiction;sisters fiction;domestic thrillers;novel','Sally Hepworth','The Good Sister: A Novel','https://images-na.ssl-images-amazon.com/images/I/51IUjnxdI9L._SX327_BO1,204,203,200_.jpg',1,'St. Martin\'s Press',2021,8,2,7,18.99,'Fern Castle works in her local library. She has dinner with her twin sister Rose three nights a week. And she avoids crowds, bright lights and loud noises as much as possible. Fern has a carefully structured life and disrupting her routine can be...dangerous.',27),('978-0735211292','self-help;personal transformation self-help','James Clear','Atomic Habits','https://images-na.ssl-images-amazon.com/images/I/51Tlm0GZTXL._SX329_BO1,204,203,200_.jpg',3,'Avery',2018,5,2,7,14.99,'No matter your goals,??Atomic Habits??offers a proven framework for improving--every day. James Clear, one of the world\'s leading experts on habit formation, reveals practical strategies that will teach you exactly how to form good habits, break bad ones, and master the tiny behaviors that lead to remarkable results.',28),('978-1538719961','self-help;self-esteem;motivational','Admiral William H. McRaven','The Hero Code','https://images-na.ssl-images-amazon.com/images/I/41APkS19ZCL._SX349_BO1,204,203,200_.jpg',1,'Grand Central Publishing',2021,8,1,8,13.6,'THE HERO CODE is Admiral McRaven\'s ringing tribute to the real, everyday heroes he\'s met over the years, from battlefields to hospitals to college campuses, who are doing their part to save the world.',29),('978-0062457714','self-help;motivational;happiness;humor;pyschology humor','Mark Manson','The Subtle Art of Not Giving a F*ck','https://images-na.ssl-images-amazon.com/images/I/51mN3bY0JjL._SX332_BO1,204,203,200_.jpg',2,'Harper',2016,9,1,5,12.99,'In this generation-defining self-help guide, a superstar blogger cuts through the crap to show us how to stop trying to be \"positive\"\" all the time so that we can truly become better',30),('978-0593132487','cooking;vegetarian cooking;natural food cooking','Eric Ripert','Vegetable Simple: A Cookbook','https://images-na.ssl-images-amazon.com/images/I/41U5YZ6dngL._SX370_BO1,204,203,200_.jpg',1,'Random House Books for Young Readers',2021,10,1,16,26.99,'Eric Ripert is the chef and co-owner of the acclaimed restaurant Le Bernardin, and the winner of countless Michelin stars, well known for his exquisite, clean, seafood-centered cuisine. But lately, Ripert has found himself reaching for vegetables as his main food source??and doing so, as is his habit, with great intent and care.',31),('978-1950099382','cooking;fryer recipes','Delish','Party in an Air Fryer: 75+ Air Fryer Recipes','https://images-na.ssl-images-amazon.com/images/I/51KEGPlYUgL._SX418_BO1,204,203,200_.jpg',2,'Hearst',2019,4,1,10,18.99,'',32),('978-1452179612','cooking;humor;celebrity','Snoop Dogg','From Crook to Cook','https://images-na.ssl-images-amazon.com/images/I/5160yyObJrL._SX417_BO1,204,203,200_.jpg',2,'Chronicle Books',2018,8,1,9,11.99,'The first cookbook and recipe book from Tha Dogg,??From Crook to Cook: Platinum Recipes from Tha Boss Dogg\'s Kitchen. You\'ve seen Snoop Dogg work his culinary magic on VH1\'s Emmy-nominated Martha and Snoop\'s Potluck Dinner Party, and now Tha Dogg\'s up in your kitchen...with his first cookbook.',33);
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `card`
--

DROP TABLE IF EXISTS `card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `card` (
  `idCard` bigint NOT NULL AUTO_INCREMENT,
  `cardType` varchar(45) NOT NULL,
  `expirationDate` date NOT NULL,
  `User_IDuser` bigint NOT NULL,
  `cardHolderName` varchar(45) NOT NULL,
  `cardNumber` varchar(70) NOT NULL,
  `cardSecurity` varchar(70) NOT NULL,
  PRIMARY KEY (`idCard`),
  KEY `fk_Card_User_idx` (`User_IDuser`),
  CONSTRAINT `FK41k43lwd6k757ih7um19s8xyp` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
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
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (6);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idOrder` bigint NOT NULL AUTO_INCREMENT,
  `subCost` double NOT NULL,
  `orderDate` date NOT NULL,
  `Promotion_idPromotion` bigint DEFAULT NULL,
  `Address_idAddress` bigint NOT NULL,
  `User_IDuser` bigint NOT NULL,
  `Card_idCard` bigint NOT NULL,
  PRIMARY KEY (`idOrder`),
  KEY `fk_Order_Promotion1_idx` (`Promotion_idPromotion`),
  KEY `fk_Order_Address1_idx` (`Address_idAddress`),
  KEY `fk_Order_User1_idx` (`User_IDuser`),
  KEY `fk_Order_Card1_idx` (`Card_idCard`)
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
  `Order_idOrder` bigint NOT NULL,
  `Book_id` bigint NOT NULL,
  PRIMARY KEY (`Order_idOrder`,`Book_id`),
  KEY `fk_Order_has_Books_Books1_idx` (`Book_id`),
  KEY `fk_Order_has_Books_Order1_idx` (`Order_idOrder`),
  CONSTRAINT `FK1kwaju9cb52hv5gp4lyt267tf` FOREIGN KEY (`Order_idOrder`) REFERENCES `order_table` (`idorder`),
  CONSTRAINT `FKjj2dk5peituopfa3srx9o3w9o` FOREIGN KEY (`Book_id`) REFERENCES `book` (`id`)
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
-- Table structure for table `order_table`
--

DROP TABLE IF EXISTS `order_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_table` (
  `idorder` bigint NOT NULL,
  `orderdate` varchar(255) DEFAULT NULL,
  `subcost` double DEFAULT NULL,
  `address_idaddress` bigint DEFAULT NULL,
  `card_idcard` bigint DEFAULT NULL,
  `promotion_idpromotion` bigint DEFAULT NULL,
  `user_iduser` bigint DEFAULT NULL,
  PRIMARY KEY (`idorder`),
  KEY `FKnh8aokdwk10qp355xx694436e` (`address_idaddress`),
  KEY `FK8lbsi1p36flew9gekdbb1sd4w` (`card_idcard`),
  KEY `FK1comop44k2pvxuyiul08ke6aj` (`promotion_idpromotion`),
  KEY `FKsa9jei9ka72m243dp2w3d8twd` (`user_iduser`),
  CONSTRAINT `FK1comop44k2pvxuyiul08ke6aj` FOREIGN KEY (`promotion_idpromotion`) REFERENCES `promotion` (`idPromotion`),
  CONSTRAINT `FK8lbsi1p36flew9gekdbb1sd4w` FOREIGN KEY (`card_idcard`) REFERENCES `card` (`User_IDuser`),
  CONSTRAINT `FKnh8aokdwk10qp355xx694436e` FOREIGN KEY (`address_idaddress`) REFERENCES `address` (`idAddress`),
  CONSTRAINT `FKsa9jei9ka72m243dp2w3d8twd` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_table`
--

LOCK TABLES `order_table` WRITE;
/*!40000 ALTER TABLE `order_table` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `promotion`
--

DROP TABLE IF EXISTS `promotion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `promotion` (
  `idPromotion` bigint NOT NULL AUTO_INCREMENT,
  `discount` int NOT NULL,
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
  `IDuser` bigint NOT NULL AUTO_INCREMENT,
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
INSERT INTO `user` VALUES (1,'Calvin','Butson','cb81','$2a$10$MHkkOXE9ikUsTNEvVwSNT.wJDst0iXVV3VBK4G.gJOvXIMsEiOOwC','1999-01-01',0,'Active','calvin.butson@gmail.com',0),(2,'Example','Test','test1','$2a$10$rFkio6T39ynyDhToSbEey.EwtO17XpFKLcaUohmodTfn.YwqeMebm','2015-06-15',1,'Active','test@gmail.com',0),(3,'Calvin2','Butson','ceb999','$2a$10$w2VSbe4ZNtzSgAgXDfGZI.3r985ys4YR2zG64JCN4iUrEZMVSufPS','1999-10-21',1,'Active','ceb28103@uga.edu',0),(4,'Aries','Aviles','aries','$2a$10$XoJEjaWb0luiU8wjTAA6RuN80V8ghGxX9MIqeA6LucyvUR.rNupYa','1999-01-01',1,'Active','ane.aviles@gmail.com',0);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart`
--

DROP TABLE IF EXISTS `usercart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart` (
  `idUserCart` bigint NOT NULL AUTO_INCREMENT,
  `User_IDuser` bigint NOT NULL,
  `totalPrice` double NOT NULL,
  PRIMARY KEY (`idUserCart`),
  UNIQUE KEY `User_IDuser_UNIQUE` (`User_IDuser`),
  UNIQUE KEY `idUserCart_UNIQUE` (`idUserCart`),
  KEY `fk_UserCart_User1_idx` (`User_IDuser`),
  CONSTRAINT `FK3k1c17geflygvb1kj66wwxfca` FOREIGN KEY (`User_IDuser`) REFERENCES `user` (`IDuser`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart`
--

LOCK TABLES `usercart` WRITE;
/*!40000 ALTER TABLE `usercart` DISABLE KEYS */;
INSERT INTO `usercart` VALUES (1,1,7.99),(2,2,0),(3,3,0),(4,4,0);
/*!40000 ALTER TABLE `usercart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usercart_has_books`
--

DROP TABLE IF EXISTS `usercart_has_books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usercart_has_books` (
  `UserCart_idUserCart` bigint NOT NULL,
  `Book_id` bigint NOT NULL,
  `count` int DEFAULT 1,
  PRIMARY KEY (`UserCart_idUserCart`,`Book_id`),
  KEY `fk_UserCart_has_Books_Books1_idx` (`Book_id`),
  KEY `fk_UserCart_has_Books_UserCart1_idx` (`UserCart_idUserCart`),
  CONSTRAINT `FK1iva724esp2nbbvypxc53d6f6` FOREIGN KEY (`UserCart_idUserCart`) REFERENCES `usercart` (`idUserCart`),
  CONSTRAINT `FKneihq1rheyhwwf7uda94vkjc0` FOREIGN KEY (`Book_id`) REFERENCES `book` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usercart_has_books`
--

LOCK TABLES `usercart_has_books` WRITE;
/*!40000 ALTER TABLE `usercart_has_books` DISABLE KEYS */;
INSERT INTO `usercart_has_books` VALUES (1,17,1);
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

-- Dump completed on 2021-04-27 15:08:51

CREATE DATABASE  IF NOT EXISTS `quiz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `quiz`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: localhost    Database: quiz
-- ------------------------------------------------------
-- Server version	5.6.21

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
-- Table structure for table `difficulties`
--

DROP TABLE IF EXISTS `difficulties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `difficulties` (
  `difficulty_id` int(1) NOT NULL AUTO_INCREMENT,
  `difficulty` varchar(10) NOT NULL,
  PRIMARY KEY (`difficulty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `difficulties`
--

LOCK TABLES `difficulties` WRITE;
/*!40000 ALTER TABLE `difficulties` DISABLE KEYS */;
INSERT INTO `difficulties` VALUES (1,'easy'),(2,'medium'),(3,'hard');
/*!40000 ALTER TABLE `difficulties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question_choices`
--

DROP TABLE IF EXISTS `question_choices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `question_choices` (
  `choice_id` int(6) NOT NULL AUTO_INCREMENT,
  `choice` text NOT NULL,
  `correct` tinyint(1) DEFAULT '0',
  `question_id` int(5) NOT NULL,
  PRIMARY KEY (`choice_id`),
  KEY `question_id` (`question_id`),
  CONSTRAINT `question_choices_ibfk_1` FOREIGN KEY (`question_id`) REFERENCES `questions` (`question_id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question_choices`
--

LOCK TABLES `question_choices` WRITE;
/*!40000 ALTER TABLE `question_choices` DISABLE KEYS */;
INSERT INTO `question_choices` VALUES (1,'lenovo',0,1),(2,'fujitsu',0,1),(3,'plaisio',0,1),(4,'HTC',1,1),(5,'den kserw',0,2),(6,'ase me',0,2),(7,'metafora dedomenwn mesw tou web',1,2),(8,'algorithmos taksinomishs',0,2),(9,'HTTP',0,3),(10,'FTP',0,3),(11,'UDP',0,3),(12,'TCP',1,3),(13,'Intel',0,4),(14,'8051',0,4),(15,'Nvidia',1,4),(16,'MiniMIPS',0,4),(17,'C++',1,5),(18,'C',0,5),(19,'Pascal',0,5),(20,'Assembly',0,5),(21,'Linux',0,6),(22,'Windows',0,6),(23,'VMWare',1,6),(24,'Macintosh',0,6),(25,'ADONIS',1,7),(26,'Notepad',0,7),(27,'Notepad++',0,7),(28,'Atom',0,7),(29,'Razer',1,8),(30,'Microsoft',0,8),(31,'Cooler Master',0,8),(32,'Natec',0,8),(33,'Nessus',1,9),(34,'Avira',0,9),(35,'Norton',0,9),(36,'Avast',0,9),(37,'Buble Sort',1,10),(38,'Caesar',0,10),(39,'Substitution',0,10),(40,'Vigenere',0,10),(41,'cout',0,11),(42,'emfanise',0,11),(43,'printf',1,11),(44,'li $v0,11',0,11),(45,'Iceweasel',0,12),(46,'Chrome',0,12),(47,'Opera',0,12),(48,'AVG',1,12);
/*!40000 ALTER TABLE `question_choices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `questions` (
  `question_id` int(5) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `subject_id` int(3) NOT NULL,
  `difficulty_id` int(1) NOT NULL,
  PRIMARY KEY (`question_id`),
  KEY `subject_id` (`subject_id`),
  KEY `difficulty_id` (`difficulty_id`),
  CONSTRAINT `questions_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `questions_ibfk_2` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`difficulty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
INSERT INTO `questions` VALUES (1,'how are u?',1,2),(2,'ti einai to webservice?',1,2),(3,'\"triplh xeirapsia\", protokolo',1,2),(4,'poia den einai marka epeksergasth?',1,2),(5,'poia einai antikeimenostrafh glwssa programmatismou?',1,2),(6,'poio apo ta parakatw den einai anoixto leitourgiko systhma?',1,2),(7,'poio apo ta parakatw software uposthrizei anaparastash kai eksomoiwsh diadikasiwn?',1,2),(8,'poia einai h pio epituhmenh marka periferiakwn gia gaming?',1,2),(9,'poio apo ta parakatw den einai antivirus?',1,2),(10,'poios apo tous parakatw den einai kryptografikos algorithmos?',1,2),(11,'me poia synarthsh emfanizoyme sthn othonh me thn glwssa C?',1,3),(12,'poio apo ta parakatw den einai fylometrhths?',1,2);
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stats`
--

DROP TABLE IF EXISTS `stats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stats` (
  `stats_id` int(5) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(20) NOT NULL,
  `score` int(2) NOT NULL,
  `subject_id` int(3) NOT NULL,
  `difficulty_id` int(1) NOT NULL,
  PRIMARY KEY (`stats_id`),
  KEY `subject_id` (`subject_id`),
  KEY `difficulty_id` (`difficulty_id`),
  CONSTRAINT `stats_ibfk_1` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`),
  CONSTRAINT `stats_ibfk_2` FOREIGN KEY (`difficulty_id`) REFERENCES `difficulties` (`difficulty_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stats`
--

LOCK TABLES `stats` WRITE;
/*!40000 ALTER TABLE `stats` DISABLE KEYS */;
INSERT INTO `stats` VALUES (1,'1',9,1,1),(2,'2',-1,2,1),(3,'3',-1,2,1),(4,'4',-1,1,1),(5,'5',-1,1,1),(6,'6',-1,2,1),(7,'7',-1,1,1);
/*!40000 ALTER TABLE `stats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subjects` (
  `subject_id` int(3) NOT NULL AUTO_INCREMENT,
  `subject` varchar(30) NOT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'cs'),(2,'football'),(3,'cinema'),(4,'basket'),(5,'history');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `first_name` varchar(35) NOT NULL,
  `last_name` varchar(35) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'egw','egw','eimai'),(2,'mpampis','ff','gg'),(3,'mpampis','ff','gg'),(4,'mpampis','ff','gg'),(5,'mpampis','ff','gg'),(6,'mpampis','ff','gg'),(7,'mpampis','ff','gg');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-06-05 14:05:00

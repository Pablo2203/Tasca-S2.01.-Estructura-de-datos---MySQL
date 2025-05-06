-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (x86_64)
--
-- Host: localhost    Database: Spotify
-- ------------------------------------------------------
-- Server version	9.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `idalbum` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `published_year` year NOT NULL,
  `portrait_image` blob,
  `fk_album_artist` int NOT NULL,
  PRIMARY KEY (`idalbum`),
  KEY `fk_album_artist_idx` (`fk_album_artist`),
  CONSTRAINT `fk_album_artist` FOREIGN KEY (`fk_album_artist`) REFERENCES `artist` (`idartist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artist` (
  `idartist` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `image` blob,
  `fk_artist_related` int DEFAULT NULL,
  `fk_artist_user` int NOT NULL,
  PRIMARY KEY (`idartist`),
  KEY `fk_artist_related_idx` (`fk_artist_related`),
  KEY `fk_artist_user_idx` (`fk_artist_user`),
  CONSTRAINT `fk_artist_related` FOREIGN KEY (`fk_artist_related`) REFERENCES `artist` (`idartist`),
  CONSTRAINT `fk_artist_user` FOREIGN KEY (`fk_artist_user`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `credit_card`
--

DROP TABLE IF EXISTS `credit_card`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `credit_card` (
  `fk_credit_card_payment_method` int NOT NULL AUTO_INCREMENT,
  `number` varchar(16) NOT NULL,
  `expiration_date` datetime NOT NULL,
  `cvc` varchar(4) NOT NULL,
  PRIMARY KEY (`fk_credit_card_payment_method`),
  CONSTRAINT `fk_credit_card_payment_method` FOREIGN KEY (`fk_credit_card_payment_method`) REFERENCES `payment_method` (`idpayment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_method`
--

DROP TABLE IF EXISTS `payment_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_method` (
  `idpayment_method` int NOT NULL AUTO_INCREMENT,
  `fk_payment_method_subscription` int NOT NULL,
  PRIMARY KEY (`idpayment_method`),
  KEY `fk_payment_method_subscription_idx` (`fk_payment_method_subscription`),
  CONSTRAINT `fk_payment_method_subscription` FOREIGN KEY (`fk_payment_method_subscription`) REFERENCES `subscription` (`idsubscription`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_record`
--

DROP TABLE IF EXISTS `payment_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_record` (
  `idpayment_record` int NOT NULL AUTO_INCREMENT,
  `payment_date` datetime NOT NULL,
  `total_amount` decimal(12,2) NOT NULL,
  `fk_payment_record_premium_user` int NOT NULL,
  `fk_payment_record_payment_method` int NOT NULL,
  PRIMARY KEY (`idpayment_record`),
  KEY `fk_payment_record_premium_user_idx` (`fk_payment_record_premium_user`),
  KEY `fk_payment_record_payment_method_idx` (`fk_payment_record_payment_method`),
  CONSTRAINT `fk_payment_record_payment_method` FOREIGN KEY (`fk_payment_record_payment_method`) REFERENCES `payment_method` (`idpayment_method`),
  CONSTRAINT `fk_payment_record_premium_user` FOREIGN KEY (`fk_payment_record_premium_user`) REFERENCES `premium_user` (`fk_premium_user_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_record`
--

LOCK TABLES `payment_record` WRITE;
/*!40000 ALTER TABLE `payment_record` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal`
--

DROP TABLE IF EXISTS `paypal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paypal` (
  `fk_paypal_payment_method` int NOT NULL,
  `paypal_username` varchar(45) NOT NULL,
  PRIMARY KEY (`fk_paypal_payment_method`),
  CONSTRAINT `fk_paypal_payment_method` FOREIGN KEY (`fk_paypal_payment_method`) REFERENCES `payment_method` (`idpayment_method`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist`
--

DROP TABLE IF EXISTS `playlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist` (
  `idplaylist` int NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `number_of_songs` int NOT NULL,
  `creation_date` datetime NOT NULL,
  `fk_playlist_user` int NOT NULL,
  PRIMARY KEY (`idplaylist`),
  KEY `fk_playlist_user_idx` (`fk_playlist_user`),
  CONSTRAINT `fk_playlist_user` FOREIGN KEY (`fk_playlist_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_active`
--

DROP TABLE IF EXISTS `playlist_active`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_active` (
  `fk_playlist_active_playlist` int NOT NULL,
  `fk_playlist_active_user` int NOT NULL,
  PRIMARY KEY (`fk_playlist_active_playlist`),
  KEY `fk_playlist_active_user_idx` (`fk_playlist_active_user`),
  CONSTRAINT `fk_playlist_active_playlist` FOREIGN KEY (`fk_playlist_active_playlist`) REFERENCES `playlist` (`idplaylist`),
  CONSTRAINT `fk_playlist_active_user` FOREIGN KEY (`fk_playlist_active_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_active`
--

LOCK TABLES `playlist_active` WRITE;
/*!40000 ALTER TABLE `playlist_active` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_deleted`
--

DROP TABLE IF EXISTS `playlist_deleted`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_deleted` (
  `fk_playlist_playlist_deleted` int NOT NULL,
  `delete_date` datetime NOT NULL,
  PRIMARY KEY (`fk_playlist_playlist_deleted`),
  CONSTRAINT `fk_playlist_playlist_deleted` FOREIGN KEY (`fk_playlist_playlist_deleted`) REFERENCES `playlist` (`idplaylist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_deleted`
--

LOCK TABLES `playlist_deleted` WRITE;
/*!40000 ALTER TABLE `playlist_deleted` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playlist_has_song`
--

DROP TABLE IF EXISTS `playlist_has_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `playlist_has_song` (
  `idplaylist_has_song` int NOT NULL AUTO_INCREMENT,
  `fk_playlist_has_song_user` int NOT NULL,
  `fk_playlist_has_song_playlist_active` int NOT NULL,
  `fk_playlist_has_song_song` int NOT NULL,
  `added_date` date NOT NULL,
  PRIMARY KEY (`idplaylist_has_song`),
  KEY `fk_playlist_has_song_user_idx` (`fk_playlist_has_song_user`),
  KEY `fk_playlist_has_song_playlist_active_idx` (`fk_playlist_has_song_playlist_active`),
  KEY `fk_playlist_has_song_song_idx` (`fk_playlist_has_song_song`),
  CONSTRAINT `fk_playlist_has_song_playlist_active` FOREIGN KEY (`fk_playlist_has_song_playlist_active`) REFERENCES `playlist_active` (`fk_playlist_active_playlist`),
  CONSTRAINT `fk_playlist_has_song_song` FOREIGN KEY (`fk_playlist_has_song_song`) REFERENCES `song` (`idsong`),
  CONSTRAINT `fk_playlist_has_song_user` FOREIGN KEY (`fk_playlist_has_song_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playlist_has_song`
--

LOCK TABLES `playlist_has_song` WRITE;
/*!40000 ALTER TABLE `playlist_has_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `playlist_has_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `premium_user`
--

DROP TABLE IF EXISTS `premium_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `premium_user` (
  `fk_premium_user_user` int NOT NULL,
  PRIMARY KEY (`fk_premium_user_user`),
  CONSTRAINT `fk_premium_user_user` FOREIGN KEY (`fk_premium_user_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `premium_user`
--

LOCK TABLES `premium_user` WRITE;
/*!40000 ALTER TABLE `premium_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `premium_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `song`
--

DROP TABLE IF EXISTS `song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `song` (
  `idsong` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `duration` time NOT NULL,
  `reproduced_times` int NOT NULL,
  `fk_song_artist` int NOT NULL,
  `fk_song_album` int NOT NULL,
  PRIMARY KEY (`idsong`),
  KEY `fk_song_artist_idx` (`fk_song_artist`),
  KEY `fk_song_album_idx` (`fk_song_album`),
  CONSTRAINT `fk_song_album` FOREIGN KEY (`fk_song_album`) REFERENCES `album` (`idalbum`),
  CONSTRAINT `fk_song_artist` FOREIGN KEY (`fk_song_artist`) REFERENCES `artist` (`idartist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subscription` (
  `idsubscription` int NOT NULL AUTO_INCREMENT,
  `start_date` datetime NOT NULL,
  `service_renovation_date` datetime NOT NULL,
  `fk_subscription_premium_user` int NOT NULL,
  `fk_subscription_payment_method` int NOT NULL,
  PRIMARY KEY (`idsubscription`),
  KEY `fk_subscription_payment_method_idx` (`fk_subscription_payment_method`),
  CONSTRAINT `fk_subscription_payment_method` FOREIGN KEY (`fk_subscription_payment_method`) REFERENCES `payment_method` (`idpayment_method`),
  CONSTRAINT `fk_subscription_premium_user` FOREIGN KEY (`fk_subscription_payment_method`) REFERENCES `premium_user` (`fk_premium_user_user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `iduser` int NOT NULL AUTO_INCREMENT,
  `membership` enum('free','premium') NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(20) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `birthdate` date NOT NULL,
  `gender` enum('F','M','Other') NOT NULL,
  `country` varchar(45) NOT NULL,
  `zip_code` int NOT NULL,
  PRIMARY KEY (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_follows_artist`
--

DROP TABLE IF EXISTS `user_follows_artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_follows_artist` (
  `fk_user_follows_artist_user` int NOT NULL,
  `fk_user_follows_artist_artist` int NOT NULL,
  PRIMARY KEY (`fk_user_follows_artist_user`,`fk_user_follows_artist_artist`),
  KEY `fk_user_follows_artist_artist_idx` (`fk_user_follows_artist_artist`),
  CONSTRAINT `fk_user_follows_artist_artist` FOREIGN KEY (`fk_user_follows_artist_artist`) REFERENCES `artist` (`idartist`),
  CONSTRAINT `fk_user_follows_artist_user` FOREIGN KEY (`fk_user_follows_artist_user`) REFERENCES `user` (`iduser`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_follows_artist`
--

LOCK TABLES `user_follows_artist` WRITE;
/*!40000 ALTER TABLE `user_follows_artist` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_follows_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_likes_album`
--

DROP TABLE IF EXISTS `user_likes_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_likes_album` (
  `fk_user_likes_album_user` int NOT NULL,
  `fk_user_likes_album_album` int NOT NULL,
  PRIMARY KEY (`fk_user_likes_album_user`,`fk_user_likes_album_album`),
  KEY `fk_user_likes_album_user_idx` (`fk_user_likes_album_user`),
  KEY `fk_user_likes_album_album_idx` (`fk_user_likes_album_album`),
  CONSTRAINT `fk_user_likes_album_album` FOREIGN KEY (`fk_user_likes_album_album`) REFERENCES `album` (`idalbum`),
  CONSTRAINT `fk_user_likes_album_user` FOREIGN KEY (`fk_user_likes_album_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_likes_album`
--

LOCK TABLES `user_likes_album` WRITE;
/*!40000 ALTER TABLE `user_likes_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_likes_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_likes_song`
--

DROP TABLE IF EXISTS `user_likes_song`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_likes_song` (
  `fk_user_likes_song_user` int NOT NULL,
  `fk_user_likes_song_song` int NOT NULL,
  PRIMARY KEY (`fk_user_likes_song_user`,`fk_user_likes_song_song`),
  KEY `fk_user_has_song_user_idx` (`fk_user_likes_song_user`),
  KEY `fk_user_has_song_song_idx` (`fk_user_likes_song_song`),
  CONSTRAINT `fk_user_likes_song_song` FOREIGN KEY (`fk_user_likes_song_song`) REFERENCES `song` (`idsong`),
  CONSTRAINT `fk_user_likes_song_user` FOREIGN KEY (`fk_user_likes_song_user`) REFERENCES `user` (`iduser`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_likes_song`
--

LOCK TABLES `user_likes_song` WRITE;
/*!40000 ALTER TABLE `user_likes_song` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_likes_song` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-02 20:10:04

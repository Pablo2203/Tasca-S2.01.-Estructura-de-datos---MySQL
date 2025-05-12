-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: spotify
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Parachutes',2000,NULL,1),(2,'Oral Fixation Vol. 2',2005,NULL,2),(3,'YHLQMDLG',2020,NULL,3);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Coldplay',NULL,NULL,1),(2,'Shakira',NULL,NULL,2),(3,'Bad Bunny',NULL,NULL,3);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `credit_card`
--

LOCK TABLES `credit_card` WRITE;
/*!40000 ALTER TABLE `credit_card` DISABLE KEYS */;
INSERT INTO `credit_card` VALUES (1,'4111111111111111','2025-04-30 00:00:00','123'),(2,'5555555555554444','2026-10-31 00:00:00','456');
/*!40000 ALTER TABLE `credit_card` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment_method`
--

LOCK TABLES `payment_method` WRITE;
/*!40000 ALTER TABLE `payment_method` DISABLE KEYS */;
INSERT INTO `payment_method` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `payment_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `payment_record`
--

LOCK TABLES `payment_record` WRITE;
/*!40000 ALTER TABLE `payment_record` DISABLE KEYS */;
INSERT INTO `payment_record` VALUES (1,'2023-11-01 12:00:00',9.99,1,1),(2,'2023-12-01 12:00:00',9.99,2,2);
/*!40000 ALTER TABLE `payment_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `paypal`
--

LOCK TABLES `paypal` WRITE;
/*!40000 ALTER TABLE `paypal` DISABLE KEYS */;
INSERT INTO `paypal` VALUES (3,'usuario_paypal_1@example.com'),(4,'usuario_paypal_2@example.com');
/*!40000 ALTER TABLE `paypal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Workout',2,'2025-03-01 14:00:00',1),(2,'Relax',3,'2025-03-02 18:30:00',2),(3,'Party',1,'2025-03-03 20:00:00',3),(4,'Mi Playlist Personal',15,'2023-10-01 10:00:00',1),(5,'Clásicos del Rock',20,'2023-08-15 15:30:00',2);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist_active`
--

LOCK TABLES `playlist_active` WRITE;
/*!40000 ALTER TABLE `playlist_active` DISABLE KEYS */;
INSERT INTO `playlist_active` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `playlist_active` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist_deleted`
--

LOCK TABLES `playlist_deleted` WRITE;
/*!40000 ALTER TABLE `playlist_deleted` DISABLE KEYS */;
INSERT INTO `playlist_deleted` VALUES (1,'2023-02-15 12:00:00'),(2,'2023-03-01 16:30:00');
/*!40000 ALTER TABLE `playlist_deleted` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist_has_song`
--

LOCK TABLES `playlist_has_song` WRITE;
/*!40000 ALTER TABLE `playlist_has_song` DISABLE KEYS */;
INSERT INTO `playlist_has_song` VALUES (1,1,1,1,'2025-04-01'),(2,1,1,4,'2025-04-01'),(3,2,2,2,'2025-04-02'),(4,2,2,5,'2025-04-02'),(5,3,3,3,'2025-04-03'),(6,1,1,1,'2023-10-01'),(7,2,2,2,'2023-08-15');
/*!40000 ALTER TABLE `playlist_has_song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `premium_user`
--

LOCK TABLES `premium_user` WRITE;
/*!40000 ALTER TABLE `premium_user` DISABLE KEYS */;
INSERT INTO `premium_user` VALUES (1),(2);
/*!40000 ALTER TABLE `premium_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `song`
--

LOCK TABLES `song` WRITE;
/*!40000 ALTER TABLE `song` DISABLE KEYS */;
INSERT INTO `song` VALUES (1,'Yellow','00:04:26',1000000,1,1),(2,'Hips Don\'t Lie','00:03:38',5000000,2,2),(3,'Safaera','00:04:55',3000000,3,3),(4,'Viva La Vida','00:04:03',2000000,1,1),(5,'Antología','00:04:17',4000000,2,2);
/*!40000 ALTER TABLE `song` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,'2023-11-01 00:00:00','2024-11-01 00:00:00',1,1),(2,'2023-12-01 00:00:00','2024-12-01 00:00:00',2,2);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'free','juan@gmail.com','pass1234','Juan Perez','1995-05-15','M','Mexico',12345),(2,'premium','maria@gmail.com','securepass','Maria Lopez','1990-03-25','F','Argentina',54321),(3,'free','luis@gmail.com','mypass','Luis Garcia','1998-09-12','M','Colombia',11111);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_follows_artist`
--

LOCK TABLES `user_follows_artist` WRITE;
/*!40000 ALTER TABLE `user_follows_artist` DISABLE KEYS */;
INSERT INTO `user_follows_artist` VALUES (1,1),(2,2),(1,3),(3,3);
/*!40000 ALTER TABLE `user_follows_artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_likes_album`
--

LOCK TABLES `user_likes_album` WRITE;
/*!40000 ALTER TABLE `user_likes_album` DISABLE KEYS */;
INSERT INTO `user_likes_album` VALUES (1,1),(2,1),(2,2),(3,3);
/*!40000 ALTER TABLE `user_likes_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_likes_song`
--

LOCK TABLES `user_likes_song` WRITE;
/*!40000 ALTER TABLE `user_likes_song` DISABLE KEYS */;
INSERT INTO `user_likes_song` VALUES (1,1),(1,4),(2,2),(2,5),(3,3);
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

-- Dump completed on 2025-05-12 13:42:43

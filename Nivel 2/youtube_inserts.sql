-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: youtube
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
-- Dumping data for table `channel`
--

LOCK TABLES `channel` WRITE;
/*!40000 ALTER TABLE `channel` DISABLE KEYS */;
INSERT INTO `channel` VALUES (1,'Alice Vlogs','Daily vlogs and lifestyle','2025-05-02 16:47:32',1),(2,'Bob Tech','Tech reviews and tutorials','2025-05-02 16:47:32',2),(3,'Carol Music','Original songs and covers','2025-05-02 16:47:32',3);
/*!40000 ALTER TABLE `channel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Great video!','2025-05-02 16:47:32',2,1),(2,'Very helpful, thanks!','2025-05-02 16:47:32',1,2),(3,'Love this song!','2025-05-02 16:47:32',1,3);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment_reaction`
--

LOCK TABLES `comment_reaction` WRITE;
/*!40000 ALTER TABLE `comment_reaction` DISABLE KEYS */;
INSERT INTO `comment_reaction` VALUES (2,2,'like','2025-05-02 16:47:32'),(3,1,'like','2025-05-02 16:47:32'),(3,3,'dislike','2025-05-02 16:47:32');
/*!40000 ALTER TABLE `comment_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist`
--

LOCK TABLES `playlist` WRITE;
/*!40000 ALTER TABLE `playlist` DISABLE KEYS */;
INSERT INTO `playlist` VALUES (1,'Morning Inspiration','2025-05-02 16:47:32',1),(2,'Tech Favorites','2025-05-02 16:47:32',2);
/*!40000 ALTER TABLE `playlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `playlist_video`
--

LOCK TABLES `playlist_video` WRITE;
/*!40000 ALTER TABLE `playlist_video` DISABLE KEYS */;
INSERT INTO `playlist_video` VALUES (1,1),(2,2),(1,3);
/*!40000 ALTER TABLE `playlist_video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (1,2,'2025-05-02 16:47:32'),(2,1,'2025-05-02 16:47:32'),(3,1,'2025-05-02 16:47:32');
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (3,'music'),(2,'tech'),(1,'vlog');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'alice@example.com','hashed_pw1','aliceYT','1990-05-12','F','USA','10001'),(2,'bob@example.com','hashed_pw2','bobCreator','1985-11-23','M','UK','E14'),(3,'carol@example.com','hashed_pw3','carol123','1998-07-02','Other','Canada','M5G');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
INSERT INTO `video` VALUES (1,'Morning Routine','My productive morning routine',1024,'morning.mp4','00:04:35','morning.jpg',0,0,0,'public',1,'2025-05-02 16:47:32'),(2,'Best Laptops 2024','Top 5 laptops you should consider',2048,'laptops.mp4','00:10:15','laptops.jpg',0,0,0,'public',2,'2025-05-02 16:47:32'),(3,'Acoustic Cover','A cover of a classic song',1800,'cover.mp4','00:03:40','cover.jpg',0,0,0,'public',3,'2025-05-02 16:47:32');
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `video_reaction`
--

LOCK TABLES `video_reaction` WRITE;
/*!40000 ALTER TABLE `video_reaction` DISABLE KEYS */;
INSERT INTO `video_reaction` VALUES (1,2,'like','2025-05-02 16:47:32'),(1,3,'like','2025-05-02 16:47:32'),(2,1,'like','2025-05-02 16:47:32'),(3,1,'like','2025-05-02 16:47:32'),(3,2,'dislike','2025-05-02 16:47:32');
/*!40000 ALTER TABLE `video_reaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `video_tag`
--

LOCK TABLES `video_tag` WRITE;
/*!40000 ALTER TABLE `video_tag` DISABLE KEYS */;
INSERT INTO `video_tag` VALUES (1,1),(2,2),(3,3);
/*!40000 ALTER TABLE `video_tag` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 13:39:41

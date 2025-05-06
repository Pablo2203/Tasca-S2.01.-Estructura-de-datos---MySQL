-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (x86_64)
--
-- Host: localhost    Database: Optica_culo_de_botella
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
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `idbrand` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `suppliers_idsupplier` int DEFAULT NULL,
  PRIMARY KEY (`idbrand`),
  KEY `suppliers_idsupplier` (`suppliers_idsupplier`),
  CONSTRAINT `brand_ibfk_1` FOREIGN KEY (`suppliers_idsupplier`) REFERENCES `suppliers` (`idsupplier`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,'Ray-Ban',1),(2,'Oakley',1),(3,'Gucci',2),(4,'Armani',2);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_information`
--

DROP TABLE IF EXISTS `contact_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_information` (
  `idcontact_information` int NOT NULL AUTO_INCREMENT,
  `phone` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `street_number` int DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `province_state` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcontact_information`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_information`
--

LOCK TABLES `contact_information` WRITE;
/*!40000 ALTER TABLE `contact_information` DISABLE KEYS */;
INSERT INTO `contact_information` VALUES (1,'123456789','Gran Via',123,2,'Barcelona','08010','Catalunya'),(2,'987654321','Calle Mayor',45,1,'Madrid','28013','Madrid'),(3,'654321987','Av. Diagonal',89,NULL,'Barcelona','08008','Catalunya'),(4,'963852741','Plaza España',12,3,'Valencia','46007','Comunidad Valenciana');
/*!40000 ALTER TABLE `contact_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `idcustomers` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `email_address` varchar(45) DEFAULT NULL,
  `registration_date` datetime DEFAULT NULL,
  `customers_idcustomers` int DEFAULT NULL,
  `contact_information_idcontact_information` int DEFAULT NULL,
  PRIMARY KEY (`idcustomers`),
  KEY `customers_idcustomers` (`customers_idcustomers`),
  KEY `contact_information_idcontact_information` (`contact_information_idcontact_information`),
  CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`customers_idcustomers`) REFERENCES `customers` (`idcustomers`),
  CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`contact_information_idcontact_information`) REFERENCES `contact_information` (`idcontact_information`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Ana Torres','ana.torres@mail.com','2024-01-12 00:00:00',NULL,3),(2,'Javier Ruiz','javier.ruiz@mail.com','2024-02-08 00:00:00',1,4);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `idemployee` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `lastname` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idemployee`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (1,'Lucía','Martínez'),(2,'Carlos','Gómez');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `glasses`
--

DROP TABLE IF EXISTS `glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `glasses` (
  `idglasses` int NOT NULL AUTO_INCREMENT,
  `brand` varchar(45) DEFAULT NULL,
  `graduation_left_eye` decimal(4,2) DEFAULT NULL,
  `graduation_right_eye` decimal(4,2) DEFAULT NULL,
  `frame` enum('pasta','metalica','flotante') DEFAULT NULL,
  `frame_color` varchar(45) DEFAULT NULL,
  `glass_color` varchar(45) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `glassescol` varchar(45) DEFAULT NULL,
  `brand_idbrand` int DEFAULT NULL,
  PRIMARY KEY (`idglasses`),
  KEY `brand_idbrand` (`brand_idbrand`),
  CONSTRAINT `glasses_ibfk_1` FOREIGN KEY (`brand_idbrand`) REFERENCES `brand` (`idbrand`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `glasses`
--

LOCK TABLES `glasses` WRITE;
/*!40000 ALTER TABLE `glasses` DISABLE KEYS */;
INSERT INTO `glasses` VALUES (1,'Ray-Ban',-1.25,-1.00,'pasta','negro','transparente',149.99,'RBX123',1),(2,'Oakley',-2.00,-2.25,'metalica','gris','verde',199.50,'OKL200',2),(3,'Gucci',-0.75,-0.50,'flotante','dorado','azul',289.00,'GGF500',3),(4,'Armani',-1.50,-1.50,'pasta','azul marino','gris',179.95,'ARM789',4);
/*!40000 ALTER TABLE `glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales` (
  `idsales` int NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `customers_idcustomers` int DEFAULT NULL,
  `employees_idemployee` int DEFAULT NULL,
  PRIMARY KEY (`idsales`),
  KEY `customers_idcustomers` (`customers_idcustomers`),
  KEY `employees_idemployee` (`employees_idemployee`),
  CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`customers_idcustomers`) REFERENCES `customers` (`idcustomers`),
  CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`employees_idemployee`) REFERENCES `employees` (`idemployee`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales`
--

LOCK TABLES `sales` WRITE;
/*!40000 ALTER TABLE `sales` DISABLE KEYS */;
INSERT INTO `sales` VALUES (1,'2024-03-15 10:30:00',149.99,1,1,1),(2,'2024-04-02 12:00:00',289.00,1,2,2);
/*!40000 ALTER TABLE `sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_glasses`
--

DROP TABLE IF EXISTS `sales_glasses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_glasses` (
  `idsales` int NOT NULL,
  `idglasses` int NOT NULL,
  `quantity` int DEFAULT NULL,
  PRIMARY KEY (`idsales`,`idglasses`),
  KEY `idglasses` (`idglasses`),
  CONSTRAINT `sales_glasses_ibfk_1` FOREIGN KEY (`idsales`) REFERENCES `sales` (`idsales`),
  CONSTRAINT `sales_glasses_ibfk_2` FOREIGN KEY (`idglasses`) REFERENCES `glasses` (`idglasses`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_glasses`
--

LOCK TABLES `sales_glasses` WRITE;
/*!40000 ALTER TABLE `sales_glasses` DISABLE KEYS */;
INSERT INTO `sales_glasses` VALUES (1,1,1),(2,3,1);
/*!40000 ALTER TABLE `sales_glasses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `idsupplier` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `fax` varchar(30) DEFAULT NULL,
  `NIF` varchar(12) DEFAULT NULL,
  `contact_information_idcontact_information` int DEFAULT NULL,
  PRIMARY KEY (`idsupplier`),
  KEY `contact_information_idcontact_information` (`contact_information_idcontact_information`),
  CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`contact_information_idcontact_information`) REFERENCES `contact_information` (`idcontact_information`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'OpticaPro','123456789','B12345678',1),(2,'VisionGroup','987654321','C87654321',2);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-25 20:16:35

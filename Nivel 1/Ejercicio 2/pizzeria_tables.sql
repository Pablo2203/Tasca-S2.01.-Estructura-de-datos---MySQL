-- MySQL dump 10.13  Distrib 8.0.31, for macos12 (x86_64)
--
-- Host: 127.0.0.1    Database: pizzeria
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
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `idcustomer` int NOT NULL AUTO_INCREMENT,
  `address` varchar(45) NOT NULL,
  `address_number` int NOT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(2) DEFAULT NULL,
  `zip_code` int NOT NULL,
  `locality_idlocality` int NOT NULL,
  `people_idpeople` int NOT NULL,
  PRIMARY KEY (`idcustomer`),
  KEY `idx_locality_idlocality` (`locality_idlocality`),
  KEY `fk_customer_people1_idx` (`people_idpeople`),
  CONSTRAINT `fk_customer_locality` FOREIGN KEY (`locality_idlocality`) REFERENCES `locality` (`idlocality`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_customer_people1` FOREIGN KEY (`people_idpeople`) REFERENCES `people` (`idpeople`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `employee_idemployee` int NOT NULL AUTO_INCREMENT,
  `date_time_product_reception` datetime NOT NULL,
  PRIMARY KEY (`employee_idemployee`),
  KEY `fk_delivery_employee1_idx` (`employee_idemployee`),
  CONSTRAINT `fk_delivery_employee1` FOREIGN KEY (`employee_idemployee`) REFERENCES `employee` (`idemployee`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `drink`
--

DROP TABLE IF EXISTS `drink`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drink` (
  `product_idproduct` int NOT NULL,
  PRIMARY KEY (`product_idproduct`),
  KEY `fk_drink_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_drink_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `idemployee` int NOT NULL AUTO_INCREMENT,
  `nif` varchar(15) NOT NULL,
  `work_position` enum('cooker','delivery') DEFAULT NULL,
  `store_idstore` int NOT NULL,
  `people_idpeople` int NOT NULL,
  PRIMARY KEY (`idemployee`),
  KEY `fk_employee_store_idx` (`store_idstore`),
  KEY `fk_employee_people2_idx` (`people_idpeople`),
  CONSTRAINT `fk_employee_people` FOREIGN KEY (`people_idpeople`) REFERENCES `people` (`idpeople`),
  CONSTRAINT `fk_employee_store` FOREIGN KEY (`store_idstore`) REFERENCES `store` (`idstore`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `hamburguer`
--

DROP TABLE IF EXISTS `hamburguer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hamburguer` (
  `product_idproduct` int NOT NULL,
  PRIMARY KEY (`product_idproduct`),
  KEY `fk_hamburguer_product1_idx` (`product_idproduct`),
  CONSTRAINT `fk_hamburguer_product1` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `locality`
--

DROP TABLE IF EXISTS `locality`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `locality` (
  `idlocality` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `province_idprovince` int NOT NULL,
  PRIMARY KEY (`idlocality`),
  KEY `fk_locality_province_idx` (`province_idprovince`),
  CONSTRAINT `fk_locality_province` FOREIGN KEY (`province_idprovince`) REFERENCES `province` (`idprovince`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `idorder` int NOT NULL AUTO_INCREMENT,
  `date_time` datetime NOT NULL,
  `deliver_pick` enum('delivery','pickup') NOT NULL,
  `product_quantity` int NOT NULL,
  `total_price` decimal(9,2) NOT NULL,
  `customer_idcustomer` int NOT NULL,
  `delivery_employee_idemployee` int NOT NULL,
  `store_idstore` int NOT NULL,
  PRIMARY KEY (`idorder`),
  KEY `fk_order_customer1_idx` (`customer_idcustomer`),
  KEY `fk_order_delivery1_idx` (`delivery_employee_idemployee`),
  KEY `fk_order_store1_idx` (`store_idstore`),
  CONSTRAINT `fk_order_customer1` FOREIGN KEY (`customer_idcustomer`) REFERENCES `customer` (`idcustomer`),
  CONSTRAINT `fk_order_delivery1` FOREIGN KEY (`delivery_employee_idemployee`) REFERENCES `delivery` (`employee_idemployee`),
  CONSTRAINT `fk_order_store1` FOREIGN KEY (`store_idstore`) REFERENCES `store` (`idstore`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `order_has_product`
--

DROP TABLE IF EXISTS `order_has_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_has_product` (
  `idorder_has_product` int NOT NULL AUTO_INCREMENT,
  `order_idorder` int NOT NULL,
  `product_idproduct` int NOT NULL,
  PRIMARY KEY (`idorder_has_product`),
  KEY `fk_order_has_product_product1_idx` (`product_idproduct`),
  KEY `fk_order_has_product_order1_idx` (`order_idorder`),
  CONSTRAINT `fk_order_has_product_order` FOREIGN KEY (`order_idorder`) REFERENCES `order` (`idorder`),
  CONSTRAINT `fk_order_has_product_product` FOREIGN KEY (`product_idproduct`) REFERENCES `product` (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `people`
--

DROP TABLE IF EXISTS `people`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `people` (
  `idpeople` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `telephone_number` int NOT NULL,
  PRIMARY KEY (`idpeople`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza`
--

DROP TABLE IF EXISTS `pizza`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza` (
  `product_idproduct` int NOT NULL,
  `pizza_category_idpizza_category` int NOT NULL,
  PRIMARY KEY (`product_idproduct`),
  KEY `fk_pizza_pizza_category1` (`pizza_category_idpizza_category`),
  CONSTRAINT `fk_pizza_pizza_category1` FOREIGN KEY (`pizza_category_idpizza_category`) REFERENCES `pizza_category` (`idpizza_category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pizza_category`
--

DROP TABLE IF EXISTS `pizza_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pizza_category` (
  `idpizza_category` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idpizza_category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `idproduct` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` decimal(7,2) NOT NULL,
  `description` varchar(150) NOT NULL,
  `image` blob,
  `product_type` enum('hamburguer','pizza','drink') NOT NULL,
  PRIMARY KEY (`idproduct`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `province`
--

DROP TABLE IF EXISTS `province`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `province` (
  `idprovince` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`idprovince`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `store`
--

DROP TABLE IF EXISTS `store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `store` (
  `idstore` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `address_number` int NOT NULL,
  `floor` int DEFAULT NULL,
  `door` varchar(2) DEFAULT NULL,
  `zip_code` int NOT NULL,
  `locality_idlocality` int NOT NULL,
  PRIMARY KEY (`idstore`),
  KEY `fk_store_locality1_idx` (`locality_idlocality`),
  CONSTRAINT `fk_store_locality1` FOREIGN KEY (`locality_idlocality`) REFERENCES `locality` (`idlocality`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-12 13:28:11

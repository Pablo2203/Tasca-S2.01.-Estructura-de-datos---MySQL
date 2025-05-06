-- MySQL dump 10.13  Distrib 9.3.0, for macos15 (x86_64)
--
-- Host: localhost    Database: Pizzeria
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
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'Calle Falsa',123,2,'B',28080,1,1),(2,'Avenida Siempreviva',742,3,'A',28090,2,2),(3,'Boulevard Oroño',1200,1,'C',30000,3,3);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (1,'2025-05-01 20:25:00');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `drink`
--

LOCK TABLES `drink` WRITE;
/*!40000 ALTER TABLE `drink` DISABLE KEYS */;
INSERT INTO `drink` VALUES (3);
/*!40000 ALTER TABLE `drink` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'EMP001','delivery',1,1),(2,'EMP002','cooker',1,2),(3,'EMP003','delivery',2,3),(4,'EMP004','cooker',3,4),(5,'EMP005','cooker',2,5);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `hamburguer`
--

LOCK TABLES `hamburguer` WRITE;
/*!40000 ALTER TABLE `hamburguer` DISABLE KEYS */;
INSERT INTO `hamburguer` VALUES (4),(5);
/*!40000 ALTER TABLE `hamburguer` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `locality`
--

LOCK TABLES `locality` WRITE;
/*!40000 ALTER TABLE `locality` DISABLE KEYS */;
INSERT INTO `locality` VALUES (1,'La Plata',1),(2,'Córdoba Capital',2),(3,'Rosario',3);
/*!40000 ALTER TABLE `locality` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'2025-05-01 20:00:00','delivery',2,1700.00,1,1,1),(2,'2025-05-01 20:30:00','pickup',1,1200.00,2,2,2);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `order_has_product`
--

LOCK TABLES `order_has_product` WRITE;
/*!40000 ALTER TABLE `order_has_product` DISABLE KEYS */;
INSERT INTO `order_has_product` VALUES (1,1,1),(2,1,3),(3,2,2);
/*!40000 ALTER TABLE `order_has_product` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `people`
--

LOCK TABLES `people` WRITE;
/*!40000 ALTER TABLE `people` DISABLE KEYS */;
INSERT INTO `people` VALUES (1,'Juan','Pérez',1122334455),(2,'María','Gómez',1155667788),(3,'Carlos','López',1144556677),(4,'Ana','Martínez',1166778899),(5,'Pedro','Rodríguez',1133445566);
/*!40000 ALTER TABLE `people` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza`
--

LOCK TABLES `pizza` WRITE;
/*!40000 ALTER TABLE `pizza` DISABLE KEYS */;
INSERT INTO `pizza` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `pizza` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `pizza_category`
--

LOCK TABLES `pizza_category` WRITE;
/*!40000 ALTER TABLE `pizza_category` DISABLE KEYS */;
INSERT INTO `pizza_category` VALUES (1,'Clásicas'),(2,'Especiales'),(3,'Premium');
/*!40000 ALTER TABLE `pizza_category` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Muzzarella',120.00,'Pizza clásica de muzzarella',NULL,'pizza'),(2,'Napolitana',150.00,'Pizza con tomate y ajo',NULL,'pizza'),(3,'Coca-Cola',50.00,'Gaseosa 500ml',NULL,'drink'),(4,'Hamburguesa Clásica',80.00,'Con queso y lechuga',NULL,'hamburguer'),(5,'Hamburguesa Doble',110.00,'Doble carne con bacon',NULL,'hamburguer');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

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
-- Dumping data for table `province`
--

LOCK TABLES `province` WRITE;
/*!40000 ALTER TABLE `province` DISABLE KEYS */;
INSERT INTO `province` VALUES (1,'Buenos Aires'),(2,'Córdoba'),(3,'Santa Fe');
/*!40000 ALTER TABLE `province` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Dumping data for table `store`
--

LOCK TABLES `store` WRITE;
/*!40000 ALTER TABLE `store` DISABLE KEYS */;
INSERT INTO `store` VALUES (1,'Pizzería Centro','Av. Corrientes',1234,1,'A',1000,1),(2,'Pizzería Norte','Calle Florida',567,2,'B',5000,2),(3,'Pizzería Sur','Av. San Juan',901,3,'C',3000,3);
/*!40000 ALTER TABLE `store` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-30 15:34:30

-- MySQL dump 10.13  Distrib 5.6.35, for Win64 (x86_64)
--
-- Host: localhost    Database: controlsales
-- ------------------------------------------------------
-- Server version	5.6.35-log

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id_cliente` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria',
  `nombres` varchar(200) DEFAULT NULL COMMENT 'nombres del cliente',
  `apellidos` varchar(200) DEFAULT NULL COMMENT 'apellidos del cliente',
  `identificacion` bigint(15) DEFAULT NULL COMMENT 'número de identicicación del cliente',
  `id_tipo_identificacion` int(11) DEFAULT NULL COMMENT 'tipo de identificación, ejemplo: cedula, NIT, cedula de extranjeria',
  `email` varchar(100) DEFAULT NULL COMMENT 'correo electronico',
  `telefono` varchar(50) DEFAULT NULL COMMENT 'teléfono fijo o celular',
  `direccion` varchar(200) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL COMMENT 'datos de auditoria',
  `usuario_creacion` varchar(50) DEFAULT NULL COMMENT 'datos de auditoria',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'datos de auditoria',
  `usuario_actualizacion` varchar(50) DEFAULT NULL COMMENT 'datos de auditoria',
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  KEY `fk_cliente_tipo_id_idx` (`id_tipo_identificacion`),
  CONSTRAINT `fk_cliente_tipo_id` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Maria','Rojas',1085252481,1,'ana@gmail.com','123423434','Bogotá',NULL,NULL,NULL,NULL),(2,'Andres','Lopez',1012121,1,'paulo.alexander12@gmail.com','3162869746','472','2017-02-24 23:31:23','Janeth Rodriguez janet',NULL,NULL),(3,'Luis','Chiran',321312312,1,'','','','2017-02-25 00:31:20','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compra` (
  `id_compra` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` decimal(12,2) DEFAULT NULL,
  `costo_total` decimal(12,2) DEFAULT NULL,
  `fecha_compra` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_proveedor_idx` (`id_proveedor`),
  KEY `fk_compra_producto_idx` (`id_producto`),
  KEY `fk_compra_tienda_idx` (`id_tienda`),
  CONSTRAINT `fk_compra_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_compra_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,1,1,1,12,500.00,6000.00,'2017-02-12 00:00:00',NULL,NULL,NULL,NULL),(2,1,1,1,10,1000.00,10000.00,'2017-02-19 00:00:00',NULL,NULL,NULL,NULL),(3,2,1,1,12,1000.00,12000.00,'2017-02-20 00:00:00',NULL,NULL,NULL,NULL),(4,2,1,1,20,2000.00,40000.00,'2017-02-20 00:00:00',NULL,NULL,NULL,NULL),(5,2,1,1,100,5000.00,500000.00,'2017-02-20 00:00:00',NULL,NULL,NULL,NULL),(6,2,2,2,100,15000.00,1500000.00,'2017-02-23 00:00:00','2017-02-23 23:12:41','Janeth Rodriguez janet',NULL,NULL),(7,2,2,1,50,15000.00,750000.00,'2017-02-22 00:00:00','2017-02-23 23:13:21','Janeth Rodriguez janet',NULL,NULL),(10,2,1,1,1000,10000.00,10000000.00,'2017-03-08 00:00:00','2017-03-08 22:12:28','Janeth Rodriguez janet',NULL,NULL),(11,1,4,1,40,5000.00,200000.00,'2017-03-11 00:00:00','2017-03-11 21:19:50','Janeth Rodriguez janet',NULL,NULL),(12,1,5,1,50,5000.00,250000.00,'2017-03-11 00:00:00','2017-03-11 21:55:55','Janeth Rodriguez janet',NULL,NULL),(13,2,6,1,100,500.00,50000.00,'2017-03-11 00:00:00','2017-03-11 22:29:31','Janeth Rodriguez janet',NULL,NULL),(14,2,3,1,1000,1000.00,1000000.00,'2017-03-13 00:00:00','2017-03-13 21:30:40','Janeth Rodriguez janet',NULL,NULL),(15,1,4,2,60000,40000.00,2400000000.00,'2017-04-07 00:00:00','2017-04-07 21:10:22','Janeth Rodriguez janet',NULL,NULL),(16,2,7,2,1000000,1000.00,1000000000.00,'2017-04-07 00:00:00','2017-04-07 21:12:41','Janeth Rodriguez janet',NULL,NULL),(17,2,2,2,12,3000.00,36000.00,'2017-06-15 00:00:00','2017-06-15 21:41:39','Janeth Rodriguez janet',NULL,NULL),(18,2,2,2,5,3500.00,17500.00,'2017-06-15 00:00:00','2017-06-15 21:48:05','Janeth Rodriguez janet',NULL,NULL),(19,2,2,2,10,3600.00,36000.00,'2017-06-15 00:00:00','2017-06-15 21:52:12','Janeth Rodriguez janet',NULL,NULL),(20,1,2,1,6,3700.00,22200.00,'2017-06-15 00:00:00','2017-06-15 21:52:47','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_pago`
--

DROP TABLE IF EXISTS `detalle_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_pago` (
  `id_detalle_pago` int(11) NOT NULL AUTO_INCREMENT,
  `id_pago_proveedor` int(11) DEFAULT NULL,
  `valor_abono` decimal(12,2) DEFAULT NULL,
  `fecha_abono` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_detalle_pago`),
  KEY `fk_detalle_pago_proveedor_idx` (`id_pago_proveedor`),
  CONSTRAINT `fk_detalle_pago_proveedor` FOREIGN KEY (`id_pago_proveedor`) REFERENCES `pago_proveedor` (`id_pago_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pago`
--

LOCK TABLES `detalle_pago` WRITE;
/*!40000 ALTER TABLE `detalle_pago` DISABLE KEYS */;
INSERT INTO `detalle_pago` VALUES (1,2,10000.00,'2017-03-07 00:00:00',NULL,NULL,NULL,NULL),(2,1,2000.00,'2017-03-07 00:00:00',NULL,NULL,NULL,NULL),(3,1,5000.00,'2017-03-07 00:00:00','2017-03-07 23:04:43','Janeth Rodriguez janet',NULL,NULL),(4,1,3000.00,'2017-03-06 00:00:00','2017-03-07 23:06:04','Janeth Rodriguez janet',NULL,NULL),(5,1,4000.00,'2017-03-07 00:00:00','2017-03-07 23:06:47','Janeth Rodriguez janet',NULL,NULL),(11,2,3000.00,'2017-03-09 00:00:00','2017-03-08 21:44:23','Janeth Rodriguez janet',NULL,NULL),(12,1,150.00,'2017-03-06 00:00:00','2017-03-08 21:53:18','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `detalle_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `idempresa` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(200) DEFAULT NULL,
  `representante` varchar(200) DEFAULT NULL,
  `identificacion` bigint(15) DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `regimen` varchar(50) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idempresa`),
  KEY `fk_empresa_tipo_id_idx` (`id_tipo_identificacion`),
  CONSTRAINT `fk_empresa_tipo_id` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
INSERT INTO `empresa` VALUES (1,'BEBES','Janet Rodriguez',123456789,NULL,'7211066','Centro','Común',NULL,NULL);
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura` (
  `id_factura` int(11) NOT NULL AUTO_INCREMENT,
  `id_cliente` int(11) DEFAULT NULL,
  `vendedor` varchar(200) DEFAULT NULL,
  `numero_factura` varchar(45) DEFAULT NULL,
  `fecha_venta` datetime DEFAULT NULL,
  `fecha_vencimiento` datetime DEFAULT NULL,
  `tipo_pago` varchar(50) DEFAULT NULL,
  `subtotal` decimal(12,2) DEFAULT NULL,
  `iva` decimal(12,2) DEFAULT NULL,
  `total` decimal(12,2) DEFAULT NULL,
  `efectivo` decimal(12,2) DEFAULT NULL,
  `cambio` decimal(12,2) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura`),
  KEY `fk_factura_cliente_idx` (`id_cliente`),
  KEY `fk_factura_tienda_idx` (`id_tienda`),
  CONSTRAINT `fk_factura_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id_cliente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (6,1,'Janeth Rodriguez','1','2017-02-25 00:24:05','2017-02-25 00:24:05','Efectivo',13445.00,2555.00,16000.00,30000.00,14000.00,1,'2017-02-25 00:25:15','Janeth Rodriguez janet'),(7,3,'Janeth Rodriguez','7','2017-02-25 00:31:00','2017-02-25 00:31:00','Efectivo',10924.00,2076.00,13000.00,20000.00,7000.00,1,'2017-02-25 00:31:44','Janeth Rodriguez janet'),(8,1,'Janeth Rodriguez','8','2017-02-25 13:35:18','2017-02-25 13:35:18','Efectivo',840.00,160.00,1000.00,5000.00,4000.00,1,'2017-02-25 13:36:03','Janeth Rodriguez janet'),(9,1,'Janeth Rodriguez','9','2017-02-26 18:05:49','2017-02-26 18:05:49','Efectivo',3782.00,718.00,4500.00,5000.00,500.00,1,'2017-02-26 18:06:19','Janeth Rodriguez janet'),(10,1,'Janeth Rodriguez','10','2017-02-26 18:19:17','2017-02-26 18:19:17','Efectivo',2017.00,383.00,2400.00,5000.00,2600.00,1,'2017-02-26 18:20:04','Janeth Rodriguez janet'),(11,2,'Janeth Rodriguez','11','2017-02-26 18:20:07','2017-02-26 18:20:07','Efectivo',3277.00,623.00,3900.00,5000.00,1100.00,1,'2017-02-26 18:20:39','Janeth Rodriguez janet'),(12,1,'Janeth Rodriguez','12','2017-03-08 22:54:18','2017-03-08 22:54:18','Efectivo',840.00,160.00,1000.00,1000.00,0.00,1,'2017-03-08 22:54:43','Janeth Rodriguez janet'),(13,1,'Janeth Rodriguez','13','2017-03-12 18:42:31','2017-03-12 18:42:31','Efectivo',1681.00,319.00,2000.00,5000.00,3000.00,1,'2017-03-12 18:43:15','Janeth Rodriguez janet'),(14,1,'Janeth Rodriguez','14','2017-03-12 18:59:35','2017-03-12 18:59:35','Efectivo',8403.00,1597.00,10000.00,20000.00,10000.00,1,'2017-03-12 19:00:15','Janeth Rodriguez janet'),(15,1,'Janeth Rodriguez','15','2017-03-12 19:05:59','2017-03-12 19:05:59','Efectivo',840.00,160.00,1000.00,3000.00,2000.00,1,'2017-03-12 19:06:26','Janeth Rodriguez janet'),(16,1,'Janeth Rodriguez','16','2017-03-12 19:23:15','2017-03-12 19:23:15','Efectivo',840.00,160.00,1000.00,2000.00,1000.00,1,'2017-03-12 19:23:39','Janeth Rodriguez janet'),(17,1,'Janeth Rodriguez','17','2017-03-12 19:44:46','2017-03-12 19:44:46','Efectivo',840.00,160.00,1000.00,2000.00,1000.00,1,'2017-03-12 19:45:06','Janeth Rodriguez janet'),(18,1,'Janeth Rodriguez','18','2017-03-12 19:51:30','2017-03-12 19:51:30','Efectivo',2521.00,479.00,3000.00,5000.00,2000.00,1,'2017-03-12 19:51:53','Janeth Rodriguez janet'),(19,1,'Janeth Rodriguez','19','2017-03-12 20:02:18','2017-03-12 20:02:18','Efectivo',840.00,160.00,1000.00,2000.00,1000.00,1,'2017-03-12 20:06:15','Janeth Rodriguez janet'),(20,1,'Janeth Rodriguez','20','2017-03-12 20:22:40','2017-03-12 20:22:40','Efectivo',840.00,160.00,1000.00,2000.00,1000.00,1,'2017-03-12 20:22:57','Janeth Rodriguez janet'),(21,1,'Janeth Rodriguez','21','2017-03-12 21:04:40','2017-03-12 21:04:40','Efectivo',2521.00,479.00,3000.00,5000.00,2000.00,1,'2017-03-12 21:05:18','Janeth Rodriguez janet'),(22,1,'Janeth Rodriguez','22','2017-03-13 21:01:53','2017-03-13 21:01:53','Efectivo',2521.00,479.00,3000.00,50000.00,47000.00,1,'2017-03-13 21:02:26','Janeth Rodriguez janet'),(23,1,'Janeth Rodriguez','23','2017-03-13 21:07:21','2017-03-13 21:07:21','Efectivo',2521.00,479.00,3000.00,5000.00,2000.00,1,'2017-03-13 21:07:50','Janeth Rodriguez janet'),(24,1,'Janeth Rodriguez','24','2017-03-13 21:18:54','2017-03-13 21:18:54','Efectivo',31092.00,5908.00,37000.00,50000.00,13000.00,1,'2017-03-13 21:19:43','Janeth Rodriguez janet'),(25,1,'Janeth Rodriguez','25','2017-03-13 21:29:28','2017-03-13 21:29:28','Efectivo',10924.00,2076.00,13000.00,20000.00,7000.00,1,'2017-03-13 21:30:51','Janeth Rodriguez janet'),(26,1,'Janeth Rodriguez','26','2017-03-13 21:46:38','2017-03-13 21:46:38','Efectivo',5042.00,958.00,6000.00,10000.00,4000.00,1,'2017-03-13 21:47:10','Janeth Rodriguez janet'),(27,1,'Janeth Rodriguez','27','2017-03-13 21:52:39','2017-03-13 21:52:39','Efectivo',2521.00,479.00,3000.00,5000.00,2000.00,1,'2017-03-13 21:53:04','Janeth Rodriguez janet'),(28,1,'Janeth Rodriguez','28','2017-03-13 21:55:16','2017-03-13 21:55:16','Efectivo',1681.00,319.00,2000.00,5000.00,3000.00,1,'2017-03-13 21:55:41','Janeth Rodriguez janet'),(29,1,'Janeth Rodriguez','29','2017-03-26 22:07:03','2017-03-26 22:07:03','Efectivo',8403.00,1597.00,10000.00,20000.00,10000.00,1,'2017-03-26 22:07:29','Janeth Rodriguez janet'),(30,3,'Janeth Rodriguez','30','2017-03-26 22:14:19','2017-03-26 22:14:19','Efectivo',8403.00,1597.00,10000.00,20000.00,10000.00,1,'2017-03-26 22:14:39','Janeth Rodriguez janet'),(31,1,'Janeth Rodriguez','31','2017-03-28 22:24:24','2017-03-28 22:24:24','Efectivo',4202.00,798.00,5000.00,50000.00,45000.00,2,'2017-03-28 22:25:54','Janeth Rodriguez janet'),(32,1,'Janeth Rodriguez','32','2017-03-29 20:22:56','2017-03-29 20:22:56','Efectivo',9244.00,1756.00,11000.00,50000.00,39000.00,1,'2017-03-29 20:23:16','Janeth Rodriguez janet'),(33,2,'Janeth Rodriguez','33','2017-04-07 20:37:52','2017-04-07 20:37:52','Efectivo',46218.00,8782.00,55000.00,1000000.00,945000.00,2,'2017-04-07 20:38:53','Janeth Rodriguez janet'),(34,3,'Janeth Rodriguez','34','2017-04-07 21:05:45','2017-04-07 21:05:45','Efectivo',840.00,160.00,1000.00,10000.00,9000.00,2,'2017-04-07 21:06:10','Janeth Rodriguez janet'),(35,2,'Janeth Rodriguez','35','2017-04-07 21:10:37','2017-04-07 21:10:37','Efectivo',13668724.00,2597058.00,16265782.00,20000000.00,3734218.00,2,'2017-04-07 21:12:44','Janeth Rodriguez janet'),(36,2,'Janeth Rodriguez','36','2017-04-07 21:17:29','2017-04-07 21:17:29','Efectivo',2773414.00,526949.00,3300363.00,5000000.00,1699637.00,2,'2017-04-07 21:17:51','Janeth Rodriguez janet'),(37,3,'Janeth Rodriguez','37','2017-04-07 21:23:52','2017-04-07 21:23:52','Efectivo',522745.00,99321.00,622066.00,650000.00,27934.00,2,'2017-04-07 21:24:22','Janeth Rodriguez janet'),(38,3,'Janeth Rodriguez','38','2017-04-07 21:28:41','2017-04-07 21:28:41','Efectivo',268095.00,50938.00,319033.00,350000.00,30967.00,2,'2017-04-07 21:29:30','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura_detalle`
--

DROP TABLE IF EXISTS `factura_detalle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `factura_detalle` (
  `id_factura_detalle` int(11) NOT NULL AUTO_INCREMENT,
  `id_factura` int(11) DEFAULT NULL,
  `id_producto` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(12,2) DEFAULT NULL,
  `precio_total` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_factura_detalle`),
  KEY `fk_factura_detalle_f_idx` (`id_factura`),
  KEY `fk_factura_detalle_producto_idx` (`id_producto`),
  CONSTRAINT `fk_factura_detalle_f` FOREIGN KEY (`id_factura`) REFERENCES `factura` (`id_factura`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_factura_detalle_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura_detalle`
--

LOCK TABLES `factura_detalle` WRITE;
/*!40000 ALTER TABLE `factura_detalle` DISABLE KEYS */;
INSERT INTO `factura_detalle` VALUES (4,6,1,'Camisas',2,1000.00,2000.00,'2017-02-25 00:25:15','Janeth Rodriguez janet'),(5,6,2,'Sacos de lana',5,1000.00,5000.00,'2017-02-25 00:25:15','Janeth Rodriguez janet'),(6,6,3,'Conjunto BBF',3,3000.00,9000.00,'2017-02-25 00:25:15','Janeth Rodriguez janet'),(7,7,1,'Camisas',13,1000.00,13000.00,'2017-02-25 00:31:44','Janeth Rodriguez janet'),(8,8,1,'Camisas',1,1000.00,1000.00,'2017-02-25 13:36:04','Janeth Rodriguez janet'),(9,9,1,'Camisas',3,1500.00,4500.00,'2017-02-26 18:06:19','Janeth Rodriguez janet'),(10,10,1,'Camisas',2,1200.00,2400.00,'2017-02-26 18:20:04','Janeth Rodriguez janet'),(11,11,1,'Camisas',3,1300.00,3900.00,'2017-02-26 18:20:39','Janeth Rodriguez janet'),(12,12,1,'Camisas',1,1000.00,1000.00,'2017-03-08 22:54:44','Janeth Rodriguez janet'),(13,13,6,'blusa',2,1000.00,2000.00,'2017-03-12 18:43:15','Janeth Rodriguez janet'),(14,14,4,'Pantalon HGF',1,10000.00,10000.00,'2017-03-12 19:00:15','Janeth Rodriguez janet'),(15,15,1,'Camisas',1,1000.00,1000.00,'2017-03-12 19:06:26','Janeth Rodriguez janet'),(16,16,1,'Camisas',1,1000.00,1000.00,'2017-03-12 19:23:39','Janeth Rodriguez janet'),(17,17,1,'Camisas',1,1000.00,1000.00,'2017-03-12 19:45:06','Janeth Rodriguez janet'),(18,18,3,'Conjunto BBF',1,3000.00,3000.00,'2017-03-12 19:51:53','Janeth Rodriguez janet'),(19,19,1,'Camisas',1,1000.00,1000.00,'2017-03-12 20:06:16','Janeth Rodriguez janet'),(20,20,1,'Camisas',1,1000.00,1000.00,'2017-03-12 20:22:57','Janeth Rodriguez janet'),(21,21,1,'Camisas',1,1000.00,1000.00,'2017-03-12 21:05:18','Janeth Rodriguez janet'),(22,21,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-12 21:05:18','Janeth Rodriguez janet'),(23,22,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:02:26','Janeth Rodriguez janet'),(24,22,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-13 21:02:26','Janeth Rodriguez janet'),(25,23,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:07:50','Janeth Rodriguez janet'),(26,23,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-13 21:07:50','Janeth Rodriguez janet'),(27,24,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:19:43','Janeth Rodriguez janet'),(28,24,3,'Conjunto BBF',2,3000.00,6000.00,'2017-03-13 21:19:43','Janeth Rodriguez janet'),(29,24,4,'Pantalon HGF',3,10000.00,30000.00,'2017-03-13 21:19:43','Janeth Rodriguez janet'),(30,25,1,'Camisas',2,1000.00,2000.00,'2017-03-13 21:30:51','Janeth Rodriguez janet'),(31,25,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-13 21:30:51','Janeth Rodriguez janet'),(32,25,3,'Conjunto BBF',3,3000.00,9000.00,'2017-03-13 21:30:51','Janeth Rodriguez janet'),(33,26,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:47:10','Janeth Rodriguez janet'),(34,26,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-13 21:47:10','Janeth Rodriguez janet'),(35,26,3,'Conjunto BBF',1,3000.00,3000.00,'2017-03-13 21:47:10','Janeth Rodriguez janet'),(36,27,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:53:04','Janeth Rodriguez janet'),(37,27,2,'Sacos de lana',2,1000.00,2000.00,'2017-03-13 21:53:04','Janeth Rodriguez janet'),(38,28,1,'Camisas',1,1000.00,1000.00,'2017-03-13 21:55:41','Janeth Rodriguez janet'),(39,28,2,'Sacos de lana',1,1000.00,1000.00,'2017-03-13 21:55:41','Janeth Rodriguez janet'),(40,29,6,'blusa',10,1000.00,10000.00,'2017-03-26 22:07:29','Janeth Rodriguez janet'),(41,30,6,'blusa',10,1000.00,10000.00,'2017-03-26 22:14:39','Janeth Rodriguez janet'),(42,31,1,'Camisas',2,1000.00,2000.00,'2017-03-28 22:25:54','Janeth Rodriguez janet'),(43,31,2,'Sacos de lana',3,1000.00,3000.00,'2017-03-28 22:25:54','Janeth Rodriguez janet'),(44,32,1,'Camisas',11,1000.00,11000.00,'2017-03-29 20:23:16','Janeth Rodriguez janet'),(45,33,1,'Camisas',33,1000.00,33000.00,'2017-04-07 20:38:53','Janeth Rodriguez janet'),(46,33,2,'Sacos de lana',22,1000.00,22000.00,'2017-04-07 20:38:53','Janeth Rodriguez janet'),(47,34,1,'Camisas',1,1000.00,1000.00,'2017-04-07 21:06:10','Janeth Rodriguez janet'),(48,35,1,'Camisas de cuello largo',12,1000.00,12000.00,'2017-04-07 21:12:44','Janeth Rodriguez janet'),(49,35,2,'Sacos de lana',13,1000.00,13000.00,'2017-04-07 21:12:44','Janeth Rodriguez janet'),(50,35,3,'Conjunto BBF',13,3000.00,39000.00,'2017-04-07 21:12:44','Janeth Rodriguez janet'),(51,35,7,'Pantalon bota tubo par ahombre',54,300033.00,16201782.00,'2017-04-07 21:12:44','Janeth Rodriguez janet'),(52,36,7,'Pantalon bota tubo par ahombre',11,300033.00,3300363.00,'2017-04-07 21:17:51','Janeth Rodriguez janet'),(53,37,1,'Camisas de cuello largo',22,1000.00,22000.00,'2017-04-07 21:24:22','Janeth Rodriguez janet'),(54,37,7,'Pantalon bota tubo par ahombre',2,300033.00,600066.00,'2017-04-07 21:24:22','Janeth Rodriguez janet'),(55,38,1,'Camisas de cuello largo',1,1000.00,1000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(56,38,2,'Sacos de lana',1,1000.00,1000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(57,38,3,'Conjunto BBF',1,3000.00,3000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(58,38,4,'Pantalon HGF',1,10000.00,10000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(59,38,5,'Pantalon TT',1,3000.00,3000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(60,38,6,'blusa de dama manga corta',1,1000.00,1000.00,'2017-04-07 21:29:30','Janeth Rodriguez janet'),(61,38,7,'Pantalon bota tubo par ahombre',1,300033.00,300033.00,'2017-04-07 21:29:30','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `factura_detalle` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `impuesto`
--

DROP TABLE IF EXISTS `impuesto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `impuesto` (
  `id_impuesto` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `valor` int(11) DEFAULT NULL,
  `sigla` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_impuesto`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `impuesto`
--

LOCK TABLES `impuesto` WRITE;
/*!40000 ALTER TABLE `impuesto` DISABLE KEYS */;
INSERT INTO `impuesto` VALUES (1,'Impuesto Valor Agregado',19,'IVA');
/*!40000 ALTER TABLE `impuesto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario`
--

DROP TABLE IF EXISTS `inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario` (
  `id_inventario` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `costo_unitario` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_inventario`),
  KEY `fk_inventario_producto_idx` (`id_producto`),
  CONSTRAINT `fk_inventario_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario`
--

LOCK TABLES `inventario` WRITE;
/*!40000 ALTER TABLE `inventario` DISABLE KEYS */;
INSERT INTO `inventario` VALUES (1,1,993,2.00,'2017-02-20 18:14:21','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(2,2,129,3700.00,'2017-02-23 23:12:41','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(3,3,986,1000.00,'2017-02-24 22:27:40','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(4,4,60035,40000.00,'2017-03-11 21:19:50','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(5,5,49,5000.00,'2017-03-11 21:55:55','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(6,6,77,500.00,'2017-03-11 22:29:31','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(7,7,999932,1000.00,'2017-04-07 21:12:41','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventario_tienda`
--

DROP TABLE IF EXISTS `inventario_tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventario_tienda` (
  `id_inventario_tienda` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `existencia` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_inventario_tienda`),
  KEY `fk_inventario_tienda_t_idx` (`id_tienda`),
  KEY `fk_inventario_producto_t_idx` (`id_producto`),
  CONSTRAINT `fk_inventario_producto_t` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventario_tienda_t` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventario_tienda`
--

LOCK TABLES `inventario_tienda` WRITE;
/*!40000 ALTER TABLE `inventario_tienda` DISABLE KEYS */;
INSERT INTO `inventario_tienda` VALUES (1,1,1,776,'2017-02-20 18:14:21','Janeth Rodriguez janet','2017-03-29 20:23:16','Janeth Rodriguez janet'),(2,2,2,121,'2017-02-23 23:12:41','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(3,2,1,8,'2017-02-23 23:13:21','Janeth Rodriguez janet','2017-03-13 21:55:41','Janeth Rodriguez janet'),(4,3,1,500,'2017-02-24 22:27:40','Janeth Rodriguez janet','2017-04-07 21:12:02','Janeth Rodriguez janet'),(5,1,2,207,'2017-03-08 21:54:38','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(6,3,2,485,'2017-03-08 21:56:06','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(7,4,1,54,'2017-03-11 21:19:50','Janeth Rodriguez janet','2017-03-13 21:19:43','Janeth Rodriguez janet'),(8,4,2,60001,'2017-03-11 21:20:09','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(9,5,1,46,'2017-03-11 21:55:55','Janeth Rodriguez janet','2017-03-12 11:47:43','Janeth Rodriguez janet'),(10,5,2,3,'2017-03-11 21:56:18','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(11,6,1,7,'2017-03-11 22:29:31','Janeth Rodriguez janet','2017-03-26 22:14:39','Janeth Rodriguez janet'),(12,6,2,70,'2017-03-11 22:29:54','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet'),(13,7,2,999932,'2017-04-07 21:12:41','Janeth Rodriguez janet','2017-04-07 21:29:30','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `inventario_tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu` (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT,
  `id_menu_padre` int(11) DEFAULT NULL,
  `descripcion` varchar(100) DEFAULT NULL,
  `opcion` varchar(200) DEFAULT NULL,
  `orden` int(11) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_menu`),
  UNIQUE KEY `opcion_UNIQUE` (`opcion`),
  KEY `fk_menu_menu_idx` (`id_menu_padre`),
  CONSTRAINT `fk_menu_menu` FOREIGN KEY (`id_menu_padre`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,NULL,'Gestion','GESTION',1,'2017-02-13 00:00:00','Admin'),(2,NULL,'Productos','PRODUCTOS',2,NULL,'ADMIN'),(3,NULL,'Facturación','FACTURACION',3,NULL,'ADMIN'),(4,1,'Empresa','/COVES-web/faces/empresa/',100,'2017-02-13 00:00:00','Admin'),(5,1,'Impuesto','/COVES-web/faces/impuesto/',200,'2017-02-13 00:00:00','Admin'),(6,1,'Menu Roles','/COVES-web/faces/menuRol/',400,'2017-02-13 00:00:00','Admin'),(7,1,'Roles','/COVES-web/faces/rol/',300,'2017-02-13 00:00:00','Admin'),(8,1,'Usuarios','/COVES-web/faces/usuario/',500,'2017-02-13 00:00:00','Admin'),(9,1,'Usuarios Roles','/COVES-web/faces/usuarioRol/',600,'2017-02-13 00:00:00','Admin'),(10,1,'Tipo de novedades','/COVES-web/faces/tipoNoveda/',700,'2017-02-13 00:00:00','Admin'),(11,2,'Clientes','/COVES-web/faces/cliente/',100,'2017-02-13 00:00:00','Admin'),(12,2,'Compras','/COVES-web/faces/compra/',200,'2017-02-13 00:00:00','Admin'),(13,2,'Inventario Global','/COVES-web/faces/inventario/',300,'2017-02-13 00:00:00','Admin'),(14,2,'Inventario por Local','/COVES-web/faces/inventarioTienda/',400,'2017-02-13 00:00:00','Admin'),(15,2,'Novedades','/COVES-web/faces/novedad/',500,'2017-02-13 00:00:00','Admin'),(16,2,'Productos','/COVES-web/faces/producto/',600,'2017-02-13 00:00:00','Admin'),(17,2,'Proveedores','/COVES-web/faces/proveedor/',700,'2017-02-13 00:00:00','Admin'),(19,2,'Locales','/COVES-web/faces/tienda/',800,'2017-02-13 00:00:00','Admin'),(20,3,'Consultar Facturas','/COVES-web/faces/factura/',100,'2017-02-13 00:00:00','Admin'),(21,3,'Facturar','/COVES-web/faces/facturar/',200,'2017-02-13 00:00:00','Admin'),(22,2,'Pagos a proveedores','/COVES-web/faces/pagoProveedor/',900,'2017-02-13 00:00:00','Admin'),(23,3,'Consulta Ventas','/COVES-web/faces/consulta/',300,'2017-02-23 21:24:45','Admin');
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_rol`
--

DROP TABLE IF EXISTS `menu_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_rol` (
  `id_menu_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_rol` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_menu_rol`),
  UNIQUE KEY `unique_menu_rol` (`id_rol`,`id_menu`),
  KEY `fk_menu_rol_menu_idx` (`id_menu`),
  KEY `fk_menu_rol_rol_idx` (`id_rol`),
  CONSTRAINT `fk_menu_rol_menu` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id_menu`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_menu_rol_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_rol`
--

LOCK TABLES `menu_rol` WRITE;
/*!40000 ALTER TABLE `menu_rol` DISABLE KEYS */;
INSERT INTO `menu_rol` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,1,2,NULL,NULL,NULL,NULL),(3,1,3,NULL,NULL,NULL,NULL),(4,1,4,NULL,NULL,NULL,NULL),(5,1,5,NULL,NULL,NULL,NULL),(6,1,6,NULL,NULL,NULL,NULL),(7,1,7,NULL,NULL,NULL,NULL),(8,1,8,NULL,NULL,NULL,NULL),(9,1,9,NULL,NULL,NULL,NULL),(10,1,10,NULL,NULL,NULL,NULL),(11,1,11,NULL,NULL,NULL,NULL),(12,1,12,NULL,NULL,NULL,NULL),(13,1,13,NULL,NULL,NULL,NULL),(14,1,14,NULL,NULL,NULL,NULL),(15,1,15,NULL,NULL,NULL,NULL),(16,1,16,NULL,NULL,NULL,NULL),(17,1,17,NULL,NULL,NULL,NULL),(18,1,19,NULL,NULL,NULL,NULL),(21,1,20,NULL,NULL,NULL,NULL),(22,1,21,NULL,NULL,NULL,NULL),(23,2,20,NULL,NULL,NULL,NULL),(24,2,21,NULL,NULL,NULL,NULL),(25,1,22,'2017-02-25 15:53:51','Janeth Rodriguez janet',NULL,NULL),(26,1,23,'2017-02-26 17:53:56','Janeth Rodriguez janet',NULL,NULL),(27,2,2,'2017-03-26 22:04:08','Janeth Rodriguez janet',NULL,NULL),(28,2,22,'2017-03-26 22:05:23','Janeth Rodriguez janet',NULL,NULL),(29,2,16,'2017-03-26 22:06:19','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `menu_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `novedad`
--

DROP TABLE IF EXISTS `novedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `novedad` (
  `id_novedad` int(11) NOT NULL AUTO_INCREMENT,
  `id_producto` int(11) DEFAULT NULL,
  `id_tienda` int(11) DEFAULT NULL,
  `id_tipo_novedad` int(11) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `costo_unitario` decimal(12,2) DEFAULT NULL,
  `costo_total` decimal(12,2) DEFAULT NULL,
  `fecha_novedad` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_novedad`),
  KEY `fk_novedad_producto_idx` (`id_producto`),
  KEY `fk_novedad_tienda_idx` (`id_tienda`),
  KEY `fk_novedad_tipo_nov_idx` (`id_tipo_novedad`),
  CONSTRAINT `fk_novedad_producto` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_novedad_tienda` FOREIGN KEY (`id_tienda`) REFERENCES `tienda` (`id_tienda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_novedad_tipo_nov` FOREIGN KEY (`id_tipo_novedad`) REFERENCES `tipo_noveda` (`id_tipo_noveda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `novedad`
--

LOCK TABLES `novedad` WRITE;
/*!40000 ALTER TABLE `novedad` DISABLE KEYS */;
INSERT INTO `novedad` VALUES (1,1,1,1,'Me devolvieron',1,100.00,100.00,'2017-02-12 00:00:00',NULL,NULL,NULL,NULL),(2,1,1,2,'Dar de baja uno  producto',9,1000.00,9000.00,'2017-02-20 00:00:00',NULL,NULL,NULL,NULL),(3,2,2,2,'Dar de baja',1,15000.00,15000.00,'2017-02-23 00:00:00','2017-02-23 23:14:02','Janeth Rodriguez janet',NULL,NULL),(4,3,1,2,'Dar de baja',10,4500.00,45000.00,'2017-02-24 00:00:00','2017-02-24 22:27:40','Janeth Rodriguez janet',NULL,NULL),(5,1,1,2,'Niveda 111',1,1.00,1.00,'2017-03-08 00:00:00','2017-03-08 22:14:53','Janeth Rodriguez janet',NULL,NULL),(6,1,1,1,'222',1,2.00,1.00,'2017-03-28 00:00:00','2017-03-28 22:27:00','Janeth Rodriguez janet',NULL,NULL),(7,2,2,1,'dev',4,1000.00,4000.00,'2017-06-15 00:00:00','2017-06-15 21:53:59','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `novedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago_proveedor`
--

DROP TABLE IF EXISTS `pago_proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago_proveedor` (
  `id_pago_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `id_proveedor` int(11) DEFAULT NULL,
  `numero_factura` varchar(50) DEFAULT NULL,
  `valor_total` decimal(12,2) DEFAULT NULL,
  `valor_pagado` decimal(12,2) DEFAULT NULL,
  `fecha_factura` datetime DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_pago_proveedor`),
  UNIQUE KEY `numero_factura_UNIQUE` (`numero_factura`),
  KEY `fk_pago_proveedor_idx` (`id_proveedor`),
  CONSTRAINT `fk_pago_proveedor` FOREIGN KEY (`id_proveedor`) REFERENCES `proveedor` (`id_proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago_proveedor`
--

LOCK TABLES `pago_proveedor` WRITE;
/*!40000 ALTER TABLE `pago_proveedor` DISABLE KEYS */;
INSERT INTO `pago_proveedor` VALUES (1,2,'123123',1000000.00,14150.00,'2017-02-25 00:00:00','2017-02-25 00:00:00','ADADA','2017-03-08 21:53:19','Janeth Rodriguez janet'),(2,1,'212312',3000000.00,13000.00,'2017-02-25 00:00:00','2017-02-25 18:53:07','Janeth Rodriguez janet','2017-03-08 21:44:38','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `pago_proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parametro`
--

DROP TABLE IF EXISTS `parametro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parametro` (
  `id_parametro` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria',
  `grupo` varchar(100) DEFAULT NULL COMMENT 'grupo de parámetros',
  `llave` varchar(100) DEFAULT NULL COMMENT 'llave del parámetro',
  `valor_cadena` varchar(100) DEFAULT NULL COMMENT 'valor en string',
  `valor_numero` int(11) DEFAULT NULL COMMENT 'valor numérico',
  `estado` varchar(1) DEFAULT NULL COMMENT 'Activo=A, Inactivo=I',
  `fech_creacion` datetime DEFAULT NULL COMMENT 'datos de auditoria',
  `usuario_creacion` varchar(50) DEFAULT NULL COMMENT 'datos de auditoria',
  PRIMARY KEY (`id_parametro`),
  UNIQUE KEY `grupo_llave_UNIQUE` (`grupo`,`llave`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parametro`
--

LOCK TABLES `parametro` WRITE;
/*!40000 ALTER TABLE `parametro` DISABLE KEYS */;
/*!40000 ALTER TABLE `parametro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria',
  `codigo` varchar(50) DEFAULT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  `ruta_imagen` varchar(200) DEFAULT NULL,
  `precio1` decimal(12,2) DEFAULT NULL,
  `precio2` decimal(12,2) DEFAULT NULL,
  `precio3` decimal(12,2) DEFAULT NULL,
  `precio4` decimal(12,2) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  UNIQUE KEY `codigo_UNIQUE` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'C01','Camisas de cuello largo','',1000.00,1100.00,1200.00,1500.00,NULL,NULL,'2017-04-07 21:08:48','Janeth Rodriguez janet'),(2,'C02','Sacos de lana',NULL,1000.00,1000.00,1000.00,1000.00,'2017-02-23 21:09:36','Janeth Rodriguez janet',NULL,NULL),(3,'C03','Conjunto BBF',NULL,3000.00,3000.00,3000.00,3000.00,'2017-02-23 21:10:06','Janeth Rodriguez janet',NULL,NULL),(4,'C04','Pantalon HGF',NULL,10000.00,11000.00,12000.00,13000.00,'2017-02-23 21:10:32','Janeth Rodriguez janet',NULL,NULL),(5,'CO5','Pantalon TT',NULL,3000.00,4000.00,5000.00,5000.00,'2017-03-11 21:55:30','Janeth Rodriguez janet',NULL,NULL),(6,'BL01 ','blusa de dama manga corta',NULL,1000.00,2000.00,3000.00,4000.00,'2017-03-11 22:28:59','Janeth Rodriguez janet','2017-04-07 21:09:08','Janeth Rodriguez janet'),(7,'44123','Pantalon bota tubo par ahombre',NULL,300033.00,NULL,NULL,NULL,'2017-04-07 21:09:34','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `razonsocial` varchar(200) DEFAULT NULL,
  `representante` varchar(200) DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `identificacion` bigint(15) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL,
  `celular` varchar(100) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL COMMENT 'Activo=A, Inactivo=I',
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `identificacion_UNIQUE` (`identificacion`),
  KEY `fk_proveedor_tipo_id_idx` (`id_tipo_identificacion`),
  CONSTRAINT `fk_proveedor_tipo_id` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'toto','Juan',NULL,123,'12345','12345','Calle 123','juan@gmail.com','A',NULL,NULL,NULL,NULL),(2,'Mayorista de Ropa para bebes','Ana Paz',NULL,2312312,'7211066','3162869746','Bogotá','ana@gmail.com','A',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `id_rol` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_rol`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES (1,'Administrador','A',NULL,NULL,NULL,NULL),(2,'Vendedor','A',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tienda`
--

DROP TABLE IF EXISTS `tienda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tienda` (
  `id_tienda` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(200) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tienda`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tienda`
--

LOCK TABLES `tienda` WRITE;
/*!40000 ALTER TABLE `tienda` DISABLE KEYS */;
INSERT INTO `tienda` VALUES (1,'Local 1',NULL,NULL),(2,'Local 2',NULL,NULL);
/*!40000 ALTER TABLE `tienda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_identificacion`
--

DROP TABLE IF EXISTS `tipo_identificacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_identificacion` (
  `id_tipo_identificacion` int(11) NOT NULL AUTO_INCREMENT COMMENT 'llave primaria',
  `descripcion` varchar(100) NOT NULL COMMENT 'nombre del tipo de identificacion',
  `sigla` varchar(10) NOT NULL COMMENT 'sigla ejemploe: CC, NIT, CE, TI',
  `fecha_creacion` datetime DEFAULT NULL COMMENT 'datos de auditoria',
  `usuario_creacion` varchar(50) DEFAULT NULL COMMENT 'datos de auditoria',
  PRIMARY KEY (`id_tipo_identificacion`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_identificacion`
--

LOCK TABLES `tipo_identificacion` WRITE;
/*!40000 ALTER TABLE `tipo_identificacion` DISABLE KEYS */;
INSERT INTO `tipo_identificacion` VALUES (1,'Cédula','CC','2017-02-12 00:00:00','Admin');
/*!40000 ALTER TABLE `tipo_identificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_noveda`
--

DROP TABLE IF EXISTS `tipo_noveda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_noveda` (
  `id_tipo_noveda` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) DEFAULT NULL,
  `sigla` varchar(50) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_tipo_noveda`),
  UNIQUE KEY `sigla_UNIQUE` (`sigla`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_noveda`
--

LOCK TABLES `tipo_noveda` WRITE;
/*!40000 ALTER TABLE `tipo_noveda` DISABLE KEYS */;
INSERT INTO `tipo_noveda` VALUES (1,'Devolucion','+','A',NULL,NULL),(2,'Quitar del Inventario','-','A',NULL,NULL);
/*!40000 ALTER TABLE `tipo_noveda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `nombres` varchar(200) DEFAULT NULL,
  `apellidos` varchar(200) DEFAULT NULL,
  `id_tipo_identificacion` int(11) DEFAULT NULL,
  `identificacion` bigint(15) DEFAULT NULL,
  `estado` varchar(1) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`usuario`),
  KEY `fk_usuario_tipo_id_idx` (`id_tipo_identificacion`),
  CONSTRAINT `fk_usuario_tipo_id` FOREIGN KEY (`id_tipo_identificacion`) REFERENCES `tipo_identificacion` (`id_tipo_identificacion`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Janeth','Rodriguez',1,123456789,'A','janet','janet',NULL,NULL,'2017-02-20 18:08:11','Alexander Chiran alex'),(2,'Ana','Perez',1,1244343431,'A','ana','ana',NULL,NULL,NULL,NULL),(3,'Jose','Paz',1,3223431,'A','jose','jose','2017-02-16 23:20:29','Alexander Chiran alex','2017-03-26 21:35:14','Janeth Rodriguez janet');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_rol`
--

DROP TABLE IF EXISTS `usuario_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_rol` (
  `id_usuario_rol` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_rol` int(11) NOT NULL,
  `fecha_creacion` datetime DEFAULT NULL,
  `usuario_creacion` varchar(50) DEFAULT NULL,
  `fecha_actualizacion` datetime DEFAULT NULL,
  `usuario_actualizacion` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario_rol`),
  UNIQUE KEY `Unique_usuario_rol` (`id_usuario`,`id_rol`),
  KEY `fk_usuario_rol_usu_idx` (`id_usuario`),
  KEY `fk_usuario_rol_rol_idx` (`id_rol`),
  CONSTRAINT `fk_usuario_rol_rol` FOREIGN KEY (`id_rol`) REFERENCES `rol` (`id_rol`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuario_rol_usu` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_rol`
--

LOCK TABLES `usuario_rol` WRITE;
/*!40000 ALTER TABLE `usuario_rol` DISABLE KEYS */;
INSERT INTO `usuario_rol` VALUES (1,1,1,NULL,NULL,NULL,NULL),(2,2,2,NULL,NULL,NULL,NULL),(4,3,2,'2017-03-26 22:02:23','Janeth Rodriguez janet',NULL,NULL);
/*!40000 ALTER TABLE `usuario_rol` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-15 22:45:03

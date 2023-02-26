-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: db_lucasantorini
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `id_direccion` int unsigned NOT NULL AUTO_INCREMENT,
  `calle` varchar(200) NOT NULL,
  `numero` varchar(45) NOT NULL,
  `colonia` varchar(100) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `codigo_postal` int NOT NULL,
  `estado` varchar(100) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `otros_detalles` varchar(200) DEFAULT NULL,
  `usuario_id_usuario` int unsigned NOT NULL,
  PRIMARY KEY (`id_direccion`),
  KEY `fk_direccion_usuario1_idx` (`usuario_id_usuario`),
  CONSTRAINT `fk_direccion_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'12A','958','brisas poniente','Saltillo',25225,'Coahuila','México','casa casi en la esquina con maría del socorro al lado de los locales, blanca, porton negro',1),(2,'Del agua','147','El vigía','Zapopan',45140,'Jalisco','México','Es una calle cerrada y hay un billar en la esquina',2),(3,'J María Letena','245','Lomas del paraíso','Guadalajara',44250,'Jalisco','México','Calle que hace cerrada con campos de futbol',3),(4,'Aperos','611','portales de la silla','Guadalupe',67194,'Nuevo León','México','casa con portón negro y árbol en la banqueta ',4),(5,'Fuente del Ecuador ','208','Villa Fontana','Tlaquepaque',45615,'Jalisco','México','casa frente a parque principal',5),(6,'Granado','168-1','Los Encinos ','Tlajomulco',45650,'Jalisco','México','casa blanca con cochera y tejas',6),(7,'Calzada de tlalpan','1290','Portales','CDMX',3301,'Ciudad de Mexico','México','Puerta Azul, enfrente jardineras',7);
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `id_entrega` int unsigned NOT NULL AUTO_INCREMENT,
  `fecha_reportada` date DEFAULT NULL,
  `codigo_seguimiento` varchar(200) DEFAULT NULL,
  `otros_detalles` varchar(200) DEFAULT NULL,
  `pedido_id_pedido` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_entrega`),
  KEY `pedido_id_pedido_idx` (`id_entrega`),
  KEY `fk_entrega_has_pedido_idx` (`pedido_id_pedido`),
  CONSTRAINT `fk_entrega_has_pedido` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido` (`id_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES (1,'2023-01-03','258963254110','Entrega concretada con éxito',1),(2,'2023-01-05','121214568978','La entrega fue demorada 24 horas',2),(3,'2023-01-16','202321252624','Entrega concretada con éxito',3),(4,'2023-03-15','121212363636','Pendiente entrega',4),(5,'2023-03-16','125145136145','Pendiente entrega',5),(6,'2023-03-20','100120130150','Pendiente entrega',6);
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `foto`
--

DROP TABLE IF EXISTS `foto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `foto` (
  `id_foto` int unsigned NOT NULL AUTO_INCREMENT,
  `ruta` varchar(300) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `producto_id_producto` int unsigned NOT NULL,
  PRIMARY KEY (`id_foto`),
  KEY `fk_foto_producto1_idx` (`producto_id_producto`),
  CONSTRAINT `fk_foto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `foto`
--

LOCK TABLES `foto` WRITE;
/*!40000 ALTER TABLE `foto` DISABLE KEYS */;
INSERT INTO `foto` VALUES (1,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_luca_love_for_galli.jpg','frente',1),(2,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_luca_love_for_galli.jpg','frente',2),(3,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_luca_love_for_galli.jpg','frente',3),(4,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443981/productos_LucaSantorini/playera_luca_love_for_galli_back.jpg','posterior',1),(5,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443981/productos_LucaSantorini/playera_luca_love_for_galli_back.jpg','posterior',2),(6,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443981/productos_LucaSantorini/playera_luca_love_for_galli_back.jpg','posterior',3),(7,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_roja.jpg','frente',4),(8,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_roja.jpg','frente',5),(9,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_roja.jpg','frente',6),(10,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443978/productos_LucaSantorini/playera_dannyocean_babylon_roja_back.jpg','posterior',4),(11,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443978/productos_LucaSantorini/playera_dannyocean_babylon_roja_back.jpg','posterior',5),(12,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443978/productos_LucaSantorini/playera_dannyocean_babylon_roja_back.jpg','posteror',6),(13,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_verde.jpg','frente',7),(14,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_verde.jpg','frente',8),(15,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443974/productos_LucaSantorini/playera_dannyocean_babylon_verde.jpg','frente',9),(16,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_dannyocean_babylon_verde_back.jpg','posterior',7),(17,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_dannyocean_babylon_verde_back.jpg','posterior',8),(18,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_dannyocean_babylon_verde_back.jpg','posterior',9),(19,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey.jpg','frente',10),(20,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey.jpg','frente',11),(21,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey.jpg','frente',12),(22,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey_back.jpg','posterior',10),(23,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey_back.jpg','posterior',11),(24,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_azulrey_back.jpg','posterior',12),(25,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino.jpg','frente',13),(26,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino.jpg','frente',14),(27,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino.jpg','frente',15),(28,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino_back.jpg','posterior',13),(29,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino_back.jpg','posterior',14),(30,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_azulmarino_back.jpg','posterior',15),(31,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_cafe.jpg','frente',16),(32,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_cafe.jpg','frente',17),(33,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_dannyocean_babylon_cafe.jpg','frente',18),(34,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_cafe_back.jpg','posterior',16),(35,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_cafe_back.jpg','posterior',17),(36,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443973/productos_LucaSantorini/playera_dannyocean_babylon_cafe_back.jpg','posterior',18),(37,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_harry_en_guanatos02_blanca.jpg','frente',19),(38,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_harry_en_guanatos02_blanca.jpg','frente',20),(39,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443976/productos_LucaSantorini/playera_harry_en_guanatos02_blanca.jpg','frente',21),(40,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_harry_en_guanatos_blanca_back.jpg','posterior',19),(41,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_harry_en_guanatos_blanca_back.jpg','posterior',20),(42,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443975/productos_LucaSantorini/playera_harry_en_guanatos_blanca_back.jpg','posterior',21),(43,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_beige.jpg','frente',22),(44,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_beige.jpg','frente',23),(45,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_beige.jpg','frente',24),(46,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azul_rey.jpg','frente',25),(47,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azul_rey.jpg','frente',26),(48,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azul_rey.jpg','frente',27),(49,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azulmarino.jpg','frente',28),(50,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azulmarino.jpg','frente',29),(51,'https://res.cloudinary.com/dgp2sgznp/image/upload/v1677443972/productos_LucaSantorini/playera_bellakeo_azulmarino.jpg','frente',30);
/*!40000 ALTER TABLE `foto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_usuario`
--

DROP TABLE IF EXISTS `mensaje_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensaje_usuario` (
  `id_mensaje` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `email` varchar(150) DEFAULT NULL,
  `numero_telefono` varchar(45) DEFAULT NULL,
  `mensaje` varchar(200) DEFAULT NULL,
  `usuario_idusuario` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id_mensaje`),
  KEY `fk_mensaje_usuario_usuario_idx` (`usuario_idusuario`),
  CONSTRAINT `fk_mensaje_usuario_usuario` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_usuario`
--

LOCK TABLES `mensaje_usuario` WRITE;
/*!40000 ALTER TABLE `mensaje_usuario` DISABLE KEYS */;
INSERT INTO `mensaje_usuario` VALUES (1,'Leonardo Daniel Miranda Ibarra','leonardmiranda99@gmail.com','8442282079','me encanto la playera, no estara en color azul?',1),(2,'Miriam Salgado','miriam.slgd@gmail.com','3325555778','buen día, tendrán en talla extrachica?',3),(3,'Manuel Alejandro Galván Jáuregui','manuelsk150@gmail.com','3334824244','Quiero todos los modelos <3',2),(4,'Jose Stephano Gomez Ilizaliturri\n','stephanogmi@gmail.com ','5560967800','quisiera 200 playeras de distintos estampados, tienen precios de mayoreo?',NULL),(5,'Pavel Oswaldo Olage Gallegos ','paveloswaldo.gallegos@gmail.com','3325611832','¿No manejas tallas más grandes? ',5);
/*!40000 ALTER TABLE `mensaje_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int unsigned NOT NULL AUTO_INCREMENT,
  `monto_total` decimal(10,0) DEFAULT NULL,
  `metodo_pago` varchar(45) DEFAULT NULL,
  `fecha_solicitud` date DEFAULT NULL,
  `fecha_pago` date DEFAULT NULL,
  `usuario_id_usuario` int unsigned NOT NULL,
  `direccion_id_direccion` int unsigned NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_pedido_usuario1_idx` (`usuario_id_usuario`),
  KEY `fk_pedido_direccion1_idx` (`direccion_id_direccion`),
  CONSTRAINT `fk_pedido_direccion1` FOREIGN KEY (`direccion_id_direccion`) REFERENCES `direccion` (`id_direccion`),
  CONSTRAINT `fk_pedido_usuario1` FOREIGN KEY (`usuario_id_usuario`) REFERENCES `usuario` (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,270,'tarjeta','2022-12-23','2022-12-23',1,1),(2,300,'tarjeta','2022-12-31','2022-12-31',1,1),(3,350,'tarjeta','2023-01-12','2023-01-13',2,2),(4,350,'tarjeta','2023-02-24','2023-02-24',3,3),(5,300,'tarjeta','2023-02-25','2023-02-26',3,3),(6,570,'tarjeta','2023-02-26','2023-02-26',4,4);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_has_producto`
--

DROP TABLE IF EXISTS `pedido_has_producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_has_producto` (
  `id_pedido_has_producto` int unsigned NOT NULL AUTO_INCREMENT,
  `cantidad` int DEFAULT NULL,
  `otros_detalles` varchar(200) DEFAULT NULL,
  `pedido_id_pedido` int unsigned NOT NULL,
  `producto_id_producto` int unsigned NOT NULL,
  PRIMARY KEY (`id_pedido_has_producto`),
  KEY `fk_pedido_has_producto_pedido1_idx` (`pedido_id_pedido`),
  KEY `fk_pedido_has_producto_producto1_idx` (`producto_id_producto`),
  CONSTRAINT `fk_pedido_has_producto_pedido1` FOREIGN KEY (`pedido_id_pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `fk_pedido_has_producto_producto1` FOREIGN KEY (`producto_id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_has_producto`
--

LOCK TABLES `pedido_has_producto` WRITE;
/*!40000 ALTER TABLE `pedido_has_producto` DISABLE KEYS */;
INSERT INTO `pedido_has_producto` VALUES (1,1,'Pedido exitoso',1,1),(2,1,'Pedido exitoso',2,4),(3,1,'Pedido exitoso',3,23),(4,1,'Pedido exitoso',4,22),(5,1,'Pedido exitoso',5,17),(6,1,'Pedido exitoso',6,12),(7,1,'Pedido exitoso',6,3);
/*!40000 ALTER TABLE `pedido_has_producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int unsigned NOT NULL AUTO_INCREMENT,
  `codigo_producto` varchar(150) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `talla` varchar(100) DEFAULT NULL,
  `color` varchar(100) DEFAULT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `precio` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'PA_GALLI_BL_CH','LOVE 4 GALLI','chica','blanco','Esta es perfecta para rockearla en tal fecha, un uniforme para todo cuaadeño o artista de closet',270),(2,'PA_GALLI_BL_MD','LOVE 4 GALLI','mediana','blanco','Esta es perfecta para rockearla en tal fecha, un uniforme para todo cuaadeño o artista de closet',270),(3,'PA_GALLI_BL_GD','LOVE 4 GALLI','grande','blanco','Esta es perfecta para rockearla en tal fecha, un uniforme para todo cuaadeño o artista de closet',270),(4,'PA_DANNY_RJ_CH','LSSW x DANNY OCÉANO Babylon G’','chica','rojo','En más de 5 colorways',300),(5,'PA_DANNY_RJ_MD','LSSW x DANNY OCÉANO Babylon G’','mediana','rojo','En más de 5 colorways',300),(6,'PA_DANNY_RJ_GD','LSSW x DANNY OCÉANO Babylon G’','grande','rojo','En más de 5 colorways',300),(7,'PA_DANNY_VD_CH','LSSW x DANNY OCÉANO Babylon G’','chica','verde','En más de 5 colorways',300),(8,'PA_DANNY_VD_MD','LSSW x DANNY OCÉANO Babylon G’','mediana','verde','En más de 5 colorways',300),(9,'PA_DANNY_VD_GD','LSSW x DANNY OCÉANO Babylon G’','grande','verde','En más de 5 colorways',300),(10,'PA_DANNY_AR_CH','LSSW x DANNY OCÉANO Babylon G’','chica','azul rey','En más de 5 colorways',300),(11,'PA_DANNY_AR_MD','LSSW x DANNY OCÉANO Babylon G’','mediana','azul rey','En más de 5 colorways',300),(12,'PA_DANNY_AR_GD','LSSW x DANNY OCÉANO Babylon G’','grande','azul rey','En más de 5 colorways',300),(13,'PA_DANNY_AM_CH','LSSW x DANNY OCÉANO Babylon G’','chica','azul marino','En más de 5 colorways',300),(14,'PA_DANNY_AM_M','LSSW x DANNY OCÉANO Babylon G’','mediana','azul marino','En más de 5 colorways',300),(15,'PA_DANNY_AM_GD','LSSW x DANNY OCÉANO Babylon G’','grande','azul marino','En más de 5 colorways',300),(16,'PA_DANNY_CF_CH','LSSW x DANNY OCÉANO Babylon G’','chica','café','En más de 5 colorways',300),(17,'PA_DANNY_CF_MD','LSSW x DANNY OCÉANO Babylon G’','mediana','café','En más de 5 colorways',300),(18,'PA_DANNY_CF_GD','LSSW x DANNY OCÉANO Babylon G’','grande','café','En más de 5 colorways',300),(19,'PA_HARRY_BL_CH','HARRY EN GUANATOS','chica','blanco','“It was given to me on my last visit to the VFG arena, now I don\'t take it off. I love you my watermelonas” ‑Styles, Harry (2022)',300),(20,'PA_HARRY_BL_MD','HARRY EN GUANATOS','mediana','blanco','“It was given to me on my last visit to the VFG arena, now I don\'t take it off. I love you my watermelonas” ‑Styles, Harry (2022)',300),(21,'PA_HARRY_BL_GD','HARRY EN GUANATOS','grande','blanco','“It was given to me on my last visit to the VFG arena, now I don\'t take it off. I love you my watermelonas” ‑Styles, Harry (2022)',300),(22,'PA_BELLA_BG_CH','LAS DEL BELLAKEO','chica','beige','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(23,'PA_BELLA_BG_MD','LAS DEL BELLAKEO','mediana','beige','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(24,'PA_BELLA_BG_GD','LAS DEL BELLAKEO','grande','beige','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(25,'PA_BELLA_AR_CH','LAS DEL BELLAKEO','chica','azul rey','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(26,'PA_BELLA_AR_MD','LAS DEL BELLAKEO','mediana','azul rey','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(27,'PA_BELLA_AR_CH','LAS DEL BELLAKEO','grande','azul rey','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(28,'PA_BELLA_AM_MD','LAS DEL BELLAKEO','chica','azul marino','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(29,'PA_BELLA_AM_GD','LAS DEL BELLAKEO','mediana','azul marino','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350),(30,'PA_BELLA_AM_GD','LAS DEL BELLAKEO','grande','azul marino','¿Sabias que Dandy Yankee fue maestro en la facultad del perreo en PR? Tuvo alumnos muy destacados, Austin “la maravilla” Jóse, Benito Martinez, entre otros',350);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol_usuario`
--

DROP TABLE IF EXISTS `rol_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rol_usuario` (
  `id_rol` int unsigned NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(100) NOT NULL,
  PRIMARY KEY (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol_usuario`
--

LOCK TABLES `rol_usuario` WRITE;
/*!40000 ALTER TABLE `rol_usuario` DISABLE KEYS */;
INSERT INTO `rol_usuario` VALUES (1,'usuario_general'),(2,'usuario_administrador');
/*!40000 ALTER TABLE `rol_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `id_usuario` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre_completo` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `contraseña` varchar(45) NOT NULL,
  `rol_usuario_id_rol` int unsigned NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_rol_usuario1_idx` (`rol_usuario_id_rol`),
  CONSTRAINT `fk_usuario_rol_usuario1` FOREIGN KEY (`rol_usuario_id_rol`) REFERENCES `rol_usuario` (`id_rol`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Leonardo Daniel Miranda Ibarra','leonardmiranda99@gmail.com','vaqueros',1),(2,'Manuel Alejandro Galván Jáuregui','manuelsk150@gmail.com','elenanitodelbosque',1),(3,'Miriam Gudalupe Salgado García','miriam.slgd@gmail.com','elratonvaquero',1),(4,'Marcos Abel Mar Baza','Marcos_abel0810@outlook.com','GenerationMexico',1),(5,'Pavel Oswaldo Olage Gallegos ','paveloswaldo.gallegos@gmail.com','sopademacaco777',1),(6,'Jose Alberto Frausto Bernal ','josealberto.fb15@gmail.com','68cLJy&7@ia$',1),(7,'Jose Stephano Gomez Ilizaliturri','stephanogm@gmail.com','Alitas@23',1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-26 17:17:43

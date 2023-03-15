-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: dbecommerce_video_game
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
-- Table structure for table `tb_cartao`
--

DROP TABLE IF EXISTS `tb_cartao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cartao` (
  `id_card` int NOT NULL AUTO_INCREMENT,
  `cli_id` int DEFAULT NULL,
  `bandeira_cartao` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nome_impresso` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_seguranca` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_card`),
  KEY `cli_id` (`cli_id`),
  CONSTRAINT `tb_cartao_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `tb_cliente` (`id_cli`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cartao`
--

LOCK TABLES `tb_cartao` WRITE;
/*!40000 ALTER TABLE `tb_cartao` DISABLE KEYS */;
INSERT INTO `tb_cartao` VALUES (22,1,'1','4554 8888 6969 8778','Eduardo Borges','789','2021-09-27 00:53:13'),(23,1,'2','6556 1221 3322 5225','Maria Aparecida','999','2021-09-27 00:53:36'),(42,1,'1','8774 8888 9999 6666','Eduardo Borges','789','2021-10-19 23:13:30'),(44,1,'4','4554 4566 9658 8774','Julia Farias','655','2021-11-21 00:23:38');
/*!40000 ALTER TABLE `tb_cartao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_categoria_produto`
--

DROP TABLE IF EXISTS `tb_categoria_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_categoria_produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_categoria_produto`
--

LOCK TABLES `tb_categoria_produto` WRITE;
/*!40000 ALTER TABLE `tb_categoria_produto` DISABLE KEYS */;
INSERT INTO `tb_categoria_produto` VALUES (1,'Jogos Playstation'),(2,'Jogos Xbox'),(3,'Jogos Nintendo');
/*!40000 ALTER TABLE `tb_categoria_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cliente`
--

DROP TABLE IF EXISTS `tb_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cliente` (
  `id_cli` int NOT NULL AUTO_INCREMENT,
  `end_id` int DEFAULT NULL,
  `nome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sobrenome` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_nascimento` date DEFAULT NULL,
  `genero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_tipo_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_codigo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `doc_validade` date DEFAULT NULL,
  `cli_tipo_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_telefone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `confirmacaoSenha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_cli`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cliente`
--

LOCK TABLES `tb_cliente` WRITE;
/*!40000 ALTER TABLE `tb_cliente` DISABLE KEYS */;
INSERT INTO `tb_cliente` VALUES (1,1,'Eduardo','Boges','2000-04-03','F','1','45654555','2020-03-03','1','Celular','11975807974','2021-09-25 23:08:08','eduborges53@gmail.com','Eduardo Borges','32a373897dc940093fa7b1ce1cba40d3a2bedac394a98761b697683aa4de5c99777e12731b4c3141657bbd521cbd837031007fdc6d2e1bc2217173513983024d','32a373897dc940093fa7b1ce1cba40d3a2bedac394a98761b697683aa4de5c99777e12731b4c3141657bbd521cbd837031007fdc6d2e1bc2217173513983024d'),(2,38,'Larissaa','Quinto','2021-11-03','F','1','123464444','2021-11-08','1','Celular','11975807974','2021-11-04 23:50:21','larissaborges@gmail.com','larissa','7220a4f8a3ffbc211449e84dc670ab9e9421021d3d93dbfcdb3c2cc3e2012d3b0932b2549b786f08d4af143bdfac10e97f106c106b80dfa989433336710998f8','7220a4f8a3ffbc211449e84dc670ab9e9421021d3d93dbfcdb3c2cc3e2012d3b0932b2549b786f08d4af143bdfac10e97f106c106b80dfa989433336710998f8');
/*!40000 ALTER TABLE `tb_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cupom`
--

DROP TABLE IF EXISTS `tb_cupom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cupom` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCliente` int DEFAULT NULL,
  `nomeCupom` varchar(255) NOT NULL,
  `valor` double NOT NULL,
  `dataExpiracao` date DEFAULT NULL,
  `ativo` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cupom`
--

LOCK TABLES `tb_cupom` WRITE;
/*!40000 ALTER TABLE `tb_cupom` DISABLE KEYS */;
INSERT INTO `tb_cupom` VALUES (2,1,'promocao50',50,NULL,'0'),(21,1,'troca300.0',300,NULL,'0'),(22,1,'troca200',200,NULL,'0'),(23,2,'troca100',100,NULL,'1'),(25,1,'troca60.0',60,NULL,'1'),(34,1,'troca200.0',200,NULL,'0'),(35,1,'troca200.0',200,NULL,'0'),(36,1,'troca200.0',200,NULL,'0'),(37,1,'troca200.0',200,NULL,'0'),(38,1,'troca200.0',200,NULL,'0'),(39,1,'troca200.0',200,NULL,'0'),(40,1,'troca200.0',200,NULL,'0'),(41,1,'troca100.0',100,NULL,'0'),(42,1,'troca100.0',100,NULL,'0');
/*!40000 ALTER TABLE `tb_cupom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `id_end` int NOT NULL AUTO_INCREMENT,
  `cli_id` int DEFAULT NULL,
  `cidade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `nome_endereco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_residencia` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_rua` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pais` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo_endereco_compra` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_end`),
  KEY `cli_id` (`cli_id`),
  CONSTRAINT `tb_endereco_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `tb_cliente` (`id_cli`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
INSERT INTO `tb_endereco` VALUES (1,1,'Mogi das Cruzes','24','Mogi das Cruzes','43','Rua Ernesto Rodrigues Cardoso n','08738-160','2021-09-25 23:08:09','Rua Ernesto Rodrigues Cardoso  433','Apartamento','Rua','1','Adm',NULL),(2,1,'Suzano',NULL,'Jardim Ivete','43','Rua Ernesto Rodrigues Cardoso n','08738-160','2021-09-25 23:08:46','Casa ','Casa','Rua',NULL,'Nenhuma','Entrega'),(14,1,'Mogi das Cruzes','24','sdf','254','Kikutaro Suzuki','08738-040','2021-09-26 01:47:21','Eduardo Borges','Casa','Rua',NULL,'Nenhuma','Entrega'),(36,1,'Jardim das Flores',NULL,'Centro','43','Rua das Couves','08738040','2021-10-19 23:13:19','Casa Primos Distantes','Casa','Rua',NULL,'Casa Arrumada','Entrega'),(37,1,'Mogi das Cruzes',NULL,'Teste2','43','Rua Ernesto Rodrigues Cardoso n','08738-160','2021-11-04 23:36:10','Rodrigo Borges','Apartamento','Travessa',NULL,'testeObservacao2','Cobranca'),(38,2,'Mogi das Cruzes',NULL,'Mogi das Cruuzes','43','Rua Ernesto Rodrigues Cardoso n','08738-160','2021-11-04 23:50:21','Sobrado','Sobrado','Rua',NULL,'Adm',NULL),(39,1,'Jardim das Flores','7','Centro','43','Rua das Couves','08738040','2021-11-07 22:57:49','Casa Primos','Casa','Rua',NULL,'Casa Arrumada','Entrega');
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_estoque`
--

DROP TABLE IF EXISTS `tb_estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_estoque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idProduto` int NOT NULL,
  `quantidade` int NOT NULL,
  `precoCusto` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_estoque`
--

LOCK TABLES `tb_estoque` WRITE;
/*!40000 ALTER TABLE `tb_estoque` DISABLE KEYS */;
INSERT INTO `tb_estoque` VALUES (1,1,61,100),(2,2,62,150),(3,3,60,200),(4,4,60,50),(5,5,50,60),(6,6,81,160),(7,7,85,170),(8,8,57,180),(9,9,58,190),(10,10,50,180),(11,12,60,200);
/*!40000 ALTER TABLE `tb_estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_item_pedido`
--

DROP TABLE IF EXISTS `tb_item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_item_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `idProduto` int NOT NULL,
  `qtd` int NOT NULL,
  `precoUnico` double NOT NULL,
  `troca` int DEFAULT NULL,
  `qtdParaTroca` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=389 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_item_pedido`
--

LOCK TABLES `tb_item_pedido` WRITE;
/*!40000 ALTER TABLE `tb_item_pedido` DISABLE KEYS */;
INSERT INTO `tb_item_pedido` VALUES (234,90,1,7,100,1,NULL),(235,90,2,9,150,NULL,NULL),(237,91,1,7,100,0,NULL),(238,91,7,9,170,0,NULL),(239,92,1,7,100,2,NULL),(240,92,7,9,170,2,NULL),(241,93,1,2,100,NULL,NULL),(242,94,2,2,150,NULL,NULL),(243,95,3,2,200,NULL,NULL),(244,96,7,1,170,NULL,NULL),(245,97,4,2,50,NULL,NULL),(246,98,6,2,160,NULL,NULL),(247,98,7,2,170,NULL,NULL),(248,99,7,2,170,NULL,NULL),(249,100,5,3,60,1,1),(250,100,1,3,100,NULL,NULL),(251,100,9,3,190,NULL,NULL),(252,101,6,2,160,NULL,NULL),(253,101,2,3,150,1,2),(254,102,3,3,200,NULL,NULL),(255,103,8,4,180,NULL,NULL),(256,104,7,3,170,NULL,NULL),(257,105,6,3,160,NULL,NULL),(258,106,5,2,60,NULL,NULL),(259,107,2,3,150,NULL,NULL),(260,108,4,2,50,2,NULL),(261,108,1,1,100,2,NULL),(262,109,9,1,190,NULL,NULL),(263,110,8,9,180,NULL,NULL),(264,111,7,1,170,NULL,NULL),(265,112,7,3,170,NULL,NULL),(266,113,6,3,160,NULL,NULL),(267,114,8,2,180,NULL,NULL),(268,115,3,9,200,NULL,NULL),(269,116,2,2,150,1,NULL),(270,117,9,1,190,NULL,NULL),(271,118,1,7,100,0,NULL),(272,118,2,9,150,0,NULL),(274,119,1,7,100,NULL,NULL),(275,119,2,9,150,NULL,NULL),(277,120,1,7,100,1,2),(278,120,2,9,150,0,0),(280,121,1,7,100,1,2),(281,121,2,9,150,NULL,NULL),(283,122,1,7,100,1,2),(284,122,2,9,150,NULL,NULL),(286,123,1,7,100,NULL,NULL),(287,123,7,9,170,NULL,NULL),(288,124,1,7,100,2,NULL),(289,124,7,9,170,2,NULL),(290,125,1,7,100,2,NULL),(291,125,7,9,170,2,NULL),(292,126,1,3,100,NULL,NULL),(293,127,1,7,100,1,2),(294,127,2,9,150,NULL,NULL),(296,128,1,7,100,2,NULL),(297,128,7,9,170,2,NULL),(298,129,1,7,100,1,2),(299,129,2,9,150,NULL,NULL),(301,130,5,3,60,NULL,NULL),(302,130,6,13,160,NULL,NULL),(303,131,2,4,150,NULL,NULL),(304,132,3,5,200,NULL,NULL),(305,133,4,2,50,NULL,NULL),(306,134,1,7,100,1,2),(307,134,2,9,150,NULL,NULL),(309,135,1,7,100,NULL,NULL),(310,135,2,9,150,NULL,NULL),(312,136,1,7,100,1,2),(313,136,2,9,150,NULL,NULL),(315,137,1,7,100,1,2),(316,137,2,9,150,NULL,NULL),(318,138,1,7,100,1,2),(319,138,2,9,150,NULL,NULL),(321,139,5,13,60,NULL,NULL),(322,140,1,1,100,NULL,NULL),(323,140,2,3,150,NULL,NULL),(324,140,7,3,170,NULL,NULL),(325,140,1,5,100,NULL,NULL),(326,140,2,3,150,NULL,NULL),(327,141,1,7,100,NULL,NULL),(328,141,2,1,150,NULL,NULL),(329,141,7,3,170,NULL,NULL),(330,142,1,7,100,NULL,NULL),(331,142,2,11,150,NULL,NULL),(333,143,1,7,100,1,2),(334,143,2,9,150,NULL,NULL),(336,144,1,7,100,NULL,NULL),(337,144,2,1,150,NULL,NULL),(338,144,7,3,170,NULL,NULL),(351,145,1,9,100,NULL,NULL),(352,145,2,9,150,NULL,NULL),(354,146,1,9,100,NULL,NULL),(355,146,2,9,150,NULL,NULL),(357,147,1,7,100,1,2),(358,147,2,9,150,NULL,NULL),(360,148,1,9,100,1,1),(361,148,2,9,150,NULL,NULL),(363,149,1,2,100,NULL,NULL),(365,150,1,7,100,1,2),(366,150,2,9,150,NULL,NULL),(368,151,1,9,100,NULL,NULL),(369,151,2,9,150,NULL,NULL),(371,152,1,7,100,NULL,NULL),(372,152,2,9,150,NULL,NULL),(374,153,1,7,100,1,1),(375,153,2,9,150,NULL,NULL),(377,154,1,9,100,NULL,NULL),(378,154,7,9,170,NULL,NULL),(379,155,1,5,100,NULL,NULL),(382,156,6,1,160,NULL,NULL),(383,157,1,7,100,1,1),(384,157,2,9,150,NULL,NULL),(386,158,1,9,100,NULL,NULL),(387,158,2,9,150,NULL,NULL);
/*!40000 ALTER TABLE `tb_item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idPedido` int NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=134 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
INSERT INTO `tb_pagamento` VALUES (65,90,NULL),(66,91,NULL),(67,92,NULL),(68,93,NULL),(69,94,NULL),(70,95,NULL),(71,96,NULL),(72,97,NULL),(73,98,NULL),(74,99,NULL),(75,100,NULL),(76,101,NULL),(77,102,NULL),(78,103,NULL),(79,104,NULL),(80,105,NULL),(81,106,NULL),(82,107,NULL),(83,108,NULL),(84,109,NULL),(85,110,NULL),(86,111,NULL),(87,112,NULL),(88,113,NULL),(89,114,NULL),(90,115,NULL),(91,116,NULL),(92,117,NULL),(93,118,NULL),(94,119,NULL),(95,120,NULL),(96,121,NULL),(97,122,NULL),(98,123,NULL),(99,124,NULL),(100,125,NULL),(101,126,NULL),(102,127,NULL),(103,128,NULL),(104,129,NULL),(105,130,NULL),(106,131,NULL),(107,132,NULL),(108,133,NULL),(109,134,NULL),(110,135,NULL),(111,136,NULL),(112,137,NULL),(113,138,NULL),(114,139,NULL),(115,140,NULL),(116,141,NULL),(117,142,NULL),(118,143,NULL),(119,144,NULL),(120,145,NULL),(121,146,NULL),(122,147,NULL),(123,148,NULL),(124,149,NULL),(125,150,NULL),(126,151,NULL),(127,152,NULL),(128,153,NULL),(129,154,NULL),(130,155,NULL),(131,156,NULL),(132,157,NULL),(133,158,NULL);
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido`
--

DROP TABLE IF EXISTS `tb_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idStatus` int DEFAULT NULL,
  `idCliente` int DEFAULT NULL,
  `idEndereco` int DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `precoTotal` double DEFAULT NULL,
  `desconto` double DEFAULT NULL,
  `frete` double DEFAULT NULL,
  `troca` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido`
--

LOCK TABLES `tb_pedido` WRITE;
/*!40000 ALTER TABLE `tb_pedido` DISABLE KEYS */;
INSERT INTO `tb_pedido` VALUES (90,11,1,2,'2021-10-16 23:17:19',2050,50,100,1),(91,7,1,2,'2021-10-18 23:20:41',2230,0,100,0),(92,11,1,2,'2021-10-19 23:24:29',2230,0,100,2),(93,1,1,2,'2021-10-28 23:42:46',200,0,100,NULL),(94,1,1,36,'2021-10-28 23:43:07',300,0,100,NULL),(95,1,1,14,'2021-10-28 23:43:26',400,0,50,NULL),(96,1,1,2,'2021-10-28 23:43:45',170,0,100,NULL),(97,1,1,14,'2021-10-22 00:08:13',100,0,50,NULL),(98,1,1,36,'2021-10-21 00:20:21',660,0,100,NULL),(99,1,1,14,'2021-10-20 00:21:04',340,0,50,NULL),(100,10,1,36,'2021-10-08 00:11:57',1050,0,100,1),(101,10,1,36,'2021-10-06 00:11:15',770,0,100,1),(102,2,1,36,'2021-10-11 00:12:26',600,0,100,NULL),(103,1,1,36,'2021-10-16 00:23:30',720,0,100,NULL),(104,1,1,14,'2021-10-15 00:23:57',510,0,50,NULL),(105,1,1,36,'2021-10-14 00:26:04',480,0,100,NULL),(106,1,1,36,'2021-10-13 00:26:26',120,0,100,NULL),(107,1,1,14,'2021-10-12 00:26:59',450,0,50,NULL),(108,10,1,36,'2021-10-04 00:14:53',200,0,100,2),(109,1,1,2,'2021-10-10 00:28:40',190,0,100,NULL),(110,1,1,2,'2021-10-09 00:34:12',1620,0,100,NULL),(111,1,1,36,'2021-10-08 00:35:49',170,0,100,NULL),(112,1,1,14,'2021-10-07 00:36:56',510,0,50,NULL),(113,1,1,36,'2021-10-05 03:56:09',480,0,100,NULL),(114,1,1,14,'2021-10-04 04:06:14',360,0,50,NULL),(115,1,1,14,'2021-10-03 04:07:48',1800,700,50,NULL),(116,11,1,2,'2021-10-02 04:14:08',300,0,100,1),(117,1,1,14,'2021-10-01 04:14:51',190,0,50,NULL),(118,7,1,2,'2021-10-02 23:32:02',2050,50,100,0),(119,1,1,2,'2021-10-16 22:10:06',2050,0,100,NULL),(120,11,1,2,'2021-10-16 22:16:34',2050,50,100,1),(121,11,1,2,'2021-10-15 23:48:41',2050,50,100,1),(122,11,1,2,'2021-10-16 00:09:39',2050,50,100,1),(123,1,1,2,'2021-10-16 00:20:06',2230,0,100,NULL),(124,11,1,2,'2021-10-12 00:24:07',2230,0,100,2),(125,11,1,2,'2021-10-10 00:32:51',2230,0,100,2),(126,2,1,36,'2021-10-10 00:38:55',300,0,100,NULL),(127,11,1,2,'2020-11-23 00:53:14',2050,50,100,1),(128,11,1,2,'2020-11-09 01:00:01',2230,0,100,2),(129,11,1,2,'2020-10-09 23:12:26',2050,50,100,1),(130,1,1,14,'2020-12-19 01:20:38',2260,500,50,NULL),(131,3,1,36,'2020-11-20 23:40:36',600,200,100,NULL),(132,1,1,39,'2020-10-11 00:11:25',1000,0,100,NULL),(133,1,1,36,'2020-10-02 00:24:15',100,180,100,NULL),(134,11,1,2,'2021-10-21 02:51:23',2050,0,100,1),(135,1,1,2,'2021-09-21 02:54:53',2050,0,100,NULL),(136,6,1,2,'2021-08-21 03:06:52',2050,0,100,1),(137,10,1,2,'2021-06-21 03:11:06',2050,0,100,1),(138,11,1,2,'2021-05-21 03:16:57',2050,0,100,1),(139,2,1,14,'2021-04-21 03:21:18',780,400,50,NULL),(140,1,1,39,'2021-04-11 03:58:03',2010,0,100,NULL),(141,1,1,2,'2021-02-21 04:00:17',1360,0,100,NULL),(142,1,1,2,'2021-02-21 04:02:08',2350,260,100,NULL),(143,11,1,2,'2021-02-21 04:05:42',2050,0,100,1),(144,1,1,2,'2020-11-21 04:09:33',1360,0,100,NULL),(145,1,1,2,'2020-11-21 04:12:54',2250,260,100,NULL),(146,1,1,2,'2020-11-02 04:22:49',2250,0,100,NULL),(147,11,1,2,'2021-01-17 04:24:52',2050,0,100,1),(148,6,1,2,'2021-01-11 04:28:47',2250,260,100,1),(149,1,1,36,'2021-01-21 20:23:34',200,0,100,NULL),(150,11,1,2,'2021-11-21 23:14:27',2050,0,100,1),(151,5,1,2,'2021-04-11 23:18:28',2250,260,100,NULL),(152,1,1,2,'2021-04-10 23:22:20',2050,0,100,NULL),(153,11,1,2,'2021-11-21 23:24:29',2050,0,100,1),(154,1,1,14,'2021-11-21 23:28:26',2430,0,50,NULL),(155,1,1,14,'2021-02-02 23:30:54',500,100,50,NULL),(156,1,1,39,'2021-02-03 23:32:50',160,0,100,NULL),(157,11,1,2,'2021-02-15 23:35:28',2050,0,100,1),(158,5,1,2,'2021-11-21 23:39:28',2250,160,100,NULL);
/*!40000 ALTER TABLE `tb_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pedido_status`
--

DROP TABLE IF EXISTS `tb_pedido_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pedido_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pedido_status`
--

LOCK TABLES `tb_pedido_status` WRITE;
/*!40000 ALTER TABLE `tb_pedido_status` DISABLE KEYS */;
INSERT INTO `tb_pedido_status` VALUES (1,'EM PROCESSAMENTO'),(2,'PAGAMENTO REALIZADO'),(3,'ENVIADO PARA TRANSPORTADORA'),(4,'EM TRANSPORTE'),(5,'ENTREGUE'),(6,'TROCA SOLICITADA'),(7,'TROCA RECUSADA'),(8,'TROCA ACEITA'),(9,'PRODUTO ENVIADO PARA TROCA/CANCELAMENTO'),(10,'PRODUTO RECEBIDO PARA TROCA/CANCELAMENTO'),(11,'TROCA / CANCELAMENTO REALIZADO');
/*!40000 ALTER TABLE `tb_pedido_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_prestacao`
--

DROP TABLE IF EXISTS `tb_prestacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_prestacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `idCartao` int NOT NULL,
  `idPagamento` int NOT NULL,
  `valor` double DEFAULT NULL,
  `qtd` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=239 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_prestacao`
--

LOCK TABLES `tb_prestacao` WRITE;
/*!40000 ALTER TABLE `tb_prestacao` DISABLE KEYS */;
INSERT INTO `tb_prestacao` VALUES (130,22,65,2000,2),(131,23,65,100,3),(132,22,66,2000,2),(133,23,66,330,3),(134,22,67,2000,2),(135,23,67,330,3),(136,22,68,300,1),(137,42,69,400,1),(138,23,70,450,1),(139,23,71,270,1),(140,23,72,150,1),(141,22,73,760,1),(142,23,74,340,1),(143,22,74,50,1),(144,23,75,1150,1),(145,42,76,870,1),(146,42,77,700,1),(147,22,78,820,1),(148,42,79,560,1),(149,22,80,580,1),(150,42,81,220,1),(151,22,82,500,1),(152,22,83,300,1),(153,22,84,190,1),(154,23,84,100,1),(155,23,85,1720,1),(156,42,86,270,1),(157,42,87,560,1),(158,23,88,580,1),(159,42,89,410,1),(160,23,90,1150,1),(161,23,91,400,1),(162,22,92,240,1),(163,22,93,2000,2),(164,23,93,100,3),(165,22,94,2150,1),(166,22,95,2000,2),(167,23,95,100,3),(168,22,96,2000,2),(169,23,96,100,3),(170,22,97,2000,2),(171,23,97,100,3),(172,22,98,2000,2),(173,23,98,330,3),(174,22,99,2000,2),(175,23,99,330,3),(176,22,100,2000,2),(177,23,100,330,3),(178,23,101,400,1),(179,22,102,2000,2),(180,23,102,100,3),(181,22,103,2000,2),(182,23,103,330,3),(183,22,104,2000,2),(184,23,104,100,3),(185,23,105,1810,1),(186,22,106,401,1),(187,23,106,99,1),(188,22,107,600,1),(189,23,107,101,1),(190,42,107,200,1),(191,44,107,199,1),(192,22,108,20,1),(193,22,109,2000,2),(194,23,109,100,3),(195,42,109,50,1),(196,22,110,2000,2),(197,23,110,150,3),(198,22,111,2000,2),(199,23,111,150,3),(200,22,112,2000,2),(201,23,112,150,3),(202,22,113,2000,2),(203,23,113,150,3),(204,22,114,430,1),(205,22,115,2110,1),(206,22,116,1360,1),(207,44,116,100,1),(208,22,117,2000,2),(209,23,117,150,3),(210,42,117,40,1),(211,22,118,2000,2),(212,23,118,150,3),(213,22,119,1460,1),(214,22,120,2000,2),(215,23,120,90,1),(216,22,121,2000,2),(217,23,121,350,1),(218,22,122,2000,2),(219,23,122,150,3),(220,22,123,2000,2),(221,23,123,90,3),(222,22,124,300,1),(223,22,125,2000,2),(224,23,125,150,3),(225,22,126,2000,2),(226,23,126,90,3),(227,22,127,2000,2),(228,23,127,150,3),(229,22,128,2000,2),(230,23,128,150,3),(231,22,129,2480,1),(232,42,130,100,1),(233,23,130,350,1),(234,23,131,260,1),(235,22,132,2000,2),(236,23,132,150,3),(237,22,133,2000,2),(238,23,133,190,3);
/*!40000 ALTER TABLE `tb_prestacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_produto`
--

DROP TABLE IF EXISTS `tb_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_produto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ativo` int NOT NULL,
  `idCategoriaProduto` int NOT NULL,
  `grupoPrecificacao` varchar(255) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `fabricante` varchar(255) DEFAULT NULL,
  `fornecedor` varchar(255) DEFAULT NULL,
  `codigo_barras` varchar(255) DEFAULT NULL,
  `motivoAtivacao` varchar(255) DEFAULT NULL,
  `motivoInativacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_produto`
--

LOCK TABLES `tb_produto` WRITE;
/*!40000 ALTER TABLE `tb_produto` DISABLE KEYS */;
INSERT INTO `tb_produto` VALUES (1,'FIFA 22','Jogo de Futebol',1,1,'Grupo A','https://www.ecompletocdn.com.br/i/fp/2280/1213193_1_1626870022.jpg','Sony','Jogos Enterprise','1234567880',NULL,NULL),(2,'PES 21','Jogo de Futebol',1,2,'Grupo A','https://http2.mlstatic.com/D_NQ_NP_699381-MLA47091558439_082021-W.jpg','Microsoft','Jogos Enterprise','5824568450',NULL,NULL),(3,'Forza 5','Jogo de Corrida',1,2,'Grupo A','https://cdn-products.eneba.com/resized-products/x6qHS7ovIsIYELf6sQkdelZTX049pRGT3kOeELjseOk_350x200_3x-0.jpeg','Microsoft','Jogos Enterprise','6547896324',NULL,NULL),(4,'Good of War','Jogo de Guerra',1,1,'Grupo A','https://images-na.ssl-images-amazon.com/images/I/51kF00OxGwL._SX258_BO1,204,203,200_.jpg','Sony','Jogos Enterprise','6589587455',NULL,NULL),(5,'Need For Speed','Jogo de Corrida',1,1,'Grupo A','https://http2.mlstatic.com/D_NQ_NP_472221-MLB20729488643_052016-O.jpg','Sony','Jogos Enterprise','4569877455',NULL,NULL),(6,'Tony Hawk','Jogo de Skate',1,1,'Grupo A','https://http2.mlstatic.com/D_NQ_NP_762455-MLB40854501497_022020-O.jpg','Sony','Jogos Enterprise','9685744444',NULL,NULL),(7,'Naruto Storm 4 ','Jogo de Luta',1,3,'Grupo A','https://m.media-amazon.com/images/I/818BUphLYOL._AC_SL1500_.jpg','Nintendo','Jogos Enterprise','6547896585',NULL,NULL),(8,'Mortal Kombat','Jogo de Luta',1,3,'Grupo A','https://i.pinimg.com/736x/4c/7d/7b/4c7d7b08a9db2cd014f612b300f282e3.jpg','Nintendo','Jogos Enterprise','1236548854',NULL,NULL),(9,'Halo 3','Jogo de Guerra',1,2,'Grupo A','https://bdjogos.com.br/capas/4340-halo-3-xbox-360-capa-1.jpg','Microsoft','Jogos Enterprise','6598733344',NULL,NULL),(10,'Hitman','Jogo de Estraégia',1,1,'Grupo B','https://http2.mlstatic.com/D_NQ_NP_835578-MLB26844708562_022018-O.jpg','Sony','Jogos Enterprise','2234567880','teste',''),(12,'Mario Kart','Jogo de Corrida',0,3,'Grupo C','https://m.media-amazon.com/images/I/813Bch9fMhL._AC_SX385_.jpg','Nintendo','Jogos Enterprise','2234467880','','teste');
/*!40000 ALTER TABLE `tb_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_cliente`
--

DROP TABLE IF EXISTS `tb_tipo_cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_cliente` (
  `id_tipo_cli` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_tipo_cli`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_cliente`
--

LOCK TABLES `tb_tipo_cliente` WRITE;
/*!40000 ALTER TABLE `tb_tipo_cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_tipo_documento`
--

DROP TABLE IF EXISTS `tb_tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_tipo_documento` (
  `id_doc` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `descricao` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dt_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_tipo_documento`
--

LOCK TABLES `tb_tipo_documento` WRITE;
/*!40000 ALTER TABLE `tb_tipo_documento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-21 20:48:02

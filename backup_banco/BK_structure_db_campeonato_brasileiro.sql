CREATE DATABASE  IF NOT EXISTS `campeonato_brasileiro` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `campeonato_brasileiro`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: campeonato_brasileiro
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Temporary view structure for view `artilharia_vw`
--

DROP TABLE IF EXISTS `artilharia_vw`;
/*!50001 DROP VIEW IF EXISTS `artilharia_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `artilharia_vw` AS SELECT 
 1 AS `nome_jogador`,
 1 AS `sobrenome_jogador`,
 1 AS `time`,
 1 AS `posicao`,
 1 AS `qnt_gols`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `atuacao`
--

DROP TABLE IF EXISTS `atuacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atuacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qnt_gols` int DEFAULT '0',
  `qnt_assistencias` int DEFAULT '0',
  `qnt_defesas` int DEFAULT '0',
  `qnt_cart_amar` int DEFAULT '0',
  `qnt_cart_verm` int DEFAULT '0',
  `titular` tinyint(1) NOT NULL DEFAULT '0',
  `substituido` tinyint(1) NOT NULL DEFAULT '0',
  `tempo_atuacao` int NOT NULL,
  `jogador_id` int NOT NULL,
  `partida_id` int NOT NULL,
  `clube_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_atuacao_jogador` (`jogador_id`),
  KEY `fk_atuacao_partida` (`partida_id`),
  KEY `fk_atuacao_clube` (`clube_id`),
  CONSTRAINT `fk_atuacao_clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`),
  CONSTRAINT `fk_atuacao_jogador` FOREIGN KEY (`jogador_id`) REFERENCES `jogador` (`id`),
  CONSTRAINT `fk_atuacao_partida` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_atuacao` AFTER INSERT ON `atuacao` FOR EACH ROW INSERT INTO log_atuacao (atuacao_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_atuacao` BEFORE UPDATE ON `atuacao` FOR EACH ROW INSERT INTO log_atuacao (atuacao_id, qnt_gols_antigo, qnt_assistencias_antigo, qnt_defesas_antigo, qnt_cart_amar_antigo, qnt_cart_verm_antigo, titular_antigo, substituido_antigo, tempo_atuacao_antigo, jogador_id_antigo, partida_id_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols, OLD.qnt_assistencias, OLD.qnt_defesas, OLD.qnt_cart_amar, OLD.qnt_cart_verm, OLD.titular, OLD.substituido, OLD.tempo_atuacao, OLD.jogador_id, OLD.partida_id, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_atuacao` AFTER DELETE ON `atuacao` FOR EACH ROW INSERT INTO log_atuacao (atuacao_id, qnt_gols_antigo, qnt_assistencias_antigo, qnt_defesas_antigo, qnt_cart_amar_antigo, qnt_cart_verm_antigo, titular_antigo, substituido_antigo, tempo_atuacao_antigo, jogador_id_antigo, partida_id_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols, OLD.qnt_assistencias, OLD.qnt_defesas, OLD.qnt_cart_amar, OLD.qnt_cart_verm, OLD.titular, OLD.substituido, OLD.tempo_atuacao, OLD.jogador_id, OLD.partida_id, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `atuacao_vw`
--

DROP TABLE IF EXISTS `atuacao_vw`;
/*!50001 DROP VIEW IF EXISTS `atuacao_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `atuacao_vw` AS SELECT 
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `data partida`,
 1 AS `rodada`,
 1 AS `qnt_gols`,
 1 AS `qnt_assistencias`,
 1 AS `qnt_defesas`,
 1 AS `qnt_cart_amar`,
 1 AS `qnt_cart_verm`,
 1 AS `time_mandante`,
 1 AS `time_visitante`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `classificacao`
--

DROP TABLE IF EXISTS `classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classificacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qnt_part_jogadas` int DEFAULT '0',
  `qnt_vitorias` int DEFAULT '0',
  `qnt_derrotas` int DEFAULT '0',
  `qnt_empates` int DEFAULT '0',
  `qnt_gols_marc` int DEFAULT '0',
  `qnt_gols_sofr` int DEFAULT '0',
  `saldo_gols` int DEFAULT '0',
  `perc_aprov` float DEFAULT '0',
  `qnt_pontos` int DEFAULT '0',
  `clube_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_classificacao_clube` (`clube_id`),
  CONSTRAINT `fk_classificacao_clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_classificacao` AFTER INSERT ON `classificacao` FOR EACH ROW INSERT INTO log_classificacao (classificacao_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_classificacao` BEFORE UPDATE ON `classificacao` FOR EACH ROW INSERT INTO log_classificacao (classificacao_id, qnt_part_jogadas_antigo, qnt_vitorias_antigo, qnt_derrotas_antigo, qnt_empates_antigo, qnt_gols_marc_antigo, qnt_gols_sofr_antigo, saldo_gols_antigo, perc_aprov_antigo, qnt_pontos_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_part_jogadas, OLD.qnt_vitorias, OLD.qnt_derrotas, OLD.qnt_empates, OLD.qnt_gols_marc, OLD.qnt_gols_sofr, OLD.saldo_gols, OLD.perc_aprov, OLD.qnt_pontos, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_classificacao` AFTER DELETE ON `classificacao` FOR EACH ROW INSERT INTO log_classificacao (classificacao_id, qnt_part_jogadas_antigo, qnt_vitorias_antigo, qnt_derrotas_antigo, qnt_empates_antigo, qnt_gols_marc_antigo, qnt_gols_sofr_antigo, saldo_gols_antigo, perc_aprov_antigo, qnt_pontos_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_part_jogadas, OLD.qnt_vitorias, OLD.qnt_derrotas, OLD.qnt_empates, OLD.qnt_gols_marc, OLD.qnt_gols_sofr, OLD.saldo_gols, OLD.perc_aprov, OLD.qnt_pontos, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `classificacao_posicao_time_vw`
--

DROP TABLE IF EXISTS `classificacao_posicao_time_vw`;
/*!50001 DROP VIEW IF EXISTS `classificacao_posicao_time_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `classificacao_posicao_time_vw` AS SELECT 
 1 AS `posicao`,
 1 AS `nome`,
 1 AS `qnt_part_jogadas`,
 1 AS `qnt_vitorias`,
 1 AS `qnt_empates`,
 1 AS `qnt_derrotas`,
 1 AS `qnt_gols_marc`,
 1 AS `qnt_gols_sofr`,
 1 AS `saldo_gols`,
 1 AS `perc_aprov`,
 1 AS `qnt_pontos`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `clube`
--

DROP TABLE IF EXISTS `clube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clube` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `uf` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `ano_fund` date NOT NULL,
  `estadio_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_clube_estadio` (`estadio_id`),
  CONSTRAINT `fk_clube_estadio` FOREIGN KEY (`estadio_id`) REFERENCES `estadio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_clube` AFTER INSERT ON `clube` FOR EACH ROW INSERT INTO log_clube (clube_id, acao, date, time, user) 
VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_clube` BEFORE UPDATE ON `clube` FOR EACH ROW INSERT INTO log_clube (clube_id, nome_antigo, cidade_antigo, uf_antigo, ano_fund_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.ano_fund, OLD.estadio_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_clube` AFTER DELETE ON `clube` FOR EACH ROW INSERT INTO log_clube (clube_id, nome_antigo, cidade_antigo, uf_antigo, ano_fund_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.ano_fund, OLD.estadio_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  `cidade` varchar(40) NOT NULL,
  `uf` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') NOT NULL,
  `capacidade` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_estadio` AFTER INSERT ON `estadio` FOR EACH ROW INSERT INTO log_estadio (estadio_id, acao, date, time, user) 
VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_estadio` BEFORE UPDATE ON `estadio` FOR EACH ROW INSERT INTO log_estadio (estadio_id, nome_antigo, cidade_antigo, uf_antigo, capacidade_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.capacidade, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_estadio` AFTER DELETE ON `estadio` FOR EACH ROW INSERT INTO log_estadio (estadio_id, nome_antigo, cidade_antigo, uf_antigo, capacidade_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.nome, OLD.cidade, OLD.uf, OLD.capacidade, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gols`
--

DROP TABLE IF EXISTS `gols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gols` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rodada` int NOT NULL,
  `min_gol` int NOT NULL,
  `tipo_gol` enum('Chute','Cabeça','Pênalti','Falta','Olímpico','Gol Contra') DEFAULT NULL,
  `clube_id` int NOT NULL,
  `jogador_id` int NOT NULL,
  `partida_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_gols_clube` (`clube_id`),
  KEY `fk_gols_jogador` (`jogador_id`),
  KEY `fk_gols_partida` (`partida_id`),
  CONSTRAINT `fk_gols_clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`),
  CONSTRAINT `fk_gols_jogador` FOREIGN KEY (`jogador_id`) REFERENCES `jogador` (`id`),
  CONSTRAINT `fk_gols_partida` FOREIGN KEY (`partida_id`) REFERENCES `partida` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1534 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_inssert_gols` AFTER INSERT ON `gols` FOR EACH ROW INSERT INTO log_gols (gols_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_gols` BEFORE UPDATE ON `gols` FOR EACH ROW INSERT INTO log_gols (gols_id, rodada_antigo, min_gol_antigo, tipo_gol_antigo, clube_id_antigo, jogador_id_antigo, partida_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.rodada, OLD.min_gol, OLD.tipo_gol, OLD.clube_id, OLD.jogador_id, OLD.partida_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_gols` AFTER DELETE ON `gols` FOR EACH ROW INSERT INTO log_gols (gols_id, rodada_antigo, min_gol_antigo, tipo_gol_antigo, clube_id_antigo, jogador_id_antigo, partida_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.rodada, OLD.min_gol, OLD.tipo_gol, OLD.clube_id, OLD.jogador_id, OLD.partida_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `jogador`
--

DROP TABLE IF EXISTS `jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jogador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `dt_nasc` date NOT NULL,
  `nacionalidade` varchar(20) NOT NULL,
  `posicao` enum('Goleiro','Zagueiro','Lateral','Meio de Campo','Atacante') NOT NULL,
  `clube_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_jogador_clube` (`clube_id`),
  CONSTRAINT `fk_jogador_clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_jogador` AFTER INSERT ON `jogador` FOR EACH ROW INSERT INTO log_jogador (jogador_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_jogador` BEFORE UPDATE ON `jogador` FOR EACH ROW INSERT INTO log_jogador (jogador_id ,nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, posicao_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (NEW.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.posicao, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_jogador` AFTER DELETE ON `jogador` FOR EACH ROW INSERT INTO log_jogador (jogador_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, posicao_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.posicao, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `jogador_vw`
--

DROP TABLE IF EXISTS `jogador_vw`;
/*!50001 DROP VIEW IF EXISTS `jogador_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `jogador_vw` AS SELECT 
 1 AS `nome`,
 1 AS `sobrenome`,
 1 AS `dt_nasc`,
 1 AS `nacionalidade`,
 1 AS `posicao`,
 1 AS `clube`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `log_atuacao`
--

DROP TABLE IF EXISTS `log_atuacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_atuacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `atuacao_id` int NOT NULL,
  `qnt_gols_antigo` int DEFAULT NULL,
  `qnt_assistencias_antigo` int DEFAULT NULL,
  `qnt_defesas_antigo` int DEFAULT NULL,
  `qnt_cart_amar_antigo` int DEFAULT NULL,
  `qnt_cart_verm_antigo` int DEFAULT NULL,
  `titular_antigo` tinyint(1) DEFAULT NULL,
  `substituido_antigo` tinyint(1) DEFAULT NULL,
  `tempo_atuacao_antigo` int DEFAULT NULL,
  `jogador_id_antigo` int DEFAULT NULL,
  `partida_id_antigo` int DEFAULT NULL,
  `clube_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_classificacao`
--

DROP TABLE IF EXISTS `log_classificacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_classificacao` (
  `id` int NOT NULL AUTO_INCREMENT,
  `classificacao_id` int NOT NULL,
  `qnt_part_jogadas_antigo` int DEFAULT NULL,
  `qnt_vitorias_antigo` int DEFAULT NULL,
  `qnt_derrotas_antigo` int DEFAULT NULL,
  `qnt_empates_antigo` int DEFAULT NULL,
  `qnt_gols_marc_antigo` int DEFAULT NULL,
  `qnt_gols_sofr_antigo` int DEFAULT NULL,
  `saldo_gols_antigo` int DEFAULT NULL,
  `perc_aprov_antigo` float DEFAULT NULL,
  `qnt_pontos_antigo` int DEFAULT NULL,
  `clube_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_clube`
--

DROP TABLE IF EXISTS `log_clube`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_clube` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clube_id` int NOT NULL,
  `nome_antigo` varchar(40) DEFAULT NULL,
  `cidade_antigo` varchar(40) DEFAULT NULL,
  `uf_antigo` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') DEFAULT NULL,
  `ano_fund_antigo` date DEFAULT NULL,
  `estadio_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_estadio`
--

DROP TABLE IF EXISTS `log_estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_estadio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `estadio_id` int NOT NULL,
  `nome_antigo` varchar(40) DEFAULT NULL,
  `cidade_antigo` varchar(40) DEFAULT NULL,
  `uf_antigo` enum('AC','AL','AP','AM','BA','CE','DF','ES','GO','MA','MT','MS','MG','PA','PB','PR','PE','PI','RJ','RN','RS','RO','RR','SC','SP','SE','TO') DEFAULT NULL,
  `capacidade_antigo` float DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_gols`
--

DROP TABLE IF EXISTS `log_gols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_gols` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gols_id` int NOT NULL,
  `rodada_antigo` int DEFAULT NULL,
  `min_gol_antigo` int DEFAULT NULL,
  `tipo_gol_antigo` enum('Chute','Cabeça','Pênalti','Falta','Olímpico','Gol Contra') DEFAULT NULL,
  `clube_id_antigo` int DEFAULT NULL,
  `jogador_id_antigo` int DEFAULT NULL,
  `partida_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_jogador`
--

DROP TABLE IF EXISTS `log_jogador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_jogador` (
  `id` int NOT NULL AUTO_INCREMENT,
  `jogador_id` int NOT NULL,
  `nome_antigo` varchar(20) DEFAULT NULL,
  `sobrenome_antigo` varchar(20) DEFAULT NULL,
  `dt_nasc_antigo` date DEFAULT NULL,
  `nacionalidade_antigo` varchar(20) DEFAULT NULL,
  `posicao_antigo` enum('Goleiro','Zagueiro','Lateral','Meio de Campo','Atacante') DEFAULT NULL,
  `clube_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_partida`
--

DROP TABLE IF EXISTS `log_partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_partida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `partida_id` int NOT NULL,
  `qnt_gols_man_antigo` int DEFAULT NULL,
  `qnt_gols_visit_antigo` int DEFAULT NULL,
  `data_antigo` datetime DEFAULT NULL,
  `rodada_antigo` int DEFAULT NULL,
  `qnt_puplico_antigo` int DEFAULT NULL,
  `clb_mand_venceu_antigo` tinyint(1) DEFAULT NULL,
  `clb_visit_venceu_antigo` tinyint(1) DEFAULT NULL,
  `empate_antigo` tinyint(1) DEFAULT NULL,
  `clb_mand_id_antigo` int DEFAULT NULL,
  `clb_visit_id_antigo` int DEFAULT NULL,
  `estadio_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `log_tecnico`
--

DROP TABLE IF EXISTS `log_tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_tecnico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tecnico_id` int NOT NULL,
  `nome_antigo` varchar(20) DEFAULT NULL,
  `sobrenome_antigo` varchar(20) DEFAULT NULL,
  `dt_nasc_antigo` date DEFAULT NULL,
  `nacionalidade_antigo` varchar(20) DEFAULT NULL,
  `clube_id_antigo` int DEFAULT NULL,
  `acao` varchar(10) NOT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `user` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `partida`
--

DROP TABLE IF EXISTS `partida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partida` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qnt_gols_man` int DEFAULT '0',
  `qnt_gols_visit` int DEFAULT '0',
  `data` datetime NOT NULL,
  `rodada` int NOT NULL,
  `qnt_puplico` int NOT NULL,
  `clb_mand_venceu` tinyint(1) NOT NULL DEFAULT '0',
  `clb_visit_venceu` tinyint(1) NOT NULL DEFAULT '0',
  `empate` tinyint(1) NOT NULL DEFAULT '0',
  `clb_mand_id` int NOT NULL,
  `clb_visit_id` int NOT NULL,
  `estadio_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_partida_clube_mandante` (`clb_mand_id`),
  KEY `fk_partida_clube_visitante` (`clb_visit_id`),
  KEY `fk_partida_estadio` (`estadio_id`),
  CONSTRAINT `fk_partida_clube_mandante` FOREIGN KEY (`clb_mand_id`) REFERENCES `clube` (`id`),
  CONSTRAINT `fk_partida_clube_visitante` FOREIGN KEY (`clb_visit_id`) REFERENCES `clube` (`id`),
  CONSTRAINT `fk_partida_estadio` FOREIGN KEY (`estadio_id`) REFERENCES `estadio` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=381 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_partida` AFTER INSERT ON `partida` FOR EACH ROW INSERT INTO log_partida (partida_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_partida` BEFORE UPDATE ON `partida` FOR EACH ROW INSERT INTO log_partida (partida_id, qnt_gols_man_antigo, qnt_gols_visit_antigo, data_antigo, rodada_antigo, qnt_puplico_antigo, clb_mand_venceu_antigo, clb_visit_venceu_antigo, empate_antigo, clb_mand_id_antigo, clb_visit_id_antigo, estadio_id_antigo, acao, date, time, user) 
VALUES (OLD.id, OLD.qnt_gols_man, OLD.qnt_gols_visit, OLD.data, OLD.rodada, OLD.qnt_puplico, OLD.clb_mand_venceu, OLD.clb_visit_venceu, OLD.empate, OLD.clb_mand_id, OLD.clb_visit_id, OLD.estadio_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_partida` AFTER DELETE ON `partida` FOR EACH ROW INSERT INTO log_partida (partida_id, qnt_gols_man_antigo, qnt_gols_visit_antigo, data_antigo, rodada_antigo, qnt_puplico_antigo, clb_mand_venceu_antigo, clb_visit_venceu_antigo, empate_antigo, clb_mand_id_antigo, clb_visit_id_antigo, estadio_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.qnt_gols_man, OLD.qnt_gols_visit, OLD.data, OLD.rodada, OLD.qnt_puplico, OLD.clb_mand_venceu, OLD.clb_visit_venceu, OLD.empate, OLD.clb_mand_id, OLD.clb_visit_id, OLD.estadio_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `partida_dia_semana_vw`
--

DROP TABLE IF EXISTS `partida_dia_semana_vw`;
/*!50001 DROP VIEW IF EXISTS `partida_dia_semana_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partida_dia_semana_vw` AS SELECT 
 1 AS `dia_da_semana`,
 1 AS `qnt_jogos`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `partida_vw`
--

DROP TABLE IF EXISTS `partida_vw`;
/*!50001 DROP VIEW IF EXISTS `partida_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `partida_vw` AS SELECT 
 1 AS `clube_mandante`,
 1 AS `clube_visitante`,
 1 AS `qnt_gols_man`,
 1 AS `qnt_gols_visit`,
 1 AS `clb_mand_venceu`,
 1 AS `clb_visit_venceu`,
 1 AS `empate`,
 1 AS `rodada`,
 1 AS `data`,
 1 AS `estadio`,
 1 AS `qnt_puplico`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `patida_clube_id1_vw`
--

DROP TABLE IF EXISTS `patida_clube_id1_vw`;
/*!50001 DROP VIEW IF EXISTS `patida_clube_id1_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `patida_clube_id1_vw` AS SELECT 
 1 AS `clube_mandante`,
 1 AS `clube_visitante`,
 1 AS `qnt_gols_man`,
 1 AS `qnt_gols_visit`,
 1 AS `clb_mand_venceu`,
 1 AS `clb_visit_venceu`,
 1 AS `empate`,
 1 AS `rodada`,
 1 AS `data`,
 1 AS `estadio`,
 1 AS `qnt_puplico`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `publico_vw`
--

DROP TABLE IF EXISTS `publico_vw`;
/*!50001 DROP VIEW IF EXISTS `publico_vw`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `publico_vw` AS SELECT 
 1 AS `rodada`,
 1 AS `clb_mandante`,
 1 AS `clb_visitante`,
 1 AS `nome_estaddio`,
 1 AS `qnt_publico_partida`,
 1 AS `capacidade_estadio`,
 1 AS `percentual_ocupacao`,
 1 AS `media_publico_estadio_campeonato`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tecnico`
--

DROP TABLE IF EXISTS `tecnico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tecnico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(20) NOT NULL,
  `sobrenome` varchar(20) NOT NULL,
  `dt_nasc` date NOT NULL,
  `nacionalidade` varchar(20) NOT NULL,
  `clube_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tecnico_clube` (`clube_id`),
  CONSTRAINT `fk_tecnico_clube` FOREIGN KEY (`clube_id`) REFERENCES `clube` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_insert_tecnico` AFTER INSERT ON `tecnico` FOR EACH ROW INSERT INTO log_tecnico (tecnico_id, acao, date, time, user) 
 VALUES (NEW.id, 'insert', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_update_tecnico` BEFORE UPDATE ON `tecnico` FOR EACH ROW INSERT INTO log_tecnico (tecnico_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.clube_id, 'update', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_delete_tecnico` AFTER DELETE ON `tecnico` FOR EACH ROW INSERT INTO log_tecnico (tecnico_id, nome_antigo, sobrenome_antigo, dt_nasc_antigo, nacionalidade_antigo, clube_id_antigo, acao, date, time, user) 
 VALUES (OLD.id, OLD.nome, OLD.sobrenome, OLD.dt_nasc, OLD.nacionalidade, OLD.clube_id, 'delete', CURDATE(), CURTIME(), USER()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'campeonato_brasileiro'
--

--
-- Dumping routines for database 'campeonato_brasileiro'
--
/*!50003 DROP FUNCTION IF EXISTS `obter_gols_rodada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_gols_rodada`(n_rodada INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT 
	( SELECT SUM(qnt_gols_man) FROM partida where rodada = n_rodada) 
	+ (SELECT SUM(qnt_gols_visit) FROM partida where rodada = n_rodada));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_cartoes_amarelos_partida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_cartoes_amarelos_partida`() RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE qnt_cartoes INT;
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(DISTINCT partida_id) FROM atuacao);
    SET qnt_cartoes = (SELECT obter_qnt_cartoes_amarelos());
	RETURN (qnt_cartoes/qnt_partidas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_cartoes_vermelhos_partida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_cartoes_vermelhos_partida`() RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE qnt_cartoes INT;
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(DISTINCT partida_id) FROM atuacao);
    SET qnt_cartoes = (SELECT obter_qnt_cartoes_vermelhos());
	RETURN (qnt_cartoes/qnt_partidas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_gols_partida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_gols_partida`() RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(*) FROM partida); 
	RETURN ((SELECT obter_total_gols()) / qnt_partidas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_gols_partida_rodada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_gols_partida_rodada`(n_rodada INT) RETURNS float
    DETERMINISTIC
BEGIN
	RETURN ((SELECT obter_gols_rodada(n_rodada)) / (SELECT obter_qnt_partidas_rodada(n_rodada)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_publico_estadio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_publico_estadio`(estadio_id INT) RETURNS float
    DETERMINISTIC
BEGIN
    RETURN (SELECT AVG(partida.qnt_puplico) FROM partida WHERE partida.estadio_id = estadio_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_publico_partida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_publico_partida`() RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE qnt_partidas INT;
    SET qnt_partidas = (SELECT COUNT(*) FROM partida); 
	RETURN ((SELECT obter_total_publico()) / qnt_partidas);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_media_publico_partida_rodada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_media_publico_partida_rodada`(n_rodada INT) RETURNS float
    DETERMINISTIC
BEGIN
	DECLARE qnt_publico_rodada FLOAT;
    SET qnt_publico_rodada = (SELECT SUM(partida.qnt_puplico) FROM partida WHERE rodada= n_rodada);
	RETURN (qnt_publico_rodada / (SELECT obter_qnt_partidas_rodada(n_rodada)));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_nome_clube` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_nome_clube`(clube_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	RETURN (SELECT nome FROM clube c WHERE c.id = clube_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_nome_estadio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_nome_estadio`(estadio_id INT) RETURNS varchar(50) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
	RETURN (SELECT nome FROM estadio e WHERE e.id = estadio_id);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_cartoes_amarelos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_cartoes_amarelos`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(atuacao.qnt_cart_amar) FROM atuacao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_cartoes_vermelhos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_cartoes_vermelhos`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(atuacao.qnt_cart_verm) FROM atuacao);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_derrotas_como_mandante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_derrotas_como_mandante`(clube_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
                FROM partida 
                INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
                INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
                WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
			AS tab_time 
            WHERE tab_time.clb_mand_id = clube_id AND tab_time.clb_visit_venceu = true);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_derrotas_como_visitante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_derrotas_como_visitante`(clube_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
			FROM partida 
            INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
            INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
            WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
		AS tab_time 
        WHERE tab_time.clb_visit_id = clube_id AND tab_time.clb_mand_venceu = true);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_gols_no_tempo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_gols_no_tempo`(tempo VARCHAR(10)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	IF(UPPER(tempo) LIKE 'PRIMEIRO') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE min_gol <= 45);
    ELSEIF (UPPER(tempo) LIKE 'SEGUNDO') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE min_gol > 45);
	END IF;
	RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_gols_tipo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_gols_tipo`(tipo VARCHAR(50)) RETURNS int
    DETERMINISTIC
BEGIN
	DECLARE resultado INT;
	IF(tipo = '') THEN
		SET resultado = (SELECT COUNT(id) FROM gols WHERE tipo_gol IS NULL);
    ELSEIF (tipo != '') THEN
		SET resultado = (SELECT COUNT(tipo_gol) FROM gols WHERE tipo_gol LIKE(tipo));
	END IF;
	RETURN resultado;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_partidas_rodada` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_partidas_rodada`(n_rodada INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT COUNT(*) FROM partida p WHERE p.rodada = n_rodada);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_vitorias_como_mandante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_vitorias_como_mandante`(clube_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
                FROM partida 
                INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
                INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
                WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
			AS tab_time 
            WHERE tab_time.clb_mand_id = clube_id AND tab_time.clb_mand_venceu = true);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_qnt_vitorias_como_visitante` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_qnt_vitorias_como_visitante`(clube_id INT) RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (
		SELECT 
			COUNT(*) 
		FROM (
			SELECT 
				partida.*, 
                cv.nome AS clb_visitante, 
                cm.nome AS clb_mandante 
			FROM partida 
            INNER JOIN clube cm ON cm.id = partida.clb_mand_id 
            INNER JOIN clube cv ON cv.id = partida.clb_visit_id 
            WHERE clb_mand_id = clube_id OR clb_visit_id = clube_id) 
		AS tab_time 
        WHERE tab_time.clb_visit_id = clube_id AND tab_time.clb_visit_venceu = true);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_total_gols` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_total_gols`() RETURNS int
    DETERMINISTIC
BEGIN
	RETURN (SELECT 
	( SELECT SUM(qnt_gols_man) FROM partida) 
	+ (SELECT SUM(qnt_gols_visit) FROM partida));
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `obter_total_publico` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `obter_total_publico`() RETURNS float
    DETERMINISTIC
BEGIN
	RETURN (SELECT SUM(partida.qnt_puplico) FROM partida);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obter_tab_partida_time` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obter_tab_partida_time`(IN id INTEGER)
BEGIN
	SELECT partida.*, cv.nome AS clb_visitante, cm.nome AS clb_mandante FROM partida INNER JOIN clube cm ON cm.id = partida.clb_mand_id INNER JOIN clube cv ON cv.id = partida.clb_visit_id WHERE clb_mand_id = id OR clb_visit_id = id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ordenar_tab_partida` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ordenar_tab_partida`(IN ordem VARCHAR(20))
BEGIN
	SET @select_txt = 'SELECT 
							p.id, 
							cm.nome AS clube_mandante,
							cv.nome AS clube_visitante,
							p.qnt_gols_man,
							p.qnt_gols_visit,
							p.clb_mand_venceu,
							p.clb_visit_venceu,
							p.empate,
							p.rodada,
							p.data,
							e.nome,
							p.qnt_puplico
						FROM partida p 
						INNER JOIN clube cm ON p.clb_mand_id = cm.id 
						INNER JOIN clube cv ON p.clb_visit_id = cv.id
						INNER JOIN estadio e ON p.estadio_id = e.id ';
	SET @ordernacao_txt = 'ORDER BY rodada';
					
    IF (ordem = '' OR UPPER(ordem) LIKE 'CRESCENTE') THEN
		SET @sql_txt = CONCAT(@select_txt, @ordernacao_txt);
	ELSEIF (UPPER(ordem) LIKE 'DECRESCENTE') THEN
		SET @sql_txt = CONCAT(@select_txt, @ordernacao_txt, ' DESC');
	ELSE
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'ERRO: não é possível ordenar dessa forma';
	END IF;
    
    PREPARE runSQL FROM @sql_txt;
    EXECUTE runSQL;
    DEALLOCATE PREPARE runSQL;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `artilharia_vw`
--

/*!50001 DROP VIEW IF EXISTS `artilharia_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `artilharia_vw` AS select `jogador`.`nome` AS `nome_jogador`,`jogador`.`sobrenome` AS `sobrenome_jogador`,`clube`.`nome` AS `time`,`jogador`.`posicao` AS `posicao`,count(`gols`.`id`) AS `qnt_gols` from ((`gols` join `jogador` on((`gols`.`jogador_id` = `jogador`.`id`))) join `clube` on((`jogador`.`clube_id` = `clube`.`id`))) group by `gols`.`jogador_id` order by `qnt_gols` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `atuacao_vw`
--

/*!50001 DROP VIEW IF EXISTS `atuacao_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `atuacao_vw` AS select `jogador`.`nome` AS `nome`,`jogador`.`sobrenome` AS `sobrenome`,`partida`.`data` AS `data partida`,`partida`.`rodada` AS `rodada`,`atuacao`.`qnt_gols` AS `qnt_gols`,`atuacao`.`qnt_assistencias` AS `qnt_assistencias`,`atuacao`.`qnt_defesas` AS `qnt_defesas`,`atuacao`.`qnt_cart_amar` AS `qnt_cart_amar`,`atuacao`.`qnt_cart_verm` AS `qnt_cart_verm`,`clb_mandante`.`nome` AS `time_mandante`,`clb_visitante`.`nome` AS `time_visitante` from ((((`atuacao` join `jogador` on((`atuacao`.`jogador_id` = `jogador`.`id`))) join `partida` on((`atuacao`.`partida_id` = `partida`.`id`))) join `clube` `clb_mandante` on((`partida`.`clb_mand_id` = `clb_mandante`.`id`))) join `clube` `clb_visitante` on((`partida`.`clb_visit_id` = `clb_visitante`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `classificacao_posicao_time_vw`
--

/*!50001 DROP VIEW IF EXISTS `classificacao_posicao_time_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `classificacao_posicao_time_vw` AS select row_number() OVER (ORDER BY `classificacao`.`qnt_pontos` desc,`classificacao`.`qnt_vitorias` desc,`classificacao`.`saldo_gols` desc )  AS `posicao`,`clube`.`nome` AS `nome`,`classificacao`.`qnt_part_jogadas` AS `qnt_part_jogadas`,`classificacao`.`qnt_vitorias` AS `qnt_vitorias`,`classificacao`.`qnt_empates` AS `qnt_empates`,`classificacao`.`qnt_derrotas` AS `qnt_derrotas`,`classificacao`.`qnt_gols_marc` AS `qnt_gols_marc`,`classificacao`.`qnt_gols_sofr` AS `qnt_gols_sofr`,`classificacao`.`saldo_gols` AS `saldo_gols`,`classificacao`.`perc_aprov` AS `perc_aprov`,`classificacao`.`qnt_pontos` AS `qnt_pontos` from (`classificacao` join `clube` on((`classificacao`.`clube_id` = `clube`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `jogador_vw`
--

/*!50001 DROP VIEW IF EXISTS `jogador_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `jogador_vw` AS select `j`.`nome` AS `nome`,`j`.`sobrenome` AS `sobrenome`,`j`.`dt_nasc` AS `dt_nasc`,`j`.`nacionalidade` AS `nacionalidade`,`j`.`posicao` AS `posicao`,`c`.`nome` AS `clube` from (`jogador` `j` join `clube` `c` on((`j`.`clube_id` = `c`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partida_dia_semana_vw`
--

/*!50001 DROP VIEW IF EXISTS `partida_dia_semana_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partida_dia_semana_vw` AS select dayname(`p`.`data`) AS `dia_da_semana`,count(0) AS `qnt_jogos` from `partida` `p` group by `dia_da_semana` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `partida_vw`
--

/*!50001 DROP VIEW IF EXISTS `partida_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `partida_vw` AS select `cm`.`nome` AS `clube_mandante`,`cv`.`nome` AS `clube_visitante`,`p`.`qnt_gols_man` AS `qnt_gols_man`,`p`.`qnt_gols_visit` AS `qnt_gols_visit`,`p`.`clb_mand_venceu` AS `clb_mand_venceu`,`p`.`clb_visit_venceu` AS `clb_visit_venceu`,`p`.`empate` AS `empate`,`p`.`rodada` AS `rodada`,`p`.`data` AS `data`,`e`.`nome` AS `estadio`,`p`.`qnt_puplico` AS `qnt_puplico` from (((`partida` `p` join `clube` `cm` on((`p`.`clb_mand_id` = `cm`.`id`))) join `clube` `cv` on((`p`.`clb_visit_id` = `cv`.`id`))) join `estadio` `e` on((`p`.`estadio_id` = `e`.`id`))) order by `p`.`rodada` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `patida_clube_id1_vw`
--

/*!50001 DROP VIEW IF EXISTS `patida_clube_id1_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `patida_clube_id1_vw` AS select `cm`.`nome` AS `clube_mandante`,`cv`.`nome` AS `clube_visitante`,`p`.`qnt_gols_man` AS `qnt_gols_man`,`p`.`qnt_gols_visit` AS `qnt_gols_visit`,`p`.`clb_mand_venceu` AS `clb_mand_venceu`,`p`.`clb_visit_venceu` AS `clb_visit_venceu`,`p`.`empate` AS `empate`,`p`.`rodada` AS `rodada`,`p`.`data` AS `data`,`e`.`nome` AS `estadio`,`p`.`qnt_puplico` AS `qnt_puplico` from (((`partida` `p` join `clube` `cm` on((`p`.`clb_mand_id` = `cm`.`id`))) join `clube` `cv` on((`p`.`clb_visit_id` = `cv`.`id`))) join `estadio` `e` on((`p`.`estadio_id` = `e`.`id`))) where ((`cm`.`id` = 1) or (`cv`.`id` = 1)) order by `p`.`rodada` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `publico_vw`
--

/*!50001 DROP VIEW IF EXISTS `publico_vw`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=TEMPTABLE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `publico_vw` AS select `partida`.`rodada` AS `rodada`,`obter_nome_clube`(`partida`.`clb_mand_id`) AS `clb_mandante`,`obter_nome_clube`(`partida`.`clb_visit_id`) AS `clb_visitante`,`estadio`.`nome` AS `nome_estaddio`,`partida`.`qnt_puplico` AS `qnt_publico_partida`,`estadio`.`capacidade` AS `capacidade_estadio`,((`partida`.`qnt_puplico` / `estadio`.`capacidade`) * 100) AS `percentual_ocupacao`,`obter_media_publico_estadio`(`partida`.`estadio_id`) AS `media_publico_estadio_campeonato` from (`partida` join `estadio` on((`partida`.`estadio_id` = `estadio`.`id`))) order by `partida`.`rodada` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-29 14:15:50

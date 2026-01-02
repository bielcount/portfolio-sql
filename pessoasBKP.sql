/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.3-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: testeDB
-- ------------------------------------------------------
-- Server version	11.8.3-MariaDB-0+deb13u1 from Debian

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `pessoas`
--

DROP TABLE IF EXISTS `pessoas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pessoas` (
  `idPessoa` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `tipo` enum('cliente','fornecedor') NOT NULL,
  `regiao` char(1) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`idPessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoas`
--

LOCK TABLES `pessoas` WRITE;
/*!40000 ALTER TABLE `pessoas` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `pessoas` VALUES
(1,'Comercial Silva LTDA','fornecedor','S','contato@comercialsilva.com','2025-11-10 00:47:21'),
(2,'Distribuidora Alves','fornecedor','N','financeiro@distribuidoraalves.com','2025-11-10 00:47:21'),
(3,'Mercado São João','cliente','S','compras@sãojoao.com','2025-11-10 00:47:21'),
(4,'Padaria Doce Pão','cliente','S','padaria@docepao.com','2025-11-10 00:47:21'),
(5,'Supermercado Bom Preço','cliente','N','contato@bompreco.com','2025-11-10 00:47:21'),
(6,'Oficina Mecânica TurboCar','cliente','N','adm@turbocar.com','2025-11-10 00:47:21'),
(7,'Tech Solutions LTDA','fornecedor','S','suporte@techsolutions.com','2025-11-10 00:47:21'),
(8,'Empório do Norte','cliente','N','empnorte@gmail.com','2025-11-10 00:47:21'),
(9,'Construtora Alfa','cliente','S','financeiro@construtoraalfa.com','2025-11-10 00:47:21'),
(10,'Fornecedor Central Ltda','fornecedor','S','central@fornecedorcentral.com','2025-11-10 00:47:21');
/*!40000 ALTER TABLE `pessoas` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-11-10 19:54:35

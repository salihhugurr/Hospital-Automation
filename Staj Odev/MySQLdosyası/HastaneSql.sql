-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hastane-app
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `bölümhastalık`
--

DROP TABLE IF EXISTS `bölümhastalık`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bölümhastalık` (
  `ilgilibölümId` int NOT NULL,
  `doktorId` int NOT NULL,
  `hastalıkturuId` int NOT NULL,
  PRIMARY KEY (`ilgilibölümId`,`doktorId`,`hastalıkturuId`),
  KEY `fk_bölümhastalık_hastalıkturuId` (`hastalıkturuId`),
  KEY `fk_bölümhastalık_doktorId` (`doktorId`),
  CONSTRAINT `fk_bölümhastalık_doktorId` FOREIGN KEY (`doktorId`) REFERENCES `doktor` (`Id`),
  CONSTRAINT `fk_bölümhastalık_hastalıkturuId` FOREIGN KEY (`hastalıkturuId`) REFERENCES `hastalıkturu` (`Id`),
  CONSTRAINT `fk_bölümhastalık_ilgilibölüm` FOREIGN KEY (`ilgilibölümId`) REFERENCES `ilgilibölüm` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bölümhastalık`
--

LOCK TABLES `bölümhastalık` WRITE;
/*!40000 ALTER TABLE `bölümhastalık` DISABLE KEYS */;
INSERT INTO `bölümhastalık` VALUES (1,1,1),(2,2,2),(3,3,3);
/*!40000 ALTER TABLE `bölümhastalık` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doktor`
--

DROP TABLE IF EXISTS `doktor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doktor` (
  `Id` int NOT NULL,
  `branş` varchar(45) NOT NULL,
  `isim` varchar(45) NOT NULL,
  `soyisim` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doktor`
--

LOCK TABLES `doktor` WRITE;
/*!40000 ALTER TABLE `doktor` DISABLE KEYS */;
INSERT INTO `doktor` VALUES (1,'Psikiyatri','Ahmet','Aydın'),(2,'Psikiyatri','Selma','Deniz'),(3,'Dermatoloji','Kaan','Mangır'),(4,'Dermatoloji','Salih','Uğur'),(5,'Onkoloji','Ahmet','Başaran'),(6,'Onkoloji','Selahaddin','Polat'),(7,'Kardiyoloji','Meral','Demir'),(8,'Kardiyoloji','Elif','Demiral'),(9,'Üroloji','Emine','Mor'),(10,'Üroloji','İrem','Kelleci'),(11,'Radyoloji','Murat','Doğan'),(12,'Radyoloji','İpek','Zengin'),(13,'Fizyoloji','Mehmet','Üstün'),(14,'Fizyoloji','Nida','Duran');
/*!40000 ALTER TABLE `doktor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hasta`
--

DROP TABLE IF EXISTS `hasta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hasta` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `TcNo` varchar(11) NOT NULL,
  `Isim` varchar(45) NOT NULL,
  `Soyisim` varchar(45) NOT NULL,
  `DogumTarihi` date NOT NULL,
  `Cinsiyet` char(1) NOT NULL,
  `randevutarihi` date NOT NULL,
  `randevusaati` float NOT NULL,
  `ilgilibölümId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Tc.no_UNIQUE` (`TcNo`),
  KEY `fk_hasta_ilgilibölüm` (`ilgilibölümId`),
  CONSTRAINT `fk_hasta_ilgilibölüm` FOREIGN KEY (`ilgilibölümId`) REFERENCES `ilgilibölüm` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hasta`
--

LOCK TABLES `hasta` WRITE;
/*!40000 ALTER TABLE `hasta` DISABLE KEYS */;
INSERT INTO `hasta` VALUES (1,'43568965123','mert','kolay','1996-04-04','e','0000-00-00',0,1),(2,'56568923213','zeynep','çelik','1990-09-08','k','0000-00-00',0,2),(3,'12121519156','rabia','malkoç','1970-09-04','k','0000-00-00',0,3),(30,'70072027724','Salih			','Uğur','1998-01-01','E','2021-03-15',14,5);
/*!40000 ALTER TABLE `hasta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hastalıkturu`
--

DROP TABLE IF EXISTS `hastalıkturu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hastalıkturu` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `hastalıkadı` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hastalıkturu`
--

LOCK TABLES `hastalıkturu` WRITE;
/*!40000 ALTER TABLE `hastalıkturu` DISABLE KEYS */;
INSERT INTO `hastalıkturu` VALUES (1,'Mental'),(2,'kalp ve dolaşım'),(3,'deribilim');
/*!40000 ALTER TABLE `hastalıkturu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ilgilibölüm`
--

DROP TABLE IF EXISTS `ilgilibölüm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ilgilibölüm` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `bolumadı` varchar(45) NOT NULL,
  `doktorId` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Id_UNIQUE` (`Id`),
  KEY `fk_doktor_ilgilibölüm` (`doktorId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ilgilibölüm`
--

LOCK TABLES `ilgilibölüm` WRITE;
/*!40000 ALTER TABLE `ilgilibölüm` DISABLE KEYS */;
INSERT INTO `ilgilibölüm` VALUES (1,'Psikiyatri',1),(2,'Dermatoloji',2),(3,'Onkoloji',3),(4,'Kardiyoloji',4),(5,'Üroloji',5),(6,'Radyoloji',6),(7,'Fizyoloji',7);
/*!40000 ALTER TABLE `ilgilibölüm` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-14 19:43:19

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: test
-- ------------------------------------------------------
-- Server version	8.0.17

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
-- Table structure for table `algorithm`
--

DROP TABLE IF EXISTS `algorithm`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `algorithm` (
  `algorithm_id` int(11) NOT NULL AUTO_INCREMENT,
  `algorithm_student_id` int(11) NOT NULL,
  `grade` varchar(45) DEFAULT NULL,
  `date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`algorithm_id`),
  KEY `algorithm_student_id_idx` (`algorithm_student_id`),
  CONSTRAINT `algorithm_student_id` FOREIGN KEY (`algorithm_student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `algorithm`
--

LOCK TABLES `algorithm` WRITE;
/*!40000 ALTER TABLE `algorithm` DISABLE KEYS */;
INSERT INTO `algorithm` VALUES (1,1,'A+','2020-03-03 16:33:07'),(2,2,'A','2020-03-03 16:33:07'),(3,3,'A','2020-03-03 16:33:07'),(4,4,'AD','2020-03-03 16:33:07'),(5,5,'A','2020-03-03 16:33:07'),(6,6,'A','2020-03-03 16:33:07'),(7,7,'A','2020-03-03 16:33:07');
/*!40000 ALTER TABLE `algorithm` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `attendance_id` int(11) NOT NULL AUTO_INCREMENT,
  `attendance_student_id` int(11) NOT NULL,
  `attendance_date` date DEFAULT NULL,
  `attendance` varchar(45) DEFAULT NULL,
  `attendance_sign_in` datetime DEFAULT NULL,
  `attendance_sign_out` datetime DEFAULT NULL,
  PRIMARY KEY (`attendance_id`),
  KEY `attendance_student_id_idx` (`attendance_student_id`),
  CONSTRAINT `attendance_student_id` FOREIGN KEY (`attendance_student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` VALUES (1,1,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(2,2,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(3,3,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(4,4,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(5,5,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(6,6,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31'),(7,7,'2020-01-09','1','2020-01-09 08:38:20','2020-01-09 18:38:31');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `grade` (
  `grade_id` int(11) NOT NULL AUTO_INCREMENT,
  `grade_kind` varchar(45) DEFAULT NULL,
  `grade_drade` varchar(45) DEFAULT NULL,
  `student_id_` int(11) DEFAULT NULL,
  PRIMARY KEY (`grade_id`),
  KEY `student_id__idx` (`student_id_`),
  CONSTRAINT `student_id_` FOREIGN KEY (`student_id_`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,'1','70',1),(2,'2','80',1),(3,'3','90',1),(4,'1','70',2),(5,'2','80',2),(6,'3','90',2),(7,'1','70',3),(8,'2','80',3),(9,'3','90',3),(10,'1','70',4),(11,'1','70',4),(12,'1','70',4),(13,'1','70',5),(14,'2','80',5),(15,'3','90',5),(16,'1','70',6),(17,'2','80',6),(18,'3','90',6),(19,'1','70',7),(20,'2','80',7),(21,'3','90',7);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `group`
--

DROP TABLE IF EXISTS `group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `group` (
  `group_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_teacher_id` varchar(45) NOT NULL,
  `group_teacher_name` varchar(45) NOT NULL,
  `group_teacher_hp` varchar(45) NOT NULL,
  PRIMARY KEY (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `group`
--

LOCK TABLES `group` WRITE;
/*!40000 ALTER TABLE `group` DISABLE KEYS */;
INSERT INTO `group` VALUES (1,'RichKing','강부자','01090006000'),(2,'Song','송해','01012122121'),(3,'SunJae','이순재','01015771577'),(4,'Crab','신구','01090503210');
/*!40000 ALTER TABLE `group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `project_id` int(11) NOT NULL AUTO_INCREMENT,
  `project_name` varchar(45) NOT NULL,
  `project_grade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`project_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (1,'나혼자',NULL),(2,'무한도전',NULL),(3,'개그맨',NULL),(4,'가수',NULL);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reg_last`
--

DROP TABLE IF EXISTS `reg_last`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reg_last` (
  `reg_last_id` int(11) NOT NULL AUTO_INCREMENT,
  `student_id` int(11) DEFAULT NULL,
  `reg_user` varchar(45) DEFAULT NULL,
  `reg_date` datetime DEFAULT NULL,
  `last_user` varchar(45) DEFAULT NULL,
  `last_date` datetime DEFAULT NULL,
  PRIMARY KEY (`reg_last_id`),
  KEY `student_id_idx` (`student_id`),
  CONSTRAINT `student_id` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reg_last`
--

LOCK TABLES `reg_last` WRITE;
/*!40000 ALTER TABLE `reg_last` DISABLE KEYS */;
INSERT INTO `reg_last` VALUES (1,1,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(2,2,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(3,3,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(4,4,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(5,5,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(6,6,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(7,7,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(8,8,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(9,9,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(10,10,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(11,11,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(12,12,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(13,13,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(14,14,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(15,15,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(16,16,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(17,17,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(18,18,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(19,19,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(20,20,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(21,21,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(22,22,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(23,23,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(24,24,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(25,25,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(26,26,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07'),(27,27,'SYSTEM','2020-03-03 16:33:07','SYSTEM','2020-03-03 16:33:07');
/*!40000 ALTER TABLE `reg_last` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) DEFAULT NULL,
  `project_id` int(11) DEFAULT NULL,
  `student_account` varchar(45) DEFAULT NULL,
  `student_name` varchar(100) DEFAULT NULL,
  `student_hp` varchar(45) DEFAULT NULL,
  `student_age` varchar(45) DEFAULT NULL,
  `student_gender` varchar(45) DEFAULT NULL,
  `student_group` varchar(45) DEFAULT NULL,
  `student_curriculum` varchar(45) DEFAULT NULL,
  `student_region` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `group_id_idx` (`group_id`),
  KEY `project_id_idx` (`project_id`),
  CONSTRAINT `group_id` FOREIGN KEY (`group_id`) REFERENCES `group` (`group_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `project_id` FOREIGN KEY (`project_id`) REFERENCES `project` (`project_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,1,1,'Gian','기안84','01020002001','36','M','1','2','광주'),(2,3,2,'Godness','김태희','01020002014','37','F','2','2','대전'),(3,1,1,'Tiger','김종국','01010001001','41','M','2','1','광주'),(4,4,1,'AsiaPrince','이광수','01010001003','36','M','1','1','구미'),(5,4,2,'SeHo','조세호','01020002008','38','M','1','2','구미'),(6,4,3,'U','유재석','01020002015','49','M','2','2','대전'),(7,3,4,'B','정지훈','01020002016','40','M','2','2','대전'),(8,4,1,'BigStar','김희철','01020002007','36','M','1','2','구미'),(9,4,2,'Queen','김연아','01020002006','25','F','1','2','구미'),(10,4,3,'HongGilDong','홍길동','01020002005','113','M','1','2','구미'),(11,1,4,'GD','지드래곤','01020002004','34','M','1','2','광주'),(12,1,1,'Scarecrow','황광희','01020002003','32','M','1','2','광주'),(13,1,1,'Thief','연정훈','01020002002','43','M','1','2','광주'),(14,2,2,'Gorani','황제성','01010001011','37','M','2','1','서울'),(15,2,3,'Big','지석진','01010001012','54','M','1','1','서울'),(16,2,2,'Haha','하동훈','01010001010','43','M','1','1','서울'),(17,2,3,'LoveFrog','전소민','01010001013','35','F','2','1','서울'),(18,2,3,'TooMuchTalker','박찬호','01010001014','45','M','3','1','서울'),(19,2,4,'RingKiss','안정환','01010001009','45','M','3','1','서울'),(20,3,3,'Giant','서장훈','01010001008','46','M','1','1','대전'),(21,3,1,'MC Juji','이수근','01010001007','45','M','2','1','대전'),(22,3,1,'IU','아이유','01010001005','30','F','1','1','대전'),(23,3,2,'TenMinute','이효리','01010001006','41','F','2','1','대전'),(24,3,3,'MuscleMan','강호동','01020002013','50','M','1','2','대전'),(25,3,4,'KCM','강창모','01020002009','37','M','1','2','대전'),(26,3,3,'JK Kim','김동욱','01020002012','45','M','1','2','대전'),(27,3,2,'Key','김기범','01020002011','32','M','1','2','대전');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-09 17:43:36

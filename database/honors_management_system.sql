CREATE DATABASE  IF NOT EXISTS `honors` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `honors`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: honors
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `academic_performance`
--

DROP TABLE IF EXISTS `academic_performance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_performance` (
  `Performance_ID` int NOT NULL,
  `Student_ID` int DEFAULT NULL,
  `Semester_ID` int DEFAULT NULL,
  `CGPA` decimal(3,2) DEFAULT NULL,
  `Credits_Earned` int DEFAULT NULL,
  `Backlogs` int DEFAULT NULL,
  PRIMARY KEY (`Performance_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Semester_ID` (`Semester_ID`),
  CONSTRAINT `academic_performance_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `academic_performance_ibfk_2` FOREIGN KEY (`Semester_ID`) REFERENCES `semester` (`Semester_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_performance`
--

LOCK TABLES `academic_performance` WRITE;
/*!40000 ALTER TABLE `academic_performance` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_performance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `application`
--

DROP TABLE IF EXISTS `application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `application` (
  `Application_ID` int NOT NULL,
  `Student_ID` int DEFAULT NULL,
  `Program_ID` int DEFAULT NULL,
  `Application_Date` date DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Application_ID`),
  KEY `Student_ID` (`Student_ID`),
  KEY `Program_ID` (`Program_ID`),
  CONSTRAINT `application_ibfk_1` FOREIGN KEY (`Student_ID`) REFERENCES `student` (`Student_ID`),
  CONSTRAINT `application_ibfk_2` FOREIGN KEY (`Program_ID`) REFERENCES `honors_program` (`Program_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `application`
--

LOCK TABLES `application` WRITE;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
/*!40000 ALTER TABLE `application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `Department_ID` int NOT NULL,
  `Department_Name` varchar(100) NOT NULL,
  `HOD_Name` varchar(100) DEFAULT NULL,
  `Faculty_Incharge` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eligibility_criteria`
--

DROP TABLE IF EXISTS `eligibility_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eligibility_criteria` (
  `Criteria_ID` int NOT NULL,
  `Program_ID` int DEFAULT NULL,
  `Min_CGPA` decimal(3,2) DEFAULT NULL,
  `Min_Credits` int DEFAULT NULL,
  `Max_Backlogs` int DEFAULT NULL,
  PRIMARY KEY (`Criteria_ID`),
  KEY `Program_ID` (`Program_ID`),
  CONSTRAINT `eligibility_criteria_ibfk_1` FOREIGN KEY (`Program_ID`) REFERENCES `honors_program` (`Program_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eligibility_criteria`
--

LOCK TABLES `eligibility_criteria` WRITE;
/*!40000 ALTER TABLE `eligibility_criteria` DISABLE KEYS */;
/*!40000 ALTER TABLE `eligibility_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `honors_program`
--

DROP TABLE IF EXISTS `honors_program`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `honors_program` (
  `Program_ID` int NOT NULL,
  `Program_Name` varchar(100) NOT NULL,
  `Department_ID` int DEFAULT NULL,
  `Max_Seats` int DEFAULT NULL,
  `Start_yr` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Program_ID`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `honors_program_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `honors_program`
--

LOCK TABLES `honors_program` WRITE;
/*!40000 ALTER TABLE `honors_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `honors_program` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `selection`
--

DROP TABLE IF EXISTS `selection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selection` (
  `Selection_ID` int NOT NULL,
  `Application_ID` int DEFAULT NULL,
  `Student_Rank` int DEFAULT NULL,
  `Final_Score` decimal(5,2) DEFAULT NULL,
  `Selection_Date` date DEFAULT NULL,
  PRIMARY KEY (`Selection_ID`),
  KEY `Application_ID` (`Application_ID`),
  CONSTRAINT `selection_ibfk_1` FOREIGN KEY (`Application_ID`) REFERENCES `application` (`Application_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selection`
--

LOCK TABLES `selection` WRITE;
/*!40000 ALTER TABLE `selection` DISABLE KEYS */;
/*!40000 ALTER TABLE `selection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `semester` (
  `Semester_ID` int NOT NULL,
  `Semester_No` int DEFAULT NULL,
  `Academic_Year` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Semester_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Student_ID` int NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Phone_Number` varchar(15) DEFAULT NULL,
  `Email_ID` varchar(100) DEFAULT NULL,
  `Year` int DEFAULT NULL,
  `Department_ID` int DEFAULT NULL,
  `Status` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Student_ID`),
  UNIQUE KEY `Email_ID` (`Email_ID`),
  KEY `Department_ID` (`Department_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Department_ID`) REFERENCES `department` (`Department_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
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

-- Dump completed on 2026-02-12 17:50:01

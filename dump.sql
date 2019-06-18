-- MySQL dump 10.15  Distrib 10.0.38-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: db2015410120
-- ------------------------------------------------------
-- Server version	10.0.38-MariaDB-0ubuntu0.16.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cartoonist`
--

DROP TABLE IF EXISTS `cartoonist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartoonist` (
  `cartoonist_id` int(11) NOT NULL AUTO_INCREMENT,
  `cartoonist_name` varchar(20) NOT NULL,
  PRIMARY KEY (`cartoonist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartoonist`
--

LOCK TABLES `cartoonist` WRITE;
/*!40000 ALTER TABLE `cartoonist` DISABLE KEYS */;
INSERT INTO `cartoonist` VALUES (1,'랑또'),(2,'SIU'),(3,'레바');
/*!40000 ALTER TABLE `cartoonist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `episode`
--

DROP TABLE IF EXISTS `episode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `episode` (
  `episode_id` int(11) NOT NULL AUTO_INCREMENT,
  `webtoon_id` int(11) NOT NULL,
  `episode_title` varchar(30) DEFAULT NULL,
  `link` varchar(150) NOT NULL,
  PRIMARY KEY (`episode_id`),
  KEY `webtoon_id` (`webtoon_id`),
  CONSTRAINT `episode_ibfk_1` FOREIGN KEY (`webtoon_id`) REFERENCES `webtoon` (`webtoon_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `episode`
--

LOCK TABLES `episode` WRITE;
/*!40000 ALTER TABLE `episode` DISABLE KEYS */;
INSERT INTO `episode` VALUES (44,2,'1화','https://comic.naver.com/webtoon/detail.nhn?titleId=670144&no=1'),(45,2,'2화','https://comic.naver.com/webtoon/detail.nhn?titleId=670144&no=2'),(46,2,'3화','https://comic.naver.com/webtoon/detail.nhn?titleId=670144&no=3'),(47,3,'프롤로그','https://comic.naver.com/webtoon/detail.nhn?titleId=443421&no=1'),(48,3,'1화','https://comic.naver.com/webtoon/detail.nhn?titleId=443421&no=2'),(49,3,'2화','https://comic.naver.com/webtoon/detail.nhn?titleId=443421&no=3'),(50,4,'예고편','https://comic.naver.com/webtoon/detail.nhn?titleId=183559&no=1'),(51,4,'1화','https://comic.naver.com/webtoon/detail.nhn?titleId=183559&no=2'),(52,4,'2화','https://comic.naver.com/webtoon/detail.nhn?titleId=183559&no=3'),(53,5,'레바의 기묘한 모험 -레진코믹스 연재편','https://www.lezhin.com/ko/comic/revatoon/p1'),(54,5,'레바의 기묘한 모험 -레진코믹스 1주년 파티 서울구경 ','https://www.lezhin.com/ko/comic/revatoon/1'),(55,5,'뜻 밖의 팬미팅 상편','https://www.lezhin.com/ko/comic/revatoon/2');
/*!40000 ALTER TABLE `episode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `platform`
--

DROP TABLE IF EXISTS `platform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `platform` (
  `platform_id` int(11) NOT NULL AUTO_INCREMENT,
  `platform_name` varchar(20) NOT NULL,
  PRIMARY KEY (`platform_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `platform`
--

LOCK TABLES `platform` WRITE;
/*!40000 ALTER TABLE `platform` DISABLE KEYS */;
INSERT INTO `platform` VALUES (5,'naver'),(6,'lezhin');
/*!40000 ALTER TABLE `platform` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `episode_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  PRIMARY KEY (`review_id`),
  KEY `episode_id` (`episode_id`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`episode_id`) REFERENCES `episode` (`episode_id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (41,44,'이상한 만화 아닙니다!!'),(44,45,'랑또조아'),(45,45,'여러분 왕사랑!!'),(46,46,'작가님 가둬놓고 만화그리게 하고 싶다'),(47,46,'단행본이 나왔습니다!'),(48,47,'악사당연의'),(49,50,'정주행 시작'),(50,50,'우오아아아 '),(51,51,'밤 사기캐'),(52,51,'너무 재밌어요'),(53,52,'밤 득탬ㅋㅋ'),(54,52,'라헬 안나와서 좋다'),(55,53,'레바 성공했누'),(56,53,'ㅎㄷㄷㄷ'),(57,54,'ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ'),(59,55,'ㄲㅂ 나도 갈걸'),(60,55,'본격 팬도 작가도 제정신이 아닌 만화'),(65,44,'이상한 만화 맞잖아요...'),(66,48,'이거 왜 유료임 ㅜㅜ'),(67,49,'무플 방지 위원회에서 나왔습니다');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webtoon`
--

DROP TABLE IF EXISTS `webtoon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webtoon` (
  `webtoon_id` int(11) NOT NULL AUTO_INCREMENT,
  `webtoon_title` varchar(20) NOT NULL,
  `platform_id` int(11) NOT NULL,
  `cartoonist_id` int(11) NOT NULL,
  PRIMARY KEY (`webtoon_id`),
  KEY `platform_id` (`platform_id`),
  KEY `cartoonist_id` (`cartoonist_id`),
  CONSTRAINT `webtoon_ibfk_1` FOREIGN KEY (`platform_id`) REFERENCES `platform` (`platform_id`),
  CONSTRAINT `webtoon_ibfk_2` FOREIGN KEY (`cartoonist_id`) REFERENCES `cartoonist` (`cartoonist_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webtoon`
--

LOCK TABLES `webtoon` WRITE;
/*!40000 ALTER TABLE `webtoon` DISABLE KEYS */;
INSERT INTO `webtoon` VALUES (2,'가담항설',5,1),(3,'악당의사연',5,1),(4,'신의 탑',5,2),(5,'레바툰',6,3);
/*!40000 ALTER TABLE `webtoon` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-18 19:05:17

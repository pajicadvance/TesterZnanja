/*
SQLyog Community v13.2.0 (64 bit)
MySQL - 8.0.33 : Database - testovi_znanja
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`testovi_znanja` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `testovi_znanja`;

/*Table structure for table `administrator` */

DROP TABLE IF EXISTS `administrator`;

CREATE TABLE `administrator` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `administrator` */

insert  into `administrator`(`id`,`ime`,`prezime`,`datum_rodjenja`,`username`,`password`) values 
(1,'Pavle','Pajic','1998-03-19','pajic','$2a$10$ieXf3z0KDDSKXZRz4KsNmuCZeisoaS7vThLDDMLxr9G4qV/unw2Uu');

/*Table structure for table `korisnik` */

DROP TABLE IF EXISTS `korisnik`;

CREATE TABLE `korisnik` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `korisnik` */

insert  into `korisnik`(`id`,`ime`,`prezime`,`datum_rodjenja`,`username`,`password`) values 
(2,'Igor','Stojkovic','2005-11-30','igor123','$2a$10$Hdsnxato9x6SFv.5HJi.weI1uzHVUjD48tF8c0qclt/OIt6io2C36'),
(3,'Pera','Peric','2004-10-13','pera1','$2a$10$MXpwl7Jvwa/WLMI3wB8FYOmaR.tFWDxbYnqAyLRXsEEWrcEKvtjU6'),
(1000,'TestIme','TestPrezime','2020-01-08','testuser','$2a$10$9.Ei9fjnFfR0zPAF6.uIqOi.XF.BdfGP9g/Jz9eG3zpyq8HUmeKye'),
(1001,'TestIme','TestPrezime','2020-01-08','testuser','$2a$10$q/k96Nco4pjwCusRweAN5Oa1ZJIUGIGgW2FtA1U0Cs9E9l0rAnVJ6');

/*Table structure for table `odgovor` */

DROP TABLE IF EXISTS `odgovor`;

CREATE TABLE `odgovor` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `pitanje_id` bigint NOT NULL,
  `test_znanja_id` bigint NOT NULL,
  `tekst` varchar(1024) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `tacan` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`pitanje_id`,`test_znanja_id`),
  KEY `pitanje_id` (`pitanje_id`),
  KEY `test_znanja_id` (`test_znanja_id`),
  CONSTRAINT `odgovor_ibfk_1` FOREIGN KEY (`pitanje_id`) REFERENCES `pitanje` (`id`),
  CONSTRAINT `odgovor_ibfk_2` FOREIGN KEY (`test_znanja_id`) REFERENCES `test_znanja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `odgovor` */

insert  into `odgovor`(`id`,`pitanje_id`,`test_znanja_id`,`tekst`,`tacan`) values 
(20,9,13,'Odgovor 1',0),
(21,9,13,'Odgovor 2',1),
(22,9,13,'Odgovor 3',0),
(23,10,13,'Odgovor 1',1),
(24,10,13,'Odgovor 2',0),
(25,10,13,'Odgovor 3',0),
(26,10,13,'Odgovor 4',1),
(27,11,13,'Odgovor 1',1),
(28,11,13,'Odgovor 2',0),
(29,12,13,'Odgovor 1',0),
(30,12,13,'Odgovor 2',1),
(31,12,13,'Odgovor 3',0),
(32,12,13,'Odgovor 4',0),
(33,12,13,'Odgovor 5',1),
(34,13,19,'fsdgfdg',1),
(35,13,19,'ghkjhjk',0),
(36,14,19,'jghjkhjk',0),
(37,14,19,'kythjtyh',1),
(38,14,19,'f23f34',1);

/*Table structure for table `pitanje` */

DROP TABLE IF EXISTS `pitanje`;

CREATE TABLE `pitanje` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `test_znanja_id` bigint NOT NULL,
  `tekst` varchar(500) DEFAULT NULL,
  `poeni` double DEFAULT NULL,
  PRIMARY KEY (`id`,`test_znanja_id`),
  KEY `test_znanja_id` (`test_znanja_id`),
  CONSTRAINT `pitanje_ibfk_1` FOREIGN KEY (`test_znanja_id`) REFERENCES `test_znanja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `pitanje` */

insert  into `pitanje`(`id`,`test_znanja_id`,`tekst`,`poeni`) values 
(9,13,'Primer pitanje 1\nTacni odgovor je 2',5),
(10,13,'Primer pitanje 2\nTacni odgovori su 1 i 4',10),
(11,13,'Primer pitanje 3\nTacan odgovor je 1',3),
(12,13,'Primer pitanje 4\nTacni odgovori su 2 i 5',15),
(13,19,'sdfsdgdfg',10),
(14,19,'d13d2323d',20);

/*Table structure for table `rezultat` */

DROP TABLE IF EXISTS `rezultat`;

CREATE TABLE `rezultat` (
  `korisnik_id` bigint NOT NULL AUTO_INCREMENT,
  `test_znanja_id` bigint NOT NULL,
  `prosao` tinyint(1) DEFAULT NULL,
  `broj_poena` double DEFAULT NULL,
  `datum_rada` date DEFAULT NULL,
  PRIMARY KEY (`korisnik_id`,`test_znanja_id`),
  KEY `test_znanja_id` (`test_znanja_id`),
  CONSTRAINT `rezultat_ibfk_1` FOREIGN KEY (`test_znanja_id`) REFERENCES `test_znanja` (`id`),
  CONSTRAINT `rezultat_ibfk_2` FOREIGN KEY (`korisnik_id`) REFERENCES `korisnik` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `rezultat` */

insert  into `rezultat`(`korisnik_id`,`test_znanja_id`,`prosao`,`broj_poena`,`datum_rada`) values 
(2,13,0,0,'2023-08-30'),
(1001,1000,0,3,'2023-03-01');

/*Table structure for table `test_znanja` */

DROP TABLE IF EXISTS `test_znanja`;

CREATE TABLE `test_znanja` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  `poeni_za_prolaz` double DEFAULT NULL,
  `tip_testa_znanja_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tip_testa_znanja_id` (`tip_testa_znanja_id`),
  CONSTRAINT `test_znanja_ibfk_1` FOREIGN KEY (`tip_testa_znanja_id`) REFERENCES `tip_testa_znanja` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1003 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `test_znanja` */

insert  into `test_znanja`(`id`,`naziv`,`poeni_za_prolaz`,`tip_testa_znanja_id`) values 
(13,'Primer testa 1',20,1),
(19,'asdasdas',30,3),
(1000,'TestTest',10,1),
(1001,'TestTest',10,1);

/*Table structure for table `tip_testa_znanja` */

DROP TABLE IF EXISTS `tip_testa_znanja`;

CREATE TABLE `tip_testa_znanja` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `tip_testa_znanja` */

insert  into `tip_testa_znanja`(`id`,`naziv`) values 
(1,'Kviz'),
(2,'Test'),
(3,'Ispit');

/*Table structure for table `urednik` */

DROP TABLE IF EXISTS `urednik`;

CREATE TABLE `urednik` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `ime` varchar(20) DEFAULT NULL,
  `prezime` varchar(20) DEFAULT NULL,
  `datum_rodjenja` date DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `administrator_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administrator_id` (`administrator_id`),
  CONSTRAINT `urednik_ibfk_1` FOREIGN KEY (`administrator_id`) REFERENCES `administrator` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1001 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `urednik` */

insert  into `urednik`(`id`,`ime`,`prezime`,`datum_rodjenja`,`username`,`password`,`administrator_id`) values 
(6,'Jovan','Jovanovic','1994-04-20','jovan123','$2a$10$/hYJVAY/qDOCiyn5v05TxucQsDa.uJxjntzxYIvxBtRVFEPF3xPW.',1),
(7,'Ivan','Ivanovic','2003-10-05','ivan1','$2a$10$nvQtITxFMxWvYusbEX3x5./Lv/JPC.l.Tmgha4n2dL8wp.biCGSWK',1),
(1000,'TestIme','TestPrezime','2020-01-08','testuser','$2a$10$vs9fcU2pEqB7A7qlWHYWjeVKFfi.r3MVhn6itTXqLA6E3FXajOzx.',1);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

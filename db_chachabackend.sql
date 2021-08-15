/*
SQLyog Ultimate v12.4.3 (64 bit)
MySQL - 10.1.28-MariaDB : Database - db_perpustakaan
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `tb_data_buku` */

DROP TABLE IF EXISTS `tb_data_buku`;

CREATE TABLE `tb_data_buku` (
  `id_buku` int(11) NOT NULL AUTO_INCREMENT,
  `judul_buku` varchar(50) DEFAULT NULL,
  `pengarang` varchar(50) DEFAULT NULL,
  `tahun_terbit` date DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=10006 DEFAULT CHARSET=latin1;

/*Data for the table `tb_data_buku` */

insert  into `tb_data_buku`(`id_buku`,`judul_buku`,`pengarang`,`tahun_terbit`,`jumlah`) values 
(10001,'YATAOME','GIDDENS KO','2003-10-01',12),
(10002,'NARUTO','MASASHI KISIHIMOTO','2003-09-20',21),
(10003,'MAHIR KODING','PROF.BRAMASTA,S.T.,MEng,Ph.D','2010-09-20',11),
(10004,'JAGO JAVA DALAM 5 MENIT','PROF.BRAMASTA,S.T.,MEng,Ph.D','2010-09-20',11),
(10005,'BELAJAR MEMBACA','IBU AINI','2011-09-20',11);

/*Table structure for table `tb_data_mahasiswa` */

DROP TABLE IF EXISTS `tb_data_mahasiswa`;

CREATE TABLE `tb_data_mahasiswa` (
  `nim` int(11) NOT NULL,
  `nama_mahasiswa` varchar(50) DEFAULT NULL,
  `prodi` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_data_mahasiswa` */

insert  into `tb_data_mahasiswa`(`nim`,`nama_mahasiswa`,`prodi`,`alamat`) values 
(123456,'cool','ssss','elektrass'),
(12345623,'cool','elektrass','ssss'),
(123456232,'cool','elektrass','ssss'),
(1234562322,'cool','elektrass','ssss'),
(1705552222,'ALAYYEDIN SULTAN','TEKNIK ELEKTRO','IRAWADI'),
(1705552910,'AGUS DARMAWAN','TEKNOLOGI PERTANIAN','GOA GAJAH'),
(1705552922,'FACHRI ZAMZAMI','TEKNOLOGI INFORMASI','P.MOYO'),
(1705552925,'YUDHA GIRI','ILMU POLITIK','PANCORAN'),
(1705552932,'DAHLAN TASLIM','ILMU KOMPUTER','BUKIT JIMBARAN'),
(2147483647,'cool','elektrass','ssss');

/*Table structure for table `tb_data_pegawai` */

DROP TABLE IF EXISTS `tb_data_pegawai`;

CREATE TABLE `tb_data_pegawai` (
  `nip` int(11) NOT NULL,
  `nama_pegawai` varchar(50) DEFAULT NULL,
  `alamat` varchar(50) DEFAULT NULL,
  `password_peg` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`nip`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `tb_data_pegawai` */

insert  into `tb_data_pegawai`(`nip`,`nama_pegawai`,`alamat`,`password_peg`) values 
(123456,'coolaja','jalan tukad','ssss'),
(200312,'AINI','SESETAN',NULL),
(200313,'YOGA PERMANA','P.ALANG',NULL),
(200323,'FARHAN HAKIM','TEGAL WANGI',NULL),
(200342,'MOHAMMAD SALEH','IRAWADI',NULL),
(200355,'YOLANDA PUTRI','P.MOELAWAN',NULL);

/*Table structure for table `tb_data_peminjaman` */

DROP TABLE IF EXISTS `tb_data_peminjaman`;

CREATE TABLE `tb_data_peminjaman` (
  `id_peminjaman` int(11) NOT NULL AUTO_INCREMENT,
  `nim` int(11) DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tgl_peminjaman` datetime DEFAULT NULL,
  `tgl_jatuh_tempo` datetime DEFAULT NULL,
  `status_peminjaman` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_peminjaman`),
  KEY `nim` (`nim`),
  KEY `nip` (`nip`),
  KEY `id_buku` (`id_buku`),
  CONSTRAINT `tb_data_peminjaman_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_data_mahasiswa` (`nim`),
  CONSTRAINT `tb_data_peminjaman_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `tb_data_pegawai` (`nip`),
  CONSTRAINT `tb_data_peminjaman_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `tb_data_buku` (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

/*Data for the table `tb_data_peminjaman` */

insert  into `tb_data_peminjaman`(`id_peminjaman`,`nim`,`nip`,`id_buku`,`tgl_peminjaman`,`tgl_jatuh_tempo`,`status_peminjaman`) values 
(1,1705552222,200312,10001,'2021-12-23 00:00:00','2021-08-15 18:58:27',1),
(2,1705552910,200323,10002,'2018-08-09 00:00:00',NULL,0),
(3,1705552932,200342,10002,'2021-12-23 00:00:00','2021-08-15 19:30:18',1),
(4,1705552925,200355,10004,'2022-07-22 00:00:00','2021-08-15 20:07:39',0),
(5,1705552922,200313,10005,'2021-12-16 00:00:00','2021-08-15 20:01:41',0),
(7,1705552222,200312,10004,'0000-00-00 00:00:00','2021-12-10 00:00:00',0),
(8,1705552222,200312,10004,'0000-00-00 00:00:00','2021-12-10 00:00:00',0),
(9,1705552222,200312,10004,'0000-00-00 00:00:00','2021-12-10 00:00:00',0),
(10,1705552222,200312,10004,'2021-08-15 20:45:34','2021-12-10 00:00:00',0),
(11,1705552222,200312,10004,'2021-08-15 20:46:18','2021-12-10 00:00:00',0),
(12,1705552222,200312,10004,'2021-08-15 20:47:56','2021-12-10 00:00:00',0),
(13,1705552222,200312,10004,'2021-08-15 20:55:10','2021-12-10 00:00:00',0),
(14,1705552222,200312,10004,'2021-08-15 20:55:11','2021-12-10 00:00:00',0);

/*Table structure for table `tb_data_pengembalian` */

DROP TABLE IF EXISTS `tb_data_pengembalian`;

CREATE TABLE `tb_data_pengembalian` (
  `id_pengembalian` int(11) NOT NULL AUTO_INCREMENT,
  `nim` int(11) DEFAULT NULL,
  `nip` int(11) DEFAULT NULL,
  `id_buku` int(11) DEFAULT NULL,
  `tgl_pengembalian` datetime DEFAULT NULL,
  PRIMARY KEY (`id_pengembalian`),
  KEY `nim` (`nim`),
  KEY `nip` (`nip`),
  KEY `id_buku` (`id_buku`),
  CONSTRAINT `tb_data_pengembalian_ibfk_1` FOREIGN KEY (`nim`) REFERENCES `tb_data_mahasiswa` (`nim`),
  CONSTRAINT `tb_data_pengembalian_ibfk_2` FOREIGN KEY (`nip`) REFERENCES `tb_data_pegawai` (`nip`),
  CONSTRAINT `tb_data_pengembalian_ibfk_3` FOREIGN KEY (`id_buku`) REFERENCES `tb_data_buku` (`id_buku`)
) ENGINE=InnoDB AUTO_INCREMENT=106 DEFAULT CHARSET=latin1;

/*Data for the table `tb_data_pengembalian` */

insert  into `tb_data_pengembalian`(`id_pengembalian`,`nim`,`nip`,`id_buku`,`tgl_pengembalian`) values 
(101,1705552222,200312,10001,'2017-09-05 00:00:00'),
(102,1705552910,200323,10002,'2018-10-09 00:00:00'),
(103,1705552932,200342,10002,'2018-08-07 00:00:00'),
(104,1705552925,200355,10004,'2018-06-07 00:00:00'),
(105,1705552922,200313,10005,'2016-06-08 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

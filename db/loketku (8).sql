-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2020 at 03:13 PM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loketku`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_data` (`u_email` VARCHAR(25), IN `u_pass` VARCHAR(255), IN `u_tingkatan_user` VARCHAR(30), IN `u_nama` VARCHAR(30), IN `u_alamat` VARCHAR(50), IN `u_notelp` VARCHAR(30), IN `u_jenis_kelamin` VARCHAR(30))  BEGIN
 INSERT INTO USER (email, PASSWORD, tingkatan_user) VALUES (u_email, md5(u_pass), u_tingkatan_user);
 INSERT INTO detailuser (userID,nama,alamat,noTelp,jenis_kelamin) VALUES (LAST_INSERT_ID(),u_nama,u_alamat,u_notelp,u_jenis_kelamin);
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `tes` (IN `u_email` VARCHAR(25), IN `u_pass` VARCHAR(30), IN `u_tingkatan_user` VARCHAR(30), IN `u_nama` VARCHAR(30), IN `u_alamat` VARCHAR(50), IN `u_notelp` VARCHAR(30), IN `u_jenis_kelamin` VARCHAR(30))  BEGIN
 INSERT INTO USER (email, PASSWORD, tingkatan_user) VALUES (u_email, u_pass, u_tingkatan_user);
 INSERT INTO detailuser (userID,nama,alamat,noTelp,jenis_kelamin) VALUES (LAST_INSERT_ID(),u_nama,u_alamat,u_notelp,u_jenis_kelamin);

	END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `bookingID` varchar(25) NOT NULL,
  `kapalID` varchar(25) DEFAULT NULL,
  `userID` int(11) NOT NULL,
  `tgl_pemesanan` date DEFAULT NULL,
  `waktu` enum('08:00','10:30','12:30','14:00','16:30') DEFAULT NULL,
  `rute` enum('gili terawangan','nusa penida') DEFAULT NULL,
  `nama_dermaga` varchar(30) NOT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `hargaTot` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`bookingID`, `kapalID`, `userID`, `tgl_pemesanan`, `waktu`, `rute`, `nama_dermaga`, `jumlah`, `hargaTot`) VALUES
('1212', 'A1010', 1001, '2020-04-24', '12:30', 'gili terawangan', 'Sunbay', 3, 90000),
('1213', 'B1900', 1002, '2020-05-26', '14:00', 'nusa penida', 'Gilibay', 2, 50000),
('1215', 'B1996', 1003, '2020-04-30', '08:00', 'nusa penida', 'Sunbay', 1, 20000),
('1216', 'A1010', 1001, '2020-06-22', '10:30', 'gili terawangan', 'Sanur Bay', 1, 20000);

-- --------------------------------------------------------

--
-- Table structure for table `detailbooking`
--

CREATE TABLE `detailbooking` (
  `id_detail_booking` int(11) NOT NULL,
  `bookingID` varchar(25) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `jumlah_tiket` int(2) NOT NULL,
  `harga` int(50) NOT NULL,
  `total_harga` int(50) NOT NULL,
  `bayar` int(50) NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detailbooking`
--

INSERT INTO `detailbooking` (`id_detail_booking`, `bookingID`, `tgl_transaksi`, `jumlah_tiket`, `harga`, `total_harga`, `bayar`, `status`) VALUES
(1, '1212', '2020-04-24', 3, 30000, 0, 90000, 'pending'),
(2, '1213', '2020-05-26', 2, 25000, 50000, 50000, 'bayar'),
(3, '1215', '2020-04-30', 1, 20000, 20000, 20000, 'bayar'),
(4, '1216', '2020-06-24', 3, 20000, 60000, 60000, 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `detailuser`
--

CREATE TABLE `detailuser` (
  `id_detail_user` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `nama` varchar(30) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `noTelp` varchar(30) NOT NULL,
  `jenis_kelamin` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `detailuser`
--

INSERT INTO `detailuser` (`id_detail_user`, `userID`, `nama`, `alamat`, `noTelp`, `jenis_kelamin`) VALUES
(1, 1001, 'umbara dewi', 'jalan kangingan, jimbaran', '08199990921', 'perempuan'),
(2, 1002, 'bagus saning', 'jalan anyelir, sawan, klungkung', '08492342', 'laki laki'),
(3, 1003, 'Cantika kurnia', 'jalan mawar, sesetan, denpasar', '089534573', 'perempuan'),
(4, 1004, 'theresia', 'jalan mana, manado', '089353732', 'perempuan'),
(22, 1068, 'Putri', 'Kerambitan, Tabanan', '0897651213', 'Perempuan'),
(25, 1071, 'Ni Made Ani Wahyuni', 'Klungkung', '08912312', 'Perempuan'),
(30, 1076, 'Novia Ardiyanti', 'Kermabitas', '089242', 'Perempuan'),
(31, 1077, 'Abi Mana', 'Jakarta Barat', '098766', 'Laki-laki'),
(32, 1078, 'asda', 'adas', '2321', 'Laki-laki'),
(33, 1079, 'tes', 'tes', '312312', 'Laki-laki'),
(34, 1080, '1', '1', '1', 'Laki-laki'),
(35, 1081, 't', 't', '45', 'Laki-laki'),
(36, 1082, 'cek', 'cek', '32', 'Laki-laki'),
(37, 1083, 'e', 'e', '333', 'Laki-laki'),
(38, 1084, 'L', 'l', '67', 'Laki-laki'),
(39, 1085, '1', '1', '1', 'Laki-laki'),
(40, 1086, 'w', 'w', '3', 'Perempuan'),
(41, 1087, '22', '2', '2', 'Laki-laki'),
(42, 1088, 'e  ', 'e', '3', 'Laki-laki');

-- --------------------------------------------------------

--
-- Table structure for table `kapal`
--

CREATE TABLE `kapal` (
  `kapalID` varchar(25) NOT NULL,
  `jenis` enum('fast boat','Roro','jukung/motor boat') DEFAULT NULL,
  `waktu` enum('08:00','10:30','12:30','14:00','16:30') DEFAULT NULL,
  `rute` varchar(30) NOT NULL,
  `nama_dermaga` varchar(30) NOT NULL,
  `harga` int(11) DEFAULT NULL,
  `kapasitas` int(11) DEFAULT NULL,
  `jml_tiket` int(11) NOT NULL,
  `foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kapal`
--

INSERT INTO `kapal` (`kapalID`, `jenis`, `waktu`, `rute`, `nama_dermaga`, `harga`, `kapasitas`, `jml_tiket`, `foto`) VALUES
('A1010', 'fast boat', '12:30', 'Gili Terawangan', 'Sanur Bay', 30000, 15, 15, '997-foto 10.jpg'),
('A1011', 'fast boat', '08:00', 'Gili Terawangan', 'Gili Bay', 30000, 12, 12, '308-foto 2.jpg'),
('A1012', 'fast boat', '10:30', 'Nusa Penida', 'Gili Bay', 30000, 12, 12, '964-foto 12.jpg'),
('A2453', 'fast boat', '08:00', 'Nusa Penida', 'Sanur Bay', 30000, 15, 15, '104-foto 16.jpg'),
('A8342', 'fast boat', '12:30', 'Gili Terawangan', 'Gili Bay', 25000, 12, 12, '188-foto 21.jpg'),
('A9000', 'fast boat', '16:30', 'Nusa Penida', 'Sanur Bay', 20000, 12, 12, '375-foto 4.jpg'),
('A9003', 'fast boat', '08:00', 'Gili Terawangan', 'Sanur Bay', 25000, 10, 10, '396-foto 4.jpg'),
('AF434', 'fast boat', '14:00', 'Nusa Penida', 'Sanur Bay', 25000, 12, 12, '959-foto 21.jpg'),
('B1093', 'jukung/motor boat', '08:00', 'Nusa Penida', 'Gili Bay', 25000, 17, 17, '112-foto 16.jpg'),
('B1900', 'Roro', '14:00', 'Nusa Penida', 'Gili Bay', 35000, 182, 180, '158-foto 19.jpg'),
('B1901', 'fast boat', '16:30', 'Nusa Penida', 'Sanur Bay', 25000, 10, 10, '877-foto 12.jpg'),
('B1996', 'jukung/motor boat', '08:00', 'Nusa Penida', 'Sanur Bay', 20000, 15, 15, '373-foto 9.jpeg'),
('B1997', 'jukung/motor boat', '10:30', 'Nusa Penida', 'Sanur Bay', 20000, 12, 12, '685-foto 20.jpg'),
('B4375', 'jukung/motor boat', '12:30', 'Nusa Penida', 'Sanur Bay', 25000, 15, 15, '80-foto 2.jpg'),
('B4521', 'jukung/motor boat', '12:30', 'Nusa Penida', 'Gili Bay', 20000, 10, 10, '879-foto 18.jpg'),
('B488', 'jukung/motor boat', '16:30', 'Gili Terawangan', 'Gili Bay', 25000, 15, 15, '42-foto 13.jpg'),
('B8242', 'fast boat', '10:30', 'Gili Terwangan', 'Sanur Bay', 30000, 15, 15, '782-foto 20.jpg'),
('BK943', 'jukung/motor boat', '14:00', 'Gili Terawangan', 'Gili Bay', 25000, 15, 15, '285-foto 16.jpg'),
('BU485', 'jukung/motor boat', '14:00', 'Gili Terawangan', 'Sanur Bay', 20000, 12, 12, '15-foto 22.jpg'),
('GH8493', 'jukung/motor boat', '10:30', 'Gili Terawangan', 'Gili Bay', 25000, 15, 15, '589-518-foto 21.jpg'),
('JK345', 'Roro', '08:00', 'Gili Terawangan', 'Sanur Bay', 26000, 17, 17, '424-879-foto 18.jpg'),
('K324', 'jukung/motor boat', '08:00', 'Gili Terawangan', 'Sanur Bay', 121231, 12, 12, '160-foto 2.jpg'),
('RR934', 'Roro', '10:30', 'Gili Terawangan', 'Sanur Bay', 35000, 182, 178, '283-158-foto 19.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tiket`
--

CREATE TABLE `tiket` (
  `tiketID` varchar(25) NOT NULL,
  `bookingID` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tiket`
--

INSERT INTO `tiket` (`tiketID`, `bookingID`) VALUES
('1991', '1212'),
('1992', '1212'),
('1993', '1212'),
('1994', '1213'),
('1995', '1213'),
('1996', '1215');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `email` varchar(25) DEFAULT NULL,
  `password` char(50) DEFAULT NULL,
  `tingkatan_user` enum('admin','user','','') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `email`, `password`, `tingkatan_user`) VALUES
(1001, 'siumbaraya@gmail.com', 'a580da32eb387c4f0c3b410168e6366f', 'user'),
(1002, 'bsgsd@gmail.com', '2c3451bb1945a8c11209444ab02c5cee', 'user'),
(1003, 'cnakr22@gmail.com', 'eca4ba272ff3b09b74921960fd905f8a', 'user'),
(1004, 'there123', '202cb962ac59075b964b07152d234b70', 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`bookingID`),
  ADD KEY `kapalID` (`kapalID`),
  ADD KEY `userID` (`userID`);

--
-- Indexes for table `detailbooking`
--
ALTER TABLE `detailbooking`
  ADD PRIMARY KEY (`id_detail_booking`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `detailuser`
--
ALTER TABLE `detailuser`
  ADD PRIMARY KEY (`id_detail_user`),
  ADD KEY `id_pengguna` (`userID`);

--
-- Indexes for table `kapal`
--
ALTER TABLE `kapal`
  ADD PRIMARY KEY (`kapalID`);

--
-- Indexes for table `tiket`
--
ALTER TABLE `tiket`
  ADD PRIMARY KEY (`tiketID`),
  ADD KEY `bookingID` (`bookingID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detailbooking`
--
ALTER TABLE `detailbooking`
  MODIFY `id_detail_booking` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `detailuser`
--
ALTER TABLE `detailuser`
  MODIFY `id_detail_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1005;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`kapalID`) REFERENCES `kapal` (`kapalID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`);

--
-- Constraints for table `tiket`
--
ALTER TABLE `tiket`
  ADD CONSTRAINT `tiket_ibfk_1` FOREIGN KEY (`bookingID`) REFERENCES `booking` (`bookingID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 12, 2020 at 02:22 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dcms`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `location` varchar(32) NOT NULL,
  `Clinic_Name`varchar(32)NoT NULL,
  `date` date NOT NULL,
  `time` int(4) NOT NULL,
  `reason` varchar(50) NOT NULL,
  `dname` varchar(32) NOT NULL,
  `uname` varchar(32) NOT NULL,
  `appt_id` int(10) NOT NULL,
  `status` set('Pending','Confirmed','Cancelled','Rejected') NOT NULL DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`location`,`Clinic_Name`, `date`, `time`, `reason`, `dname`, `uname`, `appt_id`, `status`) VALUES
('Fort','Smile', '2020-11-03', 1600, 'Check-Up', 'jhalpert', 'xyz', 1, 'Cancelled'),
('Fort', 'Smile','2020-08-05', 1600, 'Check-Up', 'jhalpert', 'xyz', 2, 'Confirmed');

-- --------------------------------------------------------

--
-- Table structure for table `auth_tokens`
--

CREATE TABLE `auth_tokens` (
  `id` int(11) NOT NULL,
  `selector` char(12) NOT NULL,
  `token` char(64) NOT NULL,
  `userid` int(11) UNSIGNED NOT NULL,
  `expires` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_tokens`
--

INSERT INTO `auth_tokens` (`id`, `selector`, `token`, `userid`, `expires`) VALUES
(77, 'J19MTGSrAfYT', '1faa14697cdf5ff8aab17c9967e4d250be4fbdf5f221eefe59e15d8d55b1bb8c', 0, '2020-10-19 09:56:56');

-- --------------------------------------------------------

--
-- Table structure for table `clinic`
--

CREATE TABLE `clinic` (
  `clinic_id` int(10) NOT NULL,
  `Clinic_Name` varchar(32) NOT NULL,
  `location` varchar(32) NOT NULL,
  `open_hr` varchar(4) NOT NULL DEFAULT '1000',
  `close_hr` varchar(4) NOT NULL DEFAULT '1800'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `clinic`
--

INSERT INTO `clinic` (`clinic_id`,`Clinic_Name` ,`location`, `open_hr`, `close_hr`) VALUES
(1,'Smile', 'Fort', '1000', '1800'),
(2, 'Teeth','Kemps Corner', '1000', '1800'),
(3, 'Fasion','Bandra', '1100', '1700'),
(4, 'Bye','Andheri', '1000', '1500'),
(5,'Ani','tirunelveli','1000','1700');

-- --------------------------------------------------------

--
-- Table structure for table `dentist`
--

CREATE TABLE `dentist` (
  `username` varchar(32) NOT NULL,
  `name` varchar(50) NOT NULL,
  `phone` bigint(10) NOT NULL,
  `age` int(3) NOT NULL,
  `sex` set('M','F') NOT NULL,
  `d_type` set('General','Orthodontist') NOT NULL,
  `location` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dentist`
--

INSERT INTO `dentist` (`username`, `name`, `phone`, `age`, `sex`, `d_type`, `location`) VALUES
('amartin', 'Angela Martin', 9067854312, 38, 'F', 'Orthodontist', 'Kemps Corner'),
('dentist1', 'John Doe', 9876543120, 30, 'M', 'Orthodontist', 'Bandra'),
('jhalpert', 'Jim Halpert', 9876543210, 30, 'M', 'General', 'Fort'),
('mscott', 'Michael Scott', 9876543201, 35, 'M', 'General', 'Fort'),
('leoasir','LeoAsir',9629190145,25,'M','General','Fort'),
('vikas','Vikas',9806578990,29,'M','General','tirunelveli');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_temp`
--

CREATE TABLE `password_reset_temp` (
  `email` varchar(250) NOT NULL,
  `key1` varchar(250) NOT NULL,
  `expDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE `shop` (
  `id` int(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `image` text NOT NULL,
  `price` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `code`, `image`, `price`) VALUES
(1, 'Colgate Extra Clean Pack of 6 Toothbrush', 'TB101', 'tb101img.jpg', 100.00),
(2, 'Sensodyne Whitening Toothpaste', 'TP201', 'tp201img.jpg', 200.00),
(3, 'Oral B Essential Floss', 'DF301', 'df301img.jpg', 130.00),
(4, 'Colgate Plax Complete Care Mouthwash', 'MW401', 'mw401img.jpg', 99.00);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` char(64) NOT NULL,
  `email` varchar(50) NOT NULL,
  `role` set('admin','patient','dentist') NOT NULL DEFAULT 'patient'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `email`, `role`) VALUES
(4, 'xyz', 'Xyz1@', 'xyz@gmail.com', 'patient'),
(5, 'mscott', 'Msdhoni1@', 'mscott@gmail.com', 'dentist'),
(6, 'jhalpert', 'Jhal1@', 'jhalpert@gmail.com', 'dentist'),
(7, 'amartin', 'Martin1@', 'amartin@gmail.com', 'dentist'),
(8, 'admin1', 'admin1', 'admin1@gmail.com', 'admin'),
(9, 'dentist1', 'Dentist1@', 'd1@gmail.com', 'dentist'),
(10, 'abc', 'Abc1@', 'abc@gmail.com', 'patient');

-- --------------------------------------------------------

--
-- Table structure for table `updateaccount`
--

CREATE TABLE `updateaccount` (
  `username` varchar(32) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `mobile_no` bigint(10) DEFAULT NULL,
  'address' varchar(100) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `Address` varchar(200) NuLL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `updateaccount`
--

INSERT INTO `updateaccount` (`username`, `name`, `mobile_no`, `dob`,`Address`) VALUES
('xyz', 'Jane Doe', 9876543210,2000-10-06,'Palayamkottai ,tirunelveli');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`appt_id`) USING BTREE;

--
-- Indexes for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `clinic`
--
ALTER TABLE `clinic`
  ADD PRIMARY KEY (`clinic_id`);

--
-- Indexes for table `dentist`
--
ALTER TABLE `dentist`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `product_code` (`code`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u1` (`username`),
  ADD UNIQUE KEY `u2` (`email`);

--
-- Indexes for table `updateaccount`
--
ALTER TABLE `useraccount`
  ADD PRIMARY KEY (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `appt_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `auth_tokens`
--
ALTER TABLE `auth_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `clinic`
--
ALTER TABLE `clinic`
  MODIFY `clinic_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dentist`
--
ALTER TABLE `dentist`
  ADD CONSTRAINT `dentist_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`);

--
-- Constraints for table `updateaccount`
--
ALTER TABLE `updateaccount`
  ADD CONSTRAINT `upadateaccount_ibfk_1` FOREIGN KEY (`username`) REFERENCES `user` (`username`),
  ADD CONSTRAINT `updateaccount_ibfk_2` FOREIGN KEY (`username`) REFERENCES `user` (`username`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

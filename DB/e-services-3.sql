-- phpMyAdmin SQL Dump
-- version 4.8.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 14, 2019 at 03:32 PM
-- Server version: 10.1.33-MariaDB
-- PHP Version: 7.2.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e-services`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` char(36) NOT NULL,
  `user_id` char(10) NOT NULL,
  `line_1` varchar(64) NOT NULL,
  `line_2` varchar(64) NOT NULL,
  `pincode` char(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `user_id`, `line_1`, `line_2`, `pincode`, `city_id`, `name`) VALUES
('1', '7600338175', 'unity', 'samras', '360005', 2, 'hostel'),
('5698b532-c4ab-4918-a33f-8ec6481f18c2', '9737489924', 'indor', 'abc', '360006', 3, 'schoole');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` char(36) NOT NULL,
  `service_id` char(36) NOT NULL,
  `service_provider_id` char(10) NOT NULL,
  `customer_id` char(10) NOT NULL,
  `date` datetime NOT NULL,
  `booking_status_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `service_id`, `service_provider_id`, `customer_id`, `date`, `booking_status_id`) VALUES
('1', '2', '1546300960', '120', '2019-09-11 12:01:00', 20);

-- --------------------------------------------------------

--
-- Table structure for table `booking_status`
--

CREATE TABLE `booking_status` (
  `id` tinyint(4) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking_status`
--

INSERT INTO `booking_status` (`id`, `name`) VALUES
(1, 'abcd'),
(3, 'ab');

-- --------------------------------------------------------

--
-- Table structure for table `city`
--

CREATE TABLE `city` (
  `id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

INSERT INTO `city` (`id`, `name`) VALUES
(1, 'surt'),
(2, 'rajlot'),
(3, 'ahemdabad');

-- --------------------------------------------------------

--
-- Table structure for table `image`
--

CREATE TABLE `image` (
  `id` char(36) NOT NULL,
  `path` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `image`
--

INSERT INTO `image` (`id`, `path`) VALUES
('10aa83a1-2ea8-4116-9a10-76b8dd9f1bd0', 'IMG_20190629_095730.jpg'),
('34b85f90-8909-4b59-8dbd-579989bcf3fa', 'http://localhost:8080/eservices/imagesIMG-20190629-WA0013.jpeg'),
('c4293fc3-5ceb-49bf-b7da-b5bf5c0fcb11', 'http://localhost:8080/eservices/imagesIMG_20190629_105912.jpg'),
('f49744fc-e2b7-497b-912f-4b9466b165bc', 'http://localhost:8080/eservices/images/IMG_20190629_164717.jpg'),
('f6e893a0-4d37-43e4-8ca9-28469041b848', 'http://localhost:8080/eservices/images/IMG_20190629_095730.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `service`
--

CREATE TABLE `service` (
  `id` char(36) NOT NULL,
  `name` varchar(32) NOT NULL,
  `image_id` char(36) NOT NULL,
  `description` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service`
--

INSERT INTO `service` (`id`, `name`, `image_id`, `description`) VALUES
('09e3b0e2-5227-439d-b519-1a918f888acb', 'aa', 'f49744fc-e2b7-497b-912f-4b9466b165bc', 'krjthiu4hr'),
('4e27b05f-46f6-4f40-b67b-2b3cf0e417ae', 'b', 'f6e893a0-4d37-43e4-8ca9-28469041b848', 'b');

-- --------------------------------------------------------

--
-- Table structure for table `service_provider_skill`
--

CREATE TABLE `service_provider_skill` (
  `service_provider_id` char(10) NOT NULL,
  `service_id` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `service_provider_skill`
--

INSERT INTO `service_provider_skill` (`service_provider_id`, `service_id`) VALUES
('9737489924', '09e3b0e2-5227-439d-b519-1a918f888acb');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `mobile_no` char(10) NOT NULL,
  `password` varchar(30) NOT NULL,
  `name` varchar(15) NOT NULL,
  `email_id` varchar(50) NOT NULL,
  `status_id` tinyint(4) NOT NULL,
  `user_type_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`mobile_no`, `password`, `name`, `email_id`, `status_id`, `user_type_id`) VALUES
('7600338175', '111', 'hardik', 'abc@gamil.com', 1, 3),
('7874634642', '123', 'abc', 'abc@gmail.com', 1, 1),
('9737489924', '222', 'nikul', 'ka@g.com', 1, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_status`
--

CREATE TABLE `user_status` (
  `id` tinyint(4) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_status`
--

INSERT INTO `user_status` (`id`, `status`) VALUES
(1, 'active'),
(2, 'block');

-- --------------------------------------------------------

--
-- Table structure for table `user_type`
--

CREATE TABLE `user_type` (
  `id` tinyint(4) NOT NULL,
  `type` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_type`
--

INSERT INTO `user_type` (`id`, `type`) VALUES
(1, 'admin'),
(2, 'customer'),
(3, 'Service Provider');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `booking_status`
--
ALTER TABLE `booking_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `city`
--
ALTER TABLE `city`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service`
--
ALTER TABLE `service`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `service_provider_skill`
--
ALTER TABLE `service_provider_skill`
  ADD PRIMARY KEY (`service_id`,`service_provider_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`mobile_no`,`user_type_id`);

--
-- Indexes for table `user_status`
--
ALTER TABLE `user_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_type`
--
ALTER TABLE `user_type`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking_status`
--
ALTER TABLE `booking_status`
  MODIFY `id` tinyint(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `city`
--
ALTER TABLE `city`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

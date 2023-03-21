-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 21, 2023 at 06:54 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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
('6b57052d-28eb-4623-9772-2b36a7eb485d', '7600338175', 'yogi chowk', 'savaliya circal', '365546', 1, 'home'),
('fd6579b9-b915-4b36-ba75-4ecc7ee03d2a', '7874634643', 'yogi chowk', 'syamdham', '365545', 1, 'home');

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `id` char(36) NOT NULL,
  `service_id` char(36) NOT NULL,
  `service_provider_id` char(10) NOT NULL,
  `customer_id` char(10) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `booking_status_id` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`id`, `service_id`, `service_provider_id`, `customer_id`, `date`, `booking_status_id`) VALUES
('44f17e2f-9837-444c-a438-7279b0ee2b27', '664f3230-b5c8-44e0-bc39-04286b674dfd', '7874634643', '7600338175', '2023-03-20 23:51:02', 1);

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
(1, 'Booked'),
(3, 'Cancel');

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
(1, 'surat'),
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
('441b09d6-cdd9-47f3-8140-293c53d5ad9a', 'http://localhost:8080/eservices/images/cleaning.png'),
('d1d1c64e-e8e4-4347-bff6-f448438eb7ab', 'http://localhost:8080/eservices/images/Electronics.png'),
('ff1fb42c-b504-4b1b-9978-3e64061a8dbd', 'http://localhost:8080/eservices/images/plumber.jpg');

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
('664f3230-b5c8-44e0-bc39-04286b674dfd', 'Electronics', 'd1d1c64e-e8e4-4347-bff6-f448438eb7ab', ' Install and maintain wiring, control, and lighting'),
('7458853f-4bfc-4111-bfb4-9efc75e60659', 'cleaning ', '441b09d6-cdd9-47f3-8140-293c53d5ad9a', 'Home Deep Cleaning ,Kitchen Deep Cleaning ,Bathroom Dee'),
('bb295851-a378-4339-9cbf-bdedb39ca422', 'plumber', 'ff1fb42c-b504-4b1b-9978-3e64061a8dbd', 'install and repair pipes and fixtures that carry water,');

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
('7874634643', '664f3230-b5c8-44e0-bc39-04286b674dfd');

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
('7600338175', '111', 'hardik', 'hardik@gmail.com', 1, 2),
('7874634642', '123', 'abc', 'abc@gmail.com', 1, 1),
('7874634643', '111', 'nikul', 'nikul@gmail.com', 1, 3);

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

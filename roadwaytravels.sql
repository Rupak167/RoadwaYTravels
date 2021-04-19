-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2021 at 06:52 PM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `roadwaytravels`
--

-- --------------------------------------------------------

--
-- Table structure for table `bus`
--

CREATE TABLE `bus` (
  `BUS_NO` int(5) NOT NULL,
  `SOURCE` varchar(20) DEFAULT NULL,
  `DESTINATION` varchar(20) DEFAULT NULL,
  `COUCHE_TYPE` varchar(10) DEFAULT NULL,
  `FAIR` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bus`
--

INSERT INTO `bus` (`BUS_NO`, `SOURCE`, `DESTINATION`, `COUCHE_TYPE`, `FAIR`) VALUES
(1, 'Rajshahi', 'Dhaka', 'AC', 520),
(2, 'Noakhali', 'Dhaka', 'AC', 420),
(3, 'Rajshahi', 'Dhaka', 'NON-AC', 420),
(4, 'Noakhali', 'Dhaka', 'NON-AC', 320),
(5, 'Sylhet', 'Dhaka', 'AC', 620),
(6, 'Sylhet', 'Dhaka', 'NON-AC', 400),
(7, 'Rajshahi', 'Barisal', 'AC', 720),
(8, 'Rajshahi', 'Barishal', 'NON-AC', 520),
(9, 'Chittagong', 'Dhaka', 'AC', 600),
(10, 'Dhaka', 'Chittagong', 'NON-AC', 500);

-- --------------------------------------------------------

--
-- Table structure for table `cancellation`
--

CREATE TABLE `cancellation` (
  `PNR_NO` int(9) NOT NULL,
  `NO_OF_SEATS` int(8) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CONTACT_NO` int(10) DEFAULT NULL,
  `STATUS` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cancellation`
--

INSERT INTO `cancellation` (`PNR_NO`, `NO_OF_SEATS`, `ADDRESS`, `CONTACT_NO`, `STATUS`) VALUES
(10, 4, 'chittagong,bangladesh', 1945876534, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `passenger`
--

CREATE TABLE `passenger` (
  `TICKET_NO` int(9) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `AGE` int(4) DEFAULT NULL,
  `SEX` char(4) NOT NULL,
  `CONTACT_NO` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `passenger`
--

INSERT INTO `passenger` (`TICKET_NO`, `NAME`, `AGE`, `SEX`, `CONTACT_NO`) VALUES
(2, 'Rupak', 23, 'male', 1878076262),
(5, 'hasan', 24, 'male', 1767875445);

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `PNR_NO` int(9) NOT NULL,
  `NO_OF_SEATS` int(8) DEFAULT NULL,
  `ADDRESS` varchar(50) DEFAULT NULL,
  `CONTACT_NO` int(10) DEFAULT NULL,
  `STATUS` char(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`PNR_NO`, `NO_OF_SEATS`, `ADDRESS`, `CONTACT_NO`, `STATUS`) VALUES
(7, 3, 'naogaon,rajshahi', 1878076262, 'P'),
(8, 3, 'naogaon,rajshahi', 1878076262, 'P'),
(9, 2, 'katakhali,rajshahi', 1878076221, 'R'),
(10, 4, 'chittagong,bangladesh', 1945876534, 'C');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `TICKET_NO` int(9) NOT NULL,
  `AGE` int(4) DEFAULT NULL,
  `SEX` char(4) NOT NULL,
  `SOURCE` varchar(20) DEFAULT NULL,
  `DESTINATION` varchar(20) DEFAULT NULL,
  `DEP_TIME` varchar(24) DEFAULT NULL,
  `JOURNEY_DATE` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`TICKET_NO`, `AGE`, `SEX`, `SOURCE`, `DESTINATION`, `DEP_TIME`, `JOURNEY_DATE`) VALUES
(1, 23, 'Male', 'Dhaka', 'Rajshahi', '20:24', '2021-03-26'),
(2, 23, 'male', 'rajshahi', 'dhaka', '21:09', '2021-04-01'),
(3, 17, 'male', 'noakhali', 'dhaka', '14:22', '2021-03-27'),
(4, 19, 'male', 'chittagong', 'dhaka', '22:28', '2021-04-01'),
(5, 24, 'male', 'rajshahi', 'dhaka', '23:47', '2021-04-01');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bus`
--
ALTER TABLE `bus`
  ADD PRIMARY KEY (`BUS_NO`);

--
-- Indexes for table `cancellation`
--
ALTER TABLE `cancellation`
  ADD PRIMARY KEY (`PNR_NO`);

--
-- Indexes for table `passenger`
--
ALTER TABLE `passenger`
  ADD PRIMARY KEY (`TICKET_NO`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`PNR_NO`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`TICKET_NO`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bus`
--
ALTER TABLE `bus`
  MODIFY `BUS_NO` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cancellation`
--
ALTER TABLE `cancellation`
  MODIFY `PNR_NO` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `PNR_NO` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `ticket`
--
ALTER TABLE `ticket`
  MODIFY `TICKET_NO` int(9) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

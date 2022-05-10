-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Mar 27, 2019 at 07:24 AM
-- Server version: 5.5.61-38.13-log
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `invenlly_digitalwater`
--

-- --------------------------------------------------------

--
-- Table structure for table `employee_profile`
--

CREATE TABLE `employee_profile` (
  `user_oid` int(11) NOT NULL,
  `display_name` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `creation_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_modification_time` timestamp NULL DEFAULT NULL,
  `user_group_oid` int(11) NOT NULL DEFAULT '0',
  `link` varchar(500) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee_profile`
--

INSERT INTO `employee_profile` (`user_oid`, `display_name`, `email`, `password`, `creation_time`, `last_modification_time`, `user_group_oid`, `link`) VALUES
(200, 'user1', 'user1@gmail.com', '12345', '2018-03-01 04:53:16', '2018-08-02 11:14:53', 0, '/digitalwater/sub_pages/user1/u1.php'),
(201, 'user2', 'user2@gmail.com', '123456', '2018-03-07 18:05:22', '2018-07-03 05:30:46', 1, '/digitalwater/sub_pages/user2/u2.php'),
(202, 'admin', 'admin@gmail.com', 'admin12345', '2018-03-07 18:06:22', '2018-07-03 05:29:54', 1, '/digitalwater/sub_pages/admin/a.php'),
(203, 'user3', 'user3@gmail.com', '1234567', '2018-04-24 12:15:19', '2018-07-03 05:34:11', 3, '/digitalwater/sub_pages/user3/u3.php'),
(200, 'user1', 'user1@gmail.com', '12345', '2018-03-01 04:53:16', '2018-08-02 11:14:53', 0, '/digiwater/sub_pages/user1/u1.php'),
(201, 'user2', 'user2@gmail.com', '123456', '2018-03-07 18:05:22', '2018-07-03 05:30:46', 1, '/digiwater/sub_pages/user2/u2.php'),
(202, 'admin', 'admin@gmail.com', 'admin12345', '2018-03-07 18:06:22', '2018-07-03 05:29:54', 1, '/digiwater/sub_pages/admin/a.php');

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` int(11) NOT NULL,
  `msg` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `msg`, `time`) VALUES
(1, 'Suction Pressure is high', '2018-05-02 08:35:29'),
(2, 'Leakage detected', '2018-07-03 05:37:14'),
(3, 'Water is Acidic', '2018-07-03 05:40:18');

-- --------------------------------------------------------

--
-- Table structure for table `notifiy`
--

CREATE TABLE `notifiy` (
  `id` int(10) NOT NULL,
  `check` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `notifiy`
--

INSERT INTO `notifiy` (`id`, `check`) VALUES
(1, 0),
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `paid`
--

CREATE TABLE `paid` (
  `id` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paid`
--

INSERT INTO `paid` (`id`, `amount`) VALUES
(1, 0),
(2, 308),
(3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id` int(11) NOT NULL,
  `secs` int(11) NOT NULL,
  `amount` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`id`, `secs`, `amount`) VALUES
(1, 0, 1156),
(2, 0, 254),
(3, 0, 1088);

-- --------------------------------------------------------

--
-- Table structure for table `tank_status`
--

CREATE TABLE `tank_status` (
  `id` int(11) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tank_status`
--

INSERT INTO `tank_status` (`id`, `status`) VALUES
(1, 4),
(2, 7),
(3, 56),
(4, 5);

-- --------------------------------------------------------

--
-- Table structure for table `user_profile`
--

CREATE TABLE `user_profile` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `contact` int(10) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_profile`
--

INSERT INTO `user_profile` (`id`, `name`, `email`, `contact`) VALUES
(1, 'user1', 'user1@gmail.com', 2147483647),
(2, 'user2', 'user2@gmail.com', 123456789),
(1, 'user1', 'user1@gmail.com', 2147483647),
(2, 'user2', 'user2@gmail.com', 123456789);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

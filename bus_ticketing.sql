-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 07:09 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bus_ticketing`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `contact_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `name`, `email`, `password`, `contact_number`) VALUES
(1, 'admin', 'admin@gmail.com', 'admin', '9807779563');

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `num_seats` int(11) DEFAULT NULL,
  `booking_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `bus_id` int(11) NOT NULL,
  `registration_number` varchar(20) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `buses`
--

INSERT INTO `buses` (`bus_id`, `registration_number`, `model`, `capacity`, `status`) VALUES
(1, 'BA 4 kha 5678', 'Volvo', 40, 'active'),
(2, 'BA 5 Kha 1234', 'Tata', 40, 'active'),
(3, 'Lu 7 kha 5634', 'Volvo', 40, 'active'),
(4, 'Lu 3 kha 8889', 'Eicher', 40, 'active'),
(5, 'BA 6 kha 4455', 'Tata', 40, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `bus_seats`
--

CREATE TABLE `bus_seats` (
  `seat_id` int(11) NOT NULL,
  `schedule_id` int(11) DEFAULT NULL,
  `seat_number` varchar(10) DEFAULT NULL,
  `status` enum('available','booked','selected') DEFAULT 'available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bus_seats`
--

INSERT INTO `bus_seats` (`seat_id`, `schedule_id`, `seat_number`, `status`) VALUES
(1, 9, 'A1', 'available'),
(2, 9, 'A2', 'available'),
(3, 9, 'A3', 'available'),
(4, 9, 'A4', 'available'),
(5, 9, 'A5', 'available'),
(6, 9, 'A6', 'available'),
(7, 9, 'A7', 'available'),
(8, 9, 'A8', 'available'),
(9, 9, 'A9', 'available'),
(10, 9, 'A10', 'available'),
(11, 9, 'A11', 'available'),
(12, 9, 'A12', 'available'),
(13, 9, 'A13', 'available'),
(14, 9, 'A14', 'available'),
(15, 9, 'A15', 'available'),
(16, 9, 'A16', 'available'),
(17, 9, 'A17', 'available'),
(18, 9, 'A18', 'available'),
(19, 9, 'A19', 'available'),
(20, 9, 'A20', 'available'),
(21, 9, 'B1', 'available'),
(22, 9, 'B2', 'available'),
(23, 9, 'B3', 'available'),
(24, 9, 'B4', 'available'),
(25, 9, 'B5', 'available'),
(26, 9, 'B6', 'available'),
(27, 9, 'B7', 'available'),
(28, 9, 'B8', 'available'),
(29, 9, 'B9', 'available'),
(30, 9, 'B10', 'available'),
(31, 9, 'B11', 'available'),
(32, 9, 'B12', 'available'),
(33, 9, 'B13', 'available'),
(34, 9, 'B14', 'available'),
(35, 9, 'B15', 'available'),
(36, 9, 'B16', 'available'),
(37, 9, 'B17', 'available'),
(38, 9, 'B18', 'available'),
(39, 9, 'B19', 'available'),
(40, 9, 'B20', 'available'),
(41, 10, 'A1', 'available'),
(42, 10, 'A2', 'available'),
(43, 10, 'A3', 'available'),
(44, 10, 'A4', 'available'),
(45, 10, 'A5', 'available'),
(46, 10, 'A6', 'available'),
(47, 10, 'A7', 'available'),
(48, 10, 'A8', 'available'),
(49, 10, 'A9', 'available'),
(50, 10, 'A10', 'available'),
(51, 10, 'A11', 'available'),
(52, 10, 'A12', 'available'),
(53, 10, 'A13', 'available'),
(54, 10, 'A14', 'available'),
(55, 10, 'A15', 'available'),
(56, 10, 'A16', 'available'),
(57, 10, 'A17', 'available'),
(58, 10, 'A18', 'available'),
(59, 10, 'A19', 'available'),
(60, 10, 'A20', 'available'),
(61, 10, 'B1', 'available'),
(62, 10, 'B2', 'available'),
(63, 10, 'B3', 'available'),
(64, 10, 'B4', 'available'),
(65, 10, 'B5', 'available'),
(66, 10, 'B6', 'available'),
(67, 10, 'B7', 'available'),
(68, 10, 'B8', 'available'),
(69, 10, 'B9', 'available'),
(70, 10, 'B10', 'available'),
(71, 10, 'B11', 'available'),
(72, 10, 'B12', 'available'),
(73, 10, 'B13', 'available'),
(74, 10, 'B14', 'available'),
(75, 10, 'B15', 'available'),
(76, 10, 'B16', 'available'),
(77, 10, 'B17', 'available'),
(78, 10, 'B18', 'available'),
(79, 10, 'B19', 'available'),
(80, 10, 'B20', 'available'),
(81, 11, 'A1', 'available'),
(82, 11, 'A2', 'available'),
(83, 11, 'A3', 'available'),
(84, 11, 'A4', 'available'),
(85, 11, 'A5', 'available'),
(86, 11, 'A6', 'available'),
(87, 11, 'A7', 'available'),
(88, 11, 'A8', 'available'),
(89, 11, 'A9', 'available'),
(90, 11, 'A10', 'available'),
(91, 11, 'A11', 'available'),
(92, 11, 'A12', 'available'),
(93, 11, 'A13', 'available'),
(94, 11, 'A14', 'available'),
(95, 11, 'A15', 'available'),
(96, 11, 'A16', 'available'),
(97, 11, 'A17', 'available'),
(98, 11, 'A18', 'available'),
(99, 11, 'A19', 'available'),
(100, 11, 'A20', 'available'),
(101, 11, 'B1', 'available'),
(102, 11, 'B2', 'available'),
(103, 11, 'B3', 'available'),
(104, 11, 'B4', 'available'),
(105, 11, 'B5', 'available'),
(106, 11, 'B6', 'available'),
(107, 11, 'B7', 'available'),
(108, 11, 'B8', 'available'),
(109, 11, 'B9', 'available'),
(110, 11, 'B10', 'available'),
(111, 11, 'B11', 'available'),
(112, 11, 'B12', 'available'),
(113, 11, 'B13', 'available'),
(114, 11, 'B14', 'available'),
(115, 11, 'B15', 'available'),
(116, 11, 'B16', 'available'),
(117, 11, 'B17', 'available'),
(118, 11, 'B18', 'available'),
(119, 11, 'B19', 'available'),
(120, 11, 'B20', 'available'),
(121, 12, 'A1', 'available'),
(122, 12, 'A2', 'available'),
(123, 12, 'A3', 'available'),
(124, 12, 'A4', 'available'),
(125, 12, 'A5', 'available'),
(126, 12, 'A6', 'available'),
(127, 12, 'A7', 'available'),
(128, 12, 'A8', 'available'),
(129, 12, 'A9', 'available'),
(130, 12, 'A10', 'available'),
(131, 12, 'A11', 'available'),
(132, 12, 'A12', 'available'),
(133, 12, 'A13', 'available'),
(134, 12, 'A14', 'available'),
(135, 12, 'A15', 'available'),
(136, 12, 'A16', 'available'),
(137, 12, 'A17', 'available'),
(138, 12, 'A18', 'available'),
(139, 12, 'A19', 'available'),
(140, 12, 'A20', 'available'),
(141, 12, 'B1', 'available'),
(142, 12, 'B2', 'available'),
(143, 12, 'B3', 'available'),
(144, 12, 'B4', 'available'),
(145, 12, 'B5', 'available'),
(146, 12, 'B6', 'available'),
(147, 12, 'B7', 'available'),
(148, 12, 'B8', 'available'),
(149, 12, 'B9', 'available'),
(150, 12, 'B10', 'available'),
(151, 12, 'B11', 'available'),
(152, 12, 'B12', 'available'),
(153, 12, 'B13', 'available'),
(154, 12, 'B14', 'available'),
(155, 12, 'B15', 'available'),
(156, 12, 'B16', 'available'),
(157, 12, 'B17', 'available'),
(158, 12, 'B18', 'available'),
(159, 12, 'B19', 'available'),
(160, 12, 'B20', 'available'),
(161, 13, 'A1', 'available'),
(162, 13, 'A2', 'available'),
(163, 13, 'A3', 'available'),
(164, 13, 'A4', 'available'),
(165, 13, 'A5', 'available'),
(166, 13, 'A6', 'available'),
(167, 13, 'A7', 'available'),
(168, 13, 'A8', 'available'),
(169, 13, 'A9', 'available'),
(170, 13, 'A10', 'available'),
(171, 13, 'A11', 'available'),
(172, 13, 'A12', 'available'),
(173, 13, 'A13', 'available'),
(174, 13, 'A14', 'available'),
(175, 13, 'A15', 'available'),
(176, 13, 'A16', 'available'),
(177, 13, 'A17', 'available'),
(178, 13, 'A18', 'available'),
(179, 13, 'A19', 'available'),
(180, 13, 'A20', 'available'),
(181, 13, 'B1', 'available'),
(182, 13, 'B2', 'available'),
(183, 13, 'B3', 'available'),
(184, 13, 'B4', 'available'),
(185, 13, 'B5', 'available'),
(186, 13, 'B6', 'available'),
(187, 13, 'B7', 'available'),
(188, 13, 'B8', 'available'),
(189, 13, 'B9', 'available'),
(190, 13, 'B10', 'available'),
(191, 13, 'B11', 'available'),
(192, 13, 'B12', 'available'),
(193, 13, 'B13', 'available'),
(194, 13, 'B14', 'available'),
(195, 13, 'B15', 'available'),
(196, 13, 'B16', 'available'),
(197, 13, 'B17', 'available'),
(198, 13, 'B18', 'available'),
(199, 13, 'B19', 'available'),
(200, 13, 'B20', 'available'),
(201, 14, 'A1', 'available'),
(202, 14, 'A2', 'available'),
(203, 14, 'A3', 'available'),
(204, 14, 'A4', 'available'),
(205, 14, 'A5', 'available'),
(206, 14, 'A6', 'available'),
(207, 14, 'A7', 'available'),
(208, 14, 'A8', 'available'),
(209, 14, 'A9', 'available'),
(210, 14, 'A10', 'available'),
(211, 14, 'A11', 'available'),
(212, 14, 'A12', 'available'),
(213, 14, 'A13', 'available'),
(214, 14, 'A14', 'available'),
(215, 14, 'A15', 'available'),
(216, 14, 'A16', 'available'),
(217, 14, 'A17', 'available'),
(218, 14, 'A18', 'available'),
(219, 14, 'A19', 'available'),
(220, 14, 'A20', 'available'),
(221, 14, 'B1', 'available'),
(222, 14, 'B2', 'available'),
(223, 14, 'B3', 'available'),
(224, 14, 'B4', 'available'),
(225, 14, 'B5', 'available'),
(226, 14, 'B6', 'available'),
(227, 14, 'B7', 'available'),
(228, 14, 'B8', 'available'),
(229, 14, 'B9', 'available'),
(230, 14, 'B10', 'available'),
(231, 14, 'B11', 'available'),
(232, 14, 'B12', 'available'),
(233, 14, 'B13', 'available'),
(234, 14, 'B14', 'available'),
(235, 14, 'B15', 'available'),
(236, 14, 'B16', 'available'),
(237, 14, 'B17', 'available'),
(238, 14, 'B18', 'available'),
(239, 14, 'B19', 'available'),
(240, 14, 'B20', 'available'),
(241, 15, 'A1', 'available'),
(242, 15, 'A2', 'available'),
(243, 15, 'A3', 'available'),
(244, 15, 'A4', 'available'),
(245, 15, 'A5', 'available'),
(246, 15, 'A6', 'available'),
(247, 15, 'A7', 'available'),
(248, 15, 'A8', 'available'),
(249, 15, 'A9', 'available'),
(250, 15, 'A10', 'available'),
(251, 15, 'A11', 'available'),
(252, 15, 'A12', 'available'),
(253, 15, 'A13', 'available'),
(254, 15, 'A14', 'available'),
(255, 15, 'A15', 'available'),
(256, 15, 'A16', 'available'),
(257, 15, 'A17', 'available'),
(258, 15, 'A18', 'available'),
(259, 15, 'A19', 'available'),
(260, 15, 'A20', 'available'),
(261, 15, 'B1', 'available'),
(262, 15, 'B2', 'available'),
(263, 15, 'B3', 'available'),
(264, 15, 'B4', 'available'),
(265, 15, 'B5', 'available'),
(266, 15, 'B6', 'available'),
(267, 15, 'B7', 'available'),
(268, 15, 'B8', 'available'),
(269, 15, 'B9', 'available'),
(270, 15, 'B10', 'available'),
(271, 15, 'B11', 'available'),
(272, 15, 'B12', 'available'),
(273, 15, 'B13', 'available'),
(274, 15, 'B14', 'available'),
(275, 15, 'B15', 'available'),
(276, 15, 'B16', 'available'),
(277, 15, 'B17', 'available'),
(278, 15, 'B18', 'available'),
(279, 15, 'B19', 'available'),
(280, 15, 'B20', 'available'),
(281, 16, 'A1', 'available'),
(282, 16, 'A2', 'available'),
(283, 16, 'A3', 'available'),
(284, 16, 'A4', 'available'),
(285, 16, 'A5', 'available'),
(286, 16, 'A6', 'available'),
(287, 16, 'A7', 'available'),
(288, 16, 'A8', 'available'),
(289, 16, 'A9', 'available'),
(290, 16, 'A10', 'available'),
(291, 16, 'A11', 'available'),
(292, 16, 'A12', 'available'),
(293, 16, 'A13', 'available'),
(294, 16, 'A14', 'available'),
(295, 16, 'A15', 'available'),
(296, 16, 'A16', 'available'),
(297, 16, 'A17', 'available'),
(298, 16, 'A18', 'available'),
(299, 16, 'A19', 'available'),
(300, 16, 'A20', 'available'),
(301, 16, 'B1', 'available'),
(302, 16, 'B2', 'available'),
(303, 16, 'B3', 'available'),
(304, 16, 'B4', 'available'),
(305, 16, 'B5', 'available'),
(306, 16, 'B6', 'available'),
(307, 16, 'B7', 'available'),
(308, 16, 'B8', 'available'),
(309, 16, 'B9', 'available'),
(310, 16, 'B10', 'available'),
(311, 16, 'B11', 'available'),
(312, 16, 'B12', 'available'),
(313, 16, 'B13', 'available'),
(314, 16, 'B14', 'available'),
(315, 16, 'B15', 'available'),
(316, 16, 'B16', 'available'),
(317, 16, 'B17', 'available'),
(318, 16, 'B18', 'available'),
(319, 16, 'B19', 'available'),
(320, 16, 'B20', 'available'),
(321, 17, 'A1', 'available'),
(322, 17, 'A2', 'available'),
(323, 17, 'A3', 'available'),
(324, 17, 'A4', 'available'),
(325, 17, 'A5', 'available'),
(326, 17, 'A6', 'available'),
(327, 17, 'A7', 'available'),
(328, 17, 'A8', 'available'),
(329, 17, 'A9', 'available'),
(330, 17, 'A10', 'available'),
(331, 17, 'A11', 'available'),
(332, 17, 'A12', 'available'),
(333, 17, 'A13', 'available'),
(334, 17, 'A14', 'available'),
(335, 17, 'A15', 'available'),
(336, 17, 'A16', 'available'),
(337, 17, 'A17', 'available'),
(338, 17, 'A18', 'available'),
(339, 17, 'A19', 'available'),
(340, 17, 'A20', 'available'),
(341, 17, 'B1', 'available'),
(342, 17, 'B2', 'available'),
(343, 17, 'B3', 'available'),
(344, 17, 'B4', 'available'),
(345, 17, 'B5', 'available'),
(346, 17, 'B6', 'available'),
(347, 17, 'B7', 'available'),
(348, 17, 'B8', 'available'),
(349, 17, 'B9', 'available'),
(350, 17, 'B10', 'available'),
(351, 17, 'B11', 'available'),
(352, 17, 'B12', 'available'),
(353, 17, 'B13', 'available'),
(354, 17, 'B14', 'available'),
(355, 17, 'B15', 'available'),
(356, 17, 'B16', 'available'),
(357, 17, 'B17', 'available'),
(358, 17, 'B18', 'available'),
(359, 17, 'B19', 'available'),
(360, 17, 'B20', 'available'),
(361, 18, 'A1', 'available'),
(362, 18, 'A2', 'available'),
(363, 18, 'A3', 'available'),
(364, 18, 'A4', 'available'),
(365, 18, 'A5', 'available'),
(366, 18, 'A6', 'available'),
(367, 18, 'A7', 'available'),
(368, 18, 'A8', 'available'),
(369, 18, 'A9', 'available'),
(370, 18, 'A10', 'available'),
(371, 18, 'A11', 'available'),
(372, 18, 'A12', 'available'),
(373, 18, 'A13', 'available'),
(374, 18, 'A14', 'available'),
(375, 18, 'A15', 'available'),
(376, 18, 'A16', 'available'),
(377, 18, 'A17', 'available'),
(378, 18, 'A18', 'available'),
(379, 18, 'A19', 'available'),
(380, 18, 'A20', 'available'),
(381, 18, 'B1', 'available'),
(382, 18, 'B2', 'available'),
(383, 18, 'B3', 'available'),
(384, 18, 'B4', 'available'),
(385, 18, 'B5', 'available'),
(386, 18, 'B6', 'available'),
(387, 18, 'B7', 'available'),
(388, 18, 'B8', 'available'),
(389, 18, 'B9', 'available'),
(390, 18, 'B10', 'available'),
(391, 18, 'B11', 'available'),
(392, 18, 'B12', 'available'),
(393, 18, 'B13', 'available'),
(394, 18, 'B14', 'available'),
(395, 18, 'B15', 'available'),
(396, 18, 'B16', 'available'),
(397, 18, 'B17', 'available'),
(398, 18, 'B18', 'available'),
(399, 18, 'B19', 'available'),
(400, 18, 'B20', 'available');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `contact_info` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `name`, `email`, `password`, `contact_info`) VALUES
(1, 'suman singh', 'suman@gmail.com', 'suman', '9807777777');

-- --------------------------------------------------------

--
-- Table structure for table `drivers`
--

CREATE TABLE `drivers` (
  `driver_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `contact_number` varchar(100) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drivers`
--

INSERT INTO `drivers` (`driver_id`, `name`, `email`, `password`, `contact_number`, `bus_id`, `status`) VALUES
(1, 'sss', 'a@gmail.com', 'aaa', '980000', 1, 'active'),
(6, 'Shuvam Neupane', 'shuvam@gmail.com', 'shuvam', '9807777987', 3, 'active'),
(7, 'Hisi', 'hisi@gmail.com', 'hisi', '980000087', 5, 'active'),
(8, 'Rohan', 'rohan@gmail.com', 'rohan', '98000000889', 2, 'active');

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` int(11) NOT NULL,
  `origin` varchar(100) DEFAULT NULL,
  `destination` varchar(100) DEFAULT NULL,
  `distance` text DEFAULT NULL,
  `duration` text DEFAULT NULL,
  `status` text NOT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `origin`, `destination`, `distance`, `duration`, `status`, `bus_id`, `price`) VALUES
(1, 'kathmandu', 'pokhara', '200 Kilometers', '8 Hours', 'active', 1, 1000.00),
(2, 'kathmandu', 'biratnagar', '400 Kilometers', '15 Hours', 'active', 2, 2000.00),
(3, 'kathmandu', 'surkhet', '500 Kilometers', '18 Hours', 'active', 3, 3000.00),
(4, 'kathmandu', 'birgunj', '200 Kilometers', '8 Hours', 'active', 4, 800.00),
(5, 'kathmandu', 'dhangadhi', '678 Kilometers', '22 Hours', 'active', 5, 4000.00),
(6, 'pokhara', 'kathmandu', '200 Kilometers', '8 Hours', 'active', 1, 1000.00),
(7, 'biratnagar', 'kathmandu', '400 Kilometers', '15 Hours', 'active', 2, 2000.00),
(8, 'surkhet', 'kathmandu', '500 Kilometers', '18 Hours', 'active', 3, 3000.00),
(9, 'birgunj', 'kathmandu', '200 Kilometers', '8 Hours', 'active', 4, 800.00),
(10, 'dhangadhi', 'kathmandu', '678 Kilometers', '22 Hours', 'active', 5, 4000.00);

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `route_id` int(11) DEFAULT NULL,
  `bus_id` int(11) DEFAULT NULL,
  `departure_time` datetime DEFAULT NULL,
  `arrival_time` datetime DEFAULT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `schedules`
--

INSERT INTO `schedules` (`schedule_id`, `route_id`, `bus_id`, `departure_time`, `arrival_time`, `status`) VALUES
(9, 1, 1, '2024-05-15 07:00:00', '2024-05-15 06:30:00', 'active'),
(10, 2, 2, '2024-05-15 15:00:00', '2024-05-15 14:30:00', 'active'),
(11, 3, 3, '2024-05-15 14:00:00', '2024-05-15 13:30:00', 'active'),
(12, 4, 4, '2024-05-15 08:00:00', '2024-05-15 07:30:00', 'active'),
(13, 5, 5, '2024-05-15 11:30:00', '2024-05-15 11:00:00', 'active'),
(14, 6, 1, '2024-05-16 07:00:00', '2024-05-16 06:30:00', 'active'),
(15, 7, 2, '2024-05-16 15:00:00', '2024-05-16 14:30:00', 'active'),
(16, 8, 3, '2024-05-16 14:30:00', '2024-05-16 14:00:00', 'active'),
(17, 9, 4, '2024-05-16 08:30:00', '2024-05-16 08:00:00', 'active'),
(18, 10, 5, '2024-05-16 11:30:00', '2024-05-16 11:00:00', 'active'),
(19, 1, 1, '2024-05-27 07:15:00', '2024-05-27 07:00:00', 'active'),
(20, 6, 1, '2024-05-27 16:30:00', '2024-05-27 16:00:00', 'active'),
(21, 2, 2, '2024-05-27 06:30:00', '2024-05-27 06:00:00', 'active'),
(22, 7, 2, '2024-05-27 18:30:00', '2024-05-27 18:00:00', 'active'),
(23, 3, 3, '2024-05-27 06:00:00', '2024-05-27 05:30:00', 'active'),
(24, 8, 3, '2024-05-27 18:00:00', '2024-05-27 17:30:00', 'active'),
(25, 4, 4, '2024-05-27 06:00:00', '2024-05-26 05:45:00', 'active'),
(28, 9, 4, '2024-05-27 18:00:00', '2024-05-27 17:45:00', 'active'),
(29, 5, 5, '2024-05-27 06:00:00', '2024-05-27 05:45:00', 'active'),
(30, 10, 5, '2024-05-27 18:00:00', '2024-05-27 17:45:00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `stationmanager`
--

CREATE TABLE `stationmanager` (
  `manager_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) DEFAULT NULL,
  `contact_number` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stationmanager`
--

INSERT INTO `stationmanager` (`manager_id`, `name`, `email`, `password`, `contact_number`) VALUES
(1, 'shuvam', 'shuvam@gmail.com', 'shuvam', '9800000000');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `transaction_id` int(11) NOT NULL,
  `esewa_transaction_id` varchar(50) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `customer_email` varchar(100) NOT NULL,
  `bus_id` int(11) NOT NULL,
  `route_id` int(11) NOT NULL,
  `seat_numbers` varchar(255) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('confirmed','failed') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`bus_id`),
  ADD UNIQUE KEY `registration_number` (`registration_number`);

--
-- Indexes for table `bus_seats`
--
ALTER TABLE `bus_seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `schedule_id` (`schedule_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `drivers`
--
ALTER TABLE `drivers`
  ADD PRIMARY KEY (`driver_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `route_id` (`route_id`),
  ADD KEY `bus_id` (`bus_id`);

--
-- Indexes for table `stationmanager`
--
ALTER TABLE `stationmanager`
  ADD PRIMARY KEY (`manager_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`transaction_id`),
  ADD KEY `bus_id` (`bus_id`),
  ADD KEY `route_id` (`route_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `buses`
--
ALTER TABLE `buses`
  MODIFY `bus_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `bus_seats`
--
ALTER TABLE `bus_seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=401;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `drivers`
--
ALTER TABLE `drivers`
  MODIFY `driver_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `routes`
--
ALTER TABLE `routes`
  MODIFY `route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `stationmanager`
--
ALTER TABLE `stationmanager`
  MODIFY `manager_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Constraints for table `bus_seats`
--
ALTER TABLE `bus_seats`
  ADD CONSTRAINT `bus_seats_ibfk_1` FOREIGN KEY (`schedule_id`) REFERENCES `schedules` (`schedule_id`);

--
-- Constraints for table `drivers`
--
ALTER TABLE `drivers`
  ADD CONSTRAINT `drivers_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`);

--
-- Constraints for table `routes`
--
ALTER TABLE `routes`
  ADD CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`);

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`),
  ADD CONSTRAINT `schedules_ibfk_2` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`bus_id`) REFERENCES `buses` (`bus_id`),
  ADD CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`route_id`) REFERENCES `routes` (`route_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

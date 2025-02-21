-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2025 at 11:49 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clinic-final1`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `apt_id` char(10) NOT NULL,
  `datetime` datetime DEFAULT NULL,
  `finished` tinyint(1) DEFAULT NULL,
  `pat_ssn` bigint(20) DEFAULT NULL,
  `phys_id` char(10) DEFAULT NULL,
  `slot_id` char(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`apt_id`, `datetime`, `finished`, `pat_ssn`, `phys_id`, `slot_id`) VALUES
('1081e61f-c', '2024-12-26 11:00:00', 0, 12345678002, 'PHY005', '202412261100e'),
('2918e194-c', '2024-12-26 10:00:00', 0, 12345678001, 'PHY006', '202412261000f'),
('30ffc382-c', '2024-12-26 16:00:00', 1, 12345678001, 'PHY001', '202412261600a'),
('8c120d0a-c', '2024-12-26 11:00:00', 0, 12345678002, 'PHY009', '202412261100i'),
('c1a4619a-c', '2024-12-26 11:00:00', 0, 12345678002, 'PHY007', '202412261100g'),
('f82f95b2-c', '2024-12-26 11:00:00', 0, 12345678001, 'PHY008', '202412261100h');

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `ssn` bigint(20) NOT NULL,
  `email` char(100) DEFAULT NULL,
  `lname` char(30) DEFAULT NULL,
  `fname` char(30) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `address` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`ssn`, `email`, `lname`, `fname`, `birth_date`, `phone`, `address`) VALUES
(12345678001, 'kat.andr@gmail.com', 'Andreadis', 'Katerina', '1994-12-30', 6955667788, 'Leoforos Eleftherias 90'),
(12345678002, 'petros.konto@gmail.com', 'Kontogiannis', 'Petros', '2002-01-15', 6966228899, 'Ikarou 101'),
(12345678920, 'giannis98@gmail.com', 'Papadopoulos', 'Giannis', '1998-11-23', 6932123456, 'Athinas 22'),
(12345678930, 'maria.stef@gmail.com', 'Stefanou', 'Maria', '1995-06-15', 6987654321, 'Solomou 45'),
(12345678940, 'elena_m99@yahoo.com', 'Mitrou', 'Elena', '1999-01-12', 6944111222, 'Platonos 9'),
(12345678950, 'alex.niko@hotmail.com', 'Nikolaou', 'Alexandros', '2001-07-19', 6977222333, 'Thessalonikis 78'),
(12345678960, 'sophia.kar@gmail.com', 'Karagiorgis', 'Sophia', '2000-02-28', 6944556677, 'Odysseos 4'),
(12345678970, 'michalis.kat@gmail.com', 'Katsaros', 'Michalis', '1996-10-10', 6933778899, 'Poseidonos 88'),
(12345678980, 'christina.lam@gmail.com', 'Lambrou', 'Christina', '2004-04-05', 6948990011, 'Nearchou 67'),
(12345678990, 'dimitris.zervas@yahoo.com', 'Zervas', 'Dimitris', '1997-08-25', 6998877665, 'Kiprou 21');

-- --------------------------------------------------------

--
-- Table structure for table `pat_rates_phys`
--

CREATE TABLE `pat_rates_phys` (
  `rating` int(11) DEFAULT NULL,
  `pat_ssn` bigint(20) NOT NULL,
  `phys_id` char(10) NOT NULL,
  `apt_id` char(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `pat_rates_phys`
--

INSERT INTO `pat_rates_phys` (`rating`, `pat_ssn`, `phys_id`, `apt_id`) VALUES
(1, 12345678001, 'PHY001', '30ffc382-c');

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `phys_id` char(10) NOT NULL,
  `email` char(100) DEFAULT NULL,
  `lname` char(30) DEFAULT NULL,
  `fname` char(30) DEFAULT NULL,
  `phone` bigint(20) DEFAULT NULL,
  `spec_name` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `physician`
--

INSERT INTO `physician` (`phys_id`, `email`, `lname`, `fname`, `phone`, `spec_name`) VALUES
('PHY001', 'dr.papadakis@clinic.gr', 'Papadakis', 'Nikolas', 6945112233, 'Cardiology'),
('PHY002', 'dr.karalis@clinic.gr', 'Karalis', 'Giannis', 6933445566, 'Dermatology'),
('PHY003', 'dr.efthimiou@clinic.gr', 'Efthimiou', 'Dimitra', 6944778899, 'Neurology'),
('PHY004', 'dr.papanikolaou@clinic.gr', 'Papanikolaou', 'Kostas', 6955889911, 'Orthopedics'),
('PHY005', 'dr.stathopoulou@clinic.gr', 'Stathopoulou', 'Maria', 6988990011, 'Pediatrics'),
('PHY006', 'dr.moutsos@clinic.gr', 'Moutsos', 'Michalis', 6999001122, 'Radiology'),
('PHY007', 'dr.georgiou@clinic.gr', 'Georgiou', 'Eleni', 6977112233, 'Psychiatry'),
('PHY008', 'dr.papoutsis@clinic.gr', 'Papoutsis', 'Petros', 6999223344, 'Endocrinology'),
('PHY009', 'dr.dionysopoulos@clinic.gr', 'Dionysopoulos', 'Dionysis', 6933446677, 'Surgery'),
('PHY010', 'dr.zervas@clinic.gr', 'Zervas', 'Anna', 6988776655, 'Ophthalmology');

-- --------------------------------------------------------

--
-- Table structure for table `phys_is_available`
--

CREATE TABLE `phys_is_available` (
  `available` tinyint(1) DEFAULT 1,
  `phys_id` char(10) NOT NULL,
  `slot_id` char(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `phys_is_available`
--

INSERT INTO `phys_is_available` (`available`, `phys_id`, `slot_id`) VALUES
(1, 'PHY001', '202412260900a'),
(1, 'PHY001', '202412260930a'),
(0, 'PHY001', '202412261000a'),
(0, 'PHY001', '202412261030a'),
(1, 'PHY001', '202412261100a'),
(1, 'PHY001', '202412261130a'),
(1, 'PHY001', '202412261200a'),
(1, 'PHY001', '202412261230a'),
(1, 'PHY001', '202412261300a'),
(1, 'PHY001', '202412261330a'),
(1, 'PHY001', '202412261400a'),
(1, 'PHY001', '202412261430a'),
(1, 'PHY001', '202412261500a'),
(1, 'PHY001', '202412261530a'),
(1, 'PHY001', '202412261600a'),
(1, 'PHY001', '202412261630a'),
(1, 'PHY002', '202412260900b'),
(1, 'PHY002', '202412260930b'),
(1, 'PHY002', '202412261000b'),
(1, 'PHY002', '202412261030b'),
(1, 'PHY002', '202412261100b'),
(1, 'PHY002', '202412261130b'),
(1, 'PHY002', '202412261200b'),
(1, 'PHY002', '202412261230b'),
(1, 'PHY002', '202412261300b'),
(1, 'PHY002', '202412261330b'),
(1, 'PHY002', '202412261400b'),
(1, 'PHY002', '202412261430b'),
(1, 'PHY002', '202412261500b'),
(1, 'PHY002', '202412261530b'),
(1, 'PHY002', '202412261600b'),
(1, 'PHY002', '202412261630b'),
(1, 'PHY003', '202412260900c'),
(1, 'PHY003', '202412260930c'),
(0, 'PHY003', '202412261000c'),
(1, 'PHY003', '202412261030c'),
(0, 'PHY003', '202412261100c'),
(0, 'PHY003', '202412261130c'),
(1, 'PHY003', '202412261200c'),
(1, 'PHY003', '202412261230c'),
(1, 'PHY003', '202412261300c'),
(1, 'PHY003', '202412261330c'),
(1, 'PHY003', '202412261400c'),
(1, 'PHY003', '202412261430c'),
(1, 'PHY003', '202412261500c'),
(1, 'PHY003', '202412261530c'),
(1, 'PHY003', '202412261600c'),
(1, 'PHY003', '202412261630c'),
(1, 'PHY004', '202412260900d'),
(1, 'PHY004', '202412260930d'),
(1, 'PHY004', '202412261000d'),
(1, 'PHY004', '202412261030d'),
(1, 'PHY004', '202412261100d'),
(1, 'PHY004', '202412261130d'),
(1, 'PHY004', '202412261200d'),
(1, 'PHY004', '202412261230d'),
(1, 'PHY004', '202412261300d'),
(1, 'PHY004', '202412261330d'),
(1, 'PHY004', '202412261400d'),
(1, 'PHY004', '202412261430d'),
(1, 'PHY004', '202412261500d'),
(1, 'PHY004', '202412261530d'),
(1, 'PHY004', '202412261600d'),
(1, 'PHY004', '202412261630d'),
(1, 'PHY005', '202412260900e'),
(1, 'PHY005', '202412260930e'),
(1, 'PHY005', '202412261000e'),
(1, 'PHY005', '202412261030e'),
(0, 'PHY005', '202412261100e'),
(1, 'PHY005', '202412261130e'),
(1, 'PHY005', '202412261200e'),
(1, 'PHY005', '202412261230e'),
(1, 'PHY005', '202412261300e'),
(1, 'PHY005', '202412261330e'),
(1, 'PHY005', '202412261400e'),
(1, 'PHY005', '202412261430e'),
(1, 'PHY005', '202412261500e'),
(1, 'PHY005', '202412261530e'),
(1, 'PHY005', '202412261600e'),
(1, 'PHY005', '202412261630e'),
(1, 'PHY006', '202412260900f'),
(1, 'PHY006', '202412260930f'),
(0, 'PHY006', '202412261000f'),
(1, 'PHY006', '202412261030f'),
(1, 'PHY006', '202412261100f'),
(1, 'PHY006', '202412261130f'),
(1, 'PHY006', '202412261200f'),
(1, 'PHY006', '202412261230f'),
(1, 'PHY006', '202412261300f'),
(1, 'PHY006', '202412261330f'),
(1, 'PHY006', '202412261400f'),
(1, 'PHY006', '202412261430f'),
(1, 'PHY006', '202412261500f'),
(1, 'PHY006', '202412261530f'),
(1, 'PHY006', '202412261600f'),
(1, 'PHY006', '202412261630f'),
(1, 'PHY007', '202412260900g'),
(1, 'PHY007', '202412260930g'),
(1, 'PHY007', '202412261000g'),
(1, 'PHY007', '202412261030g'),
(1, 'PHY007', '202412261100g'),
(1, 'PHY007', '202412261130g'),
(1, 'PHY007', '202412261200g'),
(1, 'PHY007', '202412261230g'),
(1, 'PHY007', '202412261300g'),
(1, 'PHY007', '202412261330g'),
(1, 'PHY007', '202412261400g'),
(1, 'PHY007', '202412261430g'),
(1, 'PHY007', '202412261500g'),
(1, 'PHY007', '202412261530g'),
(1, 'PHY007', '202412261600g'),
(1, 'PHY007', '202412261630g'),
(1, 'PHY008', '202412260900h'),
(1, 'PHY008', '202412260930h'),
(1, 'PHY008', '202412261000h'),
(1, 'PHY008', '202412261030h'),
(0, 'PHY008', '202412261100h'),
(1, 'PHY008', '202412261130h'),
(1, 'PHY008', '202412261200h'),
(1, 'PHY008', '202412261230h'),
(1, 'PHY008', '202412261300h'),
(1, 'PHY008', '202412261330h'),
(1, 'PHY008', '202412261400h'),
(1, 'PHY008', '202412261430h'),
(1, 'PHY008', '202412261500h'),
(1, 'PHY008', '202412261530h'),
(1, 'PHY008', '202412261600h'),
(1, 'PHY008', '202412261630h'),
(1, 'PHY009', '202412260900i'),
(1, 'PHY009', '202412260930i'),
(1, 'PHY009', '202412261000i'),
(1, 'PHY009', '202412261030i'),
(0, 'PHY009', '202412261100i'),
(0, 'PHY009', '202412261130i'),
(1, 'PHY009', '202412261200i'),
(1, 'PHY009', '202412261230i'),
(1, 'PHY009', '202412261300i'),
(1, 'PHY009', '202412261330i'),
(1, 'PHY009', '202412261400i'),
(1, 'PHY009', '202412261430i'),
(1, 'PHY009', '202412261500i'),
(1, 'PHY009', '202412261530i'),
(1, 'PHY009', '202412261600i'),
(1, 'PHY009', '202412261630i'),
(1, 'PHY010', '202412260900j'),
(1, 'PHY010', '202412260930j'),
(1, 'PHY010', '202412261000j'),
(1, 'PHY010', '202412261030j'),
(1, 'PHY010', '202412261100j'),
(1, 'PHY010', '202412261130j'),
(1, 'PHY010', '202412261200j'),
(1, 'PHY010', '202412261230j'),
(1, 'PHY010', '202412261300j'),
(1, 'PHY010', '202412261330j'),
(1, 'PHY010', '202412261400j'),
(1, 'PHY010', '202412261430j'),
(1, 'PHY010', '202412261500j'),
(1, 'PHY010', '202412261530j'),
(1, 'PHY010', '202412261600j'),
(1, 'PHY010', '202412261630j');

-- --------------------------------------------------------

--
-- Table structure for table `timeslot`
--

CREATE TABLE `timeslot` (
  `slot` int(11) DEFAULT NULL,
  `datetime` datetime DEFAULT NULL,
  `id` char(20) NOT NULL,
  `pat_ssn` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `timeslot`
--

INSERT INTO `timeslot` (`slot`, `datetime`, `id`, `pat_ssn`) VALUES
(1, '2024-12-26 09:00:00', '202412260900a', NULL),
(1, '2024-12-26 09:00:00', '202412260900b', NULL),
(1, '2024-12-26 09:00:00', '202412260900c', NULL),
(1, '2024-12-26 09:00:00', '202412260900d', NULL),
(1, '2024-12-26 09:00:00', '202412260900e', NULL),
(1, '2024-12-26 09:00:00', '202412260900f', NULL),
(1, '2024-12-26 09:00:00', '202412260900g', NULL),
(1, '2024-12-26 09:00:00', '202412260900h', NULL),
(1, '2024-12-26 09:00:00', '202412260900i', NULL),
(1, '2024-12-26 09:00:00', '202412260900j', NULL),
(2, '2024-12-26 09:30:00', '202412260930a', NULL),
(2, '2024-12-26 09:30:00', '202412260930b', NULL),
(2, '2024-12-26 09:30:00', '202412260930c', NULL),
(2, '2024-12-26 09:30:00', '202412260930d', NULL),
(2, '2024-12-26 09:30:00', '202412260930e', NULL),
(2, '2024-12-26 09:30:00', '202412260930f', NULL),
(2, '2024-12-26 09:30:00', '202412260930g', NULL),
(2, '2024-12-26 09:30:00', '202412260930h', NULL),
(2, '2024-12-26 09:30:00', '202412260930i', NULL),
(2, '2024-12-26 09:30:00', '202412260930j', NULL),
(3, '2024-12-26 10:00:00', '202412261000a', NULL),
(3, '2024-12-26 10:00:00', '202412261000b', NULL),
(3, '2024-12-26 10:00:00', '202412261000c', NULL),
(3, '2024-12-26 10:00:00', '202412261000d', NULL),
(3, '2024-12-26 10:00:00', '202412261000e', NULL),
(3, '2024-12-26 10:00:00', '202412261000f', NULL),
(3, '2024-12-26 10:00:00', '202412261000g', NULL),
(3, '2024-12-26 10:00:00', '202412261000h', NULL),
(3, '2024-12-26 10:00:00', '202412261000i', NULL),
(3, '2024-12-26 10:00:00', '202412261000j', NULL),
(4, '2024-12-26 10:30:00', '202412261030a', NULL),
(4, '2024-12-26 10:30:00', '202412261030b', NULL),
(4, '2024-12-26 10:30:00', '202412261030c', NULL),
(4, '2024-12-26 10:30:00', '202412261030d', NULL),
(4, '2024-12-26 10:30:00', '202412261030e', NULL),
(4, '2024-12-26 10:30:00', '202412261030f', NULL),
(4, '2024-12-26 10:30:00', '202412261030g', NULL),
(4, '2024-12-26 10:30:00', '202412261030h', NULL),
(4, '2024-12-26 10:30:00', '202412261030i', NULL),
(4, '2024-12-26 10:30:00', '202412261030j', NULL),
(5, '2024-12-26 11:00:00', '202412261100a', NULL),
(5, '2024-12-26 11:00:00', '202412261100b', NULL),
(5, '2024-12-26 11:00:00', '202412261100c', NULL),
(5, '2024-12-26 11:00:00', '202412261100d', NULL),
(5, '2024-12-26 11:00:00', '202412261100e', NULL),
(5, '2024-12-26 11:00:00', '202412261100f', NULL),
(5, '2024-12-26 11:00:00', '202412261100g', NULL),
(5, '2024-12-26 11:00:00', '202412261100h', NULL),
(5, '2024-12-26 11:00:00', '202412261100i', NULL),
(5, '2024-12-26 11:00:00', '202412261100j', NULL),
(6, '2024-12-26 11:30:00', '202412261130a', NULL),
(6, '2024-12-26 11:30:00', '202412261130b', NULL),
(6, '2024-12-26 11:30:00', '202412261130c', NULL),
(6, '2024-12-26 11:30:00', '202412261130d', NULL),
(6, '2024-12-26 11:30:00', '202412261130e', NULL),
(6, '2024-12-26 11:30:00', '202412261130f', NULL),
(6, '2024-12-26 11:30:00', '202412261130g', NULL),
(6, '2024-12-26 11:30:00', '202412261130h', NULL),
(6, '2024-12-26 11:30:00', '202412261130i', NULL),
(6, '2024-12-26 11:30:00', '202412261130j', NULL),
(7, '2024-12-26 12:00:00', '202412261200a', NULL),
(7, '2024-12-26 12:00:00', '202412261200b', NULL),
(7, '2024-12-26 12:00:00', '202412261200c', NULL),
(7, '2024-12-26 12:00:00', '202412261200d', NULL),
(7, '2024-12-26 12:00:00', '202412261200e', NULL),
(7, '2024-12-26 12:00:00', '202412261200f', NULL),
(7, '2024-12-26 12:00:00', '202412261200g', NULL),
(7, '2024-12-26 12:00:00', '202412261200h', NULL),
(7, '2024-12-26 12:00:00', '202412261200i', NULL),
(7, '2024-12-26 12:00:00', '202412261200j', NULL),
(8, '2024-12-26 12:30:00', '202412261230a', NULL),
(8, '2024-12-26 12:30:00', '202412261230b', NULL),
(8, '2024-12-26 12:30:00', '202412261230c', NULL),
(8, '2024-12-26 12:30:00', '202412261230d', NULL),
(8, '2024-12-26 12:30:00', '202412261230e', NULL),
(8, '2024-12-26 12:30:00', '202412261230f', NULL),
(8, '2024-12-26 12:30:00', '202412261230g', NULL),
(8, '2024-12-26 12:30:00', '202412261230h', NULL),
(8, '2024-12-26 12:30:00', '202412261230i', NULL),
(8, '2024-12-26 12:30:00', '202412261230j', NULL),
(9, '2024-12-26 13:00:00', '202412261300a', NULL),
(9, '2024-12-26 13:00:00', '202412261300b', NULL),
(9, '2024-12-26 13:00:00', '202412261300c', NULL),
(9, '2024-12-26 13:00:00', '202412261300d', NULL),
(9, '2024-12-26 13:00:00', '202412261300e', NULL),
(9, '2024-12-26 13:00:00', '202412261300f', NULL),
(9, '2024-12-26 13:00:00', '202412261300g', NULL),
(9, '2024-12-26 13:00:00', '202412261300h', NULL),
(9, '2024-12-26 13:00:00', '202412261300i', NULL),
(9, '2024-12-26 13:00:00', '202412261300j', NULL),
(10, '2024-12-26 13:30:00', '202412261330a', NULL),
(10, '2024-12-26 13:30:00', '202412261330b', NULL),
(10, '2024-12-26 13:30:00', '202412261330c', NULL),
(10, '2024-12-26 13:30:00', '202412261330d', NULL),
(10, '2024-12-26 13:30:00', '202412261330e', NULL),
(10, '2024-12-26 13:30:00', '202412261330f', NULL),
(10, '2024-12-26 13:30:00', '202412261330g', NULL),
(10, '2024-12-26 13:30:00', '202412261330h', NULL),
(10, '2024-12-26 13:30:00', '202412261330i', NULL),
(10, '2024-12-26 13:30:00', '202412261330j', NULL),
(11, '2024-12-26 14:00:00', '202412261400a', NULL),
(11, '2024-12-26 14:00:00', '202412261400b', NULL),
(11, '2024-12-26 14:00:00', '202412261400c', NULL),
(11, '2024-12-26 14:00:00', '202412261400d', NULL),
(11, '2024-12-26 14:00:00', '202412261400e', NULL),
(11, '2024-12-26 14:00:00', '202412261400f', NULL),
(11, '2024-12-26 14:00:00', '202412261400g', NULL),
(11, '2024-12-26 14:00:00', '202412261400h', NULL),
(11, '2024-12-26 14:00:00', '202412261400i', NULL),
(11, '2024-12-26 14:00:00', '202412261400j', NULL),
(12, '2024-12-26 14:30:00', '202412261430a', NULL),
(12, '2024-12-26 14:30:00', '202412261430b', NULL),
(12, '2024-12-26 14:30:00', '202412261430c', NULL),
(12, '2024-12-26 14:30:00', '202412261430d', NULL),
(12, '2024-12-26 14:30:00', '202412261430e', NULL),
(12, '2024-12-26 14:30:00', '202412261430f', NULL),
(12, '2024-12-26 14:30:00', '202412261430g', NULL),
(12, '2024-12-26 14:30:00', '202412261430h', NULL),
(12, '2024-12-26 14:30:00', '202412261430i', NULL),
(12, '2024-12-26 14:30:00', '202412261430j', NULL),
(13, '2024-12-26 15:00:00', '202412261500a', NULL),
(13, '2024-12-26 15:00:00', '202412261500b', NULL),
(13, '2024-12-26 15:00:00', '202412261500c', NULL),
(13, '2024-12-26 15:00:00', '202412261500d', NULL),
(13, '2024-12-26 15:00:00', '202412261500e', NULL),
(13, '2024-12-26 15:00:00', '202412261500f', NULL),
(13, '2024-12-26 15:00:00', '202412261500g', NULL),
(13, '2024-12-26 15:00:00', '202412261500h', NULL),
(13, '2024-12-26 15:00:00', '202412261500i', NULL),
(13, '2024-12-26 15:00:00', '202412261500j', NULL),
(14, '2024-12-26 15:30:00', '202412261530a', NULL),
(14, '2024-12-26 15:30:00', '202412261530b', NULL),
(14, '2024-12-26 15:30:00', '202412261530c', NULL),
(14, '2024-12-26 15:30:00', '202412261530d', NULL),
(14, '2024-12-26 15:30:00', '202412261530e', NULL),
(14, '2024-12-26 15:30:00', '202412261530f', NULL),
(14, '2024-12-26 15:30:00', '202412261530g', NULL),
(14, '2024-12-26 15:30:00', '202412261530h', NULL),
(14, '2024-12-26 15:30:00', '202412261530i', NULL),
(14, '2024-12-26 15:30:00', '202412261530j', NULL),
(15, '2024-12-26 16:00:00', '202412261600a', NULL),
(15, '2024-12-26 16:00:00', '202412261600b', NULL),
(15, '2024-12-26 16:00:00', '202412261600c', NULL),
(15, '2024-12-26 16:00:00', '202412261600d', NULL),
(15, '2024-12-26 16:00:00', '202412261600e', NULL),
(15, '2024-12-26 16:00:00', '202412261600f', NULL),
(15, '2024-12-26 16:00:00', '202412261600g', NULL),
(15, '2024-12-26 16:00:00', '202412261600h', NULL),
(15, '2024-12-26 16:00:00', '202412261600i', NULL),
(15, '2024-12-26 16:00:00', '202412261600j', NULL),
(16, '2024-12-26 16:30:00', '202412261630a', NULL),
(16, '2024-12-26 16:30:00', '202412261630b', NULL),
(16, '2024-12-26 16:30:00', '202412261630c', NULL),
(16, '2024-12-26 16:30:00', '202412261630d', NULL),
(16, '2024-12-26 16:30:00', '202412261630e', NULL),
(16, '2024-12-26 16:30:00', '202412261630f', NULL),
(16, '2024-12-26 16:30:00', '202412261630g', NULL),
(16, '2024-12-26 16:30:00', '202412261630h', NULL),
(16, '2024-12-26 16:30:00', '202412261630i', NULL),
(16, '2024-12-26 16:30:00', '202412261630j', NULL);


--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`apt_id`),
  ADD KEY `pat_ssn` (`pat_ssn`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`ssn`);

--
-- Indexes for table `pat_rates_phys`
--
ALTER TABLE `pat_rates_phys`
  ADD PRIMARY KEY (`apt_id`,`pat_ssn`,`phys_id`),
  ADD KEY `pat_ssn` (`pat_ssn`),
  ADD KEY `phys_id` (`phys_id`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`phys_id`);

--
-- Indexes for table `phys_is_available`
--
ALTER TABLE `phys_is_available`
  ADD PRIMARY KEY (`phys_id`,`slot_id`),
  ADD KEY `slot_id` (`slot_id`);

--
-- Indexes for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pat_ssn` (`pat_ssn`);


--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointment`
--
ALTER TABLE `appointment`
  ADD CONSTRAINT `appointment_ibfk_1` FOREIGN KEY (`pat_ssn`) REFERENCES `patient` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `appointment_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `timeslot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `pat_rates_phys`
--
ALTER TABLE `pat_rates_phys`
  ADD CONSTRAINT `pat_rates_phys_ibfk_1` FOREIGN KEY (`pat_ssn`) REFERENCES `patient` (`ssn`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pat_rates_phys_ibfk_2` FOREIGN KEY (`phys_id`) REFERENCES `physician` (`phys_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `pat_rates_phys_ibfk_3` FOREIGN KEY (`apt_id`) REFERENCES `appointment` (`apt_id`) ON UPDATE CASCADE;


--
-- Constraints for table `phys_is_available`
--
ALTER TABLE `phys_is_available`
  ADD CONSTRAINT `phys_is_available_ibfk_1` FOREIGN KEY (`phys_id`) REFERENCES `physician` (`phys_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `phys_is_available_ibfk_2` FOREIGN KEY (`slot_id`) REFERENCES `timeslot` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `timeslot`
--
ALTER TABLE `timeslot`
  ADD CONSTRAINT `timeslot_ibfk_1` FOREIGN KEY (`pat_ssn`) REFERENCES `patient` (`ssn`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

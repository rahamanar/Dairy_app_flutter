-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 08, 2020 at 05:59 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `personaldairy`
--

-- --------------------------------------------------------

--
-- Table structure for table `adddairy`
--

CREATE TABLE `adddairy` (
  `id` int(11) NOT NULL,
  `date` varchar(25) NOT NULL,
  `title` varchar(30) NOT NULL,
  `message` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `adddairy`
--

INSERT INTO `adddairy` (`id`, `date`, `title`, `message`) VALUES
(16, '18-02-2020', 'jxcifivvvvvvvv', 'jckckcjvkkkkkkkk'),
(17, '17-02-2020', 'yfjvkvgivviv', 'hhvijvvivivi'),
(25, '27-02-2020', 'cttctcycy', 'ftdrtc fyctct'),
(29, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `register`
--

CREATE TABLE `register` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Mobile` varchar(20) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Gender` varchar(10) NOT NULL,
  `Address` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `register`
--

INSERT INTO `register` (`id`, `Name`, `Mobile`, `Email`, `Gender`, `Address`) VALUES
(7, 'rahaman', '9505675978', 'rahamanar123@gmail.com', 'Male', 'knr'),
(8, 'ar', '123', 'rahaman.coign@gmail.com', 'Male', 'kpl'),
(11, 'sandeep', '123', 'fgh', 'Male', 'kpl'),
(12, 'kamal', '9505513010', 'kamal@gmail.com', 'Male', 'knr');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `adddairy`
--
ALTER TABLE `adddairy`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `register`
--
ALTER TABLE `register`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `adddairy`
--
ALTER TABLE `adddairy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT for table `register`
--
ALTER TABLE `register`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 06, 2017 at 02:23 AM
-- Server version: 5.7.17-0ubuntu0.16.04.1
-- PHP Version: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `eggdrop`
--
CREATE DATABASE IF NOT EXISTS `eggdrop` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `eggdrop`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `cid` int(11) NOT NULL,
  `label` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`cid`, `label`) VALUES
(1, 'Elementary School'),
(2, 'Middle School'),
(3, 'High School'),
(4, 'Adult'),
(0, 'Team');

-- --------------------------------------------------------

--
-- Table structure for table `drops`
--

CREATE TABLE `drops` (
  `uid` int(11) NOT NULL,
  `round` int(11) NOT NULL,
  `dweight` float NOT NULL,
  `eweight` float NOT NULL,
  `nparts` int(11) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `cracked` int(11) NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `drops`
--

INSERT INTO `drops` (`uid`, `round`, `dweight`, `eweight`, `nparts`, `zone`, `cracked`, `time`) VALUES
(10, 1, 25, 12, NULL, 10, 1, '2017-04-06 01:12:21'),
(10, 2, 100, 25, 6, 3, 1, '2017-04-06 01:12:21'),
(27, 1, 145, 105, NULL, 5, 1, '2017-04-06 01:13:04');

-- --------------------------------------------------------

--
-- Table structure for table `logins`
--

CREATE TABLE `logins` (
  `username` varchar(100) NOT NULL,
  `pwd` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logins`
--

INSERT INTO `logins` (`username`, `pwd`) VALUES
('dataentry', '$2y$12$MuezsHvu1m9dQY/5OPP5VOY4varSzasJ/I0mRZBPkcRmfeipNUOgK');

-- --------------------------------------------------------

--
-- Table structure for table `people`
--

CREATE TABLE `people` (
  `uid` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `tname` varchar(255) DEFAULT NULL,
  `cat` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `people`
--

INSERT INTO `people` (`uid`, `year`, `fname`, `lname`, `tname`, `cat`) VALUES
(1, 2017, 'Brady', 'Barker', '', 1),
(2, 2017, 'Don', 'Burton', 'The "B" Team', 0),
(3, 2017, 'David', 'Burton', '', 4),
(4, 2017, 'Kendall', 'Burton', '', 1),
(5, 2017, 'David', 'Charlton', '', 3),
(6, 2017, 'Landon', 'Covely', '', 1),
(7, 2017, 'Leyton', 'Crumley', '', 1),
(8, 2017, 'Bryson', 'Davis', 'Uncrackable Rockets', 0),
(9, 2017, 'Emma', 'Doggett', '', 1),
(10, 2017, 'Benjamin', 'Ewing', '', 1),
(11, 2017, 'Sadie', 'Farmer', '', 1),
(12, 2017, 'Ryder', 'Fitzgerald', '', 1),
(13, 2017, 'Haley', 'Gilliam', '', 2),
(14, 2017, 'Kayana', 'Hardin', 'KayanAlly', 0),
(15, 2017, 'Aaliyah', 'Hensley', '', 1),
(16, 2017, 'Karly', 'King', '', 1),
(17, 2017, 'Katie', 'King', '', 2),
(18, 2017, 'Matika', 'Koval', '', 2),
(19, 2017, 'Dusty', 'Koval', '', 2),
(20, 2017, 'Teagan', 'Koval', '', 2),
(21, 2017, 'Meg', 'Layne', '', 1),
(22, 2017, 'Ryan', 'Lick', '', 1),
(23, 2017, 'Amanda', 'Lick', '', 1),
(24, 2017, 'Melanie', 'Lick', '', 2),
(25, 2017, 'Nathan', 'Lick', '', 3),
(26, 2017, 'Valerie', 'Lick', '', 3),
(27, 2017, 'Erin', 'Lillycrop', '', 3),
(28, 2017, 'Beth', 'Lillycrop', '', 4),
(29, 2017, 'Ethan', 'Lillycrop', '', 2),
(30, 2017, 'Alexis', 'Lillycrop', '', 2),
(31, 2017, 'Katie', 'Lyttle', '', 1),
(32, 2017, 'Avery', 'Maitland', '', 1),
(33, 2017, 'Alex ', 'Mann', '', 3),
(34, 2017, 'Cadence', 'McDavid', '', 1),
(35, 2017, 'Dalton', 'Parker', '', 3),
(36, 2017, 'Wyatt', 'Peters', '', 1),
(37, 2017, 'Gaven', 'Phillips', '', 1),
(38, 2017, 'Sandra', 'Poland', '', 1),
(39, 2017, 'Anthony', 'Poland', '', 1),
(40, 2017, 'Luis', 'Quirarte', 'The Dark Shades', 0),
(41, 2017, 'Austin', 'Ramsey', '', 3),
(42, 2017, 'H', 'Rowe', '', 1),
(43, 2017, 'Smallwood', 'Smallwood', '', 1),
(44, 2017, 'Rachel', 'Smith', '', 1),
(45, 2017, 'Gracie', 'Sproles', '', 1),
(46, 2017, 'Dylan', 'Wallen', '', 1),
(47, 2017, 'Tonya', 'Wheeler', 'Optic Smiles', 0);

-- --------------------------------------------------------

--
-- Table structure for table `stage`
--

CREATE TABLE `stage` (
  `id` int(1) NOT NULL,
  `stage` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='0 = pre, 1 = r1 active, 2 = post r1, 3 = final, 4 = winners';

--
-- Dumping data for table `stage`
--

INSERT INTO `stage` (`id`, `stage`) VALUES
(1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

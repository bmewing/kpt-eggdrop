-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 08, 2017 at 08:41 PM
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
  `did` int(11) NOT NULL,
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

INSERT INTO `drops` (`did`, `uid`, `round`, `dweight`, `eweight`, `nparts`, `zone`, `cracked`, `time`) VALUES
(1, 10, 1, 178, 55, NULL, 12, 1, '2017-04-08 17:05:03'),
(2, 48, 1, 108, 55, NULL, 10, 1, '2017-04-08 17:05:56'),
(4, 50, 1, 246, 52, NULL, 9, 1, '2017-04-08 17:06:48'),
(5, 49, 1, 262, 59, NULL, 9, 1, '2017-04-08 17:08:19'),
(7, 51, 1, 335, 61, NULL, 12, 1, '2017-04-08 17:09:32'),
(8, 52, 1, 308, 56, NULL, 11, 1, '2017-04-08 17:09:50'),
(9, 22, 1, 488, 52, NULL, 8, 1, '2017-04-08 17:10:22'),
(10, 30, 1, 285, 55, NULL, 9, 0, '2017-04-08 17:10:47'),
(11, 53, 1, 122, 58, NULL, 12, 1, '2017-04-08 17:11:45'),
(12, 54, 1, 332, 55, NULL, 9, 1, '2017-04-08 17:11:52'),
(13, 3, 1, 74, 56, NULL, 9, 1, '2017-04-08 17:12:15'),
(14, 55, 1, 238, 56, NULL, 12, 1, '2017-04-08 17:12:54'),
(15, 56, 1, 291, 60, NULL, 9, 1, '2017-04-08 17:13:13'),
(16, 57, 1, 311, 57, NULL, 12, 1, '2017-04-08 17:13:36'),
(17, 58, 1, 100, 57, NULL, 9, 0, '2017-04-08 17:14:06'),
(18, 59, 1, 78, 58, NULL, 7, 1, '2017-04-08 17:14:51'),
(19, 60, 1, 319, 57, NULL, 12, 1, '2017-04-08 17:15:30'),
(20, 61, 1, 355, 56, NULL, 8, 0, '2017-04-08 17:16:08'),
(21, 62, 1, 255, 57, NULL, 8, 1, '2017-04-08 17:16:26'),
(22, 63, 1, 231, 58, NULL, 9, 1, '2017-04-08 17:16:50'),
(23, 64, 1, 111, 52, NULL, 11, 1, '2017-04-08 17:18:10'),
(24, 65, 1, 299, 54, NULL, 12, 1, '2017-04-08 17:19:05'),
(25, 24, 1, 244, 59, NULL, 12, 1, '2017-04-08 17:19:11'),
(26, 23, 1, 304, 56, NULL, 11, 1, '2017-04-08 17:19:26'),
(27, 66, 1, 337, 60, NULL, 7, 1, '2017-04-08 17:19:48'),
(28, 67, 1, 231, 58, NULL, 8, 1, '2017-04-08 17:19:54'),
(29, 68, 1, 235, 58, NULL, 11, 1, '2017-04-08 17:20:35'),
(30, 69, 1, 365, 55, NULL, 12, 1, '2017-04-08 17:21:08'),
(31, 32, 1, 143, 52, NULL, 8, 1, '2017-04-08 17:21:22'),
(32, 70, 1, 299, 52, NULL, 10, 1, '2017-04-08 17:22:00'),
(33, 73, 1, 336, 61, NULL, 9, 1, '2017-04-08 17:22:33'),
(34, 74, 1, 331, 56, NULL, 7, 1, '2017-04-08 17:22:50'),
(35, 71, 1, 95, 52, NULL, 12, 1, '2017-04-08 17:22:52'),
(36, 72, 1, 258, 57, NULL, 12, 1, '2017-04-08 17:23:09'),
(37, 27, 1, 128, 58, NULL, 12, 1, '2017-04-08 17:23:24'),
(38, 16, 1, 218, 55, NULL, 9, 0, '2017-04-08 17:23:44'),
(39, 75, 1, 98, 52, NULL, 8, 1, '2017-04-08 17:24:07'),
(40, 31, 1, 266, 52, NULL, 12, 1, '2017-04-08 17:24:33'),
(41, 78, 1, 325, 53, NULL, 12, 1, '2017-04-08 17:24:56'),
(42, 76, 1, 84, 57, NULL, 8, 1, '2017-04-08 17:25:13'),
(43, 77, 1, 237, 60, NULL, 12, 1, '2017-04-08 17:25:39'),
(44, 79, 1, 109, 55, NULL, 11, 1, '2017-04-08 17:26:03'),
(45, 80, 1, 385, 58, NULL, 10, 1, '2017-04-08 17:26:42'),
(46, 81, 1, 142, 57, NULL, 9, 1, '2017-04-08 17:31:18'),
(47, 82, 1, 162, 57, NULL, 9, 1, '2017-04-08 17:32:52'),
(48, 62, 2, 75, 56, 4, 6, 1, '2017-04-08 17:57:25'),
(49, 49, 2, 102, 55, 8, 12, 1, '2017-04-08 17:57:53'),
(50, 24, 2, 136, 54, 31, 12, 1, '2017-04-08 17:57:56'),
(51, 53, 2, 127, 57, 7, 11, 1, '2017-04-08 17:58:22'),
(52, 71, 2, 100, 57, 3, 9, 1, '2017-04-08 17:59:45'),
(53, 27, 2, 125, 55, 1, 12, 1, '2017-04-08 18:00:11'),
(54, 75, 2, 103, 59, 6, 8, 1, '2017-04-08 18:00:12'),
(55, 3, 2, 79, 57, 2, 10, 1, '2017-04-08 18:02:05'),
(56, 79, 2, 111, 57, 5, 10, 1, '2017-04-08 18:02:39'),
(57, 59, 2, 74, 55, 2, 7, 1, '2017-04-08 18:03:16'),
(58, 76, 2, 91, 56, 2, 9, 1, '2017-04-08 18:04:47'),
(59, 32, 2, 153, 59, 9, 10, 1, '2017-04-08 18:05:20'),
(60, 50, 2, 93, 56, 4, 9, 1, '2017-04-08 18:05:28'),
(61, 81, 2, 209, 58, 28, 12, 1, '2017-04-08 18:06:20'),
(62, 64, 2, 114, 56, 20, 6, 1, '2017-04-08 18:07:04'),
(63, 48, 2, 116, 58, 213, 8, 1, '2017-04-08 18:07:31');

-- --------------------------------------------------------

--
-- Stand-in structure for view `Finalists`
--
CREATE TABLE `Finalists` (
`uid` int(11)
,`fname` varchar(255)
,`lname` varchar(255)
,`tname` varchar(255)
,`label` varchar(25)
,`ScoreRound1` double
);

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
(24, 2017, 'Melanie', 'Lick', '', 3),
(25, 2017, 'Nathan', 'Lick', '', 3),
(26, 2017, 'Valerie', 'Lick', '', 3),
(27, 2017, 'Erin', 'Lillycrop', '', 3),
(28, 2017, 'Beth', 'Lillycrop', '', 4),
(29, 2017, 'Ethan', 'Lillycrop', '', 2),
(30, 2017, 'Alexis', 'Lillycrop', '', 2),
(31, 2017, 'Katie', 'Lyttle', '', 2),
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
(47, 2017, 'Tonya', 'Wheeler', 'Optic Smiles', 0),
(48, 2017, 'Peter', 'Meredith', 'The Thunderbirds', 0),
(49, 2017, 'Tom', 'Meredith', '', 2),
(50, 2017, 'Joseph', 'Dotson', '', 2),
(51, 2017, 'Sylvia', 'Meredith', 'Rogue Three', 0),
(52, 2017, 'Parker', 'Davis', '', 1),
(53, 2017, 'Bryson', 'Davis', '', 1),
(54, 2017, 'Mackenzie', 'Henley', '', 2),
(55, 2017, 'Chloe', 'Campbell', '', 1),
(56, 2017, '', '', 'The Bowtruckles', 0),
(57, 2017, 'Katie', 'King', 'Double Trouble', 0),
(58, 2017, 'Brody', 'Brooks', '', 1),
(59, 2017, 'Linda', 'Briley', '', 4),
(60, 2017, '', '', 'Mary Grace and Becky Hudson', 0),
(61, 2017, 'Julia', 'Crowder', 'Julia Crowder, Ellie Currie and Hannah Musick', 0),
(62, 2017, 'Ali', 'York', '', 2),
(63, 2017, 'Rita', 'Stranser', '', 4),
(64, 2017, '', '', 'The Eggcellent Trio', 0),
(65, 2017, 'Molly', 'Smallwood', '', 1),
(66, 2017, '', '', 'All The King\'s Horses', 0),
(67, 2017, 'Will', 'York', '', 1),
(68, 2017, '', '', 'Keen Family', 0),
(69, 2017, 'Will', 'Ewing', '', 1),
(70, 2017, 'Colby', 'Keely', '', 0),
(71, 2017, 'Rich', 'Oreskovic', 'Shake an Egg', 0),
(72, 2017, 'Eli', 'Keen', '', 2),
(73, 2017, 'Joe', 'Ewing', '', 4),
(74, 2017, 'Marilee', 'Hull', '', 2),
(75, 2017, 'Michael', 'Lick', '', 4),
(76, 2017, '', '', 'Eggstreme Velocity', 0),
(77, 2017, 'Larry', 'Maney', '', 4),
(78, 2017, 'Jack', 'Ewing', '', 1),
(79, 2017, 'Adeline', 'Lyttle', '', 1),
(80, 2017, 'Claire', 'Ewing', '', 4),
(81, 2017, '', '', 'Team Cooper', 0),
(82, 2017, '', '', 'The Unbreakables', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Round1Scores`
--
CREATE TABLE `Round1Scores` (
`uid` int(11)
,`fname` varchar(255)
,`lname` varchar(255)
,`tname` varchar(255)
,`label` varchar(25)
,`ScoreRound1` double
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `Round2Scores`
--
CREATE TABLE `Round2Scores` (
`uid` int(11)
,`fname` varchar(255)
,`lname` varchar(255)
,`tname` varchar(255)
,`label` varchar(25)
,`ScoreRound2` double
);

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
(1, 4);

-- --------------------------------------------------------

--
-- Structure for view `Finalists`
--
DROP TABLE IF EXISTS `Finalists`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dataentry`@`localhost` SQL SECURITY DEFINER VIEW `Finalists`  AS  (select `Round1Scores`.`uid` AS `uid`,`Round1Scores`.`fname` AS `fname`,`Round1Scores`.`lname` AS `lname`,`Round1Scores`.`tname` AS `tname`,`Round1Scores`.`label` AS `label`,`Round1Scores`.`ScoreRound1` AS `ScoreRound1` from `Round1Scores` where (`Round1Scores`.`label` = 'Elementary School') order by `Round1Scores`.`ScoreRound1` limit 3) union all (select `Round1Scores`.`uid` AS `uid`,`Round1Scores`.`fname` AS `fname`,`Round1Scores`.`lname` AS `lname`,`Round1Scores`.`tname` AS `tname`,`Round1Scores`.`label` AS `label`,`Round1Scores`.`ScoreRound1` AS `ScoreRound1` from `Round1Scores` where (`Round1Scores`.`label` = 'Middle School') order by `Round1Scores`.`ScoreRound1` limit 3) union all (select `Round1Scores`.`uid` AS `uid`,`Round1Scores`.`fname` AS `fname`,`Round1Scores`.`lname` AS `lname`,`Round1Scores`.`tname` AS `tname`,`Round1Scores`.`label` AS `label`,`Round1Scores`.`ScoreRound1` AS `ScoreRound1` from `Round1Scores` where (`Round1Scores`.`label` = 'High School') order by `Round1Scores`.`ScoreRound1` limit 3) union all (select `Round1Scores`.`uid` AS `uid`,`Round1Scores`.`fname` AS `fname`,`Round1Scores`.`lname` AS `lname`,`Round1Scores`.`tname` AS `tname`,`Round1Scores`.`label` AS `label`,`Round1Scores`.`ScoreRound1` AS `ScoreRound1` from `Round1Scores` where (`Round1Scores`.`label` = 'Team') order by `Round1Scores`.`ScoreRound1` limit 3) union all (select `Round1Scores`.`uid` AS `uid`,`Round1Scores`.`fname` AS `fname`,`Round1Scores`.`lname` AS `lname`,`Round1Scores`.`tname` AS `tname`,`Round1Scores`.`label` AS `label`,`Round1Scores`.`ScoreRound1` AS `ScoreRound1` from `Round1Scores` where (`Round1Scores`.`label` = 'Adult') order by `Round1Scores`.`ScoreRound1` limit 3) ;

-- --------------------------------------------------------

--
-- Structure for view `Round1Scores`
--
DROP TABLE IF EXISTS `Round1Scores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dataentry`@`localhost` SQL SECURITY DEFINER VIEW `Round1Scores`  AS  select `drops`.`uid` AS `uid`,`people`.`fname` AS `fname`,`people`.`lname` AS `lname`,`people`.`tname` AS `tname`,`categories`.`label` AS `label`,(((30 * (`drops`.`dweight` - `drops`.`eweight`)) / 89) + (40 * (`drops`.`zone` / 10))) AS `ScoreRound1` from ((`drops` left join `people` on((`people`.`uid` = `drops`.`uid`))) left join `categories` on((`categories`.`cid` = `people`.`cat`))) where ((`drops`.`cracked` = 1) and (`drops`.`round` = 1) and (year(`drops`.`time`) = year(curdate()))) ;

-- --------------------------------------------------------

--
-- Structure for view `Round2Scores`
--
DROP TABLE IF EXISTS `Round2Scores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`dataentry`@`localhost` SQL SECURITY DEFINER VIEW `Round2Scores`  AS  select `drops`.`uid` AS `uid`,`people`.`fname` AS `fname`,`people`.`lname` AS `lname`,`people`.`tname` AS `tname`,`categories`.`label` AS `label`,((((30 * (`drops`.`dweight` - `drops`.`eweight`)) / 89) + (30 * (`drops`.`nparts` / 3))) + (40 * (`drops`.`zone` / 10))) AS `ScoreRound2` from ((`drops` left join `people` on((`people`.`uid` = `drops`.`uid`))) left join `categories` on((`categories`.`cid` = `people`.`cat`))) where ((`drops`.`cracked` = 1) and (`drops`.`round` = 2) and (year(`drops`.`time`) = year(curdate()))) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `drops`
--
ALTER TABLE `drops`
  ADD PRIMARY KEY (`did`),
  ADD UNIQUE KEY `unique_index` (`uid`,`round`);

--
-- Indexes for table `people`
--
ALTER TABLE `people`
  ADD PRIMARY KEY (`uid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `drops`
--
ALTER TABLE `drops`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT for table `people`
--
ALTER TABLE `people`
  MODIFY `uid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

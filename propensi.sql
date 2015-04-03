-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 27, 2015 at 10:42 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `propensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `Username` varchar(20) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Activity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`Username`, `Timestamp`, `Activity`) VALUES
('Admin', '2015-03-27 09:39:40', 'Membuat database sambil main coc');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `Username` varchar(20) NOT NULL,
  `Quiz_ID` int(3) NOT NULL,
  `Question_ID` int(6) NOT NULL,
  `Answer_text` text NOT NULL,
  `Subcategory_text` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`Username`, `Quiz_ID`, `Question_ID`, `Answer_text`, `Subcategory_text`) VALUES
('Admin', 1, 1, 'lorem ipsum', 'Pencapaian hidup');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Category_text` varchar(20) NOT NULL,
  `Subcategory_text` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_text`, `Subcategory_text`) VALUES
('Kehidupan', 'Pencapaian hidup'),
('Kehidupan', 'Proses kehidupan');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `Username` varchar(20) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Quiz_ID` int(3) NOT NULL,
  `Result_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`Username`, `Timestamp`, `Quiz_ID`, `Result_ID`) VALUES
('Admin', '2015-03-27 09:42:27', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
`Question_ID` int(6) NOT NULL,
  `Question_text` varchar(100) NOT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Category_text` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`Question_ID`, `Question_text`, `Weight`, `Category_text`) VALUES
(1, 'Menurut saya, karir adalah', NULL, 'Kehidupan');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
`Quiz_ID` int(3) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`Quiz_ID`, `Title`, `Description`) VALUES
(1, 'Kuesioner Kesiapan Karir', 'Lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_content`
--

CREATE TABLE IF NOT EXISTS `quiz_content` (
  `Quiz_ID` int(3) NOT NULL,
  `Question_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_content`
--

INSERT INTO `quiz_content` (`Quiz_ID`, `Question_ID`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_result`
--

CREATE TABLE IF NOT EXISTS `quiz_result` (
  `Result_ID` int(5) NOT NULL,
  `Quiz_ID` int(3) NOT NULL,
  `Classification_result` varchar(20) NOT NULL,
  `Result_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_result`
--

INSERT INTO `quiz_result` (`Result_ID`, `Quiz_ID`, `Classification_result`, `Result_text`) VALUES
(1, 1, 'Sukses', 'Selamat! Anda merupakan pengunjung yang pertama');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE IF NOT EXISTS `sub_category` (
  `Subcategory_text` varchar(30) NOT NULL,
  `Counter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`Subcategory_text`, `Counter`) VALUES
('Pencapaian hidup', 0),
('Proses kehidupan', 0);

-- --------------------------------------------------------

--
-- Table structure for table `testimony`
--

CREATE TABLE IF NOT EXISTS `testimony` (
  `Username` varchar(20) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Testimony_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimony`
--

INSERT INTO `testimony` (`Username`, `Timestamp`, `Testimony_text`) VALUES
('Admin', '2015-03-27 09:40:04', 'lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `Username` varchar(20) NOT NULL,
  `Password` binary(32) NOT NULL,
  `Role` char(1) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `Date_of_birth` date NOT NULL,
  `Place_of_birth` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Education` varchar(4) NOT NULL,
  `Occupation` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`Username`, `Password`, `Role`, `Email`, `Date_of_birth`, `Place_of_birth`, `Address`, `Gender`, `Phone`, `Education`, `Occupation`) VALUES
('Admin', 0xde7804989ad9c5f4d39e0ad1c29c1bff00000000000000000000000000000000, 'A', 'lorem@ipsum.dolor', '1993-02-07', 'lorem ipsum', 'lorem ipsum', 'M', '08123456789', 'SD', 'Admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
 ADD PRIMARY KEY (`Username`,`Timestamp`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
 ADD PRIMARY KEY (`Username`,`Quiz_ID`,`Question_ID`), ADD KEY `Quiz_ID` (`Quiz_ID`), ADD KEY `Question_ID` (`Question_ID`), ADD KEY `Subcategory_text` (`Subcategory_text`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`Category_text`,`Subcategory_text`), ADD KEY `Subcategory_text` (`Subcategory_text`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
 ADD PRIMARY KEY (`Username`,`Timestamp`), ADD KEY `Quiz_ID` (`Quiz_ID`,`Result_ID`), ADD KEY `Result_ID` (`Result_ID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
 ADD PRIMARY KEY (`Question_ID`), ADD KEY `Category_text` (`Category_text`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
 ADD PRIMARY KEY (`Quiz_ID`);

--
-- Indexes for table `quiz_content`
--
ALTER TABLE `quiz_content`
 ADD PRIMARY KEY (`Quiz_ID`,`Question_ID`), ADD KEY `Question_ID` (`Question_ID`);

--
-- Indexes for table `quiz_result`
--
ALTER TABLE `quiz_result`
 ADD PRIMARY KEY (`Result_ID`), ADD KEY `Quiz_ID` (`Quiz_ID`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
 ADD PRIMARY KEY (`Subcategory_text`);

--
-- Indexes for table `testimony`
--
ALTER TABLE `testimony`
 ADD PRIMARY KEY (`Username`,`Timestamp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`Username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
MODIFY `Question_ID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
MODIFY `Quiz_ID` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
ADD CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_3` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_4` FOREIGN KEY (`Subcategory_text`) REFERENCES `sub_category` (`Subcategory_text`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Subcategory_text`) REFERENCES `sub_category` (`Subcategory_text`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`Result_ID`) REFERENCES `quiz_result` (`Result_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Category_text`) REFERENCES `category` (`Category_text`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_content`
--
ALTER TABLE `quiz_content`
ADD CONSTRAINT `quiz_content_ibfk_1` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `quiz_content_ibfk_2` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_result`
--
ALTER TABLE `quiz_result`
ADD CONSTRAINT `quiz_result_ibfk_1` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testimony`
--
ALTER TABLE `testimony`
ADD CONSTRAINT `testimony_ibfk_1` FOREIGN KEY (`Username`) REFERENCES `user` (`Username`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

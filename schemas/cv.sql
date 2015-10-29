-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 31, 2015 at 01:01 AM
-- Server version: 5.5.41-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `codevillage`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `uname` varchar(1000) NOT NULL,
  `chmod` int(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `uid` bigint(5) NOT NULL,
  `pid` varchar(50) NOT NULL,
  `ctype` int(1) NOT NULL,
  `comment` text NOT NULL,
  `sdate` int(15) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=191 ;

-- --------------------------------------------------------

--
-- Table structure for table `competition`
--

CREATE TABLE IF NOT EXISTS `competition` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `cname` varchar(20) NOT NULL,
  `sdate` int(12) NOT NULL,
  `edate` int(12) NOT NULL,
  `predata` varchar(3000) NOT NULL,
  `announcements` varchar(10000) NOT NULL,
  `rules` varchar(20) NOT NULL DEFAULT 'ACM',
  `copied_to_prac` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `comp_score`
--

CREATE TABLE IF NOT EXISTS `comp_score` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(10) NOT NULL DEFAULT '0',
  `uid` bigint(10) NOT NULL,
  `cid` int(10) NOT NULL,
  `time` int(100) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=176 ;

-- --------------------------------------------------------

--
-- Table structure for table `problem_tags`
--

CREATE TABLE IF NOT EXISTS `problem_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `tid` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `prob_comp`
--

CREATE TABLE IF NOT EXISTS `prob_comp` (
  `pid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `cid` varchar(100) NOT NULL,
  `pdata` mediumtext NOT NULL,
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `score` int(100) NOT NULL,
  `challenge` int(100) NOT NULL,
  `size` int(100) NOT NULL,
  `time_limit` int(100) NOT NULL,
  `memory_used` int(100) NOT NULL,
  `no_of_correct` int(100) NOT NULL,
  `no_of_attempts` int(100) NOT NULL,
  `no_of_testcases` int(100) NOT NULL,
  `no_of_wrong_testcases` int(100) NOT NULL,
  `uploader_id` varchar(100) NOT NULL,
  `date` varchar(100) NOT NULL,
  `source` varchar(50) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=54 ;

-- --------------------------------------------------------

--
-- Table structure for table `prob_prac`
--

CREATE TABLE IF NOT EXISTS `prob_prac` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `pid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pdata` longtext NOT NULL,
  `challenge` int(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `time_limit` int(100) NOT NULL,
  `memory_used` int(100) NOT NULL,
  `no_of_correct` int(100) NOT NULL,
  `no_of_attempts` int(100) NOT NULL,
  `no_of_testcases` int(100) NOT NULL,
  `no_of_wrong_testcases` int(100) NOT NULL,
  `uploader_id` varchar(100) NOT NULL,
  `date` int(15) NOT NULL,
  `source` varchar(50) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=131 ;

-- --------------------------------------------------------

--
-- Table structure for table `prob_train`
--

CREATE TABLE IF NOT EXISTS `prob_train` (
  `id` int(100) NOT NULL AUTO_INCREMENT,
  `pid` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `pdata` longtext NOT NULL,
  `type` varchar(100) NOT NULL,
  `size` varchar(100) NOT NULL,
  `time_limit` int(100) NOT NULL,
  `memory_used` int(100) NOT NULL,
  `no_of_correct` int(100) NOT NULL,
  `no_of_attempts` int(100) NOT NULL,
  `uploader_id` varchar(100) NOT NULL,
  `date` int(15) NOT NULL,
  `source` varchar(50) NOT NULL,
  `difficulty` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

-- --------------------------------------------------------

--
-- Table structure for table `solution`
--

CREATE TABLE IF NOT EXISTS `solution` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` varchar(30) NOT NULL,
  `uid` bigint(5) NOT NULL,
  `ctype` int(1) NOT NULL,
  `sdate` int(11) NOT NULL,
  `status` varchar(5) NOT NULL DEFAULT 'PE',
  `language` varchar(6) NOT NULL,
  `time` float NOT NULL,
  `memory` int(6) NOT NULL,
  `detail_status` varchar(10000) CHARACTER SET ascii NOT NULL,
  `no_of_wrong_testcases` int(100) NOT NULL,
  PRIMARY KEY (`id`,`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6024 ;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE IF NOT EXISTS `student` (
  `cogni_id` int(5) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tag_info`
--

CREATE TABLE IF NOT EXISTS `tag_info` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `problem_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE IF NOT EXISTS `team` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `teamname` varchar(100) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=16 ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) NOT NULL,
  `uname` varchar(20) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` int(50) NOT NULL,
  `score` double NOT NULL DEFAULT '0',
  `language` varchar(10) NOT NULL,
  `fullname` text NOT NULL,
  `username` varchar(100) NOT NULL,
  `privilege` int(2) NOT NULL DEFAULT '0',
  `year` int(11) NOT NULL,
  `institute` varchar(200) NOT NULL,
  `team` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=567 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

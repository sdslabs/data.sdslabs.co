-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 16, 2015 at 05:11 PM
-- Server version: 5.5.44-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `muzi`
--

-- --------------------------------------------------------

--
-- Table structure for table `albums`
--

CREATE TABLE IF NOT EXISTS `albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15671 ;

-- --------------------------------------------------------

--
-- Table structure for table `badges`
--

CREATE TABLE IF NOT EXISTS `badges` (
  `name` varchar(20) NOT NULL,
  `description` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `bands`
--

CREATE TABLE IF NOT EXISTS `bands` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `language` (`language`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11529 ;

-- --------------------------------------------------------

--
-- Table structure for table `edits`
--

CREATE TABLE IF NOT EXISTS `edits` (
  `version` int(5) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `time` int(10) NOT NULL,
  `type` varchar(10) NOT NULL,
  `id` int(5) NOT NULL,
  `status` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`version`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `edit_transactions`
--

CREATE TABLE IF NOT EXISTS `edit_transactions` (
  `edit_id` int(5) NOT NULL,
  `transaction_id` int(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE IF NOT EXISTS `genres` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=340 ;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
  `trackid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `uid` int(5) DEFAULT NULL,
  KEY `trackid` (`trackid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs_new`
--

CREATE TABLE IF NOT EXISTS `logs_new` (
  `trackid` int(11) NOT NULL,
  `time` int(11) NOT NULL,
  `uid` int(5) DEFAULT NULL,
  KEY `trackid` (`trackid`),
  KEY `uid` (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` int(5) NOT NULL,
  `uid` int(5) NOT NULL,
  `text` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `pics`
--

CREATE TABLE IF NOT EXISTS `pics` (
  `band_id` int(11) NOT NULL,
  `pic_url` text
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `playlists`
--

CREATE TABLE IF NOT EXISTS `playlists` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) CHARACTER SET utf8 NOT NULL,
  `shared` int(11) NOT NULL DEFAULT '0',
  `uid` int(5) NOT NULL,
  PRIMARY KEY (`pid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14157 ;

-- --------------------------------------------------------

--
-- Table structure for table `playlists_tracks`
--

CREATE TABLE IF NOT EXISTS `playlists_tracks` (
  `pid` int(11) NOT NULL,
  `trackid` int(11) NOT NULL,
  UNIQUE KEY `unique_tracks_in_playlist` (`pid`,`trackid`),
  UNIQUE KEY `pid_2` (`pid`,`trackid`),
  KEY `trackid` (`trackid`),
  KEY `pid_3` (`pid`),
  KEY `pid` (`pid`),
  KEY `pid_4` (`pid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `requests`
--

CREATE TABLE IF NOT EXISTS `requests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(5) NOT NULL,
  `request` text NOT NULL,
  `time` int(11) NOT NULL,
  `completed` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=673 ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE IF NOT EXISTS `test` (
  `s1` int(10) NOT NULL,
  `s2` int(10) NOT NULL,
  `double` decimal(5,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `file` text NOT NULL,
  `title` text NOT NULL,
  `album` int(11) NOT NULL,
  `year` int(4) NOT NULL,
  `artist` text NOT NULL,
  `band` int(11) NOT NULL,
  `genre` int(11) NOT NULL,
  `track` int(11) NOT NULL,
  `plays` int(11) NOT NULL,
  `length` int(4) NOT NULL DEFAULT '0',
  `lyrics` text COMMENT 'Complete plain text lyrics of the song in html format',
  `status_add` tinyint(1) NOT NULL DEFAULT '0',
  `class` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `file` (`file`(256))
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=154933 ;

-- --------------------------------------------------------

--
-- Table structure for table `tracks_sounddata`
--

CREATE TABLE IF NOT EXISTS `tracks_sounddata` (
  `id` int(11) NOT NULL,
  `language` varchar(100) DEFAULT NULL,
  `echonest_id` varchar(40) DEFAULT NULL,
  `tempo` double DEFAULT NULL,
  `danceability` double DEFAULT NULL,
  `loudness` double DEFAULT NULL,
  `energy` double DEFAULT NULL,
  `liveness` double DEFAULT NULL,
  `speechiness` double DEFAULT NULL,
  `mode` double DEFAULT NULL,
  `acousticness` double DEFAULT NULL,
  `valence` double DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `mood` int(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `track_recommendation`
--

CREATE TABLE IF NOT EXISTS `track_recommendation` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `song_id1` int(11) NOT NULL,
  `song_id2` int(11) NOT NULL,
  `distance` double NOT NULL,
  `status_recommend` tinyint(1) DEFAULT '0',
  `count_recommended` int(11) NOT NULL DEFAULT '0',
  `count_listened` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1691201 ;

-- --------------------------------------------------------

--
-- Table structure for table `track_recommendation_new`
--

CREATE TABLE IF NOT EXISTS `track_recommendation_new` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `song_id1` int(11) NOT NULL,
  `song_id2` int(11) NOT NULL,
  `distance` double NOT NULL,
  `status_recommend` tinyint(1) DEFAULT '0',
  `count_recommended` int(11) NOT NULL DEFAULT '0',
  `count_listened` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=137801 ;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE IF NOT EXISTS `transactions` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `field` text NOT NULL,
  `text` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `uploaders`
--

CREATE TABLE IF NOT EXISTS `uploaders` (
  `uid` int(11) NOT NULL,
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `like_playlist` int(11) NOT NULL,
  `prefs` text NOT NULL,
  `nowplaying` int(5) NOT NULL,
  `reputation` int(5) NOT NULL,
  `uid` int(5) NOT NULL,
  `lastfm_user` varchar(100) NOT NULL COMMENT 'last.fm username',
  `lastfm_session` varchar(32) NOT NULL COMMENT 'last.fm session key',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_badges`
--

CREATE TABLE IF NOT EXISTS `user_badges` (
  `uid` int(5) NOT NULL,
  `badge` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='Relation b/w a user and badge';

-- --------------------------------------------------------

--
-- Table structure for table `user_recommendation`
--

CREATE TABLE IF NOT EXISTS `user_recommendation` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `song_id` int(11) NOT NULL,
  `distance` double NOT NULL,
  `status_recommend` tinyint(1) DEFAULT '0',
  `count_recommended` int(11) NOT NULL DEFAULT '0',
  `count_listened` int(11) NOT NULL DEFAULT '0',
  `language` varchar(100) NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_score`
--

CREATE TABLE IF NOT EXISTS `user_score` (
  `sno` int(11) NOT NULL AUTO_INCREMENT,
  `uid1` int(11) NOT NULL,
  `uid2` int(11) NOT NULL,
  `cosine_similarity` double NOT NULL,
  PRIMARY KEY (`sno`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `years`
--

CREATE TABLE IF NOT EXISTS `years` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.2.0-dev
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Feb 05, 2015 at 03:52 AM
-- Server version: 5.5.34-0ubuntu0.12.04.1
-- PHP Version: 5.4.36-1+deb.sury.org~precise+2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `backdoor`
--

-- --------------------------------------------------------

--
-- Table structure for table `challenges`
--

CREATE TABLE IF NOT EXISTS `challenges` (
`id` smallint(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `flag_id` smallint(5) NOT NULL,
  `statement` text NOT NULL,
  `creator` int(10) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `challenge_tag_maps`
--

CREATE TABLE IF NOT EXISTS `challenge_tag_maps` (
  `challenge_id` smallint(5) NOT NULL,
  `tag_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competitions`
--

CREATE TABLE IF NOT EXISTS `competitions` (
`id` smallint(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `info` text NOT NULL,
  `team_limit` smallint(6) NOT NULL,
  `begin_at` int(10) NOT NULL,
  `end_at` int(10) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competition_challenges`
--

CREATE TABLE IF NOT EXISTS `competition_challenges` (
`id` smallint(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `title` varchar(30) NOT NULL,
  `flag_id` smallint(5) NOT NULL,
  `statement` text NOT NULL,
  `creator` int(10) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competition_challenge_maps`
--

CREATE TABLE IF NOT EXISTS `competition_challenge_maps` (
  `competition_id` smallint(5) NOT NULL,
  `challenge_id` smallint(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `competition_logs`
--

CREATE TABLE IF NOT EXISTS `competition_logs` (
`id` mediumint(8) NOT NULL,
  `created_at` int(10) NOT NULL,
  `team_id` int(10) NOT NULL,
  `match` tinyint(1) NOT NULL,
  `flag_id` smallint(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `flags`
--

CREATE TABLE IF NOT EXISTS `flags` (
`id` smallint(5) NOT NULL,
  `flag` varchar(64) NOT NULL,
  `points` smallint(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE IF NOT EXISTS `logs` (
`id` mediumint(8) NOT NULL,
  `created_at` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `match` tinyint(1) NOT NULL,
  `flag_id` smallint(5) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
`id` smallint(5) NOT NULL,
  `value` varchar(30) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE IF NOT EXISTS `teams` (
`id` int(10) NOT NULL,
  `competition_id` smallint(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL DEFAULT '0',
  `last_submission` int(11) NOT NULL DEFAULT '0',
  `points` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_user_invites_maps`
--

CREATE TABLE IF NOT EXISTS `team_user_invites_maps` (
  `team_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `team_user_maps`
--

CREATE TABLE IF NOT EXISTS `team_user_maps` (
  `team_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) NOT NULL,
  `sds_uid` smallint(5) NOT NULL,
  `name` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `uid` varchar(50) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `credentials` blob NOT NULL,
  `email` varchar(50) DEFAULT NULL,
  `image` varchar(500) DEFAULT NULL,
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `deleted_at` int(10) NOT NULL,
  `last_submission` int(11) NOT NULL DEFAULT '0',
  `points` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `challenges`
--
ALTER TABLE `challenges`
 ADD PRIMARY KEY (`id`), ADD KEY `flagid` (`flag_id`), ADD KEY `creator` (`creator`);

--
-- Indexes for table `challenge_tag_maps`
--
ALTER TABLE `challenge_tag_maps`
 ADD KEY `challenge_id` (`challenge_id`), ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `competitions`
--
ALTER TABLE `competitions`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `competition_challenges`
--
ALTER TABLE `competition_challenges`
 ADD PRIMARY KEY (`id`), ADD KEY `creator` (`creator`), ADD KEY `flag_id` (`flag_id`), ADD KEY `creator_2` (`creator`);

--
-- Indexes for table `competition_challenge_maps`
--
ALTER TABLE `competition_challenge_maps`
 ADD KEY `competition_id` (`competition_id`), ADD KEY `challenge_id` (`challenge_id`);

--
-- Indexes for table `competition_logs`
--
ALTER TABLE `competition_logs`
 ADD PRIMARY KEY (`id`), ADD KEY `team_id` (`team_id`), ADD KEY `team_id_2` (`team_id`);

--
-- Indexes for table `flags`
--
ALTER TABLE `flags`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
 ADD PRIMARY KEY (`id`), ADD KEY `user_id` (`user_id`), ADD KEY `flag_id` (`flag_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
 ADD PRIMARY KEY (`id`), ADD KEY `competition_id` (`competition_id`), ADD KEY `id` (`id`), ADD KEY `name` (`name`), ADD KEY `last_submission` (`last_submission`), ADD KEY `points` (`points`);

--
-- Indexes for table `team_user_invites_maps`
--
ALTER TABLE `team_user_invites_maps`
 ADD KEY `team_id` (`team_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `team_user_maps`
--
ALTER TABLE `team_user_maps`
 ADD KEY `team_id` (`team_id`), ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `email` (`username`), ADD UNIQUE KEY `sds_uid` (`sds_uid`), ADD KEY `username` (`username`), ADD KEY `points` (`points`), ADD KEY `last_submission` (`last_submission`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `challenges`
--
ALTER TABLE `challenges`
MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `competitions`
--
ALTER TABLE `competitions`
MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `competition_challenges`
--
ALTER TABLE `competition_challenges`
MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `competition_logs`
--
ALTER TABLE `competition_logs`
MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `flags`
--
ALTER TABLE `flags`
MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
MODIFY `id` mediumint(8) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
MODIFY `id` smallint(5) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `challenges`
--
ALTER TABLE `challenges`
ADD CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`flag_id`) REFERENCES `flags` (`id`),
ADD CONSTRAINT `challenges_ibfk_2` FOREIGN KEY (`creator`) REFERENCES `users` (`id`);

--
-- Constraints for table `challenge_tag_maps`
--
ALTER TABLE `challenge_tag_maps`
ADD CONSTRAINT `challenge_tag_maps_ibfk_3` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`),
ADD CONSTRAINT `challenge_tag_maps_ibfk_4` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `competition_challenges`
--
ALTER TABLE `competition_challenges`
ADD CONSTRAINT `competition_challenges_ibfk_1` FOREIGN KEY (`creator`) REFERENCES `users` (`id`),
ADD CONSTRAINT `competition_challenges_ibfk_2` FOREIGN KEY (`flag_id`) REFERENCES `flags` (`id`);

--
-- Constraints for table `competition_challenge_maps`
--
ALTER TABLE `competition_challenge_maps`
ADD CONSTRAINT `competition_challenge_maps_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`),
ADD CONSTRAINT `competition_challenge_maps_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `competition_challenges` (`id`);

--
-- Constraints for table `competition_logs`
--
ALTER TABLE `competition_logs`
ADD CONSTRAINT `competition_logs_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`);

--
-- Constraints for table `logs`
--
ALTER TABLE `logs`
ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
ADD CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competitions` (`id`);

--
-- Constraints for table `team_user_invites_maps`
--
ALTER TABLE `team_user_invites_maps`
ADD CONSTRAINT `team_user_invites_maps_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
ADD CONSTRAINT `team_user_invites_maps_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `team_user_maps`
--
ALTER TABLE `team_user_maps`
ADD CONSTRAINT `team_user_maps_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
ADD CONSTRAINT `team_user_maps_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*
Navicat MySQL Data Transfer

Source Server         : Kavu MySQL
Source Server Version : 50512
Source Host           : localhost:3306
Source Database       : rouge

Target Server Type    : MYSQL
Target Server Version : 50512
File Encoding         : 65001

Date: 2011-05-23 17:15:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `rouge_achievements`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_achievements`;
CREATE TABLE `rouge_achievements` (
  `key` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `point_value` bigint(20) NOT NULL,
  `total` float NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_achievements
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_achievement_progress`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_achievement_progress`;
CREATE TABLE `rouge_achievement_progress` (
  `achievement_key` varchar(50) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `progress` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`achievement_key`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_achievement_progress
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_leaderboards`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_leaderboards`;
CREATE TABLE `rouge_leaderboards` (
  `key` varchar(50) NOT NULL,
  `name` varchar(100) NOT NULL,
  `type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_leaderboards
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_leaderboard_score`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_leaderboard_score`;
CREATE TABLE `rouge_leaderboard_score` (
  `leaderboard_key` varchar(50) NOT NULL DEFAULT '',
  `user_id` bigint(20) NOT NULL DEFAULT '0',
  `score` bigint(20) NOT NULL,
  PRIMARY KEY (`leaderboard_key`,`user_id`),
  KEY `user_id_idx` (`user_id`),
  KEY `total_scores_idx` (`leaderboard_key`,`score`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_leaderboard_score
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_mail`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_mail`;
CREATE TABLE `rouge_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `from` bigint(20) DEFAULT NULL,
  `to` bigint(20) NOT NULL,
  `status` char(3) NOT NULL,
  `content` text NOT NULL,
  `time_sent` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_mail
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_persistant_variable`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_persistant_variable`;
CREATE TABLE `rouge_persistant_variable` (
  `key` varchar(50) NOT NULL,
  `value` text NOT NULL,
  `version` bigint(20) NOT NULL DEFAULT '0',
  `creator_user_id` bigint(20) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key`),
  KEY `creator_id` (`creator_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_persistant_variable
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_servers`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_servers`;
CREATE TABLE `rouge_servers` (
  `instance` varchar(50) NOT NULL,
  `game` varchar(50) NOT NULL,
  `hostname` varchar(255) NOT NULL,
  `current_load` int(11) NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_servers
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_server_commands`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_server_commands`;
CREATE TABLE `rouge_server_commands` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `instance` varchar(50) NOT NULL,
  `command` varchar(50) NOT NULL,
  `payload` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `instance_idx` (`instance`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_server_commands
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_sessions`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_sessions`;
CREATE TABLE `rouge_sessions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_ip` char(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `driver` varchar(25) NOT NULL,
  `os` varchar(50) NOT NULL,
  `start` datetime NOT NULL,
  `end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `username_idx` (`user_id`),
  KEY `start_stop_idx` (`start`,`end`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_sessions
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_social_friends`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_social_friends`;
CREATE TABLE `rouge_social_friends` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `friend_user_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `friend_user_id_idx` (`friend_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_social_friends
-- ----------------------------

-- ----------------------------
-- Table structure for `rouge_users`
-- ----------------------------
DROP TABLE IF EXISTS `rouge_users`;
CREATE TABLE `rouge_users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `created` datetime NOT NULL,
  `last_updated` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of rouge_users
-- ----------------------------

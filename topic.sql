-- Adminer 4.2.5 MySQL dump

SET NAMES utf8;
SET time_zone = '+00:00';
SET foreign_key_checks = 0;
SET sql_mode = 'NO_AUTO_VALUE_ON_ZERO';

--USE `street_news`;


DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_sn` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '類別編號',
  `topic_title` varchar(255) NOT NULL COMMENT '類別或主題名稱',
  `topic_type` varchar(20) NOT NULL COMMENT '種類',
  `topic_description` text NOT NULL COMMENT '說明',
  `topic_default` int(11) NOT NULL COMMENT '預設',
  `username` varchar(65) NOT NULL COMMENT '建立者',
  PRIMARY KEY (`topic_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


-- 2017-11-30 09:28:41
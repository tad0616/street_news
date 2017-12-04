CREATE TABLE IF NOT EXISTS `article` (
  `sn` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '流水號',
  `focus` tinyint(2) unsigned NOT NULL COMMENT '精選',
  `topic_sn` tinyint(2) unsigned NOT NULL COMMENT '類別編號',
  `sort` tinyint(5) unsigned NOT NULL COMMENT '排序',
  `title` varchar(300) NOT NULL,
  `content` text NOT NULL,
  `username` varchar(65) NOT NULL,
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  PRIMARY KEY (`sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `loginattempts` (
  `IP` varchar(20) NOT NULL,
  `Attempts` int(11) NOT NULL,
  `LastLogin` datetime NOT NULL,
  `Username` varchar(65) DEFAULT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `members` (
  `id` char(23) NOT NULL,
  `username` varchar(65) NOT NULL DEFAULT '',
  `password` varchar(65) NOT NULL DEFAULT '',
  `email` varchar(65) NOT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '0',
  `mod_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username_UNIQUE` (`username`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS  `topic` (
  `topic_sn` mediumint(9) NOT NULL AUTO_INCREMENT COMMENT '類別編號',
  `topic_title` varchar(255) NOT NULL COMMENT '類別或主題名稱',
  `topic_type` varchar(10) NOT NULL COMMENT '種類',
  `topic_description` text NOT NULL COMMENT '說明',
  `topic_status` enum('0','1','2','3') NOT NULL COMMENT '主題狀態',
  `username` varchar(65) NOT NULL COMMENT '建立者',
  PRIMARY KEY (`topic_sn`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : dasta

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2016-04-25 15:03:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for dasta_bind_base
-- ----------------------------
DROP TABLE IF EXISTS `dasta_bind_base`;
CREATE TABLE `dasta_bind_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(20) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `bind` int(11) DEFAULT NULL,
  `recTime` datetime DEFAULT NULL,
  `cache` varchar(20) DEFAULT NULL,
  `memory` varchar(20) DEFAULT NULL,
  `disk` varchar(20) DEFAULT NULL,
  `cpu` varchar(20) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_dasta_bind_base_ip` (`ip`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dasta_bind_count_daily
-- ----------------------------
DROP TABLE IF EXISTS `dasta_bind_count_daily`;
CREATE TABLE `dasta_bind_count_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bindId` int(11) DEFAULT NULL,
  `bind` int(11) DEFAULT NULL,
  `recTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_dasta_bind_count_daily_bindId` (`bindId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dasta_code_base
-- ----------------------------
DROP TABLE IF EXISTS `dasta_code_base`;
CREATE TABLE `dasta_code_base` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `reqUrl` varchar(255) DEFAULT NULL,
  `total` varchar(20) DEFAULT 'total',
  `dailyAvg` varchar(20) DEFAULT 'dailyAvg',
  `instant` varchar(20) DEFAULT 'instant',
  `daily` varchar(20) DEFAULT 'daily',
  `idsum` varchar(20) DEFAULT 'idsum',
  `type` varchar(20) DEFAULT NULL,
  `cirNum` int(11) DEFAULT NULL,
  `queNum` int(11) DEFAULT NULL,
  `recTime` datetime DEFAULT NULL,
  `error` smallint(6) DEFAULT NULL,
  `status` smallint(6) DEFAULT NULL,
  `isFormat` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dasta_code_count_daily
-- ----------------------------
DROP TABLE IF EXISTS `dasta_code_count_daily`;
CREATE TABLE `dasta_code_count_daily` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `regNum` int(11) DEFAULT NULL,
  `recTime` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dasta_code_count_realtime
-- ----------------------------
DROP TABLE IF EXISTS `dasta_code_count_realtime`;
CREATE TABLE `dasta_code_count_realtime` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `num` int(11) DEFAULT NULL,
  `regNum` int(11) DEFAULT NULL,
  `codeBaseId` int(11) DEFAULT NULL,
  `countDailyId` int(11) DEFAULT NULL,
  `hour` smallint(6) DEFAULT NULL,
  `minute` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_dasta_code_count_realtime_hour` (`hour`),
  KEY `ix_dasta_code_count_realtime_countDailyId` (`countDailyId`),
  KEY `ix_dasta_code_count_realtime_minute` (`minute`),
  KEY `ix_dasta_code_count_realtime_codeBaseId` (`codeBaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=1685 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for dasta_code_detail
-- ----------------------------
DROP TABLE IF EXISTS `dasta_code_detail`;
CREATE TABLE `dasta_code_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `codeBaseId` int(11) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `regNum` int(11) DEFAULT NULL,
  `recTime` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ix_dasta_code_detail_recTime` (`recTime`),
  KEY `ix_dasta_code_detail_codeBaseId` (`codeBaseId`)
) ENGINE=InnoDB AUTO_INCREMENT=1896 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Procedure structure for code_detail_counter
-- ----------------------------
DROP PROCEDURE IF EXISTS `code_detail_counter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `code_detail_counter`()
BEGIN
	declare `now_date` date default now();
    declare `done` int default 0;
    declare `_id` int;
    declare `_num` int;
    declare `_regNum` int;
    
    declare `cur` cursor for
		select 
			dccr.codeBaseId id,
			sum(dccr.num) num,
			sum(dccr.regNum) regNum 
		from `dasta_code_count_realtime` dccr 
		inner join `dasta_code_count_daily` dccd 
		on dccr.countDailyId = dccd.id 
		where dccd.recTime = `now_date` 
		group by dccr.codeBaseId;
	
    declare continue handler for not found set `done` = 1;
    
    open `cur`;
    repeat
		fetch`cur` into `_id`, `_num`, `_regNum`;
		if `_id` and `_num` and `_regNum` then
			BEGIN
				declare `flag` int;
				declare `d` int default 0;
				declare `cur_detail` cursor for 
					select id from `dasta_code_detail` 
					where recTime = `now_date` and codeBaseId = `_id`;
				declare continue handler for not found set `d` = 1;
				open `cur_detail`;
				repeat
					fetch `cur_detail` into `flag`;
					if `flag` then
						update `dasta_code_detail` set num = `_num`, regNum = `_regNum` 
						where id = `flag`;
					else
						insert into `dasta_code_detail`(`num`, `regNum`, `codeBaseId`, `recTime`)
						values (`_num`, `_regNum`, `_id`, `now_date`);
					end if;
				until `d` = 1
				end repeat;
				close `cur_detail`;
			END;
		end if;
                
    until `done` = 1            
		end repeat;
    close `cur`;
END
;;
DELIMITER ;

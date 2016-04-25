/*
Navicat MySQL Data Transfer

Source Server         : 101.200.210.127
Source Server Version : 50541
Source Host           : localhost:3306
Source Database       : bdps1

Target Server Type    : MYSQL
Target Server Version : 50541
File Encoding         : 65001

Date: 2016-04-25 14:44:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity_chest_code
-- ----------------------------
DROP TABLE IF EXISTS `activity_chest_code`;
CREATE TABLE `activity_chest_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `code` varchar(50) NOT NULL DEFAULT '123' COMMENT '兑换券',
  `status` varchar(20) DEFAULT '0' COMMENT '状态',
  `code_one` varchar(50) DEFAULT NULL,
  `type` int(11) DEFAULT '0',
  `username` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=598 DEFAULT CHARSET=utf8 COMMENT='兑换券表';

-- ----------------------------
-- Table structure for activity_chest_conf
-- ----------------------------
DROP TABLE IF EXISTS `activity_chest_conf`;
CREATE TABLE `activity_chest_conf` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `key` varchar(50) DEFAULT NULL COMMENT 'key值',
  `value` varchar(50) DEFAULT NULL COMMENT 'value值',
  `type` varchar(10) DEFAULT NULL COMMENT '类型',
  `prob` int(5) DEFAULT NULL COMMENT '概率',
  `num` int(5) DEFAULT NULL COMMENT '数量',
  `pnum` int(5) DEFAULT '0' COMMENT '发放次数',
  PRIMARY KEY (`id`),
  KEY `type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='宝箱活动配置表';

-- ----------------------------
-- Table structure for activity_chest_record
-- ----------------------------
DROP TABLE IF EXISTS `activity_chest_record`;
CREATE TABLE `activity_chest_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `num` int(5) DEFAULT NULL COMMENT '已抽奖次数',
  `count` int(5) DEFAULT NULL COMMENT '抽奖次数',
  `time` varchar(20) DEFAULT NULL COMMENT '最后抽奖时间',
  `prize` varchar(20) DEFAULT NULL COMMENT '奖品',
  `type` varchar(20) DEFAULT NULL COMMENT '奖品类型',
  `login` int(3) DEFAULT '0' COMMENT '登录记录',
  `scan_foreign` int(3) DEFAULT '0' COMMENT '扫描次数',
  `scan_milk` int(3) DEFAULT '0' COMMENT '扫描次数',
  `share` int(3) DEFAULT '0' COMMENT '分享次数',
  `scan_common` int(3) DEFAULT '0' COMMENT ' 扫描次数',
  PRIMARY KEY (`id`),
  KEY `type_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1898 DEFAULT CHARSET=utf8 COMMENT='宝箱活动记录表';

-- ----------------------------
-- Table structure for apk_info
-- ----------------------------
DROP TABLE IF EXISTS `apk_info`;
CREATE TABLE `apk_info` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `version_code` int(5) NOT NULL COMMENT '版本更新号',
  `version_name` varchar(20) DEFAULT NULL COMMENT '版本号',
  `version_date` varchar(20) NOT NULL COMMENT '版本日期',
  `version_person` varchar(100) NOT NULL COMMENT '版本维护人',
  `path` varchar(255) NOT NULL COMMENT 'apk文件地址',
  `name` varchar(100) NOT NULL COMMENT 'apk文件名称',
  `description` text COMMENT '描述',
  `min_compatible_version` varchar(5) DEFAULT NULL,
  `platform` varchar(20) DEFAULT NULL COMMENT '平台',
  PRIMARY KEY (`id`),
  KEY `code_index` (`version_code`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='应用版本信息表';

-- ----------------------------
-- Table structure for apk_used
-- ----------------------------
DROP TABLE IF EXISTS `apk_used`;
CREATE TABLE `apk_used` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `version_code` int(5) NOT NULL COMMENT '版本更新号',
  `imei` varchar(20) NOT NULL COMMENT '设备号',
  PRIMARY KEY (`id`),
  KEY `imei_index` (`imei`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户使用版本登记表';

-- ----------------------------
-- Table structure for certificate_info
-- ----------------------------
DROP TABLE IF EXISTS `certificate_info`;
CREATE TABLE `certificate_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zsbh` int(1) NOT NULL COMMENT '证书编号：1食品生成许可证 2卫生许可证 3药品生成许可证 ',
  `zsmc` varchar(255) DEFAULT NULL COMMENT '证书名称',
  `website` varchar(255) DEFAULT NULL COMMENT '证书官网',
  PRIMARY KEY (`id`),
  KEY `zsbh_index` (`zsbh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='证书官网信息表';

-- ----------------------------
-- Table structure for comments_appraise
-- ----------------------------
DROP TABLE IF EXISTS `comments_appraise`;
CREATE TABLE `comments_appraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) NOT NULL COMMENT '商品编码',
  `good` int(8) NOT NULL DEFAULT '0' COMMENT '好评',
  `bad` int(8) NOT NULL DEFAULT '0' COMMENT '差评',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='用户评价赞同数量表';

-- ----------------------------
-- Table structure for comments_appraise_detail
-- ----------------------------
DROP TABLE IF EXISTS `comments_appraise_detail`;
CREATE TABLE `comments_appraise_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) NOT NULL COMMENT '商品编码',
  `cname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `username` varchar(50) NOT NULL COMMENT '用户名，手机号或邮箱',
  `nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `imei` varchar(20) DEFAULT NULL COMMENT '设备标识',
  `latitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `longitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `cdate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `ctime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `flag` int(1) NOT NULL COMMENT '赞同标志 1赞同 2取消赞同',
  `good` int(1) DEFAULT NULL COMMENT '赞和踩标志 1赞 2踩',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='用户赞同明细表';

-- ----------------------------
-- Table structure for comments_detail
-- ----------------------------
DROP TABLE IF EXISTS `comments_detail`;
CREATE TABLE `comments_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(100) NOT NULL COMMENT '商品编码',
  `cname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `username` varchar(50) NOT NULL COMMENT '用户名，手机号或邮箱',
  `nick` varchar(50) DEFAULT NULL COMMENT '昵称',
  `imei` varchar(20) DEFAULT NULL COMMENT '设备标识',
  `latitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `longitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `cdate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `ctime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `content` text NOT NULL COMMENT '评价内容',
  `flag` int(1) NOT NULL COMMENT '评价标识：1好评 2差评',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='用户评价信息表';

-- ----------------------------
-- Table structure for comments_report
-- ----------------------------
DROP TABLE IF EXISTS `comments_report`;
CREATE TABLE `comments_report` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `index` int(11) NOT NULL COMMENT '商品评价信息唯一标识',
  `imei` varchar(20) DEFAULT NULL COMMENT '用户设备号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名，手机号或邮箱',
  `barcode` varchar(100) DEFAULT NULL COMMENT '商品编码',
  `advice` text NOT NULL COMMENT '举报意见',
  `adate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `atime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '处理状态：0未处理 1已处理',
  `person` varchar(50) DEFAULT NULL COMMENT '处理人，手机号或邮箱',
  `note` text COMMENT '处理意见备注',
  `edate` int(8) DEFAULT NULL COMMENT '处理日期',
  `etime` int(6) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论举报记录表';

-- ----------------------------
-- Table structure for company_detail
-- ----------------------------
DROP TABLE IF EXISTS `company_detail`;
CREATE TABLE `company_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL COMMENT '公司编码',
  `cname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `person` text COMMENT '联系人姓名',
  `phone` text COMMENT '电话',
  `telephone` text COMMENT '手机',
  `fax` text COMMENT '传真',
  `email` text COMMENT '邮箱',
  `postcode` text COMMENT '邮编',
  `website` text COMMENT '网址',
  `address` text COMMENT '公司地址',
  PRIMARY KEY (`id`),
  KEY `cid_index` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=240918 DEFAULT CHARSET=utf8 COMMENT='公司详情表';

-- ----------------------------
-- Table structure for company_express
-- ----------------------------
DROP TABLE IF EXISTS `company_express`;
CREATE TABLE `company_express` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(255) NOT NULL COMMENT '公司名称',
  `shortname` varchar(255) DEFAULT NULL COMMENT '公司简称',
  `tel` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `url` varchar(255) DEFAULT NULL,
  `code` varchar(255) NOT NULL COMMENT '公司code',
  `hasvali` int(11) DEFAULT NULL,
  `comurl` varchar(255) DEFAULT NULL COMMENT '公司网址',
  `isavailable` varchar(255) DEFAULT NULL,
  `promptinfo` varchar(255) DEFAULT NULL COMMENT '消息提示',
  `testnu` varchar(255) DEFAULT NULL COMMENT '测试单号',
  `freg` varchar(255) DEFAULT NULL COMMENT '正则规则',
  `freginfo` varchar(255) DEFAULT NULL COMMENT '正则描述',
  `telcomplaintnum` varchar(255) DEFAULT NULL COMMENT '联系电话',
  `queryurl` varchar(255) DEFAULT NULL COMMENT '查询网址',
  `serversite` varchar(255) DEFAULT NULL COMMENT '服务站点',
  PRIMARY KEY (`id`),
  KEY `code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=599 DEFAULT CHARSET=utf8 COMMENT='快递公司名称表';

-- ----------------------------
-- Table structure for company_info
-- ----------------------------
DROP TABLE IF EXISTS `company_info`;
CREATE TABLE `company_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL COMMENT '公司编码',
  `cname` varchar(255) DEFAULT NULL COMMENT '公司名称',
  `website` varchar(255) DEFAULT NULL COMMENT '公司网址',
  `status` varchar(1) DEFAULT NULL COMMENT '网址状态：0没有网址信息，需要收集 1官方网站，不需要收集信息 2第三方B2B网站需要收集信息',
  `register_flag` int(1) NOT NULL DEFAULT '0' COMMENT '公司注册状态：0未注册 1已注册',
  `register_url` varchar(255) DEFAULT NULL COMMENT '公司注册网址',
  `telephone` varchar(100) DEFAULT NULL,
  `address` text COMMENT '公司地址',
  `food` int(1) NOT NULL DEFAULT '0' COMMENT '食品生成许可证：0无 1有',
  `hygiene` int(1) NOT NULL DEFAULT '0' COMMENT '卫生许可证：：0无 1有',
  `medicine` int(1) NOT NULL DEFAULT '0' COMMENT '药品生产许可证：0无 1有',
  `business` int(1) NOT NULL DEFAULT '0' COMMENT '营业执照：0无 1有',
  `recordTime` varchar(19) DEFAULT '0000-00-00 00:00:00' COMMENT '记录时间 %Y-%m-%d %H:%M:%S',
  PRIMARY KEY (`id`),
  KEY `cid_index` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=401094 DEFAULT CHARSET=utf8 COMMENT='公司条码表';

-- ----------------------------
-- Table structure for conf_experience_v
-- ----------------------------
DROP TABLE IF EXISTS `conf_experience_v`;
CREATE TABLE `conf_experience_v` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `op` int(2) NOT NULL DEFAULT '0' COMMENT '配置类别 0通用 1登陆 2扫码 3评论 4赞 5完善商品信息 6分享',
  `type` varchar(20) NOT NULL COMMENT '类型注释',
  `description` varchar(20) NOT NULL DEFAULT '通用' COMMENT '0通用 1登陆 2扫码 3评论 4赞 5完善商品信息 6分享',
  `experience` int(2) NOT NULL DEFAULT '0' COMMENT '获取经验标准',
  `limit` int(5) DEFAULT '0' COMMENT '限制次数',
  `limitPer` int(5) DEFAULT '0' COMMENT '限制时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0不启用 1启用',
  `aDate` varchar(20) DEFAULT NULL COMMENT '维护日期',
  `aTime` varchar(20) DEFAULT NULL COMMENT '维护时间',
  PRIMARY KEY (`id`),
  KEY `type_status_index` (`op`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='经验配置表';

-- ----------------------------
-- Table structure for conf_point
-- ----------------------------
DROP TABLE IF EXISTS `conf_point`;
CREATE TABLE `conf_point` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `types` int(2) NOT NULL DEFAULT '0' COMMENT '配置类别 0通用 1登陆 2扫码 3评论 4赞 5完善商品信息 6分享',
  `description` varchar(20) NOT NULL DEFAULT '通用' COMMENT '0通用 1登陆 2扫码 3评论 4赞 5完善商品信息 6分享',
  `points` double NOT NULL DEFAULT '0' COMMENT '积分标准',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0不启用 1启用',
  `aDate` varchar(20) DEFAULT NULL COMMENT '维护日期',
  `aTime` varchar(20) DEFAULT NULL COMMENT '维护时间',
  `aPerson` varchar(255) DEFAULT NULL COMMENT '维护人',
  PRIMARY KEY (`id`),
  KEY `type_status_index` (`types`,`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='积分规则配置表';

-- ----------------------------
-- Table structure for conf_upgrade_v
-- ----------------------------
DROP TABLE IF EXISTS `conf_upgrade_v`;
CREATE TABLE `conf_upgrade_v` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `level` int(2) NOT NULL COMMENT '等级称号',
  `experience` int(10) NOT NULL COMMENT '升级经验',
  `dec_exp` int(10) NOT NULL COMMENT '升级还需经验',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0不启用 1启用',
  `aDate` varchar(20) DEFAULT NULL COMMENT '维护日期',
  `aTime` varchar(20) DEFAULT NULL COMMENT '维护时间',
  `aPerson` varchar(255) DEFAULT NULL COMMENT '维护人',
  PRIMARY KEY (`id`),
  KEY `experience_status_index` (`experience`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='升级规则配置表';

-- ----------------------------
-- Table structure for conf_validity
-- ----------------------------
DROP TABLE IF EXISTS `conf_validity`;
CREATE TABLE `conf_validity` (
  `id` int(5) NOT NULL AUTO_INCREMENT,
  `types` int(1) NOT NULL COMMENT '配置类别：0商品详情 1商品价格',
  `years` int(4) NOT NULL DEFAULT '0' COMMENT '年，默认为0，一年365天',
  `months` int(2) NOT NULL DEFAULT '0' COMMENT '月，默认为0，一个月30天',
  `days` int(2) NOT NULL DEFAULT '0' COMMENT '天，默认为0',
  `hours` int(2) NOT NULL DEFAULT '0' COMMENT '小时，默认为0',
  `minutes` int(2) NOT NULL DEFAULT '0' COMMENT '分钟，默认为0',
  `seconds` int(2) NOT NULL DEFAULT '0' COMMENT '秒，默认为0',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '是否启用：0不启用 1启用',
  `aDate` varchar(8) NOT NULL COMMENT '维护日期',
  `aTime` varchar(6) NOT NULL COMMENT '维护时间',
  `aPerson` varchar(255) NOT NULL COMMENT '维护人',
  PRIMARY KEY (`id`),
  KEY `type_status_index` (`types`,`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='有效期配置表';

-- ----------------------------
-- Table structure for data_barcode_info
-- ----------------------------
DROP TABLE IF EXISTS `data_barcode_info`;
CREATE TABLE `data_barcode_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(20) NOT NULL COMMENT '商品编码',
  `cid` varchar(20) DEFAULT NULL COMMENT '公司编码',
  `gname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `recordTime` varchar(19) DEFAULT NULL COMMENT '记录时间 %Y-%m-%d %H:%M:%S',
  `bname` int(1) NOT NULL DEFAULT '0' COMMENT '商家名称：1：京东 2：当当 3：天猫',
  `imgUrlN5` varchar(255) DEFAULT NULL COMMENT 'N5图片路径',
  `secKill` varchar(10) DEFAULT NULL COMMENT '是否秒杀',
  `wname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `adword` text COMMENT '广告词',
  `marketPrice` double DEFAULT NULL COMMENT '市场价',
  `averageScore` double DEFAULT NULL COMMENT '评价评分',
  `promotion` varchar(10) DEFAULT NULL COMMENT '是否促销',
  `jdPrice` double DEFAULT NULL COMMENT '京东价',
  `good` varchar(10) DEFAULT NULL COMMENT '好评度',
  `canConsultFlag` varchar(10) DEFAULT NULL COMMENT '是否可以咨询标志，true：是，false：否',
  `size` varchar(255) DEFAULT NULL COMMENT '尺寸',
  `isbook` varchar(10) DEFAULT NULL COMMENT '是否为图书',
  `totalCount` double DEFAULT NULL COMMENT '总数量',
  `color` varchar(20) DEFAULT NULL COMMENT '颜色',
  `description` text COMMENT '描述',
  `directShow` varchar(10) DEFAULT NULL COMMENT '是否直接展示  true：是，false：否',
  `canFreeRead` varchar(10) DEFAULT NULL COMMENT '是否免费阅读  true：是，false：否',
  `showMartPrice` varchar(10) DEFAULT NULL COMMENT '是否展示市场价  true：是，false：否',
  `skuId` int(20) DEFAULT NULL COMMENT '商品编号',
  `imgUrlN1` varchar(255) DEFAULT NULL COMMENT 'N1图片路径',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '商品大图片地址',
  `detail_info` text COMMENT '商品详情参数',
  `pack_list` text COMMENT '商品包装清单',
  `images_info` text COMMENT '商品图片信息',
  `services` text COMMENT '售后服务信息',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`),
  KEY `cid_index` (`cid`)
) ENGINE=InnoDB AUTO_INCREMENT=21486087 DEFAULT CHARSET=utf8 COMMENT='商品详情信息表';

-- ----------------------------
-- Table structure for data_barcode_iot
-- ----------------------------
DROP TABLE IF EXISTS `data_barcode_iot`;
CREATE TABLE `data_barcode_iot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `size` varchar(255) DEFAULT NULL,
  `company_address` varchar(255) DEFAULT NULL,
  `company_name` varchar(255) DEFAULT NULL,
  `company_phone` varchar(255) DEFAULT NULL,
  `company_website` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5618 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_barcode_price
-- ----------------------------
DROP TABLE IF EXISTS `data_barcode_price`;
CREATE TABLE `data_barcode_price` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(20) NOT NULL COMMENT '商品编码',
  `gname` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `pid` varchar(20) DEFAULT NULL COMMENT '商品码',
  `bid` int(1) NOT NULL COMMENT '商家名称：1：京东 2：当当 3：天猫 4：淘宝 5：唯品会',
  `bname` varchar(50) DEFAULT NULL COMMENT '商家名称：1：京东 2：当当 3：天猫',
  `recordTime` varchar(19) NOT NULL COMMENT '记录时间 %Y-%m-%d %H:%M:%S',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分销url',
  `price` double NOT NULL COMMENT '价格1',
  `lose` int(1) NOT NULL DEFAULT '1' COMMENT '是否有效 0失效 1有效',
  `loseTime` varchar(19) DEFAULT NULL COMMENT '失效时间 %Y-%m-%d %H:%M:%S',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`),
  KEY `bid_index` (`bid`)
) ENGINE=InnoDB AUTO_INCREMENT=5382 DEFAULT CHARSET=utf8 COMMENT='商品价格信息表';

-- ----------------------------
-- Table structure for data_book_info
-- ----------------------------
DROP TABLE IF EXISTS `data_book_info`;
CREATE TABLE `data_book_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `isbn` varchar(20) NOT NULL COMMENT '国际标准书号',
  `title` varchar(255) NOT NULL COMMENT '书名',
  `subhead` varchar(255) DEFAULT NULL COMMENT '书名',
  `original_title` varchar(255) DEFAULT NULL COMMENT '原作名',
  `recordTime` varchar(19) DEFAULT NULL COMMENT '记录时间 %Y-%m-%d %H:%M:%S',
  `page` varchar(20) DEFAULT '0' COMMENT '页数',
  `imgUrlN5` varchar(255) DEFAULT NULL COMMENT 'N5图片路径',
  `author` varchar(255) DEFAULT NULL COMMENT '作者',
  `translator` varchar(255) DEFAULT NULL COMMENT '译者',
  `publisher` varchar(255) DEFAULT NULL COMMENT '出版社',
  `pubdate` varchar(255) DEFAULT NULL COMMENT '出版年',
  `price` varchar(100) DEFAULT NULL COMMENT '定价',
  `binding` varchar(100) DEFAULT NULL COMMENT '装帧',
  `score` double DEFAULT NULL COMMENT '评分',
  `collection` varchar(255) DEFAULT NULL COMMENT '丛书',
  `summary` text COMMENT '内容简介',
  `author_intro` text COMMENT '作者简介',
  `catalog` text COMMENT '目录',
  `type` varchar(255) DEFAULT NULL COMMENT '类型',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '大图片地址',
  `atl` varchar(255) DEFAULT NULL COMMENT '详细信息',
  `isbn7` varchar(20) DEFAULT NULL COMMENT '统一书号',
  PRIMARY KEY (`id`),
  KEY `isbn_index` (`isbn`) USING BTREE,
  KEY `title_index` (`title`) USING BTREE,
  KEY `author` (`author`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66123 DEFAULT CHARSET=utf8 COMMENT='书信息明细表';

-- ----------------------------
-- Table structure for data_desc_info
-- ----------------------------
DROP TABLE IF EXISTS `data_desc_info`;
CREATE TABLE `data_desc_info` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `dzjgm` varchar(50) DEFAULT NULL COMMENT '电子监管码',
  `pzwhlb` varchar(50) DEFAULT NULL COMMENT '批准文号类别',
  `pzwh` varchar(50) NOT NULL COMMENT '批准文号',
  `cpmc` varchar(255) DEFAULT NULL COMMENT '产品名称,药品通用名',
  `jx` varchar(255) DEFAULT NULL COMMENT '剂型',
  `gg` varchar(255) DEFAULT NULL COMMENT '规格,制剂规格',
  `bzgg` varchar(255) DEFAULT NULL COMMENT '规格,包装规格',
  `scdw` varchar(255) DEFAULT NULL COMMENT '生产单位,生产企业',
  `scrq` varchar(50) DEFAULT NULL COMMENT '生产日期',
  `cpph` varchar(50) DEFAULT NULL COMMENT '产品批号',
  `yxrq` varchar(50) DEFAULT NULL COMMENT '有效期至',
  `cxqk` varchar(255) DEFAULT NULL COMMENT '查询情况',
  `qsdw` varchar(255) DEFAULT NULL COMMENT '签收单位',
  PRIMARY KEY (`id`),
  KEY `dzjgm_index` (`dzjgm`),
  KEY `pzwh_index` (`pzwh`)
) ENGINE=InnoDB AUTO_INCREMENT=10499 DEFAULT CHARSET=utf8 COMMENT='电子监管码信息表';

-- ----------------------------
-- Table structure for data_ecode_info
-- ----------------------------
DROP TABLE IF EXISTS `data_ecode_info`;
CREATE TABLE `data_ecode_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `code` varchar(50) NOT NULL COMMENT 'Ecode',
  `text` text COMMENT 'ecode内容',
  PRIMARY KEY (`id`),
  KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='Ecode表';

-- ----------------------------
-- Table structure for data_express_info
-- ----------------------------
DROP TABLE IF EXISTS `data_express_info`;
CREATE TABLE `data_express_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nu` varchar(50) DEFAULT NULL,
  `zh` varchar(255) DEFAULT NULL,
  `com` varchar(255) DEFAULT NULL,
  `adate` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2771 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_jmars_info
-- ----------------------------
DROP TABLE IF EXISTS `data_jmars_info`;
CREATE TABLE `data_jmars_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jmars` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `json_data` text,
  `rec_time` varchar(30) DEFAULT NULL,
  `type` varchar(10) DEFAULT 'Jmars',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_milk_enterprise
-- ----------------------------
DROP TABLE IF EXISTS `data_milk_enterprise`;
CREATE TABLE `data_milk_enterprise` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) DEFAULT NULL COMMENT '公司码',
  `milk_code` varchar(255) DEFAULT NULL COMMENT '奶粉码',
  `enterprise_name` varchar(255) DEFAULT NULL COMMENT '企业名称',
  `enterprise_address` varchar(255) DEFAULT NULL COMMENT '企业地址',
  `enterprise_site` varchar(255) DEFAULT NULL COMMENT '企业网址',
  `integrity_certificate_number` varchar(255) DEFAULT NULL COMMENT '诚信评价证书编号',
  `integrity_certificate_validity_period` varchar(255) DEFAULT NULL COMMENT '诚信评价证书有效期',
  `integrity_certificate_address` varchar(255) DEFAULT NULL COMMENT '诚信评价证书地址',
  `production_licence_number` varchar(255) DEFAULT NULL COMMENT '生产许可证编号',
  `production_licence_validity_period` varchar(255) DEFAULT NULL COMMENT '生产许可证编号有效期',
  `producer_name_contact_way` varchar(255) DEFAULT NULL COMMENT '生产者名称及联系方式',
  `trace_info_query_site` varchar(255) DEFAULT NULL COMMENT '企业追溯信息查询地址',
  `enterprise_other_information_one` varchar(255) DEFAULT NULL COMMENT '企业自愿公开的其它信息1',
  `enterprise_other_information_two` varchar(255) DEFAULT NULL COMMENT '企业自愿公开的其它信息2',
  `enterprise_other_information_three` varchar(255) DEFAULT NULL COMMENT '企业自愿公开的其它信息3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_milk_info
-- ----------------------------
DROP TABLE IF EXISTS `data_milk_info`;
CREATE TABLE `data_milk_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_code` varchar(255) DEFAULT NULL COMMENT '公司码',
  `milk_code` varchar(255) DEFAULT NULL COMMENT '奶粉条码',
  `food_name` varchar(255) DEFAULT NULL COMMENT '奶粉名称',
  `specifications` varchar(255) DEFAULT NULL COMMENT '净含量、规格',
  `product_date` varchar(255) DEFAULT NULL COMMENT '生产日期',
  `shelf_life` varchar(255) DEFAULT NULL COMMENT '保质期',
  `product_batches` varchar(255) DEFAULT NULL COMMENT '产品批次',
  `food_production_address` varchar(255) DEFAULT NULL COMMENT '生产地址',
  `product_standard_code` varchar(255) DEFAULT NULL COMMENT '产品标准代号',
  `category_property` varchar(255) DEFAULT NULL COMMENT '类别、属性',
  `production_process` varchar(255) DEFAULT NULL COMMENT '生产工艺',
  `age` varchar(255) DEFAULT NULL COMMENT '适用年龄',
  `use_instruction` text COMMENT '使用说明',
  `warning` varchar(255) DEFAULT NULL COMMENT '警示说明',
  `storage_conditions` varchar(255) DEFAULT NULL COMMENT '储存条件',
  `other_explanation` varchar(255) DEFAULT NULL COMMENT '原料说明',
  `certificate` varchar(255) DEFAULT NULL COMMENT '主要原料合格证明',
  `product_inspection_report` varchar(255) DEFAULT NULL COMMENT '产品检验报告',
  `other_quality_commitment` varchar(255) DEFAULT NULL COMMENT '质量承诺',
  `ingredients` text COMMENT '配料表',
  `nutrient_component` text COMMENT '主要营养成分及含量',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for data_qrcode_card
-- ----------------------------
DROP TABLE IF EXISTS `data_qrcode_card`;
CREATE TABLE `data_qrcode_card` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `name` varchar(100) NOT NULL COMMENT '名片名字',
  `telnum` varchar(50) NOT NULL COMMENT '移动电话',
  `phnum` varchar(50) DEFAULT NULL COMMENT '工作电话',
  `addr` varchar(255) DEFAULT NULL COMMENT '工作地址',
  `email` varchar(100) DEFAULT NULL COMMENT '电子邮箱',
  `org` varchar(255) DEFAULT NULL COMMENT '组织',
  `page` varchar(255) DEFAULT NULL COMMENT '个人主页',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  PRIMARY KEY (`id`),
  KEY `niotid_username_index` (`name`,`telnum`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='二维码电子名片';

-- ----------------------------
-- Table structure for data_qrcode_user
-- ----------------------------
DROP TABLE IF EXISTS `data_qrcode_user`;
CREATE TABLE `data_qrcode_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `content` text COMMENT '内容',
  `type` varchar(40) DEFAULT NULL COMMENT '类型',
  `atime` varchar(20) DEFAULT NULL COMMENT '添加时间',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `status` varchar(1) DEFAULT '1' COMMENT '状态 ''0''、''1''',
  PRIMARY KEY (`id`),
  KEY `id_index` (`id`),
  KEY `user_index` (`username`),
  KEY `type_index` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=509 DEFAULT CHARSET=utf8 COMMENT='二维码生成表';

-- ----------------------------
-- Table structure for data_upc_info
-- ----------------------------
DROP TABLE IF EXISTS `data_upc_info`;
CREATE TABLE `data_upc_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `upc` varchar(20) NOT NULL COMMENT '商品编码',
  `asin` varchar(20) DEFAULT NULL COMMENT 'ASIN',
  `Title` varchar(255) DEFAULT NULL COMMENT '商品名称',
  `Publisher` varchar(255) DEFAULT NULL COMMENT '商家名称',
  `recordTime` varchar(19) DEFAULT NULL COMMENT '记录时间 %Y%m%d%H%M%S',
  `Manufacturer` varchar(255) DEFAULT NULL COMMENT '生产商',
  `Feature` text COMMENT '广告词',
  `rmb` varchar(16) DEFAULT NULL COMMENT '人民币价格',
  `ListPrice` varchar(16) DEFAULT NULL COMMENT '标签美元价格',
  `OfferPrice` varchar(16) DEFAULT NULL COMMENT '商家美元价格',
  `good` varchar(10) DEFAULT NULL COMMENT '好评度',
  `product_size` varchar(255) DEFAULT NULL COMMENT '产品尺寸',
  `Weight` varchar(255) DEFAULT NULL COMMENT '运输重量',
  `Size` varchar(255) DEFAULT NULL COMMENT '规格',
  `ProductGroup` varchar(255) DEFAULT NULL COMMENT '产品分类',
  `SalesRank` varchar(200) DEFAULT NULL COMMENT '亚马逊畅销排名',
  `Content` text COMMENT '描述',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '商品图片地址',
  `imp_info` text COMMENT '重要声明',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`upc`)
) ENGINE=InnoDB AUTO_INCREMENT=542 DEFAULT CHARSET=utf8 COMMENT='海外商品详情信息表';

-- ----------------------------
-- Table structure for para_activity_list
-- ----------------------------
DROP TABLE IF EXISTS `para_activity_list`;
CREATE TABLE `para_activity_list` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `big_title` varchar(255) DEFAULT NULL COMMENT '大标题',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享页地址',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '分享图标地址',
  `share_title` varchar(255) DEFAULT NULL COMMENT '分享页标题',
  `share_content` varchar(255) DEFAULT NULL COMMENT '分享页内容',
  `status_valid` varchar(1) DEFAULT '0' COMMENT '状态',
  `atime` date DEFAULT NULL COMMENT '添加时间',
  `time` varchar(20) DEFAULT NULL COMMENT '时间',
  `username` varchar(50) DEFAULT NULL COMMENT '修改人',
  `stime` date DEFAULT NULL COMMENT '开始时间',
  `etime` date DEFAULT NULL COMMENT '结束时间',
  `status_show` varchar(1) DEFAULT NULL COMMENT '是否展示',
  `push_time` int(11) DEFAULT '0' COMMENT '推送次数',
  `is_count` varchar(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `flag_index` (`big_title`,`title`,`status_valid`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='轮播页表';

-- ----------------------------
-- Table structure for para_business_address
-- ----------------------------
DROP TABLE IF EXISTS `para_business_address`;
CREATE TABLE `para_business_address` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bus_id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT '0',
  `rec_time` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for para_business_info
-- ----------------------------
DROP TABLE IF EXISTS `para_business_info`;
CREATE TABLE `para_business_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `title_2` varchar(255) DEFAULT NULL,
  `content` text,
  `hours` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `icon_url` varchar(255) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `v_flag` varchar(1) DEFAULT NULL,
  `atime` varchar(255) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `img_flag` varchar(1) DEFAULT NULL,
  `num` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for para_ency_brand
-- ----------------------------
DROP TABLE IF EXISTS `para_ency_brand`;
CREATE TABLE `para_ency_brand` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `name` varchar(255) DEFAULT NULL COMMENT '品牌名称',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '展示页链接',
  `status` varchar(1) DEFAULT '1' COMMENT '状态',
  `content` varchar(255) DEFAULT NULL COMMENT '分享内容',
  `icon_url` varchar(255) DEFAULT NULL COMMENT 'icon链接',
  `brand` varchar(255) DEFAULT NULL COMMENT '品牌',
  `atime` varchar(20) DEFAULT NULL COMMENT '修改时间',
  `top` int(11) DEFAULT '0' COMMENT '展示排序',
  PRIMARY KEY (`id`),
  KEY `index_id` (`id`,`top`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='品牌名录表';

-- ----------------------------
-- Table structure for para_ency_carousel
-- ----------------------------
DROP TABLE IF EXISTS `para_ency_carousel`;
CREATE TABLE `para_ency_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `big_title` varchar(255) DEFAULT NULL COMMENT '大标题',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享页地址',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '分享图标地址',
  `share_title` varchar(255) DEFAULT NULL COMMENT '分享页标题',
  `share_content` varchar(255) DEFAULT NULL COMMENT '分享页内容',
  `status` varchar(1) DEFAULT '0' COMMENT '状态',
  `atime` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `date` varchar(10) DEFAULT NULL COMMENT '日期',
  `time` varchar(10) DEFAULT NULL COMMENT '时间',
  `username` varchar(50) DEFAULT NULL COMMENT '修改人',
  `is_count` varchar(1) DEFAULT '0' COMMENT '分享是否增加次数 "1"：是；"0"：否',
  PRIMARY KEY (`id`),
  KEY `flag_index` (`big_title`,`title`,`status`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COMMENT='轮播页表';

-- ----------------------------
-- Table structure for para_ency_news
-- ----------------------------
DROP TABLE IF EXISTS `para_ency_news`;
CREATE TABLE `para_ency_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `source` varchar(255) DEFAULT NULL COMMENT '来源',
  `pp` int(11) DEFAULT '0' COMMENT 'like点赞',
  `status` varchar(1) DEFAULT '0' COMMENT '状态',
  `time` varchar(20) DEFAULT NULL COMMENT '编辑时间',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '图标',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片',
  `content` text COMMENT '内容摘要',
  `type` varchar(1) DEFAULT '0' COMMENT '新闻类型',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `cont` text COMMENT '内容',
  `review` varchar(255) DEFAULT NULL COMMENT '导读',
  `atime` varchar(20) DEFAULT NULL COMMENT '添加时间',
  `top` varchar(1) DEFAULT NULL COMMENT '置顶',
  `news_type` varchar(20) DEFAULT NULL COMMENT '百科新闻分类',
  PRIMARY KEY (`id`),
  KEY `id` (`id`),
  KEY `status` (`status`),
  KEY `top` (`top`),
  KEY `time` (`time`)
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8 COMMENT='百科新闻列表';

-- ----------------------------
-- Table structure for para_feed_carousel
-- ----------------------------
DROP TABLE IF EXISTS `para_feed_carousel`;
CREATE TABLE `para_feed_carousel` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `big_title` varchar(255) DEFAULT NULL COMMENT '大标题',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `img_url` varchar(255) DEFAULT NULL COMMENT '图片地址',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `share_url` varchar(255) DEFAULT NULL COMMENT '分享页地址',
  `icon_url` varchar(255) DEFAULT NULL COMMENT '分享图标地址',
  `share_title` varchar(255) DEFAULT NULL COMMENT '分享页标题',
  `share_content` varchar(255) DEFAULT NULL COMMENT '分享页内容',
  `status` varchar(1) DEFAULT '0' COMMENT '状态',
  `atime` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `date` varchar(10) DEFAULT NULL COMMENT '日期',
  `time` varchar(10) DEFAULT NULL COMMENT '时间',
  `username` varchar(50) DEFAULT NULL COMMENT '修改人',
  `is_count` varchar(1) DEFAULT '0' COMMENT '分享是否增加次数 "1"：是；"0"：否',
  PRIMARY KEY (`id`),
  KEY `flag_index` (`big_title`,`title`,`status`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='轮播页表';

-- ----------------------------
-- Table structure for para_feed_news
-- ----------------------------
DROP TABLE IF EXISTS `para_feed_news`;
CREATE TABLE `para_feed_news` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `title` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '标题',
  `source` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '来源',
  `pp` int(11) DEFAULT '0' COMMENT 'like点赞',
  `status` varchar(1) CHARACTER SET utf8 DEFAULT '1' COMMENT '状态',
  `time` varchar(20) DEFAULT NULL,
  `icon_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图标',
  `img_url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片',
  `content` text CHARACTER SET utf8 COMMENT '内容摘要',
  `type` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '新闻类型',
  `url` varchar(255) CHARACTER SET utf8 DEFAULT NULL COMMENT '链接地址',
  `cont` text CHARACTER SET utf8 COMMENT '内容描述',
  `atime` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '添加时间',
  `stime` varchar(20) CHARACTER SET utf8 DEFAULT '2015-10-21' COMMENT '发布时间',
  `count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=159 DEFAULT CHARSET=latin1 COMMENT='新闻列表';

-- ----------------------------
-- Table structure for para_feed_record
-- ----------------------------
DROP TABLE IF EXISTS `para_feed_record`;
CREATE TABLE `para_feed_record` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `feed_id` int(11) DEFAULT '0' COMMENT '推送消息id',
  `title` varchar(255) DEFAULT NULL COMMENT '消息标题',
  `content` text COMMENT '私信内容',
  `date` varchar(20) DEFAULT NULL COMMENT '推送日期',
  `type` int(1) DEFAULT NULL COMMENT '推送标识：0所有 1系统 2用户推送',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `status` varchar(1) DEFAULT '1' COMMENT '消息状态 ‘1’有效 0’无效‘',
  PRIMARY KEY (`id`),
  KEY `flag_index` (`type`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=727 DEFAULT CHARSET=utf8 COMMENT='消息推送历史表';

-- ----------------------------
-- Table structure for para_news_appraise
-- ----------------------------
DROP TABLE IF EXISTS `para_news_appraise`;
CREATE TABLE `para_news_appraise` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一id',
  `news_id` int(11) NOT NULL COMMENT '新闻id',
  `type` int(1) NOT NULL COMMENT '新闻类型 1：首页新闻 2：百科新闻',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `atime` varchar(20) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`),
  KEY `id_index` (`news_id`,`type`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for para_start_page
-- ----------------------------
DROP TABLE IF EXISTS `para_start_page`;
CREATE TABLE `para_start_page` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一索引',
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `image_ios` varchar(255) DEFAULT NULL COMMENT '图片地址-ios',
  `image_android` varchar(255) DEFAULT NULL COMMENT '图片地址-andriod',
  `url` varchar(255) DEFAULT NULL COMMENT '链接地址',
  `status` varchar(1) DEFAULT '0' COMMENT '状态',
  `atime` varchar(30) DEFAULT NULL COMMENT '添加时间',
  `username` varchar(50) DEFAULT NULL COMMENT '修改人',
  `is_count` varchar(1) DEFAULT '0' COMMENT '分享是否增加次数 "1"：是；"0"：否',
  `stime` varchar(20) DEFAULT NULL,
  `etime` varchar(20) DEFAULT NULL,
  `ptime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flag_index` (`title`,`status`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='轮播页表';

-- ----------------------------
-- Table structure for para_user_info
-- ----------------------------
DROP TABLE IF EXISTS `para_user_info`;
CREATE TABLE `para_user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一ID',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `password` varchar(255) NOT NULL COMMENT '密码',
  `adate` datetime DEFAULT NULL COMMENT '注册时间',
  `ldate` datetime DEFAULT NULL COMMENT '登录时间',
  `status` varchar(1) DEFAULT NULL COMMENT '登录状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='管理页用户表';

-- ----------------------------
-- Table structure for record_gain_exp
-- ----------------------------
DROP TABLE IF EXISTS `record_gain_exp`;
CREATE TABLE `record_gain_exp` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `login` int(5) DEFAULT '0' COMMENT '登录',
  `scan` int(8) DEFAULT '0' COMMENT '扫码',
  `comment` int(5) DEFAULT '0' COMMENT '评论',
  `good` int(5) DEFAULT '0' COMMENT '商品点赞',
  `bad` int(5) DEFAULT '0' COMMENT '商品踩一踩',
  `complete` int(5) DEFAULT '0' COMMENT '完善商品信息',
  `share` int(5) DEFAULT '0' COMMENT '分享商品信息',
  `date` varchar(10) DEFAULT NULL COMMENT '最后操作日期',
  `time` varchar(10) DEFAULT NULL COMMENT 'z最后操作时间',
  PRIMARY KEY (`id`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3914 DEFAULT CHARSET=utf8 COMMENT='经验获取记录表';

-- ----------------------------
-- Table structure for record_improve_info
-- ----------------------------
DROP TABLE IF EXISTS `record_improve_info`;
CREATE TABLE `record_improve_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(20) DEFAULT NULL COMMENT '用户设备号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名，手机号或邮箱',
  `barcode` varchar(20) DEFAULT NULL COMMENT '商品编码',
  `advice` text NOT NULL COMMENT '举报意见',
  `adate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `atime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '处理状态：0未处理 1已处理',
  `person` varchar(50) DEFAULT NULL COMMENT '处理人，手机号或邮箱',
  `note` text COMMENT '处理意见备注',
  `edate` int(8) DEFAULT NULL COMMENT '处理日期',
  `etime` int(6) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='完善信息记录表';

-- ----------------------------
-- Table structure for record_scan_counter
-- ----------------------------
DROP TABLE IF EXISTS `record_scan_counter`;
CREATE TABLE `record_scan_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) NOT NULL COMMENT '商品编码',
  `count` int(11) NOT NULL COMMENT '扫描次数',
  `success` int(1) NOT NULL COMMENT '扫描是否成功：0失败 1成功',
  `add` int(1) NOT NULL DEFAULT '0' COMMENT '是否补充：0未补充 1补充',
  `adate` int(8) NOT NULL COMMENT '最后一次操作日期',
  `atime` int(6) NOT NULL COMMENT '最后一次操作时间',
  `type` varchar(20) DEFAULT NULL COMMENT '条码类型',
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`)
) ENGINE=InnoDB AUTO_INCREMENT=26831 DEFAULT CHARSET=utf8 COMMENT='用户扫描次数记录表';

-- ----------------------------
-- Table structure for record_scan_dtl
-- ----------------------------
DROP TABLE IF EXISTS `record_scan_dtl`;
CREATE TABLE `record_scan_dtl` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(50) NOT NULL COMMENT '商品编码',
  `username` varchar(50) NOT NULL COMMENT '用户名，手机号或邮箱',
  `success` int(1) NOT NULL COMMENT '扫描是否成功：0失败 1成功',
  `latitude` varchar(20) DEFAULT NULL COMMENT '经度',
  `longitude` varchar(20) DEFAULT NULL COMMENT '纬度',
  `adate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `atime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `type` varchar(20) DEFAULT NULL COMMENT '条码类型',
  `city` varchar(255) DEFAULT NULL,
  `province` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `barcode_index` (`barcode`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=94654 DEFAULT CHARSET=utf8 COMMENT='用户扫描记录表';

-- ----------------------------
-- Table structure for temp
-- ----------------------------
DROP TABLE IF EXISTS `temp`;
CREATE TABLE `temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `barcode` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=120001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for user_advice
-- ----------------------------
DROP TABLE IF EXISTS `user_advice`;
CREATE TABLE `user_advice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imei` varchar(20) DEFAULT NULL COMMENT '用户设备号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名，手机号或邮箱',
  `advice` text NOT NULL COMMENT '意见或建议',
  `adate` int(8) NOT NULL DEFAULT '0' COMMENT '记录日期',
  `atime` int(6) NOT NULL DEFAULT '0' COMMENT '记录时间',
  `status` int(1) NOT NULL DEFAULT '0' COMMENT '处理状态：0未处理 1已处理',
  `person` varchar(50) DEFAULT NULL COMMENT '处理人，手机号或邮箱',
  `note` text COMMENT '处理意见备注',
  `edate` int(8) DEFAULT NULL COMMENT '处理日期',
  `etime` int(6) DEFAULT NULL COMMENT '处理时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 COMMENT='意见与建议记录表';

-- ----------------------------
-- Table structure for user_favorite
-- ----------------------------
DROP TABLE IF EXISTS `user_favorite`;
CREATE TABLE `user_favorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '唯一标识',
  `code` varchar(100) NOT NULL COMMENT '类型标识码',
  `username` varchar(50) NOT NULL COMMENT '用户名，手机号',
  `flag` varchar(1) NOT NULL COMMENT '是否关注：0取消关注 1关注',
  `address_dtl` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `address` varchar(100) DEFAULT NULL COMMENT '街道地址',
  `recordTime` varchar(20) DEFAULT NULL COMMENT '记录时间 %Y%m%d%H%M%S',
  `type` varchar(20) NOT NULL COMMENT '编码类型',
  PRIMARY KEY (`id`),
  KEY `niotid_username_index` (`code`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=278 DEFAULT CHARSET=utf8 COMMENT='用户收藏列表';

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '用户名',
  `nickname` varchar(100) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户昵称',
  `gender` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户性别',
  `birthday` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '生日',
  `city` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '城市',
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '电话',
  `email` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '邮箱',
  `pwd` varchar(50) CHARACTER SET utf8 NOT NULL DEFAULT '123456' COMMENT '密码',
  `portrait` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '头像',
  `points` double NOT NULL DEFAULT '0' COMMENT '积分',
  `imei` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '移动设备国际身份码',
  `imsi` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '国际移动用户识别码',
  `leval` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '用户基本：0普通用户 1审核员 2管理员',
  `latitude` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录经度',
  `longitude` varchar(30) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录纬度',
  `status` varchar(1) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录状态:0未登录 1登录',
  `rdate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '注册日期',
  `logindate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '登录日期',
  `logoutdate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '退出日期',
  `activation` int(1) NOT NULL DEFAULT '0' COMMENT '是否激活：0未激活 1激活',
  `acticode` varchar(50) CHARACTER SET utf8 DEFAULT NULL COMMENT '激活码',
  `actidate` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '激活时间',
  `experience` int(10) NOT NULL DEFAULT '0' COMMENT '用户经验',
  `valid_time` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '短信验证码有效时间',
  PRIMARY KEY (`id`),
  KEY `username_index` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2697 DEFAULT CHARSET=latin1 COMMENT='用户信息表';

-- ----------------------------
-- Procedure structure for activityStatusChange
-- ----------------------------
DROP PROCEDURE IF EXISTS `activityStatusChange`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `activityStatusChange`()
BEGIN
    declare `now_time` char(20) default date_format(now(), '%Y%m%d');
    declare `_stime` char(20);
    declare `_ptime` char(20);
    declare `_etime` char(20);
    declare `_id` int;
    declare `done` int default 0;
    declare `cur` cursor for
		select `id`, `stime`, `push_time`, `etime`  
			from `para_activity_list`;
	declare continue handler for not found set `done` = 1;
    
    open `cur`;
	
    repeat
    
		fetch `cur` into `_id`, `_stime`, `_ptime`, `_etime`;
		set `_stime` = replace(`_stime`, '-', '');
        set `_ptime` = replace(`_ptime`, '-', '');
        set `_etime` = replace(`_etime`, '-', '');
        
        if `_ptime` <= `now_time` then
			update `para_activity_list` 
				set `status_show` = '1' 
                where `id` = `_id`;
		end if;
        
        if `_stime` <= `now_time` then
			if `_etime` < `now_time` then
				update `para_activity_list` 
					set `status_valid` = '0' 
					where `id` = `_id`;
			else
				update `para_activity_list` 
					set `status_valid` = '1' 
					where `id` = `_id`;
			end if;
		else
			update `para_activity_list` 
				set `status_valid` = '2' 
                where `id` = `_id`;
		end if;
    
    until `done` = 1
    end repeat;
    
    close `cur`;
    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for barcode
-- ----------------------------
DROP PROCEDURE IF EXISTS `barcode`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `barcode`()
BEGIN
	declare `done` int default 0;
	declare `num` char(20);
    
	drop table if exists `barcodeTemp`;
	create table `barcodeTemp`(
		`id` int(11) NOT NULL auto_increment,
		`barcode` varchar(20),
		primary key (`id`)
	);
    
	begin
		declare i int;
		set i = 0;
		while i<120000 do
			BEGIN
				declare `cur_barcode` cursor for 
					SELECT barcode FROM data_barcode_info WHERE id >=(SELECT floor( RAND() *((SELECT MAX(id) FROM data_barcode_info )-(SELECT MIN(id) FROM data_barcode_info )) +(SELECT MIN(id) FROM data_barcode_info ))) ORDER BY id LIMIT 1;
				declare continue handler for not found set done = 1;
				open `cur_barcode`;
				repeat
					fetch `cur_barcode` into `num`;
					insert into `barcodeTemp`(`barcode`) values (`num`);
				until done = 0
				end repeat;
				set done = 0;
				set i = i + 1;
			END;
		end while;
	end;
select * from barcodeTemp;
    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for iotCounter
-- ----------------------------
DROP PROCEDURE IF EXISTS `iotCounter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `iotCounter`()
BEGIN
	declare `done` int default 0;
	declare `num` int;
	declare `idsum` int default 0;
	declare `now_time` char(20) default date_format(now(), '%Y%m%d');
	declare `_time` char(20) default replace(`now_time`, '-', '');
	declare `dayDec` char(20) default datediff(`now_time`, '2015-01-17');
    
	declare `cur_barcode` cursor for 
		select max(id) 
			from `data_barcode_info`;
	declare `cur_desc` cursor for 
		select count(1) 
			from `data_desc_info`;
	declare `cur_book` cursor for
		select count(1)
			from `data_book_info`;
	declare `cur_upc` cursor for
		select count(1)
			from `data_upc_info`;
	declare `cur_scan_daily` cursor for
		select count(1)
			from `record_scan_dtl`
            where `adate` = `_time`;
	declare `cur_scan_total` cursor for
		select count(1)
			from `record_scan_dtl`;
	declare continue handler for not found set done = 1;
            
	drop table if exists `counterTemp`;
    create table `counterTemp`(
		`id` int(11) NOT NULL auto_increment,
        `type` varchar(20),
        `count` int(11),
        primary key (`id`)
	);
    
    open `cur_barcode`;
	repeat
		fetch `cur_barcode` into `num`;
		set `idsum` = `idsum` + `num` - 10747807;
	until done = 0
	end repeat;
	set done = 0;
    
	open `cur_desc`;
	repeat
	fetch `cur_desc` into `num`;
		set `idsum` = `idsum` + `num`;
	until done = 0
	end repeat;
	set done = 0;
    
	open `cur_book`;
	repeat
	fetch `cur_book` into `num`;
		set `idsum` = `idsum` + `num`;
	until done = 0
	end repeat;
	set done = 0;
    
	open `cur_upc`;
	repeat
	fetch `cur_upc` into `num`;
		set `idsum` = `idsum` + `num`;
	until done = 0
	end repeat;
	set done = 0;
    
	insert into `counterTemp`(`type`, `count`) values ('idsum', `idsum`); 
	
	open `cur_scan_daily`;
	repeat
	fetch `cur_scan_daily` into `num`;
		insert into `counterTemp`(`type`, `count`) values ('daily', `num`);
	until done = 0
	end repeat;
	set done = 0;
	
	open `cur_scan_total`;
	repeat
	fetch `cur_scan_total` into `num`;
		set `idsum` = `num`/`dayDec`;
		insert into `counterTemp`(`type`, `count`) values ('total', `num`);
		insert into `counterTemp`(`type`, `count`) values ('dailyAvg', `idsum`);
	until done = 0
	end repeat;
	set done = 0;
	
	select * from `counterTemp`;
	
	close `cur_barcode`;
	close `cur_desc`;
	close `cur_book`;
	close `cur_upc`;
	close `cur_scan_daily`;
	close `cur_scan_total`;
	
	drop table `counterTemp`;
    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for newsStatusChange
-- ----------------------------
DROP PROCEDURE IF EXISTS `newsStatusChange`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `newsStatusChange`()
BEGIN
    declare `now_time` char(20) default date_format(now(), '%Y%m%d');
    declare `_stime` char(20);
    declare `_id` int;
    declare `done` int default 0;
    declare `cur` cursor for
		select `id`, `atime` 
			from `para_feed_news`
            where `status` = '2';
	declare continue handler for not found set `done` = 1;
    
    open `cur`;
	
    repeat
    
		fetch `cur` into `_id`, `_stime`;
		set `_stime` = replace(`_stime`, '-', '');
        
        if `_stime` <= `now_time` then
			update `para_feed_news` 
				set `status` = '1' 
                where `id` = `_id`;
			# select _id, _stime;
		end if;
    
    until `done` = 1
    end repeat;
    
    close `cur`;
    
END
;;
DELIMITER ;

-- ----------------------------
-- Procedure structure for weekCounter
-- ----------------------------
DROP PROCEDURE IF EXISTS `weekCounter`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `weekCounter`()
BEGIN
	declare `done` int default 0;
    declare `num` int;
    declare `pas_time` char(20) default date_sub(date_format(now(), '%Y%m%d'), interval '7' day);
	declare `_time` char(20) default replace(`pas_time`, '-', '');
    
    declare `cur_barcode` cursor for 
		select max(id) 
			from `data_barcode_info`;
	declare `cur_desc` cursor for 
		select count(id) 
			from `data_desc_info`;
	declare `cur_milk` cursor for
		select count(id)
			from `data_milk_info`;
	declare `cur_book` cursor for
		select count(id)
			from `data_book_info`;
	declare `cur_upc` cursor for
		select count(id)
			from `data_upc_info`;
	declare `cur_user` cursor for
		select max(id)
			from `user_info`;
	declare `cur_scan` cursor for
		select count(id)
			from `record_scan_dtl`
            where `adate` > `_time`;
	declare continue handler for not found set done = 1;
            
	drop table if exists `counterTemp`;
    create table `counterTemp`(
		`id` int(11) NOT NULL auto_increment,
        `type` varchar(20),
        `count` int(11),
        primary key (`id`)
	);
    
    open `cur_barcode`;
	repeat
		fetch `cur_barcode` into `num`;
        set `num` = `num` - 10747807;
        insert into `counterTemp`(`type`, `count`) values ('条形码', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_desc`;
    repeat
		fetch `cur_desc` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('药监码', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_milk`;
    repeat
		fetch `cur_milk` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('Handle码', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_book`;
    repeat
		fetch `cur_book` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('ISBN码', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_upc`;
    repeat
		fetch `cur_upc` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('UPC码', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_user`;
    repeat
		fetch `cur_user` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('用户注册量', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    open `cur_scan`;
    repeat
		fetch `cur_scan` into `num`;
        insert into `counterTemp`(`type`, `count`) values ('7天累计扫码量', `num`);
	until done = 1
    end repeat;
    set done = 0;
    
    select * from `counterTemp` group by `type`;
    
    close `cur_barcode`;
    close `cur_desc`;
    close `cur_milk`;
    close `cur_book`;
    close `cur_upc`;
    close `cur_user`;
    close `cur_scan`;
    
    drop table `counterTemp`;
    
END
;;
DELIMITER ;

-- ----------------------------
-- Event structure for dailyRefreshActivity
-- ----------------------------
DROP EVENT IF EXISTS `dailyRefreshActivity`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `dailyRefreshActivity` ON SCHEDULE EVERY 1 DAY STARTS '2015-11-02 09:38:33' ON COMPLETION NOT PRESERVE ENABLE DO call activityStatusChange()
;;
DELIMITER ;

-- ----------------------------
-- Event structure for dailyRefreshNews
-- ----------------------------
DROP EVENT IF EXISTS `dailyRefreshNews`;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` EVENT `dailyRefreshNews` ON SCHEDULE EVERY 5 HOUR STARTS '2015-11-02 09:38:03' ON COMPLETION NOT PRESERVE ENABLE DO call newsStatusChange()
;;
DELIMITER ;

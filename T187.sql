/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t187`;
CREATE DATABASE IF NOT EXISTS `t187` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t187`;

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `yonghu_id` int NOT NULL COMMENT '创建用户',
  `address_name` varchar(200) NOT NULL COMMENT '收货人 ',
  `address_phone` varchar(200) NOT NULL COMMENT '电话 ',
  `address_dizhi` varchar(200) NOT NULL COMMENT '地址 ',
  `isdefault_types` int NOT NULL COMMENT '是否默认地址 ',
  `insert_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '修改时间',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='收货地址';

DELETE FROM `address`;
INSERT INTO `address` (`id`, `yonghu_id`, `address_name`, `address_phone`, `address_dizhi`, `isdefault_types`, `insert_time`, `update_time`, `create_time`) VALUES
	(1, 1, '收货人1', '17703786901', '地址1', 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(2, 1, '收货人2', '17703786902', '地址2', 2, '2022-03-23 12:59:37', '2022-03-23 13:23:44', '2022-03-23 12:59:37'),
	(3, 3, '收货人3', '17703786903', '地址3', 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(4, 1, '收货人4', '17703786904', '地址4', 1, '2022-03-23 12:59:37', '2022-03-23 13:16:46', '2022-03-23 12:59:37'),
	(5, 2, '收货人5', '17703786905', '地址5', 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37', '2022-03-23 12:59:37');

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `yonghu_id` int DEFAULT NULL COMMENT '所属用户',
  `shangpin_id` int DEFAULT NULL COMMENT '商品',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '更新时间',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COMMENT='购物车';

DELETE FROM `cart`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-23 12:57:32'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-23 12:57:32'),
	(3, 'huiyuandengji_types', '会员等级类型', 1, '青铜会员', NULL, '0.98', '2022-03-23 12:57:32'),
	(4, 'huiyuandengji_types', '会员等级类型', 2, '白银会员', NULL, '0.96', '2022-03-23 12:57:32'),
	(5, 'huiyuandengji_types', '会员等级类型', 3, '黄金会员', NULL, '0.95', '2022-03-23 12:57:32'),
	(6, 'shangjia_xingji_types', '商铺信用类型', 1, '一级', NULL, NULL, '2022-03-23 12:57:32'),
	(7, 'shangjia_xingji_types', '商铺信用类型', 2, '二级', NULL, NULL, '2022-03-23 12:57:32'),
	(8, 'shangjia_xingji_types', '商铺信用类型', 3, '三级', NULL, NULL, '2022-03-23 12:57:32'),
	(9, 'shangxia_types', '上下架', 1, '上架', NULL, NULL, '2022-03-23 12:57:32'),
	(10, 'shangxia_types', '上下架', 2, '下架', NULL, NULL, '2022-03-23 12:57:32'),
	(11, 'shangpin_types', '商品类型', 1, '商品类型1', NULL, NULL, '2022-03-23 12:57:32'),
	(12, 'shangpin_types', '商品类型', 2, '商品类型2', NULL, NULL, '2022-03-23 12:57:32'),
	(13, 'shangpin_types', '商品类型', 3, '商品类型3', NULL, NULL, '2022-03-23 12:57:32'),
	(14, 'shangpin_types', '商品类型', 4, '商品类型4', NULL, NULL, '2022-03-23 12:57:32'),
	(15, 'shangpin_collection_types', '收藏表类型', 1, '收藏', NULL, NULL, '2022-03-23 12:57:32'),
	(16, 'shangpin_order_types', '订单类型', 1, '已支付', NULL, NULL, '2022-03-23 12:57:32'),
	(17, 'shangpin_order_types', '订单类型', 2, '退款', NULL, NULL, '2022-03-23 12:57:32'),
	(18, 'shangpin_order_types', '订单类型', 3, '已发货', NULL, NULL, '2022-03-23 12:57:32'),
	(19, 'shangpin_order_types', '订单类型', 4, '已收货', NULL, NULL, '2022-03-23 12:57:32'),
	(20, 'shangpin_order_types', '订单类型', 5, '已评价', NULL, NULL, '2022-03-23 12:57:32'),
	(21, 'shangpin_order_payment_types', '订单支付类型', 1, '现金', NULL, NULL, '2022-03-23 12:57:32'),
	(22, 'single_seach_types', '单页数据类型', 1, '网站介绍', NULL, NULL, '2022-03-23 12:57:32'),
	(23, 'single_seach_types', '单页数据类型', 2, '联系我们', NULL, NULL, '2022-03-23 12:57:32'),
	(24, 'isdefault_types', '是否默认地址', 1, '否', NULL, NULL, '2022-03-23 12:57:32'),
	(25, 'isdefault_types', '是否默认地址', 2, '是', NULL, NULL, '2022-03-23 12:57:32'),
	(26, 'gonggao_types', '公告类型', 1, '公告类型1', NULL, NULL, '2022-03-23 12:57:33'),
	(27, 'gonggao_types', '公告类型', 2, '公告类型2', NULL, NULL, '2022-03-23 12:57:33'),
	(28, 'shangpin_types', '商品类型', 5, '商品类型5', NULL, '', '2022-03-23 13:24:22');

DROP TABLE IF EXISTS `gonggao`;
CREATE TABLE IF NOT EXISTS `gonggao` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `gonggao_name` varchar(200) DEFAULT NULL COMMENT '公告名称 Search111  ',
  `gonggao_photo` varchar(200) DEFAULT NULL COMMENT '公告图片 ',
  `gonggao_types` int NOT NULL COMMENT '公告类型 ',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '公告发布时间 ',
  `gonggao_content` text COMMENT '公告详情 ',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='公告';

DELETE FROM `gonggao`;
INSERT INTO `gonggao` (`id`, `gonggao_name`, `gonggao_photo`, `gonggao_types`, `insert_time`, `gonggao_content`, `create_time`) VALUES
	(1, '公告名称1', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/gonggao1.jpg', 2, '2022-03-23 12:59:37', '公告详情1', '2022-03-23 12:59:37'),
	(2, '公告名称2', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/gonggao2.jpg', 1, '2022-03-23 12:59:37', '公告详情2', '2022-03-23 12:59:37'),
	(3, '公告名称3', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/gonggao3.jpg', 1, '2022-03-23 12:59:37', '公告详情3', '2022-03-23 12:59:37'),
	(4, '公告名称4', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/gonggao4.jpg', 2, '2022-03-23 12:59:37', '公告详情4', '2022-03-23 12:59:37'),
	(5, '公告名称5', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/gonggao5.jpg', 1, '2022-03-23 12:59:37', '公告详情5', '2022-03-23 12:59:37');

DROP TABLE IF EXISTS `shangjia`;
CREATE TABLE IF NOT EXISTS `shangjia` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `username` varchar(200) DEFAULT NULL COMMENT '账户 ',
  `password` varchar(200) DEFAULT NULL COMMENT '密码 ',
  `shangjia_name` varchar(200) DEFAULT NULL COMMENT '商铺名称 Search111 ',
  `shangjia_phone` varchar(200) DEFAULT NULL COMMENT '联系方式',
  `shangjia_email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `shangjia_photo` varchar(200) DEFAULT NULL COMMENT '营业执照展示 ',
  `shangjia_xingji_types` int DEFAULT NULL COMMENT '商铺信用类型',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '现有余额',
  `shangjia_content` text COMMENT '商铺简介 ',
  `shangjia_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show1 show2 photoShow ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='商铺';

DELETE FROM `shangjia`;
INSERT INTO `shangjia` (`id`, `username`, `password`, `shangjia_name`, `shangjia_phone`, `shangjia_email`, `shangjia_photo`, `shangjia_xingji_types`, `new_money`, `shangjia_content`, `shangjia_delete`, `create_time`) VALUES
	(1, '商铺1', '123456', '商铺名称1', '17703786901', '1@qq.com', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangjia1.jpg', 1, 976.38, '商铺简介1', 1, '2022-03-23 12:59:37'),
	(2, '商铺2', '123456', '商铺名称2', '17703786902', '2@qq.com', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangjia2.jpg', 3, 994.06, '商铺简介2', 1, '2022-03-23 12:59:37'),
	(3, '商铺3', '123456', '商铺名称3', '17703786903', '3@qq.com', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangjia3.jpg', 3, 1292.02, '商铺简介3', 1, '2022-03-23 12:59:37');

DROP TABLE IF EXISTS `shangpin`;
CREATE TABLE IF NOT EXISTS `shangpin` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `shangjia_id` int DEFAULT NULL COMMENT '商铺',
  `shangpin_uuid_number` varchar(200) DEFAULT NULL COMMENT '商品编号  Search111 ',
  `shangpin_name` varchar(200) DEFAULT NULL COMMENT '商品名称  Search111 ',
  `shangpin_photo` varchar(200) DEFAULT NULL COMMENT '商品照片',
  `shangpin_types` int DEFAULT NULL COMMENT '商品类型 Search111',
  `shangpin_kucun_number` int DEFAULT NULL COMMENT '商品库存',
  `shangpin_price` int DEFAULT NULL COMMENT '购买获得积分 ',
  `shangpin_old_money` decimal(10,2) DEFAULT NULL COMMENT '商品原价 ',
  `shangpin_new_money` decimal(10,2) DEFAULT NULL COMMENT '现价/积分 ',
  `shangpin_clicknum` int DEFAULT NULL COMMENT '点击次数 ',
  `shangpin_content` text COMMENT '商品介绍 ',
  `shangxia_types` int DEFAULT NULL COMMENT '是否上架 ',
  `shangpin_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间  show1 show2 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3 COMMENT='商品';

DELETE FROM `shangpin`;
INSERT INTO `shangpin` (`id`, `shangjia_id`, `shangpin_uuid_number`, `shangpin_name`, `shangpin_photo`, `shangpin_types`, `shangpin_kucun_number`, `shangpin_price`, `shangpin_old_money`, `shangpin_new_money`, `shangpin_clicknum`, `shangpin_content`, `shangxia_types`, `shangpin_delete`, `create_time`) VALUES
	(1, 2, '16480403770556', '商品名称1', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangpin1.jpg', 2, 101, 274, 658.88, 90.97, 61, '商品介绍1', 1, 1, '2022-03-23 12:59:37'),
	(2, 3, '16480403770554', '商品名称2', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangpin2.jpg', 1, 100, 106, 586.67, 412.64, 119, '商品介绍2', 1, 1, '2022-03-23 12:59:37'),
	(3, 1, '16480403770553', '商品名称3', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangpin3.jpg', 4, 104, 149, 714.87, 498.45, 215, '商品介绍3', 1, 1, '2022-03-23 12:59:37'),
	(4, 2, '164804037705519', '商品名称4', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangpin4.jpg', 4, 101, 492, 764.57, 76.24, 56, '商品介绍4', 1, 1, '2022-03-23 12:59:37'),
	(5, 2, '164804037705512', '商品名称5', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/shangpin5.jpg', 1, 103, 185, 552.91, 246.89, 416, '商品介绍5', 1, 1, '2022-03-23 12:59:37');

DROP TABLE IF EXISTS `shangpin_collection`;
CREATE TABLE IF NOT EXISTS `shangpin_collection` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shangpin_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shangpin_collection_types` int DEFAULT NULL COMMENT '类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '收藏时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3 photoShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品收藏';

DELETE FROM `shangpin_collection`;
INSERT INTO `shangpin_collection` (`id`, `shangpin_id`, `yonghu_id`, `shangpin_collection_types`, `insert_time`, `create_time`) VALUES
	(1, 1, 2, 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(2, 2, 3, 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(3, 3, 1, 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(4, 4, 2, 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(5, 5, 1, 1, '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(6, 2, 1, 1, '2024-05-14 08:09:19', '2024-05-14 08:09:19');

DROP TABLE IF EXISTS `shangpin_commentback`;
CREATE TABLE IF NOT EXISTS `shangpin_commentback` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shangpin_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `shangpin_commentback_text` text COMMENT '评价内容',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '评价时间',
  `reply_text` text COMMENT '回复内容',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '回复时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品评价';

DELETE FROM `shangpin_commentback`;
INSERT INTO `shangpin_commentback` (`id`, `shangpin_id`, `yonghu_id`, `shangpin_commentback_text`, `insert_time`, `reply_text`, `update_time`, `create_time`) VALUES
	(1, 1, 3, '评价内容1', '2022-03-23 12:59:37', '回复信息1', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(2, 2, 3, '评价内容2', '2022-03-23 12:59:37', '回复信息2', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(3, 3, 2, '评价内容3', '2022-03-23 12:59:37', '回复信息3', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(4, 4, 2, '评价内容4', '2022-03-23 12:59:37', '回复信息4', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(5, 5, 2, '评价内容5', '2022-03-23 12:59:37', '回复信息5', '2022-03-23 12:59:37', '2022-03-23 12:59:37'),
	(6, 5, 1, '嗯 好的很', '2022-03-23 13:31:43', '11111', '2022-03-23 13:32:11', '2022-03-23 13:31:43');

DROP TABLE IF EXISTS `shangpin_order`;
CREATE TABLE IF NOT EXISTS `shangpin_order` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `shangpin_order_uuid_number` varchar(200) DEFAULT NULL COMMENT '订单号 Search111 ',
  `address_id` int DEFAULT NULL COMMENT '收货地址 ',
  `shangpin_id` int DEFAULT NULL COMMENT '商品',
  `yonghu_id` int DEFAULT NULL COMMENT '用户',
  `buy_number` int DEFAULT NULL COMMENT '购买数量',
  `shangpin_order_true_price` decimal(10,2) DEFAULT NULL COMMENT '实付价格',
  `shangpin_order_courier_name` varchar(200) DEFAULT NULL COMMENT '配送人',
  `shangpin_order_courier_number` varchar(200) DEFAULT NULL COMMENT '配送人联系方式',
  `shangpin_order_types` int DEFAULT NULL COMMENT '订单类型 Search111 ',
  `shangpin_order_payment_types` int DEFAULT NULL COMMENT '支付类型',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '订单创建时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show3',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 COMMENT='商品订单';

DELETE FROM `shangpin_order`;
INSERT INTO `shangpin_order` (`id`, `shangpin_order_uuid_number`, `address_id`, `shangpin_id`, `yonghu_id`, `buy_number`, `shangpin_order_true_price`, `shangpin_order_courier_name`, `shangpin_order_courier_number`, `shangpin_order_types`, `shangpin_order_payment_types`, `insert_time`, `create_time`) VALUES
	(2, '1648041769207', 4, 2, 1, 1, 404.39, NULL, NULL, 2, 1, '2022-03-23 13:22:49', '2022-03-23 13:22:49'),
	(3, '1648041800307', 4, 2, 1, 1, 404.39, NULL, NULL, 1, 1, '2022-03-23 13:23:20', '2022-03-23 13:23:20'),
	(4, '1648041800307', 4, 4, 1, 3, 224.15, '无(线下来拿)', '无(线下来拿)', 3, 1, '2022-03-23 13:23:20', '2022-03-23 13:23:20'),
	(5, '1648041800307', 4, 5, 1, 1, 241.95, '张三', '17703786915', 5, 1, '2022-03-23 13:23:20', '2022-03-23 13:23:20'),
	(6, '1715674170478', 2, 2, 1, 1, 404.39, NULL, NULL, 1, 1, '2024-05-14 08:09:30', '2024-05-14 08:09:30');

DROP TABLE IF EXISTS `single_seach`;
CREATE TABLE IF NOT EXISTS `single_seach` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `single_seach_name` varchar(200) DEFAULT NULL COMMENT '名字  Search111 ',
  `single_seach_types` int DEFAULT NULL COMMENT '数据类型',
  `single_seach_content` text COMMENT '内容',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间 show2 nameShow',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3 COMMENT='单页数据';

DELETE FROM `single_seach`;
INSERT INTO `single_seach` (`id`, `single_seach_name`, `single_seach_types`, `single_seach_content`, `create_time`) VALUES
	(1, '联系我们', 2, '<p>联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们联系我们</p>', '2022-03-23 13:15:11'),
	(2, '网站介绍', 1, '<p>网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍网站介绍</p><p><img src="http://localhost:8080/xiaoyuanwangshangshangpu/upload/1648041969545.jpg"></p><p>saf</p>', '2022-03-23 13:15:21');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', '4hx42gp0c70cbs90x2mwro944ghq8wht', '2022-03-23 13:02:30', '2024-05-14 09:07:30'),
	(2, 1, 'a1', 'yonghu', '用户', 'z1mgxtxto562tyw8g9ltapuptoik3h6x', '2022-03-23 13:14:26', '2024-05-14 09:08:49'),
	(3, 1, 'a1', 'shangjia', '商铺', 'qbc8jn6laxikjxdz7aiufmmf6srzq9nd', '2022-03-23 13:26:37', '2024-05-14 09:08:29'),
	(4, 2, 'a2', 'shangjia', '商铺', 'a46vr0rohue84wdo2cdz96suuyzv9p2z', '2022-03-23 13:27:12', '2022-03-23 14:32:02');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `yonghu`;
CREATE TABLE IF NOT EXISTS `yonghu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `yonghu_name` varchar(200) DEFAULT NULL COMMENT '用户姓名 Search111 ',
  `yonghu_phone` varchar(200) DEFAULT NULL COMMENT '用户手机号',
  `yonghu_id_number` varchar(200) DEFAULT NULL COMMENT '用户身份证号',
  `yonghu_photo` varchar(200) DEFAULT NULL COMMENT '用户头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `yonghu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `new_money` decimal(10,2) DEFAULT NULL COMMENT '余额 ',
  `yonghu_sum_jifen` decimal(10,2) DEFAULT NULL COMMENT '总积分',
  `yonghu_new_jifen` decimal(10,2) DEFAULT NULL COMMENT '现积分',
  `huiyuandengji_types` int DEFAULT NULL COMMENT '会员等级',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='用户';

DELETE FROM `yonghu`;
INSERT INTO `yonghu` (`id`, `username`, `password`, `yonghu_name`, `yonghu_phone`, `yonghu_id_number`, `yonghu_photo`, `sex_types`, `yonghu_email`, `new_money`, `yonghu_sum_jifen`, `yonghu_new_jifen`, `huiyuandengji_types`, `create_time`) VALUES
	(1, '用户1', '123456', '用户姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/yonghu1.jpg', 2, '1@qq.com', 9317.94, 2568.69, 2197.58, 1, '2022-03-23 12:59:37'),
	(2, '用户2', '123456', '用户姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/yonghu2.jpg', 1, '2@qq.com', 434.62, 669.91, 11.86, 1, '2022-03-23 12:59:37'),
	(3, '用户3', '123456', '用户姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/xiaoyuanwangshangshangpu/upload/yonghu3.jpg', 2, '3@qq.com', 515.50, 599.68, 345.15, 1, '2022-03-23 12:59:37');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;

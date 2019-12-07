# ************************************************************
# Sequel Pro SQL dump
# Version (null)
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.27-0ubuntu0.18.04.1)
# Database: crm_api
# Generation Time: 2019-08-22 15:46:48 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table admin_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_menu`;

CREATE TABLE `admin_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `order` int(11) NOT NULL DEFAULT '0',
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permission` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_menu` WRITE;
/*!40000 ALTER TABLE `admin_menu` DISABLE KEYS */;

INSERT INTO `admin_menu` (`id`, `parent_id`, `order`, `title`, `icon`, `uri`, `permission`, `created_at`, `updated_at`)
VALUES
	(1,0,5,'仪表盘','fa-bar-chart','/',NULL,NULL,'2019-08-21 16:39:17'),
	(2,0,6,'系统管理','fa-tasks',NULL,NULL,NULL,'2019-08-21 16:36:52'),
	(3,2,7,'管理员','fa-users','auth/users',NULL,NULL,'2019-08-21 16:36:52'),
	(4,2,8,'角色','fa-user','auth/roles',NULL,NULL,'2019-08-21 16:36:52'),
	(5,2,9,'权限','fa-ban','auth/permissions',NULL,NULL,'2019-08-21 16:36:52'),
	(6,2,10,'菜单','fa-bars','auth/menu',NULL,NULL,'2019-08-21 16:36:52'),
	(7,2,11,'操作日志','fa-history','auth/logs',NULL,NULL,'2019-08-21 16:36:52'),
	(9,0,1,'员工管理','fa-bars','users',NULL,'2019-08-21 15:32:49','2019-08-21 15:33:19'),
	(10,0,2,'大客户管理','fa-bars','my/users',NULL,'2019-08-21 16:19:06','2019-08-21 16:19:14'),
	(11,0,4,'来源管理','fa-bars','customer-sources',NULL,'2019-08-21 16:36:34','2019-08-21 16:39:54'),
	(12,0,3,'行业管理','fa-bars','customer-industries',NULL,'2019-08-21 16:36:45','2019-08-21 16:39:45');

/*!40000 ALTER TABLE `admin_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_operation_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_operation_log`;

CREATE TABLE `admin_operation_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_operation_log_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_operation_log` WRITE;
/*!40000 ALTER TABLE `admin_operation_log` DISABLE KEYS */;

INSERT INTO `admin_operation_log` (`id`, `user_id`, `path`, `method`, `ip`, `input`, `created_at`, `updated_at`)
VALUES
	(1,1,'admin','GET','127.0.0.1','[]','2019-08-21 14:55:10','2019-08-21 14:55:10'),
	(2,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 14:58:42','2019-08-21 14:58:42'),
	(3,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 14:58:49','2019-08-21 14:58:49'),
	(4,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 14:58:50','2019-08-21 14:58:50'),
	(5,1,'admin/auth/menu/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 14:58:53','2019-08-21 14:58:53'),
	(6,1,'admin/auth/menu/1','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u4eea\\u8868\\u76d8\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 14:59:00','2019-08-21 14:59:00'),
	(7,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 14:59:00','2019-08-21 14:59:00'),
	(8,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 14:59:02','2019-08-21 14:59:02'),
	(9,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":null,\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 15:00:46','2019-08-21 15:00:46'),
	(10,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:00:46','2019-08-21 15:00:46'),
	(11,1,'admin/auth/menu/8','DELETE','127.0.0.1','{\"_method\":\"delete\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 15:00:49','2019-08-21 15:00:49'),
	(12,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:00:49','2019-08-21 15:00:49'),
	(13,1,'admin/auth/menu/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:00:51','2019-08-21 15:00:51'),
	(14,1,'admin/auth/menu/2','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:01:00','2019-08-21 15:01:00'),
	(15,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:01:00','2019-08-21 15:01:00'),
	(16,1,'admin/auth/menu/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:01:04','2019-08-21 15:01:04'),
	(17,1,'admin/auth/menu/3','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u5927\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:01:13','2019-08-21 15:01:13'),
	(18,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:01:13','2019-08-21 15:01:13'),
	(19,1,'admin/auth/menu/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:01:15','2019-08-21 15:01:15'),
	(20,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:01:19','2019-08-21 15:01:19'),
	(21,1,'admin/auth/menu/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:02:07','2019-08-21 15:02:07'),
	(22,1,'admin/auth/menu/4','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:02:11','2019-08-21 15:02:11'),
	(23,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:02:11','2019-08-21 15:02:11'),
	(24,1,'admin/auth/menu/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:02:13','2019-08-21 15:02:13'),
	(25,1,'admin/auth/menu/5','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:02:17','2019-08-21 15:02:17'),
	(26,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:02:17','2019-08-21 15:02:17'),
	(27,1,'admin/auth/menu/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:02:19','2019-08-21 15:02:19'),
	(28,1,'admin/auth/menu/6','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:02:22','2019-08-21 15:02:22'),
	(29,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:02:22','2019-08-21 15:02:22'),
	(30,1,'admin/auth/menu/7/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:02:25','2019-08-21 15:02:25'),
	(31,1,'admin/auth/menu/7','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 15:02:29','2019-08-21 15:02:29'),
	(32,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:02:29','2019-08-21 15:02:29'),
	(33,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:02:31','2019-08-21 15:02:31'),
	(34,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:03:19','2019-08-21 15:03:19'),
	(35,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:03:19','2019-08-21 15:03:19'),
	(36,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:03:22','2019-08-21 15:03:22'),
	(37,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:03:28','2019-08-21 15:03:28'),
	(38,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:25','2019-08-21 15:04:25'),
	(39,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:26','2019-08-21 15:04:26'),
	(40,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:27','2019-08-21 15:04:27'),
	(41,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:27','2019-08-21 15:04:27'),
	(42,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:28','2019-08-21 15:04:28'),
	(43,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:28','2019-08-21 15:04:28'),
	(44,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 15:04:28','2019-08-21 15:04:28'),
	(45,1,'admin/auth/users/1','PUT','127.0.0.1','{\"username\":\"admin\",\"name\":\"\\u7ba1\\u7406\\u5458\",\"password\":\"$2y$10$\\/dyQLm2HsW0EQxdERDpqtO.MyxHc4j.hLLkBx1UgO43t3.ysXDU\\/u\",\"password_confirmation\":\"$2y$10$\\/dyQLm2HsW0EQxdERDpqtO.MyxHc4j.hLLkBx1UgO43t3.ysXDU\\/u\",\"roles\":[\"1\",null],\"permissions\":[null],\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 15:04:43','2019-08-21 15:04:43'),
	(46,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:04:43','2019-08-21 15:04:43'),
	(47,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:04:46','2019-08-21 15:04:46'),
	(48,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:04:55','2019-08-21 15:04:55'),
	(49,1,'admin/auth/users','POST','127.0.0.1','{\"username\":\"big\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[null],\"permissions\":[null],\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 15:05:21','2019-08-21 15:05:21'),
	(50,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:05:21','2019-08-21 15:05:21'),
	(51,1,'admin/auth/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:05:30','2019-08-21 15:05:30'),
	(52,1,'admin/auth/users/2/edit','GET','127.0.0.1','[]','2019-08-21 15:06:38','2019-08-21 15:06:38'),
	(53,1,'admin/auth/users/2','PUT','127.0.0.1','{\"username\":\"big\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"password\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"password_confirmation\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"roles\":[null],\"permissions\":[null],\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 15:06:44','2019-08-21 15:06:44'),
	(54,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:06:44','2019-08-21 15:06:44'),
	(55,1,'admin/auth/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:06:47','2019-08-21 15:06:47'),
	(56,1,'admin/auth/users/2/edit','GET','127.0.0.1','[]','2019-08-21 15:07:13','2019-08-21 15:07:13'),
	(57,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:31:11','2019-08-21 15:31:11'),
	(58,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:32:20','2019-08-21 15:32:20'),
	(59,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"users\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 15:32:49','2019-08-21 15:32:49'),
	(60,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:32:49','2019-08-21 15:32:49'),
	(61,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 15:32:51','2019-08-21 15:32:51'),
	(62,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:32:52','2019-08-21 15:32:52'),
	(63,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:33:13','2019-08-21 15:33:13'),
	(64,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-21 15:33:19','2019-08-21 15:33:19'),
	(65,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:33:19','2019-08-21 15:33:19'),
	(66,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:33:22','2019-08-21 15:33:22'),
	(67,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:33:23','2019-08-21 15:33:23'),
	(68,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:33:24','2019-08-21 15:33:24'),
	(69,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:33:25','2019-08-21 15:33:25'),
	(70,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:35:21','2019-08-21 15:35:21'),
	(71,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:35:50','2019-08-21 15:35:50'),
	(72,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:03','2019-08-21 15:36:03'),
	(73,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:05','2019-08-21 15:36:05'),
	(74,1,'admin/users/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:07','2019-08-21 15:36:07'),
	(75,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:08','2019-08-21 15:36:08'),
	(76,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:13','2019-08-21 15:36:13'),
	(77,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:36:42','2019-08-21 15:36:42'),
	(78,1,'admin/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:44','2019-08-21 15:36:44'),
	(79,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:36:45','2019-08-21 15:36:45'),
	(80,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:37:02','2019-08-21 15:37:02'),
	(81,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:37:04','2019-08-21 15:37:04'),
	(82,1,'admin/users','POST','127.0.0.1','{\"mobile\":\"18777777777\",\"name\":\"ceshi\",\"password\":\"123456\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 15:37:24','2019-08-21 15:37:24'),
	(83,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:37:24','2019-08-21 15:37:24'),
	(84,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:37:27','2019-08-21 15:37:27'),
	(85,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 15:37:45','2019-08-21 15:37:45'),
	(86,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:37:46','2019-08-21 15:37:46'),
	(87,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:37:48','2019-08-21 15:37:48'),
	(88,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:37:49','2019-08-21 15:37:49'),
	(89,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:37:56','2019-08-21 15:37:56'),
	(90,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:38:16','2019-08-21 15:38:16'),
	(91,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:38:23','2019-08-21 15:38:23'),
	(92,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:38:40','2019-08-21 15:38:40'),
	(93,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(94,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(95,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(96,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(97,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(98,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(99,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(100,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(101,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(102,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(103,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(104,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(105,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(106,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(107,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(108,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(109,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:40','2019-08-21 15:50:40'),
	(110,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:41','2019-08-21 15:50:41'),
	(111,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:41','2019-08-21 15:50:41'),
	(112,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:41','2019-08-21 15:50:41'),
	(113,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:41','2019-08-21 15:50:41'),
	(114,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:50:41','2019-08-21 15:50:41'),
	(115,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:52:24','2019-08-21 15:52:24'),
	(116,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:52:36','2019-08-21 15:52:36'),
	(117,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:56:54','2019-08-21 15:56:54'),
	(118,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:57:30','2019-08-21 15:57:30'),
	(119,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:57:58','2019-08-21 15:57:58'),
	(120,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:58:14','2019-08-21 15:58:14'),
	(121,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 15:58:15','2019-08-21 15:58:15'),
	(122,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:58:15','2019-08-21 15:58:15'),
	(123,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 15:58:17','2019-08-21 15:58:17'),
	(124,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:02:08','2019-08-21 16:02:08'),
	(125,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:02:29','2019-08-21 16:02:29'),
	(126,1,'admin/auth/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:02:32','2019-08-21 16:02:32'),
	(127,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:02:32','2019-08-21 16:02:32'),
	(128,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:02:34','2019-08-21 16:02:34'),
	(129,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:03:32','2019-08-21 16:03:32'),
	(130,1,'admin/auth/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:03:34','2019-08-21 16:03:34'),
	(131,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:03:34','2019-08-21 16:03:34'),
	(132,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:03:57','2019-08-21 16:03:57'),
	(133,1,'admin/auth/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:03:59','2019-08-21 16:03:59'),
	(134,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:04:02','2019-08-21 16:04:02'),
	(135,1,'admin/auth/users/1','GET','127.0.0.1','[]','2019-08-21 16:04:02','2019-08-21 16:04:02'),
	(136,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:04:13','2019-08-21 16:04:13'),
	(137,1,'admin/auth/users/1','GET','127.0.0.1','[]','2019-08-21 16:04:13','2019-08-21 16:04:13'),
	(138,1,'admin/auth/users/1','GET','127.0.0.1','[]','2019-08-21 16:06:54','2019-08-21 16:06:54'),
	(139,1,'admin/auth/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:06:56','2019-08-21 16:06:56'),
	(140,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 16:07:23','2019-08-21 16:07:23'),
	(141,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 16:07:24','2019-08-21 16:07:24'),
	(142,1,'admin/auth/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:07:26','2019-08-21 16:07:26'),
	(143,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 16:07:26','2019-08-21 16:07:26'),
	(144,1,'admin/auth/users/1/edit','GET','127.0.0.1','[]','2019-08-21 16:07:31','2019-08-21 16:07:31'),
	(145,1,'admin/auth/users/1','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:07:33','2019-08-21 16:07:33'),
	(146,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:07:38','2019-08-21 16:07:38'),
	(147,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:07:41','2019-08-21 16:07:41'),
	(148,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:07:41','2019-08-21 16:07:41'),
	(149,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:08:18','2019-08-21 16:08:18'),
	(150,1,'admin/auth/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:08:19','2019-08-21 16:08:19'),
	(151,1,'admin/auth/users/create','GET','127.0.0.1','[]','2019-08-21 16:08:24','2019-08-21 16:08:24'),
	(152,1,'admin/auth/users/create','GET','127.0.0.1','[]','2019-08-21 16:08:41','2019-08-21 16:08:41'),
	(153,1,'admin/auth/users','POST','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"company\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"can_create\":\"10\",\"contact\":\"\\u8054\\u7cfb\\u4eba\",\"contact_mobile\":\"18606520987\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[null],\"permissions\":[null],\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 16:09:37','2019-08-21 16:09:37'),
	(154,1,'admin/auth/users/create','GET','127.0.0.1','[]','2019-08-21 16:09:38','2019-08-21 16:09:38'),
	(155,1,'admin/auth/users','POST','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"company\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"can_create\":\"10\",\"contact\":\"\\u8054\\u7cfb\\u4eba\",\"contact_mobile\":\"18606520987\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[null],\"permissions\":[null],\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:10:13','2019-08-21 16:10:13'),
	(156,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 16:10:13','2019-08-21 16:10:13'),
	(157,1,'admin/auth/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:10:31','2019-08-21 16:10:31'),
	(158,1,'admin/auth/users/3/edit','GET','127.0.0.1','[]','2019-08-21 16:10:57','2019-08-21 16:10:57'),
	(159,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:11:01','2019-08-21 16:11:01'),
	(160,1,'admin/auth/users/3','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:11:03','2019-08-21 16:11:03'),
	(161,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:11:05','2019-08-21 16:11:05'),
	(162,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:11:55','2019-08-21 16:11:55'),
	(163,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:17:30','2019-08-21 16:17:30'),
	(164,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:18','2019-08-21 16:18:18'),
	(165,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:19','2019-08-21 16:18:19'),
	(166,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:20','2019-08-21 16:18:20'),
	(167,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:20','2019-08-21 16:18:20'),
	(168,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:20','2019-08-21 16:18:20'),
	(169,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:20','2019-08-21 16:18:20'),
	(170,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:20','2019-08-21 16:18:20'),
	(171,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:21','2019-08-21 16:18:21'),
	(172,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:21','2019-08-21 16:18:21'),
	(173,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:21','2019-08-21 16:18:21'),
	(174,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(175,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(176,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(177,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(178,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(179,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:22','2019-08-21 16:18:22'),
	(180,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:23','2019-08-21 16:18:23'),
	(181,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:23','2019-08-21 16:18:23'),
	(182,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:24','2019-08-21 16:18:24'),
	(183,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:36','2019-08-21 16:18:36'),
	(184,1,'admin/auth/menu/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:38','2019-08-21 16:18:38'),
	(185,1,'admin/auth/menu/3','PUT','127.0.0.1','{\"parent_id\":\"2\",\"title\":\"\\u7ba1\\u7406\\u5458\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 16:18:46','2019-08-21 16:18:46'),
	(186,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:18:46','2019-08-21 16:18:46'),
	(187,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:18:48','2019-08-21 16:18:48'),
	(188,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:49','2019-08-21 16:18:49'),
	(189,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:18:56','2019-08-21 16:18:56'),
	(190,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5927\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"my\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:19:06','2019-08-21 16:19:06'),
	(191,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:19:06','2019-08-21 16:19:06'),
	(192,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:19:08','2019-08-21 16:19:08'),
	(193,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-21 16:19:14','2019-08-21 16:19:14'),
	(194,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:19:14','2019-08-21 16:19:14'),
	(195,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:19:15','2019-08-21 16:19:15'),
	(196,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:19:15','2019-08-21 16:19:15'),
	(197,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:13','2019-08-21 16:20:13'),
	(198,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:14','2019-08-21 16:20:14'),
	(199,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:15','2019-08-21 16:20:15'),
	(200,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:15','2019-08-21 16:20:15'),
	(201,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:15','2019-08-21 16:20:15'),
	(202,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:16','2019-08-21 16:20:16'),
	(203,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:16','2019-08-21 16:20:16'),
	(204,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:16','2019-08-21 16:20:16'),
	(205,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:17','2019-08-21 16:20:17'),
	(206,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:17','2019-08-21 16:20:17'),
	(207,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:17','2019-08-21 16:20:17'),
	(208,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:31','2019-08-21 16:20:31'),
	(209,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:37','2019-08-21 16:20:37'),
	(210,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:57','2019-08-21 16:20:57'),
	(211,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:57','2019-08-21 16:20:57'),
	(212,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(213,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(214,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(215,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(216,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(217,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:58','2019-08-21 16:20:58'),
	(218,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(219,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(220,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(221,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(222,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(223,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:20:59','2019-08-21 16:20:59'),
	(224,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:21:00','2019-08-21 16:21:00'),
	(225,1,'admin/my/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:21:15','2019-08-21 16:21:15'),
	(226,1,'admin/my/users/2','PUT','127.0.0.1','{\"username\":\"big\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"company\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"can_create\":\"3\",\"contact\":\"\\u8054\\u7cfb\\u4eba\",\"contact_mobile\":\"12312312312\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"password_confirmation\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/my\\/users\"}','2019-08-21 16:21:32','2019-08-21 16:21:32'),
	(227,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:21:32','2019-08-21 16:21:32'),
	(228,3,'admin','GET','127.0.0.1','[]','2019-08-21 16:22:05','2019-08-21 16:22:05'),
	(229,3,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:07','2019-08-21 16:22:07'),
	(230,3,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:08','2019-08-21 16:22:08'),
	(231,3,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:08','2019-08-21 16:22:08'),
	(232,1,'admin/my/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:15','2019-08-21 16:22:15'),
	(233,1,'admin/my/users/3','PUT','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"company\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"can_create\":\"10\",\"contact\":\"\\u8054\\u7cfb\\u4eba\",\"contact_mobile\":\"18606520987\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"222222\",\"password_confirmation\":\"222222\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/my\\/users\"}','2019-08-21 16:22:22','2019-08-21 16:22:22'),
	(234,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:22:22','2019-08-21 16:22:22'),
	(235,3,'admin','GET','127.0.0.1','[]','2019-08-21 16:22:27','2019-08-21 16:22:27'),
	(236,3,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:31','2019-08-21 16:22:31'),
	(237,3,'admin','GET','127.0.0.1','[]','2019-08-21 16:22:40','2019-08-21 16:22:40'),
	(238,1,'admin/my/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:46','2019-08-21 16:22:46'),
	(239,1,'admin/my/users/3','PUT','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792222\",\"company\":\"\\u516c\\u53f8\\u540d\\u79f0\",\"can_create\":\"10\",\"contact\":\"\\u8054\\u7cfb\\u4eba\",\"contact_mobile\":\"18606520987\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"$2y$10$6V1zykJ2i1s4FucCN8Sne.8Xt2Kyze9PnGinSjvONMFKWl7rAiVBq\",\"password_confirmation\":\"$2y$10$6V1zykJ2i1s4FucCN8Sne.8Xt2Kyze9PnGinSjvONMFKWl7rAiVBq\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/my\\/users\"}','2019-08-21 16:22:49','2019-08-21 16:22:49'),
	(240,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:22:49','2019-08-21 16:22:49'),
	(241,3,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:51','2019-08-21 16:22:51'),
	(242,3,'admin','GET','127.0.0.1','[]','2019-08-21 16:22:54','2019-08-21 16:22:54'),
	(243,3,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:22:59','2019-08-21 16:22:59'),
	(244,3,'admin','GET','127.0.0.1','[]','2019-08-21 16:23:12','2019-08-21 16:23:12'),
	(245,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:23:22','2019-08-21 16:23:22'),
	(246,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:17','2019-08-21 16:36:17'),
	(247,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u6765\\u6e90\",\"icon\":\"fa-bars\",\"uri\":\"customer-sources\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:36:34','2019-08-21 16:36:34'),
	(248,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:36:34','2019-08-21 16:36:34'),
	(249,1,'admin/auth/menu','POST','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5ba2\\u6237\\u884c\\u4e1a\",\"icon\":\"fa-bars\",\"uri\":\"customer-industries\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:36:45','2019-08-21 16:36:45'),
	(250,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:36:45','2019-08-21 16:36:45'),
	(251,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":1},{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-21 16:36:52','2019-08-21 16:36:52'),
	(252,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:52','2019-08-21 16:36:52'),
	(253,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:36:54','2019-08-21 16:36:54'),
	(254,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:55','2019-08-21 16:36:55'),
	(255,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:56','2019-08-21 16:36:56'),
	(256,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:56','2019-08-21 16:36:56'),
	(257,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:36:57','2019-08-21 16:36:57'),
	(258,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:37:00','2019-08-21 16:37:00'),
	(259,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:37:22','2019-08-21 16:37:22'),
	(260,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:37:28','2019-08-21 16:37:28'),
	(261,1,'admin/my/users/create','GET','127.0.0.1','[]','2019-08-21 16:37:55','2019-08-21 16:37:55'),
	(262,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:37:57','2019-08-21 16:37:57'),
	(263,1,'admin/my/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:37:59','2019-08-21 16:37:59'),
	(264,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:02','2019-08-21 16:38:02'),
	(265,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:05','2019-08-21 16:38:05'),
	(266,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:06','2019-08-21 16:38:06'),
	(267,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:38:36','2019-08-21 16:38:36'),
	(268,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:41','2019-08-21 16:38:41'),
	(269,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:43','2019-08-21 16:38:43'),
	(270,1,'admin/users/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:45','2019-08-21 16:38:45'),
	(271,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:38:47','2019-08-21 16:38:47'),
	(272,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:08','2019-08-21 16:39:08'),
	(273,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:08','2019-08-21 16:39:08'),
	(274,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:09','2019-08-21 16:39:09'),
	(275,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:10','2019-08-21 16:39:10'),
	(276,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:11','2019-08-21 16:39:11'),
	(277,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:12','2019-08-21 16:39:12'),
	(278,1,'admin/auth/menu','POST','127.0.0.1','{\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_order\":\"[{\\\"id\\\":9},{\\\"id\\\":10},{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":1},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}','2019-08-21 16:39:17','2019-08-21 16:39:17'),
	(279,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:17','2019-08-21 16:39:17'),
	(280,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:39:19','2019-08-21 16:39:19'),
	(281,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:19','2019-08-21 16:39:19'),
	(282,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:20','2019-08-21 16:39:20'),
	(283,1,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-21 16:39:33','2019-08-21 16:39:33'),
	(284,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:35','2019-08-21 16:39:35'),
	(285,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:37','2019-08-21 16:39:37'),
	(286,1,'admin/auth/menu/12/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:40','2019-08-21 16:39:40'),
	(287,1,'admin/auth/menu/12','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u884c\\u4e1a\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-industries\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 16:39:45','2019-08-21 16:39:45'),
	(288,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:39:45','2019-08-21 16:39:45'),
	(289,1,'admin/auth/menu/11/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:49','2019-08-21 16:39:49'),
	(290,1,'admin/auth/menu/11','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u6765\\u6e90\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"customer-sources\",\"roles\":[null],\"permission\":null,\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-21 16:39:54','2019-08-21 16:39:54'),
	(291,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:39:54','2019-08-21 16:39:54'),
	(292,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-21 16:39:56','2019-08-21 16:39:56'),
	(293,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:39:57','2019-08-21 16:39:57'),
	(294,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:40:05','2019-08-21 16:40:05'),
	(295,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:40:26','2019-08-21 16:40:26'),
	(296,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:40:48','2019-08-21 16:40:48'),
	(297,1,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:40:49','2019-08-21 16:40:49'),
	(298,1,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"\\u4e2d\\u4ecb\",\"is_show\":\"off\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-21 16:40:56','2019-08-21 16:40:56'),
	(299,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:40:56','2019-08-21 16:40:56'),
	(300,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:09','2019-08-21 16:41:09'),
	(301,1,'admin/customer-sources/1','PUT','127.0.0.1','{\"is_show\":\"on\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 16:41:10','2019-08-21 16:41:10'),
	(302,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:12','2019-08-21 16:41:12'),
	(303,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:13','2019-08-21 16:41:13'),
	(304,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:13','2019-08-21 16:41:13'),
	(305,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:14','2019-08-21 16:41:14'),
	(306,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:14','2019-08-21 16:41:14'),
	(307,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:14','2019-08-21 16:41:14'),
	(308,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:41:14','2019-08-21 16:41:14'),
	(309,1,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:42:31','2019-08-21 16:42:31'),
	(310,1,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"123123\",\"is_show\":\"on\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-21 16:42:34','2019-08-21 16:42:34'),
	(311,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 16:42:34','2019-08-21 16:42:34'),
	(312,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"2\",\"_model\":\"App_CustomerSource\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2019-08-21 16:42:39','2019-08-21 16:42:39'),
	(313,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:42:39','2019-08-21 16:42:39'),
	(314,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:42:54','2019-08-21 16:42:54'),
	(315,1,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-21 16:43:26','2019-08-21 16:43:26'),
	(316,1,'admin/customer-industries/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:28','2019-08-21 16:43:28'),
	(317,1,'admin/customer-industries','POST','127.0.0.1','{\"name\":\"123123\",\"is_show\":\"on\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-industries\"}','2019-08-21 16:43:30','2019-08-21 16:43:30'),
	(318,1,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-21 16:43:30','2019-08-21 16:43:30'),
	(319,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:32','2019-08-21 16:43:32'),
	(320,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:32','2019-08-21 16:43:32'),
	(321,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:33','2019-08-21 16:43:33'),
	(322,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:34','2019-08-21 16:43:34'),
	(323,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:37','2019-08-21 16:43:37'),
	(324,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:39','2019-08-21 16:43:39'),
	(325,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:39','2019-08-21 16:43:39'),
	(326,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:40','2019-08-21 16:43:40'),
	(327,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:40','2019-08-21 16:43:40'),
	(328,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:41','2019-08-21 16:43:41'),
	(329,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:41','2019-08-21 16:43:41'),
	(330,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:43','2019-08-21 16:43:43'),
	(331,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:43:45','2019-08-21 16:43:45'),
	(332,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:44:26','2019-08-21 16:44:26'),
	(333,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:44:27','2019-08-21 16:44:27'),
	(334,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:44:28','2019-08-21 16:44:28'),
	(335,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 16:44:42','2019-08-21 16:44:42'),
	(336,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 16:44:58','2019-08-21 16:44:58'),
	(337,1,'admin/users','POST','127.0.0.1','{\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:45:11','2019-08-21 16:45:11'),
	(338,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:45:11','2019-08-21 16:45:11'),
	(339,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:50','2019-08-21 16:46:50'),
	(340,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:51','2019-08-21 16:46:51'),
	(341,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:51','2019-08-21 16:46:51'),
	(342,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:51','2019-08-21 16:46:51'),
	(343,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(344,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(345,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(346,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(347,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(348,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:52','2019-08-21 16:46:52'),
	(349,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(350,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(351,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(352,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(353,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(354,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:46:53','2019-08-21 16:46:53'),
	(355,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:01','2019-08-21 16:47:01'),
	(356,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:04','2019-08-21 16:47:04'),
	(357,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:04','2019-08-21 16:47:04'),
	(358,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:05','2019-08-21 16:47:05'),
	(359,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:05','2019-08-21 16:47:05'),
	(360,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:06','2019-08-21 16:47:06'),
	(361,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:07','2019-08-21 16:47:07'),
	(362,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:50','2019-08-21 16:47:50'),
	(363,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:51','2019-08-21 16:47:51'),
	(364,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:51','2019-08-21 16:47:51'),
	(365,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:52','2019-08-21 16:47:52'),
	(366,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:52','2019-08-21 16:47:52'),
	(367,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:53','2019-08-21 16:47:53'),
	(368,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:54','2019-08-21 16:47:54'),
	(369,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:56','2019-08-21 16:47:56'),
	(370,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:47:56','2019-08-21 16:47:56'),
	(371,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:48:01','2019-08-21 16:48:01'),
	(372,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:48:13','2019-08-21 16:48:13'),
	(373,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:48:21','2019-08-21 16:48:21'),
	(374,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:48:27','2019-08-21 16:48:27'),
	(375,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:51:06','2019-08-21 16:51:06'),
	(376,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:51:14','2019-08-21 16:51:14'),
	(377,3,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:51:20','2019-08-21 16:51:20'),
	(378,3,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:51:21','2019-08-21 16:51:21'),
	(379,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:51:58','2019-08-21 16:51:58'),
	(380,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:51:59','2019-08-21 16:51:59'),
	(381,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:11','2019-08-21 16:52:11'),
	(382,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:12','2019-08-21 16:52:12'),
	(383,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:12','2019-08-21 16:52:12'),
	(384,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:13','2019-08-21 16:52:13'),
	(385,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:13','2019-08-21 16:52:13'),
	(386,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:24','2019-08-21 16:52:24'),
	(387,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:24','2019-08-21 16:52:24'),
	(388,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:28','2019-08-21 16:52:28'),
	(389,1,'admin/my/users','POST','127.0.0.1','{\"username\":\"1\",\"name\":\"1\",\"company\":\"1\",\"can_create\":\"10\",\"contact\":\"1\",\"contact_mobile\":\"1\",\"company_address\":\"1\",\"password\":\"1\",\"password_confirmation\":\"1\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/my\\/users\"}','2019-08-21 16:52:36','2019-08-21 16:52:36'),
	(390,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 16:52:36','2019-08-21 16:52:36'),
	(391,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:53','2019-08-21 16:52:53'),
	(392,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:52:54','2019-08-21 16:52:54'),
	(393,1,'admin/users','POST','127.0.0.1','{\"mobile\":\"18609876543\",\"name\":\"123\",\"password\":\"123\",\"password_confirmation\":\"123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 16:53:04','2019-08-21 16:53:04'),
	(394,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 16:53:04','2019-08-21 16:53:04'),
	(395,1,'admin/users','POST','127.0.0.1','{\"mobile\":\"18609876543\",\"name\":\"123\",\"password\":\"123\",\"password_confirmation\":\"123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:54:48','2019-08-21 16:54:48'),
	(396,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 16:54:48','2019-08-21 16:54:48'),
	(397,1,'admin/users','POST','127.0.0.1','{\"mobile\":\"18609876543\",\"name\":\"123\",\"password\":\"123\",\"password_confirmation\":\"123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 16:56:37','2019-08-21 16:56:37'),
	(398,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:56:37','2019-08-21 16:56:37'),
	(399,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:56:53','2019-08-21 16:56:53'),
	(400,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:56:54','2019-08-21 16:56:54'),
	(401,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:56:54','2019-08-21 16:56:54'),
	(402,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:56:54','2019-08-21 16:56:54'),
	(403,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:56:56','2019-08-21 16:56:56'),
	(404,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:57:43','2019-08-21 16:57:43'),
	(405,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:57:44','2019-08-21 16:57:44'),
	(406,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:57:44','2019-08-21 16:57:44'),
	(407,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 16:57:44','2019-08-21 16:57:44'),
	(408,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 16:58:22','2019-08-21 16:58:22'),
	(409,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:00:26','2019-08-21 17:00:26'),
	(410,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:01:55','2019-08-21 17:01:55'),
	(411,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:02:26','2019-08-21 17:02:26'),
	(412,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:02:49','2019-08-21 17:02:49'),
	(413,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:02:57','2019-08-21 17:02:57'),
	(414,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:03:09','2019-08-21 17:03:09'),
	(415,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:03:56','2019-08-21 17:03:56'),
	(416,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:04:57','2019-08-21 17:04:57'),
	(417,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:05:07','2019-08-21 17:05:07'),
	(418,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:05:17','2019-08-21 17:05:17'),
	(419,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:05:42','2019-08-21 17:05:42'),
	(420,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:05:58','2019-08-21 17:05:58'),
	(421,1,'admin/users/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:08:25','2019-08-21 17:08:25'),
	(422,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:08:29','2019-08-21 17:08:29'),
	(423,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:09:54','2019-08-21 17:09:54'),
	(424,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:09:57','2019-08-21 17:09:57'),
	(425,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:09:58','2019-08-21 17:09:58'),
	(426,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:10:00','2019-08-21 17:10:00'),
	(427,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:18:18','2019-08-21 17:18:18'),
	(428,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:18:19','2019-08-21 17:18:19'),
	(429,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:18:20','2019-08-21 17:18:20'),
	(430,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:18:31','2019-08-21 17:18:31'),
	(431,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:18:31','2019-08-21 17:18:31'),
	(432,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:21','2019-08-21 17:19:21'),
	(433,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:22','2019-08-21 17:19:22'),
	(434,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:23','2019-08-21 17:19:23'),
	(435,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:24','2019-08-21 17:19:24'),
	(436,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:36','2019-08-21 17:19:36'),
	(437,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:19:37','2019-08-21 17:19:37'),
	(438,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:20:48','2019-08-21 17:20:48'),
	(439,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:20:49','2019-08-21 17:20:49'),
	(440,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:20:51','2019-08-21 17:20:51'),
	(441,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:20:56','2019-08-21 17:20:56'),
	(442,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:21:45','2019-08-21 17:21:45'),
	(443,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"1231231\",\"password\":\"123123123\",\"password_confirmation\":\"123123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:21:55','2019-08-21 17:21:55'),
	(444,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:22:09','2019-08-21 17:22:09'),
	(445,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:22:12','2019-08-21 17:22:12'),
	(446,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:22:22','2019-08-21 17:22:22'),
	(447,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:23:18','2019-08-21 17:23:18'),
	(448,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:23:19','2019-08-21 17:23:19'),
	(449,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123123\",\"password_confirmation\":\"123123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:23:26','2019-08-21 17:23:26'),
	(450,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:24:54','2019-08-21 17:24:54'),
	(451,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:24:55','2019-08-21 17:24:55'),
	(452,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:25:02','2019-08-21 17:25:02'),
	(453,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:25:02','2019-08-21 17:25:02'),
	(454,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:25:21','2019-08-21 17:25:21'),
	(455,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:25:21','2019-08-21 17:25:21'),
	(456,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:25:53','2019-08-21 17:25:53'),
	(457,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:26:00','2019-08-21 17:26:00'),
	(458,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:26:00','2019-08-21 17:26:00'),
	(459,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:26:03','2019-08-21 17:26:03'),
	(460,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:26:10','2019-08-21 17:26:10'),
	(461,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:26:11','2019-08-21 17:26:11'),
	(462,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:26:28','2019-08-21 17:26:28'),
	(463,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:26:28','2019-08-21 17:26:28'),
	(464,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:26:49','2019-08-21 17:26:49'),
	(465,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:26:49','2019-08-21 17:26:49'),
	(466,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:27:02','2019-08-21 17:27:02'),
	(467,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:27:02','2019-08-21 17:27:02'),
	(468,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:27:15','2019-08-21 17:27:15'),
	(469,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:27:15','2019-08-21 17:27:15'),
	(470,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:27:48','2019-08-21 17:27:48'),
	(471,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:27:48','2019-08-21 17:27:48'),
	(472,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:27:54','2019-08-21 17:27:54'),
	(473,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:27:54','2019-08-21 17:27:54'),
	(474,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:28:21','2019-08-21 17:28:21'),
	(475,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:28:21','2019-08-21 17:28:21'),
	(476,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:28:29','2019-08-21 17:28:29'),
	(477,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:28:29','2019-08-21 17:28:29'),
	(478,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888887\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:28:35','2019-08-21 17:28:35'),
	(479,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:28:35','2019-08-21 17:28:35'),
	(480,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:28:36','2019-08-21 17:28:36'),
	(481,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888886\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:28:43','2019-08-21 17:28:43'),
	(482,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:28:43','2019-08-21 17:28:43'),
	(483,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:28:46','2019-08-21 17:28:46'),
	(484,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:28:50','2019-08-21 17:28:50'),
	(485,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:28:55','2019-08-21 17:28:55'),
	(486,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:28:56','2019-08-21 17:28:56'),
	(487,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:29:37','2019-08-21 17:29:37'),
	(488,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:29:45','2019-08-21 17:29:45'),
	(489,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:30:08','2019-08-21 17:30:08'),
	(490,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:30:46','2019-08-21 17:30:46'),
	(491,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:30:55','2019-08-21 17:30:55'),
	(492,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:31:21','2019-08-21 17:31:21'),
	(493,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 17:32:02','2019-08-21 17:32:02'),
	(494,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:07','2019-08-21 17:32:07'),
	(495,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:10','2019-08-21 17:32:10'),
	(496,1,'admin/my/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:12','2019-08-21 17:32:12'),
	(497,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:14','2019-08-21 17:32:14'),
	(498,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:15','2019-08-21 17:32:15'),
	(499,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:16','2019-08-21 17:32:16'),
	(500,1,'admin/my/users/2','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:32:18','2019-08-21 17:32:18'),
	(501,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:32:41','2019-08-21 17:32:41'),
	(502,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:33:02','2019-08-21 17:33:02'),
	(503,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:33:03','2019-08-21 17:33:03'),
	(504,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:33:03','2019-08-21 17:33:03'),
	(505,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:33:43','2019-08-21 17:33:43'),
	(506,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:37:11','2019-08-21 17:37:11'),
	(507,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:37:19','2019-08-21 17:37:19'),
	(508,1,'admin/my/users/2','GET','127.0.0.1','[]','2019-08-21 17:37:32','2019-08-21 17:37:32'),
	(509,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:37:33','2019-08-21 17:37:33'),
	(510,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:37:34','2019-08-21 17:37:34'),
	(511,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:37:37','2019-08-21 17:37:37'),
	(512,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:37:45','2019-08-21 17:37:45'),
	(513,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:37:48','2019-08-21 17:37:48'),
	(514,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:40:15','2019-08-21 17:40:15'),
	(515,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 17:40:30','2019-08-21 17:40:30'),
	(516,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:40:30','2019-08-21 17:40:30'),
	(517,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 17:41:59','2019-08-21 17:41:59'),
	(518,1,'admin/users/6','GET','127.0.0.1','[]','2019-08-21 17:43:38','2019-08-21 17:43:38'),
	(519,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:43:41','2019-08-21 17:43:41'),
	(520,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:45:14','2019-08-21 17:45:14'),
	(521,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:45:20','2019-08-21 17:45:20'),
	(522,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:45:27','2019-08-21 17:45:27'),
	(523,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:45:47','2019-08-21 17:45:47'),
	(524,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:47:35','2019-08-21 17:47:35'),
	(525,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:47:44','2019-08-21 17:47:44'),
	(526,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 17:47:47','2019-08-21 17:47:47'),
	(527,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:47:47','2019-08-21 17:47:47'),
	(528,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\"}','2019-08-21 17:49:42','2019-08-21 17:49:42'),
	(529,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:49:48','2019-08-21 17:49:48'),
	(530,1,'admin/users/6/edit','GET','127.0.0.1','[]','2019-08-21 17:49:51','2019-08-21 17:49:51'),
	(531,1,'admin/users/6','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:49:52','2019-08-21 17:49:52'),
	(532,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:49:54','2019-08-21 17:49:54'),
	(533,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:49:55','2019-08-21 17:49:55'),
	(534,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"16666666666\",\"name\":\"6666\",\"password\":\"6666\",\"password_confirmation\":\"6666\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:50:05','2019-08-21 17:50:05'),
	(535,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:50:20','2019-08-21 17:50:20'),
	(536,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:50:21','2019-08-21 17:50:21'),
	(537,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888888\",\"name\":\"1231\",\"password\":\"1231\",\"password_confirmation\":\"1231\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:50:29','2019-08-21 17:50:29'),
	(538,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:50:29','2019-08-21 17:50:29'),
	(539,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18888888844\",\"name\":\"1231\",\"password\":\"1231\",\"password_confirmation\":\"1231\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\"}','2019-08-21 17:50:33','2019-08-21 17:50:33'),
	(540,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:50:36','2019-08-21 17:50:36'),
	(541,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:50:38','2019-08-21 17:50:38'),
	(542,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:50:40','2019-08-21 17:50:40'),
	(543,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:50:41','2019-08-21 17:50:41'),
	(544,1,'admin/users/6','GET','127.0.0.1','[]','2019-08-21 17:51:06','2019-08-21 17:51:06'),
	(545,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:07','2019-08-21 17:51:07'),
	(546,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\\/6\"}','2019-08-21 17:51:09','2019-08-21 17:51:09'),
	(547,1,'admin/users/6','GET','127.0.0.1','[]','2019-08-21 17:51:09','2019-08-21 17:51:09'),
	(548,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:11','2019-08-21 17:51:11'),
	(549,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:13','2019-08-21 17:51:13'),
	(550,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:15','2019-08-21 17:51:15'),
	(551,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:17','2019-08-21 17:51:17'),
	(552,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u57921\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:51:20','2019-08-21 17:51:20'),
	(553,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:51:20','2019-08-21 17:51:20'),
	(554,1,'admin/users/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:23','2019-08-21 17:51:23'),
	(555,1,'admin/users/6','PUT','127.0.0.1','{\"admin_user_id\":\"1\",\"mobile\":\"18606520987\",\"name\":\"\\u91d1\\u4f73\\u5792\",\"password\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"password_confirmation\":\"$2y$10$jhzWqaDGjwsA\\/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:51:26','2019-08-21 17:51:26'),
	(556,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 17:51:26','2019-08-21 17:51:26'),
	(557,1,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:27','2019-08-21 17:51:27'),
	(558,1,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"14234234234\",\"name\":\"123123\",\"password\":\"123123\",\"password_confirmation\":\"123123\",\"_token\":\"lSgkjrGwZegRueqXvB6W6Vm902Uw5DtwvVIwSF7l\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-21 17:51:33','2019-08-21 17:51:33'),
	(559,1,'admin/users/create','GET','127.0.0.1','[]','2019-08-21 17:51:33','2019-08-21 17:51:33'),
	(560,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:42','2019-08-21 17:51:42'),
	(561,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:43','2019-08-21 17:51:43'),
	(562,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:44','2019-08-21 17:51:44'),
	(563,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:54','2019-08-21 17:51:54'),
	(564,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:54','2019-08-21 17:51:54'),
	(565,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:55','2019-08-21 17:51:55'),
	(566,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:55','2019-08-21 17:51:55'),
	(567,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:56','2019-08-21 17:51:56'),
	(568,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:57','2019-08-21 17:51:57'),
	(569,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:57','2019-08-21 17:51:57'),
	(570,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:58','2019-08-21 17:51:58'),
	(571,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:58','2019-08-21 17:51:58'),
	(572,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:59','2019-08-21 17:51:59'),
	(573,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:51:59','2019-08-21 17:51:59'),
	(574,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:00','2019-08-21 17:52:00'),
	(575,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:00','2019-08-21 17:52:00'),
	(576,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:00','2019-08-21 17:52:00'),
	(577,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:01','2019-08-21 17:52:01'),
	(578,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:01','2019-08-21 17:52:01'),
	(579,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:01','2019-08-21 17:52:01'),
	(580,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:01','2019-08-21 17:52:01'),
	(581,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 17:52:02','2019-08-21 17:52:02'),
	(582,1,'admin','GET','127.0.0.1','[]','2019-08-21 19:38:06','2019-08-21 19:38:06'),
	(583,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:38:12','2019-08-21 19:38:12'),
	(584,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:38:15','2019-08-21 19:38:15'),
	(585,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:38:17','2019-08-21 19:38:17'),
	(586,1,'admin/users','GET','127.0.0.1','[]','2019-08-21 19:38:47','2019-08-21 19:38:47'),
	(587,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:20','2019-08-21 19:39:20'),
	(588,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:22','2019-08-21 19:39:22'),
	(589,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:24','2019-08-21 19:39:24'),
	(590,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:27','2019-08-21 19:39:27'),
	(591,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:28','2019-08-21 19:39:28'),
	(592,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:39:29','2019-08-21 19:39:29'),
	(593,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:15','2019-08-21 19:41:15'),
	(594,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:34','2019-08-21 19:41:34'),
	(595,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:36','2019-08-21 19:41:36'),
	(596,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:37','2019-08-21 19:41:37'),
	(597,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:38','2019-08-21 19:41:38'),
	(598,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:38','2019-08-21 19:41:38'),
	(599,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:38','2019-08-21 19:41:38'),
	(600,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:39','2019-08-21 19:41:39'),
	(601,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:39','2019-08-21 19:41:39'),
	(602,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:51','2019-08-21 19:41:51'),
	(603,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:41:53','2019-08-21 19:41:53'),
	(604,1,'admin/auth/permissions','POST','127.0.0.1','{\"slug\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"name\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"users\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:42:39','2019-08-21 19:42:39'),
	(605,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:42:39','2019-08-21 19:42:39'),
	(606,1,'admin/auth/permissions/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:42:57','2019-08-21 19:42:57'),
	(607,1,'admin/auth/permissions/6','PUT','127.0.0.1','{\"slug\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"name\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:43:06','2019-08-21 19:43:06'),
	(608,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:43:06','2019-08-21 19:43:06'),
	(609,1,'admin/auth/permissions/6/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:14','2019-08-21 19:43:14'),
	(610,1,'admin/auth/permissions/6','PUT','127.0.0.1','{\"slug\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"name\":\"\\u5458\\u5de5\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/users*\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:43:21','2019-08-21 19:43:21'),
	(611,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:43:21','2019-08-21 19:43:21'),
	(612,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:26','2019-08-21 19:43:26'),
	(613,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:28','2019-08-21 19:43:28'),
	(614,1,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:29','2019-08-21 19:43:29'),
	(615,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:31','2019-08-21 19:43:31'),
	(616,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:33','2019-08-21 19:43:33'),
	(617,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:43:35','2019-08-21 19:43:35'),
	(618,1,'admin/auth/permissions','POST','127.0.0.1','{\"slug\":\"\\u5927\\u5ba2\\u6237\\u7ba1\\u7406\",\"name\":\"\\u5927\\u5ba2\\u6237\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/my\\/users*\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:43:57','2019-08-21 19:43:57'),
	(619,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:43:57','2019-08-21 19:43:57'),
	(620,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:44:05','2019-08-21 19:44:05'),
	(621,1,'admin/auth/permissions','POST','127.0.0.1','{\"slug\":\"\\u884c\\u4e1a\\u7ba1\\u7406\",\"name\":\"\\u884c\\u4e1a\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/customer-sources*\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:44:21','2019-08-21 19:44:21'),
	(622,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:44:21','2019-08-21 19:44:21'),
	(623,1,'admin/auth/permissions/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:44:23','2019-08-21 19:44:23'),
	(624,1,'admin/auth/permissions','POST','127.0.0.1','{\"slug\":\"\\u6765\\u6e90\\u7ba1\\u7406\",\"name\":\"\\u6765\\u6e90\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/customer-industries*\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:44:38','2019-08-21 19:44:38'),
	(625,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:44:38','2019-08-21 19:44:38'),
	(626,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:00','2019-08-21 19:45:00'),
	(627,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:04','2019-08-21 19:45:04'),
	(628,1,'admin/auth/roles/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:08','2019-08-21 19:45:08'),
	(629,1,'admin/auth/roles/1','PUT','127.0.0.1','{\"slug\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"permissions\":[\"1\",null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/roles\"}','2019-08-21 19:45:20','2019-08-21 19:45:20'),
	(630,1,'admin/auth/roles','GET','127.0.0.1','[]','2019-08-21 19:45:20','2019-08-21 19:45:20'),
	(631,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:24','2019-08-21 19:45:24'),
	(632,1,'admin/auth/permissions/1/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:31','2019-08-21 19:45:31'),
	(633,1,'admin/auth/permissions/1','PUT','127.0.0.1','{\"slug\":\"*\",\"name\":\"\\u8d85\\u7ea7\\u7ba1\\u7406\\u5458\",\"http_method\":[null],\"http_path\":\"*\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:45:37','2019-08-21 19:45:37'),
	(634,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:45:37','2019-08-21 19:45:37'),
	(635,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:43','2019-08-21 19:45:43'),
	(636,1,'admin/auth/roles/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:52','2019-08-21 19:45:52'),
	(637,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:45:59','2019-08-21 19:45:59'),
	(638,1,'admin/auth/permissions/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:46:03','2019-08-21 19:46:03'),
	(639,1,'admin/auth/permissions/2','PUT','127.0.0.1','{\"slug\":\"\\u4eea\\u8868\\u76d8\",\"name\":\"\\u4eea\\u8868\\u76d8\",\"http_method\":[\"GET\",null],\"http_path\":\"\\/\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:46:13','2019-08-21 19:46:13'),
	(640,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:46:13','2019-08-21 19:46:13'),
	(641,1,'admin/auth/permissions/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:46:15','2019-08-21 19:46:15'),
	(642,1,'admin/auth/permissions/3','PUT','127.0.0.1','{\"slug\":\"\\u767b\\u5f55\",\"name\":\"\\u767b\\u5f55\",\"http_method\":[null],\"http_path\":\"\\/auth\\/login\\r\\n\\/auth\\/logout\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:46:26','2019-08-21 19:46:26'),
	(643,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:46:26','2019-08-21 19:46:26'),
	(644,1,'admin/auth/permissions/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:46:30','2019-08-21 19:46:30'),
	(645,1,'admin/auth/permissions/4','PUT','127.0.0.1','{\"slug\":\"\\u8bbe\\u7f6e\",\"name\":\"\\u8bbe\\u7f6e\",\"http_method\":[\"GET\",\"PUT\",null],\"http_path\":\"\\/auth\\/setting\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:46:39','2019-08-21 19:46:39'),
	(646,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:46:39','2019-08-21 19:46:39'),
	(647,1,'admin/auth/permissions/5/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:47:06','2019-08-21 19:47:06'),
	(648,1,'admin/auth/permissions/5','PUT','127.0.0.1','{\"slug\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"name\":\"\\u7cfb\\u7edf\\u7ba1\\u7406\",\"http_method\":[null],\"http_path\":\"\\/auth\\/roles\\r\\n\\/auth\\/permissions\\r\\n\\/auth\\/menu\\r\\n\\/auth\\/logs\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/permissions\"}','2019-08-21 19:47:12','2019-08-21 19:47:12'),
	(649,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-21 19:47:13','2019-08-21 19:47:13'),
	(650,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:47:16','2019-08-21 19:47:16'),
	(651,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:47:20','2019-08-21 19:47:20'),
	(652,1,'admin/auth/roles/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:47:21','2019-08-21 19:47:21'),
	(653,1,'admin/auth/roles','POST','127.0.0.1','{\"slug\":\"\\u5927\\u5ba2\\u6237\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",\"7\",\"8\",\"9\",null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/roles\"}','2019-08-21 19:48:16','2019-08-21 19:48:16'),
	(654,1,'admin/auth/roles','GET','127.0.0.1','[]','2019-08-21 19:48:16','2019-08-21 19:48:16'),
	(655,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:48:22','2019-08-21 19:48:22'),
	(656,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:48:30','2019-08-21 19:48:30'),
	(657,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:48:34','2019-08-21 19:48:34'),
	(658,1,'admin/auth/users/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:48:38','2019-08-21 19:48:38'),
	(659,1,'admin/auth/users/2','PUT','127.0.0.1','{\"username\":\"big\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"password\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"password_confirmation\":\"$2y$10$51XxImU0mP8WHuNUEHxnXOCdRrvik3TsN9shPUygLwTJO24uQhFfW\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 19:48:55','2019-08-21 19:48:55'),
	(660,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 19:48:55','2019-08-21 19:48:55'),
	(661,1,'admin/auth/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:49:06','2019-08-21 19:49:06'),
	(662,1,'admin/auth/users/3','PUT','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792222\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[null],\"permissions\":[null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 19:49:12','2019-08-21 19:49:12'),
	(663,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 19:49:12','2019-08-21 19:49:12'),
	(664,1,'admin/auth/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:49:17','2019-08-21 19:49:17'),
	(665,1,'admin/auth/users/3','PUT','127.0.0.1','{\"username\":\"jinjialei\",\"name\":\"\\u91d1\\u4f73\\u5792222\",\"password\":\"$2y$10$5XU.Qxg.aotQrUZfSZP1u.uj9N1XUmlBGXfDd76KhnDcXaECv0RLG\",\"password_confirmation\":\"$2y$10$5XU.Qxg.aotQrUZfSZP1u.uj9N1XUmlBGXfDd76KhnDcXaECv0RLG\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 19:49:24','2019-08-21 19:49:24'),
	(666,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 19:49:24','2019-08-21 19:49:24'),
	(667,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:49:45','2019-08-21 19:49:45'),
	(668,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:49:52','2019-08-21 19:49:52'),
	(669,1,'admin/auth/users/4/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:49:56','2019-08-21 19:49:56'),
	(670,1,'admin/auth/users/4','PUT','127.0.0.1','{\"username\":\"1\",\"name\":\"1\",\"password\":\"$2y$10$OhpHIUdq7CCNqGtDzJmXiuxSL8eZm3YT\\/Pf3OqztgMjQbQ64neN3e\",\"password_confirmation\":\"$2y$10$OhpHIUdq7CCNqGtDzJmXiuxSL8eZm3YT\\/Pf3OqztgMjQbQ64neN3e\",\"roles\":[\"2\",null],\"permissions\":[null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/users\"}','2019-08-21 19:50:00','2019-08-21 19:50:00'),
	(671,1,'admin/auth/users','GET','127.0.0.1','[]','2019-08-21 19:50:00','2019-08-21 19:50:00'),
	(672,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:07','2019-08-21 19:50:07'),
	(673,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:15','2019-08-21 19:50:15'),
	(674,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:17','2019-08-21 19:50:17'),
	(675,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:21','2019-08-21 19:50:21'),
	(676,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"2\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2019-08-21 19:50:31','2019-08-21 19:50:31'),
	(677,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:31','2019-08-21 19:50:31'),
	(678,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"4\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2019-08-21 19:50:35','2019-08-21 19:50:35'),
	(679,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:36','2019-08-21 19:50:36'),
	(680,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:38','2019-08-21 19:50:38'),
	(681,1,'admin/my/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:50:41','2019-08-21 19:50:41'),
	(682,1,'admin/my/users/3/edit','GET','127.0.0.1','[]','2019-08-21 19:51:16','2019-08-21 19:51:16'),
	(683,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:51:29','2019-08-21 19:51:29'),
	(684,1,'admin/my/users/3/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:51:40','2019-08-21 19:51:40'),
	(685,1,'admin/my/users/3/edit','GET','127.0.0.1','[]','2019-08-21 19:52:11','2019-08-21 19:52:11'),
	(686,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:52:50','2019-08-21 19:52:50'),
	(687,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:52:56','2019-08-21 19:52:56'),
	(688,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:54:21','2019-08-21 19:54:21'),
	(689,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:54:23','2019-08-21 19:54:23'),
	(690,1,'admin/my/users/create','GET','127.0.0.1','[]','2019-08-21 19:55:49','2019-08-21 19:55:49'),
	(691,1,'admin/my/users/create','GET','127.0.0.1','[]','2019-08-21 19:56:04','2019-08-21 19:56:04'),
	(692,1,'admin/my/users/create','GET','127.0.0.1','[]','2019-08-21 19:56:23','2019-08-21 19:56:23'),
	(693,1,'admin/my/users','POST','127.0.0.1','{\"username\":\"123\",\"name\":\"123\",\"company\":\"123\",\"can_create\":\"10\",\"contact\":\"123\",\"contact_mobile\":\"123\",\"company_address\":\"123\",\"password\":\"123\",\"password_confirmation\":\"123\",\"roles\":[\"2\",null],\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\"}','2019-08-21 19:56:49','2019-08-21 19:56:49'),
	(694,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-21 19:56:50','2019-08-21 19:56:50'),
	(695,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:56:54','2019-08-21 19:56:54'),
	(696,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:56:56','2019-08-21 19:56:56'),
	(697,1,'admin/_handle_action_','POST','127.0.0.1','{\"_key\":\"5\",\"_model\":\"Encore_Admin_Auth_Database_Administrator\",\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_action\":\"Encore_Admin_Grid_Actions_Delete\",\"_input\":\"true\"}','2019-08-21 19:57:00','2019-08-21 19:57:00'),
	(698,1,'admin/auth/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:57:00','2019-08-21 19:57:00'),
	(699,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:58:10','2019-08-21 19:58:10'),
	(700,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 19:58:12','2019-08-21 19:58:12'),
	(701,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 20:01:13','2019-08-21 20:01:13'),
	(702,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:14','2019-08-21 20:01:14'),
	(703,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:16','2019-08-21 20:01:16'),
	(704,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:16','2019-08-21 20:01:16'),
	(705,1,'admin/customer-industries/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:18','2019-08-21 20:01:18'),
	(706,1,'admin/customer-industries','POST','127.0.0.1','{\"name\":\"\\u884c\\u4e1a1\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-industries\"}','2019-08-21 20:01:25','2019-08-21 20:01:25'),
	(707,1,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-21 20:01:25','2019-08-21 20:01:25'),
	(708,1,'admin/customer-industries/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:27','2019-08-21 20:01:27'),
	(709,1,'admin/customer-industries','POST','127.0.0.1','{\"name\":\"\\u884c\\u4e1a2\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-industries\"}','2019-08-21 20:01:30','2019-08-21 20:01:30'),
	(710,1,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-21 20:01:30','2019-08-21 20:01:30'),
	(711,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:56','2019-08-21 20:01:56'),
	(712,1,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:01:57','2019-08-21 20:01:57'),
	(713,1,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"\\u5fae\\u4fe1\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-21 20:02:00','2019-08-21 20:02:00'),
	(714,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 20:02:00','2019-08-21 20:02:00'),
	(715,1,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 20:02:01','2019-08-21 20:02:01'),
	(716,1,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"\\u90ae\\u4ef6\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"yS1EOq3qtsvfh0XlLBQmXV4Zap9VPmtayXjRBqQO\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-21 20:02:07','2019-08-21 20:02:07'),
	(717,1,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-21 20:02:07','2019-08-21 20:02:07'),
	(718,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 21:15:13','2019-08-21 21:15:13'),
	(719,1,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-21 21:15:14','2019-08-21 21:15:14'),
	(720,1,'admin/auth/permissions','GET','127.0.0.1','[]','2019-08-22 19:30:09','2019-08-22 19:30:09'),
	(721,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:17','2019-08-22 19:30:17'),
	(722,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:18','2019-08-22 19:30:18'),
	(723,1,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:19','2019-08-22 19:30:19'),
	(724,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:20','2019-08-22 19:30:20'),
	(725,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:21','2019-08-22 19:30:21'),
	(726,1,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:22','2019-08-22 19:30:22'),
	(727,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:37','2019-08-22 19:30:37'),
	(728,1,'admin/auth/permissions','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:46','2019-08-22 19:30:46'),
	(729,1,'admin/auth/roles','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:48','2019-08-22 19:30:48'),
	(730,1,'admin/auth/roles/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:30:51','2019-08-22 19:30:51'),
	(731,1,'admin/auth/roles/2','PUT','127.0.0.1','{\"slug\":\"\\u5927\\u5ba2\\u6237\",\"name\":\"\\u5927\\u5ba2\\u6237\",\"permissions\":[\"2\",\"3\",\"4\",\"6\",\"8\",\"9\",null],\"_token\":\"1vzKy6St7eihkkj6LG2mDTQa75HcS6V5JVKPEdDj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/roles\"}','2019-08-22 19:30:56','2019-08-22 19:30:56'),
	(732,1,'admin/auth/roles','GET','127.0.0.1','[]','2019-08-22 19:30:56','2019-08-22 19:30:56'),
	(733,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:09','2019-08-22 19:31:09'),
	(734,1,'admin/auth/menu/2/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:14','2019-08-22 19:31:14'),
	(735,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:18','2019-08-22 19:31:18'),
	(736,1,'admin/auth/menu/10/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:20','2019-08-22 19:31:20'),
	(737,1,'admin/auth/menu/10','PUT','127.0.0.1','{\"parent_id\":\"0\",\"title\":\"\\u5927\\u5ba2\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"my\\/users\",\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"1vzKy6St7eihkkj6LG2mDTQa75HcS6V5JVKPEdDj\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/auth\\/menu\"}','2019-08-22 19:31:25','2019-08-22 19:31:25'),
	(738,1,'admin/auth/menu','GET','127.0.0.1','[]','2019-08-22 19:31:26','2019-08-22 19:31:26'),
	(739,1,'admin/auth/menu/9/edit','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:29','2019-08-22 19:31:29'),
	(740,1,'admin/auth/menu','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:36','2019-08-22 19:31:36'),
	(741,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:37','2019-08-22 19:31:37'),
	(742,1,'admin/my/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:38','2019-08-22 19:31:38'),
	(743,1,'admin/my/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:31:39','2019-08-22 19:31:39'),
	(744,1,'admin/my/users','POST','127.0.0.1','{\"username\":\"dakehu\",\"name\":\"dakehu\",\"company\":\"\\u5927\\u5ba2\\u6237\",\"can_create\":\"10\",\"contact\":\"\\u5927\\u5ba2\\u6237\",\"contact_mobile\":\"18687687676\",\"company_address\":\"\\u516c\\u53f8\\u5730\\u5740\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"roles\":[\"2\",null],\"_token\":\"1vzKy6St7eihkkj6LG2mDTQa75HcS6V5JVKPEdDj\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/my\\/users\"}','2019-08-22 19:32:04','2019-08-22 19:32:04'),
	(745,1,'admin/my/users','GET','127.0.0.1','[]','2019-08-22 19:32:04','2019-08-22 19:32:04'),
	(746,1,'admin/auth/logout','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:10','2019-08-22 19:32:10'),
	(747,4,'admin','GET','127.0.0.1','[]','2019-08-22 19:32:15','2019-08-22 19:32:15'),
	(748,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:19','2019-08-22 19:32:19'),
	(749,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:20','2019-08-22 19:32:20'),
	(750,4,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:22','2019-08-22 19:32:22'),
	(751,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:27','2019-08-22 19:32:27'),
	(752,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:28','2019-08-22 19:32:28'),
	(753,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:29','2019-08-22 19:32:29'),
	(754,4,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:32:31','2019-08-22 19:32:31'),
	(755,4,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:33:08','2019-08-22 19:33:08'),
	(756,4,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-22 19:34:38','2019-08-22 19:34:38'),
	(757,4,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-22 19:35:18','2019-08-22 19:35:18'),
	(758,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:19','2019-08-22 19:35:19'),
	(759,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:20','2019-08-22 19:35:20'),
	(760,4,'admin/customer-industries/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:22','2019-08-22 19:35:22'),
	(761,4,'admin/customer-industries','POST','127.0.0.1','{\"name\":\"\\u5927\\u5ba2\\u6237\\u884c\\u4e1a1\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-industries\"}','2019-08-22 19:35:31','2019-08-22 19:35:31'),
	(762,4,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-22 19:35:31','2019-08-22 19:35:31'),
	(763,4,'admin/customer-industries/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:32','2019-08-22 19:35:32'),
	(764,4,'admin/customer-industries','POST','127.0.0.1','{\"name\":\"\\u5927\\u5ba2\\u6237\\u884c\\u4e1a2\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-industries\"}','2019-08-22 19:35:37','2019-08-22 19:35:37'),
	(765,4,'admin/customer-industries','GET','127.0.0.1','[]','2019-08-22 19:35:37','2019-08-22 19:35:37'),
	(766,4,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:39','2019-08-22 19:35:39'),
	(767,4,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:40','2019-08-22 19:35:40'),
	(768,4,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"\\u5927\\u5ba2\\u6237\\u6765\\u6e901\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-22 19:35:45','2019-08-22 19:35:45'),
	(769,4,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-22 19:35:45','2019-08-22 19:35:45'),
	(770,4,'admin/customer-sources/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:46','2019-08-22 19:35:46'),
	(771,4,'admin/customer-sources','POST','127.0.0.1','{\"name\":\"\\u5927\\u5ba2\\u6237\\u6765\\u6e902\",\"is_show\":\"on\",\"admin_user_id\":null,\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/customer-sources\"}','2019-08-22 19:35:51','2019-08-22 19:35:51'),
	(772,4,'admin/customer-sources','GET','127.0.0.1','[]','2019-08-22 19:35:51','2019-08-22 19:35:51'),
	(773,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:53','2019-08-22 19:35:53'),
	(774,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:54','2019-08-22 19:35:54'),
	(775,4,'admin/users/create','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 19:35:57','2019-08-22 19:35:57'),
	(776,4,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18606520987\",\"name\":\"\\u4ec5\\u9650\\u8bf4\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\",\"_previous_\":\"http:\\/\\/crm-api.test\\/admin\\/users\"}','2019-08-22 19:36:15','2019-08-22 19:36:15'),
	(777,4,'admin/users/create','GET','127.0.0.1','[]','2019-08-22 19:36:15','2019-08-22 19:36:15'),
	(778,4,'admin/users','POST','127.0.0.1','{\"admin_user_id\":null,\"mobile\":\"18606520988\",\"name\":\"\\u4ec5\\u9650\\u8bf4\",\"password\":\"123456\",\"password_confirmation\":\"123456\",\"_token\":\"hKTJnnbLXVI0qswh4OYdU7EmAKvWjRC0VI9jZ1dD\"}','2019-08-22 19:36:19','2019-08-22 19:36:19'),
	(779,4,'admin/users','GET','127.0.0.1','[]','2019-08-22 19:36:19','2019-08-22 19:36:19'),
	(780,4,'admin/users','GET','127.0.0.1','[]','2019-08-22 22:21:08','2019-08-22 22:21:08'),
	(781,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 23:06:40','2019-08-22 23:06:40'),
	(782,4,'admin/customer-industries','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 23:06:40','2019-08-22 23:06:40'),
	(783,4,'admin/customer-sources','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 23:06:41','2019-08-22 23:06:41'),
	(784,4,'admin','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 23:06:42','2019-08-22 23:06:42'),
	(785,4,'admin/users','GET','127.0.0.1','{\"_pjax\":\"#pjax-container\"}','2019-08-22 23:06:42','2019-08-22 23:06:42');

/*!40000 ALTER TABLE `admin_operation_log` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_permissions`;

CREATE TABLE `admin_permissions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `http_path` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_permissions_name_unique` (`name`),
  UNIQUE KEY `admin_permissions_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_permissions` WRITE;
/*!40000 ALTER TABLE `admin_permissions` DISABLE KEYS */;

INSERT INTO `admin_permissions` (`id`, `name`, `slug`, `http_method`, `http_path`, `created_at`, `updated_at`)
VALUES
	(1,'超级管理员','*','','*',NULL,'2019-08-21 19:45:37'),
	(2,'仪表盘','仪表盘','GET','/',NULL,'2019-08-21 19:46:13'),
	(3,'登录','登录','','/auth/login\r\n/auth/logout',NULL,'2019-08-21 19:46:26'),
	(4,'设置','设置','GET,PUT','/auth/setting',NULL,'2019-08-21 19:46:39'),
	(5,'系统管理','系统管理','','/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs',NULL,'2019-08-21 19:47:12'),
	(6,'员工管理','员工管理','','/users*','2019-08-21 19:42:39','2019-08-21 19:43:21'),
	(7,'大客户管理','大客户管理','','/my/users*','2019-08-21 19:43:57','2019-08-21 19:43:57'),
	(8,'行业管理','行业管理','','/customer-sources*','2019-08-21 19:44:21','2019-08-21 19:44:21'),
	(9,'来源管理','来源管理','','/customer-industries*','2019-08-21 19:44:38','2019-08-21 19:44:38');

/*!40000 ALTER TABLE `admin_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_menu
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_menu`;

CREATE TABLE `admin_role_menu` (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_menu_role_id_menu_id_index` (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_menu` WRITE;
/*!40000 ALTER TABLE `admin_role_menu` DISABLE KEYS */;

INSERT INTO `admin_role_menu` (`role_id`, `menu_id`, `created_at`, `updated_at`)
VALUES
	(1,2,NULL,NULL),
	(1,10,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_permissions`;

CREATE TABLE `admin_role_permissions` (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_permissions_role_id_permission_id_index` (`role_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_permissions` WRITE;
/*!40000 ALTER TABLE `admin_role_permissions` DISABLE KEYS */;

INSERT INTO `admin_role_permissions` (`role_id`, `permission_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,2,NULL,NULL),
	(2,3,NULL,NULL),
	(2,4,NULL,NULL),
	(2,6,NULL,NULL),
	(2,8,NULL,NULL),
	(2,9,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_permissions` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_role_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_role_users`;

CREATE TABLE `admin_role_users` (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_role_users_role_id_user_id_index` (`role_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_role_users` WRITE;
/*!40000 ALTER TABLE `admin_role_users` DISABLE KEYS */;

INSERT INTO `admin_role_users` (`role_id`, `user_id`, `created_at`, `updated_at`)
VALUES
	(1,1,NULL,NULL),
	(2,3,NULL,NULL),
	(2,4,NULL,NULL);

/*!40000 ALTER TABLE `admin_role_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_roles`;

CREATE TABLE `admin_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_roles_name_unique` (`name`),
  UNIQUE KEY `admin_roles_slug_unique` (`slug`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_roles` WRITE;
/*!40000 ALTER TABLE `admin_roles` DISABLE KEYS */;

INSERT INTO `admin_roles` (`id`, `name`, `slug`, `created_at`, `updated_at`)
VALUES
	(1,'超级管理员','超级管理员','2019-08-21 14:54:41','2019-08-21 19:45:20'),
	(2,'大客户','大客户','2019-08-21 19:48:16','2019-08-21 19:48:16');

/*!40000 ALTER TABLE `admin_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table admin_user_permissions
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_user_permissions`;

CREATE TABLE `admin_user_permissions` (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  KEY `admin_user_permissions_user_id_permission_id_index` (`user_id`,`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table admin_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_users`;

CREATE TABLE `admin_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `can_create` int(11) NOT NULL DEFAULT '0' COMMENT '可开员工数',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人',
  `contact_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '联系人电话',
  `company_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '公司地址',
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_users_username_unique` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `admin_users` WRITE;
/*!40000 ALTER TABLE `admin_users` DISABLE KEYS */;

INSERT INTO `admin_users` (`id`, `username`, `password`, `name`, `avatar`, `remember_token`, `created_at`, `updated_at`, `company`, `can_create`, `contact`, `contact_mobile`, `company_address`)
VALUES
	(1,'admin','$2y$10$/dyQLm2HsW0EQxdERDpqtO.MyxHc4j.hLLkBx1UgO43t3.ysXDU/u','管理员',NULL,'KxmTc8fWV5I0KAz1KkwXtGW3HdilzMYBwsgupQTpGe9vGHUea6NisVykYuLk','2019-08-21 14:54:41','2019-08-21 15:04:43','',3,NULL,NULL,NULL),
	(3,'jinjialei','$2y$10$5XU.Qxg.aotQrUZfSZP1u.uj9N1XUmlBGXfDd76KhnDcXaECv0RLG','金佳垒222',NULL,'mKXiwnFkI1gTrfsntZD97JpXnIYyOqmv2LObJzElWlHniwXlibvNkNLtP8Q7','2019-08-21 16:10:13','2019-08-21 19:49:12','公司名称',10,'联系人','18606520987','公司地址'),
	(4,'dakehu','$2y$10$jh.u7nCX0IG6IMWLdCuINOXhFRfI1DEpe2XplumlZ.GO8bKzbWU3K','dakehu',NULL,'wPRJ3V6bJGg4FsE8Cv4CmMuKaAudvhDaJVLRiWeQMCit3GAHS8yVaZCwoggy','2019-08-22 19:32:04','2019-08-22 19:32:04','大客户',10,'大客户','18687687676','公司地址');

/*!40000 ALTER TABLE `admin_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_industries
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_industries`;

CREATE TABLE `customer_industries` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) unsigned NOT NULL COMMENT '关联管理员',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customer_industries` WRITE;
/*!40000 ALTER TABLE `customer_industries` DISABLE KEYS */;

INSERT INTO `customer_industries` (`id`, `admin_user_id`, `name`, `is_show`, `created_at`, `updated_at`)
VALUES
	(1,1,'行业1',1,'2019-08-21 20:01:25','2019-08-21 20:01:25'),
	(2,2,'行业2',1,'2019-08-21 20:01:30','2019-08-21 20:01:30'),
	(3,4,'大客户行业1',1,'2019-08-22 19:35:31','2019-08-22 19:35:31'),
	(4,4,'大客户行业2',1,'2019-08-22 19:35:37','2019-08-22 19:35:37');

/*!40000 ALTER TABLE `customer_industries` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customer_sources
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customer_sources`;

CREATE TABLE `customer_sources` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) unsigned NOT NULL COMMENT '关联管理员',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_show` tinyint(1) NOT NULL COMMENT '是否显示',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customer_sources` WRITE;
/*!40000 ALTER TABLE `customer_sources` DISABLE KEYS */;

INSERT INTO `customer_sources` (`id`, `admin_user_id`, `name`, `is_show`, `created_at`, `updated_at`)
VALUES
	(1,1,'微信',1,'2019-08-21 20:02:00','2019-08-21 20:02:00'),
	(2,1,'邮件',1,'2019-08-21 20:02:07','2019-08-21 20:02:07'),
	(3,4,'大客户来源1',1,'2019-08-22 19:35:45','2019-08-22 19:35:45'),
	(4,4,'大客户来源2',1,'2019-08-22 19:35:51','2019-08-22 19:35:51');

/*!40000 ALTER TABLE `customer_sources` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table customers
# ------------------------------------------------------------

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL COMMENT '外键：users的主键',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '客户名称',
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '头像',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `status` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `level` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '等级',
  `industry` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '行业',
  `source` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '来源',
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '网站地址',
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '省',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '市',
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '区',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '详细地址',
  `next_visit_time` timestamp NULL DEFAULT NULL COMMENT '下次访问时间',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `customers_user_id_foreign` (`user_id`),
  CONSTRAINT `customers_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;

INSERT INTO `customers` (`id`, `user_id`, `name`, `avatar`, `mobile`, `status`, `email`, `level`, `industry`, `source`, `website`, `province`, `city`, `area`, `address`, `next_visit_time`, `created_at`, `updated_at`)
VALUES
	(7,6,'电信号',NULL,'17757860519',0,NULL,'1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-22 22:43:05','2019-08-22 22:43:05'),
	(8,6,'nidas',NULL,'13867226347',1,NULL,'1','1','1',NULL,NULL,NULL,NULL,NULL,NULL,'2019-08-22 22:52:18','2019-08-22 22:54:25');

/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table follows
# ------------------------------------------------------------

DROP TABLE IF EXISTS `follows`;

CREATE TABLE `follows` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `customer_id` int(10) unsigned NOT NULL COMMENT '外键：customers的主键',
  `type` int(10) unsigned NOT NULL COMMENT '类型',
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'UUID',
  `record_url` text COLLATE utf8mb4_unicode_ci COMMENT '录音文件',
  `call_duration` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `visited_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '重访时间',
  `remark` text COLLATE utf8mb4_unicode_ci COMMENT '备注',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `follows` WRITE;
/*!40000 ALTER TABLE `follows` DISABLE KEYS */;

INSERT INTO `follows` (`id`, `customer_id`, `type`, `uuid`, `record_url`, `call_duration`, `visited_at`, `remark`, `created_at`, `updated_at`)
VALUES
	(15,7,10,'0665b7a0-c4f3-11e9-8696-a31a86de2899',NULL,NULL,'2019-08-22 23:39:27','系统拨打电话','2019-08-22 23:39:27','2019-08-22 23:39:27'),
	(16,7,10,'7d1fbc10-c4f3-11e9-8799-bf1da309c5bc','https://223.87.15.166/sp-qm2jwjxr5mh716r6qoev4pbtnt31/19082215430312032134805.wav?X-Amz-Algorithm=AWS4-HMAC-SHA256&X-Amz-Date=20190822T154320Z&X-Amz-SignedHeaders=host&X-Amz-Expires=259200&X-Amz-Credential=CE8D0C878723862A49EA%2F20190822%2Fus-east-1%2Fs3%2Faws4_request&X-Amz-Signature=cb86cb9498d0659542ffc604331e06d10628edb6d479e5e103ef761fb51b092c','13','2019-08-22 23:43:20','系统拨打电话','2019-08-22 23:42:47','2019-08-22 23:43:20');

/*!40000 ALTER TABLE `follows` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2014_10_12_000000_create_users_table',1),
	(2,'2014_10_12_100000_create_password_resets_table',1),
	(3,'2016_06_01_000001_create_oauth_auth_codes_table',1),
	(4,'2016_06_01_000002_create_oauth_access_tokens_table',1),
	(5,'2016_06_01_000003_create_oauth_refresh_tokens_table',1),
	(6,'2016_06_01_000004_create_oauth_clients_table',1),
	(7,'2016_06_01_000005_create_oauth_personal_access_clients_table',1),
	(8,'2019_08_18_101829_create_verification_codes_table',1),
	(9,'2019_08_19_134011_create_customers_table',1),
	(10,'2019_08_20_143529_create_follows_table',1),
	(11,'2016_01_04_173148_create_admin_tables',2),
	(14,'2019_08_21_162419_create_customer_sources_table',3),
	(15,'2019_08_21_162508_create_customer_industries_table',3);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_access_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_access_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_access_tokens` DISABLE KEYS */;

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`)
VALUES
	('0e5081345e49ec5a4c3280175c3c4ce3af521e275d2403a8fc1080c5b58cdfe66d052db228a63e3d',6,2,NULL,'[]',0,'2019-08-22 23:22:09','2019-08-22 23:22:09','2019-09-06 23:22:09'),
	('2856dd3da95a6b1fb037be93d1bfdfe439a5571478598fae7f7870c6010f0570365c7f3acf0696c2',6,2,NULL,'[]',0,'2019-08-22 23:22:42','2019-08-22 23:22:42','2019-09-06 23:22:42'),
	('38bc86475d5769e87090e5aada6ee41ff1014994bac0a446d52a750f1e2be4ed6471674bf5c4d369',6,2,NULL,'[]',0,'2019-08-21 22:15:53','2019-08-21 22:15:53','2019-09-05 22:15:53'),
	('43e66cb4dda5c238c3c005058c54bd0b5827e2e43da218878efbfe4c5b39d093f9dfc1a589757db7',6,2,NULL,'[]',0,'2019-08-21 17:18:40','2019-08-21 17:18:40','2019-09-05 17:18:40'),
	('5b53486b31001eaf2569aac529d0762aa183ee8c9bc64257bb95751c87c49df92048e3be8351493e',10,2,NULL,'[]',0,'2019-08-22 19:39:28','2019-08-22 19:39:28','2019-09-06 19:39:28'),
	('85d5be1fc00c016eaf273f9b0411cd83b9cd4555b3e52adaf270444cf88fed4ca1bc953243ca8769',6,2,NULL,'[]',0,'2019-08-21 22:26:26','2019-08-21 22:26:26','2019-09-05 22:26:26'),
	('93943f7d5900bf568a7375a2aa2fce1c4f352966f10f98fc51d18afadc64a305f78bda29aca68489',2,2,NULL,'[]',0,'2019-08-20 17:18:09','2019-08-20 17:18:09','2019-09-04 17:18:09'),
	('abc41b739e4a37f299fe7091f892fe3938b876ed70adf81b4b7e02c79c3d4a45d05ce99826a01e7a',6,2,NULL,'[]',0,'2019-08-22 22:42:48','2019-08-22 22:42:48','2019-09-06 22:42:48'),
	('c4a8126c038d34363c0717b69c992d4c9d023f7e7e14be3e5ea39db8df198688f90fdea492736db6',1,2,NULL,'[]',0,'2019-08-20 14:42:55','2019-08-20 14:42:55','2019-09-04 14:42:55'),
	('d9b6d6913753a16497e96bcced372f7951635292a7bef99873fbfad01da261765ad93ae4aea2a359',6,2,NULL,'[]',0,'2019-08-21 21:18:32','2019-08-21 21:18:32','2019-09-05 21:18:32');

/*!40000 ALTER TABLE `oauth_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_auth_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_auth_codes`;

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table oauth_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE `oauth_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_clients` WRITE;
/*!40000 ALTER TABLE `oauth_clients` DISABLE KEYS */;

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`)
VALUES
	(1,NULL,'Laravel Personal Access Client','YqYJMYiMZYSl2NRGWCX9Lb2V5FhxAWQ1snQAi0mF','http://localhost',1,0,0,'2019-08-20 14:42:43','2019-08-20 14:42:43'),
	(2,NULL,'Laravel Password Grant Client','sg2oiwcF34fulMSAkANIZAS8vCP39NEGs6aHJtTm','http://localhost',0,1,0,'2019-08-20 14:42:43','2019-08-20 14:42:43'),
	(3,NULL,'CRM Personal Access Client','7gNr4YNTd5imUPjR5zNmyy7kFiWsQEmJcBIN6cnj','http://localhost',1,0,0,'2019-08-22 23:21:28','2019-08-22 23:21:28'),
	(4,NULL,'CRM Password Grant Client','7Ln6BAhbrZdTTDFUiEt4WWJEwsSQm6vdzNf7LHwI','http://localhost',0,1,0,'2019-08-22 23:21:29','2019-08-22 23:21:29');

/*!40000 ALTER TABLE `oauth_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_personal_access_clients
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_personal_access_clients`;

CREATE TABLE `oauth_personal_access_clients` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_personal_access_clients_client_id_index` (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_personal_access_clients` WRITE;
/*!40000 ALTER TABLE `oauth_personal_access_clients` DISABLE KEYS */;

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`)
VALUES
	(1,1,'2019-08-20 14:42:43','2019-08-20 14:42:43'),
	(2,3,'2019-08-22 23:21:28','2019-08-22 23:21:28');

/*!40000 ALTER TABLE `oauth_personal_access_clients` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table oauth_refresh_tokens
# ------------------------------------------------------------

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_refresh_tokens_access_token_id_index` (`access_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `oauth_refresh_tokens` WRITE;
/*!40000 ALTER TABLE `oauth_refresh_tokens` DISABLE KEYS */;

INSERT INTO `oauth_refresh_tokens` (`id`, `access_token_id`, `revoked`, `expires_at`)
VALUES
	('008eecb77322086ea5fbd403c96cbc7a2505b8b36022bcade3e659eb929be5c8041745cb0338bd61','43e66cb4dda5c238c3c005058c54bd0b5827e2e43da218878efbfe4c5b39d093f9dfc1a589757db7',0,'2019-09-20 17:18:40'),
	('752e8f12c3096f7e2d0dbe28d9e30b373817a1bc0d96098d5611640a6ef1482cfa00bd5db0712a19','d9b6d6913753a16497e96bcced372f7951635292a7bef99873fbfad01da261765ad93ae4aea2a359',0,'2019-09-20 21:18:32'),
	('8fb4370b5bfb05f4724b90e383fc3a4d5df1f194a624530db60ef605c5d6017f87191345d1e6568b','93943f7d5900bf568a7375a2aa2fce1c4f352966f10f98fc51d18afadc64a305f78bda29aca68489',0,'2019-09-19 17:18:09'),
	('a06f557de109c33267aebf14b85d2b1fe7d03b19b10a5dcfae536d5e5d7602c6d7a126e801879b9e','0e5081345e49ec5a4c3280175c3c4ce3af521e275d2403a8fc1080c5b58cdfe66d052db228a63e3d',0,'2019-09-21 23:22:09'),
	('afc5728ba0eb23af4580224773f55ebfe6e6ef460a8eedff259550cdc90e431b75ddac60c62b2330','38bc86475d5769e87090e5aada6ee41ff1014994bac0a446d52a750f1e2be4ed6471674bf5c4d369',0,'2019-09-20 22:15:53'),
	('b089d3b2f37b47652e174b1b69c9414a3720612a99a10fcb28423b2916b4800fd261ef4796bd0c07','c4a8126c038d34363c0717b69c992d4c9d023f7e7e14be3e5ea39db8df198688f90fdea492736db6',0,'2019-09-19 14:42:55'),
	('df0f8ae801437495accb34253c5d248b209525b272ef418192ac653d85c60aef0ca7acd01ff446e3','2856dd3da95a6b1fb037be93d1bfdfe439a5571478598fae7f7870c6010f0570365c7f3acf0696c2',0,'2019-09-21 23:22:42'),
	('e70b334d4e1d8f62a4148050e44db310a0ff4b3b27de8fea965254833c7aada10ded824286de4cf7','abc41b739e4a37f299fe7091f892fe3938b876ed70adf81b4b7e02c79c3d4a45d05ce99826a01e7a',0,'2019-09-21 22:42:48'),
	('ea5444e6e4b97435ff9ed0bfa0c3b9a7859b8af11b1410ca2449a41871ea0359b0ce975f77684bf6','85d5be1fc00c016eaf273f9b0411cd83b9cd4555b3e52adaf270444cf88fed4ca1bc953243ca8769',0,'2019-09-20 22:26:26'),
	('fd0050bbb47ba33dee246dc94cc965e35a8897c812786b60219dabc5030acabd3fd66aaaa3aef6b7','5b53486b31001eaf2569aac529d0762aa183ee8c9bc64257bb95751c87c49df92048e3be8351493e',0,'2019-09-21 19:39:28');

/*!40000 ALTER TABLE `oauth_refresh_tokens` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table password_resets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `password_resets`;

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `admin_user_id` int(10) unsigned NOT NULL COMMENT '关联管理员',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '姓名',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_mobile_unique` (`mobile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `admin_user_id`, `mobile`, `name`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`)
VALUES
	(6,1,'18606520987','联通号',NULL,'$2y$10$jhzWqaDGjwsA/VVKYr.neeiLKwmEKCVsp7ANzyrOGe3lRlsMQYc7y',NULL,'2019-08-21 17:18:31','2019-08-21 17:51:26');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table verification_codes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `verification_codes`;

CREATE TABLE `verification_codes` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `type` int(11) NOT NULL COMMENT '类型',
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '手机号',
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '验证码',
  `message` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '短信内容',
  `is_used` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已使用',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `verification_codes` WRITE;
/*!40000 ALTER TABLE `verification_codes` DISABLE KEYS */;

INSERT INTO `verification_codes` (`id`, `type`, `mobile`, `code`, `message`, `is_used`, `created_at`, `updated_at`)
VALUES
	(1,1,'18606520987','2179','您的验证码为2179',1,'2019-08-20 14:42:49','2019-08-20 14:42:56'),
	(2,1,'17757860519','9299','您的验证码为9299',1,'2019-08-20 17:17:58','2019-08-20 17:18:09'),
	(3,1,'18606520987','8734','您的验证码为8734',1,'2019-08-21 17:17:59','2019-08-21 17:18:40'),
	(4,1,'18606520987','7349','您的验证码为7349',1,'2019-08-21 21:18:24','2019-08-21 21:18:32'),
	(5,1,'18606520987','1780','您的验证码为1780',1,'2019-08-21 22:15:49','2019-08-21 22:15:53'),
	(6,1,'18606520987','1234','您的验证码为1234',1,'2019-08-21 22:26:20','2019-08-21 22:26:26'),
	(7,1,'18606520988','1234','您的验证码为1234',1,'2019-08-22 19:39:26','2019-08-22 19:39:29'),
	(8,1,'18606520987','1234','您的验证码为1234',1,'2019-08-22 22:42:45','2019-08-22 22:42:48'),
	(9,1,'18606520987','1234','您的验证码为1234',1,'2019-08-22 23:22:05','2019-08-22 23:22:09'),
	(10,1,'18606520987','1234','您的验证码为1234',1,'2019-08-22 23:22:39','2019-08-22 23:22:42');

/*!40000 ALTER TABLE `verification_codes` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

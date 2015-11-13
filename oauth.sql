/*
SQLyog Ultimate v10.42 
MySQL - 5.5.35 : Database - weizhan
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`oauth` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `oauth`;

--
-- Table structure for table `oauth_access_tokens`
--

DROP TABLE IF EXISTS `oauth_access_tokens`;

CREATE TABLE IF NOT EXISTS `oauth_access_tokens` (
  `access_token` varchar(40) NOT NULL COMMENT '获取资源的access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`access_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_access_tokens` (`access_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0b84a512b6ea40d9aa71027fd3dd46d898e2ae5c', 'testclient', 'user', '2015-06-28 15:55:05', 'userinfo cloud file node'),
('1d83cfb85c8afe71dac8a9ab32875d4ce8025c11', 'testclient', 'user', '2015-06-28 15:53:34', 'userinfo cloud file node'),
('1f960e7bd2454a4a25f91232b71e2659fa8d6415', 'testclient', 'xiaocao', '2015-06-28 15:46:33', 'userinfo cloud file node'),
('23b3ce4747183460fd753238f0e79b34b3e7bc3c', 'testclient', 'user', '2015-06-28 15:55:06', 'userinfo node file'),
('5c19932029b545ba220b3cba53cc996d8e321704', 'testclient', 'user', '2015-06-28 15:54:33', 'userinfo cloud file node'),
('6b0abf82a8b4269759b47a2797794f657fe8868a', 'testclient', 'user', '2015-06-28 15:46:36', 'userinfo cloud file node'),
('7b6c72176ede3e63f78d61849b6ad01b2bf81a6b', 'testclient', 'user', '2015-06-28 15:55:16', 'userinfo node file'),
('8995e510a6e5672c73e800d48acf8a3f79205621', 'testclient', 'user', '2015-06-28 15:46:49', 'userinfo cloud file node'),
('8cb848d89b7d12beb746b0421ece7209f5c8633a', 'testclient', 'xiaocao', '2015-06-28 15:55:13', 'userinfo cloud file node'),
('ae5f8c93dc51d856d6536aec528c31c6f6450458', 'testclient', 'user', '2015-06-28 15:55:16', 'userinfo cloud file node'),
('df43443857a63df74f426dfa679c887483827318', 'testclient', 'xiaocao', '2015-06-28 15:46:48', 'userinfo cloud file node');

--
-- Table structure for table `oauth_authorization_codes`
--

DROP TABLE IF EXISTS `oauth_authorization_codes`;

CREATE TABLE IF NOT EXISTS `oauth_authorization_codes` (
  `authorization_code` varchar(40) NOT NULL COMMENT '通过Authorization 获取到的code，用于获取access_token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者Appid',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `redirect_uri` varchar(2000) DEFAULT NULL COMMENT '认证后跳转的url',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`authorization_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_authorization_codes` (`authorization_code`, `client_id`, `user_id`, `redirect_uri`, `expires`, `scope`) VALUES
('016e1a57392e4b672415340ba4d6df18c90eab9f', 'testclient', NULL, '', '2015-06-28 14:56:55', 'userinfo'),
('2f37568bc9a2d8eb3ecb4c360a3abc71235f68c0', 'testclient', NULL, '', '2015-06-28 14:52:14', 'userinfo'),
('63c3b32c565eea30197068658d32678baf1202d6', 'testclient', NULL, '', '2015-06-28 14:56:51', 'userinfo'),
('89fab65a94cbbf8b39ac21a3d797d45964deabd2', 'testclient', NULL, '', '2015-06-28 14:56:57', 'userinfo');


--
-- Table structure for table `oauth_clients`
--

DROP TABLE IF EXISTS `oauth_clients`;

CREATE TABLE IF NOT EXISTS `oauth_clients` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `client_secret` varchar(80) NOT NULL COMMENT '开发者AppSecret',
  `redirect_uri` varchar(2000) NOT NULL COMMENT '认证后跳转的url',
  `grant_types` varchar(80) DEFAULT NULL COMMENT '认证的方式，client_credentials、password、refresh_token、authorization_code、authorization_access_token',
  `scope` varchar(100) DEFAULT NULL COMMENT '权限容器',
  `user_id` varchar(80) DEFAULT NULL COMMENT '开发者用户id',
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_clients` (`client_id`, `client_secret`, `redirect_uri`, `grant_types`, `scope`, `user_id`) VALUES
('testclient', 'testpass', 'http://homeway.me/', 'client_credentials password authorization_code refresh_token', 'file node userinfo cloud', 'xiaocao'),
('client2', 'pass2', 'http://homeway.me/', 'authorization_code', 'file node userinfo cloud', 'xiaocao');

--
-- Table structure for table `oauth_jwt`
--

DROP TABLE IF EXISTS `oauth_jwt`;

CREATE TABLE IF NOT EXISTS `oauth_jwt` (
  `client_id` varchar(80) NOT NULL COMMENT '开发者用户id',
  `subject` varchar(80) DEFAULT NULL,
  `public_key` varchar(2000) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


--
-- Table structure for table `oauth_refresh_tokens`
--

DROP TABLE IF EXISTS `oauth_refresh_tokens`;

CREATE TABLE IF NOT EXISTS `oauth_refresh_tokens` (
  `refresh_token` varchar(40) NOT NULL COMMENT '跟新access_token的token',
  `client_id` varchar(80) NOT NULL COMMENT '开发者AppId',
  `user_id` varchar(255) DEFAULT NULL COMMENT '开发者用户id',
  `expires` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '认证的时间date("Y-m-d H:i:s")',
  `scope` varchar(2000) DEFAULT NULL COMMENT '权限容器',
  PRIMARY KEY (`refresh_token`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_refresh_tokens` (`refresh_token`, `client_id`, `user_id`, `expires`, `scope`) VALUES
('0dcd00a06f1598db7c7df2d2faf4c16a7be9c28d', 'testclient', 'user', '2015-07-12 14:55:06', 'userinfo node file'),
('7432203dc184c6c2090fef8b02c5c5acf3f349a5', 'testclient', 'user', '2015-07-12 14:55:16', 'userinfo node file'),
('aef23d373a276116b3afd946ba4a9c39780186c0', 'testclient', 'user', '2015-07-12 14:53:34', 'userinfo cloud file node'),
('af1e55594cae88cedf312f84a89109e3b80a5932', 'testclient', 'user', '2015-07-12 14:54:33', 'userinfo cloud file node'),
('f09ed02ebf185fb08b4f0f316e59bac07028997b', 'testclient', 'user', '2015-07-12 14:46:36', 'userinfo cloud file node'),
('fb1aa4bd8d123abaa882c759d60326dae51543c3', 'testclient', 'user', '2015-07-12 14:46:49', 'userinfo cloud file node');

--
-- Table structure for table `oauth_scopes`
--

DROP TABLE IF EXISTS `oauth_scopes`;

CREATE TABLE IF NOT EXISTS `oauth_scopes` (
  `scope` text  COMMENT '容器名字',
  `is_default` tinyint(1) DEFAULT NULL COMMENT '是否默认拥有，1=>是，0=>否'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_scopes` (`scope`, `is_default`) VALUES
('userinfo', 1),
('file', 0),
('node', 0),
('cloud', 0),
('share', 0);

--
-- Table structure for table `oauth_users`
--

DROP TABLE IF EXISTS `oauth_users`;

CREATE TABLE IF NOT EXISTS `oauth_users` (
  `username` varchar(255) NOT NULL COMMENT '内部时候使用的认证用户名',
  `password` varchar(2000) DEFAULT NULL COMMENT '内部时候使用的认证用户密码',
  `first_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
  `last_name` varchar(255) DEFAULT NULL COMMENT '内部时候使用',
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `oauth_users` (`username`, `password`, `first_name`, `last_name`) VALUES
('user', 'pass', 'xiaocao', 'grasses'),
('username', 'password', 'xiaocao', 'grasses');






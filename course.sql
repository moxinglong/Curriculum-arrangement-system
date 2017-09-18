-- --------------------------------------------------------
-- 主机:                           127.0.0.1
-- 服务器版本:                        5.6.13 - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win32
-- HeidiSQL 版本:                  9.2.0.4947
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出 course 的数据库结构
DROP DATABASE IF EXISTS `course`;
CREATE DATABASE IF NOT EXISTS `course` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `course`;


-- 导出  表 course.c_class 结构
DROP TABLE IF EXISTS `c_class`;
CREATE TABLE IF NOT EXISTS `c_class` (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(255) DEFAULT NULL,
  `c_condition` varchar(255) DEFAULT NULL,
  `c_skillteacherid` bigint(20) DEFAULT NULL,
  `c_classteacherid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FKhdtdt9xgl0sc29x77y4ar6bqa` (`c_skillteacherid`),
  KEY `FK5go2ksm39aw23xgo4yoiqlln4` (`c_classteacherid`),
  CONSTRAINT `FK5go2ksm39aw23xgo4yoiqlln4` FOREIGN KEY (`c_classteacherid`) REFERENCES `c_teacher` (`t_id`),
  CONSTRAINT `FKhdtdt9xgl0sc29x77y4ar6bqa` FOREIGN KEY (`c_skillteacherid`) REFERENCES `c_teacher` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- 正在导出表  course.c_class 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `c_class` DISABLE KEYS */;
INSERT INTO `c_class` (`c_id`, `c_name`, `c_condition`, `c_skillteacherid`, `c_classteacherid`) VALUES
	(22, 'Facebook部', '1', 11, 4),
	(23, '微软部', '1', 9, 5),
	(24, '京东部', '1', 10, 6),
	(25, '腾讯部', '1', 8, 5);
/*!40000 ALTER TABLE `c_class` ENABLE KEYS */;


-- 导出  表 course.c_classroom 结构
DROP TABLE IF EXISTS `c_classroom`;
CREATE TABLE IF NOT EXISTS `c_classroom` (
  `c_id` bigint(20) NOT NULL,
  `c_time` varchar(255) DEFAULT NULL,
  `c_room` varchar(255) DEFAULT NULL,
  `c_classid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FKiq15671yn8xqtelb5xnx0krt0` (`c_classid`),
  CONSTRAINT `FKiq15671yn8xqtelb5xnx0krt0` FOREIGN KEY (`c_classid`) REFERENCES `c_class` (`c_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 正在导出表  course.c_classroom 的数据：~147 rows (大约)
/*!40000 ALTER TABLE `c_classroom` DISABLE KEYS */;
INSERT INTO `c_classroom` (`c_id`, `c_time`, `c_room`, `c_classid`) VALUES
	(1, '星期一上午', '101教室', 23),
	(2, '星期一下午', '101教室', 23),
	(3, '星期一晚上', '101教室', NULL),
	(4, '星期二上午', '101教室', 22),
	(5, '星期二下午', '101教室', NULL),
	(6, '星期二晚上', '101教室', NULL),
	(7, '星期三上午', '101教室', 22),
	(8, '星期三下午', '101教室', NULL),
	(9, '星期三晚上', '101教室', NULL),
	(10, '星期四上午', '101教室', NULL),
	(11, '星期四下午', '101教室', NULL),
	(12, '星期四晚上', '101教室', NULL),
	(13, '星期五上午', '101教室', 24),
	(14, '星期五下午', '101教室', NULL),
	(15, '星期五晚上', '101教室', NULL),
	(16, '星期六上午', '101教室', 22),
	(17, '星期六下午', '101教室', NULL),
	(18, '星期六晚上', '101教室', NULL),
	(19, '星期日上午', '101教室', NULL),
	(20, '星期日下午', '101教室', 22),
	(21, '星期日晚上', '101教室', NULL),
	(22, '星期一上午', '102教室', NULL),
	(23, '星期一下午', '102教室', 24),
	(24, '星期一晚上', '102教室', NULL),
	(25, '星期二上午', '102教室', NULL),
	(26, '星期二下午', '102教室', NULL),
	(27, '星期二晚上', '102教室', NULL),
	(28, '星期三上午', '102教室', NULL),
	(29, '星期三下午', '102教室', NULL),
	(30, '星期三晚上', '102教室', NULL),
	(31, '星期四上午', '102教室', NULL),
	(32, '星期四下午', '102教室', 23),
	(33, '星期四晚上', '102教室', NULL),
	(34, '星期五上午', '102教室', 22),
	(35, '星期五下午', '102教室', NULL),
	(36, '星期五晚上', '102教室', NULL),
	(37, '星期六上午', '102教室', NULL),
	(38, '星期六下午', '102教室', NULL),
	(39, '星期六晚上', '102教室', NULL),
	(40, '星期日上午', '102教室', NULL),
	(41, '星期日下午', '102教室', 23),
	(42, '星期日晚上', '102教室', NULL),
	(43, '星期一上午', '103教室', 22),
	(44, '星期一下午', '103教室', NULL),
	(45, '星期一晚上', '103教室', NULL),
	(46, '星期二上午', '103教室', NULL),
	(47, '星期二下午', '103教室', NULL),
	(48, '星期二晚上', '103教室', NULL),
	(49, '星期三上午', '103教室', 24),
	(50, '星期三下午', '103教室', 25),
	(51, '星期三晚上', '103教室', NULL),
	(52, '星期四上午', '103教室', NULL),
	(53, '星期四下午', '103教室', NULL),
	(54, '星期四晚上', '103教室', NULL),
	(55, '星期五上午', '103教室', 25),
	(56, '星期五下午', '103教室', NULL),
	(57, '星期五晚上', '103教室', NULL),
	(58, '星期六上午', '103教室', 23),
	(59, '星期六下午', '103教室', NULL),
	(60, '星期六晚上', '103教室', NULL),
	(61, '星期日上午', '103教室', NULL),
	(62, '星期日下午', '103教室', NULL),
	(63, '星期日晚上', '103教室', NULL),
	(64, '星期一上午', '104教室', NULL),
	(65, '星期一下午', '104教室', NULL),
	(66, '星期一晚上', '104教室', NULL),
	(67, '星期二上午', '104教室', NULL),
	(68, '星期二下午', '104教室', NULL),
	(69, '星期二晚上', '104教室', NULL),
	(70, '星期三上午', '104教室', NULL),
	(71, '星期三下午', '104教室', 23),
	(72, '星期三晚上', '104教室', NULL),
	(73, '星期四上午', '104教室', 25),
	(74, '星期四下午', '104教室', NULL),
	(75, '星期四晚上', '104教室', NULL),
	(76, '星期五上午', '104教室', NULL),
	(77, '星期五下午', '104教室', 23),
	(78, '星期五晚上', '104教室', NULL),
	(79, '星期六上午', '104教室', NULL),
	(80, '星期六下午', '104教室', 23),
	(81, '星期六晚上', '104教室', NULL),
	(82, '星期日上午', '104教室', NULL),
	(83, '星期日下午', '104教室', NULL),
	(84, '星期日晚上', '104教室', NULL),
	(85, '星期一上午', '105教室', 25),
	(86, '星期一下午', '105教室', NULL),
	(87, '星期一晚上', '105教室', NULL),
	(88, '星期二上午', '105教室', NULL),
	(89, '星期二下午', '105教室', NULL),
	(90, '星期二晚上', '105教室', NULL),
	(91, '星期三上午', '105教室', 23),
	(92, '星期三下午', '105教室', NULL),
	(93, '星期三晚上', '105教室', NULL),
	(94, '星期四上午', '105教室', NULL),
	(95, '星期四下午', '105教室', NULL),
	(96, '星期四晚上', '105教室', NULL),
	(97, '星期五上午', '105教室', NULL),
	(98, '星期五下午', '105教室', NULL),
	(99, '星期五晚上', '105教室', NULL),
	(100, '星期六上午', '105教室', 25),
	(101, '星期六下午', '105教室', NULL),
	(102, '星期六晚上', '105教室', NULL),
	(103, '星期日上午', '105教室', NULL),
	(104, '星期日下午', '105教室', NULL),
	(105, '星期日晚上', '105教室', NULL),
	(106, '星期一上午', '106教室', 24),
	(107, '星期一下午', '106教室', NULL),
	(108, '星期一晚上', '106教室', NULL),
	(109, '星期二上午', '106教室', NULL),
	(110, '星期二下午', '106教室', 24),
	(111, '星期二晚上', '106教室', NULL),
	(112, '星期三上午', '106教室', NULL),
	(113, '星期三下午', '106教室', 24),
	(114, '星期三晚上', '106教室', NULL),
	(115, '星期四上午', '106教室', NULL),
	(116, '星期四下午', '106教室', 25),
	(117, '星期四晚上', '106教室', NULL),
	(118, '星期五上午', '106教室', 23),
	(119, '星期五下午', '106教室', 24),
	(120, '星期五晚上', '106教室', NULL),
	(121, '星期六上午', '106教室', NULL),
	(122, '星期六下午', '106教室', 24),
	(123, '星期六晚上', '106教室', NULL),
	(124, '星期日上午', '106教室', 25),
	(125, '星期日下午', '106教室', NULL),
	(126, '星期日晚上', '106教室', NULL),
	(127, '星期一上午', '107教室', NULL),
	(128, '星期一下午', '107教室', 25),
	(129, '星期一晚上', '107教室', NULL),
	(130, '星期二上午', '107教室', 24),
	(131, '星期二下午', '107教室', 22),
	(132, '星期二晚上', '107教室', NULL),
	(133, '星期三上午', '107教室', 25),
	(134, '星期三下午', '107教室', NULL),
	(135, '星期三晚上', '107教室', NULL),
	(136, '星期四上午', '107教室', NULL),
	(137, '星期四下午', '107教室', NULL),
	(138, '星期四晚上', '107教室', NULL),
	(139, '星期五上午', '107教室', NULL),
	(140, '星期五下午', '107教室', 25),
	(141, '星期五晚上', '107教室', NULL),
	(142, '星期六上午', '107教室', NULL),
	(143, '星期六下午', '107教室', 25),
	(144, '星期六晚上', '107教室', NULL),
	(145, '星期日上午', '107教室', 24),
	(146, '星期日下午', '107教室', 25),
	(147, '星期日晚上', '107教室', NULL);
/*!40000 ALTER TABLE `c_classroom` ENABLE KEYS */;


-- 导出  表 course.c_comment 结构
DROP TABLE IF EXISTS `c_comment`;
CREATE TABLE IF NOT EXISTS `c_comment` (
  `c_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `c_context` varchar(255) DEFAULT NULL,
  `c_time` varchar(255) DEFAULT NULL,
  `c_teacherid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`c_id`),
  KEY `FKmoyjoij6ntdct6reh17x5d6wo` (`c_teacherid`),
  CONSTRAINT `FKmoyjoij6ntdct6reh17x5d6wo` FOREIGN KEY (`c_teacherid`) REFERENCES `c_teacher` (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- 正在导出表  course.c_comment 的数据：~5 rows (大约)
/*!40000 ALTER TABLE `c_comment` DISABLE KEYS */;
INSERT INTO `c_comment` (`c_id`, `c_context`, `c_time`, `c_teacherid`) VALUES
	(1, '老师教的很好!!!', '2017-09-18 09:22:27', 4),
	(2, '教的不错', '2017-09-18 09:23:08', 5),
	(3, '还行吧', '2017-09-18 09:23:18', 4),
	(4, '', '2017-09-18 10:42:11', 5),
	(5, '', '2017-09-18 10:42:17', 4);
/*!40000 ALTER TABLE `c_comment` ENABLE KEYS */;


-- 导出  表 course.c_student 结构
DROP TABLE IF EXISTS `c_student`;
CREATE TABLE IF NOT EXISTS `c_student` (
  `s_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(255) DEFAULT NULL,
  `s_sex` varchar(255) DEFAULT NULL,
  `s_birth` varchar(255) DEFAULT NULL,
  `s_tel` varchar(255) DEFAULT NULL,
  `s_address` varchar(255) DEFAULT NULL,
  `s_major` varchar(255) DEFAULT NULL,
  `s_school` varchar(255) DEFAULT NULL,
  `c_classid` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `FKpl9ob36yye8fkfis6xdveq7xs` (`c_classid`),
  CONSTRAINT `FKpl9ob36yye8fkfis6xdveq7xs` FOREIGN KEY (`c_classid`) REFERENCES `c_class` (`c_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- 正在导出表  course.c_student 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `c_student` DISABLE KEYS */;
INSERT INTO `c_student` (`s_id`, `s_name`, `s_sex`, `s_birth`, `s_tel`, `s_address`, `s_major`, `s_school`, `c_classid`) VALUES
	(1, '张三', '男', '1995-01-01', '15968456984', '北京市东城区', '软件工程', '湖南大学', 22),
	(2, '李四', '男', '1996-03-03', '15968456984', '北京市西城区', '机械自动化', '复旦大学', 23),
	(3, '王五', '男', '1996-02-02', '15968456984', '北京市崇文区', '电子商务', '浙江大学', 23),
	(4, '马六', '女', '1996-04-04', '15968456984', '北京市宣武区', '软件工程', '湖南大学', 22),
	(5, '田七', '女', '1996-05-05', '15968456984', '上海市黄浦区', '机械自动化', '南京大学', 25),
	(6, '汾八', '男', '1996-08-07', '15968456984', '上海市卢湾区', '电子商务', '浙江大学', 24);
/*!40000 ALTER TABLE `c_student` ENABLE KEYS */;


-- 导出  表 course.c_teacher 结构
DROP TABLE IF EXISTS `c_teacher`;
CREATE TABLE IF NOT EXISTS `c_teacher` (
  `t_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `t_name` varchar(255) DEFAULT NULL,
  `t_birth` varchar(255) DEFAULT NULL,
  `t_type` varchar(255) DEFAULT NULL,
  `t_sex` varchar(255) DEFAULT NULL,
  `t_tel` varchar(255) DEFAULT NULL,
  `t_idcard` varchar(255) DEFAULT NULL,
  `t_address` varchar(255) DEFAULT NULL,
  `t_major` varchar(255) DEFAULT NULL,
  `t_school` varchar(255) DEFAULT NULL,
  `t_jobtime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`t_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- 正在导出表  course.c_teacher 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `c_teacher` DISABLE KEYS */;
INSERT INTO `c_teacher` (`t_id`, `t_name`, `t_birth`, `t_type`, `t_sex`, `t_tel`, `t_idcard`, `t_address`, `t_major`, `t_school`, `t_jobtime`) VALUES
	(4, '马云', '1980-01-02', '1', '男', '17674707361', '430421199607111995', '北京市东城区', '阿里巴巴', '清华大学', '2017-09-18'),
	(5, '马化腾', '1980-02-05', '1', '男', '17674707361', '430421199607111995', '北京市西城区', '腾讯', '湘潭大学', '2017-09-18'),
	(6, '刘强东', '1980-03-13', '1', '男', '17674707361', '430421199607111995', '北京市崇文区', '京东', '清华大学', '2017-09-18'),
	(7, '董明珠', '1980-06-26', '1', '女', '17674707361', '430421199607111995', '北京市宣武区', '格力', '南京大学', '2017-09-18'),
	(8, '李彦宏', '1982-09-08', '2', '男', '17674707361', '430421199607111995', '上海市黄浦区', '百度', '浙江大学', '2017-09-18'),
	(9, '盖茨', '1975-02-12', '2', '男', '17674707361', '430421199607111995', '上海市卢湾区', '微软', '哈佛大学', '2017-09-18'),
	(10, '贝佐斯', '1965-07-01', '2', '男', '17674707361', '430421199607111995', '上海市徐汇区', '亚马逊', '哈佛大学', '2017-09-18'),
	(11, '扎克伯格', '1984-08-16', '2', '男', '17674707361', '430421199607111995', '上海市长宁区', 'Facebook', '哈佛大学', '2017-09-18');
/*!40000 ALTER TABLE `c_teacher` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               10.3.22-MariaDB-0+deb10u1 - Debian 10
-- Операционная система:         debian-linux-gnu
-- HeidiSQL Версия:              10.2.0.5599
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных test_Dorosh
CREATE DATABASE IF NOT EXISTS `test_Dorosh` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `test_Dorosh`;

-- Дамп структуры для таблица test_Dorosh.employees
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы test_Dorosh.employees: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` (`id`, `name`) VALUES
	(1, 'John'),
	(2, 'Jane'),
	(3, 'Mark'),
	(4, 'Peter'),
	(5, 'Leo'),
	(6, 'Marie'),
	(7, 'Lisa'),
	(8, 'Luis'),
	(9, 'Gavin'),
	(10, 'Pedro');
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;

-- Дамп структуры для таблица test_Dorosh.time_reports
CREATE TABLE IF NOT EXISTS `time_reports` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `employee_id` int(10) unsigned NOT NULL,
  `hours` float unsigned NOT NULL DEFAULT 0,
  `date` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `employee_id` (`employee_id`),
  CONSTRAINT `emplooyee_id` FOREIGN KEY (`employee_id`) REFERENCES `employees` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы test_Dorosh.time_reports: ~59 rows (приблизительно)
/*!40000 ALTER TABLE `time_reports` DISABLE KEYS */;
INSERT INTO `time_reports` (`id`, `employee_id`, `hours`, `date`) VALUES
	(1, 1, 4.5, '5/4/2020'),
	(2, 2, 5.5, '5/4/2020'),
	(3, 1, 7, '5/5/2020'),
	(4, 2, 6, '5/5/2020'),
	(5, 1, 7.03, '5/6/2020'),
	(6, 2, 6.99, '5/6/2020'),
	(7, 3, 2.8, '5/6/2020'),
	(8, 4, 3.987, '5/6/2020'),
	(9, 5, 23.99, '5/6/2020'),
	(10, 6, 0.01, '5/6/2020'),
	(11, 1, 4, '5/7/2020'),
	(12, 2, 8, '5/7/2020'),
	(13, 3, 7.99, '5/7/2020'),
	(14, 4, 7.998, '5/7/2020'),
	(15, 5, 7.999, '5/7/2020'),
	(16, 6, 7.5, '5/7/2020'),
	(17, 7, 6.4, '5/7/2020'),
	(18, 8, 7.8, '5/7/2020'),
	(19, 9, 24, '5/7/2020'),
	(20, 10, 40, '5/7/2020'),
	(21, 1, 7, '5/8/2020'),
	(22, 2, 7, '5/8/2020'),
	(23, 3, 7, '5/8/2020'),
	(24, 4, 7, '5/8/2020'),
	(25, 5, 6.9, '5/8/2020'),
	(26, 6, 6.9, '5/8/2020'),
	(27, 7, 7.001, '5/8/2020'),
	(28, 8, 6.9, '5/8/2020'),
	(29, 9, 1, '5/8/2020'),
	(30, 10, 6.9, '5/8/2020'),
	(31, 1, 1, '5/11/2020'),
	(32, 2, 2, '5/11/2020'),
	(33, 3, 3, '5/11/2020'),
	(34, 4, 4, '5/11/2020'),
	(35, 5, 5, '5/11/2020'),
	(36, 6, 6, '5/11/2020'),
	(37, 7, 7, '5/11/2020'),
	(38, 8, 8, '5/11/2020'),
	(39, 9, 9, '5/11/2020'),
	(40, 10, 10, '5/11/2020'),
	(41, 1, 10, '5/12/2020'),
	(42, 9, 9, '5/12/2020'),
	(43, 8, 8, '5/12/2020'),
	(44, 7, 7, '5/12/2020'),
	(45, 6, 6, '5/12/2020'),
	(46, 7, 5, '5/12/2020'),
	(47, 8, 2.5, '5/12/2020'),
	(48, 9, 2.4, '5/12/2020'),
	(49, 10, 2.909, '5/12/2020'),
	(50, 1, 1, '5/13/2020'),
	(51, 2, 2, '5/13/2020'),
	(52, 3, 3, '5/13/2020'),
	(53, 4, 4, '5/13/2020'),
	(54, 5, 5, '5/13/2020'),
	(55, 6, 5, '5/13/2020'),
	(56, 7, 4, '5/13/2020'),
	(57, 8, 3, '5/13/2020'),
	(58, 9, 2, '5/13/2020'),
	(59, 10, 1, '5/13/2020');
/*!40000 ALTER TABLE `time_reports` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

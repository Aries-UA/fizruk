-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Хост: localhost
-- Время создания: Окт 09 2012 г., 21:00
-- Версия сервера: 5.5.8
-- Версия PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `php_fizruk`
--

-- --------------------------------------------------------

--
-- Структура таблицы `address`
--

CREATE TABLE IF NOT EXISTS `address` (
  `address_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `company` varchar(32) COLLATE utf8_bin NOT NULL,
  `company_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `tax_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL,
  `postcode` varchar(10) COLLATE utf8_bin NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`address_id`),
  KEY `customer_id` (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `address`
--

INSERT INTO `address` (`address_id`, `customer_id`, `firstname`, `lastname`, `company`, `company_id`, `tax_id`, `address_1`, `address_2`, `city`, `postcode`, `country_id`, `zone_id`) VALUES
(1, 1, 'Aries', 'bcc', '', '', '', 'Kirova st', '', 'Nikolaev', '55555', 220, 3494);

-- --------------------------------------------------------

--
-- Структура таблицы `affiliate`
--

CREATE TABLE IF NOT EXISTS `affiliate` (
  `affiliate_id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '',
  `company` varchar(32) COLLATE utf8_bin NOT NULL,
  `website` varchar(255) COLLATE utf8_bin NOT NULL,
  `address_1` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `city` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `code` varchar(64) COLLATE utf8_bin NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) COLLATE utf8_bin NOT NULL,
  `payment` varchar(6) COLLATE utf8_bin NOT NULL,
  `cheque` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `paypal` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_branch_number` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_swift_code` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_account_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `bank_account_number` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `affiliate`
--


-- --------------------------------------------------------

--
-- Структура таблицы `affiliate_transaction`
--

CREATE TABLE IF NOT EXISTS `affiliate_transaction` (
  `affiliate_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `affiliate_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`affiliate_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `affiliate_transaction`
--


-- --------------------------------------------------------

--
-- Структура таблицы `attribute`
--

CREATE TABLE IF NOT EXISTS `attribute` (
  `attribute_id` int(11) NOT NULL AUTO_INCREMENT,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `attribute`
--

INSERT INTO `attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_description`
--

CREATE TABLE IF NOT EXISTS `attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `attribute_description`
--

INSERT INTO `attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8'),
(3, 1, 'Clockspeed'),
(1, 2, 'Description'),
(2, 2, 'No. of Cores'),
(4, 2, 'test 1'),
(5, 2, 'test 2'),
(6, 2, 'test 3'),
(7, 2, 'test 4'),
(8, 2, 'test 5'),
(9, 2, 'test 6'),
(10, 2, 'test 7'),
(11, 2, 'test 8'),
(3, 2, 'Clockspeed');

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group`
--

CREATE TABLE IF NOT EXISTS `attribute_group` (
  `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`attribute_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `attribute_group`
--

INSERT INTO `attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `attribute_group_description`
--

CREATE TABLE IF NOT EXISTS `attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`attribute_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `attribute_group_description`
--

INSERT INTO `attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor'),
(3, 2, 'Memory'),
(4, 2, 'Technical'),
(5, 2, 'Motherboard'),
(6, 2, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `banner`
--

CREATE TABLE IF NOT EXISTS `banner` (
  `banner_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`banner_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `banner`
--


-- --------------------------------------------------------

--
-- Структура таблицы `banner_image`
--

CREATE TABLE IF NOT EXISTS `banner_image` (
  `banner_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `banner_id` int(11) NOT NULL,
  `link` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=78 ;

--
-- Дамп данных таблицы `banner_image`
--


-- --------------------------------------------------------

--
-- Структура таблицы `banner_image_description`
--

CREATE TABLE IF NOT EXISTS `banner_image_description` (
  `banner_image_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`banner_image_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `banner_image_description`
--


-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`category_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=59 ;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(20, 'data/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(18, 'data/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2012-10-08 22:47:04'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'data/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05');

-- --------------------------------------------------------

--
-- Структура таблицы `category_description`
--

CREATE TABLE IF NOT EXISTS `category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`category_id`,`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `category_description`
--

INSERT INTO `category_description` (`category_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'Monitors', '', '', ''),
(33, 1, 'Cameras', '', '', ''),
(32, 1, 'Web Cameras', '', '', ''),
(31, 1, 'Scanners', '', '', ''),
(30, 1, 'Printers', '', '', ''),
(29, 1, 'Mice and Track', '', '', ''),
(27, 1, 'Mac', '', '', ''),
(26, 1, 'PC', '', '', ''),
(17, 1, 'Software', '', '', ''),
(25, 1, 'Components', '', '', ''),
(24, 1, 'Phones &amp; PDAs', '', '', ''),
(20, 1, 'Desktops', 0x266c743b702667743b0d0a094578616d706c65206f662063617465676f7279206465736372697074696f6e2074657874266c743b2f702667743b0d0a, 'Example of category description', ''),
(35, 1, 'test 1', '', '', ''),
(36, 1, 'test 2', '', '', ''),
(34, 1, 'MP3 Players', 0x266c743b702667743b0d0a0953686f70204c6170746f702066656174757265206f6e6c79207468652062657374206c6170746f70206465616c73206f6e20746865206d61726b65742e20427920636f6d706172696e67206c6170746f70206465616c732066726f6d20746865206c696b6573206f6620504320576f726c642c20436f6d65742c204469786f6e732c20546865204c696e6b20616e642043617270686f6e652057617265686f7573652c2053686f70204c6170746f702068617320746865206d6f737420636f6d70726568656e736976652073656c656374696f6e206f66206c6170746f7073206f6e2074686520696e7465726e65742e2041742053686f70204c6170746f702c207765207072696465206f757273656c766573206f6e206f66666572696e6720637573746f6d6572732074686520766572792062657374206c6170746f70206465616c732e2046726f6d207265667572626973686564206c6170746f707320746f206e6574626f6f6b732c2053686f70204c6170746f7020656e73757265732074686174206576657279206c6170746f70202d20696e20657665727920636f6c6f75722c207374796c652c2073697a6520616e6420746563686e6963616c2073706563202d206973206665617475726564206f6e20746865207369746520617420746865206c6f7765737420706f737369626c652070726963652e266c743b2f702667743b0d0a, '', ''),
(18, 1, 'Laptops &amp; Notebooks', 0x266c743b702667743b0d0a0953686f70204c6170746f702066656174757265206f6e6c79207468652062657374206c6170746f70206465616c73206f6e20746865206d61726b65742e20427920636f6d706172696e67206c6170746f70206465616c732066726f6d20746865206c696b6573206f6620504320576f726c642c20436f6d65742c204469786f6e732c20546865204c696e6b20616e642043617270686f6e652057617265686f7573652c2053686f70204c6170746f702068617320746865206d6f737420636f6d70726568656e736976652073656c656374696f6e206f66206c6170746f7073206f6e2074686520696e7465726e65742e2041742053686f70204c6170746f702c207765207072696465206f757273656c766573206f6e206f66666572696e6720637573746f6d6572732074686520766572792062657374206c6170746f70206465616c732e2046726f6d207265667572626973686564206c6170746f707320746f206e6574626f6f6b732c2053686f70204c6170746f7020656e73757265732074686174206576657279206c6170746f70202d20696e20657665727920636f6c6f75722c207374796c652c2073697a6520616e6420746563686e6963616c2073706563202d206973206665617475726564206f6e20746865207369746520617420746865206c6f7765737420706f737369626c652070726963652e266c743b2f702667743b0d0a, '', ''),
(45, 1, 'Windows', '', '', ''),
(46, 1, 'Macs', '', '', ''),
(57, 1, 'Tablets', '', '', ''),
(28, 2, 'Monitors', '', '', ''),
(33, 2, 'Cameras', '', '', ''),
(32, 2, 'Web Cameras', '', '', ''),
(31, 2, 'Scanners', '', '', ''),
(30, 2, 'Printers', '', '', ''),
(29, 2, 'Mice and Track', '', '', ''),
(27, 2, 'Mac', '', '', ''),
(26, 2, 'PC', '', '', ''),
(17, 2, 'Software', '', '', ''),
(25, 2, 'Components', '', '', ''),
(24, 2, 'Phones &amp; PDAs', '', '', ''),
(20, 2, 'Desktops', 0x266c743b702667743b0d0a094578616d706c65206f662063617465676f7279206465736372697074696f6e2074657874266c743b2f702667743b0d0a, 'Example of category description', ''),
(35, 2, 'test 1', '', '', ''),
(36, 2, 'test 2', '', '', ''),
(34, 2, 'MP3 Players', 0x266c743b702667743b0d0a0953686f70204c6170746f702066656174757265206f6e6c79207468652062657374206c6170746f70206465616c73206f6e20746865206d61726b65742e20427920636f6d706172696e67206c6170746f70206465616c732066726f6d20746865206c696b6573206f6620504320576f726c642c20436f6d65742c204469786f6e732c20546865204c696e6b20616e642043617270686f6e652057617265686f7573652c2053686f70204c6170746f702068617320746865206d6f737420636f6d70726568656e736976652073656c656374696f6e206f66206c6170746f7073206f6e2074686520696e7465726e65742e2041742053686f70204c6170746f702c207765207072696465206f757273656c766573206f6e206f66666572696e6720637573746f6d6572732074686520766572792062657374206c6170746f70206465616c732e2046726f6d207265667572626973686564206c6170746f707320746f206e6574626f6f6b732c2053686f70204c6170746f7020656e73757265732074686174206576657279206c6170746f70202d20696e20657665727920636f6c6f75722c207374796c652c2073697a6520616e6420746563686e6963616c2073706563202d206973206665617475726564206f6e20746865207369746520617420746865206c6f7765737420706f737369626c652070726963652e266c743b2f702667743b0d0a, '', ''),
(18, 2, 'Laptops &amp; Notebooks', 0x266c743b702667743b0d0a0953686f70204c6170746f702066656174757265206f6e6c79207468652062657374206c6170746f70206465616c73206f6e20746865206d61726b65742e20427920636f6d706172696e67206c6170746f70206465616c732066726f6d20746865206c696b6573206f6620504320576f726c642c20436f6d65742c204469786f6e732c20546865204c696e6b20616e642043617270686f6e652057617265686f7573652c2053686f70204c6170746f702068617320746865206d6f737420636f6d70726568656e736976652073656c656374696f6e206f66206c6170746f7073206f6e2074686520696e7465726e65742e2041742053686f70204c6170746f702c207765207072696465206f757273656c766573206f6e206f66666572696e6720637573746f6d6572732074686520766572792062657374206c6170746f70206465616c732e2046726f6d207265667572626973686564206c6170746f707320746f206e6574626f6f6b732c2053686f70204c6170746f7020656e73757265732074686174206576657279206c6170746f70202d20696e20657665727920636f6c6f75722c207374796c652c2073697a6520616e6420746563686e6963616c2073706563202d206973206665617475726564206f6e20746865207369746520617420746865206c6f7765737420706f737369626c652070726963652e266c743b2f702667743b0d0a, '', ''),
(45, 2, 'Windows', '', '', ''),
(46, 2, 'Macs', '', '', ''),
(57, 2, 'Tablets', '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `category_to_layout`
--

CREATE TABLE IF NOT EXISTS `category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `category_to_layout`
--


-- --------------------------------------------------------

--
-- Структура таблицы `category_to_store`
--

CREATE TABLE IF NOT EXISTS `category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`category_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `category_to_store`
--

INSERT INTO `category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(45, 0),
(46, 0),
(57, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `country`
--

CREATE TABLE IF NOT EXISTS `country` (
  `country_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `iso_code_2` varchar(2) COLLATE utf8_bin NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `address_format` text COLLATE utf8_bin NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`country_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=240 ;

--
-- Дамп данных таблицы `country`
--

INSERT INTO `country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format`, `postcode_required`, `status`) VALUES
(1, 'Afghanistan', 'AF', 'AFG', '', 0, 1),
(2, 'Albania', 'AL', 'ALB', '', 0, 1),
(3, 'Algeria', 'DZ', 'DZA', '', 0, 1),
(4, 'American Samoa', 'AS', 'ASM', '', 0, 1),
(5, 'Andorra', 'AD', 'AND', '', 0, 1),
(6, 'Angola', 'AO', 'AGO', '', 0, 1),
(7, 'Anguilla', 'AI', 'AIA', '', 0, 1),
(8, 'Antarctica', 'AQ', 'ATA', '', 0, 1),
(9, 'Antigua and Barbuda', 'AG', 'ATG', '', 0, 1),
(10, 'Argentina', 'AR', 'ARG', '', 0, 1),
(11, 'Armenia', 'AM', 'ARM', '', 0, 1),
(12, 'Aruba', 'AW', 'ABW', '', 0, 1),
(13, 'Australia', 'AU', 'AUS', '', 0, 1),
(14, 'Austria', 'AT', 'AUT', '', 0, 1),
(15, 'Azerbaijan', 'AZ', 'AZE', '', 0, 1),
(16, 'Bahamas', 'BS', 'BHS', '', 0, 1),
(17, 'Bahrain', 'BH', 'BHR', '', 0, 1),
(18, 'Bangladesh', 'BD', 'BGD', '', 0, 1),
(19, 'Barbados', 'BB', 'BRB', '', 0, 1),
(20, 'Belarus', 'BY', 'BLR', '', 0, 1),
(21, 'Belgium', 'BE', 'BEL', '', 0, 1),
(22, 'Belize', 'BZ', 'BLZ', '', 0, 1),
(23, 'Benin', 'BJ', 'BEN', '', 0, 1),
(24, 'Bermuda', 'BM', 'BMU', '', 0, 1),
(25, 'Bhutan', 'BT', 'BTN', '', 0, 1),
(26, 'Bolivia', 'BO', 'BOL', '', 0, 1),
(27, 'Bosnia and Herzegowina', 'BA', 'BIH', '', 0, 1),
(28, 'Botswana', 'BW', 'BWA', '', 0, 1),
(29, 'Bouvet Island', 'BV', 'BVT', '', 0, 1),
(30, 'Brazil', 'BR', 'BRA', '', 0, 1),
(31, 'British Indian Ocean Territory', 'IO', 'IOT', '', 0, 1),
(32, 'Brunei Darussalam', 'BN', 'BRN', '', 0, 1),
(33, 'Bulgaria', 'BG', 'BGR', '', 0, 1),
(34, 'Burkina Faso', 'BF', 'BFA', '', 0, 1),
(35, 'Burundi', 'BI', 'BDI', '', 0, 1),
(36, 'Cambodia', 'KH', 'KHM', '', 0, 1),
(37, 'Cameroon', 'CM', 'CMR', '', 0, 1),
(38, 'Canada', 'CA', 'CAN', '', 0, 1),
(39, 'Cape Verde', 'CV', 'CPV', '', 0, 1),
(40, 'Cayman Islands', 'KY', 'CYM', '', 0, 1),
(41, 'Central African Republic', 'CF', 'CAF', '', 0, 1),
(42, 'Chad', 'TD', 'TCD', '', 0, 1),
(43, 'Chile', 'CL', 'CHL', '', 0, 1),
(44, 'China', 'CN', 'CHN', '', 0, 1),
(45, 'Christmas Island', 'CX', 'CXR', '', 0, 1),
(46, 'Cocos (Keeling) Islands', 'CC', 'CCK', '', 0, 1),
(47, 'Colombia', 'CO', 'COL', '', 0, 1),
(48, 'Comoros', 'KM', 'COM', '', 0, 1),
(49, 'Congo', 'CG', 'COG', '', 0, 1),
(50, 'Cook Islands', 'CK', 'COK', '', 0, 1),
(51, 'Costa Rica', 'CR', 'CRI', '', 0, 1),
(52, 'Cote D''Ivoire', 'CI', 'CIV', '', 0, 1),
(53, 'Croatia', 'HR', 'HRV', '', 0, 1),
(54, 'Cuba', 'CU', 'CUB', '', 0, 1),
(55, 'Cyprus', 'CY', 'CYP', '', 0, 1),
(56, 'Czech Republic', 'CZ', 'CZE', '', 0, 1),
(57, 'Denmark', 'DK', 'DNK', '', 0, 1),
(58, 'Djibouti', 'DJ', 'DJI', '', 0, 1),
(59, 'Dominica', 'DM', 'DMA', '', 0, 1),
(60, 'Dominican Republic', 'DO', 'DOM', '', 0, 1),
(61, 'East Timor', 'TP', 'TMP', '', 0, 1),
(62, 'Ecuador', 'EC', 'ECU', '', 0, 1),
(63, 'Egypt', 'EG', 'EGY', '', 0, 1),
(64, 'El Salvador', 'SV', 'SLV', '', 0, 1),
(65, 'Equatorial Guinea', 'GQ', 'GNQ', '', 0, 1),
(66, 'Eritrea', 'ER', 'ERI', '', 0, 1),
(67, 'Estonia', 'EE', 'EST', '', 0, 1),
(68, 'Ethiopia', 'ET', 'ETH', '', 0, 1),
(69, 'Falkland Islands (Malvinas)', 'FK', 'FLK', '', 0, 1),
(70, 'Faroe Islands', 'FO', 'FRO', '', 0, 1),
(71, 'Fiji', 'FJ', 'FJI', '', 0, 1),
(72, 'Finland', 'FI', 'FIN', '', 0, 1),
(73, 'France', 'FR', 'FRA', '', 0, 1),
(74, 'France, Metropolitan', 'FX', 'FXX', '', 0, 1),
(75, 'French Guiana', 'GF', 'GUF', '', 0, 1),
(76, 'French Polynesia', 'PF', 'PYF', '', 0, 1),
(77, 'French Southern Territories', 'TF', 'ATF', '', 0, 1),
(78, 'Gabon', 'GA', 'GAB', '', 0, 1),
(79, 'Gambia', 'GM', 'GMB', '', 0, 1),
(80, 'Georgia', 'GE', 'GEO', '', 0, 1),
(81, 'Germany', 'DE', 'DEU', 0x7b636f6d70616e797d0d0a7b66697273746e616d657d207b6c6173746e616d657d0d0a7b616464726573735f317d0d0a7b616464726573735f327d0d0a7b706f7374636f64657d207b636974797d0d0a7b636f756e7472797d, 1, 1),
(82, 'Ghana', 'GH', 'GHA', '', 0, 1),
(83, 'Gibraltar', 'GI', 'GIB', '', 0, 1),
(84, 'Greece', 'GR', 'GRC', '', 0, 1),
(85, 'Greenland', 'GL', 'GRL', '', 0, 1),
(86, 'Grenada', 'GD', 'GRD', '', 0, 1),
(87, 'Guadeloupe', 'GP', 'GLP', '', 0, 1),
(88, 'Guam', 'GU', 'GUM', '', 0, 1),
(89, 'Guatemala', 'GT', 'GTM', '', 0, 1),
(90, 'Guinea', 'GN', 'GIN', '', 0, 1),
(91, 'Guinea-bissau', 'GW', 'GNB', '', 0, 1),
(92, 'Guyana', 'GY', 'GUY', '', 0, 1),
(93, 'Haiti', 'HT', 'HTI', '', 0, 1),
(94, 'Heard and Mc Donald Islands', 'HM', 'HMD', '', 0, 1),
(95, 'Honduras', 'HN', 'HND', '', 0, 1),
(96, 'Hong Kong', 'HK', 'HKG', '', 0, 1),
(97, 'Hungary', 'HU', 'HUN', '', 0, 1),
(98, 'Iceland', 'IS', 'ISL', '', 0, 1),
(99, 'India', 'IN', 'IND', '', 0, 1),
(100, 'Indonesia', 'ID', 'IDN', '', 0, 1),
(101, 'Iran (Islamic Republic of)', 'IR', 'IRN', '', 0, 1),
(102, 'Iraq', 'IQ', 'IRQ', '', 0, 1),
(103, 'Ireland', 'IE', 'IRL', '', 0, 1),
(104, 'Israel', 'IL', 'ISR', '', 0, 1),
(105, 'Italy', 'IT', 'ITA', '', 0, 1),
(106, 'Jamaica', 'JM', 'JAM', '', 0, 1),
(107, 'Japan', 'JP', 'JPN', '', 0, 1),
(108, 'Jordan', 'JO', 'JOR', '', 0, 1),
(109, 'Kazakhstan', 'KZ', 'KAZ', '', 0, 1),
(110, 'Kenya', 'KE', 'KEN', '', 0, 1),
(111, 'Kiribati', 'KI', 'KIR', '', 0, 1),
(112, 'North Korea', 'KP', 'PRK', '', 0, 1),
(113, 'Korea, Republic of', 'KR', 'KOR', '', 0, 1),
(114, 'Kuwait', 'KW', 'KWT', '', 0, 1),
(115, 'Kyrgyzstan', 'KG', 'KGZ', '', 0, 1),
(116, 'Lao People''s Democratic Republic', 'LA', 'LAO', '', 0, 1),
(117, 'Latvia', 'LV', 'LVA', '', 0, 1),
(118, 'Lebanon', 'LB', 'LBN', '', 0, 1),
(119, 'Lesotho', 'LS', 'LSO', '', 0, 1),
(120, 'Liberia', 'LR', 'LBR', '', 0, 1),
(121, 'Libyan Arab Jamahiriya', 'LY', 'LBY', '', 0, 1),
(122, 'Liechtenstein', 'LI', 'LIE', '', 0, 1),
(123, 'Lithuania', 'LT', 'LTU', '', 0, 1),
(124, 'Luxembourg', 'LU', 'LUX', '', 0, 1),
(125, 'Macau', 'MO', 'MAC', '', 0, 1),
(126, 'FYROM', 'MK', 'MKD', '', 0, 1),
(127, 'Madagascar', 'MG', 'MDG', '', 0, 1),
(128, 'Malawi', 'MW', 'MWI', '', 0, 1),
(129, 'Malaysia', 'MY', 'MYS', '', 0, 1),
(130, 'Maldives', 'MV', 'MDV', '', 0, 1),
(131, 'Mali', 'ML', 'MLI', '', 0, 1),
(132, 'Malta', 'MT', 'MLT', '', 0, 1),
(133, 'Marshall Islands', 'MH', 'MHL', '', 0, 1),
(134, 'Martinique', 'MQ', 'MTQ', '', 0, 1),
(135, 'Mauritania', 'MR', 'MRT', '', 0, 1),
(136, 'Mauritius', 'MU', 'MUS', '', 0, 1),
(137, 'Mayotte', 'YT', 'MYT', '', 0, 1),
(138, 'Mexico', 'MX', 'MEX', '', 0, 1),
(139, 'Micronesia, Federated States of', 'FM', 'FSM', '', 0, 1),
(140, 'Moldova, Republic of', 'MD', 'MDA', '', 0, 1),
(141, 'Monaco', 'MC', 'MCO', '', 0, 1),
(142, 'Mongolia', 'MN', 'MNG', '', 0, 1),
(143, 'Montserrat', 'MS', 'MSR', '', 0, 1),
(144, 'Morocco', 'MA', 'MAR', '', 0, 1),
(145, 'Mozambique', 'MZ', 'MOZ', '', 0, 1),
(146, 'Myanmar', 'MM', 'MMR', '', 0, 1),
(147, 'Namibia', 'NA', 'NAM', '', 0, 1),
(148, 'Nauru', 'NR', 'NRU', '', 0, 1),
(149, 'Nepal', 'NP', 'NPL', '', 0, 1),
(150, 'Netherlands', 'NL', 'NLD', '', 0, 1),
(151, 'Netherlands Antilles', 'AN', 'ANT', '', 0, 1),
(152, 'New Caledonia', 'NC', 'NCL', '', 0, 1),
(153, 'New Zealand', 'NZ', 'NZL', '', 0, 1),
(154, 'Nicaragua', 'NI', 'NIC', '', 0, 1),
(155, 'Niger', 'NE', 'NER', '', 0, 1),
(156, 'Nigeria', 'NG', 'NGA', '', 0, 1),
(157, 'Niue', 'NU', 'NIU', '', 0, 1),
(158, 'Norfolk Island', 'NF', 'NFK', '', 0, 1),
(159, 'Northern Mariana Islands', 'MP', 'MNP', '', 0, 1),
(160, 'Norway', 'NO', 'NOR', '', 0, 1),
(161, 'Oman', 'OM', 'OMN', '', 0, 1),
(162, 'Pakistan', 'PK', 'PAK', '', 0, 1),
(163, 'Palau', 'PW', 'PLW', '', 0, 1),
(164, 'Panama', 'PA', 'PAN', '', 0, 1),
(165, 'Papua New Guinea', 'PG', 'PNG', '', 0, 1),
(166, 'Paraguay', 'PY', 'PRY', '', 0, 1),
(167, 'Peru', 'PE', 'PER', '', 0, 1),
(168, 'Philippines', 'PH', 'PHL', '', 0, 1),
(169, 'Pitcairn', 'PN', 'PCN', '', 0, 1),
(170, 'Poland', 'PL', 'POL', '', 0, 1),
(171, 'Portugal', 'PT', 'PRT', '', 0, 1),
(172, 'Puerto Rico', 'PR', 'PRI', '', 0, 1),
(173, 'Qatar', 'QA', 'QAT', '', 0, 1),
(174, 'Reunion', 'RE', 'REU', '', 0, 1),
(175, 'Romania', 'RO', 'ROM', '', 0, 1),
(176, 'Russian Federation', 'RU', 'RUS', '', 0, 1),
(177, 'Rwanda', 'RW', 'RWA', '', 0, 1),
(178, 'Saint Kitts and Nevis', 'KN', 'KNA', '', 0, 1),
(179, 'Saint Lucia', 'LC', 'LCA', '', 0, 1),
(180, 'Saint Vincent and the Grenadines', 'VC', 'VCT', '', 0, 1),
(181, 'Samoa', 'WS', 'WSM', '', 0, 1),
(182, 'San Marino', 'SM', 'SMR', '', 0, 1),
(183, 'Sao Tome and Principe', 'ST', 'STP', '', 0, 1),
(184, 'Saudi Arabia', 'SA', 'SAU', '', 0, 1),
(185, 'Senegal', 'SN', 'SEN', '', 0, 1),
(186, 'Seychelles', 'SC', 'SYC', '', 0, 1),
(187, 'Sierra Leone', 'SL', 'SLE', '', 0, 1),
(188, 'Singapore', 'SG', 'SGP', '', 0, 1),
(189, 'Slovak Republic', 'SK', 'SVK', 0x7b66697273746e616d657d207b6c6173746e616d657d0d0a7b636f6d70616e797d0d0a7b616464726573735f317d0d0a7b616464726573735f327d0d0a7b636974797d207b706f7374636f64657d0d0a7b7a6f6e657d0d0a7b636f756e7472797d, 0, 1),
(190, 'Slovenia', 'SI', 'SVN', '', 0, 1),
(191, 'Solomon Islands', 'SB', 'SLB', '', 0, 1),
(192, 'Somalia', 'SO', 'SOM', '', 0, 1),
(193, 'South Africa', 'ZA', 'ZAF', '', 0, 1),
(194, 'South Georgia &amp; South Sandwich Islands', 'GS', 'SGS', '', 0, 1),
(195, 'Spain', 'ES', 'ESP', '', 0, 1),
(196, 'Sri Lanka', 'LK', 'LKA', '', 0, 1),
(197, 'St. Helena', 'SH', 'SHN', '', 0, 1),
(198, 'St. Pierre and Miquelon', 'PM', 'SPM', '', 0, 1),
(199, 'Sudan', 'SD', 'SDN', '', 0, 1),
(200, 'Suriname', 'SR', 'SUR', '', 0, 1),
(201, 'Svalbard and Jan Mayen Islands', 'SJ', 'SJM', '', 0, 1),
(202, 'Swaziland', 'SZ', 'SWZ', '', 0, 1),
(203, 'Sweden', 'SE', 'SWE', '', 0, 1),
(204, 'Switzerland', 'CH', 'CHE', '', 0, 1),
(205, 'Syrian Arab Republic', 'SY', 'SYR', '', 0, 1),
(206, 'Taiwan', 'TW', 'TWN', '', 0, 1),
(207, 'Tajikistan', 'TJ', 'TJK', '', 0, 1),
(208, 'Tanzania, United Republic of', 'TZ', 'TZA', '', 0, 1),
(209, 'Thailand', 'TH', 'THA', '', 0, 1),
(210, 'Togo', 'TG', 'TGO', '', 0, 1),
(211, 'Tokelau', 'TK', 'TKL', '', 0, 1),
(212, 'Tonga', 'TO', 'TON', '', 0, 1),
(213, 'Trinidad and Tobago', 'TT', 'TTO', '', 0, 1),
(214, 'Tunisia', 'TN', 'TUN', '', 0, 1),
(215, 'Turkey', 'TR', 'TUR', '', 0, 1),
(216, 'Turkmenistan', 'TM', 'TKM', '', 0, 1),
(217, 'Turks and Caicos Islands', 'TC', 'TCA', '', 0, 1),
(218, 'Tuvalu', 'TV', 'TUV', '', 0, 1),
(219, 'Uganda', 'UG', 'UGA', '', 0, 1),
(220, 'Ukraine', 'UA', 'UKR', '', 0, 1),
(221, 'United Arab Emirates', 'AE', 'ARE', '', 0, 1),
(222, 'United Kingdom', 'GB', 'GBR', '', 1, 1),
(223, 'United States', 'US', 'USA', 0x7b66697273746e616d657d207b6c6173746e616d657d0d0a7b636f6d70616e797d0d0a7b616464726573735f317d0d0a7b616464726573735f327d0d0a7b636974797d2c207b7a6f6e657d207b706f7374636f64657d0d0a7b636f756e7472797d, 0, 1),
(224, 'United States Minor Outlying Islands', 'UM', 'UMI', '', 0, 1),
(225, 'Uruguay', 'UY', 'URY', '', 0, 1),
(226, 'Uzbekistan', 'UZ', 'UZB', '', 0, 1),
(227, 'Vanuatu', 'VU', 'VUT', '', 0, 1),
(228, 'Vatican City State (Holy See)', 'VA', 'VAT', '', 0, 1),
(229, 'Venezuela', 'VE', 'VEN', '', 0, 1),
(230, 'Viet Nam', 'VN', 'VNM', '', 0, 1),
(231, 'Virgin Islands (British)', 'VG', 'VGB', '', 0, 1),
(232, 'Virgin Islands (U.S.)', 'VI', 'VIR', '', 0, 1),
(233, 'Wallis and Futuna Islands', 'WF', 'WLF', '', 0, 1),
(234, 'Western Sahara', 'EH', 'ESH', '', 0, 1),
(235, 'Yemen', 'YE', 'YEM', '', 0, 1),
(236, 'Yugoslavia', 'YU', 'YUG', '', 0, 1),
(237, 'Democratic Republic of Congo', 'CD', 'COD', '', 0, 1),
(238, 'Zambia', 'ZM', 'ZMB', '', 0, 1),
(239, 'Zimbabwe', 'ZW', 'ZWE', '', 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `coupon`
--

CREATE TABLE IF NOT EXISTS `coupon` (
  `coupon_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `type` char(1) COLLATE utf8_bin NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  `uses_total` int(11) NOT NULL,
  `uses_customer` varchar(11) COLLATE utf8_bin NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`coupon_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `coupon`
--

INSERT INTO `coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2011-01-01', '2012-01-01', 10, '10', 1, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2009-03-01', '2009-08-31', 10, '10', 1, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '1970-11-01', '2020-11-01', 100000, '10000', 1, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `coupon_history`
--

CREATE TABLE IF NOT EXISTS `coupon_history` (
  `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`coupon_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `coupon_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `coupon_product`
--

CREATE TABLE IF NOT EXISTS `coupon_product` (
  `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`coupon_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `coupon_product`
--


-- --------------------------------------------------------

--
-- Структура таблицы `currency`
--

CREATE TABLE IF NOT EXISTS `currency` (
  `currency_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  `symbol_left` varchar(12) COLLATE utf8_bin NOT NULL,
  `symbol_right` varchar(12) COLLATE utf8_bin NOT NULL,
  `decimal_place` char(1) COLLATE utf8_bin NOT NULL,
  `value` float(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`currency_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `currency`
--

INSERT INTO `currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(2, 'US Dollar', 'USD', '$', '', '2', 8.11999989, 1, '2012-10-08 21:45:56'),
(4, 'Гривня', 'uah', '', 'грн', '2', 1.00000000, 1, '2012-10-09 19:46:59');

-- --------------------------------------------------------

--
-- Структура таблицы `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '',
  `cart` text COLLATE utf8_bin,
  `wishlist` text COLLATE utf8_bin,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `address_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `approved` tinyint(1) NOT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `customer`
--

INSERT INTO `customer` (`customer_id`, `store_id`, `firstname`, `lastname`, `email`, `telephone`, `fax`, `password`, `salt`, `cart`, `wishlist`, `newsletter`, `address_id`, `customer_group_id`, `ip`, `status`, `approved`, `token`, `date_added`) VALUES
(1, 0, 'Aries', 'bcc', 'aries.forum@gmail.com', '1234567890', '', '2a24b225ac9c3f680d3dba88af3b268608aa9bc4', '4f6800dd0', 0x613a303a7b7d, 0x613a303a7b7d, 0, 1, 1, '127.0.0.1', 1, 1, '', '2012-10-08 21:24:09');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_group`
--

CREATE TABLE IF NOT EXISTS `customer_group` (
  `customer_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `approval` int(1) NOT NULL,
  `company_id_display` int(1) NOT NULL,
  `company_id_required` int(1) NOT NULL,
  `tax_id_display` int(1) NOT NULL,
  `tax_id_required` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`customer_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `customer_group`
--

INSERT INTO `customer_group` (`customer_group_id`, `approval`, `company_id_display`, `company_id_required`, `tax_id_display`, `tax_id_required`, `sort_order`) VALUES
(1, 0, 1, 0, 0, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `customer_group_description`
--

CREATE TABLE IF NOT EXISTS `customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`customer_group_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `customer_group_description`
--

INSERT INTO `customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 0x74657374),
(1, 2, 'Default', 0x74657374);

-- --------------------------------------------------------

--
-- Структура таблицы `customer_ip`
--

CREATE TABLE IF NOT EXISTS `customer_ip` (
  `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_ip_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `customer_ip`
--

INSERT INTO `customer_ip` (`customer_ip_id`, `customer_id`, `ip`, `date_added`) VALUES
(1, 1, '127.0.0.1', '2012-10-08 21:24:10');

-- --------------------------------------------------------

--
-- Структура таблицы `customer_ip_blacklist`
--

CREATE TABLE IF NOT EXISTS `customer_ip_blacklist` (
  `customer_ip_blacklist_id` int(11) NOT NULL AUTO_INCREMENT,
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`customer_ip_blacklist_id`),
  KEY `ip` (`ip`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `customer_ip_blacklist`
--


-- --------------------------------------------------------

--
-- Структура таблицы `customer_online`
--

CREATE TABLE IF NOT EXISTS `customer_online` (
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text COLLATE utf8_bin NOT NULL,
  `referer` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `customer_online`
--


-- --------------------------------------------------------

--
-- Структура таблицы `customer_reward`
--

CREATE TABLE IF NOT EXISTS `customer_reward` (
  `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_bin NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`customer_reward_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `customer_reward`
--


-- --------------------------------------------------------

--
-- Структура таблицы `customer_transaction`
--

CREATE TABLE IF NOT EXISTS `customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`customer_transaction_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `customer_transaction`
--


-- --------------------------------------------------------

--
-- Структура таблицы `download`
--

CREATE TABLE IF NOT EXISTS `download` (
  `download_id` int(11) NOT NULL AUTO_INCREMENT,
  `filename` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mask` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `remaining` int(11) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `download`
--


-- --------------------------------------------------------

--
-- Структура таблицы `download_description`
--

CREATE TABLE IF NOT EXISTS `download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`download_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `download_description`
--


-- --------------------------------------------------------

--
-- Структура таблицы `extension`
--

CREATE TABLE IF NOT EXISTS `extension` (
  `extension_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`extension_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=432 ;

--
-- Дамп данных таблицы `extension`
--

INSERT INTO `extension` (`extension_id`, `type`, `code`) VALUES
(23, 'payment', 'cod'),
(22, 'total', 'shipping'),
(57, 'total', 'sub_total'),
(58, 'total', 'tax'),
(59, 'total', 'total'),
(410, 'module', 'banner'),
(426, 'module', 'carousel'),
(390, 'total', 'credit'),
(387, 'shipping', 'flat'),
(349, 'total', 'handling'),
(350, 'total', 'low_order_fee'),
(389, 'total', 'coupon'),
(413, 'module', 'category'),
(411, 'module', 'affiliate'),
(408, 'module', 'account'),
(393, 'total', 'reward'),
(398, 'total', 'voucher'),
(407, 'payment', 'free_checkout'),
(427, 'module', 'featured');

-- --------------------------------------------------------

--
-- Структура таблицы `geo_zone`
--

CREATE TABLE IF NOT EXISTS `geo_zone` (
  `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=5 ;

--
-- Дамп данных таблицы `geo_zone`
--

INSERT INTO `geo_zone` (`geo_zone_id`, `name`, `description`, `date_modified`, `date_added`) VALUES
(3, 'UK VAT Zone', 'UK VAT', '2010-02-26 22:33:24', '2009-01-06 23:26:25'),
(4, 'UK Shipping', 'UK Shipping Zones', '2010-12-15 15:18:13', '2009-06-23 01:14:53');

-- --------------------------------------------------------

--
-- Структура таблицы `information`
--

CREATE TABLE IF NOT EXISTS `information` (
  `information_id` int(11) NOT NULL AUTO_INCREMENT,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`information_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `information`
--

INSERT INTO `information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(3, 1, 3, 1),
(4, 1, 1, 1),
(5, 1, 4, 1),
(6, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `information_description`
--

CREATE TABLE IF NOT EXISTS `information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`information_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `information_description`
--

INSERT INTO `information_description` (`information_id`, `language_id`, `title`, `description`) VALUES
(4, 1, 'About Us', 0x266c743b702667743b0d0a0941626f7574205573266c743b2f702667743b0d0a),
(5, 1, 'Terms &amp; Conditions', 0x266c743b702667743b0d0a095465726d732026616d703b616d703b20436f6e646974696f6e73266c743b2f702667743b0d0a),
(3, 1, 'Privacy Policy', 0x266c743b702667743b0d0a095072697661637920506f6c696379266c743b2f702667743b0d0a),
(6, 1, 'Delivery Information', 0x266c743b702667743b0d0a0944656c697665727920496e666f726d6174696f6e266c743b2f702667743b0d0a),
(4, 2, 'About Us', 0x266c743b702667743b0d0a0941626f7574205573266c743b2f702667743b0d0a),
(5, 2, 'Terms &amp; Conditions', 0x266c743b702667743b0d0a095465726d732026616d703b616d703b20436f6e646974696f6e73266c743b2f702667743b0d0a),
(3, 2, 'Privacy Policy', 0x266c743b702667743b0d0a095072697661637920506f6c696379266c743b2f702667743b0d0a),
(6, 2, 'Delivery Information', 0x266c743b702667743b0d0a0944656c697665727920496e666f726d6174696f6e266c743b2f702667743b0d0a);

-- --------------------------------------------------------

--
-- Структура таблицы `information_to_layout`
--

CREATE TABLE IF NOT EXISTS `information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `information_to_layout`
--


-- --------------------------------------------------------

--
-- Структура таблицы `information_to_store`
--

CREATE TABLE IF NOT EXISTS `information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`information_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `information_to_store`
--

INSERT INTO `information_to_store` (`information_id`, `store_id`) VALUES
(3, 0),
(4, 0),
(5, 0),
(6, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `language`
--

CREATE TABLE IF NOT EXISTS `language` (
  `language_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(5) COLLATE utf8_bin NOT NULL,
  `locale` varchar(255) COLLATE utf8_bin NOT NULL,
  `image` varchar(64) COLLATE utf8_bin NOT NULL,
  `directory` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filename` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`language_id`),
  KEY `name` (`name`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `language`
--

INSERT INTO `language` (`language_id`, `name`, `code`, `locale`, `image`, `directory`, `filename`, `sort_order`, `status`) VALUES
(1, 'English', 'en', 'en_US.UTF-8,en_US,en-gb,english', 'gb.png', 'english', 'english', 1, 1),
(2, 'Русский', 'ru', 'ru,ru_RU,ru_RU.UTF-8', 'ru.png', 'russian', 'russian', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `layout`
--

CREATE TABLE IF NOT EXISTS `layout` (
  `layout_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`layout_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=12 ;

--
-- Дамп данных таблицы `layout`
--

INSERT INTO `layout` (`layout_id`, `name`) VALUES
(1, 'Home'),
(2, 'Product'),
(3, 'Category'),
(4, 'Default'),
(5, 'Manufacturer'),
(6, 'Account'),
(7, 'Checkout'),
(8, 'Contact'),
(9, 'Sitemap'),
(10, 'Affiliate'),
(11, 'Information');

-- --------------------------------------------------------

--
-- Структура таблицы `layout_route`
--

CREATE TABLE IF NOT EXISTS `layout_route` (
  `layout_route_id` int(11) NOT NULL AUTO_INCREMENT,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`layout_route_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=32 ;

--
-- Дамп данных таблицы `layout_route`
--

INSERT INTO `layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(30, 6, 0, 'account'),
(17, 10, 0, 'affiliate/'),
(29, 3, 0, 'product/category'),
(26, 1, 0, 'common/home'),
(20, 2, 0, 'product/product'),
(24, 11, 0, 'information/information'),
(22, 5, 0, 'product/manufacturer'),
(23, 7, 0, 'checkout/'),
(31, 8, 0, 'information/contact');

-- --------------------------------------------------------

--
-- Структура таблицы `length_class`
--

CREATE TABLE IF NOT EXISTS `length_class` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL,
  PRIMARY KEY (`length_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `length_class`
--

INSERT INTO `length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Структура таблицы `length_class_description`
--

CREATE TABLE IF NOT EXISTS `length_class_description` (
  `length_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `unit` varchar(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`length_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `length_class_description`
--

INSERT INTO `length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Centimeter', 'cm'),
(2, 1, 'Millimeter', 'mm'),
(3, 1, 'Inch', 'in'),
(1, 2, 'Centimeter', 'cm'),
(2, 2, 'Millimeter', 'mm'),
(3, 2, 'Inch', 'in');

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`manufacturer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'data/demo/htc_logo.jpg', 0),
(6, 'Palm', 'data/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'data/demo/hp_logo.jpg', 0),
(8, 'Apple', 'data/demo/apple_logo.jpg', 0),
(9, 'Canon', 'data/demo/canon_logo.jpg', 0),
(10, 'Sony', 'data/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `manufacturer_to_store`
--

CREATE TABLE IF NOT EXISTS `manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`manufacturer_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `manufacturer_to_store`
--

INSERT INTO `manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `option`
--

CREATE TABLE IF NOT EXISTS `option` (
  `option_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=13 ;

--
-- Дамп данных таблицы `option`
--

INSERT INTO `option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 2),
(2, 'checkbox', 3),
(4, 'text', 4),
(5, 'select', 1),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 1),
(12, 'date', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `option_description`
--

CREATE TABLE IF NOT EXISTS `option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`option_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `option_description`
--

INSERT INTO `option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(6, 1, 'Textarea'),
(8, 1, 'Date'),
(7, 1, 'File'),
(5, 1, 'Select'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(12, 1, 'Delivery Date'),
(11, 1, 'Size'),
(1, 2, 'Radio'),
(2, 2, 'Checkbox'),
(4, 2, 'Text'),
(6, 2, 'Textarea'),
(8, 2, 'Date'),
(7, 2, 'File'),
(5, 2, 'Select'),
(9, 2, 'Time'),
(10, 2, 'Date &amp; Time'),
(12, 2, 'Delivery Date'),
(11, 2, 'Size');

-- --------------------------------------------------------

--
-- Структура таблицы `option_value`
--

CREATE TABLE IF NOT EXISTS `option_value` (
  `option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=49 ;

--
-- Дамп данных таблицы `option_value`
--

INSERT INTO `option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(43, 1, '', 3),
(32, 1, '', 1),
(45, 2, '', 4),
(44, 2, '', 3),
(42, 5, '', 4),
(41, 5, '', 3),
(39, 5, '', 1),
(40, 5, '', 2),
(31, 1, '', 2),
(23, 2, '', 1),
(24, 2, '', 2),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `option_value_description`
--

CREATE TABLE IF NOT EXISTS `option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`option_value_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `option_value_description`
--

INSERT INTO `option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(43, 1, 1, 'Large'),
(32, 1, 1, 'Small'),
(45, 1, 2, 'Checkbox 4'),
(44, 1, 2, 'Checkbox 3'),
(31, 1, 1, 'Medium'),
(42, 1, 5, 'Yellow'),
(41, 1, 5, 'Green'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(48, 1, 11, 'Large'),
(47, 1, 11, 'Medium'),
(46, 1, 11, 'Small'),
(43, 2, 1, 'Large'),
(32, 2, 1, 'Small'),
(45, 2, 2, 'Checkbox 4'),
(44, 2, 2, 'Checkbox 3'),
(31, 2, 1, 'Medium'),
(42, 2, 5, 'Yellow'),
(41, 2, 5, 'Green'),
(39, 2, 5, 'Red'),
(40, 2, 5, 'Blue'),
(23, 2, 2, 'Checkbox 1'),
(24, 2, 2, 'Checkbox 2'),
(48, 2, 11, 'Large'),
(47, 2, 11, 'Medium'),
(46, 2, 11, 'Small');

-- --------------------------------------------------------

--
-- Структура таблицы `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) COLLATE utf8_bin NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `store_url` varchar(255) COLLATE utf8_bin NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `fax` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_company` varchar(32) COLLATE utf8_bin NOT NULL,
  `payment_company_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `payment_tax_id` varchar(32) COLLATE utf8_bin NOT NULL,
  `payment_address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_city` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_country` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) COLLATE utf8_bin NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text COLLATE utf8_bin NOT NULL,
  `payment_method` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `payment_code` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_firstname` varchar(32) COLLATE utf8_bin NOT NULL,
  `shipping_lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_company` varchar(32) COLLATE utf8_bin NOT NULL,
  `shipping_address_1` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_address_2` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_city` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_postcode` varchar(10) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_country` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) COLLATE utf8_bin NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text COLLATE utf8_bin NOT NULL,
  `shipping_method` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `shipping_code` varchar(128) COLLATE utf8_bin NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) COLLATE utf8_bin NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `forwarded_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `user_agent` varchar(255) COLLATE utf8_bin NOT NULL,
  `accept_language` varchar(255) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_download`
--

CREATE TABLE IF NOT EXISTS `order_download` (
  `order_download_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `filename` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `mask` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  `remaining` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`order_download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_download`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_fraud`
--

CREATE TABLE IF NOT EXISTS `order_fraud` (
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `country_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `country_code` varchar(2) COLLATE utf8_bin NOT NULL,
  `high_risk_country` varchar(3) COLLATE utf8_bin NOT NULL,
  `distance` int(11) NOT NULL,
  `ip_region` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_city` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_latitude` decimal(10,6) NOT NULL,
  `ip_longitude` decimal(10,6) NOT NULL,
  `ip_isp` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_org` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_asnum` int(11) NOT NULL,
  `ip_user_type` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_country_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_region_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_city_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_postal_confidence` varchar(3) COLLATE utf8_bin NOT NULL,
  `ip_postal_code` varchar(10) COLLATE utf8_bin NOT NULL,
  `ip_accuracy_radius` int(11) NOT NULL,
  `ip_net_speed_cell` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_metro_code` int(3) NOT NULL,
  `ip_area_code` int(3) NOT NULL,
  `ip_time_zone` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_region_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_domain` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_country_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `ip_continent_code` varchar(2) COLLATE utf8_bin NOT NULL,
  `ip_corporate_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `anonymous_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `proxy_score` int(3) NOT NULL,
  `is_trans_proxy` varchar(3) COLLATE utf8_bin NOT NULL,
  `free_mail` varchar(3) COLLATE utf8_bin NOT NULL,
  `carder_email` varchar(3) COLLATE utf8_bin NOT NULL,
  `high_risk_username` varchar(3) COLLATE utf8_bin NOT NULL,
  `high_risk_password` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_match` varchar(10) COLLATE utf8_bin NOT NULL,
  `bin_country` varchar(2) COLLATE utf8_bin NOT NULL,
  `bin_name_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_name` varchar(255) COLLATE utf8_bin NOT NULL,
  `bin_phone_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `bin_phone` varchar(32) COLLATE utf8_bin NOT NULL,
  `customer_phone_in_billing_location` varchar(8) COLLATE utf8_bin NOT NULL,
  `ship_forward` varchar(3) COLLATE utf8_bin NOT NULL,
  `city_postal_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `ship_city_postal_match` varchar(3) COLLATE utf8_bin NOT NULL,
  `score` decimal(10,5) NOT NULL,
  `explanation` text COLLATE utf8_bin NOT NULL,
  `risk_score` decimal(10,5) NOT NULL,
  `queries_remaining` int(11) NOT NULL,
  `maxmind_id` varchar(8) COLLATE utf8_bin NOT NULL,
  `error` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `order_fraud`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_history`
--

CREATE TABLE IF NOT EXISTS `order_history` (
  `order_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(5) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`order_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_option`
--

CREATE TABLE IF NOT EXISTS `order_option` (
  `order_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `value` text COLLATE utf8_bin NOT NULL,
  `type` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`order_option_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_option`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_product`
--

CREATE TABLE IF NOT EXISTS `order_product` (
  `order_product_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `model` varchar(64) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL,
  PRIMARY KEY (`order_product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_product`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_status`
--

CREATE TABLE IF NOT EXISTS `order_status` (
  `order_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`order_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `order_status`
--

INSERT INTO `order_status` (`order_status_id`, `language_id`, `name`) VALUES
(2, 1, 'Processing'),
(3, 1, 'Shipped'),
(7, 1, 'Canceled'),
(5, 1, 'Complete'),
(8, 1, 'Denied'),
(9, 1, 'Canceled Reversal'),
(10, 1, 'Failed'),
(11, 1, 'Refunded'),
(12, 1, 'Reversed'),
(13, 1, 'Chargeback'),
(1, 1, 'Pending'),
(16, 1, 'Voided'),
(15, 1, 'Processed'),
(14, 1, 'Expired'),
(2, 2, 'Processing'),
(3, 2, 'Shipped'),
(7, 2, 'Canceled'),
(5, 2, 'Complete'),
(8, 2, 'Denied'),
(9, 2, 'Canceled Reversal'),
(10, 2, 'Failed'),
(11, 2, 'Refunded'),
(12, 2, 'Reversed'),
(13, 2, 'Chargeback'),
(1, 2, 'Pending'),
(16, 2, 'Voided'),
(15, 2, 'Processed'),
(14, 2, 'Expired');

-- --------------------------------------------------------

--
-- Структура таблицы `order_total`
--

CREATE TABLE IF NOT EXISTS `order_total` (
  `order_total_id` int(10) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  `title` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL,
  PRIMARY KEY (`order_total_id`),
  KEY `idx_orders_total_orders_id` (`order_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_total`
--


-- --------------------------------------------------------

--
-- Структура таблицы `order_voucher`
--

CREATE TABLE IF NOT EXISTS `order_voucher` (
  `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) COLLATE utf8_bin NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `from_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `from_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `to_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `to_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  PRIMARY KEY (`order_voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `order_voucher`
--


-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `model` varchar(64) COLLATE utf8_bin NOT NULL,
  `sku` varchar(64) COLLATE utf8_bin NOT NULL,
  `upc` varchar(12) COLLATE utf8_bin NOT NULL,
  `ean` varchar(14) COLLATE utf8_bin NOT NULL,
  `jan` varchar(13) COLLATE utf8_bin NOT NULL,
  `isbn` varchar(13) COLLATE utf8_bin NOT NULL,
  `mpn` varchar(64) COLLATE utf8_bin NOT NULL,
  `location` varchar(128) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `viewed` int(5) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=50 ;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`product_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `sort_order`, `status`, `date_added`, `date_modified`, `viewed`) VALUES
(28, 'Product 1', '', '', '', '', '', '', '', 939, 7, 'data/demo/htc_touch_hd_1.jpg', 5, 1, 100.0000, 200, 9, '2009-02-03', 146.40000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:06:50', '2011-09-30 01:05:39', 16),
(29, 'Product 2', '', '', '', '', '', '', '', 999, 6, 'data/demo/palm_treo_pro_1.jpg', 6, 1, 279.9900, 0, 9, '2009-02-03', 133.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 16:42:17', '2011-09-30 01:06:08', 0),
(30, 'Product 3', '', '', '', '', '', '', '', 7, 6, 'data/demo/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 16:59:00', '2011-09-30 01:05:23', 0),
(31, 'Product 4', '', '', '', '', '', '', '', 1000, 6, 'data/demo/nikon_d300_1.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 1, '2009-02-03 17:00:10', '2011-09-30 01:06:00', 0),
(32, 'Product 5', '', '', '', '', '', '', '', 999, 6, 'data/demo/ipod_touch_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 17:07:26', '2011-09-30 01:07:22', 0),
(33, 'Product 6', '', '', '', '', '', '', '', 1000, 6, 'data/demo/samsung_syncmaster_941bw.jpg', 0, 1, 200.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 17:08:31', '2011-09-30 01:06:29', 0),
(34, 'Product 7', '', '', '', '', '', '', '', 1000, 6, 'data/demo/ipod_shuffle_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:07:54', '2011-09-30 01:07:17', 0),
(35, 'Product 8', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 18:08:31', '2011-09-30 01:06:17', 0),
(36, 'Product 9', '', '', '', '', '', '', '', 994, 6, 'data/demo/ipod_nano_1.jpg', 8, 0, 100.0000, 100, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 18:09:19', '2011-09-30 01:07:12', 0),
(40, 'product 11', '', '', '', '', '', '', '', 970, 5, 'data/demo/iphone_1.jpg', 8, 1, 101.0000, 0, 9, '2009-02-03', 10.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:12', '2011-09-30 01:06:53', 0),
(41, 'Product 14', '', '', '', '', '', '', '', 977, 5, 'data/demo/imac_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, '2009-02-03 21:07:26', '2011-09-30 01:06:44', 0),
(42, 'Product 15', '', '', '', '', '', '', '', 990, 5, 'data/demo/apple_cinema_30.jpg', 8, 1, 100.0000, 400, 9, '2009-02-04', 12.50000000, 1, 1.00000000, 2.00000000, 3.00000000, 1, 1, 2, 0, 1, '2009-02-03 21:07:37', '2011-09-30 00:46:19', 0),
(43, 'Product 16', '', '', '', '', '', '', '', 929, 5, 'data/demo/macbook_1.jpg', 8, 0, 500.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:07:49', '2011-09-30 01:05:46', 0),
(44, 'Product 17', '', '', '', '', '', '', '', 1000, 5, 'data/demo/macbook_air_1.jpg', 8, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:00', '2011-09-30 01:05:53', 0),
(45, 'Product 18', '', '', '', '', '', '', '', 998, 5, 'data/demo/macbook_pro_1.jpg', 8, 1, 2000.0000, 0, 100, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:17', '2011-09-15 22:22:01', 0),
(46, 'Product 19', '', '', '', '', '', '', '', 1000, 5, 'data/demo/sony_vaio_1.jpg', 10, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-03 21:08:29', '2011-09-30 01:06:39', 3),
(47, 'Product 21', '', '', '', '', '', '', '', 1000, 5, 'data/demo/hp_1.jpg', 7, 1, 100.0000, 400, 9, '2009-02-03', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 0, 1, 0, 1, '2009-02-03 21:08:40', '2011-09-30 01:05:28', 1),
(48, 'product 20', 'test 1', '', '', '', '', '', 'test 2', 995, 5, 'data/demo/ipod_classic_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-08', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 1, '2009-02-08 17:21:51', '2011-09-30 01:07:06', 0),
(49, 'SAM1', '', '', '', '', '', '', '', 0, 8, 'data/demo/samsung_tab_1.jpg', 0, 1, 199.9900, 0, 9, '2011-04-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_attribute`
--

CREATE TABLE IF NOT EXISTS `product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_id`,`attribute_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_attribute`
--

INSERT INTO `product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(43, 2, 1, 0x31),
(47, 4, 1, 0x31364742),
(43, 4, 1, 0x386762),
(42, 3, 1, 0x3130306d687a),
(47, 2, 1, 0x34),
(43, 2, 2, 0x31),
(47, 4, 2, 0x31364742),
(43, 4, 2, 0x386762),
(42, 3, 2, 0x3130306d687a),
(47, 2, 2, 0x34);

-- --------------------------------------------------------

--
-- Структура таблицы `product_description`
--

CREATE TABLE IF NOT EXISTS `product_description` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin NOT NULL,
  `description` text COLLATE utf8_bin NOT NULL,
  `meta_description` varchar(255) COLLATE utf8_bin NOT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  `tag` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_id`,`language_id`),
  KEY `name` (`name`),
  FULLTEXT KEY `description` (`description`),
  FULLTEXT KEY `tag` (`tag`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=50 ;

--
-- Дамп данных таблицы `product_description`
--

INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(35, 1, 'Product 8', 0x266c743b702667743b0d0a0950726f647563742038266c743b2f702667743b0d0a, '', '', ''),
(48, 1, 'iPod Classic', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b4d6f726520726f6f6d20746f206d6f76652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909576974682038304742206f72203136304742206f662073746f7261676520616e6420757020746f20343020686f757273206f662062617474657279206c6966652c20746865206e65772069506f6420636c6173736963206c65747320796f7520656e6a6f7920757020746f2034302c30303020736f6e6773206f7220757020746f2032303020686f757273206f6620766964656f206f7220616e7920636f6d62696e6174696f6e20776865726576657220796f7520676f2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b436f76657220466c6f772e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a09090942726f777365207468726f75676820796f7572206d7573696320636f6c6c656374696f6e20627920666c697070696e67207468726f75676820616c62756d206172742e2053656c65637420616e20616c62756d20746f207475726e206974206f76657220616e64207365652074686520747261636b206c6973742e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b456e68616e63656420696e746572666163652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909457870657269656e636520612077686f6c65206e65772077617920746f2062726f77736520616e64207669657720796f7572206d7573696320616e6420766964656f2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b536c65656b65722064657369676e2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a09090942656175746966756c2c2064757261626c652c20616e6420736c65656b6572207468616e20657665722c2069506f6420636c6173736963206e6f7720666561747572657320616e20616e6f64697a656420616c756d696e756d20616e6420706f6c697368656420737461696e6c65737320737465656c20656e636c6f73757265207769746820726f756e6465642065646765732e266c743b2f702667743b0d0a09266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(40, 1, 'iPhone', 0x266c743b7020636c6173733d2671756f743b696e74726f2671756f743b2667743b0d0a096950686f6e652069732061207265766f6c7574696f6e617279206e6577206d6f62696c652070686f6e65207468617420616c6c6f777320796f7520746f206d616b6520612063616c6c2062792073696d706c792074617070696e672061206e616d65206f72206e756d62657220696e20796f7572206164647265737320626f6f6b2c2061206661766f7269746573206c6973742c206f7220612063616c6c206c6f672e20497420616c736f206175746f6d61746963616c6c792073796e637320616c6c20796f757220636f6e74616374732066726f6d20612050432c204d61632c206f7220496e7465726e657420736572766963652e20416e64206974206c65747320796f752073656c65637420616e64206c697374656e20746f20766f6963656d61696c206d6573736167657320696e207768617465766572206f7264657220796f752077616e74206a757374206c696b6520656d61696c2e266c743b2f702667743b0d0a, '', '', ''),
(28, 1, 'HTC Touch HD', 0x266c743b702667743b0d0a0948544320546f756368202d20696e204869676820446566696e6974696f6e2e205761746368206d7573696320766964656f7320616e642073747265616d696e6720636f6e74656e7420696e206177652d696e73706972696e67206869676820646566696e6974696f6e20636c617269747920666f722061206d6f62696c6520657870657269656e636520796f75206e657665722074686f7567687420706f737369626c652e205365647563746976656c7920736c65656b2c207468652048544320546f7563682048442070726f766964657320746865206e6578742067656e65726174696f6e206f66206d6f62696c652066756e6374696f6e616c6974792c20616c6c20617420612073696d706c6520746f7563682e2046756c6c7920696e746567726174656420776974682057696e646f7773204d6f62696c652050726f66657373696f6e616c20362e312c20756c7472616661737420332e35472c204750532c20354d502063616d6572612c20706c7573206c6f7473206d6f7265202d20616c6c2064656c697665726564206f6e20612062726561746874616b696e676c7920637269737020332e3826616d703b71756f743b205756474120746f75636873637265656e202d20796f752063616e2074616b6520636f6e74726f6c206f6620796f7572206d6f62696c6520776f726c642077697468207468652048544320546f7563682048442e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4665617475726573266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090950726f636573736f72205175616c636f6d6d26616d703b7265673b204d534d20373230314126616d703b74726164653b20353238204d487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696e646f7773204d6f62696c6526616d703b7265673b20362e312050726f66657373696f6e616c204f7065726174696e672053797374656d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d656d6f72793a20353132204d4220524f4d2c20323838204d422052414d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944696d656e73696f6e733a20313135206d6d20782036322e38206d6d2078203132206d6d202f203134362e34206772616d73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909332e382d696e6368205446542d4c434420666c617420746f7563682d73656e7369746976652073637265656e2077697468203438302078203830302057564741207265736f6c7574696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090948534450412f5743444d413a204575726f70652f417369613a203930302f32313030204d487a3b20557020746f2032204d6270732075702d6c696e6b20616e6420372e32204d62707320646f776e2d6c696e6b20737065656473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909517561642d62616e642047534d2f475052532f454447453a204575726f70652f417369613a203835302f3930302f313830302f31393030204d487a202842616e64206672657175656e63792c20485355504120617661696c6162696c6974792c20616e64206461746120737065656420617265206f70657261746f7220646570656e64656e742e29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944657669636520436f6e74726f6c207669612048544320546f756368464c4f26616d703b74726164653b2033442026616d703b616d703b20546f7563682d73656e7369746976652066726f6e742070616e656c20627574746f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090947505320616e6420412d475053207265616479266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909426c7565746f6f746826616d703b7265673b20322e30207769746820456e68616e6365642044617461205261746520616e64204132445020666f7220776972656c6573732073746572656f206865616473657473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957692d466926616d703b7265673b3a2049454545203830322e313120622f67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094854432045787455534226616d703b74726164653b202831312d70696e206d696e692d55534220322e3029266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090935206d656761706978656c20636f6c6f722063616d6572612077697468206175746f20666f637573266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090956474120434d4f5320636f6c6f722063616d657261266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e20332e35206d6d20617564696f206a61636b2c206d6963726f70686f6e652c20737065616b65722c20616e6420464d20726164696f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090952696e6720746f6e6520666f726d6174733a204141432c204141432b2c20654141432b2c20414d522d4e422c20414d522d57422c205143502c204d50332c20574d412c20574156266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909343020706f6c7970686f6e696320616e64207374616e64617264204d49444920666f726d6174203020616e6420312028534d46292f5350204d494449266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909526563686172676561626c65204c69746869756d2d696f6e206f72204c69746869756d2d696f6e20706f6c796d65722031333530206d41682062617474657279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909457870616e73696f6e20536c6f743a206d6963726f534426616d703b74726164653b206d656d6f727920636172642028534420322e3020636f6d70617469626c6529266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094143204164617074657220566f6c746167652072616e67652f6672657175656e63793a20313030207e20323430562041432c2035302f363020487a204443206f75747075743a20355620616e64203141266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095370656369616c2046656174757265733a20464d20526164696f2c20472d53656e736f72266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(44, 1, 'MacBook Air', 0x266c743b6469762667743b0d0a094d6163426f6f6b2041697220697320756c7472617468696e2c20756c747261706f727461626c652c20616e6420756c74726120756e6c696b6520616e797468696e6720656c73652e2042757420796f7520646f6e26616d703b727371756f3b74206c6f736520696e6368657320616e6420706f756e6473206f7665726e696768742e20497426616d703b727371756f3b732074686520726573756c74206f662072657468696e6b696e6720636f6e76656e74696f6e732e204f66206d756c7469706c6520776972656c65737320696e6e6f766174696f6e732e20416e64206f6620627265616b7468726f7567682064657369676e2e2057697468204d6163426f6f6b204169722c206d6f62696c6520636f6d707574696e672073756464656e6c79206861732061206e6577207374616e646172642e266c743b2f6469762667743b0d0a, '', '', ''),
(45, 1, 'MacBook Pro', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4c617465737420496e74656c206d6f62696c6520617263686974656374757265266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909506f776572656420627920746865206d6f737420616476616e636564206d6f62696c652070726f636573736f72732066726f6d20496e74656c2c20746865206e657720436f726520322044756f204d6163426f6f6b2050726f206973206f7665722035302520666173746572207468616e20746865206f726967696e616c20436f72652044756f204d6163426f6f6b2050726f20616e64206e6f7720737570706f72747320757020746f20344742206f662052414d2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4c656164696e672d65646765206772617068696373266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909546865204e5649444941204765466f72636520383630304d2047542064656c697665727320657863657074696f6e616c2067726170686963732070726f63657373696e6720706f7765722e20466f722074686520756c74696d6174652063726561746976652063616e7661732c20796f752063616e206576656e20636f6e666967757265207468652031372d696e6368206d6f64656c2077697468206120313932302d62792d31323030207265736f6c7574696f6e20646973706c61792e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b44657369676e656420666f72206c696665206f6e2074686520726f6164266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909496e6e6f766174696f6e7320737563682061732061206d61676e6574696320706f77657220636f6e6e656374696f6e20616e6420616e20696c6c756d696e61746564206b6579626f617264207769746820616d6269656e74206c696768742073656e736f722070757420746865204d6163426f6f6b2050726f20696e206120636c61737320627920697473656c662e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b436f6e6e6563742e204372656174652e20436f6d6d756e69636174652e266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909517569636b6c7920736574207570206120766964656f20636f6e666572656e6365207769746820746865206275696c742d696e206953696768742063616d6572612e20436f6e74726f6c2070726573656e746174696f6e7320616e64206d656469612066726f6d20757020746f2033302066656574206177617920776974682074686520696e636c75646564204170706c652052656d6f74652e20436f6e6e65637420746f20686967682d62616e647769647468207065726970686572616c7320776974682046697265576972652038303020616e64204456492e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4e6578742d67656e65726174696f6e20776972656c657373266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909466561747572696e67203830322e31316e20776972656c65737320746563686e6f6c6f67792c20746865204d6163426f6f6b2050726f2064656c697665727320757020746f20666976652074696d65732074686520706572666f726d616e636520616e6420757020746f207477696365207468652072616e6765206f662070726576696f75732d67656e65726174696f6e20746563686e6f6c6f676965732e266c743b2f702667743b0d0a09266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(29, 1, 'Palm Treo Pro', 0x266c743b702667743b0d0a095265646566696e6520796f757220776f726b6461792077697468207468652050616c6d205472656f2050726f20736d61727470686f6e652e20506572666563746c792062616c616e6365642c20796f752063616e20726573706f6e6420746f20627573696e65737320616e6420706572736f6e616c20656d61696c2c2073746179206f6e20746f70206f66206170706f696e746d656e747320616e6420636f6e74616374732c20616e64207573652057692d4669206f7220475053207768656e20796f7526616d703b727371756f3b7265206f757420616e642061626f75742e205468656e207761746368206120766964656f206f6e20596f75547562652c2063617463682075702077697468206e65777320616e642073706f727473206f6e20746865207765622c206f72206c697374656e20746f20612066657720736f6e67732e2042616c616e636520796f757220776f726b20616e6420706c6179207468652077617920796f75206c696b652069742c2077697468207468652050616c6d205472656f2050726f2e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4665617475726573266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090957696e646f7773204d6f62696c6526616d703b7265673b20362e312050726f66657373696f6e616c2045646974696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095175616c636f6d6d26616d703b7265673b204d534d37323031203430304d487a2050726f636573736f72266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090933323078333230207472616e73666c65637469766520636f6c6f75722054465420746f75636873637265656e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090948534450412f554d54532f454447452f475052532f47534d20726164696f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095472692d62616e6420554d54532026616d703b6d646173683b203835304d487a2c20313930304d487a2c20323130304d487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909517561642d62616e642047534d2026616d703b6d646173683b203835302f3930302f313830302f31393030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093830322e3131622f672077697468205750412c20575041322c20616e64203830312e31782061757468656e7469636174696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e20475053266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909426c7565746f6f74682056657273696f6e3a20322e30202b20456e68616e63656420446174612052617465266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093235364d422073746f7261676520283130304d42207573657220617661696c61626c65292c203132384d422052414d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909322e30206d656761706978656c2063616d6572612c20757020746f203878206469676974616c207a6f6f6d20616e6420766964656f2063617074757265266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090952656d6f7661626c652c20726563686172676561626c6520313530306d4168206c69746869756d2d696f6e2062617474657279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909557020746f20352e3020686f7572732074616c6b2074696d6520616e6420757020746f2032353020686f757273207374616e646279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6963726f53444843206361726420657870616e73696f6e2028757020746f203332474220737570706f7274656429266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6963726f55534220322e3020666f722073796e6368726f6e697a6174696f6e20616e64206368617267696e67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909332e356d6d2073746572656f2068656164736574206a61636b266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090936306d6d202857292078203131346d6d20284c2920782031332e356d6d20284429202f2031333367266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(36, 1, 'iPod Nano', 0x266c743b6469762667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b566964656f20696e20796f757220706f636b65742e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09094974732074686520736d616c6c2069506f642077697468206f6e6520766572792062696720696465613a20766964656f2e2054686520776f726c6473206d6f737420706f70756c6172206d7573696320706c61796572206e6f77206c65747320796f7520656e6a6f79206d6f766965732c2054562073686f77732c20616e64206d6f7265206f6e20612074776f2d696e636820646973706c617920746861747320363525206272696768746572207468616e206265666f72652e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b436f76657220466c6f772e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a090942726f777365207468726f75676820796f7572206d7573696320636f6c6c656374696f6e20627920666c697070696e67207468726f75676820616c62756d206172742e2053656c65637420616e20616c62756d20746f207475726e206974206f76657220616e64207365652074686520747261636b206c6973742e266c743b7374726f6e672667743b26616d703b6e6273703b266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b456e68616e63656420696e746572666163652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909457870657269656e636520612077686f6c65206e65772077617920746f2062726f77736520616e64207669657720796f7572206d7573696320616e6420766964656f2e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b536c65656b20616e6420636f6c6f7266756c2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09095769746820616e20616e6f64697a656420616c756d696e756d20616e6420706f6c697368656420737461696e6c65737320737465656c20656e636c6f7375726520616e6420612063686f696365206f66206669766520636f6c6f72732c2069506f64206e616e6f206973206472657373656420746f20696d70726573732e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b6954756e65732e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909417661696c61626c652061732061206672656520646f776e6c6f61642c206954756e6573206d616b6573206974206561737920746f2062726f77736520616e6420627579206d696c6c696f6e73206f6620736f6e67732c206d6f766965732c2054562073686f77732c20617564696f626f6f6b732c20616e642067616d657320616e6420646f776e6c6f6164206672656520706f64636173747320616c6c20617420746865206954756e65732053746f72652e20416e6420796f752063616e20696d706f727420796f7572206f776e206d757369632c206d616e61676520796f75722077686f6c65206d65646961206c6962726172792c20616e642073796e6320796f75722069506f64206f72206950686f6e65207769746820656173652e266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', ''),
(46, 1, 'Sony VAIO', 0x266c743b6469762667743b0d0a09556e707265636564656e74656420706f7765722e20546865206e6578742067656e65726174696f6e206f662070726f63657373696e6720746563686e6f6c6f67792068617320617272697665642e204275696c7420696e746f20746865206e6577657374205641494f206e6f7465626f6f6b73206c69657320496e74656c26616d703b2333393b73206c61746573742c206d6f737420706f77657266756c20696e6e6f766174696f6e207965743a20496e74656c26616d703b7265673b2043656e7472696e6f26616d703b7265673b20322070726f636573736f7220746563686e6f6c6f67792e20426f617374696e6720696e6372656469626c652073706565642c20657870616e64656420776972656c65737320636f6e6e65637469766974792c20656e68616e636564206d756c74696d6564696120737570706f727420616e64206772656174657220656e6572677920656666696369656e63792c20616c6c2074686520686967682d706572666f726d616e636520657373656e7469616c7320617265207365616d6c6573736c7920636f6d62696e656420696e746f20612073696e676c6520636869702e266c743b2f6469762667743b0d0a, '', '', ''),
(47, 1, 'HP LP3065', 0x266c743b702667743b0d0a0953746f7020796f757220636f2d776f726b65727320696e20746865697220747261636b73207769746820746865207374756e6e696e67206e65772033302d696e636820646961676f6e616c204850204c503330363520466c61742050616e656c204d6f6e69746f722e205468697320666c616773686970206d6f6e69746f7220666561747572657320626573742d696e2d636c61737320706572666f726d616e636520616e642070726573656e746174696f6e206665617475726573206f6e2061206875676520776964652d6173706563742073637265656e207768696c65206c657474696e6720796f7520776f726b20617320636f6d666f727461626c7920617320706f737369626c65202d20796f75206d69676874206576656e20666f7267657420796f7526616d703b2333393b726520617420746865206f6666696365266c743b2f702667743b0d0a, '', '', ''),
(32, 1, 'iPod Touch', 0x266c743b702667743b0d0a09266c743b7374726f6e672667743b5265766f6c7574696f6e617279206d756c74692d746f75636820696e746572666163652e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0969506f6420746f756368206665617475726573207468652073616d65206d756c74692d746f7563682073637265656e20746563686e6f6c6f6779206173206950686f6e652e2050696e636820746f207a6f6f6d20696e206f6e20612070686f746f2e205363726f6c6c207468726f75676820796f757220736f6e677320616e6420766964656f732077697468206120666c69636b2e20466c6970207468726f75676820796f7572206c69627261727920627920616c62756d20617274776f726b207769746820436f76657220466c6f772e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b476f7267656f757320332e352d696e6368207769646573637265656e20646973706c61792e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a09576174636820796f7572206d6f766965732c2054562073686f77732c20616e642070686f746f7320636f6d6520616c6976652077697468206272696768742c20766976696420636f6c6f72206f6e20746865203332302d62792d3438302d706978656c20646973706c61792e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4d7573696320646f776e6c6f6164732073747261696768742066726f6d206954756e65732e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0953686f7020746865206954756e65732057692d4669204d757369632053746f72652066726f6d20616e79776865726520776974682057692d46692e312042726f777365206f722073656172636820746f2066696e6420746865206d7573696320796f757265206c6f6f6b696e6720666f722c20707265766965772069742c20616e64206275792069742077697468206a7573742061207461702e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b53757266207468652077656220776974682057692d46692e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0942726f7773652074686520776562207573696e672053616661726920616e6420776174636820596f755475626520766964656f73206f6e207468652066697273742069506f6420776974682057692d4669206275696c7420696e266c743b6272202f2667743b0d0a0926616d703b6e6273703b266c743b2f702667743b0d0a, '', '', ''),
(41, 1, 'iMac', 0x266c743b6469762667743b0d0a094a757374207768656e20796f752074686f7567687420694d6163206861642065766572797468696e672c206e6f772074686572652661637574653b73206576656e206d6f72652e204d6f726520706f77657266756c20496e74656c20436f726520322044756f2070726f636573736f72732e20416e64206d6f7265206d656d6f7279207374616e646172642e20436f6d62696e6520746869732077697468204d6163204f532058204c656f7061726420616e6420694c696665202661637574653b30382c20616e642069742661637574653b73206d6f726520616c6c2d696e2d6f6e65207468616e20657665722e20694d6163207061636b7320616d617a696e6720706572666f726d616e636520696e746f2061207374756e6e696e676c7920736c696d2073706163652e266c743b2f6469762667743b0d0a, '', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', 0x266c743b6469762667743b0d0a09496d6167696e652074686520616476616e7461676573206f6620676f696e672062696720776974686f757420736c6f77696e6720646f776e2e205468652062696720313926616d703b71756f743b203934314257206d6f6e69746f7220636f6d62696e657320776964652061737065637420726174696f2077697468206661737420706978656c20726573706f6e73652074696d652c20666f722062696767657220696d616765732c206d6f726520726f6f6d20746f20776f726b20616e64206372697370206d6f74696f6e2e20496e206164646974696f6e2c20746865206578636c7573697665204d6167696342726967687420322c204d61676963436f6c6f7220616e64204d6167696354756e6520746563686e6f6c6f676965732068656c702064656c697665722074686520696465616c20696d61676520696e20657665727920736974756174696f6e2c207768696c6520736c65656b2c206e6172726f772062657a656c7320616e642061646a75737461626c65207374616e64732064656c69766572207374796c65206a757374207468652077617920796f752077616e742069742e2057697468207468652053616d73756e67203934314257207769646573637265656e20616e616c6f672f6469676974616c204c4344206d6f6e69746f722c20697426616d703b2333393b73206e6f74206861726420746f20696d6167696e652e266c743b2f6469762667743b0d0a, '', '', ''),
(34, 1, 'iPod Shuffle', 0x266c743b6469762667743b0d0a09266c743b7374726f6e672667743b426f726e20746f20626520776f726e2e266c743b2f7374726f6e672667743b0d0a09266c743b702667743b0d0a0909436c6970206f6e2074686520776f726c6473206d6f7374207765617261626c65206d7573696320706c6179657220616e642074616b6520757020746f2032343020736f6e6773207769746820796f7520616e7977686572652e2043686f6f73652066726f6d206669766520636f6c6f727320696e636c7564696e6720666f7572206e6577206875657320746f206d616b6520796f7572206d75736963616c2066617368696f6e2073746174656d656e742e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b52616e646f6d206d656574732072687974686d2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a090957697468206954756e6573206175746f66696c6c2c2069506f642073687566666c652063616e2064656c697665722061206e6577206d75736963616c20657870657269656e63652065766572792074696d6520796f752073796e632e20466f72206d6f72652072616e646f6d6e6573732c20796f752063616e2073687566666c6520736f6e677320647572696e6720706c61796261636b20776974682074686520736c696465206f662061207377697463682e266c743b2f702667743b0d0a09266c743b7374726f6e672667743b45766572797468696e6720697320656173792e266c743b2f7374726f6e672667743b0d0a09266c743b702667743b0d0a090943686172676520616e642073796e6320776974682074686520696e636c756465642055534220646f636b2e204f706572617465207468652069506f642073687566666c6520636f6e74726f6c732077697468206f6e652068616e642e20456e6a6f7920757020746f20313220686f757273207374726169676874206f6620736b69702d66726565206d7573696320706c61796261636b2e266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', ''),
(43, 1, 'MacBook', 0x266c743b6469762667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b496e74656c20436f726520322044756f2070726f636573736f72266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909506f776572656420627920616e20496e74656c20436f726520322044756f2070726f636573736f722061742073706565647320757020746f20322e313647487a2c20746865206e6577204d6163426f6f6b20697320746865206661737465737420657665722e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b314742206d656d6f72792c206c6172676572206861726420647269766573266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909546865206e6577204d6163426f6f6b206e6f7720636f6d6573207769746820314742206f66206d656d6f7279207374616e6461726420616e64206c617267657220686172642064726976657320666f722074686520656e74697265206c696e65207065726665637420666f722072756e6e696e67206d6f7265206f6620796f7572206661766f72697465206170706c69636174696f6e7320616e642073746f72696e672067726f77696e67206d6564696120636f6c6c656374696f6e732e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b536c65656b2c20312e30382d696e63682d7468696e2064657369676e266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09094d6163426f6f6b206d616b6573206974206561737920746f206869742074686520726f6164207468616e6b7320746f2069747320746f75676820706f6c79636172626f6e61746520636173652c206275696c742d696e20776972656c65737320746563686e6f6c6f676965732c20616e6420696e6e6f766174697665204d61675361666520506f776572204164617074657220746861742072656c6561736573206175746f6d61746963616c6c7920696620736f6d656f6e65206163636964656e74616c6c79207472697073206f6e2074686520636f72642e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b4275696c742d696e206953696768742063616d657261266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09095269676874206f7574206f662074686520626f782c20796f752063616e2068617665206120766964656f2063686174207769746820667269656e6473206f722066616d696c792c32207265636f7264206120766964656f20617420796f7572206465736b2c206f722074616b652066756e20706963747572657320776974682050686f746f20426f6f7468266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', ''),
(31, 1, 'Nikon D300', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909456e67696e656572656420776974682070726f2d6c6576656c20666561747572657320616e6420706572666f726d616e63652c207468652031322e332d6566666563746976652d6d656761706978656c204433303020636f6d62696e6573206272616e64206e657720746563686e6f6c6f67696573207769746820616476616e63656420666561747572657320696e686572697465642066726f6d204e696b6f6e26616d703b2333393b73206e65776c7920616e6e6f756e6365642044332070726f66657373696f6e616c206469676974616c20534c522063616d65726120746f206f6666657220736572696f75732070686f746f67726170686572732072656d61726b61626c6520706572666f726d616e636520636f6d62696e65642077697468206167696c6974792e266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a090953696d696c617220746f207468652044332c207468652044333030206665617475726573204e696b6f6e26616d703b2333393b73206578636c75736976652045585045454420496d6167652050726f63657373696e672053797374656d20746861742069732063656e7472616c20746f2064726976696e672074686520737065656420616e642070726f63657373696e6720706f776572206e656564656420666f72206d616e79206f66207468652063616d65726126616d703b2333393b73206e65772066656174757265732e2054686520443330302066656174757265732061206e65772035312d706f696e74206175746f666f6375732073797374656d2077697468204e696b6f6e26616d703b2333393b7320334420466f63757320547261636b696e67206665617475726520616e642074776f206e6577204c697665566965772073686f6f74696e67206d6f646573207468617420616c6c6f7720757365727320746f206672616d6520612070686f746f6772617068207573696e67207468652063616d65726126616d703b2333393b7320686967682d7265736f6c7574696f6e204c4344206d6f6e69746f722e2054686520443330302073686172657320612073696d696c6172205363656e65205265636f676e6974696f6e2053797374656d20617320697320666f756e6420696e207468652044333b2069742070726f6d6973657320746f2067726561746c7920656e68616e636520746865206163637572616379206f66206175746f666f6375732c206175746f6578706f737572652c20616e64206175746f2077686974652062616c616e6365206279207265636f676e697a696e6720746865207375626a656374206f72207363656e65206265696e672070686f746f6772617068656420616e64206170706c79696e67207468697320696e666f726d6174696f6e20746f207468652063616c63756c6174696f6e7320666f72207468652074687265652066756e6374696f6e732e266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a09095468652044333030207265616374732077697468206c696768746e696e672073706565642c20706f776572696e6720757020696e2061206d65726520302e3133207365636f6e647320616e642073686f6f74696e67207769746820616e20696d7065726365707469626c652034352d6d696c6c697365636f6e6420736875747465722072656c65617365206c61672074696d652e2054686520443330302069732063617061626c65206f662073686f6f74696e67206174206120726170696420736978206672616d657320706572207365636f6e6420616e642063616e20676f2061732066617374206173206569676874206672616d657320706572207365636f6e64207768656e207573696e6720746865206f7074696f6e616c204d422d443130206d756c74692d706f7765722062617474657279207061636b2e20496e20636f6e74696e756f7573206275727374732c2074686520443330302063616e2073686f6f7420757020746f203130302073686f74732061742066756c6c2031322e332d6d656761706978656c207265736f6c7574696f6e2e20284e4f524d414c2d4c4152474520696d6167652073657474696e672c207573696e6720612053616e4469736b2045787472656d652049562031474220436f6d70616374466c61736820636172642e29266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a0909546865204433303020696e636f72706f726174657320612072616e6765206f6620696e6e6f76617469766520746563686e6f6c6f6769657320616e6420666561747572657320746861742077696c6c207369676e69666963616e746c7920696d70726f7665207468652061636375726163792c20636f6e74726f6c2c20616e6420706572666f726d616e63652070686f746f67726170686572732063616e206765742066726f6d2074686569722065717569706d656e742e20497473206e6577205363656e65205265636f676e6974696f6e2053797374656d20616476616e6365732074686520757365206f66204e696b6f6e26616d703b2333393b73206163636c61696d656420312c3030352d7365676d656e742073656e736f7220746f207265636f676e697a6520636f6c6f727320616e64206c69676874207061747465726e7320746861742068656c70207468652063616d6572612064657465726d696e6520746865207375626a65637420616e64207468652074797065206f66207363656e65206265696e672070686f746f67726170686564206265666f7265206120706963747572652069732074616b656e2e205468697320696e666f726d6174696f6e206973207573656420746f20696d70726f766520746865206163637572616379206f66206175746f666f6375732c206175746f6578706f737572652c20616e64206175746f2077686974652062616c616e63652066756e6374696f6e7320696e2074686520443330302e20466f72206578616d706c652c207468652063616d6572612063616e20747261636b206d6f76696e67207375626a656374732062657474657220616e64206279206964656e74696679696e67207468656d2c2069742063616e20616c736f206175746f6d61746963616c6c792073656c65637420666f63757320706f696e74732066617374657220616e64207769746820677265617465722061636375726163792e2049742063616e20616c736f20616e616c797a6520686967686c696768747320616e64206d6f72652061636375726174656c792064657465726d696e65206578706f737572652c2061732077656c6c20617320696e666572206c6967687420736f757263657320746f2064656c69766572206d6f72652061636375726174652077686974652062616c616e636520646574656374696f6e2e266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', 0x266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e312c2069732074686520776f726c6426616d703b727371756f3b73207468696e6e657374207461626c65742c206d6561737572696e6720382e36206d6d20746869636b6e6573732c2072756e6e696e67207769746820416e64726f696420332e3020486f6e6579636f6d62204f53206f6e2061203147487a206475616c2d636f726520546567726120322070726f636573736f722c2073696d696c617220746f2069747320796f756e6765722062726f746865722053616d73756e672047616c6178792054616220382e392e266c743b2f702667743b0d0a266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e31206769766573207075726520416e64726f696420332e3020657870657269656e63652c20616464696e6720697473206e657720546f75636857697a205558206f7220546f75636857697a20342e302026616d703b6e646173683b20696e636c756465732061206c6976652070616e656c2c207768696368206c65747320796f7520746f20637573746f6d697a65207769746820646966666572656e7420636f6e74656e742c207375636820617320796f75722070696374757265732c20626f6f6b6d61726b732c20616e6420736f6369616c2066656564732c2073706f7274696e6720612031302e3120696e636865732057584741206361706163697469766520746f7563682073637265656e2077697468203132383020782038303020706978656c73206f66207265736f6c7574696f6e2c20657175697070656420776974682033206d656761706978656c20726561722063616d6572612077697468204c454420666c61736820616e6420612032206d656761706978656c2066726f6e742063616d6572612c20485350412b20636f6e6e656374697669747920757020746f2032314d6270732c203732307020484420766964656f207265636f7264696e67206361706162696c6974792c20313038307020484420706c61796261636b2c20444c4e4120737570706f72742c20426c7565746f6f746820322e312c2055534220322e302c206779726f73636f70652c2057692d4669203830322e313120612f622f672f6e2c206d6963726f2d534420736c6f742c20332e356d6d206865616470686f6e65206a61636b2c20616e642053494d20736c6f742c20696e636c7564696e67207468652053616d73756e6720537469636b2026616d703b6e646173683b206120426c7565746f6f7468206d6963726f70686f6e6520746861742063616e206265206361727269656420696e206120706f636b6574206c696b6520612070656e20616e6420736f756e6420646f636b207769746820706f776572656420737562776f6f6665722e266c743b2f702667743b0d0a266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e312077696c6c20636f6d6520696e2031364742202f2033324742202f203634474220766572697469657320616e64207072652d6c6f61646564207769746820536f6369616c204875622c2052656164657226616d703b727371756f3b73204875622c204d757369632048756220616e642053616d73756e67204d696e69204170707320547261792026616d703b6e646173683b20776869636820676976657320796f752061636365737320746f206d6f726520636f6d6d6f6e6c792075736564206170707320746f2068656c702065617365206d756c74697461736b696e6720616e642069742069732063617061626c65206f662041646f626520466c61736820506c617965722031302e322c20706f776572656420627920363836306d41682062617474657279207468617420676976657320796f75203130686f757273206f6620766964656f2d706c61796261636b2074696d652e26616d703b6e6273703b26616d703b61756d6c3b26616d703b6f756d6c3b266c743b2f702667743b0d0a, '', '', '');
INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(42, 1, 'Apple Cinema 30&quot;', 0x266c743b702667743b0d0a09266c743b666f6e7420666163653d2671756f743b68656c7665746963612c67656e6576612c617269616c2671756f743b2073697a653d2671756f743b322671756f743b2667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652033302d696e6368204170706c652043696e656d6120484420446973706c61792064656c697665727320616e20616d617a696e6720323536302078203136303020706978656c207265736f6c7574696f6e2e2044657369676e6564207370656369666963616c6c7920666f72207468652063726561746976652070726f66657373696f6e616c2c207468697320646973706c61792070726f7669646573206d6f726520737061636520666f72206561736965722061636365737320746f20616c6c2074686520746f6f6c7320616e642070616c6574746573206e656564656420746f20656469742c20666f726d617420616e6420636f6d706f7369746520796f757220776f726b2e20436f6d62696e65207468697320646973706c617920776974682061204d61632050726f2c204d6163426f6f6b2050726f2c206f7220506f7765724d616320473520616e6420746865726526616d703b2333393b73206e6f206c696d697420746f207768617420796f752063616e20616368696576652e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652043696e656d6120484420666561747572657320616e206163746976652d6d6174726978206c6971756964206372797374616c20646973706c617920746861742070726f647563657320666c69636b65722d6672656520696d6167657320746861742064656c6976657220747769636520746865206272696768746e6573732c207477696365207468652073686172706e65737320616e642074776963652074686520636f6e747261737420726174696f206f662061207479706963616c2043525420646973706c61792e20556e6c696b65206f7468657220666c61742070616e656c732c20697426616d703b2333393b732064657369676e6564207769746820612070757265206469676974616c20696e7465726661636520746f2064656c6976657220646973746f7274696f6e2d6672656520696d616765732074686174206e65766572206e6565642061646a757374696e672e2057697468206f7665722034206d696c6c696f6e206469676974616c20706978656c732c2074686520646973706c617920697320756e697175656c792073756974656420666f7220736369656e746966696320616e6420746563686e6963616c206170706c69636174696f6e7320737563682061732076697375616c697a696e67206d6f6c6563756c61722073747275637475726573206f7220616e616c797a696e672067656f6c6f676963616c20646174612e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b4f66666572696e672061636375726174652c206272696c6c69616e7420636f6c6f7220706572666f726d616e63652c207468652043696e656d612048442064656c697665727320757020746f2031362e37206d696c6c696f6e20636f6c6f7273206163726f7373206120776964652067616d757420616c6c6f77696e6720796f7520746f2073656520737562746c65206e75616e636573206265747765656e20636f6c6f72732066726f6d20736f66742070617374656c7320746f2072696368206a6577656c20746f6e65732e204120776964652076696577696e6720616e676c6520656e737572657320756e69666f726d20636f6c6f722066726f6d206564676520746f20656467652e204170706c6526616d703b2333393b7320436f6c6f7253796e6320746563686e6f6c6f677920616c6c6f777320796f7520746f2063726561746520637573746f6d2070726f66696c657320746f206d61696e7461696e20636f6e73697374656e7420636f6c6f72206f6e73637265656e20616e6420696e207072696e742e2054686520726573756c743a20596f752063616e20636f6e666964656e746c7920757365207468697320646973706c617920696e20616c6c20796f757220636f6c6f722d637269746963616c206170706c69636174696f6e732e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b486f7573656420696e2061206e657720616c756d696e756d2064657369676e2c2074686520646973706c61792068617320612076657279207468696e2062657a656c207468617420656e68616e6365732076697375616c2061636375726163792e204561636820646973706c61792066656174757265732074776f2046697265576972652034303020706f72747320616e642074776f2055534220322e3020706f7274732c206d616b696e67206174746163686d656e74206f66206465736b746f70207065726970686572616c732c2073756368206173206953696768742c2069506f642c206469676974616c20616e64207374696c6c2063616d657261732c2068617264206472697665732c207072696e7465727320616e64207363616e6e6572732c206576656e206d6f72652061636365737369626c6520616e6420636f6e76656e69656e742e2054616b696e6720616476616e74616765206f6620746865206d756368207468696e6e657220616e64206c69676874657220666f6f747072696e74206f6620616e204c43442c20746865206e657720646973706c61797320737570706f72742074686520564553412028566964656f20456c656374726f6e696373205374616e6461726473204173736f63696174696f6e29206d6f756e74696e6720696e74657266616365207374616e646172642e20437573746f6d657273207769746820746865206f7074696f6e616c2043696e656d6120446973706c61792056455341204d6f756e742041646170746572206b6974206761696e2074686520666c65786962696c69747920746f206d6f756e7420746865697220646973706c617920696e206c6f636174696f6e73206d6f737420617070726f70726961746520666f7220746865697220776f726b20656e7669726f6e6d656e742e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652043696e656d6120484420666561747572657320612073696e676c65206361626c652064657369676e207769746820656c6567616e7420627265616b6f757420666f72207468652055534220322e302c2046697265576972652034303020616e6420612070757265206469676974616c20636f6e6e656374696f6e207573696e672074686520696e647573747279207374616e64617264204469676974616c20566964656f20496e7465726661636520284456492920696e746572666163652e205468652044564920636f6e6e656374696f6e20616c6c6f777320666f7220612064697265637420707572652d6469676974616c20636f6e6e656374696f6e2e266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b2f666f6e742667743b266c743b2f702667743b0d0a266c743b68332667743b0d0a0946656174757265733a266c743b2f68332667743b0d0a266c743b702667743b0d0a09556e726976616c656420646973706c617920706572666f726d616e6365266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e636820287669657761626c6529206163746976652d6d6174726978206c6971756964206372797374616c20646973706c61792070726f76696465732062726561746874616b696e6720696d616765207175616c69747920616e642076697669642c20726963686c792073617475726174656420636f6c6f722e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f7220323536302d62792d3136303020706978656c207265736f6c7574696f6e20666f7220646973706c6179206f66206869676820646566696e6974696f6e207374696c6c20616e6420766964656f20696d61676572792e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909576964652d666f726d61742064657369676e20666f722073696d756c74616e656f757320646973706c6179206f662074776f2066756c6c207061676573206f66207465787420616e642067726170686963732e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909496e647573747279207374616e646172642044564920636f6e6e6563746f7220666f7220646972656374206174746163686d656e7420746f204d61632d20616e642057696e646f77732d6261736564206465736b746f707320616e64206e6f7465626f6f6b73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909496e6372656469626c7920776964652028313730206465677265652920686f72697a6f6e74616c20616e6420766572746963616c2076696577696e6720616e676c6520666f72206d6178696d756d207669736962696c69747920616e6420636f6c6f7220706572666f726d616e63652e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094c696768746e696e672d6661737420706978656c20726573706f6e736520666f722066756c6c2d6d6f74696f6e206469676974616c20766964656f20706c61796261636b2e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f722031362e37206d696c6c696f6e2073617475726174656420636f6c6f72732c20666f722075736520696e20616c6c2067726170686963732d696e74656e73697665206170706c69636174696f6e732e266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a0953696d706c6520736574757020616e64206f7065726174696f6e266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090953696e676c65206361626c65207769746820656c6567616e7420627265616b6f757420666f7220636f6e6e656374696f6e20746f204456492c2055534220616e6420466972655769726520706f727473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e2074776f2d706f72742055534220322e302068756220666f72206561737920636f6e6e656374696f6e206f66206465736b746f70207065726970686572616c20646576696365732e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954776f2046697265576972652034303020706f72747320746f20737570706f72742069536967687420616e64206f74686572206465736b746f70207065726970686572616c73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09536c65656b2c20656c6567616e742064657369676e266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090948756765207669727475616c20776f726b73706163652c207665727920736d616c6c20666f6f747072696e742e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094e6172726f772042657a656c2064657369676e20746f206d696e696d697a652076697375616c20696d70616374206f66207573696e67206475616c20646973706c617973266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909556e697175652068696e67652064657369676e20666f72206566666f72746c6573732061646a7573746d656e74266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f722056455341206d6f756e74696e6720736f6c7574696f6e7320284170706c652043696e656d6120446973706c61792056455341204d6f756e74204164617074657220736f6c642073657061726174656c7929266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b68332667743b0d0a09546563686e6963616c2073706563696669636174696f6e73266c743b2f68332667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2073697a652028646961676f6e616c207669657761626c6520696d6167652073697a6529266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094170706c652043696e656d6120484420446973706c61793a20333020696e63686573202832392e372d696e6368207669657761626c6529266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2074797065266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09095468696e2066696c6d207472616e736973746f72202854465429206163746976652d6d6174726978206c6971756964206372797374616c20646973706c61792028414d4c434429266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b5265736f6c7574696f6e73266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909323536302078203136303020706978656c7320286f7074696d756d207265736f6c7574696f6e29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093230343820782031323830266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093139323020782031323030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090931323830207820383030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090931303234207820363430266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b446973706c617920636f6c6f727320286d6178696d756d29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090931362e37206d696c6c696f6e266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b56696577696e6720616e676c6520287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090931373026616d703b6465673b20686f72697a6f6e74616c3b2031373026616d703b6465673b20766572746963616c266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b4272696768746e65737320287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e63682043696e656d6120484420446973706c61793a203430302063642f6d32266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b436f6e747261737420726174696f20287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09093730303a31266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b526573706f6e73652074696d6520287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09093136206d73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b506978656c207069746368266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e63682043696e656d6120484420446973706c61793a20302e323530206d6d266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2074726561746d656e74266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909416e7469676c6172652068617264636f6174266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b5573657220636f6e74726f6c732028686172647761726520616e6420736f66747761726529266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909446973706c617920506f7765722c266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090953797374656d20736c6565702c2077616b65266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094272696768746e657373266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6f6e69746f722074696c74266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b436f6e6e6563746f727320616e64206361626c6573266c743b2f622667743b266c743b6272202f2667743b0d0a094361626c65266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090944564920284469676974616c2056697375616c20496e7465726661636529266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909466972655769726520343030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090955534220322e30266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909444320706f77657220283234205629266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09436f6e6e6563746f7273266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090954776f2d706f72742c2073656c662d706f77657265642055534220322e3020687562266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954776f2046697265576972652034303020706f727473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094b656e73696e67746f6e20736563757269747920706f7274266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b56455341206d6f756e742061646170746572266c743b2f622667743b266c743b6272202f2667743b0d0a095265717569726573206f7074696f6e616c2043696e656d6120446973706c61792056455341204d6f756e74204164617074657220284d39363439472f4129266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909436f6d70617469626c65207769746820564553412046444d4920284d49532d442c203130302c20432920636f6d706c69616e74206d6f756e74696e6720736f6c7574696f6e73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b456c656374726963616c20726571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909496e70757420766f6c746167653a203130302d323430205641432035302d3630487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6178696d756d20706f776572207768656e206f7065726174696e673a2031353057266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909456e65726779207361766572206d6f64653a203357206f72206c657373266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b456e7669726f6e6d656e74616c20726571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094f7065726174696e672074656d70657261747572653a20353026616d703b6465673b20746f20393526616d703b6465673b20462028313026616d703b6465673b20746f20333526616d703b6465673b204329266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090953746f726167652074656d70657261747572653a202d343026616d703b6465673b20746f2031313626616d703b6465673b204620282d343026616d703b6465673b20746f20343726616d703b6465673b204329266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094f7065726174696e672068756d69646974793a2032302520746f20383025206e6f6e636f6e64656e73696e67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6178696d756d206f7065726174696e6720616c7469747564653a2031302c3030302066656574266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b4167656e637920617070726f76616c73266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909464343205061727420313520436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e353530323220436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e3535303234266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095643434920436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090941532f4e5a53203335343820436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909434e5320313334333820436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909494345532d30303320436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090949534f20313334303620706172742032266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d5052204949266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909494543203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909554c203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909435341203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e3630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e455247592053544152266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954434f2026616d703b2333393b3033266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53697a6520616e6420776569676874266c743b2f622667743b266c743b6272202f2667743b0d0a0933302d696e6368204170706c652043696e656d6120484420446973706c6179266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094865696768743a2032312e3320696e63686573202835342e3320636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696474683a2032372e3220696e63686573202836382e3820636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944657074683a20382e343620696e63686573202832312e3520636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095765696768743a2032372e3520706f756e6473202831322e35206b6729266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53797374656d20526571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094d61632050726f2c20616c6c2067726170686963206f7074696f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6163426f6f6b2050726f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572204d616320473520285043492d582920776974682041544920526164656f6e2039363530206f7220626574746572206f72204e5649444941204765466f72636520363830302047542044444c206f7220626574746572266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572204d616320473520285043492045787072657373292c20616c6c206772617068696373206f7074696f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572426f6f6b2047342077697468206475616c2d6c696e6b2044564920737570706f7274266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696e646f777320504320616e642067726170686963732063617264207468617420737570706f7274732044564920706f7274732077697468206475616c2d6c696e6b206469676974616c2062616e64776964746820616e64205645534120444443207374616e6461726420666f7220706c75672d616e642d706c6179207365747570266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(30, 1, 'Canon EOS 5D', 0x266c743b702667743b0d0a0943616e6f6e2773207072657373206d6174657269616c20666f722074686520454f532035442073746174657320746861742069742027646566696e657320286129206e657720442d534c522063617465676f7279272c207768696c65207765277265206e6f74207479706963616c6c7920746f6f20636f6e6365726e65642077697468206d61726b6574696e672074616c6b207468697320706172746963756c61722073746174656d656e7420697320636c6561726c79207072657474792061636375726174652e2054686520454f5320354420697320756e6c696b6520616e792070726576696f7573206469676974616c20534c5220696e207468617420697420636f6d62696e657320612066756c6c2d6672616d6520283335206d6d2073697a6564292068696768207265736f6c7574696f6e2073656e736f72202831322e38206d656761706978656c7329207769746820612072656c61746976656c7920636f6d7061637420626f64792028736c696768746c79206c6172676572207468616e2074686520454f53203230442c20616c74686f75676820696e20796f75722068616e64206974206665656c73206e6f7469636561626c7920276368756e6b69657227292e2054686520454f532035442069732061696d656420746f20736c6f7420696e206265747765656e2074686520454f532032304420616e642074686520454f532d31442070726f66657373696f6e616c206469676974616c20534c5227732c20616e20696d706f7274616e7420646966666572656e6365207768656e20636f6d706172656420746f20746865206c617474657220697320746861742074686520454f5320354420646f65736e2774206861766520616e7920656e7669726f6e6d656e74616c207365616c732e205768696c652043616e6f6e20646f6e2774207370656369666963616c6c7920726566657220746f2074686520454f532035442061732061202770726f66657373696f6e616c27206469676974616c20534c522069742077696c6c2068617665206f6276696f75732061707065616c20746f2070726f66657373696f6e616c732077686f2077616e7420612068696768207175616c697479206469676974616c20534c5220696e206120626f6479206c696768746572207468616e2074686520454f532d31442e2049742077696c6c20616c736f206e6f20646f7562742061707065616c20746f2063757272656e7420454f5320323044206f776e6572732028616c74686f756768206c65747320686f70652074686579277665206e6f7420626f7567687420746f6f206d616e792045462d53206c656e7365732e2e2e2920c3a4c3ab266c743b2f702667743b0d0a, '', '', ''),
(35, 2, 'Product 8', 0x266c743b702667743b0d0a0950726f647563742038266c743b2f702667743b0d0a, '', '', ''),
(48, 2, 'iPod Classic', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b4d6f726520726f6f6d20746f206d6f76652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909576974682038304742206f72203136304742206f662073746f7261676520616e6420757020746f20343020686f757273206f662062617474657279206c6966652c20746865206e65772069506f6420636c6173736963206c65747320796f7520656e6a6f7920757020746f2034302c30303020736f6e6773206f7220757020746f2032303020686f757273206f6620766964656f206f7220616e7920636f6d62696e6174696f6e20776865726576657220796f7520676f2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b436f76657220466c6f772e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a09090942726f777365207468726f75676820796f7572206d7573696320636f6c6c656374696f6e20627920666c697070696e67207468726f75676820616c62756d206172742e2053656c65637420616e20616c62756d20746f207475726e206974206f76657220616e64207365652074686520747261636b206c6973742e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b456e68616e63656420696e746572666163652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909457870657269656e636520612077686f6c65206e65772077617920746f2062726f77736520616e64207669657720796f7572206d7573696320616e6420766964656f2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b7374726f6e672667743b536c65656b65722064657369676e2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a09090942656175746966756c2c2064757261626c652c20616e6420736c65656b6572207468616e20657665722c2069506f6420636c6173736963206e6f7720666561747572657320616e20616e6f64697a656420616c756d696e756d20616e6420706f6c697368656420737461696e6c65737320737465656c20656e636c6f73757265207769746820726f756e6465642065646765732e266c743b2f702667743b0d0a09266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(40, 2, 'iPhone', 0x266c743b7020636c6173733d2671756f743b696e74726f2671756f743b2667743b0d0a096950686f6e652069732061207265766f6c7574696f6e617279206e6577206d6f62696c652070686f6e65207468617420616c6c6f777320796f7520746f206d616b6520612063616c6c2062792073696d706c792074617070696e672061206e616d65206f72206e756d62657220696e20796f7572206164647265737320626f6f6b2c2061206661766f7269746573206c6973742c206f7220612063616c6c206c6f672e20497420616c736f206175746f6d61746963616c6c792073796e637320616c6c20796f757220636f6e74616374732066726f6d20612050432c204d61632c206f7220496e7465726e657420736572766963652e20416e64206974206c65747320796f752073656c65637420616e64206c697374656e20746f20766f6963656d61696c206d6573736167657320696e207768617465766572206f7264657220796f752077616e74206a757374206c696b6520656d61696c2e266c743b2f702667743b0d0a, '', '', ''),
(28, 2, 'HTC Touch HD', 0x266c743b702667743b0d0a0948544320546f756368202d20696e204869676820446566696e6974696f6e2e205761746368206d7573696320766964656f7320616e642073747265616d696e6720636f6e74656e7420696e206177652d696e73706972696e67206869676820646566696e6974696f6e20636c617269747920666f722061206d6f62696c6520657870657269656e636520796f75206e657665722074686f7567687420706f737369626c652e205365647563746976656c7920736c65656b2c207468652048544320546f7563682048442070726f766964657320746865206e6578742067656e65726174696f6e206f66206d6f62696c652066756e6374696f6e616c6974792c20616c6c20617420612073696d706c6520746f7563682e2046756c6c7920696e746567726174656420776974682057696e646f7773204d6f62696c652050726f66657373696f6e616c20362e312c20756c7472616661737420332e35472c204750532c20354d502063616d6572612c20706c7573206c6f7473206d6f7265202d20616c6c2064656c697665726564206f6e20612062726561746874616b696e676c7920637269737020332e3826616d703b71756f743b205756474120746f75636873637265656e202d20796f752063616e2074616b6520636f6e74726f6c206f6620796f7572206d6f62696c6520776f726c642077697468207468652048544320546f7563682048442e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4665617475726573266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090950726f636573736f72205175616c636f6d6d26616d703b7265673b204d534d20373230314126616d703b74726164653b20353238204d487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696e646f7773204d6f62696c6526616d703b7265673b20362e312050726f66657373696f6e616c204f7065726174696e672053797374656d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d656d6f72793a20353132204d4220524f4d2c20323838204d422052414d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944696d656e73696f6e733a20313135206d6d20782036322e38206d6d2078203132206d6d202f203134362e34206772616d73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909332e382d696e6368205446542d4c434420666c617420746f7563682d73656e7369746976652073637265656e2077697468203438302078203830302057564741207265736f6c7574696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090948534450412f5743444d413a204575726f70652f417369613a203930302f32313030204d487a3b20557020746f2032204d6270732075702d6c696e6b20616e6420372e32204d62707320646f776e2d6c696e6b20737065656473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909517561642d62616e642047534d2f475052532f454447453a204575726f70652f417369613a203835302f3930302f313830302f31393030204d487a202842616e64206672657175656e63792c20485355504120617661696c6162696c6974792c20616e64206461746120737065656420617265206f70657261746f7220646570656e64656e742e29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944657669636520436f6e74726f6c207669612048544320546f756368464c4f26616d703b74726164653b2033442026616d703b616d703b20546f7563682d73656e7369746976652066726f6e742070616e656c20627574746f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090947505320616e6420412d475053207265616479266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909426c7565746f6f746826616d703b7265673b20322e30207769746820456e68616e6365642044617461205261746520616e64204132445020666f7220776972656c6573732073746572656f206865616473657473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957692d466926616d703b7265673b3a2049454545203830322e313120622f67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094854432045787455534226616d703b74726164653b202831312d70696e206d696e692d55534220322e3029266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090935206d656761706978656c20636f6c6f722063616d6572612077697468206175746f20666f637573266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090956474120434d4f5320636f6c6f722063616d657261266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e20332e35206d6d20617564696f206a61636b2c206d6963726f70686f6e652c20737065616b65722c20616e6420464d20726164696f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090952696e6720746f6e6520666f726d6174733a204141432c204141432b2c20654141432b2c20414d522d4e422c20414d522d57422c205143502c204d50332c20574d412c20574156266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909343020706f6c7970686f6e696320616e64207374616e64617264204d49444920666f726d6174203020616e6420312028534d46292f5350204d494449266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909526563686172676561626c65204c69746869756d2d696f6e206f72204c69746869756d2d696f6e20706f6c796d65722031333530206d41682062617474657279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909457870616e73696f6e20536c6f743a206d6963726f534426616d703b74726164653b206d656d6f727920636172642028534420322e3020636f6d70617469626c6529266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094143204164617074657220566f6c746167652072616e67652f6672657175656e63793a20313030207e20323430562041432c2035302f363020487a204443206f75747075743a20355620616e64203141266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095370656369616c2046656174757265733a20464d20526164696f2c20472d53656e736f72266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(44, 2, 'MacBook Air', 0x266c743b6469762667743b0d0a094d6163426f6f6b2041697220697320756c7472617468696e2c20756c747261706f727461626c652c20616e6420756c74726120756e6c696b6520616e797468696e6720656c73652e2042757420796f7520646f6e26616d703b727371756f3b74206c6f736520696e6368657320616e6420706f756e6473206f7665726e696768742e20497426616d703b727371756f3b732074686520726573756c74206f662072657468696e6b696e6720636f6e76656e74696f6e732e204f66206d756c7469706c6520776972656c65737320696e6e6f766174696f6e732e20416e64206f6620627265616b7468726f7567682064657369676e2e2057697468204d6163426f6f6b204169722c206d6f62696c6520636f6d707574696e672073756464656e6c79206861732061206e6577207374616e646172642e266c743b2f6469762667743b0d0a, '', '', ''),
(45, 2, 'MacBook Pro', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4c617465737420496e74656c206d6f62696c6520617263686974656374757265266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909506f776572656420627920746865206d6f737420616476616e636564206d6f62696c652070726f636573736f72732066726f6d20496e74656c2c20746865206e657720436f726520322044756f204d6163426f6f6b2050726f206973206f7665722035302520666173746572207468616e20746865206f726967696e616c20436f72652044756f204d6163426f6f6b2050726f20616e64206e6f7720737570706f72747320757020746f20344742206f662052414d2e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4c656164696e672d65646765206772617068696373266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909546865204e5649444941204765466f72636520383630304d2047542064656c697665727320657863657074696f6e616c2067726170686963732070726f63657373696e6720706f7765722e20466f722074686520756c74696d6174652063726561746976652063616e7661732c20796f752063616e206576656e20636f6e666967757265207468652031372d696e6368206d6f64656c2077697468206120313932302d62792d31323030207265736f6c7574696f6e20646973706c61792e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b44657369676e656420666f72206c696665206f6e2074686520726f6164266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909496e6e6f766174696f6e7320737563682061732061206d61676e6574696320706f77657220636f6e6e656374696f6e20616e6420616e20696c6c756d696e61746564206b6579626f617264207769746820616d6269656e74206c696768742073656e736f722070757420746865204d6163426f6f6b2050726f20696e206120636c61737320627920697473656c662e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b436f6e6e6563742e204372656174652e20436f6d6d756e69636174652e266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909517569636b6c7920736574207570206120766964656f20636f6e666572656e6365207769746820746865206275696c742d696e206953696768742063616d6572612e20436f6e74726f6c2070726573656e746174696f6e7320616e64206d656469612066726f6d20757020746f2033302066656574206177617920776974682074686520696e636c75646564204170706c652052656d6f74652e20436f6e6e65637420746f20686967682d62616e647769647468207065726970686572616c7320776974682046697265576972652038303020616e64204456492e266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909266c743b622667743b4e6578742d67656e65726174696f6e20776972656c657373266c743b2f622667743b266c743b2f702667743b0d0a0909266c743b702667743b0d0a090909466561747572696e67203830322e31316e20776972656c65737320746563686e6f6c6f67792c20746865204d6163426f6f6b2050726f2064656c697665727320757020746f20666976652074696d65732074686520706572666f726d616e636520616e6420757020746f207477696365207468652072616e6765206f662070726576696f75732d67656e65726174696f6e20746563686e6f6c6f676965732e266c743b2f702667743b0d0a09266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(29, 2, 'Palm Treo Pro', 0x266c743b702667743b0d0a095265646566696e6520796f757220776f726b6461792077697468207468652050616c6d205472656f2050726f20736d61727470686f6e652e20506572666563746c792062616c616e6365642c20796f752063616e20726573706f6e6420746f20627573696e65737320616e6420706572736f6e616c20656d61696c2c2073746179206f6e20746f70206f66206170706f696e746d656e747320616e6420636f6e74616374732c20616e64207573652057692d4669206f7220475053207768656e20796f7526616d703b727371756f3b7265206f757420616e642061626f75742e205468656e207761746368206120766964656f206f6e20596f75547562652c2063617463682075702077697468206e65777320616e642073706f727473206f6e20746865207765622c206f72206c697374656e20746f20612066657720736f6e67732e2042616c616e636520796f757220776f726b20616e6420706c6179207468652077617920796f75206c696b652069742c2077697468207468652050616c6d205472656f2050726f2e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4665617475726573266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090957696e646f7773204d6f62696c6526616d703b7265673b20362e312050726f66657373696f6e616c2045646974696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095175616c636f6d6d26616d703b7265673b204d534d37323031203430304d487a2050726f636573736f72266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090933323078333230207472616e73666c65637469766520636f6c6f75722054465420746f75636873637265656e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090948534450412f554d54532f454447452f475052532f47534d20726164696f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095472692d62616e6420554d54532026616d703b6d646173683b203835304d487a2c20313930304d487a2c20323130304d487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909517561642d62616e642047534d2026616d703b6d646173683b203835302f3930302f313830302f31393030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093830322e3131622f672077697468205750412c20575041322c20616e64203830312e31782061757468656e7469636174696f6e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e20475053266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909426c7565746f6f74682056657273696f6e3a20322e30202b20456e68616e63656420446174612052617465266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093235364d422073746f7261676520283130304d42207573657220617661696c61626c65292c203132384d422052414d266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909322e30206d656761706978656c2063616d6572612c20757020746f203878206469676974616c207a6f6f6d20616e6420766964656f2063617074757265266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090952656d6f7661626c652c20726563686172676561626c6520313530306d4168206c69746869756d2d696f6e2062617474657279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909557020746f20352e3020686f7572732074616c6b2074696d6520616e6420757020746f2032353020686f757273207374616e646279266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6963726f53444843206361726420657870616e73696f6e2028757020746f203332474220737570706f7274656429266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6963726f55534220322e3020666f722073796e6368726f6e697a6174696f6e20616e64206368617267696e67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909332e356d6d2073746572656f2068656164736574206a61636b266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090936306d6d202857292078203131346d6d20284c2920782031332e356d6d20284429202f2031333367266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(36, 2, 'iPod Nano', 0x266c743b6469762667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b566964656f20696e20796f757220706f636b65742e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09094974732074686520736d616c6c2069506f642077697468206f6e6520766572792062696720696465613a20766964656f2e2054686520776f726c6473206d6f737420706f70756c6172206d7573696320706c61796572206e6f77206c65747320796f7520656e6a6f79206d6f766965732c2054562073686f77732c20616e64206d6f7265206f6e20612074776f2d696e636820646973706c617920746861747320363525206272696768746572207468616e206265666f72652e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b436f76657220466c6f772e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a090942726f777365207468726f75676820796f7572206d7573696320636f6c6c656374696f6e20627920666c697070696e67207468726f75676820616c62756d206172742e2053656c65637420616e20616c62756d20746f207475726e206974206f76657220616e64207365652074686520747261636b206c6973742e266c743b7374726f6e672667743b26616d703b6e6273703b266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b456e68616e63656420696e746572666163652e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909457870657269656e636520612077686f6c65206e65772077617920746f2062726f77736520616e64207669657720796f7572206d7573696320616e6420766964656f2e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b536c65656b20616e6420636f6c6f7266756c2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09095769746820616e20616e6f64697a656420616c756d696e756d20616e6420706f6c697368656420737461696e6c65737320737465656c20656e636c6f7375726520616e6420612063686f696365206f66206669766520636f6c6f72732c2069506f64206e616e6f206973206472657373656420746f20696d70726573732e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b6954756e65732e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909417661696c61626c652061732061206672656520646f776e6c6f61642c206954756e6573206d616b6573206974206561737920746f2062726f77736520616e6420627579206d696c6c696f6e73206f6620736f6e67732c206d6f766965732c2054562073686f77732c20617564696f626f6f6b732c20616e642067616d657320616e6420646f776e6c6f6164206672656520706f64636173747320616c6c20617420746865206954756e65732053746f72652e20416e6420796f752063616e20696d706f727420796f7572206f776e206d757369632c206d616e61676520796f75722077686f6c65206d65646961206c6962726172792c20616e642073796e6320796f75722069506f64206f72206950686f6e65207769746820656173652e266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', ''),
(46, 2, 'Sony VAIO', 0x266c743b6469762667743b0d0a09556e707265636564656e74656420706f7765722e20546865206e6578742067656e65726174696f6e206f662070726f63657373696e6720746563686e6f6c6f67792068617320617272697665642e204275696c7420696e746f20746865206e6577657374205641494f206e6f7465626f6f6b73206c69657320496e74656c26616d703b2333393b73206c61746573742c206d6f737420706f77657266756c20696e6e6f766174696f6e207965743a20496e74656c26616d703b7265673b2043656e7472696e6f26616d703b7265673b20322070726f636573736f7220746563686e6f6c6f67792e20426f617374696e6720696e6372656469626c652073706565642c20657870616e64656420776972656c65737320636f6e6e65637469766974792c20656e68616e636564206d756c74696d6564696120737570706f727420616e64206772656174657220656e6572677920656666696369656e63792c20616c6c2074686520686967682d706572666f726d616e636520657373656e7469616c7320617265207365616d6c6573736c7920636f6d62696e656420696e746f20612073696e676c6520636869702e266c743b2f6469762667743b0d0a, '', '', ''),
(47, 2, 'HP LP3065', 0x266c743b702667743b0d0a0953746f7020796f757220636f2d776f726b65727320696e20746865697220747261636b73207769746820746865207374756e6e696e67206e65772033302d696e636820646961676f6e616c204850204c503330363520466c61742050616e656c204d6f6e69746f722e205468697320666c616773686970206d6f6e69746f7220666561747572657320626573742d696e2d636c61737320706572666f726d616e636520616e642070726573656e746174696f6e206665617475726573206f6e2061206875676520776964652d6173706563742073637265656e207768696c65206c657474696e6720796f7520776f726b20617320636f6d666f727461626c7920617320706f737369626c65202d20796f75206d69676874206576656e20666f7267657420796f7526616d703b2333393b726520617420746865206f6666696365266c743b2f702667743b0d0a, '', '', ''),
(32, 2, 'iPod Touch', 0x266c743b702667743b0d0a09266c743b7374726f6e672667743b5265766f6c7574696f6e617279206d756c74692d746f75636820696e746572666163652e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0969506f6420746f756368206665617475726573207468652073616d65206d756c74692d746f7563682073637265656e20746563686e6f6c6f6779206173206950686f6e652e2050696e636820746f207a6f6f6d20696e206f6e20612070686f746f2e205363726f6c6c207468726f75676820796f757220736f6e677320616e6420766964656f732077697468206120666c69636b2e20466c6970207468726f75676820796f7572206c69627261727920627920616c62756d20617274776f726b207769746820436f76657220466c6f772e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b476f7267656f757320332e352d696e6368207769646573637265656e20646973706c61792e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a09576174636820796f7572206d6f766965732c2054562073686f77732c20616e642070686f746f7320636f6d6520616c6976652077697468206272696768742c20766976696420636f6c6f72206f6e20746865203332302d62792d3438302d706978656c20646973706c61792e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b4d7573696320646f776e6c6f6164732073747261696768742066726f6d206954756e65732e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0953686f7020746865206954756e65732057692d4669204d757369632053746f72652066726f6d20616e79776865726520776974682057692d46692e312042726f777365206f722073656172636820746f2066696e6420746865206d7573696320796f757265206c6f6f6b696e6720666f722c20707265766965772069742c20616e64206275792069742077697468206a7573742061207461702e266c743b2f702667743b0d0a266c743b702667743b0d0a09266c743b7374726f6e672667743b53757266207468652077656220776974682057692d46692e266c743b2f7374726f6e672667743b266c743b6272202f2667743b0d0a0942726f7773652074686520776562207573696e672053616661726920616e6420776174636820596f755475626520766964656f73206f6e207468652066697273742069506f6420776974682057692d4669206275696c7420696e266c743b6272202f2667743b0d0a0926616d703b6e6273703b266c743b2f702667743b0d0a, '', '', ''),
(41, 2, 'iMac', 0x266c743b6469762667743b0d0a094a757374207768656e20796f752074686f7567687420694d6163206861642065766572797468696e672c206e6f772074686572652661637574653b73206576656e206d6f72652e204d6f726520706f77657266756c20496e74656c20436f726520322044756f2070726f636573736f72732e20416e64206d6f7265206d656d6f7279207374616e646172642e20436f6d62696e6520746869732077697468204d6163204f532058204c656f7061726420616e6420694c696665202661637574653b30382c20616e642069742661637574653b73206d6f726520616c6c2d696e2d6f6e65207468616e20657665722e20694d6163207061636b7320616d617a696e6720706572666f726d616e636520696e746f2061207374756e6e696e676c7920736c696d2073706163652e266c743b2f6469762667743b0d0a, '', '', ''),
(33, 2, 'Samsung SyncMaster 941BW', 0x266c743b6469762667743b0d0a09496d6167696e652074686520616476616e7461676573206f6620676f696e672062696720776974686f757420736c6f77696e6720646f776e2e205468652062696720313926616d703b71756f743b203934314257206d6f6e69746f7220636f6d62696e657320776964652061737065637420726174696f2077697468206661737420706978656c20726573706f6e73652074696d652c20666f722062696767657220696d616765732c206d6f726520726f6f6d20746f20776f726b20616e64206372697370206d6f74696f6e2e20496e206164646974696f6e2c20746865206578636c7573697665204d6167696342726967687420322c204d61676963436f6c6f7220616e64204d6167696354756e6520746563686e6f6c6f676965732068656c702064656c697665722074686520696465616c20696d61676520696e20657665727920736974756174696f6e2c207768696c6520736c65656b2c206e6172726f772062657a656c7320616e642061646a75737461626c65207374616e64732064656c69766572207374796c65206a757374207468652077617920796f752077616e742069742e2057697468207468652053616d73756e67203934314257207769646573637265656e20616e616c6f672f6469676974616c204c4344206d6f6e69746f722c20697426616d703b2333393b73206e6f74206861726420746f20696d6167696e652e266c743b2f6469762667743b0d0a, '', '', ''),
(34, 2, 'iPod Shuffle', 0x266c743b6469762667743b0d0a09266c743b7374726f6e672667743b426f726e20746f20626520776f726e2e266c743b2f7374726f6e672667743b0d0a09266c743b702667743b0d0a0909436c6970206f6e2074686520776f726c6473206d6f7374207765617261626c65206d7573696320706c6179657220616e642074616b6520757020746f2032343020736f6e6773207769746820796f7520616e7977686572652e2043686f6f73652066726f6d206669766520636f6c6f727320696e636c7564696e6720666f7572206e6577206875657320746f206d616b6520796f7572206d75736963616c2066617368696f6e2073746174656d656e742e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b7374726f6e672667743b52616e646f6d206d656574732072687974686d2e266c743b2f7374726f6e672667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a090957697468206954756e6573206175746f66696c6c2c2069506f642073687566666c652063616e2064656c697665722061206e6577206d75736963616c20657870657269656e63652065766572792074696d6520796f752073796e632e20466f72206d6f72652072616e646f6d6e6573732c20796f752063616e2073687566666c6520736f6e677320647572696e6720706c61796261636b20776974682074686520736c696465206f662061207377697463682e266c743b2f702667743b0d0a09266c743b7374726f6e672667743b45766572797468696e6720697320656173792e266c743b2f7374726f6e672667743b0d0a09266c743b702667743b0d0a090943686172676520616e642073796e6320776974682074686520696e636c756465642055534220646f636b2e204f706572617465207468652069506f642073687566666c6520636f6e74726f6c732077697468206f6e652068616e642e20456e6a6f7920757020746f20313220686f757273207374726169676874206f6620736b69702d66726565206d7573696320706c61796261636b2e266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', ''),
(43, 2, 'MacBook', 0x266c743b6469762667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b496e74656c20436f726520322044756f2070726f636573736f72266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909506f776572656420627920616e20496e74656c20436f726520322044756f2070726f636573736f722061742073706565647320757020746f20322e313647487a2c20746865206e6577204d6163426f6f6b20697320746865206661737465737420657665722e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b314742206d656d6f72792c206c6172676572206861726420647269766573266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a0909546865206e6577204d6163426f6f6b206e6f7720636f6d6573207769746820314742206f66206d656d6f7279207374616e6461726420616e64206c617267657220686172642064726976657320666f722074686520656e74697265206c696e65207065726665637420666f722072756e6e696e67206d6f7265206f6620796f7572206661766f72697465206170706c69636174696f6e7320616e642073746f72696e672067726f77696e67206d6564696120636f6c6c656374696f6e732e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b536c65656b2c20312e30382d696e63682d7468696e2064657369676e266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09094d6163426f6f6b206d616b6573206974206561737920746f206869742074686520726f6164207468616e6b7320746f2069747320746f75676820706f6c79636172626f6e61746520636173652c206275696c742d696e20776972656c65737320746563686e6f6c6f676965732c20616e6420696e6e6f766174697665204d61675361666520506f776572204164617074657220746861742072656c6561736573206175746f6d61746963616c6c7920696620736f6d656f6e65206163636964656e74616c6c79207472697073206f6e2074686520636f72642e266c743b2f702667743b0d0a09266c743b702667743b0d0a0909266c743b622667743b4275696c742d696e206953696768742063616d657261266c743b2f622667743b266c743b2f702667743b0d0a09266c743b702667743b0d0a09095269676874206f7574206f662074686520626f782c20796f752063616e2068617665206120766964656f2063686174207769746820667269656e6473206f722066616d696c792c32207265636f7264206120766964656f20617420796f7572206465736b2c206f722074616b652066756e20706963747572657320776974682050686f746f20426f6f7468266c743b2f702667743b0d0a266c743b2f6469762667743b0d0a, '', '', '');
INSERT INTO `product_description` (`product_id`, `language_id`, `name`, `description`, `meta_description`, `meta_keyword`, `tag`) VALUES
(31, 2, 'Nikon D300', 0x266c743b64697620636c6173733d2671756f743b6370745f70726f647563745f6465736372697074696f6e202671756f743b2667743b0d0a09266c743b6469762667743b0d0a0909456e67696e656572656420776974682070726f2d6c6576656c20666561747572657320616e6420706572666f726d616e63652c207468652031322e332d6566666563746976652d6d656761706978656c204433303020636f6d62696e6573206272616e64206e657720746563686e6f6c6f67696573207769746820616476616e63656420666561747572657320696e686572697465642066726f6d204e696b6f6e26616d703b2333393b73206e65776c7920616e6e6f756e6365642044332070726f66657373696f6e616c206469676974616c20534c522063616d65726120746f206f6666657220736572696f75732070686f746f67726170686572732072656d61726b61626c6520706572666f726d616e636520636f6d62696e65642077697468206167696c6974792e266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a090953696d696c617220746f207468652044332c207468652044333030206665617475726573204e696b6f6e26616d703b2333393b73206578636c75736976652045585045454420496d6167652050726f63657373696e672053797374656d20746861742069732063656e7472616c20746f2064726976696e672074686520737065656420616e642070726f63657373696e6720706f776572206e656564656420666f72206d616e79206f66207468652063616d65726126616d703b2333393b73206e65772066656174757265732e2054686520443330302066656174757265732061206e65772035312d706f696e74206175746f666f6375732073797374656d2077697468204e696b6f6e26616d703b2333393b7320334420466f63757320547261636b696e67206665617475726520616e642074776f206e6577204c697665566965772073686f6f74696e67206d6f646573207468617420616c6c6f7720757365727320746f206672616d6520612070686f746f6772617068207573696e67207468652063616d65726126616d703b2333393b7320686967682d7265736f6c7574696f6e204c4344206d6f6e69746f722e2054686520443330302073686172657320612073696d696c6172205363656e65205265636f676e6974696f6e2053797374656d20617320697320666f756e6420696e207468652044333b2069742070726f6d6973657320746f2067726561746c7920656e68616e636520746865206163637572616379206f66206175746f666f6375732c206175746f6578706f737572652c20616e64206175746f2077686974652062616c616e6365206279207265636f676e697a696e6720746865207375626a656374206f72207363656e65206265696e672070686f746f6772617068656420616e64206170706c79696e67207468697320696e666f726d6174696f6e20746f207468652063616c63756c6174696f6e7320666f72207468652074687265652066756e6374696f6e732e266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a09095468652044333030207265616374732077697468206c696768746e696e672073706565642c20706f776572696e6720757020696e2061206d65726520302e3133207365636f6e647320616e642073686f6f74696e67207769746820616e20696d7065726365707469626c652034352d6d696c6c697365636f6e6420736875747465722072656c65617365206c61672074696d652e2054686520443330302069732063617061626c65206f662073686f6f74696e67206174206120726170696420736978206672616d657320706572207365636f6e6420616e642063616e20676f2061732066617374206173206569676874206672616d657320706572207365636f6e64207768656e207573696e6720746865206f7074696f6e616c204d422d443130206d756c74692d706f7765722062617474657279207061636b2e20496e20636f6e74696e756f7573206275727374732c2074686520443330302063616e2073686f6f7420757020746f203130302073686f74732061742066756c6c2031322e332d6d656761706978656c207265736f6c7574696f6e2e20284e4f524d414c2d4c4152474520696d6167652073657474696e672c207573696e6720612053616e4469736b2045787472656d652049562031474220436f6d70616374466c61736820636172642e29266c743b6272202f2667743b0d0a0909266c743b6272202f2667743b0d0a0909546865204433303020696e636f72706f726174657320612072616e6765206f6620696e6e6f76617469766520746563686e6f6c6f6769657320616e6420666561747572657320746861742077696c6c207369676e69666963616e746c7920696d70726f7665207468652061636375726163792c20636f6e74726f6c2c20616e6420706572666f726d616e63652070686f746f67726170686572732063616e206765742066726f6d2074686569722065717569706d656e742e20497473206e6577205363656e65205265636f676e6974696f6e2053797374656d20616476616e6365732074686520757365206f66204e696b6f6e26616d703b2333393b73206163636c61696d656420312c3030352d7365676d656e742073656e736f7220746f207265636f676e697a6520636f6c6f727320616e64206c69676874207061747465726e7320746861742068656c70207468652063616d6572612064657465726d696e6520746865207375626a65637420616e64207468652074797065206f66207363656e65206265696e672070686f746f67726170686564206265666f7265206120706963747572652069732074616b656e2e205468697320696e666f726d6174696f6e206973207573656420746f20696d70726f766520746865206163637572616379206f66206175746f666f6375732c206175746f6578706f737572652c20616e64206175746f2077686974652062616c616e63652066756e6374696f6e7320696e2074686520443330302e20466f72206578616d706c652c207468652063616d6572612063616e20747261636b206d6f76696e67207375626a656374732062657474657220616e64206279206964656e74696679696e67207468656d2c2069742063616e20616c736f206175746f6d61746963616c6c792073656c65637420666f63757320706f696e74732066617374657220616e64207769746820677265617465722061636375726163792e2049742063616e20616c736f20616e616c797a6520686967686c696768747320616e64206d6f72652061636375726174656c792064657465726d696e65206578706f737572652c2061732077656c6c20617320696e666572206c6967687420736f757263657320746f2064656c69766572206d6f72652061636375726174652077686974652062616c616e636520646574656374696f6e2e266c743b2f6469762667743b0d0a266c743b2f6469762667743b0d0a266c743b212d2d206370745f636f6e7461696e65725f656e64202d2d2667743b, '', '', ''),
(49, 2, 'Samsung Galaxy Tab 10.1', 0x266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e312c2069732074686520776f726c6426616d703b727371756f3b73207468696e6e657374207461626c65742c206d6561737572696e6720382e36206d6d20746869636b6e6573732c2072756e6e696e67207769746820416e64726f696420332e3020486f6e6579636f6d62204f53206f6e2061203147487a206475616c2d636f726520546567726120322070726f636573736f722c2073696d696c617220746f2069747320796f756e6765722062726f746865722053616d73756e672047616c6178792054616220382e392e266c743b2f702667743b0d0a266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e31206769766573207075726520416e64726f696420332e3020657870657269656e63652c20616464696e6720697473206e657720546f75636857697a205558206f7220546f75636857697a20342e302026616d703b6e646173683b20696e636c756465732061206c6976652070616e656c2c207768696368206c65747320796f7520746f20637573746f6d697a65207769746820646966666572656e7420636f6e74656e742c207375636820617320796f75722070696374757265732c20626f6f6b6d61726b732c20616e6420736f6369616c2066656564732c2073706f7274696e6720612031302e3120696e636865732057584741206361706163697469766520746f7563682073637265656e2077697468203132383020782038303020706978656c73206f66207265736f6c7574696f6e2c20657175697070656420776974682033206d656761706978656c20726561722063616d6572612077697468204c454420666c61736820616e6420612032206d656761706978656c2066726f6e742063616d6572612c20485350412b20636f6e6e656374697669747920757020746f2032314d6270732c203732307020484420766964656f207265636f7264696e67206361706162696c6974792c20313038307020484420706c61796261636b2c20444c4e4120737570706f72742c20426c7565746f6f746820322e312c2055534220322e302c206779726f73636f70652c2057692d4669203830322e313120612f622f672f6e2c206d6963726f2d534420736c6f742c20332e356d6d206865616470686f6e65206a61636b2c20616e642053494d20736c6f742c20696e636c7564696e67207468652053616d73756e6720537469636b2026616d703b6e646173683b206120426c7565746f6f7468206d6963726f70686f6e6520746861742063616e206265206361727269656420696e206120706f636b6574206c696b6520612070656e20616e6420736f756e6420646f636b207769746820706f776572656420737562776f6f6665722e266c743b2f702667743b0d0a266c743b702667743b0d0a0953616d73756e672047616c617879205461622031302e312077696c6c20636f6d6520696e2031364742202f2033324742202f203634474220766572697469657320616e64207072652d6c6f61646564207769746820536f6369616c204875622c2052656164657226616d703b727371756f3b73204875622c204d757369632048756220616e642053616d73756e67204d696e69204170707320547261792026616d703b6e646173683b20776869636820676976657320796f752061636365737320746f206d6f726520636f6d6d6f6e6c792075736564206170707320746f2068656c702065617365206d756c74697461736b696e6720616e642069742069732063617061626c65206f662041646f626520466c61736820506c617965722031302e322c20706f776572656420627920363836306d41682062617474657279207468617420676976657320796f75203130686f757273206f6620766964656f2d706c61796261636b2074696d652e26616d703b6e6273703b26616d703b61756d6c3b26616d703b6f756d6c3b266c743b2f702667743b0d0a, '', '', ''),
(42, 2, 'Apple Cinema 30&quot;', 0x266c743b702667743b0d0a09266c743b666f6e7420666163653d2671756f743b68656c7665746963612c67656e6576612c617269616c2671756f743b2073697a653d2671756f743b322671756f743b2667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652033302d696e6368204170706c652043696e656d6120484420446973706c61792064656c697665727320616e20616d617a696e6720323536302078203136303020706978656c207265736f6c7574696f6e2e2044657369676e6564207370656369666963616c6c7920666f72207468652063726561746976652070726f66657373696f6e616c2c207468697320646973706c61792070726f7669646573206d6f726520737061636520666f72206561736965722061636365737320746f20616c6c2074686520746f6f6c7320616e642070616c6574746573206e656564656420746f20656469742c20666f726d617420616e6420636f6d706f7369746520796f757220776f726b2e20436f6d62696e65207468697320646973706c617920776974682061204d61632050726f2c204d6163426f6f6b2050726f2c206f7220506f7765724d616320473520616e6420746865726526616d703b2333393b73206e6f206c696d697420746f207768617420796f752063616e20616368696576652e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652043696e656d6120484420666561747572657320616e206163746976652d6d6174726978206c6971756964206372797374616c20646973706c617920746861742070726f647563657320666c69636b65722d6672656520696d6167657320746861742064656c6976657220747769636520746865206272696768746e6573732c207477696365207468652073686172706e65737320616e642074776963652074686520636f6e747261737420726174696f206f662061207479706963616c2043525420646973706c61792e20556e6c696b65206f7468657220666c61742070616e656c732c20697426616d703b2333393b732064657369676e6564207769746820612070757265206469676974616c20696e7465726661636520746f2064656c6976657220646973746f7274696f6e2d6672656520696d616765732074686174206e65766572206e6565642061646a757374696e672e2057697468206f7665722034206d696c6c696f6e206469676974616c20706978656c732c2074686520646973706c617920697320756e697175656c792073756974656420666f7220736369656e746966696320616e6420746563686e6963616c206170706c69636174696f6e7320737563682061732076697375616c697a696e67206d6f6c6563756c61722073747275637475726573206f7220616e616c797a696e672067656f6c6f676963616c20646174612e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b4f66666572696e672061636375726174652c206272696c6c69616e7420636f6c6f7220706572666f726d616e63652c207468652043696e656d612048442064656c697665727320757020746f2031362e37206d696c6c696f6e20636f6c6f7273206163726f7373206120776964652067616d757420616c6c6f77696e6720796f7520746f2073656520737562746c65206e75616e636573206265747765656e20636f6c6f72732066726f6d20736f66742070617374656c7320746f2072696368206a6577656c20746f6e65732e204120776964652076696577696e6720616e676c6520656e737572657320756e69666f726d20636f6c6f722066726f6d206564676520746f20656467652e204170706c6526616d703b2333393b7320436f6c6f7253796e6320746563686e6f6c6f677920616c6c6f777320796f7520746f2063726561746520637573746f6d2070726f66696c657320746f206d61696e7461696e20636f6e73697374656e7420636f6c6f72206f6e73637265656e20616e6420696e207072696e742e2054686520726573756c743a20596f752063616e20636f6e666964656e746c7920757365207468697320646973706c617920696e20616c6c20796f757220636f6c6f722d637269746963616c206170706c69636174696f6e732e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b486f7573656420696e2061206e657720616c756d696e756d2064657369676e2c2074686520646973706c61792068617320612076657279207468696e2062657a656c207468617420656e68616e6365732076697375616c2061636375726163792e204561636820646973706c61792066656174757265732074776f2046697265576972652034303020706f72747320616e642074776f2055534220322e3020706f7274732c206d616b696e67206174746163686d656e74206f66206465736b746f70207065726970686572616c732c2073756368206173206953696768742c2069506f642c206469676974616c20616e64207374696c6c2063616d657261732c2068617264206472697665732c207072696e7465727320616e64207363616e6e6572732c206576656e206d6f72652061636365737369626c6520616e6420636f6e76656e69656e742e2054616b696e6720616476616e74616765206f6620746865206d756368207468696e6e657220616e64206c69676874657220666f6f747072696e74206f6620616e204c43442c20746865206e657720646973706c61797320737570706f72742074686520564553412028566964656f20456c656374726f6e696373205374616e6461726473204173736f63696174696f6e29206d6f756e74696e6720696e74657266616365207374616e646172642e20437573746f6d657273207769746820746865206f7074696f6e616c2043696e656d6120446973706c61792056455341204d6f756e742041646170746572206b6974206761696e2074686520666c65786962696c69747920746f206d6f756e7420746865697220646973706c617920696e206c6f636174696f6e73206d6f737420617070726f70726961746520666f7220746865697220776f726b20656e7669726f6e6d656e742e20266c743b6272202f2667743b0d0a09266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b666f6e7420666163653d2671756f743b48656c7665746963612671756f743b2073697a653d2671756f743b322671756f743b2667743b5468652043696e656d6120484420666561747572657320612073696e676c65206361626c652064657369676e207769746820656c6567616e7420627265616b6f757420666f72207468652055534220322e302c2046697265576972652034303020616e6420612070757265206469676974616c20636f6e6e656374696f6e207573696e672074686520696e647573747279207374616e64617264204469676974616c20566964656f20496e7465726661636520284456492920696e746572666163652e205468652044564920636f6e6e656374696f6e20616c6c6f777320666f7220612064697265637420707572652d6469676974616c20636f6e6e656374696f6e2e266c743b6272202f2667743b0d0a09266c743b2f666f6e742667743b266c743b2f666f6e742667743b266c743b2f702667743b0d0a266c743b68332667743b0d0a0946656174757265733a266c743b2f68332667743b0d0a266c743b702667743b0d0a09556e726976616c656420646973706c617920706572666f726d616e6365266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e636820287669657761626c6529206163746976652d6d6174726978206c6971756964206372797374616c20646973706c61792070726f76696465732062726561746874616b696e6720696d616765207175616c69747920616e642076697669642c20726963686c792073617475726174656420636f6c6f722e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f7220323536302d62792d3136303020706978656c207265736f6c7574696f6e20666f7220646973706c6179206f66206869676820646566696e6974696f6e207374696c6c20616e6420766964656f20696d61676572792e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909576964652d666f726d61742064657369676e20666f722073696d756c74616e656f757320646973706c6179206f662074776f2066756c6c207061676573206f66207465787420616e642067726170686963732e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909496e647573747279207374616e646172642044564920636f6e6e6563746f7220666f7220646972656374206174746163686d656e7420746f204d61632d20616e642057696e646f77732d6261736564206465736b746f707320616e64206e6f7465626f6f6b73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909496e6372656469626c7920776964652028313730206465677265652920686f72697a6f6e74616c20616e6420766572746963616c2076696577696e6720616e676c6520666f72206d6178696d756d207669736962696c69747920616e6420636f6c6f7220706572666f726d616e63652e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094c696768746e696e672d6661737420706978656c20726573706f6e736520666f722066756c6c2d6d6f74696f6e206469676974616c20766964656f20706c61796261636b2e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f722031362e37206d696c6c696f6e2073617475726174656420636f6c6f72732c20666f722075736520696e20616c6c2067726170686963732d696e74656e73697665206170706c69636174696f6e732e266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a0953696d706c6520736574757020616e64206f7065726174696f6e266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090953696e676c65206361626c65207769746820656c6567616e7420627265616b6f757420666f7220636f6e6e656374696f6e20746f204456492c2055534220616e6420466972655769726520706f727473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094275696c742d696e2074776f2d706f72742055534220322e302068756220666f72206561737920636f6e6e656374696f6e206f66206465736b746f70207065726970686572616c20646576696365732e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954776f2046697265576972652034303020706f72747320746f20737570706f72742069536967687420616e64206f74686572206465736b746f70207065726970686572616c73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09536c65656b2c20656c6567616e742064657369676e266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090948756765207669727475616c20776f726b73706163652c207665727920736d616c6c20666f6f747072696e742e266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094e6172726f772042657a656c2064657369676e20746f206d696e696d697a652076697375616c20696d70616374206f66207573696e67206475616c20646973706c617973266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909556e697175652068696e67652064657369676e20666f72206566666f72746c6573732061646a7573746d656e74266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909537570706f727420666f722056455341206d6f756e74696e6720736f6c7574696f6e7320284170706c652043696e656d6120446973706c61792056455341204d6f756e74204164617074657220736f6c642073657061726174656c7929266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b68332667743b0d0a09546563686e6963616c2073706563696669636174696f6e73266c743b2f68332667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2073697a652028646961676f6e616c207669657761626c6520696d6167652073697a6529266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094170706c652043696e656d6120484420446973706c61793a20333020696e63686573202832392e372d696e6368207669657761626c6529266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2074797065266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09095468696e2066696c6d207472616e736973746f72202854465429206163746976652d6d6174726978206c6971756964206372797374616c20646973706c61792028414d4c434429266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b5265736f6c7574696f6e73266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909323536302078203136303020706978656c7320286f7074696d756d207265736f6c7574696f6e29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093230343820782031323830266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09093139323020782031323030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090931323830207820383030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090931303234207820363430266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b446973706c617920636f6c6f727320286d6178696d756d29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090931362e37206d696c6c696f6e266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b56696577696e6720616e676c6520287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090931373026616d703b6465673b20686f72697a6f6e74616c3b2031373026616d703b6465673b20766572746963616c266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b4272696768746e65737320287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e63682043696e656d6120484420446973706c61793a203430302063642f6d32266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b436f6e747261737420726174696f20287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09093730303a31266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b526573706f6e73652074696d6520287479706963616c29266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09093136206d73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b506978656c207069746368266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090933302d696e63682043696e656d6120484420446973706c61793a20302e323530206d6d266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53637265656e2074726561746d656e74266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909416e7469676c6172652068617264636f6174266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b5573657220636f6e74726f6c732028686172647761726520616e6420736f66747761726529266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909446973706c617920506f7765722c266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090953797374656d20736c6565702c2077616b65266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094272696768746e657373266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6f6e69746f722074696c74266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b436f6e6e6563746f727320616e64206361626c6573266c743b2f622667743b266c743b6272202f2667743b0d0a094361626c65266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090944564920284469676974616c2056697375616c20496e7465726661636529266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909466972655769726520343030266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090955534220322e30266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909444320706f77657220283234205629266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09436f6e6e6563746f7273266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a090954776f2d706f72742c2073656c662d706f77657265642055534220322e3020687562266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954776f2046697265576972652034303020706f727473266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094b656e73696e67746f6e20736563757269747920706f7274266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b56455341206d6f756e742061646170746572266c743b2f622667743b266c743b6272202f2667743b0d0a095265717569726573206f7074696f6e616c2043696e656d6120446973706c61792056455341204d6f756e74204164617074657220284d39363439472f4129266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909436f6d70617469626c65207769746820564553412046444d4920284d49532d442c203130302c20432920636f6d706c69616e74206d6f756e74696e6720736f6c7574696f6e73266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b456c656374726963616c20726571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909496e70757420766f6c746167653a203130302d323430205641432035302d3630487a266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6178696d756d20706f776572207768656e206f7065726174696e673a2031353057266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909456e65726779207361766572206d6f64653a203357206f72206c657373266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b456e7669726f6e6d656e74616c20726571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094f7065726174696e672074656d70657261747572653a20353026616d703b6465673b20746f20393526616d703b6465673b20462028313026616d703b6465673b20746f20333526616d703b6465673b204329266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090953746f726167652074656d70657261747572653a202d343026616d703b6465673b20746f2031313626616d703b6465673b204620282d343026616d703b6465673b20746f20343726616d703b6465673b204329266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094f7065726174696e672068756d69646974793a2032302520746f20383025206e6f6e636f6e64656e73696e67266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6178696d756d206f7065726174696e6720616c7469747564653a2031302c3030302066656574266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b4167656e637920617070726f76616c73266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a0909464343205061727420313520436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e353530323220436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e3535303234266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095643434920436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090941532f4e5a53203335343820436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909434e5320313334333820436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909494345532d30303320436c6173732042266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090949534f20313334303620706172742032266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d5052204949266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909494543203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909554c203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909435341203630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e3630393530266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909454e455247592053544152266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090954434f2026616d703b2333393b3033266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53697a6520616e6420776569676874266c743b2f622667743b266c743b6272202f2667743b0d0a0933302d696e6368204170706c652043696e656d6120484420446973706c6179266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094865696768743a2032312e3320696e63686573202835342e3320636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696474683a2032372e3220696e63686573202836382e3820636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090944657074683a20382e343620696e63686573202832312e3520636d29266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09095765696768743a2032372e3520706f756e6473202831322e35206b6729266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a266c743b702667743b0d0a09266c743b622667743b53797374656d20526571756972656d656e7473266c743b2f622667743b266c743b2f702667743b0d0a266c743b756c2667743b0d0a09266c743b6c692667743b0d0a09094d61632050726f2c20616c6c2067726170686963206f7074696f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a09094d6163426f6f6b2050726f266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572204d616320473520285043492d582920776974682041544920526164656f6e2039363530206f7220626574746572206f72204e5649444941204765466f72636520363830302047542044444c206f7220626574746572266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572204d616320473520285043492045787072657373292c20616c6c206772617068696373206f7074696f6e73266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a0909506f776572426f6f6b2047342077697468206475616c2d6c696e6b2044564920737570706f7274266c743b2f6c692667743b0d0a09266c743b6c692667743b0d0a090957696e646f777320504320616e642067726170686963732063617264207468617420737570706f7274732044564920706f7274732077697468206475616c2d6c696e6b206469676974616c2062616e64776964746820616e64205645534120444443207374616e6461726420666f7220706c75672d616e642d706c6179207365747570266c743b2f6c692667743b0d0a266c743b2f756c2667743b0d0a, '', '', ''),
(30, 2, 'Canon EOS 5D', 0x266c743b702667743b0d0a0943616e6f6e2773207072657373206d6174657269616c20666f722074686520454f532035442073746174657320746861742069742027646566696e657320286129206e657720442d534c522063617465676f7279272c207768696c65207765277265206e6f74207479706963616c6c7920746f6f20636f6e6365726e65642077697468206d61726b6574696e672074616c6b207468697320706172746963756c61722073746174656d656e7420697320636c6561726c79207072657474792061636375726174652e2054686520454f5320354420697320756e6c696b6520616e792070726576696f7573206469676974616c20534c5220696e207468617420697420636f6d62696e657320612066756c6c2d6672616d6520283335206d6d2073697a6564292068696768207265736f6c7574696f6e2073656e736f72202831322e38206d656761706978656c7329207769746820612072656c61746976656c7920636f6d7061637420626f64792028736c696768746c79206c6172676572207468616e2074686520454f53203230442c20616c74686f75676820696e20796f75722068616e64206974206665656c73206e6f7469636561626c7920276368756e6b69657227292e2054686520454f532035442069732061696d656420746f20736c6f7420696e206265747765656e2074686520454f532032304420616e642074686520454f532d31442070726f66657373696f6e616c206469676974616c20534c5227732c20616e20696d706f7274616e7420646966666572656e6365207768656e20636f6d706172656420746f20746865206c617474657220697320746861742074686520454f5320354420646f65736e2774206861766520616e7920656e7669726f6e6d656e74616c207365616c732e205768696c652043616e6f6e20646f6e2774207370656369666963616c6c7920726566657220746f2074686520454f532035442061732061202770726f66657373696f6e616c27206469676974616c20534c522069742077696c6c2068617665206f6276696f75732061707065616c20746f2070726f66657373696f6e616c732077686f2077616e7420612068696768207175616c697479206469676974616c20534c5220696e206120626f6479206c696768746572207468616e2074686520454f532d31442e2049742077696c6c20616c736f206e6f20646f7562742061707065616c20746f2063757272656e7420454f5320323044206f776e6572732028616c74686f756768206c65747320686f70652074686579277665206e6f7420626f7567687420746f6f206d616e792045462d53206c656e7365732e2e2e2920c3a4c3ab266c743b2f702667743b0d0a, '', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `product_discount`
--

CREATE TABLE IF NOT EXISTS `product_discount` (
  `product_discount_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_discount_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=441 ;

--
-- Дамп данных таблицы `product_discount`
--

INSERT INTO `product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(440, 42, 1, 30, 1, 66.0000, '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, 77.0000, '0000-00-00', '0000-00-00'),
(438, 42, 1, 10, 1, 88.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `product_image`
--

CREATE TABLE IF NOT EXISTS `product_image` (
  `product_image_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_image_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2352 ;

--
-- Дамп данных таблицы `product_image`
--

INSERT INTO `product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(2345, 30, 'data/demo/canon_eos_5d_2.jpg', 0),
(2321, 47, 'data/demo/hp_3.jpg', 0),
(2035, 28, 'data/demo/htc_touch_hd_2.jpg', 0),
(2351, 41, 'data/demo/imac_3.jpg', 0),
(1982, 40, 'data/demo/iphone_6.jpg', 0),
(2001, 36, 'data/demo/ipod_nano_5.jpg', 0),
(2000, 36, 'data/demo/ipod_nano_4.jpg', 0),
(2005, 34, 'data/demo/ipod_shuffle_5.jpg', 0),
(2004, 34, 'data/demo/ipod_shuffle_4.jpg', 0),
(2011, 32, 'data/demo/ipod_touch_7.jpg', 0),
(2010, 32, 'data/demo/ipod_touch_6.jpg', 0),
(2009, 32, 'data/demo/ipod_touch_5.jpg', 0),
(1971, 43, 'data/demo/macbook_5.jpg', 0),
(1970, 43, 'data/demo/macbook_4.jpg', 0),
(1974, 44, 'data/demo/macbook_air_4.jpg', 0),
(1973, 44, 'data/demo/macbook_air_2.jpg', 0),
(1977, 45, 'data/demo/macbook_pro_2.jpg', 0),
(1976, 45, 'data/demo/macbook_pro_3.jpg', 0),
(1986, 31, 'data/demo/nikon_d300_3.jpg', 0),
(1985, 31, 'data/demo/nikon_d300_2.jpg', 0),
(1988, 29, 'data/demo/palm_treo_pro_3.jpg', 0),
(1995, 46, 'data/demo/sony_vaio_5.jpg', 0),
(1994, 46, 'data/demo/sony_vaio_4.jpg', 0),
(1991, 48, 'data/demo/ipod_classic_4.jpg', 0),
(1990, 48, 'data/demo/ipod_classic_3.jpg', 0),
(1981, 40, 'data/demo/iphone_2.jpg', 0),
(1980, 40, 'data/demo/iphone_5.jpg', 0),
(2344, 30, 'data/demo/canon_eos_5d_3.jpg', 0),
(2320, 47, 'data/demo/hp_2.jpg', 0),
(2034, 28, 'data/demo/htc_touch_hd_3.jpg', 0),
(2350, 41, 'data/demo/imac_2.jpg', 0),
(1979, 40, 'data/demo/iphone_3.jpg', 0),
(1978, 40, 'data/demo/iphone_4.jpg', 0),
(1989, 48, 'data/demo/ipod_classic_2.jpg', 0),
(1999, 36, 'data/demo/ipod_nano_2.jpg', 0),
(1998, 36, 'data/demo/ipod_nano_3.jpg', 0),
(2003, 34, 'data/demo/ipod_shuffle_2.jpg', 0),
(2002, 34, 'data/demo/ipod_shuffle_3.jpg', 0),
(2008, 32, 'data/demo/ipod_touch_2.jpg', 0),
(2007, 32, 'data/demo/ipod_touch_3.jpg', 0),
(2006, 32, 'data/demo/ipod_touch_4.jpg', 0),
(1969, 43, 'data/demo/macbook_2.jpg', 0),
(1968, 43, 'data/demo/macbook_3.jpg', 0),
(1972, 44, 'data/demo/macbook_air_3.jpg', 0),
(1975, 45, 'data/demo/macbook_pro_4.jpg', 0),
(1984, 31, 'data/demo/nikon_d300_4.jpg', 0),
(1983, 31, 'data/demo/nikon_d300_5.jpg', 0),
(1987, 29, 'data/demo/palm_treo_pro_2.jpg', 0),
(1993, 46, 'data/demo/sony_vaio_2.jpg', 0),
(1992, 46, 'data/demo/sony_vaio_3.jpg', 0),
(2327, 49, 'data/demo/samsung_tab_7.jpg', 0),
(2326, 49, 'data/demo/samsung_tab_6.jpg', 0),
(2325, 49, 'data/demo/samsung_tab_5.jpg', 0),
(2324, 49, 'data/demo/samsung_tab_4.jpg', 0),
(2323, 49, 'data/demo/samsung_tab_3.jpg', 0),
(2322, 49, 'data/demo/samsung_tab_2.jpg', 0),
(2317, 42, 'data/demo/canon_logo.jpg', 0),
(2316, 42, 'data/demo/hp_1.jpg', 0),
(2315, 42, 'data/demo/compaq_presario.jpg', 0),
(2314, 42, 'data/demo/canon_eos_5d_1.jpg', 0),
(2313, 42, 'data/demo/canon_eos_5d_2.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `product_option`
--

CREATE TABLE IF NOT EXISTS `product_option` (
  `product_option_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value` text COLLATE utf8_bin NOT NULL,
  `required` tinyint(1) NOT NULL,
  PRIMARY KEY (`product_option_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=227 ;

--
-- Дамп данных таблицы `product_option`
--

INSERT INTO `product_option` (`product_option_id`, `product_id`, `option_id`, `option_value`, `required`) VALUES
(224, 35, 11, '', 1),
(225, 47, 12, 0x323031312d30342d3232, 1),
(223, 42, 2, '', 1),
(217, 42, 5, '', 1),
(209, 42, 6, '', 1),
(218, 42, 1, '', 1),
(208, 42, 4, 0x74657374, 1),
(219, 42, 8, 0x323031312d30322d3230, 1),
(222, 42, 7, '', 1),
(221, 42, 9, 0x32323a3235, 1),
(220, 42, 10, 0x323031312d30322d32302032323a3235, 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_option_value`
--

CREATE TABLE IF NOT EXISTS `product_option_value` (
  `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`product_option_value_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=17 ;

--
-- Дамп данных таблицы `product_option_value`
--

INSERT INTO `product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, 1.0000, '+', 0, '+', 1.00000000, '+'),
(6, 218, 42, 1, 31, 146, 1, 20.0000, '+', 2, '-', 20.00000000, '+'),
(7, 218, 42, 1, 43, 300, 1, 30.0000, '+', 3, '+', 30.00000000, '+'),
(5, 218, 42, 1, 32, 96, 1, 10.0000, '+', 1, '+', 10.00000000, '+'),
(4, 217, 42, 5, 39, 92, 1, 4.0000, '+', 0, '+', 4.00000000, '+'),
(2, 217, 42, 5, 42, 200, 1, 2.0000, '+', 0, '+', 2.00000000, '+'),
(3, 217, 42, 5, 40, 300, 0, 3.0000, '+', 0, '+', 3.00000000, '+'),
(8, 223, 42, 2, 23, 48, 1, 10.0000, '+', 0, '+', 10.00000000, '+'),
(10, 223, 42, 2, 44, 2696, 1, 30.0000, '+', 0, '+', 30.00000000, '+'),
(9, 223, 42, 2, 24, 194, 1, 20.0000, '+', 0, '+', 20.00000000, '+'),
(11, 223, 42, 2, 45, 3998, 1, 40.0000, '+', 0, '+', 40.00000000, '+'),
(12, 224, 35, 11, 46, 0, 1, 5.0000, '+', 0, '+', 0.00000000, '+'),
(13, 224, 35, 11, 47, 10, 1, 10.0000, '+', 0, '+', 0.00000000, '+'),
(14, 224, 35, 11, 48, 15, 1, 15.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Структура таблицы `product_related`
--

CREATE TABLE IF NOT EXISTS `product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`related_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_related`
--

INSERT INTO `product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Структура таблицы `product_reward`
--

CREATE TABLE IF NOT EXISTS `product_reward` (
  `product_reward_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_reward_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=546 ;

--
-- Дамп данных таблицы `product_reward`
--

INSERT INTO `product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(515, 42, 1, 100),
(519, 47, 1, 300),
(379, 28, 1, 400),
(329, 43, 1, 600),
(339, 29, 1, 0),
(343, 48, 1, 0),
(335, 40, 1, 0),
(539, 30, 1, 200),
(331, 44, 1, 700),
(333, 45, 1, 800),
(337, 31, 1, 0),
(425, 35, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(545, 41, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(521, 49, 1, 1000);

-- --------------------------------------------------------

--
-- Структура таблицы `product_special`
--

CREATE TABLE IF NOT EXISTS `product_special` (
  `product_special_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL DEFAULT '0000-00-00',
  `date_end` date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (`product_special_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=440 ;

--
-- Дамп данных таблицы `product_special`
--

INSERT INTO `product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, 90.0000, '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, 90.0000, '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, 80.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_category`
--

CREATE TABLE IF NOT EXISTS `product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`category_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_to_category`
--

INSERT INTO `product_to_category` (`product_id`, `category_id`) VALUES
(28, 20),
(28, 24),
(29, 20),
(29, 24),
(30, 20),
(30, 33),
(31, 33),
(32, 34),
(33, 20),
(33, 28),
(34, 34),
(35, 20),
(36, 34),
(40, 20),
(40, 24),
(41, 27),
(42, 20),
(42, 28),
(43, 18),
(43, 20),
(44, 18),
(44, 20),
(45, 18),
(46, 18),
(46, 20),
(47, 18),
(47, 20),
(48, 20),
(48, 34),
(49, 57);

-- --------------------------------------------------------

--
-- Структура таблицы `product_to_download`
--

CREATE TABLE IF NOT EXISTS `product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`download_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_to_download`
--


-- --------------------------------------------------------

--
-- Структура таблицы `product_to_layout`
--

CREATE TABLE IF NOT EXISTS `product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_to_layout`
--


-- --------------------------------------------------------

--
-- Структура таблицы `product_to_store`
--

CREATE TABLE IF NOT EXISTS `product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`product_id`,`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `product_to_store`
--

INSERT INTO `product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `return`
--

CREATE TABLE IF NOT EXISTS `return` (
  `return_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL,
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL,
  `email` varchar(96) COLLATE utf8_bin NOT NULL,
  `telephone` varchar(32) COLLATE utf8_bin NOT NULL,
  `product` varchar(255) COLLATE utf8_bin NOT NULL,
  `model` varchar(64) COLLATE utf8_bin NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text COLLATE utf8_bin,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  PRIMARY KEY (`return_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `return`
--


-- --------------------------------------------------------

--
-- Структура таблицы `return_action`
--

CREATE TABLE IF NOT EXISTS `return_action` (
  `return_action_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_action_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `return_action`
--

INSERT INTO `return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Refunded'),
(2, 1, 'Credit Issued'),
(3, 1, 'Replacement Sent'),
(1, 2, 'Refunded'),
(2, 2, 'Credit Issued'),
(3, 2, 'Replacement Sent');

-- --------------------------------------------------------

--
-- Структура таблицы `return_history`
--

CREATE TABLE IF NOT EXISTS `return_history` (
  `return_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`return_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `return_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `return_reason`
--

CREATE TABLE IF NOT EXISTS `return_reason` (
  `return_reason_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_reason_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `return_reason`
--

INSERT INTO `return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Dead On Arrival'),
(2, 1, 'Received Wrong Item'),
(3, 1, 'Order Error'),
(4, 1, 'Faulty, please supply details'),
(5, 1, 'Other, please supply details'),
(1, 2, 'Dead On Arrival'),
(2, 2, 'Received Wrong Item'),
(3, 2, 'Order Error'),
(4, 2, 'Faulty, please supply details'),
(5, 2, 'Other, please supply details');

-- --------------------------------------------------------

--
-- Структура таблицы `return_status`
--

CREATE TABLE IF NOT EXISTS `return_status` (
  `return_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`return_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=4 ;

--
-- Дамп данных таблицы `return_status`
--

INSERT INTO `return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Pending'),
(3, 1, 'Complete'),
(2, 1, 'Awaiting Products'),
(1, 2, 'Pending'),
(3, 2, 'Complete'),
(2, 2, 'Awaiting Products');

-- --------------------------------------------------------

--
-- Структура таблицы `review`
--

CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `text` text COLLATE utf8_bin NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`review_id`),
  KEY `product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `review`
--


-- --------------------------------------------------------

--
-- Структура таблицы `setting`
--

CREATE TABLE IF NOT EXISTS `setting` (
  `setting_id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `group` varchar(32) COLLATE utf8_bin NOT NULL,
  `key` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '',
  `value` text COLLATE utf8_bin NOT NULL,
  `serialized` tinyint(1) NOT NULL,
  PRIMARY KEY (`setting_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=601 ;

--
-- Дамп данных таблицы `setting`
--

INSERT INTO `setting` (`setting_id`, `store_id`, `group`, `key`, `value`, `serialized`) VALUES
(1, 0, 'shipping', 'shipping_sort_order', 0x33, 0),
(2, 0, 'sub_total', 'sub_total_sort_order', 0x31, 0),
(3, 0, 'sub_total', 'sub_total_status', 0x31, 0),
(4, 0, 'tax', 'tax_status', 0x31, 0),
(5, 0, 'total', 'total_sort_order', 0x39, 0),
(6, 0, 'total', 'total_status', 0x31, 0),
(7, 0, 'tax', 'tax_sort_order', 0x35, 0),
(8, 0, 'free_checkout', 'free_checkout_sort_order', 0x31, 0),
(9, 0, 'cod', 'cod_sort_order', 0x35, 0),
(10, 0, 'cod', 'cod_total', 0x302e3031, 0),
(11, 0, 'cod', 'cod_order_status_id', 0x31, 0),
(12, 0, 'cod', 'cod_geo_zone_id', 0x30, 0),
(13, 0, 'cod', 'cod_status', 0x31, 0),
(14, 0, 'shipping', 'shipping_status', 0x31, 0),
(15, 0, 'shipping', 'shipping_estimator', 0x31, 0),
(589, 0, 'config', 'config_error_filename', 0x6572726f722e747874, 0),
(587, 0, 'config', 'config_error_display', 0x31, 0),
(588, 0, 'config', 'config_error_log', 0x31, 0),
(586, 0, 'config', 'config_compression', 0x30, 0),
(583, 0, 'config', 'config_seo_url', 0x30, 0),
(584, 0, 'config', 'config_maintenance', 0x30, 0),
(27, 0, 'coupon', 'coupon_sort_order', 0x34, 0),
(28, 0, 'coupon', 'coupon_status', 0x31, 0),
(585, 0, 'config', 'config_encryption', 0x6163646132653666356130623235636239333663653764363239643463643166, 0),
(582, 0, 'config', 'config_use_ssl', 0x30, 0),
(581, 0, 'config', 'config_fraud_status_id', 0x37, 0),
(34, 0, 'flat', 'flat_sort_order', 0x31, 0),
(35, 0, 'flat', 'flat_status', 0x31, 0),
(36, 0, 'flat', 'flat_geo_zone_id', 0x30, 0),
(37, 0, 'flat', 'flat_tax_class_id', 0x39, 0),
(38, 0, 'carousel', 'carousel_module', 0x613a313a7b693a303b613a393a7b733a393a2262616e6e65725f6964223b733a313a2238223b733a353a226c696d6974223b733a313a2235223b733a363a227363726f6c6c223b733a313a2233223b733a353a227769647468223b733a323a223830223b733a363a22686569676874223b733a323a223830223b733a393a226c61796f75745f6964223b733a313a2231223b733a383a22706f736974696f6e223b733a31343a22636f6e74656e745f626f74746f6d223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a323a222d31223b7d7d, 1),
(598, 0, 'featured', 'featured_module', 0x613a313a7b693a303b613a373a7b733a353a226c696d6974223b733a313a2236223b733a31313a22696d6167655f7769647468223b733a333a22313535223b733a31323a22696d6167655f686569676874223b733a333a22313239223b733a393a226c61796f75745f6964223b733a313a2231223b733a383a22706f736974696f6e223b733a31313a22636f6e74656e745f746f70223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2232223b7d7d, 1),
(41, 0, 'flat', 'flat_cost', 0x352e3030, 0),
(42, 0, 'credit', 'credit_sort_order', 0x37, 0),
(43, 0, 'credit', 'credit_status', 0x31, 0),
(579, 0, 'config', 'config_fraud_key', '', 0),
(580, 0, 'config', 'config_fraud_score', '', 0),
(578, 0, 'config', 'config_fraud_detection', 0x30, 0),
(577, 0, 'config', 'config_alert_emails', '', 0),
(576, 0, 'config', 'config_account_mail', 0x30, 0),
(575, 0, 'config', 'config_alert_mail', 0x30, 0),
(574, 0, 'config', 'config_smtp_timeout', 0x35, 0),
(53, 0, 'reward', 'reward_sort_order', 0x32, 0),
(54, 0, 'reward', 'reward_status', 0x31, 0),
(573, 0, 'config', 'config_smtp_port', 0x3235, 0),
(56, 0, 'affiliate', 'affiliate_module', 0x613a313a7b693a303b613a343a7b733a393a226c61796f75745f6964223b733a323a223130223b733a383a22706f736974696f6e223b733a31323a22636f6c756d6e5f7269676874223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2231223b7d7d, 1),
(572, 0, 'config', 'config_smtp_password', '', 0),
(571, 0, 'config', 'config_smtp_username', '', 0),
(60, 0, 'account', 'account_module', 0x613a313a7b693a303b613a343a7b733a393a226c61796f75745f6964223b733a313a2236223b733a383a22706f736974696f6e223b733a31323a22636f6c756d6e5f7269676874223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2231223b7d7d, 1),
(570, 0, 'config', 'config_smtp_host', '', 0),
(569, 0, 'config', 'config_mail_parameter', '', 0),
(568, 0, 'config', 'config_mail_protocol', 0x6d61696c, 0),
(567, 0, 'config', 'config_image_cart_height', 0x3738, 0),
(566, 0, 'config', 'config_image_cart_width', 0x3738, 0),
(564, 0, 'config', 'config_image_wishlist_width', 0x3738, 0),
(565, 0, 'config', 'config_image_wishlist_height', 0x3738, 0),
(562, 0, 'config', 'config_image_compare_width', 0x3738, 0),
(563, 0, 'config', 'config_image_compare_height', 0x3738, 0),
(561, 0, 'config', 'config_image_related_height', 0x313239, 0),
(560, 0, 'config', 'config_image_related_width', 0x313535, 0),
(557, 0, 'config', 'config_image_product_height', 0x313239, 0),
(558, 0, 'config', 'config_image_additional_width', 0x313535, 0),
(559, 0, 'config', 'config_image_additional_height', 0x313239, 0),
(554, 0, 'config', 'config_image_popup_width', 0x353030, 0),
(556, 0, 'config', 'config_image_product_width', 0x313535, 0),
(555, 0, 'config', 'config_image_popup_height', 0x353030, 0),
(553, 0, 'config', 'config_image_thumb_height', 0x323330, 0),
(552, 0, 'config', 'config_image_thumb_width', 0x323535, 0),
(93, 0, 'voucher', 'voucher_sort_order', 0x38, 0),
(94, 0, 'voucher', 'voucher_status', 0x31, 0),
(551, 0, 'config', 'config_image_category_height', 0x313239, 0),
(550, 0, 'config', 'config_image_category_width', 0x313535, 0),
(548, 0, 'config', 'config_logo', 0x646174612f6c6f676f2e706e67, 0),
(549, 0, 'config', 'config_icon', 0x646174612f636172742e706e67, 0),
(547, 0, 'config', 'config_return_status_id', 0x32, 0),
(102, 0, 'free_checkout', 'free_checkout_status', 0x31, 0),
(103, 0, 'free_checkout', 'free_checkout_order_status_id', 0x31, 0),
(546, 0, 'config', 'config_commission', 0x35, 0),
(545, 0, 'config', 'config_affiliate_id', 0x34, 0),
(600, 0, 'category', 'category_module', 0x613a343a7b693a303b613a353a7b733a393a226c61796f75745f6964223b733a313a2233223b733a383a22706f736974696f6e223b733a31313a22636f6c756d6e5f6c656674223b733a353a22636f756e74223b733a313a2230223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2231223b7d693a313b613a353a7b733a393a226c61796f75745f6964223b733a313a2235223b733a383a22706f736974696f6e223b733a31313a22636f6c756d6e5f6c656674223b733a353a22636f756e74223b733a313a2230223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2231223b7d693a323b613a353a7b733a393a226c61796f75745f6964223b733a313a2231223b733a383a22706f736974696f6e223b733a31313a22636f6c756d6e5f6c656674223b733a353a22636f756e74223b733a313a2230223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a303a22223b7d693a333b613a353a7b733a393a226c61796f75745f6964223b733a313a2232223b733a383a22706f736974696f6e223b733a31313a22636f6c756d6e5f6c656674223b733a353a22636f756e74223b733a313a2231223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a303a22223b7d7d, 1),
(108, 0, 'banner', 'banner_module', 0x613a313a7b693a303b613a373a7b733a393a2262616e6e65725f6964223b733a313a2236223b733a353a227769647468223b733a333a22313832223b733a363a22686569676874223b733a333a22313832223b733a393a226c61796f75745f6964223b733a313a2233223b733a383a22706f736974696f6e223b733a31313a22636f6c756d6e5f6c656674223b733a363a22737461747573223b733a313a2231223b733a31303a22736f72745f6f72646572223b733a313a2233223b7d7d, 1),
(544, 0, 'config', 'config_stock_status_id', 0x35, 0),
(543, 0, 'config', 'config_stock_checkout', 0x30, 0),
(542, 0, 'config', 'config_stock_warning', 0x30, 0),
(541, 0, 'config', 'config_stock_display', 0x30, 0),
(540, 0, 'config', 'config_complete_status_id', 0x35, 0),
(539, 0, 'config', 'config_order_status_id', 0x31, 0),
(536, 0, 'config', 'config_checkout_id', 0x35, 0),
(537, 0, 'config', 'config_order_edit', 0x313030, 0),
(538, 0, 'config', 'config_invoice_prefix', 0x494e562d323031322d3030, 0),
(535, 0, 'config', 'config_guest_checkout', 0x31, 0),
(533, 0, 'config', 'config_account_id', 0x33, 0),
(534, 0, 'config', 'config_cart_weight', 0x31, 0),
(532, 0, 'config', 'config_customer_price', 0x30, 0),
(531, 0, 'config', 'config_customer_group_display', 0x613a313a7b693a303b733a313a2231223b7d, 1),
(530, 0, 'config', 'config_customer_group_id', 0x31, 0),
(529, 0, 'config', 'config_customer_online', 0x30, 0),
(528, 0, 'config', 'config_tax_customer', 0x7368697070696e67, 0),
(526, 0, 'config', 'config_vat', 0x30, 0),
(527, 0, 'config', 'config_tax_default', 0x7368697070696e67, 0),
(525, 0, 'config', 'config_tax', 0x31, 0),
(523, 0, 'config', 'config_voucher_min', 0x31, 0),
(524, 0, 'config', 'config_voucher_max', 0x31303030, 0),
(521, 0, 'config', 'config_download', 0x30, 0),
(522, 0, 'config', 'config_upload_allowed', 0x6a70672c204a50472c206a7065672c206769662c20706e672c20747874, 0),
(520, 0, 'config', 'config_review_status', 0x31, 0),
(519, 0, 'config', 'config_product_count', 0x30, 0),
(518, 0, 'config', 'config_admin_limit', 0x3230, 0),
(517, 0, 'config', 'config_catalog_limit', 0x36, 0),
(516, 0, 'config', 'config_weight_class_id', 0x31, 0),
(515, 0, 'config', 'config_length_class_id', 0x31, 0),
(514, 0, 'config', 'config_currency_auto', 0x31, 0),
(512, 0, 'config', 'config_admin_language', 0x7275, 0),
(513, 0, 'config', 'config_currency', 0x756168, 0),
(509, 0, 'config', 'config_country_id', 0x323230, 0),
(510, 0, 'config', 'config_zone_id', 0x33343930, 0),
(511, 0, 'config', 'config_language', 0x7275, 0),
(508, 0, 'config', 'config_layout_id', 0x31, 0),
(506, 0, 'config', 'config_meta_description', 0xd184d0b8d0b7d180d183d0ba, 0),
(507, 0, 'config', 'config_template', 0x66697a72756b, 0),
(504, 0, 'config', 'config_fax', '', 0),
(505, 0, 'config', 'config_title', 0xd0a4d0b8d0b7d180d183d0ba, 0),
(503, 0, 'config', 'config_telephone', 0x313233343536373839, 0),
(502, 0, 'config', 'config_email', 0x61726965732e666f72756d40676d61696c2e636f6d, 0),
(501, 0, 'config', 'config_address', 0xd0b32e20d09ad0b8d0b5d0b2, 0),
(500, 0, 'config', 'config_owner', 0xd0a5d0bed0b4d0bed0b1d0b0d18820d0a0d0bed0bcd0b0d0bd, 0),
(499, 0, 'config', 'config_name', 0xd0a4d0b8d0b7d180d183d0ba, 0),
(590, 0, 'config', 'config_google_analytics', '', 0),
(596, 0, 'featured', 'product', '', 0),
(597, 0, 'featured', 'featured_product', 0x34332c34302c34322c34362c34372c3238, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `stock_status`
--

CREATE TABLE IF NOT EXISTS `stock_status` (
  `stock_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`stock_status_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `stock_status`
--

INSERT INTO `stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(7, 1, 'In Stock'),
(8, 1, 'Pre-Order'),
(5, 1, 'Out Of Stock'),
(6, 1, '2 - 3 Days'),
(7, 2, 'In Stock'),
(8, 2, 'Pre-Order'),
(5, 2, 'Out Of Stock'),
(6, 2, '2 - 3 Days');

-- --------------------------------------------------------

--
-- Структура таблицы `store`
--

CREATE TABLE IF NOT EXISTS `store` (
  `store_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `url` varchar(255) COLLATE utf8_bin NOT NULL,
  `ssl` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`store_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `store`
--


-- --------------------------------------------------------

--
-- Структура таблицы `tax_class`
--

CREATE TABLE IF NOT EXISTS `tax_class` (
  `tax_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `description` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `tax_class`
--

INSERT INTO `tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Taxable Goods', 'Taxed Stuff', '2009-01-06 23:21:53', '2011-09-23 14:07:50'),
(10, 'Downloadable Products', 'Downloadable', '2011-09-21 22:19:39', '2011-09-22 10:27:36');

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rate`
--

CREATE TABLE IF NOT EXISTS `tax_rate` (
  `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) COLLATE utf8_bin NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tax_rate_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=88 ;

--
-- Дамп данных таблицы `tax_rate`
--

INSERT INTO `tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(86, 3, 'VAT (17.5%)', 17.5000, 'P', '2011-03-09 21:17:10', '2011-09-22 22:24:29'),
(87, 3, 'Eco Tax (-2.00)', 2.0000, 'F', '2011-09-21 21:49:23', '2011-09-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rate_to_customer_group`
--

CREATE TABLE IF NOT EXISTS `tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  PRIMARY KEY (`tax_rate_id`,`customer_group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `tax_rate_to_customer_group`
--

INSERT INTO `tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `tax_rule`
--

CREATE TABLE IF NOT EXISTS `tax_rule` (
  `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) COLLATE utf8_bin NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  PRIMARY KEY (`tax_rule_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=129 ;

--
-- Дамп данных таблицы `tax_rule`
--

INSERT INTO `tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(121, 10, 86, 'payment', 1),
(120, 10, 87, 'store', 0),
(128, 9, 86, 'shipping', 1),
(127, 9, 87, 'shipping', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `url_alias`
--

CREATE TABLE IF NOT EXISTS `url_alias` (
  `url_alias_id` int(11) NOT NULL AUTO_INCREMENT,
  `query` varchar(255) COLLATE utf8_bin NOT NULL,
  `keyword` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`url_alias_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=774 ;

--
-- Дамп данных таблицы `url_alias`
--

INSERT INTO `url_alias` (`url_alias_id`, `query`, `keyword`) VALUES
(704, 'product_id=48', 'ipod_classic'),
(773, 'category_id=20', 'desktops'),
(503, 'category_id=26', 'pc'),
(505, 'category_id=27', 'mac'),
(730, 'manufacturer_id=8', 'apple'),
(772, 'information_id=4', 'about_us'),
(768, 'product_id=42', 'test'),
(767, 'category_id=34', 'mp3-players'),
(536, 'category_id=36', 'Normal');

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '',
  `password` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `salt` varchar(9) COLLATE utf8_bin NOT NULL DEFAULT '',
  `firstname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `lastname` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `email` varchar(96) COLLATE utf8_bin NOT NULL DEFAULT '',
  `code` varchar(32) COLLATE utf8_bin NOT NULL,
  `ip` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=2 ;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`user_id`, `user_group_id`, `username`, `password`, `salt`, `firstname`, `lastname`, `email`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'admin', '698d51a19d8a121ce581499d7b701668', '4da476e5f', '', '', 'aries.forum@gmail.com', '', '127.0.0.1', 1, '2012-09-04 14:24:21');

-- --------------------------------------------------------

--
-- Структура таблицы `user_group`
--

CREATE TABLE IF NOT EXISTS `user_group` (
  `user_group_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) COLLATE utf8_bin NOT NULL,
  `permission` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`user_group_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11 ;

--
-- Дамп данных таблицы `user_group`
--

INSERT INTO `user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Top Administrator', 0x613a323a7b733a363a22616363657373223b613a3132313a7b693a303b733a32333a22636174616c6f672f6174747269627574655f67726f7570223b693a313b733a31373a22636174616c6f672f617474726962757465223b693a323b733a31363a22636174616c6f672f63617465676f7279223b693a333b733a31363a22636174616c6f672f646f776e6c6f6164223b693a343b733a31393a22636174616c6f672f696e666f726d6174696f6e223b693a353b733a32303a22636174616c6f672f6d616e756661637475726572223b693a363b733a31343a22636174616c6f672f6f7074696f6e223b693a373b733a31353a22636174616c6f672f70726f64756374223b693a383b733a31343a22636174616c6f672f726576696577223b693a393b733a31383a22636f6d6d6f6e2f66696c656d616e61676572223b693a31303b733a31333a2264657369676e2f62616e6e6572223b693a31313b733a31333a2264657369676e2f6c61796f7574223b693a31323b733a31343a22657874656e73696f6e2f66656564223b693a31333b733a31363a22657874656e73696f6e2f6d6f64756c65223b693a31343b733a31373a22657874656e73696f6e2f7061796d656e74223b693a31353b733a31383a22657874656e73696f6e2f7368697070696e67223b693a31363b733a31353a22657874656e73696f6e2f746f74616c223b693a31373b733a31363a22666565642f676f6f676c655f62617365223b693a31383b733a31393a22666565642f676f6f676c655f736974656d6170223b693a31393b733a32303a226c6f63616c69736174696f6e2f636f756e747279223b693a32303b733a32313a226c6f63616c69736174696f6e2f63757272656e6379223b693a32313b733a32313a226c6f63616c69736174696f6e2f67656f5f7a6f6e65223b693a32323b733a32313a226c6f63616c69736174696f6e2f6c616e6775616765223b693a32333b733a32353a226c6f63616c69736174696f6e2f6c656e6774685f636c617373223b693a32343b733a32353a226c6f63616c69736174696f6e2f6f726465725f737461747573223b693a32353b733a32363a226c6f63616c69736174696f6e2f72657475726e5f616374696f6e223b693a32363b733a32363a226c6f63616c69736174696f6e2f72657475726e5f726561736f6e223b693a32373b733a32363a226c6f63616c69736174696f6e2f72657475726e5f737461747573223b693a32383b733a32353a226c6f63616c69736174696f6e2f73746f636b5f737461747573223b693a32393b733a32323a226c6f63616c69736174696f6e2f7461785f636c617373223b693a33303b733a32313a226c6f63616c69736174696f6e2f7461785f72617465223b693a33313b733a32353a226c6f63616c69736174696f6e2f7765696768745f636c617373223b693a33323b733a31373a226c6f63616c69736174696f6e2f7a6f6e65223b693a33333b733a31343a226d6f64756c652f6163636f756e74223b693a33343b733a31363a226d6f64756c652f616666696c69617465223b693a33353b733a31333a226d6f64756c652f62616e6e6572223b693a33363b733a31373a226d6f64756c652f6265737473656c6c6572223b693a33373b733a31353a226d6f64756c652f6361726f7573656c223b693a33383b733a31353a226d6f64756c652f63617465676f7279223b693a33393b733a31353a226d6f64756c652f6665617475726564223b693a34303b733a31383a226d6f64756c652f676f6f676c655f74616c6b223b693a34313b733a31383a226d6f64756c652f696e666f726d6174696f6e223b693a34323b733a31333a226d6f64756c652f6c6174657374223b693a34333b733a31363a226d6f64756c652f736c69646573686f77223b693a34343b733a31343a226d6f64756c652f7370656369616c223b693a34353b733a31323a226d6f64756c652f73746f7265223b693a34363b733a31343a226d6f64756c652f77656c636f6d65223b693a34373b733a32343a227061796d656e742f617574686f72697a656e65745f61696d223b693a34383b733a32313a227061796d656e742f62616e6b5f7472616e73666572223b693a34393b733a31343a227061796d656e742f636865717565223b693a35303b733a31313a227061796d656e742f636f64223b693a35313b733a32313a227061796d656e742f667265655f636865636b6f7574223b693a35323b733a32323a227061796d656e742f6b6c61726e615f696e766f696365223b693a35333b733a31373a227061796d656e742f6b6c61726e615f7070223b693a35343b733a31343a227061796d656e742f6c6971706179223b693a35353b733a32303a227061796d656e742f6d6f6e6579626f6f6b657273223b693a35363b733a31343a227061796d656e742f6e6f63686578223b693a35373b733a31353a227061796d656e742f7061796d617465223b693a35383b733a31363a227061796d656e742f706179706f696e74223b693a35393b733a31333a227061796d656e742f7061797a61223b693a36303b733a32363a227061796d656e742f70657270657475616c5f7061796d656e7473223b693a36313b733a31343a227061796d656e742f70705f70726f223b693a36323b733a31373a227061796d656e742f70705f70726f5f756b223b693a36333b733a31393a227061796d656e742f70705f7374616e64617264223b693a36343b733a32323a227061796d656e742f736167657061795f646972656374223b693a36353b733a31353a227061796d656e742f73616765706179223b693a36363b733a31383a227061796d656e742f736167657061795f7573223b693a36373b733a31393a227061796d656e742f74776f636865636b6f7574223b693a36383b733a32383a227061796d656e742f7765625f7061796d656e745f736f667477617265223b693a36393b733a31363a227061796d656e742f776f726c64706179223b693a37303b733a32373a227265706f72742f616666696c696174655f636f6d6d697373696f6e223b693a37313b733a32323a227265706f72742f637573746f6d65725f637265646974223b693a37323b733a32323a227265706f72742f637573746f6d65725f6f6e6c696e65223b693a37333b733a32313a227265706f72742f637573746f6d65725f6f72646572223b693a37343b733a32323a227265706f72742f637573746f6d65725f726577617264223b693a37353b733a32343a227265706f72742f70726f647563745f707572636861736564223b693a37363b733a32313a227265706f72742f70726f647563745f766965776564223b693a37373b733a31383a227265706f72742f73616c655f636f75706f6e223b693a37383b733a31373a227265706f72742f73616c655f6f72646572223b693a37393b733a31383a227265706f72742f73616c655f72657475726e223b693a38303b733a32303a227265706f72742f73616c655f7368697070696e67223b693a38313b733a31353a227265706f72742f73616c655f746178223b693a38323b733a31343a2273616c652f616666696c69617465223b693a38333b733a31323a2273616c652f636f6e74616374223b693a38343b733a31313a2273616c652f636f75706f6e223b693a38353b733a32333a2273616c652f637573746f6d65725f626c61636b6c697374223b693a38363b733a31393a2273616c652f637573746f6d65725f67726f7570223b693a38373b733a31333a2273616c652f637573746f6d6572223b693a38383b733a31303a2273616c652f6f72646572223b693a38393b733a31313a2273616c652f72657475726e223b693a39303b733a31323a2273616c652f766f7563686572223b693a39313b733a31383a2273616c652f766f75636865725f7468656d65223b693a39323b733a31353a2273657474696e672f73657474696e67223b693a39333b733a31333a2273657474696e672f73746f7265223b693a39343b733a31363a227368697070696e672f617573706f7374223b693a39353b733a31373a227368697070696e672f636974796c696e6b223b693a39363b733a31343a227368697070696e672f6665646578223b693a39373b733a31333a227368697070696e672f666c6174223b693a39383b733a31333a227368697070696e672f66726565223b693a39393b733a31333a227368697070696e672f6974656d223b693a3130303b733a32333a227368697070696e672f70617263656c666f7263655f3438223b693a3130313b733a31353a227368697070696e672f7069636b7570223b693a3130323b733a31393a227368697070696e672f726f79616c5f6d61696c223b693a3130333b733a31323a227368697070696e672f757073223b693a3130343b733a31333a227368697070696e672f75737073223b693a3130353b733a31353a227368697070696e672f776569676874223b693a3130363b733a31313a22746f6f6c2f6261636b7570223b693a3130373b733a31343a22746f6f6c2f6572726f725f6c6f67223b693a3130383b733a31323a22746f74616c2f636f75706f6e223b693a3130393b733a31323a22746f74616c2f637265646974223b693a3131303b733a31343a22746f74616c2f68616e646c696e67223b693a3131313b733a31363a22746f74616c2f6b6c61726e615f666565223b693a3131323b733a31393a22746f74616c2f6c6f775f6f726465725f666565223b693a3131333b733a31323a22746f74616c2f726577617264223b693a3131343b733a31343a22746f74616c2f7368697070696e67223b693a3131353b733a31353a22746f74616c2f7375625f746f74616c223b693a3131363b733a393a22746f74616c2f746178223b693a3131373b733a31313a22746f74616c2f746f74616c223b693a3131383b733a31333a22746f74616c2f766f7563686572223b693a3131393b733a32303a22757365722f757365725f7065726d697373696f6e223b693a3132303b733a393a22757365722f75736572223b7d733a363a226d6f64696679223b613a3132313a7b693a303b733a32333a22636174616c6f672f6174747269627574655f67726f7570223b693a313b733a31373a22636174616c6f672f617474726962757465223b693a323b733a31363a22636174616c6f672f63617465676f7279223b693a333b733a31363a22636174616c6f672f646f776e6c6f6164223b693a343b733a31393a22636174616c6f672f696e666f726d6174696f6e223b693a353b733a32303a22636174616c6f672f6d616e756661637475726572223b693a363b733a31343a22636174616c6f672f6f7074696f6e223b693a373b733a31353a22636174616c6f672f70726f64756374223b693a383b733a31343a22636174616c6f672f726576696577223b693a393b733a31383a22636f6d6d6f6e2f66696c656d616e61676572223b693a31303b733a31333a2264657369676e2f62616e6e6572223b693a31313b733a31333a2264657369676e2f6c61796f7574223b693a31323b733a31343a22657874656e73696f6e2f66656564223b693a31333b733a31363a22657874656e73696f6e2f6d6f64756c65223b693a31343b733a31373a22657874656e73696f6e2f7061796d656e74223b693a31353b733a31383a22657874656e73696f6e2f7368697070696e67223b693a31363b733a31353a22657874656e73696f6e2f746f74616c223b693a31373b733a31363a22666565642f676f6f676c655f62617365223b693a31383b733a31393a22666565642f676f6f676c655f736974656d6170223b693a31393b733a32303a226c6f63616c69736174696f6e2f636f756e747279223b693a32303b733a32313a226c6f63616c69736174696f6e2f63757272656e6379223b693a32313b733a32313a226c6f63616c69736174696f6e2f67656f5f7a6f6e65223b693a32323b733a32313a226c6f63616c69736174696f6e2f6c616e6775616765223b693a32333b733a32353a226c6f63616c69736174696f6e2f6c656e6774685f636c617373223b693a32343b733a32353a226c6f63616c69736174696f6e2f6f726465725f737461747573223b693a32353b733a32363a226c6f63616c69736174696f6e2f72657475726e5f616374696f6e223b693a32363b733a32363a226c6f63616c69736174696f6e2f72657475726e5f726561736f6e223b693a32373b733a32363a226c6f63616c69736174696f6e2f72657475726e5f737461747573223b693a32383b733a32353a226c6f63616c69736174696f6e2f73746f636b5f737461747573223b693a32393b733a32323a226c6f63616c69736174696f6e2f7461785f636c617373223b693a33303b733a32313a226c6f63616c69736174696f6e2f7461785f72617465223b693a33313b733a32353a226c6f63616c69736174696f6e2f7765696768745f636c617373223b693a33323b733a31373a226c6f63616c69736174696f6e2f7a6f6e65223b693a33333b733a31343a226d6f64756c652f6163636f756e74223b693a33343b733a31363a226d6f64756c652f616666696c69617465223b693a33353b733a31333a226d6f64756c652f62616e6e6572223b693a33363b733a31373a226d6f64756c652f6265737473656c6c6572223b693a33373b733a31353a226d6f64756c652f6361726f7573656c223b693a33383b733a31353a226d6f64756c652f63617465676f7279223b693a33393b733a31353a226d6f64756c652f6665617475726564223b693a34303b733a31383a226d6f64756c652f676f6f676c655f74616c6b223b693a34313b733a31383a226d6f64756c652f696e666f726d6174696f6e223b693a34323b733a31333a226d6f64756c652f6c6174657374223b693a34333b733a31363a226d6f64756c652f736c69646573686f77223b693a34343b733a31343a226d6f64756c652f7370656369616c223b693a34353b733a31323a226d6f64756c652f73746f7265223b693a34363b733a31343a226d6f64756c652f77656c636f6d65223b693a34373b733a32343a227061796d656e742f617574686f72697a656e65745f61696d223b693a34383b733a32313a227061796d656e742f62616e6b5f7472616e73666572223b693a34393b733a31343a227061796d656e742f636865717565223b693a35303b733a31313a227061796d656e742f636f64223b693a35313b733a32313a227061796d656e742f667265655f636865636b6f7574223b693a35323b733a32323a227061796d656e742f6b6c61726e615f696e766f696365223b693a35333b733a31373a227061796d656e742f6b6c61726e615f7070223b693a35343b733a31343a227061796d656e742f6c6971706179223b693a35353b733a32303a227061796d656e742f6d6f6e6579626f6f6b657273223b693a35363b733a31343a227061796d656e742f6e6f63686578223b693a35373b733a31353a227061796d656e742f7061796d617465223b693a35383b733a31363a227061796d656e742f706179706f696e74223b693a35393b733a31333a227061796d656e742f7061797a61223b693a36303b733a32363a227061796d656e742f70657270657475616c5f7061796d656e7473223b693a36313b733a31343a227061796d656e742f70705f70726f223b693a36323b733a31373a227061796d656e742f70705f70726f5f756b223b693a36333b733a31393a227061796d656e742f70705f7374616e64617264223b693a36343b733a32323a227061796d656e742f736167657061795f646972656374223b693a36353b733a31353a227061796d656e742f73616765706179223b693a36363b733a31383a227061796d656e742f736167657061795f7573223b693a36373b733a31393a227061796d656e742f74776f636865636b6f7574223b693a36383b733a32383a227061796d656e742f7765625f7061796d656e745f736f667477617265223b693a36393b733a31363a227061796d656e742f776f726c64706179223b693a37303b733a32373a227265706f72742f616666696c696174655f636f6d6d697373696f6e223b693a37313b733a32323a227265706f72742f637573746f6d65725f637265646974223b693a37323b733a32323a227265706f72742f637573746f6d65725f6f6e6c696e65223b693a37333b733a32313a227265706f72742f637573746f6d65725f6f72646572223b693a37343b733a32323a227265706f72742f637573746f6d65725f726577617264223b693a37353b733a32343a227265706f72742f70726f647563745f707572636861736564223b693a37363b733a32313a227265706f72742f70726f647563745f766965776564223b693a37373b733a31383a227265706f72742f73616c655f636f75706f6e223b693a37383b733a31373a227265706f72742f73616c655f6f72646572223b693a37393b733a31383a227265706f72742f73616c655f72657475726e223b693a38303b733a32303a227265706f72742f73616c655f7368697070696e67223b693a38313b733a31353a227265706f72742f73616c655f746178223b693a38323b733a31343a2273616c652f616666696c69617465223b693a38333b733a31323a2273616c652f636f6e74616374223b693a38343b733a31313a2273616c652f636f75706f6e223b693a38353b733a32333a2273616c652f637573746f6d65725f626c61636b6c697374223b693a38363b733a31393a2273616c652f637573746f6d65725f67726f7570223b693a38373b733a31333a2273616c652f637573746f6d6572223b693a38383b733a31303a2273616c652f6f72646572223b693a38393b733a31313a2273616c652f72657475726e223b693a39303b733a31323a2273616c652f766f7563686572223b693a39313b733a31383a2273616c652f766f75636865725f7468656d65223b693a39323b733a31353a2273657474696e672f73657474696e67223b693a39333b733a31333a2273657474696e672f73746f7265223b693a39343b733a31363a227368697070696e672f617573706f7374223b693a39353b733a31373a227368697070696e672f636974796c696e6b223b693a39363b733a31343a227368697070696e672f6665646578223b693a39373b733a31333a227368697070696e672f666c6174223b693a39383b733a31333a227368697070696e672f66726565223b693a39393b733a31333a227368697070696e672f6974656d223b693a3130303b733a32333a227368697070696e672f70617263656c666f7263655f3438223b693a3130313b733a31353a227368697070696e672f7069636b7570223b693a3130323b733a31393a227368697070696e672f726f79616c5f6d61696c223b693a3130333b733a31323a227368697070696e672f757073223b693a3130343b733a31333a227368697070696e672f75737073223b693a3130353b733a31353a227368697070696e672f776569676874223b693a3130363b733a31313a22746f6f6c2f6261636b7570223b693a3130373b733a31343a22746f6f6c2f6572726f725f6c6f67223b693a3130383b733a31323a22746f74616c2f636f75706f6e223b693a3130393b733a31323a22746f74616c2f637265646974223b693a3131303b733a31343a22746f74616c2f68616e646c696e67223b693a3131313b733a31363a22746f74616c2f6b6c61726e615f666565223b693a3131323b733a31393a22746f74616c2f6c6f775f6f726465725f666565223b693a3131333b733a31323a22746f74616c2f726577617264223b693a3131343b733a31343a22746f74616c2f7368697070696e67223b693a3131353b733a31353a22746f74616c2f7375625f746f74616c223b693a3131363b733a393a22746f74616c2f746178223b693a3131373b733a31313a22746f74616c2f746f74616c223b693a3131383b733a31333a22746f74616c2f766f7563686572223b693a3131393b733a32303a22757365722f757365725f7065726d697373696f6e223b693a3132303b733a393a22757365722f75736572223b7d7d),
(10, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucher_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) COLLATE utf8_bin NOT NULL,
  `from_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `from_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `to_name` varchar(64) COLLATE utf8_bin NOT NULL,
  `to_email` varchar(96) COLLATE utf8_bin NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text COLLATE utf8_bin NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`voucher_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `voucher`
--


-- --------------------------------------------------------

--
-- Структура таблицы `voucher_history`
--

CREATE TABLE IF NOT EXISTS `voucher_history` (
  `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL,
  PRIMARY KEY (`voucher_history_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1 ;

--
-- Дамп данных таблицы `voucher_history`
--


-- --------------------------------------------------------

--
-- Структура таблицы `voucher_theme`
--

CREATE TABLE IF NOT EXISTS `voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`voucher_theme_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=9 ;

--
-- Дамп данных таблицы `voucher_theme`
--

INSERT INTO `voucher_theme` (`voucher_theme_id`, `image`) VALUES
(8, 'data/demo/canon_eos_5d_2.jpg'),
(7, 'data/demo/gift-voucher-birthday.jpg'),
(6, 'data/demo/apple_logo.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `voucher_theme_description`
--

CREATE TABLE IF NOT EXISTS `voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`voucher_theme_id`,`language_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Дамп данных таблицы `voucher_theme_description`
--

INSERT INTO `voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Christmas'),
(7, 1, 'Birthday'),
(8, 1, 'General'),
(6, 2, 'Christmas'),
(7, 2, 'Birthday'),
(8, 2, 'General');

-- --------------------------------------------------------

--
-- Структура таблицы `weight_class`
--

CREATE TABLE IF NOT EXISTS `weight_class` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  PRIMARY KEY (`weight_class_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `weight_class`
--

INSERT INTO `weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Структура таблицы `weight_class_description`
--

CREATE TABLE IF NOT EXISTS `weight_class_description` (
  `weight_class_id` int(11) NOT NULL AUTO_INCREMENT,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) COLLATE utf8_bin NOT NULL,
  `unit` varchar(4) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`weight_class_id`,`language_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=7 ;

--
-- Дамп данных таблицы `weight_class_description`
--

INSERT INTO `weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Kilogram', 'kg'),
(2, 1, 'Gram', 'g'),
(5, 1, 'Pound ', 'lb'),
(6, 1, 'Ounce', 'oz'),
(1, 2, 'Kilogram', 'kg'),
(2, 2, 'Gram', 'g'),
(5, 2, 'Pound ', 'lb'),
(6, 2, 'Ounce', 'oz');

-- --------------------------------------------------------

--
-- Структура таблицы `zone`
--

CREATE TABLE IF NOT EXISTS `zone` (
  `zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) COLLATE utf8_bin NOT NULL,
  `code` varchar(32) COLLATE utf8_bin NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=3970 ;

--
-- Дамп данных таблицы `zone`
--

INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 1, 'Badakhshan', 'BDS', 1),
(2, 1, 'Badghis', 'BDG', 1),
(3, 1, 'Baghlan', 'BGL', 1),
(4, 1, 'Balkh', 'BAL', 1),
(5, 1, 'Bamian', 'BAM', 1),
(6, 1, 'Farah', 'FRA', 1),
(7, 1, 'Faryab', 'FYB', 1),
(8, 1, 'Ghazni', 'GHA', 1),
(9, 1, 'Ghowr', 'GHO', 1),
(10, 1, 'Helmand', 'HEL', 1),
(11, 1, 'Herat', 'HER', 1),
(12, 1, 'Jowzjan', 'JOW', 1),
(13, 1, 'Kabul', 'KAB', 1),
(14, 1, 'Kandahar', 'KAN', 1),
(15, 1, 'Kapisa', 'KAP', 1),
(16, 1, 'Khost', 'KHO', 1),
(17, 1, 'Konar', 'KNR', 1),
(18, 1, 'Kondoz', 'KDZ', 1),
(19, 1, 'Laghman', 'LAG', 1),
(20, 1, 'Lowgar', 'LOW', 1),
(21, 1, 'Nangrahar', 'NAN', 1),
(22, 1, 'Nimruz', 'NIM', 1),
(23, 1, 'Nurestan', 'NUR', 1),
(24, 1, 'Oruzgan', 'ORU', 1),
(25, 1, 'Paktia', 'PIA', 1),
(26, 1, 'Paktika', 'PKA', 1),
(27, 1, 'Parwan', 'PAR', 1),
(28, 1, 'Samangan', 'SAM', 1),
(29, 1, 'Sar-e Pol', 'SAR', 1),
(30, 1, 'Takhar', 'TAK', 1),
(31, 1, 'Wardak', 'WAR', 1),
(32, 1, 'Zabol', 'ZAB', 1),
(33, 2, 'Berat', 'BR', 1),
(34, 2, 'Bulqize', 'BU', 1),
(35, 2, 'Delvine', 'DL', 1),
(36, 2, 'Devoll', 'DV', 1),
(37, 2, 'Diber', 'DI', 1),
(38, 2, 'Durres', 'DR', 1),
(39, 2, 'Elbasan', 'EL', 1),
(40, 2, 'Kolonje', 'ER', 1),
(41, 2, 'Fier', 'FR', 1),
(42, 2, 'Gjirokaster', 'GJ', 1),
(43, 2, 'Gramsh', 'GR', 1),
(44, 2, 'Has', 'HA', 1),
(45, 2, 'Kavaje', 'KA', 1),
(46, 2, 'Kurbin', 'KB', 1),
(47, 2, 'Kucove', 'KC', 1),
(48, 2, 'Korce', 'KO', 1),
(49, 2, 'Kruje', 'KR', 1),
(50, 2, 'Kukes', 'KU', 1),
(51, 2, 'Librazhd', 'LB', 1),
(52, 2, 'Lezhe', 'LE', 1),
(53, 2, 'Lushnje', 'LU', 1),
(54, 2, 'Malesi e Madhe', 'MM', 1),
(55, 2, 'Mallakaster', 'MK', 1),
(56, 2, 'Mat', 'MT', 1),
(57, 2, 'Mirdite', 'MR', 1),
(58, 2, 'Peqin', 'PQ', 1),
(59, 2, 'Permet', 'PR', 1),
(60, 2, 'Pogradec', 'PG', 1),
(61, 2, 'Puke', 'PU', 1),
(62, 2, 'Shkoder', 'SH', 1),
(63, 2, 'Skrapar', 'SK', 1),
(64, 2, 'Sarande', 'SR', 1),
(65, 2, 'Tepelene', 'TE', 1),
(66, 2, 'Tropoje', 'TP', 1),
(67, 2, 'Tirane', 'TR', 1),
(68, 2, 'Vlore', 'VL', 1),
(69, 3, 'Adrar', 'ADR', 1),
(70, 3, 'Ain Defla', 'ADE', 1),
(71, 3, 'Ain Temouchent', 'ATE', 1),
(72, 3, 'Alger', 'ALG', 1),
(73, 3, 'Annaba', 'ANN', 1),
(74, 3, 'Batna', 'BAT', 1),
(75, 3, 'Bechar', 'BEC', 1),
(76, 3, 'Bejaia', 'BEJ', 1),
(77, 3, 'Biskra', 'BIS', 1),
(78, 3, 'Blida', 'BLI', 1),
(79, 3, 'Bordj Bou Arreridj', 'BBA', 1),
(80, 3, 'Bouira', 'BOA', 1),
(81, 3, 'Boumerdes', 'BMD', 1),
(82, 3, 'Chlef', 'CHL', 1),
(83, 3, 'Constantine', 'CON', 1),
(84, 3, 'Djelfa', 'DJE', 1),
(85, 3, 'El Bayadh', 'EBA', 1),
(86, 3, 'El Oued', 'EOU', 1),
(87, 3, 'El Tarf', 'ETA', 1),
(88, 3, 'Ghardaia', 'GHA', 1),
(89, 3, 'Guelma', 'GUE', 1),
(90, 3, 'Illizi', 'ILL', 1),
(91, 3, 'Jijel', 'JIJ', 1),
(92, 3, 'Khenchela', 'KHE', 1),
(93, 3, 'Laghouat', 'LAG', 1),
(94, 3, 'Muaskar', 'MUA', 1),
(95, 3, 'Medea', 'MED', 1),
(96, 3, 'Mila', 'MIL', 1),
(97, 3, 'Mostaganem', 'MOS', 1),
(98, 3, 'M''Sila', 'MSI', 1),
(99, 3, 'Naama', 'NAA', 1),
(100, 3, 'Oran', 'ORA', 1),
(101, 3, 'Ouargla', 'OUA', 1),
(102, 3, 'Oum el-Bouaghi', 'OEB', 1),
(103, 3, 'Relizane', 'REL', 1),
(104, 3, 'Saida', 'SAI', 1),
(105, 3, 'Setif', 'SET', 1),
(106, 3, 'Sidi Bel Abbes', 'SBA', 1),
(107, 3, 'Skikda', 'SKI', 1),
(108, 3, 'Souk Ahras', 'SAH', 1),
(109, 3, 'Tamanghasset', 'TAM', 1),
(110, 3, 'Tebessa', 'TEB', 1),
(111, 3, 'Tiaret', 'TIA', 1),
(112, 3, 'Tindouf', 'TIN', 1),
(113, 3, 'Tipaza', 'TIP', 1),
(114, 3, 'Tissemsilt', 'TIS', 1),
(115, 3, 'Tizi Ouzou', 'TOU', 1),
(116, 3, 'Tlemcen', 'TLE', 1),
(117, 4, 'Eastern', 'E', 1),
(118, 4, 'Manu''a', 'M', 1),
(119, 4, 'Rose Island', 'R', 1),
(120, 4, 'Swains Island', 'S', 1),
(121, 4, 'Western', 'W', 1),
(122, 5, 'Andorra la Vella', 'ALV', 1),
(123, 5, 'Canillo', 'CAN', 1),
(124, 5, 'Encamp', 'ENC', 1),
(125, 5, 'Escaldes-Engordany', 'ESE', 1),
(126, 5, 'La Massana', 'LMA', 1),
(127, 5, 'Ordino', 'ORD', 1),
(128, 5, 'Sant Julia de Loria', 'SJL', 1),
(129, 6, 'Bengo', 'BGO', 1),
(130, 6, 'Benguela', 'BGU', 1),
(131, 6, 'Bie', 'BIE', 1),
(132, 6, 'Cabinda', 'CAB', 1),
(133, 6, 'Cuando-Cubango', 'CCU', 1),
(134, 6, 'Cuanza Norte', 'CNO', 1),
(135, 6, 'Cuanza Sul', 'CUS', 1),
(136, 6, 'Cunene', 'CNN', 1),
(137, 6, 'Huambo', 'HUA', 1),
(138, 6, 'Huila', 'HUI', 1),
(139, 6, 'Luanda', 'LUA', 1),
(140, 6, 'Lunda Norte', 'LNO', 1),
(141, 6, 'Lunda Sul', 'LSU', 1),
(142, 6, 'Malange', 'MAL', 1),
(143, 6, 'Moxico', 'MOX', 1),
(144, 6, 'Namibe', 'NAM', 1),
(145, 6, 'Uige', 'UIG', 1),
(146, 6, 'Zaire', 'ZAI', 1),
(147, 9, 'Saint George', 'ASG', 1),
(148, 9, 'Saint John', 'ASJ', 1),
(149, 9, 'Saint Mary', 'ASM', 1),
(150, 9, 'Saint Paul', 'ASL', 1),
(151, 9, 'Saint Peter', 'ASR', 1),
(152, 9, 'Saint Philip', 'ASH', 1),
(153, 9, 'Barbuda', 'BAR', 1),
(154, 9, 'Redonda', 'RED', 1),
(155, 10, 'Antartida e Islas del Atlantico', 'AN', 1),
(156, 10, 'Buenos Aires', 'BA', 1),
(157, 10, 'Catamarca', 'CA', 1),
(158, 10, 'Chaco', 'CH', 1),
(159, 10, 'Chubut', 'CU', 1),
(160, 10, 'Cordoba', 'CO', 1),
(161, 10, 'Corrientes', 'CR', 1),
(162, 10, 'Distrito Federal', 'DF', 1),
(163, 10, 'Entre Rios', 'ER', 1),
(164, 10, 'Formosa', 'FO', 1),
(165, 10, 'Jujuy', 'JU', 1),
(166, 10, 'La Pampa', 'LP', 1),
(167, 10, 'La Rioja', 'LR', 1),
(168, 10, 'Mendoza', 'ME', 1),
(169, 10, 'Misiones', 'MI', 1),
(170, 10, 'Neuquen', 'NE', 1),
(171, 10, 'Rio Negro', 'RN', 1),
(172, 10, 'Salta', 'SA', 1),
(173, 10, 'San Juan', 'SJ', 1),
(174, 10, 'San Luis', 'SL', 1),
(175, 10, 'Santa Cruz', 'SC', 1),
(176, 10, 'Santa Fe', 'SF', 1),
(177, 10, 'Santiago del Estero', 'SD', 1),
(178, 10, 'Tierra del Fuego', 'TF', 1),
(179, 10, 'Tucuman', 'TU', 1),
(180, 11, 'Aragatsotn', 'AGT', 1),
(181, 11, 'Ararat', 'ARR', 1),
(182, 11, 'Armavir', 'ARM', 1),
(183, 11, 'Geghark''unik''', 'GEG', 1),
(184, 11, 'Kotayk''', 'KOT', 1),
(185, 11, 'Lorri', 'LOR', 1),
(186, 11, 'Shirak', 'SHI', 1),
(187, 11, 'Syunik''', 'SYU', 1),
(188, 11, 'Tavush', 'TAV', 1),
(189, 11, 'Vayots'' Dzor', 'VAY', 1),
(190, 11, 'Yerevan', 'YER', 1),
(191, 13, 'Australian Capital Territory', 'ACT', 1),
(192, 13, 'New South Wales', 'NSW', 1),
(193, 13, 'Northern Territory', 'NT', 1),
(194, 13, 'Queensland', 'QLD', 1),
(195, 13, 'South Australia', 'SA', 1),
(196, 13, 'Tasmania', 'TAS', 1),
(197, 13, 'Victoria', 'VIC', 1),
(198, 13, 'Western Australia', 'WA', 1),
(199, 14, 'Burgenland', 'BUR', 1),
(200, 14, 'Kärnten', 'KAR', 1),
(201, 14, 'Nieder&ouml;sterreich', 'NOS', 1),
(202, 14, 'Ober&ouml;sterreich', 'OOS', 1),
(203, 14, 'Salzburg', 'SAL', 1),
(204, 14, 'Steiermark', 'STE', 1),
(205, 14, 'Tirol', 'TIR', 1),
(206, 14, 'Vorarlberg', 'VOR', 1),
(207, 14, 'Wien', 'WIE', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(284, 16, 'Acklins', 'ACK', 1),
(285, 16, 'Berry Islands', 'BER', 1),
(286, 16, 'Bimini', 'BIM', 1),
(287, 16, 'Black Point', 'BLK', 1),
(288, 16, 'Cat Island', 'CAT', 1),
(289, 16, 'Central Abaco', 'CAB', 1),
(290, 16, 'Central Andros', 'CAN', 1),
(291, 16, 'Central Eleuthera', 'CEL', 1),
(292, 16, 'City of Freeport', 'FRE', 1),
(293, 16, 'Crooked Island', 'CRO', 1),
(294, 16, 'East Grand Bahama', 'EGB', 1),
(295, 16, 'Exuma', 'EXU', 1),
(296, 16, 'Grand Cay', 'GRD', 1),
(297, 16, 'Harbour Island', 'HAR', 1),
(298, 16, 'Hope Town', 'HOP', 1),
(299, 16, 'Inagua', 'INA', 1),
(300, 16, 'Long Island', 'LNG', 1),
(301, 16, 'Mangrove Cay', 'MAN', 1),
(302, 16, 'Mayaguana', 'MAY', 1),
(303, 16, 'Moore''s Island', 'MOO', 1),
(304, 16, 'North Abaco', 'NAB', 1),
(305, 16, 'North Andros', 'NAN', 1),
(306, 16, 'North Eleuthera', 'NEL', 1),
(307, 16, 'Ragged Island', 'RAG', 1),
(308, 16, 'Rum Cay', 'RUM', 1),
(309, 16, 'San Salvador', 'SAL', 1),
(310, 16, 'South Abaco', 'SAB', 1),
(311, 16, 'South Andros', 'SAN', 1),
(312, 16, 'South Eleuthera', 'SEL', 1),
(313, 16, 'Spanish Wells', 'SWE', 1),
(314, 16, 'West Grand Bahama', 'WGB', 1),
(315, 17, 'Capital', 'CAP', 1),
(316, 17, 'Central', 'CEN', 1),
(317, 17, 'Muharraq', 'MUH', 1),
(318, 17, 'Northern', 'NOR', 1),
(319, 17, 'Southern', 'SOU', 1),
(320, 18, 'Barisal', 'BAR', 1),
(321, 18, 'Chittagong', 'CHI', 1),
(322, 18, 'Dhaka', 'DHA', 1),
(323, 18, 'Khulna', 'KHU', 1),
(324, 18, 'Rajshahi', 'RAJ', 1),
(325, 18, 'Sylhet', 'SYL', 1),
(326, 19, 'Christ Church', 'CC', 1),
(327, 19, 'Saint Andrew', 'AND', 1),
(328, 19, 'Saint George', 'GEO', 1),
(329, 19, 'Saint James', 'JAM', 1),
(330, 19, 'Saint John', 'JOH', 1),
(331, 19, 'Saint Joseph', 'JOS', 1),
(332, 19, 'Saint Lucy', 'LUC', 1),
(333, 19, 'Saint Michael', 'MIC', 1),
(334, 19, 'Saint Peter', 'PET', 1),
(335, 19, 'Saint Philip', 'PHI', 1),
(336, 19, 'Saint Thomas', 'THO', 1),
(337, 20, 'Brestskaya (Brest)', 'BR', 1),
(338, 20, 'Homyel''skaya (Homyel'')', 'HO', 1),
(339, 20, 'Horad Minsk', 'HM', 1),
(340, 20, 'Hrodzyenskaya (Hrodna)', 'HR', 1),
(341, 20, 'Mahilyowskaya (Mahilyow)', 'MA', 1),
(342, 20, 'Minskaya', 'MI', 1),
(343, 20, 'Vitsyebskaya (Vitsyebsk)', 'VI', 1),
(344, 21, 'Antwerpen', 'VAN', 1),
(345, 21, 'Brabant Wallon', 'WBR', 1),
(346, 21, 'Hainaut', 'WHT', 1),
(347, 21, 'Liege', 'WLG', 1),
(348, 21, 'Limburg', 'VLI', 1),
(349, 21, 'Luxembourg', 'WLX', 1),
(350, 21, 'Namur', 'WNA', 1),
(351, 21, 'Oost-Vlaanderen', 'VOV', 1),
(352, 21, 'Vlaams Brabant', 'VBR', 1),
(353, 21, 'West-Vlaanderen', 'VWV', 1),
(354, 22, 'Belize', 'BZ', 1),
(355, 22, 'Cayo', 'CY', 1),
(356, 22, 'Corozal', 'CR', 1),
(357, 22, 'Orange Walk', 'OW', 1),
(358, 22, 'Stann Creek', 'SC', 1),
(359, 22, 'Toledo', 'TO', 1),
(360, 23, 'Alibori', 'AL', 1),
(361, 23, 'Atakora', 'AK', 1),
(362, 23, 'Atlantique', 'AQ', 1),
(363, 23, 'Borgou', 'BO', 1),
(364, 23, 'Collines', 'CO', 1),
(365, 23, 'Donga', 'DO', 1),
(366, 23, 'Kouffo', 'KO', 1),
(367, 23, 'Littoral', 'LI', 1),
(368, 23, 'Mono', 'MO', 1),
(369, 23, 'Oueme', 'OU', 1),
(370, 23, 'Plateau', 'PL', 1),
(371, 23, 'Zou', 'ZO', 1),
(372, 24, 'Devonshire', 'DS', 1),
(373, 24, 'Hamilton City', 'HC', 1),
(374, 24, 'Hamilton', 'HA', 1),
(375, 24, 'Paget', 'PG', 1),
(376, 24, 'Pembroke', 'PB', 1),
(377, 24, 'Saint George City', 'GC', 1),
(378, 24, 'Saint George''s', 'SG', 1),
(379, 24, 'Sandys', 'SA', 1),
(380, 24, 'Smith''s', 'SM', 1),
(381, 24, 'Southampton', 'SH', 1),
(382, 24, 'Warwick', 'WA', 1),
(383, 25, 'Bumthang', 'BUM', 1),
(384, 25, 'Chukha', 'CHU', 1),
(385, 25, 'Dagana', 'DAG', 1),
(386, 25, 'Gasa', 'GAS', 1),
(387, 25, 'Haa', 'HAA', 1),
(388, 25, 'Lhuntse', 'LHU', 1),
(389, 25, 'Mongar', 'MON', 1),
(390, 25, 'Paro', 'PAR', 1),
(391, 25, 'Pemagatshel', 'PEM', 1),
(392, 25, 'Punakha', 'PUN', 1),
(393, 25, 'Samdrup Jongkhar', 'SJO', 1),
(394, 25, 'Samtse', 'SAT', 1),
(395, 25, 'Sarpang', 'SAR', 1),
(396, 25, 'Thimphu', 'THI', 1),
(397, 25, 'Trashigang', 'TRG', 1),
(398, 25, 'Trashiyangste', 'TRY', 1),
(399, 25, 'Trongsa', 'TRO', 1),
(400, 25, 'Tsirang', 'TSI', 1),
(401, 25, 'Wangdue Phodrang', 'WPH', 1),
(402, 25, 'Zhemgang', 'ZHE', 1),
(403, 26, 'Beni', 'BEN', 1),
(404, 26, 'Chuquisaca', 'CHU', 1),
(405, 26, 'Cochabamba', 'COC', 1),
(406, 26, 'La Paz', 'LPZ', 1),
(407, 26, 'Oruro', 'ORU', 1),
(408, 26, 'Pando', 'PAN', 1),
(409, 26, 'Potosi', 'POT', 1),
(410, 26, 'Santa Cruz', 'SCZ', 1),
(411, 26, 'Tarija', 'TAR', 1),
(412, 27, 'Brcko district', 'BRO', 1),
(413, 27, 'Unsko-Sanski Kanton', 'FUS', 1),
(414, 27, 'Posavski Kanton', 'FPO', 1),
(415, 27, 'Tuzlanski Kanton', 'FTU', 1),
(416, 27, 'Zenicko-Dobojski Kanton', 'FZE', 1),
(417, 27, 'Bosanskopodrinjski Kanton', 'FBP', 1),
(418, 27, 'Srednjebosanski Kanton', 'FSB', 1),
(419, 27, 'Hercegovacko-neretvanski Kanton', 'FHN', 1),
(420, 27, 'Zapadnohercegovacka Zupanija', 'FZH', 1),
(421, 27, 'Kanton Sarajevo', 'FSA', 1),
(422, 27, 'Zapadnobosanska', 'FZA', 1),
(423, 27, 'Banja Luka', 'SBL', 1),
(424, 27, 'Doboj', 'SDO', 1),
(425, 27, 'Bijeljina', 'SBI', 1),
(426, 27, 'Vlasenica', 'SVL', 1),
(427, 27, 'Sarajevo-Romanija or Sokolac', 'SSR', 1),
(428, 27, 'Foca', 'SFO', 1),
(429, 27, 'Trebinje', 'STR', 1),
(430, 28, 'Central', 'CE', 1),
(431, 28, 'Ghanzi', 'GH', 1),
(432, 28, 'Kgalagadi', 'KD', 1),
(433, 28, 'Kgatleng', 'KT', 1),
(434, 28, 'Kweneng', 'KW', 1),
(435, 28, 'Ngamiland', 'NG', 1),
(436, 28, 'North East', 'NE', 1),
(437, 28, 'North West', 'NW', 1),
(438, 28, 'South East', 'SE', 1),
(439, 28, 'Southern', 'SO', 1),
(440, 30, 'Acre', 'AC', 1),
(441, 30, 'Alagoas', 'AL', 1),
(442, 30, 'Amapa', 'AP', 1),
(443, 30, 'Amazonas', 'AM', 1),
(444, 30, 'Bahia', 'BA', 1),
(445, 30, 'Ceara', 'CE', 1),
(446, 30, 'Distrito Federal', 'DF', 1),
(447, 30, 'Espirito Santo', 'ES', 1),
(448, 30, 'Goias', 'GO', 1),
(449, 30, 'Maranhao', 'MA', 1),
(450, 30, 'Mato Grosso', 'MT', 1),
(451, 30, 'Mato Grosso do Sul', 'MS', 1),
(452, 30, 'Minas Gerais', 'MG', 1),
(453, 30, 'Para', 'PA', 1),
(454, 30, 'Paraiba', 'PB', 1),
(455, 30, 'Parana', 'PR', 1),
(456, 30, 'Pernambuco', 'PE', 1),
(457, 30, 'Piaui', 'PI', 1),
(458, 30, 'Rio de Janeiro', 'RJ', 1),
(459, 30, 'Rio Grande do Norte', 'RN', 1),
(460, 30, 'Rio Grande do Sul', 'RS', 1),
(461, 30, 'Rondonia', 'RO', 1),
(462, 30, 'Roraima', 'RR', 1),
(463, 30, 'Santa Catarina', 'SC', 1),
(464, 30, 'Sao Paulo', 'SP', 1),
(465, 30, 'Sergipe', 'SE', 1),
(466, 30, 'Tocantins', 'TO', 1),
(467, 31, 'Peros Banhos', 'PB', 1),
(468, 31, 'Salomon Islands', 'SI', 1),
(469, 31, 'Nelsons Island', 'NI', 1),
(470, 31, 'Three Brothers', 'TB', 1),
(471, 31, 'Eagle Islands', 'EA', 1),
(472, 31, 'Danger Island', 'DI', 1),
(473, 31, 'Egmont Islands', 'EG', 1),
(474, 31, 'Diego Garcia', 'DG', 1),
(475, 32, 'Belait', 'BEL', 1),
(476, 32, 'Brunei and Muara', 'BRM', 1),
(477, 32, 'Temburong', 'TEM', 1),
(478, 32, 'Tutong', 'TUT', 1),
(479, 33, 'Blagoevgrad', '', 1),
(480, 33, 'Burgas', '', 1),
(481, 33, 'Dobrich', '', 1),
(482, 33, 'Gabrovo', '', 1),
(483, 33, 'Haskovo', '', 1),
(484, 33, 'Kardjali', '', 1),
(485, 33, 'Kyustendil', '', 1),
(486, 33, 'Lovech', '', 1),
(487, 33, 'Montana', '', 1),
(488, 33, 'Pazardjik', '', 1),
(489, 33, 'Pernik', '', 1),
(490, 33, 'Pleven', '', 1),
(491, 33, 'Plovdiv', '', 1),
(492, 33, 'Razgrad', '', 1),
(493, 33, 'Shumen', '', 1),
(494, 33, 'Silistra', '', 1),
(495, 33, 'Sliven', '', 1),
(496, 33, 'Smolyan', '', 1),
(497, 33, 'Sofia', '', 1),
(498, 33, 'Sofia - town', '', 1),
(499, 33, 'Stara Zagora', '', 1),
(500, 33, 'Targovishte', '', 1),
(501, 33, 'Varna', '', 1),
(502, 33, 'Veliko Tarnovo', '', 1),
(503, 33, 'Vidin', '', 1),
(504, 33, 'Vratza', '', 1),
(505, 33, 'Yambol', '', 1),
(506, 34, 'Bale', 'BAL', 1),
(507, 34, 'Bam', 'BAM', 1),
(508, 34, 'Banwa', 'BAN', 1),
(509, 34, 'Bazega', 'BAZ', 1),
(510, 34, 'Bougouriba', 'BOR', 1),
(511, 34, 'Boulgou', 'BLG', 1),
(512, 34, 'Boulkiemde', 'BOK', 1),
(513, 34, 'Comoe', 'COM', 1),
(514, 34, 'Ganzourgou', 'GAN', 1),
(515, 34, 'Gnagna', 'GNA', 1),
(516, 34, 'Gourma', 'GOU', 1),
(517, 34, 'Houet', 'HOU', 1),
(518, 34, 'Ioba', 'IOA', 1),
(519, 34, 'Kadiogo', 'KAD', 1),
(520, 34, 'Kenedougou', 'KEN', 1),
(521, 34, 'Komondjari', 'KOD', 1),
(522, 34, 'Kompienga', 'KOP', 1),
(523, 34, 'Kossi', 'KOS', 1),
(524, 34, 'Koulpelogo', 'KOL', 1),
(525, 34, 'Kouritenga', 'KOT', 1),
(526, 34, 'Kourweogo', 'KOW', 1),
(527, 34, 'Leraba', 'LER', 1),
(528, 34, 'Loroum', 'LOR', 1),
(529, 34, 'Mouhoun', 'MOU', 1),
(530, 34, 'Nahouri', 'NAH', 1),
(531, 34, 'Namentenga', 'NAM', 1),
(532, 34, 'Nayala', 'NAY', 1),
(533, 34, 'Noumbiel', 'NOU', 1),
(534, 34, 'Oubritenga', 'OUB', 1),
(535, 34, 'Oudalan', 'OUD', 1),
(536, 34, 'Passore', 'PAS', 1),
(537, 34, 'Poni', 'PON', 1),
(538, 34, 'Sanguie', 'SAG', 1),
(539, 34, 'Sanmatenga', 'SAM', 1),
(540, 34, 'Seno', 'SEN', 1),
(541, 34, 'Sissili', 'SIS', 1),
(542, 34, 'Soum', 'SOM', 1),
(543, 34, 'Sourou', 'SOR', 1),
(544, 34, 'Tapoa', 'TAP', 1),
(545, 34, 'Tuy', 'TUY', 1),
(546, 34, 'Yagha', 'YAG', 1),
(547, 34, 'Yatenga', 'YAT', 1),
(548, 34, 'Ziro', 'ZIR', 1),
(549, 34, 'Zondoma', 'ZOD', 1),
(550, 34, 'Zoundweogo', 'ZOW', 1),
(551, 35, 'Bubanza', 'BB', 1),
(552, 35, 'Bujumbura', 'BJ', 1),
(553, 35, 'Bururi', 'BR', 1),
(554, 35, 'Cankuzo', 'CA', 1),
(555, 35, 'Cibitoke', 'CI', 1),
(556, 35, 'Gitega', 'GI', 1),
(557, 35, 'Karuzi', 'KR', 1),
(558, 35, 'Kayanza', 'KY', 1),
(559, 35, 'Kirundo', 'KI', 1),
(560, 35, 'Makamba', 'MA', 1),
(561, 35, 'Muramvya', 'MU', 1),
(562, 35, 'Muyinga', 'MY', 1),
(563, 35, 'Mwaro', 'MW', 1),
(564, 35, 'Ngozi', 'NG', 1),
(565, 35, 'Rutana', 'RT', 1),
(566, 35, 'Ruyigi', 'RY', 1),
(567, 36, 'Phnom Penh', 'PP', 1),
(568, 36, 'Preah Seihanu (Kompong Som or Sihanoukville)', 'PS', 1),
(569, 36, 'Pailin', 'PA', 1),
(570, 36, 'Keb', 'KB', 1),
(571, 36, 'Banteay Meanchey', 'BM', 1),
(572, 36, 'Battambang', 'BA', 1),
(573, 36, 'Kampong Cham', 'KM', 1),
(574, 36, 'Kampong Chhnang', 'KN', 1),
(575, 36, 'Kampong Speu', 'KU', 1),
(576, 36, 'Kampong Som', 'KO', 1),
(577, 36, 'Kampong Thom', 'KT', 1),
(578, 36, 'Kampot', 'KP', 1),
(579, 36, 'Kandal', 'KL', 1),
(580, 36, 'Kaoh Kong', 'KK', 1),
(581, 36, 'Kratie', 'KR', 1),
(582, 36, 'Mondul Kiri', 'MK', 1),
(583, 36, 'Oddar Meancheay', 'OM', 1),
(584, 36, 'Pursat', 'PU', 1),
(585, 36, 'Preah Vihear', 'PR', 1),
(586, 36, 'Prey Veng', 'PG', 1),
(587, 36, 'Ratanak Kiri', 'RK', 1),
(588, 36, 'Siemreap', 'SI', 1),
(589, 36, 'Stung Treng', 'ST', 1),
(590, 36, 'Svay Rieng', 'SR', 1),
(591, 36, 'Takeo', 'TK', 1),
(592, 37, 'Adamawa (Adamaoua)', 'ADA', 1),
(593, 37, 'Centre', 'CEN', 1),
(594, 37, 'East (Est)', 'EST', 1),
(595, 37, 'Extreme North (Extreme-Nord)', 'EXN', 1),
(596, 37, 'Littoral', 'LIT', 1),
(597, 37, 'North (Nord)', 'NOR', 1),
(598, 37, 'Northwest (Nord-Ouest)', 'NOT', 1),
(599, 37, 'West (Ouest)', 'OUE', 1),
(600, 37, 'South (Sud)', 'SUD', 1),
(601, 37, 'Southwest (Sud-Ouest).', 'SOU', 1),
(602, 38, 'Alberta', 'AB', 1),
(603, 38, 'British Columbia', 'BC', 1),
(604, 38, 'Manitoba', 'MB', 1),
(605, 38, 'New Brunswick', 'NB', 1),
(606, 38, 'Newfoundland and Labrador', 'NL', 1),
(607, 38, 'Northwest Territories', 'NT', 1),
(608, 38, 'Nova Scotia', 'NS', 1),
(609, 38, 'Nunavut', 'NU', 1),
(610, 38, 'Ontario', 'ON', 1),
(611, 38, 'Prince Edward Island', 'PE', 1),
(612, 38, 'Qu&eacute;bec', 'QC', 1),
(613, 38, 'Saskatchewan', 'SK', 1),
(614, 38, 'Yukon Territory', 'YT', 1),
(615, 39, 'Boa Vista', 'BV', 1),
(616, 39, 'Brava', 'BR', 1),
(617, 39, 'Calheta de Sao Miguel', 'CS', 1),
(618, 39, 'Maio', 'MA', 1),
(619, 39, 'Mosteiros', 'MO', 1),
(620, 39, 'Paul', 'PA', 1),
(621, 39, 'Porto Novo', 'PN', 1),
(622, 39, 'Praia', 'PR', 1),
(623, 39, 'Ribeira Grande', 'RG', 1),
(624, 39, 'Sal', 'SL', 1),
(625, 39, 'Santa Catarina', 'CA', 1),
(626, 39, 'Santa Cruz', 'CR', 1),
(627, 39, 'Sao Domingos', 'SD', 1),
(628, 39, 'Sao Filipe', 'SF', 1),
(629, 39, 'Sao Nicolau', 'SN', 1),
(630, 39, 'Sao Vicente', 'SV', 1),
(631, 39, 'Tarrafal', 'TA', 1),
(632, 40, 'Creek', 'CR', 1),
(633, 40, 'Eastern', 'EA', 1),
(634, 40, 'Midland', 'ML', 1),
(635, 40, 'South Town', 'ST', 1),
(636, 40, 'Spot Bay', 'SP', 1),
(637, 40, 'Stake Bay', 'SK', 1),
(638, 40, 'West End', 'WD', 1),
(639, 40, 'Western', 'WN', 1),
(640, 41, 'Bamingui-Bangoran', 'BBA', 1),
(641, 41, 'Basse-Kotto', 'BKO', 1),
(642, 41, 'Haute-Kotto', 'HKO', 1),
(643, 41, 'Haut-Mbomou', 'HMB', 1),
(644, 41, 'Kemo', 'KEM', 1),
(645, 41, 'Lobaye', 'LOB', 1),
(646, 41, 'Mambere-KadeÔ', 'MKD', 1),
(647, 41, 'Mbomou', 'MBO', 1),
(648, 41, 'Nana-Mambere', 'NMM', 1),
(649, 41, 'Ombella-M''Poko', 'OMP', 1),
(650, 41, 'Ouaka', 'OUK', 1),
(651, 41, 'Ouham', 'OUH', 1),
(652, 41, 'Ouham-Pende', 'OPE', 1),
(653, 41, 'Vakaga', 'VAK', 1),
(654, 41, 'Nana-Grebizi', 'NGR', 1),
(655, 41, 'Sangha-Mbaere', 'SMB', 1),
(656, 41, 'Bangui', 'BAN', 1),
(657, 42, 'Batha', 'BA', 1),
(658, 42, 'Biltine', 'BI', 1),
(659, 42, 'Borkou-Ennedi-Tibesti', 'BE', 1),
(660, 42, 'Chari-Baguirmi', 'CB', 1),
(661, 42, 'Guera', 'GU', 1),
(662, 42, 'Kanem', 'KA', 1),
(663, 42, 'Lac', 'LA', 1),
(664, 42, 'Logone Occidental', 'LC', 1),
(665, 42, 'Logone Oriental', 'LR', 1),
(666, 42, 'Mayo-Kebbi', 'MK', 1),
(667, 42, 'Moyen-Chari', 'MC', 1),
(668, 42, 'Ouaddai', 'OU', 1),
(669, 42, 'Salamat', 'SA', 1),
(670, 42, 'Tandjile', 'TA', 1),
(671, 43, 'Aisen del General Carlos Ibanez', 'AI', 1),
(672, 43, 'Antofagasta', 'AN', 1),
(673, 43, 'Araucania', 'AR', 1),
(674, 43, 'Atacama', 'AT', 1),
(675, 43, 'Bio-Bio', 'BI', 1),
(676, 43, 'Coquimbo', 'CO', 1),
(677, 43, 'Libertador General Bernardo O''Hi', 'LI', 1),
(678, 43, 'Los Lagos', 'LL', 1),
(679, 43, 'Magallanes y de la Antartica Chi', 'MA', 1),
(680, 43, 'Maule', 'ML', 1),
(681, 43, 'Region Metropolitana', 'RM', 1),
(682, 43, 'Tarapaca', 'TA', 1),
(683, 43, 'Valparaiso', 'VS', 1),
(684, 44, 'Anhui', 'AN', 1),
(685, 44, 'Beijing', 'BE', 1),
(686, 44, 'Chongqing', 'CH', 1),
(687, 44, 'Fujian', 'FU', 1),
(688, 44, 'Gansu', 'GA', 1),
(689, 44, 'Guangdong', 'GU', 1),
(690, 44, 'Guangxi', 'GX', 1),
(691, 44, 'Guizhou', 'GZ', 1),
(692, 44, 'Hainan', 'HA', 1),
(693, 44, 'Hebei', 'HB', 1),
(694, 44, 'Heilongjiang', 'HL', 1),
(695, 44, 'Henan', 'HE', 1),
(696, 44, 'Hong Kong', 'HK', 1),
(697, 44, 'Hubei', 'HU', 1),
(698, 44, 'Hunan', 'HN', 1),
(699, 44, 'Inner Mongolia', 'IM', 1),
(700, 44, 'Jiangsu', 'JI', 1),
(701, 44, 'Jiangxi', 'JX', 1),
(702, 44, 'Jilin', 'JL', 1),
(703, 44, 'Liaoning', 'LI', 1),
(704, 44, 'Macau', 'MA', 1),
(705, 44, 'Ningxia', 'NI', 1),
(706, 44, 'Shaanxi', 'SH', 1),
(707, 44, 'Shandong', 'SA', 1),
(708, 44, 'Shanghai', 'SG', 1),
(709, 44, 'Shanxi', 'SX', 1),
(710, 44, 'Sichuan', 'SI', 1),
(711, 44, 'Tianjin', 'TI', 1),
(712, 44, 'Xinjiang', 'XI', 1),
(713, 44, 'Yunnan', 'YU', 1),
(714, 44, 'Zhejiang', 'ZH', 1),
(715, 46, 'Direction Island', 'D', 1),
(716, 46, 'Home Island', 'H', 1),
(717, 46, 'Horsburgh Island', 'O', 1),
(718, 46, 'South Island', 'S', 1),
(719, 46, 'West Island', 'W', 1),
(720, 47, 'Amazonas', 'AMZ', 1),
(721, 47, 'Antioquia', 'ANT', 1),
(722, 47, 'Arauca', 'ARA', 1),
(723, 47, 'Atlantico', 'ATL', 1),
(724, 47, 'Bogota D.C.', 'BDC', 1),
(725, 47, 'Bolivar', 'BOL', 1),
(726, 47, 'Boyaca', 'BOY', 1),
(727, 47, 'Caldas', 'CAL', 1),
(728, 47, 'Caqueta', 'CAQ', 1),
(729, 47, 'Casanare', 'CAS', 1),
(730, 47, 'Cauca', 'CAU', 1),
(731, 47, 'Cesar', 'CES', 1),
(732, 47, 'Choco', 'CHO', 1),
(733, 47, 'Cordoba', 'COR', 1),
(734, 47, 'Cundinamarca', 'CAM', 1),
(735, 47, 'Guainia', 'GNA', 1),
(736, 47, 'Guajira', 'GJR', 1),
(737, 47, 'Guaviare', 'GVR', 1),
(738, 47, 'Huila', 'HUI', 1),
(739, 47, 'Magdalena', 'MAG', 1),
(740, 47, 'Meta', 'MET', 1),
(741, 47, 'Narino', 'NAR', 1),
(742, 47, 'Norte de Santander', 'NDS', 1),
(743, 47, 'Putumayo', 'PUT', 1),
(744, 47, 'Quindio', 'QUI', 1),
(745, 47, 'Risaralda', 'RIS', 1),
(746, 47, 'San Andres y Providencia', 'SAP', 1),
(747, 47, 'Santander', 'SAN', 1),
(748, 47, 'Sucre', 'SUC', 1),
(749, 47, 'Tolima', 'TOL', 1),
(750, 47, 'Valle del Cauca', 'VDC', 1),
(751, 47, 'Vaupes', 'VAU', 1),
(752, 47, 'Vichada', 'VIC', 1),
(753, 48, 'Grande Comore', 'G', 1),
(754, 48, 'Anjouan', 'A', 1),
(755, 48, 'Moheli', 'M', 1),
(756, 49, 'Bouenza', 'BO', 1),
(757, 49, 'Brazzaville', 'BR', 1),
(758, 49, 'Cuvette', 'CU', 1),
(759, 49, 'Cuvette-Ouest', 'CO', 1),
(760, 49, 'Kouilou', 'KO', 1),
(761, 49, 'Lekoumou', 'LE', 1),
(762, 49, 'Likouala', 'LI', 1),
(763, 49, 'Niari', 'NI', 1),
(764, 49, 'Plateaux', 'PL', 1),
(765, 49, 'Pool', 'PO', 1),
(766, 49, 'Sangha', 'SA', 1),
(767, 50, 'Pukapuka', 'PU', 1),
(768, 50, 'Rakahanga', 'RK', 1),
(769, 50, 'Manihiki', 'MK', 1),
(770, 50, 'Penrhyn', 'PE', 1),
(771, 50, 'Nassau Island', 'NI', 1),
(772, 50, 'Surwarrow', 'SU', 1),
(773, 50, 'Palmerston', 'PA', 1),
(774, 50, 'Aitutaki', 'AI', 1),
(775, 50, 'Manuae', 'MA', 1),
(776, 50, 'Takutea', 'TA', 1),
(777, 50, 'Mitiaro', 'MT', 1),
(778, 50, 'Atiu', 'AT', 1),
(779, 50, 'Mauke', 'MU', 1),
(780, 50, 'Rarotonga', 'RR', 1),
(781, 50, 'Mangaia', 'MG', 1),
(782, 51, 'Alajuela', 'AL', 1),
(783, 51, 'Cartago', 'CA', 1),
(784, 51, 'Guanacaste', 'GU', 1),
(785, 51, 'Heredia', 'HE', 1),
(786, 51, 'Limon', 'LI', 1),
(787, 51, 'Puntarenas', 'PU', 1),
(788, 51, 'San Jose', 'SJ', 1),
(789, 52, 'Abengourou', 'ABE', 1),
(790, 52, 'Abidjan', 'ABI', 1),
(791, 52, 'Aboisso', 'ABO', 1),
(792, 52, 'Adiake', 'ADI', 1),
(793, 52, 'Adzope', 'ADZ', 1),
(794, 52, 'Agboville', 'AGB', 1),
(795, 52, 'Agnibilekrou', 'AGN', 1),
(796, 52, 'Alepe', 'ALE', 1),
(797, 52, 'Bocanda', 'BOC', 1),
(798, 52, 'Bangolo', 'BAN', 1),
(799, 52, 'Beoumi', 'BEO', 1),
(800, 52, 'Biankouma', 'BIA', 1),
(801, 52, 'Bondoukou', 'BDK', 1),
(802, 52, 'Bongouanou', 'BGN', 1),
(803, 52, 'Bouafle', 'BFL', 1),
(804, 52, 'Bouake', 'BKE', 1),
(805, 52, 'Bouna', 'BNA', 1),
(806, 52, 'Boundiali', 'BDL', 1),
(807, 52, 'Dabakala', 'DKL', 1),
(808, 52, 'Dabou', 'DBU', 1),
(809, 52, 'Daloa', 'DAL', 1),
(810, 52, 'Danane', 'DAN', 1),
(811, 52, 'Daoukro', 'DAO', 1),
(812, 52, 'Dimbokro', 'DIM', 1),
(813, 52, 'Divo', 'DIV', 1),
(814, 52, 'Duekoue', 'DUE', 1),
(815, 52, 'Ferkessedougou', 'FER', 1),
(816, 52, 'Gagnoa', 'GAG', 1),
(817, 52, 'Grand-Bassam', 'GBA', 1),
(818, 52, 'Grand-Lahou', 'GLA', 1),
(819, 52, 'Guiglo', 'GUI', 1),
(820, 52, 'Issia', 'ISS', 1),
(821, 52, 'Jacqueville', 'JAC', 1),
(822, 52, 'Katiola', 'KAT', 1),
(823, 52, 'Korhogo', 'KOR', 1),
(824, 52, 'Lakota', 'LAK', 1),
(825, 52, 'Man', 'MAN', 1),
(826, 52, 'Mankono', 'MKN', 1),
(827, 52, 'Mbahiakro', 'MBA', 1),
(828, 52, 'Odienne', 'ODI', 1),
(829, 52, 'Oume', 'OUM', 1),
(830, 52, 'Sakassou', 'SAK', 1),
(831, 52, 'San-Pedro', 'SPE', 1),
(832, 52, 'Sassandra', 'SAS', 1),
(833, 52, 'Seguela', 'SEG', 1),
(834, 52, 'Sinfra', 'SIN', 1),
(835, 52, 'Soubre', 'SOU', 1),
(836, 52, 'Tabou', 'TAB', 1),
(837, 52, 'Tanda', 'TAN', 1),
(838, 52, 'Tiebissou', 'TIE', 1),
(839, 52, 'Tingrela', 'TIN', 1),
(840, 52, 'Tiassale', 'TIA', 1),
(841, 52, 'Touba', 'TBA', 1),
(842, 52, 'Toulepleu', 'TLP', 1),
(843, 52, 'Toumodi', 'TMD', 1),
(844, 52, 'Vavoua', 'VAV', 1),
(845, 52, 'Yamoussoukro', 'YAM', 1),
(846, 52, 'Zuenoula', 'ZUE', 1),
(847, 53, 'Bjelovar-Bilogora', 'BB', 1),
(848, 53, 'City of Zagreb', 'CZ', 1),
(849, 53, 'Dubrovnik-Neretva', 'DN', 1),
(850, 53, 'Istra', 'IS', 1),
(851, 53, 'Karlovac', 'KA', 1),
(852, 53, 'Koprivnica-Krizevci', 'KK', 1),
(853, 53, 'Krapina-Zagorje', 'KZ', 1),
(854, 53, 'Lika-Senj', 'LS', 1),
(855, 53, 'Medimurje', 'ME', 1),
(856, 53, 'Osijek-Baranja', 'OB', 1),
(857, 53, 'Pozega-Slavonia', 'PS', 1),
(858, 53, 'Primorje-Gorski Kotar', 'PG', 1),
(859, 53, 'Sibenik', 'SI', 1),
(860, 53, 'Sisak-Moslavina', 'SM', 1),
(861, 53, 'Slavonski Brod-Posavina', 'SB', 1),
(862, 53, 'Split-Dalmatia', 'SD', 1),
(863, 53, 'Varazdin', 'VA', 1),
(864, 53, 'Virovitica-Podravina', 'VP', 1),
(865, 53, 'Vukovar-Srijem', 'VS', 1),
(866, 53, 'Zadar-Knin', 'ZK', 1),
(867, 53, 'Zagreb', 'ZA', 1),
(868, 54, 'Camaguey', 'CA', 1),
(869, 54, 'Ciego de Avila', 'CD', 1),
(870, 54, 'Cienfuegos', 'CI', 1),
(871, 54, 'Ciudad de La Habana', 'CH', 1),
(872, 54, 'Granma', 'GR', 1),
(873, 54, 'Guantanamo', 'GU', 1),
(874, 54, 'Holguin', 'HO', 1),
(875, 54, 'Isla de la Juventud', 'IJ', 1),
(876, 54, 'La Habana', 'LH', 1),
(877, 54, 'Las Tunas', 'LT', 1),
(878, 54, 'Matanzas', 'MA', 1),
(879, 54, 'Pinar del Rio', 'PR', 1),
(880, 54, 'Sancti Spiritus', 'SS', 1),
(881, 54, 'Santiago de Cuba', 'SC', 1),
(882, 54, 'Villa Clara', 'VC', 1),
(883, 55, 'Famagusta', 'F', 1),
(884, 55, 'Kyrenia', 'K', 1),
(885, 55, 'Larnaca', 'A', 1),
(886, 55, 'Limassol', 'I', 1),
(887, 55, 'Nicosia', 'N', 1),
(888, 55, 'Paphos', 'P', 1),
(889, 56, 'Ústecký', 'U', 1),
(890, 56, 'Jihočeský', 'C', 1),
(891, 56, 'Jihomoravský', 'B', 1),
(892, 56, 'Karlovarský', 'K', 1),
(893, 56, 'Královehradecký', 'H', 1),
(894, 56, 'Liberecký', 'L', 1),
(895, 56, 'Moravskoslezský', 'T', 1),
(896, 56, 'Olomoucký', 'M', 1),
(897, 56, 'Pardubický', 'E', 1),
(898, 56, 'Plzeňský', 'P', 1),
(899, 56, 'Praha', 'A', 1),
(900, 56, 'Středočeský', 'S', 1),
(901, 56, 'Vysočina', 'J', 1),
(902, 56, 'Zlínský', 'Z', 1),
(903, 57, 'Arhus', 'AR', 1),
(904, 57, 'Bornholm', 'BH', 1),
(905, 57, 'Copenhagen', 'CO', 1),
(906, 57, 'Faroe Islands', 'FO', 1),
(907, 57, 'Frederiksborg', 'FR', 1),
(908, 57, 'Fyn', 'FY', 1),
(909, 57, 'Kobenhavn', 'KO', 1),
(910, 57, 'Nordjylland', 'NO', 1),
(911, 57, 'Ribe', 'RI', 1),
(912, 57, 'Ringkobing', 'RK', 1),
(913, 57, 'Roskilde', 'RO', 1),
(914, 57, 'Sonderjylland', 'SO', 1),
(915, 57, 'Storstrom', 'ST', 1),
(916, 57, 'Vejle', 'VK', 1),
(917, 57, 'Vestj&aelig;lland', 'VJ', 1),
(918, 57, 'Viborg', 'VB', 1),
(919, 58, '''Ali Sabih', 'S', 1),
(920, 58, 'Dikhil', 'K', 1),
(921, 58, 'Djibouti', 'J', 1),
(922, 58, 'Obock', 'O', 1),
(923, 58, 'Tadjoura', 'T', 1),
(924, 59, 'Saint Andrew Parish', 'AND', 1),
(925, 59, 'Saint David Parish', 'DAV', 1),
(926, 59, 'Saint George Parish', 'GEO', 1),
(927, 59, 'Saint John Parish', 'JOH', 1),
(928, 59, 'Saint Joseph Parish', 'JOS', 1),
(929, 59, 'Saint Luke Parish', 'LUK', 1),
(930, 59, 'Saint Mark Parish', 'MAR', 1),
(931, 59, 'Saint Patrick Parish', 'PAT', 1),
(932, 59, 'Saint Paul Parish', 'PAU', 1),
(933, 59, 'Saint Peter Parish', 'PET', 1),
(934, 60, 'Distrito Nacional', 'DN', 1),
(935, 60, 'Azua', 'AZ', 1),
(936, 60, 'Baoruco', 'BC', 1),
(937, 60, 'Barahona', 'BH', 1),
(938, 60, 'Dajabon', 'DJ', 1),
(939, 60, 'Duarte', 'DU', 1),
(940, 60, 'Elias Pina', 'EL', 1),
(941, 60, 'El Seybo', 'SY', 1),
(942, 60, 'Espaillat', 'ET', 1),
(943, 60, 'Hato Mayor', 'HM', 1),
(944, 60, 'Independencia', 'IN', 1),
(945, 60, 'La Altagracia', 'AL', 1),
(946, 60, 'La Romana', 'RO', 1),
(947, 60, 'La Vega', 'VE', 1),
(948, 60, 'Maria Trinidad Sanchez', 'MT', 1),
(949, 60, 'Monsenor Nouel', 'MN', 1),
(950, 60, 'Monte Cristi', 'MC', 1),
(951, 60, 'Monte Plata', 'MP', 1),
(952, 60, 'Pedernales', 'PD', 1),
(953, 60, 'Peravia (Bani)', 'PR', 1),
(954, 60, 'Puerto Plata', 'PP', 1),
(955, 60, 'Salcedo', 'SL', 1),
(956, 60, 'Samana', 'SM', 1),
(957, 60, 'Sanchez Ramirez', 'SH', 1),
(958, 60, 'San Cristobal', 'SC', 1),
(959, 60, 'San Jose de Ocoa', 'JO', 1),
(960, 60, 'San Juan', 'SJ', 1),
(961, 60, 'San Pedro de Macoris', 'PM', 1),
(962, 60, 'Santiago', 'SA', 1),
(963, 60, 'Santiago Rodriguez', 'ST', 1),
(964, 60, 'Santo Domingo', 'SD', 1),
(965, 60, 'Valverde', 'VA', 1),
(966, 61, 'Aileu', 'AL', 1),
(967, 61, 'Ainaro', 'AN', 1),
(968, 61, 'Baucau', 'BA', 1),
(969, 61, 'Bobonaro', 'BO', 1),
(970, 61, 'Cova Lima', 'CO', 1),
(971, 61, 'Dili', 'DI', 1),
(972, 61, 'Ermera', 'ER', 1),
(973, 61, 'Lautem', 'LA', 1),
(974, 61, 'Liquica', 'LI', 1),
(975, 61, 'Manatuto', 'MT', 1),
(976, 61, 'Manufahi', 'MF', 1),
(977, 61, 'Oecussi', 'OE', 1),
(978, 61, 'Viqueque', 'VI', 1),
(979, 62, 'Azuay', 'AZU', 1),
(980, 62, 'Bolivar', 'BOL', 1),
(981, 62, 'Ca&ntilde;ar', 'CAN', 1),
(982, 62, 'Carchi', 'CAR', 1),
(983, 62, 'Chimborazo', 'CHI', 1),
(984, 62, 'Cotopaxi', 'COT', 1),
(985, 62, 'El Oro', 'EOR', 1),
(986, 62, 'Esmeraldas', 'ESM', 1),
(987, 62, 'Gal&aacute;pagos', 'GPS', 1),
(988, 62, 'Guayas', 'GUA', 1),
(989, 62, 'Imbabura', 'IMB', 1),
(990, 62, 'Loja', 'LOJ', 1),
(991, 62, 'Los Rios', 'LRO', 1),
(992, 62, 'Manab&iacute;', 'MAN', 1),
(993, 62, 'Morona Santiago', 'MSA', 1),
(994, 62, 'Napo', 'NAP', 1),
(995, 62, 'Orellana', 'ORE', 1),
(996, 62, 'Pastaza', 'PAS', 1),
(997, 62, 'Pichincha', 'PIC', 1),
(998, 62, 'Sucumb&iacute;os', 'SUC', 1),
(999, 62, 'Tungurahua', 'TUN', 1),
(1000, 62, 'Zamora Chinchipe', 'ZCH', 1),
(1001, 63, 'Ad Daqahliyah', 'DHY', 1),
(1002, 63, 'Al Bahr al Ahmar', 'BAM', 1),
(1003, 63, 'Al Buhayrah', 'BHY', 1),
(1004, 63, 'Al Fayyum', 'FYM', 1),
(1005, 63, 'Al Gharbiyah', 'GBY', 1),
(1006, 63, 'Al Iskandariyah', 'IDR', 1),
(1007, 63, 'Al Isma''iliyah', 'IML', 1),
(1008, 63, 'Al Jizah', 'JZH', 1),
(1009, 63, 'Al Minufiyah', 'MFY', 1),
(1010, 63, 'Al Minya', 'MNY', 1),
(1011, 63, 'Al Qahirah', 'QHR', 1),
(1012, 63, 'Al Qalyubiyah', 'QLY', 1),
(1013, 63, 'Al Wadi al Jadid', 'WJD', 1),
(1014, 63, 'Ash Sharqiyah', 'SHQ', 1),
(1015, 63, 'As Suways', 'SWY', 1),
(1016, 63, 'Aswan', 'ASW', 1),
(1017, 63, 'Asyut', 'ASY', 1),
(1018, 63, 'Bani Suwayf', 'BSW', 1),
(1019, 63, 'Bur Sa''id', 'BSD', 1),
(1020, 63, 'Dumyat', 'DMY', 1),
(1021, 63, 'Janub Sina''', 'JNS', 1),
(1022, 63, 'Kafr ash Shaykh', 'KSH', 1),
(1023, 63, 'Matruh', 'MAT', 1),
(1024, 63, 'Qina', 'QIN', 1),
(1025, 63, 'Shamal Sina''', 'SHS', 1),
(1026, 63, 'Suhaj', 'SUH', 1),
(1027, 64, 'Ahuachapan', 'AH', 1),
(1028, 64, 'Cabanas', 'CA', 1),
(1029, 64, 'Chalatenango', 'CH', 1),
(1030, 64, 'Cuscatlan', 'CU', 1),
(1031, 64, 'La Libertad', 'LB', 1),
(1032, 64, 'La Paz', 'PZ', 1),
(1033, 64, 'La Union', 'UN', 1),
(1034, 64, 'Morazan', 'MO', 1),
(1035, 64, 'San Miguel', 'SM', 1),
(1036, 64, 'San Salvador', 'SS', 1),
(1037, 64, 'San Vicente', 'SV', 1),
(1038, 64, 'Santa Ana', 'SA', 1),
(1039, 64, 'Sonsonate', 'SO', 1),
(1040, 64, 'Usulutan', 'US', 1),
(1041, 65, 'Provincia Annobon', 'AN', 1),
(1042, 65, 'Provincia Bioko Norte', 'BN', 1),
(1043, 65, 'Provincia Bioko Sur', 'BS', 1),
(1044, 65, 'Provincia Centro Sur', 'CS', 1),
(1045, 65, 'Provincia Kie-Ntem', 'KN', 1),
(1046, 65, 'Provincia Litoral', 'LI', 1),
(1047, 65, 'Provincia Wele-Nzas', 'WN', 1),
(1048, 66, 'Central (Maekel)', 'MA', 1),
(1049, 66, 'Anseba (Keren)', 'KE', 1),
(1050, 66, 'Southern Red Sea (Debub-Keih-Bahri)', 'DK', 1),
(1051, 66, 'Northern Red Sea (Semien-Keih-Bahri)', 'SK', 1),
(1052, 66, 'Southern (Debub)', 'DE', 1),
(1053, 66, 'Gash-Barka (Barentu)', 'BR', 1),
(1054, 67, 'Harjumaa (Tallinn)', 'HA', 1),
(1055, 67, 'Hiiumaa (Kardla)', 'HI', 1),
(1056, 67, 'Ida-Virumaa (Johvi)', 'IV', 1),
(1057, 67, 'Jarvamaa (Paide)', 'JA', 1),
(1058, 67, 'Jogevamaa (Jogeva)', 'JO', 1),
(1059, 67, 'Laane-Virumaa (Rakvere)', 'LV', 1),
(1060, 67, 'Laanemaa (Haapsalu)', 'LA', 1),
(1061, 67, 'Parnumaa (Parnu)', 'PA', 1),
(1062, 67, 'Polvamaa (Polva)', 'PO', 1),
(1063, 67, 'Raplamaa (Rapla)', 'RA', 1),
(1064, 67, 'Saaremaa (Kuessaare)', 'SA', 1),
(1065, 67, 'Tartumaa (Tartu)', 'TA', 1),
(1066, 67, 'Valgamaa (Valga)', 'VA', 1),
(1067, 67, 'Viljandimaa (Viljandi)', 'VI', 1),
(1068, 67, 'Vorumaa (Voru)', 'VO', 1),
(1069, 68, 'Afar', 'AF', 1),
(1070, 68, 'Amhara', 'AH', 1),
(1071, 68, 'Benishangul-Gumaz', 'BG', 1),
(1072, 68, 'Gambela', 'GB', 1),
(1073, 68, 'Hariai', 'HR', 1),
(1074, 68, 'Oromia', 'OR', 1),
(1075, 68, 'Somali', 'SM', 1),
(1076, 68, 'Southern Nations - Nationalities and Peoples Region', 'SN', 1),
(1077, 68, 'Tigray', 'TG', 1),
(1078, 68, 'Addis Ababa', 'AA', 1),
(1079, 68, 'Dire Dawa', 'DD', 1),
(1080, 71, 'Central Division', 'C', 1),
(1081, 71, 'Northern Division', 'N', 1),
(1082, 71, 'Eastern Division', 'E', 1),
(1083, 71, 'Western Division', 'W', 1),
(1084, 71, 'Rotuma', 'R', 1),
(1085, 72, 'Ahvenanmaan Laani', 'AL', 1),
(1086, 72, 'Etela-Suomen Laani', 'ES', 1),
(1087, 72, 'Ita-Suomen Laani', 'IS', 1),
(1088, 72, 'Lansi-Suomen Laani', 'LS', 1),
(1089, 72, 'Lapin Lanani', 'LA', 1),
(1090, 72, 'Oulun Laani', 'OU', 1),
(1091, 73, 'Alsace', 'AL', 1),
(1092, 73, 'Aquitaine', 'AQ', 1),
(1093, 73, 'Auvergne', 'AU', 1),
(1094, 73, 'Brittany', 'BR', 1),
(1095, 73, 'Burgundy', 'BU', 1),
(1096, 73, 'Center Loire Valley', 'CE', 1),
(1097, 73, 'Champagne', 'CH', 1),
(1098, 73, 'Corse', 'CO', 1),
(1099, 73, 'France Comte', 'FR', 1),
(1100, 73, 'Languedoc Roussillon', 'LA', 1),
(1101, 73, 'Limousin', 'LI', 1),
(1102, 73, 'Lorraine', 'LO', 1),
(1103, 73, 'Midi Pyrenees', 'MI', 1),
(1104, 73, 'Nord Pas de Calais', 'NO', 1),
(1105, 73, 'Normandy', 'NR', 1),
(1106, 73, 'Paris / Ill de France', 'PA', 1),
(1107, 73, 'Picardie', 'PI', 1),
(1108, 73, 'Poitou Charente', 'PO', 1),
(1109, 73, 'Provence', 'PR', 1),
(1110, 73, 'Rhone Alps', 'RH', 1),
(1111, 73, 'Riviera', 'RI', 1),
(1112, 73, 'Western Loire Valley', 'WE', 1),
(1113, 74, 'Etranger', 'Et', 1),
(1114, 74, 'Ain', '01', 1),
(1115, 74, 'Aisne', '02', 1),
(1116, 74, 'Allier', '03', 1),
(1117, 74, 'Alpes de Haute Provence', '04', 1),
(1118, 74, 'Hautes-Alpes', '05', 1),
(1119, 74, 'Alpes Maritimes', '06', 1),
(1120, 74, 'Ard&egrave;che', '07', 1),
(1121, 74, 'Ardennes', '08', 1),
(1122, 74, 'Ari&egrave;ge', '09', 1),
(1123, 74, 'Aube', '10', 1),
(1124, 74, 'Aude', '11', 1),
(1125, 74, 'Aveyron', '12', 1),
(1126, 74, 'Bouches du Rh&ocirc;ne', '13', 1),
(1127, 74, 'Calvados', '14', 1),
(1128, 74, 'Cantal', '15', 1),
(1129, 74, 'Charente', '16', 1),
(1130, 74, 'Charente Maritime', '17', 1),
(1131, 74, 'Cher', '18', 1),
(1132, 74, 'Corr&egrave;ze', '19', 1),
(1133, 74, 'Corse du Sud', '2A', 1),
(1134, 74, 'Haute Corse', '2B', 1),
(1135, 74, 'C&ocirc;te d&#039;or', '21', 1),
(1136, 74, 'C&ocirc;tes d&#039;Armor', '22', 1),
(1137, 74, 'Creuse', '23', 1),
(1138, 74, 'Dordogne', '24', 1),
(1139, 74, 'Doubs', '25', 1),
(1140, 74, 'Dr&ocirc;me', '26', 1),
(1141, 74, 'Eure', '27', 1),
(1142, 74, 'Eure et Loir', '28', 1),
(1143, 74, 'Finist&egrave;re', '29', 1),
(1144, 74, 'Gard', '30', 1),
(1145, 74, 'Haute Garonne', '31', 1),
(1146, 74, 'Gers', '32', 1),
(1147, 74, 'Gironde', '33', 1),
(1148, 74, 'H&eacute;rault', '34', 1),
(1149, 74, 'Ille et Vilaine', '35', 1),
(1150, 74, 'Indre', '36', 1),
(1151, 74, 'Indre et Loire', '37', 1),
(1152, 74, 'Is&eacute;re', '38', 1),
(1153, 74, 'Jura', '39', 1),
(1154, 74, 'Landes', '40', 1),
(1155, 74, 'Loir et Cher', '41', 1),
(1156, 74, 'Loire', '42', 1),
(1157, 74, 'Haute Loire', '43', 1),
(1158, 74, 'Loire Atlantique', '44', 1),
(1159, 74, 'Loiret', '45', 1),
(1160, 74, 'Lot', '46', 1),
(1161, 74, 'Lot et Garonne', '47', 1),
(1162, 74, 'Loz&egrave;re', '48', 1),
(1163, 74, 'Maine et Loire', '49', 1),
(1164, 74, 'Manche', '50', 1),
(1165, 74, 'Marne', '51', 1),
(1166, 74, 'Haute Marne', '52', 1),
(1167, 74, 'Mayenne', '53', 1),
(1168, 74, 'Meurthe et Moselle', '54', 1),
(1169, 74, 'Meuse', '55', 1),
(1170, 74, 'Morbihan', '56', 1),
(1171, 74, 'Moselle', '57', 1),
(1172, 74, 'Ni&egrave;vre', '58', 1),
(1173, 74, 'Nord', '59', 1),
(1174, 74, 'Oise', '60', 1),
(1175, 74, 'Orne', '61', 1),
(1176, 74, 'Pas de Calais', '62', 1),
(1177, 74, 'Puy de D&ocirc;me', '63', 1),
(1178, 74, 'Pyr&eacute;n&eacute;es Atlantiques', '64', 1),
(1179, 74, 'Hautes Pyr&eacute;n&eacute;es', '65', 1),
(1180, 74, 'Pyr&eacute;n&eacute;es Orientales', '66', 1),
(1181, 74, 'Bas Rhin', '67', 1),
(1182, 74, 'Haut Rhin', '68', 1),
(1183, 74, 'Rh&ocirc;ne', '69', 1),
(1184, 74, 'Haute Sa&ocirc;ne', '70', 1),
(1185, 74, 'Sa&ocirc;ne et Loire', '71', 1),
(1186, 74, 'Sarthe', '72', 1),
(1187, 74, 'Savoie', '73', 1),
(1188, 74, 'Haute Savoie', '74', 1),
(1189, 74, 'Paris', '75', 1),
(1190, 74, 'Seine Maritime', '76', 1),
(1191, 74, 'Seine et Marne', '77', 1),
(1192, 74, 'Yvelines', '78', 1),
(1193, 74, 'Deux S&egrave;vres', '79', 1),
(1194, 74, 'Somme', '80', 1),
(1195, 74, 'Tarn', '81', 1),
(1196, 74, 'Tarn et Garonne', '82', 1),
(1197, 74, 'Var', '83', 1),
(1198, 74, 'Vaucluse', '84', 1),
(1199, 74, 'Vend&eacute;e', '85', 1),
(1200, 74, 'Vienne', '86', 1),
(1201, 74, 'Haute Vienne', '87', 1),
(1202, 74, 'Vosges', '88', 1),
(1203, 74, 'Yonne', '89', 1),
(1204, 74, 'Territoire de Belfort', '90', 1),
(1205, 74, 'Essonne', '91', 1),
(1206, 74, 'Hauts de Seine', '92', 1),
(1207, 74, 'Seine St-Denis', '93', 1),
(1208, 74, 'Val de Marne', '94', 1),
(1209, 74, 'Val d''Oise', '95', 1),
(1210, 76, 'Archipel des Marquises', 'M', 1),
(1211, 76, 'Archipel des Tuamotu', 'T', 1),
(1212, 76, 'Archipel des Tubuai', 'I', 1),
(1213, 76, 'Iles du Vent', 'V', 1),
(1214, 76, 'Iles Sous-le-Vent', 'S', 1),
(1215, 77, 'Iles Crozet', 'C', 1),
(1216, 77, 'Iles Kerguelen', 'K', 1),
(1217, 77, 'Ile Amsterdam', 'A', 1),
(1218, 77, 'Ile Saint-Paul', 'P', 1),
(1219, 77, 'Adelie Land', 'D', 1),
(1220, 78, 'Estuaire', 'ES', 1),
(1221, 78, 'Haut-Ogooue', 'HO', 1),
(1222, 78, 'Moyen-Ogooue', 'MO', 1),
(1223, 78, 'Ngounie', 'NG', 1),
(1224, 78, 'Nyanga', 'NY', 1),
(1225, 78, 'Ogooue-Ivindo', 'OI', 1),
(1226, 78, 'Ogooue-Lolo', 'OL', 1),
(1227, 78, 'Ogooue-Maritime', 'OM', 1),
(1228, 78, 'Woleu-Ntem', 'WN', 1),
(1229, 79, 'Banjul', 'BJ', 1),
(1230, 79, 'Basse', 'BS', 1),
(1231, 79, 'Brikama', 'BR', 1),
(1232, 79, 'Janjangbure', 'JA', 1),
(1233, 79, 'Kanifeng', 'KA', 1),
(1234, 79, 'Kerewan', 'KE', 1),
(1235, 79, 'Kuntaur', 'KU', 1),
(1236, 79, 'Mansakonko', 'MA', 1),
(1237, 79, 'Lower River', 'LR', 1),
(1238, 79, 'Central River', 'CR', 1),
(1239, 79, 'North Bank', 'NB', 1),
(1240, 79, 'Upper River', 'UR', 1),
(1241, 79, 'Western', 'WE', 1),
(1242, 80, 'Abkhazia', 'AB', 1),
(1243, 80, 'Ajaria', 'AJ', 1),
(1244, 80, 'Tbilisi', 'TB', 1),
(1245, 80, 'Guria', 'GU', 1),
(1246, 80, 'Imereti', 'IM', 1),
(1247, 80, 'Kakheti', 'KA', 1),
(1248, 80, 'Kvemo Kartli', 'KK', 1),
(1249, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(1250, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(1251, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(1252, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(1253, 80, 'Shida Kartli', 'SK', 1),
(1254, 81, 'Baden-W&uuml;rttemberg', 'BAW', 1),
(1255, 81, 'Bayern', 'BAY', 1),
(1256, 81, 'Berlin', 'BER', 1),
(1257, 81, 'Brandenburg', 'BRG', 1),
(1258, 81, 'Bremen', 'BRE', 1),
(1259, 81, 'Hamburg', 'HAM', 1),
(1260, 81, 'Hessen', 'HES', 1),
(1261, 81, 'Mecklenburg-Vorpommern', 'MEC', 1),
(1262, 81, 'Niedersachsen', 'NDS', 1),
(1263, 81, 'Nordrhein-Westfalen', 'NRW', 1),
(1264, 81, 'Rheinland-Pfalz', 'RHE', 1),
(1265, 81, 'Saarland', 'SAR', 1),
(1266, 81, 'Sachsen', 'SAS', 1),
(1267, 81, 'Sachsen-Anhalt', 'SAC', 1),
(1268, 81, 'Schleswig-Holstein', 'SCN', 1),
(1269, 81, 'Th&uuml;ringen', 'THE', 1),
(1270, 82, 'Ashanti Region', 'AS', 1),
(1271, 82, 'Brong-Ahafo Region', 'BA', 1),
(1272, 82, 'Central Region', 'CE', 1),
(1273, 82, 'Eastern Region', 'EA', 1),
(1274, 82, 'Greater Accra Region', 'GA', 1),
(1275, 82, 'Northern Region', 'NO', 1),
(1276, 82, 'Upper East Region', 'UE', 1),
(1277, 82, 'Upper West Region', 'UW', 1),
(1278, 82, 'Volta Region', 'VO', 1),
(1279, 82, 'Western Region', 'WE', 1),
(1280, 84, 'Attica', 'AT', 1),
(1281, 84, 'Central Greece', 'CN', 1),
(1282, 84, 'Central Macedonia', 'CM', 1),
(1283, 84, 'Crete', 'CR', 1),
(1284, 84, 'East Macedonia and Thrace', 'EM', 1),
(1285, 84, 'Epirus', 'EP', 1),
(1286, 84, 'Ionian Islands', 'II', 1),
(1287, 84, 'North Aegean', 'NA', 1),
(1288, 84, 'Peloponnesos', 'PP', 1),
(1289, 84, 'South Aegean', 'SA', 1),
(1290, 84, 'Thessaly', 'TH', 1),
(1291, 84, 'West Greece', 'WG', 1),
(1292, 84, 'West Macedonia', 'WM', 1),
(1293, 85, 'Avannaa', 'A', 1),
(1294, 85, 'Tunu', 'T', 1),
(1295, 85, 'Kitaa', 'K', 1),
(1296, 86, 'Saint Andrew', 'A', 1),
(1297, 86, 'Saint David', 'D', 1),
(1298, 86, 'Saint George', 'G', 1),
(1299, 86, 'Saint John', 'J', 1),
(1300, 86, 'Saint Mark', 'M', 1),
(1301, 86, 'Saint Patrick', 'P', 1),
(1302, 86, 'Carriacou', 'C', 1),
(1303, 86, 'Petit Martinique', 'Q', 1),
(1304, 89, 'Alta Verapaz', 'AV', 1),
(1305, 89, 'Baja Verapaz', 'BV', 1),
(1306, 89, 'Chimaltenango', 'CM', 1),
(1307, 89, 'Chiquimula', 'CQ', 1),
(1308, 89, 'El Peten', 'PE', 1),
(1309, 89, 'El Progreso', 'PR', 1),
(1310, 89, 'El Quiche', 'QC', 1),
(1311, 89, 'Escuintla', 'ES', 1),
(1312, 89, 'Guatemala', 'GU', 1),
(1313, 89, 'Huehuetenango', 'HU', 1),
(1314, 89, 'Izabal', 'IZ', 1),
(1315, 89, 'Jalapa', 'JA', 1),
(1316, 89, 'Jutiapa', 'JU', 1),
(1317, 89, 'Quetzaltenango', 'QZ', 1),
(1318, 89, 'Retalhuleu', 'RE', 1),
(1319, 89, 'Sacatepequez', 'ST', 1),
(1320, 89, 'San Marcos', 'SM', 1),
(1321, 89, 'Santa Rosa', 'SR', 1),
(1322, 89, 'Solola', 'SO', 1),
(1323, 89, 'Suchitepequez', 'SU', 1),
(1324, 89, 'Totonicapan', 'TO', 1),
(1325, 89, 'Zacapa', 'ZA', 1),
(1326, 90, 'Conakry', 'CNK', 1),
(1327, 90, 'Beyla', 'BYL', 1),
(1328, 90, 'Boffa', 'BFA', 1),
(1329, 90, 'Boke', 'BOK', 1),
(1330, 90, 'Coyah', 'COY', 1),
(1331, 90, 'Dabola', 'DBL', 1),
(1332, 90, 'Dalaba', 'DLB', 1),
(1333, 90, 'Dinguiraye', 'DGR', 1),
(1334, 90, 'Dubreka', 'DBR', 1),
(1335, 90, 'Faranah', 'FRN', 1),
(1336, 90, 'Forecariah', 'FRC', 1),
(1337, 90, 'Fria', 'FRI', 1),
(1338, 90, 'Gaoual', 'GAO', 1),
(1339, 90, 'Gueckedou', 'GCD', 1),
(1340, 90, 'Kankan', 'KNK', 1),
(1341, 90, 'Kerouane', 'KRN', 1),
(1342, 90, 'Kindia', 'KND', 1),
(1343, 90, 'Kissidougou', 'KSD', 1),
(1344, 90, 'Koubia', 'KBA', 1),
(1345, 90, 'Koundara', 'KDA', 1),
(1346, 90, 'Kouroussa', 'KRA', 1),
(1347, 90, 'Labe', 'LAB', 1),
(1348, 90, 'Lelouma', 'LLM', 1),
(1349, 90, 'Lola', 'LOL', 1),
(1350, 90, 'Macenta', 'MCT', 1),
(1351, 90, 'Mali', 'MAL', 1),
(1352, 90, 'Mamou', 'MAM', 1),
(1353, 90, 'Mandiana', 'MAN', 1),
(1354, 90, 'Nzerekore', 'NZR', 1),
(1355, 90, 'Pita', 'PIT', 1),
(1356, 90, 'Siguiri', 'SIG', 1),
(1357, 90, 'Telimele', 'TLM', 1),
(1358, 90, 'Tougue', 'TOG', 1),
(1359, 90, 'Yomou', 'YOM', 1),
(1360, 91, 'Bafata Region', 'BF', 1),
(1361, 91, 'Biombo Region', 'BB', 1),
(1362, 91, 'Bissau Region', 'BS', 1),
(1363, 91, 'Bolama Region', 'BL', 1),
(1364, 91, 'Cacheu Region', 'CA', 1),
(1365, 91, 'Gabu Region', 'GA', 1),
(1366, 91, 'Oio Region', 'OI', 1),
(1367, 91, 'Quinara Region', 'QU', 1),
(1368, 91, 'Tombali Region', 'TO', 1),
(1369, 92, 'Barima-Waini', 'BW', 1),
(1370, 92, 'Cuyuni-Mazaruni', 'CM', 1),
(1371, 92, 'Demerara-Mahaica', 'DM', 1),
(1372, 92, 'East Berbice-Corentyne', 'EC', 1),
(1373, 92, 'Essequibo Islands-West Demerara', 'EW', 1),
(1374, 92, 'Mahaica-Berbice', 'MB', 1),
(1375, 92, 'Pomeroon-Supenaam', 'PM', 1),
(1376, 92, 'Potaro-Siparuni', 'PI', 1),
(1377, 92, 'Upper Demerara-Berbice', 'UD', 1),
(1378, 92, 'Upper Takutu-Upper Essequibo', 'UT', 1),
(1379, 93, 'Artibonite', 'AR', 1),
(1380, 93, 'Centre', 'CE', 1),
(1381, 93, 'Grand''Anse', 'GA', 1),
(1382, 93, 'Nord', 'ND', 1),
(1383, 93, 'Nord-Est', 'NE', 1),
(1384, 93, 'Nord-Ouest', 'NO', 1),
(1385, 93, 'Ouest', 'OU', 1),
(1386, 93, 'Sud', 'SD', 1),
(1387, 93, 'Sud-Est', 'SE', 1),
(1388, 94, 'Flat Island', 'F', 1),
(1389, 94, 'McDonald Island', 'M', 1),
(1390, 94, 'Shag Island', 'S', 1),
(1391, 94, 'Heard Island', 'H', 1),
(1392, 95, 'Atlantida', 'AT', 1),
(1393, 95, 'Choluteca', 'CH', 1),
(1394, 95, 'Colon', 'CL', 1),
(1395, 95, 'Comayagua', 'CM', 1),
(1396, 95, 'Copan', 'CP', 1),
(1397, 95, 'Cortes', 'CR', 1),
(1398, 95, 'El Paraiso', 'PA', 1),
(1399, 95, 'Francisco Morazan', 'FM', 1),
(1400, 95, 'Gracias a Dios', 'GD', 1),
(1401, 95, 'Intibuca', 'IN', 1),
(1402, 95, 'Islas de la Bahia (Bay Islands)', 'IB', 1),
(1403, 95, 'La Paz', 'PZ', 1),
(1404, 95, 'Lempira', 'LE', 1),
(1405, 95, 'Ocotepeque', 'OC', 1),
(1406, 95, 'Olancho', 'OL', 1),
(1407, 95, 'Santa Barbara', 'SB', 1),
(1408, 95, 'Valle', 'VA', 1),
(1409, 95, 'Yoro', 'YO', 1),
(1410, 96, 'Central and Western Hong Kong Island', 'HCW', 1),
(1411, 96, 'Eastern Hong Kong Island', 'HEA', 1),
(1412, 96, 'Southern Hong Kong Island', 'HSO', 1),
(1413, 96, 'Wan Chai Hong Kong Island', 'HWC', 1),
(1414, 96, 'Kowloon City Kowloon', 'KKC', 1),
(1415, 96, 'Kwun Tong Kowloon', 'KKT', 1),
(1416, 96, 'Sham Shui Po Kowloon', 'KSS', 1),
(1417, 96, 'Wong Tai Sin Kowloon', 'KWT', 1),
(1418, 96, 'Yau Tsim Mong Kowloon', 'KYT', 1),
(1419, 96, 'Islands New Territories', 'NIS', 1),
(1420, 96, 'Kwai Tsing New Territories', 'NKT', 1),
(1421, 96, 'North New Territories', 'NNO', 1),
(1422, 96, 'Sai Kung New Territories', 'NSK', 1),
(1423, 96, 'Sha Tin New Territories', 'NST', 1),
(1424, 96, 'Tai Po New Territories', 'NTP', 1),
(1425, 96, 'Tsuen Wan New Territories', 'NTW', 1),
(1426, 96, 'Tuen Mun New Territories', 'NTM', 1),
(1427, 96, 'Yuen Long New Territories', 'NYL', 1),
(1428, 97, 'Bacs-Kiskun', 'BK', 1),
(1429, 97, 'Baranya', 'BA', 1),
(1430, 97, 'Bekes', 'BE', 1),
(1431, 97, 'Bekescsaba', 'BS', 1),
(1432, 97, 'Borsod-Abauj-Zemplen', 'BZ', 1),
(1433, 97, 'Budapest', 'BU', 1),
(1434, 97, 'Csongrad', 'CS', 1),
(1435, 97, 'Debrecen', 'DE', 1),
(1436, 97, 'Dunaujvaros', 'DU', 1),
(1437, 97, 'Eger', 'EG', 1),
(1438, 97, 'Fejer', 'FE', 1),
(1439, 97, 'Gyor', 'GY', 1),
(1440, 97, 'Gyor-Moson-Sopron', 'GM', 1),
(1441, 97, 'Hajdu-Bihar', 'HB', 1),
(1442, 97, 'Heves', 'HE', 1),
(1443, 97, 'Hodmezovasarhely', 'HO', 1),
(1444, 97, 'Jasz-Nagykun-Szolnok', 'JN', 1),
(1445, 97, 'Kaposvar', 'KA', 1),
(1446, 97, 'Kecskemet', 'KE', 1),
(1447, 97, 'Komarom-Esztergom', 'KO', 1),
(1448, 97, 'Miskolc', 'MI', 1),
(1449, 97, 'Nagykanizsa', 'NA', 1),
(1450, 97, 'Nograd', 'NO', 1),
(1451, 97, 'Nyiregyhaza', 'NY', 1),
(1452, 97, 'Pecs', 'PE', 1),
(1453, 97, 'Pest', 'PS', 1),
(1454, 97, 'Somogy', 'SO', 1),
(1455, 97, 'Sopron', 'SP', 1),
(1456, 97, 'Szabolcs-Szatmar-Bereg', 'SS', 1),
(1457, 97, 'Szeged', 'SZ', 1),
(1458, 97, 'Szekesfehervar', 'SE', 1),
(1459, 97, 'Szolnok', 'SL', 1),
(1460, 97, 'Szombathely', 'SM', 1),
(1461, 97, 'Tatabanya', 'TA', 1),
(1462, 97, 'Tolna', 'TO', 1),
(1463, 97, 'Vas', 'VA', 1),
(1464, 97, 'Veszprem', 'VE', 1),
(1465, 97, 'Zala', 'ZA', 1),
(1466, 97, 'Zalaegerszeg', 'ZZ', 1),
(1467, 98, 'Austurland', 'AL', 1),
(1468, 98, 'Hofuoborgarsvaeoi', 'HF', 1),
(1469, 98, 'Norourland eystra', 'NE', 1),
(1470, 98, 'Norourland vestra', 'NV', 1),
(1471, 98, 'Suourland', 'SL', 1),
(1472, 98, 'Suournes', 'SN', 1),
(1473, 98, 'Vestfiroir', 'VF', 1),
(1474, 98, 'Vesturland', 'VL', 1),
(1475, 99, 'Andaman and Nicobar Islands', 'AN', 1),
(1476, 99, 'Andhra Pradesh', 'AP', 1),
(1477, 99, 'Arunachal Pradesh', 'AR', 1),
(1478, 99, 'Assam', 'AS', 1),
(1479, 99, 'Bihar', 'BI', 1),
(1480, 99, 'Chandigarh', 'CH', 1),
(1481, 99, 'Dadra and Nagar Haveli', 'DA', 1),
(1482, 99, 'Daman and Diu', 'DM', 1),
(1483, 99, 'Delhi', 'DE', 1),
(1484, 99, 'Goa', 'GO', 1),
(1485, 99, 'Gujarat', 'GU', 1),
(1486, 99, 'Haryana', 'HA', 1),
(1487, 99, 'Himachal Pradesh', 'HP', 1),
(1488, 99, 'Jammu and Kashmir', 'JA', 1),
(1489, 99, 'Karnataka', 'KA', 1),
(1490, 99, 'Kerala', 'KE', 1),
(1491, 99, 'Lakshadweep Islands', 'LI', 1),
(1492, 99, 'Madhya Pradesh', 'MP', 1),
(1493, 99, 'Maharashtra', 'MA', 1),
(1494, 99, 'Manipur', 'MN', 1),
(1495, 99, 'Meghalaya', 'ME', 1),
(1496, 99, 'Mizoram', 'MI', 1),
(1497, 99, 'Nagaland', 'NA', 1),
(1498, 99, 'Orissa', 'OR', 1),
(1499, 99, 'Pondicherry', 'PO', 1),
(1500, 99, 'Punjab', 'PU', 1),
(1501, 99, 'Rajasthan', 'RA', 1),
(1502, 99, 'Sikkim', 'SI', 1),
(1503, 99, 'Tamil Nadu', 'TN', 1),
(1504, 99, 'Tripura', 'TR', 1),
(1505, 99, 'Uttar Pradesh', 'UP', 1),
(1506, 99, 'West Bengal', 'WB', 1),
(1507, 100, 'Aceh', 'AC', 1),
(1508, 100, 'Bali', 'BA', 1),
(1509, 100, 'Banten', 'BT', 1),
(1510, 100, 'Bengkulu', 'BE', 1),
(1511, 100, 'BoDeTaBek', 'BD', 1),
(1512, 100, 'Gorontalo', 'GO', 1),
(1513, 100, 'Jakarta Raya', 'JK', 1),
(1514, 100, 'Jambi', 'JA', 1),
(1515, 100, 'Jawa Barat', 'JB', 1),
(1516, 100, 'Jawa Tengah', 'JT', 1),
(1517, 100, 'Jawa Timur', 'JI', 1),
(1518, 100, 'Kalimantan Barat', 'KB', 1),
(1519, 100, 'Kalimantan Selatan', 'KS', 1),
(1520, 100, 'Kalimantan Tengah', 'KT', 1),
(1521, 100, 'Kalimantan Timur', 'KI', 1),
(1522, 100, 'Kepulauan Bangka Belitung', 'BB', 1),
(1523, 100, 'Lampung', 'LA', 1),
(1524, 100, 'Maluku', 'MA', 1),
(1525, 100, 'Maluku Utara', 'MU', 1),
(1526, 100, 'Nusa Tenggara Barat', 'NB', 1),
(1527, 100, 'Nusa Tenggara Timur', 'NT', 1),
(1528, 100, 'Papua', 'PA', 1),
(1529, 100, 'Riau', 'RI', 1),
(1530, 100, 'Sulawesi Selatan', 'SN', 1),
(1531, 100, 'Sulawesi Tengah', 'ST', 1),
(1532, 100, 'Sulawesi Tenggara', 'SG', 1),
(1533, 100, 'Sulawesi Utara', 'SA', 1),
(1534, 100, 'Sumatera Barat', 'SB', 1),
(1535, 100, 'Sumatera Selatan', 'SS', 1),
(1536, 100, 'Sumatera Utara', 'SU', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1537, 100, 'Yogyakarta', 'YO', 1),
(1538, 101, 'Tehran', 'TEH', 1),
(1539, 101, 'Qom', 'QOM', 1),
(1540, 101, 'Markazi', 'MKZ', 1),
(1541, 101, 'Qazvin', 'QAZ', 1),
(1542, 101, 'Gilan', 'GIL', 1),
(1543, 101, 'Ardabil', 'ARD', 1),
(1544, 101, 'Zanjan', 'ZAN', 1),
(1545, 101, 'East Azarbaijan', 'EAZ', 1),
(1546, 101, 'West Azarbaijan', 'WEZ', 1),
(1547, 101, 'Kurdistan', 'KRD', 1),
(1548, 101, 'Hamadan', 'HMD', 1),
(1549, 101, 'Kermanshah', 'KRM', 1),
(1550, 101, 'Ilam', 'ILM', 1),
(1551, 101, 'Lorestan', 'LRS', 1),
(1552, 101, 'Khuzestan', 'KZT', 1),
(1553, 101, 'Chahar Mahaal and Bakhtiari', 'CMB', 1),
(1554, 101, 'Kohkiluyeh and Buyer Ahmad', 'KBA', 1),
(1555, 101, 'Bushehr', 'BSH', 1),
(1556, 101, 'Fars', 'FAR', 1),
(1557, 101, 'Hormozgan', 'HRM', 1),
(1558, 101, 'Sistan and Baluchistan', 'SBL', 1),
(1559, 101, 'Kerman', 'KRB', 1),
(1560, 101, 'Yazd', 'YZD', 1),
(1561, 101, 'Esfahan', 'EFH', 1),
(1562, 101, 'Semnan', 'SMN', 1),
(1563, 101, 'Mazandaran', 'MZD', 1),
(1564, 101, 'Golestan', 'GLS', 1),
(1565, 101, 'North Khorasan', 'NKH', 1),
(1566, 101, 'Razavi Khorasan', 'RKH', 1),
(1567, 101, 'South Khorasan', 'SKH', 1),
(1568, 102, 'Baghdad', 'BD', 1),
(1569, 102, 'Salah ad Din', 'SD', 1),
(1570, 102, 'Diyala', 'DY', 1),
(1571, 102, 'Wasit', 'WS', 1),
(1572, 102, 'Maysan', 'MY', 1),
(1573, 102, 'Al Basrah', 'BA', 1),
(1574, 102, 'Dhi Qar', 'DQ', 1),
(1575, 102, 'Al Muthanna', 'MU', 1),
(1576, 102, 'Al Qadisyah', 'QA', 1),
(1577, 102, 'Babil', 'BB', 1),
(1578, 102, 'Al Karbala', 'KB', 1),
(1579, 102, 'An Najaf', 'NJ', 1),
(1580, 102, 'Al Anbar', 'AB', 1),
(1581, 102, 'Ninawa', 'NN', 1),
(1582, 102, 'Dahuk', 'DH', 1),
(1583, 102, 'Arbil', 'AL', 1),
(1584, 102, 'At Ta''mim', 'TM', 1),
(1585, 102, 'As Sulaymaniyah', 'SL', 1),
(1586, 103, 'Carlow', 'CA', 1),
(1587, 103, 'Cavan', 'CV', 1),
(1588, 103, 'Clare', 'CL', 1),
(1589, 103, 'Cork', 'CO', 1),
(1590, 103, 'Donegal', 'DO', 1),
(1591, 103, 'Dublin', 'DU', 1),
(1592, 103, 'Galway', 'GA', 1),
(1593, 103, 'Kerry', 'KE', 1),
(1594, 103, 'Kildare', 'KI', 1),
(1595, 103, 'Kilkenny', 'KL', 1),
(1596, 103, 'Laois', 'LA', 1),
(1597, 103, 'Leitrim', 'LE', 1),
(1598, 103, 'Limerick', 'LI', 1),
(1599, 103, 'Longford', 'LO', 1),
(1600, 103, 'Louth', 'LU', 1),
(1601, 103, 'Mayo', 'MA', 1),
(1602, 103, 'Meath', 'ME', 1),
(1603, 103, 'Monaghan', 'MO', 1),
(1604, 103, 'Offaly', 'OF', 1),
(1605, 103, 'Roscommon', 'RO', 1),
(1606, 103, 'Sligo', 'SL', 1),
(1607, 103, 'Tipperary', 'TI', 1),
(1608, 103, 'Waterford', 'WA', 1),
(1609, 103, 'Westmeath', 'WE', 1),
(1610, 103, 'Wexford', 'WX', 1),
(1611, 103, 'Wicklow', 'WI', 1),
(1612, 104, 'Be''er Sheva', 'BS', 1),
(1613, 104, 'Bika''at Hayarden', 'BH', 1),
(1614, 104, 'Eilat and Arava', 'EA', 1),
(1615, 104, 'Galil', 'GA', 1),
(1616, 104, 'Haifa', 'HA', 1),
(1617, 104, 'Jehuda Mountains', 'JM', 1),
(1618, 104, 'Jerusalem', 'JE', 1),
(1619, 104, 'Negev', 'NE', 1),
(1620, 104, 'Semaria', 'SE', 1),
(1621, 104, 'Sharon', 'SH', 1),
(1622, 104, 'Tel Aviv (Gosh Dan)', 'TA', 1),
(3860, 105, 'Caltanissetta', 'CL', 1),
(3842, 105, 'Agrigento', 'AG', 1),
(3843, 105, 'Alessandria', 'AL', 1),
(3844, 105, 'Ancona', 'AN', 1),
(3845, 105, 'Aosta', 'AO', 1),
(3846, 105, 'Arezzo', 'AR', 1),
(3847, 105, 'Ascoli Piceno', 'AP', 1),
(3848, 105, 'Asti', 'AT', 1),
(3849, 105, 'Avellino', 'AV', 1),
(3850, 105, 'Bari', 'BA', 1),
(3851, 105, 'Belluno', 'BL', 1),
(3852, 105, 'Benevento', 'BN', 1),
(3853, 105, 'Bergamo', 'BG', 1),
(3854, 105, 'Biella', 'BI', 1),
(3855, 105, 'Bologna', 'BO', 1),
(3856, 105, 'Bolzano', 'BZ', 1),
(3857, 105, 'Brescia', 'BS', 1),
(3858, 105, 'Brindisi', 'BR', 1),
(3859, 105, 'Cagliari', 'CA', 1),
(1643, 106, 'Clarendon Parish', 'CLA', 1),
(1644, 106, 'Hanover Parish', 'HAN', 1),
(1645, 106, 'Kingston Parish', 'KIN', 1),
(1646, 106, 'Manchester Parish', 'MAN', 1),
(1647, 106, 'Portland Parish', 'POR', 1),
(1648, 106, 'Saint Andrew Parish', 'AND', 1),
(1649, 106, 'Saint Ann Parish', 'ANN', 1),
(1650, 106, 'Saint Catherine Parish', 'CAT', 1),
(1651, 106, 'Saint Elizabeth Parish', 'ELI', 1),
(1652, 106, 'Saint James Parish', 'JAM', 1),
(1653, 106, 'Saint Mary Parish', 'MAR', 1),
(1654, 106, 'Saint Thomas Parish', 'THO', 1),
(1655, 106, 'Trelawny Parish', 'TRL', 1),
(1656, 106, 'Westmoreland Parish', 'WML', 1),
(1657, 107, 'Aichi', 'AI', 1),
(1658, 107, 'Akita', 'AK', 1),
(1659, 107, 'Aomori', 'AO', 1),
(1660, 107, 'Chiba', 'CH', 1),
(1661, 107, 'Ehime', 'EH', 1),
(1662, 107, 'Fukui', 'FK', 1),
(1663, 107, 'Fukuoka', 'FU', 1),
(1664, 107, 'Fukushima', 'FS', 1),
(1665, 107, 'Gifu', 'GI', 1),
(1666, 107, 'Gumma', 'GU', 1),
(1667, 107, 'Hiroshima', 'HI', 1),
(1668, 107, 'Hokkaido', 'HO', 1),
(1669, 107, 'Hyogo', 'HY', 1),
(1670, 107, 'Ibaraki', 'IB', 1),
(1671, 107, 'Ishikawa', 'IS', 1),
(1672, 107, 'Iwate', 'IW', 1),
(1673, 107, 'Kagawa', 'KA', 1),
(1674, 107, 'Kagoshima', 'KG', 1),
(1675, 107, 'Kanagawa', 'KN', 1),
(1676, 107, 'Kochi', 'KO', 1),
(1677, 107, 'Kumamoto', 'KU', 1),
(1678, 107, 'Kyoto', 'KY', 1),
(1679, 107, 'Mie', 'MI', 1),
(1680, 107, 'Miyagi', 'MY', 1),
(1681, 107, 'Miyazaki', 'MZ', 1),
(1682, 107, 'Nagano', 'NA', 1),
(1683, 107, 'Nagasaki', 'NG', 1),
(1684, 107, 'Nara', 'NR', 1),
(1685, 107, 'Niigata', 'NI', 1),
(1686, 107, 'Oita', 'OI', 1),
(1687, 107, 'Okayama', 'OK', 1),
(1688, 107, 'Okinawa', 'ON', 1),
(1689, 107, 'Osaka', 'OS', 1),
(1690, 107, 'Saga', 'SA', 1),
(1691, 107, 'Saitama', 'SI', 1),
(1692, 107, 'Shiga', 'SH', 1),
(1693, 107, 'Shimane', 'SM', 1),
(1694, 107, 'Shizuoka', 'SZ', 1),
(1695, 107, 'Tochigi', 'TO', 1),
(1696, 107, 'Tokushima', 'TS', 1),
(1697, 107, 'Tokyo', 'TK', 1),
(1698, 107, 'Tottori', 'TT', 1),
(1699, 107, 'Toyama', 'TY', 1),
(1700, 107, 'Wakayama', 'WA', 1),
(1701, 107, 'Yamagata', 'YA', 1),
(1702, 107, 'Yamaguchi', 'YM', 1),
(1703, 107, 'Yamanashi', 'YN', 1),
(1704, 108, '''Amman', 'AM', 1),
(1705, 108, 'Ajlun', 'AJ', 1),
(1706, 108, 'Al ''Aqabah', 'AA', 1),
(1707, 108, 'Al Balqa''', 'AB', 1),
(1708, 108, 'Al Karak', 'AK', 1),
(1709, 108, 'Al Mafraq', 'AL', 1),
(1710, 108, 'At Tafilah', 'AT', 1),
(1711, 108, 'Az Zarqa''', 'AZ', 1),
(1712, 108, 'Irbid', 'IR', 1),
(1713, 108, 'Jarash', 'JA', 1),
(1714, 108, 'Ma''an', 'MA', 1),
(1715, 108, 'Madaba', 'MD', 1),
(1716, 109, 'Almaty', 'AL', 1),
(1717, 109, 'Almaty City', 'AC', 1),
(1718, 109, 'Aqmola', 'AM', 1),
(1719, 109, 'Aqtobe', 'AQ', 1),
(1720, 109, 'Astana City', 'AS', 1),
(1721, 109, 'Atyrau', 'AT', 1),
(1722, 109, 'Batys Qazaqstan', 'BA', 1),
(1723, 109, 'Bayqongyr City', 'BY', 1),
(1724, 109, 'Mangghystau', 'MA', 1),
(1725, 109, 'Ongtustik Qazaqstan', 'ON', 1),
(1726, 109, 'Pavlodar', 'PA', 1),
(1727, 109, 'Qaraghandy', 'QA', 1),
(1728, 109, 'Qostanay', 'QO', 1),
(1729, 109, 'Qyzylorda', 'QY', 1),
(1730, 109, 'Shyghys Qazaqstan', 'SH', 1),
(1731, 109, 'Soltustik Qazaqstan', 'SO', 1),
(1732, 109, 'Zhambyl', 'ZH', 1),
(1733, 110, 'Central', 'CE', 1),
(1734, 110, 'Coast', 'CO', 1),
(1735, 110, 'Eastern', 'EA', 1),
(1736, 110, 'Nairobi Area', 'NA', 1),
(1737, 110, 'North Eastern', 'NE', 1),
(1738, 110, 'Nyanza', 'NY', 1),
(1739, 110, 'Rift Valley', 'RV', 1),
(1740, 110, 'Western', 'WE', 1),
(1741, 111, 'Abaiang', 'AG', 1),
(1742, 111, 'Abemama', 'AM', 1),
(1743, 111, 'Aranuka', 'AK', 1),
(1744, 111, 'Arorae', 'AO', 1),
(1745, 111, 'Banaba', 'BA', 1),
(1746, 111, 'Beru', 'BE', 1),
(1747, 111, 'Butaritari', 'bT', 1),
(1748, 111, 'Kanton', 'KA', 1),
(1749, 111, 'Kiritimati', 'KR', 1),
(1750, 111, 'Kuria', 'KU', 1),
(1751, 111, 'Maiana', 'MI', 1),
(1752, 111, 'Makin', 'MN', 1),
(1753, 111, 'Marakei', 'ME', 1),
(1754, 111, 'Nikunau', 'NI', 1),
(1755, 111, 'Nonouti', 'NO', 1),
(1756, 111, 'Onotoa', 'ON', 1),
(1757, 111, 'Tabiteuea', 'TT', 1),
(1758, 111, 'Tabuaeran', 'TR', 1),
(1759, 111, 'Tamana', 'TM', 1),
(1760, 111, 'Tarawa', 'TW', 1),
(1761, 111, 'Teraina', 'TE', 1),
(1762, 112, 'Chagang-do', 'CHA', 1),
(1763, 112, 'Hamgyong-bukto', 'HAB', 1),
(1764, 112, 'Hamgyong-namdo', 'HAN', 1),
(1765, 112, 'Hwanghae-bukto', 'HWB', 1),
(1766, 112, 'Hwanghae-namdo', 'HWN', 1),
(1767, 112, 'Kangwon-do', 'KAN', 1),
(1768, 112, 'P''yongan-bukto', 'PYB', 1),
(1769, 112, 'P''yongan-namdo', 'PYN', 1),
(1770, 112, 'Ryanggang-do (Yanggang-do)', 'YAN', 1),
(1771, 112, 'Rason Directly Governed City', 'NAJ', 1),
(1772, 112, 'P''yongyang Special City', 'PYO', 1),
(1773, 113, 'Ch''ungch''ong-bukto', 'CO', 1),
(1774, 113, 'Ch''ungch''ong-namdo', 'CH', 1),
(1775, 113, 'Cheju-do', 'CD', 1),
(1776, 113, 'Cholla-bukto', 'CB', 1),
(1777, 113, 'Cholla-namdo', 'CN', 1),
(1778, 113, 'Inch''on-gwangyoksi', 'IG', 1),
(1779, 113, 'Kangwon-do', 'KA', 1),
(1780, 113, 'Kwangju-gwangyoksi', 'KG', 1),
(1781, 113, 'Kyonggi-do', 'KD', 1),
(1782, 113, 'Kyongsang-bukto', 'KB', 1),
(1783, 113, 'Kyongsang-namdo', 'KN', 1),
(1784, 113, 'Pusan-gwangyoksi', 'PG', 1),
(1785, 113, 'Soul-t''ukpyolsi', 'SO', 1),
(1786, 113, 'Taegu-gwangyoksi', 'TA', 1),
(1787, 113, 'Taejon-gwangyoksi', 'TG', 1),
(1788, 114, 'Al ''Asimah', 'AL', 1),
(1789, 114, 'Al Ahmadi', 'AA', 1),
(1790, 114, 'Al Farwaniyah', 'AF', 1),
(1791, 114, 'Al Jahra''', 'AJ', 1),
(1792, 114, 'Hawalli', 'HA', 1),
(1793, 115, 'Bishkek', 'GB', 1),
(1794, 115, 'Batken', 'B', 1),
(1795, 115, 'Chu', 'C', 1),
(1796, 115, 'Jalal-Abad', 'J', 1),
(1797, 115, 'Naryn', 'N', 1),
(1798, 115, 'Osh', 'O', 1),
(1799, 115, 'Talas', 'T', 1),
(1800, 115, 'Ysyk-Kol', 'Y', 1),
(1801, 116, 'Vientiane', 'VT', 1),
(1802, 116, 'Attapu', 'AT', 1),
(1803, 116, 'Bokeo', 'BK', 1),
(1804, 116, 'Bolikhamxai', 'BL', 1),
(1805, 116, 'Champasak', 'CH', 1),
(1806, 116, 'Houaphan', 'HO', 1),
(1807, 116, 'Khammouan', 'KH', 1),
(1808, 116, 'Louang Namtha', 'LM', 1),
(1809, 116, 'Louangphabang', 'LP', 1),
(1810, 116, 'Oudomxai', 'OU', 1),
(1811, 116, 'Phongsali', 'PH', 1),
(1812, 116, 'Salavan', 'SL', 1),
(1813, 116, 'Savannakhet', 'SV', 1),
(1814, 116, 'Vientiane', 'VI', 1),
(1815, 116, 'Xaignabouli', 'XA', 1),
(1816, 116, 'Xekong', 'XE', 1),
(1817, 116, 'Xiangkhoang', 'XI', 1),
(1818, 116, 'Xaisomboun', 'XN', 1),
(1819, 117, 'Aizkraukles Rajons', 'AIZ', 1),
(1820, 117, 'Aluksnes Rajons', 'ALU', 1),
(1821, 117, 'Balvu Rajons', 'BAL', 1),
(1822, 117, 'Bauskas Rajons', 'BAU', 1),
(1823, 117, 'Cesu Rajons', 'CES', 1),
(1824, 117, 'Daugavpils Rajons', 'DGR', 1),
(1825, 117, 'Dobeles Rajons', 'DOB', 1),
(1826, 117, 'Gulbenes Rajons', 'GUL', 1),
(1827, 117, 'Jekabpils Rajons', 'JEK', 1),
(1828, 117, 'Jelgavas Rajons', 'JGR', 1),
(1829, 117, 'Kraslavas Rajons', 'KRA', 1),
(1830, 117, 'Kuldigas Rajons', 'KUL', 1),
(1831, 117, 'Liepajas Rajons', 'LPR', 1),
(1832, 117, 'Limbazu Rajons', 'LIM', 1),
(1833, 117, 'Ludzas Rajons', 'LUD', 1),
(1834, 117, 'Madonas Rajons', 'MAD', 1),
(1835, 117, 'Ogres Rajons', 'OGR', 1),
(1836, 117, 'Preilu Rajons', 'PRE', 1),
(1837, 117, 'Rezeknes Rajons', 'RZR', 1),
(1838, 117, 'Rigas Rajons', 'RGR', 1),
(1839, 117, 'Saldus Rajons', 'SAL', 1),
(1840, 117, 'Talsu Rajons', 'TAL', 1),
(1841, 117, 'Tukuma Rajons', 'TUK', 1),
(1842, 117, 'Valkas Rajons', 'VLK', 1),
(1843, 117, 'Valmieras Rajons', 'VLM', 1),
(1844, 117, 'Ventspils Rajons', 'VSR', 1),
(1845, 117, 'Daugavpils', 'DGV', 1),
(1846, 117, 'Jelgava', 'JGV', 1),
(1847, 117, 'Jurmala', 'JUR', 1),
(1848, 117, 'Liepaja', 'LPK', 1),
(1849, 117, 'Rezekne', 'RZK', 1),
(1850, 117, 'Riga', 'RGA', 1),
(1851, 117, 'Ventspils', 'VSL', 1),
(1852, 119, 'Berea', 'BE', 1),
(1853, 119, 'Butha-Buthe', 'BB', 1),
(1854, 119, 'Leribe', 'LE', 1),
(1855, 119, 'Mafeteng', 'MF', 1),
(1856, 119, 'Maseru', 'MS', 1),
(1857, 119, 'Mohale''s Hoek', 'MH', 1),
(1858, 119, 'Mokhotlong', 'MK', 1),
(1859, 119, 'Qacha''s Nek', 'QN', 1),
(1860, 119, 'Quthing', 'QT', 1),
(1861, 119, 'Thaba-Tseka', 'TT', 1),
(1862, 120, 'Bomi', 'BI', 1),
(1863, 120, 'Bong', 'BG', 1),
(1864, 120, 'Grand Bassa', 'GB', 1),
(1865, 120, 'Grand Cape Mount', 'CM', 1),
(1866, 120, 'Grand Gedeh', 'GG', 1),
(1867, 120, 'Grand Kru', 'GK', 1),
(1868, 120, 'Lofa', 'LO', 1),
(1869, 120, 'Margibi', 'MG', 1),
(1870, 120, 'Maryland', 'ML', 1),
(1871, 120, 'Montserrado', 'MS', 1),
(1872, 120, 'Nimba', 'NB', 1),
(1873, 120, 'River Cess', 'RC', 1),
(1874, 120, 'Sinoe', 'SN', 1),
(1875, 121, 'Ajdabiya', 'AJ', 1),
(1876, 121, 'Al ''Aziziyah', 'AZ', 1),
(1877, 121, 'Al Fatih', 'FA', 1),
(1878, 121, 'Al Jabal al Akhdar', 'JA', 1),
(1879, 121, 'Al Jufrah', 'JU', 1),
(1880, 121, 'Al Khums', 'KH', 1),
(1881, 121, 'Al Kufrah', 'KU', 1),
(1882, 121, 'An Nuqat al Khams', 'NK', 1),
(1883, 121, 'Ash Shati''', 'AS', 1),
(1884, 121, 'Awbari', 'AW', 1),
(1885, 121, 'Az Zawiyah', 'ZA', 1),
(1886, 121, 'Banghazi', 'BA', 1),
(1887, 121, 'Darnah', 'DA', 1),
(1888, 121, 'Ghadamis', 'GD', 1),
(1889, 121, 'Gharyan', 'GY', 1),
(1890, 121, 'Misratah', 'MI', 1),
(1891, 121, 'Murzuq', 'MZ', 1),
(1892, 121, 'Sabha', 'SB', 1),
(1893, 121, 'Sawfajjin', 'SW', 1),
(1894, 121, 'Surt', 'SU', 1),
(1895, 121, 'Tarabulus (Tripoli)', 'TL', 1),
(1896, 121, 'Tarhunah', 'TH', 1),
(1897, 121, 'Tubruq', 'TU', 1),
(1898, 121, 'Yafran', 'YA', 1),
(1899, 121, 'Zlitan', 'ZL', 1),
(1900, 122, 'Vaduz', 'V', 1),
(1901, 122, 'Schaan', 'A', 1),
(1902, 122, 'Balzers', 'B', 1),
(1903, 122, 'Triesen', 'N', 1),
(1904, 122, 'Eschen', 'E', 1),
(1905, 122, 'Mauren', 'M', 1),
(1906, 122, 'Triesenberg', 'T', 1),
(1907, 122, 'Ruggell', 'R', 1),
(1908, 122, 'Gamprin', 'G', 1),
(1909, 122, 'Schellenberg', 'L', 1),
(1910, 122, 'Planken', 'P', 1),
(1911, 123, 'Alytus', 'AL', 1),
(1912, 123, 'Kaunas', 'KA', 1),
(1913, 123, 'Klaipeda', 'KL', 1),
(1914, 123, 'Marijampole', 'MA', 1),
(1915, 123, 'Panevezys', 'PA', 1),
(1916, 123, 'Siauliai', 'SI', 1),
(1917, 123, 'Taurage', 'TA', 1),
(1918, 123, 'Telsiai', 'TE', 1),
(1919, 123, 'Utena', 'UT', 1),
(1920, 123, 'Vilnius', 'VI', 1),
(1921, 124, 'Diekirch', 'DD', 1),
(1922, 124, 'Clervaux', 'DC', 1),
(1923, 124, 'Redange', 'DR', 1),
(1924, 124, 'Vianden', 'DV', 1),
(1925, 124, 'Wiltz', 'DW', 1),
(1926, 124, 'Grevenmacher', 'GG', 1),
(1927, 124, 'Echternach', 'GE', 1),
(1928, 124, 'Remich', 'GR', 1),
(1929, 124, 'Luxembourg', 'LL', 1),
(1930, 124, 'Capellen', 'LC', 1),
(1931, 124, 'Esch-sur-Alzette', 'LE', 1),
(1932, 124, 'Mersch', 'LM', 1),
(1933, 125, 'Our Lady Fatima Parish', 'OLF', 1),
(1934, 125, 'St. Anthony Parish', 'ANT', 1),
(1935, 125, 'St. Lazarus Parish', 'LAZ', 1),
(1936, 125, 'Cathedral Parish', 'CAT', 1),
(1937, 125, 'St. Lawrence Parish', 'LAW', 1),
(1938, 127, 'Antananarivo', 'AN', 1),
(1939, 127, 'Antsiranana', 'AS', 1),
(1940, 127, 'Fianarantsoa', 'FN', 1),
(1941, 127, 'Mahajanga', 'MJ', 1),
(1942, 127, 'Toamasina', 'TM', 1),
(1943, 127, 'Toliara', 'TL', 1),
(1944, 128, 'Balaka', 'BLK', 1),
(1945, 128, 'Blantyre', 'BLT', 1),
(1946, 128, 'Chikwawa', 'CKW', 1),
(1947, 128, 'Chiradzulu', 'CRD', 1),
(1948, 128, 'Chitipa', 'CTP', 1),
(1949, 128, 'Dedza', 'DDZ', 1),
(1950, 128, 'Dowa', 'DWA', 1),
(1951, 128, 'Karonga', 'KRG', 1),
(1952, 128, 'Kasungu', 'KSG', 1),
(1953, 128, 'Likoma', 'LKM', 1),
(1954, 128, 'Lilongwe', 'LLG', 1),
(1955, 128, 'Machinga', 'MCG', 1),
(1956, 128, 'Mangochi', 'MGC', 1),
(1957, 128, 'Mchinji', 'MCH', 1),
(1958, 128, 'Mulanje', 'MLJ', 1),
(1959, 128, 'Mwanza', 'MWZ', 1),
(1960, 128, 'Mzimba', 'MZM', 1),
(1961, 128, 'Ntcheu', 'NTU', 1),
(1962, 128, 'Nkhata Bay', 'NKB', 1),
(1963, 128, 'Nkhotakota', 'NKH', 1),
(1964, 128, 'Nsanje', 'NSJ', 1),
(1965, 128, 'Ntchisi', 'NTI', 1),
(1966, 128, 'Phalombe', 'PHL', 1),
(1967, 128, 'Rumphi', 'RMP', 1),
(1968, 128, 'Salima', 'SLM', 1),
(1969, 128, 'Thyolo', 'THY', 1),
(1970, 128, 'Zomba', 'ZBA', 1),
(1971, 129, 'Johor', 'JO', 1),
(1972, 129, 'Kedah', 'KE', 1),
(1973, 129, 'Kelantan', 'KL', 1),
(1974, 129, 'Labuan', 'LA', 1),
(1975, 129, 'Melaka', 'ME', 1),
(1976, 129, 'Negeri Sembilan', 'NS', 1),
(1977, 129, 'Pahang', 'PA', 1),
(1978, 129, 'Perak', 'PE', 1),
(1979, 129, 'Perlis', 'PR', 1),
(1980, 129, 'Pulau Pinang', 'PP', 1),
(1981, 129, 'Sabah', 'SA', 1),
(1982, 129, 'Sarawak', 'SR', 1),
(1983, 129, 'Selangor', 'SE', 1),
(1984, 129, 'Terengganu', 'TE', 1),
(1985, 129, 'Wilayah Persekutuan', 'WP', 1),
(1986, 130, 'Thiladhunmathi Uthuru', 'THU', 1),
(1987, 130, 'Thiladhunmathi Dhekunu', 'THD', 1),
(1988, 130, 'Miladhunmadulu Uthuru', 'MLU', 1),
(1989, 130, 'Miladhunmadulu Dhekunu', 'MLD', 1),
(1990, 130, 'Maalhosmadulu Uthuru', 'MAU', 1),
(1991, 130, 'Maalhosmadulu Dhekunu', 'MAD', 1),
(1992, 130, 'Faadhippolhu', 'FAA', 1),
(1993, 130, 'Male Atoll', 'MAA', 1),
(1994, 130, 'Ari Atoll Uthuru', 'AAU', 1),
(1995, 130, 'Ari Atoll Dheknu', 'AAD', 1),
(1996, 130, 'Felidhe Atoll', 'FEA', 1),
(1997, 130, 'Mulaku Atoll', 'MUA', 1),
(1998, 130, 'Nilandhe Atoll Uthuru', 'NAU', 1),
(1999, 130, 'Nilandhe Atoll Dhekunu', 'NAD', 1),
(2000, 130, 'Kolhumadulu', 'KLH', 1),
(2001, 130, 'Hadhdhunmathi', 'HDH', 1),
(2002, 130, 'Huvadhu Atoll Uthuru', 'HAU', 1),
(2003, 130, 'Huvadhu Atoll Dhekunu', 'HAD', 1),
(2004, 130, 'Fua Mulaku', 'FMU', 1),
(2005, 130, 'Addu', 'ADD', 1),
(2006, 131, 'Gao', 'GA', 1),
(2007, 131, 'Kayes', 'KY', 1),
(2008, 131, 'Kidal', 'KD', 1),
(2009, 131, 'Koulikoro', 'KL', 1),
(2010, 131, 'Mopti', 'MP', 1),
(2011, 131, 'Segou', 'SG', 1),
(2012, 131, 'Sikasso', 'SK', 1),
(2013, 131, 'Tombouctou', 'TB', 1),
(2014, 131, 'Bamako Capital District', 'CD', 1),
(2015, 132, 'Attard', 'ATT', 1),
(2016, 132, 'Balzan', 'BAL', 1),
(2017, 132, 'Birgu', 'BGU', 1),
(2018, 132, 'Birkirkara', 'BKK', 1),
(2019, 132, 'Birzebbuga', 'BRZ', 1),
(2020, 132, 'Bormla', 'BOR', 1),
(2021, 132, 'Dingli', 'DIN', 1),
(2022, 132, 'Fgura', 'FGU', 1),
(2023, 132, 'Floriana', 'FLO', 1),
(2024, 132, 'Gudja', 'GDJ', 1),
(2025, 132, 'Gzira', 'GZR', 1),
(2026, 132, 'Gargur', 'GRG', 1),
(2027, 132, 'Gaxaq', 'GXQ', 1),
(2028, 132, 'Hamrun', 'HMR', 1),
(2029, 132, 'Iklin', 'IKL', 1),
(2030, 132, 'Isla', 'ISL', 1),
(2031, 132, 'Kalkara', 'KLK', 1),
(2032, 132, 'Kirkop', 'KRK', 1),
(2033, 132, 'Lija', 'LIJ', 1),
(2034, 132, 'Luqa', 'LUQ', 1),
(2035, 132, 'Marsa', 'MRS', 1),
(2036, 132, 'Marsaskala', 'MKL', 1),
(2037, 132, 'Marsaxlokk', 'MXL', 1),
(2038, 132, 'Mdina', 'MDN', 1),
(2039, 132, 'Melliea', 'MEL', 1),
(2040, 132, 'Mgarr', 'MGR', 1),
(2041, 132, 'Mosta', 'MST', 1),
(2042, 132, 'Mqabba', 'MQA', 1),
(2043, 132, 'Msida', 'MSI', 1),
(2044, 132, 'Mtarfa', 'MTF', 1),
(2045, 132, 'Naxxar', 'NAX', 1),
(2046, 132, 'Paola', 'PAO', 1),
(2047, 132, 'Pembroke', 'PEM', 1),
(2048, 132, 'Pieta', 'PIE', 1),
(2049, 132, 'Qormi', 'QOR', 1),
(2050, 132, 'Qrendi', 'QRE', 1),
(2051, 132, 'Rabat', 'RAB', 1),
(2052, 132, 'Safi', 'SAF', 1),
(2053, 132, 'San Giljan', 'SGI', 1),
(2054, 132, 'Santa Lucija', 'SLU', 1),
(2055, 132, 'San Pawl il-Bahar', 'SPB', 1),
(2056, 132, 'San Gwann', 'SGW', 1),
(2057, 132, 'Santa Venera', 'SVE', 1),
(2058, 132, 'Siggiewi', 'SIG', 1),
(2059, 132, 'Sliema', 'SLM', 1),
(2060, 132, 'Swieqi', 'SWQ', 1),
(2061, 132, 'Ta Xbiex', 'TXB', 1),
(2062, 132, 'Tarxien', 'TRX', 1),
(2063, 132, 'Valletta', 'VLT', 1),
(2064, 132, 'Xgajra', 'XGJ', 1),
(2065, 132, 'Zabbar', 'ZBR', 1),
(2066, 132, 'Zebbug', 'ZBG', 1),
(2067, 132, 'Zejtun', 'ZJT', 1),
(2068, 132, 'Zurrieq', 'ZRQ', 1),
(2069, 132, 'Fontana', 'FNT', 1),
(2070, 132, 'Ghajnsielem', 'GHJ', 1),
(2071, 132, 'Gharb', 'GHR', 1),
(2072, 132, 'Ghasri', 'GHS', 1),
(2073, 132, 'Kercem', 'KRC', 1),
(2074, 132, 'Munxar', 'MUN', 1),
(2075, 132, 'Nadur', 'NAD', 1),
(2076, 132, 'Qala', 'QAL', 1),
(2077, 132, 'Victoria', 'VIC', 1),
(2078, 132, 'San Lawrenz', 'SLA', 1),
(2079, 132, 'Sannat', 'SNT', 1),
(2080, 132, 'Xagra', 'ZAG', 1),
(2081, 132, 'Xewkija', 'XEW', 1),
(2082, 132, 'Zebbug', 'ZEB', 1),
(2083, 133, 'Ailinginae', 'ALG', 1),
(2084, 133, 'Ailinglaplap', 'ALL', 1),
(2085, 133, 'Ailuk', 'ALK', 1),
(2086, 133, 'Arno', 'ARN', 1),
(2087, 133, 'Aur', 'AUR', 1),
(2088, 133, 'Bikar', 'BKR', 1),
(2089, 133, 'Bikini', 'BKN', 1),
(2090, 133, 'Bokak', 'BKK', 1),
(2091, 133, 'Ebon', 'EBN', 1),
(2092, 133, 'Enewetak', 'ENT', 1),
(2093, 133, 'Erikub', 'EKB', 1),
(2094, 133, 'Jabat', 'JBT', 1),
(2095, 133, 'Jaluit', 'JLT', 1),
(2096, 133, 'Jemo', 'JEM', 1),
(2097, 133, 'Kili', 'KIL', 1),
(2098, 133, 'Kwajalein', 'KWJ', 1),
(2099, 133, 'Lae', 'LAE', 1),
(2100, 133, 'Lib', 'LIB', 1),
(2101, 133, 'Likiep', 'LKP', 1),
(2102, 133, 'Majuro', 'MJR', 1),
(2103, 133, 'Maloelap', 'MLP', 1),
(2104, 133, 'Mejit', 'MJT', 1),
(2105, 133, 'Mili', 'MIL', 1),
(2106, 133, 'Namorik', 'NMK', 1),
(2107, 133, 'Namu', 'NAM', 1),
(2108, 133, 'Rongelap', 'RGL', 1),
(2109, 133, 'Rongrik', 'RGK', 1),
(2110, 133, 'Toke', 'TOK', 1),
(2111, 133, 'Ujae', 'UJA', 1),
(2112, 133, 'Ujelang', 'UJL', 1),
(2113, 133, 'Utirik', 'UTK', 1),
(2114, 133, 'Wotho', 'WTH', 1),
(2115, 133, 'Wotje', 'WTJ', 1),
(2116, 135, 'Adrar', 'AD', 1),
(2117, 135, 'Assaba', 'AS', 1),
(2118, 135, 'Brakna', 'BR', 1),
(2119, 135, 'Dakhlet Nouadhibou', 'DN', 1),
(2120, 135, 'Gorgol', 'GO', 1),
(2121, 135, 'Guidimaka', 'GM', 1),
(2122, 135, 'Hodh Ech Chargui', 'HC', 1),
(2123, 135, 'Hodh El Gharbi', 'HG', 1),
(2124, 135, 'Inchiri', 'IN', 1),
(2125, 135, 'Tagant', 'TA', 1),
(2126, 135, 'Tiris Zemmour', 'TZ', 1),
(2127, 135, 'Trarza', 'TR', 1),
(2128, 135, 'Nouakchott', 'NO', 1),
(2129, 136, 'Beau Bassin-Rose Hill', 'BR', 1),
(2130, 136, 'Curepipe', 'CU', 1),
(2131, 136, 'Port Louis', 'PU', 1),
(2132, 136, 'Quatre Bornes', 'QB', 1),
(2133, 136, 'Vacoas-Phoenix', 'VP', 1),
(2134, 136, 'Agalega Islands', 'AG', 1),
(2135, 136, 'Cargados Carajos Shoals (Saint Brandon Islands)', 'CC', 1),
(2136, 136, 'Rodrigues', 'RO', 1),
(2137, 136, 'Black River', 'BL', 1),
(2138, 136, 'Flacq', 'FL', 1),
(2139, 136, 'Grand Port', 'GP', 1),
(2140, 136, 'Moka', 'MO', 1),
(2141, 136, 'Pamplemousses', 'PA', 1),
(2142, 136, 'Plaines Wilhems', 'PW', 1),
(2143, 136, 'Port Louis', 'PL', 1),
(2144, 136, 'Riviere du Rempart', 'RR', 1),
(2145, 136, 'Savanne', 'SA', 1),
(2146, 138, 'Baja California Norte', 'BN', 1),
(2147, 138, 'Baja California Sur', 'BS', 1),
(2148, 138, 'Campeche', 'CA', 1),
(2149, 138, 'Chiapas', 'CI', 1),
(2150, 138, 'Chihuahua', 'CH', 1),
(2151, 138, 'Coahuila de Zaragoza', 'CZ', 1),
(2152, 138, 'Colima', 'CL', 1),
(2153, 138, 'Distrito Federal', 'DF', 1),
(2154, 138, 'Durango', 'DU', 1),
(2155, 138, 'Guanajuato', 'GA', 1),
(2156, 138, 'Guerrero', 'GE', 1),
(2157, 138, 'Hidalgo', 'HI', 1),
(2158, 138, 'Jalisco', 'JA', 1),
(2159, 138, 'Mexico', 'ME', 1),
(2160, 138, 'Michoacan de Ocampo', 'MI', 1),
(2161, 138, 'Morelos', 'MO', 1),
(2162, 138, 'Nayarit', 'NA', 1),
(2163, 138, 'Nuevo Leon', 'NL', 1),
(2164, 138, 'Oaxaca', 'OA', 1),
(2165, 138, 'Puebla', 'PU', 1),
(2166, 138, 'Queretaro de Arteaga', 'QA', 1),
(2167, 138, 'Quintana Roo', 'QR', 1),
(2168, 138, 'San Luis Potosi', 'SA', 1),
(2169, 138, 'Sinaloa', 'SI', 1),
(2170, 138, 'Sonora', 'SO', 1),
(2171, 138, 'Tabasco', 'TB', 1),
(2172, 138, 'Tamaulipas', 'TM', 1),
(2173, 138, 'Tlaxcala', 'TL', 1),
(2174, 138, 'Veracruz-Llave', 'VE', 1),
(2175, 138, 'Yucatan', 'YU', 1),
(2176, 138, 'Zacatecas', 'ZA', 1),
(2177, 139, 'Chuuk', 'C', 1),
(2178, 139, 'Kosrae', 'K', 1),
(2179, 139, 'Pohnpei', 'P', 1),
(2180, 139, 'Yap', 'Y', 1),
(2181, 140, 'Gagauzia', 'GA', 1),
(2182, 140, 'Chisinau', 'CU', 1),
(2183, 140, 'Balti', 'BA', 1),
(2184, 140, 'Cahul', 'CA', 1),
(2185, 140, 'Edinet', 'ED', 1),
(2186, 140, 'Lapusna', 'LA', 1),
(2187, 140, 'Orhei', 'OR', 1),
(2188, 140, 'Soroca', 'SO', 1),
(2189, 140, 'Tighina', 'TI', 1),
(2190, 140, 'Ungheni', 'UN', 1),
(2191, 140, 'St‚nga Nistrului', 'SN', 1),
(2192, 141, 'Fontvieille', 'FV', 1),
(2193, 141, 'La Condamine', 'LC', 1),
(2194, 141, 'Monaco-Ville', 'MV', 1),
(2195, 141, 'Monte-Carlo', 'MC', 1),
(2196, 142, 'Ulanbaatar', '1', 1),
(2197, 142, 'Orhon', '035', 1),
(2198, 142, 'Darhan uul', '037', 1),
(2199, 142, 'Hentiy', '039', 1),
(2200, 142, 'Hovsgol', '041', 1),
(2201, 142, 'Hovd', '043', 1),
(2202, 142, 'Uvs', '046', 1),
(2203, 142, 'Tov', '047', 1),
(2204, 142, 'Selenge', '049', 1),
(2205, 142, 'Suhbaatar', '051', 1),
(2206, 142, 'Omnogovi', '053', 1),
(2207, 142, 'Ovorhangay', '055', 1),
(2208, 142, 'Dzavhan', '057', 1),
(2209, 142, 'DundgovL', '059', 1),
(2210, 142, 'Dornod', '061', 1),
(2211, 142, 'Dornogov', '063', 1),
(2212, 142, 'Govi-Sumber', '064', 1),
(2213, 142, 'Govi-Altay', '065', 1),
(2214, 142, 'Bulgan', '067', 1),
(2215, 142, 'Bayanhongor', '069', 1),
(2216, 142, 'Bayan-Olgiy', '071', 1),
(2217, 142, 'Arhangay', '073', 1),
(2218, 143, 'Saint Anthony', 'A', 1),
(2219, 143, 'Saint Georges', 'G', 1),
(2220, 143, 'Saint Peter', 'P', 1),
(2221, 144, 'Agadir', 'AGD', 1),
(2222, 144, 'Al Hoceima', 'HOC', 1),
(2223, 144, 'Azilal', 'AZI', 1),
(2224, 144, 'Beni Mellal', 'BME', 1),
(2225, 144, 'Ben Slimane', 'BSL', 1),
(2226, 144, 'Boulemane', 'BLM', 1),
(2227, 144, 'Casablanca', 'CBL', 1),
(2228, 144, 'Chaouen', 'CHA', 1),
(2229, 144, 'El Jadida', 'EJA', 1),
(2230, 144, 'El Kelaa des Sraghna', 'EKS', 1),
(2231, 144, 'Er Rachidia', 'ERA', 1),
(2232, 144, 'Essaouira', 'ESS', 1),
(2233, 144, 'Fes', 'FES', 1),
(2234, 144, 'Figuig', 'FIG', 1),
(2235, 144, 'Guelmim', 'GLM', 1),
(2236, 144, 'Ifrane', 'IFR', 1),
(2237, 144, 'Kenitra', 'KEN', 1),
(2238, 144, 'Khemisset', 'KHM', 1),
(2239, 144, 'Khenifra', 'KHN', 1),
(2240, 144, 'Khouribga', 'KHO', 1),
(2241, 144, 'Laayoune', 'LYN', 1),
(2242, 144, 'Larache', 'LAR', 1),
(2243, 144, 'Marrakech', 'MRK', 1),
(2244, 144, 'Meknes', 'MKN', 1),
(2245, 144, 'Nador', 'NAD', 1),
(2246, 144, 'Ouarzazate', 'ORZ', 1),
(2247, 144, 'Oujda', 'OUJ', 1),
(2248, 144, 'Rabat-Sale', 'RSA', 1),
(2249, 144, 'Safi', 'SAF', 1),
(2250, 144, 'Settat', 'SET', 1),
(2251, 144, 'Sidi Kacem', 'SKA', 1),
(2252, 144, 'Tangier', 'TGR', 1),
(2253, 144, 'Tan-Tan', 'TAN', 1),
(2254, 144, 'Taounate', 'TAO', 1),
(2255, 144, 'Taroudannt', 'TRD', 1),
(2256, 144, 'Tata', 'TAT', 1),
(2257, 144, 'Taza', 'TAZ', 1),
(2258, 144, 'Tetouan', 'TET', 1),
(2259, 144, 'Tiznit', 'TIZ', 1),
(2260, 144, 'Ad Dakhla', 'ADK', 1),
(2261, 144, 'Boujdour', 'BJD', 1),
(2262, 144, 'Es Smara', 'ESM', 1),
(2263, 145, 'Cabo Delgado', 'CD', 1),
(2264, 145, 'Gaza', 'GZ', 1),
(2265, 145, 'Inhambane', 'IN', 1),
(2266, 145, 'Manica', 'MN', 1),
(2267, 145, 'Maputo (city)', 'MC', 1),
(2268, 145, 'Maputo', 'MP', 1),
(2269, 145, 'Nampula', 'NA', 1),
(2270, 145, 'Niassa', 'NI', 1),
(2271, 145, 'Sofala', 'SO', 1),
(2272, 145, 'Tete', 'TE', 1),
(2273, 145, 'Zambezia', 'ZA', 1),
(2274, 146, 'Ayeyarwady', 'AY', 1),
(2275, 146, 'Bago', 'BG', 1),
(2276, 146, 'Magway', 'MG', 1),
(2277, 146, 'Mandalay', 'MD', 1),
(2278, 146, 'Sagaing', 'SG', 1),
(2279, 146, 'Tanintharyi', 'TN', 1),
(2280, 146, 'Yangon', 'YG', 1),
(2281, 146, 'Chin State', 'CH', 1),
(2282, 146, 'Kachin State', 'KC', 1),
(2283, 146, 'Kayah State', 'KH', 1),
(2284, 146, 'Kayin State', 'KN', 1),
(2285, 146, 'Mon State', 'MN', 1),
(2286, 146, 'Rakhine State', 'RK', 1),
(2287, 146, 'Shan State', 'SH', 1),
(2288, 147, 'Caprivi', 'CA', 1),
(2289, 147, 'Erongo', 'ER', 1),
(2290, 147, 'Hardap', 'HA', 1),
(2291, 147, 'Karas', 'KR', 1),
(2292, 147, 'Kavango', 'KV', 1),
(2293, 147, 'Khomas', 'KH', 1),
(2294, 147, 'Kunene', 'KU', 1),
(2295, 147, 'Ohangwena', 'OW', 1),
(2296, 147, 'Omaheke', 'OK', 1),
(2297, 147, 'Omusati', 'OT', 1),
(2298, 147, 'Oshana', 'ON', 1),
(2299, 147, 'Oshikoto', 'OO', 1),
(2300, 147, 'Otjozondjupa', 'OJ', 1),
(2301, 148, 'Aiwo', 'AO', 1),
(2302, 148, 'Anabar', 'AA', 1),
(2303, 148, 'Anetan', 'AT', 1),
(2304, 148, 'Anibare', 'AI', 1),
(2305, 148, 'Baiti', 'BA', 1),
(2306, 148, 'Boe', 'BO', 1),
(2307, 148, 'Buada', 'BU', 1),
(2308, 148, 'Denigomodu', 'DE', 1),
(2309, 148, 'Ewa', 'EW', 1),
(2310, 148, 'Ijuw', 'IJ', 1),
(2311, 148, 'Meneng', 'ME', 1),
(2312, 148, 'Nibok', 'NI', 1),
(2313, 148, 'Uaboe', 'UA', 1),
(2314, 148, 'Yaren', 'YA', 1),
(2315, 149, 'Bagmati', 'BA', 1),
(2316, 149, 'Bheri', 'BH', 1),
(2317, 149, 'Dhawalagiri', 'DH', 1),
(2318, 149, 'Gandaki', 'GA', 1),
(2319, 149, 'Janakpur', 'JA', 1),
(2320, 149, 'Karnali', 'KA', 1),
(2321, 149, 'Kosi', 'KO', 1),
(2322, 149, 'Lumbini', 'LU', 1),
(2323, 149, 'Mahakali', 'MA', 1),
(2324, 149, 'Mechi', 'ME', 1),
(2325, 149, 'Narayani', 'NA', 1),
(2326, 149, 'Rapti', 'RA', 1),
(2327, 149, 'Sagarmatha', 'SA', 1),
(2328, 149, 'Seti', 'SE', 1),
(2329, 150, 'Drenthe', 'DR', 1),
(2330, 150, 'Flevoland', 'FL', 1),
(2331, 150, 'Friesland', 'FR', 1),
(2332, 150, 'Gelderland', 'GE', 1),
(2333, 150, 'Groningen', 'GR', 1),
(2334, 150, 'Limburg', 'LI', 1),
(2335, 150, 'Noord Brabant', 'NB', 1),
(2336, 150, 'Noord Holland', 'NH', 1),
(2337, 150, 'Overijssel', 'OV', 1),
(2338, 150, 'Utrecht', 'UT', 1),
(2339, 150, 'Zeeland', 'ZE', 1),
(2340, 150, 'Zuid Holland', 'ZH', 1),
(2341, 152, 'Iles Loyaute', 'L', 1),
(2342, 152, 'Nord', 'N', 1),
(2343, 152, 'Sud', 'S', 1),
(2344, 153, 'Auckland', 'AUK', 1),
(2345, 153, 'Bay of Plenty', 'BOP', 1),
(2346, 153, 'Canterbury', 'CAN', 1),
(2347, 153, 'Coromandel', 'COR', 1),
(2348, 153, 'Gisborne', 'GIS', 1),
(2349, 153, 'Fiordland', 'FIO', 1),
(2350, 153, 'Hawke''s Bay', 'HKB', 1),
(2351, 153, 'Marlborough', 'MBH', 1),
(2352, 153, 'Manawatu-Wanganui', 'MWT', 1),
(2353, 153, 'Mt Cook-Mackenzie', 'MCM', 1),
(2354, 153, 'Nelson', 'NSN', 1),
(2355, 153, 'Northland', 'NTL', 1),
(2356, 153, 'Otago', 'OTA', 1),
(2357, 153, 'Southland', 'STL', 1),
(2358, 153, 'Taranaki', 'TKI', 1),
(2359, 153, 'Wellington', 'WGN', 1),
(2360, 153, 'Waikato', 'WKO', 1),
(2361, 153, 'Wairprarapa', 'WAI', 1),
(2362, 153, 'West Coast', 'WTC', 1),
(2363, 154, 'Atlantico Norte', 'AN', 1),
(2364, 154, 'Atlantico Sur', 'AS', 1),
(2365, 154, 'Boaco', 'BO', 1),
(2366, 154, 'Carazo', 'CA', 1),
(2367, 154, 'Chinandega', 'CI', 1),
(2368, 154, 'Chontales', 'CO', 1),
(2369, 154, 'Esteli', 'ES', 1),
(2370, 154, 'Granada', 'GR', 1),
(2371, 154, 'Jinotega', 'JI', 1),
(2372, 154, 'Leon', 'LE', 1),
(2373, 154, 'Madriz', 'MD', 1),
(2374, 154, 'Managua', 'MN', 1),
(2375, 154, 'Masaya', 'MS', 1),
(2376, 154, 'Matagalpa', 'MT', 1),
(2377, 154, 'Nuevo Segovia', 'NS', 1),
(2378, 154, 'Rio San Juan', 'RS', 1),
(2379, 154, 'Rivas', 'RI', 1),
(2380, 155, 'Agadez', 'AG', 1),
(2381, 155, 'Diffa', 'DF', 1),
(2382, 155, 'Dosso', 'DS', 1),
(2383, 155, 'Maradi', 'MA', 1),
(2384, 155, 'Niamey', 'NM', 1),
(2385, 155, 'Tahoua', 'TH', 1),
(2386, 155, 'Tillaberi', 'TL', 1),
(2387, 155, 'Zinder', 'ZD', 1),
(2388, 156, 'Abia', 'AB', 1),
(2389, 156, 'Abuja Federal Capital Territory', 'CT', 1),
(2390, 156, 'Adamawa', 'AD', 1),
(2391, 156, 'Akwa Ibom', 'AK', 1),
(2392, 156, 'Anambra', 'AN', 1),
(2393, 156, 'Bauchi', 'BC', 1),
(2394, 156, 'Bayelsa', 'BY', 1),
(2395, 156, 'Benue', 'BN', 1),
(2396, 156, 'Borno', 'BO', 1),
(2397, 156, 'Cross River', 'CR', 1),
(2398, 156, 'Delta', 'DE', 1),
(2399, 156, 'Ebonyi', 'EB', 1),
(2400, 156, 'Edo', 'ED', 1),
(2401, 156, 'Ekiti', 'EK', 1),
(2402, 156, 'Enugu', 'EN', 1),
(2403, 156, 'Gombe', 'GO', 1),
(2404, 156, 'Imo', 'IM', 1),
(2405, 156, 'Jigawa', 'JI', 1),
(2406, 156, 'Kaduna', 'KD', 1),
(2407, 156, 'Kano', 'KN', 1),
(2408, 156, 'Katsina', 'KT', 1),
(2409, 156, 'Kebbi', 'KE', 1),
(2410, 156, 'Kogi', 'KO', 1),
(2411, 156, 'Kwara', 'KW', 1),
(2412, 156, 'Lagos', 'LA', 1),
(2413, 156, 'Nassarawa', 'NA', 1),
(2414, 156, 'Niger', 'NI', 1),
(2415, 156, 'Ogun', 'OG', 1),
(2416, 156, 'Ondo', 'ONG', 1),
(2417, 156, 'Osun', 'OS', 1),
(2418, 156, 'Oyo', 'OY', 1),
(2419, 156, 'Plateau', 'PL', 1),
(2420, 156, 'Rivers', 'RI', 1),
(2421, 156, 'Sokoto', 'SO', 1),
(2422, 156, 'Taraba', 'TA', 1),
(2423, 156, 'Yobe', 'YO', 1),
(2424, 156, 'Zamfara', 'ZA', 1),
(2425, 159, 'Northern Islands', 'N', 1),
(2426, 159, 'Rota', 'R', 1),
(2427, 159, 'Saipan', 'S', 1),
(2428, 159, 'Tinian', 'T', 1),
(2429, 160, 'Akershus', 'AK', 1),
(2430, 160, 'Aust-Agder', 'AA', 1),
(2431, 160, 'Buskerud', 'BU', 1),
(2432, 160, 'Finnmark', 'FM', 1),
(2433, 160, 'Hedmark', 'HM', 1),
(2434, 160, 'Hordaland', 'HL', 1),
(2435, 160, 'More og Romdal', 'MR', 1),
(2436, 160, 'Nord-Trondelag', 'NT', 1),
(2437, 160, 'Nordland', 'NL', 1),
(2438, 160, 'Ostfold', 'OF', 1),
(2439, 160, 'Oppland', 'OP', 1),
(2440, 160, 'Oslo', 'OL', 1),
(2441, 160, 'Rogaland', 'RL', 1),
(2442, 160, 'Sor-Trondelag', 'ST', 1),
(2443, 160, 'Sogn og Fjordane', 'SJ', 1),
(2444, 160, 'Svalbard', 'SV', 1),
(2445, 160, 'Telemark', 'TM', 1),
(2446, 160, 'Troms', 'TR', 1),
(2447, 160, 'Vest-Agder', 'VA', 1),
(2448, 160, 'Vestfold', 'VF', 1),
(2449, 161, 'Ad Dakhiliyah', 'DA', 1),
(2450, 161, 'Al Batinah', 'BA', 1),
(2451, 161, 'Al Wusta', 'WU', 1),
(2452, 161, 'Ash Sharqiyah', 'SH', 1),
(2453, 161, 'Az Zahirah', 'ZA', 1),
(2454, 161, 'Masqat', 'MA', 1),
(2455, 161, 'Musandam', 'MU', 1),
(2456, 161, 'Zufar', 'ZU', 1),
(2457, 162, 'Balochistan', 'B', 1),
(2458, 162, 'Federally Administered Tribal Areas', 'T', 1),
(2459, 162, 'Islamabad Capital Territory', 'I', 1),
(2460, 162, 'North-West Frontier', 'N', 1),
(2461, 162, 'Punjab', 'P', 1),
(2462, 162, 'Sindh', 'S', 1),
(2463, 163, 'Aimeliik', 'AM', 1),
(2464, 163, 'Airai', 'AR', 1),
(2465, 163, 'Angaur', 'AN', 1),
(2466, 163, 'Hatohobei', 'HA', 1),
(2467, 163, 'Kayangel', 'KA', 1),
(2468, 163, 'Koror', 'KO', 1),
(2469, 163, 'Melekeok', 'ME', 1),
(2470, 163, 'Ngaraard', 'NA', 1),
(2471, 163, 'Ngarchelong', 'NG', 1),
(2472, 163, 'Ngardmau', 'ND', 1),
(2473, 163, 'Ngatpang', 'NT', 1),
(2474, 163, 'Ngchesar', 'NC', 1),
(2475, 163, 'Ngeremlengui', 'NR', 1),
(2476, 163, 'Ngiwal', 'NW', 1),
(2477, 163, 'Peleliu', 'PE', 1),
(2478, 163, 'Sonsorol', 'SO', 1),
(2479, 164, 'Bocas del Toro', 'BT', 1),
(2480, 164, 'Chiriqui', 'CH', 1),
(2481, 164, 'Cocle', 'CC', 1),
(2482, 164, 'Colon', 'CL', 1),
(2483, 164, 'Darien', 'DA', 1),
(2484, 164, 'Herrera', 'HE', 1),
(2485, 164, 'Los Santos', 'LS', 1),
(2486, 164, 'Panama', 'PA', 1),
(2487, 164, 'San Blas', 'SB', 1),
(2488, 164, 'Veraguas', 'VG', 1),
(2489, 165, 'Bougainville', 'BV', 1),
(2490, 165, 'Central', 'CE', 1),
(2491, 165, 'Chimbu', 'CH', 1),
(2492, 165, 'Eastern Highlands', 'EH', 1),
(2493, 165, 'East New Britain', 'EB', 1),
(2494, 165, 'East Sepik', 'ES', 1),
(2495, 165, 'Enga', 'EN', 1),
(2496, 165, 'Gulf', 'GU', 1),
(2497, 165, 'Madang', 'MD', 1),
(2498, 165, 'Manus', 'MN', 1),
(2499, 165, 'Milne Bay', 'MB', 1),
(2500, 165, 'Morobe', 'MR', 1),
(2501, 165, 'National Capital', 'NC', 1),
(2502, 165, 'New Ireland', 'NI', 1),
(2503, 165, 'Northern', 'NO', 1),
(2504, 165, 'Sandaun', 'SA', 1),
(2505, 165, 'Southern Highlands', 'SH', 1),
(2506, 165, 'Western', 'WE', 1),
(2507, 165, 'Western Highlands', 'WH', 1),
(2508, 165, 'West New Britain', 'WB', 1),
(2509, 166, 'Alto Paraguay', 'AG', 1),
(2510, 166, 'Alto Parana', 'AN', 1),
(2511, 166, 'Amambay', 'AM', 1),
(2512, 166, 'Asuncion', 'AS', 1),
(2513, 166, 'Boqueron', 'BO', 1),
(2514, 166, 'Caaguazu', 'CG', 1),
(2515, 166, 'Caazapa', 'CZ', 1),
(2516, 166, 'Canindeyu', 'CN', 1),
(2517, 166, 'Central', 'CE', 1),
(2518, 166, 'Concepcion', 'CC', 1),
(2519, 166, 'Cordillera', 'CD', 1),
(2520, 166, 'Guaira', 'GU', 1),
(2521, 166, 'Itapua', 'IT', 1),
(2522, 166, 'Misiones', 'MI', 1),
(2523, 166, 'Neembucu', 'NE', 1),
(2524, 166, 'Paraguari', 'PA', 1),
(2525, 166, 'Presidente Hayes', 'PH', 1),
(2526, 166, 'San Pedro', 'SP', 1),
(2527, 167, 'Amazonas', 'AM', 1),
(2528, 167, 'Ancash', 'AN', 1),
(2529, 167, 'Apurimac', 'AP', 1),
(2530, 167, 'Arequipa', 'AR', 1),
(2531, 167, 'Ayacucho', 'AY', 1),
(2532, 167, 'Cajamarca', 'CJ', 1),
(2533, 167, 'Callao', 'CL', 1),
(2534, 167, 'Cusco', 'CU', 1),
(2535, 167, 'Huancavelica', 'HV', 1),
(2536, 167, 'Huanuco', 'HO', 1),
(2537, 167, 'Ica', 'IC', 1),
(2538, 167, 'Junin', 'JU', 1),
(2539, 167, 'La Libertad', 'LD', 1),
(2540, 167, 'Lambayeque', 'LY', 1),
(2541, 167, 'Lima', 'LI', 1),
(2542, 167, 'Loreto', 'LO', 1),
(2543, 167, 'Madre de Dios', 'MD', 1),
(2544, 167, 'Moquegua', 'MO', 1),
(2545, 167, 'Pasco', 'PA', 1),
(2546, 167, 'Piura', 'PI', 1),
(2547, 167, 'Puno', 'PU', 1),
(2548, 167, 'San Martin', 'SM', 1),
(2549, 167, 'Tacna', 'TA', 1),
(2550, 167, 'Tumbes', 'TU', 1),
(2551, 167, 'Ucayali', 'UC', 1),
(2552, 168, 'Abra', 'ABR', 1),
(2553, 168, 'Agusan del Norte', 'ANO', 1),
(2554, 168, 'Agusan del Sur', 'ASU', 1),
(2555, 168, 'Aklan', 'AKL', 1),
(2556, 168, 'Albay', 'ALB', 1),
(2557, 168, 'Antique', 'ANT', 1),
(2558, 168, 'Apayao', 'APY', 1),
(2559, 168, 'Aurora', 'AUR', 1),
(2560, 168, 'Basilan', 'BAS', 1),
(2561, 168, 'Bataan', 'BTA', 1),
(2562, 168, 'Batanes', 'BTE', 1),
(2563, 168, 'Batangas', 'BTG', 1),
(2564, 168, 'Biliran', 'BLR', 1),
(2565, 168, 'Benguet', 'BEN', 1),
(2566, 168, 'Bohol', 'BOL', 1),
(2567, 168, 'Bukidnon', 'BUK', 1),
(2568, 168, 'Bulacan', 'BUL', 1),
(2569, 168, 'Cagayan', 'CAG', 1),
(2570, 168, 'Camarines Norte', 'CNO', 1),
(2571, 168, 'Camarines Sur', 'CSU', 1),
(2572, 168, 'Camiguin', 'CAM', 1),
(2573, 168, 'Capiz', 'CAP', 1),
(2574, 168, 'Catanduanes', 'CAT', 1),
(2575, 168, 'Cavite', 'CAV', 1),
(2576, 168, 'Cebu', 'CEB', 1),
(2577, 168, 'Compostela', 'CMP', 1),
(2578, 168, 'Davao del Norte', 'DNO', 1),
(2579, 168, 'Davao del Sur', 'DSU', 1),
(2580, 168, 'Davao Oriental', 'DOR', 1),
(2581, 168, 'Eastern Samar', 'ESA', 1),
(2582, 168, 'Guimaras', 'GUI', 1),
(2583, 168, 'Ifugao', 'IFU', 1),
(2584, 168, 'Ilocos Norte', 'INO', 1),
(2585, 168, 'Ilocos Sur', 'ISU', 1),
(2586, 168, 'Iloilo', 'ILO', 1),
(2587, 168, 'Isabela', 'ISA', 1),
(2588, 168, 'Kalinga', 'KAL', 1),
(2589, 168, 'Laguna', 'LAG', 1),
(2590, 168, 'Lanao del Norte', 'LNO', 1),
(2591, 168, 'Lanao del Sur', 'LSU', 1),
(2592, 168, 'La Union', 'UNI', 1),
(2593, 168, 'Leyte', 'LEY', 1),
(2594, 168, 'Maguindanao', 'MAG', 1),
(2595, 168, 'Marinduque', 'MRN', 1),
(2596, 168, 'Masbate', 'MSB', 1),
(2597, 168, 'Mindoro Occidental', 'MIC', 1),
(2598, 168, 'Mindoro Oriental', 'MIR', 1),
(2599, 168, 'Misamis Occidental', 'MSC', 1),
(2600, 168, 'Misamis Oriental', 'MOR', 1),
(2601, 168, 'Mountain', 'MOP', 1),
(2602, 168, 'Negros Occidental', 'NOC', 1),
(2603, 168, 'Negros Oriental', 'NOR', 1),
(2604, 168, 'North Cotabato', 'NCT', 1),
(2605, 168, 'Northern Samar', 'NSM', 1),
(2606, 168, 'Nueva Ecija', 'NEC', 1),
(2607, 168, 'Nueva Vizcaya', 'NVZ', 1),
(2608, 168, 'Palawan', 'PLW', 1),
(2609, 168, 'Pampanga', 'PMP', 1),
(2610, 168, 'Pangasinan', 'PNG', 1),
(2611, 168, 'Quezon', 'QZN', 1),
(2612, 168, 'Quirino', 'QRN', 1),
(2613, 168, 'Rizal', 'RIZ', 1),
(2614, 168, 'Romblon', 'ROM', 1),
(2615, 168, 'Samar', 'SMR', 1),
(2616, 168, 'Sarangani', 'SRG', 1),
(2617, 168, 'Siquijor', 'SQJ', 1),
(2618, 168, 'Sorsogon', 'SRS', 1),
(2619, 168, 'South Cotabato', 'SCO', 1),
(2620, 168, 'Southern Leyte', 'SLE', 1),
(2621, 168, 'Sultan Kudarat', 'SKU', 1),
(2622, 168, 'Sulu', 'SLU', 1),
(2623, 168, 'Surigao del Norte', 'SNO', 1),
(2624, 168, 'Surigao del Sur', 'SSU', 1),
(2625, 168, 'Tarlac', 'TAR', 1),
(2626, 168, 'Tawi-Tawi', 'TAW', 1),
(2627, 168, 'Zambales', 'ZBL', 1),
(2628, 168, 'Zamboanga del Norte', 'ZNO', 1),
(2629, 168, 'Zamboanga del Sur', 'ZSU', 1),
(2630, 168, 'Zamboanga Sibugay', 'ZSI', 1),
(2631, 170, 'Dolnoslaskie', 'DO', 1),
(2632, 170, 'Kujawsko-Pomorskie', 'KP', 1),
(2633, 170, 'Lodzkie', 'LO', 1),
(2634, 170, 'Lubelskie', 'LL', 1),
(2635, 170, 'Lubuskie', 'LU', 1),
(2636, 170, 'Malopolskie', 'ML', 1),
(2637, 170, 'Mazowieckie', 'MZ', 1),
(2638, 170, 'Opolskie', 'OP', 1),
(2639, 170, 'Podkarpackie', 'PP', 1),
(2640, 170, 'Podlaskie', 'PL', 1),
(2641, 170, 'Pomorskie', 'PM', 1),
(2642, 170, 'Slaskie', 'SL', 1),
(2643, 170, 'Swietokrzyskie', 'SW', 1),
(2644, 170, 'Warminsko-Mazurskie', 'WM', 1),
(2645, 170, 'Wielkopolskie', 'WP', 1),
(2646, 170, 'Zachodniopomorskie', 'ZA', 1),
(2647, 198, 'Saint Pierre', 'P', 1),
(2648, 198, 'Miquelon', 'M', 1),
(2649, 171, 'A&ccedil;ores', 'AC', 1),
(2650, 171, 'Aveiro', 'AV', 1),
(2651, 171, 'Beja', 'BE', 1),
(2652, 171, 'Braga', 'BR', 1),
(2653, 171, 'Bragan&ccedil;a', 'BA', 1),
(2654, 171, 'Castelo Branco', 'CB', 1),
(2655, 171, 'Coimbra', 'CO', 1),
(2656, 171, '&Eacute;vora', 'EV', 1),
(2657, 171, 'Faro', 'FA', 1),
(2658, 171, 'Guarda', 'GU', 1),
(2659, 171, 'Leiria', 'LE', 1),
(2660, 171, 'Lisboa', 'LI', 1),
(2661, 171, 'Madeira', 'ME', 1),
(2662, 171, 'Portalegre', 'PO', 1),
(2663, 171, 'Porto', 'PR', 1),
(2664, 171, 'Santar&eacute;m', 'SA', 1),
(2665, 171, 'Set&uacute;bal', 'SE', 1),
(2666, 171, 'Viana do Castelo', 'VC', 1),
(2667, 171, 'Vila Real', 'VR', 1),
(2668, 171, 'Viseu', 'VI', 1),
(2669, 173, 'Ad Dawhah', 'DW', 1),
(2670, 173, 'Al Ghuwayriyah', 'GW', 1),
(2671, 173, 'Al Jumayliyah', 'JM', 1),
(2672, 173, 'Al Khawr', 'KR', 1),
(2673, 173, 'Al Wakrah', 'WK', 1),
(2674, 173, 'Ar Rayyan', 'RN', 1),
(2675, 173, 'Jarayan al Batinah', 'JB', 1),
(2676, 173, 'Madinat ash Shamal', 'MS', 1),
(2677, 173, 'Umm Sa''id', 'UD', 1),
(2678, 173, 'Umm Salal', 'UL', 1),
(2679, 175, 'Alba', 'AB', 1),
(2680, 175, 'Arad', 'AR', 1),
(2681, 175, 'Arges', 'AG', 1),
(2682, 175, 'Bacau', 'BC', 1),
(2683, 175, 'Bihor', 'BH', 1),
(2684, 175, 'Bistrita-Nasaud', 'BN', 1),
(2685, 175, 'Botosani', 'BT', 1),
(2686, 175, 'Brasov', 'BV', 1),
(2687, 175, 'Braila', 'BR', 1),
(2688, 175, 'Bucuresti', 'B', 1),
(2689, 175, 'Buzau', 'BZ', 1),
(2690, 175, 'Caras-Severin', 'CS', 1),
(2691, 175, 'Calarasi', 'CL', 1),
(2692, 175, 'Cluj', 'CJ', 1),
(2693, 175, 'Constanta', 'CT', 1),
(2694, 175, 'Covasna', 'CV', 1),
(2695, 175, 'Dimbovita', 'DB', 1),
(2696, 175, 'Dolj', 'DJ', 1),
(2697, 175, 'Galati', 'GL', 1),
(2698, 175, 'Giurgiu', 'GR', 1),
(2699, 175, 'Gorj', 'GJ', 1),
(2700, 175, 'Harghita', 'HR', 1),
(2701, 175, 'Hunedoara', 'HD', 1),
(2702, 175, 'Ialomita', 'IL', 1),
(2703, 175, 'Iasi', 'IS', 1),
(2704, 175, 'Ilfov', 'IF', 1),
(2705, 175, 'Maramures', 'MM', 1),
(2706, 175, 'Mehedinti', 'MH', 1),
(2707, 175, 'Mures', 'MS', 1),
(2708, 175, 'Neamt', 'NT', 1),
(2709, 175, 'Olt', 'OT', 1),
(2710, 175, 'Prahova', 'PH', 1),
(2711, 175, 'Satu-Mare', 'SM', 1),
(2712, 175, 'Salaj', 'SJ', 1),
(2713, 175, 'Sibiu', 'SB', 1),
(2714, 175, 'Suceava', 'SV', 1),
(2715, 175, 'Teleorman', 'TR', 1),
(2716, 175, 'Timis', 'TM', 1),
(2717, 175, 'Tulcea', 'TL', 1),
(2718, 175, 'Vaslui', 'VS', 1),
(2719, 175, 'Valcea', 'VL', 1),
(2720, 175, 'Vrancea', 'VN', 1),
(2721, 176, 'Abakan', 'AB', 1),
(2722, 176, 'Aginskoye', 'AG', 1),
(2723, 176, 'Anadyr', 'AN', 1),
(2724, 176, 'Arkahangelsk', 'AR', 1),
(2725, 176, 'Astrakhan', 'AS', 1),
(2726, 176, 'Barnaul', 'BA', 1),
(2727, 176, 'Belgorod', 'BE', 1),
(2728, 176, 'Birobidzhan', 'BI', 1),
(2729, 176, 'Blagoveshchensk', 'BL', 1),
(2730, 176, 'Bryansk', 'BR', 1),
(2731, 176, 'Cheboksary', 'CH', 1),
(2732, 176, 'Chelyabinsk', 'CL', 1),
(2733, 176, 'Cherkessk', 'CR', 1),
(2734, 176, 'Chita', 'CI', 1),
(2735, 176, 'Dudinka', 'DU', 1),
(2736, 176, 'Elista', 'EL', 1),
(2737, 176, 'Gomo-Altaysk', 'GO', 1),
(2738, 176, 'Gorno-Altaysk', 'GA', 1),
(2739, 176, 'Groznyy', 'GR', 1),
(2740, 176, 'Irkutsk', 'IR', 1),
(2741, 176, 'Ivanovo', 'IV', 1),
(2742, 176, 'Izhevsk', 'IZ', 1),
(2743, 176, 'Kalinigrad', 'KA', 1),
(2744, 176, 'Kaluga', 'KL', 1),
(2745, 176, 'Kasnodar', 'KS', 1),
(2746, 176, 'Kazan', 'KZ', 1),
(2747, 176, 'Kemerovo', 'KE', 1),
(2748, 176, 'Khabarovsk', 'KH', 1),
(2749, 176, 'Khanty-Mansiysk', 'KM', 1),
(2750, 176, 'Kostroma', 'KO', 1),
(2751, 176, 'Krasnodar', 'KR', 1),
(2752, 176, 'Krasnoyarsk', 'KN', 1),
(2753, 176, 'Kudymkar', 'KU', 1),
(2754, 176, 'Kurgan', 'KG', 1),
(2755, 176, 'Kursk', 'KK', 1),
(2756, 176, 'Kyzyl', 'KY', 1),
(2757, 176, 'Lipetsk', 'LI', 1),
(2758, 176, 'Magadan', 'MA', 1),
(2759, 176, 'Makhachkala', 'MK', 1),
(2760, 176, 'Maykop', 'MY', 1),
(2761, 176, 'Moscow', 'MO', 1),
(2762, 176, 'Murmansk', 'MU', 1),
(2763, 176, 'Nalchik', 'NA', 1),
(2764, 176, 'Naryan Mar', 'NR', 1),
(2765, 176, 'Nazran', 'NZ', 1),
(2766, 176, 'Nizhniy Novgorod', 'NI', 1),
(2767, 176, 'Novgorod', 'NO', 1),
(2768, 176, 'Novosibirsk', 'NV', 1),
(2769, 176, 'Omsk', 'OM', 1),
(2770, 176, 'Orel', 'OR', 1),
(2771, 176, 'Orenburg', 'OE', 1),
(2772, 176, 'Palana', 'PA', 1),
(2773, 176, 'Penza', 'PE', 1),
(2774, 176, 'Perm', 'PR', 1),
(2775, 176, 'Petropavlovsk-Kamchatskiy', 'PK', 1),
(2776, 176, 'Petrozavodsk', 'PT', 1),
(2777, 176, 'Pskov', 'PS', 1),
(2778, 176, 'Rostov-na-Donu', 'RO', 1),
(2779, 176, 'Ryazan', 'RY', 1),
(2780, 176, 'Salekhard', 'SL', 1),
(2781, 176, 'Samara', 'SA', 1),
(2782, 176, 'Saransk', 'SR', 1),
(2783, 176, 'Saratov', 'SV', 1),
(2784, 176, 'Smolensk', 'SM', 1),
(2785, 176, 'St. Petersburg', 'SP', 1),
(2786, 176, 'Stavropol', 'ST', 1),
(2787, 176, 'Syktyvkar', 'SY', 1),
(2788, 176, 'Tambov', 'TA', 1),
(2789, 176, 'Tomsk', 'TO', 1),
(2790, 176, 'Tula', 'TU', 1),
(2791, 176, 'Tura', 'TR', 1),
(2792, 176, 'Tver', 'TV', 1),
(2793, 176, 'Tyumen', 'TY', 1),
(2794, 176, 'Ufa', 'UF', 1),
(2795, 176, 'Ul''yanovsk', 'UL', 1),
(2796, 176, 'Ulan-Ude', 'UU', 1),
(2797, 176, 'Ust''-Ordynskiy', 'US', 1),
(2798, 176, 'Vladikavkaz', 'VL', 1),
(2799, 176, 'Vladimir', 'VA', 1),
(2800, 176, 'Vladivostok', 'VV', 1),
(2801, 176, 'Volgograd', 'VG', 1),
(2802, 176, 'Vologda', 'VD', 1),
(2803, 176, 'Voronezh', 'VO', 1),
(2804, 176, 'Vyatka', 'VY', 1),
(2805, 176, 'Yakutsk', 'YA', 1),
(2806, 176, 'Yaroslavl', 'YR', 1),
(2807, 176, 'Yekaterinburg', 'YE', 1),
(2808, 176, 'Yoshkar-Ola', 'YO', 1),
(2809, 177, 'Butare', 'BU', 1),
(2810, 177, 'Byumba', 'BY', 1),
(2811, 177, 'Cyangugu', 'CY', 1),
(2812, 177, 'Gikongoro', 'GK', 1),
(2813, 177, 'Gisenyi', 'GS', 1),
(2814, 177, 'Gitarama', 'GT', 1),
(2815, 177, 'Kibungo', 'KG', 1),
(2816, 177, 'Kibuye', 'KY', 1),
(2817, 177, 'Kigali Rurale', 'KR', 1),
(2818, 177, 'Kigali-ville', 'KV', 1),
(2819, 177, 'Ruhengeri', 'RU', 1),
(2820, 177, 'Umutara', 'UM', 1),
(2821, 178, 'Christ Church Nichola Town', 'CCN', 1),
(2822, 178, 'Saint Anne Sandy Point', 'SAS', 1),
(2823, 178, 'Saint George Basseterre', 'SGB', 1),
(2824, 178, 'Saint George Gingerland', 'SGG', 1),
(2825, 178, 'Saint James Windward', 'SJW', 1),
(2826, 178, 'Saint John Capesterre', 'SJC', 1),
(2827, 178, 'Saint John Figtree', 'SJF', 1),
(2828, 178, 'Saint Mary Cayon', 'SMC', 1),
(2829, 178, 'Saint Paul Capesterre', 'CAP', 1),
(2830, 178, 'Saint Paul Charlestown', 'CHA', 1),
(2831, 178, 'Saint Peter Basseterre', 'SPB', 1),
(2832, 178, 'Saint Thomas Lowland', 'STL', 1),
(2833, 178, 'Saint Thomas Middle Island', 'STM', 1),
(2834, 178, 'Trinity Palmetto Point', 'TPP', 1),
(2835, 179, 'Anse-la-Raye', 'AR', 1),
(2836, 179, 'Castries', 'CA', 1),
(2837, 179, 'Choiseul', 'CH', 1),
(2838, 179, 'Dauphin', 'DA', 1),
(2839, 179, 'Dennery', 'DE', 1),
(2840, 179, 'Gros-Islet', 'GI', 1),
(2841, 179, 'Laborie', 'LA', 1),
(2842, 179, 'Micoud', 'MI', 1),
(2843, 179, 'Praslin', 'PR', 1),
(2844, 179, 'Soufriere', 'SO', 1),
(2845, 179, 'Vieux-Fort', 'VF', 1),
(2846, 180, 'Charlotte', 'C', 1),
(2847, 180, 'Grenadines', 'R', 1),
(2848, 180, 'Saint Andrew', 'A', 1),
(2849, 180, 'Saint David', 'D', 1),
(2850, 180, 'Saint George', 'G', 1),
(2851, 180, 'Saint Patrick', 'P', 1),
(2852, 181, 'A''ana', 'AN', 1),
(2853, 181, 'Aiga-i-le-Tai', 'AI', 1),
(2854, 181, 'Atua', 'AT', 1),
(2855, 181, 'Fa''asaleleaga', 'FA', 1),
(2856, 181, 'Gaga''emauga', 'GE', 1),
(2857, 181, 'Gagaifomauga', 'GF', 1),
(2858, 181, 'Palauli', 'PA', 1),
(2859, 181, 'Satupa''itea', 'SA', 1),
(2860, 181, 'Tuamasaga', 'TU', 1),
(2861, 181, 'Va''a-o-Fonoti', 'VF', 1),
(2862, 181, 'Vaisigano', 'VS', 1),
(2863, 182, 'Acquaviva', 'AC', 1),
(2864, 182, 'Borgo Maggiore', 'BM', 1),
(2865, 182, 'Chiesanuova', 'CH', 1),
(2866, 182, 'Domagnano', 'DO', 1),
(2867, 182, 'Faetano', 'FA', 1),
(2868, 182, 'Fiorentino', 'FI', 1),
(2869, 182, 'Montegiardino', 'MO', 1),
(2870, 182, 'Citta di San Marino', 'SM', 1),
(2871, 182, 'Serravalle', 'SE', 1),
(2872, 183, 'Sao Tome', 'S', 1),
(2873, 183, 'Principe', 'P', 1),
(2874, 184, 'Al Bahah', 'BH', 1),
(2875, 184, 'Al Hudud ash Shamaliyah', 'HS', 1),
(2876, 184, 'Al Jawf', 'JF', 1),
(2877, 184, 'Al Madinah', 'MD', 1),
(2878, 184, 'Al Qasim', 'QS', 1),
(2879, 184, 'Ar Riyad', 'RD', 1),
(2880, 184, 'Ash Sharqiyah (Eastern)', 'AQ', 1),
(2881, 184, '''Asir', 'AS', 1),
(2882, 184, 'Ha''il', 'HL', 1),
(2883, 184, 'Jizan', 'JZ', 1),
(2884, 184, 'Makkah', 'ML', 1),
(2885, 184, 'Najran', 'NR', 1),
(2886, 184, 'Tabuk', 'TB', 1),
(2887, 185, 'Dakar', 'DA', 1),
(2888, 185, 'Diourbel', 'DI', 1),
(2889, 185, 'Fatick', 'FA', 1),
(2890, 185, 'Kaolack', 'KA', 1),
(2891, 185, 'Kolda', 'KO', 1),
(2892, 185, 'Louga', 'LO', 1),
(2893, 185, 'Matam', 'MA', 1),
(2894, 185, 'Saint-Louis', 'SL', 1),
(2895, 185, 'Tambacounda', 'TA', 1),
(2896, 185, 'Thies', 'TH', 1),
(2897, 185, 'Ziguinchor', 'ZI', 1),
(2898, 186, 'Anse aux Pins', 'AP', 1),
(2899, 186, 'Anse Boileau', 'AB', 1),
(2900, 186, 'Anse Etoile', 'AE', 1),
(2901, 186, 'Anse Louis', 'AL', 1),
(2902, 186, 'Anse Royale', 'AR', 1),
(2903, 186, 'Baie Lazare', 'BL', 1),
(2904, 186, 'Baie Sainte Anne', 'BS', 1),
(2905, 186, 'Beau Vallon', 'BV', 1),
(2906, 186, 'Bel Air', 'BA', 1),
(2907, 186, 'Bel Ombre', 'BO', 1),
(2908, 186, 'Cascade', 'CA', 1),
(2909, 186, 'Glacis', 'GL', 1),
(2910, 186, 'Grand'' Anse (on Mahe)', 'GM', 1),
(2911, 186, 'Grand'' Anse (on Praslin)', 'GP', 1),
(2912, 186, 'La Digue', 'DG', 1),
(2913, 186, 'La Riviere Anglaise', 'RA', 1),
(2914, 186, 'Mont Buxton', 'MB', 1),
(2915, 186, 'Mont Fleuri', 'MF', 1),
(2916, 186, 'Plaisance', 'PL', 1),
(2917, 186, 'Pointe La Rue', 'PR', 1),
(2918, 186, 'Port Glaud', 'PG', 1),
(2919, 186, 'Saint Louis', 'SL', 1),
(2920, 186, 'Takamaka', 'TA', 1),
(2921, 187, 'Eastern', 'E', 1),
(2922, 187, 'Northern', 'N', 1),
(2923, 187, 'Southern', 'S', 1),
(2924, 187, 'Western', 'W', 1),
(2925, 189, 'Banskobystrický', 'BA', 1),
(2926, 189, 'Bratislavský', 'BR', 1),
(2927, 189, 'Košický', 'KO', 1),
(2928, 189, 'Nitriansky', 'NI', 1),
(2929, 189, 'Prešovský', 'PR', 1),
(2930, 189, 'Trenčiansky', 'TC', 1),
(2931, 189, 'Trnavský', 'TV', 1),
(2932, 189, 'Žilinský', 'ZI', 1),
(2933, 191, 'Central', 'CE', 1),
(2934, 191, 'Choiseul', 'CH', 1),
(2935, 191, 'Guadalcanal', 'GC', 1),
(2936, 191, 'Honiara', 'HO', 1),
(2937, 191, 'Isabel', 'IS', 1),
(2938, 191, 'Makira', 'MK', 1),
(2939, 191, 'Malaita', 'ML', 1),
(2940, 191, 'Rennell and Bellona', 'RB', 1),
(2941, 191, 'Temotu', 'TM', 1),
(2942, 191, 'Western', 'WE', 1),
(2943, 192, 'Awdal', 'AW', 1),
(2944, 192, 'Bakool', 'BK', 1),
(2945, 192, 'Banaadir', 'BN', 1),
(2946, 192, 'Bari', 'BR', 1),
(2947, 192, 'Bay', 'BY', 1),
(2948, 192, 'Galguduud', 'GA', 1),
(2949, 192, 'Gedo', 'GE', 1),
(2950, 192, 'Hiiraan', 'HI', 1),
(2951, 192, 'Jubbada Dhexe', 'JD', 1),
(2952, 192, 'Jubbada Hoose', 'JH', 1),
(2953, 192, 'Mudug', 'MU', 1),
(2954, 192, 'Nugaal', 'NU', 1),
(2955, 192, 'Sanaag', 'SA', 1),
(2956, 192, 'Shabeellaha Dhexe', 'SD', 1),
(2957, 192, 'Shabeellaha Hoose', 'SH', 1),
(2958, 192, 'Sool', 'SL', 1),
(2959, 192, 'Togdheer', 'TO', 1),
(2960, 192, 'Woqooyi Galbeed', 'WG', 1),
(2961, 193, 'Eastern Cape', 'EC', 1),
(2962, 193, 'Free State', 'FS', 1),
(2963, 193, 'Gauteng', 'GT', 1),
(2964, 193, 'KwaZulu-Natal', 'KN', 1),
(2965, 193, 'Limpopo', 'LP', 1),
(2966, 193, 'Mpumalanga', 'MP', 1),
(2967, 193, 'North West', 'NW', 1),
(2968, 193, 'Northern Cape', 'NC', 1),
(2969, 193, 'Western Cape', 'WC', 1),
(2970, 195, 'La Coru&ntilde;a', 'CA', 1),
(2971, 195, '&Aacute;lava', 'AL', 1),
(2972, 195, 'Albacete', 'AB', 1),
(2973, 195, 'Alicante', 'AC', 1),
(2974, 195, 'Almeria', 'AM', 1),
(2975, 195, 'Asturias', 'AS', 1),
(2976, 195, '&Aacute;vila', 'AV', 1),
(2977, 195, 'Badajoz', 'BJ', 1),
(2978, 195, 'Baleares', 'IB', 1),
(2979, 195, 'Barcelona', 'BA', 1),
(2980, 195, 'Burgos', 'BU', 1),
(2981, 195, 'C&aacute;ceres', 'CC', 1),
(2982, 195, 'C&aacute;diz', 'CZ', 1),
(2983, 195, 'Cantabria', 'CT', 1),
(2984, 195, 'Castell&oacute;n', 'CL', 1),
(2985, 195, 'Ceuta', 'CE', 1),
(2986, 195, 'Ciudad Real', 'CR', 1),
(2987, 195, 'C&oacute;rdoba', 'CD', 1),
(2988, 195, 'Cuenca', 'CU', 1),
(2989, 195, 'Girona', 'GI', 1),
(2990, 195, 'Granada', 'GD', 1),
(2991, 195, 'Guadalajara', 'GJ', 1),
(2992, 195, 'Guip&uacute;zcoa', 'GP', 1),
(2993, 195, 'Huelva', 'HL', 1),
(2994, 195, 'Huesca', 'HS', 1),
(2995, 195, 'Ja&eacute;n', 'JN', 1),
(2996, 195, 'La Rioja', 'RJ', 1),
(2997, 195, 'Las Palmas', 'PM', 1),
(2998, 195, 'Leon', 'LE', 1),
(2999, 195, 'Lleida', 'LL', 1),
(3000, 195, 'Lugo', 'LG', 1),
(3001, 195, 'Madrid', 'MD', 1),
(3002, 195, 'Malaga', 'MA', 1),
(3003, 195, 'Melilla', 'ML', 1),
(3004, 195, 'Murcia', 'MU', 1),
(3005, 195, 'Navarra', 'NV', 1),
(3006, 195, 'Ourense', 'OU', 1),
(3007, 195, 'Palencia', 'PL', 1),
(3008, 195, 'Pontevedra', 'PO', 1),
(3009, 195, 'Salamanca', 'SL', 1),
(3010, 195, 'Santa Cruz de Tenerife', 'SC', 1),
(3011, 195, 'Segovia', 'SG', 1),
(3012, 195, 'Sevilla', 'SV', 1),
(3013, 195, 'Soria', 'SO', 1),
(3014, 195, 'Tarragona', 'TA', 1),
(3015, 195, 'Teruel', 'TE', 1),
(3016, 195, 'Toledo', 'TO', 1),
(3017, 195, 'Valencia', 'VC', 1),
(3018, 195, 'Valladolid', 'VD', 1),
(3019, 195, 'Vizcaya', 'VZ', 1),
(3020, 195, 'Zamora', 'ZM', 1),
(3021, 195, 'Zaragoza', 'ZR', 1),
(3022, 196, 'Central', 'CE', 1),
(3023, 196, 'Eastern', 'EA', 1),
(3024, 196, 'North Central', 'NC', 1),
(3025, 196, 'Northern', 'NO', 1),
(3026, 196, 'North Western', 'NW', 1),
(3027, 196, 'Sabaragamuwa', 'SA', 1),
(3028, 196, 'Southern', 'SO', 1),
(3029, 196, 'Uva', 'UV', 1),
(3030, 196, 'Western', 'WE', 1),
(3031, 197, 'Ascension', 'A', 1),
(3032, 197, 'Saint Helena', 'S', 1),
(3033, 197, 'Tristan da Cunha', 'T', 1),
(3034, 199, 'A''ali an Nil', 'ANL', 1),
(3035, 199, 'Al Bahr al Ahmar', 'BAM', 1),
(3036, 199, 'Al Buhayrat', 'BRT', 1),
(3037, 199, 'Al Jazirah', 'JZR', 1),
(3038, 199, 'Al Khartum', 'KRT', 1);
INSERT INTO `zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(3039, 199, 'Al Qadarif', 'QDR', 1),
(3040, 199, 'Al Wahdah', 'WDH', 1),
(3041, 199, 'An Nil al Abyad', 'ANB', 1),
(3042, 199, 'An Nil al Azraq', 'ANZ', 1),
(3043, 199, 'Ash Shamaliyah', 'ASH', 1),
(3044, 199, 'Bahr al Jabal', 'BJA', 1),
(3045, 199, 'Gharb al Istiwa''iyah', 'GIS', 1),
(3046, 199, 'Gharb Bahr al Ghazal', 'GBG', 1),
(3047, 199, 'Gharb Darfur', 'GDA', 1),
(3048, 199, 'Gharb Kurdufan', 'GKU', 1),
(3049, 199, 'Janub Darfur', 'JDA', 1),
(3050, 199, 'Janub Kurdufan', 'JKU', 1),
(3051, 199, 'Junqali', 'JQL', 1),
(3052, 199, 'Kassala', 'KSL', 1),
(3053, 199, 'Nahr an Nil', 'NNL', 1),
(3054, 199, 'Shamal Bahr al Ghazal', 'SBG', 1),
(3055, 199, 'Shamal Darfur', 'SDA', 1),
(3056, 199, 'Shamal Kurdufan', 'SKU', 1),
(3057, 199, 'Sharq al Istiwa''iyah', 'SIS', 1),
(3058, 199, 'Sinnar', 'SNR', 1),
(3059, 199, 'Warab', 'WRB', 1),
(3060, 200, 'Brokopondo', 'BR', 1),
(3061, 200, 'Commewijne', 'CM', 1),
(3062, 200, 'Coronie', 'CR', 1),
(3063, 200, 'Marowijne', 'MA', 1),
(3064, 200, 'Nickerie', 'NI', 1),
(3065, 200, 'Para', 'PA', 1),
(3066, 200, 'Paramaribo', 'PM', 1),
(3067, 200, 'Saramacca', 'SA', 1),
(3068, 200, 'Sipaliwini', 'SI', 1),
(3069, 200, 'Wanica', 'WA', 1),
(3070, 202, 'Hhohho', 'H', 1),
(3071, 202, 'Lubombo', 'L', 1),
(3072, 202, 'Manzini', 'M', 1),
(3073, 202, 'Shishelweni', 'S', 1),
(3074, 203, 'Blekinge', 'K', 1),
(3075, 203, 'Dalarna', 'W', 1),
(3076, 203, 'G&auml;vleborg', 'X', 1),
(3077, 203, 'Gotland', 'I', 1),
(3078, 203, 'Halland', 'N', 1),
(3079, 203, 'J&auml;mtland', 'Z', 1),
(3080, 203, 'J&ouml;nk&ouml;ping', 'F', 1),
(3081, 203, 'Kalmar', 'H', 1),
(3082, 203, 'Kronoberg', 'G', 1),
(3083, 203, 'Norrbotten', 'BD', 1),
(3084, 203, '&Ouml;rebro', 'T', 1),
(3085, 203, '&Ouml;sterg&ouml;tland', 'E', 1),
(3086, 203, 'Sk&aring;ne', 'M', 1),
(3087, 203, 'S&ouml;dermanland', 'D', 1),
(3088, 203, 'Stockholm', 'AB', 1),
(3089, 203, 'Uppsala', 'C', 1),
(3090, 203, 'V&auml;rmland', 'S', 1),
(3091, 203, 'V&auml;sterbotten', 'AC', 1),
(3092, 203, 'V&auml;sternorrland', 'Y', 1),
(3093, 203, 'V&auml;stmanland', 'U', 1),
(3094, 203, 'V&auml;stra G&ouml;taland', 'O', 1),
(3095, 204, 'Aargau', 'AG', 1),
(3096, 204, 'Appenzell Ausserrhoden', 'AR', 1),
(3097, 204, 'Appenzell Innerrhoden', 'AI', 1),
(3098, 204, 'Basel-Stadt', 'BS', 1),
(3099, 204, 'Basel-Landschaft', 'BL', 1),
(3100, 204, 'Bern', 'BE', 1),
(3101, 204, 'Fribourg', 'FR', 1),
(3102, 204, 'Gen&egrave;ve', 'GE', 1),
(3103, 204, 'Glarus', 'GL', 1),
(3104, 204, 'Graub&uuml;nden', 'GR', 1),
(3105, 204, 'Jura', 'JU', 1),
(3106, 204, 'Luzern', 'LU', 1),
(3107, 204, 'Neuch&acirc;tel', 'NE', 1),
(3108, 204, 'Nidwald', 'NW', 1),
(3109, 204, 'Obwald', 'OW', 1),
(3110, 204, 'St. Gallen', 'SG', 1),
(3111, 204, 'Schaffhausen', 'SH', 1),
(3112, 204, 'Schwyz', 'SZ', 1),
(3113, 204, 'Solothurn', 'SO', 1),
(3114, 204, 'Thurgau', 'TG', 1),
(3115, 204, 'Ticino', 'TI', 1),
(3116, 204, 'Uri', 'UR', 1),
(3117, 204, 'Valais', 'VS', 1),
(3118, 204, 'Vaud', 'VD', 1),
(3119, 204, 'Zug', 'ZG', 1),
(3120, 204, 'Z&uuml;rich', 'ZH', 1),
(3121, 205, 'Al Hasakah', 'HA', 1),
(3122, 205, 'Al Ladhiqiyah', 'LA', 1),
(3123, 205, 'Al Qunaytirah', 'QU', 1),
(3124, 205, 'Ar Raqqah', 'RQ', 1),
(3125, 205, 'As Suwayda', 'SU', 1),
(3126, 205, 'Dara', 'DA', 1),
(3127, 205, 'Dayr az Zawr', 'DZ', 1),
(3128, 205, 'Dimashq', 'DI', 1),
(3129, 205, 'Halab', 'HL', 1),
(3130, 205, 'Hamah', 'HM', 1),
(3131, 205, 'Hims', 'HI', 1),
(3132, 205, 'Idlib', 'ID', 1),
(3133, 205, 'Rif Dimashq', 'RD', 1),
(3134, 205, 'Tartus', 'TA', 1),
(3135, 206, 'Chang-hua', 'CH', 1),
(3136, 206, 'Chia-i', 'CI', 1),
(3137, 206, 'Hsin-chu', 'HS', 1),
(3138, 206, 'Hua-lien', 'HL', 1),
(3139, 206, 'I-lan', 'IL', 1),
(3140, 206, 'Kao-hsiung county', 'KH', 1),
(3141, 206, 'Kin-men', 'KM', 1),
(3142, 206, 'Lien-chiang', 'LC', 1),
(3143, 206, 'Miao-li', 'ML', 1),
(3144, 206, 'Nan-t''ou', 'NT', 1),
(3145, 206, 'P''eng-hu', 'PH', 1),
(3146, 206, 'P''ing-tung', 'PT', 1),
(3147, 206, 'T''ai-chung', 'TG', 1),
(3148, 206, 'T''ai-nan', 'TA', 1),
(3149, 206, 'T''ai-pei county', 'TP', 1),
(3150, 206, 'T''ai-tung', 'TT', 1),
(3151, 206, 'T''ao-yuan', 'TY', 1),
(3152, 206, 'Yun-lin', 'YL', 1),
(3153, 206, 'Chia-i city', 'CC', 1),
(3154, 206, 'Chi-lung', 'CL', 1),
(3155, 206, 'Hsin-chu', 'HC', 1),
(3156, 206, 'T''ai-chung', 'TH', 1),
(3157, 206, 'T''ai-nan', 'TN', 1),
(3158, 206, 'Kao-hsiung city', 'KC', 1),
(3159, 206, 'T''ai-pei city', 'TC', 1),
(3160, 207, 'Gorno-Badakhstan', 'GB', 1),
(3161, 207, 'Khatlon', 'KT', 1),
(3162, 207, 'Sughd', 'SU', 1),
(3163, 208, 'Arusha', 'AR', 1),
(3164, 208, 'Dar es Salaam', 'DS', 1),
(3165, 208, 'Dodoma', 'DO', 1),
(3166, 208, 'Iringa', 'IR', 1),
(3167, 208, 'Kagera', 'KA', 1),
(3168, 208, 'Kigoma', 'KI', 1),
(3169, 208, 'Kilimanjaro', 'KJ', 1),
(3170, 208, 'Lindi', 'LN', 1),
(3171, 208, 'Manyara', 'MY', 1),
(3172, 208, 'Mara', 'MR', 1),
(3173, 208, 'Mbeya', 'MB', 1),
(3174, 208, 'Morogoro', 'MO', 1),
(3175, 208, 'Mtwara', 'MT', 1),
(3176, 208, 'Mwanza', 'MW', 1),
(3177, 208, 'Pemba North', 'PN', 1),
(3178, 208, 'Pemba South', 'PS', 1),
(3179, 208, 'Pwani', 'PW', 1),
(3180, 208, 'Rukwa', 'RK', 1),
(3181, 208, 'Ruvuma', 'RV', 1),
(3182, 208, 'Shinyanga', 'SH', 1),
(3183, 208, 'Singida', 'SI', 1),
(3184, 208, 'Tabora', 'TB', 1),
(3185, 208, 'Tanga', 'TN', 1),
(3186, 208, 'Zanzibar Central/South', 'ZC', 1),
(3187, 208, 'Zanzibar North', 'ZN', 1),
(3188, 208, 'Zanzibar Urban/West', 'ZU', 1),
(3189, 209, 'Amnat Charoen', 'Amnat Charoen', 1),
(3190, 209, 'Ang Thong', 'Ang Thong', 1),
(3191, 209, 'Ayutthaya', 'Ayutthaya', 1),
(3192, 209, 'Bangkok', 'Bangkok', 1),
(3193, 209, 'Buriram', 'Buriram', 1),
(3194, 209, 'Chachoengsao', 'Chachoengsao', 1),
(3195, 209, 'Chai Nat', 'Chai Nat', 1),
(3196, 209, 'Chaiyaphum', 'Chaiyaphum', 1),
(3197, 209, 'Chanthaburi', 'Chanthaburi', 1),
(3198, 209, 'Chiang Mai', 'Chiang Mai', 1),
(3199, 209, 'Chiang Rai', 'Chiang Rai', 1),
(3200, 209, 'Chon Buri', 'Chon Buri', 1),
(3201, 209, 'Chumphon', 'Chumphon', 1),
(3202, 209, 'Kalasin', 'Kalasin', 1),
(3203, 209, 'Kamphaeng Phet', 'Kamphaeng Phet', 1),
(3204, 209, 'Kanchanaburi', 'Kanchanaburi', 1),
(3205, 209, 'Khon Kaen', 'Khon Kaen', 1),
(3206, 209, 'Krabi', 'Krabi', 1),
(3207, 209, 'Lampang', 'Lampang', 1),
(3208, 209, 'Lamphun', 'Lamphun', 1),
(3209, 209, 'Loei', 'Loei', 1),
(3210, 209, 'Lop Buri', 'Lop Buri', 1),
(3211, 209, 'Mae Hong Son', 'Mae Hong Son', 1),
(3212, 209, 'Maha Sarakham', 'Maha Sarakham', 1),
(3213, 209, 'Mukdahan', 'Mukdahan', 1),
(3214, 209, 'Nakhon Nayok', 'Nakhon Nayok', 1),
(3215, 209, 'Nakhon Pathom', 'Nakhon Pathom', 1),
(3216, 209, 'Nakhon Phanom', 'Nakhon Phanom', 1),
(3217, 209, 'Nakhon Ratchasima', 'Nakhon Ratchasima', 1),
(3218, 209, 'Nakhon Sawan', 'Nakhon Sawan', 1),
(3219, 209, 'Nakhon Si Thammarat', 'Nakhon Si Thammarat', 1),
(3220, 209, 'Nan', 'Nan', 1),
(3221, 209, 'Narathiwat', 'Narathiwat', 1),
(3222, 209, 'Nong Bua Lamphu', 'Nong Bua Lamphu', 1),
(3223, 209, 'Nong Khai', 'Nong Khai', 1),
(3224, 209, 'Nonthaburi', 'Nonthaburi', 1),
(3225, 209, 'Pathum Thani', 'Pathum Thani', 1),
(3226, 209, 'Pattani', 'Pattani', 1),
(3227, 209, 'Phangnga', 'Phangnga', 1),
(3228, 209, 'Phatthalung', 'Phatthalung', 1),
(3229, 209, 'Phayao', 'Phayao', 1),
(3230, 209, 'Phetchabun', 'Phetchabun', 1),
(3231, 209, 'Phetchaburi', 'Phetchaburi', 1),
(3232, 209, 'Phichit', 'Phichit', 1),
(3233, 209, 'Phitsanulok', 'Phitsanulok', 1),
(3234, 209, 'Phrae', 'Phrae', 1),
(3235, 209, 'Phuket', 'Phuket', 1),
(3236, 209, 'Prachin Buri', 'Prachin Buri', 1),
(3237, 209, 'Prachuap Khiri Khan', 'Prachuap Khiri Khan', 1),
(3238, 209, 'Ranong', 'Ranong', 1),
(3239, 209, 'Ratchaburi', 'Ratchaburi', 1),
(3240, 209, 'Rayong', 'Rayong', 1),
(3241, 209, 'Roi Et', 'Roi Et', 1),
(3242, 209, 'Sa Kaeo', 'Sa Kaeo', 1),
(3243, 209, 'Sakon Nakhon', 'Sakon Nakhon', 1),
(3244, 209, 'Samut Prakan', 'Samut Prakan', 1),
(3245, 209, 'Samut Sakhon', 'Samut Sakhon', 1),
(3246, 209, 'Samut Songkhram', 'Samut Songkhram', 1),
(3247, 209, 'Sara Buri', 'Sara Buri', 1),
(3248, 209, 'Satun', 'Satun', 1),
(3249, 209, 'Sing Buri', 'Sing Buri', 1),
(3250, 209, 'Sisaket', 'Sisaket', 1),
(3251, 209, 'Songkhla', 'Songkhla', 1),
(3252, 209, 'Sukhothai', 'Sukhothai', 1),
(3253, 209, 'Suphan Buri', 'Suphan Buri', 1),
(3254, 209, 'Surat Thani', 'Surat Thani', 1),
(3255, 209, 'Surin', 'Surin', 1),
(3256, 209, 'Tak', 'Tak', 1),
(3257, 209, 'Trang', 'Trang', 1),
(3258, 209, 'Trat', 'Trat', 1),
(3259, 209, 'Ubon Ratchathani', 'Ubon Ratchathani', 1),
(3260, 209, 'Udon Thani', 'Udon Thani', 1),
(3261, 209, 'Uthai Thani', 'Uthai Thani', 1),
(3262, 209, 'Uttaradit', 'Uttaradit', 1),
(3263, 209, 'Yala', 'Yala', 1),
(3264, 209, 'Yasothon', 'Yasothon', 1),
(3265, 210, 'Kara', 'K', 1),
(3266, 210, 'Plateaux', 'P', 1),
(3267, 210, 'Savanes', 'S', 1),
(3268, 210, 'Centrale', 'C', 1),
(3269, 210, 'Maritime', 'M', 1),
(3270, 211, 'Atafu', 'A', 1),
(3271, 211, 'Fakaofo', 'F', 1),
(3272, 211, 'Nukunonu', 'N', 1),
(3273, 212, 'Ha''apai', 'H', 1),
(3274, 212, 'Tongatapu', 'T', 1),
(3275, 212, 'Vava''u', 'V', 1),
(3276, 213, 'Couva/Tabaquite/Talparo', 'CT', 1),
(3277, 213, 'Diego Martin', 'DM', 1),
(3278, 213, 'Mayaro/Rio Claro', 'MR', 1),
(3279, 213, 'Penal/Debe', 'PD', 1),
(3280, 213, 'Princes Town', 'PT', 1),
(3281, 213, 'Sangre Grande', 'SG', 1),
(3282, 213, 'San Juan/Laventille', 'SL', 1),
(3283, 213, 'Siparia', 'SI', 1),
(3284, 213, 'Tunapuna/Piarco', 'TP', 1),
(3285, 213, 'Port of Spain', 'PS', 1),
(3286, 213, 'San Fernando', 'SF', 1),
(3287, 213, 'Arima', 'AR', 1),
(3288, 213, 'Point Fortin', 'PF', 1),
(3289, 213, 'Chaguanas', 'CH', 1),
(3290, 213, 'Tobago', 'TO', 1),
(3291, 214, 'Ariana', 'AR', 1),
(3292, 214, 'Beja', 'BJ', 1),
(3293, 214, 'Ben Arous', 'BA', 1),
(3294, 214, 'Bizerte', 'BI', 1),
(3295, 214, 'Gabes', 'GB', 1),
(3296, 214, 'Gafsa', 'GF', 1),
(3297, 214, 'Jendouba', 'JE', 1),
(3298, 214, 'Kairouan', 'KR', 1),
(3299, 214, 'Kasserine', 'KS', 1),
(3300, 214, 'Kebili', 'KB', 1),
(3301, 214, 'Kef', 'KF', 1),
(3302, 214, 'Mahdia', 'MH', 1),
(3303, 214, 'Manouba', 'MN', 1),
(3304, 214, 'Medenine', 'ME', 1),
(3305, 214, 'Monastir', 'MO', 1),
(3306, 214, 'Nabeul', 'NA', 1),
(3307, 214, 'Sfax', 'SF', 1),
(3308, 214, 'Sidi', 'SD', 1),
(3309, 214, 'Siliana', 'SL', 1),
(3310, 214, 'Sousse', 'SO', 1),
(3311, 214, 'Tataouine', 'TA', 1),
(3312, 214, 'Tozeur', 'TO', 1),
(3313, 214, 'Tunis', 'TU', 1),
(3314, 214, 'Zaghouan', 'ZA', 1),
(3315, 215, 'Adana', 'ADA', 1),
(3316, 215, 'Adıyaman', 'ADI', 1),
(3317, 215, 'Afyonkarahisar', 'AFY', 1),
(3318, 215, 'Ağrı', 'AGR', 1),
(3319, 215, 'Aksaray', 'AKS', 1),
(3320, 215, 'Amasya', 'AMA', 1),
(3321, 215, 'Ankara', 'ANK', 1),
(3322, 215, 'Antalya', 'ANT', 1),
(3323, 215, 'Ardahan', 'ARD', 1),
(3324, 215, 'Artvin', 'ART', 1),
(3325, 215, 'Aydın', 'AYI', 1),
(3326, 215, 'Balıkesir', 'BAL', 1),
(3327, 215, 'Bartın', 'BAR', 1),
(3328, 215, 'Batman', 'BAT', 1),
(3329, 215, 'Bayburt', 'BAY', 1),
(3330, 215, 'Bilecik', 'BIL', 1),
(3331, 215, 'Bingöl', 'BIN', 1),
(3332, 215, 'Bitlis', 'BIT', 1),
(3333, 215, 'Bolu', 'BOL', 1),
(3334, 215, 'Burdur', 'BRD', 1),
(3335, 215, 'Bursa', 'BRS', 1),
(3336, 215, 'Çanakkale', 'CKL', 1),
(3337, 215, 'Çankırı', 'CKR', 1),
(3338, 215, 'Çorum', 'COR', 1),
(3339, 215, 'Denizli', 'DEN', 1),
(3340, 215, 'Diyarbakir', 'DIY', 1),
(3341, 215, 'Düzce', 'DUZ', 1),
(3342, 215, 'Edirne', 'EDI', 1),
(3343, 215, 'Elazig', 'ELA', 1),
(3344, 215, 'Erzincan', 'EZC', 1),
(3345, 215, 'Erzurum', 'EZR', 1),
(3346, 215, 'Eskişehir', 'ESK', 1),
(3347, 215, 'Gaziantep', 'GAZ', 1),
(3348, 215, 'Giresun', 'GIR', 1),
(3349, 215, 'Gümüşhane', 'GMS', 1),
(3350, 215, 'Hakkari', 'HKR', 1),
(3351, 215, 'Hatay', 'HTY', 1),
(3352, 215, 'Iğdır', 'IGD', 1),
(3353, 215, 'Isparta', 'ISP', 1),
(3354, 215, 'İstanbul', 'IST', 1),
(3355, 215, 'İzmir', 'IZM', 1),
(3356, 215, 'Kahramanmaraş', 'KAH', 1),
(3357, 215, 'Karabük', 'KRB', 1),
(3358, 215, 'Karaman', 'KRM', 1),
(3359, 215, 'Kars', 'KRS', 1),
(3360, 215, 'Kastamonu', 'KAS', 1),
(3361, 215, 'Kayseri', 'KAY', 1),
(3362, 215, 'Kilis', 'KLS', 1),
(3363, 215, 'Kirikkale', 'KRK', 1),
(3364, 215, 'Kirklareli', 'KLR', 1),
(3365, 215, 'Kirsehir', 'KRH', 1),
(3366, 215, 'Kocaeli', 'KOC', 1),
(3367, 215, 'Konya', 'KON', 1),
(3368, 215, 'Kütahya', 'KUT', 1),
(3369, 215, 'Malatya', 'MAL', 1),
(3370, 215, 'Manisa', 'MAN', 1),
(3371, 215, 'Mardin', 'MAR', 1),
(3372, 215, 'Mersin', 'MER', 1),
(3373, 215, 'Muğla', 'MUG', 1),
(3374, 215, 'Muş', 'MUS', 1),
(3375, 215, 'Nevşehir', 'NEV', 1),
(3376, 215, 'Niğde', 'NIG', 1),
(3377, 215, 'Ordu', 'ORD', 1),
(3378, 215, 'Osmaniye', 'OSM', 1),
(3379, 215, 'Rize', 'RIZ', 1),
(3380, 215, 'Sakarya', 'SAK', 1),
(3381, 215, 'Samsun', 'SAM', 1),
(3382, 215, 'Şanlıurfa', 'SAN', 1),
(3383, 215, 'Siirt', 'SII', 1),
(3384, 215, 'Sinop', 'SIN', 1),
(3385, 215, 'Şırnak', 'SIR', 1),
(3386, 215, 'Sivas', 'SIV', 1),
(3387, 215, 'Tekirdağ', 'TEL', 1),
(3388, 215, 'Tokat', 'TOK', 1),
(3389, 215, 'Trabzon', 'TRA', 1),
(3390, 215, 'Tunceli', 'TUN', 1),
(3391, 215, 'Uşak', 'USK', 1),
(3392, 215, 'Van', 'VAN', 1),
(3393, 215, 'Yalova', 'YAL', 1),
(3394, 215, 'Yozgat', 'YOZ', 1),
(3395, 215, 'Zonguldak', 'ZON', 1),
(3396, 216, 'Ahal Welayaty', 'A', 1),
(3397, 216, 'Balkan Welayaty', 'B', 1),
(3398, 216, 'Dashhowuz Welayaty', 'D', 1),
(3399, 216, 'Lebap Welayaty', 'L', 1),
(3400, 216, 'Mary Welayaty', 'M', 1),
(3401, 217, 'Ambergris Cays', 'AC', 1),
(3402, 217, 'Dellis Cay', 'DC', 1),
(3403, 217, 'French Cay', 'FC', 1),
(3404, 217, 'Little Water Cay', 'LW', 1),
(3405, 217, 'Parrot Cay', 'RC', 1),
(3406, 217, 'Pine Cay', 'PN', 1),
(3407, 217, 'Salt Cay', 'SL', 1),
(3408, 217, 'Grand Turk', 'GT', 1),
(3409, 217, 'South Caicos', 'SC', 1),
(3410, 217, 'East Caicos', 'EC', 1),
(3411, 217, 'Middle Caicos', 'MC', 1),
(3412, 217, 'North Caicos', 'NC', 1),
(3413, 217, 'Providenciales', 'PR', 1),
(3414, 217, 'West Caicos', 'WC', 1),
(3415, 218, 'Nanumanga', 'NMG', 1),
(3416, 218, 'Niulakita', 'NLK', 1),
(3417, 218, 'Niutao', 'NTO', 1),
(3418, 218, 'Funafuti', 'FUN', 1),
(3419, 218, 'Nanumea', 'NME', 1),
(3420, 218, 'Nui', 'NUI', 1),
(3421, 218, 'Nukufetau', 'NFT', 1),
(3422, 218, 'Nukulaelae', 'NLL', 1),
(3423, 218, 'Vaitupu', 'VAI', 1),
(3424, 219, 'Kalangala', 'KAL', 1),
(3425, 219, 'Kampala', 'KMP', 1),
(3426, 219, 'Kayunga', 'KAY', 1),
(3427, 219, 'Kiboga', 'KIB', 1),
(3428, 219, 'Luwero', 'LUW', 1),
(3429, 219, 'Masaka', 'MAS', 1),
(3430, 219, 'Mpigi', 'MPI', 1),
(3431, 219, 'Mubende', 'MUB', 1),
(3432, 219, 'Mukono', 'MUK', 1),
(3433, 219, 'Nakasongola', 'NKS', 1),
(3434, 219, 'Rakai', 'RAK', 1),
(3435, 219, 'Sembabule', 'SEM', 1),
(3436, 219, 'Wakiso', 'WAK', 1),
(3437, 219, 'Bugiri', 'BUG', 1),
(3438, 219, 'Busia', 'BUS', 1),
(3439, 219, 'Iganga', 'IGA', 1),
(3440, 219, 'Jinja', 'JIN', 1),
(3441, 219, 'Kaberamaido', 'KAB', 1),
(3442, 219, 'Kamuli', 'KML', 1),
(3443, 219, 'Kapchorwa', 'KPC', 1),
(3444, 219, 'Katakwi', 'KTK', 1),
(3445, 219, 'Kumi', 'KUM', 1),
(3446, 219, 'Mayuge', 'MAY', 1),
(3447, 219, 'Mbale', 'MBA', 1),
(3448, 219, 'Pallisa', 'PAL', 1),
(3449, 219, 'Sironko', 'SIR', 1),
(3450, 219, 'Soroti', 'SOR', 1),
(3451, 219, 'Tororo', 'TOR', 1),
(3452, 219, 'Adjumani', 'ADJ', 1),
(3453, 219, 'Apac', 'APC', 1),
(3454, 219, 'Arua', 'ARU', 1),
(3455, 219, 'Gulu', 'GUL', 1),
(3456, 219, 'Kitgum', 'KIT', 1),
(3457, 219, 'Kotido', 'KOT', 1),
(3458, 219, 'Lira', 'LIR', 1),
(3459, 219, 'Moroto', 'MRT', 1),
(3460, 219, 'Moyo', 'MOY', 1),
(3461, 219, 'Nakapiripirit', 'NAK', 1),
(3462, 219, 'Nebbi', 'NEB', 1),
(3463, 219, 'Pader', 'PAD', 1),
(3464, 219, 'Yumbe', 'YUM', 1),
(3465, 219, 'Bundibugyo', 'BUN', 1),
(3466, 219, 'Bushenyi', 'BSH', 1),
(3467, 219, 'Hoima', 'HOI', 1),
(3468, 219, 'Kabale', 'KBL', 1),
(3469, 219, 'Kabarole', 'KAR', 1),
(3470, 219, 'Kamwenge', 'KAM', 1),
(3471, 219, 'Kanungu', 'KAN', 1),
(3472, 219, 'Kasese', 'KAS', 1),
(3473, 219, 'Kibaale', 'KBA', 1),
(3474, 219, 'Kisoro', 'KIS', 1),
(3475, 219, 'Kyenjojo', 'KYE', 1),
(3476, 219, 'Masindi', 'MSN', 1),
(3477, 219, 'Mbarara', 'MBR', 1),
(3478, 219, 'Ntungamo', 'NTU', 1),
(3479, 219, 'Rukungiri', 'RUK', 1),
(3480, 220, 'Cherkasy', 'CK', 1),
(3481, 220, 'Chernihiv', 'CH', 1),
(3482, 220, 'Chernivtsi', 'CV', 1),
(3483, 220, 'Crimea', 'CR', 1),
(3484, 220, 'Dnipropetrovs''k', 'DN', 1),
(3485, 220, 'Donets''k', 'DO', 1),
(3486, 220, 'Ivano-Frankivs''k', 'IV', 1),
(3487, 220, 'Kharkiv Kherson', 'KL', 1),
(3488, 220, 'Khmel''nyts''kyy', 'KM', 1),
(3489, 220, 'Kirovohrad', 'KR', 1),
(3490, 220, 'Kiev', 'KV', 1),
(3491, 220, 'Kyyiv', 'KY', 1),
(3492, 220, 'Luhans''k', 'LU', 1),
(3493, 220, 'L''viv', 'LV', 1),
(3494, 220, 'Mykolayiv', 'MY', 1),
(3495, 220, 'Odesa', 'OD', 1),
(3496, 220, 'Poltava', 'PO', 1),
(3497, 220, 'Rivne', 'RI', 1),
(3498, 220, 'Sevastopol', 'SE', 1),
(3499, 220, 'Sumy', 'SU', 1),
(3500, 220, 'Ternopil''', 'TE', 1),
(3501, 220, 'Vinnytsya', 'VI', 1),
(3502, 220, 'Volyn''', 'VO', 1),
(3503, 220, 'Zakarpattya', 'ZK', 1),
(3504, 220, 'Zaporizhzhya', 'ZA', 1),
(3505, 220, 'Zhytomyr', 'ZH', 1),
(3506, 221, 'Abu Zaby', 'AZ', 1),
(3507, 221, '''Ajman', 'AJ', 1),
(3508, 221, 'Al Fujayrah', 'FU', 1),
(3509, 221, 'Ash Shariqah', 'SH', 1),
(3510, 221, 'Dubayy', 'DU', 1),
(3511, 221, 'R''as al Khaymah', 'RK', 1),
(3512, 221, 'Umm al Qaywayn', 'UQ', 1),
(3513, 222, 'Aberdeen', 'ABN', 1),
(3514, 222, 'Aberdeenshire', 'ABNS', 1),
(3515, 222, 'Anglesey', 'ANG', 1),
(3516, 222, 'Angus', 'AGS', 1),
(3517, 222, 'Argyll and Bute', 'ARY', 1),
(3518, 222, 'Bedfordshire', 'BEDS', 1),
(3519, 222, 'Berkshire', 'BERKS', 1),
(3520, 222, 'Blaenau Gwent', 'BLA', 1),
(3521, 222, 'Bridgend', 'BRI', 1),
(3522, 222, 'Bristol', 'BSTL', 1),
(3523, 222, 'Buckinghamshire', 'BUCKS', 1),
(3524, 222, 'Caerphilly', 'CAE', 1),
(3525, 222, 'Cambridgeshire', 'CAMBS', 1),
(3526, 222, 'Cardiff', 'CDF', 1),
(3527, 222, 'Carmarthenshire', 'CARM', 1),
(3528, 222, 'Ceredigion', 'CDGN', 1),
(3529, 222, 'Cheshire', 'CHES', 1),
(3530, 222, 'Clackmannanshire', 'CLACK', 1),
(3531, 222, 'Conwy', 'CON', 1),
(3532, 222, 'Cornwall', 'CORN', 1),
(3533, 222, 'Denbighshire', 'DNBG', 1),
(3534, 222, 'Derbyshire', 'DERBY', 1),
(3535, 222, 'Devon', 'DVN', 1),
(3536, 222, 'Dorset', 'DOR', 1),
(3537, 222, 'Dumfries and Galloway', 'DGL', 1),
(3538, 222, 'Dundee', 'DUND', 1),
(3539, 222, 'Durham', 'DHM', 1),
(3540, 222, 'East Ayrshire', 'ARYE', 1),
(3541, 222, 'East Dunbartonshire', 'DUNBE', 1),
(3542, 222, 'East Lothian', 'LOTE', 1),
(3543, 222, 'East Renfrewshire', 'RENE', 1),
(3544, 222, 'East Riding of Yorkshire', 'ERYS', 1),
(3545, 222, 'East Sussex', 'SXE', 1),
(3546, 222, 'Edinburgh', 'EDIN', 1),
(3547, 222, 'Essex', 'ESX', 1),
(3548, 222, 'Falkirk', 'FALK', 1),
(3549, 222, 'Fife', 'FFE', 1),
(3550, 222, 'Flintshire', 'FLINT', 1),
(3551, 222, 'Glasgow', 'GLAS', 1),
(3552, 222, 'Gloucestershire', 'GLOS', 1),
(3553, 222, 'Greater London', 'LDN', 1),
(3554, 222, 'Greater Manchester', 'MCH', 1),
(3555, 222, 'Gwynedd', 'GDD', 1),
(3556, 222, 'Hampshire', 'HANTS', 1),
(3557, 222, 'Herefordshire', 'HWR', 1),
(3558, 222, 'Hertfordshire', 'HERTS', 1),
(3559, 222, 'Highlands', 'HLD', 1),
(3560, 222, 'Inverclyde', 'IVER', 1),
(3561, 222, 'Isle of Wight', 'IOW', 1),
(3562, 222, 'Kent', 'KNT', 1),
(3563, 222, 'Lancashire', 'LANCS', 1),
(3564, 222, 'Leicestershire', 'LEICS', 1),
(3565, 222, 'Lincolnshire', 'LINCS', 1),
(3566, 222, 'Merseyside', 'MSY', 1),
(3567, 222, 'Merthyr Tydfil', 'MERT', 1),
(3568, 222, 'Midlothian', 'MLOT', 1),
(3569, 222, 'Monmouthshire', 'MMOUTH', 1),
(3570, 222, 'Moray', 'MORAY', 1),
(3571, 222, 'Neath Port Talbot', 'NPRTAL', 1),
(3572, 222, 'Newport', 'NEWPT', 1),
(3573, 222, 'Norfolk', 'NOR', 1),
(3574, 222, 'North Ayrshire', 'ARYN', 1),
(3575, 222, 'North Lanarkshire', 'LANN', 1),
(3576, 222, 'North Yorkshire', 'YSN', 1),
(3577, 222, 'Northamptonshire', 'NHM', 1),
(3578, 222, 'Northumberland', 'NLD', 1),
(3579, 222, 'Nottinghamshire', 'NOT', 1),
(3580, 222, 'Orkney Islands', 'ORK', 1),
(3581, 222, 'Oxfordshire', 'OFE', 1),
(3582, 222, 'Pembrokeshire', 'PEM', 1),
(3583, 222, 'Perth and Kinross', 'PERTH', 1),
(3584, 222, 'Powys', 'PWS', 1),
(3585, 222, 'Renfrewshire', 'REN', 1),
(3586, 222, 'Rhondda Cynon Taff', 'RHON', 1),
(3587, 222, 'Rutland', 'RUT', 1),
(3588, 222, 'Scottish Borders', 'BOR', 1),
(3589, 222, 'Shetland Islands', 'SHET', 1),
(3590, 222, 'Shropshire', 'SPE', 1),
(3591, 222, 'Somerset', 'SOM', 1),
(3592, 222, 'South Ayrshire', 'ARYS', 1),
(3593, 222, 'South Lanarkshire', 'LANS', 1),
(3594, 222, 'South Yorkshire', 'YSS', 1),
(3595, 222, 'Staffordshire', 'SFD', 1),
(3596, 222, 'Stirling', 'STIR', 1),
(3597, 222, 'Suffolk', 'SFK', 1),
(3598, 222, 'Surrey', 'SRY', 1),
(3599, 222, 'Swansea', 'SWAN', 1),
(3600, 222, 'Torfaen', 'TORF', 1),
(3601, 222, 'Tyne and Wear', 'TWR', 1),
(3602, 222, 'Vale of Glamorgan', 'VGLAM', 1),
(3603, 222, 'Warwickshire', 'WARKS', 1),
(3604, 222, 'West Dunbartonshire', 'WDUN', 1),
(3605, 222, 'West Lothian', 'WLOT', 1),
(3606, 222, 'West Midlands', 'WMD', 1),
(3607, 222, 'West Sussex', 'SXW', 1),
(3608, 222, 'West Yorkshire', 'YSW', 1),
(3609, 222, 'Western Isles', 'WIL', 1),
(3610, 222, 'Wiltshire', 'WLT', 1),
(3611, 222, 'Worcestershire', 'WORCS', 1),
(3612, 222, 'Wrexham', 'WRX', 1),
(3613, 223, 'Alabama', 'AL', 1),
(3614, 223, 'Alaska', 'AK', 1),
(3615, 223, 'American Samoa', 'AS', 1),
(3616, 223, 'Arizona', 'AZ', 1),
(3617, 223, 'Arkansas', 'AR', 1),
(3618, 223, 'Armed Forces Africa', 'AF', 1),
(3619, 223, 'Armed Forces Americas', 'AA', 1),
(3620, 223, 'Armed Forces Canada', 'AC', 1),
(3621, 223, 'Armed Forces Europe', 'AE', 1),
(3622, 223, 'Armed Forces Middle East', 'AM', 1),
(3623, 223, 'Armed Forces Pacific', 'AP', 1),
(3624, 223, 'California', 'CA', 1),
(3625, 223, 'Colorado', 'CO', 1),
(3626, 223, 'Connecticut', 'CT', 1),
(3627, 223, 'Delaware', 'DE', 1),
(3628, 223, 'District of Columbia', 'DC', 1),
(3629, 223, 'Federated States Of Micronesia', 'FM', 1),
(3630, 223, 'Florida', 'FL', 1),
(3631, 223, 'Georgia', 'GA', 1),
(3632, 223, 'Guam', 'GU', 1),
(3633, 223, 'Hawaii', 'HI', 1),
(3634, 223, 'Idaho', 'ID', 1),
(3635, 223, 'Illinois', 'IL', 1),
(3636, 223, 'Indiana', 'IN', 1),
(3637, 223, 'Iowa', 'IA', 1),
(3638, 223, 'Kansas', 'KS', 1),
(3639, 223, 'Kentucky', 'KY', 1),
(3640, 223, 'Louisiana', 'LA', 1),
(3641, 223, 'Maine', 'ME', 1),
(3642, 223, 'Marshall Islands', 'MH', 1),
(3643, 223, 'Maryland', 'MD', 1),
(3644, 223, 'Massachusetts', 'MA', 1),
(3645, 223, 'Michigan', 'MI', 1),
(3646, 223, 'Minnesota', 'MN', 1),
(3647, 223, 'Mississippi', 'MS', 1),
(3648, 223, 'Missouri', 'MO', 1),
(3649, 223, 'Montana', 'MT', 1),
(3650, 223, 'Nebraska', 'NE', 1),
(3651, 223, 'Nevada', 'NV', 1),
(3652, 223, 'New Hampshire', 'NH', 1),
(3653, 223, 'New Jersey', 'NJ', 1),
(3654, 223, 'New Mexico', 'NM', 1),
(3655, 223, 'New York', 'NY', 1),
(3656, 223, 'North Carolina', 'NC', 1),
(3657, 223, 'North Dakota', 'ND', 1),
(3658, 223, 'Northern Mariana Islands', 'MP', 1),
(3659, 223, 'Ohio', 'OH', 1),
(3660, 223, 'Oklahoma', 'OK', 1),
(3661, 223, 'Oregon', 'OR', 1),
(3662, 223, 'Palau', 'PW', 1),
(3663, 223, 'Pennsylvania', 'PA', 1),
(3664, 223, 'Puerto Rico', 'PR', 1),
(3665, 223, 'Rhode Island', 'RI', 1),
(3666, 223, 'South Carolina', 'SC', 1),
(3667, 223, 'South Dakota', 'SD', 1),
(3668, 223, 'Tennessee', 'TN', 1),
(3669, 223, 'Texas', 'TX', 1),
(3670, 223, 'Utah', 'UT', 1),
(3671, 223, 'Vermont', 'VT', 1),
(3672, 223, 'Virgin Islands', 'VI', 1),
(3673, 223, 'Virginia', 'VA', 1),
(3674, 223, 'Washington', 'WA', 1),
(3675, 223, 'West Virginia', 'WV', 1),
(3676, 223, 'Wisconsin', 'WI', 1),
(3677, 223, 'Wyoming', 'WY', 1),
(3678, 224, 'Baker Island', 'BI', 1),
(3679, 224, 'Howland Island', 'HI', 1),
(3680, 224, 'Jarvis Island', 'JI', 1),
(3681, 224, 'Johnston Atoll', 'JA', 1),
(3682, 224, 'Kingman Reef', 'KR', 1),
(3683, 224, 'Midway Atoll', 'MA', 1),
(3684, 224, 'Navassa Island', 'NI', 1),
(3685, 224, 'Palmyra Atoll', 'PA', 1),
(3686, 224, 'Wake Island', 'WI', 1),
(3687, 225, 'Artigas', 'AR', 1),
(3688, 225, 'Canelones', 'CA', 1),
(3689, 225, 'Cerro Largo', 'CL', 1),
(3690, 225, 'Colonia', 'CO', 1),
(3691, 225, 'Durazno', 'DU', 1),
(3692, 225, 'Flores', 'FS', 1),
(3693, 225, 'Florida', 'FA', 1),
(3694, 225, 'Lavalleja', 'LA', 1),
(3695, 225, 'Maldonado', 'MA', 1),
(3696, 225, 'Montevideo', 'MO', 1),
(3697, 225, 'Paysandu', 'PA', 1),
(3698, 225, 'Rio Negro', 'RN', 1),
(3699, 225, 'Rivera', 'RV', 1),
(3700, 225, 'Rocha', 'RO', 1),
(3701, 225, 'Salto', 'SL', 1),
(3702, 225, 'San Jose', 'SJ', 1),
(3703, 225, 'Soriano', 'SO', 1),
(3704, 225, 'Tacuarembo', 'TA', 1),
(3705, 225, 'Treinta y Tres', 'TT', 1),
(3706, 226, 'Andijon', 'AN', 1),
(3707, 226, 'Buxoro', 'BU', 1),
(3708, 226, 'Farg''ona', 'FA', 1),
(3709, 226, 'Jizzax', 'JI', 1),
(3710, 226, 'Namangan', 'NG', 1),
(3711, 226, 'Navoiy', 'NW', 1),
(3712, 226, 'Qashqadaryo', 'QA', 1),
(3713, 226, 'Qoraqalpog''iston Republikasi', 'QR', 1),
(3714, 226, 'Samarqand', 'SA', 1),
(3715, 226, 'Sirdaryo', 'SI', 1),
(3716, 226, 'Surxondaryo', 'SU', 1),
(3717, 226, 'Toshkent City', 'TK', 1),
(3718, 226, 'Toshkent Region', 'TO', 1),
(3719, 226, 'Xorazm', 'XO', 1),
(3720, 227, 'Malampa', 'MA', 1),
(3721, 227, 'Penama', 'PE', 1),
(3722, 227, 'Sanma', 'SA', 1),
(3723, 227, 'Shefa', 'SH', 1),
(3724, 227, 'Tafea', 'TA', 1),
(3725, 227, 'Torba', 'TO', 1),
(3726, 229, 'Amazonas', 'AM', 1),
(3727, 229, 'Anzoategui', 'AN', 1),
(3728, 229, 'Apure', 'AP', 1),
(3729, 229, 'Aragua', 'AR', 1),
(3730, 229, 'Barinas', 'BA', 1),
(3731, 229, 'Bolivar', 'BO', 1),
(3732, 229, 'Carabobo', 'CA', 1),
(3733, 229, 'Cojedes', 'CO', 1),
(3734, 229, 'Delta Amacuro', 'DA', 1),
(3735, 229, 'Dependencias Federales', 'DF', 1),
(3736, 229, 'Distrito Federal', 'DI', 1),
(3737, 229, 'Falcon', 'FA', 1),
(3738, 229, 'Guarico', 'GU', 1),
(3739, 229, 'Lara', 'LA', 1),
(3740, 229, 'Merida', 'ME', 1),
(3741, 229, 'Miranda', 'MI', 1),
(3742, 229, 'Monagas', 'MO', 1),
(3743, 229, 'Nueva Esparta', 'NE', 1),
(3744, 229, 'Portuguesa', 'PO', 1),
(3745, 229, 'Sucre', 'SU', 1),
(3746, 229, 'Tachira', 'TA', 1),
(3747, 229, 'Trujillo', 'TR', 1),
(3748, 229, 'Vargas', 'VA', 1),
(3749, 229, 'Yaracuy', 'YA', 1),
(3750, 229, 'Zulia', 'ZU', 1),
(3751, 230, 'An Giang', 'AG', 1),
(3752, 230, 'Bac Giang', 'BG', 1),
(3753, 230, 'Bac Kan', 'BK', 1),
(3754, 230, 'Bac Lieu', 'BL', 1),
(3755, 230, 'Bac Ninh', 'BC', 1),
(3756, 230, 'Ba Ria-Vung Tau', 'BR', 1),
(3757, 230, 'Ben Tre', 'BN', 1),
(3758, 230, 'Binh Dinh', 'BH', 1),
(3759, 230, 'Binh Duong', 'BU', 1),
(3760, 230, 'Binh Phuoc', 'BP', 1),
(3761, 230, 'Binh Thuan', 'BT', 1),
(3762, 230, 'Ca Mau', 'CM', 1),
(3763, 230, 'Can Tho', 'CT', 1),
(3764, 230, 'Cao Bang', 'CB', 1),
(3765, 230, 'Dak Lak', 'DL', 1),
(3766, 230, 'Dak Nong', 'DG', 1),
(3767, 230, 'Da Nang', 'DN', 1),
(3768, 230, 'Dien Bien', 'DB', 1),
(3769, 230, 'Dong Nai', 'DI', 1),
(3770, 230, 'Dong Thap', 'DT', 1),
(3771, 230, 'Gia Lai', 'GL', 1),
(3772, 230, 'Ha Giang', 'HG', 1),
(3773, 230, 'Hai Duong', 'HD', 1),
(3774, 230, 'Hai Phong', 'HP', 1),
(3775, 230, 'Ha Nam', 'HM', 1),
(3776, 230, 'Ha Noi', 'HI', 1),
(3777, 230, 'Ha Tay', 'HT', 1),
(3778, 230, 'Ha Tinh', 'HH', 1),
(3779, 230, 'Hoa Binh', 'HB', 1),
(3780, 230, 'Ho Chi Minh City', 'HC', 1),
(3781, 230, 'Hau Giang', 'HU', 1),
(3782, 230, 'Hung Yen', 'HY', 1),
(3783, 232, 'Saint Croix', 'C', 1),
(3784, 232, 'Saint John', 'J', 1),
(3785, 232, 'Saint Thomas', 'T', 1),
(3786, 233, 'Alo', 'A', 1),
(3787, 233, 'Sigave', 'S', 1),
(3788, 233, 'Wallis', 'W', 1),
(3789, 235, 'Abyan', 'AB', 1),
(3790, 235, 'Adan', 'AD', 1),
(3791, 235, 'Amran', 'AM', 1),
(3792, 235, 'Al Bayda', 'BA', 1),
(3793, 235, 'Ad Dali', 'DA', 1),
(3794, 235, 'Dhamar', 'DH', 1),
(3795, 235, 'Hadramawt', 'HD', 1),
(3796, 235, 'Hajjah', 'HJ', 1),
(3797, 235, 'Al Hudaydah', 'HU', 1),
(3798, 235, 'Ibb', 'IB', 1),
(3799, 235, 'Al Jawf', 'JA', 1),
(3800, 235, 'Lahij', 'LA', 1),
(3801, 235, 'Ma''rib', 'MA', 1),
(3802, 235, 'Al Mahrah', 'MR', 1),
(3803, 235, 'Al Mahwit', 'MW', 1),
(3804, 235, 'Sa''dah', 'SD', 1),
(3805, 235, 'San''a', 'SN', 1),
(3806, 235, 'Shabwah', 'SH', 1),
(3807, 235, 'Ta''izz', 'TA', 1),
(3808, 236, 'Kosovo', 'KOS', 1),
(3809, 236, 'Montenegro', 'MON', 1),
(3810, 236, 'Serbia', 'SER', 1),
(3811, 236, 'Vojvodina', 'VOJ', 1),
(3812, 237, 'Bas-Congo', 'BC', 1),
(3813, 237, 'Bandundu', 'BN', 1),
(3814, 237, 'Equateur', 'EQ', 1),
(3815, 237, 'Katanga', 'KA', 1),
(3816, 237, 'Kasai-Oriental', 'KE', 1),
(3817, 237, 'Kinshasa', 'KN', 1),
(3818, 237, 'Kasai-Occidental', 'KW', 1),
(3819, 237, 'Maniema', 'MA', 1),
(3820, 237, 'Nord-Kivu', 'NK', 1),
(3821, 237, 'Orientale', 'OR', 1),
(3822, 237, 'Sud-Kivu', 'SK', 1),
(3823, 238, 'Central', 'CE', 1),
(3824, 238, 'Copperbelt', 'CB', 1),
(3825, 238, 'Eastern', 'EA', 1),
(3826, 238, 'Luapula', 'LP', 1),
(3827, 238, 'Lusaka', 'LK', 1),
(3828, 238, 'Northern', 'NO', 1),
(3829, 238, 'North-Western', 'NW', 1),
(3830, 238, 'Southern', 'SO', 1),
(3831, 238, 'Western', 'WE', 1),
(3832, 239, 'Bulawayo', 'BU', 1),
(3833, 239, 'Harare', 'HA', 1),
(3834, 239, 'Manicaland', 'ML', 1),
(3835, 239, 'Mashonaland Central', 'MC', 1),
(3836, 239, 'Mashonaland East', 'ME', 1),
(3837, 239, 'Mashonaland West', 'MW', 1),
(3838, 239, 'Masvingo', 'MV', 1),
(3839, 239, 'Matabeleland North', 'MN', 1),
(3840, 239, 'Matabeleland South', 'MS', 1),
(3841, 239, 'Midlands', 'MD', 1),
(3861, 105, 'Campobasso', 'CB', 1),
(3862, 105, 'Carbonia-Iglesias', 'CI', 1),
(3863, 105, 'Caserta', 'CE', 1),
(3864, 105, 'Catania', 'CT', 1),
(3865, 105, 'Catanzaro', 'CZ', 1),
(3866, 105, 'Chieti', 'CH', 1),
(3867, 105, 'Como', 'CO', 1),
(3868, 105, 'Cosenza', 'CS', 1),
(3869, 105, 'Cremona', 'CR', 1),
(3870, 105, 'Crotone', 'KR', 1),
(3871, 105, 'Cuneo', 'CN', 1),
(3872, 105, 'Enna', 'EN', 1),
(3873, 105, 'Ferrara', 'FE', 1),
(3874, 105, 'Firenze', 'FI', 1),
(3875, 105, 'Foggia', 'FG', 1),
(3876, 105, 'Forli-Cesena', 'FC', 1),
(3877, 105, 'Frosinone', 'FR', 1),
(3878, 105, 'Genova', 'GE', 1),
(3879, 105, 'Gorizia', 'GO', 1),
(3880, 105, 'Grosseto', 'GR', 1),
(3881, 105, 'Imperia', 'IM', 1),
(3882, 105, 'Isernia', 'IS', 1),
(3883, 105, 'L&#39;Aquila', 'AQ', 1),
(3884, 105, 'La Spezia', 'SP', 1),
(3885, 105, 'Latina', 'LT', 1),
(3886, 105, 'Lecce', 'LE', 1),
(3887, 105, 'Lecco', 'LC', 1),
(3888, 105, 'Livorno', 'LI', 1),
(3889, 105, 'Lodi', 'LO', 1),
(3890, 105, 'Lucca', 'LU', 1),
(3891, 105, 'Macerata', 'MC', 1),
(3892, 105, 'Mantova', 'MN', 1),
(3893, 105, 'Massa-Carrara', 'MS', 1),
(3894, 105, 'Matera', 'MT', 1),
(3895, 105, 'Medio Campidano', 'VS', 1),
(3896, 105, 'Messina', 'ME', 1),
(3897, 105, 'Milano', 'MI', 1),
(3898, 105, 'Modena', 'MO', 1),
(3899, 105, 'Napoli', 'NA', 1),
(3900, 105, 'Novara', 'NO', 1),
(3901, 105, 'Nuoro', 'NU', 1),
(3902, 105, 'Ogliastra', 'OG', 1),
(3903, 105, 'Olbia-Tempio', 'OT', 1),
(3904, 105, 'Oristano', 'OR', 1),
(3905, 105, 'Padova', 'PD', 1),
(3906, 105, 'Palermo', 'PA', 1),
(3907, 105, 'Parma', 'PR', 1),
(3908, 105, 'Pavia', 'PV', 1),
(3909, 105, 'Perugia', 'PG', 1),
(3910, 105, 'Pesaro e Urbino', 'PU', 1),
(3911, 105, 'Pescara', 'PE', 1),
(3912, 105, 'Piacenza', 'PC', 1),
(3913, 105, 'Pisa', 'PI', 1),
(3914, 105, 'Pistoia', 'PT', 1),
(3915, 105, 'Pordenone', 'PN', 1),
(3916, 105, 'Potenza', 'PZ', 1),
(3917, 105, 'Prato', 'PO', 1),
(3918, 105, 'Ragusa', 'RG', 1),
(3919, 105, 'Ravenna', 'RA', 1),
(3920, 105, 'Reggio Calabria', 'RC', 1),
(3921, 105, 'Reggio Emilia', 'RE', 1),
(3922, 105, 'Rieti', 'RI', 1),
(3923, 105, 'Rimini', 'RN', 1),
(3924, 105, 'Roma', 'RM', 1),
(3925, 105, 'Rovigo', 'RO', 1),
(3926, 105, 'Salerno', 'SA', 1),
(3927, 105, 'Sassari', 'SS', 1),
(3928, 105, 'Savona', 'SV', 1),
(3929, 105, 'Siena', 'SI', 1),
(3930, 105, 'Siracusa', 'SR', 1),
(3931, 105, 'Sondrio', 'SO', 1),
(3932, 105, 'Taranto', 'TA', 1),
(3933, 105, 'Teramo', 'TE', 1),
(3934, 105, 'Terni', 'TR', 1),
(3935, 105, 'Torino', 'TO', 1),
(3936, 105, 'Trapani', 'TP', 1),
(3937, 105, 'Trento', 'TN', 1),
(3938, 105, 'Treviso', 'TV', 1),
(3939, 105, 'Trieste', 'TS', 1),
(3940, 105, 'Udine', 'UD', 1),
(3941, 105, 'Varese', 'VA', 1),
(3942, 105, 'Venezia', 'VE', 1),
(3943, 105, 'Verbano-Cusio-Ossola', 'VB', 1),
(3944, 105, 'Vercelli', 'VC', 1),
(3945, 105, 'Verona', 'VR', 1),
(3946, 105, 'Vibo Valentia', 'VV', 1),
(3947, 105, 'Vicenza', 'VI', 1),
(3948, 105, 'Viterbo', 'VT', 1),
(3949, 222, 'County Antrim', 'ANT', 1),
(3950, 222, 'County Armagh', 'ARM', 1),
(3951, 222, 'County Down', 'DOW', 1),
(3952, 222, 'County Fermanagh', 'FER', 1),
(3953, 222, 'County Londonderry', 'LDY', 1),
(3954, 222, 'County Tyrone', 'TYR', 1),
(3955, 222, 'Cumbria', 'CMA', 1),
(3956, 190, 'Pomurska', '1', 1),
(3957, 190, 'Podravska', '2', 1),
(3958, 190, 'Koroška', '3', 1),
(3959, 190, 'Savinjska', '4', 1),
(3960, 190, 'Zasavska', '5', 1),
(3961, 190, 'Spodnjeposavska', '6', 1),
(3962, 190, 'Jugovzhodna Slovenija', '7', 1),
(3963, 190, 'Osrednjeslovenska', '8', 1),
(3964, 190, 'Gorenjska', '9', 1),
(3965, 190, 'Notranjsko-kraška', '10', 1),
(3966, 190, 'Goriška', '11', 1),
(3967, 190, 'Obalno-kraška', '12', 1),
(3968, 33, 'Ruse', '', 1),
(3969, 101, 'Alborz', 'ALB', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `zone_to_geo_zone`
--

CREATE TABLE IF NOT EXISTS `zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`zone_to_geo_zone_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=66 ;

--
-- Дамп данных таблицы `zone_to_geo_zone`
--

INSERT INTO `zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(57, 222, 0, 3, '2010-02-26 22:33:24', '0000-00-00 00:00:00'),
(65, 222, 0, 4, '2010-12-15 15:18:13', '0000-00-00 00:00:00');

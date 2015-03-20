create DATABASE wds;
use wds;

CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `role` int, -- 0 is staff, 1 is customer
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `email` VARCHAR(100)  NOT NULL ,
  `password` VARCHAR(100)  NOT NULL ,
  `gender` BIT DEFAULT 1,
  `dob` DATETIME,
  `phone` VARCHAR(20) DEFAULT NULL,
  `address` varchar(500) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `product` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `weight` int,
  `price` float,
  `category` VARCHAR(100)
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `warehouse` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `product_warehouse` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL ,
  `warehouse_id` bigint(20) NOT NULL ,
  `stock_level` int not NULL
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `product_transfer` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `product_id` bigint(20) NOT NULL ,
  `from_warehouse_id` bigint(20) NOT NULL ,
  `to_warehouse_id` bigint(20) NOT NULL ,
  `total_miles` int,
  `quantity` int not NULL,
  `transfered_date` DATETIME,
  `departure_date` DATETIME,
  `status` int -- 0 = pending, 1 = transferring, 2 = done
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `order` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL ,
  `warehouse_id` BIGINT(20) NOT NULL,
  `created_date` DATETIME NOT NULL ,
  `order_status` int -- 0 = placed, 1 = awaiting items, 2 =  being packed, 3 = dispatched, 4 = delivered
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `order_item` (
  `id` bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `quantity` int,
  `item_status` int -- 0 = in final warehouse, 1 = in other warehouse, 2 = in transit
) ENGINE=MyISAM AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;


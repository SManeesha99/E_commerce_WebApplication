-- phpMyAdmin SQL Dump
-- version 3.4.3.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 11, 2014 at 09:31 AM
-- Server version: 5.0.77
-- PHP Version: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: bolt
--

-- Table structure for table "orders"
--

CREATE TABLE IF NOT EXISTS "orders" (
  "id" serial NOT NULL,
  "product_code" varchar(255) NOT NULL,
  "product_name" varchar(255) NOT NULL,
  "product_desc" varchar(255) NOT NULL,
  "price" int NOT NULL,
  "units" int NOT NULL,
  "total" int NOT NULL,
  "date" timestamp NOT NULL default CURRENT_TIMESTAMP,
  "email" varchar(255) NOT NULL,
  PRIMARY KEY  ("id")
);

--
-- Table structure for table "products"
--

CREATE TABLE IF NOT EXISTS "products" (
  "id" serial NOT NULL,
  "product_code" varchar(60) NOT NULL,
  "product_name" varchar(60) NOT NULL,
  "product_desc" text NOT NULL,
  "product_img_name" varchar(60) NOT NULL,
  "qty" int NOT NULL,
  "price" decimal(10,2) NOT NULL,
  PRIMARY KEY  ("id"),
  UNIQUE ("product_code")
);

--
-- Dumping data for table "products"
--

INSERT INTO "products" ("id", "product_code", "product_name", "product_desc", "product_img_name", "qty", "price") VALUES
(1, 'BOLT1', 'Sports Shoes', 'With a clean vamp, tonal stitch details throughout, and a unique formstripe finish, the all new sports shoes fits the needs of multiple running consumers by offering an athletic and a lifestyle look.', 'sports_shoes.jpg', 26, 5000.00),
(2, 'BOLT2', 'Cap', 'A sleek, tonal stitched cap for runners. The plain texture and unique design will help runners to concentrate more on running and less on their hair. The combination of casual and formal look is just brilliant.', 'cap.jpg', 7, 200.00),
(3, 'BOLT3', 'Sports Band', 'The Sports Band collection features highly polished stainless steel and space black stainless steel cases. The display is protected by sapphire crystal. And there is a choice of three different leather bands.', 'sports_band.jpg', 34, 1000.00);

-- Table structure for table "users"
--

CREATE TABLE IF NOT EXISTS "users" (
  "id" serial NOT NULL,
  "fname" varchar(255) NOT NULL,
  "lname" varchar(255) NOT NULL,
  "address" varchar(255) NOT NULL,
  "city" varchar(100) NOT NULL,
  "pin" int NOT NULL,
  "email" varchar(255) NOT NULL,
  "password" varchar(15) NOT NULL,
  "type" varchar(20) NOT NULL default 'user',
  PRIMARY KEY  ("id"),
  UNIQUE ("email")
);

--
-- Dumping data for table "users"
--

INSERT INTO "users" ("id", "fname", "lname", "address", "city", "pin", "email", "password", "type") VALUES
(1, 'Steve', 'Jobs', 'Infinite Loop', 'California', 95014, 'sjobs@apple.com', 'steve', 'user'),
(2, 'Admin', 'Webmaster', 'Internet', 'Electricity', 101010, 'admin@admin.com', 'admin', 'admin');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

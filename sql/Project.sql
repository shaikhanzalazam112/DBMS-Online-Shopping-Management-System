-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2026 at 07:09 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `online shopping management system`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_type` enum('shipping','biling') NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) NOT NULL,
  `city` varchar(100) NOT NULL,
  `state` varchar(100) NOT NULL,
  `postal_code` varchar(20) NOT NULL,
  `country` varchar(100) NOT NULL,
  `is_default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `addresses`
--

INSERT INTO `addresses` (`address_id`, `user_id`, `address_type`, `line1`, `line2`, `city`, `state`, `postal_code`, `country`, `is_default`) VALUES
(1, 1, 'shipping', 'House 5 Street 3 Latifabad', '', 'Hyderabad', 'Sindh', '71000', 'Pakistan', 1),
(2, 2, 'shipping', 'Flat 12 Block B Gulberg', '', 'Lahore', 'Punjab', '54000', 'Pakistan', 1),
(3, 3, 'shipping', 'House 22 F-7', '', 'Islamabad', 'Federal', '44000', 'Pakistan', 1),
(4, 4, 'shipping', 'House 8 DHA Phase 2', '', 'Karachi', 'Sindh', '75500', 'Pakistan', 1),
(5, 5, 'shipping', 'Plot 15 Sector G-11', '', 'Islamabad', 'Federal', '44100', 'Pakistan', 1),
(6, 6, 'shipping', 'House 3 Model Town', '', 'Lahore', 'Punjab', '54700', 'Pakistan', 1),
(7, 7, 'shipping', 'Flat 6 Clifton Block 4', '', 'Karachi', 'Sindh', '75600', 'Pakistan', 1),
(8, 8, 'shipping', 'House 18 Johar Town', '', 'Lahore', 'Punjab', '54782', 'Pakistan', 1),
(9, 9, 'shipping', 'House 9 Unit 6', '', 'Hyderabad', 'Sindh', '71100', 'Pakistan', 1),
(10, 10, 'shipping', 'House 33 Hayatabad', '', 'Peshawar', 'KPK', '25000', 'Pakistan', 1);

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`cart_id`, `user_id`, `created_at`) VALUES
(1, 1, '0000-00-00 00:00:00'),
(2, 2, '0000-00-00 00:00:00'),
(3, 3, '0000-00-00 00:00:00'),
(4, 4, '0000-00-00 00:00:00'),
(5, 5, '0000-00-00 00:00:00'),
(6, 6, '0000-00-00 00:00:00'),
(7, 7, '0000-00-00 00:00:00'),
(8, 8, '0000-00-00 00:00:00'),
(9, 9, '0000-00-00 00:00:00'),
(10, 10, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `cart_items`
--

CREATE TABLE `cart_items` (
  `cart_item_id` int(11) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart_items`
--

INSERT INTO `cart_items` (`cart_item_id`, `cart_id`, `product_id`, `quantity`, `unit_price`) VALUES
(1, 1, 1, 2, 3150.00),
(2, 1, 5, 1, 855.00),
(3, 2, 6, 1, 2090.00),
(4, 3, 2, 1, 2800.00),
(5, 4, 15, 1, 5000.00),
(6, 5, 4, 2, 4200.00),
(7, 6, 9, 3, 800.00),
(8, 7, 11, 2, 800.00),
(9, 8, 7, 1, 1800.00),
(10, 9, 3, 1, 1275.00),
(11, 10, 10, 1, 2400.00);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Women', 'Womens clothing and accessories'),
(2, 'Men', 'Mens clothing and accessories'),
(3, 'Kids', 'Childrens clothing'),
(4, 'Sale', 'Discounted items'),
(5, 'Accessories', 'Bags, belts, scarves and more');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `description` varchar(255) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL,
  `discount_amount` decimal(10,2) NOT NULL,
  `valid_from` date NOT NULL,
  `valid_to` date NOT NULL,
  `usage_limit` int(11) NOT NULL,
  `usage_count` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `code`, `description`, `discount_percent`, `discount_amount`, `valid_from`, `valid_to`, `usage_limit`, `usage_count`, `active`) VALUES
(1, 'SAVE10', '10 percent off on all items', 10.00, 0.00, '2025-01-01', '2025-12-31', 100, 5, 1),
(2, 'WELCOME20', '20 percent off for new users', 20.00, 0.00, '2025-01-01', '2025-12-31', 50, 2, 1),
(3, 'EID30', '30 percent off for Eid sale', 30.00, 0.00, '2025-03-01', '2025-04-30', 200, 10, 1),
(4, 'SUMMER15', '15 percent off summer collection', 15.00, 0.00, '2025-05-01', '2025-08-31', 150, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `inventory_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `last_updated` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`inventory_id`, `product_id`, `supplier_id`, `quantity`, `last_updated`) VALUES
(289, 1, 1, 50, '0000-00-00 00:00:00'),
(290, 2, 1, 30, '0000-00-00 00:00:00'),
(291, 3, 1, 25, '0000-00-00 00:00:00'),
(292, 4, 2, 40, '0000-00-00 00:00:00'),
(293, 5, 2, 60, '0000-00-00 00:00:00'),
(294, 6, 2, 40, '0000-00-00 00:00:00'),
(295, 7, 3, 60, '0000-00-00 00:00:00'),
(296, 8, 3, 35, '0000-00-00 00:00:00'),
(297, 9, 3, 80, '0000-00-00 00:00:00'),
(298, 10, 4, 20, '0000-00-00 00:00:00'),
(299, 11, 1, 80, '0000-00-00 00:00:00'),
(300, 12, 1, 45, '0000-00-00 00:00:00'),
(301, 13, 2, 30, '0000-00-00 00:00:00'),
(302, 14, 2, 100, '0000-00-00 00:00:00'),
(303, 15, 4, 15, '0000-00-00 00:00:00'),
(304, 16, 4, 40, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `billing_address_id` int(11) NOT NULL,
  `coupon_id` int(11) DEFAULT NULL,
  `order_status` varchar(20) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `order_date` datetime DEFAULT current_timestamp(),
  `total_amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `shipping_address_id`, `billing_address_id`, `coupon_id`, `order_status`, `payment_status`, `order_date`, `total_amount`) VALUES
(1, 1, 1, 1, 1, 'delivered', 'paid', '2026-04-17 17:10:45', 5670.00),
(2, 2, 2, 2, NULL, 'shipped', 'paid', '2026-04-17 17:10:45', 2090.00),
(3, 3, 3, 3, 2, 'delivered', 'paid', '2026-04-17 17:10:45', 2240.00),
(4, 4, 4, 4, NULL, 'pending', 'unpaid', '2026-04-17 17:10:45', 5000.00),
(5, 5, 5, 5, 3, 'processing', 'paid', '2026-04-17 17:10:45', 2940.00),
(6, 6, 6, 6, NULL, 'delivered', 'paid', '2026-04-17 17:10:45', 1800.00),
(7, 7, 7, 7, 1, 'shipped', 'paid', '2026-04-17 17:10:45', 2835.00),
(8, 8, 8, 8, NULL, 'pending', 'unpaid', '2026-04-17 17:10:45', 1800.00),
(9, 9, 9, 9, 4, 'delivered', 'paid', '2026-04-17 17:10:45', 1083.00),
(10, 10, 10, 10, NULL, 'processing', 'paid', '2026-04-17 17:10:45', 2400.00);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `order_item_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`order_item_id`, `order_id`, `product_id`, `quantity`, `unit_price`) VALUES
(14, 1, 1, 1, 3150.00),
(15, 1, 5, 1, 855.00),
(16, 1, 11, 2, 800.00),
(17, 2, 6, 1, 2090.00),
(18, 3, 2, 1, 2800.00),
(19, 4, 15, 1, 5000.00),
(20, 5, 4, 1, 4200.00),
(21, 6, 7, 1, 1800.00),
(22, 7, 3, 1, 1275.00),
(23, 7, 5, 1, 855.00),
(24, 8, 7, 1, 1800.00),
(25, 9, 14, 2, 600.00),
(26, 10, 10, 1, 2400.00);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `payment_status` varchar(20) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `paid_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `order_id`, `payment_method`, `payment_status`, `transaction_id`, `amount`, `paid_at`) VALUES
(1, 1, 'jazzcash', 'paid', 'TXN-001-2025', 5670.00, '2025-01-10 10:30:00'),
(2, 2, 'easypaisa', 'paid', 'TXN-002-2025', 2090.00, '2025-01-12 14:20:00'),
(3, 3, 'bank_transfer', 'paid', 'TXN-003-2025', 2240.00, '2025-01-15 09:00:00'),
(4, 4, 'cash_on_delivery', 'pending', 'TXN-004-2025', 5000.00, '2025-01-17 12:00:00'),
(5, 5, 'jazzcash', 'paid', 'TXN-005-2025', 2940.00, '2025-01-18 16:45:00'),
(6, 6, 'cash_on_delivery', 'paid', 'TXN-006-2025', 1800.00, '2025-01-20 11:00:00'),
(7, 7, 'easypaisa', 'paid', 'TXN-007-2025', 2835.00, '2025-01-22 13:30:00'),
(8, 8, 'cash_on_delivery', 'pending', 'TXN-008-2025', 1800.00, '2025-01-24 09:00:00'),
(9, 9, 'bank_transfer', 'paid', 'TXN-009-2025', 1083.00, '2025-01-25 10:15:00'),
(10, 10, 'jazzcash', 'paid', 'TXN-010-2025', 2400.00, '2025-01-27 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` text NOT NULL,
  `sku` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `discount_percent` decimal(5,2) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `weight` decimal(10,2) NOT NULL,
  `color` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `name`, `description`, `sku`, `price`, `discount_percent`, `stock_quantity`, `weight`, `color`, `brand`, `created_at`) VALUES
(1, 1, 'Floral Maxi Dress', 'Elegant floral print maxi dress', 'WD-001', 3500.00, 10.00, 50, 0.00, 'Red', 'Zara', '0000-00-00 00:00:00'),
(2, 1, 'Silk Kurta', 'Beautiful embroidered silk kurta', 'WK-001', 2800.00, 0.00, 30, 0.00, 'Blue', 'Khaadi', '0000-00-00 00:00:00'),
(3, 1, 'Embroidered Shawl', 'Handcrafted embroidered shawl', 'WS-001', 1500.00, 15.00, 25, 0.00, 'Green', 'Alkaram', '0000-00-00 00:00:00'),
(4, 1, 'Lawn Suit', '3 piece printed lawn suit', 'WL-001', 4200.00, 0.00, 40, 0.00, 'Pink', 'Gul Ahmed', '0000-00-00 00:00:00'),
(5, 1, 'Chiffon Dupatta', 'Light chiffon dupatta with lace border', 'WCD-001', 900.00, 5.00, 60, 0.00, 'White', 'Sapphire', '0000-00-00 00:00:00'),
(6, 2, 'Slim Fit Jeans', 'Classic slim fit denim jeans', 'MJ-001', 2200.00, 5.00, 40, 0.00, 'Dark Blue', 'Levis', '0000-00-00 00:00:00'),
(7, 2, 'Formal Shirt', 'Premium cotton formal shirt', 'MS-001', 1800.00, 0.00, 60, 0.00, 'White', 'Bonanza', '0000-00-00 00:00:00'),
(8, 2, 'Shalwar Kameez', 'Traditional cotton shalwar kameez', 'MSK-001', 2500.00, 10.00, 35, 0.00, 'Beige', 'Junaid Jamshed', '0000-00-00 00:00:00'),
(9, 2, 'Casual T-Shirt', 'Comfortable round neck t-shirt', 'MT-001', 800.00, 0.00, 80, 0.00, 'Black', 'Outfitters', '0000-00-00 00:00:00'),
(10, 2, 'Waistcoat', 'Formal waistcoat for men', 'MW-001', 3000.00, 20.00, 20, 0.00, 'Navy', 'Eden Robe', '0000-00-00 00:00:00'),
(11, 3, 'Kids T-Shirt', 'Soft cotton kids t-shirt', 'KT-001', 800.00, 0.00, 80, 0.00, 'Yellow', 'Outfitters', '0000-00-00 00:00:00'),
(12, 3, 'Girls Frock', 'Cute printed frock for girls', 'KF-001', 1200.00, 10.00, 45, 0.00, 'Purple', 'Khaadi Kids', '0000-00-00 00:00:00'),
(13, 3, 'Boys Jeans', 'Durable denim jeans for boys', 'KJ-001', 1500.00, 0.00, 30, 0.00, 'Blue', 'Levis Kids', '0000-00-00 00:00:00'),
(14, 4, 'Sale Kurti', 'Discounted printed kurti', 'SK-001', 600.00, 30.00, 100, 0.00, 'Orange', 'Nishat', '0000-00-00 00:00:00'),
(15, 5, 'Leather Handbag', 'Premium leather handbag', 'AB-001', 5000.00, 0.00, 15, 0.00, 'Brown', 'Stylo', '0000-00-00 00:00:00'),
(16, 5, 'Silk Scarf', 'Elegant silk scarf', 'AS-001', 1200.00, 0.00, 40, 0.00, 'Multicolor', 'Zara', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `comment` text NOT NULL,
  `review_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `rating`, `comment`, `review_date`) VALUES
(1, 1, 1, 5, 'Absolutely loved this dress! Perfect fit and beautiful fabric.', '0000-00-00 00:00:00'),
(2, 1, 5, 4, 'Great quality dupatta, very light and elegant.', '0000-00-00 00:00:00'),
(3, 2, 6, 4, 'Good jeans, comfortable and stylish.', '0000-00-00 00:00:00'),
(4, 3, 2, 5, 'The silk kurta is gorgeous! Got so many compliments.', '0000-00-00 00:00:00'),
(5, 5, 4, 4, 'Beautiful lawn suit, worth the price.', '0000-00-00 00:00:00'),
(6, 6, 7, 3, 'Decent shirt but the stitching could be better.', '0000-00-00 00:00:00'),
(7, 7, 3, 5, 'Stunning shawl! Exactly as described.', '0000-00-00 00:00:00'),
(8, 9, 14, 4, 'Good deal for the price, nice quality kurti.', '0000-00-00 00:00:00'),
(9, 10, 10, 5, 'Excellent waistcoat, looks very formal and smart.', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `shipment_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `courier` varchar(100) NOT NULL,
  `tracking_number` varchar(100) NOT NULL,
  `shipment_status` varchar(20) NOT NULL,
  `shipped_date` datetime NOT NULL,
  `delivered_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shipments`
--

INSERT INTO `shipments` (`shipment_id`, `order_id`, `courier`, `tracking_number`, `shipment_status`, `shipped_date`, `delivered_date`) VALUES
(1, 1, 'TCS', 'TCS-001-2026', 'delivered', '2026-01-11 08:00:00', '2026-01-13 15:00:00'),
(2, 2, 'Leopards', 'LEO-002-2026', 'shipped', '2026-01-13 09:00:00', '2026-01-13 15:00:00'),
(3, 3, 'TCS', 'TCS-003-2025', 'delivered', '2026-01-16 08:00:00', '2026-01-18 14:00:00'),
(4, 4, 'Swyft', 'TCS-004-2026', 'pending', '2026-01-28 10:00:00', '2026-01-18 14:00:00'),
(5, 5, 'TCS', 'TCS-005-2026', 'shipped', '2026-01-19 10:00:00', '2026-01-18 14:00:00'),
(6, 6, 'Leopards', 'LEO-006-2026', 'delivered', '2026-01-21 09:00:00', '2025-01-23 16:00:00'),
(7, 7, 'TCS', 'TCS-007-2026', 'shipped', '2026-01-23 08:00:00', '2026-01-18 14:00:00'),
(8, 8, 'Swyft', 'TCS-008-2026', 'pending', '2026-01-28 10:00:00', '2026-01-16 14:00:00'),
(9, 9, 'TCS', 'TCS-009-2026', 'delivered', '2026-01-26 09:00:00', '2025-01-28 13:00:00'),
(10, 10, 'Leopards', 'LEO-010-2026', 'shipped', '2026-01-28 10:00:00', '2026-02-18 14:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `contact_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `address` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`supplier_id`, `name`, `contact_name`, `email`, `phone`, `address`) VALUES
(1, 'FashionHub Ltd', 'Sara Khan', 'sara@fashionhub.com', '0300-1234567', 'Karachi'),
(2, 'StyleCraft Co', 'Ali Raza', 'ali@stylecraft.com', '0311-9876543', 'Lahore'),
(3, 'TrendZone', 'Maria Ahmed', 'maria@trendzone.com', '0321-5556677', 'Islamabad'),
(4, 'FabricWorld', 'Usman Sheikh', 'usman@fabricworld.com', '0333-4443322', 'Faisalabad');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `gender` enum('M','F','O') NOT NULL,
  `date_of_birth` date NOT NULL,
  `created_at` datetime NOT NULL,
  `status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `email`, `password`, `first_name`, `last_name`, `phone`, `gender`, `date_of_birth`, `created_at`, `status`) VALUES
(1, 'nadia_k', 'nadia@email.com', 'pass123', 'Nadia', 'Khan', '0300-1111111', 'F', '2000-05-15', '0000-00-00 00:00:00', 'active'),
(2, 'anzal', 'anzal@email.com', 'pass123', 'Anzal', 'Shaikh', '0300-2222222', 'F', '1998-03-20', '0000-00-00 00:00:00', 'active'),
(3, 'sara_m', 'sara@email.com', 'pass123', 'Sara', 'Malik', '0300-3333333', 'F', '1999-07-10', '0000-00-00 00:00:00', 'active'),
(4, 'usman_s', 'usman@email.com', 'pass123', 'Usman', 'Sheikh', '0300-4444444', 'M', '1997-11-25', '0000-00-00 00:00:00', 'active'),
(5, 'fatima_a', 'fatima@email.com', 'pass123', 'Fatima', 'Ahmed', '0300-5555555', 'F', '2001-01-30', '0000-00-00 00:00:00', 'active'),
(6, 'hassan_b', 'hassan@email.com', 'pass123', 'Hassan', 'Baig', '0300-6666666', 'M', '1996-09-14', '0000-00-00 00:00:00', 'active'),
(7, 'ayesha_q', 'ayesha@email.com', 'pass123', 'Ayesha', 'Qureshi', '0300-7777777', 'F', '2002-04-22', '0000-00-00 00:00:00', 'active'),
(8, 'bilal_h', 'bilal@email.com', 'pass123', 'Bilal', 'Hussain', '0300-8888888', 'M', '1995-08-05', '0000-00-00 00:00:00', 'active'),
(9, 'zara_n', 'zara@email.com', 'pass123', 'Zara', 'Naz', '0300-9999999', 'F', '2003-12-18', '0000-00-00 00:00:00', 'active'),
(10, 'omar_f', 'omar@email.com', 'pass123', 'Omar', 'Farooq', '0301-1111111', 'M', '1994-06-28', '0000-00-00 00:00:00', 'active'),
(11, 'hira_j', 'hira@email.com', 'pass123', 'Hira', 'Javaid', '0301-2222222', 'F', '2000-02-14', '0000-00-00 00:00:00', 'active'),
(12, 'kamran_z', 'kamran@email.com', 'pass123', 'Kamran', 'Zaidi', '0301-3333333', 'M', '1993-10-08', '0000-00-00 00:00:00', 'active'),
(13, 'sana_t', 'sana@email.com', 'pass123', 'Sana', 'Tariq', '0301-4444444', 'F', '1999-05-19', '0000-00-00 00:00:00', 'active'),
(14, 'adeel_ch', 'adeel@email.com', 'pass123', 'Adeel', 'Chaudhry', '0301-5555555', 'M', '1998-07-31', '0000-00-00 00:00:00', 'active'),
(15, 'maryam_r', 'maryam@email.com', 'pass123', 'Maryam', 'Rehman', '0301-6666666', 'F', '2001-09-03', '0000-00-00 00:00:00', 'active'),
(16, 'faisal_m', 'faisal@email.com', 'pass123', 'Faisal', 'Mirza', '0301-7777777', 'M', '1997-03-17', '0000-00-00 00:00:00', 'active'),
(17, 'noor_a', 'noor@email.com', 'pass123', 'Noor', 'Akhtar', '0301-8888888', 'F', '2002-11-09', '0000-00-00 00:00:00', 'active'),
(18, 'tariq_b', 'tariq@email.com', 'pass123', 'Tariq', 'Butt', '0301-9999999', 'M', '1992-01-23', '0000-00-00 00:00:00', 'active'),
(19, 'amna_s', 'amna@email.com', 'pass123', 'Amna', 'Siddiqui', '0302-1111111', 'F', '2000-08-16', '0000-00-00 00:00:00', 'active'),
(20, 'zaid_h', 'zaid@email.com', 'pass123', 'Zaid', 'Hamid', '0302-2222222', 'M', '1996-04-27', '0000-00-00 00:00:00', 'active'),
(21, 'rabia_k', 'rabia@email.com', 'pass123', 'Rabia', 'Khalid', '0302-3333333', 'F', '1999-12-01', '0000-00-00 00:00:00', 'active'),
(22, 'imran_g', 'imran@email.com', 'pass123', 'Imran', 'Ghani', '0302-4444444', 'M', '1991-06-13', '0000-00-00 00:00:00', 'active'),
(23, 'samia_p', 'samia@email.com', 'pass123', 'Samia', 'Pervez', '0302-5555555', 'F', '2003-02-28', '0000-00-00 00:00:00', 'active'),
(24, 'danish_w', 'danish@email.com', 'pass123', 'Danish', 'Waheed', '0302-6666666', 'M', '1995-10-21', '0000-00-00 00:00:00', 'active'),
(25, 'lubna_i', 'lubna@email.com', 'pass123', 'Lubna', 'Irfan', '0302-7777777', 'F', '2001-07-07', '0000-00-00 00:00:00', 'active'),
(26, 'asad_n', 'asad@email.com', 'pass123', 'Asad', 'Nawaz', '0302-8888888', 'M', '1990-03-11', '0000-00-00 00:00:00', 'active'),
(27, 'maham_y', 'maham@email.com', 'pass123', 'Maham', 'Yousuf', '0302-9999999', 'F', '2002-09-24', '0000-00-00 00:00:00', 'active'),
(28, 'rehman_d', 'rehman@email.com', 'pass123', 'Rehman', 'Dar', '0303-1111111', 'M', '1994-05-06', '0000-00-00 00:00:00', 'active'),
(29, 'shazia_l', 'shazia@email.com', 'pass123', 'Shazia', 'Latif', '0303-2222222', 'F', '1998-01-15', '0000-00-00 00:00:00', 'active'),
(30, 'junaid_c', 'junaid@email.com', 'pass123', 'Junaid', 'Chaudhry', '0303-3333333', 'M', '1993-08-19', '0000-00-00 00:00:00', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `wishlists`
--

CREATE TABLE `wishlists` (
  `wishlist_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlists`
--

INSERT INTO `wishlists` (`wishlist_id`, `user_id`, `created_at`) VALUES
(1, 1, '0000-00-00 00:00:00'),
(2, 2, '0000-00-00 00:00:00'),
(3, 3, '0000-00-00 00:00:00'),
(4, 4, '0000-00-00 00:00:00'),
(5, 5, '0000-00-00 00:00:00'),
(6, 6, '0000-00-00 00:00:00'),
(7, 7, '0000-00-00 00:00:00'),
(8, 8, '0000-00-00 00:00:00'),
(9, 9, '0000-00-00 00:00:00'),
(10, 10, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist_items`
--

CREATE TABLE `wishlist_items` (
  `wishlist_item_id` int(11) NOT NULL,
  `wishlist_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `added_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `wishlist_items`
--

INSERT INTO `wishlist_items` (`wishlist_item_id`, `wishlist_id`, `product_id`, `added_at`) VALUES
(1, 1, 2, '0000-00-00 00:00:00'),
(2, 1, 15, '0000-00-00 00:00:00'),
(3, 2, 7, '0000-00-00 00:00:00'),
(4, 3, 1, '0000-00-00 00:00:00'),
(5, 4, 16, '0000-00-00 00:00:00'),
(6, 5, 4, '0000-00-00 00:00:00'),
(7, 6, 10, '0000-00-00 00:00:00'),
(8, 7, 12, '0000-00-00 00:00:00'),
(9, 8, 6, '0000-00-00 00:00:00'),
(10, 9, 3, '0000-00-00 00:00:00'),
(11, 10, 8, '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD PRIMARY KEY (`cart_item_id`),
  ADD KEY `cart_id` (`cart_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`inventory_id`),
  ADD KEY `supplier_id` (`supplier_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `shipping_address_id` (`shipping_address_id`),
  ADD KEY `billing_address_id` (`billing_address_id`),
  ADD KEY `coupon_id` (`coupon_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `categoery_id` (`category_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`shipment_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`supplier_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD PRIMARY KEY (`wishlist_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD PRIMARY KEY (`wishlist_item_id`),
  ADD KEY `wishlist_id` (`wishlist_id`),
  ADD KEY `product_id` (`product_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addresses`
--
ALTER TABLE `addresses`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `cart_items`
--
ALTER TABLE `cart_items`
  MODIFY `cart_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `inventory_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=305;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `order_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `shipment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `wishlists`
--
ALTER TABLE `wishlists`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  MODIFY `wishlist_item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
  ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cart_items`
--
ALTER TABLE `cart_items`
  ADD CONSTRAINT `cart_items_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`cart_id`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipping_address_id`) REFERENCES `addresses` (`address_id`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`billing_address_id`) REFERENCES `addresses` (`address_id`),
  ADD CONSTRAINT `orders_ibfk_4` FOREIGN KEY (`coupon_id`) REFERENCES `coupons` (`coupon_id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`);

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `reviews_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`);

--
-- Constraints for table `wishlists`
--
ALTER TABLE `wishlists`
  ADD CONSTRAINT `wishlists_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `wishlist_items`
--
ALTER TABLE `wishlist_items`
  ADD CONSTRAINT `wishlist_items_ibfk_1` FOREIGN KEY (`wishlist_id`) REFERENCES `wishlists` (`wishlist_id`),
  ADD CONSTRAINT `wishlist_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2025 at 03:16 AM
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
-- Database: `store`
--

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `guest_name` varchar(100) DEFAULT NULL,
  `guest_phone` varchar(20) DEFAULT NULL,
  `guest_address` text DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_id`, `guest_name`, `guest_phone`, `guest_address`, `total`, `created_at`, `updated_at`) VALUES
(1, 3, NULL, NULL, NULL, 99000.00, '2025-05-22 17:43:11', '2025-05-22 17:43:11'),
(2, 3, NULL, NULL, NULL, 99000.00, '2025-05-22 17:44:41', '2025-05-22 17:44:41'),
(3, 3, NULL, NULL, NULL, 99000.00, '2025-05-22 17:45:14', '2025-05-22 17:45:14'),
(4, 3, NULL, NULL, NULL, 99000.00, '2025-05-22 17:46:54', '2025-05-22 17:46:54'),
(5, 3, NULL, NULL, NULL, 54899.00, '2025-05-22 17:47:43', '2025-05-22 17:47:43');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`, `price`, `subtotal`) VALUES
(1, 4, 2, 1, 99000.00, 99000),
(2, 5, 1, 1, 54000.00, 54000),
(3, 5, 3, 1, 599.00, 599),
(4, 5, 7, 1, 300.00, 300);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `slug`, `image_path`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'iPhone 16', '6.1-inch OLED display with Ceramic Shield, 48MP + 12MP dual rear cameras with the new Camera Control button, and a 12MP selfie camera. It runs on the Apple A18 processor with 8GB of RAM and iOS18 operating system with upcoming Apple Intelligence AI features.', 54000.00, 'iphone-16', 'uploads/ip16.jpg', 2, '2025-05-22 11:56:27', '2025-05-22 05:56:27'),
(2, 'MacBook Pro 14', 'Display: 14.2-inch Liquid Retina XDR display with ProMotion technology.\r\nProcessor: Available with M4 Pro or M4 Max chips.\r\nMemory: Configurable to 16GB, 32GB, or 64GB unified memory.\r\nStorage: Options range from 512GB to 8TB SSD.\r\nBattery Life: Up to 18 hours of battery life.', 99000.00, 'macbook-pro-14', 'uploads/mcbook14.jpg', 2, '2025-05-22 12:05:20', '2025-05-22 06:05:20'),
(3, 'Prom Dress', 'Sexy A Line Straps Red Angkle Length Prom Dress/Bday Dress his garment fits true to size. Length: Size S measures 42.12\"from shoulder to hem Bust: Great for any cup size. Waist: Loose Fit. Comfortable room throughout midsection. Hip: Loose Fit - room for hips. Hand Wash Cold.', 599.00, 'prom-dress', 'uploads/bdaydress.jpg', 1, '2025-05-22 12:08:03', '2025-05-22 06:08:03'),
(4, 'Green Dress', 'Beautiful Green Butterfly Side Open Tulle Maxi Dresses Sleeveless', 4000.00, 'green-dress', 'uploads/greendress.webp', 1, '2025-05-22 12:11:54', '2025-05-22 06:11:54'),
(6, 'Wedding Pink Ruffled Print Organza Long Dress Summer', 'Fashion Pink Ruffled Print Organza Long Dress Summer\r\nFabric: Organza\r\nSize & Fit:\r\nFit: This garment fits true to size.\r\nLength: Size S measures 42.12\"from shoulder to hem\r\nBust: Great for any cup size.\r\nWaist: Loose Fit. Comfortable room throughout midsection.\r\nHip: Loose Fit - room for hips.\r\nHand Wash Cold.', 6500.00, 'wedding-pink-ruffled-print-organza-long-dress-summer', 'uploads/rose dress.webp', 1, '2025-05-22 12:15:16', '2025-05-22 06:15:16'),
(7, 'Women Casual Plain Lace T-Shirt', 'Pattern: Plain\r\nStyle: Casual\r\nPlus Size: No\r\nMaterial: Polyester\r\nComposition: 100%Polyester\r\nFit Type: Slim Fit\r\nSheer: No\r\nStretch: High Stretch\r\nRegion of Origin: Mainland China ', 300.00, 'women-casual-plain-lace-t-shirt', 'uploads/top1.webp', 1, '2025-05-22 12:20:45', '2025-05-22 06:20:45'),
(8, 'Cloud Sofa', 'The Ultimate Relaxation For your Home ', 10999.00, 'cloud-sofa', 'uploads/cloudsofa.jpg', 3, '2025-05-22 12:24:11', '2025-05-22 06:24:11'),
(9, 'Pearl Beaded Clutch Bags For Women ', 'Pearl Beaded Clutch Bags For Women \r\nPearl Beaded Clutch Bags For Women Evening Banquet Dress Party Top Handle Bag Flower Decoration ', 1499.00, 'pearl-beaded-clutch-bags-for-women-', 'uploads/f7893162-f530-4a13-8333-a9c3c3329f83.jpg', 1, '2025-05-23 08:46:12', '2025-05-23 02:46:12'),
(10, 'Harlee Shoulder Bag - Red ', 'Harlee Shoulder Bag - Red \r\nMajor Material: Vegan Leather Lining Material: Polyester 11.02\" W x 4.33\" H x 1.65\" D (28cm x 11cm x 4.2cm) Handle Drop: 8.86\" (22.5cm) Gold Hardware Shoulder Undetachable and Unadjustable Strap 1 Interior Slit Pocket Fits for iPhone 15 Pro Max and all sizes of phones which are smaller than it \r\n', 1599.00, 'harlee-shoulder-bag---red-', 'uploads/9d3fcca3-68ab-4250-8c71-514f170ca16d.jpg', 1, '2025-05-23 08:48:04', '2025-05-23 02:48:04'),
(11, 'iPhone 13', 'Sleek and rugged design, new advanced dual camera system for even better photos and videos in low light and, for the first time, Cinema mode\r\n\r\nSuper Retina XDR displays with enhanced OLED technology deliver incredible contrast with true blacks and 28 percent higher peak outdoor brightness (800 nits), with a higher peak brightness for HDR content such as photos and videos at 1,200 nits, while also increasing power efficiency.', 50990.00, 'iphone-13', 'uploads/Apple_iphone13_hero_geo_09142021_inline.jpg.large_2x.jpg', 2, '2025-05-23 09:06:03', '2025-05-23 03:06:03'),
(12, 'iPhone 14', 'The iPhone 14 is Apple\'s 2022 flagship smartphone launched in September 8, 2022 PST. It features a 6.1-inch Super Retina XDR display, 12MP + 12MP dual rear cameras with sensor-shift OIS, and a 12MP selfie camera with autofocus.\r\n\r\nIt runs on an Apple A15 Bionic processor with the iOS 16 operating system. There\'s also 5G connectivity, Face ID biometrics, Wi-Fi 6, NFC, UWB, emergency SOS via satellite, stereo speakers, and up to 512GB of internal storage.', 63990.00, 'iphone-14', 'uploads/iPhone-14-300x225.jpg.webp', 2, '2025-05-23 09:07:51', '2025-05-23 03:07:51'),
(13, 'iPhone 15 Plus', 'The Apple iPhone 15 Plus features a 6.7-inch OLED display, Apple A16 Bionic chipset, 4383 mAh battery, 512 GB storage, 6 GB RAM, and Ceramic Shield glass. It has a dual camera setup on the back with a 48MP main camera and a 12MP ultra-wide sensor. The dimensions are approximately 3.06 inches wide, 6.33 inches tall, 0.31 inch deep, and it weighs 7.09 ounces.', 70990.00, 'iphone-15-plus', 'uploads/1704799924Iphone-15-plus-1-800x800_one_to_one.webp', 2, '2025-05-23 09:11:27', '2025-05-23 03:11:27');

-- --------------------------------------------------------

--
-- Table structure for table `product_categories`
--

CREATE TABLE `product_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `slug` varchar(100) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`, `slug`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'Fashion', 'fashion', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Electronics', 'electronics', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'Home and Appliances', 'home-and-appliances', NULL, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `birthdate` date DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `address`, `phone`, `birthdate`, `created_at`, `updated_at`) VALUES
(1, 'Mantillas,Kris Jay Lon G.', 'jaylonmantillas69@gmail.com', '$2y$10$gxC3AoPvt2rhuMZexxZk.uXdrSJYGHHDV4/RewYt/b0mhDlgIUcbm', NULL, NULL, NULL, '2025-05-22 12:27:40', '2025-05-22 12:27:40'),
(3, 'jaylon', 'jaylonmantillas@gmail.com', '$2y$10$saImHWCOHNG/Ka00yxAWguVTAJqFeLocYdKFBDTcw4l7iZoiWDeeq', NULL, NULL, NULL, '2025-05-22 12:30:43', '2025-05-22 12:30:43');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `category_id` (`category_id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slug` (`slug`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `product_categories` (`id`);

--
-- Constraints for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD CONSTRAINT `product_categories_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_categories` (`id`) ON DELETE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 23, 2025 at 09:04 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(14, '2-in-1 Convertibles'),
(11, 'Business Laptops'),
(10, 'Gaming Laptops'),
(15, 'MacBooks'),
(12, 'Student Laptops'),
(13, 'Ultrabooks');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` int(11) UNSIGNED NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `file_type` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `file_name`, `file_type`) VALUES
(6, 'ASUS ROG Strix G16 (2024).jpg', 'image/jpeg'),
(7, 'MSI Raider GE78 HX.jpg', 'image/jpeg'),
(8, 'Alienware x16 R1.jpg', 'image/jpeg'),
(10, 'Acer Predator Helios Neo 16.jpg', 'image/jpeg'),
(11, 'HP Omen Transcend 16.jpg', 'image/jpeg'),
(12, 'Dell G16 Gaming Laptop.jpg', 'image/jpeg'),
(13, 'ASUS TUF Gaming A15 (2024).jpg', 'image/jpeg'),
(14, 'Lenovo ThinkPad X1 Carbon Gen 11.jpg', 'image/jpeg'),
(15, 'HP EliteBook 840 G10.jpg', 'image/jpeg'),
(16, 'Dell Latitude 7440.jpg', 'image/jpeg'),
(17, 'Microsoft Surface Laptop 5.jpg', 'image/jpeg'),
(18, 'Acer TravelMate P6.jpg', 'image/jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `quantity` varchar(50) DEFAULT NULL,
  `buy_price` decimal(25,2) DEFAULT NULL,
  `sale_price` decimal(25,2) NOT NULL,
  `categorie_id` int(11) UNSIGNED NOT NULL,
  `media_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `quantity`, `buy_price`, `sale_price`, `categorie_id`, `media_id`, `date`) VALUES
(16, 'Asus ROG Zephyrus Duo 16', '12', 141000.00, 150000.00, 10, 6, '2025-04-22 11:04:59'),
(17, 'MSI Raider GE78 HX', '8', 321500.00, 345290.00, 11, 7, '2025-04-22 11:09:23'),
(18, 'Alienware x16 R1', '6', 295450.00, 314990.00, 10, 8, '2025-04-22 11:11:32'),
(19, 'Acer Predator Helios Neo 16', '15', 182250.00, 189990.00, 10, 10, '2025-04-22 11:18:32'),
(20, 'HP Omen Transcend 16', '15', 95990.00, 103950.00, 10, 11, '2025-04-22 11:25:00'),
(21, 'Dell G16 Gaming Laptop', '11', 134950.00, 137990.00, 10, 12, '2025-04-22 11:31:34'),
(22, 'ASUS TUF Gaming A15 (2024)', '14', 135550.00, 138950.00, 10, 13, '2025-04-22 11:33:35'),
(23, 'Lenovo ThinkPad X1 Carbon Gen 11', '36', 81250.00, 83990.00, 11, 14, '2025-04-22 11:45:09'),
(24, 'HP EliteBook 840 G10', '20', 73550.00, 77990.00, 11, 15, '2025-04-22 11:49:52'),
(25, '	Dell Latitude 7440', '29', 55000.00, 59990.00, 11, 16, '2025-04-22 12:00:23'),
(26, 'Microsoft Surface Laptop 5', '19', 87950.00, 94840.00, 11, 17, '2025-04-22 12:02:58'),
(27, 'Acer TravelMate P6', '19', 61850.00, 68850.00, 11, 18, '2025-04-22 12:05:28');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` int(11) UNSIGNED NOT NULL,
  `product_id` int(11) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` decimal(25,2) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `product_id`, `qty`, `price`, `date`) VALUES
(9, 25, 1, 59990.00, '2025-04-22'),
(10, 22, 5, 694750.00, '2025-04-22'),
(11, 23, 5, 419950.00, '2025-04-22'),
(12, 26, 3, 284520.00, '2025-04-22'),
(13, 24, 4, 311960.00, '2025-04-22'),
(14, 23, 3, 251970.00, '2025-04-22'),
(15, 24, 3, 233970.00, '2025-04-22'),
(16, 22, 1, 138950.00, '2025-04-22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(60) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_level` int(11) NOT NULL,
  `image` varchar(255) DEFAULT 'no_image.jpg',
  `status` int(1) NOT NULL,
  `last_login` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `user_level`, `image`, `status`, `last_login`) VALUES
(1, 'Rohit Bisht', 'Admin', 'd033e22ae348aeb5660fc2140aec35850c4da997', 1, 'no_image.png', 1, '2025-04-22 13:27:52'),
(2, 'John Walker', 'special', 'ba36b97a41e7faf742ab09bf88405ac04f99599a', 2, 'no_image.png', 1, '2025-04-19 08:50:08'),
(3, 'Christopher', 'user', '12dea96fec20593566ab75692c9949596833adc9', 3, 'no_image.png', 1, '2025-04-19 08:49:49'),
(4, 'Natie Williams', 'natie', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, NULL),
(5, 'Kevin', 'kevin', '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8', 3, 'no_image.png', 1, '2021-04-04 19:54:29');

-- --------------------------------------------------------

--
-- Table structure for table `user_groups`
--

CREATE TABLE `user_groups` (
  `id` int(11) NOT NULL,
  `group_name` varchar(150) NOT NULL,
  `group_level` int(11) NOT NULL,
  `group_status` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_groups`
--

INSERT INTO `user_groups` (`id`, `group_name`, `group_level`, `group_status`) VALUES
(1, 'Admin', 1, 1),
(2, 'special', 2, 1),
(3, 'User', 3, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `categorie_id` (`categorie_id`),
  ADD KEY `media_id` (`media_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_level` (`user_level`);

--
-- Indexes for table `user_groups`
--
ALTER TABLE `user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `group_level` (`group_level`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_groups`
--
ALTER TABLE `user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `FK_products` FOREIGN KEY (`categorie_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `SK` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_user` FOREIGN KEY (`user_level`) REFERENCES `user_groups` (`group_level`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

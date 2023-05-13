-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 13, 2023 at 07:55 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `name`, `password`, `role_id`) VALUES
(1, 'admin', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 1),
(3, 'admin2', '6216f8a75fd5bb3d5f22b6f9958cdede3fc086c2', 3);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `pid` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `pid`, `name`, `price`, `quantity`, `image`) VALUES
(1, 1, 4, '3', 3, 1, 'f6.png');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id_cate` int(11) NOT NULL,
  `namecate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id_cate`, `namecate`) VALUES
(1, 'fastfood'),
(2, 'desserts'),
(3, 'maindish'),
(4, 'drinks'),
(5, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `number` varchar(12) NOT NULL,
  `message` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(100) NOT NULL,
  `user_id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `number` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `method` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL,
  `total_products` varchar(1000) NOT NULL,
  `total_price` int(100) NOT NULL,
  `placed_on` date NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(20) NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `perm_id` bigint(20) NOT NULL,
  `perm_mod` varchar(5) NOT NULL,
  `perm_desc` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`perm_id`, `perm_mod`, `perm_desc`) VALUES
(1, 'USR', 'config users'),
(2, 'ADMIN', 'config admin'),
(3, 'ADMIN', 'update profile'),
(4, 'ADMIN', 'config register'),
(5, 'PRODU', 'config product'),
(6, 'PRODU', 'update product'),
(7, 'MESS', 'config messenger'),
(8, 'ORDER', 'config order'),
(9, 'AUTH', 'phân quyền'),
(10, 'AUTH', 'thêm quyền'),
(11, 'AUTH', 'sửa quyền'),
(12, 'PRODU', 'category');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `id_cate` int(11) NOT NULL,
  `category` varchar(100) NOT NULL,
  `price` int(10) NOT NULL,
  `image` varchar(100) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `id_cate`, `category`, `price`, `image`, `description`) VALUES
(1, 'Burger1', 1, 'fast food', 3, 'burger-1.png', 'Burger1 ngon lắm'),
(2, 'Cake1', 4, 'desserts', 2, 'dessert-6.png', 'Cake1 béo lắm'),
(3, 'Burger2', 1, 'fast food', 4, 'burger-2.png', 'ngon'),
(4, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(5, 'Dessert4', 4, 'desserts', 1, 'dessert-4.png', 'Dessert4 ngon lắm '),
(6, 'Spa', 2, 'main dish', 3, 'dish-1.png', 'bổ'),
(7, 'Dessert2', 4, 'desserts', 2, 'dessert-2.png', 'Dessert2 bắt mắt'),
(8, 'Beef', 2, 'main dish', 5, 'dish-4.png', 'tươi ngon'),
(9, 'Spa seafood', 2, 'main dish', 3, 'dish-3.png', 'ngon'),
(10, 'spa 2', 2, 'main dish', 3, 'dish-2.png', 'ngon'),
(11, 'spa 3', 2, 'main dish', 2, 'dish-1.png', 'ngon'),
(12, 'spa5', 2, 'main dish', 4, 'dish-3.png', 'ngon'),
(13, 'spa6', 2, 'main dish', 2, 'dish-2.png', 'bổ'),
(14, 'Burger1', 1, 'fast food', 3, 'burger-1.png', 'Burger1 ngon lắm'),
(15, 'Burger1', 1, 'fast food', 3, 'burger-1.png', 'Burger1 ngon lắm'),
(16, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(17, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(18, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(19, 'spa5', 2, 'main dish', 4, 'dish-3.png', 'ngon'),
(20, 'Cake1', 4, 'desserts', 2, 'dessert-6.png', 'Cake1 béo lắm'),
(21, 'Cake1', 4, 'desserts', 2, 'dessert-6.png', 'Cake1 béo lắm'),
(22, 'Burger2', 1, 'fast food', 4, 'burger-2.png', 'ngon'),
(23, 'Dessert2', 4, 'desserts', 2, 'dessert-2.png', 'Dessert2 bắt mắt'),
(24, 'Dessert2', 4, 'desserts', 2, 'dessert-2.png', 'Dessert2 bắt mắt'),
(25, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(26, 'Burger1', 1, 'fast food', 3, 'burger-1.png', 'Burger1 ngon lắm'),
(27, 'Burger1', 1, 'fast food', 3, 'burger-1.png', 'Burger1 ngon lắm'),
(28, 'spa6', 2, 'main dish', 2, 'dish-2.png', 'bổ'),
(29, 'Spa', 2, 'main dish', 3, 'dish-1.png', 'bổ'),
(30, 'Burger2', 1, 'fast food', 4, 'burger-2.png', 'ngon'),
(31, 'Dessert4', 4, 'desserts', 1, 'dessert-4.png', 'Dessert4 ngon lắm '),
(32, 'spa6', 2, 'main dish', 2, 'dish-2.png', 'bổ'),
(33, 'Orange juice', 3, 'drinks', 5, 'drink-1.png', 'bổ'),
(34, 'Beef', 2, 'main dish', 5, 'dish-4.png', 'tươi ngon'),
(35, 'spa5', 2, 'main dish', 4, 'dish-3.png', 'ngon'),
(36, '14', 2, '1', 2, 'f6.png', '2'),
(37, '15', 10, '1', 2, 'home-img-2.png', 'test'),
(38, 'admin', 1, 'fastfood', 1, 'drink-2.png', '1'),
(39, 'admin12345', 1, 'fastfood', 123, 'drink-3.png', '123');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `role_id` bigint(20) NOT NULL,
  `role_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`role_id`, `role_name`) VALUES
(1, 'Manager'),
(2, 'Supervisor'),
(3, 'test');

-- --------------------------------------------------------

--
-- Table structure for table `roles_permissions`
--

CREATE TABLE `roles_permissions` (
  `role_id` bigint(20) NOT NULL,
  `perm_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `roles_permissions`
--

INSERT INTO `roles_permissions` (`role_id`, `perm_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(2, 1),
(3, 12);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(100) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `number` varchar(10) NOT NULL,
  `password` varchar(50) NOT NULL,
  `address` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `number`, `password`, `address`) VALUES
(1, 'user1', 'user1@gmail.com', '0123456789', '40bd001563085fc35165329ea1ff5c5ecbdbbeef', '1, 1, 1, 1, 1, 1, 1 - 1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_id` (`role_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id_cate`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`perm_id`),
  ADD KEY `perm_mod` (`perm_mod`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_cate` (`id_cate`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`role_id`),
  ADD UNIQUE KEY `role_name` (`role_name`);

--
-- Indexes for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD PRIMARY KEY (`role_id`,`perm_id`),
  ADD KEY `fk_roledetail_perm` (`perm_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id_cate` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `perm_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `role_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `fk_roleid` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `roles_permissions`
--
ALTER TABLE `roles_permissions`
  ADD CONSTRAINT `fk_roledetail_perm` FOREIGN KEY (`perm_id`) REFERENCES `permissions` (`perm_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_roledetail_role` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

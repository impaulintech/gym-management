-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2024 at 08:47 PM
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
-- Database: `gym_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL,
  `firstname` varchar(100) NOT NULL,
  `middlename` varchar(100) NOT NULL,
  `lastname` varchar(100) NOT NULL,
  `gender` varchar(20) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `address` text NOT NULL,
  `email` varchar(100) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `trainer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `member_id`, `firstname`, `middlename`, `lastname`, `gender`, `contact`, `address`, `email`, `date_created`, `trainer_id`) VALUES
(5, 58487246, 'Mike', 'D', 'Williams', 'Male', '+14526-5455-44', 'Sample Address', 'mwilliams@sample.com', '2020-10-21 13:18:19', 1),
(6, 59430244, 'Claire', 'D', 'Blake', 'Female', '+18456-5455-55', 'Sample', 'cblake@sample.com', '2020-10-21 14:57:54', 1),
(7, 33479685, 'lknkl', 'lknlkn', 'asd', 'Male', '0923009323', 'adsda', 'adas@asd.com', '2024-10-06 23:53:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(30) NOT NULL,
  `package` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `amount` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package`, `description`, `amount`) VALUES
(2, 'Sample Package', 'Program sample  + trainer', 3500),
(4, 'Monthly Premium', 'Enjoy monthly gym premium session.', 1000);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(30) NOT NULL,
  `registration_id` int(30) NOT NULL,
  `amount` int(30) NOT NULL,
  `remarks` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=registration, 2= monthly payment',
  `date_created` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `registration_id`, `amount`, `remarks`, `type`, `date_created`) VALUES
(1, 2, 4500, 'First payment', 2, '2020-10-21 14:39:26'),
(2, 2, 3500, 'payment for november', 2, '2020-10-21 14:39:52'),
(3, 6, 100, '', 2, '2024-10-07 00:46:14'),
(4, 6, 100, '', 2, '2024-10-07 00:46:25'),
(5, 6, 10000, '', 2, '2024-10-07 00:46:32'),
(6, 8, 500, '', 2, '2024-10-07 00:47:43'),
(7, 8, 1000, '', 2, '2024-10-07 00:47:45'),
(8, 8, 2000, '', 2, '2024-10-07 00:47:51'),
(9, 9, 100, '', 2, '2024-10-07 00:51:13'),
(10, 10, 1232, '', 2, '2024-10-07 00:57:34'),
(11, 10, 0, '', 2, '2024-10-07 00:57:37'),
(12, 10, 0, '', 2, '2024-10-07 00:57:37'),
(13, 10, 0, '', 2, '2024-10-07 00:57:38'),
(14, 10, 0, '', 2, '2024-10-07 00:57:39'),
(15, 10, 0, '', 2, '2024-10-07 00:57:39'),
(16, 10, 0, '', 2, '2024-10-07 00:57:40'),
(17, 10, 0, '', 2, '2024-10-07 00:57:41'),
(18, 11, 0, '', 2, '2024-10-07 01:12:43'),
(19, 11, 0, '', 2, '2024-10-07 01:16:41'),
(20, 11, 0, '', 2, '2024-10-07 01:17:11'),
(21, 11, 87, '', 2, '2024-10-07 02:35:11'),
(22, 11, 22, '', 2, '2024-10-07 02:37:07'),
(23, 11, 124223, '', 2, '2024-10-07 02:38:49'),
(24, 11, 124232, '', 2, '2024-10-07 02:39:02'),
(25, 11, 1, '', 2, '2024-10-07 02:39:39'),
(26, 11, 0, '', 2, '2024-10-07 02:39:43'),
(27, 11, 15000, '', 2, '2024-10-07 02:40:55'),
(28, 11, 0, '', 2, '2024-10-07 02:45:09'),
(29, 11, 1500, '', 2, '2024-10-07 02:45:37'),
(30, 12, 2500, '', 2, '2024-10-07 02:46:44');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(30) NOT NULL,
  `plan` int(30) NOT NULL,
  `amount` float NOT NULL,
  `description` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `plan`, `amount`, `description`) VALUES
(1, 12, 1000, 'asdasdasd');

-- --------------------------------------------------------

--
-- Table structure for table `registration_info`
--

CREATE TABLE `registration_info` (
  `id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL,
  `plan_id` int(30) NOT NULL,
  `package_id` int(30) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `trainer_id` tinyint(30) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0=Inactive, 1= Active',
  `date_created` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registration_info`
--

INSERT INTO `registration_info` (`id`, `member_id`, `plan_id`, `package_id`, `start_date`, `end_date`, `trainer_id`, `status`, `date_created`) VALUES
(2, 5, 1, 2, '2020-10-21', '2021-10-21', 0, 0, '2020-10-21'),
(3, 5, 1, 2, '2020-10-21', '2021-10-21', 0, 0, '2020-10-21'),
(4, 6, 1, 2, '2019-10-19', '2020-10-19', 0, 0, '2020-10-21'),
(5, 6, 1, 2, '2020-10-21', '2021-10-21', 0, 0, '2020-10-21'),
(6, 7, 1, 2, '2024-10-06', '2025-10-06', 1, 0, '2024-10-06'),
(7, 6, 1, 2, '2024-10-06', '2025-10-06', 0, 0, '2024-10-07'),
(8, 5, 1, 2, '2024-10-06', '2025-10-06', 0, 0, '2024-10-07'),
(12, 7, 1, 4, '2024-10-06', '2025-10-06', 1, 1, '2024-10-07');

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `id` int(30) NOT NULL,
  `member_id` int(30) NOT NULL,
  `dow` text NOT NULL,
  `date_from` date NOT NULL,
  `date_to` date NOT NULL,
  `time_from` time NOT NULL,
  `time_to` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `trainers`
--

CREATE TABLE `trainers` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `rate` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trainers`
--

INSERT INTO `trainers` (`id`, `name`, `contact`, `email`, `rate`) VALUES
(1, 'John Smith', '+18456-5455-55', 'jsmith@sample.com', 500);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `username` varchar(200) NOT NULL,
  `password` text NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 3 COMMENT '1=Admin,2=Staff, 3= subscriber'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `registration_info`
--
ALTER TABLE `registration_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trainers`
--
ALTER TABLE `trainers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registration_info`
--
ALTER TABLE `registration_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `trainers`
--
ALTER TABLE `trainers`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

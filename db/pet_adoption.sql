-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 07, 2024 at 10:10 PM
-- Server version: 10.11.9-MariaDB
-- PHP Version: 8.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pet_adoption`
--

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `age` int(11) NOT NULL,
  `description` text NOT NULL,
  `behavior` varchar(200) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `age`, `description`, `behavior`, `photo`) VALUES
(1, 'Bleemk', 4, 'Bleemk is a member of the Gnarp Gnaplians. He is the second in command to Geeble, and originates from Silly Cats. He only knows a very thick accented dialect of Gnarpleese. If you come near to him, he will tell you war stories like your grandfather. ', 'Aggressive, intelligent, but often times brooding. ', 'bleemk.png'),
(2, 'Geeble', 3, 'Geeble is the Leader of the Gnarp Gnaplians an former enemy of Glombie, originating from Planet K.I.T.Y. He is thought to be the direct descendent of the first ever Gnarp Gnaplian to live in the Silly Cats Universe. He has the least amount of power amongst his clowder, yet manages to keep control of them.', 'Geeble is very charismatic, and wins the favour of many people. He keeps his cool, but when you find out about him, he is very very manipulative and double crossing.', 'geeble.png'),
(3, 'Glooble', 2, 'Glooble is a respectable member of the Gnarp Army. Glooble was born very differently from other Gnarp Gnaplians. He was grown in a pot. He has earned several medals of honor and is now acknowledged as one of the most successful and respectable members of the Gnarp Army to date.\r\n', 'Once he grew to maturity and lost his sprouts, he joined the Gnarp Army, determined he could make a difference.', 'glooble.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `role` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD KEY `id` (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

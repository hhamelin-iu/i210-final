-- phpMyAdmin SQL Dump
-- version 5.2.1-4.fc40
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 16, 2024 at 08:24 PM
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
-- Table structure for table `animal_types`
--

CREATE TABLE `animal_types` (
  `id` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `animal_types`
--

INSERT INTO `animal_types` (`id`, `type_name`) VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Bird');

-- --------------------------------------------------------

--
-- Table structure for table `breeds`
--

CREATE TABLE `breeds` (
  `id` int(11) NOT NULL,
  `breed_name` varchar(100) NOT NULL,
  `animal_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`id`, `breed_name`, `animal_type_id`) VALUES
(1, 'Pug', 1),
(2, 'Persian', 2),
(3, 'Parrot', 3),
(4, 'Maine Coon', 2),
(5, 'Tabby', 2);

-- --------------------------------------------------------

--
-- Table structure for table `pets`
--

CREATE TABLE `pets` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `animal` int(11) NOT NULL,
  `breed` int(255) NOT NULL,
  `age` int(11) NOT NULL,
  `description` text NOT NULL,
  `behavior` varchar(200) NOT NULL,
  `photo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `animal`, `breed`, `age`, `description`, `behavior`, `photo`) VALUES
(1, 'Bleemk', 2, 2, 4, 'Bleemk is a member of the Gnarp Gnaplians. He is the second in command to Geeble, and originates from Silly Cats. He only knows a very thick accented dialect of Gnarpleese. If you come near to him, he will tell you war stories like your grandfather. ', 'Aggressive, intelligent, but often times brooding. ', 'www/img/animals/bleemk.png'),
(2, 'Geeble', 1, 1, 3, 'Geeble is the Leader of the Gnarp Gnaplians an former enemy of Glombie, originating from Planet K.I.T.Y. He is thought to be the direct descendent of the first ever Gnarp Gnaplian to live in the Silly Cats Universe. He has the least amount of power amongst his clowder, yet manages to keep control of them.', 'Geeble is very charismatic, and wins the favour of many people. He keeps his cool, but when you find out about him, he is very very manipulative and double crossing.', 'www/img/animals/geeble.png'),
(3, 'Glooble', 2, 2, 2, 'Glooble is a respectable member of the Gnarp Army. Glooble was born very differently from other Gnarp Gnaplians. He was grown in a pot. He has earned several medals of honor and is now acknowledged as one of the most successful and respectable members of the Gnarp Army to date.\r\n', 'Once he grew to maturity and lost his sprouts, he joined the Gnarp Army, determined he could make a difference.', 'www/img/animals/glooble.jpg'),
(13, 'Glorpo', 2, 5, 3, 'One of the most mysterious characters in the Silly Cats Universe. He appears as a hidden character but is in fact a very integral part of his clowder. ', 'Mysterious...', 'www/img/animals/1734197731_glorpo.png'),
(14, 'Gnapy', 2, 2, 1, 'Gnapy is the medic and gardener of the Gnarp Gnaplians. He is an important addition to his clowder. He wants to help his clowder in any way he can. ', 'Gnapy is very kind and mature, and extremely altruistic, because of his several encounters with hardship which he does not want to happen to anybody he knows', 'www/img/animals/1734214207_gnapy.png'),
(15, 'Zim Zorp', 2, 4, 2, 'Zim Zorp acts as a spy for Geeble and Gnapy to find enemies and herbs for the two of them. His height is 1 sauce and his weight is 0.5 sauces.', 'Aggressive, Energetic, Mean, Loud.', 'www/img/animals/1734214327_zim_zorp.png');

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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `password`, `role`) VALUES
(1, 'admin', 'man', 'admin', 'password', 1),
(2, 'Haven', 'Hamelin', 'user', 'password', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `animal_types`
--
ALTER TABLE `animal_types`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `breeds`
--
ALTER TABLE `breeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `animal_type_id` (`animal_type_id`);

--
-- Indexes for table `pets`
--
ALTER TABLE `pets`
  ADD KEY `id` (`id`),
  ADD KEY `fk_pets_animal` (`animal`),
  ADD KEY `fk_pets_breed` (`breed`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `animal_types`
--
ALTER TABLE `animal_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `breeds`
--
ALTER TABLE `breeds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pets`
--
ALTER TABLE `pets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `breeds`
--
ALTER TABLE `breeds`
  ADD CONSTRAINT `breeds_ibfk_1` FOREIGN KEY (`animal_type_id`) REFERENCES `animal_types` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `fk_pets_animal` FOREIGN KEY (`animal`) REFERENCES `animal_types` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_pets_breed` FOREIGN KEY (`breed`) REFERENCES `breeds` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

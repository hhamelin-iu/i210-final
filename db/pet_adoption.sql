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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `breeds`
--

INSERT INTO `breeds` (`id`, `breed_name`, `animal_type_id`) VALUES
(1, 'Pug', 1),
(2, 'Persian', 2),
(3, 'Parrot', 3),
(4, 'Maine Coon', 2),
(5, 'Tabby', 2),
(6, 'Domestic Shorthair', 2),
(7, 'Siamese', 2),
(8, 'Sphynx', 2),
(9, 'Ragdoll', 2),
(10, 'British Shorthair', 2),
(11, 'Bengal', 2),
(12, 'Scottish Fold', 2),
(13, 'Tuxedo', 2),
(14, 'Calico', 2),
(15, 'Silly Shorthair', 2),
(16, 'Gnaplian Tabby', 2);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `animal`, `breed`, `age`, `description`, `behavior`, `photo`) VALUES
(1, 'Almano', 2, 2, 6, 'Introducing Almano, an absolute sweetheart with a big heart and a unique charm!

Almano Biography [ ]

Is Almano the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/glooble.jpg'),
(2, 'Artyom', 2, 10, 7, 'Say hello to Artyom! This wonderful feline is searching for a loving home.

Artyom Artyom, Observing the famous Artyom Gaze.

Ready to welcome Artyom into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy', 'www/img/animals/artyom.png'),
(3, 'Ah So Cat', 2, 13, 1, 'Meet Ah So Cat, a one-of-a-kind companion ready to bring endless joy to your family.

In their spare time, Ah So Cat enjoys staying busy with work as a Community Companion.

Ah So Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/ah_so_cat.png'),
(4, 'Aoba', 2, 4, 1, 'Aoba is a truly unforgettable pet looking for a comfy couch and a caring owner.

Aoba is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Aoba is ready to start their next chapter with a devoted family.', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/aoba.png'),
(5, 'Angelina', 2, 15, 2, 'Looking for a cuddle buddy? Angelina might just be your perfect match!

Angelina is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Angelina and give this special pet the loving home they deserve.', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/angelina.png'),
(6, 'Baguette Dude', 2, 9, 4, 'Give a warm welcome to Baguette Dude, an adventurous and spirited friend.

- EtharViolo DISCLAIMER! This article contains subject may be considered sensitive to reader, avoid this article if you are sensitive to topics of Kidnapping, Mental Ilnesss and Mutalation . Baguette Dude

Don''t miss the chance to bring Baguette Dude home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/baguette_dude.png'),
(7, 'Ben', 2, 13, 5, 'Ben is ready to make your house feel like home.

Ben is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Ben the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/ben.png'),
(8, 'Bathder', 2, 13, 6, 'If you''re seeking a loyal and affectionate partner, look no further than Bathder.

Bathder is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bathder would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/bathder.png'),
(9, 'Baskit Cat', 2, 13, 2, 'Meet Baskit Cat! Blessed with a colorful personality and endless charm.

In their spare time, Baskit Cat enjoys staying busy with work as a Pro Basketball Player.

Baskit Cat is up to date on vaccinations and ready to head home with you!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/baskit_cat.png'),
(10, 'Bat Cat', 2, 4, 4, 'Bat Cat has arrived at the shelter and is eager to meet their new best friend.

Bat Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Bat Cat be the missing piece in your family? Come meet them today!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/bat_cat.png'),
(11, 'Big Billy', 2, 4, 3, 'With a majestic presence and a gentle heart, Big Billy is waiting for you.

Big Billy i am big billy the biggest wet willy

Is Big Billy the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/big_billy.png'),
(12, 'Bentley', 2, 16, 3, 'Say hi to Bentley, a delightful pet who loves making new friends.

In their spare time, Bentley enjoys staying busy with work as a Farming. They are a proud member of The GOODings.

Ready to welcome Bentley into your life? Contact our adoption team now.', 'Gentle-natured, Kind-hearted, Affectionate (Farming)', 'www/img/animals/bentley.png'),
(13, 'Bernard', 2, 13, 3, 'Bernard is a precious soul ready for their next big chapter in a forever home.

Bernard is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bernard is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'www/img/animals/bernard.png'),
(14, 'Billy', 2, 14, 5, 'Ready to open your heart? Billy is waiting to meet their forever family.

In their spare time, Billy enjoys staying busy with work as a Community Companion.

Billy is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/billy.png'),
(15, 'Bb', 2, 13, 4, 'Bb is an extraordinary pet with a story to tell and plenty of love to give.

Bb is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Bb and give this special pet the loving home they deserve.', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/bb.png'),
(16, 'Bingus', 2, 8, 1, 'Meet the wonderful Bingus! A curious and lovable companion looking for adoption.

Bingus Bingus Bingus the II Bingus

In their spare time, Bingus enjoys staying busy with work as a Community Companion.

Don''t miss the chance to bring Bingus home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/bingus.png'),
(17, 'BOB of Bobstein', 2, 2, 2, 'Introducing BOB of Bobstein, an absolute sweetheart with a big heart and a unique charm!

Bob of Bobstein and revengful

In their spare time, BOB of Bobstein enjoys staying busy with work as a Revenging Viper Bridgeman.

Give BOB of Bobstein the fresh start they''ve been waiting for!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/glooble.jpg'),
(18, 'Bingus/Bingus the II', 2, 8, 5, 'Say hello to Bingus/Bingus the II! This wonderful feline is searching for a loving home.

Bingus Bingus Bingus the II Bingus the II Normal Brainus

Bingus/Bingus the II would love to meet you—schedule a visit and fall in love!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/bingus_bingus_the_ii.png'),
(19, 'Bleg', 2, 14, 1, 'Meet Bleg, a one-of-a-kind companion ready to bring endless joy to your family.

Bleg is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bleg is up to date on vaccinations and ready to head home with you!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/bleg.png'),
(20, 'Bleemk', 2, 16, 5, 'Bleemk is a truly unforgettable pet looking for a comfy couch and a caring owner.

Bleemk is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Bleemk be the missing piece in your family? Come meet them today!', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/bleemk.png'),
(21, 'Bob', 2, 9, 3, 'Looking for a cuddle buddy? Bob might just be your perfect match!

Bob Normal With Caption

In their spare time, Bob enjoys staying busy with work as a Birthdaying. They are a proud member of Shadow wizard money gang.

Is Bob the furry friend you''ve been searching for? Apply to adopt today!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/bob.png'),
(22, 'Bounty hunter cat', 2, 15, 7, 'Give a warm welcome to Bounty hunter cat, an adventurous and spirited friend.

Bounty hunter cat

Ready to welcome Bounty hunter cat into your life? Contact our adoption team now.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/bounty_hunter_cat.png'),
(23, 'Bubble Cat', 2, 13, 5, 'Bubble Cat is ready to make your house feel like home.

Bubble cat Status Retired

In their spare time, Bubble Cat enjoys staying busy with work as a Community Companion. They are a proud member of Bads (Previously). They sport a striking Black/White coat.

Bubble Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/bubble_cat.png'),
(24, 'Brunnincast', 2, 15, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Brunnincast.

Brunnincast is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Brunnincast is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy', 'www/img/animals/brunnincast.png'),
(25, 'Buck', 2, 15, 5, 'Meet Buck! Blessed with a colorful personality and endless charm.

Buck is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Buck and give this special pet the loving home they deserve.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/buck.png'),
(26, 'Bungus', 2, 8, 6, 'Bungus has arrived at the shelter and is eager to meet their new best friend.

Russel James Collins Jr

In their spare time, Bungus enjoys staying busy with work as a Judging who goes to heck and who goes to not heck,.

Don''t miss the chance to bring Bungus home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy (Judging who goes to heck and who goes to not heck<br>)', 'www/img/animals/bungus.png'),
(27, 'Cala', 2, 5, 6, 'With a majestic presence and a gentle heart, Cala is waiting for you.

In their spare time, Cala enjoys staying busy with work as a Singer. They sport a striking Orange coat.

Give Cala the fresh start they''ve been waiting for!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/cala.png'),
(28, 'Canela', 2, 2, 7, 'Say hi to Canela, a delightful pet who loves making new friends.

- EtharViolo Canela

Canela would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/canela.png'),
(29, 'Cement Joe', 2, 5, 6, 'Cement Joe is a precious soul ready for their next big chapter in a forever home.

Cement Joe My Stomach Hurts

They sport a striking Light and Dark brown coat.

Cement Joe is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/cement_joe.png'),
(30, 'Cheeseburger', 2, 10, 5, 'Ready to open your heart? Cheeseburger is waiting to meet their forever family.

Cheeseburger is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Cheeseburger be the missing piece in your family? Come meet them today!', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/cheeseburger.png'),
(31, 'Cokey Cola', 2, 13, 6, 'Cokey Cola is an extraordinary pet with a story to tell and plenty of love to give.

In their spare time, Cokey Cola enjoys staying busy with work as a Advertising. They are a proud member of FACT.

Is Cokey Cola the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/cokey_cola.png'),
(32, 'Chipi Chipi Chapa Chapa Cat', 2, 14, 4, 'Meet the wonderful Chipi Chipi Chapa Chapa Cat! A curious and lovable companion looking for adoption.

Chipi Chipi Chapa Chapa Cat

In their spare time, Chipi Chipi Chapa Chapa Cat enjoys staying busy with work as a Bouncing.

Ready to welcome Chipi Chipi Chapa Chapa Cat into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/chipi_chipi_chapa_chapa_cat.png'),
(33, 'Cuh', 2, 13, 2, 'Introducing Cuh, an absolute sweetheart with a big heart and a unique charm!

Cuh is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Cuh is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/cuh.png'),
(34, 'Deksy', 2, 5, 2, 'Say hello to Deksy! This wonderful feline is searching for a loving home.

Spoiler warning! Actually it''s not a spoiler , but it rather means this article is very high quality!

Deksy is ready to start their next chapter with a devoted family.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/deksy.png'),
(35, 'Cwawa', 2, 8, 3, 'Meet Cwawa, a one-of-a-kind companion ready to bring endless joy to your family.

Cwawa is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Cwawa and give this special pet the loving home they deserve.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/cwawa.png'),
(36, 'Demon Cat', 2, 4, 7, 'Demon Cat is a truly unforgettable pet looking for a comfy couch and a caring owner.

Demon Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Demon Cat home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy', 'www/img/animals/demon_cat.png'),
(37, 'Demonic Little Grey Cat', 2, 14, 2, 'Looking for a cuddle buddy? Demonic Little Grey Cat might just be your perfect match!

Demonic Little Grey Cat

Give Demonic Little Grey Cat the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/demonic_little_grey_cat.png'),
(38, 'Demetrus P. Dinklebottom', 2, 4, 3, 'Give a warm welcome to Demetrus P. Dinklebottom, an adventurous and spirited friend.

Demetrus P. Dinklebottom

In their spare time, Demetrus P. Dinklebottom enjoys staying busy with work as a Crime Boss. They sport a striking White coat.

Demetrus P. Dinklebottom would love to meet you—schedule a visit and fall in love!', 'Charismatic, Confident, Leader (Crime Boss)', 'www/img/animals/demetrus_p__dinklebottom.png'),
(39, 'Dietzen D. Dinklebottom', 2, 4, 6, 'Dietzen D. Dinklebottom is ready to make your house feel like home.

Dinklebottom

Dietzen D. Dinklebottom is up to date on vaccinations and ready to head home with you!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/dietzen_d__dinklebottom.png'),
(40, 'Dmitri', 2, 8, 2, 'If you''re seeking a loyal and affectionate partner, look no further than Dmitri.

Diechmen Family Vampirius Dmitri Skeletus Ramses Dmitri

Could Dmitri be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/dmitri.png'),
(41, 'Doobis', 2, 14, 7, 'Meet Doobis! Blessed with a colorful personality and endless charm.

In their spare time, Doobis enjoys staying busy with work as a Being crew chief. They are a proud member of Gloopy, Zoom zingers racing team. They sport a striking white and orange coat.

Is Doobis the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/doobis.png'),
(42, 'Dr Pebba', 2, 11, 3, 'Dr Pebba has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Dr Pebba enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Ready to welcome Dr Pebba into your life? Contact our adoption team now.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/dr_pebba.png'),
(43, 'Dr Peppy', 2, 11, 6, 'With a majestic presence and a gentle heart, Dr Peppy is waiting for you.

In their spare time, Dr Peppy enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Dr Peppy is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/dr_peppy.png'),
(44, 'Doudou(Oye)', 2, 10, 6, 'Say hi to Doudou(Oye), a delightful pet who loves making new friends.

Doudou(oye), ah yes, The very funky and wonky cat, But what is her story? Contents 1 Oye 2 Who is Doudou? 3 Extras 4 Silly Gallery Oye [ ] Doudou(oye) is a cat, owned by user on Instagram.

Doudou(Oye) is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy', 'www/img/animals/doudou_oye.png'),
(45, 'Dr. Silly Willy', 2, 13, 3, 'Dr. Silly Willy is a precious soul ready for their next big chapter in a forever home.

Dr. Silly Willy is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Dr. Silly Willy and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'www/img/animals/dr__silly_willy.png'),
(46, 'Drazy Cat', 2, 7, 2, 'Ready to open your heart? Drazy Cat is waiting to meet their forever family.

Drazy Cat nation

Don''t miss the chance to bring Drazy Cat home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/drazy_cat.png'),
(47, 'Drefis', 2, 13, 4, 'Drefis is an extraordinary pet with a story to tell and plenty of love to give.

Drefis is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Drefis the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/drefis.png'),
(48, 'Edward', 2, 15, 5, 'Meet the wonderful Edward! A curious and lovable companion looking for adoption.

Edward is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Edward would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/edward.png'),
(49, 'Eepeer (Endless Eeps)', 2, 14, 4, 'Introducing Eepeer (Endless Eeps), an absolute sweetheart with a big heart and a unique charm!

Eepeer (Endless Eeps) is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Eepeer (Endless Eeps) is up to date on vaccinations and ready to head home with you!', 'Sleepy, Cuddly, Mellow', 'www/img/animals/eepeer__endless_eeps.png'),
(50, 'El Gato', 2, 7, 3, 'Say hello to El Gato! This wonderful feline is searching for a loving home.

In their spare time, El Gato enjoys staying busy with work as a Civil Rights Activist,.

Could El Gato be the missing piece in your family? Come meet them today!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/el_gato.png'),
(51, 'E. Scrunk', 2, 14, 1, 'Meet E. Scrunk, a one-of-a-kind companion ready to bring endless joy to your family.

In their spare time, E. Scrunk enjoys staying busy with work as a Scientist. They sport a striking Orange & White coat.

Is E. Scrunk the furry friend you''ve been searching for? Apply to adopt today!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/e__scrunk.png'),
(52, 'Evil Cat', 2, 5, 6, 'Evil Cat is a truly unforgettable pet looking for a comfy couch and a caring owner.

In their spare time, Evil Cat enjoys staying busy with work as a Community Companion. They are a proud member of Himself.

Ready to welcome Evil Cat into your life? Contact our adoption team now.', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'www/img/animals/evil_cat.png'),
(53, 'Ethel the Cat', 2, 6, 2, 'Looking for a cuddle buddy? Ethel the Cat might just be your perfect match!

Ethel the Cat Ethel Removed BG/Meme GS

Ethel the Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'www/img/animals/ethel_the_cat.png'),
(54, 'Ernesto', 2, 13, 2, 'Give a warm welcome to Ernesto, an adventurous and spirited friend.

Ernesto is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ernesto is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/ernesto.png'),
(55, 'Ethan', 2, 7, 7, 'Ethan is ready to make your house feel like home.

Ethan muehehe...

Come say hello to Ethan and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'www/img/animals/ethan.png'),
(56, 'Eyebrow', 2, 6, 6, 'If you''re seeking a loyal and affectionate partner, look no further than Eyebrow.

Eyebrow is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Eyebrow home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/eyebrow.png'),
(57, 'Fanter', 2, 11, 7, 'Meet Fanter! Blessed with a colorful personality and endless charm.

In their spare time, Fanter enjoys staying busy with work as a Delivering Fanta to everyone in the neighborhood. They are a proud member of FACT.

Give Fanter the fresh start they''ve been waiting for!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/fanter.png'),
(58, 'Ferret', 2, 1, 1, 'Ferret has arrived at the shelter and is eager to meet their new best friend.

Ferret is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ferret would love to meet you—schedule a visit and fall in love!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/ferret.png'),
(59, 'Floppa', 2, 11, 2, 'With a majestic presence and a gentle heart, Floppa is waiting for you.

In their spare time, Floppa enjoys staying busy with work as a Community Companion. They are a proud member of The GOODings.

Floppa is up to date on vaccinations and ready to head home with you!', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'www/img/animals/floppa.png'),
(60, 'Fouet', 2, 9, 5, 'Say hi to Fouet, a delightful pet who loves making new friends.

Fouet is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Fouet be the missing piece in your family? Come meet them today!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/fouet.png'),
(61, 'Future Kitty', 2, 14, 4, 'Future Kitty is a precious soul ready for their next big chapter in a forever home.

Future Kitty With Upgrades Without Upgrades

In their spare time, Future Kitty enjoys staying busy with work as a Time Traveling,. They are a proud member of The GOODings, 3KHURA.

Is Future Kitty the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate (Time Traveling<br>)', 'www/img/animals/future_kitty.png'),
(62, 'Gentleman', 2, 6, 7, 'Ready to open your heart? Gentleman is waiting to meet their forever family.

Gentleman is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Gentleman into your life? Contact our adoption team now.', 'Charismatic, Confident, Leader', 'www/img/animals/gentleman.png'),
(63, 'Gangster bob', 2, 10, 5, 'Gangster bob is an extraordinary pet with a story to tell and plenty of love to give.

Gangster bob Status Dead bottom Date of Birth Place of Birth 1999 Bikini bottom Date of Death Place of Death 1997 (wait how) Silly city Physical Description Gender Male He cool [ ] hes very cool and he got da moneys he dead tho So sad [ ] he died in the great cereal competition Story [ ] was born in the bikini bottom hood and had to make money by selling what he called sponges which was illegal in that time and he had to descise himself as a cat to not be arrested one day he decided to turn his life around and move to silly city where he entered in the great cereal competition where he then died cause he remembered he can’t breath air

Gangster bob is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'www/img/animals/gangster_bob.png'),
(64, 'Geeble', 2, 1, 7, 'Meet the wonderful Geeble! A curious and lovable companion looking for adoption.

In their spare time, Geeble enjoys staying busy with work as a Being an alien doing alien things.. They are a proud member of Gnarp Gnaplians.

Geeble is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy (Being an alien doing alien things.)', 'www/img/animals/geeble.png'),
(65, 'Glombie', 2, 16, 4, 'Introducing Glombie, an absolute sweetheart with a big heart and a unique charm!

Glombie is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Glombie and give this special pet the loving home they deserve.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/glombie.png'),
(66, 'Gloober', 2, 5, 1, 'Say hello to Gloober! This wonderful feline is searching for a loving home.

Gloober Napsworth Blanketson

Don''t miss the chance to bring Gloober home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy', 'www/img/animals/gloober.png'),
(67, 'Glooble', 2, 16, 2, 'Meet Glooble, a one-of-a-kind companion ready to bring endless joy to your family.

Glooble is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Glooble the fresh start they''ve been waiting for!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/glooble.png'),
(68, 'Glungus', 2, 4, 7, 'Glungus is a truly unforgettable pet looking for a comfy couch and a caring owner.

Glungus is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Glungus would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/glungus.png'),
(69, 'Glorpo', 2, 16, 5, 'Looking for a cuddle buddy? Glorpo might just be your perfect match!

Glorpo is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Glorpo is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy', 'www/img/animals/glorpo.png'),
(70, 'Gnapy', 2, 16, 1, 'Give a warm welcome to Gnapy, an adventurous and spirited friend.

In their spare time, Gnapy enjoys staying busy with work as a Gnapping. They are a proud member of Gnarp Gnaplians.

Could Gnapy be the missing piece in your family? Come meet them today!', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/gnapy.png'),
(71, 'Goga Cat', 2, 7, 2, 'Goga Cat is ready to make your house feel like home.

Goga Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Goga Cat the furry friend you''ve been searching for? Apply to adopt today!', 'Charismatic, Confident, Leader', 'www/img/animals/goga_cat.png'),
(72, 'Goober the Eighth', 2, 5, 4, 'If you''re seeking a loyal and affectionate partner, look no further than Goober the Eighth.

Goober the Eighth

Ready to welcome Goober the Eighth into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/goober_the_eighth.png'),
(73, 'Goober the Fourth', 2, 6, 7, 'Meet Goober the Fourth! Blessed with a colorful personality and endless charm.

Goober the Fourth

Goober the Fourth is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/goober_the_fourth.png'),
(74, 'Goober the Fifth', 2, 13, 5, 'Goober the Fifth has arrived at the shelter and is eager to meet their new best friend.

Goober the fifth

Goober the Fifth is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy', 'www/img/animals/goober_the_fifth.png'),
(75, 'Goober the Ninth', 2, 13, 7, 'With a majestic presence and a gentle heart, Goober the Ninth is waiting for you.

Goober the Ninth Affiliation Occupation The Goober Guys Making mechs Marital Status Single Physical Description Gender Fur Color Male White, grey and black Height Weight 12 sauces 14 sauces Appearances First Appearance Last Appearance Goober Guys Goober Guys Goober the Ninth was always fascinated by robots, He loves wood, Metal, Copper, Stone and to make robots with them. Mechs [ ] He used to love making little robots when he was a kid, He used to make them to help him with little task like cleaning his room or doing to dishes. Now, With years of experience under his belt, He makes giant metal megastructure he calls ''''Mechs'''' and has even made some mechs for some members of the team (Goober the Sixth and Goober the Fourth).

Come say hello to Goober the Ninth and give this special pet the loving home they deserve.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/goober_the_ninth.png'),
(76, 'Goober the Second', 2, 9, 7, 'Say hi to Goober the Second, a delightful pet who loves making new friends.

Goober the Second

Don''t miss the chance to bring Goober the Second home—fill out an adoption inquiry today.', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/goober_the_second.png'),
(77, 'Goober the Third', 2, 13, 1, 'Goober the Third is a precious soul ready for their next big chapter in a forever home.

Goober the Third

Give Goober the Third the fresh start they''ve been waiting for!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/goober_the_third.png'),
(78, 'Goober the Sixth', 2, 13, 1, 'Ready to open your heart? Goober the Sixth is waiting to meet their forever family.

Goober the Sixth

Goober the Sixth would love to meet you—schedule a visit and fall in love!', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/goober_the_sixth.png'),
(79, 'Goober the Tenth', 2, 10, 2, 'Goober the Tenth is an extraordinary pet with a story to tell and plenty of love to give.

Goober the Tenth

Goober the Tenth is up to date on vaccinations and ready to head home with you!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/goober_the_tenth.png'),
(80, 'Goofus', 2, 13, 5, 'Meet the wonderful Goofus! A curious and lovable companion looking for adoption.

- EtharViolo Goofus Affiliation Occupation The GOODings Exposing discord group chats for fun Date of Birth Place of Birth Unknown Venice,Italy Marital Status Married Physical Description Gender Breed Fur Color Male American Curl Orange Height Weight 18 sauces 80 sauces Appearances First Appearance Last Appearance B.A.D’s group chat The of the Silly and Unsilly (Pt.3) Goofus is a minor character and a member of The GOODings, He is known for leaking B.A.D’s group chat for The GOODings which exposed A couple of cats in B.A.D He was A major contributor in of the Silly and Unsilly by fighting alongside his comrades most especially Fouet and Dimden against B.A.D He also is one of the few cats according to A VerySilly Interview to have been associated with Cuh , Buh and Guh before the episode, The Friends due to him researching on their impact on silly cat history Contents 1 Apperances 1.1 Silly Cats 1.2 Silly Cats: Online 2 Biography Apperances [ ] Silly Cats [ ] Goofus would appear in mid season 2 and would do his iconic leak against B.A.D, changing modern history and also was a major side character for some episodes in season 2 however he was still a minor chacter for most of the series until The of the Silly and Unsilly (pt 1-3) came around were he almost died helping Edward, Dimdem and Fouet in part 1 and fought regularly in the other parts Silly Cats: Online [ ] Goofus would appear as a quest, his quest was actually a little mini game on the serie''s trivia and the player would try to guess 7-10 of all 10 questions, if suceeded. Goofus would give you a sword as a award Biography [ ] Goofus was born in Venice,Italy. Over there he would often listen to gossip and drama and try to expose some cats just for the shits and giggles.

Could Goofus be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/goofus.png'),
(81, 'Grinwatcher/Underling', 2, 6, 6, 'Introducing Grinwatcher/Underling, an absolute sweetheart with a big heart and a unique charm!

Grinwatcher/Underling is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Grinwatcher/Underling the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/grinwatcher_underling.png'),
(82, 'Grinwatcher', 2, 14, 3, 'Say hello to Grinwatcher! This wonderful feline is searching for a loving home.

In their spare time, Grinwatcher enjoys staying busy with work as a Community Companion. They are a proud member of Heck. They sport a striking Orange and yellow coat.

Ready to welcome Grinwatcher into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Community Companion)', 'www/img/animals/grinwatcher.png'),
(83, 'Grinwatcher/Right Hand Smiles', 2, 14, 7, 'Meet Grinwatcher/Right Hand Smiles, a one-of-a-kind companion ready to bring endless joy to your family.

Right Hand Smiles

Grinwatcher/Right Hand Smiles is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/grinwatcher_right_hand_smiles.png'),
(84, 'Grumpy Cat', 2, 10, 5, 'Grumpy Cat is a truly unforgettable pet looking for a comfy couch and a caring owner.

May Grumpy Cat rest in peace. [ Source ] Grumpy cat

In their spare time, Grumpy Cat enjoys staying busy with work as a Thinking. They are a proud member of Gloopy.

Grumpy Cat is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy (Thinking)', 'www/img/animals/grumpy_cat.png'),
(85, 'Happy Cat', 2, 13, 1, 'Looking for a cuddle buddy? Happy Cat might just be your perfect match!

In their spare time, Happy Cat enjoys staying busy with work as a Happy.

Come say hello to Happy Cat and give this special pet the loving home they deserve.', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/happy_cat.png'),
(86, 'Gusic', 2, 8, 4, 'Give a warm welcome to Gusic, an adventurous and spirited friend.

In their spare time, Gusic enjoys staying busy with work as a God.

Don''t miss the chance to bring Gusic home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/gusic.png'),
(87, 'Herbert', 2, 10, 3, 'Herbert is ready to make your house feel like home.

Herbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Herbert the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/herbert.png'),
(88, 'Hu Cat', 2, 4, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Hu Cat.

Hu Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Hu Cat would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/hu_cat.png'),
(89, 'Jocelin', 2, 13, 2, 'Meet Jocelin! Blessed with a colorful personality and endless charm.

In their spare time, Jocelin enjoys staying busy with work as a Burger King employee (Very wise). They are a proud member of Seal team six. They sport a striking Black coat.

Jocelin is up to date on vaccinations and ready to head home with you!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/jocelin.png'),
(90, 'Juice Cat', 2, 14, 4, 'Juice Cat has arrived at the shelter and is eager to meet their new best friend.

Juice Cat Status Skating

Could Juice Cat be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'www/img/animals/juice_cat.png'),
(91, 'Insam', 2, 5, 1, 'With a majestic presence and a gentle heart, Insam is waiting for you.

In their spare time, Insam enjoys staying busy with work as a Archrival.

Is Insam the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, Goofy, High-energy (Archrival)', 'www/img/animals/insam.png'),
(92, 'Juju Nugget', 2, 7, 1, 'Say hi to Juju Nugget, a delightful pet who loves making new friends.

Juju Nugget is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Juju Nugget into your life? Contact our adoption team now.', 'Sleepy, Cuddly, Mellow', 'www/img/animals/juju_nugget.png'),
(93, 'Kiw', 2, 13, 6, 'Kiw is a precious soul ready for their next big chapter in a forever home.

In their spare time, Kiw enjoys staying busy with work as a Community Companion.

Kiw is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy (Community Companion)', 'www/img/animals/kiw.png'),
(94, 'Larry', 2, 13, 5, 'Ready to open your heart? Larry is waiting to meet their forever family.

Larry is the main side character of Silly Cats. he''s a black cat with very characteristically long ears and serious face. Larry is the older brother of Maxwell and Jinx as well as a cousin of Uni .

Larry is ready to start their next chapter with a devoted family.', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/larry.png'),
(95, 'Kyky', 2, 13, 5, 'Kyky is an extraordinary pet with a story to tell and plenty of love to give.

Kyky is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Kyky and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'www/img/animals/kyky.png'),
(96, 'Limecat', 2, 11, 4, 'Meet the wonderful Limecat! A curious and lovable companion looking for adoption.

Limecat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Limecat home—fill out an adoption inquiry today.', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/limecat.png'),
(97, 'Leonard', 2, 15, 3, 'Introducing Leonard, an absolute sweetheart with a big heart and a unique charm!

Leonard is a silly kitty that is the owner of a travel agency in Silly City.

Give Leonard the fresh start they''ve been waiting for!', 'Playful, Goofy, High-energy', 'www/img/animals/leonard.png'),
(98, 'Luna the Tabby', 2, 5, 3, 'Say hello to Luna the Tabby! This wonderful feline is searching for a loving home.

Luna (8 years old)

In their spare time, Luna the Tabby enjoys staying busy with work as a Special Investigator. They are a proud member of Federal Buraeu of Investigation. They sport a striking Brown coat.

Luna the Tabby would love to meet you—schedule a visit and fall in love!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/luna_the_tabby.png'),
(99, 'Maxwell', 2, 4, 3, 'Meet Maxwell, a one-of-a-kind companion ready to bring endless joy to your family.

May Maxwell rest in peace. [ Source ] Maxwell

In their spare time, Maxwell enjoys staying busy with work as a Community Companion. They are a proud member of The GOODings, 3KHURA. They sport a striking Bicolor coat.

Maxwell is up to date on vaccinations and ready to head home with you!', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'www/img/animals/maxwell.png'),
(100, 'Meevin', 2, 5, 4, 'Meevin is a truly unforgettable pet looking for a comfy couch and a caring owner.

Meevin is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Meevin be the missing piece in your family? Come meet them today!', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/meevin.png'),
(101, 'Monsert', 2, 7, 3, 'Looking for a cuddle buddy? Monsert might just be your perfect match!

In their spare time, Monsert enjoys staying busy with work as a Delivery. They are a proud member of FACT, insane army.

Is Monsert the furry friend you''ve been searching for? Apply to adopt today!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/monsert.png'),
(102, 'Nilbert', 2, 2, 7, 'Give a warm welcome to Nilbert, an adventurous and spirited friend.

Nilbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Nilbert into your life? Contact our adoption team now.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/nilbert.png'),
(103, 'Neeble', 2, 13, 7, 'Neeble is ready to make your house feel like home.

Neeble is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Neeble is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/neeble.png'),
(104, 'Mrs. Pringleton', 2, 5, 1, 'If you''re seeking a loyal and affectionate partner, look no further than Mrs. Pringleton.

Mrs._Pringleton was last revised by GotenSakurauchi on 25 August, 2024 at 9:10 am.

Mrs. Pringleton is ready to start their next chapter with a devoted family.', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/mrs__pringleton.png'),
(105, 'Panko', 2, 14, 2, 'Meet Panko! Blessed with a colorful personality and endless charm.

Description [ ] Panko

Come say hello to Panko and give this special pet the loving home they deserve.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/panko.png'),
(106, 'Pepsie', 2, 7, 6, 'Pepsie has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Pepsie enjoys staying busy with work as a Delivery. They are a proud member of F.A.C.T..

Don''t miss the chance to bring Pepsie home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy (Delivery)', 'www/img/animals/pepsie.png'),
(107, 'Photosynthesizing', 2, 11, 2, 'With a majestic presence and a gentle heart, Photosynthesizing is waiting for you.

Photosynthesizing Adult Baby

Give Photosynthesizing the fresh start they''ve been waiting for!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/photosynthesizing.png'),
(108, 'Pobis', 2, 5, 6, 'Say hi to Pobis, a delightful pet who loves making new friends.

Pobis is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Pobis would love to meet you—schedule a visit and fall in love!', 'Playful, Goofy, High-energy', 'www/img/animals/pobis.png'),
(109, 'Poncky', 2, 8, 6, 'Poncky is a precious soul ready for their next big chapter in a forever home.

In their spare time, Poncky enjoys staying busy with work as a Delivery of pocky. They are a proud member of FACT.

Poncky is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/poncky.png'),
(110, 'Prince bingulius', 2, 8, 3, 'Ready to open your heart? Prince bingulius is waiting to meet their forever family.

Prince Bingulius

Could Prince bingulius be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'www/img/animals/prince_bingulius.png'),
(111, 'Pusha', 2, 6, 3, 'Pusha is an extraordinary pet with a story to tell and plenty of love to give.

DISCLAIMER! This article contains subject may be considered sensitive to reader, avoid this article if you are sensitive to topics of Communism . May Pusha rest in peace.

Is Pusha the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/pusha.png'),
(112, 'Potato', 2, 4, 2, 'Meet the wonderful Potato! A curious and lovable companion looking for adoption.

Potato is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Potato into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/potato.png'),
(113, 'Prongles', 2, 5, 3, 'Introducing Prongles, an absolute sweetheart with a big heart and a unique charm!

In their spare time, Prongles enjoys staying busy with work as a Failing to obey factory rule. They are a proud member of FACT.

Prongles is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy (Failing to obey factory rule)', 'www/img/animals/prongles.png'),
(114, 'Quetzkol The Incomprehensible Deity', 2, 2, 1, 'Say hello to Quetzkol The Incomprehensible Deity! This wonderful feline is searching for a loving home.

Quetzkol The Incomprehensible Deity Status Incomprehensible Occupation Being Incomprehensible Date of Birth Place of Birth 1 AD Space Marital Status Incomprehensible Physical Description Gender Breed Fur Color Incomprehensible Incomprehensible Incomprehensible Height Weight 0.1 to 1000 sauces Infinite sauces Appearances First Appearance Last Appearance George VS Quetzkol The Incomprehensible Deity Wars of silly and unsilly (cameo) Quetzkol The incomprehensible Deity Is a deity that cannot be comprehended Quetzkol The incomprehensible Deity is the archival of george and fought in the wars of silly and unsilly for a little bit on the front lines against Slorphus'' demons They are also is a timeless god and live on a meteor in space that was shot with missiles by B.A.D angering them they also are a shape-shifter and shape-shift into cat form to be more comprehensible than normal Quetzkol appears to be incredibly powerful and can shape shift between the form of a cat and a creature made out incomprehensible space goop or crystals or an incomprehensible form that causes all mortals who see it to have one of three things happen to them. they go insane 2. they turn into silly gas.

In their spare time, Quetzkol The Incomprehensible Deity enjoys staying busy with work as a Being Incomprehensible. They sport a striking Incomprehensible coat.

Quetzkol The Incomprehensible Deity is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy (Being Incomprehensible)', 'www/img/animals/quetzkol_the_incomprehensible_deity.png'),
(115, 'Radio Cat', 2, 13, 3, 'Meet Radio Cat, a one-of-a-kind companion ready to bring endless joy to your family.

Radio Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Radio Cat and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'www/img/animals/radio_cat.png'),
(116, 'Ramses', 2, 15, 4, 'Ramses is a truly unforgettable pet looking for a comfy couch and a caring owner.

Diechmen Family Vampirius Dmitri Skeletus Ramses Ramses

Don''t miss the chance to bring Ramses home—fill out an adoption inquiry today.', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/ramses.png'),
(117, 'Rigby', 2, 14, 6, 'Looking for a cuddle buddy? Rigby might just be your perfect match!

Rigby is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Rigby the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/rigby.png'),
(118, 'Richer Motion', 2, 13, 1, 'Give a warm welcome to Richer Motion, an adventurous and spirited friend.

Richer Motion Affiliation Occupation B.A.D Kidnapping using money as bait Date of Birth Place of Birth 24th February 2001 Unknown Marital Status None Physical Description Gender Breed Fur Color Male Unknown Unknown Height Weight 8 Sauces 9.6 Sauces Appearances First Appearance Last Appearance The Doorbell The Doorbell Biography [ ] Richer Motion is a highly intelligent A.I robot with very humanoid feeling and features. He is programmed to wander around at night and go up to peoples front doors, baiting people to come outside, when they do the A.I kidnaps them and takes them to a unknown evil creature. Richer Motion appears in one singular episode for 20 minutes when Jinx and the gang are staying over at a abandoned house to keep shelter, it is quite a scary 20 minutes for both the gang and the audience, the doorbell ringing over and over as Richer Motion waits outside, banging on the door louder and louder and louder, eventually Richer Motion leaves.

Richer Motion would love to meet you—schedule a visit and fall in love!', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/richer_motion.png'),
(119, 'Sandwich', 2, 5, 6, 'Sandwich is ready to make your house feel like home.

Sandwich was originally a member of the B.A.D organization, helping significantly in the of the Silly and Unsilly . However, when the organization was dismantled, Sandwich took refuge in a hideout near the Almanga Jungle , seeking safe haven. Soon after, though, the emojicats raided his home and stole all of his belongings.

In their spare time, Sandwich enjoys staying busy with work as a Community Companion. They sport a striking black, orange, faint white coat.

Sandwich is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy (Community Companion)', 'www/img/animals/sandwich.png'),
(120, 'Roobeer', 2, 14, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Roobeer.

In their spare time, Roobeer enjoys staying busy with work as a Mass producing root beer. They are a proud member of FACT.

Could Roobeer be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/roobeer.png'),
(121, 'Scaredy Cat', 2, 13, 6, 'Meet Scaredy Cat! Blessed with a colorful personality and endless charm.

Scaredy Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Scaredy Cat the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/scaredy_cat.png'),
(122, 'Sam', 2, 15, 3, 'Sam has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Sam enjoys staying busy with work as a Mercenary,. They are a proud member of SCAF.

Ready to welcome Sam into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Mercenary<br>)', 'www/img/animals/sam.png'),
(123, 'Samurai Cat', 2, 7, 6, 'With a majestic presence and a gentle heart, Samurai Cat is waiting for you.

Samurai Cat Occupation Samurai Physical Description Gender Fur Color Male White Height Weight 6.2 sauces 14 sauces Contents 1 Biography 2 Assasinations 3 Students 4 Abilities Biography [ ] Samurai Cat was born in Catio , where he was raised in a hidden village in Japan. He wanted to be a Samurai at the age of 5, and he was bullied by his classmates. Every day, Samurai Cat would smack a tree with a wooden stick.

Samurai Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'www/img/animals/samurai_cat.png'),
(124, 'Sheriff Paw', 2, 13, 4, 'Say hi to Sheriff Paw, a delightful pet who loves making new friends.

Sheriff Paw is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Sheriff Paw is ready to start their next chapter with a devoted family.', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/sheriff_paw.png'),
(125, 'Selfie', 2, 5, 6, 'Selfie is a precious soul ready for their next big chapter in a forever home.

Selfie is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Selfie and give this special pet the loving home they deserve.', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/selfie.png'),
(126, 'Sir Meows', 2, 14, 4, 'Ready to open your heart? Sir Meows is waiting to meet their forever family.

May Sir Meows rest in peace. [ Source ] Real life [ ] Sir Meows

Don''t miss the chance to bring Sir Meows home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/sir_meows.png'),
(127, 'Slorphus', 2, 13, 4, 'Slorphus is an extraordinary pet with a story to tell and plenty of love to give.

In their spare time, Slorphus enjoys staying busy with work as a Community Companion.

Give Slorphus the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/slorphus.png'),
(128, 'Skeletus', 2, 14, 2, 'Meet the wonderful Skeletus! A curious and lovable companion looking for adoption.

Diechmen Family Vampirius Dmitri Skeletus Ramses Skeletus

Skeletus would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/skeletus.png'),
(129, 'So Silly', 2, 4, 3, 'Introducing So Silly, an absolute sweetheart with a big heart and a unique charm!

So Silly is a sweet, playful cat looking for a warm and comfortable home to settle down in.

So Silly is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy', 'www/img/animals/so_silly.png'),
(130, 'Snuggles', 2, 8, 1, 'Say hello to Snuggles! This wonderful feline is searching for a loving home.

Snuggles Status Napping Physical Description Height Weight 3 sauces 9 sauces Appearances First Appearance Tumbler Snuggles is a supporting character in Silly Cats . He is an eeper by blood, but was sent over to become the regent king of Bingustan ever since Bingus died. Biography [ ] Snuggles was born to The Eeperia Monarchical family, but Eeper thought him not to be fit to rule over the vast nation of Eeperia .

Could Snuggles be the missing piece in your family? Come meet them today!', 'Sleepy, Cuddly, Mellow', 'www/img/animals/snuggles.png'),
(131, 'Sora', 2, 9, 7, 'Meet Sora, a one-of-a-kind companion ready to bring endless joy to your family.

Sora is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Sora the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate', 'www/img/animals/sora.png'),
(132, 'Spirte', 2, 11, 2, 'Spirte is a truly unforgettable pet looking for a comfy couch and a caring owner.

Spirte of Zabloing

In their spare time, Spirte enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Ready to welcome Spirte into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Delivery)', 'www/img/animals/spirte.png'),
(133, 'Strawberry Cat', 2, 15, 4, 'Looking for a cuddle buddy? Strawberry Cat might just be your perfect match!

Strawberry Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Strawberry Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/strawberry_cat.png'),
(134, 'Terrance', 2, 13, 2, 'Give a warm welcome to Terrance, an adventurous and spirited friend.

Terrance is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Terrance is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/terrance.png'),
(135, 'Tater Tot', 2, 9, 2, 'Tater Tot is ready to make your house feel like home.

May Tater Tot rest in peace. [ Source ] tater tot Status dead.......for real not as a joke :(

Come say hello to Tater Tot and give this special pet the loving home they deserve.', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/tater_tot.png'),
(136, 'Study Cat', 2, 15, 3, 'If you''re seeking a loyal and affectionate partner, look no further than Study Cat.

Study Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Study Cat home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/study_cat.png'),
(137, 'The Meeper', 2, 13, 4, 'Meet The Meeper! Blessed with a colorful personality and endless charm.

In their spare time, The Meeper enjoys staying busy with work as a CEO. They are a proud member of Eeperia.

Give The Meeper the fresh start they''ve been waiting for!', 'Sleepy, Cuddly, Mellow (CEO)', 'www/img/animals/the_meeper.png'),
(138, 'The Fry Stealer', 2, 14, 7, 'The Fry Stealer has arrived at the shelter and is eager to meet their new best friend.

The Fry Stealer is a sweet, playful cat looking for a warm and comfortable home to settle down in.

The Fry Stealer would love to meet you—schedule a visit and fall in love!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/the_fry_stealer.png'),
(139, 'The kungus', 2, 4, 4, 'With a majestic presence and a gentle heart, The kungus is waiting for you.

The klungus 🇺🇸 🇺🇸 🇺🇸 Date of Birth 5/24/1980 Physical Description Gender Boy The klungus is the big goober of the group History [ ] originally joined the Silly Cats in 2002 after winning The great cereal competition after eating 1000 pounds of cereal in 1 second in the year of 1997

The kungus is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy', 'www/img/animals/the_kungus.png'),
(140, 'The Pizzer', 2, 13, 7, 'Say hi to The Pizzer, a delightful pet who loves making new friends.

The Pizzer is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could The Pizzer be the missing piece in your family? Come meet them today!', 'Playful, Goofy, High-energy', 'www/img/animals/the_pizzer.png'),
(141, 'The One Of Them', 2, 2, 2, 'The One Of Them is a precious soul ready for their next big chapter in a forever home.

In their spare time, The One Of Them enjoys staying busy with work as a Being one of them. They are a proud member of Goob. They sport a striking Grey and fluffy coat.

Is The One Of Them the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, Goofy, High-energy (Being one of them)', 'www/img/animals/the_one_of_them.png'),
(142, 'The Sitter', 2, 13, 5, 'Ready to open your heart? The Sitter is waiting to meet their forever family.

In their spare time, The Sitter enjoys staying busy with work as a Sitting.

Ready to welcome The Sitter into your life? Contact our adoption team now.', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/the_sitter.png'),
(143, 'The Teefer', 2, 13, 1, 'The Teefer is an extraordinary pet with a story to tell and plenty of love to give.

In their spare time, The Teefer enjoys staying busy with work as a Biting. They are a proud member of Mechadondon''s pet. They sport a striking Orange coat.

The Teefer is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/the_teefer.png'),
(144, 'Thurston Waffles', 2, 9, 6, 'Meet the wonderful Thurston Waffles! A curious and lovable companion looking for adoption.

May Thurston Waffles rest in peace. [ Source ] Thurston Waffles

Thurston Waffles is ready to start their next chapter with a devoted family.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/thurston_waffles.png'),
(145, 'Tim Tim', 2, 14, 6, 'Introducing Tim Tim, an absolute sweetheart with a big heart and a unique charm!

Tim Tim is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Tim Tim and give this special pet the loving home they deserve.', 'Playful, energetic, and loves interactive toys.', 'www/img/animals/tim_tim.png'),
(146, 'Toby', 2, 13, 2, 'Say hello to Toby! This wonderful feline is searching for a loving home.

In their spare time, Toby enjoys staying busy with work as a Community Companion.

Don''t miss the chance to bring Toby home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy (Community Companion)', 'www/img/animals/toby.png'),
(147, 'Uncle', 2, 6, 7, 'Meet Uncle, a one-of-a-kind companion ready to bring endless joy to your family.

In their spare time, Uncle enjoys staying busy with work as a Music making, mafia boss (Previously). They are a proud member of The mafia (Previously).

Give Uncle the fresh start they''ve been waiting for!', 'Charismatic, Confident, Leader (Music making, mafia boss (Previously))', 'www/img/animals/uncle.png'),
(148, 'Vampirius', 2, 2, 2, 'Vampirius is a truly unforgettable pet looking for a comfy couch and a caring owner.

Diechmen Family Vampirius Dmitri Skeletus Ramses Vampirius

Vampirius would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'www/img/animals/vampirius.png'),
(149, 'Unknown', 2, 5, 4, 'Looking for a cuddle buddy? Unknown might just be your perfect match!

Unknown is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Unknown is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/unknown.png'),
(150, 'Tole Tole', 2, 1, 1, 'Give a warm welcome to Tole Tole, an adventurous and spirited friend.

Tole Tole is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Tole Tole be the missing piece in your family? Come meet them today!', 'Mellow, relaxed, and great with cozy lap naps.', 'www/img/animals/tole_tole.gif'),
(151, 'Watermelon Cat', 2, 10, 2, 'Watermelon Cat is ready to make your house feel like home.

Watermelon Cat Felis Lanatus Citrillus Catus

Is Watermelon Cat the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'www/img/animals/watermelon_cat.png'),
(152, 'Wild Pete', 2, 2, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Wild Pete.

Wild Pete is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Wild Pete into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/wild_pete.png'),
(153, 'Wagoogus Jr.', 2, 13, 5, 'Meet Wagoogus Jr.! Blessed with a colorful personality and endless charm.

In their spare time, Wagoogus Jr. enjoys staying busy with work as a Being a little fella. They are a proud member of Gloopy and Gentleman. They sport a striking Black coat.

Wagoogus Jr. is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy (Being a little fella)', 'www/img/animals/wagoogus_jr.png'),
(154, 'Wire Cat', 2, 15, 6, 'Wire Cat has arrived at the shelter and is eager to meet their new best friend.

Wire cat Occupation Seeking the one truly wireless device Date of Birth Place of Birth 6th of March 1999 Muztagata Mountain, Kyrgyzstan Marital Status Single Physical Description Gender Male Height Weight 5 sauces 3 sauces Wire cat is a cat that loves buying wireless devices, expecting them to lack wires. Outside, they appear to be, however, once taking them apart, Wire cat is constantly disappointed in finding wires inside the device. He has a slight love for the taste of lead.

In their spare time, Wire Cat enjoys staying busy with work as a Seeking the one truly wireless device.

Wire Cat is ready to start their next chapter with a devoted family.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'www/img/animals/wire_cat.png'),
(155, 'Wit Kit', 2, 10, 7, 'With a majestic presence and a gentle heart, Wit Kit is waiting for you.

May Wit Kit rest in peace. [ Source ] Contents 1 Real Life 2 About 3 Appearances 3.1 Silly Cats 3.2 Silly Cats: Babies 4 The End 5 Trivia Real Life [ ] Kitty was 20 Years Old before the end, please remember her. About [ ] Wit Kit

Come say hello to Wit Kit and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'www/img/animals/wit_kit.png'),
(156, 'Wilbert', 2, 13, 2, 'Say hi to Wilbert, a delightful pet who loves making new friends.

Wilbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Wilbert home—fill out an adoption inquiry today.', 'Sleepy, Cuddly, Mellow', 'www/img/animals/wilbert.png'),
(157, 'Wisp', 2, 2, 7, 'Wisp is a precious soul ready for their next big chapter in a forever home.

wisp If you think ill come quietly, Youre DEAD wrong."

Give Wisp the fresh start they''ve been waiting for!', 'Spirited, independent, but very loving with their favorite human.', 'www/img/animals/wisp.png'),
(158, 'Wizard of Spells', 2, 13, 4, 'Ready to open your heart? Wizard of Spells is waiting to meet their forever family.

Wizard of Spells

Wizard of Spells would love to meet you—schedule a visit and fall in love!', 'Playful, Goofy, High-energy', 'www/img/animals/wizard_of_spells.png'),
(159, 'Xiaojie', 2, 6, 7, 'Xiaojie is an extraordinary pet with a story to tell and plenty of love to give.

This page has unreliable information. Go to Catpedia for correct information. xiaojie Gallery [ ] Someone said to her.

Xiaojie is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy', 'www/img/animals/xiaojie.png'),
(160, 'Xorgus', 2, 16, 5, 'Meet the wonderful Xorgus! A curious and lovable companion looking for adoption.

In their spare time, Xorgus enjoys staying busy with work as a DJ at Club Gonk. They are a proud member of Gnarp Gnaplians. They sport a striking Green coat.

Could Xorgus be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'www/img/animals/xorgus.png'),
(161, 'Zim Zorp', 2, 16, 1, 'Introducing Zim Zorp, an absolute sweetheart with a big heart and a unique charm!

Zim Zorp is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Zim Zorp the furry friend you''ve been searching for? Apply to adopt today!', 'Sleepy, Cuddly, Mellow', 'www/img/animals/zim_zorp.png');

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

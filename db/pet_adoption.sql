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
  `photo` varchar(255) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pets`
--

INSERT INTO `pets` (`id`, `name`, `animal`, `breed`, `age`, `description`, `behavior`, `photo`, `status`) VALUES
(1, 'Almano', 2, 10, 6, 'Introducing Almano, an absolute sweetheart with a big heart and a unique charm!

Almano Biography [ ]

Is Almano the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'img/animals/glooble.jpg', 'Available'),
(2, 'Ah So Cat', 2, 13, 1, 'Say hello to Ah So Cat! This wonderful feline is searching for a loving home.

In their spare time, Ah So Cat enjoys staying busy with work as a Community Companion.

Ready to welcome Ah So Cat into your life? Contact our adoption team now.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/ah_so_cat.png', 'Available'),
(3, 'Artyom', 2, 14, 7, 'Meet Artyom, a one-of-a-kind companion ready to bring endless joy to your family.

Artyom Artyom, Observing the famous Artyom Gaze.

Artyom is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'img/animals/artyom.png', 'Available'),
(4, 'Angelina', 2, 12, 2, 'Angelina is a truly unforgettable pet looking for a comfy couch and a caring owner.

Angelina is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Angelina is ready to start their next chapter with a devoted family.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/angelina.png', 'Available'),
(5, 'Aoba', 2, 13, 1, 'Looking for a cuddle buddy? Aoba might just be your perfect match!

Aoba is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Aoba and give this special pet the loving home they deserve.', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/aoba.png', 'Available'),
(6, 'Baguette Dude', 2, 6, 4, 'Give a warm welcome to Baguette Dude, an adventurous and spirited friend.

- EtharViolo DISCLAIMER! This article contains subject may be considered sensitive to reader, avoid this article if you are sensitive to topics of Kidnapping, Mental Ilnesss and Mutalation . Baguette Dude

Don''t miss the chance to bring Baguette Dude home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/baguette_dude.png', 'Available'),
(7, 'Baskit Cat', 2, 13, 2, 'Baskit Cat is ready to make your house feel like home.

In their spare time, Baskit Cat enjoys staying busy with work as a Pro Basketball Player.

Give Baskit Cat the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'img/animals/baskit_cat.png', 'Available'),
(8, 'Bat Cat', 2, 13, 4, 'If you''re seeking a loyal and affectionate partner, look no further than Bat Cat.

Bat Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bat Cat would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/bat_cat.png', 'Available'),
(9, 'Big Billy', 2, 4, 3, 'Meet Big Billy! Blessed with a colorful personality and endless charm.

Big Billy i am big billy the biggest wet willy

Big Billy is up to date on vaccinations and ready to head home with you!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/big_billy.png', 'Available'),
(10, 'Ben', 2, 5, 5, 'Ben has arrived at the shelter and is eager to meet their new best friend.

Ben is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Ben be the missing piece in your family? Come meet them today!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/ben.png', 'Available'),
(11, 'Bentley', 2, 16, 3, 'With a majestic presence and a gentle heart, Bentley is waiting for you.

In their spare time, Bentley enjoys staying busy with work as a Farming. They are a proud member of The GOODings.

Is Bentley the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate (Farming)', 'img/animals/bentley.png', 'Available'),
(12, 'Bernard', 2, 13, 3, 'Say hi to Bernard, a delightful pet who loves making new friends.

Bernard is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Bernard into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy', 'img/animals/bernard.png', 'Available'),
(13, 'Bb', 2, 13, 4, 'Bb is a precious soul ready for their next big chapter in a forever home.

Bb is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bb is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/bb.png', 'Available'),
(14, 'Billy', 2, 5, 5, 'Ready to open your heart? Billy is waiting to meet their forever family.

In their spare time, Billy enjoys staying busy with work as a Community Companion.

Billy is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/billy.png', 'Available'),
(15, 'Bingus', 2, 8, 1, 'Bingus is an extraordinary pet with a story to tell and plenty of love to give.

Bingus Bingus Bingus the II Bingus

In their spare time, Bingus enjoys staying busy with work as a Community Companion.

Come say hello to Bingus and give this special pet the loving home they deserve.', 'Social, confident, and eager to welcome visitors.', 'img/animals/bingus.png', 'Available'),
(16, 'BOB of Bobstein', 2, 4, 2, 'Meet the wonderful BOB of Bobstein! A curious and lovable companion looking for adoption.

Bob of Bobstein and revengful

In their spare time, BOB of Bobstein enjoys staying busy with work as a Revenging Viper Bridgeman.

Don''t miss the chance to bring BOB of Bobstein home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/glooble.jpg', 'Available'),
(17, 'Bingus/Bingus the II', 2, 8, 5, 'Introducing Bingus/Bingus the II, an absolute sweetheart with a big heart and a unique charm!

Bingus Bingus Bingus the II Bingus the II Normal Brainus

Give Bingus/Bingus the II the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/bingus_bingus_the_ii.png', 'Available'),
(18, 'Bleg', 2, 7, 1, 'Say hello to Bleg! This wonderful feline is searching for a loving home.

Bleg is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bleg would love to meet you—schedule a visit and fall in love!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/bleg.png', 'Available'),
(19, 'Bleemk', 2, 16, 5, 'Meet Bleemk, a one-of-a-kind companion ready to bring endless joy to your family.

Bleemk is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Bleemk is up to date on vaccinations and ready to head home with you!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/bleemk.png', 'Available'),
(20, 'Bob', 2, 2, 3, 'Bob is a truly unforgettable pet looking for a comfy couch and a caring owner.

Bob Normal With Caption

In their spare time, Bob enjoys staying busy with work as a Birthdaying. They are a proud member of Shadow wizard money gang.

Could Bob be the missing piece in your family? Come meet them today!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/bob.png', 'Available'),
(21, 'Bounty hunter cat', 2, 12, 7, 'Looking for a cuddle buddy? Bounty hunter cat might just be your perfect match!

Bounty hunter cat

Is Bounty hunter cat the furry friend you''ve been searching for? Apply to adopt today!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/bounty_hunter_cat.png', 'Available'),
(22, 'Brunnincast', 2, 7, 5, 'Give a warm welcome to Brunnincast, an adventurous and spirited friend.

Brunnincast is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Brunnincast into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy', 'img/animals/brunnincast.png', 'Available'),
(23, 'Bubble Cat', 2, 13, 5, 'Bubble Cat is ready to make your house feel like home.

Bubble cat Status Retired

In their spare time, Bubble Cat enjoys staying busy with work as a Community Companion. They are a proud member of Bads (Previously). They sport a striking Black/White coat.

Bubble Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'img/animals/bubble_cat.png', 'Available'),
(24, 'Buck', 2, 7, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Buck.

Buck is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Buck is ready to start their next chapter with a devoted family.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/buck.png', 'Available'),
(25, 'Bungus', 2, 8, 6, 'Meet Bungus! Blessed with a colorful personality and endless charm.

Russel James Collins Jr

In their spare time, Bungus enjoys staying busy with work as a Judging who goes to heck and who goes to not heck,.

Come say hello to Bungus and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy (Judging who goes to heck and who goes to not heck<br>)', 'img/animals/bungus.png', 'Available'),
(26, 'Cala', 2, 5, 6, 'Cala has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Cala enjoys staying busy with work as a Singer. They sport a striking Orange coat.

Don''t miss the chance to bring Cala home—fill out an adoption inquiry today.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/cala.png', 'Available'),
(27, 'Cheeseburger', 2, 7, 5, 'With a majestic presence and a gentle heart, Cheeseburger is waiting for you.

Cheeseburger is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Cheeseburger the fresh start they''ve been waiting for!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/cheeseburger.png', 'Available'),
(28, 'Cement Joe', 2, 14, 6, 'Say hi to Cement Joe, a delightful pet who loves making new friends.

Cement Joe My Stomach Hurts

They sport a striking Light and Dark brown coat.

Cement Joe would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/cement_joe.png', 'Available'),
(29, 'Canela', 2, 13, 7, 'Canela is a precious soul ready for their next big chapter in a forever home.

- EtharViolo Canela

Canela is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/canela.png', 'Available'),
(30, 'Chipi Chipi Chapa Chapa Cat', 2, 9, 4, 'Ready to open your heart? Chipi Chipi Chapa Chapa Cat is waiting to meet their forever family.

Chipi Chipi Chapa Chapa Cat

In their spare time, Chipi Chipi Chapa Chapa Cat enjoys staying busy with work as a Bouncing.

Could Chipi Chipi Chapa Chapa Cat be the missing piece in your family? Come meet them today!', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/chipi_chipi_chapa_chapa_cat.png', 'Available'),
(31, 'Cokey Cola', 2, 13, 6, 'Cokey Cola is an extraordinary pet with a story to tell and plenty of love to give.

In their spare time, Cokey Cola enjoys staying busy with work as a Advertising. They are a proud member of FACT.

Is Cokey Cola the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'img/animals/cokey_cola.png', 'Available'),
(32, 'Cuh', 2, 13, 2, 'Meet the wonderful Cuh! A curious and lovable companion looking for adoption.

Cuh is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Cuh into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/cuh.png', 'Available'),
(33, 'Deksy', 2, 10, 2, 'Introducing Deksy, an absolute sweetheart with a big heart and a unique charm!

Spoiler warning! Actually it''s not a spoiler , but it rather means this article is very high quality!

Deksy is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, energetic, and loves interactive toys.', 'img/animals/deksy.png', 'Available'),
(34, 'Demetrus P. Dinklebottom', 2, 6, 3, 'Say hello to Demetrus P. Dinklebottom! This wonderful feline is searching for a loving home.

Demetrus P. Dinklebottom

In their spare time, Demetrus P. Dinklebottom enjoys staying busy with work as a Crime Boss. They sport a striking White coat.

Demetrus P. Dinklebottom is ready to start their next chapter with a devoted family.', 'Charismatic, Confident, Leader (Crime Boss)', 'img/animals/demetrus_p__dinklebottom.png', 'Available'),
(35, 'Cwawa', 2, 8, 3, 'Meet Cwawa, a one-of-a-kind companion ready to bring endless joy to your family.

Cwawa is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Cwawa and give this special pet the loving home they deserve.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/cwawa.png', 'Available'),
(36, 'Demon Cat', 2, 13, 7, 'Demon Cat is a truly unforgettable pet looking for a comfy couch and a caring owner.

Demon Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Demon Cat home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy', 'img/animals/demon_cat.png', 'Available'),
(37, 'Demonic Little Grey Cat', 2, 12, 2, 'Looking for a cuddle buddy? Demonic Little Grey Cat might just be your perfect match!

Demonic Little Grey Cat

Give Demonic Little Grey Cat the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/demonic_little_grey_cat.png', 'Available'),
(38, 'Dietzen D. Dinklebottom', 2, 9, 6, 'Give a warm welcome to Dietzen D. Dinklebottom, an adventurous and spirited friend.

Dinklebottom

Dietzen D. Dinklebottom would love to meet you—schedule a visit and fall in love!', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/dietzen_d__dinklebottom.png', 'Available'),
(39, 'Dmitri', 2, 8, 2, 'Dmitri is ready to make your house feel like home.

Diechmen Family Vampirius Dmitri Skeletus Ramses Dmitri

Dmitri is up to date on vaccinations and ready to head home with you!', 'Social, confident, and eager to welcome visitors.', 'img/animals/dmitri.png', 'Available'),
(40, 'Doobis', 2, 14, 7, 'If you''re seeking a loyal and affectionate partner, look no further than Doobis.

In their spare time, Doobis enjoys staying busy with work as a Being crew chief. They are a proud member of Gloopy, Zoom zingers racing team. They sport a striking white and orange coat.

Could Doobis be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/doobis.png', 'Available'),
(41, 'Dr Pebba', 2, 11, 3, 'Meet Dr Pebba! Blessed with a colorful personality and endless charm.

In their spare time, Dr Pebba enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Is Dr Pebba the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'img/animals/dr_pebba.png', 'Available'),
(42, 'Dr Peppy', 2, 11, 6, 'Dr Peppy has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Dr Peppy enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Ready to welcome Dr Peppy into your life? Contact our adoption team now.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/dr_peppy.png', 'Available'),
(43, 'Drefis', 2, 13, 4, 'With a majestic presence and a gentle heart, Drefis is waiting for you.

Drefis is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Drefis is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/drefis.png', 'Available'),
(44, 'Dr. Silly Willy', 2, 13, 3, 'Say hi to Dr. Silly Willy, a delightful pet who loves making new friends.

Dr. Silly Willy is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Dr. Silly Willy is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy', 'img/animals/dr__silly_willy.png', 'Available'),
(45, 'Doudou(Oye)', 2, 9, 6, 'Doudou(Oye) is a precious soul ready for their next big chapter in a forever home.

Doudou(oye), ah yes, The very funky and wonky cat, But what is her story? Contents 1 Oye 2 Who is Doudou? 3 Extras 4 Silly Gallery Oye [ ] Doudou(oye) is a cat, owned by user on Instagram.

Come say hello to Doudou(Oye) and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'img/animals/doudou_oye.png', 'Available'),
(46, 'Drazy Cat', 2, 14, 2, 'Ready to open your heart? Drazy Cat is waiting to meet their forever family.

Drazy Cat nation

Don''t miss the chance to bring Drazy Cat home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/drazy_cat.png', 'Available'),
(47, 'El Gato', 2, 15, 3, 'El Gato is an extraordinary pet with a story to tell and plenty of love to give.

In their spare time, El Gato enjoys staying busy with work as a Civil Rights Activist,.

Give El Gato the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'img/animals/el_gato.png', 'Available'),
(48, 'E. Scrunk', 2, 14, 1, 'Meet the wonderful E. Scrunk! A curious and lovable companion looking for adoption.

In their spare time, E. Scrunk enjoys staying busy with work as a Scientist. They sport a striking Orange & White coat.

E. Scrunk would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/e__scrunk.png', 'Available'),
(49, 'Edward', 2, 9, 5, 'Introducing Edward, an absolute sweetheart with a big heart and a unique charm!

Edward is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Edward is up to date on vaccinations and ready to head home with you!', 'Playful, energetic, and loves interactive toys.', 'img/animals/edward.png', 'Available'),
(50, 'Eepeer (Endless Eeps)', 2, 15, 4, 'Say hello to Eepeer (Endless Eeps)! This wonderful feline is searching for a loving home.

Eepeer (Endless Eeps) is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Eepeer (Endless Eeps) be the missing piece in your family? Come meet them today!', 'Sleepy, Cuddly, Mellow', 'img/animals/eepeer__endless_eeps.png', 'Available'),
(51, 'Evil Cat', 2, 13, 6, 'Meet Evil Cat, a one-of-a-kind companion ready to bring endless joy to your family.

In their spare time, Evil Cat enjoys staying busy with work as a Community Companion. They are a proud member of Himself.

Is Evil Cat the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'img/animals/evil_cat.png', 'Available'),
(52, 'Ernesto', 2, 13, 2, 'Ernesto is a truly unforgettable pet looking for a comfy couch and a caring owner.

Ernesto is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Ernesto into your life? Contact our adoption team now.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/ernesto.png', 'Available'),
(53, 'Ethel the Cat', 2, 13, 2, 'Looking for a cuddle buddy? Ethel the Cat might just be your perfect match!

Ethel the Cat Ethel Removed BG/Meme GS

Ethel the Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'img/animals/ethel_the_cat.png', 'Available'),
(54, 'Fanter', 2, 11, 7, 'Give a warm welcome to Fanter, an adventurous and spirited friend.

In their spare time, Fanter enjoys staying busy with work as a Delivering Fanta to everyone in the neighborhood. They are a proud member of FACT.

Fanter is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/fanter.png', 'Available'),
(55, 'Ferret', 2, 16, 1, 'Ferret is ready to make your house feel like home.

Ferret is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Ferret and give this special pet the loving home they deserve.', 'Social, confident, and eager to welcome visitors.', 'img/animals/ferret.png', 'Available'),
(56, 'Eyebrow', 2, 12, 6, 'If you''re seeking a loyal and affectionate partner, look no further than Eyebrow.

Eyebrow is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Eyebrow home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/eyebrow.png', 'Available'),
(57, 'Floppa', 2, 11, 2, 'Meet Floppa! Blessed with a colorful personality and endless charm.

In their spare time, Floppa enjoys staying busy with work as a Community Companion. They are a proud member of The GOODings.

Give Floppa the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'img/animals/floppa.png', 'Available'),
(58, 'Ethan', 2, 7, 7, 'Ethan has arrived at the shelter and is eager to meet their new best friend.

Ethan muehehe...

Ethan would love to meet you—schedule a visit and fall in love!', 'Playful, Goofy, High-energy', 'img/animals/ethan.png', 'Available'),
(59, 'Future Kitty', 2, 14, 4, 'With a majestic presence and a gentle heart, Future Kitty is waiting for you.

Future Kitty With Upgrades Without Upgrades

In their spare time, Future Kitty enjoys staying busy with work as a Time Traveling,. They are a proud member of The GOODings, 3KHURA.

Future Kitty is up to date on vaccinations and ready to head home with you!', 'Gentle-natured, Kind-hearted, Affectionate (Time Traveling<br>)', 'img/animals/future_kitty.png', 'Available'),
(60, 'Gentleman', 2, 15, 7, 'Say hi to Gentleman, a delightful pet who loves making new friends.

Gentleman is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Gentleman be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'img/animals/gentleman.png', 'Available'),
(61, 'Gangster bob', 2, 2, 5, 'Gangster bob is a precious soul ready for their next big chapter in a forever home.

Gangster bob Status Dead bottom Date of Birth Place of Birth 1999 Bikini bottom Date of Death Place of Death 1997 (wait how) Silly city Physical Description Gender Male He cool [ ] hes very cool and he got da moneys he dead tho So sad [ ] he died in the great cereal competition Story [ ] was born in the bikini bottom hood and had to make money by selling what he called sponges which was illegal in that time and he had to descise himself as a cat to not be arrested one day he decided to turn his life around and move to silly city where he entered in the great cereal competition where he then died cause he remembered he can’t breath air

Is Gangster bob the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, Goofy, High-energy', 'img/animals/gangster_bob.png', 'Available'),
(62, 'Geeble', 1, 1, 7, 'Ready to open your heart? Geeble is waiting to meet their forever family.

In their spare time, Geeble enjoys staying busy with work as a Being an alien doing alien things.. They are a proud member of Gnarp Gnaplians.

Ready to welcome Geeble into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Being an alien doing alien things.)', 'img/animals/geeble.png', 'Available'),
(63, 'Glombie', 1, 16, 4, 'Glombie is an extraordinary pet with a story to tell and plenty of love to give.

Glombie is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Glombie is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'img/animals/glombie.png', 'Available'),
(64, 'Fouet', 2, 14, 5, 'Meet the wonderful Fouet! A curious and lovable companion looking for adoption.

Fouet is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Fouet is ready to start their next chapter with a devoted family.', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/fouet.png', 'Available'),
(65, 'Gloober', 2, 5, 1, 'Introducing Gloober, an absolute sweetheart with a big heart and a unique charm!

Gloober Napsworth Blanketson

Come say hello to Gloober and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'img/animals/gloober.png', 'Available'),
(66, 'Glungus', 2, 7, 7, 'Say hello to Glungus! This wonderful feline is searching for a loving home.

Glungus is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Glungus home—fill out an adoption inquiry today.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/glungus.png', 'Available'),
(67, 'Glorpo', 2, 16, 5, 'Meet Glorpo, a one-of-a-kind companion ready to bring endless joy to your family.

Glorpo is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Glorpo the fresh start they''ve been waiting for!', 'Playful, Goofy, High-energy', 'img/animals/glorpo.png', 'Available'),
(68, 'Gnapy', 2, 16, 1, 'Gnapy is a truly unforgettable pet looking for a comfy couch and a caring owner.

In their spare time, Gnapy enjoys staying busy with work as a Gnapping. They are a proud member of Gnarp Gnaplians.

Gnapy would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/gnapy.png', 'Available'),
(69, 'Glooble', 2, 16, 2, 'Looking for a cuddle buddy? Glooble might just be your perfect match!

Glooble is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Glooble is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/glooble.png', 'Available'),
(70, 'Goga Cat', 2, 4, 2, 'Give a warm welcome to Goga Cat, an adventurous and spirited friend.

Goga Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Goga Cat be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'img/animals/goga_cat.png', 'Available'),
(71, 'Goober the Eighth', 2, 13, 4, 'Goober the Eighth is ready to make your house feel like home.

Goober the Eighth

Is Goober the Eighth the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'img/animals/goober_the_eighth.png', 'Available'),
(72, 'Goober the Fifth', 2, 13, 5, 'If you''re seeking a loyal and affectionate partner, look no further than Goober the Fifth.

Goober the fifth

Ready to welcome Goober the Fifth into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy', 'img/animals/goober_the_fifth.png', 'Available'),
(73, 'Goober the Ninth', 2, 13, 7, 'Meet Goober the Ninth! Blessed with a colorful personality and endless charm.

Goober the Ninth Affiliation Occupation The Goober Guys Making mechs Marital Status Single Physical Description Gender Fur Color Male White, grey and black Height Weight 12 sauces 14 sauces Appearances First Appearance Last Appearance Goober Guys Goober Guys Goober the Ninth was always fascinated by robots, He loves wood, Metal, Copper, Stone and to make robots with them. Mechs [ ] He used to love making little robots when he was a kid, He used to make them to help him with little task like cleaning his room or doing to dishes. Now, With years of experience under his belt, He makes giant metal megastructure he calls ''''Mechs'''' and has even made some mechs for some members of the team (Goober the Sixth and Goober the Fourth).

Goober the Ninth is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, energetic, and loves interactive toys.', 'img/animals/goober_the_ninth.png', 'Available'),
(74, 'Goofus', 2, 2, 5, 'Goofus has arrived at the shelter and is eager to meet their new best friend.

- EtharViolo Goofus Affiliation Occupation The GOODings Exposing discord group chats for fun Date of Birth Place of Birth Unknown Venice,Italy Marital Status Married Physical Description Gender Breed Fur Color Male American Curl Orange Height Weight 18 sauces 80 sauces Appearances First Appearance Last Appearance B.A.D’s group chat The of the Silly and Unsilly (Pt.3) Goofus is a minor character and a member of The GOODings, He is known for leaking B.A.D’s group chat for The GOODings which exposed A couple of cats in B.A.D He was A major contributor in of the Silly and Unsilly by fighting alongside his comrades most especially Fouet and Dimden against B.A.D He also is one of the few cats according to A VerySilly Interview to have been associated with Cuh , Buh and Guh before the episode, The Friends due to him researching on their impact on silly cat history Contents 1 Apperances 1.1 Silly Cats 1.2 Silly Cats: Online 2 Biography Apperances [ ] Silly Cats [ ] Goofus would appear in mid season 2 and would do his iconic leak against B.A.D, changing modern history and also was a major side character for some episodes in season 2 however he was still a minor chacter for most of the series until The of the Silly and Unsilly (pt 1-3) came around were he almost died helping Edward, Dimdem and Fouet in part 1 and fought regularly in the other parts Silly Cats: Online [ ] Goofus would appear as a quest, his quest was actually a little mini game on the serie''s trivia and the player would try to guess 7-10 of all 10 questions, if suceeded. Goofus would give you a sword as a award Biography [ ] Goofus was born in Venice,Italy. Over there he would often listen to gossip and drama and try to expose some cats just for the shits and giggles.

Goofus is ready to start their next chapter with a devoted family.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/goofus.png', 'Available'),
(75, 'Goober the Third', 2, 13, 1, 'With a majestic presence and a gentle heart, Goober the Third is waiting for you.

Goober the Third

Come say hello to Goober the Third and give this special pet the loving home they deserve.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/goober_the_third.png', 'Available'),
(76, 'Goober the Fourth', 2, 10, 7, 'Say hi to Goober the Fourth, a delightful pet who loves making new friends.

Goober the Fourth

Don''t miss the chance to bring Goober the Fourth home—fill out an adoption inquiry today.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/goober_the_fourth.png', 'Available'),
(77, 'Goober the Second', 2, 2, 7, 'Goober the Second is a precious soul ready for their next big chapter in a forever home.

Goober the Second

Give Goober the Second the fresh start they''ve been waiting for!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/goober_the_second.png', 'Available'),
(78, 'Goober the Sixth', 2, 13, 1, 'Ready to open your heart? Goober the Sixth is waiting to meet their forever family.

Goober the Sixth

Goober the Sixth would love to meet you—schedule a visit and fall in love!', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/goober_the_sixth.png', 'Available'),
(79, 'Goober the Tenth', 2, 15, 2, 'Goober the Tenth is an extraordinary pet with a story to tell and plenty of love to give.

Goober the Tenth

Goober the Tenth is up to date on vaccinations and ready to head home with you!', 'Social, confident, and eager to welcome visitors.', 'img/animals/goober_the_tenth.png', 'Available'),
(80, 'Grinwatcher/Underling', 2, 15, 6, 'Meet the wonderful Grinwatcher/Underling! A curious and lovable companion looking for adoption.

Grinwatcher/Underling is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Grinwatcher/Underling be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/grinwatcher_underling.png', 'Available'),
(81, 'Grinwatcher', 2, 14, 3, 'Introducing Grinwatcher, an absolute sweetheart with a big heart and a unique charm!

In their spare time, Grinwatcher enjoys staying busy with work as a Community Companion. They are a proud member of Heck. They sport a striking Orange and yellow coat.

Is Grinwatcher the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, Goofy, High-energy (Community Companion)', 'img/animals/grinwatcher.png', 'Available'),
(82, 'Grumpy Cat', 2, 15, 5, 'Say hello to Grumpy Cat! This wonderful feline is searching for a loving home.

May Grumpy Cat rest in peace. [ Source ] Grumpy cat

In their spare time, Grumpy Cat enjoys staying busy with work as a Thinking. They are a proud member of Gloopy.

Ready to welcome Grumpy Cat into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Thinking)', 'img/animals/grumpy_cat.png', 'Available'),
(83, 'Happy Cat', 2, 13, 1, 'Meet Happy Cat, a one-of-a-kind companion ready to bring endless joy to your family.

In their spare time, Happy Cat enjoys staying busy with work as a Happy.

Happy Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/happy_cat.png', 'Available'),
(84, 'Grinwatcher/Right Hand Smiles', 2, 14, 7, 'Grinwatcher/Right Hand Smiles is a truly unforgettable pet looking for a comfy couch and a caring owner.

Right Hand Smiles

Grinwatcher/Right Hand Smiles is ready to start their next chapter with a devoted family.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/grinwatcher_right_hand_smiles.png', 'Available'),
(85, 'Gusic', 2, 8, 4, 'Looking for a cuddle buddy? Gusic might just be your perfect match!

In their spare time, Gusic enjoys staying busy with work as a God.

Come say hello to Gusic and give this special pet the loving home they deserve.', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/gusic.png', 'Available'),
(86, 'Herbert', 2, 4, 3, 'Give a warm welcome to Herbert, an adventurous and spirited friend.

Herbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Don''t miss the chance to bring Herbert home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/herbert.png', 'Available'),
(87, 'Hu Cat', 2, 10, 5, 'Hu Cat is ready to make your house feel like home.

Hu Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Hu Cat the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'img/animals/hu_cat.png', 'Available'),
(88, 'Jocelin', 2, 13, 2, 'If you''re seeking a loyal and affectionate partner, look no further than Jocelin.

In their spare time, Jocelin enjoys staying busy with work as a Burger King employee (Very wise). They are a proud member of Seal team six. They sport a striking Black coat.

Jocelin would love to meet you—schedule a visit and fall in love!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/jocelin.png', 'Available'),
(89, 'Insam', 2, 5, 1, 'Meet Insam! Blessed with a colorful personality and endless charm.

In their spare time, Insam enjoys staying busy with work as a Archrival.

Insam is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy (Archrival)', 'img/animals/insam.png', 'Available'),
(90, 'Juice Cat', 2, 9, 4, 'Juice Cat has arrived at the shelter and is eager to meet their new best friend.

Juice Cat Status Skating

Could Juice Cat be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'img/animals/juice_cat.png', 'Available'),
(91, 'Larry', 2, 13, 5, 'With a majestic presence and a gentle heart, Larry is waiting for you.

Larry is the main side character of Silly Cats. he''s a black cat with very characteristically long ears and serious face. Larry is the older brother of Maxwell and Jinx as well as a cousin of Uni .

Is Larry the furry friend you''ve been searching for? Apply to adopt today!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/larry.png', 'Available'),
(92, 'Kiw', 2, 13, 6, 'Say hi to Kiw, a delightful pet who loves making new friends.

In their spare time, Kiw enjoys staying busy with work as a Community Companion.

Ready to welcome Kiw into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Community Companion)', 'img/animals/kiw.png', 'Available'),
(93, 'Kyky', 2, 13, 5, 'Kyky is a precious soul ready for their next big chapter in a forever home.

Kyky is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Kyky is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy', 'img/animals/kyky.png', 'Available'),
(94, 'Limecat', 2, 11, 4, 'Ready to open your heart? Limecat is waiting to meet their forever family.

Limecat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Limecat is ready to start their next chapter with a devoted family.', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/limecat.png', 'Available'),
(95, 'Juju Nugget', 2, 13, 1, 'Juju Nugget is an extraordinary pet with a story to tell and plenty of love to give.

Juju Nugget is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Juju Nugget and give this special pet the loving home they deserve.', 'Sleepy, Cuddly, Mellow', 'img/animals/juju_nugget.png', 'Available'),
(96, 'Luna the Tabby', 2, 5, 3, 'Meet the wonderful Luna the Tabby! A curious and lovable companion looking for adoption.

Luna (8 years old)

In their spare time, Luna the Tabby enjoys staying busy with work as a Special Investigator. They are a proud member of Federal Buraeu of Investigation. They sport a striking Brown coat.

Don''t miss the chance to bring Luna the Tabby home—fill out an adoption inquiry today.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/luna_the_tabby.png', 'Available'),
(97, 'Leonard', 2, 9, 3, 'Introducing Leonard, an absolute sweetheart with a big heart and a unique charm!

Leonard is a silly kitty that is the owner of a travel agency in Silly City.

Give Leonard the fresh start they''ve been waiting for!', 'Playful, Goofy, High-energy', 'img/animals/leonard.png', 'Available'),
(98, 'Maxwell', 2, 4, 3, 'Say hello to Maxwell! This wonderful feline is searching for a loving home.

May Maxwell rest in peace. [ Source ] Maxwell

In their spare time, Maxwell enjoys staying busy with work as a Community Companion. They are a proud member of The GOODings, 3KHURA. They sport a striking Bicolor coat.

Maxwell would love to meet you—schedule a visit and fall in love!', 'Gentle-natured, Kind-hearted, Affectionate (Community Companion)', 'img/animals/maxwell.png', 'Available'),
(99, 'Meevin', 2, 12, 4, 'Meet Meevin, a one-of-a-kind companion ready to bring endless joy to your family.

Meevin is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Meevin is up to date on vaccinations and ready to head home with you!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/meevin.png', 'Available'),
(100, 'Monsert', 2, 12, 3, 'Monsert is a truly unforgettable pet looking for a comfy couch and a caring owner.

In their spare time, Monsert enjoys staying busy with work as a Delivery. They are a proud member of FACT, insane army.

Could Monsert be the missing piece in your family? Come meet them today!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/monsert.png', 'Available'),
(101, 'Nilbert', 2, 9, 7, 'Looking for a cuddle buddy? Nilbert might just be your perfect match!

Nilbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Nilbert the furry friend you''ve been searching for? Apply to adopt today!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/nilbert.png', 'Available'),
(102, 'Neeble', 2, 7, 7, 'Give a warm welcome to Neeble, an adventurous and spirited friend.

Neeble is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Neeble into your life? Contact our adoption team now.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/neeble.png', 'Available'),
(103, 'Mrs. Pringleton', 2, 4, 1, 'Mrs. Pringleton is ready to make your house feel like home.

Mrs._Pringleton was last revised by GotenSakurauchi on 25 August, 2024 at 9:10 am.

Mrs. Pringleton is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/mrs__pringleton.png', 'Available'),
(104, 'Panko', 2, 14, 2, 'If you''re seeking a loyal and affectionate partner, look no further than Panko.

Description [ ] Panko

Panko is ready to start their next chapter with a devoted family.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/panko.png', 'Available'),
(105, 'Pepsie', 2, 14, 6, 'Meet Pepsie! Blessed with a colorful personality and endless charm.

In their spare time, Pepsie enjoys staying busy with work as a Delivery. They are a proud member of F.A.C.T..

Come say hello to Pepsie and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy (Delivery)', 'img/animals/pepsie.png', 'Available'),
(106, 'Photosynthesizing', 2, 11, 2, 'Photosynthesizing has arrived at the shelter and is eager to meet their new best friend.

Photosynthesizing Adult Baby

Don''t miss the chance to bring Photosynthesizing home—fill out an adoption inquiry today.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/photosynthesizing.png', 'Available'),
(107, 'Pobis', 2, 5, 6, 'With a majestic presence and a gentle heart, Pobis is waiting for you.

Pobis is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Pobis the fresh start they''ve been waiting for!', 'Playful, Goofy, High-energy', 'img/animals/pobis.png', 'Available'),
(108, 'Poncky', 2, 8, 6, 'Say hi to Poncky, a delightful pet who loves making new friends.

In their spare time, Poncky enjoys staying busy with work as a Delivery of pocky. They are a proud member of FACT.

Poncky would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/poncky.png', 'Available'),
(109, 'Potato', 2, 7, 2, 'Potato is a precious soul ready for their next big chapter in a forever home.

Potato is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Potato is up to date on vaccinations and ready to head home with you!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/potato.png', 'Available'),
(110, 'Prince bingulius', 2, 8, 3, 'Ready to open your heart? Prince bingulius is waiting to meet their forever family.

Prince Bingulius

Could Prince bingulius be the missing piece in your family? Come meet them today!', 'Charismatic, Confident, Leader', 'img/animals/prince_bingulius.png', 'Available'),
(111, 'Pusha', 2, 12, 3, 'Pusha is an extraordinary pet with a story to tell and plenty of love to give.

DISCLAIMER! This article contains subject may be considered sensitive to reader, avoid this article if you are sensitive to topics of Communism . May Pusha rest in peace.

Is Pusha the furry friend you''ve been searching for? Apply to adopt today!', 'Social, confident, and eager to welcome visitors.', 'img/animals/pusha.png', 'Available'),
(112, 'Prongles', 2, 10, 3, 'Meet the wonderful Prongles! A curious and lovable companion looking for adoption.

In their spare time, Prongles enjoys staying busy with work as a Failing to obey factory rule. They are a proud member of FACT.

Ready to welcome Prongles into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Failing to obey factory rule)', 'img/animals/prongles.png', 'Available'),
(113, 'Quetzkol The Incomprehensible Deity', 2, 14, 1, 'Introducing Quetzkol The Incomprehensible Deity, an absolute sweetheart with a big heart and a unique charm!

Quetzkol The Incomprehensible Deity Status Incomprehensible Occupation Being Incomprehensible Date of Birth Place of Birth 1 AD Space Marital Status Incomprehensible Physical Description Gender Breed Fur Color Incomprehensible Incomprehensible Incomprehensible Height Weight 0.1 to 1000 sauces Infinite sauces Appearances First Appearance Last Appearance George VS Quetzkol The Incomprehensible Deity Wars of silly and unsilly (cameo) Quetzkol The incomprehensible Deity Is a deity that cannot be comprehended Quetzkol The incomprehensible Deity is the archival of george and fought in the wars of silly and unsilly for a little bit on the front lines against Slorphus'' demons They are also is a timeless god and live on a meteor in space that was shot with missiles by B.A.D angering them they also are a shape-shifter and shape-shift into cat form to be more comprehensible than normal Quetzkol appears to be incredibly powerful and can shape shift between the form of a cat and a creature made out incomprehensible space goop or crystals or an incomprehensible form that causes all mortals who see it to have one of three things happen to them. they go insane 2. they turn into silly gas.

In their spare time, Quetzkol The Incomprehensible Deity enjoys staying busy with work as a Being Incomprehensible. They sport a striking Incomprehensible coat.

Quetzkol The Incomprehensible Deity is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, Goofy, High-energy (Being Incomprehensible)', 'img/animals/quetzkol_the_incomprehensible_deity.png', 'Available'),
(114, 'Radio Cat', 2, 7, 3, 'Say hello to Radio Cat! This wonderful feline is searching for a loving home.

Radio Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Radio Cat is ready to start their next chapter with a devoted family.', 'Playful, Goofy, High-energy', 'img/animals/radio_cat.png', 'Available'),
(115, 'Ramses', 2, 6, 4, 'Meet Ramses, a one-of-a-kind companion ready to bring endless joy to your family.

Diechmen Family Vampirius Dmitri Skeletus Ramses Ramses

Come say hello to Ramses and give this special pet the loving home they deserve.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/ramses.png', 'Available'),
(116, 'Sandwich', 2, 5, 6, 'Sandwich is a truly unforgettable pet looking for a comfy couch and a caring owner.

Sandwich was originally a member of the B.A.D organization, helping significantly in the of the Silly and Unsilly . However, when the organization was dismantled, Sandwich took refuge in a hideout near the Almanga Jungle , seeking safe haven. Soon after, though, the emojicats raided his home and stole all of his belongings.

In their spare time, Sandwich enjoys staying busy with work as a Community Companion. They sport a striking black, orange, faint white coat.

Don''t miss the chance to bring Sandwich home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy (Community Companion)', 'img/animals/sandwich.png', 'Available'),
(117, 'Rigby', 2, 14, 6, 'Looking for a cuddle buddy? Rigby might just be your perfect match!

Rigby is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Rigby the fresh start they''ve been waiting for!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/rigby.png', 'Available'),
(118, 'Roobeer', 2, 6, 5, 'Give a warm welcome to Roobeer, an adventurous and spirited friend.

In their spare time, Roobeer enjoys staying busy with work as a Mass producing root beer. They are a proud member of FACT.

Roobeer would love to meet you—schedule a visit and fall in love!', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/roobeer.png', 'Available'),
(119, 'Richer Motion', 2, 5, 1, 'Richer Motion is ready to make your house feel like home.

Richer Motion Affiliation Occupation B.A.D Kidnapping using money as bait Date of Birth Place of Birth 24th February 2001 Unknown Marital Status None Physical Description Gender Breed Fur Color Male Unknown Unknown Height Weight 8 Sauces 9.6 Sauces Appearances First Appearance Last Appearance The Doorbell The Doorbell Biography [ ] Richer Motion is a highly intelligent A.I robot with very humanoid feeling and features. He is programmed to wander around at night and go up to peoples front doors, baiting people to come outside, when they do the A.I kidnaps them and takes them to a unknown evil creature. Richer Motion appears in one singular episode for 20 minutes when Jinx and the gang are staying over at a abandoned house to keep shelter, it is quite a scary 20 minutes for both the gang and the audience, the doorbell ringing over and over as Richer Motion waits outside, banging on the door louder and louder and louder, eventually Richer Motion leaves.

Richer Motion is up to date on vaccinations and ready to head home with you!', 'Social, confident, and eager to welcome visitors.', 'img/animals/richer_motion.png', 'Available'),
(120, 'Samurai Cat', 2, 2, 6, 'If you''re seeking a loyal and affectionate partner, look no further than Samurai Cat.

Samurai Cat Occupation Samurai Physical Description Gender Fur Color Male White Height Weight 6.2 sauces 14 sauces Contents 1 Biography 2 Assasinations 3 Students 4 Abilities Biography [ ] Samurai Cat was born in Catio , where he was raised in a hidden village in Japan. He wanted to be a Samurai at the age of 5, and he was bullied by his classmates. Every day, Samurai Cat would smack a tree with a wooden stick.

Could Samurai Cat be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/samurai_cat.png', 'Available'),
(121, 'Scaredy Cat', 2, 7, 6, 'Meet Scaredy Cat! Blessed with a colorful personality and endless charm.

Scaredy Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Scaredy Cat the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'img/animals/scaredy_cat.png', 'Available'),
(122, 'Sam', 2, 6, 3, 'Sam has arrived at the shelter and is eager to meet their new best friend.

In their spare time, Sam enjoys staying busy with work as a Mercenary,. They are a proud member of SCAF.

Ready to welcome Sam into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Mercenary<br>)', 'img/animals/sam.png', 'Available'),
(123, 'Selfie', 2, 5, 6, 'With a majestic presence and a gentle heart, Selfie is waiting for you.

Selfie is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Selfie is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/selfie.png', 'Available'),
(124, 'Sheriff Paw', 2, 13, 4, 'Say hi to Sheriff Paw, a delightful pet who loves making new friends.

Sheriff Paw is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Sheriff Paw is ready to start their next chapter with a devoted family.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/sheriff_paw.png', 'Available'),
(125, 'Slorphus', 2, 13, 4, 'Slorphus is a precious soul ready for their next big chapter in a forever home.

In their spare time, Slorphus enjoys staying busy with work as a Community Companion.

Come say hello to Slorphus and give this special pet the loving home they deserve.', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/slorphus.png', 'Available'),
(126, 'Skeletus', 2, 4, 2, 'Ready to open your heart? Skeletus is waiting to meet their forever family.

Diechmen Family Vampirius Dmitri Skeletus Ramses Skeletus

Don''t miss the chance to bring Skeletus home—fill out an adoption inquiry today.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/skeletus.png', 'Available'),
(127, 'Sir Meows', 2, 14, 4, 'Sir Meows is an extraordinary pet with a story to tell and plenty of love to give.

May Sir Meows rest in peace. [ Source ] Real life [ ] Sir Meows

Give Sir Meows the fresh start they''ve been waiting for!', 'Social, confident, and eager to welcome visitors.', 'img/animals/sir_meows.png', 'Available'),
(128, 'So Silly', 2, 6, 3, 'Meet the wonderful So Silly! A curious and lovable companion looking for adoption.

So Silly is a sweet, playful cat looking for a warm and comfortable home to settle down in.

So Silly would love to meet you—schedule a visit and fall in love!', 'Playful, Goofy, High-energy', 'img/animals/so_silly.png', 'Available'),
(129, 'Snuggles', 2, 8, 1, 'Introducing Snuggles, an absolute sweetheart with a big heart and a unique charm!

Snuggles Status Napping Physical Description Height Weight 3 sauces 9 sauces Appearances First Appearance Tumbler Snuggles is a supporting character in Silly Cats . He is an eeper by blood, but was sent over to become the regent king of Bingustan ever since Bingus died. Biography [ ] Snuggles was born to The Eeperia Monarchical family, but Eeper thought him not to be fit to rule over the vast nation of Eeperia .

Snuggles is up to date on vaccinations and ready to head home with you!', 'Sleepy, Cuddly, Mellow', 'img/animals/snuggles.png', 'Available'),
(130, 'Sora', 2, 14, 7, 'Say hello to Sora! This wonderful feline is searching for a loving home.

Sora is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Could Sora be the missing piece in your family? Come meet them today!', 'Gentle-natured, Kind-hearted, Affectionate', 'img/animals/sora.png', 'Available'),
(131, 'Spirte', 2, 11, 2, 'Meet Spirte, a one-of-a-kind companion ready to bring endless joy to your family.

Spirte of Zabloing

In their spare time, Spirte enjoys staying busy with work as a Delivery. They are a proud member of FACT.

Is Spirte the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, Goofy, High-energy (Delivery)', 'img/animals/spirte.png', 'Available'),
(132, 'Strawberry Cat', 2, 6, 4, 'Strawberry Cat is a truly unforgettable pet looking for a comfy couch and a caring owner.

Strawberry Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Ready to welcome Strawberry Cat into your life? Contact our adoption team now.', 'Curious, alert, and always exploring their surroundings.', 'img/animals/strawberry_cat.png', 'Available'),
(133, 'Study Cat', 2, 5, 3, 'Looking for a cuddle buddy? Study Cat might just be your perfect match!

Study Cat is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Study Cat is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/study_cat.png', 'Available'),
(134, 'Tater Tot', 2, 13, 2, 'Give a warm welcome to Tater Tot, an adventurous and spirited friend.

May Tater Tot rest in peace. [ Source ] tater tot Status dead.......for real not as a joke :(

Tater Tot is ready to start their next chapter with a devoted family.', 'Mellow, relaxed, and great with cozy lap naps.', 'img/animals/tater_tot.png', 'Available'),
(135, 'Terrance', 2, 13, 2, 'Terrance is ready to make your house feel like home.

Terrance is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Come say hello to Terrance and give this special pet the loving home they deserve.', 'Social, confident, and eager to welcome visitors.', 'img/animals/terrance.png', 'Available'),
(136, 'The Meeper', 2, 6, 4, 'If you''re seeking a loyal and affectionate partner, look no further than The Meeper.

In their spare time, The Meeper enjoys staying busy with work as a CEO. They are a proud member of Eeperia.

Don''t miss the chance to bring The Meeper home—fill out an adoption inquiry today.', 'Sleepy, Cuddly, Mellow (CEO)', 'img/animals/the_meeper.png', 'Available'),
(137, 'The kungus', 2, 4, 4, 'Meet The kungus! Blessed with a colorful personality and endless charm.

The klungus 🇺🇸 🇺🇸 🇺🇸 Date of Birth 5/24/1980 Physical Description Gender Boy The klungus is the big goober of the group History [ ] originally joined the Silly Cats in 2002 after winning The great cereal competition after eating 1000 pounds of cereal in 1 second in the year of 1997

Give The kungus the fresh start they''ve been waiting for!', 'Playful, Goofy, High-energy', 'img/animals/the_kungus.png', 'Available'),
(138, 'The Fry Stealer', 2, 6, 7, 'The Fry Stealer has arrived at the shelter and is eager to meet their new best friend.

The Fry Stealer is a sweet, playful cat looking for a warm and comfortable home to settle down in.

The Fry Stealer would love to meet you—schedule a visit and fall in love!', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/the_fry_stealer.png', 'Available'),
(139, 'The Pizzer', 2, 13, 7, 'With a majestic presence and a gentle heart, The Pizzer is waiting for you.

The Pizzer is a sweet, playful cat looking for a warm and comfortable home to settle down in.

The Pizzer is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy', 'img/animals/the_pizzer.png', 'Available'),
(140, 'The Teefer', 2, 13, 1, 'Say hi to The Teefer, a delightful pet who loves making new friends.

In their spare time, The Teefer enjoys staying busy with work as a Biting. They are a proud member of Mechadondon''s pet. They sport a striking Orange coat.

Could The Teefer be the missing piece in your family? Come meet them today!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/the_teefer.png', 'Available'),
(141, 'The Sitter', 2, 13, 5, 'The Sitter is a precious soul ready for their next big chapter in a forever home.

In their spare time, The Sitter enjoys staying busy with work as a Sitting.

Is The Sitter the furry friend you''ve been searching for? Apply to adopt today!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/the_sitter.png', 'Available'),
(142, 'The One Of Them', 2, 2, 2, 'Ready to open your heart? The One Of Them is waiting to meet their forever family.

In their spare time, The One Of Them enjoys staying busy with work as a Being one of them. They are a proud member of Goob. They sport a striking Grey and fluffy coat.

Ready to welcome The One Of Them into your life? Contact our adoption team now.', 'Playful, Goofy, High-energy (Being one of them)', 'img/animals/the_one_of_them.png', 'Available'),
(143, 'Thurston Waffles', 2, 14, 6, 'Thurston Waffles is an extraordinary pet with a story to tell and plenty of love to give.

May Thurston Waffles rest in peace. [ Source ] Thurston Waffles

Thurston Waffles is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Social, confident, and eager to welcome visitors.', 'img/animals/thurston_waffles.png', 'Available'),
(144, 'Tim Tim', 2, 4, 6, 'Meet the wonderful Tim Tim! A curious and lovable companion looking for adoption.

Tim Tim is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Tim Tim is ready to start their next chapter with a devoted family.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/tim_tim.png', 'Available'),
(145, 'Uncle', 2, 13, 7, 'Introducing Uncle, an absolute sweetheart with a big heart and a unique charm!

In their spare time, Uncle enjoys staying busy with work as a Music making, mafia boss (Previously). They are a proud member of The mafia (Previously).

Come say hello to Uncle and give this special pet the loving home they deserve.', 'Charismatic, Confident, Leader (Music making, mafia boss (Previously))', 'img/animals/uncle.png', 'Available'),
(146, 'Vampirius', 2, 6, 2, 'Say hello to Vampirius! This wonderful feline is searching for a loving home.

Diechmen Family Vampirius Dmitri Skeletus Ramses Vampirius

Don''t miss the chance to bring Vampirius home—fill out an adoption inquiry today.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/vampirius.png', 'Available'),
(147, 'Unknown', 2, 7, 4, 'Meet Unknown, a one-of-a-kind companion ready to bring endless joy to your family.

Unknown is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Give Unknown the fresh start they''ve been waiting for!', 'Affectionate, purr-heavy cuddlebug who loves head scratches.', 'img/animals/unknown.png', 'Available'),
(148, 'Tole Tole', 2, 7, 1, 'Tole Tole is a truly unforgettable pet looking for a comfy couch and a caring owner.

Tole Tole is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Tole Tole would love to meet you—schedule a visit and fall in love!', 'Curious, alert, and always exploring their surroundings.', 'img/animals/tole_tole.gif', 'Available'),
(149, 'Toby', 2, 13, 2, 'Looking for a cuddle buddy? Toby might just be your perfect match!

In their spare time, Toby enjoys staying busy with work as a Community Companion.

Toby is up to date on vaccinations and ready to head home with you!', 'Playful, Goofy, High-energy (Community Companion)', 'img/animals/toby.png', 'Available'),
(150, 'Wagoogus Jr.', 2, 13, 5, 'Give a warm welcome to Wagoogus Jr., an adventurous and spirited friend.

In their spare time, Wagoogus Jr. enjoys staying busy with work as a Being a little fella. They are a proud member of Gloopy and Gentleman. They sport a striking Black coat.

Could Wagoogus Jr. be the missing piece in your family? Come meet them today!', 'Playful, Goofy, High-energy (Being a little fella)', 'img/animals/wagoogus_jr.png', 'Available'),
(151, 'Wilbert', 2, 13, 2, 'Wilbert is ready to make your house feel like home.

Wilbert is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Wilbert the furry friend you''ve been searching for? Apply to adopt today!', 'Sleepy, Cuddly, Mellow', 'img/animals/wilbert.png', 'Available'),
(152, 'Watermelon Cat', 2, 5, 2, 'If you''re seeking a loyal and affectionate partner, look no further than Watermelon Cat.

Watermelon Cat Felis Lanatus Citrillus Catus

Ready to welcome Watermelon Cat into your life? Contact our adoption team now.', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/watermelon_cat.png', 'Available'),
(153, 'Wild Pete', 2, 9, 5, 'Meet Wild Pete! Blessed with a colorful personality and endless charm.

Wild Pete is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Wild Pete is dreaming of a cozy lap and plenty of treats in a quiet, loving home.', 'Playful, energetic, and loves interactive toys.', 'img/animals/wild_pete.png', 'Available'),
(154, 'Wire Cat', 2, 7, 6, 'Wire Cat has arrived at the shelter and is eager to meet their new best friend.

Wire cat Occupation Seeking the one truly wireless device Date of Birth Place of Birth 6th of March 1999 Muztagata Mountain, Kyrgyzstan Marital Status Single Physical Description Gender Male Height Weight 5 sauces 3 sauces Wire cat is a cat that loves buying wireless devices, expecting them to lack wires. Outside, they appear to be, however, once taking them apart, Wire cat is constantly disappointed in finding wires inside the device. He has a slight love for the taste of lead.

In their spare time, Wire Cat enjoys staying busy with work as a Seeking the one truly wireless device.

Wire Cat is ready to start their next chapter with a devoted family.', 'Gentle, quiet, and enjoys lounging in sunny spots.', 'img/animals/wire_cat.png', 'Available'),
(155, 'Wit Kit', 2, 14, 7, 'With a majestic presence and a gentle heart, Wit Kit is waiting for you.

May Wit Kit rest in peace. [ Source ] Contents 1 Real Life 2 About 3 Appearances 3.1 Silly Cats 3.2 Silly Cats: Babies 4 The End 5 Trivia Real Life [ ] Kitty was 20 Years Old before the end, please remember her. About [ ] Wit Kit

Come say hello to Wit Kit and give this special pet the loving home they deserve.', 'Playful, Goofy, High-energy', 'img/animals/wit_kit.png', 'Available'),
(156, 'Xiaojie', 2, 14, 7, 'Say hi to Xiaojie, a delightful pet who loves making new friends.

This page has unreliable information. Go to Catpedia for correct information. xiaojie Gallery [ ] Someone said to her.

Don''t miss the chance to bring Xiaojie home—fill out an adoption inquiry today.', 'Playful, Goofy, High-energy', 'img/animals/xiaojie.png', 'Available'),
(157, 'Wisp', 2, 2, 7, 'Wisp is a precious soul ready for their next big chapter in a forever home.

wisp If you think ill come quietly, Youre DEAD wrong."

Give Wisp the fresh start they''ve been waiting for!', 'Spirited, independent, but very loving with their favorite human.', 'img/animals/wisp.png', 'Available'),
(158, 'Wizard of Spells', 2, 13, 4, 'Ready to open your heart? Wizard of Spells is waiting to meet their forever family.

Wizard of Spells

Wizard of Spells would love to meet you—schedule a visit and fall in love!', 'Playful, Goofy, High-energy', 'img/animals/wizard_of_spells.png', 'Available'),
(159, 'Zim Zorp', 2, 16, 1, 'Zim Zorp is an extraordinary pet with a story to tell and plenty of love to give.

Zim Zorp is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Zim Zorp is up to date on vaccinations and ready to head home with you!', 'Sleepy, Cuddly, Mellow', 'img/animals/zim_zorp.png', 'Available'),
(160, 'Xorgus', 2, 16, 5, 'Meet the wonderful Xorgus! A curious and lovable companion looking for adoption.

In their spare time, Xorgus enjoys staying busy with work as a DJ at Club Gonk. They are a proud member of Gnarp Gnaplians. They sport a striking Green coat.

Could Xorgus be the missing piece in your family? Come meet them today!', 'Sweet-tempered, loyal, and thrives in a peaceful environment.', 'img/animals/xorgus.png', 'Available'),
(161, 'Bathder', 2, 13, 6, 'Introducing Bathder, an absolute sweetheart with a big heart and a unique charm!

Bathder is a sweet, playful cat looking for a warm and comfortable home to settle down in.

Is Bathder the furry friend you''ve been searching for? Apply to adopt today!', 'Playful, energetic, and loves interactive toys.', 'img/animals/glooble.jpg', 'Available');

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

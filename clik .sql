-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 09, 2020 at 10:35 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clik`
--

-- --------------------------------------------------------

--
-- Table structure for table `detail_user`
--

CREATE TABLE `detail_user` (
  `duser_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `duser_name` varchar(50) DEFAULT NULL,
  `duser_alamat` varchar(100) DEFAULT NULL,
  `duser_jk` enum('Pria','Wanita','','') NOT NULL,
  `duser_telp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_user`
--

INSERT INTO `detail_user` (`duser_id`, `user_id`, `duser_name`, `duser_alamat`, `duser_jk`, `duser_telp`) VALUES
(1, 1, 'rama72', 'Denpasar', 'Pria', '081234567890'),
(2, 2, 'vincky71', 'Denpasar', 'Pria', '082233778899'),
(3, 3, 'veen7', 'Badung', 'Pria', '085312658709'),
(4, 4, 'kiki75', 'Klungkung', 'Pria', '081908765432'),
(5, 5, 'ip4', 'Tabanan', 'Pria', '085385255258');

-- --------------------------------------------------------

--
-- Table structure for table `img`
--

CREATE TABLE `img` (
  `img_id` int(11) NOT NULL,
  `img_status` enum('profile','produk','','') NOT NULL,
  `img_id_status` int(11) NOT NULL,
  `img_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`kategori_id`, `kategori_name`) VALUES
(1, 'Matematika'),
(2, 'IPA'),
(3, 'Bahasa Inggris'),
(4, 'Komputer'),
(5, 'Musik'),
(6, 'Melukis'),
(7, 'Masak'),
(8, 'Otomotif');

-- --------------------------------------------------------

--
-- Table structure for table `lokasi`
--

CREATE TABLE `lokasi` (
  `lokasi_id` int(11) NOT NULL,
  `lokasi_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `lokasi`
--

INSERT INTO `lokasi` (`lokasi_id`, `lokasi_name`) VALUES
(1, 'Denpasar'),
(2, 'Badung'),
(3, 'Klungkung'),
(4, 'Tabanan'),
(5, 'Karangasem'),
(6, 'Bangli'),
(7, 'Buleleng'),
(8, 'Jembrana'),
(9, 'Gianyar');

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `produk_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `produk_harga` int(50) NOT NULL,
  `produk_deskripsi` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_name`, `user_id`, `lokasi_id`, `kategori_id`, `produk_harga`, `produk_deskripsi`) VALUES
(1, 'Math Course', 2, 1, 1, 3000000, 'Belajar matematika memang luamayan rumit, tapi lebih rumit lagi hidup jika tidak belajar matematika sama sekali. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(2, 'Science Private', 3, 1, 2, 3000000, 'Ayo kita jelajahi dunia dengan belajar sains. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(3, 'English TOP', 2, 1, 3, 3000000, 'Make your english better. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(4, 'Kursus Komputer ', 3, 1, 4, 3000000, 'Yuk belajar komputer, disini kalian bisa belajar software, hardware dan koding juga loh. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(5, 'Sing a Song (SaS) Course', 2, 1, 5, 3000000, 'Menjadi seniman bukanlah hal yang mudah, perlu imajinasi yang tinggi untuk menjadi seorang seniman yang handal. Tenang, SaS kami akan membantu anda menemukan imajinasi. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(6, 'Art is the soul', 3, 1, 6, 3000000, 'Paint your monalisa. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(7, 'Cook and Food', 2, 1, 7, 3000000, 'Make your food taste better. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(8, 'Learn Otomotif', 3, 1, 8, 3000000, 'Disini tempat anda untuk belajar dunia mesin. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(9, 'Kursus Matematika', 2, 2, 1, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(10, 'Kursus IPA', 3, 2, 2, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(11, 'Kursus Bahasa Inggris', 2, 2, 3, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(12, 'Kursus Komputer', 3, 2, 4, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(13, 'Kursus Musik', 2, 2, 5, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(14, 'Kursus Melukis', 3, 2, 6, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(15, 'Kursus Masak', 2, 2, 7, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(16, 'Kursus Otomotif', 3, 2, 8, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(17, 'Matematika', 3, 3, 1, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(18, 'Ilmu Pengetahuan Alam', 2, 3, 2, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(19, 'Bahasa Inggris', 3, 3, 3, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(20, 'Komputer', 2, 3, 4, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(21, 'Musik', 3, 3, 5, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(22, 'Melukis', 2, 3, 6, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(23, 'Masak', 3, 3, 7, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(24, 'Otomotif', 2, 3, 8, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(25, 'Math', 3, 4, 1, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(26, 'Science', 2, 4, 2, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(27, 'English', 3, 4, 3, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(28, 'Computer', 2, 4, 4, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(29, 'Music', 3, 4, 5, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(30, 'Paint', 2, 4, 6, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(31, 'Cooking', 3, 4, 7, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(32, 'Automotive', 2, 4, 8, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(33, 'MTK', 2, 5, 1, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(34, 'IPA', 3, 5, 2, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(35, 'B.ing', 2, 5, 3, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(36, 'KOM.', 3, 5, 4, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(37, 'Nada', 2, 5, 5, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(38, 'Warna', 3, 5, 6, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(39, 'Masaklah Sesuai Selera', 2, 5, 7, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(40, 'Apa itu Mesin', 3, 5, 8, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(41, 'Belajar Matematika', 2, 6, 1, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(42, 'Belajar IPA', 3, 6, 2, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(43, 'Belajar Bahasa Inggris', 2, 6, 3, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(44, 'Belajar Komputer', 3, 6, 4, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(45, 'Belajar Musik', 2, 6, 5, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(46, 'Belajar Melukis', 3, 6, 6, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(47, 'Belajar Masak', 2, 6, 7, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(48, 'Belajar Otomotif', 3, 6, 8, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(49, 'Matematika Asik', 3, 7, 1, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(50, 'IPA Asik', 2, 7, 2, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(51, 'B.ing Asik', 3, 7, 3, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(52, 'Komputer Asik', 2, 7, 4, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(53, 'Musik Asik', 3, 7, 5, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(54, 'Melukis Asik', 2, 7, 6, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(55, 'Masak Asik', 3, 7, 7, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(56, 'Otomotif Asik', 2, 7, 8, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(57, 'Matematika ?', 2, 8, 1, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(58, 'IPA ?', 3, 8, 2, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(59, 'B.ing ?', 2, 8, 3, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(60, 'Komputer ?', 3, 8, 4, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(61, 'Musik ?', 2, 8, 5, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(62, 'Lukis ?', 3, 8, 6, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(63, 'Masak ?', 2, 8, 7, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(64, 'Otomotif ?', 3, 8, 8, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(65, 'Math OK', 3, 9, 1, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(66, 'Science OK', 2, 9, 2, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(67, 'English OK', 3, 9, 3, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(68, 'Computer OK', 2, 9, 4, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(69, 'Music OK', 3, 9, 5, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(70, 'Paint OK', 2, 9, 6, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(71, 'Cook OK', 3, 9, 7, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.'),
(72, 'Automotive OK', 2, 9, 8, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.');

-- --------------------------------------------------------

--
-- Table structure for table `produk_aktif`
--

CREATE TABLE `produk_aktif` (
  `paktif_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `paktif_tanggal` date NOT NULL,
  `paktif_exp` date NOT NULL,
  `paktif_status` varchar(10) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_level` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `user_username`, `user_email`, `user_password`, `user_level`) VALUES
(1, 'rama72', 'rama72@gmail.com', 'rama72', 1),
(2, 'vincky71', 'vincky71@gmail.com', 'vincky71', 2),
(3, 'veen7', 'veen7@gmail.com', 'veen7', 2),
(4, 'kiki75', 'kiki75@gmail.com', 'kiki75', 1),
(5, 'ip4', 'ip4@gmail.com', 'ip4', 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_user`
--
ALTER TABLE `detail_user`
  ADD PRIMARY KEY (`duser_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `img`
--
ALTER TABLE `img`
  ADD PRIMARY KEY (`img_id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indexes for table `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`lokasi_id`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `lokasi_id` (`lokasi_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `produk_aktif`
--
ALTER TABLE `produk_aktif`
  ADD PRIMARY KEY (`paktif_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_user`
--
ALTER TABLE `detail_user`
  MODIFY `duser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `img`
--
ALTER TABLE `img`
  MODIFY `img_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `lokasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `produk_aktif`
--
ALTER TABLE `produk_aktif`
  MODIFY `paktif_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_user`
--
ALTER TABLE `detail_user`
  ADD CONSTRAINT `detail_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`lokasi_id`),
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Constraints for table `produk_aktif`
--
ALTER TABLE `produk_aktif`
  ADD CONSTRAINT `produk_aktif_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

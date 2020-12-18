-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Des 2020 pada 00.43
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.2

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
-- Struktur dari tabel `detail_user`
--

CREATE TABLE `detail_user` (
  `duser_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `duser_name` varchar(50) DEFAULT NULL,
  `duser_alamat` varchar(100) DEFAULT NULL,
  `duser_telp` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `detail_user`
--

INSERT INTO `detail_user` (`duser_id`, `user_id`, `duser_name`, `duser_alamat`, `duser_telp`) VALUES
(1, 1, 'rama72', 'Denpasar', '081234567890'),
(2, 2, 'vincky71', 'Denpasar', '082233778899'),
(3, 3, 'Kadek Vincky Sedana', 'Badung, Bali, indonesia', '085312658709'),
(4, 4, 'kiki75', 'Klungkung', '081908765432'),
(5, 5, 'ip4', 'Tabanan', '085385255258'),
(6, 6, NULL, NULL, NULL),
(7, 8, 'I putu rama anadya', 'Pujungan bali', NULL),
(8, 14, '', '', ''),
(9, 15, 'ADmin2022', 'Pujungan', '000000000000'),
(10, 16, 'Admin 30', 'admin 30', '098876567234'),
(11, 17, 'Clikuser', 'Jimbaran', '081234567890'),
(12, 18, 'Clikmitra', 'Denpasar', '089709876543'),
(13, 19, 'Clikmitra2', 'Kuta Selatan', '081209876543'),
(14, 20, 'Clikmitra3', 'Denpasar', '087912345678'),
(15, 21, '', '', ''),
(16, 22, 'Admin Clik', 'Denpasar', '098876678888');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `kategori_id` int(11) NOT NULL,
  `kategori_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `kategori`
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
-- Struktur dari tabel `lokasi`
--

CREATE TABLE `lokasi` (
  `lokasi_id` int(11) NOT NULL,
  `lokasi_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `lokasi`
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
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `produk_id` int(11) NOT NULL,
  `produk_name` varchar(50) NOT NULL,
  `user_id` int(11) NOT NULL,
  `lokasi_id` int(11) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `produk_harga` int(50) NOT NULL,
  `produk_deskripsi` varchar(500) NOT NULL,
  `produk_pic` varchar(50) DEFAULT NULL,
  `produk_status` enum('aktif','nonaktif','pending') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`produk_id`, `produk_name`, `user_id`, `lokasi_id`, `kategori_id`, `produk_harga`, `produk_deskripsi`, `produk_pic`, `produk_status`) VALUES
(1, 'Math Course ', 2, 1, 1, 3000000, 'Belajar matematika memang luamayan rumit, tapi lebih rumit lagi hidup jika tidak belajar matematika sama sekali. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(2, 'Science Private', 3, 1, 2, 3000000, 'Ayo kita jelajahi dunia dengan belajar sains. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(3, 'English TOP', 2, 1, 3, 3000000, 'Make your english better. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(4, 'Kursus Komputer ', 3, 1, 4, 3000000, 'Yuk belajar komputer, disini kalian bisa belajar software, hardware dan koding juga loh. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(5, 'Sing a Song (SaS) Course', 2, 1, 5, 3000000, 'Menjadi seniman bukanlah hal yang mudah, perlu imajinasi yang tinggi untuk menjadi seorang seniman yang handal. Tenang, SaS kami akan membantu anda menemukan imajinasi. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(6, 'Art is the soul', 3, 1, 6, 3000000, 'Paint your monalisa. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(7, 'Cook and Food', 2, 1, 7, 3000000, 'Make your food taste better. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(8, 'Learn Otomotif', 3, 1, 8, 3000000, 'Disini tempat anda untuk belajar dunia mesin. Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(9, 'Kursus Matematika', 2, 2, 1, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(10, 'Kursus IPA', 3, 2, 2, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(11, 'Kursus Bahasa Inggris', 2, 1, 1, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(12, 'Kursus Komputer', 3, 2, 4, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(13, 'Kursus Musik', 2, 2, 5, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(14, 'Kursus Melukis', 3, 2, 6, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(15, 'Kursus Masak', 2, 2, 7, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(16, 'Kursus Otomotif', 3, 2, 8, 2500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(17, 'Matematika', 3, 3, 1, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(18, 'Ilmu Pengetahuan Alam', 2, 3, 2, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(19, 'Bahasa Inggris', 3, 3, 3, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(20, 'Komputer', 2, 3, 4, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(21, 'Musik', 3, 3, 5, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(22, 'Melukis', 2, 3, 6, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(23, 'Masak', 3, 3, 7, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(24, 'Otomotif', 2, 3, 8, 2700000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(25, 'Math', 3, 4, 1, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(26, 'Science', 2, 4, 2, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(27, 'English', 3, 4, 3, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(28, 'Computer', 2, 4, 4, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(29, 'Music', 3, 4, 5, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(30, 'Paint', 2, 4, 6, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(31, 'Cooking', 3, 4, 7, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(32, 'Automotive', 2, 4, 8, 3200000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(33, 'MTK', 2, 5, 1, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(34, 'IPA', 3, 5, 2, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(35, 'B.ing', 2, 5, 3, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(36, 'KOM.', 3, 5, 4, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(37, 'Nada', 2, 5, 5, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(38, 'Warna', 3, 5, 6, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(39, 'Masaklah Sesuai Selera', 2, 5, 7, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(40, 'Apa itu Mesin', 3, 5, 8, 3100000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(41, 'Belajar Matematika', 2, 6, 1, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(42, 'Belajar IPA', 3, 6, 2, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(43, 'Belajar Bahasa Inggris', 2, 6, 3, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(44, 'Belajar Komputer', 3, 6, 4, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(45, 'Belajar Musik', 2, 6, 5, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(46, 'Belajar Melukis', 3, 6, 6, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(47, 'Belajar Masak', 2, 6, 7, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(48, 'Belajar Otomotif', 3, 6, 8, 3500000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(49, 'Matematika Asik', 3, 7, 1, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(50, 'IPA Asik', 2, 7, 2, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(51, 'B.ing Asik', 3, 7, 3, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(52, 'Komputer Asik', 2, 7, 4, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(53, 'Musik Asik', 3, 7, 5, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(54, 'Melukis Asik', 2, 7, 6, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(55, 'Masak Asik', 3, 7, 7, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(56, 'Otomotif Asik', 2, 7, 8, 2800000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(57, 'Matematika ?', 2, 8, 1, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(58, 'IPA ?', 3, 8, 2, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(59, 'B.ing ?', 2, 8, 3, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(60, 'Komputer ?', 3, 8, 4, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(61, 'Musik ?', 2, 8, 5, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(62, 'Lukis ?', 3, 8, 6, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(63, 'Masak ?', 2, 8, 7, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(64, 'Otomotif ?', 3, 8, 8, 2600000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(65, 'Math OK', 3, 9, 1, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(66, 'Science OK', 2, 9, 2, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(67, 'English OK', 3, 9, 3, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(68, 'Computer OK', 2, 9, 4, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(69, 'Music OK', 3, 9, 5, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(70, 'Paint OK', 2, 9, 6, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(71, 'Cook OK', 3, 9, 7, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(72, 'Automotive OK', 2, 9, 8, 2900000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(73, 'English Education', 18, 1, 3, 3000000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(74, 'Math Education', 19, 1, 1, 3000000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(75, 'Science Education', 20, 1, 2, 3000000, 'Lorem ipsum dolor sit amet consectetur, adipisicing elit. Suscipit culpa aperiam aspernatur, sit optio quam laborum praesentium dolor. Exercitationem ad delectus assumenda! Veritatis unde quam harum blanditiis! Sit, magnam voluptatem.', '1.jpg', 'aktif'),
(77, 'Kursus matematika 2', 18, 1, 1, 0, '10000000', '1.jpg', 'aktif'),
(78, 'Kursus matematika 3', 21, 6, 1, 0, '10000000', '1.jpg', 'pending'),
(79, 'Matematika 4', 21, 1, 1, 10000000, 'test', '1.jpg', 'pending');

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk_aktif`
--

CREATE TABLE `produk_aktif` (
  `paktif_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `paktif_tanggal` date DEFAULT NULL,
  `paktif_exp` date DEFAULT NULL,
  `paktif_status` enum('Aktif','Pending','Tidak Aktif') NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `produk_aktif`
--

INSERT INTO `produk_aktif` (`paktif_id`, `produk_id`, `paktif_tanggal`, `paktif_exp`, `paktif_status`, `user_id`) VALUES
(1, 1, '2020-12-11', '2021-01-11', 'Aktif', 5),
(2, 1, '0000-00-00', '0000-00-00', 'Tidak Aktif', 5),
(3, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(4, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(5, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(6, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(7, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(8, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(9, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(10, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(11, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(12, 1, '0000-00-00', '0000-00-00', 'Pending', 5),
(13, 1, '0000-00-00', '0000-00-00', 'Aktif', 5);

-- --------------------------------------------------------

--
-- Struktur dari tabel `transaksi`
--

CREATE TABLE `transaksi` (
  `transaksi_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `produk_id` int(11) NOT NULL,
  `transaksi_tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `transaksi`
--

INSERT INTO `transaksi` (`transaksi_id`, `user_id`, `produk_id`, `transaksi_tanggal`) VALUES
(1, 5, 1, '2020-12-11'),
(2, 5, 1, '2020-12-12'),
(3, 5, 1, '2020-12-12'),
(4, 5, 1, '2020-12-12'),
(5, 5, 1, '2020-12-12'),
(6, 5, 1, '2020-12-12'),
(7, 5, 1, '2020-12-12'),
(8, 5, 1, '2020-12-12'),
(9, 5, 1, '2020-12-12'),
(10, 5, 1, '2020-12-12'),
(11, 5, 1, '2020-12-12'),
(12, 5, 1, '2020-12-12'),
(13, 5, 1, '2020-12-12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_username` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_level` int(1) NOT NULL,
  `user_foto` varchar(50) DEFAULT NULL,
  `user_jk` enum('Laki - laki','Perempuan') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `user`
--

INSERT INTO `user` (`user_id`, `user_username`, `user_email`, `user_password`, `user_level`, `user_foto`, `user_jk`) VALUES
(1, 'rama72', 'rama72@gmail.com', 'rama72', 1, '1.jpg', 'Laki - laki'),
(2, 'vincky71', 'vincky71@gmail.com', 'vincky71', 2, '1.jpg', 'Laki - laki'),
(3, 'veenTv', 'veen7@gmail.com', 'veen7', 2, '5fd47112702a5.jpg', 'Laki - laki'),
(4, 'kiki75', 'kiki75@gmail.com', 'kiki75', 1, '1.jpg', 'Laki - laki'),
(5, 'ip4', 'ip4@gmail.com', 'ip4', 3, '1.jpg', 'Laki - laki'),
(6, 'veentv12', 'gusrama18@gmail.com', '$2y$10$xufbn5CKiuJU/42F/JbxIukpuHB4tPaQnO26DXDH13ZFjJmgM5jie', 3, '1.jpg', 'Laki - laki'),
(7, 'veentv13', 'gusmadu2018@gmail.com', '$2y$10$HMXm2j8f.blW7l8msmtUPu1uYVHGZqxIVPSDJQvHWQJP.aO/XLs/O', 3, '1.jpg', 'Laki - laki'),
(8, 'abcd', 'madenova112@gmail.com', '$2y$10$nRyO7IDPrCMe6YFm00G9p.r9sKBs2BDXFbpZtGK8gOsK1VRJegrty', 3, '1.jpg', 'Laki - laki'),
(9, 'abcde', 'gusmadu2018@gmail.com', '$2y$10$QyZ7LyWQ7SXFdcmsGzyUgeWggZYMdoRcQGAnj3YhYmeZgaEpcjh2C', 3, '1.jpg', 'Laki - laki'),
(10, 'abcdef', 'madenova112@gmail.com', '$2y$10$AvrYaz6bZg4.Vz8rIPaIie2Bs2NNUjCcCLF50H14uO62Av3my.bc2', 3, '1.jpg', 'Laki - laki'),
(11, 'ipramaanadya', 'madenova112@gmail.com', '$2y$10$qc7VEq4l3IUTwHvDjmLTau/z8lPlqDRa33/iv1myoEcqy4JqYlrpC', 3, '1.jpg', 'Laki - laki'),
(12, 'admin1', 'gusmadu2018@gmail.com', '$2y$10$XsK7BkshiBj9Eyk6Lv9SvO1JjRw/7GBnpFA5Cha5QoBpqk8wJRpb2', 3, '1.jpg', 'Laki - laki'),
(13, 'admin2', 'gusmadu2018@gmail.com', '$2y$10$6eNl.nF5IF2y.nnjQ62jve3ArrAOhQFVUUegr8WsLVuvlZdnkiI1q', 3, '1.jpg', 'Laki - laki'),
(14, 'admin123', 'gusmadu2018@gmail.com', '$2y$10$hm4BsYp4upy19TdhtvLr/eWz2fbV4k4idGbGNSV20cH8XdxA0qGfG', 3, '1.jpg', 'Laki - laki'),
(15, 'adadadadad', 'gusmadu2018@gmail.com', '$2y$10$wGCXg.E.QAVSprIrkwsQmO7IWem/qRGixG8P.glGWWgKeK5eQJxla', 3, '1.jpg', 'Laki - laki'),
(16, 'admin30', 'admin@gmail.com', '$2y$10$pgFIZpOvfBJsII16GK16g.RCl5Etvhbw8SlvYcrgG6rU021j4TjhK', 2, '1.jpg', 'Perempuan'),
(17, 'clikuser', 'clik@gmail.com', '$2y$10$HJbmJeZACoXdGlA72QM/HOwvqP7c7Mq1ibJd.9IH3hGLHu6ibajKW', 3, '1.jpg', 'Laki - laki'),
(18, 'clikmitra', 'clik@gmail.com', '$2y$10$xmwzG33wruYIRl4/EHu7xu2Mzr6.oFFO6VrbOodlpYCb5yfW/JHS2', 2, '1.jpg', 'Laki - laki'),
(19, 'clikmitra2', 'clik@gmail.com', '$2y$10$/kiiubV0ZBwW.kwksR.cbeWJWYiUeCLMT6RVJ7J8k8Ag5fRObTtWW', 2, '1.jpg', 'Laki - laki'),
(20, 'clikmitra3', 'clik@gmail.com', '$2y$10$2wYF3Oud/Iz5VV6s9VNp6.AZ3PZ7kKPOpdmMq6l0UYYqwPpa9DZFG', 2, '1.jpg', 'Laki - laki'),
(21, 'clikmitra4', 'clik@gmail.com', '$2y$10$na9ihD2DL3HwLtpGleQLMe9Qo/UohPCaI64RFL5q3Leh7joAX4iIu', 2, '1.jpg', 'Laki - laki'),
(22, 'adminclik', 'clik@gmail.com', '$2y$10$na9ihD2DL3HwLtpGleQLMe9Qo/UohPCaI64RFL5q3Leh7joAX4iIu', 1, '1.jpg', '');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `detail_user`
--
ALTER TABLE `detail_user`
  ADD PRIMARY KEY (`duser_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Indeks untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  ADD PRIMARY KEY (`lokasi_id`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`produk_id`),
  ADD KEY `kategori_id` (`kategori_id`),
  ADD KEY `lokasi_id` (`lokasi_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `produk_aktif`
--
ALTER TABLE `produk_aktif`
  ADD PRIMARY KEY (`paktif_id`),
  ADD KEY `produk_id` (`produk_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indeks untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`transaksi_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `produk_id` (`produk_id`);

--
-- Indeks untuk tabel `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `detail_user`
--
ALTER TABLE `detail_user`
  MODIFY `duser_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `kategori_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `lokasi`
--
ALTER TABLE `lokasi`
  MODIFY `lokasi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `produk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT untuk tabel `produk_aktif`
--
ALTER TABLE `produk_aktif`
  MODIFY `paktif_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `transaksi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `detail_user`
--
ALTER TABLE `detail_user`
  ADD CONSTRAINT `detail_user_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD CONSTRAINT `produk_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategori` (`kategori_id`),
  ADD CONSTRAINT `produk_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `produk_ibfk_3` FOREIGN KEY (`lokasi_id`) REFERENCES `lokasi` (`lokasi_id`),
  ADD CONSTRAINT `produk_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `produk_aktif`
--
ALTER TABLE `produk_aktif`
  ADD CONSTRAINT `produk_aktif_ibfk_1` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`),
  ADD CONSTRAINT `produk_aktif_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Ketidakleluasaan untuk tabel `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `transaksi_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  ADD CONSTRAINT `transaksi_ibfk_2` FOREIGN KEY (`produk_id`) REFERENCES `produk` (`produk_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 04, 2022 at 02:59 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `gudang`
--

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(10, '2022-07-07-120519', 'App\\Database\\Migrations\\Kategori', 'default', 'App', 1657203643, 1),
(11, '2022-07-07-120520', 'App\\Database\\Migrations\\Satuan', 'default', 'App', 1657203643, 1),
(43, '2022-07-13-113740', 'App\\Database\\Migrations\\Barangmasuk', 'default', 'App', 1658403602, 2),
(44, '2022-07-13-113754', 'App\\Database\\Migrations\\DetailBarangmasuk', 'default', 'App', 1658403602, 2),
(45, '2022-07-14-143325', 'App\\Database\\Migrations\\DetailBarangmasukTemp', 'default', 'App', 1658403602, 2),
(46, '2022-07-20-172926', 'App\\Database\\Migrations\\Barangrfid', 'default', 'App', 1658403602, 2),
(47, '2022-07-07-120525', 'App\\Database\\Migrations\\Barang', 'default', 'App', 1658753379, 3),
(50, '2022-07-26-170504', 'App\\Database\\Migrations\\BarangKeluar', 'default', 'App', 1658855792, 4),
(51, '2022-07-26-170528', 'App\\Database\\Migrations\\DetailBarangKeluar', 'default', 'App', 1658855792, 4),
(52, '2022-07-30-050546', 'App\\Database\\Migrations\\Lokasi', 'default', 'App', 1659157986, 5),
(53, '2022-07-30-050551', 'App\\Database\\Migrations\\SubLokasi', 'default', 'App', 1659157986, 5),
(58, '2022-08-01-134937', 'App\\Database\\Migrations\\TrackingBarang', 'default', 'App', 1659369113, 6),
(59, '2022-08-02-152844', 'App\\Database\\Migrations\\User', 'default', 'App', 1659454230, 7);

-- --------------------------------------------------------

--
-- Table structure for table `table_barang`
--

CREATE TABLE `table_barang` (
  `code` varchar(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `kategori` int(10) UNSIGNED NOT NULL,
  `satuan` int(10) UNSIGNED NOT NULL,
  `harga_jual` double NOT NULL DEFAULT 0,
  `harga_beli` double NOT NULL DEFAULT 0,
  `image` text DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_barang`
--

INSERT INTO `table_barang` (`code`, `name`, `kategori`, `satuan`, `harga_jual`, `harga_beli`, `image`, `is_deleted`, `created_at`, `updated_at`) VALUES
('IP5', 'Iphone 5 S', 1, 3, 2100000, 1600000, NULL, 0, '2022-07-25 12:56:30', '2022-07-25 12:57:50'),
('IP6S', 'Iphone 6 S+', 1, 3, 4700000, 3200000, NULL, 0, '2022-07-25 12:59:41', '2022-07-25 12:59:41');

-- --------------------------------------------------------

--
-- Table structure for table `table_barang_keluar`
--

CREATE TABLE `table_barang_keluar` (
  `faktur` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `total_harga` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_barang_keluar`
--

INSERT INTO `table_barang_keluar` (`faktur`, `tanggal`, `total_harga`, `created_at`, `updated_at`) VALUES
('P0001', '2022-08-02', 13600000, '2022-08-02 13:53:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_barang_masuk`
--

CREATE TABLE `table_barang_masuk` (
  `faktur` varchar(20) NOT NULL,
  `tanggal` date NOT NULL,
  `total_harga` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_barang_masuk`
--

INSERT INTO `table_barang_masuk` (`faktur`, `tanggal`, `total_harga`, `created_at`, `updated_at`) VALUES
('0001', '2022-08-02', 9600000, '2022-08-02 13:45:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_barang_rfid`
--

CREATE TABLE `table_barang_rfid` (
  `id` bigint(20) NOT NULL,
  `rfid_tag` varchar(20) NOT NULL,
  `barang` varchar(10) NOT NULL,
  `identifier_barang` varchar(10) DEFAULT NULL,
  `barang_masuk_detail` bigint(20) DEFAULT NULL,
  `barang_keluar_detail` bigint(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_barang_rfid`
--

INSERT INTO `table_barang_rfid` (`id`, `rfid_tag`, `barang`, `identifier_barang`, `barang_masuk_detail`, `barang_keluar_detail`, `created_at`, `updated_at`) VALUES
(1, '1122334455667788', 'IP5', '00001', NULL, NULL, '2022-07-25 13:20:47', '2022-08-02 13:44:17'),
(2, '1111222233334444', 'IP5', '00002', NULL, NULL, '2022-07-25 13:20:47', '2022-08-02 13:44:17'),
(9, '1231545648121549', 'IP5', '00003', NULL, NULL, '2022-07-26 18:50:59', '2022-08-02 13:44:17'),
(10, '1235464589777897', 'IP5', '00004', NULL, NULL, '2022-07-26 18:51:36', '2022-08-02 13:44:17'),
(11, '1213154989797456', 'IP5', '00005', NULL, NULL, '2022-07-26 18:52:27', '2022-08-02 13:44:17'),
(12, '1235449888796546', 'IP5', '00006', NULL, NULL, '2022-07-26 18:53:09', '2022-08-02 13:44:17'),
(16, '1111222233334448', 'IP5', '00009', NULL, NULL, '2022-07-27 14:14:05', '2022-08-02 13:44:17'),
(17, '1122334455667778', 'IP5', '00010', 2, 2, '2022-07-27 14:14:43', '2022-08-02 13:53:19'),
(18, '1111222233224444', 'IP5', '00011', 2, 2, '2022-07-27 14:14:48', '2022-08-02 13:53:19'),
(19, '1111111111111111', 'IP6S', '00001', 1, NULL, '2022-07-31 16:22:53', '2022-08-02 13:53:19'),
(20, '0981233467147618', 'IP6S', '00002', 1, 1, '2022-08-01 16:54:05', '2022-08-02 13:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `table_detail_barang_keluar`
--

CREATE TABLE `table_detail_barang_keluar` (
  `id` bigint(20) NOT NULL,
  `barang_keluar` varchar(20) NOT NULL,
  `barang` varchar(10) NOT NULL,
  `harga_jual` double NOT NULL DEFAULT 0,
  `qty` int(20) NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_detail_barang_keluar`
--

INSERT INTO `table_detail_barang_keluar` (`id`, `barang_keluar`, `barang`, `harga_jual`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, 'P0001', 'IP6S', 4700000, 2, 9400000, '2022-08-02 13:53:19', NULL),
(2, 'P0001', 'IP5', 2100000, 2, 4200000, '2022-08-02 13:53:19', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_detail_barang_masuk`
--

CREATE TABLE `table_detail_barang_masuk` (
  `id` bigint(20) NOT NULL,
  `barang_masuk` varchar(20) NOT NULL,
  `barang` varchar(10) NOT NULL,
  `harga_beli` double NOT NULL DEFAULT 0,
  `qty` int(20) NOT NULL DEFAULT 0,
  `subtotal` double NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_detail_barang_masuk`
--

INSERT INTO `table_detail_barang_masuk` (`id`, `barang_masuk`, `barang`, `harga_beli`, `qty`, `subtotal`, `created_at`, `updated_at`) VALUES
(1, '0001', 'IP6S', 3200000, 2, 6400000, '2022-08-02 13:45:25', NULL),
(2, '0001', 'IP5', 1600000, 2, 3200000, '2022-08-02 13:45:25', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_kategori`
--

CREATE TABLE `table_kategori` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_kategori`
--

INSERT INTO `table_kategori` (`id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Smartphones', 0, '2022-08-02 12:48:37', NULL),
(2, 'PC', 0, '2022-08-02 12:48:37', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `table_lokasi`
--

CREATE TABLE `table_lokasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_lokasi`
--

INSERT INTO `table_lokasi` (`id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Ruang Utama', 0, '2022-07-30 06:26:04', '2022-07-30 14:11:12'),
(2, 'Ruang 1', 0, '2022-07-30 06:27:21', '2022-07-30 06:27:31'),
(3, 'Ruang 2', 0, '2022-07-30 06:27:28', '2022-07-30 14:08:47'),
(4, 'Ruang 3', 0, '2022-07-30 14:14:58', '2022-07-30 14:30:52'),
(5, 'Testing', 0, '2022-07-30 20:30:15', '2022-07-30 20:30:15');

-- --------------------------------------------------------

--
-- Table structure for table `table_satuan`
--

CREATE TABLE `table_satuan` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_satuan`
--

INSERT INTO `table_satuan` (`id`, `name`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Pcs', 1, '2022-07-07 15:39:48', '2022-07-08 04:22:56'),
(2, 'Eks', 0, '2022-07-08 04:24:07', '2022-07-10 03:39:13'),
(3, 'Pcs', 0, '2022-07-08 04:24:13', '2022-07-08 04:24:29');

-- --------------------------------------------------------

--
-- Table structure for table `table_sub_lokasi`
--

CREATE TABLE `table_sub_lokasi` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` int(10) UNSIGNED NOT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_sub_lokasi`
--

INSERT INTO `table_sub_lokasi` (`id`, `name`, `parent`, `is_deleted`, `created_at`, `updated_at`) VALUES
(1, 'Rak 1', 1, 0, '2022-07-30 06:52:24', '2022-07-30 14:08:29'),
(2, 'Rak 1', 2, 0, '2022-07-30 07:21:59', '2022-07-30 07:21:59'),
(3, 'Rak 2', 2, 0, '2022-07-30 07:22:08', '2022-07-30 14:22:59');

-- --------------------------------------------------------

--
-- Table structure for table `table_tracking`
--

CREATE TABLE `table_tracking` (
  `id` int(10) UNSIGNED NOT NULL,
  `rfid_tag` varchar(20) NOT NULL,
  `description` text DEFAULT NULL,
  `type` enum('registration','inbound','outbound','relocation','inbound_deleted','outbound_deleted') NOT NULL,
  `lokasi` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_tracking`
--

INSERT INTO `table_tracking` (`id`, `rfid_tag`, `description`, `type`, `lokasi`, `created_at`, `updated_at`) VALUES
(1, '0981233467147618', 'Inbound Faktur 0001', 'inbound', NULL, '2022-08-02 13:45:25', '2022-08-02 13:45:25'),
(2, '1111111111111111', 'Inbound Faktur 0001', 'inbound', NULL, '2022-08-02 13:45:25', '2022-08-02 13:45:25'),
(3, '1111222233224444', 'Inbound Faktur 0001', 'inbound', NULL, '2022-08-02 13:45:25', '2022-08-02 13:45:25'),
(4, '1122334455667778', 'Inbound Faktur 0001', 'inbound', NULL, '2022-08-02 13:45:25', '2022-08-02 13:45:25'),
(5, '0981233467147618', 'Relocation', 'relocation', 1, '2022-08-02 13:46:08', '2022-08-02 13:46:08'),
(6, '1111111111111111', 'Relocation', 'relocation', 1, '2022-08-02 13:46:08', '2022-08-02 13:46:08'),
(7, '1111222233224444', 'Relocation', 'relocation', 1, '2022-08-02 13:46:08', '2022-08-02 13:46:08'),
(8, '1122334455667778', 'Relocation', 'relocation', 1, '2022-08-02 13:46:08', '2022-08-02 13:46:08'),
(9, '0981233467147618', 'Relocation', 'relocation', 3, '2022-08-02 13:47:40', '2022-08-02 13:47:40'),
(10, '1111111111111111', 'Relocation', 'relocation', 3, '2022-08-02 13:47:40', '2022-08-02 13:47:40'),
(11, '1111222233224444', 'Relocation', 'relocation', 3, '2022-08-02 13:47:40', '2022-08-02 13:47:40'),
(12, '1122334455667778', 'Relocation', 'relocation', 3, '2022-08-02 13:47:40', '2022-08-02 13:47:40'),
(13, '0981233467147618', 'Relocation ke Ruang 1 - Rak 1', 'relocation', 2, '2022-08-02 13:51:54', '2022-08-02 13:51:54'),
(14, '1111111111111111', 'Relocation ke Ruang 1 - Rak 1', 'relocation', 2, '2022-08-02 13:51:54', '2022-08-02 13:51:54'),
(15, '1122334455667778', 'Relocation ke Ruang 1 - Rak 1', 'relocation', 2, '2022-08-02 13:51:54', '2022-08-02 13:51:54'),
(16, '1111222233224444', 'Relocation ke Ruang 1 - Rak 1', 'relocation', 2, '2022-08-02 13:51:54', '2022-08-02 13:51:54'),
(17, '0981233467147618', 'Inbound Faktur P0001', 'inbound', NULL, '2022-08-02 13:53:19', '2022-08-02 13:53:19'),
(18, '1111111111111111', 'Inbound Faktur P0001', 'inbound', NULL, '2022-08-02 13:53:19', '2022-08-02 13:53:19'),
(19, '1111222233224444', 'Inbound Faktur P0001', 'inbound', NULL, '2022-08-02 13:53:19', '2022-08-02 13:53:19'),
(20, '1122334455667778', 'Inbound Faktur P0001', 'inbound', NULL, '2022-08-02 13:53:19', '2022-08-02 13:53:19');

-- --------------------------------------------------------

--
-- Table structure for table `table_user`
--

CREATE TABLE `table_user` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `table_user`
--

INSERT INTO `table_user` (`id`, `name`, `username`, `password`, `created_at`, `updated_at`) VALUES
(1, 'Izzan Iki2', 'Izzan', 'Iki', '2022-08-02 15:38:50', '2022-08-03 14:35:04'),
(3, 'Aryyy', 'Aryyy', 'Aryyy', '2022-08-03 14:35:19', '2022-08-03 14:35:19');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_barang`
--
ALTER TABLE `table_barang`
  ADD PRIMARY KEY (`code`),
  ADD KEY `table_barang_kategori_foreign` (`kategori`),
  ADD KEY `table_barang_satuan_foreign` (`satuan`);

--
-- Indexes for table `table_barang_keluar`
--
ALTER TABLE `table_barang_keluar`
  ADD PRIMARY KEY (`faktur`);

--
-- Indexes for table `table_barang_masuk`
--
ALTER TABLE `table_barang_masuk`
  ADD PRIMARY KEY (`faktur`);

--
-- Indexes for table `table_barang_rfid`
--
ALTER TABLE `table_barang_rfid`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_barang_rfid_barang_foreign` (`barang`);

--
-- Indexes for table `table_detail_barang_keluar`
--
ALTER TABLE `table_detail_barang_keluar`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_detail_barang_keluar_barang_keluar_foreign` (`barang_keluar`),
  ADD KEY `table_detail_barang_keluar_barang_foreign` (`barang`);

--
-- Indexes for table `table_detail_barang_masuk`
--
ALTER TABLE `table_detail_barang_masuk`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_detail_barang_masuk_barang_masuk_foreign` (`barang_masuk`),
  ADD KEY `table_detail_barang_masuk_barang_foreign` (`barang`);

--
-- Indexes for table `table_kategori`
--
ALTER TABLE `table_kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_lokasi`
--
ALTER TABLE `table_lokasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_satuan`
--
ALTER TABLE `table_satuan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_sub_lokasi`
--
ALTER TABLE `table_sub_lokasi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `table_sub_lokasi_parent_foreign` (`parent`);

--
-- Indexes for table `table_tracking`
--
ALTER TABLE `table_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `table_user`
--
ALTER TABLE `table_user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `table_barang_rfid`
--
ALTER TABLE `table_barang_rfid`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `table_detail_barang_keluar`
--
ALTER TABLE `table_detail_barang_keluar`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_detail_barang_masuk`
--
ALTER TABLE `table_detail_barang_masuk`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_kategori`
--
ALTER TABLE `table_kategori`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `table_lokasi`
--
ALTER TABLE `table_lokasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `table_satuan`
--
ALTER TABLE `table_satuan`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_sub_lokasi`
--
ALTER TABLE `table_sub_lokasi`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `table_tracking`
--
ALTER TABLE `table_tracking`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `table_user`
--
ALTER TABLE `table_user`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `table_barang`
--
ALTER TABLE `table_barang`
  ADD CONSTRAINT `table_barang_kategori_foreign` FOREIGN KEY (`kategori`) REFERENCES `table_kategori` (`id`),
  ADD CONSTRAINT `table_barang_satuan_foreign` FOREIGN KEY (`satuan`) REFERENCES `table_satuan` (`id`);

--
-- Constraints for table `table_barang_rfid`
--
ALTER TABLE `table_barang_rfid`
  ADD CONSTRAINT `table_barang_rfid_barang_foreign` FOREIGN KEY (`barang`) REFERENCES `table_barang` (`code`);

--
-- Constraints for table `table_detail_barang_keluar`
--
ALTER TABLE `table_detail_barang_keluar`
  ADD CONSTRAINT `table_detail_barang_keluar_barang_foreign` FOREIGN KEY (`barang`) REFERENCES `table_barang` (`code`),
  ADD CONSTRAINT `table_detail_barang_keluar_barang_keluar_foreign` FOREIGN KEY (`barang_keluar`) REFERENCES `table_barang_keluar` (`faktur`);

--
-- Constraints for table `table_detail_barang_masuk`
--
ALTER TABLE `table_detail_barang_masuk`
  ADD CONSTRAINT `table_detail_barang_masuk_barang_foreign` FOREIGN KEY (`barang`) REFERENCES `table_barang` (`code`),
  ADD CONSTRAINT `table_detail_barang_masuk_barang_masuk_foreign` FOREIGN KEY (`barang_masuk`) REFERENCES `table_barang_masuk` (`faktur`);

--
-- Constraints for table `table_sub_lokasi`
--
ALTER TABLE `table_sub_lokasi`
  ADD CONSTRAINT `table_sub_lokasi_parent_foreign` FOREIGN KEY (`parent`) REFERENCES `table_lokasi` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

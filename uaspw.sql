-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 10 Jun 2025 pada 14.49
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `uaspw`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`) VALUES
(1, 'admin123', '$2y$10$BQpKzj.l8IAv8A8eqkkfHOtBjNXuYKbHQ.UXJNgfNsgVSW55a3H46');

-- --------------------------------------------------------

--
-- Struktur dari tabel `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `nama_makanan` varchar(255) DEFAULT NULL,
  `jumlah_pesanan` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `pajak` int(11) DEFAULT NULL,
  `subtotal` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kritik_saran`
--

CREATE TABLE `kritik_saran` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `isi_kritiksaran` text DEFAULT NULL,
  `is_anonim` tinyint(1) DEFAULT NULL,
  `tanggal_submit` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `kritik_saran`
--

INSERT INTO `kritik_saran` (`id`, `nama`, `email`, `isi_kritiksaran`, `is_anonim`, `tanggal_submit`) VALUES
(0, 'Daffa raihan permana', 'daffa9746@gmail.com', 'anjir banget', 0, '2025-06-10 16:29:48'),
(0, 'Anonim', '', 'aldalala', 1, '2025-06-10 16:30:11');

-- --------------------------------------------------------

--
-- Struktur dari tabel `makanan`
--

CREATE TABLE `makanan` (
  `id` int(11) NOT NULL,
  `nama_makanan` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `kategori` varchar(50) NOT NULL,
  `stok` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `makanan`
--

INSERT INTO `makanan` (`id`, `nama_makanan`, `harga`, `kategori`, `stok`) VALUES
(1, 'BUBUR AYAM', 15000, 'Makanan', 49),
(2, 'SATE AYAM', 40000, 'Makanan', 45),
(3, 'NASI GORENG', 32000, 'Makanan', 49),
(4, 'MIE GORENG', 30000, 'Makanan', 44),
(5, 'AYAM GEPREK', 34000, 'Makanan', 50),
(6, 'IKAN BAKAR', 48000, 'Makanan', 49);

-- --------------------------------------------------------

--
-- Struktur dari tabel `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `tanggal` datetime NOT NULL,
  `total_harga` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `orders`
--

INSERT INTO `orders` (`id`, `tanggal`, `total_harga`, `user_id`) VALUES
(1, '2025-06-10 12:41:14', 16800, 1),
(2, '2025-06-10 12:42:25', 16800, 1),
(3, '2025-06-10 12:42:38', 44800, 1),
(4, '2025-06-10 12:42:54', 67200, 1),
(5, '2025-06-10 12:43:30', 179200, 1),
(6, '2025-06-10 12:43:48', 201600, 1),
(7, '2025-06-10 12:43:59', 35840, 1),
(8, '2025-06-10 14:47:21', 16800, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `nama_makanan` varchar(255) NOT NULL,
  `jumlah_pesanan` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `pajak` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `nama_makanan`, `jumlah_pesanan`, `harga`, `pajak`, `subtotal`) VALUES
(25, 1, 'Bubur Ayam', 1, 15000, 1800, 16800),
(26, 2, 'Ikan bakar', 1, 15000, 1800, 16800),
(27, 3, 'Sate ayam ', 1, 40000, 4800, 44800),
(28, 4, 'Bubur Ayam', 4, 15000, 1800, 67200),
(29, 5, 'Sate ayam ', 4, 40000, 4800, 179200),
(30, 6, 'mie goreng', 6, 30000, 21600, 201600),
(31, 7, 'Nasi Goreng', 1, 32000, 3840, 35840),
(32, 8, 'Bubur Ayam', 1, 15000, 1800, 16800);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservasi`
--

CREATE TABLE `reservasi` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `nama_pemesan` varchar(100) NOT NULL,
  `tanggal` date NOT NULL,
  `waktu` time NOT NULL,
  `jumlah_orang` int(11) NOT NULL,
  `nomor_meja` int(11) NOT NULL,
  `opsi_pesan_makanan` enum('resto','web') NOT NULL DEFAULT 'resto',
  `bukti_transfer` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `menu` text DEFAULT NULL,
  `jumlah_menu` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reservasi`
--

INSERT INTO `reservasi` (`id`, `user_id`, `nama_pemesan`, `tanggal`, `waktu`, `jumlah_orang`, `nomor_meja`, `opsi_pesan_makanan`, `bukti_transfer`, `created_at`, `menu`, `jumlah_menu`) VALUES
(1, 1, 'daffa', '2025-06-10', '14:23:00', 2, 3, 'resto', 'bukti_6846efd77c69a.png', '2025-06-09 14:29:43', '[]', '{\"Nasi Goreng\":\"\",\"Ayam Bakar\":\"\",\"Sate Ayam\":\"\",\"Es Teh\":\"\"}'),
(2, 1, 'resky', '2025-06-19', '20:27:00', 7, 9, 'web', 'bukti_6847f99b49361.jpg', '2025-06-10 09:23:39', '[\"Nasi Goreng\",\"Ayam Bakar\"]', '{\"Nasi Goreng\":\"2\",\"Ayam Bakar\":\"5\",\"Sate Ayam\":\"\",\"Es Teh\":\"\"}'),
(3, 1, 'zaki viola', '2025-06-18', '16:42:00', 2, 2, 'web', 'bukti_6847fda26b0df.png', '2025-06-10 09:40:50', '[\"Nasi Goreng\"]', '{\"Nasi Goreng\":\"2\",\"Ayam Bakar\":\"\",\"Sate Ayam\":\"\",\"Es Teh\":\"\"}');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `nama`, `email`, `password`, `created_at`) VALUES
(1, 'Daffa raihan permana', 'daffa9746@gmail.com', '$2y$10$ebeU7rWkUhncl1.s78OdXO5zwaKHcBZhmWe94OnmffG2wUYomyMGe', '2025-06-08 07:43:16'),
(2, 'ARVANDO DAVISCO', 'arvandodavisco73@gmail.com', '$2y$10$u4xfgYSx3nZIiib6o8nZeORQIGOFFE51jhPifs/TJCyioBboWo4Nu', '2025-06-08 07:57:39'),
(3, 'Azizah Nazwa Salsabila', 'ichaafsa15@gmail.com', '$2y$10$9JLDwRX5Ony4179pGS4HDOKj6CwvDJyhKQ/NGFZL9qa/PUNIbl9n6', '2025-06-08 09:04:48'),
(4, 'aldanticp', 'rynaldi1804@gmail.com', '$2y$10$Mo/AGKtK5wnRaPa6oaL6qe6q0N14ekQYfYI.qrcZzY3flHrXEv9ya', '2025-06-10 09:48:24');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeks untuk tabel `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `makanan`
--
ALTER TABLE `makanan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indeks untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

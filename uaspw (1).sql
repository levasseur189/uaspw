-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 09 Jun 2025 pada 19.56
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
(1, 'Anonim', '', 'viola cantik', 1, '2025-06-09 23:22:41'),
(2, 'Taufik Hidayat', 'kelompok7@gmail.com', 'wlwlwlwlw', 0, '2025-06-09 23:23:47'),
(3, 'Taufik Hidayat', 'kelompok7@gmail.com', 'wlwlwlwlw', 0, '2025-06-09 23:27:24'),
(4, 'Taufik Hidayat', 'kelompok7@gmail.com', 'damn', 0, '2025-06-09 23:28:18'),
(5, 'Taufik Hidayat', 'kelompok7@gmail.com', 'wlwlwlwlw', 0, '2025-06-09 23:28:56'),
(6, 'pio', 'zakkizzain@gmail.com', 'pio cantik nan imut', 0, '2025-06-09 23:33:15'),
(7, 'dapa raihan', 'daffa2389@gmail.com', 'alda jelek', 0, '2025-06-09 23:42:03');

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
(2, 'SATE AYAM', 40000, 'BAKARAN', 22);

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
(1, '2025-06-08 17:23:13', 16800, 1),
(2, '2025-06-09 19:30:16', 44800, 1),
(3, '2025-06-09 19:53:23', 224000, 1);

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
(21, 1, 'Ikan bakar', 1, 15000, 1800, 16800),
(22, 2, 'Sate ayam ', 1, 40000, 4800, 44800),
(23, 3, 'Sate ayam ', 5, 40000, 4800, 224000);

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
(3, 'Azizah Nazwa Salsabila', 'ichaafsa15@gmail.com', '$2y$10$9JLDwRX5Ony4179pGS4HDOKj6CwvDJyhKQ/NGFZL9qa/PUNIbl9n6', '2025-06-08 09:04:48');

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
-- Indeks untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT untuk tabel `kritik_saran`
--
ALTER TABLE `kritik_saran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `makanan`
--
ALTER TABLE `makanan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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

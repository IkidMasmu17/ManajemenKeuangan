-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 01 Mar 2023 pada 14.01
-- Versi server: 10.4.24-MariaDB
-- Versi PHP: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `laraveluangan`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `kategori`
--

CREATE TABLE `kategori` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `defaultvalue` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tapel_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kategori`
--

INSERT INTO `kategori` (`id`, `nama`, `prefix`, `created_at`, `updated_at`, `defaultvalue`, `tipe`, `semester`, `tapel_nama`, `bln`) VALUES
(1, 'Kepala Sekolah', 'pegawai', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(2, 'Administrator/Bendahara', 'pegawai', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(3, 'Dana Bos', 'pemasukan', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(4, 'Lain-lain', 'pemasukan', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(5, 'Dana Bos', 'pengeluaran', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(6, 'Dana Bulanan', 'pengeluaran', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(7, 'Lain-lain', 'pengeluaran', '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL, NULL, NULL, NULL, NULL),
(8, 'Semester 1', 'semester', '2023-03-01 13:00:28', '2023-03-01 13:00:28', NULL, NULL, NULL, NULL, NULL),
(9, 'Semester 2', 'semester', '2023-03-01 13:00:28', '2023-03-01 13:00:28', NULL, NULL, NULL, NULL, NULL),
(10, 'Uang Gedung', 'tagihan', '2023-03-01 13:00:28', '2023-03-01 13:00:28', '1000000', 'sekali', 'Semester 1', '2021/2022', '2021-08'),
(11, 'SPP', 'tagihan', '2023-03-01 13:00:28', '2023-03-01 13:00:28', '1000000', 'perbulan', 'Semester 1', '2021/2022', '2021-08'),
(12, 'UTS', 'tagihan', '2023-03-01 13:00:28', '2023-03-01 13:00:28', '1000000', 'persemester', 'Semester 1', '2021/2022', '2021-08'),
(13, 'UAS', 'tagihan', '2023-03-01 13:00:28', '2023-03-01 13:00:28', '1000000', 'persemester', 'Semester 1', '2021/2022', '2021-08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kelas`
--

CREATE TABLE `kelas` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kelas`
--

INSERT INTO `kelas` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, 'XII A', '2023-03-01 13:00:27', '2023-03-01 13:00:27'),
(2, 'XII B', '2023-03-01 13:00:27', '2023-03-01 13:00:27'),
(3, 'XIII A', '2023-03-01 13:00:27', '2023-03-01 13:00:27'),
(4, 'XIII B', '2023-03-01 13:00:27', '2023-03-01 13:00:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2014_10_12_200000_add_two_factor_columns_to_users_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2021_08_04_120627_create_tapel_table', 1),
(7, '2021_08_04_120649_create_kelas_table', 1),
(8, '2021_08_04_120712_create_siswa_table', 1),
(9, '2021_08_04_120911_create_pagawai_table', 1),
(10, '2021_08_04_121057_create_tagihanatur_table', 1),
(11, '2021_08_04_121341_create_tagihansiswa_table', 1),
(12, '2021_08_04_121604_create_kategori_table', 1),
(13, '2021_08_04_121649_create_pemasukan_table', 1),
(14, '2021_08_04_121659_create_pengeluaran_table', 1),
(15, '2021_08_04_121943_add_tipeuser_on_user_table', 1),
(16, '2021_08_04_130603_create_tagihansiswadetail_table', 1),
(17, '2021_08_04_141828_create_sessions_table', 1),
(18, '2021_08_05_143347_drop_kategoriid_on_pegawai_table', 1),
(19, '2021_08_05_164230_drop_kategoriid_on_pemasukandanpengeluaran_table', 1),
(20, '2021_08_06_101747_add_nominaltagihan_to_tagihansiswa_table', 1),
(21, '2021_08_06_155146_create_settings_table', 1),
(22, '2021_08_07_231944_add_field_on_settings_table', 1),
(23, '2021_08_14_104229_add_field_on_settingsandkategori_table', 1),
(24, '2021_08_15_145213_create_pembayaran_table', 1),
(25, '2021_08_15_153220_create_pembayarandetail_table', 1),
(26, '2021_08_16_143558_add_bln_on_pembayaran_table', 1),
(27, '2021_08_16_213216_add_bln_on_pembayarandetail_table', 1),
(28, '2021_08_17_164014_drop_tagihan_table', 1),
(29, '2021_09_02_164936_add_hp_on_siswa_table', 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pegawai`
--

CREATE TABLE `pegawai` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nig` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pegawai`
--

INSERT INTO `pegawai` (`id`, `nama`, `nig`, `kategori_nama`, `alamat`, `telp`, `created_at`, `updated_at`) VALUES
(1, 'Admin', '123', 'Administrator/Bendahara', NULL, NULL, '2023-03-01 13:00:28', '2023-03-01 13:00:28'),
(2, 'Kepala Sekolah', '111', 'Kepala Sekolah', NULL, NULL, '2023-03-01 13:00:28', '2023-03-01 13:00:28');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pemasukan`
--

CREATE TABLE `pemasukan` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tglbayar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `siswa_nis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `siswa_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `namatagihan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominaltagihan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipe` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tapel_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pembayarandetail`
--

CREATE TABLE `pembayarandetail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pembayaran_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tglbayar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `bln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengeluaran`
--

CREATE TABLE `pengeluaran` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nominal` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kategori_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `catatan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tglbayar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('wAIBhPkh9NJAeXfHdvC2K9INh1MyG9o5nujBQIY3', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlZKOE1OckY5QVUyd2xEd2JrMThmaE0yN2Jmb2hLY0RrZzdPa29tYSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fX0=', 1677675670);

-- --------------------------------------------------------

--
-- Struktur dari tabel `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `paginationjml` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tapelaktif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `sekolahnama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sekolahalamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sekolahtelp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplikasijudul` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aplikasijudulsingkat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semesteraktif` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester1bln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `semester2bln` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `settings`
--

INSERT INTO `settings` (`id`, `paginationjml`, `tapelaktif`, `created_at`, `updated_at`, `sekolahnama`, `sekolahalamat`, `sekolahtelp`, `aplikasijudul`, `aplikasijudulsingkat`, `semesteraktif`, `semester1bln`, `semester2bln`) VALUES
(1, '10', '2021/2022', '2023-03-01 13:00:28', '2023-03-01 13:00:28', 'SMP ABCD 01 Malang', 'Jl. Abcd Desa Qwerty Kecamatan Zxcvb', '0341-123456', 'Sistem Keuangan', 'SK', 'Semester 1', '2021-07', '2022-02');

-- --------------------------------------------------------

--
-- Struktur dari tabel `siswa`
--

CREATE TABLE `siswa` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nis` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tempatlahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tgllahir` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `alamat` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tapel_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kelas_nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `siswa`
--

INSERT INTO `siswa` (`id`, `nama`, `nis`, `agama`, `tempatlahir`, `tgllahir`, `alamat`, `tapel_nama`, `kelas_nama`, `jk`, `created_at`, `updated_at`, `hp`) VALUES
(1, 'Paijo', '1', NULL, 'Malang', '2003-05-20', 'Desa Sumbersari Kecamatan Losari Kabupaten Trenggalek', '2021/2022', 'XIII A', NULL, '2023-03-01 13:00:27', '2023-03-01 13:00:27', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tapel`
--

CREATE TABLE `tapel` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tapel`
--

INSERT INTO `tapel` (`id`, `nama`, `created_at`, `updated_at`) VALUES
(1, '2021/2022', '2023-03-01 13:00:27', '2023-03-01 13:00:27');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `two_factor_secret` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_factor_recovery_codes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `current_team_id` bigint(20) UNSIGNED DEFAULT NULL,
  `profile_photo_path` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `tipeuser` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nomerinduk` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `two_factor_secret`, `two_factor_recovery_codes`, `remember_token`, `current_team_id`, `profile_photo_path`, `created_at`, `updated_at`, `tipeuser`, `nomerinduk`) VALUES
(1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$ZQ.6V5ShOORF1LphLAtUiurmmaTa6ipkV56lvXvnjH2lGV8xUy8kG', NULL, NULL, NULL, NULL, NULL, '2023-03-01 13:00:26', '2023-03-01 13:00:26', 'admin', '123'),
(2, 'Kepsek', 'kepsek@gmail.com', NULL, '$2y$10$XPUadJyxisepHJUvJ1BB5OsznK0JRIRntZYmhSznkhuM5AfggJqZG', NULL, NULL, NULL, NULL, NULL, '2023-03-01 13:00:27', '2023-03-01 13:00:27', 'kepsek', '111'),
(3, 'Paijo', 'siswa@gmail.com', NULL, '$2y$10$oVKEcP7OsAFlIYhKELS5FuQmCv5ZsOSSkl4VNzF2xoYHwIoi9U.iq', NULL, NULL, NULL, NULL, NULL, '2023-03-01 13:00:27', '2023-03-01 13:00:27', 'siswa', '1');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indeks untuk tabel `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pembayarandetail`
--
ALTER TABLE `pembayarandetail`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indeks untuk tabel `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indeks untuk tabel `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tapel`
--
ALTER TABLE `tapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT untuk tabel `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT untuk tabel `pegawai`
--
ALTER TABLE `pegawai`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `pemasukan`
--
ALTER TABLE `pemasukan`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pembayarandetail`
--
ALTER TABLE `pembayarandetail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pengeluaran`
--
ALTER TABLE `pengeluaran`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tapel`
--
ALTER TABLE `tapel`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

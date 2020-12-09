-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 30 Okt 2020 pada 14.10
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbkelas`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_docs`
--

CREATE TABLE `tbl_docs` (
  `docID` int(11) NOT NULL,
  `docType` varchar(20) NOT NULL,
  `docFile` varchar(200) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_inventori`
--

CREATE TABLE `tbl_inventori` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  `kondisi` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_inventori`
--

INSERT INTO `tbl_inventori` (`id`, `nama`, `jumlah`, `kondisi`) VALUES
(1, 'Meja', 38, 'Baik'),
(3, 'Kursi', 38, 'Baik'),
(4, 'Papan Tulis', 1, 'Baik'),
(5, 'Penghapus', 3, 'Baik'),
(6, 'Sapu', 6, 'Rusak Ringan'),
(7, 'Spidol', 3, 'Baik'),
(8, 'Kemoceng', 2, 'Baik');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kelas`
--

CREATE TABLE `tbl_kelas` (
  `id` int(11) NOT NULL,
  `kelas` varchar(20) DEFAULT NULL,
  `wali_kelas` varchar(40) DEFAULT NULL,
  `sekolah` varchar(50) DEFAULT NULL,
  `alamat_sekolah` varchar(255) DEFAULT NULL,
  `tahun_ajaran` varchar(15) DEFAULT NULL,
  `semester` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_kelas`
--

INSERT INTO `tbl_kelas` (`id`, `kelas`, `wali_kelas`, `sekolah`, `alamat_sekolah`, `tahun_ajaran`, `semester`) VALUES
(1, 'XII  Mipa 3', 'Kadek Suantika', 'SMA Negeri 1 Banjarangkan', 'Tusan, Banjarankan, Kabupaten Klungkung, Bali 80752', '2020/2021', 'Semester 1');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_mapel`
--

CREATE TABLE `tbl_mapel` (
  `id` int(11) NOT NULL,
  `mapel` varchar(50) DEFAULT NULL,
  `jumlah_jam` int(11) DEFAULT NULL,
  `guru_pengampu` varchar(100) DEFAULT NULL,
  `ruangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_mapel`
--

INSERT INTO `tbl_mapel` (`id`, `mapel`, `jumlah_jam`, `guru_pengampu`, `ruangan`) VALUES
(1, 'Agama Hindu', 2, 'Gusti Lanang', 'XII Mipa 3'),
(2, 'Matematika', 4, 'Agung Istri Raka', 'XII Mipa 3'),
(3, 'Bahasa Indonesia', 2, 'Dewa Tirta', 'XII Mipa 3'),
(4, 'PPKN', 2, 'Komang Ari', 'XII Mipa 3'),
(5, 'Bahasa Inggris', 2, 'Ari Suseni', 'XII Mipa 3'),
(6, 'Bimbingan Konseling', 1, 'Wayan Santika', 'XII Mipa 3'),
(7, 'Biologi', 2, 'Juni Erawati', 'XII Mipa 3');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_siswa`
--

CREATE TABLE `tbl_siswa` (
  `id` int(11) NOT NULL,
  `nis` int(4) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `agama` varchar(20) DEFAULT NULL,
  `tempat_lahir` varchar(30) DEFAULT NULL,
  `tanggal_lahir` varchar(20) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_siswa`
--

INSERT INTO `tbl_siswa` (`id`, `nis`, `nama`, `agama`, `tempat_lahir`, `tanggal_lahir`, `alamat`) VALUES
(1, 4325, 'Luh Gede Pramesti Indrasuari', 'Hindu', 'Klungkung', '2001-05-31', 'Sampalan Tengah'),
(3, 7585, 'Luh Made Kurnia Dewi', 'Hindu', 'Klungkung', '2001-11-10', 'Klungkung'),
(4, 7564, 'Luh Komang Intan Frida Dewi', 'Hindu', 'Klungkung', '2001-05-28', 'Semarapura'),
(6, 8473, 'Luh Ketut Cinta Berliana Pradnyani', 'Hindu', 'Klungkung', '2001-07-28', 'Tangkas');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_users`
--

CREATE TABLE `tbl_users` (
  `id` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data untuk tabel `tbl_users`
--

INSERT INTO `tbl_users` (`id`, `nama`, `username`, `password`) VALUES
(21, 'odee', 'ode31', '$2y$10$afMO489MSEzqknK7ZwHPvOvV7aoVdcIXClsb7BaCMDKydT8swaELG'),
(22, 'odee', 'odee31', '$2y$10$6ZToZ/Vjkv7BDzEAXMrmQeZ1GpYQyFG4c3kQIKLKg/f109f.cdO7O');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_docs`
--
ALTER TABLE `tbl_docs`
  ADD PRIMARY KEY (`docID`);

--
-- Indeks untuk tabel `tbl_inventori`
--
ALTER TABLE `tbl_inventori`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_mapel`
--
ALTER TABLE `tbl_mapel`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_docs`
--
ALTER TABLE `tbl_docs`
  MODIFY `docID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_inventori`
--
ALTER TABLE `tbl_inventori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT untuk tabel `tbl_kelas`
--
ALTER TABLE `tbl_kelas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_mapel`
--
ALTER TABLE `tbl_mapel`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_siswa`
--
ALTER TABLE `tbl_siswa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tbl_users`
--
ALTER TABLE `tbl_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

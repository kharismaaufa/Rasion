-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 19 Jun 2021 pada 14.07
-- Versi server: 10.4.19-MariaDB
-- Versi PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cofein`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_gambar`
--

CREATE TABLE `tbl_gambar` (
  `id_gambar` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `ket` varchar(255) DEFAULT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_gambar`
--

INSERT INTO `tbl_gambar` (`id_gambar`, `id_produk`, `ket`, `gambar`) VALUES
(2, 1, 'gambar 2', 'gambar (2).jpg'),
(3, 1, 'gambar 3', 'gambar (3).jpg'),
(5, 1, 'gambar 5', 'gambar (5).jpg'),
(6, 7, 'Gambar 1', 'mocaccino.jpg'),
(7, 2, 'Gambar 1', 'latte.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_kategori`
--

CREATE TABLE `tbl_kategori` (
  `id_kategori` int(11) NOT NULL,
  `nama_kategori` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_kategori`
--

INSERT INTO `tbl_kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Kopi'),
(2, 'Alat'),
(4, 'Matcha'),
(5, 'Coklat');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_pelanggan`
--

CREATE TABLE `tbl_pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `nama_pelanggan` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` text DEFAULT NULL,
  `foto` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_pelanggan`
--

INSERT INTO `tbl_pelanggan` (`id_pelanggan`, `nama_pelanggan`, `email`, `password`, `foto`) VALUES
(1, 'Kharisma', 'kharismaaufa22@gmail.com', '123456', 'fafa.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_produk`
--

CREATE TABLE `tbl_produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(255) DEFAULT NULL,
  `id_kategori` int(11) DEFAULT NULL,
  `harga` int(11) DEFAULT NULL,
  `deskripsi` mediumtext DEFAULT NULL,
  `gambar` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_produk`
--

INSERT INTO `tbl_produk` (`id_produk`, `nama_produk`, `id_kategori`, `harga`, `deskripsi`, `gambar`) VALUES
(1, 'Affogato', 2, 20000, 'Affogato adalah sajian es krim dalam cangkir atau mangkuk kecil yang disiram dengan espresso. Sajian kopi unik ini berasal dari Italia. Dalam bahasa Italia affogato berarti tenggelam. Maksud dari penamaan itu adalah untuk menggambarkan tenggelamnya satu scoop es krim di dalam segelas espresso.', 'affogato.jpg'),
(2, 'Americano', 1, 15000, 'Americano adalah minuman kopi espresso dengan tambahan air panas. Namanya diambil dari cara orang Amerika meminum espresso. Konon, penyebutan americano adalah sebagai lelucon dan ejekan terhadap orang-orang Amerika yang suka espresso-nya dibuat lebih encer.', 'americano.jpg'),
(7, 'Cappucino', 5, 30000, 'Kopi Cappuccino adalah minuman khas Italia yang terdiri dari 1/3 espresso, 1/3 susu steamed, dan 1/3 buih susu. Pada dasarnya, minuman ini adalah campuran dari espresso dan susu seperti minuman-minuman berbasis espresso lainnya. Sepintas, sajian cappuccino hampir tampak serupa dengan minuman latte.', 'cappuccino.jpg'),
(8, 'Cortado', 1, 10000, 'Cortado sendiri menurut Matt Sheridan, Barista dari Albury Coffee Mama, adalah minuman yang komposisinya berada di antara piccolo latte dan caffe latte. Dengan komposisi single shot dan susu sekitar sepertiga gelas.', 'cortado.jpg'),
(9, 'Espresso', 1, 21000, 'Kopi espresso adalah kopi yang diseduh dengan menyemburkan air panas bertekanan tinggi ke bubuk kopi. Namanya berasal dari bahasa Italia yang berarti express atau cepat. Disajikan hanya secangkir kecil kira-kira 30-45 ml dengan ciri khas crema pada permukaannya.', 'espresso.jpg'),
(10, 'Latte', 1, 9000, 'Sama dengan cappucino, latte pada dasarnya ialah kopi susu. Latte diberi foam dari susu yang sudah di-steam. Kadar susunya paling banyak, barista menyebut komposisinya dengan very milky coffee. Tentunya kadar lemak di latte paling banyak dibandingkan kopi macchiato, piccolo, espresso dan cappucino', 'latte.jpg');

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_rinci_transaksi`
--

CREATE TABLE `tbl_rinci_transaksi` (
  `id_rinci` int(11) NOT NULL,
  `no_order` varchar(15) DEFAULT NULL,
  `id_produk` int(11) DEFAULT NULL,
  `qty` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_transaksi`
--

CREATE TABLE `tbl_transaksi` (
  `id_transaksi` int(25) NOT NULL,
  `no_order` varchar(25) DEFAULT NULL,
  `tgl_order` date DEFAULT NULL,
  `nama_penerima` varchar(50) DEFAULT NULL,
  `alamat_penerima` text DEFAULT NULL,
  `tlp_penerima` varchar(16) DEFAULT NULL,
  `total_bayar` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_transaksi`
--

INSERT INTO `tbl_transaksi` (`id_transaksi`, `no_order`, `tgl_order`, `nama_penerima`, `alamat_penerima`, `tlp_penerima`, `total_bayar`) VALUES
(1, NULL, NULL, 'Aufa Ramadhani', 'Jl.Sunan Kalijaga IV/4', '857777777', NULL),
(2, NULL, '2021-06-17', 'fafa', 'Jl.Sunan Kalijaga IV/4', '62896771900', NULL),
(3, NULL, '2021-06-17', 'Ramadhani', 'Jl. Sadewa 1', '089677142121', NULL),
(4, NULL, '2021-06-17', 'Aufa Ramadhani', 'Jl.Sunan Kalijaga IV/4', '089619361291', NULL),
(5, NULL, '2021-06-17', 'Joni', 'Jl Nakula raaya', '0293389123', NULL),
(6, NULL, '2021-06-17', 'Joni', 'Jl Nakula raaya', '0293389123', NULL),
(7, NULL, '2021-06-17', 'Aufa Ramadhani', 'Jl.Sunan Kalijaga IV/4', '089619361291', NULL),
(8, NULL, '2021-06-17', 'Aufa Ramadhani', 'Jl.Sunan Kalijaga IV/4', '089619361291', NULL),
(9, NULL, '2021-06-17', 'Budi', 'Jogja-magelang', '089619361291', NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `tbl_user`
--

CREATE TABLE `tbl_user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(25) DEFAULT NULL,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(25) DEFAULT NULL,
  `level_user` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data untuk tabel `tbl_user`
--

INSERT INTO `tbl_user` (`id_user`, `nama_user`, `username`, `password`, `level_user`) VALUES
(1, 'Kharisma', 'admin', 'admin', 1),
(2, 'Kevin', 'user', 'user', 1),
(3, 'Fajar', 'fajar', 'fajar', 1),
(4, 'Budi', 'budidoremi', 'budi', 2),
(10, 'paijo', 'paijo123', 'paijo123', 2);

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  ADD PRIMARY KEY (`id_gambar`);

--
-- Indeks untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indeks untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indeks untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indeks untuk tabel `tbl_rinci_transaksi`
--
ALTER TABLE `tbl_rinci_transaksi`
  ADD PRIMARY KEY (`id_rinci`);

--
-- Indeks untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  ADD PRIMARY KEY (`id_transaksi`);

--
-- Indeks untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `tbl_gambar`
--
ALTER TABLE `tbl_gambar`
  MODIFY `id_gambar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_kategori`
--
ALTER TABLE `tbl_kategori`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `tbl_pelanggan`
--
ALTER TABLE `tbl_pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT untuk tabel `tbl_produk`
--
ALTER TABLE `tbl_produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT untuk tabel `tbl_rinci_transaksi`
--
ALTER TABLE `tbl_rinci_transaksi`
  MODIFY `id_rinci` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `tbl_transaksi`
--
ALTER TABLE `tbl_transaksi`
  MODIFY `id_transaksi` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

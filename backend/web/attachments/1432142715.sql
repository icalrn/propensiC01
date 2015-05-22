-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 10, 2015 at 08:14 AM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `propensi`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_log`
--

CREATE TABLE IF NOT EXISTS `activity_log` (
  `User_ID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Activity` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `activity_log`
--

INSERT INTO `activity_log` (`User_ID`, `Timestamp`, `Activity`) VALUES
(1, '2015-04-09 16:40:47', 'Membuat database sambil main coc'),
(1, '2015-04-10 05:26:12', 'Memberikan testimoni'),
(1, '2015-04-10 05:27:22', 'Membuat subkategori baru'),
(1, '2015-04-10 05:27:33', 'Membuat kategori baru');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `User_ID` int(10) NOT NULL,
  `Quiz_ID` int(3) NOT NULL,
  `Question_ID` int(6) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Answer_text` text NOT NULL,
  `Subcategory_text` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `answer`
--

INSERT INTO `answer` (`User_ID`, `Quiz_ID`, `Question_ID`, `Timestamp`, `Answer_text`, `Subcategory_text`) VALUES
(1, 1, 1, '0000-00-00 00:00:00', 'Bidang pekerjaan yang dijalankan & ditekuni dengan serius dalam jangka waktu panjang, memberikan peluang untuk mengembangkan diri', 'Pekerjaan'),
(1, 1, 1, '2000-11-10 18:00:00', 'Jalan menuju sukses', 'Jalan Hidup '),
(1, 1, 1, '2000-11-10 19:00:00', 'Sesuatu yang anda sukai dalam mengerjakannya dan dapat memberikan penghasilan untuk memenuhi kebutuhan harian', 'Penunjang Kehidupan'),
(1, 1, 1, '2000-11-10 20:00:00', 'Proses mencapai visi diri. Didalamnya terdapat rasa senang hati menjalankannya, pengembangan diri, perbaikan siri terus menerus. Karir tidak selalu sama dengan pekerjaan. Karir dicapai dalam jangka yang panjang.', 'Aktualisasi diri'),
(1, 1, 1, '2000-11-10 21:00:00', 'Merupakan jiwa saya', 'Jati diri'),
(1, 1, 1, '2000-11-10 22:00:00', 'Karir adalah jalur rintisan peningkatan level dalam pekerjaan secara berhierarki vertikal', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-10 23:00:00', 'wadah untuk menyalurkan bakat, skill dan passion untuk juga kemudian di asah sehingga menjadi lebih baik.', 'Aktualisasi diri'),
(1, 1, 1, '2000-11-11 00:00:00', 'Jenjang dalam pekerjaan', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 01:00:00', 'Karir adalah proses menuju pemahaman baru dalam berkarya. Tidak untuk kepuasan batin tetapi berbuat sesuatu untuk orang-orang yang dicintai.', 'Bermanfaat bagi orang lain '),
(1, 1, 1, '2000-11-11 02:00:00', 'Progress atau jenjang dari pekerjaan berdasarkan prestasi dan kompetensi masing2 individu', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 03:00:00', 'Progres seseorang dalam konteks perkerjaan, dimana ia melalui tahapan/tingkat, yang bersifat hirarki. Mulai dari tingkat bawah, sampai suatu tingkat tertentu dimana perubahan tingkat padanya relevan/koheren dengan tingkat sebelumnya.', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-11 04:00:00', 'tahapan dalam mengembangkan diri dalam lingkup pekerjaan', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 05:00:00', 'Proses menuju sebuah pencapaian diri yang terbaik.', 'Pencapaian diri'),
(1, 1, 1, '2000-11-11 06:00:00', 'karir adalah kondisi pekerjaan seseorang, dimana karir bisa dimulai dari bawah karena kemampuan atau dimulai dari mana diinginkan karena relasi/warisan', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 07:00:00', 'Jenjang dari suatu pekerjaan', 'Pekerjaan '),
(1, 1, 1, '2000-11-11 08:00:00', 'tujuan dalam mencapai pekerjaan yang ada dalam diri individu. Mulai dari passion dalam pekerjaan, nilai yang kita miliki, dan rasa nyaman. Karier itu sendiri sudah dimiliki oleh setiap individu tanpa kecuali. Kita hanya harus mengembangkan dan mengarahkan ke mana arah tujuan karier kita nantinya.Karier juga bisa berarti cita-cita kita untuk ke depannya.', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 09:00:00', 'Karir: keningkatan sumberdaya manusia, yang mana kenaikan meningkat dari tangga awal sampai tangga kehidupan,', 'Peningkatan diri dalam kehidupan'),
(1, 1, 1, '2000-11-11 10:00:00', 'Jenjang dari pekerjaan', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 11:00:00', 'Jalan hidup', 'Jalan Hidup'),
(1, 1, 1, '2000-11-11 12:00:00', 'Jenjang dari pekerjaan', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 13:00:00', 'suatu jenjang dalam pekerjaan kita dimana yang kita harapkan adalah suatu jenjang karir yang terus meningkat', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 14:00:00', 'Suatu usaha yang dilakukan sendiri, bekerja sama, ataupun bekerja pada orang lain dengan harapan memperoleh imbalan hasil.', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 15:00:00', 'Karir adalah suatu jenjangan dalam pekerjaan. Yang bisa dijalani oleh siapa saja tanpa harus ad kriteria khusus ataupun persyaratan khusus dlm memasukinya. Misalnya ijazah, tinggi bdn dsb.', 'Pekerjaan '),
(1, 1, 1, '2000-11-11 16:00:00', 'suatu bidang dari pekerjaan kita', 'Pekerjaan '),
(1, 1, 1, '2000-11-11 17:00:00', 'Suatu perkembangan pada pekerjaan yang kita jalani dan kita miliki', 'Pencapaian Pekerjaan'),
(1, 1, 1, '2000-11-11 18:00:00', 'kegiatan produktif yang dilakukan individu demi kemajuan finansial dalam hidupnya', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 19:00:00', 'Cara saya mengaktualisasikan diri dan potensi yang saya miliki dan cara saya memberikan manfaat kepada masyarakat banyak', 'Aktualisasi diri'),
(1, 1, 1, '2000-11-11 20:00:00', 'Karir adalah salah satu dari sekian banyak cara aktualisasi diri.', 'Aktualisasi diri'),
(1, 1, 1, '2000-11-11 21:00:00', 'karir adalah suatu bidang yang membutuhkan keahlian  profesi tertentu.', 'Keahlian'),
(1, 1, 1, '2000-11-11 22:00:00', 'Karir adalah suatu pekerjaan yg kita lakukan d sebagian besar waktu kehidupan kita.', 'Pekerjaan'),
(1, 1, 1, '2000-11-11 23:00:00', 'Karir adalah suatu pekerjaan yg kita lakukan d sebagian besar waktu kehidupan kita.', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 00:00:00', 'Profesi.', 'Profesi'),
(1, 1, 1, '2000-11-12 01:00:00', 'Karir adalah jenjang dr sebuah pekerjaan', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 02:00:00', 'Jalan Yg dijalani sesuai dengan minat, dorongan, dan latar belakang penitipan.', 'Minat'),
(1, 1, 1, '2000-11-12 03:00:00', 'Sarana/jalan untuk mengembangkan pekerjaan dan keterampilan', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 04:00:00', 'Karir adalah jenjang dalam suatu pekerjaan, maksudnya yaitu perkembangan dan kemajuan yang bersifat baik pada seseorang dalam pekerjaannya.', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 05:00:00', 'Dimana seseorang menyalurkan kemampuan yg ia miliki untuk kepentingan atau kebutuhan orang lain dan mendapatkan reward atasnya', 'Kompetensi '),
(1, 1, 1, '2000-11-12 06:00:00', 'Karir adalah sesuatu yang harus dimiliki oleh setiap orang baik laki-laki maupun perempuan, entah itu karir yang baik atau pun yang buruk. tetapi sebagai manusia tentunya harus berusaha semaksimal mungkin untuk memiliki karir yang baik', 'Bagian penting dalam hidup'),
(1, 1, 1, '2000-11-12 07:00:00', 'Karir adalah dimana suatu tingkat/nilai prestasi dari pekerjaan kita', 'Pencapaian Pekerjaan'),
(1, 1, 1, '2000-11-12 08:00:00', 'Karir adalah jenjang perjalanan pekerjaan meliputi jabatan, skill, pengetahuan akan pekerjaan yang telah ataupun yang sedang digeluti', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 09:00:00', 'Karir adalah pekerjaan yang ditempuh sesuai dengan jenjang pendidikan yang dipilih', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 10:00:00', 'Karir adalah jenis kegiatan yang dilakukan untuk dapat menopang kehidupan sekaligus mendayagunakan potensi diri', 'Aktualisasi diri '),
(1, 1, 1, '2000-11-12 11:00:00', 'Pekerjaan yg memiliki jenjang peningkatan dalam waktu yg jelaa', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 12:00:00', 'Perkembangan dalam sebuah pekerjaan', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 13:00:00', 'Segala apapun jenis bidang profesi yang ditekuni dengan tujuan untuk menjadikan diri lebih baik juga mendapatkan penghasilan. Dan biasanya ada kenikmatan tersendiri disaat karir itu menjadi lebih baik atau naik tingkatannya.', 'Penunjang Kehidupan'),
(1, 1, 1, '2000-11-12 14:00:00', 'Segala apapun jenis bidang profesi yang ditekuni dengan tujuan untuk menjadikan diri lebih baik juga mendapatkan penghasilan. Dan biasanya ada kenikmatan tersendiri disaat karir itu menjadi lebih baik atau naik tingkatannya.', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 15:00:00', 'pekerjaan utama yang benar-benar ditekuni dan dalam jangka waktu panjang', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 16:00:00', 'Karir adalah jenjang yang bisa dikejar melalui beberapa tahapan dan juga semangat dan niat', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-12 17:00:00', 'Pekerjaan', 'Pekerjaan '),
(1, 1, 1, '2000-11-12 18:00:00', 'Karir ialah suatu capaian pribadi seseorang terhadap apa yg dia dia lakukan dalam suatu target, itu bisa terkait dengan pekerjaaan maupun capaian yang lain lainnya yang mana itu membanggakan dirinya sendiri.', 'Pencapaian Pekerjaan '),
(1, 1, 1, '2000-11-12 19:00:00', 'Pencapaian prestasi dalam bentuk kerja nyata yang saya minati bidangnya bisa berupa jabatan strategis atau income yg besar', 'Pencapaian Pekerjaan'),
(1, 1, 1, '2000-11-12 20:00:00', 'Sesuatu hal yang ditekuni dalam pekerjaan seseorang', 'Pekerjaan'),
(1, 1, 1, '2000-11-12 21:00:00', 'Sebuah perjalanan yang dialami oleh seseorang dalam menggapai impian dan berkarya sesuai dengan passion yang di milikinya', 'Passion '),
(1, 1, 1, '2000-11-12 22:00:00', 'bidang pekerjaan atau profesi yang dipilih seseorang dengan tingkatan tertentu.', 'Pekerjaan  '),
(1, 1, 1, '2000-11-12 23:00:00', 'Kesibukan dalam dunia kerja yang kita nyaman berada di dalamnya walaupun dalam kondisi tertekan sekalipun.', 'Pekerjaan '),
(1, 1, 1, '2000-11-13 00:00:00', 'Sesuatu yg perlu diraih dan diperjuangkan krna saat ini adalah masa dimana perempuan tidak hanya berpangku pada suami ttp hrus lebih mandiri menghasilkan sesuatu yg mampu menyokong kehidupannya', 'Penunjang Kehidupan'),
(1, 1, 1, '2000-11-13 01:00:00', 'bentuk apresiasi terhadap peningkatan kinerja seseorang', 'Apresiasi Kerja'),
(1, 1, 1, '2000-11-13 02:00:00', 'Pekerjaan yang sedang ditekuni sehingga mendapatkan hasil dan penilaian kepuasan dari diri sendiri maupun orang lain, sehingga dalam kegiatan formal sering dijadikan suatu cara untuk dapat menaikan kepercayaan diri maupun dari orang lain untuk menjadi lebih baik dari sebelumnya baik secara kualitas maupun kuantitas.', 'Pekerjaan '),
(1, 1, 1, '2000-11-13 03:00:00', 'Pekerjaan yang dilakukan seseorang untuk memenuhi kebutuhan', 'Pekerjaan '),
(1, 1, 1, '2000-11-13 04:00:00', 'sesuatu yang dilakukan karena didasari minat', 'Implementasi Minat'),
(1, 1, 1, '2000-11-13 05:00:00', 'Jenjang2 / tingkatan posisi dalam pekerjaan, dimana semakin tinggi posisi kita semakin besar juga kita bakal dibayar. makanya ada orang yg bilang jenjang karir di perusahaan ini or itu bagus', 'Jenjang Pekerjaan'),
(1, 1, 1, '2000-11-13 06:00:00', 'karir adalah suatu jenjang atau tingkatan dalam dunia pekerjaan.', 'Pekerjaan'),
(1, 1, 1, '2000-11-13 08:00:00', 'Pekerjaan seseorang yang bertahap maju untuk pekerjaannya', 'Pekerjaan'),
(1, 1, 1, '2000-11-13 09:00:00', 'Karir itu, kemajuan dalam pekerjaan seseorang atau bisa juga menjadi jenjang atau acuan untuk suatu pekerjaan seseorang ke depan nya .', 'Jenjang Pekerjaan '),
(1, 1, 1, '2000-11-13 10:00:00', 'perkembangan dan kemajuan dalam pekerjaan seseorang.', 'Kemajuan Pekerjaan'),
(1, 1, 1, '2000-11-13 11:00:00', 'karir adalah suatu hal yg dijalani mulai kita menginjak anak anak sampai masa tua', 'Proses Kehidupan'),
(1, 1, 1, '2000-11-13 12:00:00', 'Karir adalah suatu jenjang usaha yang kita geluti baik itu membawa hal baik (keuntungan) atau bahkan sebaliknya. Karir sendiri bisa kita tekuni sesuai apa yang kita inginkan dan apa yang bisa kita kerjakan. Contoh wirausahawan atau artis', 'Pekerjaan '),
(1, 1, 1, '2000-11-13 13:00:00', 'Tingkat jabatan yang dijalani..agar mendapat tahta atau semacamnya..', 'Jenjang Jabatan'),
(1, 1, 1, '2000-11-13 14:00:00', 'kerjaan', 'Pekerjaan'),
(1, 1, 1, '2000-11-13 15:00:00', 'Pencapaian dari suatu pekerjaan', 'Pencapaian Pekerjaan '),
(1, 1, 1, '2000-11-13 16:00:00', 'Kegiatan yang menjadi identitas kita di masyarakat.', 'Jati diri ');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `Category_text` varchar(20) NOT NULL,
  `Subcategory_text` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`Category_text`, `Subcategory_text`) VALUES
('Akhir Pendidikan', 'Akhir Kuliah'),
('Pendidikan Tinggi', 'Akhir kuliah'),
('Akhir Pendidikan', 'Akhir SMA'),
('Pendidikan Tinggi', 'Akhir SMA'),
('Akhir Pendidikan', 'Akhir SMP'),
('Aktivitas', 'Aktifitas Serius'),
('Aktivitas', 'Aktivitas'),
('Aktivitas', 'Aktivitas Berkesinambungan'),
('Aktualisasi diri', 'Aktivitas Bermanfaat'),
('Penghasilan', 'Aktivitas Ekonomi'),
('Penghasilan', 'Aktivitas Ekonomi Rutin'),
('Tujuan Ekonomi', 'Aktivitas finansial'),
('Karir', 'Aktivitas Karir'),
('Kehidupan', 'Aktivitas kehidupan'),
('Masa depan', 'Aktivitas masa depan'),
('Aktivitas', 'Aktivitas Menyenangkan'),
('Kesenangan', 'Aktivitas menyenangkan'),
('Aktivitas', 'Aktivitas Rutin'),
('Rutinitas', 'Aktivitas sehari-hari'),
('Pengembangan diri', 'Aktivitas sesuai minat'),
('Aktualisasi diri', 'Aktualisasi diri'),
('Penghasilan', 'aktvitas Menghasilkan'),
('Tujuan', 'Ambisi diri'),
('Puncak kerja', 'Apresiasi kerja'),
('Karir', 'Awal Karir'),
('Awal Pendidikan', 'awal kuliah'),
('Pendidikan Tinggi', 'Awal kuliah'),
('Pendidikan Menengah', 'Awal penjurusan SMA'),
('Awal Pendidikan', 'awal sekolah'),
('Awal Pendidikan', 'awal SMA'),
('Pendidikan Menengah', 'Awal SMA'),
('Karir', 'Bagian Karir'),
('Kehidupan', 'Bagian penting dalam hidup'),
('Kehidupan', 'Bagian penting kehidupan'),
('Tuntutan', 'Beban'),
('Karir', 'Bidang Karir'),
('Kebutuhan Hidup', 'Cara Survival'),
('Dewasa', 'Dewasa Awal'),
('Internal', 'Diri Sendiri'),
('Aktualisasi diri', 'Ekspresi diri'),
('Awal Kerja', 'Entry-Level'),
('Pendidikan Tinggi', 'Entry-Level'),
('Guru', 'Guru'),
('Rutinitas', 'Hal biasa'),
('Kehidupan', 'Hal sulit'),
('Aktivitas', 'Hal Tak Mudah'),
('Kesenangan', 'Hobi'),
('Value', 'Ibadah '),
('Tujuan', 'Impian'),
('Jabatan', 'Jabatan'),
('Kehidupan', 'Jalan hidup'),
('Kesuksesan', 'Jalan kesuksesan'),
('Tujuan/Goal', 'Jalan Kesuksesan'),
('Aktualisasi diri', 'Jati diri'),
('Jabatan', 'Jenis/Nama Jabatan'),
('Pekerjaan', 'Jenjang jabatan'),
('Pekerjaan', 'Jenjang pekerjaan'),
('Pengembangan diri', 'Keahlian'),
('Penghasilan', 'Keahlian Menghasilkan'),
('Kebutuhan Hidup', 'Keberlangsungan Hidup'),
('Tujuan', 'Kebutuhan keluarga'),
('Kebutuhan Hidup', 'Kebutuhan setiap orang'),
('Aktivitas', 'Kegiatan Produktif'),
('Aktivitas', 'Kegiatan Spesifik'),
('Keluarga', 'Keluarga'),
('Pekerjaan', 'Kemajuan pekerjaan'),
('Kesuksesan', 'Kemapanan bekerja'),
('Kesenangan', 'Kepuasan kerja'),
('Kerabat', 'Kerabat '),
('Orang yang Berpengal', 'kerabat berpengalaman'),
('Kerabat', 'Kerabat Pasangan'),
('Pekerjaan', 'Kerja'),
('Kesenangan', 'Kesenangan'),
('Kesuksesan', 'Kesuksesan'),
('Kehidupan', 'Kesuksesan hidup'),
('Puncak kerja', 'Kesuksesan pekerjaan'),
('Waktu', 'Ketika di toilet, ingin tidur'),
('Waktu', 'ketika mulai mengenal orang lain'),
('Tuntutan', 'Kewajiban'),
('Mengandung Value', 'Komitmen'),
('Kompetensi', 'Kompetensi'),
('Pengembangan Diri', 'Kompetensi'),
('Karir', 'Komponen Karir'),
('Pendidikan Tinggi', 'Kuliah'),
('Proses Pendidikan', 'kuliah'),
('Akhir Pendidikan', 'Kuliah Akhir'),
('Pendidikan Tinggi', 'Kuliah akhir'),
('Akhir Pendidikan', 'Kuliah Tingkat Akhir'),
('Tuntutan', 'Kumpulan Tugas'),
('Aktivitas', 'Label'),
('Awal Kerja', 'Level Fresh Graduate'),
('Pendidikan Tinggi', 'Level fresh graduate'),
('Pengembangan diri', 'Level skill'),
('Teman', 'Lingkungan Pertemanan'),
('Teman', 'Lingkungan Pertemanan, keluarga'),
('Kerabat', 'Lingkungan Terdekat'),
('Akhir Pendidikan', 'Lulus kuliah'),
('Akhir Pendidikan', 'Lulus pendidikan'),
('Akhir Pendidikan', 'Lulus pendidikan profesi'),
('Usia Perkembangan', 'Lulus SD'),
('Akhir Pendidikan', 'Lulus sekolah'),
('Akhir Pendidikan', 'Lulus SMA'),
('Pendidikan Tinggi', 'Lulus SMA'),
('Akhir Pendidikan', 'Lulus SMP'),
('Pendidikan Menengah', 'Lulus SMP'),
('Waktu', 'malam hari'),
('Masa depan', 'Masa depan'),
('Penghasilan', 'Mata Pencaharian'),
('Awal Karir', 'Memulai pekerjaan'),
('Penghasilan', 'Menghasilkan Sesuatu'),
('Tujuan/Goal', 'Menghasilkan Seusatu'),
('Awal Pendidikan', 'menjelang'),
('Awal Berkeluarga', 'menjelang berkeluarga'),
('Awal Karir', 'Menjelang kerja'),
('Pendidikan Tinggi', 'Menjelang kuliah'),
('Aktualisasi diri', 'Menunjukkan Kemandirian'),
('Tujuan', 'Meraih kesempatan'),
('Awal Kerja', 'Mid- Level kerja'),
('Pengembangan diri', 'Minat'),
('Waktu', 'Mulai dari sekarang'),
('Awal Kerja', 'Mulai Pekerjaan'),
('Orang yang Berpengal', 'Orang Berpengalaman'),
('Kerabat', 'Orang Terdekat'),
('Keluarga', 'Orang Tua'),
('Orang yang Berpengal', 'Orang yang sukses berkarir'),
('Waktu', 'Pada malam hari'),
('Waktu', 'Pada saat bangun pagi'),
('situasional', 'pada saat saya nyaman'),
('Waktu', 'pagi hari'),
('Kesuksesan', 'Parameter kesuksesan'),
('Pasangan', 'Pasangan'),
('Mengandung Value', 'Passion'),
('Value', 'Passion'),
('Pekerjaan', 'Pekerjaan'),
('Pekerjaan', 'Pembelajaran kerja'),
('Kebutuhan Hidup', 'Pemenuhan Kebutuhan '),
('Kebutuhan Hidup', 'Pemenuhan Kebutuhan Hidup'),
('Tujuan', 'Pencapaian cita cita'),
('Puncak kerja', 'Pencapaian diri'),
('Kehidupan', 'Pencapaian hidup'),
('Puncak kerja', 'Pencapaian pekerjaan'),
('Tujuan/Goal', 'Pencapaian Target'),
('Kesuksesan', 'Pencapaian tertinggi pekerjaan'),
('Tujuan/Goal', 'Pencapaian Tujuan'),
('Tujuan/Goal', 'Pencapaian Tujuan Tertentu'),
('Kehidupan', 'Penentu hidup'),
('Value', 'Pengabdian Keluarga'),
('Pengembangan Diri', 'Pengalaman '),
('Pengalaman Kerja', 'Pengalaman kerja'),
('Pengembangan diri', 'Pengembangan diri'),
('Pengembangan diri', 'Pengembangan minat'),
('Pengembangan diri', 'Pengembangan potensi'),
('Pengembangan diri', 'Pengembangan skill'),
('Kehidupan', 'Peningkatan diri dalam kehidupan'),
('Kompetensi', 'Peningkatan kompetensi'),
('Pengembangan diri', 'Peningkatan target'),
('Pendidikan Menengah', 'Penjurusan SMA'),
('Karir', 'Penunjang Karir'),
('Kehidupan', 'Penunjang kehidupan'),
('Kehidupan', 'Perjalanan hidup'),
('Pekerjaan', 'Perjalanan pekerjaan'),
('Pengembangan diri', 'Perkembangan diri'),
('Pekerjaan', 'Perkembangan pekerjaan'),
('Pengembangan diri', 'Perkembangan Profesi'),
('Kehidupan', 'Pilihan'),
('Aktualisasi diri', 'Pilihan Aktivitas'),
('Kehidupan', 'Pilihan hidup'),
('Internal', 'Potensi'),
('Aktivitas', 'Predikat'),
('Puncak kerja', 'Prestasi'),
('Aktivitas', 'Produktif'),
('Aktivitas', 'Produktivitas'),
('Pekerjaan', 'Profesi'),
('Kompetensi', 'Profesionalisme'),
('Value', 'Profesionalisme'),
('Value', 'Profesionalitas'),
('Kehidupan', 'Proses kehidupan'),
('Kehidupan', 'Proses perubahan nilai'),
('Internal', 'Rasa Senang'),
('Teman', 'Rekan Kerja'),
('Remaja', 'remaja'),
('Usia Perkembangan', 'Remaja'),
('Waktu', 'Saat ini'),
('Waktu', 'Saat ini dan seterusnya'),
('Pendidikan Tinggi', 'Saat kuliah'),
('Proses Pendidikan', 'saat kuliah'),
('Pendidikan Menengah', 'Saat penjurusan SMA'),
('Uncategorized', 'Saat pindah kerja'),
('Akhir Pendidikan', 'Saat proses mengakhiri pendidikan'),
('Usia Perkembangan', 'Saat remaja'),
('Proses Pendidikan', 'saat sekolah'),
('Uncategorized', 'Saat sekolah'),
('situasional', 'saat sudah menguntungkan'),
('Aktualisasi diri', 'Sarana Aktualisasi Diri'),
('Aktualisasi diri', 'Sarana Berkarir'),
('Aktualisasi diri', 'Sarana Berkarya'),
('Kebutuhan Hidup', 'Sarana Bertahan Hidup'),
('Aktualisasi diri', 'Sarana Implementasi Keahlian'),
('Kebutuhan Hidup', 'Sarana Mencapai Hidup Layak'),
('Pengembangan Diri', 'Sarana Menimba Ilmu'),
('Kebutuhan Hidup', 'Sarana Meningkatkan Taraf Hidup'),
('Aktualisasi diri', 'Sarana Meraih Karir'),
('Pengembangan Diri', 'Sarana Pengembangan Diri'),
('Aktualisasi diri', 'Sarana Pengembangan Karir'),
('Kebutuhan Hidup', 'Sarana Survival'),
('Aktualisasi diri', 'Sarana Unjuk Kompetensi'),
('Kesenangan', 'Satu Kesenangan'),
('Keluarga', 'Saudara'),
('Jenjang Pendidikan', 'SD'),
('Uncategorized', 'SD'),
('situasional', 'sebelum menikah'),
('Uncategorized', 'Sebelum menikah'),
('Waktu', 'Secepatnya'),
('Waktu', 'Sedini mungkin'),
('Waktu', 'Sejak kecil'),
('Uncategorized', 'Sejak manusia bisa berpikir'),
('Aktualisasi Diri', 'Sejalan citra diri'),
('Waktu', 'Sejalan hobi'),
('Aktualisasi diri', 'sejalan keinginan '),
('Aktualisasi Diri', 'Sejalan keinginan sukses'),
('Aktualisasi diri', 'sejalan kemampuan'),
('Aktualisasi Diri', 'Sejalan kemampuan diri'),
('Pengembangan Diri', 'Sejalan Kemandirian'),
('Kesempatan', 'sejalan kesempatan'),
('Uncategorized', 'Sejalan kesempatan'),
('Aktualisasi Diri', 'Sejalan kesiapan diri'),
('Pengembangan Diri', 'Sejalan Kesiapan Diri'),
('Kebutuhan', 'sejalan kondisi finansial'),
('Uncategorized', 'Sejalan kondisi finansial'),
('Tujuan', 'sejalan kontribusi kerja'),
('Aktualisasi Diri', 'Sejalan minat'),
('Aktualisasi Diri', 'Sejalan passion'),
('Kesempatan', 'sejalan peluang '),
('Kesempatan', 'sejalan peluang karir'),
('Uncategorized', 'Sejalan pemahaman diri'),
('Aktualisasi Diri', 'Sejalan pemahaman karir'),
('Pengembangan Diri', 'Sejalan Pemahaman Karir'),
('Kebutuhan', 'sejalan pemenuhan kebutuhan '),
('Pengalaman Kerja', 'Sejalan pengalaman kerja'),
('Pengembangan Diri', 'Sejalan Pengalaman Kerja'),
('Pengembangan Diri', 'Sejalan Perkembangan Bakat'),
('Pengembangan Diri', 'Sejalan Perkembangan Diri'),
('Waktu', 'Sejalan perkembangan diri'),
('Aktualisasi Diri', 'Sejalan potensi diri'),
('Uncategorized', 'Sejalan tanggungjawab'),
('Aktualisasi Diri', 'Sejalan target'),
('Tujuan', 'sejalan target'),
('Senior', 'Senior'),
('Uncategorized', 'Setelah berkeluarga'),
('Akhir Pendidikan', 'Setelah lulus SMA'),
('Uncategorized', 'Setelah memutuskan akan mengambil jalur'),
('Awal Berkeluarga', 'setelah menikah'),
('situasional', 'situasional'),
('Waktu', 'Situasional'),
('Jenjang Pendidikan', 'SMA'),
('Pendidikan Menengah', 'SMA'),
('Akhir Pendidikan', 'SMA Akhir'),
('Pendidikan Tinggi', 'SMA Akhir'),
('Jenjang Pendidikan', 'SMP'),
('Pendidikan Menengah', 'SMP'),
('Pendidikan Menengah', 'SMP Akhir'),
('Penghasilan', 'Sumber Nafkah'),
('Penghasilan', 'Sumber Pendapatan'),
('Penghasilan', 'Sumber Penghasilan'),
('Tujuan Ekonomi', 'Sumber penghasilan'),
('Penghasilan', 'Sumber Riset'),
('Tujuan/Goal', 'Tahap perkembangan hidup'),
('Kesuksesan', 'Tangga kesuksesan'),
('Value', 'Tanggung jawab'),
('Mengandung Value', 'Tanggungjawab'),
('Tujuan', 'Target diri'),
('Teman', 'Teman'),
('Tidak Ada', 'Tidak Ada'),
('Tujuan Ekonomi', 'Transaksi imbal jasa'),
('Tuntutan', 'Tugas'),
('Spiritual', 'Tuhan'),
('Kehidupan', 'Tujuan hidup'),
('Tuntutan', 'Tuntutan'),
('Penghasilan', 'uang'),
('Penghasilan', 'Uang Rutinitas'),
('Penghasilan', 'Uang, Menghasilkan Sesuatu'),
('Aktivitas', 'Usaha'),
('Pengembangan diri', 'Usaha diri'),
('Usia Produktif', 'usia '),
('Usia Perkembangan', 'Usia 20-an'),
('Dewasa', 'Usia 20an'),
('Dewasa', 'Usia 25an'),
('Dewasa', 'Usia 30an'),
('Usia Lanjut', 'Usia 50an'),
('Dewasa', 'Usia Dewasa'),
('Usia Perkembangan', 'Usia dewasa'),
('Usia Lanjut', 'Usia Lanjut'),
('Usia Perkembangan', 'Usia muda'),
('Usia Perkembangan', 'Usia produktif'),
('Usia Produktif', 'Usia produktif'),
('Aktualisasi diri', 'Wadah'),
('Proses Pendidikan', 'waktu kuliah');

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `User_ID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Quiz_ID` int(3) NOT NULL,
  `Result_ID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`User_ID`, `Timestamp`, `Quiz_ID`, `Result_ID`) VALUES
(1, '2015-04-09 16:33:36', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
`Question_ID` int(6) NOT NULL,
  `Question_text` varchar(100) NOT NULL,
  `Weight` int(11) DEFAULT NULL,
  `Category_text` varchar(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `question`
--

INSERT INTO `question` (`Question_ID`, `Question_text`, `Weight`, `Category_text`) VALUES
(1, 'Menurut saya, karir adalah', NULL, 'Kehidupan'),
(2, 'Menurut saya , pekerjaan adalah…			\r\n', NULL, 'penghasilan'),
(3, 'Menurut saya, waktu yang paling tepat untuk mulai memikirkan karir adalah						', NULL, 'Aktualisasi Diri'),
(4, ' ', NULL, 'Akhir Pendidikan'),
(5, 'Orang-orang yang saya mintai pendapat/masukan sebelum saya memutuskan pilihan karir saya adalah					', NULL, 'Teman');

-- --------------------------------------------------------

--
-- Table structure for table `quiz`
--

CREATE TABLE IF NOT EXISTS `quiz` (
`Quiz_ID` int(3) NOT NULL,
  `Title` varchar(50) NOT NULL,
  `Description` text NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz`
--

INSERT INTO `quiz` (`Quiz_ID`, `Title`, `Description`) VALUES
(1, 'Kuesioner Kesiapan Karir', 'Lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Table structure for table `quiz_content`
--

CREATE TABLE IF NOT EXISTS `quiz_content` (
  `Quiz_ID` int(3) NOT NULL,
  `Question_ID` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_content`
--

INSERT INTO `quiz_content` (`Quiz_ID`, `Question_ID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Table structure for table `quiz_result`
--

CREATE TABLE IF NOT EXISTS `quiz_result` (
  `Result_ID` int(5) NOT NULL,
  `Quiz_ID` int(3) NOT NULL,
  `Classification_result` varchar(20) NOT NULL,
  `Result_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `quiz_result`
--

INSERT INTO `quiz_result` (`Result_ID`, `Quiz_ID`, `Classification_result`, `Result_text`) VALUES
(1, 1, 'Sukses', 'Selamat! Anda merupakan pengunjung yang pertama');

-- --------------------------------------------------------

--
-- Table structure for table `sub_category`
--

CREATE TABLE IF NOT EXISTS `sub_category` (
  `Subcategory_text` varchar(50) NOT NULL,
  `Counter` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sub_category`
--

INSERT INTO `sub_category` (`Subcategory_text`, `Counter`) VALUES
('Akhir kuliah', 2),
('Akhir SMA', 2),
('Akhir SMP', 1),
('Aktifitas Serius', 2),
('Aktivitas', 14),
('Aktivitas Berkesinambungan', 2),
('Aktivitas Bermanfaat', 1),
('Aktivitas Ekonomi', 68),
('Aktivitas Ekonomi Rutin', 1),
('Aktivitas finansial', 1),
('Aktivitas Karir', 1),
('Aktivitas kehidupan', 1),
('Aktivitas masa depan', 1),
('Aktivitas menyenangkan', 1),
('Aktivitas Rutin', 37),
('Aktivitas sehari-hari', 1),
('Aktivitas sesuai minat', 1),
('Aktualisasi diri', 12),
('aktvitas Menghasilkan', 6),
('Ambisi diri', 1),
('anak saya, suami, dan oarang tua', 2),
('apakah karir tersebut dapat memberikan', 1),
('Apresiasi kerja', 1),
('Awal Karir', 1),
('Awal kuliah', 21),
('Awal penjurusan SMA', 1),
('awal sekolah', 1),
('Awal SMA', 2),
('Bagian Karir', 1),
('Bagian penting dalam hidup', 1),
('Bagian penting kehidupan', 4),
('bakat', 15),
('bakat nyaman lingkungan', 1),
('Beban', 1),
('Bermanfaat bagi orang lain', 3),
('berpengalaman', 1),
('Bidang Karir', 1),
('bidang pekerjaan', 1),
('Cara Survival', 1),
('cita-cita', 2),
('cita-cita saya', 2),
('dana', 1),
('Dewasa Awal', 1),
('Diri Sendiri', 1),
('dosen', 1),
('dukungan keluarga', 1),
('dukungan sosial', 2),
('ekonomi keluarga', 1),
('Ekspresi diri', 1),
('Entry-Level', 7),
('faktor inchi faktor bakat', 1),
('faktor kelebihan dalam bidang apa', 1),
('faktor kesehatan', 1),
('faktor keyakinan', 1),
('faktor lingkungan dan apa yang dibutuhkan', 1),
('faktor pekerjaan', 5),
('faktor sosial', 1),
('fasilitas', 1),
('finansial', 1),
('gaji', 1),
('gaji fasilitas', 1),
('gender', 2),
('Guru', 45),
('Hal biasa', 1),
('Hal sulit', 1),
('Hal Tak Mudah', 1),
('harapan keluarga', 1),
('harapan tantangan', 2),
('Hobi', 1),
('hoi bakat', 1),
('Ibadah ', 1),
('ibadan ', 1),
('idealisme', 1),
('Impian', 1),
('impian tujuan hidup saya', 1),
('Implementasi Minat', 2),
('informasi', 1),
('Jabatan ', 1),
('Jalan hidup', 16),
('Jalan kesuksesan', 1),
('Jati diri', 15),
('jenis karir lokasi prospek', 1),
('jenis pekerjaan', 7),
('Jenis/Nama Jabatan', 2),
('Jenjang jabatan', 6),
('jenjang karir', 5),
('Jenjang pekerjaan', 79),
('jenjang pendidikan, prestasi,  skill', 1),
('jurusan kuliah', 1),
('karir', 5),
('keahlian', 9),
('keahlian dalam bidang tertentu', 1),
('Keahlian Menghasilkan', 1),
('Keberlangsungan Hidup', 1),
('kebutuhan', 1),
('Kebutuhan keluarga', 1),
('Kebutuhan setiap orang', 1),
('Kegiatan Produktif', 1),
('Kegiatan Spesifik', 2),
('keinginan', 4),
('keinginan diri dari masa depan', 1),
('kelebihan dan kekurangannya faktor', 1),
('Keluarga', 205),
('keluarga, pacar, teman', 2),
('Kemajuan pekerjaan', 4),
('kemampuan', 19),
('kemampuan, kelebihan dan kekurangan', 1),
('Kemapanan bekerja', 1),
('kenikamatan dalam pekerjaan', 1),
('kenyamanan', 5),
('kepuasan', 1),
('Kepuasan kerja', 1),
('Kerabat ', 31),
('kerabat berpengalaman', 22),
('Kerabat Pasangan', 1),
('Kerja', 2),
('kesempatan', 15),
('kesempatan berkembang', 2),
('Kesenangan', 1),
('kesesuaian dengan kemampuan', 1),
('kesesuaian karir', 1),
('kesukaan kemampuan', 1),
('kesukaan, keseharian, potensi', 1),
('Kesuksesan', 3),
('Kesuksesan hidup', 1),
('Kesuksesan pekerjaan', 1),
('ketertarikan', 1),
('ketertarikan dan pemahaman', 2),
('Ketika di toilet, ingin tidur', 1),
('ketika mulai mengenal orang lain', 1),
('keuangan, jalan hidup', 1),
('keuntungan', 2),
('Kewajiban', 13),
('Komitmen', 1),
('Kompetensi', 2),
('Komponen Karir', 1),
('kondisi', 1),
('kondisi finansial', 2),
('kondisi fisik', 3),
('kondisi pekerjaan', 1),
('Kuliah', 3),
('Kuliah akhir', 4),
('Kuliah Tingkat Akhir', 6),
('Kumpulan Tugas', 2),
('Label', 2),
('Level fresh graduate', 7),
('Level skill', 1),
('lingkungan ', 6),
('lingkungan kerja', 11),
('Lingkungan Pertemanan', 96),
('Lingkungan Pertemanan, keluarga', 1),
('Lingkungan Terdekat', 2),
('lingkungan, pendidikan, kesehatan', 1),
('lingkungan, pergaulan, orang tua', 1),
('lowongan pekerjaan', 1),
('Lulus kuliah', 19),
('Lulus pendidikan', 5),
('Lulus pendidikan profesi', 1),
('Lulus SD', 1),
('Lulus sekolah', 1),
('Lulus SMA', 17),
('Lulus SMP', 2),
('malam hari', 2),
('manfaat sosial', 2),
('Masa depan', 22),
('Mata Pencaharian', 3),
('Memulai pekerjaan', 7),
('mengabdi di masyarakat dukungan', 1),
('Menghasilkan Sesuatu', 1),
('Menghasilkan Seusatu', 17),
('mengubah kehidupan jadi lebih baik', 3),
('menjelang', 3),
('menjelang berkeluarga', 1),
('Menjelang kerja', 1),
('Menjelang kuliah', 2),
('Menunjukkan Kemandirian', 2),
('Meraih kesempatan', 1),
('Mid- Level kerja', 3),
('Minat', 1),
('minat jika sudah menikah', 1),
('minat, bakat, dan/atau hobi', 1),
('Mulai dari sekarang', 1),
('Mulai Pekerjaan', 4),
('nasib ', 1),
('nilai keyakinan', 1),
('nilai sosial', 1),
('orang', 1),
('Orang Berpengalaman', 6),
('Orang Terdekat', 1),
('Orang Tua', 1),
('orang tua dan lingkungan', 1),
('Orang yang sukses berkarir', 2),
('Pada malam hari', 1),
('Pada saat bangun pagi', 2),
('pada saat saya nyaman', 1),
('pagi hari', 1),
('pandangan orang lain', 1),
('pandangan sosial', 1),
('Parameter kesuksesan', 1),
('Pasangan', 18),
('Passion', 12),
('passion and salary', 1),
('passion, lingkungan, pemerintahan, ilmu', 1),
('Pekerjaan', 89),
('pekerjaan yang gampang', 1),
('Pembelajaran kerja', 1),
('Pemenuhan Kebutuhan ', 41),
('Pemenuhan Kebutuhan Hidup', 1),
('Pencapaian cita cita', 2),
('Pencapaian diri', 4),
('Pencapaian hidup', 1),
('Pencapaian pekerjaan', 29),
('Pencapaian Target', 1),
('Pencapaian tertinggi pekerjaan', 1),
('Pencapaian Tujuan', 1),
('Pencapaian Tujuan Tertentu', 17),
('pendapatan', 44),
('pendapatan kelak', 1),
('pendidikan', 15),
('Penentu hidup', 2),
('Pengabdian Keluarga', 1),
('Pengalaman ', 3),
('Pengalaman kerja', 1),
('Pengembangan diri', 3),
('Pengembangan minat', 1),
('Pengembangan potensi', 1),
('Pengembangan skill', 5),
('penghasilan karir tersebut', 1),
('Peningkatan diri dalam kehidupan', 1),
('Peningkatan kompetensi', 1),
('Peningkatan target', 1),
('Penjurusan SMA', 2),
('Penunjang Karir', 1),
('Penunjang kehidupan', 22),
('Perjalanan hidup', 2),
('Perjalanan pekerjaan', 1),
('Perkembangan diri', 1),
('Perkembangan pekerjaan', 1),
('Perkembangan Profesi', 0),
('Pilihan', 2),
('Pilihan Aktivitas', 1),
('Pilihan hidup', 3),
('pilihan karir ', 1),
('pola kerja', 4),
('Potensi', 1),
('potensi masa depan', 2),
('potensi pengembangan diri', 1),
('Predikat', 1),
('Prestasi', 3),
('prestige', 3),
('Produktif', 4),
('Produktivitas', 1),
('Profesi', 8),
('Profesionalisme', 1),
('Profesionalitas', 1),
('Proses kehidupan', 4),
('Proses perubahan nilai', 1),
('Rasa Senang', 1),
('referensi keluarga', 1),
('Rekan Kerja', 1),
('relasi', 1),
('Remaja', 3),
('reward', 1),
('risiko', 1),
('Saat ini', 1),
('Saat ini dan seterusnya', 3),
('Saat kuliah', 23),
('Saat penjurusan SMA', 1),
('Saat pindah kerja', 1),
('Saat proses mengakhiri pendidikan', 2),
('Saat remaja', 1),
('Saat sekolah', 8),
('saat sudah menguntungkan', 1),
('sahabat', 1),
('sanggup akan tuntutan pekerjaan', 1),
('Sarana Aktualisasi Diri', 2),
('Sarana Berkarir', 2),
('Sarana Berkarya', 2),
('Sarana Bertahan Hidup', 1),
('Sarana Implementasi Keahlian', 1),
('sarana kerja', 1),
('Sarana Mencapai Hidup Layak', 1),
('Sarana Menimba Ilmu', 1),
('Sarana Meningkatkan Taraf Hidup', 1),
('Sarana Meraih Karir', 1),
('Sarana Pengembangan Diri', 1),
('Sarana Pengembangan Karir', 1),
('Sarana Survival', 1),
('Sarana Unjuk Kompetensi', 1),
('Satu Kesenangan', 1),
('Saudara', 1),
('SD', 5),
('Sebelum menikah', 2),
('Secepatnya', 7),
('Sedini mungkin', 19),
('Sejak kecil', 1),
('Sejak manusia bisa berpikir', 1),
('Sejalan citra diri', 1),
('Sejalan hobi', 1),
('sejalan keinginan ', 1),
('Sejalan keinginan sukses', 1),
('sejalan kemampuan', 8),
('Sejalan kemampuan diri', 3),
('Sejalan Kemandirian', 1),
('Sejalan kesempatan', 1),
('Sejalan kesiapan diri', 2),
('Sejalan kondisi finansial', 1),
('sejalan kontribusi kerja', 1),
('Sejalan minat', 2),
('Sejalan passion', 1),
('sejalan peluang ', 1),
('sejalan peluang karir', 1),
('Sejalan pemahaman diri', 1),
('Sejalan pemahaman karir', 1),
('sejalan pemenuhan kebutuhan ', 1),
('Sejalan pengalaman kerja', 2),
('Sejalan Perkembangan Bakat', 1),
('Sejalan perkembangan diri', 1),
('Sejalan potensi diri', 1),
('Sejalan tanggungjawab', 1),
('Sejalan target', 1),
('semangat', 1),
('senang dengan pekerjaan', 1),
('senang nyaman mengerti', 1),
('Senior', 3),
('sesuai dengan passion', 1),
('sesuai dengan profesi dan minat', 2),
('Setelah berkeluarga', 2),
('Setelah lulus SMA', 24),
('Setelah memutuskan akan mengambil jalur', 1),
('setelah menikah', 2),
('situasi dan kondisi', 1),
('situasi kerja', 2),
('Situasional', 6),
('skill', 5),
('SMA', 54),
('SMA Akhir', 3),
('SMP', 8),
('SMP Akhir', 1),
('sosial', 1),
('Status Sosial', 1),
('suami orang tua anak', 1),
('suasana kerja', 1),
('Sumber Nafkah', 8),
('Sumber Pendapatan', 1),
('Sumber penghasilan', 2),
('Sumber Riset', 3),
('SWOT saat menganalisis diri', 1),
('Tahap perkembangan hidup', 1),
('Tangga kesuksesan', 1),
('Tanggung jawab', 19),
('Tanggungjawab', 1),
('Target diri', 1),
('Teman', 2),
('Tidak Ada', 2),
('tidak sesuai bidang, gaji kecil', 1),
('tingkat kepercayaan dari bidang', 1),
('Transaksi imbal jasa', 0),
('Tugas', 5),
('Tuhan', 2),
('Tujuan hidup', 2),
('Tuntutan', 1),
('uang', 4),
('Uang Rutinitas', 1),
('Uang, Menghasilkan Sesuatu', 1),
('Usaha', 1),
('Usaha diri', 1),
('usia ', 1),
('Usia 20-an', 8),
('Usia 20an', 6),
('Usia 25an', 3),
('Usia 30an', 2),
('Usia 50an', 1),
('Usia dewasa', 2),
('Usia Lanjut', 1),
('Usia muda', 24),
('Usia produktif', 8),
('Wadah', 10),
('waktu kuliah', 23);

-- --------------------------------------------------------

--
-- Table structure for table `testimony`
--

CREATE TABLE IF NOT EXISTS `testimony` (
  `User_ID` int(11) NOT NULL,
  `Timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Testimony_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `testimony`
--

INSERT INTO `testimony` (`User_ID`, `Timestamp`, `Testimony_text`) VALUES
(1, '2015-04-09 16:28:12', 'lorem ipsum dolor sit amet');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
`ID` int(10) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Password_hash` binary(32) NOT NULL,
  `password_reset_token` varchar(32) DEFAULT NULL,
  `auth_key` varchar(32) DEFAULT NULL,
  `Role` char(1) NOT NULL,
  `Email` varchar(30) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Date_of_birth` date NOT NULL,
  `Place_of_birth` varchar(30) NOT NULL,
  `Address` varchar(50) NOT NULL,
  `Gender` char(1) NOT NULL,
  `Phone` varchar(12) NOT NULL,
  `Education` varchar(4) NOT NULL,
  `Occupation` varchar(30) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`ID`, `Username`, `Password_hash`, `password_reset_token`, `auth_key`, `Role`, `Email`, `status`, `created_at`, `updated_at`, `Date_of_birth`, `Place_of_birth`, `Address`, `Gender`, `Phone`, `Education`, `Occupation`) VALUES
(1, 'Admin', 0xde7804989ad9c5f4d39e0ad1c29c1bff00000000000000000000000000000000, NULL, NULL, 'A', 'lorem@ipsum.dolor', 0, '2015-04-09 16:24:18', '2015-04-09 16:25:20', '1993-02-07', 'lorem ipsum', 'lorem ipsum', 'M', '08123456789', 'SD', 'Admin'),
(2, 'anonim', 0xf2b0a1c07ccefc2d6763c8815e8a794600000000000000000000000000000000, NULL, NULL, 'M', 'anonim@anon.im', 0, '2015-04-09 16:24:18', '2015-04-09 16:25:20', '2012-09-09', 'unknown', 'unknown', 'F', '08155555555', 'S3', 'NEET');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_log`
--
ALTER TABLE `activity_log`
 ADD PRIMARY KEY (`User_ID`,`Timestamp`);

--
-- Indexes for table `answer`
--
ALTER TABLE `answer`
 ADD PRIMARY KEY (`User_ID`,`Quiz_ID`,`Question_ID`,`Timestamp`), ADD KEY `Subcategory_text` (`Subcategory_text`), ADD KEY `User_ID` (`User_ID`), ADD KEY `Quiz_ID` (`Quiz_ID`), ADD KEY `Question_ID` (`Question_ID`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
 ADD PRIMARY KEY (`Category_text`,`Subcategory_text`), ADD KEY `Subcategory_text` (`Subcategory_text`);

--
-- Indexes for table `history`
--
ALTER TABLE `history`
 ADD PRIMARY KEY (`User_ID`,`Timestamp`), ADD KEY `Quiz_ID` (`Quiz_ID`,`Result_ID`), ADD KEY `Result_ID` (`Result_ID`);

--
-- Indexes for table `question`
--
ALTER TABLE `question`
 ADD PRIMARY KEY (`Question_ID`), ADD KEY `Category_text` (`Category_text`);

--
-- Indexes for table `quiz`
--
ALTER TABLE `quiz`
 ADD PRIMARY KEY (`Quiz_ID`);

--
-- Indexes for table `quiz_content`
--
ALTER TABLE `quiz_content`
 ADD PRIMARY KEY (`Quiz_ID`,`Question_ID`), ADD KEY `Question_ID` (`Question_ID`);

--
-- Indexes for table `quiz_result`
--
ALTER TABLE `quiz_result`
 ADD PRIMARY KEY (`Result_ID`), ADD KEY `Quiz_ID` (`Quiz_ID`);

--
-- Indexes for table `sub_category`
--
ALTER TABLE `sub_category`
 ADD PRIMARY KEY (`Subcategory_text`);

--
-- Indexes for table `testimony`
--
ALTER TABLE `testimony`
 ADD PRIMARY KEY (`User_ID`,`Timestamp`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
 ADD PRIMARY KEY (`ID`), ADD KEY `User_ID` (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `question`
--
ALTER TABLE `question`
MODIFY `Question_ID` int(6) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `quiz`
--
ALTER TABLE `quiz`
MODIFY `Quiz_ID` int(3) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
MODIFY `ID` int(10) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_log`
--
ALTER TABLE `activity_log`
ADD CONSTRAINT `activity_log_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `answer`
--
ALTER TABLE `answer`
ADD CONSTRAINT `answer_ibfk_4` FOREIGN KEY (`Subcategory_text`) REFERENCES `sub_category` (`Subcategory_text`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_5` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_6` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `answer_ibfk_7` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `category`
--
ALTER TABLE `category`
ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`Subcategory_text`) REFERENCES `sub_category` (`Subcategory_text`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `history_ibfk_3` FOREIGN KEY (`Result_ID`) REFERENCES `quiz_result` (`Result_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `history_ibfk_4` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `question`
--
ALTER TABLE `question`
ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`Category_text`) REFERENCES `category` (`Category_text`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_content`
--
ALTER TABLE `quiz_content`
ADD CONSTRAINT `quiz_content_ibfk_1` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `quiz_content_ibfk_2` FOREIGN KEY (`Question_ID`) REFERENCES `question` (`Question_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `quiz_result`
--
ALTER TABLE `quiz_result`
ADD CONSTRAINT `quiz_result_ibfk_1` FOREIGN KEY (`Quiz_ID`) REFERENCES `quiz` (`Quiz_ID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `testimony`
--
ALTER TABLE `testimony`
ADD CONSTRAINT `testimony_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`ID`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

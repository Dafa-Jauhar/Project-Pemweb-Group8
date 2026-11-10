-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 10, 2026 at 02:01 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumah_sakit_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `DoctorID` int(11) NOT NULL,
  `DoctorName` varchar(50) NOT NULL,
  `Speciality` varchar(20) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `RegistrationNumber` char(17) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `DoctorName`, `Speciality`, `PhoneNumber`, `Email`, `RegistrationNumber`, `UserID`) VALUES
(1, 'dr. Gita Saputra', 'Umum', '081210000001', 'doctor001@rssehat.test', 'REG-2026-00001', 2),
(2, 'dr. Hana Wijaya', 'Penyakit Dalam', '081210000002', 'doctor002@rssehat.test', 'REG-2026-00002', 3),
(3, 'dr. Indra Lestari', 'Anak', '081210000003', 'doctor003@rssehat.test', 'REG-2026-00003', 4),
(4, 'dr. Joko Hidayat', 'Bedah', '081210000004', 'doctor004@rssehat.test', 'REG-2026-00004', 5),
(5, 'dr. Karin Permata', 'Mata', '081210000005', 'doctor005@rssehat.test', 'REG-2026-00005', 6),
(6, 'dr. Lina Santoso', 'THT', '081210000006', 'doctor006@rssehat.test', 'REG-2026-00006', 7),
(7, 'dr. Maya Kusuma', 'Kulit', '081210000007', 'doctor007@rssehat.test', 'REG-2026-00007', 8),
(8, 'dr. Nanda Nugroho', 'Saraf', '081210000008', 'doctor008@rssehat.test', 'REG-2026-00008', 9),
(9, 'dr. Oki Sari', 'Jantung', '081210000009', 'doctor009@rssehat.test', 'REG-2026-00009', 10),
(10, 'dr. Putri Wibowo', 'Obgyn', '081210000010', 'doctor010@rssehat.test', 'REG-2026-00010', 11),
(11, 'dr. Raka Ramadhan', 'Orthopedi', '081210000011', 'doctor011@rssehat.test', 'REG-2026-00011', 12),
(12, 'dr. Sari Setiawan', 'Gigi', '081210000012', 'doctor012@rssehat.test', 'REG-2026-00012', 13),
(13, 'dr. Taufik Maulana', 'Umum', '081210000013', 'doctor013@rssehat.test', 'REG-2026-00013', 14),
(14, 'dr. Vina Putra', 'Penyakit Dalam', '081210000014', 'doctor014@rssehat.test', 'REG-2026-00014', 15),
(15, 'dr. Wahyu Anggraini', 'Anak', '081210000015', 'doctor015@rssehat.test', 'REG-2026-00015', 16),
(16, 'dr. Yuni Pratama', 'Bedah', '081210000016', 'doctor016@rssehat.test', 'REG-2026-00016', 17),
(17, 'dr. Zaki Saputra', 'Mata', '081210000017', 'doctor017@rssehat.test', 'REG-2026-00017', 18),
(18, 'dr. Alya Wijaya', 'THT', '081210000018', 'doctor018@rssehat.test', 'REG-2026-00018', 19),
(19, 'dr. Bagas Lestari', 'Kulit', '081210000019', 'doctor019@rssehat.test', 'REG-2026-00019', 20),
(20, 'dr. Dimas Hidayat', 'Saraf', '081210000020', 'doctor020@rssehat.test', 'REG-2026-00020', 21);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `DrugID` int(11) NOT NULL,
  `DrugName` varchar(30) NOT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `DrugType` varchar(20) NOT NULL,
  `quantityPerUnitInMg` decimal(8,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`DrugID`, `DrugName`, `Price`, `Stock`, `DrugType`, `quantityPerUnitInMg`) VALUES
(1, 'Paracetamol', 5000, 120, 'Tablet', 500.00),
(2, 'Amoxicillin', 12000, 80, 'Kapsul', 500.00),
(3, 'Ibuprofen', 9000, 95, 'Tablet', 200.00),
(4, 'Omeprazole', 11000, 70, 'Kapsul', 20.00),
(5, 'Cetirizine', 7000, 110, 'Tablet', 10.00),
(6, 'Amlodipine', 8000, 90, 'Tablet', 5.00),
(7, 'Metformin', 8500, 100, 'Tablet', 500.00),
(8, 'Salbutamol', 15000, 55, 'Tablet', 2.00),
(9, 'Antasida', 6000, 130, 'Tablet', 500.00),
(10, 'Ambroxol', 7500, 75, 'Sirup', 30.00),
(11, 'Loratadine', 8500, 65, 'Tablet', 10.00),
(12, 'Diclofenac', 10000, 60, 'Tablet', 25.00),
(13, 'Captopril', 6500, 85, 'Tablet', 25.00),
(14, 'Simvastatin', 9500, 72, 'Tablet', 20.00),
(15, 'Vitamin B Complex', 10000, 140, 'Tablet', 1.00),
(16, 'ORS', 4000, 150, 'Sachet', 0.00),
(17, 'Mefenamic Acid', 9000, 88, 'Tablet', 500.00),
(18, 'Dexamethasone', 5000, 50, 'Tablet', 0.50),
(19, 'Furosemide', 7000, 45, 'Tablet', 40.00),
(20, 'Ranitidine', 6500, 40, 'Tablet', 150.00),
(21, 'Clindamycin', 16000, 35, 'Kapsul', 300.00),
(22, 'Azithromycin', 18000, 42, 'Tablet', 500.00),
(23, 'Domperidone', 7500, 58, 'Tablet', 10.00),
(24, 'Lansoprazole', 12000, 47, 'Kapsul', 30.00),
(25, 'Ketoconazole', 14000, 33, 'Krim', 20.00),
(26, 'Betamethasone', 11000, 30, 'Krim', 0.50),
(27, 'Povidone Iodine', 13000, 52, 'Cairan', 10.00),
(28, 'Oralit', 4500, 90, 'Sachet', 0.00),
(29, 'Bromhexine', 8500, 49, 'Sirup', 8.00),
(30, 'Cefixime', 22000, 38, 'Kapsul', 200.00),
(31, 'Naproxen', 12000, 41, 'Tablet', 250.00),
(32, 'Insulin Glargine', 95000, 18, 'Injeksi', 100.00),
(33, 'Lidocaine', 25000, 25, 'Injeksi', 20.00),
(34, 'Miconazole', 12500, 36, 'Krim', 20.00),
(35, 'Vitamin D3', 11500, 67, 'Tablet', 1000.00);

-- --------------------------------------------------------

--
-- Table structure for table `medical_examinations`
--

CREATE TABLE `medical_examinations` (
  `ExamID` int(11) NOT NULL,
  `DoctorID` int(11) DEFAULT NULL,
  `PatientID` int(11) DEFAULT NULL,
  `Examination_date` datetime DEFAULT NULL,
  `Diagnosis` text DEFAULT NULL,
  `examResult` text DEFAULT NULL,
  `mainIssues` text DEFAULT NULL,
  `action` text DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `BloodPressureSistolik` int(11) DEFAULT NULL,
  `BloodPressureDiastolik` int(11) DEFAULT NULL,
  `pulse` smallint(6) DEFAULT NULL,
  `temperature` decimal(4,1) DEFAULT NULL,
  `WeightKg` decimal(10,0) DEFAULT NULL,
  `HeightCm` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_examinations`
--

INSERT INTO `medical_examinations` (`ExamID`, `DoctorID`, `PatientID`, `Examination_date`, `Diagnosis`, `examResult`, `mainIssues`, `action`, `notes`, `BloodPressureSistolik`, `BloodPressureDiastolik`, `pulse`, `temperature`, `WeightKg`, `HeightCm`) VALUES
(1, 1, 7, '2026-01-05 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 107, 70, 75, 36.4, 48, 149),
(2, 2, 14, '2026-01-06 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 114, 75, 82, 36.7, 51, 153),
(3, 3, 21, '2026-01-07 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 121, 80, 89, 37.0, 54, 157),
(4, 4, 28, '2026-01-08 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 128, 85, 96, 37.4, 57, 161),
(5, 5, 35, '2026-01-09 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 135, 65, 72, 37.8, 60, 165),
(6, 6, 42, '2026-01-10 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 142, 70, 79, 38.1, 63, 169),
(7, 7, 49, '2026-01-11 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 104, 75, 86, 36.4, 66, 173),
(8, 8, 56, '2026-01-12 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 111, 80, 93, 36.7, 69, 177),
(9, 9, 63, '2026-01-13 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 118, 85, 69, 37.0, 72, 181),
(10, 10, 70, '2026-01-14 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 125, 65, 76, 37.4, 75, 185),
(11, 11, 7, '2026-01-15 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 132, 70, 83, 37.8, 78, 189),
(12, 12, 14, '2026-01-16 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 139, 75, 90, 38.1, 81, 148),
(13, 13, 21, '2026-01-17 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 101, 80, 97, 36.4, 84, 152),
(14, 14, 28, '2026-01-18 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 108, 85, 73, 36.7, 87, 156),
(15, 15, 35, '2026-01-19 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 115, 65, 80, 37.0, 90, 160),
(16, 16, 42, '2026-01-20 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 122, 70, 87, 37.4, 93, 164),
(17, 17, 49, '2026-01-21 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 129, 75, 94, 37.8, 46, 168),
(18, 18, 56, '2026-01-22 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 136, 80, 70, 38.1, 49, 172),
(19, 19, 63, '2026-01-23 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 143, 85, 77, 36.4, 52, 176),
(20, 20, 70, '2026-01-24 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 105, 65, 84, 36.7, 55, 180),
(21, 1, 7, '2026-01-25 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 112, 70, 91, 37.0, 58, 184),
(22, 2, 14, '2026-01-26 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 119, 75, 98, 37.4, 61, 188),
(23, 3, 21, '2026-01-27 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 126, 80, 74, 37.8, 64, 147),
(24, 4, 28, '2026-01-28 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 133, 85, 81, 38.1, 67, 151),
(25, 5, 35, '2026-01-29 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 140, 65, 88, 36.4, 70, 155),
(26, 6, 42, '2026-01-30 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 102, 70, 95, 36.7, 73, 159),
(27, 7, 49, '2026-01-31 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 109, 75, 71, 37.0, 76, 163),
(28, 8, 56, '2026-02-01 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 116, 80, 78, 37.4, 79, 167),
(29, 9, 63, '2026-02-02 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 123, 85, 85, 37.8, 82, 171),
(30, 10, 70, '2026-02-03 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 130, 65, 92, 38.1, 85, 175),
(31, 11, 7, '2026-02-04 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 137, 70, 68, 36.4, 88, 179),
(32, 12, 14, '2026-02-05 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 144, 75, 75, 36.7, 91, 183),
(33, 13, 21, '2026-02-06 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 106, 80, 82, 37.0, 94, 187),
(34, 14, 28, '2026-02-07 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 113, 85, 89, 37.4, 47, 146),
(35, 15, 35, '2026-02-08 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 120, 65, 96, 37.8, 50, 150),
(36, 16, 42, '2026-02-09 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 127, 70, 72, 38.1, 53, 154),
(37, 17, 49, '2026-02-10 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 134, 75, 79, 36.4, 56, 158),
(38, 18, 56, '2026-02-11 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 141, 80, 86, 36.7, 59, 162),
(39, 19, 63, '2026-02-12 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 103, 85, 93, 37.0, 62, 166),
(40, 20, 70, '2026-02-13 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 110, 65, 69, 37.4, 65, 170),
(41, 1, 7, '2026-02-14 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 117, 70, 76, 37.8, 68, 174),
(42, 2, 14, '2026-02-15 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 124, 75, 83, 38.1, 71, 178),
(43, 3, 21, '2026-02-16 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 131, 80, 90, 36.4, 74, 182),
(44, 4, 28, '2026-02-17 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 138, 85, 97, 36.7, 77, 186),
(45, 5, 35, '2026-02-18 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 100, 65, 73, 37.0, 80, 145),
(46, 6, 42, '2026-02-19 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 107, 70, 80, 37.4, 83, 149),
(47, 7, 49, '2026-02-20 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 114, 75, 87, 37.8, 86, 153),
(48, 8, 56, '2026-02-21 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 121, 80, 94, 38.1, 89, 157),
(49, 9, 63, '2026-02-22 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 128, 85, 70, 36.4, 92, 161),
(50, 10, 70, '2026-02-23 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 135, 65, 77, 36.7, 45, 165),
(51, 11, 7, '2026-02-24 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 142, 70, 84, 37.0, 48, 169),
(52, 12, 14, '2026-02-25 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 104, 75, 91, 37.4, 51, 173),
(53, 13, 21, '2026-02-26 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 111, 80, 98, 37.8, 54, 177),
(54, 14, 28, '2026-02-27 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 118, 85, 74, 38.1, 57, 181),
(55, 15, 35, '2026-02-28 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 125, 65, 81, 36.4, 60, 185),
(56, 16, 42, '2026-03-01 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 132, 70, 88, 36.7, 63, 189),
(57, 17, 49, '2026-03-02 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 139, 75, 95, 37.0, 66, 148),
(58, 18, 56, '2026-03-03 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 101, 80, 71, 37.4, 69, 152),
(59, 19, 63, '2026-03-04 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 108, 85, 78, 37.8, 72, 156),
(60, 20, 70, '2026-03-05 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 115, 65, 85, 38.1, 75, 160),
(61, 1, 7, '2026-03-06 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 122, 70, 92, 36.4, 78, 164),
(62, 2, 14, '2026-03-07 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 129, 75, 68, 36.7, 81, 168),
(63, 3, 21, '2026-03-08 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 136, 80, 75, 37.0, 84, 172),
(64, 4, 28, '2026-03-09 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 143, 85, 82, 37.4, 87, 176),
(65, 5, 35, '2026-03-10 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 105, 65, 89, 37.8, 90, 180),
(66, 6, 42, '2026-03-11 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 112, 70, 96, 38.1, 93, 184),
(67, 7, 49, '2026-03-12 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 119, 75, 72, 36.4, 46, 188),
(68, 8, 56, '2026-03-13 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 126, 80, 79, 36.7, 49, 147),
(69, 9, 63, '2026-03-14 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 133, 85, 86, 37.0, 52, 151),
(70, 10, 70, '2026-03-15 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 140, 65, 93, 37.4, 55, 155),
(71, 11, 7, '2026-03-16 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 102, 70, 69, 37.8, 58, 159),
(72, 12, 14, '2026-03-17 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 109, 75, 76, 38.1, 61, 163),
(73, 13, 21, '2026-03-18 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 116, 80, 83, 36.4, 64, 167),
(74, 14, 28, '2026-03-19 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 123, 85, 90, 36.7, 67, 171),
(75, 15, 35, '2026-03-20 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 130, 65, 97, 37.0, 70, 175),
(76, 16, 42, '2026-03-21 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 137, 70, 73, 37.4, 73, 179),
(77, 17, 49, '2026-03-22 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 144, 75, 80, 37.8, 76, 183),
(78, 18, 56, '2026-03-23 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 106, 80, 87, 38.1, 79, 187),
(79, 19, 63, '2026-03-24 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 113, 85, 94, 36.4, 82, 146),
(80, 20, 70, '2026-03-25 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 120, 65, 70, 36.7, 85, 150),
(81, 1, 7, '2026-03-26 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 127, 70, 77, 37.0, 88, 154),
(82, 2, 14, '2026-03-27 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 134, 75, 84, 37.4, 91, 158),
(83, 3, 21, '2026-03-28 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 141, 80, 91, 37.8, 94, 162),
(84, 4, 28, '2026-03-29 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 103, 85, 98, 38.1, 47, 166),
(85, 5, 35, '2026-03-30 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 110, 65, 74, 36.4, 50, 170),
(86, 6, 42, '2026-03-31 14:00:00', 'Asma', 'Keluhan pernapasan perlu dipantau; evaluasi respons terapi.', 'Batuk dan sesak episodik.', 'Penilaian pernapasan dan edukasi penggunaan terapi.', 'Hindari pencetus yang diketahui dan ikuti rencana kontrol.', 117, 70, 81, 36.7, 53, 174),
(87, 7, 49, '2026-04-01 08:00:00', 'Diare', 'Keluhan pencernaan dengan risiko kekurangan cairan.', 'Frekuensi buang air besar meningkat dan perut mulas.', 'Evaluasi hidrasi dan edukasi penggantian cairan.', 'Perbanyak cairan dan segera periksa bila muncul tanda dehidrasi.', 124, 75, 88, 37.0, 56, 178),
(88, 8, 56, '2026-04-02 11:00:00', 'Infeksi Saluran Kemih', 'Keluhan mengarah pada infeksi saluran kemih; perlu evaluasi.', 'Nyeri saat buang air kecil dan sering ingin berkemih.', 'Pemeriksaan lanjutan sesuai indikasi dan terapi dokter.', 'Ikuti terapi sampai selesai sesuai instruksi dokter.', 131, 80, 95, 37.4, 59, 182),
(89, 9, 63, '2026-04-03 14:00:00', 'Anemia', 'Keluhan dapat berkaitan dengan kadar hemoglobin; perlu pemeriksaan pendukung.', 'Mudah lelah dan terkadang pusing.', 'Evaluasi riwayat dan rencana pemeriksaan darah.', 'Ikuti jadwal pemeriksaan lanjutan dan anjuran nutrisi.', 138, 85, 71, 37.8, 62, 186),
(90, 10, 70, '2026-04-04 08:00:00', 'Flu', 'Gejala menyerupai infeksi virus saluran pernapasan.', 'Pilek, bersin, dan badan terasa pegal.', 'Pemeriksaan fisik dan penanganan gejala.', 'Istirahat cukup dan terapkan etika batuk.', 100, 65, 78, 38.1, 65, 145),
(91, 11, 7, '2026-04-05 11:00:00', 'ISPA', 'Gejala infeksi saluran pernapasan atas ringan; kondisi umum stabil.', 'Batuk, pilek, dan tenggorokan terasa tidak nyaman.', 'Pemeriksaan fisik dan edukasi perawatan mandiri.', 'Istirahat cukup, minum air, dan kembali kontrol bila gejala memburuk.', 107, 70, 85, 36.4, 68, 149),
(92, 12, 14, '2026-04-06 14:00:00', 'Gastritis', 'Keluhan sesuai gambaran iritasi lambung; perlu pemantauan gejala.', 'Nyeri ulu hati dan perut terasa perih.', 'Evaluasi pola makan dan pemberian terapi sesuai resep.', 'Makan teratur dan ikuti petunjuk obat dari dokter.', 114, 75, 92, 36.7, 71, 153),
(93, 13, 21, '2026-04-07 08:00:00', 'Hipertensi', 'Tekanan darah pada kunjungan ini perlu pemantauan berkala.', 'Pusing sesekali dan tekanan darah meningkat.', 'Pengukuran tekanan darah ulang dan konseling gaya hidup.', 'Catat tekanan darah dan lakukan kontrol sesuai jadwal.', 121, 80, 68, 37.0, 74, 157),
(94, 14, 28, '2026-04-08 11:00:00', 'Diabetes Melitus Tipe 2', 'Keluhan perlu dipantau bersama pemeriksaan glukosa berkala.', 'Sering haus dan mudah merasa lelah.', 'Evaluasi kondisi dan edukasi pengelolaan pola hidup.', 'Ikuti rencana kontrol dan anjuran dokter.', 128, 85, 75, 37.4, 77, 161),
(95, 15, 35, '2026-04-09 14:00:00', 'Demam', 'Suhu tubuh meningkat pada saat pemeriksaan.', 'Badan terasa panas dan lemas.', 'Pemeriksaan tanda vital dan evaluasi penyebab demam.', 'Cukupi cairan dan periksa kembali bila demam menetap.', 135, 65, 82, 37.8, 80, 165),
(96, 16, 42, '2026-04-10 08:00:00', 'Migrain', 'Pola keluhan mengarah pada migrain berdasarkan wawancara.', 'Sakit kepala berulang, terkadang disertai sensitif cahaya.', 'Evaluasi pemicu dan penanganan gejala.', 'Istirahat cukup dan catat frekuensi sakit kepala.', 142, 70, 89, 38.1, 83, 169),
(97, 17, 49, '2026-04-11 11:00:00', 'Dermatitis', 'Terdapat keluhan iritasi kulit yang perlu dipantau.', 'Kulit terasa gatal dan muncul ruam.', 'Pemeriksaan area kulit dan edukasi perawatan.', 'Hindari pemicu iritasi dan jaga kebersihan area kulit.', 104, 75, 96, 36.4, 86, 173),
(98, 18, 56, '2026-04-12 14:00:00', 'Faringitis', 'Terdapat tanda peradangan pada area tenggorokan.', 'Nyeri tenggorokan saat menelan.', 'Pemeriksaan tenggorokan dan penanganan sesuai evaluasi.', 'Jaga asupan cairan dan kontrol bila keluhan bertambah.', 111, 80, 72, 36.7, 89, 177),
(99, 19, 63, '2026-04-13 08:00:00', 'Artritis', 'Keluhan sendi memerlukan pemantauan dan evaluasi lanjutan.', 'Nyeri dan kaku pada persendian.', 'Pemeriksaan fungsi sendi dan edukasi aktivitas.', 'Hindari aktivitas yang memperberat nyeri dan lakukan kontrol.', 118, 85, 79, 37.0, 92, 181),
(100, 20, 70, '2026-04-14 11:00:00', 'Konjungtivitis', 'Keluhan sesuai peradangan konjungtiva.', 'Mata merah, berair, dan terasa gatal.', 'Pemeriksaan mata dan edukasi kebersihan.', 'Jangan menggosok mata dan jaga kebersihan tangan.', 125, 65, 86, 37.4, 45, 185);

-- --------------------------------------------------------

--
-- Table structure for table `medical_prescriptions`
--

CREATE TABLE `medical_prescriptions` (
  `PrescID` int(11) NOT NULL,
  `ExamID` int(11) DEFAULT NULL,
  `DrugID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TimePerTakeInHours` int(11) DEFAULT NULL,
  `DurationInDays` smallint(6) DEFAULT NULL,
  `Notes` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_prescriptions`
--

INSERT INTO `medical_prescriptions` (`PrescID`, `ExamID`, `DrugID`, `Quantity`, `TimePerTakeInHours`, `DurationInDays`, `Notes`) VALUES
(1, 1, 11, 10, 6, 3, 'Sesudah makan'),
(2, 2, 22, 12, 8, 5, 'Sesudah makan'),
(3, 3, 33, 14, 12, 7, 'Sebelum makan'),
(4, 4, 9, 20, 24, 10, 'Sebelum makan'),
(5, 5, 20, 30, 4, 14, 'Dapat diminum bersama makanan'),
(6, 6, 31, 6, 6, 3, 'Dapat diminum bersama makanan'),
(7, 7, 7, 10, 8, 5, 'Ikuti petunjuk dokter'),
(8, 8, 18, 12, 12, 7, 'Ikuti petunjuk dokter'),
(9, 9, 29, 14, 24, 10, 'Sesudah makan'),
(10, 10, 5, 20, 4, 14, 'Sesudah makan'),
(11, 11, 16, 30, 6, 3, 'Sebelum makan'),
(12, 12, 27, 6, 8, 5, 'Sebelum makan'),
(13, 13, 3, 10, 12, 7, 'Dapat diminum bersama makanan'),
(14, 14, 14, 12, 24, 10, 'Dapat diminum bersama makanan'),
(15, 15, 25, 14, 4, 14, 'Ikuti petunjuk dokter'),
(16, 16, 1, 20, 6, 3, 'Ikuti petunjuk dokter'),
(17, 17, 12, 30, 8, 5, 'Sesudah makan'),
(18, 18, 23, 6, 12, 7, 'Sesudah makan'),
(19, 19, 34, 10, 24, 10, 'Sebelum makan'),
(20, 20, 10, 12, 4, 14, 'Sebelum makan'),
(21, 21, 21, 14, 6, 3, 'Dapat diminum bersama makanan'),
(22, 22, 32, 20, 8, 5, 'Dapat diminum bersama makanan'),
(23, 23, 8, 30, 12, 7, 'Ikuti petunjuk dokter'),
(24, 24, 19, 6, 24, 10, 'Ikuti petunjuk dokter'),
(25, 25, 30, 10, 4, 14, 'Sesudah makan'),
(26, 26, 6, 12, 6, 3, 'Sesudah makan'),
(27, 27, 17, 14, 8, 5, 'Sebelum makan'),
(28, 28, 28, 20, 12, 7, 'Sebelum makan'),
(29, 29, 4, 30, 24, 10, 'Dapat diminum bersama makanan'),
(30, 30, 15, 6, 4, 14, 'Dapat diminum bersama makanan'),
(31, 31, 26, 10, 6, 3, 'Ikuti petunjuk dokter'),
(32, 32, 2, 12, 8, 5, 'Ikuti petunjuk dokter'),
(33, 33, 13, 14, 12, 7, 'Sesudah makan'),
(34, 34, 24, 20, 24, 10, 'Sesudah makan'),
(35, 35, 35, 30, 4, 14, 'Sebelum makan'),
(36, 36, 11, 6, 6, 3, 'Sebelum makan'),
(37, 37, 22, 10, 8, 5, 'Dapat diminum bersama makanan'),
(38, 38, 33, 12, 12, 7, 'Dapat diminum bersama makanan'),
(39, 39, 9, 14, 24, 10, 'Ikuti petunjuk dokter'),
(40, 40, 20, 20, 4, 14, 'Ikuti petunjuk dokter'),
(41, 41, 31, 30, 6, 3, 'Sesudah makan'),
(42, 42, 7, 6, 8, 5, 'Sesudah makan'),
(43, 43, 18, 10, 12, 7, 'Sebelum makan'),
(44, 44, 29, 12, 24, 10, 'Sebelum makan'),
(45, 45, 5, 14, 4, 14, 'Dapat diminum bersama makanan'),
(46, 46, 16, 20, 6, 3, 'Dapat diminum bersama makanan'),
(47, 47, 27, 30, 8, 5, 'Ikuti petunjuk dokter'),
(48, 48, 3, 6, 12, 7, 'Ikuti petunjuk dokter'),
(49, 49, 14, 10, 24, 10, 'Sesudah makan'),
(50, 50, 25, 12, 4, 14, 'Sesudah makan'),
(51, 51, 1, 14, 6, 3, 'Sebelum makan'),
(52, 52, 12, 20, 8, 5, 'Sebelum makan'),
(53, 53, 23, 30, 12, 7, 'Dapat diminum bersama makanan'),
(54, 54, 34, 6, 24, 10, 'Dapat diminum bersama makanan'),
(55, 55, 10, 10, 4, 14, 'Ikuti petunjuk dokter'),
(56, 56, 21, 12, 6, 3, 'Ikuti petunjuk dokter'),
(57, 57, 32, 14, 8, 5, 'Sesudah makan'),
(58, 58, 8, 20, 12, 7, 'Sesudah makan'),
(59, 59, 19, 30, 24, 10, 'Sebelum makan'),
(60, 60, 30, 6, 4, 14, 'Sebelum makan'),
(61, 61, 6, 10, 6, 3, 'Dapat diminum bersama makanan'),
(62, 62, 17, 12, 8, 5, 'Dapat diminum bersama makanan'),
(63, 63, 28, 14, 12, 7, 'Ikuti petunjuk dokter'),
(64, 64, 4, 20, 24, 10, 'Ikuti petunjuk dokter'),
(65, 65, 15, 30, 4, 14, 'Sesudah makan'),
(66, 66, 26, 6, 6, 3, 'Sesudah makan'),
(67, 67, 2, 10, 8, 5, 'Sebelum makan'),
(68, 68, 13, 12, 12, 7, 'Sebelum makan'),
(69, 69, 24, 14, 24, 10, 'Dapat diminum bersama makanan'),
(70, 70, 35, 20, 4, 14, 'Dapat diminum bersama makanan'),
(71, 71, 11, 30, 6, 3, 'Ikuti petunjuk dokter'),
(72, 72, 22, 6, 8, 5, 'Ikuti petunjuk dokter'),
(73, 73, 33, 10, 12, 7, 'Sesudah makan'),
(74, 74, 9, 12, 24, 10, 'Sesudah makan'),
(75, 75, 20, 14, 4, 14, 'Sebelum makan'),
(76, 76, 31, 20, 6, 3, 'Sebelum makan'),
(77, 77, 7, 30, 8, 5, 'Dapat diminum bersama makanan'),
(78, 78, 18, 6, 12, 7, 'Dapat diminum bersama makanan'),
(79, 79, 29, 10, 24, 10, 'Ikuti petunjuk dokter'),
(80, 80, 5, 12, 4, 14, 'Ikuti petunjuk dokter'),
(81, 81, 16, 14, 6, 3, 'Sesudah makan'),
(82, 82, 27, 20, 8, 5, 'Sesudah makan'),
(83, 83, 3, 30, 12, 7, 'Sebelum makan'),
(84, 84, 14, 6, 24, 10, 'Sebelum makan'),
(85, 85, 25, 10, 4, 14, 'Dapat diminum bersama makanan'),
(86, 86, 1, 12, 6, 3, 'Dapat diminum bersama makanan'),
(87, 87, 12, 14, 8, 5, 'Ikuti petunjuk dokter'),
(88, 88, 23, 20, 12, 7, 'Ikuti petunjuk dokter'),
(89, 89, 34, 30, 24, 10, 'Sesudah makan'),
(90, 90, 10, 6, 4, 14, 'Sesudah makan'),
(91, 91, 21, 10, 6, 3, 'Sebelum makan'),
(92, 92, 32, 12, 8, 5, 'Sebelum makan'),
(93, 93, 8, 14, 12, 7, 'Dapat diminum bersama makanan'),
(94, 94, 19, 20, 24, 10, 'Dapat diminum bersama makanan'),
(95, 95, 30, 30, 4, 14, 'Ikuti petunjuk dokter'),
(96, 96, 6, 6, 6, 3, 'Ikuti petunjuk dokter'),
(97, 97, 17, 10, 8, 5, 'Sesudah makan'),
(98, 98, 28, 12, 12, 7, 'Sesudah makan'),
(99, 99, 4, 14, 24, 10, 'Sebelum makan'),
(100, 100, 15, 20, 4, 14, 'Sebelum makan'),
(101, 1, 26, 30, 6, 3, 'Dapat diminum bersama makanan'),
(102, 2, 2, 6, 8, 5, 'Dapat diminum bersama makanan'),
(103, 3, 13, 10, 12, 7, 'Ikuti petunjuk dokter'),
(104, 4, 24, 12, 24, 10, 'Ikuti petunjuk dokter'),
(105, 5, 35, 14, 4, 14, 'Sesudah makan'),
(106, 6, 11, 20, 6, 3, 'Sesudah makan'),
(107, 7, 22, 30, 8, 5, 'Sebelum makan'),
(108, 8, 33, 6, 12, 7, 'Sebelum makan'),
(109, 9, 9, 10, 24, 10, 'Dapat diminum bersama makanan'),
(110, 10, 20, 12, 4, 14, 'Dapat diminum bersama makanan'),
(111, 11, 31, 14, 6, 3, 'Ikuti petunjuk dokter'),
(112, 12, 7, 20, 8, 5, 'Ikuti petunjuk dokter'),
(113, 13, 18, 30, 12, 7, 'Sesudah makan'),
(114, 14, 29, 6, 24, 10, 'Sesudah makan'),
(115, 15, 5, 10, 4, 14, 'Sebelum makan'),
(116, 16, 16, 12, 6, 3, 'Sebelum makan'),
(117, 17, 27, 14, 8, 5, 'Dapat diminum bersama makanan'),
(118, 18, 3, 20, 12, 7, 'Dapat diminum bersama makanan'),
(119, 19, 14, 30, 24, 10, 'Ikuti petunjuk dokter'),
(120, 20, 25, 6, 4, 14, 'Ikuti petunjuk dokter'),
(121, 21, 1, 10, 6, 3, 'Sesudah makan'),
(122, 22, 12, 12, 8, 5, 'Sesudah makan'),
(123, 23, 23, 14, 12, 7, 'Sebelum makan'),
(124, 24, 34, 20, 24, 10, 'Sebelum makan'),
(125, 25, 10, 30, 4, 14, 'Dapat diminum bersama makanan'),
(126, 26, 21, 6, 6, 3, 'Dapat diminum bersama makanan'),
(127, 27, 32, 10, 8, 5, 'Ikuti petunjuk dokter'),
(128, 28, 8, 12, 12, 7, 'Ikuti petunjuk dokter'),
(129, 29, 19, 14, 24, 10, 'Sesudah makan'),
(130, 30, 30, 20, 4, 14, 'Sesudah makan'),
(131, 31, 6, 30, 6, 3, 'Sebelum makan'),
(132, 32, 17, 6, 8, 5, 'Sebelum makan'),
(133, 33, 28, 10, 12, 7, 'Dapat diminum bersama makanan'),
(134, 34, 4, 12, 24, 10, 'Dapat diminum bersama makanan'),
(135, 35, 15, 14, 4, 14, 'Ikuti petunjuk dokter'),
(136, 36, 26, 20, 6, 3, 'Ikuti petunjuk dokter'),
(137, 37, 2, 30, 8, 5, 'Sesudah makan'),
(138, 38, 13, 6, 12, 7, 'Sesudah makan'),
(139, 39, 24, 10, 24, 10, 'Sebelum makan'),
(140, 40, 35, 12, 4, 14, 'Sebelum makan'),
(141, 41, 11, 14, 6, 3, 'Dapat diminum bersama makanan'),
(142, 42, 22, 20, 8, 5, 'Dapat diminum bersama makanan'),
(143, 43, 33, 30, 12, 7, 'Ikuti petunjuk dokter'),
(144, 44, 9, 6, 24, 10, 'Ikuti petunjuk dokter'),
(145, 45, 20, 10, 4, 14, 'Sesudah makan'),
(146, 46, 31, 12, 6, 3, 'Sesudah makan'),
(147, 47, 7, 14, 8, 5, 'Sebelum makan'),
(148, 48, 18, 20, 12, 7, 'Sebelum makan'),
(149, 49, 29, 30, 24, 10, 'Dapat diminum bersama makanan'),
(150, 50, 5, 6, 4, 14, 'Dapat diminum bersama makanan');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientID` int(11) NOT NULL,
  `PatientName` varchar(50) DEFAULT NULL,
  `NIK` char(16) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `BloodType` varchar(3) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `BirthDate` date NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `PatientName`, `NIK`, `Email`, `BloodType`, `PhoneNumber`, `Address`, `Gender`, `BirthDate`, `UserID`) VALUES
(1, 'Indra Lestari', '3471000000007919', 'patient001@rssehat.test', 'A+', '082110000001', 'Jl. Melati No. 1, Yogyakarta', 'L', '1977-02-04', 22),
(2, 'Joko Santoso', '3471000000015838', 'patient002@rssehat.test', 'B+', '082110000002', 'Jl. Melati No. 2, Yogyakarta', 'P', '1984-03-07', 23),
(3, 'Karin Sari', '3471000000023757', 'patient003@rssehat.test', 'O+', '082110000003', 'Jl. Melati No. 3, Yogyakarta', 'L', '1991-04-10', 24),
(4, 'Lina Setiawan', '3471000000031676', 'patient004@rssehat.test', 'AB+', '082110000004', 'Jl. Melati No. 4, Yogyakarta', 'P', '1998-05-13', 25),
(5, 'Maya Anggraini', '3471000000039595', 'patient005@rssehat.test', 'A-', '082110000005', 'Jl. Melati No. 5, Yogyakarta', 'L', '2005-06-16', 26),
(6, 'Nanda Wijaya', '3471000000047514', 'patient006@rssehat.test', 'B-', '082110000006', 'Jl. Melati No. 6, Yogyakarta', 'P', '2012-07-19', 27),
(7, 'Oki Permata', '3471000000055433', 'patient007@rssehat.test', 'O-', '082110000007', 'Jl. Melati No. 7, Yogyakarta', 'L', '1974-08-22', 28),
(8, 'Putri Nugroho', '3471000000063352', 'patient008@rssehat.test', 'AB+', '082110000008', 'Jl. Melati No. 8, Yogyakarta', 'P', '1981-09-25', 29),
(9, 'Raka Ramadhan', '3471000000071271', 'patient009@rssehat.test', 'A+', '082110000009', 'Jl. Melati No. 9, Yogyakarta', 'L', '1988-10-01', 30),
(10, 'Sari Putra', '3471000000079190', 'patient010@rssehat.test', 'B+', '082110000010', 'Jl. Melati No. 10, Yogyakarta', 'P', '1995-11-04', NULL),
(11, 'Taufik Saputra', '3471000000087109', 'patient011@rssehat.test', 'O+', '082110000011', 'Jl. Melati No. 11, Yogyakarta', 'L', '2002-12-07', NULL),
(12, 'Vina Hidayat', '3471000000095028', 'patient012@rssehat.test', 'AB+', '082110000012', 'Jl. Melati No. 12, Yogyakarta', 'P', '2009-01-10', NULL),
(13, 'Wahyu Kusuma', '3471000000102947', 'patient013@rssehat.test', 'A-', '082110000013', 'Jl. Melati No. 13, Yogyakarta', 'L', '1971-02-13', NULL),
(14, 'Yuni Wibowo', '3471000000110866', 'patient014@rssehat.test', 'B-', '082110000014', 'Jl. Melati No. 14, Yogyakarta', 'P', '1978-03-16', NULL),
(15, 'Zaki Maulana', '3471000000118785', 'patient015@rssehat.test', 'O-', '082110000015', 'Jl. Melati No. 15, Yogyakarta', 'L', '1985-04-19', NULL),
(16, 'Alya Pratama', '3471000000126704', 'patient016@rssehat.test', 'AB+', '082110000016', 'Jl. Melati No. 16, Yogyakarta', 'P', '1992-05-22', NULL),
(17, 'Bagas Lestari', '3471000000134623', 'patient017@rssehat.test', 'A+', '082110000017', 'Jl. Melati No. 17, Yogyakarta', 'L', '1999-06-25', NULL),
(18, 'Dimas Santoso', '3471000000142542', 'patient018@rssehat.test', 'B+', '082110000018', 'Jl. Melati No. 18, Yogyakarta', 'P', '2006-07-01', NULL),
(19, 'Intan Sari', '3471000000150461', 'patient019@rssehat.test', 'O+', '082110000019', 'Jl. Melati No. 19, Yogyakarta', 'L', '2013-08-04', NULL),
(20, 'Rizky Setiawan', '3471000000158380', 'patient020@rssehat.test', 'AB+', '082110000020', 'Jl. Melati No. 20, Yogyakarta', 'P', '1975-09-07', NULL),
(21, 'Nadia Anggraini', '3471000000166299', 'patient021@rssehat.test', 'A-', '082110000021', 'Jl. Melati No. 21, Yogyakarta', 'L', '1982-10-10', NULL),
(22, 'Yoga Wijaya', '3471000000174218', 'patient022@rssehat.test', 'B-', '082110000022', 'Jl. Melati No. 22, Yogyakarta', 'P', '1989-11-13', NULL),
(23, 'Arif Permata', '3471000000182137', 'patient023@rssehat.test', 'O-', '082110000023', 'Jl. Melati No. 23, Yogyakarta', 'L', '1996-12-16', NULL),
(24, 'Bella Nugroho', '3471000000190056', 'patient024@rssehat.test', 'AB+', '082110000024', 'Jl. Melati No. 24, Yogyakarta', 'P', '2003-01-19', NULL),
(25, 'Cahyo Ramadhan', '3471000000197975', 'patient025@rssehat.test', 'A+', '082110000025', 'Jl. Melati No. 25, Yogyakarta', 'L', '2010-02-22', NULL),
(26, 'Dinda Putra', '3471000000205894', 'patient026@rssehat.test', 'B+', '082110000026', 'Jl. Melati No. 26, Yogyakarta', 'P', '1972-03-25', NULL),
(27, 'Farhan Saputra', '3471000000213813', 'patient027@rssehat.test', 'O+', '082110000027', 'Jl. Melati No. 27, Yogyakarta', 'L', '1979-04-01', NULL),
(28, 'Galih Hidayat', '3471000000221732', 'patient028@rssehat.test', 'AB+', '082110000028', 'Jl. Melati No. 28, Yogyakarta', 'P', '1986-05-04', NULL),
(29, 'Nisa Kusuma', '3471000000229651', 'patient029@rssehat.test', 'A-', '082110000029', 'Jl. Melati No. 29, Yogyakarta', 'L', '1993-06-07', NULL),
(30, 'Rani Wibowo', '3471000000237570', 'patient030@rssehat.test', 'B-', '082110000030', 'Jl. Melati No. 30, Yogyakarta', 'P', '2000-07-10', NULL),
(31, 'Salsa Maulana', '3471000000245489', 'patient031@rssehat.test', 'O-', '082110000031', 'Jl. Melati No. 31, Yogyakarta', 'L', '2007-08-13', NULL),
(32, 'Tegar Pratama', '3471000000253408', 'patient032@rssehat.test', 'AB+', '082110000032', 'Jl. Melati No. 32, Yogyakarta', 'P', '2014-09-16', NULL),
(33, 'Ahmad Lestari', '3471000000261327', 'patient033@rssehat.test', 'A+', '082110000033', 'Jl. Melati No. 33, Yogyakarta', 'L', '1976-10-19', NULL),
(34, 'Budi Santoso', '3471000000269246', 'patient034@rssehat.test', 'B+', '082110000034', 'Jl. Melati No. 34, Yogyakarta', 'P', '1983-11-22', NULL),
(35, 'Citra Sari', '3471000000277165', 'patient035@rssehat.test', 'O+', '082110000035', 'Jl. Melati No. 35, Yogyakarta', 'L', '1990-12-25', NULL),
(36, 'Dewi Setiawan', '3471000000285084', 'patient036@rssehat.test', 'AB+', '082110000036', 'Jl. Melati No. 36, Yogyakarta', 'P', '1997-01-01', NULL),
(37, 'Eko Anggraini', '3471000000293003', 'patient037@rssehat.test', 'A-', '082110000037', 'Jl. Melati No. 37, Yogyakarta', 'L', '2004-02-04', NULL),
(38, 'Fajar Wijaya', '3471000000300922', 'patient038@rssehat.test', 'B-', '082110000038', 'Jl. Melati No. 38, Yogyakarta', 'P', '2011-03-07', NULL),
(39, 'Gita Permata', '3471000000308841', 'patient039@rssehat.test', 'O-', '082110000039', 'Jl. Melati No. 39, Yogyakarta', 'L', '1973-04-10', NULL),
(40, 'Hana Nugroho', '3471000000316760', 'patient040@rssehat.test', 'AB+', '082110000040', 'Jl. Melati No. 40, Yogyakarta', 'P', '1980-05-13', NULL),
(41, 'Indra Ramadhan', '3471000000324679', 'patient041@rssehat.test', 'A+', '082110000041', 'Jl. Melati No. 41, Yogyakarta', 'L', '1987-06-16', NULL),
(42, 'Joko Putra', '3471000000332598', 'patient042@rssehat.test', 'B+', '082110000042', 'Jl. Melati No. 42, Yogyakarta', 'P', '1994-07-19', NULL),
(43, 'Karin Saputra', '3471000000340517', 'patient043@rssehat.test', 'O+', '082110000043', 'Jl. Melati No. 43, Yogyakarta', 'L', '2001-08-22', NULL),
(44, 'Lina Hidayat', '3471000000348436', 'patient044@rssehat.test', 'AB+', '082110000044', 'Jl. Melati No. 44, Yogyakarta', 'P', '2008-09-25', NULL),
(45, 'Maya Kusuma', '3471000000356355', 'patient045@rssehat.test', 'A-', '082110000045', 'Jl. Melati No. 45, Yogyakarta', 'L', '1970-10-01', NULL),
(46, 'Nanda Wibowo', '3471000000364274', 'patient046@rssehat.test', 'B-', '082110000046', 'Jl. Melati No. 46, Yogyakarta', 'P', '1977-11-04', NULL),
(47, 'Oki Maulana', '3471000000372193', 'patient047@rssehat.test', 'O-', '082110000047', 'Jl. Melati No. 47, Yogyakarta', 'L', '1984-12-07', NULL),
(48, 'Putri Pratama', '3471000000380112', 'patient048@rssehat.test', 'AB+', '082110000048', 'Jl. Melati No. 48, Yogyakarta', 'P', '1991-01-10', NULL),
(49, 'Raka Lestari', '3471000000388031', 'patient049@rssehat.test', 'A+', '082110000049', 'Jl. Melati No. 49, Yogyakarta', 'L', '1998-02-13', NULL),
(50, 'Sari Santoso', '3471000000395950', 'patient050@rssehat.test', 'B+', '082110000050', 'Jl. Melati No. 50, Yogyakarta', 'P', '2005-03-16', NULL),
(51, 'Taufik Sari', '3471000000403869', 'patient051@rssehat.test', 'O+', '082110000051', 'Jl. Melati No. 51, Yogyakarta', 'L', '2012-04-19', NULL),
(52, 'Vina Setiawan', '3471000000411788', 'patient052@rssehat.test', 'AB+', '082110000052', 'Jl. Melati No. 52, Yogyakarta', 'P', '1974-05-22', NULL),
(53, 'Wahyu Anggraini', '3471000000419707', 'patient053@rssehat.test', 'A-', '082110000053', 'Jl. Melati No. 53, Yogyakarta', 'L', '1981-06-25', NULL),
(54, 'Yuni Wijaya', '3471000000427626', 'patient054@rssehat.test', 'B-', '082110000054', 'Jl. Melati No. 54, Yogyakarta', 'P', '1988-07-01', NULL),
(55, 'Zaki Permata', '3471000000435545', 'patient055@rssehat.test', 'O-', '082110000055', 'Jl. Melati No. 55, Yogyakarta', 'L', '1995-08-04', NULL),
(56, 'Alya Nugroho', '3471000000443464', 'patient056@rssehat.test', 'AB+', '082110000056', 'Jl. Melati No. 56, Yogyakarta', 'P', '2002-09-07', NULL),
(57, 'Bagas Ramadhan', '3471000000451383', 'patient057@rssehat.test', 'A+', '082110000057', 'Jl. Melati No. 57, Yogyakarta', 'L', '2009-10-10', NULL),
(58, 'Dimas Putra', '3471000000459302', 'patient058@rssehat.test', 'B+', '082110000058', 'Jl. Melati No. 58, Yogyakarta', 'P', '1971-11-13', NULL),
(59, 'Intan Saputra', '3471000000467221', 'patient059@rssehat.test', 'O+', '082110000059', 'Jl. Melati No. 59, Yogyakarta', 'L', '1978-12-16', NULL),
(60, 'Rizky Hidayat', '3471000000475140', 'patient060@rssehat.test', 'AB+', '082110000060', 'Jl. Melati No. 60, Yogyakarta', 'P', '1985-01-19', NULL),
(61, 'Nadia Kusuma', '3471000000483059', 'patient061@rssehat.test', 'A-', '082110000061', 'Jl. Melati No. 61, Yogyakarta', 'L', '1992-02-22', NULL),
(62, 'Yoga Wibowo', '3471000000490978', 'patient062@rssehat.test', 'B-', '082110000062', 'Jl. Melati No. 62, Yogyakarta', 'P', '1999-03-25', NULL),
(63, 'Arif Maulana', '3471000000498897', 'patient063@rssehat.test', 'O-', '082110000063', 'Jl. Melati No. 63, Yogyakarta', 'L', '2006-04-01', NULL),
(64, 'Bella Pratama', '3471000000506816', 'patient064@rssehat.test', 'AB+', '082110000064', 'Jl. Melati No. 64, Yogyakarta', 'P', '2013-05-04', NULL),
(65, 'Cahyo Lestari', '3471000000514735', 'patient065@rssehat.test', 'A+', '082110000065', 'Jl. Melati No. 65, Yogyakarta', 'L', '1975-06-07', NULL),
(66, 'Dinda Santoso', '3471000000522654', 'patient066@rssehat.test', 'B+', '082110000066', 'Jl. Melati No. 66, Yogyakarta', 'P', '1982-07-10', NULL),
(67, 'Farhan Sari', '3471000000530573', 'patient067@rssehat.test', 'O+', '082110000067', 'Jl. Melati No. 67, Yogyakarta', 'L', '1989-08-13', NULL),
(68, 'Galih Setiawan', '3471000000538492', 'patient068@rssehat.test', 'AB+', '082110000068', 'Jl. Melati No. 68, Yogyakarta', 'P', '1996-09-16', NULL),
(69, 'Nisa Anggraini', '3471000000546411', 'patient069@rssehat.test', 'A-', '082110000069', 'Jl. Melati No. 69, Yogyakarta', 'L', '2003-10-19', NULL),
(70, 'Rani Wijaya', '3471000000554330', 'patient070@rssehat.test', 'B-', '082110000070', 'Jl. Melati No. 70, Yogyakarta', 'P', '2010-11-22', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(50) NOT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Password` varchar(20) NOT NULL,
  `Role` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `Email`, `Password`, `Role`) VALUES
(1, 'ahmad1', 'ahmad1@rssehat.test', 'Pass1234', 'admin'),
(2, 'budi2', 'budi2@rssehat.test', 'Pass1234', 'doctor'),
(3, 'citra3', 'citra3@rssehat.test', 'Pass1234', 'doctor'),
(4, 'dewi4', 'dewi4@rssehat.test', 'Pass1234', 'doctor'),
(5, 'eko5', 'eko5@rssehat.test', 'Pass1234', 'doctor'),
(6, 'fajar6', 'fajar6@rssehat.test', 'Pass1234', 'doctor'),
(7, 'gita7', 'gita7@rssehat.test', 'Pass1234', 'doctor'),
(8, 'hana8', 'hana8@rssehat.test', 'Pass1234', 'doctor'),
(9, 'indra9', 'indra9@rssehat.test', 'Pass1234', 'doctor'),
(10, 'joko10', 'joko10@rssehat.test', 'Pass1234', 'doctor'),
(11, 'karin11', 'karin11@rssehat.test', 'Pass1234', 'doctor'),
(12, 'lina12', 'lina12@rssehat.test', 'Pass1234', 'doctor'),
(13, 'maya13', 'maya13@rssehat.test', 'Pass1234', 'doctor'),
(14, 'nanda14', 'nanda14@rssehat.test', 'Pass1234', 'doctor'),
(15, 'oki15', 'oki15@rssehat.test', 'Pass1234', 'doctor'),
(16, 'putri16', 'putri16@rssehat.test', 'Pass1234', 'doctor'),
(17, 'raka17', 'raka17@rssehat.test', 'Pass1234', 'doctor'),
(18, 'sari18', 'sari18@rssehat.test', 'Pass1234', 'doctor'),
(19, 'taufik19', 'taufik19@rssehat.test', 'Pass1234', 'doctor'),
(20, 'vina20', 'vina20@rssehat.test', 'Pass1234', 'doctor'),
(21, 'wahyu21', 'wahyu21@rssehat.test', 'Pass1234', 'doctor'),
(22, 'yuni22', 'yuni22@rssehat.test', 'Pass1234', 'patient'),
(23, 'zaki23', 'zaki23@rssehat.test', 'Pass1234', 'patient'),
(24, 'alya24', 'alya24@rssehat.test', 'Pass1234', 'patient'),
(25, 'bagas25', 'bagas25@rssehat.test', 'Pass1234', 'patient'),
(26, 'dimas26', 'dimas26@rssehat.test', 'Pass1234', 'patient'),
(27, 'intan27', 'intan27@rssehat.test', 'Pass1234', 'patient'),
(28, 'rizky28', 'rizky28@rssehat.test', 'Pass1234', 'patient'),
(29, 'nadia29', 'nadia29@rssehat.test', 'Pass1234', 'patient'),
(30, 'yoga30', 'yoga30@rssehat.test', 'Pass1234', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `fk_usersD` (`UserID`);

--
-- Indexes for table `drugs`
--
ALTER TABLE `drugs`
  ADD PRIMARY KEY (`DrugID`);

--
-- Indexes for table `medical_examinations`
--
ALTER TABLE `medical_examinations`
  ADD PRIMARY KEY (`ExamID`),
  ADD KEY `fk_docs` (`DoctorID`),
  ADD KEY `fk_patients` (`PatientID`);

--
-- Indexes for table `medical_prescriptions`
--
ALTER TABLE `medical_prescriptions`
  ADD PRIMARY KEY (`PrescID`),
  ADD KEY `fk_exam` (`ExamID`),
  ADD KEY `fk_drug` (`DrugID`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`PatientID`),
  ADD UNIQUE KEY `PhoneNumber` (`PhoneNumber`),
  ADD KEY `fk_usersP` (`UserID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `DoctorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `drugs`
--
ALTER TABLE `drugs`
  MODIFY `DrugID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `medical_examinations`
--
ALTER TABLE `medical_examinations`
  MODIFY `ExamID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT for table `medical_prescriptions`
--
ALTER TABLE `medical_prescriptions`
  MODIFY `PrescID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `fk_usersD` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_examinations`
--
ALTER TABLE `medical_examinations`
  ADD CONSTRAINT `fk_docs` FOREIGN KEY (`DoctorID`) REFERENCES `doctors` (`DoctorID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_patients` FOREIGN KEY (`PatientID`) REFERENCES `patients` (`PatientID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `medical_prescriptions`
--
ALTER TABLE `medical_prescriptions`
  ADD CONSTRAINT `fk_drug` FOREIGN KEY (`DrugID`) REFERENCES `drugs` (`DrugID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_exam` FOREIGN KEY (`ExamID`) REFERENCES `medical_examinations` (`ExamID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `fk_usersP` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

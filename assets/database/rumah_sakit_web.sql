-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 13, 2026 at 09:48 AM
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
-- Table structure for table `chat_connect`
--

CREATE TABLE `chat_connect` (
  `ConnectID` int(11) NOT NULL,
  `ChatDID` int(11) DEFAULT NULL,
  `ChatPID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
-- Table structure for table `doctor_chat`
--

CREATE TABLE `doctor_chat` (
  `ChatDID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Chat` text DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `HeightCm` decimal(10,0) DEFAULT NULL,
  `status` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_examinations`
--

INSERT INTO `medical_examinations` (`ExamID`, `DoctorID`, `PatientID`, `Examination_date`, `Diagnosis`, `examResult`, `mainIssues`, `action`, `notes`, `BloodPressureSistolik`, `BloodPressureDiastolik`, `pulse`, `temperature`, `WeightKg`, `HeightCm`, `status`) VALUES
(1, 1, 7, '2026-01-05 02:00:00', 'ISPA', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 117, 75, 71, 36.5, 67, 181, 'Accepted'),
(2, 1, 14, '2026-01-06 04:00:00', 'Demam Akut', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 124, 80, 74, 36.6, 89, 176, 'Accepted'),
(3, 1, 21, '2026-01-07 06:00:00', 'Flu', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 131, 85, 77, 36.7, 60, 171, 'Accepted'),
(4, 1, 28, '2026-01-08 08:00:00', 'Dehidrasi Ringan', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 138, 74, 80, 36.8, 82, 166, 'Accepted'),
(5, 1, 35, '2026-01-09 00:00:00', 'Sakit Kepala Tegang', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 114, 79, 83, 36.9, 53, 161, 'Accepted'),
(6, 2, 14, '2026-01-10 02:00:00', 'Gastritis', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 121, 84, 86, 36.4, 93, 180, 'Accepted'),
(7, 2, 21, '2026-01-11 04:00:00', 'Hipertensi', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 128, 73, 89, 36.5, 64, 175, 'Accepted'),
(8, 2, 28, '2026-01-12 06:00:00', 'Diabetes Melitus Tipe 2', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 135, 78, 92, 36.6, 86, 170, 'Accepted'),
(9, 2, 35, '2026-01-13 08:00:00', 'GERD', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 111, 83, 95, 36.7, 57, 165, 'Accepted'),
(10, 2, 42, '2026-01-14 00:00:00', 'Dislipidemia', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 118, 72, 98, 36.8, 79, 160, 'Accepted'),
(11, 3, 20, '2026-01-15 02:00:00', 'ISPA Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 125, 77, 101, 36.9, 65, 174, 'Accepted'),
(12, 3, 21, '2026-01-16 04:00:00', 'Demam Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 132, 82, 69, 36.4, 69, 180, 'Accepted'),
(13, 3, 22, '2026-01-17 06:00:00', 'Gastroenteritis Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 139, 71, 72, 36.5, 73, 145, 'Accepted'),
(14, 3, 23, '2026-01-18 08:00:00', 'Otitis Media', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 115, 76, 75, 36.6, 77, 151, 'Accepted'),
(15, 3, 24, '2026-01-19 00:00:00', 'Dermatitis Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 122, 81, 78, 36.7, 81, 157, 'Accepted'),
(16, 4, 28, '2026-01-20 02:00:00', 'Luka Robek', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 129, 70, 81, 36.8, 94, 178, 'Accepted'),
(17, 4, 35, '2026-01-21 04:00:00', 'Hernia Inguinalis', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 136, 75, 84, 36.9, 65, 173, 'Accepted'),
(18, 4, 42, '2026-01-22 06:00:00', 'Apendisitis', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 112, 80, 87, 36.4, 87, 168, 'Accepted'),
(19, 4, 49, '2026-01-23 08:00:00', 'Abses Kulit', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 119, 85, 90, 36.5, 58, 163, 'Accepted'),
(20, 4, 56, '2026-01-24 00:00:00', 'Luka Bakar Ringan', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 126, 74, 93, 36.6, 80, 158, 'Accepted'),
(21, 5, 35, '2026-01-25 02:00:00', 'Konjungtivitis', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 133, 79, 96, 36.7, 69, 177, 'Accepted'),
(22, 5, 42, '2026-01-26 04:00:00', 'Miopia', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 140, 84, 99, 36.8, 91, 172, 'Accepted'),
(23, 5, 49, '2026-01-27 06:00:00', 'Mata Kering', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 116, 73, 102, 36.9, 62, 167, 'Accepted'),
(24, 5, 56, '2026-01-28 08:00:00', 'Hordeolum', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 123, 78, 70, 36.4, 84, 162, 'Accepted'),
(25, 5, 63, '2026-01-29 00:00:00', 'Blefaritis', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 130, 83, 73, 36.5, 55, 157, 'Accepted'),
(26, 6, 42, '2026-01-30 02:00:00', 'Faringitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 137, 72, 76, 36.6, 95, 176, 'Accepted'),
(27, 6, 49, '2026-01-31 04:00:00', 'Otitis Eksterna', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 113, 77, 79, 36.7, 66, 171, 'Accepted'),
(28, 6, 56, '2026-02-01 06:00:00', 'Sinusitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 120, 82, 82, 36.8, 88, 166, 'Accepted'),
(29, 6, 63, '2026-02-02 08:00:00', 'Rhinitis Alergi', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 127, 71, 85, 36.9, 59, 161, 'Accepted'),
(30, 6, 70, '2026-02-03 00:00:00', 'Tonsilitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 134, 76, 88, 36.4, 81, 156, 'Accepted'),
(31, 7, 49, '2026-02-04 02:00:00', 'Dermatitis', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 110, 81, 91, 36.5, 70, 175, 'Accepted'),
(32, 7, 56, '2026-02-05 04:00:00', 'Tinea Corporis', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 117, 70, 94, 36.6, 92, 170, 'Accepted'),
(33, 7, 63, '2026-02-06 06:00:00', 'Jerawat Inflamasi', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 124, 75, 97, 36.7, 63, 165, 'Accepted'),
(34, 7, 70, '2026-02-07 08:00:00', 'Urtikaria', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 131, 80, 100, 36.8, 85, 160, 'Accepted'),
(35, 7, 7, '2026-02-08 00:00:00', 'Eksim', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 138, 85, 68, 36.9, 50, 174, 'Accepted'),
(36, 8, 56, '2026-02-09 02:00:00', 'Migrain', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 114, 74, 71, 36.4, 45, 174, 'Accepted'),
(37, 8, 63, '2026-02-10 04:00:00', 'Vertigo', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 121, 79, 74, 36.5, 67, 169, 'Accepted'),
(38, 8, 70, '2026-02-11 06:00:00', 'Neuropati Perifer', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 128, 84, 77, 36.6, 89, 164, 'Accepted'),
(39, 8, 7, '2026-02-12 08:00:00', 'Tension Headache', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 135, 73, 80, 36.7, 54, 178, 'Accepted'),
(40, 8, 14, '2026-02-13 00:00:00', 'Neuralgia', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 111, 78, 83, 36.8, 76, 173, 'Accepted'),
(41, 9, 63, '2026-02-14 02:00:00', 'Hipertensi', 'Pemeriksaan kardiovaskular menunjukkan temuan yang perlu dipantau.', 'Keluhan kardiovaskular sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 118, 83, 86, 36.9, 71, 173, 'Accepted'),
(42, 9, 70, '2026-02-15 04:00:00', 'Angina Stabil', 'Pemeriksaan kardiovaskular menunjukkan temuan yang perlu dipantau.', 'Keluhan kardiovaskular sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 125, 72, 89, 36.4, 93, 168, 'Accepted'),
(43, 9, 7, '2026-02-16 06:00:00', 'Aritmia', 'Pemeriksaan kardiovaskular menunjukkan temuan yang perlu dipantau.', 'Keluhan kardiovaskular sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 132, 77, 92, 36.5, 58, 182, 'Accepted'),
(44, 9, 14, '2026-02-17 08:00:00', 'Gagal Jantung', 'Pemeriksaan kardiovaskular menunjukkan temuan yang perlu dipantau.', 'Keluhan kardiovaskular sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 139, 82, 95, 36.6, 80, 177, 'Accepted'),
(45, 9, 21, '2026-02-18 00:00:00', 'Dislipidemia', 'Pemeriksaan kardiovaskular menunjukkan temuan yang perlu dipantau.', 'Keluhan kardiovaskular sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 115, 71, 98, 36.7, 51, 172, 'Accepted'),
(46, 10, 8, '2026-02-19 02:00:00', 'Kehamilan Trimester 1', 'Anamnesis dan pemeriksaan obstetri/ginekologi awal sesuai keluhan.', 'Keluhan reproduksi atau kehamilan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 122, 76, 101, 36.8, 64, 149, 'Accepted'),
(47, 10, 26, '2026-02-20 04:00:00', 'Dismenore', 'Anamnesis dan pemeriksaan obstetri/ginekologi awal sesuai keluhan.', 'Keluhan reproduksi atau kehamilan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 129, 81, 69, 36.9, 68, 158, 'Accepted'),
(48, 10, 28, '2026-02-21 06:00:00', 'PCOS', 'Anamnesis dan pemeriksaan obstetri/ginekologi awal sesuai keluhan.', 'Keluhan reproduksi atau kehamilan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 136, 70, 72, 36.4, 75, 169, 'Accepted'),
(49, 10, 30, '2026-02-22 08:00:00', 'Keputihan', 'Anamnesis dan pemeriksaan obstetri/ginekologi awal sesuai keluhan.', 'Keluhan reproduksi atau kehamilan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 112, 75, 75, 36.5, 82, 180, 'Accepted'),
(50, 10, 32, '2026-02-23 00:00:00', 'Anemia Kehamilan', 'Anamnesis dan pemeriksaan obstetri/ginekologi awal sesuai keluhan.', 'Keluhan reproduksi atau kehamilan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 119, 80, 78, 36.6, 89, 150, 'Accepted'),
(51, 11, 7, '2026-02-24 02:00:00', 'Artritis', 'Pemeriksaan muskuloskeletal menunjukkan temuan sesuai keluhan.', 'Nyeri atau gangguan fungsi sendi/tulang sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 126, 85, 81, 36.7, 66, 149, 'Accepted'),
(52, 11, 14, '2026-02-25 04:00:00', 'Fraktur', 'Pemeriksaan muskuloskeletal menunjukkan temuan sesuai keluhan.', 'Nyeri atau gangguan fungsi sendi/tulang sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 133, 74, 84, 36.8, 88, 185, 'Accepted'),
(53, 11, 21, '2026-02-26 06:00:00', 'Nyeri Punggung', 'Pemeriksaan muskuloskeletal menunjukkan temuan sesuai keluhan.', 'Nyeri atau gangguan fungsi sendi/tulang sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 140, 79, 87, 36.9, 59, 180, 'Accepted'),
(54, 11, 28, '2026-02-27 08:00:00', 'Tendinitis', 'Pemeriksaan muskuloskeletal menunjukkan temuan sesuai keluhan.', 'Nyeri atau gangguan fungsi sendi/tulang sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 116, 84, 90, 36.4, 81, 175, 'Accepted'),
(55, 11, 35, '2026-02-28 00:00:00', 'Osteoartritis', 'Pemeriksaan muskuloskeletal menunjukkan temuan sesuai keluhan.', 'Nyeri atau gangguan fungsi sendi/tulang sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 123, 73, 93, 36.5, 52, 170, 'Accepted'),
(56, 12, 14, '2026-03-01 02:00:00', 'Karies Gigi', 'Pemeriksaan rongga mulut menunjukkan temuan sesuai diagnosis.', 'Nyeri atau keluhan gigi dan gusi sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 130, 78, 96, 36.6, 92, 148, 'Accepted'),
(57, 12, 21, '2026-03-02 04:00:00', 'Gingivitis', 'Pemeriksaan rongga mulut menunjukkan temuan sesuai diagnosis.', 'Nyeri atau keluhan gigi dan gusi sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 137, 83, 99, 36.7, 63, 184, 'Accepted'),
(58, 12, 28, '2026-03-03 06:00:00', 'Pulpitis', 'Pemeriksaan rongga mulut menunjukkan temuan sesuai diagnosis.', 'Nyeri atau keluhan gigi dan gusi sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 113, 72, 102, 36.8, 85, 179, 'Accepted'),
(59, 12, 35, '2026-03-04 08:00:00', 'Abses Gigi', 'Pemeriksaan rongga mulut menunjukkan temuan sesuai diagnosis.', 'Nyeri atau keluhan gigi dan gusi sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 120, 77, 70, 36.9, 56, 174, 'Accepted'),
(60, 12, 42, '2026-03-05 00:00:00', 'Gigi Sensitif', 'Pemeriksaan rongga mulut menunjukkan temuan sesuai diagnosis.', 'Nyeri atau keluhan gigi dan gusi sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 127, 82, 73, 36.4, 78, 169, 'Accepted'),
(61, 13, 21, '2026-03-06 02:00:00', 'ISPA', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 134, 71, 76, 36.5, 67, 147, 'Accepted'),
(62, 13, 28, '2026-03-07 04:00:00', 'Demam Akut', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 110, 76, 79, 36.6, 89, 183, 'Accepted'),
(63, 13, 35, '2026-03-08 06:00:00', 'Flu', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 117, 81, 82, 36.7, 60, 178, 'Accepted'),
(64, 13, 42, '2026-03-09 08:00:00', 'Dehidrasi Ringan', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 124, 70, 85, 36.8, 82, 173, 'Accepted'),
(65, 13, 49, '2026-03-10 00:00:00', 'Sakit Kepala Tegang', 'Pemeriksaan umum menunjukkan kondisi sesuai diagnosis.', 'Keluhan umum pasien sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 131, 75, 88, 36.9, 53, 168, 'Accepted'),
(66, 14, 28, '2026-03-11 02:00:00', 'Gastritis', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 138, 80, 91, 36.4, 93, 146, 'Accepted'),
(67, 14, 35, '2026-03-12 04:00:00', 'Hipertensi', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 114, 85, 94, 36.5, 64, 182, 'Accepted'),
(68, 14, 42, '2026-03-13 06:00:00', 'Diabetes Melitus Tipe 2', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 121, 74, 97, 36.6, 86, 177, 'Accepted'),
(69, 14, 49, '2026-03-14 08:00:00', 'GERD', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 128, 79, 100, 36.7, 57, 172, 'Accepted'),
(70, 14, 56, '2026-03-15 00:00:00', 'Dislipidemia', 'Anamnesis dan pemeriksaan awal mendukung diagnosis.', 'Keluhan metabolik atau penyakit dalam sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 135, 84, 68, 36.8, 79, 167, 'Accepted'),
(71, 15, 14, '2026-03-16 02:00:00', 'ISPA Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 111, 73, 71, 36.9, 56, 163, 'Accepted'),
(72, 15, 15, '2026-03-17 04:00:00', 'Demam Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 118, 78, 74, 36.4, 60, 169, 'Accepted'),
(73, 15, 16, '2026-03-18 06:00:00', 'Gastroenteritis Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 125, 83, 77, 36.5, 64, 175, 'Accepted'),
(74, 15, 17, '2026-03-19 08:00:00', 'Otitis Media', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 132, 72, 80, 36.6, 68, 181, 'Accepted'),
(75, 15, 18, '2026-03-20 00:00:00', 'Dermatitis Anak', 'Pemeriksaan fisik anak menunjukkan temuan sesuai diagnosis.', 'Keluhan pasien anak sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 139, 77, 83, 36.7, 72, 146, 'Accepted'),
(76, 16, 42, '2026-03-21 02:00:00', 'Luka Robek', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 115, 82, 86, 36.8, 94, 185, 'Accepted'),
(77, 16, 49, '2026-03-22 04:00:00', 'Hernia Inguinalis', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 122, 71, 89, 36.9, 65, 180, 'Accepted'),
(78, 16, 56, '2026-03-23 06:00:00', 'Apendisitis', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 129, 76, 92, 36.4, 87, 175, 'Accepted'),
(79, 16, 63, '2026-03-24 08:00:00', 'Abses Kulit', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 136, 81, 95, 36.5, 58, 170, 'Accepted'),
(80, 16, 70, '2026-03-25 00:00:00', 'Luka Bakar Ringan', 'Pemeriksaan bedah menunjukkan temuan sesuai diagnosis.', 'Keluhan cedera atau kondisi bedah sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 112, 70, 98, 36.6, 80, 165, 'Accepted'),
(81, 17, 49, '2026-03-26 02:00:00', 'Konjungtivitis', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 119, 75, 101, 36.7, 69, 184, 'Accepted'),
(82, 17, 56, '2026-03-27 04:00:00', 'Miopia', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 126, 80, 69, 36.8, 91, 179, 'Accepted'),
(83, 17, 63, '2026-03-28 06:00:00', 'Mata Kering', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 133, 85, 72, 36.9, 62, 174, 'Accepted'),
(84, 17, 70, '2026-03-29 08:00:00', 'Hordeolum', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 140, 74, 75, 36.4, 84, 169, 'Accepted'),
(85, 17, 7, '2026-03-30 00:00:00', 'Blefaritis', 'Pemeriksaan mata menunjukkan temuan sesuai keluhan.', 'Keluhan penglihatan atau iritasi mata sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 116, 79, 78, 36.5, 49, 183, 'Accepted'),
(86, 18, 56, '2026-03-31 02:00:00', 'Faringitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 123, 84, 81, 36.6, 95, 183, 'Accepted'),
(87, 18, 63, '2026-04-01 04:00:00', 'Otitis Eksterna', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 130, 73, 84, 36.7, 66, 178, 'Accepted'),
(88, 18, 70, '2026-04-02 06:00:00', 'Sinusitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 137, 78, 87, 36.8, 88, 173, 'Accepted'),
(89, 18, 7, '2026-04-03 08:00:00', 'Rhinitis Alergi', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 113, 83, 90, 36.9, 53, 146, 'Accepted'),
(90, 18, 14, '2026-04-04 00:00:00', 'Tonsilitis', 'Pemeriksaan THT menunjukkan temuan sesuai diagnosis.', 'Keluhan telinga, hidung, atau tenggorokan sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 120, 72, 93, 36.4, 75, 182, 'Accepted'),
(91, 19, 63, '2026-04-05 02:00:00', 'Dermatitis', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 127, 77, 96, 36.5, 70, 182, 'Accepted'),
(92, 19, 70, '2026-04-06 04:00:00', 'Tinea Corporis', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 134, 82, 99, 36.6, 92, 177, 'Accepted'),
(93, 19, 7, '2026-04-07 06:00:00', 'Jerawat Inflamasi', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 110, 71, 102, 36.7, 57, 150, 'Accepted'),
(94, 19, 14, '2026-04-08 08:00:00', 'Urtikaria', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 117, 76, 70, 36.8, 79, 145, 'Accepted'),
(95, 19, 21, '2026-04-09 00:00:00', 'Eksim', 'Pemeriksaan kulit menunjukkan lesi sesuai diagnosis.', 'Gatal, ruam, atau perubahan kulit sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 124, 81, 73, 36.9, 50, 181, 'Accepted'),
(96, 20, 70, '2026-04-10 02:00:00', 'Migrain', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 131, 70, 76, 36.4, 45, 181, 'Accepted'),
(97, 20, 7, '2026-04-11 04:00:00', 'Vertigo', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 138, 75, 79, 36.5, 61, 154, 'Accepted'),
(98, 20, 14, '2026-04-12 06:00:00', 'Neuropati Perifer', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 114, 80, 82, 36.6, 83, 149, 'Accepted'),
(99, 20, 21, '2026-04-13 08:00:00', 'Tension Headache', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 121, 85, 85, 36.7, 54, 185, 'Accepted'),
(100, 20, 28, '2026-04-14 00:00:00', 'Neuralgia', 'Pemeriksaan neurologis awal mendukung diagnosis.', 'Keluhan nyeri kepala, pusing, atau gangguan sensorik sesuai diagnosis.', 'Pemeriksaan lanjutan dan terapi sesuai hasil evaluasi dokter.', 'Ikuti instruksi dokter dan lakukan kontrol sesuai jadwal.', 128, 74, 88, 36.8, 76, 180, 'Accepted');

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
(1, 1, 1, 13, 12, 5, 'Sesuai instruksi dokter'),
(2, 2, 1, 16, 24, 7, 'Sesuai instruksi dokter'),
(3, 2, 16, 19, 8, 10, 'Sesuai instruksi dokter'),
(4, 3, 1, 19, 8, 10, 'Sesuai instruksi dokter'),
(5, 4, 16, 22, 12, 3, 'Sesuai instruksi dokter'),
(6, 4, 1, 25, 24, 5, 'Sesuai instruksi dokter'),
(7, 5, 3, 25, 24, 5, 'Sesuai instruksi dokter'),
(8, 6, 4, 28, 8, 7, 'Sesuai instruksi dokter'),
(9, 6, 9, 10, 12, 10, 'Sesuai instruksi dokter'),
(10, 7, 6, 10, 12, 10, 'Sesuai instruksi dokter'),
(11, 8, 7, 13, 24, 3, 'Sesuai instruksi dokter'),
(12, 8, 35, 16, 8, 5, 'Sesuai instruksi dokter'),
(13, 9, 24, 16, 8, 5, 'Sesuai instruksi dokter'),
(14, 10, 14, 19, 12, 7, 'Sesuai instruksi dokter'),
(15, 10, 35, 22, 24, 10, 'Sesuai instruksi dokter'),
(16, 11, 1, 22, 24, 10, 'Sesuai instruksi dokter'),
(17, 12, 1, 25, 8, 3, 'Sesuai instruksi dokter'),
(18, 12, 16, 28, 12, 5, 'Sesuai instruksi dokter'),
(19, 13, 28, 28, 12, 5, 'Sesuai instruksi dokter'),
(20, 14, 2, 10, 24, 7, 'Sesuai instruksi dokter'),
(21, 14, 1, 13, 8, 10, 'Sesuai instruksi dokter'),
(22, 15, 5, 13, 8, 10, 'Sesuai instruksi dokter'),
(23, 16, 27, 16, 12, 3, 'Sesuai instruksi dokter'),
(24, 16, 1, 19, 24, 5, 'Sesuai instruksi dokter'),
(25, 17, 1, 19, 24, 5, 'Sesuai instruksi dokter'),
(26, 18, 30, 22, 8, 7, 'Sesuai instruksi dokter'),
(27, 18, 1, 25, 12, 10, 'Sesuai instruksi dokter'),
(28, 19, 21, 25, 12, 10, 'Sesuai instruksi dokter'),
(29, 20, 27, 28, 24, 3, 'Sesuai instruksi dokter'),
(30, 20, 1, 10, 8, 5, 'Sesuai instruksi dokter'),
(31, 21, 2, 10, 8, 5, 'Sesuai instruksi dokter'),
(32, 22, 35, 13, 12, 7, 'Sesuai instruksi dokter'),
(33, 23, 35, 16, 24, 10, 'Sesuai instruksi dokter'),
(34, 24, 1, 19, 8, 3, 'Sesuai instruksi dokter'),
(35, 25, 5, 22, 12, 5, 'Sesuai instruksi dokter'),
(36, 26, 2, 25, 24, 7, 'Sesuai instruksi dokter'),
(37, 26, 1, 28, 8, 10, 'Sesuai instruksi dokter'),
(38, 27, 2, 28, 8, 10, 'Sesuai instruksi dokter'),
(39, 28, 2, 10, 12, 3, 'Sesuai instruksi dokter'),
(40, 28, 11, 13, 24, 5, 'Sesuai instruksi dokter'),
(41, 29, 11, 13, 24, 5, 'Sesuai instruksi dokter'),
(42, 30, 2, 16, 8, 7, 'Sesuai instruksi dokter'),
(43, 30, 1, 19, 12, 10, 'Sesuai instruksi dokter'),
(44, 31, 5, 19, 12, 10, 'Sesuai instruksi dokter'),
(45, 32, 25, 22, 24, 3, 'Sesuai instruksi dokter'),
(46, 32, 34, 25, 8, 5, 'Sesuai instruksi dokter'),
(47, 33, 21, 25, 8, 5, 'Sesuai instruksi dokter'),
(48, 34, 5, 28, 12, 7, 'Sesuai instruksi dokter'),
(49, 34, 26, 10, 24, 10, 'Sesuai instruksi dokter'),
(50, 35, 26, 10, 24, 10, 'Sesuai instruksi dokter'),
(51, 36, 17, 13, 8, 3, 'Sesuai instruksi dokter'),
(52, 36, 1, 16, 12, 5, 'Sesuai instruksi dokter'),
(53, 37, 23, 16, 12, 5, 'Sesuai instruksi dokter'),
(54, 38, 15, 19, 24, 7, 'Sesuai instruksi dokter'),
(55, 38, 1, 22, 8, 10, 'Sesuai instruksi dokter'),
(56, 39, 3, 22, 8, 10, 'Sesuai instruksi dokter'),
(57, 40, 31, 25, 12, 3, 'Sesuai instruksi dokter'),
(58, 40, 1, 28, 24, 5, 'Sesuai instruksi dokter'),
(59, 41, 6, 28, 24, 5, 'Sesuai instruksi dokter'),
(60, 42, 6, 10, 8, 7, 'Sesuai instruksi dokter'),
(61, 42, 13, 13, 12, 10, 'Sesuai instruksi dokter'),
(62, 43, 13, 13, 12, 10, 'Sesuai instruksi dokter'),
(63, 44, 19, 16, 24, 3, 'Sesuai instruksi dokter'),
(64, 44, 13, 19, 8, 5, 'Sesuai instruksi dokter'),
(65, 45, 14, 19, 8, 5, 'Sesuai instruksi dokter'),
(66, 46, 35, 22, 12, 7, 'Sesuai instruksi dokter'),
(67, 46, 15, 25, 24, 10, 'Sesuai instruksi dokter'),
(68, 47, 17, 25, 24, 10, 'Sesuai instruksi dokter'),
(69, 48, 7, 28, 8, 3, 'Sesuai instruksi dokter'),
(70, 48, 35, 10, 12, 5, 'Sesuai instruksi dokter'),
(71, 49, 21, 10, 12, 5, 'Sesuai instruksi dokter'),
(72, 50, 15, 13, 24, 7, 'Sesuai instruksi dokter'),
(73, 50, 35, 16, 8, 10, 'Sesuai instruksi dokter'),
(74, 51, 12, 16, 8, 10, 'Sesuai instruksi dokter'),
(75, 52, 12, 19, 12, 3, 'Sesuai instruksi dokter'),
(76, 52, 1, 22, 24, 5, 'Sesuai instruksi dokter'),
(77, 53, 31, 22, 24, 5, 'Sesuai instruksi dokter'),
(78, 54, 3, 25, 8, 7, 'Sesuai instruksi dokter'),
(79, 54, 12, 28, 12, 10, 'Sesuai instruksi dokter'),
(80, 55, 12, 28, 12, 10, 'Sesuai instruksi dokter'),
(81, 56, 1, 10, 24, 3, 'Sesuai instruksi dokter'),
(82, 56, 3, 13, 8, 5, 'Sesuai instruksi dokter'),
(83, 57, 21, 13, 8, 5, 'Sesuai instruksi dokter'),
(84, 58, 3, 16, 12, 7, 'Sesuai instruksi dokter'),
(85, 58, 1, 19, 24, 10, 'Sesuai instruksi dokter'),
(86, 59, 21, 19, 24, 10, 'Sesuai instruksi dokter'),
(87, 60, 1, 22, 8, 3, 'Sesuai instruksi dokter'),
(88, 61, 1, 25, 12, 5, 'Sesuai instruksi dokter'),
(89, 62, 1, 28, 24, 7, 'Sesuai instruksi dokter'),
(90, 62, 16, 10, 8, 10, 'Sesuai instruksi dokter'),
(91, 63, 1, 10, 8, 10, 'Sesuai instruksi dokter'),
(92, 64, 16, 13, 12, 3, 'Sesuai instruksi dokter'),
(93, 64, 1, 16, 24, 5, 'Sesuai instruksi dokter'),
(94, 65, 3, 16, 24, 5, 'Sesuai instruksi dokter'),
(95, 66, 4, 19, 8, 7, 'Sesuai instruksi dokter'),
(96, 66, 9, 22, 12, 10, 'Sesuai instruksi dokter'),
(97, 67, 6, 22, 12, 10, 'Sesuai instruksi dokter'),
(98, 68, 7, 25, 24, 3, 'Sesuai instruksi dokter'),
(99, 68, 35, 28, 8, 5, 'Sesuai instruksi dokter'),
(100, 69, 24, 28, 8, 5, 'Sesuai instruksi dokter'),
(101, 70, 14, 10, 12, 7, 'Sesuai instruksi dokter'),
(102, 70, 35, 13, 24, 10, 'Sesuai instruksi dokter'),
(103, 71, 1, 13, 24, 10, 'Sesuai instruksi dokter'),
(104, 72, 1, 16, 8, 3, 'Sesuai instruksi dokter'),
(105, 72, 16, 19, 12, 5, 'Sesuai instruksi dokter'),
(106, 73, 28, 19, 12, 5, 'Sesuai instruksi dokter'),
(107, 74, 2, 22, 24, 7, 'Sesuai instruksi dokter'),
(108, 74, 1, 25, 8, 10, 'Sesuai instruksi dokter'),
(109, 75, 5, 25, 8, 10, 'Sesuai instruksi dokter'),
(110, 76, 27, 28, 12, 3, 'Sesuai instruksi dokter'),
(111, 76, 1, 10, 24, 5, 'Sesuai instruksi dokter'),
(112, 77, 1, 10, 24, 5, 'Sesuai instruksi dokter'),
(113, 78, 30, 13, 8, 7, 'Sesuai instruksi dokter'),
(114, 78, 1, 16, 12, 10, 'Sesuai instruksi dokter'),
(115, 79, 21, 16, 12, 10, 'Sesuai instruksi dokter'),
(116, 80, 27, 19, 24, 3, 'Sesuai instruksi dokter'),
(117, 80, 1, 22, 8, 5, 'Sesuai instruksi dokter'),
(118, 81, 2, 22, 8, 5, 'Sesuai instruksi dokter'),
(119, 82, 35, 25, 12, 7, 'Sesuai instruksi dokter'),
(120, 83, 35, 28, 24, 10, 'Sesuai instruksi dokter'),
(121, 84, 1, 10, 8, 3, 'Sesuai instruksi dokter'),
(122, 85, 5, 13, 12, 5, 'Sesuai instruksi dokter'),
(123, 86, 2, 16, 24, 7, 'Sesuai instruksi dokter'),
(124, 86, 1, 19, 8, 10, 'Sesuai instruksi dokter'),
(125, 87, 2, 19, 8, 10, 'Sesuai instruksi dokter'),
(126, 88, 2, 22, 12, 3, 'Sesuai instruksi dokter'),
(127, 88, 11, 25, 24, 5, 'Sesuai instruksi dokter'),
(128, 89, 11, 25, 24, 5, 'Sesuai instruksi dokter'),
(129, 90, 2, 28, 8, 7, 'Sesuai instruksi dokter'),
(130, 90, 1, 10, 12, 10, 'Sesuai instruksi dokter'),
(131, 91, 5, 10, 12, 10, 'Sesuai instruksi dokter'),
(132, 92, 25, 13, 24, 3, 'Sesuai instruksi dokter'),
(133, 92, 34, 16, 8, 5, 'Sesuai instruksi dokter'),
(134, 93, 21, 16, 8, 5, 'Sesuai instruksi dokter'),
(135, 94, 5, 19, 12, 7, 'Sesuai instruksi dokter'),
(136, 94, 26, 22, 24, 10, 'Sesuai instruksi dokter'),
(137, 95, 26, 22, 24, 10, 'Sesuai instruksi dokter'),
(138, 96, 17, 25, 8, 3, 'Sesuai instruksi dokter'),
(139, 96, 1, 28, 12, 5, 'Sesuai instruksi dokter'),
(140, 97, 23, 28, 12, 5, 'Sesuai instruksi dokter'),
(141, 98, 15, 10, 24, 7, 'Sesuai instruksi dokter'),
(142, 98, 1, 13, 8, 10, 'Sesuai instruksi dokter'),
(143, 99, 3, 13, 8, 10, 'Sesuai instruksi dokter'),
(144, 100, 31, 16, 12, 3, 'Sesuai instruksi dokter'),
(145, 100, 1, 19, 24, 5, 'Sesuai instruksi dokter');

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
  `UserID` int(11) DEFAULT NULL,
  `Allergy` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `PatientName`, `NIK`, `Email`, `BloodType`, `PhoneNumber`, `Address`, `Gender`, `BirthDate`, `UserID`, `Allergy`) VALUES
(1, 'Andi Pratama', '3471000000000001', 'andi_pratama@rssehat.test', 'A+', '8221000001', 'Jl. Sehat No. 1, Yogyakarta', 'L', '1985-01-01', 22, NULL),
(2, 'Bella Sari', '3471000000000002', 'bella_sari@rssehat.test', 'B+', '8221000002', 'Jl. Sehat No. 2, Yogyakarta', 'P', '1986-02-04', 23, NULL),
(3, 'Cahyo Nugraha', '3471000000000003', 'cahyo_nugraha@rssehat.test', 'O+', '8221000003', 'Jl. Sehat No. 3, Yogyakarta', 'L', '1987-03-07', 24, NULL),
(4, 'Dinda Lestari', '3471000000000004', 'dinda_lestari@rssehat.test', 'AB+', '8221000004', 'Jl. Sehat No. 4, Yogyakarta', 'P', '1988-04-10', 25, NULL),
(5, 'Eko Prasetyo', '3471000000000005', 'eko_prasetyo@rssehat.test', 'A-', '8221000005', 'Jl. Sehat No. 5, Yogyakarta', 'L', '1989-05-13', 26, NULL),
(6, 'Farah Putri', '3471000000000006', 'farah_putri@rssehat.test', 'B-', '8221000006', 'Jl. Sehat No. 6, Yogyakarta', 'P', '1990-06-16', 27, NULL),
(7, 'Galih Ramadhan', '3471000000000007', 'galih_ramadhan@rssehat.test', 'O-', '8221000007', 'Jl. Sehat No. 7, Yogyakarta', 'L', '1991-07-19', 28, 'Amoxicillin'),
(8, 'Hani Kusuma', '3471000000000008', 'hani_kusuma@rssehat.test', 'AB+', '8221000008', 'Jl. Sehat No. 8, Yogyakarta', 'P', '1992-08-22', 29, 'Paracetamol'),
(9, 'Iqbal Maulana', '3471000000000009', 'iqbal_maulana@rssehat.test', 'A+', '8221000009', 'Jl. Sehat No. 9, Yogyakarta', 'L', '1993-09-25', 30, NULL),
(10, 'Nisa Amelia', '3471000000000010', 'nisa_amelia@rssehat.test', 'B+', '8221000010', 'Jl. Sehat No. 10, Yogyakarta', 'P', '2011-10-02', 31, NULL),
(11, 'Rani Oktavia', '3471000000000011', 'rani_oktavia@rssehat.test', 'O+', '8221000011', 'Jl. Sehat No. 11, Yogyakarta', 'L', '2012-11-05', 32, NULL),
(12, 'Salsa Maharani', '3471000000000012', 'salsa_maharani@rssehat.test', 'AB+', '8221000012', 'Jl. Sehat No. 12, Yogyakarta', 'P', '2013-12-08', 33, NULL),
(13, 'Tegar Saputra', '3471000000000013', 'tegar_saputra@rssehat.test', 'A-', '8221000013', 'Jl. Sehat No. 13, Yogyakarta', 'L', '2008-01-11', 34, NULL),
(14, 'Umar Hidayat', '3471000000000014', 'umar_hidayat@rssehat.test', 'B-', '8221000014', 'Jl. Sehat No. 14, Yogyakarta', 'P', '2009-02-14', 35, 'Azithromycin'),
(15, 'Vera Anggraini', '3471000000000015', 'vera_anggraini@rssehat.test', 'O-', '8221000015', 'Jl. Sehat No. 15, Yogyakarta', 'L', '2010-03-17', 36, 'Ibuprofen'),
(16, 'Wira Setiawan', '3471000000000016', 'wira_setiawan@rssehat.test', 'AB+', '8221000016', 'Jl. Sehat No. 16, Yogyakarta', 'P', '2011-04-20', 37, 'Paracetamol'),
(17, 'Yulia Permata', '3471000000000017', 'yulia_permata@rssehat.test', 'A+', '8221000017', 'Jl. Sehat No. 17, Yogyakarta', 'L', '2012-05-23', 38, 'Ibuprofen'),
(18, 'Zahra Putri', '3471000000000018', 'zahra_putri@rssehat.test', 'B+', '8221000018', 'Jl. Sehat No. 18, Yogyakarta', 'P', '2013-06-26', 39, 'Loratadine'),
(19, 'Arman Hidayat', '3471000000000019', 'arman_hidayat@rssehat.test', 'O+', '8221000019', 'Jl. Sehat No. 19, Yogyakarta', 'L', '2008-07-03', 40, NULL),
(20, 'Bima Saputra', '3471000000000020', 'bima_saputra@rssehat.test', 'AB+', '8221000020', 'Jl. Sehat No. 20, Yogyakarta', 'P', '2009-08-06', 41, 'Ibuprofen'),
(21, 'Citra Maharani', '3471000000000021', 'citra_maharani@rssehat.test', 'A-', '8221000021', 'Jl. Sehat No. 21, Yogyakarta', 'L', '2010-09-09', 42, 'Amoxicillin'),
(22, 'Doni Pratama', '3471000000000022', 'doni_pratama@rssehat.test', 'B-', '8221000022', 'Jl. Sehat No. 22, Yogyakarta', 'P', '2011-10-12', 43, 'Paracetamol'),
(23, 'Elsa Wulandari', '3471000000000023', 'elsa_wulandari@rssehat.test', 'O-', '8221000023', 'Jl. Sehat No. 23, Yogyakarta', 'L', '2012-11-15', 44, 'Ibuprofen'),
(24, 'Fikri Ramadhan', '3471000000000024', 'fikri_ramadhan@rssehat.test', 'AB+', '8221000024', 'Jl. Sehat No. 24, Yogyakarta', 'P', '2013-12-18', 45, 'Loratadine'),
(25, 'Gina Lestari', '3471000000000025', 'gina_lestari@rssehat.test', 'A+', '8221000025', 'Jl. Sehat No. 25, Yogyakarta', 'L', '2004-01-21', 46, NULL),
(26, 'Hendra Wijaya', '3471000000000026', 'hendra_wijaya@rssehat.test', 'B+', '8221000026', 'Jl. Sehat No. 26, Yogyakarta', 'P', '2007-02-24', 47, 'Ibuprofen'),
(27, 'Intan Permata', '3471000000000027', 'intan_permata@rssehat.test', 'O+', '8221000027', 'Jl. Sehat No. 27, Yogyakarta', 'L', '1972-03-01', 48, NULL),
(28, 'Jihan Sari', '3471000000000028', 'jihan_sari@rssehat.test', 'AB+', '8221000028', 'Jl. Sehat No. 28, Yogyakarta', 'P', '1975-04-04', 49, 'Amoxicillin'),
(29, 'Kamal Nugroho', '3471000000000029', 'kamal_nugroho@rssehat.test', 'A-', '8221000029', 'Jl. Sehat No. 29, Yogyakarta', 'L', '1978-05-07', 50, NULL),
(30, 'Laila Anggraini', '3471000000000030', 'laila_anggraini@rssehat.test', 'B-', '8221000030', 'Jl. Sehat No. 30, Yogyakarta', 'P', '1981-06-10', 51, 'Amoxicillin'),
(31, 'Miko Setiawan', '3471000000000031', 'miko_setiawan@rssehat.test', 'O-', '8221000031', 'Jl. Sehat No. 31, Yogyakarta', 'L', '1984-07-13', 52, NULL),
(32, 'Nadia Putri', '3471000000000032', 'nadia_putri@rssehat.test', 'AB+', '8221000032', 'Jl. Sehat No. 32, Yogyakarta', 'P', '1987-08-16', 53, 'Amoxicillin'),
(33, 'Oskar Hidayat', '3471000000000033', 'oskar_hidayat@rssehat.test', 'A+', '8221000033', 'Jl. Sehat No. 33, Yogyakarta', 'L', '1990-09-19', 54, NULL),
(34, 'Prita Kusuma', '3471000000000034', 'prita_kusuma@rssehat.test', 'B+', '8221000034', 'Jl. Sehat No. 34, Yogyakarta', 'P', '1993-10-22', 55, NULL),
(35, 'Qori Ramadhan', '3471000000000035', 'qori_ramadhan@rssehat.test', 'O+', '8221000035', 'Jl. Sehat No. 35, Yogyakarta', 'L', '1996-11-25', 56, 'Cefixime'),
(36, 'Rizal Saputra', '3471000000000036', 'rizal_saputra@rssehat.test', 'AB+', '8221000036', 'Jl. Sehat No. 36, Yogyakarta', 'P', '1999-12-02', 57, NULL),
(37, 'Sinta Wibowo', '3471000000000037', 'sinta_wibowo@rssehat.test', 'A-', '8221000037', 'Jl. Sehat No. 37, Yogyakarta', 'L', '2002-01-05', 58, NULL),
(38, 'Tio Maulana', '3471000000000038', 'tio_maulana@rssehat.test', 'B-', '8221000038', 'Jl. Sehat No. 38, Yogyakarta', 'P', '2005-02-08', 59, NULL),
(39, 'Ulya Pratama', '3471000000000039', 'ulya_pratama@rssehat.test', 'O-', '8221000039', 'Jl. Sehat No. 39, Yogyakarta', 'L', '1970-03-11', 60, NULL),
(40, 'Vino Lestari', '3471000000000040', 'vino_lestari@rssehat.test', 'AB+', '8221000040', 'Jl. Sehat No. 40, Yogyakarta', 'P', '1973-04-14', 61, NULL),
(41, 'Wahyu Saputra', '3471000000000041', 'wahyu_saputra@rssehat.test', 'A+', '8221000041', 'Jl. Sehat No. 41, Yogyakarta', 'L', '1976-05-17', 62, NULL),
(42, 'Yani Hidayat', '3471000000000042', 'yani_hidayat@rssehat.test', 'B+', '8221000042', 'Jl. Sehat No. 42, Yogyakarta', 'P', '1979-06-20', 63, 'Ibuprofen'),
(43, 'Zaki Maulana', '3471000000000043', 'zaki_maulana@rssehat.test', 'O+', '8221000043', 'Jl. Sehat No. 43, Yogyakarta', 'L', '1982-07-23', 64, NULL),
(44, 'Alya Pratiwi', '3471000000000044', 'alya_pratiwi@rssehat.test', 'AB+', '8221000044', 'Jl. Sehat No. 44, Yogyakarta', 'P', '1985-08-26', 65, NULL),
(45, 'Bagas Santoso', '3471000000000045', 'bagas_santoso@rssehat.test', 'A-', '8221000045', 'Jl. Sehat No. 45, Yogyakarta', 'L', '1988-09-03', 66, NULL),
(46, 'Dimas Putra', '3471000000000046', 'dimas_putra@rssehat.test', 'B-', '8221000046', 'Jl. Sehat No. 46, Yogyakarta', 'P', '1991-10-06', 67, NULL),
(47, 'Rara Anggraini', '3471000000000047', 'rara_anggraini@rssehat.test', 'O-', '8221000047', 'Jl. Sehat No. 47, Yogyakarta', 'L', '1994-11-09', 68, NULL),
(48, 'Seno Wijaya', '3471000000000048', 'seno_wijaya@rssehat.test', 'AB+', '8221000048', 'Jl. Sehat No. 48, Yogyakarta', 'P', '1997-12-12', 69, NULL),
(49, 'Tasya Permata', '3471000000000049', 'tasya_permata@rssehat.test', 'A+', '8221000049', 'Jl. Sehat No. 49, Yogyakarta', 'L', '2000-01-15', 70, 'Diclofenac'),
(50, 'Umar Nugroho', '3471000000000050', 'umar_nugroho@rssehat.test', 'B+', '8221000050', 'Jl. Sehat No. 50, Yogyakarta', 'P', '2003-02-18', 71, NULL),
(51, 'Vira Ramadhan', '3471000000000051', 'vira_ramadhan@rssehat.test', 'O+', '8221000051', 'Jl. Sehat No. 51, Yogyakarta', 'L', '2006-03-21', 72, NULL),
(52, 'Yoga Pratama', '3471000000000052', 'yoga_pratama@rssehat.test', 'AB+', '8221000052', 'Jl. Sehat No. 52, Yogyakarta', 'P', '1971-04-24', 73, NULL),
(53, 'Zahra Lestari', '3471000000000053', 'zahra_lestari@rssehat.test', 'A-', '8221000053', 'Jl. Sehat No. 53, Yogyakarta', 'L', '1974-05-01', 74, NULL),
(54, 'Arif Santoso', '3471000000000054', 'arif_santoso@rssehat.test', 'B-', '8221000054', 'Jl. Sehat No. 54, Yogyakarta', 'P', '1977-06-04', 75, NULL),
(55, 'Bella Wijaya', '3471000000000055', 'bella_wijaya@rssehat.test', 'O-', '8221000055', 'Jl. Sehat No. 55, Yogyakarta', 'L', '1980-07-07', 76, NULL),
(56, 'Candra Sari', '3471000000000056', 'candra_sari@rssehat.test', 'AB+', '8221000056', 'Jl. Sehat No. 56, Yogyakarta', 'P', '1983-08-10', 77, 'Ibuprofen'),
(57, 'Dewi Maulana', '3471000000000057', 'dewi_maulana@rssehat.test', 'A+', '8221000057', 'Jl. Sehat No. 57, Yogyakarta', 'L', '1986-09-13', 78, NULL),
(58, 'Fajar Nugroho', '3471000000000058', 'fajar_nugroho@rssehat.test', 'B+', '8221000058', 'Jl. Sehat No. 58, Yogyakarta', 'P', '1989-10-16', 79, NULL),
(59, 'Gita Pratama', '3471000000000059', 'gita_pratama@rssehat.test', 'O+', '8221000059', 'Jl. Sehat No. 59, Yogyakarta', 'L', '1992-11-19', 80, NULL),
(60, 'Hana Lestari', '3471000000000060', 'hana_lestari@rssehat.test', 'AB+', '8221000060', 'Jl. Sehat No. 60, Yogyakarta', 'P', '1995-12-22', 81, NULL),
(61, 'Indra Saputra', '3471000000000061', 'indra_saputra@rssehat.test', 'A-', '8221000061', 'Jl. Sehat No. 61, Yogyakarta', 'L', '1998-01-25', 82, NULL),
(62, 'Joko Permata', '3471000000000062', 'joko_permata@rssehat.test', 'B-', '8221000062', 'Jl. Sehat No. 62, Yogyakarta', 'P', '2001-02-02', 83, NULL),
(63, 'Karin Ramadhan', '3471000000000063', 'karin_ramadhan@rssehat.test', 'O-', '8221000063', 'Jl. Sehat No. 63, Yogyakarta', 'L', '2004-03-05', 84, 'Ibuprofen'),
(64, 'Lina Putri', '3471000000000064', 'lina_putri@rssehat.test', 'AB+', '8221000064', 'Jl. Sehat No. 64, Yogyakarta', 'P', '2007-04-08', 85, NULL),
(65, 'Maya Wibowo', '3471000000000065', 'maya_wibowo@rssehat.test', 'A+', '8221000065', 'Jl. Sehat No. 65, Yogyakarta', 'L', '1972-05-11', 86, NULL),
(66, 'Nanda Sari', '3471000000000066', 'nanda_sari@rssehat.test', 'B+', '8221000066', 'Jl. Sehat No. 66, Yogyakarta', 'P', '1975-06-14', 87, NULL),
(67, 'Oki Hidayat', '3471000000000067', 'oki_hidayat@rssehat.test', 'O+', '8221000067', 'Jl. Sehat No. 67, Yogyakarta', 'L', '1978-07-17', 88, NULL),
(68, 'Putri Maulana', '3471000000000068', 'putri_maulana@rssehat.test', 'AB+', '8221000068', 'Jl. Sehat No. 68, Yogyakarta', 'P', '1981-08-20', 89, NULL),
(69, 'Raka Pratama', '3471000000000069', 'raka_pratama@rssehat.test', 'A-', '8221000069', 'Jl. Sehat No. 69, Yogyakarta', 'L', '1984-09-23', 90, NULL),
(70, 'Sari Lestari', '3471000000000070', 'sari_lestari@rssehat.test', 'B-', '8221000070', 'Jl. Sehat No. 70, Yogyakarta', 'P', '1987-10-26', 91, 'Cefixime');

-- --------------------------------------------------------

--
-- Table structure for table `patient_chat`
--

CREATE TABLE `patient_chat` (
  `ChatPID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `Chat` text DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
(1, 'admin', 'admin@rssehat.test', 'Pass1234', 'admin'),
(2, 'gita_saputra', 'gita_saputra@rssehat.test', 'Pass1234', 'doctor'),
(3, 'hana_wijaya', 'hana_wijaya@rssehat.test', 'Pass1234', 'doctor'),
(4, 'indra_lestari', 'indra_lestari@rssehat.test', 'Pass1234', 'doctor'),
(5, 'joko_hidayat', 'joko_hidayat@rssehat.test', 'Pass1234', 'doctor'),
(6, 'karin_permata', 'karin_permata@rssehat.test', 'Pass1234', 'doctor'),
(7, 'lina_santoso', 'lina_santoso@rssehat.test', 'Pass1234', 'doctor'),
(8, 'maya_kusuma', 'maya_kusuma@rssehat.test', 'Pass1234', 'doctor'),
(9, 'nanda_nugroho', 'nanda_nugroho@rssehat.test', 'Pass1234', 'doctor'),
(10, 'oki_sari', 'oki_sari@rssehat.test', 'Pass1234', 'doctor'),
(11, 'putri_wibowo', 'putri_wibowo@rssehat.test', 'Pass1234', 'doctor'),
(12, 'raka_ramadhan', 'raka_ramadhan@rssehat.test', 'Pass1234', 'doctor'),
(13, 'sari_setiawan', 'sari_setiawan@rssehat.test', 'Pass1234', 'doctor'),
(14, 'taufik_maulana', 'taufik_maulana@rssehat.test', 'Pass1234', 'doctor'),
(15, 'vina_putra', 'vina_putra@rssehat.test', 'Pass1234', 'doctor'),
(16, 'wahyu_anggraini', 'wahyu_anggraini@rssehat.test', 'Pass1234', 'doctor'),
(17, 'yuni_pratama', 'yuni_pratama@rssehat.test', 'Pass1234', 'doctor'),
(18, 'zaki_saputra', 'zaki_saputra@rssehat.test', 'Pass1234', 'doctor'),
(19, 'alya_wijaya', 'alya_wijaya@rssehat.test', 'Pass1234', 'doctor'),
(20, 'bagas_lestari', 'bagas_lestari@rssehat.test', 'Pass1234', 'doctor'),
(21, 'dimas_hidayat', 'dimas_hidayat@rssehat.test', 'Pass1234', 'doctor'),
(22, 'andi_pratama', 'andi_pratama@rssehat.test', 'Pass1234', 'patient'),
(23, 'bella_sari', 'bella_sari@rssehat.test', 'Pass1234', 'patient'),
(24, 'cahyo_nugraha', 'cahyo_nugraha@rssehat.test', 'Pass1234', 'patient'),
(25, 'dinda_lestari', 'dinda_lestari@rssehat.test', 'Pass1234', 'patient'),
(26, 'eko_prasetyo', 'eko_prasetyo@rssehat.test', 'Pass1234', 'patient'),
(27, 'farah_putri', 'farah_putri@rssehat.test', 'Pass1234', 'patient'),
(28, 'galih_ramadhan', 'galih_ramadhan@rssehat.test', 'Pass1234', 'patient'),
(29, 'hani_kusuma', 'hani_kusuma@rssehat.test', 'Pass1234', 'patient'),
(30, 'iqbal_maulana', 'iqbal_maulana@rssehat.test', 'Pass1234', 'patient'),
(31, 'nisa_amelia', 'nisa_amelia@rssehat.test', 'Pass1234', 'patient'),
(32, 'rani_oktavia', 'rani_oktavia@rssehat.test', 'Pass1234', 'patient'),
(33, 'salsa_maharani', 'salsa_maharani@rssehat.test', 'Pass1234', 'patient'),
(34, 'tegar_saputra', 'tegar_saputra@rssehat.test', 'Pass1234', 'patient'),
(35, 'umar_hidayat', 'umar_hidayat@rssehat.test', 'Pass1234', 'patient'),
(36, 'vera_anggraini', 'vera_anggraini@rssehat.test', 'Pass1234', 'patient'),
(37, 'wira_setiawan', 'wira_setiawan@rssehat.test', 'Pass1234', 'patient'),
(38, 'yulia_permata', 'yulia_permata@rssehat.test', 'Pass1234', 'patient'),
(39, 'zahra_putri', 'zahra_putri@rssehat.test', 'Pass1234', 'patient'),
(40, 'arman_hidayat', 'arman_hidayat@rssehat.test', 'Pass1234', 'patient'),
(41, 'bima_saputra', 'bima_saputra@rssehat.test', 'Pass1234', 'patient'),
(42, 'citra_maharani', 'citra_maharani@rssehat.test', 'Pass1234', 'patient'),
(43, 'doni_pratama', 'doni_pratama@rssehat.test', 'Pass1234', 'patient'),
(44, 'elsa_wulandari', 'elsa_wulandari@rssehat.test', 'Pass1234', 'patient'),
(45, 'fikri_ramadhan', 'fikri_ramadhan@rssehat.test', 'Pass1234', 'patient'),
(46, 'gina_lestari', 'gina_lestari@rssehat.test', 'Pass1234', 'patient'),
(47, 'hendra_wijaya', 'hendra_wijaya@rssehat.test', 'Pass1234', 'patient'),
(48, 'intan_permata', 'intan_permata@rssehat.test', 'Pass1234', 'patient'),
(49, 'jihan_sari', 'jihan_sari@rssehat.test', 'Pass1234', 'patient'),
(50, 'kamal_nugroho', 'kamal_nugroho@rssehat.test', 'Pass1234', 'patient'),
(51, 'laila_anggraini', 'laila_anggraini@rssehat.test', 'Pass1234', 'patient'),
(52, 'miko_setiawan', 'miko_setiawan@rssehat.test', 'Pass1234', 'patient'),
(53, 'nadia_putri', 'nadia_putri@rssehat.test', 'Pass1234', 'patient'),
(54, 'oskar_hidayat', 'oskar_hidayat@rssehat.test', 'Pass1234', 'patient'),
(55, 'prita_kusuma', 'prita_kusuma@rssehat.test', 'Pass1234', 'patient'),
(56, 'qori_ramadhan', 'qori_ramadhan@rssehat.test', 'Pass1234', 'patient'),
(57, 'rizal_saputra', 'rizal_saputra@rssehat.test', 'Pass1234', 'patient'),
(58, 'sinta_wibowo', 'sinta_wibowo@rssehat.test', 'Pass1234', 'patient'),
(59, 'tio_maulana', 'tio_maulana@rssehat.test', 'Pass1234', 'patient'),
(60, 'ulya_pratama', 'ulya_pratama@rssehat.test', 'Pass1234', 'patient'),
(61, 'vino_lestari', 'vino_lestari@rssehat.test', 'Pass1234', 'patient'),
(62, 'wahyu_saputra', 'wahyu_saputra@rssehat.test', 'Pass1234', 'patient'),
(63, 'yani_hidayat', 'yani_hidayat@rssehat.test', 'Pass1234', 'patient'),
(64, 'zaki_maulana', 'zaki_maulana@rssehat.test', 'Pass1234', 'patient'),
(65, 'alya_pratiwi', 'alya_pratiwi@rssehat.test', 'Pass1234', 'patient'),
(66, 'bagas_santoso', 'bagas_santoso@rssehat.test', 'Pass1234', 'patient'),
(67, 'dimas_putra', 'dimas_putra@rssehat.test', 'Pass1234', 'patient'),
(68, 'rara_anggraini', 'rara_anggraini@rssehat.test', 'Pass1234', 'patient'),
(69, 'seno_wijaya', 'seno_wijaya@rssehat.test', 'Pass1234', 'patient'),
(70, 'tasya_permata', 'tasya_permata@rssehat.test', 'Pass1234', 'patient'),
(71, 'umar_nugroho', 'umar_nugroho@rssehat.test', 'Pass1234', 'patient'),
(72, 'vira_ramadhan', 'vira_ramadhan@rssehat.test', 'Pass1234', 'patient'),
(73, 'yoga_pratama', 'yoga_pratama@rssehat.test', 'Pass1234', 'patient'),
(74, 'zahra_lestari', 'zahra_lestari@rssehat.test', 'Pass1234', 'patient'),
(75, 'arif_santoso', 'arif_santoso@rssehat.test', 'Pass1234', 'patient'),
(76, 'bella_wijaya', 'bella_wijaya@rssehat.test', 'Pass1234', 'patient'),
(77, 'candra_sari', 'candra_sari@rssehat.test', 'Pass1234', 'patient'),
(78, 'dewi_maulana', 'dewi_maulana@rssehat.test', 'Pass1234', 'patient'),
(79, 'fajar_nugroho', 'fajar_nugroho@rssehat.test', 'Pass1234', 'patient'),
(80, 'gita_pratama', 'gita_pratama@rssehat.test', 'Pass1234', 'patient'),
(81, 'hana_lestari', 'hana_lestari@rssehat.test', 'Pass1234', 'patient'),
(82, 'indra_saputra', 'indra_saputra@rssehat.test', 'Pass1234', 'patient'),
(83, 'joko_permata', 'joko_permata@rssehat.test', 'Pass1234', 'patient'),
(84, 'karin_ramadhan', 'karin_ramadhan@rssehat.test', 'Pass1234', 'patient'),
(85, 'lina_putri', 'lina_putri@rssehat.test', 'Pass1234', 'patient'),
(86, 'maya_wibowo', 'maya_wibowo@rssehat.test', 'Pass1234', 'patient'),
(87, 'nanda_sari', 'nanda_sari@rssehat.test', 'Pass1234', 'patient'),
(88, 'oki_hidayat', 'oki_hidayat@rssehat.test', 'Pass1234', 'patient'),
(89, 'putri_maulana', 'putri_maulana@rssehat.test', 'Pass1234', 'patient'),
(90, 'raka_pratama', 'raka_pratama@rssehat.test', 'Pass1234', 'patient'),
(91, 'sari_lestari', 'sari_lestari@rssehat.test', 'Pass1234', 'patient');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chat_connect`
--
ALTER TABLE `chat_connect`
  ADD PRIMARY KEY (`ConnectID`),
  ADD KEY `fk_conn` (`ChatDID`),
  ADD KEY `fk_connP` (`ChatPID`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`DoctorID`),
  ADD KEY `fk_usersD` (`UserID`);

--
-- Indexes for table `doctor_chat`
--
ALTER TABLE `doctor_chat`
  ADD PRIMARY KEY (`ChatDID`),
  ADD KEY `fk_chd` (`UserID`);

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
-- Indexes for table `patient_chat`
--
ALTER TABLE `patient_chat`
  ADD PRIMARY KEY (`ChatPID`),
  ADD KEY `fk_chp` (`UserID`);

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
  MODIFY `PrescID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=146;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `PatientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chat_connect`
--
ALTER TABLE `chat_connect`
  ADD CONSTRAINT `fk_conn` FOREIGN KEY (`ChatDID`) REFERENCES `doctor_chat` (`ChatDID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_connP` FOREIGN KEY (`ChatPID`) REFERENCES `patient_chat` (`ChatPID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `fk_usersD` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `doctor_chat`
--
ALTER TABLE `doctor_chat`
  ADD CONSTRAINT `fk_chd` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;

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

--
-- Constraints for table `patient_chat`
--
ALTER TABLE `patient_chat`
  ADD CONSTRAINT `fk_chp` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

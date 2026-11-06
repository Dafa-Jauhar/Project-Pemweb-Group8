-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2026 at 11:48 AM
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
  `RegistrationNumber` char(17) DEFAULT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`DoctorID`, `DoctorName`, `Speciality`, `PhoneNumber`, `RegistrationNumber`, `UserID`) VALUES
(1, 'dr. Gita Saputra', 'Umum', '081210000001', 'REG-2026-00001', 2),
(2, 'dr. Hana Wijaya', 'Penyakit Dalam', '081210000002', 'REG-2026-00002', 3),
(3, 'dr. Indra Lestari', 'Anak', '081210000003', 'REG-2026-00003', 4),
(4, 'dr. Joko Hidayat', 'Bedah', '081210000004', 'REG-2026-00004', 5),
(5, 'dr. Karin Permata', 'Mata', '081210000005', 'REG-2026-00005', 6),
(6, 'dr. Lina Santoso', 'THT', '081210000006', 'REG-2026-00006', 7),
(7, 'dr. Maya Kusuma', 'Kulit', '081210000007', 'REG-2026-00007', 8),
(8, 'dr. Nanda Nugroho', 'Saraf', '081210000008', 'REG-2026-00008', 9),
(9, 'dr. Oki Sari', 'Jantung', '081210000009', 'REG-2026-00009', 10),
(10, 'dr. Putri Wibowo', 'Obgyn', '081210000010', 'REG-2026-00010', 11),
(11, 'dr. Raka Ramadhan', 'Orthopedi', '081210000011', 'REG-2026-00011', 12),
(12, 'dr. Sari Setiawan', 'Gigi', '081210000012', 'REG-2026-00012', 13),
(13, 'dr. Taufik Maulana', 'Umum', '081210000013', 'REG-2026-00013', 14),
(14, 'dr. Vina Putra', 'Penyakit Dalam', '081210000014', 'REG-2026-00014', 15),
(15, 'dr. Wahyu Anggraini', 'Anak', '081210000015', 'REG-2026-00015', 16),
(16, 'dr. Yuni Pratama', 'Bedah', '081210000016', 'REG-2026-00016', 17),
(17, 'dr. Zaki Saputra', 'Mata', '081210000017', 'REG-2026-00017', 18),
(18, 'dr. Alya Wijaya', 'THT', '081210000018', 'REG-2026-00018', 19),
(19, 'dr. Bagas Lestari', 'Kulit', '081210000019', 'REG-2026-00019', 20),
(20, 'dr. Dimas Hidayat', 'Saraf', '081210000020', 'REG-2026-00020', 21);

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE `drugs` (
  `DrugID` int(11) NOT NULL,
  `DrugName` varchar(30) NOT NULL,
  `Price` decimal(10,0) DEFAULT NULL,
  `Stock` int(11) DEFAULT NULL,
  `DrugType` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`DrugID`, `DrugName`, `Price`, `Stock`, `DrugType`) VALUES
(1, 'Paracetamol', 5000, 120, 'Tablet'),
(2, 'Amoxicillin', 12000, 80, 'Kapsul'),
(3, 'Ibuprofen', 9000, 95, 'Tablet'),
(4, 'Omeprazole', 11000, 70, 'Kapsul'),
(5, 'Cetirizine', 7000, 110, 'Tablet'),
(6, 'Amlodipine', 8000, 90, 'Tablet'),
(7, 'Metformin', 8500, 100, 'Tablet'),
(8, 'Salbutamol', 15000, 55, 'Tablet'),
(9, 'Antasida', 6000, 130, 'Tablet'),
(10, 'Ambroxol', 7500, 75, 'Sirup'),
(11, 'Loratadine', 8500, 65, 'Tablet'),
(12, 'Diclofenac', 10000, 60, 'Tablet'),
(13, 'Captopril', 6500, 85, 'Tablet'),
(14, 'Simvastatin', 9500, 72, 'Tablet'),
(15, 'Vitamin B Complex', 10000, 140, 'Tablet'),
(16, 'ORS', 4000, 150, 'Sachet'),
(17, 'Mefenamic Acid', 9000, 88, 'Tablet'),
(18, 'Dexamethasone', 5000, 50, 'Tablet'),
(19, 'Furosemide', 7000, 45, 'Tablet'),
(20, 'Ranitidine', 6500, 40, 'Tablet'),
(21, 'Clindamycin', 16000, 35, 'Kapsul'),
(22, 'Azithromycin', 18000, 42, 'Tablet'),
(23, 'Domperidone', 7500, 58, 'Tablet'),
(24, 'Lansoprazole', 12000, 47, 'Kapsul'),
(25, 'Ketoconazole', 14000, 33, 'Krim'),
(26, 'Betamethasone', 11000, 30, 'Krim'),
(27, 'Povidone Iodine', 13000, 52, 'Cairan'),
(28, 'Oralit', 4500, 90, 'Sachet'),
(29, 'Bromhexine', 8500, 49, 'Sirup'),
(30, 'Cefixime', 22000, 38, 'Kapsul'),
(31, 'Naproxen', 12000, 41, 'Tablet'),
(32, 'Insulin Glargine', 95000, 18, 'Injeksi'),
(33, 'Lidocaine', 25000, 25, 'Injeksi'),
(34, 'Miconazole', 12500, 36, 'Krim'),
(35, 'Vitamin D3', 11500, 67, 'Tablet');

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
  `BloodPressureSistolik` int(11) DEFAULT NULL,
  `BloodPressureDiastolik` int(11) DEFAULT NULL,
  `WeightKg` decimal(10,0) DEFAULT NULL,
  `HeightCm` decimal(10,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_examinations`
--

INSERT INTO `medical_examinations` (`ExamID`, `DoctorID`, `PatientID`, `Examination_date`, `Diagnosis`, `BloodPressureSistolik`, `BloodPressureDiastolik`, `WeightKg`, `HeightCm`) VALUES
(1, 1, 7, '2026-01-05 11:00:00', 'ISPA', 107, 70, 48, 149),
(2, 2, 14, '2026-01-06 14:00:00', 'Gastritis', 114, 75, 51, 153),
(3, 3, 21, '2026-01-07 08:00:00', 'Hipertensi', 121, 80, 54, 157),
(4, 4, 28, '2026-01-08 11:00:00', 'Diabetes Melitus Tipe 2', 128, 85, 57, 161),
(5, 5, 35, '2026-01-09 14:00:00', 'Demam', 135, 65, 60, 165),
(6, 6, 42, '2026-01-10 08:00:00', 'Migrain', 142, 70, 63, 169),
(7, 7, 49, '2026-01-11 11:00:00', 'Dermatitis', 104, 75, 66, 173),
(8, 8, 56, '2026-01-12 14:00:00', 'Faringitis', 111, 80, 69, 177),
(9, 9, 63, '2026-01-13 08:00:00', 'Artritis', 118, 85, 72, 181),
(10, 10, 70, '2026-01-14 11:00:00', 'Konjungtivitis', 125, 65, 75, 185),
(11, 11, 7, '2026-01-15 14:00:00', 'Asma', 132, 70, 78, 189),
(12, 12, 14, '2026-01-16 08:00:00', 'Diare', 139, 75, 81, 148),
(13, 13, 21, '2026-01-17 11:00:00', 'Infeksi Saluran Kemih', 101, 80, 84, 152),
(14, 14, 28, '2026-01-18 14:00:00', 'Anemia', 108, 85, 87, 156),
(15, 15, 35, '2026-01-19 08:00:00', 'Flu', 115, 65, 90, 160),
(16, 16, 42, '2026-01-20 11:00:00', 'ISPA', 122, 70, 93, 164),
(17, 17, 49, '2026-01-21 14:00:00', 'Gastritis', 129, 75, 46, 168),
(18, 18, 56, '2026-01-22 08:00:00', 'Hipertensi', 136, 80, 49, 172),
(19, 19, 63, '2026-01-23 11:00:00', 'Diabetes Melitus Tipe 2', 143, 85, 52, 176),
(20, 20, 70, '2026-01-24 14:00:00', 'Demam', 105, 65, 55, 180),
(21, 1, 7, '2026-01-25 08:00:00', 'Migrain', 112, 70, 58, 184),
(22, 2, 14, '2026-01-26 11:00:00', 'Dermatitis', 119, 75, 61, 188),
(23, 3, 21, '2026-01-27 14:00:00', 'Faringitis', 126, 80, 64, 147),
(24, 4, 28, '2026-01-28 08:00:00', 'Artritis', 133, 85, 67, 151),
(25, 5, 35, '2026-01-29 11:00:00', 'Konjungtivitis', 140, 65, 70, 155),
(26, 6, 42, '2026-01-30 14:00:00', 'Asma', 102, 70, 73, 159),
(27, 7, 49, '2026-01-31 08:00:00', 'Diare', 109, 75, 76, 163),
(28, 8, 56, '2026-02-01 11:00:00', 'Infeksi Saluran Kemih', 116, 80, 79, 167),
(29, 9, 63, '2026-02-02 14:00:00', 'Anemia', 123, 85, 82, 171),
(30, 10, 70, '2026-02-03 08:00:00', 'Flu', 130, 65, 85, 175),
(31, 11, 7, '2026-02-04 11:00:00', 'ISPA', 137, 70, 88, 179),
(32, 12, 14, '2026-02-05 14:00:00', 'Gastritis', 144, 75, 91, 183),
(33, 13, 21, '2026-02-06 08:00:00', 'Hipertensi', 106, 80, 94, 187),
(34, 14, 28, '2026-02-07 11:00:00', 'Diabetes Melitus Tipe 2', 113, 85, 47, 146),
(35, 15, 35, '2026-02-08 14:00:00', 'Demam', 120, 65, 50, 150),
(36, 16, 42, '2026-02-09 08:00:00', 'Migrain', 127, 70, 53, 154),
(37, 17, 49, '2026-02-10 11:00:00', 'Dermatitis', 134, 75, 56, 158),
(38, 18, 56, '2026-02-11 14:00:00', 'Faringitis', 141, 80, 59, 162),
(39, 19, 63, '2026-02-12 08:00:00', 'Artritis', 103, 85, 62, 166),
(40, 20, 70, '2026-02-13 11:00:00', 'Konjungtivitis', 110, 65, 65, 170),
(41, 1, 7, '2026-02-14 14:00:00', 'Asma', 117, 70, 68, 174),
(42, 2, 14, '2026-02-15 08:00:00', 'Diare', 124, 75, 71, 178),
(43, 3, 21, '2026-02-16 11:00:00', 'Infeksi Saluran Kemih', 131, 80, 74, 182),
(44, 4, 28, '2026-02-17 14:00:00', 'Anemia', 138, 85, 77, 186),
(45, 5, 35, '2026-02-18 08:00:00', 'Flu', 100, 65, 80, 145),
(46, 6, 42, '2026-02-19 11:00:00', 'ISPA', 107, 70, 83, 149),
(47, 7, 49, '2026-02-20 14:00:00', 'Gastritis', 114, 75, 86, 153),
(48, 8, 56, '2026-02-21 08:00:00', 'Hipertensi', 121, 80, 89, 157),
(49, 9, 63, '2026-02-22 11:00:00', 'Diabetes Melitus Tipe 2', 128, 85, 92, 161),
(50, 10, 70, '2026-02-23 14:00:00', 'Demam', 135, 65, 45, 165),
(51, 11, 7, '2026-02-24 08:00:00', 'Migrain', 142, 70, 48, 169),
(52, 12, 14, '2026-02-25 11:00:00', 'Dermatitis', 104, 75, 51, 173),
(53, 13, 21, '2026-02-26 14:00:00', 'Faringitis', 111, 80, 54, 177),
(54, 14, 28, '2026-02-27 08:00:00', 'Artritis', 118, 85, 57, 181),
(55, 15, 35, '2026-02-28 11:00:00', 'Konjungtivitis', 125, 65, 60, 185),
(56, 16, 42, '2026-03-01 14:00:00', 'Asma', 132, 70, 63, 189),
(57, 17, 49, '2026-03-02 08:00:00', 'Diare', 139, 75, 66, 148),
(58, 18, 56, '2026-03-03 11:00:00', 'Infeksi Saluran Kemih', 101, 80, 69, 152),
(59, 19, 63, '2026-03-04 14:00:00', 'Anemia', 108, 85, 72, 156),
(60, 20, 70, '2026-03-05 08:00:00', 'Flu', 115, 65, 75, 160),
(61, 1, 7, '2026-03-06 11:00:00', 'ISPA', 122, 70, 78, 164),
(62, 2, 14, '2026-03-07 14:00:00', 'Gastritis', 129, 75, 81, 168),
(63, 3, 21, '2026-03-08 08:00:00', 'Hipertensi', 136, 80, 84, 172),
(64, 4, 28, '2026-03-09 11:00:00', 'Diabetes Melitus Tipe 2', 143, 85, 87, 176),
(65, 5, 35, '2026-03-10 14:00:00', 'Demam', 105, 65, 90, 180),
(66, 6, 42, '2026-03-11 08:00:00', 'Migrain', 112, 70, 93, 184),
(67, 7, 49, '2026-03-12 11:00:00', 'Dermatitis', 119, 75, 46, 188),
(68, 8, 56, '2026-03-13 14:00:00', 'Faringitis', 126, 80, 49, 147),
(69, 9, 63, '2026-03-14 08:00:00', 'Artritis', 133, 85, 52, 151),
(70, 10, 70, '2026-03-15 11:00:00', 'Konjungtivitis', 140, 65, 55, 155),
(71, 11, 7, '2026-03-16 14:00:00', 'Asma', 102, 70, 58, 159),
(72, 12, 14, '2026-03-17 08:00:00', 'Diare', 109, 75, 61, 163),
(73, 13, 21, '2026-03-18 11:00:00', 'Infeksi Saluran Kemih', 116, 80, 64, 167),
(74, 14, 28, '2026-03-19 14:00:00', 'Anemia', 123, 85, 67, 171),
(75, 15, 35, '2026-03-20 08:00:00', 'Flu', 130, 65, 70, 175),
(76, 16, 42, '2026-03-21 11:00:00', 'ISPA', 137, 70, 73, 179),
(77, 17, 49, '2026-03-22 14:00:00', 'Gastritis', 144, 75, 76, 183),
(78, 18, 56, '2026-03-23 08:00:00', 'Hipertensi', 106, 80, 79, 187),
(79, 19, 63, '2026-03-24 11:00:00', 'Diabetes Melitus Tipe 2', 113, 85, 82, 146),
(80, 20, 70, '2026-03-25 14:00:00', 'Demam', 120, 65, 85, 150),
(81, 1, 7, '2026-03-26 08:00:00', 'Migrain', 127, 70, 88, 154),
(82, 2, 14, '2026-03-27 11:00:00', 'Dermatitis', 134, 75, 91, 158),
(83, 3, 21, '2026-03-28 14:00:00', 'Faringitis', 141, 80, 94, 162),
(84, 4, 28, '2026-03-29 08:00:00', 'Artritis', 103, 85, 47, 166),
(85, 5, 35, '2026-03-30 11:00:00', 'Konjungtivitis', 110, 65, 50, 170),
(86, 6, 42, '2026-03-31 14:00:00', 'Asma', 117, 70, 53, 174),
(87, 7, 49, '2026-04-01 08:00:00', 'Diare', 124, 75, 56, 178),
(88, 8, 56, '2026-04-02 11:00:00', 'Infeksi Saluran Kemih', 131, 80, 59, 182),
(89, 9, 63, '2026-04-03 14:00:00', 'Anemia', 138, 85, 62, 186),
(90, 10, 70, '2026-04-04 08:00:00', 'Flu', 100, 65, 65, 145),
(91, 11, 7, '2026-04-05 11:00:00', 'ISPA', 107, 70, 68, 149),
(92, 12, 14, '2026-04-06 14:00:00', 'Gastritis', 114, 75, 71, 153),
(93, 13, 21, '2026-04-07 08:00:00', 'Hipertensi', 121, 80, 74, 157),
(94, 14, 28, '2026-04-08 11:00:00', 'Diabetes Melitus Tipe 2', 128, 85, 77, 161),
(95, 15, 35, '2026-04-09 14:00:00', 'Demam', 135, 65, 80, 165),
(96, 16, 42, '2026-04-10 08:00:00', 'Migrain', 142, 70, 83, 169),
(97, 17, 49, '2026-04-11 11:00:00', 'Dermatitis', 104, 75, 86, 173),
(98, 18, 56, '2026-04-12 14:00:00', 'Faringitis', 111, 80, 89, 177),
(99, 19, 63, '2026-04-13 08:00:00', 'Artritis', 118, 85, 92, 181),
(100, 20, 70, '2026-04-14 11:00:00', 'Konjungtivitis', 125, 65, 45, 185);

-- --------------------------------------------------------

--
-- Table structure for table `medical_prescriptions`
--

CREATE TABLE `medical_prescriptions` (
  `PrescID` int(11) NOT NULL,
  `ExamID` int(11) DEFAULT NULL,
  `DrugID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `TimePerTakeInHours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medical_prescriptions`
--

INSERT INTO `medical_prescriptions` (`PrescID`, `ExamID`, `DrugID`, `Quantity`, `TimePerTakeInHours`) VALUES
(1, 1, 11, 10, 6),
(2, 2, 22, 12, 8),
(3, 3, 33, 14, 12),
(4, 4, 9, 20, 24),
(5, 5, 20, 30, 4),
(6, 6, 31, 6, 6),
(7, 7, 7, 10, 8),
(8, 8, 18, 12, 12),
(9, 9, 29, 14, 24),
(10, 10, 5, 20, 4),
(11, 11, 16, 30, 6),
(12, 12, 27, 6, 8),
(13, 13, 3, 10, 12),
(14, 14, 14, 12, 24),
(15, 15, 25, 14, 4),
(16, 16, 1, 20, 6),
(17, 17, 12, 30, 8),
(18, 18, 23, 6, 12),
(19, 19, 34, 10, 24),
(20, 20, 10, 12, 4),
(21, 21, 21, 14, 6),
(22, 22, 32, 20, 8),
(23, 23, 8, 30, 12),
(24, 24, 19, 6, 24),
(25, 25, 30, 10, 4),
(26, 26, 6, 12, 6),
(27, 27, 17, 14, 8),
(28, 28, 28, 20, 12),
(29, 29, 4, 30, 24),
(30, 30, 15, 6, 4),
(31, 31, 26, 10, 6),
(32, 32, 2, 12, 8),
(33, 33, 13, 14, 12),
(34, 34, 24, 20, 24),
(35, 35, 35, 30, 4),
(36, 36, 11, 6, 6),
(37, 37, 22, 10, 8),
(38, 38, 33, 12, 12),
(39, 39, 9, 14, 24),
(40, 40, 20, 20, 4),
(41, 41, 31, 30, 6),
(42, 42, 7, 6, 8),
(43, 43, 18, 10, 12),
(44, 44, 29, 12, 24),
(45, 45, 5, 14, 4),
(46, 46, 16, 20, 6),
(47, 47, 27, 30, 8),
(48, 48, 3, 6, 12),
(49, 49, 14, 10, 24),
(50, 50, 25, 12, 4),
(51, 51, 1, 14, 6),
(52, 52, 12, 20, 8),
(53, 53, 23, 30, 12),
(54, 54, 34, 6, 24),
(55, 55, 10, 10, 4),
(56, 56, 21, 12, 6),
(57, 57, 32, 14, 8),
(58, 58, 8, 20, 12),
(59, 59, 19, 30, 24),
(60, 60, 30, 6, 4),
(61, 61, 6, 10, 6),
(62, 62, 17, 12, 8),
(63, 63, 28, 14, 12),
(64, 64, 4, 20, 24),
(65, 65, 15, 30, 4),
(66, 66, 26, 6, 6),
(67, 67, 2, 10, 8),
(68, 68, 13, 12, 12),
(69, 69, 24, 14, 24),
(70, 70, 35, 20, 4),
(71, 71, 11, 30, 6),
(72, 72, 22, 6, 8),
(73, 73, 33, 10, 12),
(74, 74, 9, 12, 24),
(75, 75, 20, 14, 4),
(76, 76, 31, 20, 6),
(77, 77, 7, 30, 8),
(78, 78, 18, 6, 12),
(79, 79, 29, 10, 24),
(80, 80, 5, 12, 4),
(81, 81, 16, 14, 6),
(82, 82, 27, 20, 8),
(83, 83, 3, 30, 12),
(84, 84, 14, 6, 24),
(85, 85, 25, 10, 4),
(86, 86, 1, 12, 6),
(87, 87, 12, 14, 8),
(88, 88, 23, 20, 12),
(89, 89, 34, 30, 24),
(90, 90, 10, 6, 4),
(91, 91, 21, 10, 6),
(92, 92, 32, 12, 8),
(93, 93, 8, 14, 12),
(94, 94, 19, 20, 24),
(95, 95, 30, 30, 4),
(96, 96, 6, 6, 6),
(97, 97, 17, 10, 8),
(98, 98, 28, 12, 12),
(99, 99, 4, 14, 24),
(100, 100, 15, 20, 4),
(101, 1, 26, 30, 6),
(102, 2, 2, 6, 8),
(103, 3, 13, 10, 12),
(104, 4, 24, 12, 24),
(105, 5, 35, 14, 4),
(106, 6, 11, 20, 6),
(107, 7, 22, 30, 8),
(108, 8, 33, 6, 12),
(109, 9, 9, 10, 24),
(110, 10, 20, 12, 4),
(111, 11, 31, 14, 6),
(112, 12, 7, 20, 8),
(113, 13, 18, 30, 12),
(114, 14, 29, 6, 24),
(115, 15, 5, 10, 4),
(116, 16, 16, 12, 6),
(117, 17, 27, 14, 8),
(118, 18, 3, 20, 12),
(119, 19, 14, 30, 24),
(120, 20, 25, 6, 4),
(121, 21, 1, 10, 6),
(122, 22, 12, 12, 8),
(123, 23, 23, 14, 12),
(124, 24, 34, 20, 24),
(125, 25, 10, 30, 4),
(126, 26, 21, 6, 6),
(127, 27, 32, 10, 8),
(128, 28, 8, 12, 12),
(129, 29, 19, 14, 24),
(130, 30, 30, 20, 4),
(131, 31, 6, 30, 6),
(132, 32, 17, 6, 8),
(133, 33, 28, 10, 12),
(134, 34, 4, 12, 24),
(135, 35, 15, 14, 4),
(136, 36, 26, 20, 6),
(137, 37, 2, 30, 8),
(138, 38, 13, 6, 12),
(139, 39, 24, 10, 24),
(140, 40, 35, 12, 4),
(141, 41, 11, 14, 6),
(142, 42, 22, 20, 8),
(143, 43, 33, 30, 12),
(144, 44, 9, 6, 24),
(145, 45, 20, 10, 4),
(146, 46, 31, 12, 6),
(147, 47, 7, 14, 8),
(148, 48, 18, 20, 12),
(149, 49, 29, 30, 24),
(150, 50, 5, 6, 4);

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `PatientID` int(11) NOT NULL,
  `PatientName` varchar(50) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Address` text DEFAULT NULL,
  `Gender` char(1) NOT NULL,
  `BirthDate` date NOT NULL,
  `UserID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`PatientID`, `PatientName`, `PhoneNumber`, `Address`, `Gender`, `BirthDate`, `UserID`) VALUES
(1, 'Indra Lestari', '082110000001', 'Jl. Melati No. 1, Yogyakarta', 'L', '1977-02-04', 22),
(2, 'Joko Santoso', '082110000002', 'Jl. Melati No. 2, Yogyakarta', 'P', '1984-03-07', 23),
(3, 'Karin Sari', '082110000003', 'Jl. Melati No. 3, Yogyakarta', 'L', '1991-04-10', 24),
(4, 'Lina Setiawan', '082110000004', 'Jl. Melati No. 4, Yogyakarta', 'P', '1998-05-13', 25),
(5, 'Maya Anggraini', '082110000005', 'Jl. Melati No. 5, Yogyakarta', 'L', '2005-06-16', 26),
(6, 'Nanda Wijaya', '082110000006', 'Jl. Melati No. 6, Yogyakarta', 'P', '2012-07-19', 27),
(7, 'Oki Permata', '082110000007', 'Jl. Melati No. 7, Yogyakarta', 'L', '1974-08-22', 28),
(8, 'Putri Nugroho', '082110000008', 'Jl. Melati No. 8, Yogyakarta', 'P', '1981-09-25', 29),
(9, 'Raka Ramadhan', '082110000009', 'Jl. Melati No. 9, Yogyakarta', 'L', '1988-10-01', 30),
(10, 'Sari Putra', '082110000010', 'Jl. Melati No. 10, Yogyakarta', 'P', '1995-11-04', NULL),
(11, 'Taufik Saputra', '082110000011', 'Jl. Melati No. 11, Yogyakarta', 'L', '2002-12-07', NULL),
(12, 'Vina Hidayat', '082110000012', 'Jl. Melati No. 12, Yogyakarta', 'P', '2009-01-10', NULL),
(13, 'Wahyu Kusuma', '082110000013', 'Jl. Melati No. 13, Yogyakarta', 'L', '1971-02-13', NULL),
(14, 'Yuni Wibowo', '082110000014', 'Jl. Melati No. 14, Yogyakarta', 'P', '1978-03-16', NULL),
(15, 'Zaki Maulana', '082110000015', 'Jl. Melati No. 15, Yogyakarta', 'L', '1985-04-19', NULL),
(16, 'Alya Pratama', '082110000016', 'Jl. Melati No. 16, Yogyakarta', 'P', '1992-05-22', NULL),
(17, 'Bagas Lestari', '082110000017', 'Jl. Melati No. 17, Yogyakarta', 'L', '1999-06-25', NULL),
(18, 'Dimas Santoso', '082110000018', 'Jl. Melati No. 18, Yogyakarta', 'P', '2006-07-01', NULL),
(19, 'Intan Sari', '082110000019', 'Jl. Melati No. 19, Yogyakarta', 'L', '2013-08-04', NULL),
(20, 'Rizky Setiawan', '082110000020', 'Jl. Melati No. 20, Yogyakarta', 'P', '1975-09-07', NULL),
(21, 'Nadia Anggraini', '082110000021', 'Jl. Melati No. 21, Yogyakarta', 'L', '1982-10-10', NULL),
(22, 'Yoga Wijaya', '082110000022', 'Jl. Melati No. 22, Yogyakarta', 'P', '1989-11-13', NULL),
(23, 'Arif Permata', '082110000023', 'Jl. Melati No. 23, Yogyakarta', 'L', '1996-12-16', NULL),
(24, 'Bella Nugroho', '082110000024', 'Jl. Melati No. 24, Yogyakarta', 'P', '2003-01-19', NULL),
(25, 'Cahyo Ramadhan', '082110000025', 'Jl. Melati No. 25, Yogyakarta', 'L', '2010-02-22', NULL),
(26, 'Dinda Putra', '082110000026', 'Jl. Melati No. 26, Yogyakarta', 'P', '1972-03-25', NULL),
(27, 'Farhan Saputra', '082110000027', 'Jl. Melati No. 27, Yogyakarta', 'L', '1979-04-01', NULL),
(28, 'Galih Hidayat', '082110000028', 'Jl. Melati No. 28, Yogyakarta', 'P', '1986-05-04', NULL),
(29, 'Nisa Kusuma', '082110000029', 'Jl. Melati No. 29, Yogyakarta', 'L', '1993-06-07', NULL),
(30, 'Rani Wibowo', '082110000030', 'Jl. Melati No. 30, Yogyakarta', 'P', '2000-07-10', NULL),
(31, 'Salsa Maulana', '082110000031', 'Jl. Melati No. 31, Yogyakarta', 'L', '2007-08-13', NULL),
(32, 'Tegar Pratama', '082110000032', 'Jl. Melati No. 32, Yogyakarta', 'P', '2014-09-16', NULL),
(33, 'Ahmad Lestari', '082110000033', 'Jl. Melati No. 33, Yogyakarta', 'L', '1976-10-19', NULL),
(34, 'Budi Santoso', '082110000034', 'Jl. Melati No. 34, Yogyakarta', 'P', '1983-11-22', NULL),
(35, 'Citra Sari', '082110000035', 'Jl. Melati No. 35, Yogyakarta', 'L', '1990-12-25', NULL),
(36, 'Dewi Setiawan', '082110000036', 'Jl. Melati No. 36, Yogyakarta', 'P', '1997-01-01', NULL),
(37, 'Eko Anggraini', '082110000037', 'Jl. Melati No. 37, Yogyakarta', 'L', '2004-02-04', NULL),
(38, 'Fajar Wijaya', '082110000038', 'Jl. Melati No. 38, Yogyakarta', 'P', '2011-03-07', NULL),
(39, 'Gita Permata', '082110000039', 'Jl. Melati No. 39, Yogyakarta', 'L', '1973-04-10', NULL),
(40, 'Hana Nugroho', '082110000040', 'Jl. Melati No. 40, Yogyakarta', 'P', '1980-05-13', NULL),
(41, 'Indra Ramadhan', '082110000041', 'Jl. Melati No. 41, Yogyakarta', 'L', '1987-06-16', NULL),
(42, 'Joko Putra', '082110000042', 'Jl. Melati No. 42, Yogyakarta', 'P', '1994-07-19', NULL),
(43, 'Karin Saputra', '082110000043', 'Jl. Melati No. 43, Yogyakarta', 'L', '2001-08-22', NULL),
(44, 'Lina Hidayat', '082110000044', 'Jl. Melati No. 44, Yogyakarta', 'P', '2008-09-25', NULL),
(45, 'Maya Kusuma', '082110000045', 'Jl. Melati No. 45, Yogyakarta', 'L', '1970-10-01', NULL),
(46, 'Nanda Wibowo', '082110000046', 'Jl. Melati No. 46, Yogyakarta', 'P', '1977-11-04', NULL),
(47, 'Oki Maulana', '082110000047', 'Jl. Melati No. 47, Yogyakarta', 'L', '1984-12-07', NULL),
(48, 'Putri Pratama', '082110000048', 'Jl. Melati No. 48, Yogyakarta', 'P', '1991-01-10', NULL),
(49, 'Raka Lestari', '082110000049', 'Jl. Melati No. 49, Yogyakarta', 'L', '1998-02-13', NULL),
(50, 'Sari Santoso', '082110000050', 'Jl. Melati No. 50, Yogyakarta', 'P', '2005-03-16', NULL),
(51, 'Taufik Sari', '082110000051', 'Jl. Melati No. 51, Yogyakarta', 'L', '2012-04-19', NULL),
(52, 'Vina Setiawan', '082110000052', 'Jl. Melati No. 52, Yogyakarta', 'P', '1974-05-22', NULL),
(53, 'Wahyu Anggraini', '082110000053', 'Jl. Melati No. 53, Yogyakarta', 'L', '1981-06-25', NULL),
(54, 'Yuni Wijaya', '082110000054', 'Jl. Melati No. 54, Yogyakarta', 'P', '1988-07-01', NULL),
(55, 'Zaki Permata', '082110000055', 'Jl. Melati No. 55, Yogyakarta', 'L', '1995-08-04', NULL),
(56, 'Alya Nugroho', '082110000056', 'Jl. Melati No. 56, Yogyakarta', 'P', '2002-09-07', NULL),
(57, 'Bagas Ramadhan', '082110000057', 'Jl. Melati No. 57, Yogyakarta', 'L', '2009-10-10', NULL),
(58, 'Dimas Putra', '082110000058', 'Jl. Melati No. 58, Yogyakarta', 'P', '1971-11-13', NULL),
(59, 'Intan Saputra', '082110000059', 'Jl. Melati No. 59, Yogyakarta', 'L', '1978-12-16', NULL),
(60, 'Rizky Hidayat', '082110000060', 'Jl. Melati No. 60, Yogyakarta', 'P', '1985-01-19', NULL),
(61, 'Nadia Kusuma', '082110000061', 'Jl. Melati No. 61, Yogyakarta', 'L', '1992-02-22', NULL),
(62, 'Yoga Wibowo', '082110000062', 'Jl. Melati No. 62, Yogyakarta', 'P', '1999-03-25', NULL),
(63, 'Arif Maulana', '082110000063', 'Jl. Melati No. 63, Yogyakarta', 'L', '2006-04-01', NULL),
(64, 'Bella Pratama', '082110000064', 'Jl. Melati No. 64, Yogyakarta', 'P', '2013-05-04', NULL),
(65, 'Cahyo Lestari', '082110000065', 'Jl. Melati No. 65, Yogyakarta', 'L', '1975-06-07', NULL),
(66, 'Dinda Santoso', '082110000066', 'Jl. Melati No. 66, Yogyakarta', 'P', '1982-07-10', NULL),
(67, 'Farhan Sari', '082110000067', 'Jl. Melati No. 67, Yogyakarta', 'L', '1989-08-13', NULL),
(68, 'Galih Setiawan', '082110000068', 'Jl. Melati No. 68, Yogyakarta', 'P', '1996-09-16', NULL),
(69, 'Nisa Anggraini', '082110000069', 'Jl. Melati No. 69, Yogyakarta', 'L', '2003-10-19', NULL),
(70, 'Rani Wijaya', '082110000070', 'Jl. Melati No. 70, Yogyakarta', 'P', '2010-11-22', NULL);

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

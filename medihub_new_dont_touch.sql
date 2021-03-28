-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2021 at 08:16 AM
-- Server version: 10.4.18-MariaDB
-- PHP Version: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `medihub`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `privilege` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `privilege`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `channelling`
--

CREATE TABLE `channelling` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_availability_id` int(11) DEFAULT NULL,
  `appointment_no` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channelling`
--

INSERT INTO `channelling` (`id`, `patient_id`, `doctor_availability_id`, `appointment_no`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(30, 2, 4, 1, 'Booked for Self', 1, '2020-12-02 12:09:20', '2020-12-02 12:09:20', 2, 2),
(32, 2, 1, 1, 'Booked for Self', 1, '2020-12-02 12:22:50', '2020-12-02 12:22:50', 2, 2),
(33, 2, 3, 1, 'Booked for Self', 1, '2020-12-02 13:21:16', '2020-12-02 13:21:16', 2, 2),
(38, 13, 1, 6, 'Booked for Uvin', 1, '2021-03-25 10:25:13', '2021-03-25 10:25:13', 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `channelling_feedbacks`
--

CREATE TABLE `channelling_feedbacks` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `doctor_feedback` varchar(2048) DEFAULT NULL,
  `patient_feedback` varchar(2048) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `channelling_payments`
--

CREATE TABLE `channelling_payments` (
  `id` int(11) NOT NULL,
  `channelling_id` int(11) DEFAULT NULL,
  `payerId` varchar(255) DEFAULT NULL,
  `captureId` varchar(255) DEFAULT NULL,
  `transactionId` varchar(255) DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `channelling_payments`
--

INSERT INTO `channelling_payments` (`id`, `channelling_id`, `payerId`, `captureId`, `transactionId`, `payment_amount`, `payment_method`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, '', '', '', 1000, 1, 'Full Payment Done', 1, '2020-11-19 21:30:15', '2020-11-19 21:30:15', 4, 4),
(3, 38, 'DXP3BHPS5382E', '8H195398XD785882D', 'default', NULL, 4, 'Full payement recieved', NULL, NULL, NULL, NULL, NULL),
(4, 39, 'DXP3BHPS5382E', '3R909028E81768104', 'default', 1000, 4, 'Full Payement Done', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `channelling_refunds`
--

CREATE TABLE `channelling_refunds` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `refund_amount` float DEFAULT NULL,
  `refund_method` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `district_id` int(11) DEFAULT NULL,
  `name_en` varchar(64) DEFAULT NULL,
  `name_si` varchar(64) DEFAULT NULL,
  `name_ta` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `postcode` varchar(64) DEFAULT NULL,
  `latitude` double DEFAULT NULL,
  `longitude` double DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `district_id`, `name_en`, `name_si`, `name_ta`, `description`, `postcode`, `latitude`, `longitude`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Akkaraipattu', 'අක්කරපත්තුව', NULL, NULL, '32400', 7.2167, 81.85, 1, 1, 1, NULL, NULL),
(2, 1, 'Ambagahawatta', 'අඹගහවත්ත', NULL, NULL, '90326', 7.4, 81.3, 1, 1, 1, NULL, NULL),
(3, 1, 'Ampara', 'අම්පාර', 'அம்பாறை', NULL, '32000', 7.2833, 81.6667, 1, 1, 1, NULL, NULL),
(4, 1, 'Bakmitiyawa', 'බක්මිටියාව', NULL, NULL, '32024', 7.026268, 81.633832, 1, 1, 1, NULL, NULL),
(5, 1, 'Deegawapiya', 'දීඝවාපිය', NULL, NULL, '32006', 7.2833, 81.6667, 1, 1, 1, NULL, NULL),
(6, 1, 'Devalahinda', 'දෙවලහිඳ', NULL, NULL, '32038', 7.1889, 81.5778, 1, 1, 1, NULL, NULL),
(7, 1, 'Digamadulla Weeragoda', 'දිගාමඩුල්ල වීරගොඩ', NULL, NULL, '32008', 7.2833, 81.6667, 1, 1, 1, NULL, NULL),
(8, 1, 'Dorakumbura', 'දොරකුඹුර', NULL, NULL, '32104', 7.358849, 81.280133, 1, 1, 1, NULL, NULL),
(9, 1, 'Gonagolla', 'ගොනගොල්ල', NULL, NULL, '32064', 7.449853, 81.618014, 1, 1, 1, NULL, NULL),
(10, 1, 'Hulannuge', 'හුලංනුගේ', NULL, NULL, '32514', 7.4, 81.3, 1, 1, 1, NULL, NULL),
(11, 1, 'Kalmunai', 'කල්මුණේ', NULL, NULL, '32300', 7.413897, 81.826718, 1, 1, 1, NULL, NULL),
(12, 1, 'Kannakipuram', 'කන්නකිපුරම්', NULL, NULL, '32405', 7.2167, 81.85, 1, 1, 1, NULL, NULL),
(13, 1, 'Karativu', 'කරතිව්', NULL, NULL, '32250', 7.3833, 81.8333, 1, 1, 1, NULL, NULL),
(14, 1, 'Kekirihena', 'කැකිරිහේන', NULL, NULL, '32074', 7.490724, 81.310836, 1, 1, 1, NULL, NULL),
(15, 1, 'Koknahara', 'කොක්නහර', NULL, NULL, '32035', 7.184832, 81.555806, 1, 1, 1, NULL, NULL),
(16, 1, 'Kolamanthalawa', 'කෝලමන්තලාව', NULL, NULL, '32102', 7.351733, 81.249913, 1, 1, 1, NULL, NULL),
(17, 1, 'Komari', 'කෝමාරි', NULL, NULL, '32418', 6.976958, 81.78883, 1, 1, 1, NULL, NULL),
(18, 1, 'Lahugala', 'ලාහුගල', NULL, NULL, '32512', 7.415566, 81.33954, 1, 1, 1, NULL, NULL),
(19, 1, 'lmkkamam', 'ල්ම්ක්කමම්', NULL, NULL, '32450', 7.1125, 81.8542, 1, 1, 1, NULL, NULL),
(20, 1, 'Mahaoya', 'මහඔය', NULL, NULL, '32070', 7.535248, 81.351145, 1, 1, 1, NULL, NULL),
(21, 1, 'Marathamune', 'මාරත්මුනේ', NULL, NULL, '32314', 7.45, 81.8167, 1, 1, 1, NULL, NULL),
(22, 1, 'Namaloya', 'නාමල්ඔය', NULL, NULL, '32037', 7.1889, 81.5778, 1, 1, 1, NULL, NULL),
(23, 1, 'Navithanveli', 'නාවිදන්වෙලි', NULL, NULL, '32308', 7.4333, 81.7833, 1, 1, 1, NULL, NULL),
(24, 1, 'Nintavur', 'නින්දවූර්', NULL, NULL, '32340', 7.35, 81.85, 1, 1, 1, NULL, NULL),
(25, 1, 'Oluvil', 'ඔළුවිල', NULL, NULL, '32360', 7.2833, 81.85, 1, 1, 1, NULL, NULL),
(26, 1, 'Padiyatalawa', 'පදියතලාව', NULL, NULL, '32100', 7.4, 81.2333, 1, 1, 1, NULL, NULL),
(27, 1, 'Pahalalanda', 'පහලලන්ද', NULL, NULL, '32034', 7.21752, 81.578714, 1, 1, 1, NULL, NULL),
(28, 1, 'Panama', 'පානම', NULL, NULL, '32508', 6.812201, 81.712237, 1, 1, 1, NULL, NULL),
(29, 1, 'Pannalagama', 'පන්නලගම', NULL, NULL, '32022', 7.0667, 81.6167, 1, 1, 1, NULL, NULL),
(30, 1, 'Paragahakele', 'පරගහකැලේ', NULL, NULL, '32031', 7.25669, 81.609526, 1, 1, 1, NULL, NULL),
(31, 1, 'Periyaneelavanai', 'පෙරියනීලවන්නි', NULL, NULL, '32316', 7.434002, 81.814169, 1, 1, 1, NULL, NULL),
(32, 1, 'Polwaga Janapadaya', 'පොල්වග ජනපදය', NULL, NULL, '32032', 7.1889, 81.5778, 1, 1, 1, NULL, NULL),
(33, 1, 'Pottuvil', 'පොතුවිල්', NULL, NULL, '32500', 6.8667, 81.8333, 1, 1, 1, NULL, NULL),
(34, 1, 'Sainthamaruthu', 'සායින්දමරුදු', NULL, NULL, '32280', 7.3833, 81.8333, 1, 1, 1, NULL, NULL),
(35, 1, 'Samanthurai', 'සමන්තුරේ', 'சம்மாந்துறை', NULL, '32200', 7.3833, 81.8333, 1, 1, 1, NULL, NULL),
(36, 1, 'Serankada', 'සේරන්කද', NULL, NULL, '32101', 7.464517, 81.263599, 1, 1, 1, NULL, NULL),
(37, 1, 'Tempitiya', 'ටැම්පිටිය', NULL, NULL, '32072', 7.610374, 81.429907, 1, 1, 1, NULL, NULL),
(38, 1, 'Thambiluvil', 'ල්තැඹිළුවි', NULL, NULL, '32415', 7.132227, 81.819074, 1, 1, 1, NULL, NULL),
(39, 1, 'Tirukovil', 'තිරුකෝවිල', NULL, NULL, '32420', 7.1167, 81.85, 1, 1, 1, NULL, NULL),
(40, 1, 'Uhana', 'උහන', NULL, NULL, '32060', 7.363281, 81.637746, 1, 1, 1, NULL, NULL),
(41, 1, 'Wadinagala', 'වඩිනාගල', NULL, NULL, '32039', 7.127849, 81.56922, 1, 1, 1, NULL, NULL),
(42, 1, 'Wanagamuwa', 'වනගමුව', NULL, NULL, '32454', 7.1125, 81.8542, 1, 1, 1, NULL, NULL),
(43, 2, 'Angamuwa', 'අංගමුව', NULL, NULL, '50248', 8.177645, 80.205048, 1, 1, 1, NULL, NULL),
(44, 2, 'Anuradhapura', 'අනුරාධපුරය', NULL, NULL, '50000', 8.35, 80.3833, 1, 1, 1, NULL, NULL),
(45, 2, 'Awukana', 'අව්කන', NULL, NULL, '50169', 7.9753, 80.5266, 1, 1, 1, NULL, NULL),
(46, 2, 'Bogahawewa', 'බෝගහවැව', NULL, NULL, '50566', 8.328993, 80.251702, 1, 1, 1, NULL, NULL),
(47, 2, 'Dematawewa', 'දෙමටවැව', NULL, NULL, '50356', 8.357373, 80.870087, 1, 1, 1, NULL, NULL),
(48, 2, 'Dimbulagala', 'දිඹුලාගල', NULL, NULL, '51031', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(49, 2, 'Dutuwewa', 'දුටුවැව', NULL, NULL, '50393', 8.65, 80.5167, 1, 1, 1, NULL, NULL),
(50, 2, 'Elayapattuwa', 'ඇලයාපත්තුව', NULL, NULL, '50014', 8.413522, 80.318148, 1, 1, 1, NULL, NULL),
(51, 2, 'Ellewewa', 'ඇල්ලේවැව', NULL, NULL, '51034', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(52, 2, 'Eppawala', 'එප්පාවල', NULL, NULL, '50260', 8.1167, 80.7333, 1, 1, 1, NULL, NULL),
(53, 2, 'Etawatunuwewa', 'ඇතාවැටුනවැව', NULL, NULL, '50584', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(54, 2, 'Etaweeragollewa', 'ඇතාවීරගොලෑව', NULL, NULL, '50518', 8.613962, 80.539713, 1, 1, 1, NULL, NULL),
(55, 2, 'Galapitagala', 'ගලපිටගල', NULL, NULL, '32066', 8.089843, 80.685528, 1, 1, 1, NULL, NULL),
(56, 2, 'Galenbindunuwewa', 'ගලෙන්බිඳුනුවැව', NULL, NULL, '50390', 8.5833, 80.55, 1, 1, 1, NULL, NULL),
(57, 2, 'Galkadawala', 'ගල්කඩවල', NULL, NULL, '50006', 8.412861, 80.378175, 1, 1, 1, NULL, NULL),
(58, 2, 'Galkiriyagama', 'ගල්කිරියාගම', NULL, NULL, '50120', 7.9414, 80.565, 1, 1, 1, NULL, NULL),
(59, 2, 'Galkulama', 'ගල්කුලම', NULL, NULL, '50064', 8.270414, 80.506526, 1, 1, 1, NULL, NULL),
(60, 2, 'Galnewa', 'ගල්නෑව', NULL, NULL, '50170', 8.2, 80.3667, 1, 1, 1, NULL, NULL),
(61, 2, 'Gambirigaswewa', 'ගම්බිරිගස්වැව', NULL, NULL, '50057', 8.4667, 80.3667, 1, 1, 1, NULL, NULL),
(62, 2, 'Ganewalpola', 'ගනේවල්පොල', NULL, NULL, '50142', 8.090528, 80.628195, 1, 1, 1, NULL, NULL),
(63, 2, 'Gemunupura', 'ගැමුණුපුර', NULL, NULL, '50224', 8.0667, 80.6833, 1, 1, 1, NULL, NULL),
(64, 2, 'Getalawa', 'ගෙතලාව', NULL, NULL, '50392', 8.6167, 80.5333, 1, 1, 1, NULL, NULL),
(65, 2, 'Gnanikulama', 'ඝාණිකුළම', NULL, NULL, '50036', 8.297336, 80.431753, 1, 1, 1, NULL, NULL),
(66, 2, 'Gonahaddenawa', 'ගෝනහද්දෙනෑව', NULL, NULL, '50554', 8.5333, 80.5083, 1, 1, 1, NULL, NULL),
(67, 2, 'Habarana', 'හබරන', NULL, NULL, '50150', 8.047531, 80.748664, 1, 1, 1, NULL, NULL),
(68, 2, 'Halmillawa Dambulla', 'හල්මිලෑව දඹුල්ල', NULL, NULL, '50124', 7.9474, 80.594, 1, 1, 1, NULL, NULL),
(69, 2, 'Halmillawetiya', 'හල්මිල්ලවැටිය', NULL, NULL, '50552', 8.35, 80.2667, 1, 1, 1, NULL, NULL),
(70, 2, 'Hidogama', 'හිද්දෝගම', NULL, NULL, '50044', 8.250421, 80.418663, 1, 1, 1, NULL, NULL),
(71, 2, 'Horawpatana', 'හොරොව්පතාන', NULL, NULL, '50350', 8.4333, 80.8667, 1, 1, 1, NULL, NULL),
(72, 2, 'Horiwila', 'හොරිවිල', NULL, NULL, '50222', 8.0667, 80.6833, 1, 1, 1, NULL, NULL),
(73, 2, 'Hurigaswewa', 'හුරිගස්වැව', NULL, NULL, '50176', 8.1333, 80.3667, 1, 1, 1, NULL, NULL),
(74, 2, 'Hurulunikawewa', 'හුරුලුනිකවැව', NULL, NULL, '50394', 8.6167, 80.5333, 1, 1, 1, NULL, NULL),
(75, 2, 'Ihala Puliyankulama', 'ඉහල පුලියන්කුලම', NULL, NULL, '61316', 8.153213, 80.559989, 1, 1, 1, NULL, NULL),
(76, 2, 'Kagama', 'කගම', NULL, NULL, '50282', 8.061465, 80.478039, 1, 1, 1, NULL, NULL),
(77, 2, 'Kahatagasdigiliya', 'කහටගස්දිගිලිය', NULL, NULL, '50320', 8.4167, 80.6833, 1, 1, 1, NULL, NULL),
(78, 2, 'Kahatagollewa', 'කහටගොල්ලෑව', NULL, NULL, '50562', 8.45, 80.65, 1, 1, 1, NULL, NULL),
(79, 2, 'Kalakarambewa', 'කලකරඹෑව', NULL, NULL, '50288', 8.0833, 80.4667, 1, 1, 1, NULL, NULL),
(80, 2, 'Kalaoya', 'කලාඔය', NULL, NULL, '50226', 8.0667, 80.6833, 1, 1, 1, NULL, NULL),
(81, 2, 'Kalawedi Ulpotha', 'කලාවැදි උල්පොත', NULL, NULL, '50556', 8.5333, 80.5083, 1, 1, 1, NULL, NULL),
(82, 2, 'Kallanchiya', 'කලංචිය', NULL, NULL, '50454', 8.45, 80.55, 1, 1, 1, NULL, NULL),
(83, 2, 'Kalpitiya', 'කල්පිටිය', NULL, NULL, '61360', 8.2333, 79.7667, 1, 1, 1, NULL, NULL),
(84, 2, 'Kalukele Badanagala', 'කළුකැලේ බදනාගල', NULL, NULL, '51037', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(85, 2, 'Kapugallawa', 'කපුගල්ලව', NULL, NULL, '50370', 8.4233, 80.6783, 1, 1, 1, NULL, NULL),
(86, 2, 'Karagahawewa', 'කරගහවැව', NULL, NULL, '50232', 8.23416, 80.322772, 1, 1, 1, NULL, NULL),
(87, 2, 'Kashyapapura', 'කාශ්‍යපපුර', NULL, NULL, '51032', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(88, 2, 'Kebithigollewa', 'කැබිතිගොල්ලෑව', NULL, NULL, '50500', 8.5333, 80.4833, 1, 1, 1, NULL, NULL),
(89, 2, 'Kekirawa', 'කැකිරාව', NULL, NULL, '50100', 8.037462, 80.59801, 1, 1, 1, NULL, NULL),
(90, 2, 'Kendewa', 'කේන්දෑව', NULL, NULL, '50452', 8.4833, 80.6, 1, 1, 1, NULL, NULL),
(91, 2, 'Kiralogama', 'කිරළෝගම', NULL, NULL, '50259', 8.19407, 80.37012, 1, 1, 1, NULL, NULL),
(92, 2, 'Kirigalwewa', 'කිරිගල්වැව', NULL, NULL, '50511', 8.537767, 80.556651, 1, 1, 1, NULL, NULL),
(93, 2, 'Kirimundalama', 'කිරිමුන්ඩලම', NULL, NULL, '61362', 8.2333, 79.7667, 1, 1, 1, NULL, NULL),
(94, 2, 'Kitulhitiyawa', 'කිතුල්හිටියාව', NULL, NULL, '50132', 7.916592, 80.63811, 1, 1, 1, NULL, NULL),
(95, 2, 'Kurundankulama', 'කුරුන්දන්කුලම', NULL, NULL, '50062', 8.2, 80.45, 1, 1, 1, NULL, NULL),
(96, 2, 'Labunoruwa', 'ලබුනෝරුව', NULL, NULL, '50088', 8.168026, 80.617001, 1, 1, 1, NULL, NULL),
(97, 2, 'Ihalagama', 'ඉහලගම', NULL, NULL, '50304', 8.35, 80.5, 1, 1, 1, NULL, NULL),
(98, 2, 'Ipologama', 'ඉපොලොගම', NULL, NULL, '50280', 8.0833, 80.4667, 1, 1, 1, NULL, NULL),
(99, 2, 'Madatugama', 'මාදතුගම', NULL, NULL, '50130', 7.940041, 80.638217, 1, 1, 1, NULL, NULL),
(100, 2, 'Maha Elagamuwa', 'මහ ඇලගමුව', NULL, NULL, '50126', 7.991935, 80.61824, 1, 1, 1, NULL, NULL),
(101, 2, 'Mahabulankulama', 'මහබුලංකුලම', NULL, NULL, '50196', 7.9753, 80.5266, 1, 1, 1, NULL, NULL),
(102, 2, 'Mahailluppallama', 'මහඉලුප්පල්ලම', NULL, NULL, '50270', 8.106, 80.3619, 1, 1, 1, NULL, NULL),
(103, 2, 'Mahakanadarawa', 'මහකනදරාව', NULL, NULL, '50306', 8.35, 80.5, 1, 1, 1, NULL, NULL),
(104, 2, 'Mahapothana', 'මහපොතාන', NULL, NULL, '50327', 8.4167, 80.6833, 1, 1, 1, NULL, NULL),
(105, 2, 'Mahasenpura', 'මහසෙන්පුර', NULL, NULL, '50574', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(106, 2, 'Mahawilachchiya', 'මහවිලච්චිය', NULL, NULL, '50022', 8.2814, 80.4588, 1, 1, 1, NULL, NULL),
(107, 2, 'Mailagaswewa', 'මයිලගස්වැව', NULL, NULL, '50384', 8.4, 80.6333, 1, 1, 1, NULL, NULL),
(108, 2, 'Malwanagama', 'මල්වනගම', NULL, NULL, '50236', 8.225, 80.3333, 1, 1, 1, NULL, NULL),
(109, 2, 'Maneruwa', 'මනේරුව', NULL, NULL, '50182', 7.895997, 80.475966, 1, 1, 1, NULL, NULL),
(110, 2, 'Maradankadawala', 'මරදන්කඩවල', NULL, NULL, '50080', 8.1333, 80.4833, 1, 1, 1, NULL, NULL),
(111, 2, 'Maradankalla', 'මරදන්කල්ල', NULL, NULL, '50308', 8.317498, 80.537899, 1, 1, 1, NULL, NULL),
(112, 2, 'Medawachchiya', 'මැදවච්චිය', NULL, NULL, '50500', 8.540822, 80.495957, 1, 1, 1, NULL, NULL),
(113, 2, 'Megodawewa', 'මීගොඩවැව', NULL, NULL, '50334', 8.2333, 80.7333, 1, 1, 1, NULL, NULL),
(114, 2, 'Mihintale', 'මිහින්තලේ', NULL, NULL, '50300', 8.35, 80.5, 1, 1, 1, NULL, NULL),
(115, 2, 'Morakewa', 'මොරකෑව', NULL, NULL, '50349', 8.513051, 80.778223, 1, 1, 1, NULL, NULL),
(116, 2, 'Mulkiriyawa', 'මුල්කිරියාව', NULL, NULL, '50324', 8.4167, 80.6833, 1, 1, 1, NULL, NULL),
(117, 2, 'Muriyakadawala', 'මුරියකඩවල', NULL, NULL, '50344', 8.236464, 80.654663, 1, 1, 1, NULL, NULL),
(118, 5, 'Colombo 15', 'කොළඹ 15', 'கொழும்பு 15', 'Modara', '01500', 6.959444, 79.875278, 1, 1, 1, NULL, NULL),
(119, 2, 'Nachchaduwa', 'නච්චදූව', NULL, NULL, '50046', 8.2667, 80.4667, 1, 1, 1, NULL, NULL),
(120, 2, 'Namalpura', 'නාමල්පුර', NULL, NULL, '50339', 8.2333, 80.7333, 1, 1, 1, NULL, NULL),
(121, 2, 'Negampaha', 'නෑගම්පහ', NULL, NULL, '50180', 7.9872, 80.4597, 1, 1, 1, NULL, NULL),
(122, 2, 'Nochchiyagama', 'නොච්චියාගම', NULL, NULL, '50200', 8.266802, 80.20823, 1, 1, 1, NULL, NULL),
(123, 2, 'Nuwaragala', 'නුවරගල', NULL, NULL, '51039', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(124, 2, 'Padavi Maithripura', 'පදවි මෛත්‍රීපුර', NULL, NULL, '50572', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(125, 2, 'Padavi Parakramapura', 'පදවි පරාක්‍රමපුර', NULL, NULL, '50582', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(126, 2, 'Padavi Sripura', 'පදවි ශ්‍රීපුර', NULL, NULL, '50587', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(127, 2, 'Padavi Sritissapura', 'පදවි ශ්‍රීතිස්සපුර', NULL, NULL, '50588', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(128, 2, 'Padaviya', 'පදවිය', NULL, NULL, '50570', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(129, 2, 'Padikaramaduwa', 'පඩිකරමඩුව', NULL, NULL, '50338', 8.2333, 80.7333, 1, 1, 1, NULL, NULL),
(130, 2, 'Pahala Halmillewa', 'පහල හල්මිල්ලෑව', NULL, NULL, '50206', 8.21672, 80.19116, 1, 1, 1, NULL, NULL),
(131, 2, 'Pahala Maragahawe', 'පහල මරගහවෙ', NULL, NULL, '50220', 8.0667, 80.6833, 1, 1, 1, NULL, NULL),
(132, 2, 'Pahalagama', 'පහලගම', NULL, NULL, '50244', 8.186896, 80.283767, 1, 1, 1, NULL, NULL),
(133, 2, 'Palugaswewa', 'පලුගස්වැව', NULL, NULL, '50144', 8.053538, 80.71918, 1, 1, 1, NULL, NULL),
(134, 2, 'Pandukabayapura', 'පන්ඩුකාබයපුර', NULL, NULL, '50448', 8.4467, 80.46731, 1, 1, 1, NULL, NULL),
(135, 2, 'Pandulagama', 'පන්ඩුලගම', NULL, NULL, '50029', 8.2814, 80.4588, 1, 1, 1, NULL, NULL),
(136, 2, 'Parakumpura', 'පරාක්‍රමපුර', NULL, NULL, '50326', 8.4167, 80.6833, 1, 1, 1, NULL, NULL),
(137, 2, 'Parangiyawadiya', 'පරංගියාවාඩිය', NULL, NULL, '50354', 8.491831, 80.910014, 1, 1, 1, NULL, NULL),
(138, 2, 'Parasangahawewa', 'පරසන්ගහවැව', NULL, NULL, '50055', 8.4333, 80.4333, 1, 1, 1, NULL, NULL),
(139, 2, 'Pelatiyawa', 'පැලටියාව', NULL, NULL, '51033', 7.9167, 80.55, 1, 1, 1, NULL, NULL),
(140, 2, 'Pemaduwa', 'පෙමදූව', NULL, NULL, '50020', 8.2814, 80.4588, 1, 1, 1, NULL, NULL),
(141, 2, 'Perimiyankulama', 'පෙරිමියන්කුලම', NULL, NULL, '50004', 8.270584, 80.535827, 1, 1, 1, NULL, NULL),
(142, 2, 'Pihimbiyagolewa', 'පිහිඹියගොල්ලෑව', NULL, NULL, '50512', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(143, 2, 'Pubbogama', 'පුබ්බෝගම', NULL, NULL, '50122', 7.9167, 80.6, 1, 1, 1, NULL, NULL),
(144, 2, 'Punewa', 'පූනෑව', NULL, NULL, '50506', 8.6167, 80.4667, 1, 1, 1, NULL, NULL),
(145, 2, 'Rajanganaya', 'රාජාංගනය', NULL, NULL, '50246', 8.1708, 80.2833, 1, 1, 1, NULL, NULL),
(146, 2, 'Rambewa', 'රම්බෑව්', NULL, NULL, '50450', 8.4333, 80.5, 1, 1, 1, NULL, NULL),
(147, 2, 'Rampathwila', 'රම්පත්විල', NULL, NULL, '50386', 8.4, 80.6333, 1, 1, 1, NULL, NULL),
(148, 2, 'Rathmalgahawewa', 'රත්මල්ගහවැව', NULL, NULL, '50514', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(149, 2, 'Saliyapura', 'සාලියපුර', NULL, NULL, '50008', 8.3389, 80.4333, 1, 1, 1, NULL, NULL),
(150, 2, 'Seeppukulama', 'සීප්පුකුලම', NULL, NULL, '50380', 8.4, 80.6333, 1, 1, 1, NULL, NULL),
(151, 2, 'Senapura', 'සේනාපුර', NULL, NULL, '50284', 8.0833, 80.4667, 1, 1, 1, NULL, NULL),
(152, 2, 'Sivalakulama', 'සිවලකුලම', NULL, NULL, '50068', 8.25237, 80.641743, 1, 1, 1, NULL, NULL),
(153, 2, 'Siyambalewa', 'සියඹලෑව', NULL, NULL, '50184', 7.95, 80.5167, 1, 1, 1, NULL, NULL),
(154, 2, 'Sravasthipura', 'ස්‍රාවස්තිපුර', NULL, NULL, '50042', 8.2667, 80.4333, 1, 1, 1, NULL, NULL),
(155, 2, 'Talawa', 'තලාව', NULL, NULL, '50230', 8.2167, 80.35, 1, 1, 1, NULL, NULL),
(156, 2, 'Tambuttegama', 'තඹුත්තේගම', NULL, NULL, '50240', 8.15, 80.3, 1, 1, 1, NULL, NULL),
(157, 2, 'Tammennawa', 'තම්මැන්නාව', NULL, NULL, '50104', 8.0333, 80.6, 1, 1, 1, NULL, NULL),
(158, 2, 'Tantirimale', 'තන්තිරිමලේ', NULL, NULL, '50016', 8.4, 80.3, 1, 1, 1, NULL, NULL),
(159, 2, 'Telhiriyawa', 'තෙල්හිරියාව', NULL, NULL, '50242', 8.15, 80.3333, 1, 1, 1, NULL, NULL),
(160, 2, 'Tirappane', 'තිරප්පනේ', NULL, NULL, '50072', 8.2167, 80.3833, 1, 1, 1, NULL, NULL),
(161, 2, 'Tittagonewa', 'තිත්තගෝනෑව', NULL, NULL, '50558', 8.7167, 80.75, 1, 1, 1, NULL, NULL),
(162, 2, 'Udunuwara Colony', 'උඩුනුවර කොළණිය', NULL, NULL, '50207', 8.2417, 80.1917, 1, 1, 1, NULL, NULL),
(163, 2, 'Upuldeniya', 'උපුල්දෙනිය', NULL, NULL, '50382', 8.4, 80.6333, 1, 1, 1, NULL, NULL),
(164, 2, 'Uttimaduwa', 'උට්ටිමඩුව', NULL, NULL, '50067', 8.254989, 80.55487, 1, 1, 1, NULL, NULL),
(165, 2, 'Vellamanal', 'වෙල්ලමනල්', NULL, NULL, '31053', 8.5167, 81.1833, 1, 1, 1, NULL, NULL),
(166, 2, 'Viharapalugama', 'විහාරපාළුගම', NULL, NULL, '50012', 8.4, 80.3, 1, 1, 1, NULL, NULL),
(167, 2, 'Wahalkada', 'වාහල්කඩ', NULL, NULL, '50564', 8.5667, 80.6222, 1, 1, 1, NULL, NULL),
(168, 2, 'Wahamalgollewa', 'වහමල්ගොල්ලෑව', NULL, NULL, '50492', 8.479838, 80.497451, 1, 1, 1, NULL, NULL),
(169, 2, 'Walagambahuwa', 'වලගම්බාහුව', NULL, NULL, '50086', 8.153134, 80.499049, 1, 1, 1, NULL, NULL),
(170, 2, 'Walahaviddawewa', 'වලහාවිද්දෑව', NULL, NULL, '50516', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(171, 2, 'Welimuwapotana', 'වැලිමුවපතාන', NULL, NULL, '50358', 8.4333, 80.8667, 1, 1, 1, NULL, NULL),
(172, 2, 'Welioya Project', 'වැලිඔය ව්‍යාපෘතිය', NULL, NULL, '50586', 8.5595, 80.5476, 1, 1, 1, NULL, NULL),
(173, 3, 'Akkarasiyaya', 'අක්කරසියය', NULL, NULL, '90166', 6.7792, 80.9208, 1, 1, 1, NULL, NULL),
(174, 3, 'Aluketiyawa', 'අලුකෙටියාව', NULL, NULL, '90736', 7.317155, 81.127134, 1, 1, 1, NULL, NULL),
(175, 3, 'Aluttaramma', 'අළුත්තරම', NULL, NULL, '90722', 7.2167, 81.0667, 1, 1, 1, NULL, NULL),
(176, 3, 'Ambadandegama', 'අඹදන්ඩෙගම', NULL, NULL, '90108', 6.81591, 81.056492, 1, 1, 1, NULL, NULL),
(177, 3, 'Ambagasdowa', 'අඹගස්දූව', NULL, NULL, '90300', 6.928519, 80.892126, 1, 1, 1, NULL, NULL),
(178, 3, 'Arawa', 'අරාව', NULL, NULL, '90017', 7.162769, 81.07755, 1, 1, 1, NULL, NULL),
(179, 3, 'Arawakumbura', 'අරාවකුඹුර', NULL, NULL, '90532', 7.084925, 81.198802, 1, 1, 1, NULL, NULL),
(180, 3, 'Arawatta', 'අරාවත්ත', NULL, NULL, '90712', 7.328715, 81.036976, 1, 1, 1, NULL, NULL),
(181, 3, 'Atakiriya', 'අටකිරියාව', NULL, NULL, '90542', 7.0667, 81.1056, 1, 1, 1, NULL, NULL),
(182, 3, 'Badulla', 'බදුල්ල', NULL, NULL, '90000', 6.995365, 81.048438, 1, 1, 1, NULL, NULL),
(183, 3, 'Baduluoya', 'බදුලුඔය', NULL, NULL, '90019', 7.151852, 81.023867, 1, 1, 1, NULL, NULL),
(184, 3, 'Ballaketuwa', 'බල්ලකැටුව', NULL, NULL, '90092', 6.862905, 81.097249, 1, 1, 1, NULL, NULL),
(185, 3, 'Bambarapana', 'බඹරපාන', NULL, NULL, '90322', 7.1167, 81.0375, 1, 1, 1, NULL, NULL),
(186, 3, 'Bandarawela', 'බණ්ඩාරවෙල', NULL, NULL, '90100', 6.828867, 80.990898, 1, 1, 1, NULL, NULL),
(187, 3, 'Beramada', 'බෙරමඩ', NULL, NULL, '90066', 7.055713, 80.987238, 1, 1, 1, NULL, NULL),
(188, 3, 'Bibilegama', 'බිබිලේගම', NULL, NULL, '90502', 6.887473, 81.141268, 1, 1, 1, NULL, NULL),
(189, 3, 'Boragas', 'බොරගස්', NULL, NULL, '90362', 6.901625, 80.840162, 1, 1, 1, NULL, NULL),
(190, 3, 'Boralanda', 'බොරලන්ද', NULL, NULL, '90170', 6.828637, 80.881603, 1, 1, 1, NULL, NULL),
(191, 3, 'Bowela', 'බෝවෙල', NULL, NULL, '90302', 6.95, 80.9333, 1, 1, 1, NULL, NULL),
(192, 3, 'Central Camp', 'මධ්‍යම කඳවුර', NULL, NULL, '32050', 7.3589, 81.1759, 1, 1, 1, NULL, NULL),
(193, 3, 'Damanewela', 'දමනෙවෙල', NULL, NULL, '32126', 7.2125, 81.0583, 1, 1, 1, NULL, NULL),
(194, 3, 'Dambana', 'දඹාන', NULL, NULL, '90714', 7.3583, 81.1083, 1, 1, 1, NULL, NULL),
(195, 3, 'Dehiattakandiya', 'දෙහිඅත්තකන්ඩිය', NULL, NULL, '32150', 7.2125, 81.0583, 1, 1, 1, NULL, NULL),
(196, 3, 'Demodara', 'දෙමෝදර', NULL, NULL, '90080', 6.899055, 81.053273, 1, 1, 1, NULL, NULL),
(197, 3, 'Diganatenna', 'දිගනතැන්න', NULL, NULL, '90132', 6.8667, 80.9667, 1, 1, 1, NULL, NULL),
(198, 3, 'Dikkapitiya', 'දික්කපිටිය', NULL, NULL, '90214', 6.7381, 80.9669, 1, 1, 1, NULL, NULL),
(199, 3, 'Dimbulana', 'දිඹුලාන', NULL, NULL, '90324', 7.006897, 80.948431, 1, 1, 1, NULL, NULL),
(200, 3, 'Divulapelessa', 'දිවුලපැලැස්ස', NULL, NULL, '90726', 7.2167, 81.0667, 1, 1, 1, NULL, NULL),
(201, 3, 'Diyatalawa', 'දියතලාව', NULL, NULL, '90150', 6.8, 80.9667, 1, 1, 1, NULL, NULL),
(202, 3, 'Dulgolla', 'දුල්ගොල්ල', NULL, NULL, '90104', 6.819618, 81.012115, 1, 1, 1, NULL, NULL),
(203, 3, 'Ekiriyankumbura', 'ඇකිරියන්කුඹුර', NULL, NULL, '91502', 7.269736, 81.226709, 1, 1, 1, NULL, NULL),
(204, 3, 'Ella', 'ඇල්ල', NULL, NULL, '90090', 6.874485, 81.050937, 1, 1, 1, NULL, NULL),
(205, 3, 'Ettampitiya', 'ඇට්ටම්පිටිය', NULL, NULL, '90140', 6.9342, 80.9853, 1, 1, 1, NULL, NULL),
(206, 3, 'Galauda', 'ගලඋඩ', NULL, NULL, '90065', 7.037347, 80.981759, 1, 1, 1, NULL, NULL),
(207, 3, 'Galporuyaya', 'ගල්පොරුයාය', NULL, NULL, '90752', 7.4, 81.05, 1, 1, 1, NULL, NULL),
(208, 3, 'Gawarawela', 'ගවරවෙල', NULL, NULL, '90082', 6.897394, 81.069668, 1, 1, 1, NULL, NULL),
(209, 3, 'Girandurukotte', 'ගිරාඳුරුකෝට්ටෙ', NULL, NULL, '90750', 7.4, 81.05, 1, 1, 1, NULL, NULL),
(210, 3, 'Godunna', 'ගොඩුන්න', NULL, NULL, '90067', 7.071959, 80.975003, 1, 1, 1, NULL, NULL),
(211, 3, 'Gurutalawa', 'ගුරුතලාව', NULL, NULL, '90208', 6.8431, 80.9228, 1, 1, 1, NULL, NULL),
(212, 3, 'Haldummulla', 'හල්දුම්මුල්ල', NULL, NULL, '90180', 6.77061, 80.884385, 1, 1, 1, NULL, NULL),
(213, 3, 'Hali Ela', 'හාලි ඇල', NULL, NULL, '90060', 6.95, 81.0333, 1, 1, 1, NULL, NULL),
(214, 3, 'Hangunnawa', 'හඟුන්නෑව', NULL, NULL, '90224', 6.948019, 80.871427, 1, 1, 1, NULL, NULL),
(215, 3, 'Haputale', 'හපුතලේ', NULL, NULL, '90160', 6.7667, 80.9667, 1, 1, 1, NULL, NULL),
(216, 3, 'Hebarawa', 'හබරාව', NULL, NULL, '90724', 7.2167, 81.0667, 1, 1, 1, NULL, NULL),
(217, 3, 'Heeloya', 'හීලොය', NULL, NULL, '90112', 6.8212, 80.9407, 1, 1, 1, NULL, NULL),
(218, 3, 'Helahalpe', 'හෙලහල්පේ', NULL, NULL, '90122', 6.8212, 80.9407, 1, 1, 1, NULL, NULL),
(219, 3, 'Helapupula', 'හෙලපුපුළ', NULL, NULL, '90094', 6.8556, 81.0722, 1, 1, 1, NULL, NULL),
(220, 3, 'Hopton', 'හෝප්ටන්', NULL, NULL, '90524', 6.9594, 81.1552, 1, 1, 1, NULL, NULL),
(221, 3, 'Idalgashinna', 'ඉදල්ගස්ඉන්න', NULL, NULL, '96167', 6.7833, 80.9, 1, 1, 1, NULL, NULL),
(222, 3, 'Kahataruppa', 'කහටරුප්ප', NULL, NULL, '90052', 7.023705, 81.105188, 1, 1, 1, NULL, NULL),
(223, 3, 'Kalugahakandura', 'කළුගහකණ්ඳුර', NULL, NULL, '90546', 7.123675, 81.094178, 1, 1, 1, NULL, NULL),
(224, 3, 'Kalupahana', 'කළුපහණ', NULL, NULL, '90186', 6.770298, 80.854521, 1, 1, 1, NULL, NULL),
(225, 3, 'Kebillawela', 'කොබිල්ලවෙල', NULL, NULL, '90102', 6.816937, 80.993072, 1, 1, 1, NULL, NULL),
(226, 3, 'Kendagolla', 'කන්දෙගොල්ල', NULL, NULL, '90048', 6.990765, 81.110073, 1, 1, 1, NULL, NULL),
(227, 3, 'Keselpotha', 'කෙසෙල්පොත', NULL, NULL, '90738', 7.32819, 81.083285, 1, 1, 1, NULL, NULL),
(228, 3, 'Ketawatta', 'කේතවත්ත', NULL, NULL, '90016', 7.103503, 81.080813, 1, 1, 1, NULL, NULL),
(229, 3, 'Kiriwanagama', 'කිරිවනගම', NULL, NULL, '90184', 6.971183, 80.91551, 1, 1, 1, NULL, NULL),
(230, 3, 'Koslanda', 'කොස්ලන්ද', NULL, NULL, '90190', 6.759935, 81.027417, 1, 1, 1, NULL, NULL),
(231, 3, 'Kuruwitenna', 'කුරුවිතැන්න', NULL, NULL, '90728', 7.2167, 81.0667, 1, 1, 1, NULL, NULL),
(232, 3, 'Kuttiyagolla', 'කුට්ටියාගොල්ල', NULL, NULL, '90046', 7.0167, 81.0833, 1, 1, 1, NULL, NULL),
(233, 3, 'Landewela', 'ලන්දේවෙල', NULL, NULL, '90068', 7.002113, 81.000496, 1, 1, 1, NULL, NULL),
(234, 3, 'Liyangahawela', 'ලියන්ගහවෙල', NULL, NULL, '90106', 6.817452, 81.032456, 1, 1, 1, NULL, NULL),
(235, 3, 'Lunugala', 'ලුණුගල', NULL, NULL, '90530', 7.041299, 81.199335, 1, 1, 1, NULL, NULL),
(236, 3, 'Lunuwatta', 'ලුණුවත්ත', NULL, NULL, '90310', 6.953933, 80.917059, 1, 1, 1, NULL, NULL),
(237, 3, 'Madulsima', 'මඩොල්සිම', NULL, NULL, '90535', 7.045064, 81.133375, 1, 1, 1, NULL, NULL),
(238, 3, 'Mahiyanganaya', 'මහියංගනය', NULL, NULL, '90700', 7.2444, 81.1167, 1, 1, 1, NULL, NULL),
(239, 3, 'Makulella', 'මකුලැල්ල', NULL, NULL, '90114', 6.8212, 80.9407, 1, 1, 1, NULL, NULL),
(240, 3, 'Malgoda', 'මල්ගොඩ', NULL, NULL, '90754', 7.4, 81.05, 1, 1, 1, NULL, NULL),
(241, 3, 'Mapakadawewa', 'මාපාකඩවැව', NULL, NULL, '90730', 7.3, 81.1167, 1, 1, 1, NULL, NULL),
(242, 3, 'Maspanna', 'මස්පන්න', NULL, NULL, '90328', 7.024427, 80.942159, 1, 1, 1, NULL, NULL),
(243, 3, 'Maussagolla', 'මාඋස්සගොඩ', NULL, NULL, '90582', 6.898433, 81.147817, 1, 1, 1, NULL, NULL),
(244, 3, 'Mawanagama', 'මාවනගම', NULL, NULL, '32158', 7.2125, 81.0583, 1, 1, 1, NULL, NULL),
(245, 3, 'Medawela Udukinda', 'මැදවෙල උඩුකිඳ', NULL, NULL, '90218', 6.846, 80.9279, 1, 1, 1, NULL, NULL),
(246, 3, 'Meegahakiula', 'මීගහකිවුල', NULL, NULL, '90015', 7.0833, 80.9833, 1, 1, 1, NULL, NULL),
(247, 3, 'Metigahatenna', 'මැටිගහතැන්න', NULL, NULL, '90540', 6.9667, 81.0833, 1, 1, 1, NULL, NULL),
(248, 3, 'Mirahawatta', 'මිරහවත්ත', NULL, NULL, '90134', 6.8817, 80.9347, 1, 1, 1, NULL, NULL),
(249, 3, 'Miriyabedda', 'මිරියාබැද්ද', NULL, NULL, '90504', 6.9167, 81.15, 1, 1, 1, NULL, NULL),
(250, 3, 'Nawamedagama', 'නවමැදගම', NULL, NULL, '32120', 7.2125, 81.0583, 1, 1, 1, NULL, NULL),
(251, 3, 'Nelumgama', 'නෙළුම්ගම', NULL, NULL, '90042', 7, 81.0917, 1, 1, 1, NULL, NULL),
(252, 3, 'Nikapotha', 'නිකපොතගම', NULL, NULL, '90165', 6.740622, 80.97083, 1, 1, 1, NULL, NULL),
(253, 3, 'Nugatalawa', 'නුගතලාව', NULL, NULL, '90216', 6.9, 80.8833, 1, 1, 1, NULL, NULL),
(254, 3, 'Ohiya', 'ඔහිය', NULL, NULL, '90168', 6.821352, 80.841789, 1, 1, 1, NULL, NULL),
(255, 3, 'Pahalarathkinda', 'පහළරත්කිඳ', NULL, NULL, '90756', 7.4, 81.05, 1, 1, 1, NULL, NULL),
(256, 3, 'Pallekiruwa', 'පල්ලේකිරුව', NULL, NULL, '90534', 7.007551, 81.227033, 1, 1, 1, NULL, NULL),
(257, 3, 'Passara', 'පස්සර', NULL, NULL, '90500', 6.935017, 81.151166, 1, 1, 1, NULL, NULL),
(258, 3, 'Pattiyagedara', 'පට්ටියගෙදර', NULL, NULL, '90138', 6.8742, 80.9507, 1, 1, 1, NULL, NULL),
(259, 3, 'Pelagahatenna', 'පල්ලෙගහතැන්න', NULL, NULL, '90522', 6.9594, 81.1552, 1, 1, 1, NULL, NULL),
(260, 3, 'Perawella', 'පේරවැල්ල', NULL, NULL, '90222', 6.943148, 80.84264, 1, 1, 1, NULL, NULL),
(261, 3, 'Pitamaruwa', 'පිටමාරුව', NULL, NULL, '90544', 7.106546, 81.135882, 1, 1, 1, NULL, NULL),
(262, 3, 'Pitapola', 'පිටපොළ', NULL, NULL, '90171', 6.803692, 80.884474, 1, 1, 1, NULL, NULL),
(263, 3, 'Puhulpola', 'පුහුපොළ', NULL, NULL, '90212', 6.907145, 80.931109, 1, 1, 1, NULL, NULL),
(264, 3, 'Rajagalatenna', 'රජගලතැන්න', NULL, NULL, '32068', 7.5458, 81.125, 1, 1, 1, NULL, NULL),
(265, 3, 'Rathkarawwa', 'රත්කරව්ව', NULL, NULL, '90164', 6.8, 80.9167, 1, 1, 1, NULL, NULL),
(266, 3, 'Ridimaliyadda', 'රිදීමල්දෙණිය', NULL, NULL, '90704', 7.2333, 81.1, 1, 1, 1, NULL, NULL),
(267, 3, 'Silmiyapura', 'සිල්මියාපුර', NULL, NULL, '90364', 6.912388, 80.843988, 1, 1, 1, NULL, NULL),
(268, 3, 'Sirimalgoda', 'සිරිමල්ගොඩ', NULL, NULL, '90044', 7.003857, 81.073671, 1, 1, 1, NULL, NULL),
(269, 3, 'Siripura', 'සිරිපුර', NULL, NULL, '32155', 7.2125, 81.0583, 1, 1, 1, NULL, NULL),
(270, 3, 'Sorabora Colony', 'සොරබොර කොලනිය', NULL, NULL, '90718', 7.3583, 81.1083, 1, 1, 1, NULL, NULL),
(271, 3, 'Soragune', 'සොරගුනේ', NULL, NULL, '90183', 6.8333, 80.8778, 1, 1, 1, NULL, NULL),
(272, 3, 'Soranathota', 'සොරණාතොට', NULL, NULL, '90008', 7.0167, 81.05, 1, 1, 1, NULL, NULL),
(273, 3, 'Taldena', 'තල්දෙන', NULL, NULL, '90014', 7.0833, 81.05, 1, 1, 1, NULL, NULL),
(274, 3, 'Timbirigaspitiya', 'තිඹිරිගස්පිටිය', NULL, NULL, '90012', 7.0333, 81.05, 1, 1, 1, NULL, NULL),
(275, 3, 'Uduhawara', 'උඩුහාවර', NULL, NULL, '90226', 6.94706, 80.85877, 1, 1, 1, NULL, NULL),
(276, 3, 'Uraniya', 'උරණිය', NULL, NULL, '90702', 7.237143, 81.102818, 1, 1, 1, NULL, NULL),
(277, 3, 'Uva Karandagolla', 'ඌව කරඳගොල්ල', NULL, NULL, '90091', 6.8333, 81.0667, 1, 1, 1, NULL, NULL),
(278, 3, 'Uva Mawelagama', 'ඌව මාවැල්ගම', NULL, NULL, '90192', 6.7333, 81.0167, 1, 1, 1, NULL, NULL),
(279, 3, 'Uva Tenna', 'ඌව තැන්න', NULL, NULL, '90188', 6.8333, 80.8778, 1, 1, 1, NULL, NULL),
(280, 3, 'Uva Tissapura', 'ඌව තිස්සපුර', NULL, NULL, '90734', 7.3, 81.1167, 1, 1, 1, NULL, NULL),
(281, 3, 'Welimada', 'වැලිමඩ', NULL, NULL, '90200', 6.906059, 80.913222, 1, 1, 1, NULL, NULL),
(282, 3, 'Weranketagoda', 'වෑරැන්කැටගොඩ', NULL, NULL, '32062', 7.5458, 81.125, 1, 1, 1, NULL, NULL),
(283, 3, 'Wewatta', 'වෑවත්ත', NULL, NULL, '90716', 7.337729, 81.201255, 1, 1, 1, NULL, NULL),
(284, 3, 'Wineethagama', 'විනීතගම', NULL, NULL, '90034', 7.029, 80.937, 1, 1, 1, NULL, NULL),
(285, 3, 'Yalagamuwa', 'යාලගමුව', NULL, NULL, '90329', 7.047834, 80.950541, 1, 1, 1, NULL, NULL),
(286, 3, 'Yalwela', 'යල්වෙල', NULL, NULL, '90706', 7.2667, 81.15, 1, 1, 1, NULL, NULL),
(287, 4, 'Addalaichenai', 'අඩ්ඩාලච්චේන', NULL, NULL, '32350', 7.4833, 81.75, 1, 1, 1, NULL, NULL),
(288, 4, 'Ampilanthurai', 'අම්පිලන්තුරෙයි', NULL, NULL, '30162', 7.8597, 81.4411, 1, 1, 1, NULL, NULL),
(289, 4, 'Araipattai', NULL, NULL, NULL, '30150', 7.667705, 81.725335, 1, 1, 1, NULL, NULL),
(290, 4, 'Ayithiyamalai', NULL, NULL, NULL, '30362', 7.670934, 81.574798, 1, 1, 1, NULL, NULL),
(291, 4, 'Bakiella', NULL, NULL, NULL, '30206', 7.5083, 81.7583, 1, 1, 1, NULL, NULL),
(292, 4, 'Batticaloa', 'මඩකලපුව', NULL, NULL, '30000', 7.7167, 81.7, 1, 1, 1, NULL, NULL),
(293, 4, 'Cheddipalayam', 'චෙඩ්ඩිපලයම්', NULL, NULL, '30194', 7.575161, 81.783189, 1, 1, 1, NULL, NULL),
(294, 4, 'Chenkaladi', 'චෙන්කලඩි', NULL, NULL, '30350', 7.7833, 81.6, 1, 1, 1, NULL, NULL),
(295, 4, 'Eravur', 'එරාවූර්', NULL, NULL, '30300', 7.768518, 81.619817, 1, 1, 1, NULL, NULL),
(296, 4, 'Kaluwanchikudi', 'කළුවංචිකුඩි', NULL, NULL, '30200', 7.5167, 81.7833, 1, 1, 1, NULL, NULL),
(297, 4, 'Kaluwankemy', 'කළුවන්කෙමි', NULL, NULL, '30372', 7.8, 81.5667, 1, 1, 1, NULL, NULL),
(298, 4, 'Kannankudah', 'කන්නන්කුඩා', NULL, NULL, '30016', 7.675505, 81.674125, 1, 1, 1, NULL, NULL),
(299, 4, 'Karadiyanaru', 'කරදියනාරු', NULL, NULL, '30354', 7.689478, 81.531117, 1, 1, 1, NULL, NULL),
(300, 4, 'Kathiraveli', 'කදිරවේලි', NULL, NULL, '30456', 8.243933, 81.360298, 1, 1, 1, NULL, NULL),
(301, 4, 'Kattankudi', 'කාත්තන්කුඩි', NULL, NULL, '30100', 7.675, 81.73, 1, 1, 1, NULL, NULL),
(302, 4, 'Kiran', 'කිරාන්', NULL, NULL, '30394', 7.866841, 81.529737, 1, 1, 1, NULL, NULL),
(303, 4, 'Kirankulam', 'කිරාන්කුලම්', NULL, NULL, '30159', 7.615628, 81.764245, 1, 1, 1, NULL, NULL),
(304, 4, 'Koddaikallar', 'කොඩ්ඩෙයිකල්ලාර්', NULL, NULL, '30249', 7.6389, 81.6639, 1, 1, 1, NULL, NULL),
(305, 4, 'Kokkaddicholai', 'කොක්කඩිචෝලෙයි', NULL, NULL, '30160', 7.8597, 81.4411, 1, 1, 1, NULL, NULL),
(306, 4, 'Kurukkalmadam', 'කුරුක්කල්මඩම්', NULL, NULL, '30192', 7.594069, 81.77497, 1, 1, 1, NULL, NULL),
(307, 4, 'Mandur', 'මන්දූර්', NULL, NULL, '30220', 7.482114, 81.762407, 1, 1, 1, NULL, NULL),
(308, 4, 'Miravodai', 'මිරවෝඞායි', NULL, NULL, '30426', 7.9, 81.5167, 1, 1, 1, NULL, NULL),
(309, 4, 'Murakottanchanai', 'මුරකොට්ටන්චනෛ', NULL, NULL, '30392', 7.8667, 81.5333, 1, 1, 1, NULL, NULL),
(310, 4, 'Navagirinagar', 'නවගිරිනගර්', NULL, NULL, '30238', 7.525, 81.725, 1, 1, 1, NULL, NULL),
(311, 4, 'Navatkadu', 'නවත්කදු', NULL, NULL, '30018', 7.5833, 81.7167, 1, 1, 1, NULL, NULL),
(312, 4, 'Oddamavadi', 'ඔට්ටමාවඩ්', NULL, NULL, '30420', 7.9167, 81.5167, 1, 1, 1, NULL, NULL),
(313, 4, 'Palamunai', 'පාලමුන', NULL, NULL, '32354', 7.4833, 81.75, 1, 1, 1, NULL, NULL),
(314, 4, 'Pankudavely', 'පාන්කුඩාවේලි', NULL, NULL, '30352', 7.75, 81.5667, 1, 1, 1, NULL, NULL),
(315, 4, 'Periyaporativu', 'පෙරියපෝරතිවු', NULL, NULL, '30230', 7.536243, 81.764557, 1, 1, 1, NULL, NULL),
(316, 4, 'Periyapullumalai', 'පෙරියපුල්ලුමලෙයි', NULL, NULL, '30358', 7.561255, 81.47434, 1, 1, 1, NULL, NULL),
(317, 4, 'Pillaiyaradi', 'පිල්ලියරදී', NULL, NULL, '30022', 7.75, 81.6333, 1, 1, 1, NULL, NULL),
(318, 4, 'Punanai', 'පූනානයි', NULL, NULL, '30428', 7.9667, 81.3833, 1, 1, 1, NULL, NULL),
(319, 4, 'Thannamunai', 'තන්නමුනෛ', NULL, NULL, '30024', 7.76355, 81.645852, 1, 1, 1, NULL, NULL),
(320, 4, 'Thettativu', 'තෙටිටතිවු', NULL, NULL, '30196', 7.5833, 81.7833, 1, 1, 1, NULL, NULL),
(321, 4, 'Thikkodai', 'තික්කොඞයි', NULL, NULL, '30236', 7.525269, 81.684177, 1, 1, 1, NULL, NULL),
(322, 4, 'Thirupalugamam', 'තිරුපලුගාමම්', NULL, NULL, '30234', 7.525, 81.725, 1, 1, 1, NULL, NULL),
(323, 4, 'Unnichchai', 'උන්නිච්චේ', NULL, NULL, '30364', 7.6167, 81.55, 1, 1, 1, NULL, NULL),
(324, 4, 'Vakaneri', NULL, NULL, NULL, '30424', 7.9167, 81.4333, 1, 1, 1, NULL, NULL),
(325, 4, 'Vakarai', 'වාකරෙයි', NULL, NULL, '30450', 8.165968, 81.415623, 1, 1, 1, NULL, NULL),
(326, 4, 'Valaichenai', 'වාලච්චේන', NULL, NULL, '30400', 7.7, 81.6, 1, 1, 1, NULL, NULL),
(327, 4, 'Vantharumoolai', 'වන්තරුමූලෙයි', NULL, NULL, '30376', 7.807445, 81.591476, 1, 1, 1, NULL, NULL),
(328, 4, 'Vellavely', NULL, NULL, NULL, '30204', 7.5, 81.7333, 1, 1, 1, NULL, NULL),
(329, 5, 'Akarawita', 'අකරවිට', NULL, NULL, '10732', 6.95, 80.1, 1, 1, 1, NULL, NULL),
(330, 5, 'Ambalangoda', 'අම්බලන්ගොඩ', NULL, NULL, '80300', 6.77533, 79.96413, 1, 1, 1, NULL, NULL),
(331, 5, 'Athurugiriya', 'අතුරුගිරිය', NULL, NULL, '10150', 6.873072, 79.997214, 1, 1, 1, NULL, NULL),
(332, 5, 'Avissawella', 'අවිස්සාවේල්ල', NULL, NULL, '10700', 6.955003, 80.211692, 1, 1, 1, NULL, NULL),
(333, 5, 'Batawala', 'බටවැල', NULL, NULL, '10513', 6.877924, 80.051592, 1, 1, 1, NULL, NULL),
(334, 5, 'Battaramulla', 'බත්තරමුල්ල', NULL, NULL, '10120', 6.900299, 79.922136, 1, 1, 1, NULL, NULL),
(335, 5, 'Biyagama', 'බියගම', NULL, NULL, '11650', 6.9408, 79.9889, 1, 1, 1, NULL, NULL),
(336, 5, 'Bope', 'බෝපෙ', NULL, NULL, '10522', 6.8333, 80.1167, 1, 1, 1, NULL, NULL),
(337, 5, 'Boralesgamuwa', 'බොරලැස්ගමුව', NULL, NULL, '10290', 6.8425, 79.9006, 1, 1, 1, NULL, NULL),
(338, 5, 'Colombo 8', 'කොළඹ 8', 'கொழும்பு 8', 'Borella', '00800', 6.914722, 79.877778, 1, 1, 1, NULL, NULL),
(339, 5, 'Dedigamuwa', 'දැඩිගමුව', NULL, NULL, '10656', 6.9115, 80.0622, 1, 1, 1, NULL, NULL),
(340, 5, 'Dehiwala', 'දෙහිවල', NULL, NULL, '10350', 6.856387, 79.865156, 1, 1, 1, NULL, NULL),
(341, 5, 'Deltara', 'දෙල්තර', NULL, NULL, '10302', 6.7833, 79.9167, 1, 1, 1, NULL, NULL),
(342, 5, 'Habarakada', 'හබරකඩ', NULL, NULL, '10204', 6.882518, 80.017704, 1, 1, 1, NULL, NULL),
(343, 5, 'Hanwella', 'හන්වැල්ල', NULL, NULL, '10650', 6.905988, 80.083333, 1, 1, 1, NULL, NULL),
(344, 5, 'Hiripitya', 'හිරිපිටිය', NULL, NULL, '10232', 6.85, 79.95, 1, 1, 1, NULL, NULL),
(345, 5, 'Hokandara', 'හොකන්දර', NULL, NULL, '10118', 6.890237, 79.969894, 1, 1, 1, NULL, NULL),
(346, 5, 'Homagama', 'හෝමාගම', NULL, NULL, '10200', 6.85685, 80.005384, 1, 1, 1, NULL, NULL),
(347, 5, 'Horagala', 'හොරගල', NULL, NULL, '10502', 6.807635, 80.066995, 1, 1, 1, NULL, NULL),
(348, 5, 'Kaduwela', 'කඩුවෙල', NULL, NULL, '10640', 6.930497, 79.984817, 1, 1, 1, NULL, NULL),
(349, 5, 'Kaluaggala', 'කළුගල්ල', NULL, NULL, '11224', 6.9167, 80.1, 1, 1, 1, NULL, NULL),
(350, 5, 'Kapugoda', 'කපුගොඩ', NULL, NULL, '10662', 6.9486, 80.1, 1, 1, 1, NULL, NULL),
(351, 5, 'Kehelwatta', 'කොහල්වත්ත', NULL, NULL, '12550', 6.75, 79.9167, 1, 1, 1, NULL, NULL),
(352, 5, 'Kiriwattuduwa', 'කිරිවත්තුඩුව', NULL, NULL, '10208', 6.804157, 80.009759, 1, 1, 1, NULL, NULL),
(353, 5, 'Kolonnawa', 'කොලොන්නාව', NULL, NULL, '10600', 6.933035, 79.888095, 1, 1, 1, NULL, NULL),
(354, 5, 'Kosgama', 'කොස්ගම', NULL, NULL, '10730', 6.9333, 80.1411, 1, 1, 1, NULL, NULL),
(355, 5, 'Madapatha', 'මඩපාත', NULL, NULL, '10306', 6.766824, 79.930103, 1, 1, 1, NULL, NULL),
(356, 5, 'Maharagama', 'මහරගම', NULL, NULL, '10280', 6.843401, 79.932766, 1, 1, 1, NULL, NULL),
(357, 5, 'Malabe', 'මාළඹේ', NULL, NULL, '10115', 6.901241, 79.958072, 1, 1, 1, NULL, NULL),
(358, 5, 'Moratuwa', 'මොරටුව', NULL, NULL, '10400', 6.7733, 79.8825, 1, 1, 1, NULL, NULL),
(359, 5, 'Mount Lavinia', 'ගල්කිස්ස', NULL, NULL, '10370', 6.838864, 79.863141, 1, 1, 1, NULL, NULL),
(360, 5, 'Mullegama', 'මුල්ලේගම', NULL, NULL, '10202', 6.887403, 80.012959, 1, 1, 1, NULL, NULL),
(361, 5, 'Napawela', 'නාපාවෙල', NULL, NULL, '10704', 6.9531, 80.2183, 1, 1, 1, NULL, NULL),
(362, 5, 'Nugegoda', 'නුගේගොඩ', NULL, NULL, '10250', 6.877563, 79.886231, 1, 1, 1, NULL, NULL),
(363, 5, 'Padukka', 'පාදුක්ක', NULL, NULL, '10500', 6.837834, 80.090301, 1, 1, 1, NULL, NULL),
(364, 5, 'Pannipitiya', 'පන්නිපිටිය', NULL, NULL, '10230', 6.843999, 79.944518, 1, 1, 1, NULL, NULL),
(365, 5, 'Piliyandala', 'පිළියන්දල', NULL, NULL, '10300', 6.7981, 79.9264, 1, 1, 1, NULL, NULL),
(366, 5, 'Pitipana Homagama', 'පිටිපාන හෝමාගම', NULL, NULL, '10206', 6.8477, 80.016, 1, 1, 1, NULL, NULL),
(367, 5, 'Polgasowita', 'පොල්ගස්ඕවිට', NULL, NULL, '10320', 6.7842, 79.9811, 1, 1, 1, NULL, NULL),
(368, 5, 'Pugoda', 'පූගොඩ', NULL, NULL, '10660', 6.9703, 80.1222, 1, 1, 1, NULL, NULL),
(369, 5, 'Ranala', 'රණාල', NULL, NULL, '10654', 6.915253, 80.032962, 1, 1, 1, NULL, NULL),
(370, 5, 'Siddamulla', 'සිද්ධමුල්ල', NULL, NULL, '10304', 6.815785, 79.955978, 1, 1, 1, NULL, NULL),
(371, 5, 'Siyambalagoda', 'සියඹලාගොඩ', NULL, NULL, '81462', 6.800041, 79.966845, 1, 1, 1, NULL, NULL),
(372, 5, 'Sri Jayawardenepura', 'ශ්‍රී ජයවර්ධනපුර', NULL, NULL, '10100', 6.8897, 79.9359, 1, 1, 1, NULL, NULL),
(373, 5, 'Talawatugoda', 'තලවතුගොඩ', NULL, NULL, '10116', 6.8692, 79.9411, 1, 1, 1, NULL, NULL),
(374, 5, 'Tummodara', 'තුම්මෝදර', NULL, NULL, '10682', 6.9061, 80.1353, 1, 1, 1, NULL, NULL),
(375, 5, 'Waga', 'වග', NULL, NULL, '10680', 6.9061, 80.1353, 1, 1, 1, NULL, NULL),
(376, 5, 'Colombo 6', 'කොළඹ 6', 'கொழும்பு 6', 'Wellawatta', '00600', 6.874657, 79.860483, 1, 1, 1, NULL, NULL),
(377, 6, 'Agaliya', 'අගලිය', NULL, NULL, '80212', 6.1833, 80.2, 1, 1, 1, NULL, NULL),
(378, 6, 'Ahangama', 'අහංගම', NULL, NULL, '80650', 5.970765, 80.370204, 1, 1, 1, NULL, NULL),
(379, 6, 'Ahungalla', 'අහුන්ගල්ල', NULL, NULL, '80562', 6.315216, 80.03029, 1, 1, 1, NULL, NULL),
(380, 6, 'Akmeemana', 'අක්මීමාන', NULL, NULL, '80090', 6.1845, 80.3032, 1, 1, 1, NULL, NULL),
(381, 6, 'Alawatugoda', 'අලවතුගොඩ', NULL, NULL, '20140', 6.4167, 80, 1, 1, 1, NULL, NULL),
(382, 6, 'Aluthwala', 'අළුත්වල', NULL, NULL, '80332', 6.180801, 80.136538, 1, 1, 1, NULL, NULL),
(383, 6, 'Ampegama', 'අම්පෙගම', NULL, NULL, '80204', 6.193907, 80.14453, 1, 1, 1, NULL, NULL),
(384, 6, 'Amugoda', 'අමුගොඩ', NULL, NULL, '80422', 6.314635, 80.22104, 1, 1, 1, NULL, NULL),
(385, 6, 'Anangoda', 'අනන්ගොඩ', NULL, NULL, '80044', 6.0722, 80.2389, 1, 1, 1, NULL, NULL),
(386, 6, 'Angulugaha', 'අඟුලුගහ', NULL, NULL, '80122', 6.036963, 80.322148, 1, 1, 1, NULL, NULL),
(387, 6, 'Ankokkawala', 'අංකොක්කාවල', NULL, NULL, '80048', 6.05329, 80.274014, 1, 1, 1, NULL, NULL),
(388, 6, 'Aselapura', 'ඇසලපුර', NULL, NULL, '51072', 6.3167, 80.0333, 1, 1, 1, NULL, NULL),
(389, 6, 'Baddegama', 'බද්දේගම', NULL, NULL, '80200', 6.165975, 80.201841, 1, 1, 1, NULL, NULL),
(390, 6, 'Balapitiya', 'බලපිටිය', NULL, NULL, '80550', 6.269254, 80.036054, 1, 1, 1, NULL, NULL),
(391, 6, 'Banagala', 'බනගල', NULL, NULL, '80143', 6.2706, 80.42, 1, 1, 1, NULL, NULL),
(392, 6, 'Batapola', 'බටපොල', NULL, NULL, '80320', 6.235697, 80.120034, 1, 1, 1, NULL, NULL),
(393, 6, 'Bentota', 'බෙන්තොට', NULL, NULL, '80500', 6.4211, 79.9989, 1, 1, 1, NULL, NULL),
(394, 6, 'Boossa', 'බූස්ස', NULL, NULL, '80270', 6.2233, 80.2, 1, 1, 1, NULL, NULL),
(395, 6, 'Dellawa', 'දෙල්ලව', NULL, NULL, '81477', 6.335012, 80.452741, 1, 1, 1, NULL, NULL),
(396, 6, 'Dikkumbura', 'දික්කුඹුර', NULL, NULL, '80654', 6.012945, 80.376153, 1, 1, 1, NULL, NULL),
(397, 6, 'Dodanduwa', 'දොඩන්දූව', NULL, NULL, '80250', 6.0967, 80.1456, 1, 1, 1, NULL, NULL),
(398, 6, 'Ella Tanabaddegama', 'ඇල්ල තනබද්දේගම', NULL, NULL, '80402', 6.2922, 80.1988, 1, 1, 1, NULL, NULL),
(399, 6, 'Elpitiya', 'ඇල්පිටිය', NULL, NULL, '80400', 6.300214, 80.171923, 1, 1, 1, NULL, NULL),
(400, 6, 'Galle', 'ගාල්ල', NULL, NULL, '80000', 6.0536, 80.2117, 1, 1, 1, NULL, NULL),
(401, 6, 'Ginimellagaha', 'ගිනිමෙල්ලගහ', NULL, NULL, '80220', 6.2233, 80.2, 1, 1, 1, NULL, NULL),
(402, 6, 'Gintota', 'ගින්තොට', NULL, NULL, '80280', 6.0564, 80.1839, 1, 1, 1, NULL, NULL),
(403, 6, 'Godahena', 'ගොඩහේන', NULL, NULL, '80302', 6.2333, 80.0667, 1, 1, 1, NULL, NULL),
(404, 6, 'Gonamulla Junction', 'ගෝනමුල්ල හංදිය', NULL, NULL, '80054', 6.0667, 80.3, 1, 1, 1, NULL, NULL),
(405, 6, 'Gonapinuwala', 'ගොනාපිනූවල', NULL, NULL, '80230', 6.2233, 80.2, 1, 1, 1, NULL, NULL),
(406, 6, 'Habaraduwa', 'හබරාදූව', NULL, NULL, '80630', 6.0043, 80.326, 1, 1, 1, NULL, NULL),
(407, 6, 'Haburugala', 'හබුරුගල', NULL, NULL, '80506', 6.4052, 80.038306, 1, 1, 1, NULL, NULL),
(408, 6, 'Hikkaduwa', 'හික්කඩුව', NULL, NULL, '80240', 6.139535, 80.113201, 1, 1, 1, NULL, NULL),
(409, 6, 'Hiniduma', 'හිනිදුම', NULL, NULL, '80080', 6.316028, 80.328888, 1, 1, 1, NULL, NULL),
(410, 6, 'Hiyare', 'හියාරෙ', NULL, NULL, '80056', 6.079898, 80.317871, 1, 1, 1, NULL, NULL),
(411, 6, 'Kahaduwa', 'කහදූව', NULL, NULL, '80460', 6.2244, 80.21, 1, 1, 1, NULL, NULL),
(412, 6, 'Kahawa', 'කහව', NULL, NULL, '80312', 6.185429, 80.07601, 1, 1, 1, NULL, NULL),
(413, 6, 'Karagoda', 'කරාගොඩ', NULL, NULL, '80151', 6.084182, 80.395041, 1, 1, 1, NULL, NULL),
(414, 6, 'Karandeniya', 'කරන්දෙණිය', NULL, NULL, '80360', 6.260467, 80.072462, 1, 1, 1, NULL, NULL),
(415, 6, 'Kosgoda', 'කොස්ගොඩ', NULL, NULL, '80570', 6.332288, 80.028315, 1, 1, 1, NULL, NULL),
(416, 6, 'Kottawagama', 'කොට්ටාවගම', NULL, NULL, '80062', 6.1375, 80.3419, 1, 1, 1, NULL, NULL),
(417, 6, 'Kottegoda', 'කෝට්ටේගොඩ', NULL, NULL, '81180', 6.1667, 80.1, 1, 1, 1, NULL, NULL),
(418, 6, 'Kuleegoda', 'කුලීගොඩ', NULL, NULL, '80328', 6.2167, 80.1167, 1, 1, 1, NULL, NULL),
(419, 6, 'Magedara', 'මාගෙදර', NULL, NULL, '80152', 6.108129, 80.393927, 1, 1, 1, NULL, NULL),
(420, 6, 'Mahawela Sinhapura', 'මහවෙල සිංහපුර', NULL, NULL, '51076', 6.3167, 80.0333, 1, 1, 1, NULL, NULL),
(421, 6, 'Mapalagama', 'මාපලගම', NULL, NULL, '80112', 6.234713, 80.27784, 1, 1, 1, NULL, NULL),
(422, 6, 'Mapalagama Central', 'මාපලගම මධ්‍යම', NULL, NULL, '80116', 6.2167, 80.3, 1, 1, 1, NULL, NULL),
(423, 6, 'Mattaka', 'මට්ටක', NULL, NULL, '80424', 6.302366, 80.254218, 1, 1, 1, NULL, NULL),
(424, 6, 'Meda-Keembiya', NULL, NULL, NULL, '80092', 6.1845, 80.3032, 1, 1, 1, NULL, NULL),
(425, 6, 'Meetiyagoda', 'මීටියාගොඩ', NULL, NULL, '80330', 6.189135, 80.093504, 1, 1, 1, NULL, NULL),
(426, 6, 'Nagoda', 'නාගොඩ', NULL, NULL, '80110', 6.201296, 80.277829, 1, 1, 1, NULL, NULL),
(427, 6, 'Nakiyadeniya', 'නාකියාදෙණිය', NULL, NULL, '80064', 6.143029, 80.338164, 1, 1, 1, NULL, NULL),
(428, 6, 'Nawandagala', 'නවඳගල', NULL, NULL, '80416', 6.304655, 80.134175, 1, 1, 1, NULL, NULL),
(429, 6, 'Neluwa', 'නෙළුව', NULL, NULL, '80082', 6.37393, 80.363267, 1, 1, 1, NULL, NULL),
(430, 6, 'Nindana', 'නින්දාන', NULL, NULL, '80318', 6.207731, 80.107663, 1, 1, 1, NULL, NULL),
(431, 6, 'Pahala Millawa', 'පහළ මිල්ලෑව', NULL, NULL, '81472', 6.293995, 80.475431, 1, 1, 1, NULL, NULL),
(432, 6, 'Panangala', 'පනංගල', NULL, NULL, '80075', 6.274182, 80.334525, 1, 1, 1, NULL, NULL),
(433, 6, 'Pannimulla Panagoda', 'පැණිමුල්ල පනාගොඩ', NULL, NULL, '80086', 6.36, 80.3653, 1, 1, 1, NULL, NULL),
(434, 6, 'Parana Thanayamgoda', 'පරණ තානායම්ගොඩ', NULL, NULL, '80114', 6.2167, 80.3, 1, 1, 1, NULL, NULL),
(435, 6, 'Patana', 'පතාන', NULL, NULL, '22012', 6.1333, 80.1167, 1, 1, 1, NULL, NULL),
(436, 6, 'Pitigala', 'පිටිගල', NULL, NULL, '80420', 6.348894, 80.217851, 1, 1, 1, NULL, NULL),
(437, 6, 'Poddala', 'පෝද්දල', NULL, NULL, '80170', 6.1167, 80.2167, 1, 1, 1, NULL, NULL),
(438, 6, 'Polgampola', 'පොල්ගම්පොල', NULL, NULL, '12136', 6.3244, 80.4383, 1, 1, 1, NULL, NULL),
(439, 6, 'Porawagama', 'පොරවගම', NULL, NULL, '80408', 6.279568, 80.231811, 1, 1, 1, NULL, NULL),
(440, 6, 'Rantotuwila', 'රන්තොටුවිල', NULL, NULL, '80354', 6.3833, 80.0833, 1, 1, 1, NULL, NULL),
(441, 6, 'Talagampola', 'තලගම්පොල', NULL, NULL, '80058', 6.0667, 80.3, 1, 1, 1, NULL, NULL),
(442, 6, 'Talgaspe', 'තල්ගස්පෙ', NULL, NULL, '80406', 6.3, 80.2, 1, 1, 1, NULL, NULL),
(443, 6, 'Talpe', 'තල්පෙ', NULL, NULL, '80615', 6.0061, 80.2961, 1, 1, 1, NULL, NULL),
(444, 6, 'Tawalama', 'තවලම', NULL, NULL, '80148', 6.3333, 80.3333, 1, 1, 1, NULL, NULL),
(445, 6, 'Tiranagama', 'තිරණගම', NULL, NULL, '80244', 6.1333, 80.1167, 1, 1, 1, NULL, NULL),
(446, 6, 'Udalamatta', 'උඩලමත්ත', NULL, NULL, '80108', 6.18924, 80.306106, 1, 1, 1, NULL, NULL),
(447, 6, 'Udugama', 'උඩුගම', NULL, NULL, '80070', 6.188469, 80.338951, 1, 1, 1, NULL, NULL),
(448, 6, 'Uluvitike', 'උලුවිටිකේ', NULL, NULL, '80168', 6.3056, 80.309, 1, 1, 1, NULL, NULL),
(449, 6, 'Unawatuna', 'උණවටුන', NULL, NULL, '80600', 6.0169, 80.249901, 1, 1, 1, NULL, NULL),
(450, 6, 'Unawitiya', 'උනවිටිය', NULL, NULL, '80214', 6.2417, 80.225, 1, 1, 1, NULL, NULL),
(451, 6, 'Uragaha', 'ඌරගහ', NULL, NULL, '80352', 6.35, 80.1167, 1, 1, 1, NULL, NULL),
(452, 6, 'Uragasmanhandiya', 'ඌරගස්මන්හන්දිය', NULL, NULL, '80350', 6.358461, 80.082277, 1, 1, 1, NULL, NULL),
(453, 6, 'Wakwella', 'වක්වැල්ල', NULL, NULL, '80042', 6.1, 80.1833, 1, 1, 1, NULL, NULL),
(454, 6, 'Walahanduwa', 'වලහන්දූව', NULL, NULL, '80046', 6.05443, 80.251763, 1, 1, 1, NULL, NULL),
(455, 6, 'Wanchawela', 'වංචාවල', NULL, NULL, '80120', 6.0333, 80.3167, 1, 1, 1, NULL, NULL),
(456, 6, 'Wanduramba', 'වඳුරඹ', NULL, NULL, '80100', 6.136388, 80.252794, 1, 1, 1, NULL, NULL),
(457, 6, 'Warukandeniya', 'වාරුකන්දෙනිය', NULL, NULL, '80084', 6.381574, 80.43131, 1, 1, 1, NULL, NULL),
(458, 6, 'Watugedara', 'වටුගෙදර', NULL, NULL, '80340', 6.25, 80.05, 1, 1, 1, NULL, NULL),
(459, 6, 'Weihena', 'වැයිහේන', NULL, NULL, '80216', 6.310127, 80.23392, 1, 1, 1, NULL, NULL),
(460, 6, 'Welikanda', 'වැලිකන්ද', NULL, NULL, '51070', 6.3167, 80.0333, 1, 1, 1, NULL, NULL),
(461, 6, 'Wilanagama', 'විලනගම', NULL, NULL, '20142', 6.4167, 80, 1, 1, 1, NULL, NULL),
(462, 6, 'Yakkalamulla', 'යක්කලමුල්ල', NULL, NULL, '80150', 6.109027, 80.349195, 1, 1, 1, NULL, NULL),
(463, 6, 'Yatalamatta', 'යටලමත්ත', NULL, NULL, '80107', 6.172247, 80.293052, 1, 1, 1, NULL, NULL),
(464, 7, 'Akaragama', 'අකරගම', NULL, NULL, '11536', 7.262603, 79.958057, 1, 1, 1, NULL, NULL),
(465, 7, 'Ambagaspitiya', 'අඹගස්පිටිය', NULL, NULL, '11052', 7.0833, 80.0667, 1, 1, 1, NULL, NULL),
(466, 7, 'Ambepussa', 'අඹේපුස්ස', NULL, NULL, '11212', 7.25, 80.1667, 1, 1, 1, NULL, NULL),
(467, 7, 'Andiambalama', 'ආඬිඅම්බලම', NULL, NULL, '11558', 7.188346, 79.902344, 1, 1, 1, NULL, NULL),
(468, 7, 'Attanagalla', 'අත්තනගල්ල', NULL, NULL, '11120', 7.1119, 80.1328, 1, 1, 1, NULL, NULL),
(469, 7, 'Badalgama', 'බඩල්ගම', NULL, NULL, '11538', 7.291218, 79.978003, 1, 1, 1, NULL, NULL),
(470, 7, 'Banduragoda', 'බඳුරගොඩ', NULL, NULL, '11244', 7.2319, 80.0678, 1, 1, 1, NULL, NULL),
(471, 7, 'Batuwatta', 'බටුවත්ත', NULL, NULL, '11011', 7.058399, 79.932048, 1, 1, 1, NULL, NULL),
(472, 7, 'Bemmulla', 'බෙම්මුල්ල', NULL, NULL, '11040', 7.120933, 80.028191, 1, 1, 1, NULL, NULL),
(473, 7, 'Biyagama IPZ', 'බියගම IPZ', NULL, NULL, '11672', 6.9492, 80.0153, 1, 1, 1, NULL, NULL),
(474, 7, 'Bokalagama', 'බොකලගම', NULL, NULL, '11216', 7.2333, 80.15, 1, 1, 1, NULL, NULL),
(475, 7, 'Bollete (WP)', 'බොල්ලතේ', NULL, NULL, '11024', 7.0667, 79.95, 1, 1, 1, NULL, NULL),
(476, 7, 'Bopagama', 'බෝපගම', NULL, NULL, '11134', 7.079641, 80.15868, 1, 1, 1, NULL, NULL),
(477, 7, 'Buthpitiya', 'බුත්පිටිය', NULL, NULL, '11720', 7.042846, 80.051854, 1, 1, 1, NULL, NULL),
(478, 7, 'Dagonna', 'දාගොන්න', NULL, NULL, '11524', 7.221568, 79.927455, 1, 1, 1, NULL, NULL),
(479, 7, 'Danowita', 'දංඕවිට', NULL, NULL, '11896', 7.2028, 80.1758, 1, 1, 1, NULL, NULL),
(480, 7, 'Debahera', 'දෙබහැර', NULL, NULL, '11889', 7.1389, 80.0981, 1, 1, 1, NULL, NULL),
(481, 7, 'Dekatana', 'දෙකටන', NULL, NULL, '11690', 6.968317, 80.035385, 1, 1, 1, NULL, NULL),
(482, 7, 'Delgoda', 'දෙල්ගොඩ', NULL, NULL, '11700', 6.986583, 80.01576, 1, 1, 1, NULL, NULL),
(483, 7, 'Delwagura', 'දෙල්වගුර', NULL, NULL, '11228', 7.265367, 80.003272, 1, 1, 1, NULL, NULL),
(484, 7, 'Demalagama', 'දෙමළගම', NULL, NULL, '11692', 6.988934, 80.046886, 1, 1, 1, NULL, NULL),
(485, 7, 'Demanhandiya', 'දෙමන්හන්දිය', NULL, NULL, '11270', 7.2333, 79.9, 1, 1, 1, NULL, NULL),
(486, 7, 'Dewalapola', 'දේවාලපොල', NULL, NULL, '11102', 7.162553, 79.997446, 1, 1, 1, NULL, NULL),
(487, 7, 'Divulapitiya', 'දිවුලපිටිය', NULL, NULL, '11250', 7.2167, 80.0156, 1, 1, 1, NULL, NULL),
(488, 7, 'Divuldeniya', 'දිවුල්දෙණිය', NULL, NULL, '11208', 7.3, 80.1, 1, 1, 1, NULL, NULL),
(489, 7, 'Dompe', 'දොම්පෙ', NULL, NULL, '11680', 6.949806, 80.055083, 1, 1, 1, NULL, NULL),
(490, 7, 'Dunagaha', 'දුනගහ', NULL, NULL, '11264', 7.2342, 79.9756, 1, 1, 1, NULL, NULL),
(491, 7, 'Ekala', 'ඒකල', NULL, NULL, '11380', 7.105558, 79.91532, 1, 1, 1, NULL, NULL),
(492, 7, 'Ellakkala', 'ඇල්ලක්කල', NULL, NULL, '11116', 7.135968, 80.132524, 1, 1, 1, NULL, NULL),
(493, 7, 'Essella', 'එස්සැල්ල', NULL, NULL, '11108', 7.178736, 80.021603, 1, 1, 1, NULL, NULL),
(494, 7, 'Galedanda', 'ගලේදණ්ඩ', NULL, NULL, '90206', 6.964202, 79.930611, 1, 1, 1, NULL, NULL),
(495, 7, 'Gampaha', 'ගම්පහ', NULL, NULL, '11000', 7.0917, 79.9942, 1, 1, 1, NULL, NULL),
(496, 7, 'Ganemulla', 'ගණේමුල්ල', NULL, NULL, '11020', 7.064183, 79.963294, 1, 1, 1, NULL, NULL),
(497, 7, 'Giriulla', 'ගිරිවුල්ල', NULL, NULL, '60140', 7.3275, 80.1267, 1, 1, 1, NULL, NULL),
(498, 7, 'Gonawala', 'ගෝනවල', NULL, NULL, '11630', 6.9612, 79.9992, 1, 1, 1, NULL, NULL),
(499, 7, 'Halpe', 'හල්පෙ', NULL, NULL, '70145', 7.261935, 80.10821, 1, 1, 1, NULL, NULL),
(500, 7, 'Hapugastenna', 'හපුගස්තැන්න', NULL, NULL, '70164', 7.1, 80.1667, 1, 1, 1, NULL, NULL),
(501, 7, 'Heiyanthuduwa', 'හෙයියන්තුඩුව', NULL, NULL, '11618', 6.96283, 79.963309, 1, 1, 1, NULL, NULL),
(502, 7, 'Hinatiyana Madawala', NULL, NULL, NULL, '11568', 7.1667, 79.95, 1, 1, 1, NULL, NULL),
(503, 7, 'Hiswella', 'හිස්වැල්ල', NULL, NULL, '11734', 7.021559, 80.160869, 1, 1, 1, NULL, NULL),
(504, 7, 'Horampella', 'හොරම්පැල්ල', NULL, NULL, '11564', 7.185188, 79.976771, 1, 1, 1, NULL, NULL),
(505, 7, 'Hunumulla', 'හුණුමුල්ල', NULL, NULL, '11262', 7.244925, 79.996921, 1, 1, 1, NULL, NULL),
(506, 7, 'Hunupola', 'හුණුපොල', NULL, NULL, '60582', 7.111463, 80.130625, 1, 1, 1, NULL, NULL),
(507, 7, 'Ihala Madampella', 'ඉහල මදම්පෙල්ල', NULL, NULL, '11265', 7.250345, 79.960941, 1, 1, 1, NULL, NULL),
(508, 7, 'Imbulgoda', 'ඉඹුල්ගොඩ', NULL, NULL, '11856', 7.035, 79.9931, 1, 1, 1, NULL, NULL),
(509, 7, 'Ja-Ela', 'ජා-ඇල', NULL, NULL, '11350', 7.076147, 79.894932, 1, 1, 1, NULL, NULL),
(510, 7, 'Kadawatha', 'කඩවත', NULL, NULL, '11850', 7.0258, 79.9882, 1, 1, 1, NULL, NULL),
(511, 7, 'Kahatowita', 'කහටෝවිට', NULL, NULL, '11144', 7.0667, 80.1167, 1, 1, 1, NULL, NULL),
(512, 7, 'Kalagedihena', 'කලගෙඩිහේන', NULL, NULL, '11875', 7.118004, 80.058001, 1, 1, 1, NULL, NULL),
(513, 7, 'Kaleliya', 'කල්එළිය', NULL, NULL, '11160', 7.195, 80.1136, 1, 1, 1, NULL, NULL),
(514, 7, 'Kandana', 'කඳාන', NULL, NULL, '11320', 7.05056, 79.895123, 1, 1, 1, NULL, NULL),
(515, 7, 'Katana', 'කටාන', NULL, NULL, '11534', 7.2517, 79.9078, 1, 1, 1, NULL, NULL),
(516, 7, 'Katudeniya', 'කටුදෙණිය', NULL, NULL, '21016', 7.3, 80.0833, 1, 1, 1, NULL, NULL),
(517, 7, 'Katunayake', 'කටුනායක', NULL, NULL, '11450', 7.1647, 79.8731, 1, 1, 1, NULL, NULL),
(518, 7, 'Katunayake Air Force Camp', 'කටුනායක ගුවන් හමුදා කඳවුර', NULL, NULL, '11440', 7.1407, 79.8782, 1, 1, 1, NULL, NULL),
(519, 7, 'Katunayake(FTZ)', 'කටුනායක නිදහස් වෙළඳ කලාපය', NULL, NULL, '11420', 7.1407, 79.8782, 1, 1, 1, NULL, NULL),
(520, 7, 'Katuwellegama', 'කටුවෙල්ලගම', NULL, NULL, '11526', 7.208557, 79.94572, 1, 1, 1, NULL, NULL),
(521, 7, 'Kelaniya', 'කැළණිය', NULL, NULL, '11600', 6.956357, 79.921431, 1, 1, 1, NULL, NULL),
(522, 7, 'Kimbulapitiya', 'කිඹුලාපිටිය', NULL, NULL, '11522', 7.202265, 79.908937, 1, 1, 1, NULL, NULL),
(523, 7, 'Kirindiwela', 'කිරිඳිවෙල', NULL, NULL, '11730', 7.044223, 80.126707, 1, 1, 1, NULL, NULL),
(524, 7, 'Kitalawalana', 'කිතලවලාන', NULL, NULL, '11206', 7.3, 80.1, 1, 1, 1, NULL, NULL),
(525, 7, 'Kochchikade', 'කොච්චිකඩේ', NULL, NULL, '11540', 7.2581, 79.8542, 1, 1, 1, NULL, NULL);
INSERT INTO `cities` (`id`, `district_id`, `name_en`, `name_si`, `name_ta`, `description`, `postcode`, `latitude`, `longitude`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(526, 7, 'Kotadeniyawa', 'කොටදෙණියාව', NULL, NULL, '11232', 7.279861, 80.05581, 1, 1, 1, NULL, NULL),
(527, 7, 'Kotugoda', 'කොටුගොඩ', NULL, NULL, '11390', 7.1217, 79.9297, 1, 1, 1, NULL, NULL),
(528, 7, 'Kumbaloluwa', 'කුඹල්ඔළුව', NULL, NULL, '11105', 7.179375, 80.082233, 1, 1, 1, NULL, NULL),
(529, 7, 'Loluwagoda', 'ලොළුවගොඩ', NULL, NULL, '11204', 7.294586, 80.126624, 1, 1, 1, NULL, NULL),
(530, 7, 'Mabodale', 'මබෝදලේ', NULL, NULL, '11114', 7.2, 80.0167, 1, 1, 1, NULL, NULL),
(531, 7, 'Madelgamuwa', 'මැදැල්ගමුව', NULL, NULL, '11033', 7.110062, 79.948175, 1, 1, 1, NULL, NULL),
(532, 7, 'Makewita', 'මාකවිට', NULL, NULL, '11358', 7.1, 79.9333, 1, 1, 1, NULL, NULL),
(533, 7, 'Makola', 'මාකොල', NULL, NULL, '11640', 6.983178, 79.9525, 1, 1, 1, NULL, NULL),
(534, 7, 'Malwana', 'මල්වාන', NULL, NULL, '11670', 6.951988, 80.012561, 1, 1, 1, NULL, NULL),
(535, 7, 'Mandawala', 'මන්දාවල', NULL, NULL, '11061', 7.003066, 80.097082, 1, 1, 1, NULL, NULL),
(536, 7, 'Marandagahamula', 'මරඳගහමුල', NULL, NULL, '11260', 7.2447, 79.9696, 1, 1, 1, NULL, NULL),
(537, 7, 'Mellawagedara', 'මෙල්ලවගෙදර', NULL, NULL, '11234', 7.285808, 80.023977, 1, 1, 1, NULL, NULL),
(538, 7, 'Minuwangoda', 'මිනුවන්ගොඩ', NULL, NULL, '11550', 7.176455, 79.954904, 1, 1, 1, NULL, NULL),
(539, 7, 'Mirigama', 'මීරිගම', NULL, NULL, '11200', 7.2414, 80.1325, 1, 1, 1, NULL, NULL),
(540, 7, 'Miriswatta', 'මිරිස්වත්ත', NULL, NULL, '80508', 7.0711, 80.0183, 1, 1, 1, NULL, NULL),
(541, 7, 'Mithirigala', 'මිතිරිගල', NULL, NULL, '11742', 6.9648, 80.0648, 1, 1, 1, NULL, NULL),
(542, 7, 'Muddaragama', 'මුද්දරගම', NULL, NULL, '11112', 7.2167, 80.05, 1, 1, 1, NULL, NULL),
(543, 7, 'Mudungoda', 'මුදුන්ගොඩ', NULL, NULL, '11056', 7.064698, 79.999092, 1, 1, 1, NULL, NULL),
(544, 7, 'Mulleriyawa New Town', 'මුල්ලේරියාව නව නගරය', NULL, NULL, '10620', 6.9301, 80.0549, 1, 1, 1, NULL, NULL),
(545, 7, 'Naranwala', 'නාරංවල', NULL, NULL, '11063', 7.001631, 80.027404, 1, 1, 1, NULL, NULL),
(546, 7, 'Nawana', 'නාවන', NULL, NULL, '11222', 7.270062, 80.092618, 1, 1, 1, NULL, NULL),
(547, 7, 'Nedungamuwa', 'නැදුන්ගමුව', NULL, NULL, '11066', 7.05, 80.0333, 1, 1, 1, NULL, NULL),
(548, 7, 'Negombo', 'මීගමුව', NULL, NULL, '11500', 7.2086, 79.8358, 1, 1, 1, NULL, NULL),
(549, 7, 'Nikadalupotha', 'නිකදළුපොත', NULL, NULL, '60580', 7.1167, 80.1333, 1, 1, 1, NULL, NULL),
(550, 7, 'Nikahetikanda', 'නිකහැටිකන්ද', NULL, NULL, '11128', 7.099089, 80.179551, 1, 1, 1, NULL, NULL),
(551, 7, 'Nittambuwa', 'නිට්ටඹුව', NULL, NULL, '11880', 7.144243, 80.096178, 1, 1, 1, NULL, NULL),
(552, 7, 'Niwandama', 'නිවන්දම', NULL, NULL, '11354', 7.078762, 79.928331, 1, 1, 1, NULL, NULL),
(553, 7, 'Opatha', 'ඕපාත', NULL, NULL, '80142', 7.132037, 79.921419, 1, 1, 1, NULL, NULL),
(554, 7, 'Pamunugama', 'පමුණුගම', NULL, NULL, '11370', 7.094359, 79.844569, 1, 1, 1, NULL, NULL),
(555, 7, 'Pamunuwatta', 'පමුණුවත්ත', NULL, NULL, '11214', 7.214678, 80.139696, 1, 1, 1, NULL, NULL),
(556, 7, 'Panawala', 'පනාවල', NULL, NULL, '70612', 6.9833, 80.0333, 1, 1, 1, NULL, NULL),
(557, 7, 'Pasyala', 'පස්යාල', NULL, NULL, '11890', 7.172926, 80.115911, 1, 1, 1, NULL, NULL),
(558, 7, 'Peliyagoda', 'පෑලියගොඩ', NULL, NULL, '11830', 6.960977, 79.878852, 1, 1, 1, NULL, NULL),
(559, 7, 'Pepiliyawala', 'පැපිලියාවල', NULL, NULL, '11741', 7.002342, 80.128886, 1, 1, 1, NULL, NULL),
(560, 7, 'Pethiyagoda', 'පෙතියාගොඩ', NULL, NULL, '11043', 7.1167, 80.0167, 1, 1, 1, NULL, NULL),
(561, 7, 'Polpithimukulana', 'පොල්පිතිමූකලාන', NULL, NULL, '11324', 7.0444, 79.8782, 1, 1, 1, NULL, NULL),
(562, 7, 'Puwakpitiya', 'පුවක්පිටිය', NULL, NULL, '10712', 7.040498, 80.064451, 1, 1, 1, NULL, NULL),
(563, 7, 'Radawadunna', 'රදාවඩුන්න', NULL, NULL, '11892', 7.177279, 80.141344, 1, 1, 1, NULL, NULL),
(564, 7, 'Radawana', 'රදාවාන', NULL, NULL, '11725', 7.029871, 80.100915, 1, 1, 1, NULL, NULL),
(565, 7, 'Raddolugama', 'රද්දොළුගම', NULL, NULL, '11400', 7.140656, 79.898198, 1, 1, 1, NULL, NULL),
(566, 7, 'Ragama', 'රාගම', NULL, NULL, '11010', 7.025281, 79.917386, 1, 1, 1, NULL, NULL),
(567, 7, 'Ruggahawila', 'රුග්ගහවිල', NULL, NULL, '11142', 7.0667, 80.1167, 1, 1, 1, NULL, NULL),
(568, 7, 'Seeduwa', 'සීදුව', NULL, NULL, '11410', 7.132059, 79.885024, 1, 1, 1, NULL, NULL),
(569, 7, 'Siyambalape', 'සියඹලාපේ', NULL, NULL, '11607', 6.964545, 79.986406, 1, 1, 1, NULL, NULL),
(570, 7, 'Talahena', 'තලහේන', NULL, NULL, '11504', 7.1667, 79.8167, 1, 1, 1, NULL, NULL),
(571, 7, 'Thambagalla', NULL, NULL, NULL, '60584', 7.1167, 80.1333, 1, 1, 1, NULL, NULL),
(572, 7, 'Thimbirigaskatuwa', 'තිඹිරිගස්කටුව', NULL, NULL, '11532', 7.2669, 79.9495, 1, 1, 1, NULL, NULL),
(573, 7, 'Tittapattara', 'තිත්තපත්තර', NULL, NULL, '10664', 6.9297, 80.0889, 1, 1, 1, NULL, NULL),
(574, 7, 'Udathuthiripitiya', 'උඩතුත්තිරිපිටිය', NULL, NULL, '11054', 7.075, 80.0333, 1, 1, 1, NULL, NULL),
(575, 7, 'Udugampola', 'උඩුගම්පල', NULL, NULL, '11030', 7.1167, 79.9833, 1, 1, 1, NULL, NULL),
(576, 7, 'Uggalboda', 'උග්ගල්බොඩ', NULL, NULL, '11034', 7.135549, 79.948259, 1, 1, 1, NULL, NULL),
(577, 7, 'Urapola', 'ඌරාපොල', NULL, NULL, '11126', 7.104792, 80.136935, 1, 1, 1, NULL, NULL),
(578, 7, 'Uswetakeiyawa', 'උස්වැටකෙයියාව', NULL, NULL, '11328', 7.031046, 79.860339, 1, 1, 1, NULL, NULL),
(579, 7, 'Veyangoda', 'වෙයන්ගොඩ', NULL, NULL, '11100', 7.156981, 80.095842, 1, 1, 1, NULL, NULL),
(580, 7, 'Walgammulla', 'වල්ගම්මුල්ල', NULL, NULL, '11146', 7.071902, 80.116511, 1, 1, 1, NULL, NULL),
(581, 7, 'Walpita', 'වල්පිට', NULL, NULL, '11226', 7.258131, 80.034704, 1, 1, 1, NULL, NULL),
(582, 7, 'Walpola (WP)', 'වල්පොල', NULL, NULL, '11012', 7.0418, 79.9257, 1, 1, 1, NULL, NULL),
(583, 7, 'Wathurugama', 'වතුරුගම', NULL, NULL, '11724', 7.0421, 80.0701, 1, 1, 1, NULL, NULL),
(584, 7, 'Watinapaha', 'වටිනාපහ', NULL, NULL, '11104', 7.2, 79.9833, 1, 1, 1, NULL, NULL),
(585, 7, 'Wattala', 'වත්තල', NULL, NULL, '11104', 6.990037, 79.892207, 1, 1, 1, NULL, NULL),
(586, 7, 'Weboda', 'වෙිබොඩ', NULL, NULL, '11858', 7.0167, 79.9833, 1, 1, 1, NULL, NULL),
(587, 7, 'Wegowwa', 'වෑගොව්ව', NULL, NULL, '11562', 7.178443, 79.962063, 1, 1, 1, NULL, NULL),
(588, 7, 'Weweldeniya', 'වේවැල්දෙණිය', NULL, NULL, '11894', 7.1834, 80.1446, 1, 1, 1, NULL, NULL),
(589, 7, 'Yakkala', 'යක්කල', NULL, NULL, '11870', 7.1167, 80.05, 1, 1, 1, NULL, NULL),
(590, 7, 'Yatiyana', 'යටියන', NULL, NULL, '11566', 7.184998, 79.931858, 1, 1, 1, NULL, NULL),
(591, 8, 'Ambalantota', 'අම්බලන්තොට', NULL, NULL, '82100', 6.114494, 81.025983, 1, 1, 1, NULL, NULL),
(592, 8, 'Angunakolapelessa', 'අඟුණකොළපැලැස්ස', NULL, NULL, '82220', 6.162261, 80.899471, 1, 1, 1, NULL, NULL),
(593, 8, 'Angunakolawewa', 'අඟුණකොලවැව', NULL, NULL, '91302', 6.389127, 81.093226, 1, 1, 1, NULL, NULL),
(594, 8, 'Bandagiriya Colony', 'බන්ඩගිරිය කොලොනි', NULL, NULL, '82005', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(595, 8, 'Barawakumbuka', 'බරවකුඹුර', NULL, NULL, '82110', 6.1667, 80.8167, 1, 1, 1, NULL, NULL),
(596, 8, 'Beliatta', 'බෙලිඅත්ත', NULL, NULL, '82400', 6.048637, 80.734343, 1, 1, 1, NULL, NULL),
(597, 8, 'Beragama', 'බෙරගම', NULL, NULL, '82102', 6.15, 81.0667, 1, 1, 1, NULL, NULL),
(598, 8, 'Beralihela', 'බෙරලිහෙල', NULL, NULL, '82618', 6.2556, 81.2944, 1, 1, 1, NULL, NULL),
(599, 8, 'Bundala', 'බූන්දල', NULL, NULL, '82002', 6.195164, 81.250493, 1, 1, 1, NULL, NULL),
(600, 8, 'Ellagala', 'ඇල්ලගල', NULL, NULL, '82619', 6.26867, 81.359512, 1, 1, 1, NULL, NULL),
(601, 8, 'Gangulandeniya', 'ගඟුලදෙණිය', NULL, NULL, '82586', 6.2833, 80.7167, 1, 1, 1, NULL, NULL),
(602, 8, 'Getamanna', 'ගැටමාන්න', NULL, NULL, '82420', 6.036244, 80.669146, 1, 1, 1, NULL, NULL),
(603, 8, 'Goda Koggalla', 'ගොඩ කොග්ගල්ල', NULL, NULL, '82401', 6.0333, 80.75, 1, 1, 1, NULL, NULL),
(604, 8, 'Gonagamuwa Uduwila', 'ගොනාගමුව උඩුවිල', NULL, NULL, '82602', 6.25, 81.2917, 1, 1, 1, NULL, NULL),
(605, 8, 'Gonnoruwa', 'ගොන්නොරුව', NULL, NULL, '82006', 6.230443, 81.112465, 1, 1, 1, NULL, NULL),
(606, 8, 'Hakuruwela', 'හකුරුවෙල', NULL, NULL, '82248', 6.146456, 80.83047, 1, 1, 1, NULL, NULL),
(607, 8, 'Hambantota', 'හම්බන්තොට', NULL, NULL, '82000', 6.127563, 81.111287, 1, 1, 1, NULL, NULL),
(608, 8, 'Handugala', 'හඳගුල', NULL, NULL, '81326', 6.188877, 80.62414, 1, 1, 1, NULL, NULL),
(609, 8, 'Hungama', 'හුංගම', NULL, NULL, '82120', 6.108006, 80.927144, 1, 1, 1, NULL, NULL),
(610, 8, 'Ihala Beligalla', 'ඉහල බෙලිගල්ල', NULL, NULL, '82412', 6.092378, 80.747311, 1, 1, 1, NULL, NULL),
(611, 8, 'Iththa Demaliya', 'ඉත්ත දෙමලිය', NULL, NULL, '82462', 6.167432, 80.735179, 1, 1, 1, NULL, NULL),
(612, 8, 'Julampitiya', 'ජුලම්පිටිය', NULL, NULL, '82252', 6.2261, 80.7403, 1, 1, 1, NULL, NULL),
(613, 8, 'Kahandamodara', 'කහඳමෝදර', NULL, NULL, '82126', 6.078654, 80.902917, 1, 1, 1, NULL, NULL),
(614, 8, 'Kariyamaditta', 'කරියමදිත්ත', NULL, NULL, '82274', 6.257359, 80.809448, 1, 1, 1, NULL, NULL),
(615, 8, 'Katuwana', 'කටුවන', NULL, NULL, '82500', 6.2667, 80.6972, 1, 1, 1, NULL, NULL),
(616, 8, 'Kawantissapura', 'කාවන්තිස්සපුර', NULL, NULL, '82622', 6.2786, 81.2524, 1, 1, 1, NULL, NULL),
(617, 8, 'Kirama', 'කිරම', NULL, NULL, '82550', 6.2117, 80.6653, 1, 1, 1, NULL, NULL),
(618, 8, 'Kirinda', 'කිරින්ද', NULL, NULL, '82614', 6.268985, 81.290653, 1, 1, 1, NULL, NULL),
(619, 8, 'Lunama', 'ලුනම', NULL, NULL, '82108', 6.098517, 80.971511, 1, 1, 1, NULL, NULL),
(620, 8, 'Lunugamwehera', 'ලුණුගම්වෙහෙර', NULL, NULL, '82634', 6.3417, 81.15, 1, 1, 1, NULL, NULL),
(621, 8, 'Magama', 'මාගම', NULL, NULL, '82608', 6.280108, 81.270354, 1, 1, 1, NULL, NULL),
(622, 8, 'Mahagalwewa', 'මහගල්වැව', NULL, NULL, '82016', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(623, 8, 'Mamadala', 'මාමඩල', NULL, NULL, '82109', 6.158126, 80.96681, 1, 1, 1, NULL, NULL),
(624, 8, 'Medamulana', 'මැදමුලන', NULL, NULL, '82254', 6.175878, 80.770016, 1, 1, 1, NULL, NULL),
(625, 8, 'Middeniya', 'මිද්දෙණිය', NULL, NULL, '82270', 6.2494, 80.7672, 1, 1, 1, NULL, NULL),
(626, 8, 'Meegahajandura', 'මිගහජන්දුරැ', NULL, NULL, '82014', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(627, 8, 'Modarawana', 'මොදරවාන', NULL, NULL, '82416', 6.117576, 80.720781, 1, 1, 1, NULL, NULL),
(628, 8, 'Mulkirigala', 'මුල්කිරිගල', NULL, NULL, '82242', 6.12, 80.7397, 1, 1, 1, NULL, NULL),
(629, 8, 'Nakulugamuwa', 'නාකුළුගමුව', NULL, NULL, '82300', 6.1842, 80.9063, 1, 1, 1, NULL, NULL),
(630, 8, 'Netolpitiya', 'නෙටොල්පිටිය', NULL, NULL, '82135', 6.066848, 80.850703, 1, 1, 1, NULL, NULL),
(631, 8, 'Nihiluwa', 'නිහිලුව', NULL, NULL, '82414', 6.077147, 80.696499, 1, 1, 1, NULL, NULL),
(632, 8, 'Padawkema', 'පදව්කෙම', NULL, NULL, '82636', 6.35, 81.1667, 1, 1, 1, NULL, NULL),
(633, 8, 'Pahala Andarawewa', 'පහල අන්දරවැව', NULL, NULL, '82008', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(634, 8, 'Rammalawarapitiya', 'රම්මලවරපිටිය', NULL, NULL, '82554', 6.2117, 80.6653, 1, 1, 1, NULL, NULL),
(635, 8, 'Ranakeliya', 'රණකෙලිය', NULL, NULL, '82612', 6.2167, 81.3, 1, 1, 1, NULL, NULL),
(636, 8, 'Ranmuduwewa', 'රන්මුඩුවැව', NULL, NULL, '82018', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(637, 8, 'Ranna', 'රන්න', NULL, NULL, '82125', 6.103377, 80.890168, 1, 1, 1, NULL, NULL),
(638, 8, 'Ratmalwala', 'රත්මල්වල', NULL, NULL, '82276', 6.2667, 80.85, 1, 1, 1, NULL, NULL),
(639, 8, 'Ruhunu Ridiyagama', 'රුහුණු රිදියගම', NULL, NULL, '82106', 6.1375, 81.0042, 1, 1, 1, NULL, NULL),
(640, 8, 'Sooriyawewa Town', 'සූරියවැව නගරය', NULL, NULL, '82010', 6.1833, 81.1389, 1, 1, 1, NULL, NULL),
(641, 8, 'Tangalla', 'තංගල්ල', NULL, NULL, '82200', 6.0231, 80.7889, 1, 1, 1, NULL, NULL),
(642, 8, 'Tissamaharama', 'තිස්සමහාරාම', NULL, NULL, '82600', 6.370333, 81.328087, 1, 1, 1, NULL, NULL),
(643, 8, 'Uda Gomadiya', NULL, NULL, NULL, '82504', 6.2667, 80.6972, 1, 1, 1, NULL, NULL),
(644, 8, 'Udamattala', 'උඩමත්තල', NULL, NULL, '82638', 6.3333, 81.1333, 1, 1, 1, NULL, NULL),
(645, 8, 'Uswewa', 'උස්වැව', NULL, NULL, '82278', 6.246247, 80.862175, 1, 1, 1, NULL, NULL),
(646, 8, 'Vitharandeniya', 'විතාරන්දෙණිය', NULL, NULL, '82232', 6.1824, 80.806, 1, 1, 1, NULL, NULL),
(647, 8, 'Walasmulla', 'වළස්මුල්ල', NULL, NULL, '82450', 6.15, 80.7, 1, 1, 1, NULL, NULL),
(648, 8, 'Weeraketiya', 'වීරකැටිය', NULL, NULL, '82240', 6.135, 80.7865, 1, 1, 1, NULL, NULL),
(649, 8, 'Weerawila', 'වීරවිල', NULL, NULL, '82632', 6.3417, 81.15, 1, 1, 1, NULL, NULL),
(650, 8, 'Weerawila NewTown', 'වීරවිල නව නගරය', NULL, NULL, '82615', 6.2556, 81.2944, 1, 1, 1, NULL, NULL),
(651, 8, 'Wekandawela', NULL, NULL, NULL, '82246', 6.135, 80.7865, 1, 1, 1, NULL, NULL),
(652, 8, 'Weligatta', NULL, NULL, NULL, '82004', 6.205897, 81.196032, 1, 1, 1, NULL, NULL),
(653, 8, 'Yatigala', NULL, NULL, NULL, '82418', 6.1, 80.6833, 1, 1, 1, NULL, NULL),
(654, 9, 'Jaffna', 'යාපනය', NULL, NULL, '40000', 9.660668, 80.022706, 1, 1, 1, NULL, NULL),
(655, 10, 'Agalawatta', 'අගලවත්ත', NULL, NULL, '12200', 6.541499, 80.155785, 1, 1, 1, NULL, NULL),
(656, 10, 'Alubomulla', 'අලුබෝමුල්ල', NULL, NULL, '12524', 6.711977, 79.965857, 1, 1, 1, NULL, NULL),
(657, 10, 'Anguruwatota', 'අංගුරුවතොට', NULL, NULL, '12320', 6.6383, 80.0861, 1, 1, 1, NULL, NULL),
(658, 10, 'Atale', 'අටලේ', NULL, NULL, '71363', 6.45, 80.2667, 1, 1, 1, NULL, NULL),
(659, 10, 'Baduraliya', 'බදුරලීය', NULL, NULL, '12230', 6.523102, 80.232371, 1, 1, 1, NULL, NULL),
(660, 10, 'Bandaragama', 'බණ්ඩාරගම', NULL, NULL, '12530', 6.710264, 79.986087, 1, 1, 1, NULL, NULL),
(661, 10, 'Batugampola', 'බටුගම්පොල', NULL, NULL, '10526', 6.769068, 80.142775, 1, 1, 1, NULL, NULL),
(662, 10, 'Bellana', 'බෙල්ලන', NULL, NULL, '12224', 6.518936, 80.183117, 1, 1, 1, NULL, NULL),
(663, 10, 'Beruwala', 'බේරුවල', NULL, NULL, '12070', 6.4739, 79.9842, 1, 1, 1, NULL, NULL),
(664, 10, 'Bolossagama', 'බොලොස්සගම', NULL, NULL, '12008', 6.62099, 80.015288, 1, 1, 1, NULL, NULL),
(665, 10, 'Bombuwala', 'බොඹුවල', NULL, NULL, '12024', 6.5833, 80.0167, 1, 1, 1, NULL, NULL),
(666, 10, 'Boralugoda', 'බොරළුගොඩ', NULL, NULL, '12142', 6.438709, 80.278799, 1, 1, 1, NULL, NULL),
(667, 10, 'Bulathsinhala', 'බුලත්සිංහල', NULL, NULL, '12300', 6.666199, 80.164896, 1, 1, 1, NULL, NULL),
(668, 10, 'Danawala Thiniyawala', 'දනවල තිනියවල', NULL, NULL, '12148', 6.4333, 80.2667, 1, 1, 1, NULL, NULL),
(669, 10, 'Delmella', 'දෙල්මෙල්ල', NULL, NULL, '12304', 6.67833, 80.210488, 1, 1, 1, NULL, NULL),
(670, 10, 'Dharga Town', 'දර්ගා නගරය', NULL, NULL, '12090', 6.648, 80.0089, 1, 1, 1, NULL, NULL),
(671, 10, 'Diwalakada', 'දිවාලකද', NULL, NULL, '12308', 6.696767, 80.146983, 1, 1, 1, NULL, NULL),
(672, 10, 'Dodangoda', 'දොඩන්ගොඩ', NULL, NULL, '12020', 6.555952, 80.006847, 1, 1, 1, NULL, NULL),
(673, 10, 'Dombagoda', 'දොඹගොඩ', NULL, NULL, '12416', 6.661797, 80.053343, 1, 1, 1, NULL, NULL),
(674, 10, 'Ethkandura', 'ඇත්කඳුර', NULL, NULL, '80458', 6.4415, 80.1807, 1, 1, 1, NULL, NULL),
(675, 10, 'Galpatha', 'ගල්පාත', NULL, NULL, '12005', 6.5983, 80.0015, 1, 1, 1, NULL, NULL),
(676, 10, 'Gamagoda', 'ගමගොඩ', NULL, NULL, '12016', 6.597103, 80.005539, 1, 1, 1, NULL, NULL),
(677, 10, 'Gonagalpura', 'ගොනාගල්පුර', NULL, NULL, '80502', 6.6307, 80.0169, 1, 1, 1, NULL, NULL),
(678, 10, 'Gonapola Junction', 'ගෝනපොල හංදිය', NULL, NULL, '12410', 6.6944, 80.0333, 1, 1, 1, NULL, NULL),
(679, 10, 'Govinna', 'ගෝවින්න', NULL, NULL, '12310', 6.663337, 80.116274, 1, 1, 1, NULL, NULL),
(680, 10, 'Gurulubadda', 'ගුරුලුබැද්ද', NULL, NULL, '12236', 6.5333, 80.2667, 1, 1, 1, NULL, NULL),
(681, 10, 'Halkandawila', 'හල්කන්දවිල', NULL, NULL, '12055', 6.5167, 80.0167, 1, 1, 1, NULL, NULL),
(682, 10, 'Haltota', 'හල්තොට', NULL, NULL, '12538', 6.69554, 80.02127, 1, 1, 1, NULL, NULL),
(683, 10, 'Halvitigala Colony', 'හල්විටගල ජනපදය', NULL, NULL, '80146', 6.5791, 80.2233, 1, 1, 1, NULL, NULL),
(684, 10, 'Halwala', 'හල්වල', NULL, NULL, '12118', 6.416524, 80.106562, 1, 1, 1, NULL, NULL),
(685, 10, 'Halwatura', 'හල්වතුර', NULL, NULL, '12306', 6.7, 80.2, 1, 1, 1, NULL, NULL),
(686, 10, 'Handapangoda', 'හඳපාන්ගොඩ', NULL, NULL, '10524', 6.789746, 80.140774, 1, 1, 1, NULL, NULL),
(687, 10, 'Hedigalla Colony', NULL, NULL, NULL, '12234', 6.5333, 80.2667, 1, 1, 1, NULL, NULL),
(688, 10, 'Henegama', 'හේනෙගම', NULL, NULL, '11715', 6.7167, 80.0333, 1, 1, 1, NULL, NULL),
(689, 10, 'Hettimulla', 'හෙට්ටිමුල්ල', NULL, NULL, '71210', 6.461362, 79.992643, 1, 1, 1, NULL, NULL),
(690, 10, 'Horana', 'හොරණ', NULL, NULL, '12400', 6.719389, 80.061557, 1, 1, 1, NULL, NULL),
(691, 10, 'Ittapana', 'ඉත්තෑපාන', NULL, NULL, '12116', 6.42254, 80.079501, 1, 1, 1, NULL, NULL),
(692, 10, 'Kahawala', 'කහවල', NULL, NULL, '10508', 6.7833, 80.1, 1, 1, 1, NULL, NULL),
(693, 10, 'Kalawila Kiranthidiya', NULL, NULL, NULL, '12078', 6.4619, 80.0004, 1, 1, 1, NULL, NULL),
(694, 10, 'Kalutara', 'කළුතර', NULL, NULL, '12000', 6.581333, 79.958546, 1, 1, 1, NULL, NULL),
(695, 10, 'Kananwila', NULL, NULL, NULL, '12418', 6.7667, 80.05, 1, 1, 1, NULL, NULL),
(696, 10, 'Kandanagama', NULL, NULL, NULL, '12428', 6.7667, 80.0778, 1, 1, 1, NULL, NULL),
(697, 10, 'Kelinkanda', NULL, NULL, NULL, '12218', 6.587128, 80.29322, 1, 1, 1, NULL, NULL),
(698, 10, 'Kitulgoda', 'කිතුල්ගොඩ', NULL, NULL, '12222', 6.5167, 80.1833, 1, 1, 1, NULL, NULL),
(699, 10, 'Koholana', NULL, NULL, NULL, '12007', 6.618149, 79.989353, 1, 1, 1, NULL, NULL),
(700, 10, 'Kuda Uduwa', NULL, NULL, NULL, '12426', 6.747871, 80.078499, 1, 1, 1, NULL, NULL),
(701, 10, 'Labbala', NULL, NULL, NULL, '60162', 6.4833, 80, 1, 1, 1, NULL, NULL),
(702, 10, 'lhalahewessa', NULL, NULL, NULL, '80432', 6.4415, 80.1807, 1, 1, 1, NULL, NULL),
(703, 10, 'lnduruwa', 'ඉඳුරුව', NULL, NULL, '80510', 6.4681, 80.0257, 1, 1, 1, NULL, NULL),
(704, 10, 'lngiriya', 'ඉංගිරිය', NULL, NULL, '12440', 6.7296, 80.0604, 1, 1, 1, NULL, NULL),
(705, 10, 'Maggona', 'මග්ගොන', NULL, NULL, '12060', 6.503158, 79.977597, 1, 1, 1, NULL, NULL),
(706, 10, 'Mahagama', 'මහගම', NULL, NULL, '12210', 6.620177, 80.154204, 1, 1, 1, NULL, NULL),
(707, 10, 'Mahakalupahana', NULL, NULL, NULL, '12126', 6.3917, 80.1417, 1, 1, 1, NULL, NULL),
(708, 10, 'Maharangalla', NULL, NULL, NULL, '71211', 6.4667, 80, 1, 1, 1, NULL, NULL),
(709, 10, 'Malgalla Talangalla', NULL, NULL, NULL, '80144', 6.5791, 80.2233, 1, 1, 1, NULL, NULL),
(710, 10, 'Matugama', 'මතුගම', NULL, NULL, '12100', 6.5222, 80.1144, 1, 1, 1, NULL, NULL),
(711, 10, 'Meegahatenna', 'මීගහතැන්න', NULL, NULL, '12130', 6.3637, 80.285, 1, 1, 1, NULL, NULL),
(712, 10, 'Meegama', NULL, NULL, NULL, '12094', 6.648, 80.0089, 1, 1, 1, NULL, NULL),
(713, 10, 'Meegoda', 'මීගොඩ', NULL, NULL, '10504', 6.8053, 80.0829, 1, 1, 1, NULL, NULL),
(714, 10, 'Millaniya', 'මිල්ලණිය', NULL, NULL, '12412', 6.686206, 80.017227, 1, 1, 1, NULL, NULL),
(715, 10, 'Millewa', 'මිල්ලෑව', NULL, NULL, '12422', 6.7833, 80.0667, 1, 1, 1, NULL, NULL),
(716, 10, 'Miwanapalana', NULL, NULL, NULL, '12424', 6.75, 80.1, 1, 1, 1, NULL, NULL),
(717, 10, 'Molkawa', 'මෝල්කාව', NULL, NULL, '12216', 6.607725, 80.238612, 1, 1, 1, NULL, NULL),
(718, 10, 'Morapitiya', 'මොරපිටිය', NULL, NULL, '12232', 6.527127, 80.263667, 1, 1, 1, NULL, NULL),
(719, 10, 'Morontuduwa', 'මොරොන්තුඩුව', NULL, NULL, '12564', 6.65, 79.9667, 1, 1, 1, NULL, NULL),
(720, 10, 'Nawattuduwa', NULL, NULL, NULL, '12106', 6.5019, 80.0937, 1, 1, 1, NULL, NULL),
(721, 10, 'Neboda', 'නෑබොඩ', NULL, NULL, '12030', 6.5906, 80.0842, 1, 1, 1, NULL, NULL),
(722, 10, 'Padagoda', NULL, NULL, NULL, '12074', 6.456979, 80.009049, 1, 1, 1, NULL, NULL),
(723, 10, 'Pahalahewessa', NULL, NULL, NULL, '12144', 6.4333, 80.2667, 1, 1, 1, NULL, NULL),
(724, 10, 'Paiyagala', 'පයාගල', NULL, NULL, '12050', 6.5167, 80.0167, 1, 1, 1, NULL, NULL),
(725, 10, 'Panadura', 'පානදුර', NULL, NULL, '12500', 6.7133, 79.9042, 1, 1, 1, NULL, NULL),
(726, 10, 'Pannala', 'පන්නල', NULL, NULL, '60160', 6.4833, 80, 1, 1, 1, NULL, NULL),
(727, 10, 'Paragastota', 'පරගස්තොට', NULL, NULL, '12414', 6.6667, 80, 1, 1, 1, NULL, NULL),
(728, 10, 'Paragoda', 'පරගොඩ', NULL, NULL, '12302', 6.627108, 80.24112, 1, 1, 1, NULL, NULL),
(729, 10, 'Paraigama', NULL, NULL, NULL, '12122', 6.4167, 80.1167, 1, 1, 1, NULL, NULL),
(730, 10, 'Pelanda', NULL, NULL, NULL, '12214', 6.6056, 80.2333, 1, 1, 1, NULL, NULL),
(731, 10, 'Pelawatta', 'පැලවත්ත', NULL, NULL, '12138', 6.385227, 80.207989, 1, 1, 1, NULL, NULL),
(732, 10, 'Pimbura', 'පිඹුර', NULL, NULL, '70472', 6.570997, 80.161311, 1, 1, 1, NULL, NULL),
(733, 10, 'Pitagaldeniya', NULL, NULL, NULL, '71360', 6.45, 80.2667, 1, 1, 1, NULL, NULL),
(734, 10, 'Pokunuwita', 'පොකුණුවිට', NULL, NULL, '12404', 6.7333, 80.0333, 1, 1, 1, NULL, NULL),
(735, 10, 'Poruwedanda', NULL, NULL, NULL, '12432', 6.7333, 80.1167, 1, 1, 1, NULL, NULL),
(736, 10, 'Ratmale', NULL, NULL, NULL, '81030', 6.45, 80.2, 1, 1, 1, NULL, NULL),
(737, 10, 'Remunagoda', NULL, NULL, NULL, '12009', 6.594994, 80.031349, 1, 1, 1, NULL, NULL),
(738, 10, 'Talgaswela', NULL, NULL, NULL, '80470', 6.4415, 80.1807, 1, 1, 1, NULL, NULL),
(739, 10, 'Tebuwana', 'තෙඹුවන', NULL, NULL, '12025', 6.5944, 80.0611, 1, 1, 1, NULL, NULL),
(740, 10, 'Uduwara', NULL, NULL, NULL, '12322', 6.6167, 80.0667, 1, 1, 1, NULL, NULL),
(741, 10, 'Utumgama', NULL, NULL, NULL, '12127', 6.3917, 80.1417, 1, 1, 1, NULL, NULL),
(742, 10, 'Veyangalla', NULL, NULL, NULL, '12204', 6.5422, 80.1583, 1, 1, 1, NULL, NULL),
(743, 10, 'Wadduwa', 'වාද්දුව', NULL, NULL, '12560', 6.667121, 79.924051, 1, 1, 1, NULL, NULL),
(744, 10, 'Walagedara', 'වලගෙදර', NULL, NULL, '12112', 6.437775, 80.071449, 1, 1, 1, NULL, NULL),
(745, 10, 'Walallawita', 'වළල්ලාවිට', NULL, NULL, '12134', 6.3667, 80.2, 1, 1, 1, NULL, NULL),
(746, 10, 'Waskaduwa', 'වස්කඩුව', NULL, NULL, '12580', 6.6317, 79.9442, 1, 1, 1, NULL, NULL),
(747, 10, 'Welipenna', 'වැලිපැන්න', NULL, NULL, '12108', 6.466448, 80.101763, 1, 1, 1, NULL, NULL),
(748, 10, 'Weliveriya', 'වැලිවේරිය', NULL, NULL, '11710', 6.7167, 80.0333, 1, 1, 1, NULL, NULL),
(749, 10, 'Welmilla Junction', NULL, NULL, NULL, '12534', 6.7072, 80.01, 1, 1, 1, NULL, NULL),
(750, 10, 'Weragala', 'වේරගල', NULL, NULL, '71622', 6.527062, 80.004097, 1, 1, 1, NULL, NULL),
(751, 10, 'Yagirala', NULL, NULL, NULL, '12124', 6.378714, 80.161812, 1, 1, 1, NULL, NULL),
(752, 10, 'Yatadolawatta', NULL, NULL, NULL, '12104', 6.52309, 80.064428, 1, 1, 1, NULL, NULL),
(753, 10, 'Yatawara Junction', NULL, NULL, NULL, '12006', 6.5983, 80.0015, 1, 1, 1, NULL, NULL),
(754, 11, 'Aludeniya', 'අලුදෙණිය', NULL, NULL, '20062', 7.370491, 80.46648, 1, 1, 1, NULL, NULL),
(755, 11, 'Ambagahapelessa', 'අඹගහපැලැස්ස', NULL, NULL, '20986', 7.243803, 81.00264, 1, 1, 1, NULL, NULL),
(756, 11, 'Ambagamuwa Udabulathgama', 'අඹගමුව උඩබුලත්ගම', NULL, NULL, '20678', 7.0333, 80.5, 1, 1, 1, NULL, NULL),
(757, 11, 'Ambatenna', 'අඹතැන්න', NULL, NULL, '20136', 7.3472, 80.6192, 1, 1, 1, NULL, NULL),
(758, 11, 'Ampitiya', 'අම්පිටිය', NULL, NULL, '20160', 7.2667, 80.65, 1, 1, 1, NULL, NULL),
(759, 11, 'Ankumbura', 'අංකුඹුර', NULL, NULL, '20150', 7.434149, 80.568704, 1, 1, 1, NULL, NULL),
(760, 11, 'Atabage', 'අටබාගෙ', NULL, NULL, '20574', 7.1333, 80.6, 1, 1, 1, NULL, NULL),
(761, 11, 'Balana', 'බලන', NULL, NULL, '20308', 7.269032, 80.485503, 1, 1, 1, NULL, NULL),
(762, 11, 'Bambaragahaela', 'බඹරගහඇල', NULL, NULL, '20644', 7.0523, 80.5023, 1, 1, 1, NULL, NULL),
(763, 11, 'Batagolladeniya', 'බටගොල්ලදෙණිය', NULL, NULL, '20154', 7.41596, 80.576688, 1, 1, 1, NULL, NULL),
(764, 11, 'Batugoda', 'බටුගොඩ', NULL, NULL, '20132', 7.366275, 80.59604, 1, 1, 1, NULL, NULL),
(765, 11, 'Batumulla', 'බටුමුල්ල', NULL, NULL, '20966', 7.256086, 80.978905, 1, 1, 1, NULL, NULL),
(766, 11, 'Bawlana', 'බව්ලන', NULL, NULL, '20218', 7.211388, 80.718828, 1, 1, 1, NULL, NULL),
(767, 11, 'Bopana', 'බෝපන', NULL, NULL, '20932', 7.3, 80.9, 1, 1, 1, NULL, NULL),
(768, 11, 'Danture', 'දංතුරේ', NULL, NULL, '20465', 7.2833, 80.5333, 1, 1, 1, NULL, NULL),
(769, 11, 'Dedunupitiya', 'දේදුනුපිටිය', NULL, NULL, '20068', 7.3333, 80.4333, 1, 1, 1, NULL, NULL),
(770, 11, 'Dekinda', 'දෙකිඳ', NULL, NULL, '20658', 7.014688, 80.509932, 1, 1, 1, NULL, NULL),
(771, 11, 'Deltota', 'දෙල්තොට', NULL, NULL, '20430', 7.2, 80.6667, 1, 1, 1, NULL, NULL),
(772, 11, 'Divulankadawala', 'දිවුලන්කදවල', NULL, NULL, '51428', 7.175, 80.55, 1, 1, 1, NULL, NULL),
(773, 11, 'Dolapihilla', 'දොලපිහිල්ල', NULL, NULL, '20126', 7.393576, 80.584659, 1, 1, 1, NULL, NULL),
(774, 11, 'Dolosbage', 'දොලොස්බාගෙ', NULL, NULL, '20510', 7.0806, 80.4731, 1, 1, 1, NULL, NULL),
(775, 11, 'Dunuwila', 'දුනුවිල', NULL, NULL, '20824', 7.3833, 80.6333, 1, 1, 1, NULL, NULL),
(776, 11, 'Etulgama', 'ඇතුල්ගම', NULL, NULL, '20202', 7.2333, 80.65, 1, 1, 1, NULL, NULL),
(777, 11, 'Galaboda', 'ගලබොඩ', NULL, NULL, '20664', 6.9875, 80.5319, 1, 1, 1, NULL, NULL),
(778, 11, 'Galagedara', 'ගලගෙදර', NULL, NULL, '20100', 7.369716, 80.520308, 1, 1, 1, NULL, NULL),
(779, 11, 'Galaha', 'ගලහ', NULL, NULL, '20420', 7.195764, 80.668659, 1, 1, 1, NULL, NULL),
(780, 11, 'Galhinna', 'ගල්හින්න', NULL, NULL, '20152', 7.418361, 80.560015, 1, 1, 1, NULL, NULL),
(781, 11, 'Gampola', 'ගම්පොල', NULL, NULL, '20500', 7.1647, 80.5767, 1, 1, 1, NULL, NULL),
(782, 11, 'Gelioya', 'ගෙලිඔය', NULL, NULL, '20620', 7.2136, 80.6017, 1, 1, 1, NULL, NULL),
(783, 11, 'Godamunna', 'ගොඩමුන්න', NULL, NULL, '20214', 7.227313, 80.697447, 1, 1, 1, NULL, NULL),
(784, 11, 'Gomagoda', 'ගොමගොඩ', NULL, NULL, '20184', 7.3167, 80.7333, 1, 1, 1, NULL, NULL),
(785, 11, 'Gonagantenna', 'ගොනාගන්තැන්න', NULL, NULL, '20712', 7.1517, 80.7118, 1, 1, 1, NULL, NULL),
(786, 11, 'Gonawalapatana', 'ගෝනවලපතන', NULL, NULL, '20656', 7.0358, 80.5262, 1, 1, 1, NULL, NULL),
(787, 11, 'Gunnepana', 'ගුන්නෙපන', NULL, NULL, '20270', 7.2696, 80.6537, 1, 1, 1, NULL, NULL),
(788, 11, 'Gurudeniya', 'ගුරුදෙණිය', NULL, NULL, '20189', 7.265953, 80.702921, 1, 1, 1, NULL, NULL),
(789, 11, 'Hakmana', 'හක්මන', NULL, NULL, '81300', 7.334701, 80.82402, 1, 1, 1, NULL, NULL),
(790, 11, 'Handaganawa', 'හඳගනාව', NULL, NULL, '20984', 7.277451, 80.989485, 1, 1, 1, NULL, NULL),
(791, 11, 'Handawalapitiya', 'හඳවලපිටිය', NULL, NULL, '20438', 7.2, 80.6667, 1, 1, 1, NULL, NULL),
(792, 11, 'Handessa', 'හඳැස්ස', NULL, NULL, '20480', 7.230048, 80.580831, 1, 1, 1, NULL, NULL),
(793, 11, 'Hanguranketha', 'හඟුරන්කෙත', NULL, NULL, '20710', 7.1517, 80.7118, 1, 1, 1, NULL, NULL),
(794, 11, 'Harangalagama', 'හරංගලගම', NULL, NULL, '20669', 7.0271, 80.5493, 1, 1, 1, NULL, NULL),
(795, 11, 'Hataraliyadda', 'හතරලියද්ද', NULL, NULL, '20060', 7.3333, 80.4667, 1, 1, 1, NULL, NULL),
(796, 11, 'Hindagala', 'හිඳගල', NULL, NULL, '20414', 7.231512, 80.600815, 1, 1, 1, NULL, NULL),
(797, 11, 'Hondiyadeniya', 'හොඳයාදෙණිය', NULL, NULL, '20524', 7.1364, 80.5766, 1, 1, 1, NULL, NULL),
(798, 11, 'Hunnasgiriya', 'හුන්නස්ගිරිය', NULL, NULL, '20948', 7.298756, 80.849834, 1, 1, 1, NULL, NULL),
(799, 11, 'Inguruwatta', 'ඉඟුරුවත්ත', NULL, NULL, '60064', 7.175038, 80.599767, 1, 1, 1, NULL, NULL),
(800, 11, 'Jambugahapitiya', 'ජම්බුගහපිටිය', NULL, NULL, '20822', 7.3833, 80.6333, 1, 1, 1, NULL, NULL),
(801, 11, 'Kadugannawa', 'කඩුගන්නාව', NULL, NULL, '20300', 7.2536, 80.5275, 1, 1, 1, NULL, NULL),
(802, 11, 'Kahataliyadda', 'කහටලියද්ද', NULL, NULL, '20924', 7.376, 80.8213, 1, 1, 1, NULL, NULL),
(803, 11, 'Kalugala', 'කළුගල', NULL, NULL, '20926', 7.390136, 80.883008, 1, 1, 1, NULL, NULL),
(804, 11, 'Kandy', 'මහනුවර', NULL, NULL, '20000', 7.2964, 80.635, 1, 1, 1, NULL, NULL),
(805, 11, 'Kapuliyadde', 'කපුලියද්ද', NULL, NULL, '20206', 7.2401, 80.6808, 1, 1, 1, NULL, NULL),
(806, 11, 'Katugastota', 'කටුගස්තොට', NULL, NULL, '20800', 7.3161, 80.6211, 1, 1, 1, NULL, NULL),
(807, 11, 'Katukitula', 'කටුකිතුල', NULL, NULL, '20588', 7.1089, 80.6339, 1, 1, 1, NULL, NULL),
(808, 11, 'Kelanigama', 'කැළණිගම', NULL, NULL, '20688', 7.0049, 80.5182, 1, 1, 1, NULL, NULL),
(809, 11, 'Kengalla', 'කෙන්ගල්ල', NULL, NULL, '20186', 7.296461, 80.711767, 1, 1, 1, NULL, NULL),
(810, 11, 'Ketaboola', 'කැටබූල', NULL, NULL, '20660', 7.0271, 80.5493, 1, 1, 1, NULL, NULL),
(811, 11, 'Ketakumbura', 'කැටකුඹුර', NULL, NULL, '20306', 7.210532, 80.571678, 1, 1, 1, NULL, NULL),
(812, 11, 'Kobonila', 'කොබෝනීල', NULL, NULL, '20928', 7.376, 80.8213, 1, 1, 1, NULL, NULL),
(813, 11, 'Kolabissa', 'කොලබිස්ස', NULL, NULL, '20212', 7.225, 80.7167, 1, 1, 1, NULL, NULL),
(814, 11, 'Kolongoda', 'කොලොන්ගොඩ', NULL, NULL, '20971', 7.3552, 80.8375, 1, 1, 1, NULL, NULL),
(815, 11, 'Kulugammana', 'කුළුගම්මන', NULL, NULL, '20048', 7.315193, 80.590268, 1, 1, 1, NULL, NULL),
(816, 11, 'Kumbukkandura', 'කුඹුක්කඳුර', NULL, NULL, '20902', 7.2969, 80.7686, 1, 1, 1, NULL, NULL),
(817, 11, 'Kumburegama', 'කුඹුරේගම', NULL, NULL, '20086', 7.357279, 80.551316, 1, 1, 1, NULL, NULL),
(818, 11, 'Kundasale', 'කුණ්ඩසාලෙ', NULL, NULL, '20168', 7.2667, 80.6833, 1, 1, 1, NULL, NULL),
(819, 11, 'Leemagahakotuwa', NULL, NULL, NULL, '20482', 7.2333, 80.5833, 1, 1, 1, NULL, NULL),
(820, 11, 'lhala Kobbekaduwa', 'ඉහල කොබ්බෑකඩුව', NULL, NULL, '20042', 7.3167, 80.5833, 1, 1, 1, NULL, NULL),
(821, 11, 'Lunugama', 'ලුණුගම', NULL, NULL, '11062', 7.198402, 80.578244, 1, 1, 1, NULL, NULL),
(822, 11, 'Lunuketiya Maditta', NULL, NULL, NULL, '20172', 7.3292, 80.716, 1, 1, 1, NULL, NULL),
(823, 11, 'Madawala Bazaar', NULL, NULL, NULL, '20260', 7.2696, 80.6537, 1, 1, 1, NULL, NULL),
(824, 11, 'Madawalalanda', NULL, NULL, NULL, '32016', 7.3792, 80.4982, 1, 1, 1, NULL, NULL),
(825, 11, 'Madugalla', 'මඩුගල්ල', NULL, NULL, '20938', 7.265802, 80.882139, 1, 1, 1, NULL, NULL),
(826, 11, 'Madulkele', NULL, NULL, NULL, '20840', 7.400281, 80.728874, 1, 1, 1, NULL, NULL),
(827, 11, 'Mahadoraliyadda', NULL, NULL, NULL, '20945', 7.3, 80.85, 1, 1, 1, NULL, NULL),
(828, 11, 'Mahamedagama', 'මහමැදගම', NULL, NULL, '20216', 7.225, 80.7167, 1, 1, 1, NULL, NULL),
(829, 11, 'Mahanagapura', NULL, NULL, NULL, '32018', 7.3792, 80.4982, 1, 1, 1, NULL, NULL),
(830, 11, 'Mailapitiya', 'මයිලපිටිය', NULL, NULL, '20702', 7.1517, 80.7118, 1, 1, 1, NULL, NULL),
(831, 11, 'Makkanigama', 'මක්කානිගම', NULL, NULL, '20828', 7.3833, 80.6333, 1, 1, 1, NULL, NULL),
(832, 11, 'Makuldeniya', NULL, NULL, NULL, '20921', 7.341706, 80.777466, 1, 1, 1, NULL, NULL),
(833, 11, 'Mangalagama', 'මංගලගම', NULL, NULL, '32069', 7.285856, 80.563656, 1, 1, 1, NULL, NULL),
(834, 11, 'Mapakanda', NULL, NULL, NULL, '20662', 7.007889, 80.531101, 1, 1, 1, NULL, NULL),
(835, 11, 'Marassana', NULL, NULL, NULL, '20210', 7.221663, 80.732336, 1, 1, 1, NULL, NULL),
(836, 11, 'Marymount Colony', NULL, NULL, NULL, '20714', 7.1517, 80.7118, 1, 1, 1, NULL, NULL),
(837, 11, 'Mawatura', 'මාවතුර', NULL, NULL, '20564', 7.1, 80.5667, 1, 1, 1, NULL, NULL),
(838, 11, 'Medamahanuwara', NULL, NULL, NULL, '20940', 7.3, 80.85, 1, 1, 1, NULL, NULL),
(839, 11, 'Medawala Harispattuwa', NULL, NULL, NULL, '20120', 7.3417, 80.6833, 1, 1, 1, NULL, NULL),
(840, 11, 'Meetalawa', 'මීතලාව', NULL, NULL, '20512', 7.0986, 80.4699, 1, 1, 1, NULL, NULL),
(841, 11, 'Megoda Kalugamuwa', NULL, NULL, NULL, '20409', 7.2631, 80.6028, 1, 1, 1, NULL, NULL),
(842, 11, 'Menikdiwela', NULL, NULL, NULL, '20470', 7.288455, 80.501662, 1, 1, 1, NULL, NULL),
(843, 11, 'Menikhinna', 'මැණික්හින්න', NULL, NULL, '20170', 7.3167, 80.7, 1, 1, 1, NULL, NULL),
(844, 11, 'Mimure', 'මීමුරේ', NULL, NULL, '20923', 7.4333, 80.8333, 1, 1, 1, NULL, NULL),
(845, 11, 'Minigamuwa', NULL, NULL, NULL, '20109', 7.3333, 80.5167, 1, 1, 1, NULL, NULL),
(846, 11, 'Minipe', 'මිණිපේ', NULL, NULL, '20983', 7.223556, 80.990971, 1, 1, 1, NULL, NULL),
(847, 11, 'Moragahapallama', NULL, NULL, NULL, '32012', 7.3792, 80.4982, 1, 1, 1, NULL, NULL),
(848, 11, 'Murutalawa', 'මුරුතලාව', NULL, NULL, '20232', 7.3, 80.5667, 1, 1, 1, NULL, NULL),
(849, 11, 'Muruthagahamulla', NULL, NULL, NULL, '20526', 7.1364, 80.5766, 1, 1, 1, NULL, NULL),
(850, 11, 'Nanuoya', 'නානුඔය', NULL, NULL, '22150', 7.1171, 80.6387, 1, 1, 1, NULL, NULL),
(851, 11, 'Naranpanawa', 'නාරම්පනාව', NULL, NULL, '20176', 7.339733, 80.729831, 1, 1, 1, NULL, NULL),
(852, 11, 'Narawelpita', NULL, NULL, NULL, '81302', 7.3167, 80.8, 1, 1, 1, NULL, NULL),
(853, 11, 'Nawalapitiya', 'නාවලපිටිය', NULL, NULL, '20650', 7.05048, 80.530631, 1, 1, 1, NULL, NULL),
(854, 11, 'Nawathispane', NULL, NULL, NULL, '20670', 7.0333, 80.5, 1, 1, 1, NULL, NULL),
(855, 11, 'Nillambe', 'නිල්ලඹ', NULL, NULL, '20418', 7.15, 80.6333, 1, 1, 1, NULL, NULL),
(856, 11, 'Nugaliyadda', NULL, NULL, NULL, '20204', 7.2333, 80.7, 1, 1, 1, NULL, NULL),
(857, 11, 'Ovilikanda', NULL, NULL, NULL, '21020', 7.45, 80.5667, 1, 1, 1, NULL, NULL),
(858, 11, 'Pallekotuwa', 'පල්ලෙකොටුව', NULL, NULL, '20084', 7.3333, 80.5667, 1, 1, 1, NULL, NULL),
(859, 11, 'Panwilatenna', NULL, NULL, NULL, '20544', 7.1556, 80.6314, 1, 1, 1, NULL, NULL),
(860, 11, 'Paradeka', NULL, NULL, NULL, '20578', 7.12293, 80.618959, 1, 1, 1, NULL, NULL),
(861, 11, 'Pasbage', 'පස්බාගේ', NULL, NULL, '20654', 7.0358, 80.5262, 1, 1, 1, NULL, NULL),
(862, 11, 'Pattitalawa', NULL, NULL, NULL, '20511', 7.1167, 80.4667, 1, 1, 1, NULL, NULL),
(863, 11, 'Peradeniya', 'පේරාදෙණිය', NULL, NULL, '20400', 7.2631, 80.6028, 1, 1, 1, NULL, NULL),
(864, 11, 'Pilimatalawa', 'පිළිමතලාව', NULL, NULL, '20450', 7.2333, 80.5333, 1, 1, 1, NULL, NULL),
(865, 11, 'Poholiyadda', NULL, NULL, NULL, '20106', 7.343274, 80.520186, 1, 1, 1, NULL, NULL),
(866, 11, 'Pubbiliya', NULL, NULL, NULL, '21502', 7.385927, 80.481336, 1, 1, 1, NULL, NULL),
(867, 11, 'Pupuressa', NULL, NULL, NULL, '20546', 7.115632, 80.677455, 1, 1, 1, NULL, NULL),
(868, 11, 'Pussellawa', 'පුස්සැල්ලාව', NULL, NULL, '20580', 7.112565, 80.644101, 1, 1, 1, NULL, NULL),
(869, 11, 'Putuhapuwa', NULL, NULL, NULL, '20906', 7.334198, 80.759353, 1, 1, 1, NULL, NULL),
(870, 11, 'Rajawella', NULL, NULL, NULL, '20180', 7.280519, 80.748217, 1, 1, 1, NULL, NULL),
(871, 11, 'Rambukpitiya', NULL, NULL, NULL, '20676', 7.0333, 80.5, 1, 1, 1, NULL, NULL),
(872, 11, 'Rambukwella', NULL, NULL, NULL, '20128', 7.294759, 80.777664, 1, 1, 1, NULL, NULL),
(873, 11, 'Rangala', NULL, NULL, NULL, '20922', 7.344486, 80.795047, 1, 1, 1, NULL, NULL),
(874, 11, 'Rantembe', NULL, NULL, NULL, '20990', 7.3552, 80.8375, 1, 1, 1, NULL, NULL),
(875, 11, 'Sangarajapura', 'සංඝරාජපුර', NULL, NULL, '20044', 7.3167, 80.5833, 1, 1, 1, NULL, NULL),
(876, 11, 'Senarathwela', NULL, NULL, NULL, '20904', 7.280125, 80.761602, 1, 1, 1, NULL, NULL),
(877, 11, 'Talatuoya', 'තලාතුඔය', NULL, NULL, '20200', 7.2536, 80.6925, 1, 1, 1, NULL, NULL),
(878, 11, 'Teldeniya', 'තෙල්දෙණිය', NULL, NULL, '20900', 7.2969, 80.7686, 1, 1, 1, NULL, NULL),
(879, 11, 'Tennekumbura', 'තැන්නෙකුඹුර', NULL, NULL, '20166', 7.2833, 80.6667, 1, 1, 1, NULL, NULL),
(880, 11, 'Uda Peradeniya', NULL, NULL, NULL, '20404', 7.249001, 80.614072, 1, 1, 1, NULL, NULL),
(881, 11, 'Udahentenna', NULL, NULL, NULL, '20506', 7.0889, 80.5189, 1, 1, 1, NULL, NULL),
(882, 11, 'Udatalawinna', 'උඩුතලවින්න', NULL, NULL, '20802', 7.3161, 80.6211, 1, 1, 1, NULL, NULL),
(883, 11, 'Udispattuwa', NULL, NULL, NULL, '20916', 7.3552, 80.8375, 1, 1, 1, NULL, NULL),
(884, 11, 'Ududumbara', NULL, NULL, NULL, '20950', 7.3552, 80.8375, 1, 1, 1, NULL, NULL),
(885, 11, 'Uduwahinna', NULL, NULL, NULL, '20934', 7.2833, 80.8917, 1, 1, 1, NULL, NULL),
(886, 11, 'Uduwela', 'උඩුවෙල', NULL, NULL, '20164', 7.2722, 80.6667, 1, 1, 1, NULL, NULL),
(887, 11, 'Ulapane', 'උලපනේ', NULL, NULL, '20562', 7.114072, 80.552445, 1, 1, 1, NULL, NULL),
(888, 11, 'Unuwinna', NULL, NULL, NULL, '20708', 7.1517, 80.7118, 1, 1, 1, NULL, NULL),
(889, 11, 'Velamboda', NULL, NULL, NULL, '20640', 7.0523, 80.5023, 1, 1, 1, NULL, NULL),
(890, 11, 'Watagoda', 'වටගොඩ', NULL, NULL, '22110', 7.39731, 80.588304, 1, 1, 1, NULL, NULL),
(891, 11, 'Watagoda Harispattuwa', NULL, NULL, NULL, '20134', 7.3569, 80.6012, 1, 1, 1, NULL, NULL),
(892, 11, 'Wattappola', NULL, NULL, NULL, '20454', 7.234802, 80.543661, 1, 1, 1, NULL, NULL),
(893, 11, 'Weligampola', 'වැලිගම්පොළ', NULL, NULL, '20666', 7.0271, 80.5493, 1, 1, 1, NULL, NULL),
(894, 11, 'Wendaruwa', NULL, NULL, NULL, '20914', 7.3552, 80.8375, 1, 1, 1, NULL, NULL),
(895, 11, 'Weragantota', NULL, NULL, NULL, '20982', 7.3167, 80.9833, 1, 1, 1, NULL, NULL),
(896, 11, 'Werapitya', NULL, NULL, NULL, '20908', 7.2969, 80.7686, 1, 1, 1, NULL, NULL),
(897, 11, 'Werellagama', NULL, NULL, NULL, '20080', 7.3167, 80.5833, 1, 1, 1, NULL, NULL),
(898, 11, 'Wettawa', NULL, NULL, NULL, '20108', 7.3508, 80.5221, 1, 1, 1, NULL, NULL),
(899, 11, 'Yahalatenna', NULL, NULL, NULL, '20234', 7.3, 80.5667, 1, 1, 1, NULL, NULL),
(900, 11, 'Yatihalagala', NULL, NULL, NULL, '20034', 7.3, 80.6, 1, 1, 1, NULL, NULL),
(901, 12, 'Alawala', 'අලවල', NULL, NULL, '11122', 7.197379, 80.282779, 1, 1, 1, NULL, NULL),
(902, 12, 'Alawatura', 'අලවතුර', NULL, NULL, '71204', 7.1333, 80.3333, 1, 1, 1, NULL, NULL),
(903, 12, 'Alawwa', 'අලව්ව', NULL, NULL, '60280', 7.2875, 80.2536, 1, 1, 1, NULL, NULL),
(904, 12, 'Algama', 'අල්ගම', NULL, NULL, '71607', 7.158338, 80.162939, 1, 1, 1, NULL, NULL),
(905, 12, 'Alutnuwara', 'අළුත්නුවර', NULL, NULL, '71508', 7.2333, 80.4667, 1, 1, 1, NULL, NULL),
(906, 12, 'Ambalakanda', 'අම්බලකන්ද', NULL, NULL, '71546', 7.134049, 80.446804, 1, 1, 1, NULL, NULL),
(907, 12, 'Ambulugala', 'අම්බුළුගල', NULL, NULL, '71503', 7.239127, 80.409623, 1, 1, 1, NULL, NULL),
(908, 12, 'Amitirigala', 'අමිතිරිගල', NULL, NULL, '71320', 7.0306, 80.1839, 1, 1, 1, NULL, NULL),
(909, 12, 'Ampagala', 'අම්පාගල', NULL, NULL, '71232', 7.080239, 80.289037, 1, 1, 1, NULL, NULL),
(910, 12, 'Anhandiya', 'අංහන්දිය', NULL, NULL, '60074', 7.2667, 80.2667, 1, 1, 1, NULL, NULL),
(911, 12, 'Anhettigama', 'අංහෙට්ටිගම', NULL, NULL, '71403', 6.922121, 80.371876, 1, 1, 1, NULL, NULL),
(912, 12, 'Aranayaka', 'අරනායක', NULL, NULL, '71540', 7.144705, 80.461358, 1, 1, 1, NULL, NULL),
(913, 12, 'Aruggammana', 'අරුග්ගම්මන', NULL, NULL, '71041', 7.117733, 80.306712, 1, 1, 1, NULL, NULL),
(914, 12, 'Batuwita', 'බටුවිට', NULL, NULL, '71321', 7.044339, 80.179129, 1, 1, 1, NULL, NULL),
(915, 12, 'Beligala(Sab)', 'බෙලිගල', NULL, NULL, '71044', 7.2167, 80.2917, 1, 1, 1, NULL, NULL),
(916, 12, 'Belihuloya', 'බෙලිහුල්ඔය', NULL, NULL, '70140', 7.2667, 80.2167, 1, 1, 1, NULL, NULL),
(917, 12, 'Berannawa', 'බෙරන්නව', NULL, NULL, '71706', 7.064482, 80.405526, 1, 1, 1, NULL, NULL),
(918, 12, 'Bopitiya', 'බෝපිටිය', NULL, NULL, '60155', 7.179761, 80.205221, 1, 1, 1, NULL, NULL),
(919, 12, 'Bopitiya (SAB)', 'බෝපිටිය (සබර)', NULL, NULL, '71612', 7.2583, 80.2167, 1, 1, 1, NULL, NULL),
(920, 12, 'Boralankada', 'බොරලන්කද', NULL, NULL, '71418', 6.979656, 80.330338, 1, 1, 1, NULL, NULL),
(921, 12, 'Bossella', 'බොස්සැල්ල', NULL, NULL, '71208', 7.1333, 80.4, 1, 1, 1, NULL, NULL),
(922, 12, 'Bulathkohupitiya', 'බුලත්කොහුපිටිය', NULL, NULL, '71230', 7.105994, 80.338761, 1, 1, 1, NULL, NULL),
(923, 12, 'Damunupola', 'දමුනුපොල', NULL, NULL, '71034', 7.187968, 80.334456, 1, 1, 1, NULL, NULL),
(924, 12, 'Debathgama', 'දෙබත්ගම', NULL, NULL, '71037', 7.1833, 80.3583, 1, 1, 1, NULL, NULL),
(925, 12, 'Dedugala', 'දේදුගල', NULL, NULL, '71237', 7.093849, 80.418959, 1, 1, 1, NULL, NULL),
(926, 12, 'Deewala Pallegama', 'දීවල පල්ලෙගම', NULL, NULL, '71022', 7.2333, 80.2667, 1, 1, 1, NULL, NULL),
(927, 12, 'Dehiowita', 'දෙහිඕවිට', NULL, NULL, '71400', 6.9706, 80.2675, 1, 1, 1, NULL, NULL),
(928, 12, 'Deldeniya', 'දෙල්දෙණිය', NULL, NULL, '71009', 7.280914, 80.35876, 1, 1, 1, NULL, NULL),
(929, 12, 'Deloluwa', 'දෙලෝලුව', NULL, NULL, '71401', 6.9653, 80.3181, 1, 1, 1, NULL, NULL),
(930, 12, 'Deraniyagala', 'දැරණියගල', NULL, NULL, '71430', 6.932387, 80.335039, 1, 1, 1, NULL, NULL),
(931, 12, 'Dewalegama', 'දේවාලේගම', NULL, NULL, '71050', 7.278928, 80.319135, 1, 1, 1, NULL, NULL),
(932, 12, 'Dewanagala', 'දෙවනගල', NULL, NULL, '71527', 7.2167, 80.4667, 1, 1, 1, NULL, NULL),
(933, 12, 'Dombemada', 'දොඹේමද', NULL, NULL, '71115', 7.37974, 80.348761, 1, 1, 1, NULL, NULL),
(934, 12, 'Dorawaka', 'දොරවක', NULL, NULL, '71601', 7.1833, 80.2167, 1, 1, 1, NULL, NULL),
(935, 12, 'Dunumala', 'දුනුමල', NULL, NULL, '71605', 7.1738, 80.2074, 1, 1, 1, NULL, NULL),
(936, 12, 'Galapitamada', 'ගලපිටමඩ', NULL, NULL, '71603', 7.14, 80.2364, 1, 1, 1, NULL, NULL),
(937, 12, 'Galatara', 'ගලතර', NULL, NULL, '71505', 7.2167, 80.4167, 1, 1, 1, NULL, NULL),
(938, 12, 'Galigamuwa Town', 'ගලිගමුව නගරය', NULL, NULL, '71350', 7.2, 80.3, 1, 1, 1, NULL, NULL),
(939, 12, 'Gallella', 'ගල්ලෑල්ල', NULL, NULL, '70062', 6.85, 80.35, 1, 1, 1, NULL, NULL),
(940, 12, 'Galpatha(Sab)', 'ගල්පාත (සබරගමුව)', NULL, NULL, '71312', 7.05, 80.2333, 1, 1, 1, NULL, NULL),
(941, 12, 'Gantuna', 'ගන්තුන', NULL, NULL, '71222', 7.1667, 80.3667, 1, 1, 1, NULL, NULL),
(942, 12, 'Getahetta', 'ගැටහැත්ත', NULL, NULL, '70620', 6.9128, 80.2358, 1, 1, 1, NULL, NULL),
(943, 12, 'Godagampola', 'ගොඩගම්පොල', NULL, NULL, '70556', 6.885959, 80.313855, 1, 1, 1, NULL, NULL),
(944, 12, 'Gonagala', 'ගෝනාගල', NULL, NULL, '71318', 7.035326, 80.207373, 1, 1, 1, NULL, NULL),
(945, 12, 'Hakahinna', 'හකහින්න', NULL, NULL, '71352', 7.2, 80.3, 1, 1, 1, NULL, NULL),
(946, 12, 'Hakbellawaka', 'හක්බෙල්ලවක', NULL, NULL, '71715', 7.003952, 80.328796, 1, 1, 1, NULL, NULL),
(947, 12, 'Halloluwa', 'හල්ලෝලුව', NULL, NULL, '20032', 7.2, 80.35, 1, 1, 1, NULL, NULL),
(948, 12, 'Hedunuwewa', NULL, NULL, NULL, '22024', 6.9306, 80.2747, 1, 1, 1, NULL, NULL),
(949, 12, 'Hemmatagama', 'හෙම්මාතගම', NULL, NULL, '71530', 7.1667, 80.5, 1, 1, 1, NULL, NULL),
(950, 12, 'Hewadiwela', NULL, NULL, NULL, '71108', 7.372493, 80.377574, 1, 1, 1, NULL, NULL),
(951, 12, 'Hingula', 'හිඟුල', NULL, NULL, '71520', 7.247803, 80.469032, 1, 1, 1, NULL, NULL),
(952, 12, 'Hinguralakanda', NULL, NULL, NULL, '71417', 6.91506, 80.304394, 1, 1, 1, NULL, NULL),
(953, 12, 'Hingurana', 'හිඟුරාන', NULL, NULL, '32010', 6.9167, 80.4167, 1, 1, 1, NULL, NULL),
(954, 12, 'Hiriwadunna', 'හිරිවඩුන්න', NULL, NULL, '71014', 7.2833, 80.3833, 1, 1, 1, NULL, NULL),
(955, 12, 'Ihala Walpola', NULL, NULL, NULL, '80134', 7.350958, 80.397324, 1, 1, 1, NULL, NULL),
(956, 12, 'Ihalagama', 'ඉහළගම', NULL, NULL, '70144', 7.2667, 80.3333, 1, 1, 1, NULL, NULL),
(957, 12, 'Imbulana', 'ඉඹුලාන', NULL, NULL, '71313', 7.08264, 80.245565, 1, 1, 1, NULL, NULL),
(958, 12, 'Imbulgasdeniya', NULL, NULL, NULL, '71055', 7.2853, 80.3186, 1, 1, 1, NULL, NULL),
(959, 12, 'Kabagamuwa', NULL, NULL, NULL, '71202', 7.136698, 80.341558, 1, 1, 1, NULL, NULL),
(960, 12, 'Kahapathwala', NULL, NULL, NULL, '60062', 7.3, 80.4583, 1, 1, 1, NULL, NULL),
(961, 12, 'Kandaketya', NULL, NULL, NULL, '90020', 7.2333, 80.4667, 1, 1, 1, NULL, NULL),
(962, 12, 'Kannattota', NULL, NULL, NULL, '71372', 7.081348, 80.275311, 1, 1, 1, NULL, NULL),
(963, 12, 'Karagahinna', NULL, NULL, NULL, '21014', 7.3604, 80.3832, 1, 1, 1, NULL, NULL),
(964, 12, 'Kegalle', 'කෑගල්ල', NULL, NULL, '71000', 7.249349, 80.351662, 1, 1, 1, NULL, NULL),
(965, 12, 'Kehelpannala', NULL, NULL, NULL, '71533', 7.161131, 80.519539, 1, 1, 1, NULL, NULL),
(966, 12, 'Ketawala Leula', NULL, NULL, NULL, '20198', 7.1167, 80.35, 1, 1, 1, NULL, NULL),
(967, 12, 'Kitulgala', 'කිතුල්ගල', NULL, NULL, '71720', 6.9944, 80.4114, 1, 1, 1, NULL, NULL),
(968, 12, 'Kondeniya', NULL, NULL, NULL, '71501', 7.2667, 80.4333, 1, 1, 1, NULL, NULL),
(969, 12, 'Kotiyakumbura', NULL, NULL, NULL, '71370', 7.0833, 80.2667, 1, 1, 1, NULL, NULL),
(970, 12, 'Lewangama', NULL, NULL, NULL, '71315', 7.112902, 80.239, 1, 1, 1, NULL, NULL),
(971, 12, 'Mahabage', 'මහබාගේ', NULL, NULL, '71722', 7.019803, 80.450227, 1, 1, 1, NULL, NULL),
(972, 12, 'Makehelwala', NULL, NULL, NULL, '71507', 7.282441, 80.47528, 1, 1, 1, NULL, NULL),
(973, 12, 'Malalpola', 'මලල්පොල', NULL, NULL, '71704', 7.053091, 80.351009, 1, 1, 1, NULL, NULL),
(974, 12, 'Maldeniya', 'මල්දෙණිය', NULL, NULL, '22021', 6.9306, 80.2747, 1, 1, 1, NULL, NULL),
(975, 12, 'Maliboda', NULL, NULL, NULL, '71411', 6.887528, 80.464212, 1, 1, 1, NULL, NULL),
(976, 12, 'Maliyadda', NULL, NULL, NULL, '90022', 7.2333, 80.4667, 1, 1, 1, NULL, NULL),
(977, 12, 'Malmaduwa', NULL, NULL, NULL, '71325', 7.15, 80.2833, 1, 1, 1, NULL, NULL),
(978, 12, 'Marapana', 'මාරපන', NULL, NULL, '70041', 7.2333, 80.35, 1, 1, 1, NULL, NULL),
(979, 12, 'Mawanella', 'මාවනැල්ල', NULL, NULL, '71500', 7.244446, 80.439045, 1, 1, 1, NULL, NULL),
(980, 12, 'Meetanwala', NULL, NULL, NULL, '60066', 7.3, 80.4583, 1, 1, 1, NULL, NULL),
(981, 12, 'Migastenna Sabara', NULL, NULL, NULL, '71716', 7.0333, 80.3333, 1, 1, 1, NULL, NULL),
(982, 12, 'Miyanawita', NULL, NULL, NULL, '71432', 6.900423, 80.351075, 1, 1, 1, NULL, NULL),
(983, 12, 'Molagoda', NULL, NULL, NULL, '71016', 7.25, 80.3833, 1, 1, 1, NULL, NULL),
(984, 12, 'Morontota', NULL, NULL, NULL, '71220', 7.1667, 80.3667, 1, 1, 1, NULL, NULL),
(985, 12, 'Narangala', 'නාරංගල', NULL, NULL, '90064', 7.07922, 80.360764, 1, 1, 1, NULL, NULL),
(986, 12, 'Narangoda', 'නාරංගොඩ', NULL, NULL, '60152', 7.198165, 80.294552, 1, 1, 1, NULL, NULL),
(987, 12, 'Nattarampotha', NULL, NULL, NULL, '20194', 7.1167, 80.35, 1, 1, 1, NULL, NULL),
(988, 12, 'Nelundeniya', 'නෙලුන්දෙනිය', NULL, NULL, '71060', 7.2319, 80.2669, 1, 1, 1, NULL, NULL),
(989, 12, 'Niyadurupola', NULL, NULL, NULL, '71602', 7.1667, 80.2167, 1, 1, 1, NULL, NULL),
(990, 12, 'Noori', NULL, NULL, NULL, '71407', 6.9508, 80.3174, 1, 1, 1, NULL, NULL),
(991, 12, 'Pannila', NULL, NULL, NULL, '12114', 6.866357, 80.320996, 1, 1, 1, NULL, NULL),
(992, 12, 'Pattampitiya', NULL, NULL, NULL, '71130', 7.315516, 80.434412, 1, 1, 1, NULL, NULL),
(993, 12, 'Pilawala', NULL, NULL, NULL, '20196', 7.1167, 80.35, 1, 1, 1, NULL, NULL),
(994, 12, 'Pothukoladeniya', NULL, NULL, NULL, '71039', 7.1833, 80.3583, 1, 1, 1, NULL, NULL),
(995, 12, 'Puswelitenna', NULL, NULL, NULL, '60072', 7.3667, 80.3667, 1, 1, 1, NULL, NULL),
(996, 12, 'Rambukkana', 'රඹුක්කන', NULL, NULL, '71100', 7.323016, 80.391856, 1, 1, 1, NULL, NULL),
(997, 12, 'Rilpola', NULL, NULL, NULL, '90026', 7.2333, 80.4667, 1, 1, 1, NULL, NULL),
(998, 12, 'Rukmale', 'රුක්මලේ', NULL, NULL, '11129', 7.2, 80.4833, 1, 1, 1, NULL, NULL),
(999, 12, 'Ruwanwella', 'රුවන්වැල්ල', NULL, NULL, '71300', 7.048852, 80.2561, 1, 1, 1, NULL, NULL),
(1000, 12, 'Samanalawewa', 'සමනලවැව', NULL, NULL, '70142', 7.2667, 80.2167, 1, 1, 1, NULL, NULL),
(1001, 12, 'Seaforth Colony', NULL, NULL, NULL, '71708', 7.0469, 80.3502, 1, 1, 1, NULL, NULL),
(1002, 5, 'Colombo 2', 'කොළඹ 2', 'கொழும்பு 2', 'Slave Island', '200', 6.926944, 79.848611, 1, 1, 1, NULL, NULL),
(1003, 12, 'Spring Valley', NULL, NULL, NULL, '90028', 7.2333, 80.4667, 1, 1, 1, NULL, NULL),
(1004, 12, 'Talgaspitiya', NULL, NULL, NULL, '71541', 7.1667, 80.4833, 1, 1, 1, NULL, NULL),
(1005, 12, 'Teligama', NULL, NULL, NULL, '71724', 7.0033, 80.3647, 1, 1, 1, NULL, NULL),
(1006, 12, 'Tholangamuwa', NULL, NULL, NULL, '71619', 7.233983, 80.225956, 1, 1, 1, NULL, NULL),
(1007, 12, 'Thotawella', NULL, NULL, NULL, '71106', 7.3555, 80.3969, 1, 1, 1, NULL, NULL),
(1008, 12, 'Udaha Hawupe', NULL, NULL, NULL, '70154', 7.05, 80.2833, 1, 1, 1, NULL, NULL),
(1009, 12, 'Udapotha', NULL, NULL, NULL, '71236', 7.09414, 80.377416, 1, 1, 1, NULL, NULL),
(1010, 12, 'Uduwa', 'උඩුව', NULL, NULL, '20052', 7.110957, 80.387557, 1, 1, 1, NULL, NULL),
(1011, 12, 'Undugoda', 'උඳුගොඩ', NULL, NULL, '71200', 7.141866, 80.365332, 1, 1, 1, NULL, NULL),
(1012, 12, 'Ussapitiya', 'උස්සපිටිය', NULL, NULL, '71510', 7.216957, 80.444573, 1, 1, 1, NULL, NULL),
(1013, 12, 'Wahakula', NULL, NULL, NULL, '71303', 7.058236, 80.207402, 1, 1, 1, NULL, NULL),
(1014, 12, 'Waharaka', 'වහරක', NULL, NULL, '71304', 7.088513, 80.198619, 1, 1, 1, NULL, NULL),
(1015, 12, 'Wanaluwewa', NULL, NULL, NULL, '11068', 7.0667, 80.175, 1, 1, 1, NULL, NULL),
(1016, 12, 'Warakapola', NULL, NULL, NULL, '71600', 7.230053, 80.196768, 1, 1, 1, NULL, NULL),
(1017, 12, 'Watura', NULL, NULL, NULL, '71035', 7.1833, 80.3833, 1, 1, 1, NULL, NULL),
(1018, 12, 'Weeoya', 'වී ඔය', NULL, NULL, '71702', 7.0469, 80.3502, 1, 1, 1, NULL, NULL),
(1019, 12, 'Wegalla', NULL, NULL, NULL, '71234', 7.099631, 80.30654, 1, 1, 1, NULL, NULL),
(1020, 12, 'Weligalla', NULL, NULL, NULL, '20610', 7.1833, 80.2, 1, 1, 1, NULL, NULL),
(1021, 12, 'Welihelatenna', NULL, NULL, NULL, '71712', 7.0333, 80.3333, 1, 1, 1, NULL, NULL),
(1022, 12, 'Wewelwatta', NULL, NULL, NULL, '70066', 6.85, 80.35, 1, 1, 1, NULL, NULL),
(1023, 12, 'Yatagama', 'යටගම', NULL, NULL, '71116', 7.32512, 80.356415, 1, 1, 1, NULL, NULL),
(1024, 12, 'Yatapana', NULL, NULL, NULL, '71326', 7.1333, 80.3, 1, 1, 1, NULL, NULL),
(1025, 12, 'Yatiyantota', 'යටියන්තොට', NULL, NULL, '71700', 7.0242, 80.3006, 1, 1, 1, NULL, NULL),
(1026, 12, 'Yattogoda', NULL, NULL, NULL, '71029', 7.2333, 80.2667, 1, 1, 1, NULL, NULL),
(1027, 13, 'Kandavalai', NULL, NULL, NULL, '', 9.4515585, 80.5008173, 1, 1, 1, NULL, NULL),
(1028, 13, 'Karachchi', NULL, NULL, NULL, '', 9.3769363, 80.3766044, 1, 1, 1, NULL, NULL),
(1029, 13, 'Kilinochchi', 'කිළිනොච්චි', NULL, NULL, '', 9.416667, 80.416667, 1, 1, 1, NULL, NULL),
(1030, 13, 'Pachchilaipalli', NULL, NULL, NULL, '', 9.6115808, 80.3273106, 1, 1, 1, NULL, NULL),
(1031, 13, 'Poonakary', NULL, NULL, NULL, '', 9.5035013, 80.2111173, 1, 1, 1, NULL, NULL),
(1032, 11, 'Akurana', 'අකුරණ', NULL, NULL, '20850', 7.637034, 80.023362, 1, 1, 1, NULL, NULL),
(1033, 14, 'Alahengama', 'අලහෙන්ගම', NULL, NULL, '60416', 7.6779, 80.1151, 1, 1, 1, NULL, NULL),
(1034, 14, 'Alahitiyawa', 'අලහිටියාව', NULL, NULL, '60182', 7.473913, 80.171211, 1, 1, 1, NULL, NULL),
(1035, 14, 'Ambakote', 'අඹකොටේ', NULL, NULL, '60036', 7.492063, 80.452844, 1, 1, 1, NULL, NULL),
(1036, 14, 'Ambanpola', 'අඹන්පොල', NULL, NULL, '60650', 7.915973, 80.237512, 1, 1, 1, NULL, NULL),
(1037, 14, 'Andiyagala', 'ආඬියාගල', NULL, NULL, '50112', 7.4667, 80.1333, 1, 1, 1, NULL, NULL),
(1038, 14, 'Anukkane', 'අනුක්කනේ', NULL, NULL, '60214', 7.501814, 80.120028, 1, 1, 1, NULL, NULL),
(1039, 14, 'Aragoda', 'අරංගොඩ', NULL, NULL, '60308', 7.366116, 80.344207, 1, 1, 1, NULL, NULL),
(1040, 14, 'Ataragalla', 'අටරගල්ල', NULL, NULL, '60706', 7.9696, 80.2768, 1, 1, 1, NULL, NULL),
(1041, 14, 'Awulegama', 'අවුලේගම', NULL, NULL, '60462', 7.6569, 80.2203, 1, 1, 1, NULL, NULL),
(1042, 14, 'Balalla', 'බලල්ල', NULL, NULL, '60604', 7.791025, 80.250762, 1, 1, 1, NULL, NULL),
(1043, 14, 'Bamunukotuwa', 'බමුණකොටුව', NULL, NULL, '60347', 7.8667, 80.2167, 1, 1, 1, NULL, NULL),
(1044, 14, 'Bandara Koswatta', 'බන්ඩාර කොස්වත්ත', NULL, NULL, '60424', 7.603296, 80.17257, 1, 1, 1, NULL, NULL),
(1045, 14, 'Bingiriya', 'බින්ගිරිය', NULL, NULL, '60450', 7.605177, 79.921996, 1, 1, 1, NULL, NULL),
(1046, 14, 'Bogamulla', 'බෝගමුල්ල', NULL, NULL, '60107', 7.4589, 80.2107, 1, 1, 1, NULL, NULL),
(1047, 14, 'Boraluwewa', 'බොරළුවැව', NULL, NULL, '60437', 7.682578, 80.034757, 1, 1, 1, NULL, NULL),
(1048, 14, 'Boyagane', 'බෝයගානෙ', NULL, NULL, '60027', 7.452272, 80.341672, 1, 1, 1, NULL, NULL),
(1049, 14, 'Bujjomuwa', 'බුජ්ජෝමුව', NULL, NULL, '60291', 7.4581, 80.0603, 1, 1, 1, NULL, NULL),
(1050, 14, 'Buluwala', 'බුලුවල', NULL, NULL, '60076', 7.484201, 80.473535, 1, 1, 1, NULL, NULL),
(1051, 14, 'Dadayamtalawa', 'දඩයම්තලාව', NULL, NULL, '32046', 7.65, 79.9667, 1, 1, 1, NULL, NULL),
(1052, 14, 'Dambadeniya', 'දඹදෙණිය', NULL, NULL, '60130', 7.370527, 80.146193, 1, 1, 1, NULL, NULL),
(1053, 14, 'Daraluwa', 'දරලුව', NULL, NULL, '60174', 7.359407, 79.978233, 1, 1, 1, NULL, NULL),
(1054, 14, 'Deegalla', 'දීගල්ල', NULL, NULL, '60228', 7.510205, 80.029797, 1, 1, 1, NULL, NULL),
(1055, 14, 'Demataluwa', 'දෙමටලුව', NULL, NULL, '60024', 7.513976, 80.258741, 1, 1, 1, NULL, NULL),
(1056, 14, 'Demuwatha', 'දෙමුවත', NULL, NULL, '70332', 7.35, 80.1667, 1, 1, 1, NULL, NULL);
INSERT INTO `cities` (`id`, `district_id`, `name_en`, `name_si`, `name_ta`, `description`, `postcode`, `latitude`, `longitude`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1057, 14, 'Diddeniya', 'දෙණියාය', NULL, NULL, '60544', 7.685279, 80.47286, 1, 1, 1, NULL, NULL),
(1058, 14, 'Digannewa', 'දිගන්නෑව', NULL, NULL, '60485', 7.897218, 80.101328, 1, 1, 1, NULL, NULL),
(1059, 14, 'Divullegoda', 'දිවුලේගොඩ', NULL, NULL, '60472', 7.75, 80.2, 1, 1, 1, NULL, NULL),
(1060, 14, 'Diyasenpura', 'දියසෙන්පුර', NULL, NULL, '51504', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1061, 14, 'Dodangaslanda', 'දොඩන්ගස්ලන්ද', NULL, NULL, '60530', 7.5667, 80.5333, 1, 1, 1, NULL, NULL),
(1062, 14, 'Doluwa', 'දොළුව', NULL, NULL, '20532', 7.621516, 80.418833, 1, 1, 1, NULL, NULL),
(1063, 14, 'Doragamuwa', 'දොරගමුව', NULL, NULL, '20816', 7.5833, 79.9333, 1, 1, 1, NULL, NULL),
(1064, 14, 'Doratiyawa', 'දොරටියාව', NULL, NULL, '60013', 7.450628, 80.380562, 1, 1, 1, NULL, NULL),
(1065, 14, 'Dunumadalawa', 'දුනුමඩවල', NULL, NULL, '50214', 7.8, 80.0833, 1, 1, 1, NULL, NULL),
(1066, 14, 'Dunuwilapitiya', 'දුනුවිලපිටිය', NULL, NULL, '21538', 7.3667, 80.2, 1, 1, 1, NULL, NULL),
(1067, 14, 'Ehetuwewa', 'ඇහැටුවැව', NULL, NULL, '60716', 7.927568, 80.332035, 1, 1, 1, NULL, NULL),
(1068, 14, 'Elibichchiya', 'ඇලිබිච්චිය', NULL, NULL, '60156', 7.313179, 80.056935, 1, 1, 1, NULL, NULL),
(1069, 14, 'Embogama', NULL, NULL, NULL, '60718', 7.9214, 80.3608, 1, 1, 1, NULL, NULL),
(1070, 14, 'Etungahakotuwa', 'ඇතුන්ගහකොටුව', NULL, NULL, '60266', 7.5167, 79.9667, 1, 1, 1, NULL, NULL),
(1071, 14, 'Galadivulwewa', 'ගලදිවුල්වැව', NULL, NULL, '50210', 7.8, 80.0833, 1, 1, 1, NULL, NULL),
(1072, 14, 'Galgamuwa', 'ගල්ගමුව', NULL, NULL, '60700', 7.995468, 80.267527, 1, 1, 1, NULL, NULL),
(1073, 14, 'Gallellagama', 'ගල්ලෑල්ලගම', NULL, NULL, '20095', 7.3, 80.15, 1, 1, 1, NULL, NULL),
(1074, 14, 'Gallewa', NULL, NULL, NULL, '60712', 7.9667, 80.3333, 1, 1, 1, NULL, NULL),
(1075, 14, 'Ganegoda', 'ගණේගොඩ', NULL, NULL, '80440', 7.5833, 80, 1, 1, 1, NULL, NULL),
(1076, 14, 'Girathalana', 'ගිරාතලන', NULL, NULL, '60752', 7.9833, 80.3833, 1, 1, 1, NULL, NULL),
(1077, 14, 'Gokaralla', 'ගොකරුල්ල', NULL, NULL, '60522', 7.6301, 80.3775, 1, 1, 1, NULL, NULL),
(1078, 14, 'Gonawila', 'ගොනාවිල', NULL, NULL, '60170', 7.3167, 80, 1, 1, 1, NULL, NULL),
(1079, 14, 'Halmillawewa', 'හල්මිල්ලවැව', NULL, NULL, '60441', 7.5953, 79.9972, 1, 1, 1, NULL, NULL),
(1080, 14, 'Handungamuwa', 'හඳුන්ගමුව', NULL, NULL, '21536', 7.3667, 80.2, 1, 1, 1, NULL, NULL),
(1081, 14, 'Harankahawa', 'හරන්කහව', NULL, NULL, '20092', 7.3, 80.15, 1, 1, 1, NULL, NULL),
(1082, 14, 'Helamada', NULL, NULL, NULL, '71046', 7.3167, 80.2833, 1, 1, 1, NULL, NULL),
(1083, 14, 'Hengamuwa', NULL, NULL, NULL, '60414', 7.703282, 80.111254, 1, 1, 1, NULL, NULL),
(1084, 14, 'Hettipola', 'හෙට්ටිපොල', NULL, NULL, '60430', 7.605372, 80.083137, 1, 1, 1, NULL, NULL),
(1085, 14, 'Hewainna', NULL, NULL, NULL, '10714', 7.3333, 80.2167, 1, 1, 1, NULL, NULL),
(1086, 14, 'Hilogama', NULL, NULL, NULL, '60486', 7.75, 80.0833, 1, 1, 1, NULL, NULL),
(1087, 14, 'Hindagolla', 'හිඳගොල්ල', NULL, NULL, '60034', 7.4833, 80.4167, 1, 1, 1, NULL, NULL),
(1088, 14, 'Hiriyala Lenawa', NULL, NULL, NULL, '60546', 7.6709, 80.4751, 1, 1, 1, NULL, NULL),
(1089, 14, 'Hiruwalpola', NULL, NULL, NULL, '60458', 7.553915, 79.924699, 1, 1, 1, NULL, NULL),
(1090, 14, 'Horambawa', NULL, NULL, NULL, '60181', 7.45, 80.1833, 1, 1, 1, NULL, NULL),
(1091, 14, 'Hulogedara', NULL, NULL, NULL, '60474', 7.7833, 80.1833, 1, 1, 1, NULL, NULL),
(1092, 14, 'Hulugalla', 'හුළුගල්ල', NULL, NULL, '60477', 7.79059, 80.140007, 1, 1, 1, NULL, NULL),
(1093, 14, 'Ihala Gomugomuwa', NULL, NULL, NULL, '60211', 7.5167, 80.0833, 1, 1, 1, NULL, NULL),
(1094, 14, 'Ihala Katugampala', NULL, NULL, NULL, '60135', 7.3672, 80.1467, 1, 1, 1, NULL, NULL),
(1095, 14, 'Indulgodakanda', NULL, NULL, NULL, '60016', 7.422625, 80.402808, 1, 1, 1, NULL, NULL),
(1096, 14, 'Ithanawatta', NULL, NULL, NULL, '60025', 7.4458, 80.3458, 1, 1, 1, NULL, NULL),
(1097, 14, 'Kadigawa', NULL, NULL, NULL, '60492', 7.7167, 80, 1, 1, 1, NULL, NULL),
(1098, 14, 'Kalankuttiya', NULL, NULL, NULL, '50174', 8.05, 80.3833, 1, 1, 1, NULL, NULL),
(1099, 14, 'Kalatuwawa', NULL, NULL, NULL, '10718', 7.6333, 80.3667, 1, 1, 1, NULL, NULL),
(1100, 14, 'Kalugamuwa', NULL, NULL, NULL, '60096', 7.449717, 80.256696, 1, 1, 1, NULL, NULL),
(1101, 14, 'Kanadeniyawala', NULL, NULL, NULL, '60054', 7.43824, 80.535658, 1, 1, 1, NULL, NULL),
(1102, 14, 'Kanattewewa', NULL, NULL, NULL, '60422', 7.6167, 80.2, 1, 1, 1, NULL, NULL),
(1103, 14, 'Kandegedara', NULL, NULL, NULL, '90070', 7.424611, 80.071498, 1, 1, 1, NULL, NULL),
(1104, 14, 'Karagahagedara', NULL, NULL, NULL, '60106', 7.475787, 80.209967, 1, 1, 1, NULL, NULL),
(1105, 14, 'Karambe', NULL, NULL, NULL, '60602', 7.805937, 80.339167, 1, 1, 1, NULL, NULL),
(1106, 14, 'Katiyawa', NULL, NULL, NULL, '50261', 7.624637, 80.553944, 1, 1, 1, NULL, NULL),
(1107, 14, 'Katupota', 'කටුපොත', NULL, NULL, '60350', 7.5331, 80.1897, 1, 1, 1, NULL, NULL),
(1108, 14, 'Kawudulla', 'කවුඩුල්ල', NULL, NULL, '51414', 7.75, 80.3833, 1, 1, 1, NULL, NULL),
(1109, 14, 'Kawuduluwewa Stagell', NULL, NULL, NULL, '51514', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1110, 14, 'Kekunagolla', 'කැකුනගොල්ල', NULL, NULL, '60183', 7.49608, 80.170446, 1, 1, 1, NULL, NULL),
(1111, 14, 'Keppitiwalana', 'කැප්පෙටිවලාන', NULL, NULL, '60288', 7.323203, 80.190441, 1, 1, 1, NULL, NULL),
(1112, 14, 'Kimbulwanaoya', 'කිඹුල්වානඔය', NULL, NULL, '60548', 7.6709, 80.4751, 1, 1, 1, NULL, NULL),
(1113, 14, 'Kirimetiyawa', 'කිරිමැටියාව', NULL, NULL, '60184', 7.5247, 80.1408, 1, 1, 1, NULL, NULL),
(1114, 14, 'Kirindawa', 'කිරින්දෑව', NULL, NULL, '60212', 7.502078, 80.096123, 1, 1, 1, NULL, NULL),
(1115, 14, 'Kirindigalla', 'කිරිඳිගොල්ල', NULL, NULL, '60502', 7.554314, 80.475005, 1, 1, 1, NULL, NULL),
(1116, 14, 'Kithalawa', 'කිතලෑව', NULL, NULL, '60188', 7.4816, 80.1615, 1, 1, 1, NULL, NULL),
(1117, 14, 'Kitulwala', 'කිතුල්වල', NULL, NULL, '11242', 7.5, 80.5333, 1, 1, 1, NULL, NULL),
(1118, 14, 'Kobeigane', NULL, NULL, NULL, '60410', 7.656731, 80.120999, 1, 1, 1, NULL, NULL),
(1119, 14, 'Kohilagedara', 'කොහිලගෙදර', NULL, NULL, '60028', 7.4167, 80.3667, 1, 1, 1, NULL, NULL),
(1120, 14, 'Konwewa', 'කොන්වැව', NULL, NULL, '60630', 7.8, 80.0667, 1, 1, 1, NULL, NULL),
(1121, 14, 'Kosdeniya', 'කොස්දෙනිය', NULL, NULL, '60356', 7.574081, 80.138826, 1, 1, 1, NULL, NULL),
(1122, 14, 'Kosgolla', 'කොස්ගල', NULL, NULL, '60029', 7.4, 80.3833, 1, 1, 1, NULL, NULL),
(1123, 14, 'Kotagala', 'කොටගල', NULL, NULL, '22080', 7.45, 80.2333, 1, 1, 1, NULL, NULL),
(1124, 5, 'Colombo 13', 'කොළඹ 13', 'கொழும்பு 13', 'Kotahena', '01300', 6.942778, 79.858611, 1, 1, 1, NULL, NULL),
(1125, 14, 'Kotawehera', 'කොටවෙහෙර', NULL, NULL, '60483', 7.7911, 80.1023, 1, 1, 1, NULL, NULL),
(1126, 14, 'Kudagalgamuwa', NULL, NULL, NULL, '60003', 7.558498, 80.340333, 1, 1, 1, NULL, NULL),
(1127, 14, 'Kudakatnoruwa', NULL, NULL, NULL, '60754', 7.9833, 80.3833, 1, 1, 1, NULL, NULL),
(1128, 14, 'Kuliyapitiya', 'කුලියාපිටිය', NULL, NULL, '60200', 7.469551, 80.04873, 1, 1, 1, NULL, NULL),
(1129, 14, 'Kumaragama', NULL, NULL, NULL, '51412', 7.75, 80.3833, 1, 1, 1, NULL, NULL),
(1130, 14, 'Kumbukgeta', NULL, NULL, NULL, '60508', 7.675, 80.3667, 1, 1, 1, NULL, NULL),
(1131, 14, 'Kumbukwewa', 'කුඹුක්වැව', NULL, NULL, '60506', 7.797468, 80.217857, 1, 1, 1, NULL, NULL),
(1132, 14, 'Kuratihena', NULL, NULL, NULL, '60438', 7.6, 80.1333, 1, 1, 1, NULL, NULL),
(1133, 14, 'Kurunegala', 'කුරුණෑගල', NULL, NULL, '60000', 7.4867, 80.3647, 1, 1, 1, NULL, NULL),
(1134, 14, 'lbbagamuwa', 'ඉබ්බාගමුව', NULL, NULL, '60500', 7.675, 80.3667, 1, 1, 1, NULL, NULL),
(1135, 14, 'lhala Kadigamuwa', NULL, NULL, NULL, '60238', 7.5436, 79.9819, 1, 1, 1, NULL, NULL),
(1136, 14, 'Lihiriyagama', NULL, NULL, NULL, '61138', 7.3447, 79.9425, 1, 1, 1, NULL, NULL),
(1137, 14, 'lllagolla', NULL, NULL, NULL, '20724', 7.4333, 80.1333, 1, 1, 1, NULL, NULL),
(1138, 14, 'llukhena', 'ඉලුක්හේන', NULL, NULL, '60232', 7.5436, 79.9819, 1, 1, 1, NULL, NULL),
(1139, 14, 'Lonahettiya', NULL, NULL, NULL, '60108', 7.4589, 80.2107, 1, 1, 1, NULL, NULL),
(1140, 14, 'Madahapola', NULL, NULL, NULL, '60552', 7.711952, 80.499003, 1, 1, 1, NULL, NULL),
(1141, 14, 'Madakumburumulla', NULL, NULL, NULL, '60209', 7.44599, 79.994062, 1, 1, 1, NULL, NULL),
(1142, 14, 'Madalagama', NULL, NULL, NULL, '70158', 7.353398, 80.314033, 1, 1, 1, NULL, NULL),
(1143, 14, 'Madawala Ulpotha', NULL, NULL, NULL, '21074', 7.703, 80.5051, 1, 1, 1, NULL, NULL),
(1144, 14, 'Maduragoda', NULL, NULL, NULL, '60532', 7.5667, 80.5333, 1, 1, 1, NULL, NULL),
(1145, 14, 'Maeliya', NULL, NULL, NULL, '60512', 7.734847, 80.4079, 1, 1, 1, NULL, NULL),
(1146, 14, 'Magulagama', NULL, NULL, NULL, '60221', 7.542895, 80.090321, 1, 1, 1, NULL, NULL),
(1147, 14, 'Maha Ambagaswewa', NULL, NULL, NULL, '51518', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1148, 14, 'Mahagalkadawala', NULL, NULL, NULL, '60731', 8.062861, 80.28052, 1, 1, 1, NULL, NULL),
(1149, 14, 'Mahagirilla', NULL, NULL, NULL, '60479', 7.8333, 80.1333, 1, 1, 1, NULL, NULL),
(1150, 14, 'Mahamukalanyaya', NULL, NULL, NULL, '60516', 7.7417, 80.4318, 1, 1, 1, NULL, NULL),
(1151, 14, 'Mahananneriya', NULL, NULL, NULL, '60724', 8.013545, 80.183367, 1, 1, 1, NULL, NULL),
(1152, 14, 'Mahapallegama', NULL, NULL, NULL, '71063', 7.366, 80.0918, 1, 1, 1, NULL, NULL),
(1153, 14, 'Maharachchimulla', NULL, NULL, NULL, '60286', 7.335989, 80.212673, 1, 1, 1, NULL, NULL),
(1154, 14, 'Mahatalakolawewa', NULL, NULL, NULL, '51506', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1155, 14, 'Mahawewa', 'මහවැව', NULL, NULL, '61220', 7.5167, 79.9167, 1, 1, 1, NULL, NULL),
(1156, 14, 'Maho', 'මහව', NULL, NULL, '60600', 7.8228, 80.2778, 1, 1, 1, NULL, NULL),
(1157, 14, 'Makulewa', NULL, NULL, NULL, '60714', 7.998315, 80.345072, 1, 1, 1, NULL, NULL),
(1158, 14, 'Makulpotha', NULL, NULL, NULL, '60514', 7.751748, 80.43986, 1, 1, 1, NULL, NULL),
(1159, 14, 'Makulwewa', NULL, NULL, NULL, '60578', 7.6333, 80.05, 1, 1, 1, NULL, NULL),
(1160, 14, 'Malagane', NULL, NULL, NULL, '60404', 7.65, 80.2667, 1, 1, 1, NULL, NULL),
(1161, 14, 'Mandapola', NULL, NULL, NULL, '60434', 7.63521, 80.108641, 1, 1, 1, NULL, NULL),
(1162, 14, 'Maspotha', 'මාස්පොත', NULL, NULL, '60344', 7.8667, 80.2167, 1, 1, 1, NULL, NULL),
(1163, 14, 'Mawathagama', 'මාවතගම', NULL, NULL, '60060', 7.409691, 80.315775, 1, 1, 1, NULL, NULL),
(1164, 14, 'Medirigiriya', 'මැදිරිගිරිය', NULL, NULL, '51500', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1165, 14, 'Medivawa', NULL, NULL, NULL, '60612', 7.7678, 80.2858, 1, 1, 1, NULL, NULL),
(1166, 14, 'Meegalawa', 'මීගලෑව', NULL, NULL, '60750', 7.9833, 80.3833, 1, 1, 1, NULL, NULL),
(1167, 14, 'Meegaswewa', NULL, NULL, NULL, '51508', 7.8167, 80.1833, 1, 1, 1, NULL, NULL),
(1168, 14, 'Meewellawa', NULL, NULL, NULL, '60484', 7.85, 80.15, 1, 1, 1, NULL, NULL),
(1169, 14, 'Melsiripura', 'මැල්සිරිපුර', NULL, NULL, '60540', 7.65, 80.5, 1, 1, 1, NULL, NULL),
(1170, 14, 'Metikumbura', 'මැටිකුඹුර', NULL, NULL, '60304', 7.3615, 80.3177, 1, 1, 1, NULL, NULL),
(1171, 14, 'Metiyagane', NULL, NULL, NULL, '60121', 7.390854, 80.180612, 1, 1, 1, NULL, NULL),
(1172, 14, 'Minhettiya', NULL, NULL, NULL, '60004', 7.581261, 80.307757, 1, 1, 1, NULL, NULL),
(1173, 14, 'Minuwangete', NULL, NULL, NULL, '60406', 7.7167, 80.25, 1, 1, 1, NULL, NULL),
(1174, 14, 'Mirihanagama', NULL, NULL, NULL, '60408', 7.6542, 80.2583, 1, 1, 1, NULL, NULL),
(1175, 14, 'Monnekulama', NULL, NULL, NULL, '60495', 7.824042, 80.060587, 1, 1, 1, NULL, NULL),
(1176, 14, 'Moragane', NULL, NULL, NULL, '60354', 7.547791, 80.130329, 1, 1, 1, NULL, NULL),
(1177, 14, 'Moragollagama', NULL, NULL, NULL, '60640', 7.6333, 80.2167, 1, 1, 1, NULL, NULL),
(1178, 14, 'Morathiha', NULL, NULL, NULL, '60038', 7.510701, 80.488428, 1, 1, 1, NULL, NULL),
(1179, 14, 'Munamaldeniya', NULL, NULL, NULL, '60218', 7.55, 80.0667, 1, 1, 1, NULL, NULL),
(1180, 14, 'Muruthenge', NULL, NULL, NULL, '60122', 7.3942, 80.1861, 1, 1, 1, NULL, NULL),
(1181, 14, 'Mutugala', 'මුතුගල', NULL, NULL, '51064', 7.3667, 80.1667, 1, 1, 1, NULL, NULL),
(1182, 14, 'Nabadewa', NULL, NULL, NULL, '60482', 7.6833, 80.0667, 1, 1, 1, NULL, NULL),
(1183, 14, 'Nagollagama', 'නාගොල්ලාගම', NULL, NULL, '60590', 7.752013, 80.309254, 1, 1, 1, NULL, NULL),
(1184, 14, 'Nagollagoda', NULL, NULL, NULL, '60226', 7.563335, 80.037807, 1, 1, 1, NULL, NULL),
(1185, 14, 'Nakkawatta', NULL, NULL, NULL, '60186', 7.448259, 80.141879, 1, 1, 1, NULL, NULL),
(1186, 14, 'Narammala', 'නාරම්මල', NULL, NULL, '60100', 7.431387, 80.206159, 1, 1, 1, NULL, NULL),
(1187, 14, 'Nawasenapura', NULL, NULL, NULL, '51066', 7.3667, 80.1667, 1, 1, 1, NULL, NULL),
(1188, 14, 'Nawatalwatta', NULL, NULL, NULL, '60292', 7.4581, 80.0603, 1, 1, 1, NULL, NULL),
(1189, 14, 'Nelliya', NULL, NULL, NULL, '60549', 7.690523, 80.457947, 1, 1, 1, NULL, NULL),
(1190, 14, 'Nikaweratiya', 'නිකවැරටිය', NULL, NULL, '60470', 7.747585, 80.115201, 1, 1, 1, NULL, NULL),
(1191, 14, 'Nugagolla', 'නුගගොල්ල', NULL, NULL, '21534', 7.3667, 80.2, 1, 1, 1, NULL, NULL),
(1192, 14, 'Nugawela', 'නුගවෙල', NULL, NULL, '20072', 7.329999, 80.220383, 1, 1, 1, NULL, NULL),
(1193, 14, 'Padeniya', 'පාදෙණිය', NULL, NULL, '60461', 7.648348, 80.222132, 1, 1, 1, NULL, NULL),
(1194, 14, 'Padiwela', 'පඩිවෙල', NULL, NULL, '60236', 7.545547, 79.9905, 1, 1, 1, NULL, NULL),
(1195, 14, 'Pahalagiribawa', NULL, NULL, NULL, '60735', 8.0833, 80.2111, 1, 1, 1, NULL, NULL),
(1196, 14, 'Pahamune', 'පහමුනේ', NULL, NULL, '60112', 7.4833, 80.2, 1, 1, 1, NULL, NULL),
(1197, 14, 'Palagala', 'පලාගල', NULL, NULL, '50111', 7.4667, 80.1333, 1, 1, 1, NULL, NULL),
(1198, 14, 'Palapathwela', 'පලාපත්වල', NULL, NULL, '21070', 7.9, 80.2, 1, 1, 1, NULL, NULL),
(1199, 14, 'Palaviya', 'පලවිය', NULL, NULL, '61280', 7.5785, 79.9098, 1, 1, 1, NULL, NULL),
(1200, 14, 'Pallewela', 'පල්ලෙවෙල', NULL, NULL, '11150', 7.4667, 79.9833, 1, 1, 1, NULL, NULL),
(1201, 14, 'Palukadawala', NULL, NULL, NULL, '60704', 7.947895, 80.279058, 1, 1, 1, NULL, NULL),
(1202, 14, 'Panadaragama', NULL, NULL, NULL, '60348', 7.8667, 80.2167, 1, 1, 1, NULL, NULL),
(1203, 14, 'Panagamuwa', 'පනාගමුව', NULL, NULL, '60052', 7.55, 80.4667, 1, 1, 1, NULL, NULL),
(1204, 14, 'Panaliya', NULL, NULL, NULL, '60312', 7.328059, 80.331852, 1, 1, 1, NULL, NULL),
(1205, 14, 'Panapitiya', 'පනාපිටිය', NULL, NULL, '70152', 7.4167, 80.1833, 1, 1, 1, NULL, NULL),
(1206, 14, 'Panliyadda', NULL, NULL, NULL, '60558', 7.7061, 80.4964, 1, 1, 1, NULL, NULL),
(1207, 14, 'Pansiyagama', NULL, NULL, NULL, '60554', 7.7061, 80.4964, 1, 1, 1, NULL, NULL),
(1208, 14, 'Parape', NULL, NULL, NULL, '71105', 7.3667, 80.4167, 1, 1, 1, NULL, NULL),
(1209, 14, 'Pathanewatta', NULL, NULL, NULL, '90071', 7.4167, 80.0833, 1, 1, 1, NULL, NULL),
(1210, 14, 'Pattiya Watta', NULL, NULL, NULL, '20118', 7.3833, 80.3167, 1, 1, 1, NULL, NULL),
(1211, 14, 'Perakanatta', NULL, NULL, NULL, '21532', 7.3667, 80.2, 1, 1, 1, NULL, NULL),
(1212, 14, 'Periyakadneluwa', NULL, NULL, NULL, '60518', 7.7417, 80.4318, 1, 1, 1, NULL, NULL),
(1213, 14, 'Pihimbiya Ratmale', NULL, NULL, NULL, '60439', 7.6299, 80.0953, 1, 1, 1, NULL, NULL),
(1214, 14, 'Pihimbuwa', 'පිහිඹුව', NULL, NULL, '60053', 7.460742, 80.512294, 1, 1, 1, NULL, NULL),
(1215, 14, 'Pilessa', NULL, NULL, NULL, '60058', 7.45, 80.4167, 1, 1, 1, NULL, NULL),
(1216, 14, 'Polgahawela', NULL, NULL, NULL, '60300', 7.332765, 80.295285, 1, 1, 1, NULL, NULL),
(1217, 14, 'Polgolla', 'පොල්ගොල්ල', NULL, NULL, '20250', 7.4167, 80.5333, 1, 1, 1, NULL, NULL),
(1218, 14, 'Polpithigama', 'පොල්පිතිගම', NULL, NULL, '60620', 7.8142, 80.4042, 1, 1, 1, NULL, NULL),
(1219, 14, 'Pothuhera', 'පොතුහැර', NULL, NULL, '60330', 7.4181, 80.3317, 1, 1, 1, NULL, NULL),
(1220, 14, 'Pothupitiya', 'පොතුපිටිය', NULL, NULL, '70338', 7.35542, 80.17166, 1, 1, 1, NULL, NULL),
(1221, 14, 'Pujapitiya', 'පූජාපිටිය', NULL, NULL, '20112', 7.3833, 80.3167, 1, 1, 1, NULL, NULL),
(1222, 14, 'Rakwana', 'රක්වාන', NULL, NULL, '70300', 7.9, 80.4, 1, 1, 1, NULL, NULL),
(1223, 14, 'Ranorawa', NULL, NULL, NULL, '50212', 7.8, 80.0833, 1, 1, 1, NULL, NULL),
(1224, 14, 'Rathukohodigala', NULL, NULL, NULL, '20818', 7.5833, 79.9333, 1, 1, 1, NULL, NULL),
(1225, 14, 'Ridibendiella', NULL, NULL, NULL, '60606', 7.802, 80.287, 1, 1, 1, NULL, NULL),
(1226, 14, 'Ridigama', 'රිදීගම', NULL, NULL, '60040', 7.55, 80.4833, 1, 1, 1, NULL, NULL),
(1227, 14, 'Saliya Asokapura', 'සාලිය අසෝකපුර', NULL, NULL, '60736', 8.0833, 80.2111, 1, 1, 1, NULL, NULL),
(1228, 14, 'Sandalankawa', 'සඳලංකාව', NULL, NULL, '60176', 7.304619, 79.944358, 1, 1, 1, NULL, NULL),
(1229, 14, 'Sevanapitiya', 'සෙවණපිටිය', NULL, NULL, '51062', 7.3667, 80.1667, 1, 1, 1, NULL, NULL),
(1230, 14, 'Sirambiadiya', NULL, NULL, NULL, '61312', 8.1, 80.2667, 1, 1, 1, NULL, NULL),
(1231, 14, 'Sirisetagama', 'සිරිසෙතගම', NULL, NULL, '60478', 7.7772, 80.1506, 1, 1, 1, NULL, NULL),
(1232, 14, 'Siyambalangamuwa', NULL, NULL, NULL, '60646', 7.529179, 80.340311, 1, 1, 1, NULL, NULL),
(1233, 14, 'Siyambalawewa', 'සියඹලාවැව', NULL, NULL, '32048', 7.65, 79.9667, 1, 1, 1, NULL, NULL),
(1234, 14, 'Solepura', NULL, NULL, NULL, '60737', 8.153657, 80.153384, 1, 1, 1, NULL, NULL),
(1235, 14, 'Solewewa', NULL, NULL, NULL, '60738', 8.145855, 80.132596, 1, 1, 1, NULL, NULL),
(1236, 14, 'Sunandapura', 'සුනන්දපුර', NULL, NULL, '60436', 7.6299, 80.0953, 1, 1, 1, NULL, NULL),
(1237, 14, 'Talawattegedara', NULL, NULL, NULL, '60306', 7.3833, 80.3, 1, 1, 1, NULL, NULL),
(1238, 14, 'Tambutta', NULL, NULL, NULL, '60734', 8.0833, 80.2167, 1, 1, 1, NULL, NULL),
(1239, 14, 'Tennepanguwa', NULL, NULL, NULL, '90072', 7.4167, 80.0833, 1, 1, 1, NULL, NULL),
(1240, 14, 'Thalahitimulla', NULL, NULL, NULL, '60208', 7.432473, 80.001954, 1, 1, 1, NULL, NULL),
(1241, 14, 'Thalakolawewa', NULL, NULL, NULL, '60624', 7.796943, 80.433851, 1, 1, 1, NULL, NULL),
(1242, 14, 'Thalwita', NULL, NULL, NULL, '60572', 7.5943, 80.2108, 1, 1, 1, NULL, NULL),
(1243, 14, 'Tharana Udawela', NULL, NULL, NULL, '60227', 7.5333, 80.0667, 1, 1, 1, NULL, NULL),
(1244, 14, 'Thimbiriyawa', NULL, NULL, NULL, '60476', 7.750904, 80.140975, 1, 1, 1, NULL, NULL),
(1245, 14, 'Tisogama', NULL, NULL, NULL, '60453', 7.6065, 79.9406, 1, 1, 1, NULL, NULL),
(1246, 14, 'Thorayaya', 'තෝරයාය', NULL, NULL, '60499', 7.5167, 80.4, 1, 1, 1, NULL, NULL),
(1247, 14, 'Tulhiriya', 'තුල්හිරිය', NULL, NULL, '71610', 7.2833, 80.2167, 1, 1, 1, NULL, NULL),
(1248, 14, 'Tuntota', NULL, NULL, NULL, '71062', 7.5, 79.9167, 1, 1, 1, NULL, NULL),
(1249, 14, 'Tuttiripitigama', NULL, NULL, NULL, '60426', 7.6, 80.1333, 1, 1, 1, NULL, NULL),
(1250, 14, 'Udagaldeniya', NULL, NULL, NULL, '71113', 7.3583, 80.35, 1, 1, 1, NULL, NULL),
(1251, 14, 'Udahingulwala', NULL, NULL, NULL, '20094', 7.3, 80.15, 1, 1, 1, NULL, NULL),
(1252, 14, 'Udawatta', 'උඩවත්ත', NULL, NULL, '20722', 7.4333, 80.1333, 1, 1, 1, NULL, NULL),
(1253, 14, 'Udubaddawa', NULL, NULL, NULL, '60250', 7.4828, 79.9753, 1, 1, 1, NULL, NULL),
(1254, 14, 'Udumulla', 'උඩුමුල්ල', NULL, NULL, '71521', 7.45, 80.4, 1, 1, 1, NULL, NULL),
(1255, 14, 'Uhumiya', NULL, NULL, NULL, '60094', 7.4667, 80.2833, 1, 1, 1, NULL, NULL),
(1256, 14, 'Ulpotha Pallekele', NULL, NULL, NULL, '60622', 7.8071, 80.4188, 1, 1, 1, NULL, NULL),
(1257, 14, 'Ulpothagama', NULL, NULL, NULL, '20965', 7.7167, 80.3167, 1, 1, 1, NULL, NULL),
(1258, 14, 'Usgala Siyabmalangamuwa', NULL, NULL, NULL, '60732', 8.0833, 80.2111, 1, 1, 1, NULL, NULL),
(1259, 14, 'Vijithapura', 'විජිතපුර', NULL, NULL, '50110', 7.4667, 80.1333, 1, 1, 1, NULL, NULL),
(1260, 14, 'Wadakada', 'වදාකඩ', NULL, NULL, '60318', 7.39697, 80.267596, 1, 1, 1, NULL, NULL),
(1261, 14, 'Wadumunnegedara', NULL, NULL, NULL, '60204', 7.4167, 79.9667, 1, 1, 1, NULL, NULL),
(1262, 14, 'Walakumburumulla', NULL, NULL, NULL, '60198', 7.4167, 80.0167, 1, 1, 1, NULL, NULL),
(1263, 14, 'Wannigama', 'වන්නිගම', NULL, NULL, '60465', 7.6569, 80.2203, 1, 1, 1, NULL, NULL),
(1264, 14, 'Wannikudawewa', NULL, NULL, NULL, '60721', 7.9977, 80.2964, 1, 1, 1, NULL, NULL),
(1265, 14, 'Wannilhalagama', NULL, NULL, NULL, '60722', 7.9977, 80.2964, 1, 1, 1, NULL, NULL),
(1266, 14, 'Wannirasnayakapura', NULL, NULL, NULL, '60490', 7.6889, 80.1556, 1, 1, 1, NULL, NULL),
(1267, 14, 'Warawewa', 'වරාවැව', NULL, NULL, '60739', 8.121572, 80.14855, 1, 1, 1, NULL, NULL),
(1268, 14, 'Wariyapola', 'වාරියපොළ', NULL, NULL, '60400', 7.628694, 80.235989, 1, 1, 1, NULL, NULL),
(1269, 14, 'Watareka', 'වටරැක', NULL, NULL, '10511', 7.397142, 80.432878, 1, 1, 1, NULL, NULL),
(1270, 14, 'Wattegama', 'වත්තේගම', NULL, NULL, '20810', 7.5833, 79.9333, 1, 1, 1, NULL, NULL),
(1271, 14, 'Watuwatta', NULL, NULL, NULL, '60262', 7.5167, 79.9167, 1, 1, 1, NULL, NULL),
(1272, 14, 'Weerapokuna', 'වීරපොකුණ', NULL, NULL, '60454', 7.649426, 79.981893, 1, 1, 1, NULL, NULL),
(1273, 14, 'Welawa Juncton', NULL, NULL, NULL, '60464', 7.6569, 80.2203, 1, 1, 1, NULL, NULL),
(1274, 14, 'Welipennagahamulla', NULL, NULL, NULL, '60240', 7.4581, 80.0603, 1, 1, 1, NULL, NULL),
(1275, 14, 'Wellagala', NULL, NULL, NULL, '60402', 7.6167, 80.2833, 1, 1, 1, NULL, NULL),
(1276, 14, 'Wellarawa', NULL, NULL, NULL, '60456', 7.5729, 79.913974, 1, 1, 1, NULL, NULL),
(1277, 14, 'Wellawa', NULL, NULL, NULL, '60570', 7.566524, 80.369189, 1, 1, 1, NULL, NULL),
(1278, 14, 'Welpalla', NULL, NULL, NULL, '60206', 7.4333, 80.05, 1, 1, 1, NULL, NULL),
(1279, 14, 'Wennoruwa', NULL, NULL, NULL, '60284', 7.369467, 80.219573, 1, 1, 1, NULL, NULL),
(1280, 14, 'Weuda', NULL, NULL, NULL, '60080', 7.4, 80.1667, 1, 1, 1, NULL, NULL),
(1281, 14, 'Wewagama', 'වැවගම', NULL, NULL, '60195', 7.42031, 80.099835, 1, 1, 1, NULL, NULL),
(1282, 14, 'Wilgamuwa', NULL, NULL, NULL, '21530', 7.3667, 80.2, 1, 1, 1, NULL, NULL),
(1283, 14, 'Yakwila', 'යක්විල', NULL, NULL, '60202', 7.3833, 80.0333, 1, 1, 1, NULL, NULL),
(1284, 14, 'Yatigaloluwa', NULL, NULL, NULL, '60314', 7.328729, 80.264509, 1, 1, 1, NULL, NULL),
(1285, 15, 'Mannar', 'මන්නාරම', NULL, NULL, '41000', 8.9833, 79.9, 1, 1, 1, NULL, NULL),
(1286, 15, 'Puthukudiyiruppu', NULL, NULL, NULL, '30158', 9.046951, 79.853286, 1, 1, 1, NULL, NULL),
(1287, 16, 'Akuramboda', 'අකුරම්බොඩ', NULL, NULL, '21142', 7.646383, 80.600048, 1, 1, 1, NULL, NULL),
(1288, 16, 'Alawatuwala', 'අලවතුවල', NULL, NULL, '60047', 7.55, 80.5583, 1, 1, 1, NULL, NULL),
(1289, 16, 'Alwatta', 'අල්වත්ත', NULL, NULL, '21004', 7.449444, 80.663358, 1, 1, 1, NULL, NULL),
(1290, 16, 'Ambana', 'අම්බාන', NULL, NULL, '21504', 7.651007, 80.693816, 1, 1, 1, NULL, NULL),
(1291, 16, 'Aralaganwila', 'අරලගන්විල', NULL, NULL, '51100', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1292, 16, 'Ataragallewa', 'අටරගල්ලෑව', NULL, NULL, '21512', 7.5333, 80.6067, 1, 1, 1, NULL, NULL),
(1293, 16, 'Bambaragaswewa', 'බඹරගස්වැව', NULL, NULL, '21212', 7.784315, 80.540511, 1, 1, 1, NULL, NULL),
(1294, 16, 'Barawardhana Oya', 'බරවර්ධන ඔය', NULL, NULL, '20967', 7.5667, 80.625, 1, 1, 1, NULL, NULL),
(1295, 16, 'Beligamuwa', 'බෙලිගමුව', NULL, NULL, '21214', 7.725882, 80.552789, 1, 1, 1, NULL, NULL),
(1296, 16, 'Damana', 'දමන', NULL, NULL, '32014', 7.8417, 80.5797, 1, 1, 1, NULL, NULL),
(1297, 16, 'Dambulla', 'දඹුල්ල', NULL, NULL, '21100', 7.868039, 80.646464, 1, 1, 1, NULL, NULL),
(1298, 16, 'Damminna', 'දම්මින්න', NULL, NULL, '51106', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1299, 16, 'Dankanda', 'දංකන්ද', NULL, NULL, '21032', 7.519616, 80.694168, 1, 1, 1, NULL, NULL),
(1300, 16, 'Delwite', 'දෙල්විටේ', NULL, NULL, '60044', 7.55, 80.5583, 1, 1, 1, NULL, NULL),
(1301, 16, 'Devagiriya', 'දේවගිරිය', NULL, NULL, '21552', 7.5833, 80.9667, 1, 1, 1, NULL, NULL),
(1302, 16, 'Dewahuwa', 'දේවහුව', NULL, NULL, '21206', 7.7589, 80.5683, 1, 1, 1, NULL, NULL),
(1303, 16, 'Divuldamana', 'දිවුල්දමන', NULL, NULL, '51104', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1304, 16, 'Dullewa', 'දුල්වල', NULL, NULL, '21054', 7.511012, 80.59862, 1, 1, 1, NULL, NULL),
(1305, 16, 'Dunkolawatta', 'දුන්කොලවත්ත', NULL, NULL, '21046', 7.4917, 80.625, 1, 1, 1, NULL, NULL),
(1306, 16, 'Elkaduwa', 'ඇල්කඩුව', NULL, NULL, '21012', 7.410706, 80.693258, 1, 1, 1, NULL, NULL),
(1307, 16, 'Erawula Junction', 'එරවුල හන්දිය', NULL, NULL, '21108', 7.8633, 80.6842, 1, 1, 1, NULL, NULL),
(1308, 16, 'Etanawala', 'එතනවල', NULL, NULL, '21402', 7.5217, 80.6847, 1, 1, 1, NULL, NULL),
(1309, 16, 'Galewela', 'ගලේවෙල', NULL, NULL, '21200', 7.759807, 80.56744, 1, 1, 1, NULL, NULL),
(1310, 16, 'Galoya Junction', 'ගල්ඔය හන්දිය', NULL, NULL, '51375', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1311, 16, 'Gammaduwa', 'ගම්මඩුව', NULL, NULL, '21068', 7.581654, 80.698521, 1, 1, 1, NULL, NULL),
(1312, 16, 'Gangala Puwakpitiya', 'ගන්ගල පුවක්පිටිය', NULL, NULL, '21404', 7.5217, 80.6847, 1, 1, 1, NULL, NULL),
(1313, 16, 'Hasalaka', 'හසලක', NULL, NULL, '20960', 7.5667, 80.625, 1, 1, 1, NULL, NULL),
(1314, 16, 'Hattota Amuna', 'හත්තොට අමුණ', NULL, NULL, '21514', 7.5333, 80.6067, 1, 1, 1, NULL, NULL),
(1315, 16, 'Imbulgolla', 'ඉඹුල්ගොල්ල', NULL, NULL, '21064', 7.575027, 80.663159, 1, 1, 1, NULL, NULL),
(1316, 16, 'Inamaluwa', 'ඉනාමලුව', NULL, NULL, '21124', 7.951344, 80.690187, 1, 1, 1, NULL, NULL),
(1317, 16, 'Iriyagolla', 'ඊරියගොල්ල', NULL, NULL, '60045', 7.55, 80.6333, 1, 1, 1, NULL, NULL),
(1318, 16, 'Kaikawala', 'කයිකාවල', NULL, NULL, '21066', 7.507177, 80.659444, 1, 1, 1, NULL, NULL),
(1319, 16, 'Kalundawa', 'කලන්දූව', NULL, NULL, '21112', 7.8, 80.7167, 1, 1, 1, NULL, NULL),
(1320, 16, 'Kandalama', 'කන්ඩලම', NULL, NULL, '21106', 7.887403, 80.703507, 1, 1, 1, NULL, NULL),
(1321, 16, 'Kavudupelella', 'කවුඩුපැලැල්ල', NULL, NULL, '21072', 7.5914, 80.6258, 1, 1, 1, NULL, NULL),
(1322, 16, 'Kibissa', 'කිඹිස්ස', NULL, NULL, '21122', 7.9397, 80.7278, 1, 1, 1, NULL, NULL),
(1323, 16, 'Kiwula', 'කිවුල', NULL, NULL, '21042', 7.4917, 80.625, 1, 1, 1, NULL, NULL),
(1324, 16, 'Kongahawela', 'කෝන්ගහවෙල', NULL, NULL, '21500', 7.679932, 80.706607, 1, 1, 1, NULL, NULL),
(1325, 16, 'Laggala Pallegama', 'ලග්ගල පල්ලේගම', NULL, NULL, '21520', 7.5333, 80.6067, 1, 1, 1, NULL, NULL),
(1326, 16, 'Leliambe', 'ලෑලිඅඹේ', NULL, NULL, '21008', 7.4346, 80.6519, 1, 1, 1, NULL, NULL),
(1327, 16, 'Lenadora', 'ලෙනදොර', NULL, NULL, '21094', 7.753507, 80.660161, 1, 1, 1, NULL, NULL),
(1328, 16, 'lhala Halmillewa', 'ඉහළ හල්මිල්ලෑව', NULL, NULL, '50262', 7.8667, 80.6417, 1, 1, 1, NULL, NULL),
(1329, 16, 'lllukkumbura', 'ඉලුක්කුඹුර', NULL, NULL, '21406', 7.5217, 80.6847, 1, 1, 1, NULL, NULL),
(1330, 16, 'Madipola', 'මාදිපොල', NULL, NULL, '51108', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1331, 16, 'Mahawela', 'මහවෙල', NULL, NULL, '21140', 7.581804, 80.607485, 1, 1, 1, NULL, NULL),
(1332, 16, 'Mananwatta', 'මානවත්ත', NULL, NULL, '21144', 7.685106, 80.601107, 1, 1, 1, NULL, NULL),
(1333, 16, 'Maraka', 'මාරක', NULL, NULL, '21554', 7.586801, 80.962009, 1, 1, 1, NULL, NULL),
(1334, 16, 'Matale', 'මාතලේ', NULL, NULL, '21000', 7.4717, 80.6244, 1, 1, 1, NULL, NULL),
(1335, 16, 'Melipitiya', 'මේලිපිටිය', NULL, NULL, '21055', 7.5458, 80.5833, 1, 1, 1, NULL, NULL),
(1336, 16, 'Metihakka', 'මැටිහක්ක', NULL, NULL, '21062', 7.536495, 80.654081, 1, 1, 1, NULL, NULL),
(1337, 16, 'Millawana', 'මිල්ලවාන', NULL, NULL, '21154', 7.6503, 80.5772, 1, 1, 1, NULL, NULL),
(1338, 16, 'Muwandeniya', 'මුවන්දෙණිය', NULL, NULL, '21044', 7.461452, 80.660098, 1, 1, 1, NULL, NULL),
(1339, 16, 'Nalanda', 'නාලන්ද', NULL, NULL, '21082', 7.662487, 80.635004, 1, 1, 1, NULL, NULL),
(1340, 16, 'Naula', 'නාඋල', NULL, NULL, '21090', 7.708132, 80.652321, 1, 1, 1, NULL, NULL),
(1341, 16, 'Opalgala', 'ඕපල්ගල', NULL, NULL, '21076', 7.619927, 80.698338, 1, 1, 1, NULL, NULL),
(1342, 16, 'Pallepola', 'පල්ලේපො', NULL, NULL, '21152', 7.620686, 80.600466, 1, 1, 1, NULL, NULL),
(1343, 16, 'Pimburattewa', NULL, NULL, NULL, '51102', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1344, 16, 'Pulastigama', 'පුලතිසිගම', NULL, NULL, '51050', 7.67, 80.565, 1, 1, 1, NULL, NULL),
(1345, 16, 'Ranamuregama', NULL, NULL, NULL, '21524', 7.5333, 80.6067, 1, 1, 1, NULL, NULL),
(1346, 16, 'Rattota', 'රත්තොට', NULL, NULL, '21400', 7.5217, 80.6847, 1, 1, 1, NULL, NULL),
(1347, 16, 'Selagama', 'සැලගම', NULL, NULL, '21058', 7.594457, 80.58381, 1, 1, 1, NULL, NULL),
(1348, 16, 'Sigiriya', 'සීගිරිය', NULL, NULL, '21120', 7.954968, 80.755205, 1, 1, 1, NULL, NULL),
(1349, 16, 'Sinhagama', 'සිංහගම', NULL, NULL, '51378', 7.696, 80.5842, 1, 1, 1, NULL, NULL),
(1350, 16, 'Sungavila', 'සුංගාවිග', NULL, NULL, '51052', 7.67, 80.565, 1, 1, 1, NULL, NULL),
(1351, 16, 'Talagoda Junction', NULL, NULL, NULL, '21506', 7.5722, 80.6222, 1, 1, 1, NULL, NULL),
(1352, 16, 'Talakiriyagama', 'තලකිරියාගම', NULL, NULL, '21116', 7.8206, 80.6172, 1, 1, 1, NULL, NULL),
(1353, 16, 'Tamankaduwa', 'තමන්කඩුව', NULL, NULL, '51089', 7.67, 80.565, 1, 1, 1, NULL, NULL),
(1354, 16, 'Udasgiriya', 'උඩස්ගිරිය', NULL, NULL, '21051', 7.535254, 80.570342, 1, 1, 1, NULL, NULL),
(1355, 16, 'Udatenna', 'උඩතැන්න', NULL, NULL, '21006', 7.4167, 80.65, 1, 1, 1, NULL, NULL),
(1356, 16, 'Ukuwela', 'උකුවෙල', NULL, NULL, '21300', 7.423917, 80.62996, 1, 1, 1, NULL, NULL),
(1357, 16, 'Wahacotte', 'වහකෝට්ටේ', NULL, NULL, '21160', 7.7142, 80.5972, 1, 1, 1, NULL, NULL),
(1358, 16, 'Walawela', 'වලවෙල', NULL, NULL, '21048', 7.520365, 80.597403, 1, 1, 1, NULL, NULL),
(1359, 16, 'Wehigala', 'වැහිගල', NULL, NULL, '21009', 7.409019, 80.669112, 1, 1, 1, NULL, NULL),
(1360, 16, 'Welangahawatte', 'වෙලංගහවත්ත', NULL, NULL, '21408', 7.5217, 80.6847, 1, 1, 1, NULL, NULL),
(1361, 16, 'Wewalawewa', 'වේවැලවැව', NULL, NULL, '21114', 7.8103, 80.6669, 1, 1, 1, NULL, NULL),
(1362, 16, 'Yatawatta', 'යටවත්ත', NULL, NULL, '21056', 7.562698, 80.578361, 1, 1, 1, NULL, NULL),
(1363, 17, 'Akuressa', 'අකුරැස්ස', NULL, NULL, '81400', 6.0964, 80.4808, 1, 1, 1, NULL, NULL),
(1364, 17, 'Alapaladeniya', 'අලපලදෙණිය', NULL, NULL, '81475', 6.2833, 80.45, 1, 1, 1, NULL, NULL),
(1365, 17, 'Aparekka', 'අපරැක්ක', NULL, NULL, '81032', 6.008083, 80.621556, 1, 1, 1, NULL, NULL),
(1366, 17, 'Athuraliya', 'අතුරලීය', NULL, NULL, '81402', 6.069724, 80.497879, 1, 1, 1, NULL, NULL),
(1367, 17, 'Bengamuwa', 'බෙන්ගමුව', NULL, NULL, '81614', 6.253417, 80.59808, 1, 1, 1, NULL, NULL),
(1368, 17, 'Bopagoda', 'බෝපගොඩ', NULL, NULL, '81412', 6.1561, 80.4903, 1, 1, 1, NULL, NULL),
(1369, 17, 'Dampahala', 'දම්පහල', NULL, NULL, '81612', 6.259631, 80.633081, 1, 1, 1, NULL, NULL),
(1370, 17, 'Deegala Lenama', 'දීගල ලෙනම', NULL, NULL, '81452', 6.2333, 80.45, 1, 1, 1, NULL, NULL),
(1371, 17, 'Deiyandara', 'දෙයියන්දර', NULL, NULL, '81320', 6.152388, 80.604696, 1, 1, 1, NULL, NULL),
(1372, 17, 'Denagama', 'දෙනගම', NULL, NULL, '81314', 6.11481, 80.642749, 1, 1, 1, NULL, NULL),
(1373, 17, 'Denipitiya', 'දෙණිපිටිය', NULL, NULL, '81730', 5.9667, 80.45, 1, 1, 1, NULL, NULL),
(1374, 17, 'Deniyaya', 'දෙණියාය', NULL, NULL, '81500', 6.339732, 80.548055, 1, 1, 1, NULL, NULL),
(1375, 17, 'Derangala', 'දෙරණගල', NULL, NULL, '81454', 6.229572, 80.445492, 1, 1, 1, NULL, NULL),
(1376, 17, 'Devinuwara (Dondra)', 'දෙවිනුවර (දෙවුන්දර)', NULL, NULL, '81160', 5.9319, 80.6069, 1, 1, 1, NULL, NULL),
(1377, 17, 'Dikwella', 'දික්වැල්ල', NULL, NULL, '81200', 5.9667, 80.6833, 1, 1, 1, NULL, NULL),
(1378, 17, 'Diyagaha', 'දියගහ', NULL, NULL, '81038', 5.9833, 80.5667, 1, 1, 1, NULL, NULL),
(1379, 17, 'Diyalape', 'දියලපේ', NULL, NULL, '81422', 6.121802, 80.447911, 1, 1, 1, NULL, NULL),
(1380, 17, 'Gandara', 'ගන්දර', NULL, NULL, '81170', 5.933629, 80.61575, 1, 1, 1, NULL, NULL),
(1381, 17, 'Godapitiya', 'ගොඩපිටිය', NULL, NULL, '81408', 6.121801, 80.480996, 1, 1, 1, NULL, NULL),
(1382, 17, 'Gomilamawarala', 'ගොමිලමවරල', NULL, NULL, '81072', 6.1833, 80.5667, 1, 1, 1, NULL, NULL),
(1383, 17, 'Hawpe', 'හව්පෙ', NULL, NULL, '80132', 6.129973, 80.489743, 1, 1, 1, NULL, NULL),
(1384, 17, 'Horapawita', 'හොරපාවිට', NULL, NULL, '81108', 6.1167, 80.5833, 1, 1, 1, NULL, NULL),
(1385, 17, 'Kalubowitiyana', 'කළුබෝවිටියාන', NULL, NULL, '81478', 6.3167, 80.4, 1, 1, 1, NULL, NULL),
(1386, 17, 'Kamburugamuwa', 'කඹුරුගමුව', NULL, NULL, '81750', 5.940612, 80.496449, 1, 1, 1, NULL, NULL),
(1387, 17, 'Kamburupitiya', 'කඹුරුපිටිය', NULL, NULL, '81100', 6.069847, 80.56473, 1, 1, 1, NULL, NULL),
(1388, 17, 'Karagoda Uyangoda', 'කරන්ගොඩ උයන්ගොඩ', NULL, NULL, '81082', 6.0715, 80.5193, 1, 1, 1, NULL, NULL),
(1389, 17, 'Karaputugala', 'කරපුටුල', NULL, NULL, '81106', 6.07377, 80.603484, 1, 1, 1, NULL, NULL),
(1390, 17, 'Karatota', 'කරාතොට', NULL, NULL, '81318', 6.0667, 80.6667, 1, 1, 1, NULL, NULL),
(1391, 17, 'Kekanadura', 'කෙකනදුර', NULL, NULL, '81020', 6.0715, 80.5193, 1, 1, 1, NULL, NULL),
(1392, 17, 'Kiriweldola', 'කිරිවැල්ගොඩ', NULL, NULL, '81514', 6.372272, 80.533507, 1, 1, 1, NULL, NULL),
(1393, 17, 'Kiriwelkele', 'කිරිවැල්කැලේ', NULL, NULL, '81456', 6.249957, 80.451047, 1, 1, 1, NULL, NULL),
(1394, 17, 'Kolawenigama', 'කොලවෙනිගම', NULL, NULL, '81522', 6.321671, 80.500227, 1, 1, 1, NULL, NULL),
(1395, 17, 'Kotapola', 'කොටපොල', NULL, NULL, '81480', 6.292393, 80.533957, 1, 1, 1, NULL, NULL),
(1396, 17, 'Lankagama', 'ලංකාගම', NULL, NULL, '81526', 6.35, 80.4667, 1, 1, 1, NULL, NULL),
(1397, 17, 'Makandura', 'මාකඳුර', NULL, NULL, '81070', 6.137036, 80.571982, 1, 1, 1, NULL, NULL),
(1398, 17, 'Maliduwa', 'මැලිදූව', NULL, NULL, '81424', 6.1333, 80.4167, 1, 1, 1, NULL, NULL),
(1399, 17, 'Maramba', 'මාරඹ', NULL, NULL, '81416', 6.1614, 80.5035, 1, 1, 1, NULL, NULL),
(1400, 17, 'Matara', 'මාතර', NULL, NULL, '81000', 5.9486, 80.5428, 1, 1, 1, NULL, NULL),
(1401, 17, 'Mediripitiya', 'මැදිරිපිටිය', NULL, NULL, '81524', 6.35, 80.4667, 1, 1, 1, NULL, NULL),
(1402, 17, 'Miella', 'මීඇල්ල', NULL, NULL, '81312', 6.1167, 80.6833, 1, 1, 1, NULL, NULL),
(1403, 17, 'Mirissa', 'මිරිස්ස', NULL, NULL, '81740', 5.94679, 80.452288, 1, 1, 1, NULL, NULL),
(1404, 17, 'Morawaka', 'මොරවක', NULL, NULL, '81470', 6.25, 80.4833, 1, 1, 1, NULL, NULL),
(1405, 17, 'Mulatiyana Junction', 'මුලටියාන හන්දිය', NULL, NULL, '81071', 6.1833, 80.5667, 1, 1, 1, NULL, NULL),
(1406, 17, 'Nadugala', 'නඩුගල', NULL, NULL, '81092', 5.975464, 80.548935, 1, 1, 1, NULL, NULL),
(1407, 17, 'Naimana', 'නයිමන', NULL, NULL, '81017', 6.0715, 80.5193, 1, 1, 1, NULL, NULL),
(1408, 17, 'Palatuwa', 'පලාතුව', NULL, NULL, '81050', 5.984516, 80.518656, 1, 1, 1, NULL, NULL),
(1409, 17, 'Parapamulla', 'පරපමුල්ල', NULL, NULL, '81322', 6.150219, 80.61675, 1, 1, 1, NULL, NULL),
(1410, 17, 'Pasgoda', 'පස්ගොඩ', NULL, NULL, '81615', 6.242998, 80.616175, 1, 1, 1, NULL, NULL),
(1411, 17, 'Penetiyana', 'පෙනතියන', NULL, NULL, '81722', 6.034813, 80.450626, 1, 1, 1, NULL, NULL),
(1412, 17, 'Pitabeddara', 'පිටබැද්දර', NULL, NULL, '81450', 6.2167, 80.45, 1, 1, 1, NULL, NULL),
(1413, 17, 'Puhulwella', 'පුහුවැල්ල', NULL, NULL, '81290', 6.045752, 80.619203, 1, 1, 1, NULL, NULL),
(1414, 17, 'Radawela', 'රඳාවෙල', NULL, NULL, '81316', 6.124672, 80.60726, 1, 1, 1, NULL, NULL),
(1415, 17, 'Ransegoda', 'රන්සෑගොඩ', NULL, NULL, '81064', 6.0715, 80.5193, 1, 1, 1, NULL, NULL),
(1416, 17, 'Rotumba', 'රොටුඹ', NULL, NULL, '81074', 6.229142, 80.571151, 1, 1, 1, NULL, NULL),
(1417, 17, 'Sultanagoda', 'සුල්තානාගොඩ', NULL, NULL, '81051', 5.9667, 80.5, 1, 1, 1, NULL, NULL),
(1418, 17, 'Telijjawila', 'තෙලිජ්ජවෙල', NULL, NULL, '81060', 6.0715, 80.5193, 1, 1, 1, NULL, NULL),
(1419, 17, 'Thihagoda', 'තිහාගොඩ', NULL, NULL, '81280', 6.011602, 80.561851, 1, 1, 1, NULL, NULL),
(1420, 17, 'Urubokka', 'ඌරුබොක්ක', NULL, NULL, '81600', 6.302863, 80.631175, 1, 1, 1, NULL, NULL),
(1421, 17, 'Urugamuwa', 'ඌරුගමුව', NULL, NULL, '81230', 6.0116, 80.6437, 1, 1, 1, NULL, NULL),
(1422, 17, 'Urumutta', 'උරුමුත්ත', NULL, NULL, '81414', 6.150181, 80.519582, 1, 1, 1, NULL, NULL),
(1423, 17, 'Viharahena', 'විහාරහේන', NULL, NULL, '81508', 6.379073, 80.598006, 1, 1, 1, NULL, NULL),
(1424, 17, 'Walakanda', 'වලකන්ද', NULL, NULL, '81294', 6.01655, 80.649889, 1, 1, 1, NULL, NULL),
(1425, 17, 'Walasgala', 'වලස්ගල', NULL, NULL, '81220', 5.981913, 80.693678, 1, 1, 1, NULL, NULL),
(1426, 17, 'Waralla', 'වැරැල්ල', NULL, NULL, '81479', 6.277439, 80.522519, 1, 1, 1, NULL, NULL),
(1427, 17, 'Weligama', 'වැලිගම', NULL, NULL, '81700', 5.9667, 80.4167, 1, 1, 1, NULL, NULL),
(1428, 17, 'Wilpita', 'විල්පිට', NULL, NULL, '81404', 6.1, 80.5167, 1, 1, 1, NULL, NULL),
(1429, 17, 'Yatiyana', 'යටියාන', NULL, NULL, '81034', 6.028888, 80.603158, 1, 1, 1, NULL, NULL),
(1430, 18, 'Ayiwela', 'අයිවෙල', NULL, NULL, '91516', 7.1, 81.2333, 1, 1, 1, NULL, NULL),
(1431, 18, 'Badalkumbura', 'බඩල්කුඹුර', NULL, NULL, '91070', 6.893287, 81.234346, 1, 1, 1, NULL, NULL),
(1432, 18, 'Baduluwela', 'බදුලුවෙල', NULL, NULL, '91058', 7.11307, 81.435299, 1, 1, 1, NULL, NULL),
(1433, 18, 'Bakinigahawela', 'බකිණිගහවෙල', NULL, NULL, '91554', 6.9333, 81.2833, 1, 1, 1, NULL, NULL),
(1434, 18, 'Balaharuwa', 'බලහරුව', NULL, NULL, '91295', 6.520177, 81.058519, 1, 1, 1, NULL, NULL),
(1435, 18, 'Bibile', 'බිබිලේ', NULL, NULL, '91500', 7.1667, 81.2167, 1, 1, 1, NULL, NULL),
(1436, 18, 'Buddama', 'බුද්ධගම', NULL, NULL, '91038', 7.046413, 81.486844, 1, 1, 1, NULL, NULL),
(1437, 18, 'Buttala', 'බුත්තල', NULL, NULL, '91100', 6.75, 81.2333, 1, 1, 1, NULL, NULL),
(1438, 18, 'Dambagalla', 'දඹගල්ල', NULL, NULL, '91050', 6.955743, 81.375946, 1, 1, 1, NULL, NULL),
(1439, 18, 'Diyakobala', 'දියකොබල', NULL, NULL, '91514', 7.1056, 81.2222, 1, 1, 1, NULL, NULL),
(1440, 18, 'Dombagahawela', 'දොඹගහවෙල', NULL, NULL, '91010', 6.898197, 81.441375, 1, 1, 1, NULL, NULL),
(1441, 18, 'Ethimalewewa', 'ඇතිමලේවැව', NULL, NULL, '91020', 6.9216, 81.3833, 1, 1, 1, NULL, NULL),
(1442, 18, 'Ettiliwewa', 'ඇත්තිලිවැව', NULL, NULL, '91250', 6.73, 81.12, 1, 1, 1, NULL, NULL),
(1443, 18, 'Galabedda', 'ගලබැද්ද', NULL, NULL, '91008', 6.9167, 81.3833, 1, 1, 1, NULL, NULL),
(1444, 18, 'Gamewela', 'ගමේවැල', NULL, NULL, '90512', 6.9167, 81.2, 1, 1, 1, NULL, NULL),
(1445, 18, 'Hambegamuwa', 'හම්බෙගමුව', NULL, NULL, '91308', 6.503718, 80.874695, 1, 1, 1, NULL, NULL),
(1446, 18, 'Hingurukaduwa', 'හිඟුරකඩුව', NULL, NULL, '90508', 6.817257, 81.153429, 1, 1, 1, NULL, NULL),
(1447, 18, 'Hulandawa', 'හුලන්දාව', NULL, NULL, '91004', 6.868479, 81.333215, 1, 1, 1, NULL, NULL),
(1448, 18, 'Inginiyagala', 'ඉඟිනියාගල', NULL, NULL, '91040', 7.198617, 81.494496, 1, 1, 1, NULL, NULL),
(1449, 18, 'Kandaudapanguwa', NULL, NULL, NULL, '91032', 6.9667, 81.5167, 1, 1, 1, NULL, NULL),
(1450, 18, 'Kandawinna', NULL, NULL, NULL, '91552', 6.9333, 81.2833, 1, 1, 1, NULL, NULL),
(1451, 18, 'Kataragama', 'කතරගම', NULL, NULL, '91400', 6.4167, 81.3333, 1, 1, 1, NULL, NULL),
(1452, 18, 'Kotagama', 'කොටගම', NULL, NULL, '91512', 7.116448, 81.17788, 1, 1, 1, NULL, NULL),
(1453, 18, 'Kotamuduna', NULL, NULL, NULL, '90506', 6.892542, 81.177651, 1, 1, 1, NULL, NULL),
(1454, 18, 'Kotawehera Mankada', NULL, NULL, NULL, '91312', 6.4636, 81.053, 1, 1, 1, NULL, NULL),
(1455, 18, 'Kudawewa', 'කුඩාවැව', NULL, NULL, '61226', 6.4167, 81.0333, 1, 1, 1, NULL, NULL),
(1456, 18, 'Kumbukkana', NULL, NULL, NULL, '91098', 6.814795, 81.274913, 1, 1, 1, NULL, NULL),
(1457, 18, 'Marawa', NULL, NULL, NULL, '91006', 6.805944, 81.381458, 1, 1, 1, NULL, NULL),
(1458, 18, 'Mariarawa', NULL, NULL, NULL, '91052', 6.975969, 81.481047, 1, 1, 1, NULL, NULL),
(1459, 18, 'Medagana', NULL, NULL, NULL, '91550', 6.9333, 81.2833, 1, 1, 1, NULL, NULL),
(1460, 18, 'Medawelagama', NULL, NULL, NULL, '90518', 6.9167, 81.2, 1, 1, 1, NULL, NULL),
(1461, 18, 'Miyanakandura', NULL, NULL, NULL, '90584', 6.869169, 81.152967, 1, 1, 1, NULL, NULL),
(1462, 18, 'Monaragala', 'මොණරාගල', NULL, NULL, '91000', 6.8667, 81.35, 1, 1, 1, NULL, NULL),
(1463, 18, 'Moretuwegama', NULL, NULL, NULL, '91108', 6.75, 81.2333, 1, 1, 1, NULL, NULL),
(1464, 18, 'Nakkala', NULL, NULL, NULL, '91003', 6.887816, 81.306082, 1, 1, 1, NULL, NULL),
(1465, 18, 'Namunukula', 'නමුණුකුල', NULL, NULL, '90580', 6.8667, 81.1167, 1, 1, 1, NULL, NULL),
(1466, 18, 'Nannapurawa', NULL, NULL, NULL, '91519', 7.0833, 81.25, 1, 1, 1, NULL, NULL),
(1467, 18, 'Nelliyadda', NULL, NULL, NULL, '91042', 7.389929, 81.408141, 1, 1, 1, NULL, NULL),
(1468, 18, 'Nilgala', 'නිල්ගල', NULL, NULL, '91508', 7.215945, 81.312806, 1, 1, 1, NULL, NULL),
(1469, 18, 'Obbegoda', NULL, NULL, NULL, '91007', 6.8786, 81.3476, 1, 1, 1, NULL, NULL),
(1470, 18, 'Okkampitiya', 'ඔක්කම්පිටිය', NULL, NULL, '91060', 6.753201, 81.29752, 1, 1, 1, NULL, NULL),
(1471, 18, 'Pangura', NULL, NULL, NULL, '91002', 6.9833, 81.3167, 1, 1, 1, NULL, NULL),
(1472, 18, 'Pitakumbura', 'පිටකුඹුර', NULL, NULL, '91505', 7.191575, 81.27524, 1, 1, 1, NULL, NULL),
(1473, 18, 'Randeniya', 'රන්දෙණිය', NULL, NULL, '91204', 6.803474, 81.1119, 1, 1, 1, NULL, NULL),
(1474, 18, 'Ruwalwela', 'රුවල්වෙල', NULL, NULL, '91056', 7.017476, 81.386203, 1, 1, 1, NULL, NULL),
(1475, 18, 'Sella Kataragama', 'සෙල්ල කතරගම', NULL, NULL, '91405', 6.4167, 81.3333, 1, 1, 1, NULL, NULL),
(1476, 18, 'Siyambalagune', NULL, NULL, NULL, '91202', 6.8, 81.1333, 1, 1, 1, NULL, NULL),
(1477, 18, 'Siyambalanduwa', 'සියඹලාණ්ඩුව', NULL, NULL, '91030', 6.910581, 81.552112, 1, 1, 1, NULL, NULL),
(1478, 18, 'Suriara', NULL, NULL, NULL, '91306', 6.4636, 81.053, 1, 1, 1, NULL, NULL),
(1479, 18, 'Thanamalwila', 'තණමල්විල', NULL, NULL, '91300', 6.4333, 81.1333, 1, 1, 1, NULL, NULL),
(1480, 18, 'Uva Gangodagama', NULL, NULL, NULL, '91054', 7.0056, 81.4222, 1, 1, 1, NULL, NULL),
(1481, 18, 'Uva Kudaoya', NULL, NULL, NULL, '91298', 6.75, 81.2, 1, 1, 1, NULL, NULL),
(1482, 18, 'Uva Pelwatta', NULL, NULL, NULL, '91112', 6.75, 81.2333, 1, 1, 1, NULL, NULL),
(1483, 18, 'Warunagama', NULL, NULL, NULL, '91198', 6.75, 81.2333, 1, 1, 1, NULL, NULL),
(1484, 18, 'Wedikumbura', NULL, NULL, NULL, '91005', 6.8333, 81.3833, 1, 1, 1, NULL, NULL),
(1485, 18, 'Weherayaya Handapanagala', 'වෙහෙරයාය හඳපානාගල', NULL, NULL, '91206', 6.7778, 81.1167, 1, 1, 1, NULL, NULL),
(1486, 18, 'Wellawaya', 'වැල්ලවාය', NULL, NULL, '91200', 6.719458, 81.106295, 1, 1, 1, NULL, NULL),
(1487, 18, 'Wilaoya', 'විලාඔය', NULL, NULL, '91022', 6.9216, 81.3833, 1, 1, 1, NULL, NULL),
(1488, 18, 'Yudaganawa', 'යුදගනාව', NULL, NULL, '51424', 6.776882, 81.229725, 1, 1, 1, NULL, NULL),
(1489, 19, 'Mullativu', 'මුලතිව්', NULL, NULL, '42000', 9.266667, 80.816667, 1, 1, 1, NULL, NULL),
(1490, 20, 'Agarapathana', 'ආගරපතන', NULL, NULL, '22094', 6.824224, 80.709671, 1, 1, 1, NULL, NULL),
(1491, 20, 'Ambatalawa', 'අඹතලාව', NULL, NULL, '20686', 7.05, 80.6667, 1, 1, 1, NULL, NULL),
(1492, 20, 'Ambewela', 'අඹේවෙල', NULL, NULL, '22216', 6.899935, 80.783603, 1, 1, 1, NULL, NULL),
(1493, 20, 'Bogawantalawa', 'බොගවන්තලාව', NULL, NULL, '22060', 6.8, 80.6833, 1, 1, 1, NULL, NULL),
(1494, 20, 'Bopattalawa', 'බෝපත්තලාව', NULL, NULL, '22095', 6.9011, 80.6694, 1, 1, 1, NULL, NULL),
(1495, 20, 'Dagampitiya', 'දාගම්පිටිය', NULL, NULL, '20684', 6.977604, 80.466144, 1, 1, 1, NULL, NULL),
(1496, 20, 'Dayagama Bazaar', 'දයගම බසාර්', NULL, NULL, '22096', 6.9011, 80.6694, 1, 1, 1, NULL, NULL),
(1497, 20, 'Dikoya', 'දික්ඔය', NULL, NULL, '22050', 6.8786, 80.6272, 1, 1, 1, NULL, NULL),
(1498, 20, 'Doragala', 'දොරගල', NULL, NULL, '20567', 7.0731, 80.5892, 1, 1, 1, NULL, NULL),
(1499, 20, 'Dunukedeniya', 'දුනුකෙදෙණිය', NULL, NULL, '22002', 6.982643, 80.632911, 1, 1, 1, NULL, NULL),
(1500, 20, 'Egodawela', 'එගොඩවෙල', NULL, NULL, '90013', 7.024081, 80.662636, 1, 1, 1, NULL, NULL),
(1501, 20, 'Ekiriya', 'ඇකිරිය', NULL, NULL, '20732', 7.148834, 80.757167, 1, 1, 1, NULL, NULL),
(1502, 20, 'Elamulla', 'ඇලමුල්ල', NULL, NULL, '20742', 7.0833, 80.8, 1, 1, 1, NULL, NULL),
(1503, 20, 'Ginigathena', 'ගිනිගතැන', NULL, NULL, '20680', 6.9864, 80.4894, 1, 1, 1, NULL, NULL),
(1504, 20, 'Gonakele', 'ගොනාකැලේ', NULL, NULL, '22226', 6.9917, 80.8194, 1, 1, 1, NULL, NULL),
(1505, 20, 'Haggala', 'හග්ගල', NULL, NULL, '22208', 6.9697, 80.77, 1, 1, 1, NULL, NULL),
(1506, 20, 'Halgranoya', 'හාල්ගරනඔය', NULL, NULL, '22240', 7.0417, 80.8917, 1, 1, 1, NULL, NULL),
(1507, 20, 'Hangarapitiya', NULL, NULL, NULL, '22044', 6.932637, 80.464959, 1, 1, 1, NULL, NULL),
(1508, 20, 'Hapugasthalawa', 'හපුගස්තලාව', NULL, NULL, '20668', 7.0667, 80.5667, 1, 1, 1, NULL, NULL),
(1509, 20, 'Harasbedda', NULL, NULL, NULL, '22262', 7.04738, 80.876477, 1, 1, 1, NULL, NULL),
(1510, 20, 'Hatton', 'හැටන්', NULL, NULL, '22000', 6.899356, 80.599855, 1, 1, 1, NULL, NULL),
(1511, 20, 'Hewaheta', 'හේවාහැට', NULL, NULL, '20440', 7.1108, 80.7547, 1, 1, 1, NULL, NULL),
(1512, 20, 'Hitigegama', NULL, NULL, NULL, '22046', 6.947521, 80.457154, 1, 1, 1, NULL, NULL),
(1513, 20, 'Jangulla', NULL, NULL, NULL, '90063', 7.0333, 80.8917, 1, 1, 1, NULL, NULL),
(1514, 20, 'Kalaganwatta', NULL, NULL, NULL, '22282', 7.104232, 80.902715, 1, 1, 1, NULL, NULL),
(1515, 20, 'Kandapola', 'කඳපොල', NULL, NULL, '22220', 6.981495, 80.802798, 1, 1, 1, NULL, NULL),
(1516, 20, 'Karandagolla', 'කරඳගොල්ල', NULL, NULL, '20738', 7.057024, 80.899844, 1, 1, 1, NULL, NULL),
(1517, 20, 'Keerthi Bandarapura', 'කීර්තිබණ්ඩාරපුර', NULL, NULL, '22274', 7.1108, 80.8581, 1, 1, 1, NULL, NULL),
(1518, 20, 'Kiribathkumbura', 'කිරිබත්කුඹුර', NULL, NULL, '20442', 7.1108, 80.7547, 1, 1, 1, NULL, NULL),
(1519, 20, 'Kotiyagala', 'කොටියාගල', NULL, NULL, '91024', 6.784171, 80.68557, 1, 1, 1, NULL, NULL),
(1520, 20, 'Kotmale', 'කොත්මලේ', NULL, NULL, '20560', 7.0214, 80.5942, 1, 1, 1, NULL, NULL),
(1521, 20, 'Kottellena', NULL, NULL, NULL, '22040', 6.893287, 80.50215, 1, 1, 1, NULL, NULL),
(1522, 20, 'Kumbalgamuwa', 'කුඹල්ගමුව', NULL, NULL, '22272', 7.109883, 80.853852, 1, 1, 1, NULL, NULL),
(1523, 20, 'Kumbukwela', 'කුඹුක්වෙල', NULL, NULL, '22246', 7.055729, 80.887479, 1, 1, 1, NULL, NULL),
(1524, 20, 'Kurupanawela', NULL, NULL, NULL, '22252', 7.01894, 80.920981, 1, 1, 1, NULL, NULL),
(1525, 20, 'Labukele', 'ලබුකැලේ', NULL, NULL, '20592', 7.0442, 80.6919, 1, 1, 1, NULL, NULL),
(1526, 20, 'Laxapana', 'ලක්ෂපාන', NULL, NULL, '22034', 6.8952, 80.5088, 1, 1, 1, NULL, NULL),
(1527, 20, 'Lindula', 'ලිඳුල', NULL, NULL, '22090', 6.920326, 80.684129, 1, 1, 1, NULL, NULL),
(1528, 20, 'Madulla', NULL, NULL, NULL, '22256', 7.047667, 80.918204, 1, 1, 1, NULL, NULL),
(1529, 20, 'Mandaram Nuwara', NULL, NULL, NULL, '20744', 7.0833, 80.8, 1, 1, 1, NULL, NULL),
(1530, 20, 'Maskeliya', 'මස්කෙළිය', NULL, NULL, '22070', 6.831379, 80.568585, 1, 1, 1, NULL, NULL),
(1531, 20, 'Maswela', NULL, NULL, NULL, '20566', 7.072503, 80.6439, 1, 1, 1, NULL, NULL),
(1532, 20, 'Maturata', 'මතුරට', NULL, NULL, '20748', 7.0833, 80.8, 1, 1, 1, NULL, NULL),
(1533, 20, 'Mipanawa', 'මීපනාව', NULL, NULL, '22254', 7.0333, 80.9167, 1, 1, 1, NULL, NULL),
(1534, 20, 'Mipilimana', 'මීපිලිමාන', NULL, NULL, '22214', 6.8667, 80.8167, 1, 1, 1, NULL, NULL),
(1535, 20, 'Morahenagama', 'මොරහේනගම', NULL, NULL, '22036', 6.942625, 80.478482, 1, 1, 1, NULL, NULL),
(1536, 20, 'Munwatta', NULL, NULL, NULL, '20752', 7.11534, 80.809403, 1, 1, 1, NULL, NULL),
(1537, 20, 'Nayapana Janapadaya', NULL, NULL, NULL, '20568', 7.0731, 80.5892, 1, 1, 1, NULL, NULL),
(1538, 20, 'Nildandahinna', NULL, NULL, NULL, '22280', 7.0833, 80.8833, 1, 1, 1, NULL, NULL),
(1539, 20, 'Nissanka Uyana', 'නිශ්ශංක උයන', NULL, NULL, '22075', 6.8358, 80.5703, 1, 1, 1, NULL, NULL),
(1540, 20, 'Norwood', 'නෝවුඩ්', NULL, NULL, '22058', 6.835736, 80.602181, 1, 1, 1, NULL, NULL),
(1541, 20, 'Nuwara Eliya', 'නුවරඑළිය', NULL, NULL, '22200', 6.9697, 80.77, 1, 1, 1, NULL, NULL),
(1542, 20, 'Padiyapelella', 'පදියපැලැල්ල', NULL, NULL, '20750', 7.092506, 80.798544, 1, 1, 1, NULL, NULL),
(1543, 20, 'Pallebowala', NULL, NULL, NULL, '20734', 7.1151, 80.8108, 1, 1, 1, NULL, NULL),
(1544, 20, 'Panvila', NULL, NULL, NULL, '20830', 7.0667, 80.6833, 1, 1, 1, NULL, NULL),
(1545, 20, 'Pitawala', 'පිටවල', NULL, NULL, '20682', 6.998608, 80.452257, 1, 1, 1, NULL, NULL),
(1546, 20, 'Pundaluoya', NULL, NULL, NULL, '22120', 7.018255, 80.676081, 1, 1, 1, NULL, NULL),
(1547, 20, 'Ramboda', 'රම්බොඩ', NULL, NULL, '20590', 7.060427, 80.69534, 1, 1, 1, NULL, NULL),
(1548, 20, 'Rikillagaskada', 'රිකිල්ලගස්කඩ', NULL, NULL, '20730', 7.145849, 80.78095, 1, 1, 1, NULL, NULL),
(1549, 20, 'Rozella', 'රොසැල්ල', NULL, NULL, '22008', 6.9306, 80.5531, 1, 1, 1, NULL, NULL),
(1550, 20, 'Rupaha', NULL, NULL, NULL, '22245', 7.0333, 80.9, 1, 1, 1, NULL, NULL),
(1551, 20, 'Ruwaneliya', NULL, NULL, NULL, '22212', 6.93721, 80.772258, 1, 1, 1, NULL, NULL),
(1552, 20, 'Santhipura', NULL, NULL, NULL, '22202', 6.9697, 80.77, 1, 1, 1, NULL, NULL),
(1553, 20, 'Talawakele', 'තලවකැලේ', NULL, NULL, '22100', 6.9367, 80.6611, 1, 1, 1, NULL, NULL),
(1554, 20, 'Tawalantenna', NULL, NULL, NULL, '20838', 7.0667, 80.6833, 1, 1, 1, NULL, NULL),
(1555, 20, 'Teripeha', NULL, NULL, NULL, '22287', 7.1189, 80.9244, 1, 1, 1, NULL, NULL),
(1556, 20, 'Udamadura', NULL, NULL, NULL, '22285', 7.094106, 80.914817, 1, 1, 1, NULL, NULL),
(1557, 20, 'Udapussallawa', NULL, NULL, NULL, '22250', 7.0333, 80.9111, 1, 1, 1, NULL, NULL),
(1558, 20, 'Uva Deegalla', NULL, NULL, NULL, '90062', 7.0333, 80.8917, 1, 1, 1, NULL, NULL),
(1559, 20, 'Uva Uduwara', NULL, NULL, NULL, '90061', 7.0333, 80.8917, 1, 1, 1, NULL, NULL),
(1560, 20, 'Uvaparanagama', 'ඌව-පරණගම', NULL, NULL, '90230', 6.8832, 80.7912, 1, 1, 1, NULL, NULL),
(1561, 20, 'Walapane', 'වලපනේ', NULL, NULL, '22270', 7.091924, 80.860522, 1, 1, 1, NULL, NULL),
(1562, 20, 'Watawala', 'වටවල', NULL, NULL, '22010', 6.951339, 80.533199, 1, 1, 1, NULL, NULL),
(1563, 20, 'Widulipura', 'විදුලිපුර', NULL, NULL, '22032', 6.8952, 80.5088, 1, 1, 1, NULL, NULL),
(1564, 20, 'Wijebahukanda', 'විජේබාහුකන්ද', NULL, NULL, '22018', 7.0167, 80.6167, 1, 1, 1, NULL, NULL),
(1565, 21, 'Attanakadawala', 'අත්තනගඩවල', NULL, NULL, '51235', 7.903734, 80.828104, 1, 1, 1, NULL, NULL),
(1566, 21, 'Bakamuna', 'බකමූණ', NULL, NULL, '51250', 7.7833, 80.8167, 1, 1, 1, NULL, NULL),
(1567, 21, 'Diyabeduma', 'දියබෙදුම', NULL, NULL, '51225', 7.89851, 80.898332, 1, 1, 1, NULL, NULL),
(1568, 21, 'Elahera', 'ඇලහැර', NULL, NULL, '51258', 7.7244, 80.7883, 1, 1, 1, NULL, NULL),
(1569, 21, 'Giritale', 'ගිරිතලේ', NULL, NULL, '51026', 7.9833, 80.9333, 1, 1, 1, NULL, NULL),
(1570, 21, 'Hingurakdamana', NULL, NULL, NULL, '51408', 8.055896, 81.011875, 1, 1, 1, NULL, NULL),
(1571, 21, 'Hingurakgoda', 'හිඟුරක්ගොඩ', NULL, NULL, '51400', 8.036505, 80.948686, 1, 1, 1, NULL, NULL),
(1572, 21, 'Jayanthipura', 'ජයන්තිපුර', NULL, NULL, '51024', 8, 81, 1, 1, 1, NULL, NULL),
(1573, 21, 'Kalingaela', NULL, NULL, NULL, '51002', 7.9583, 81.0417, 1, 1, 1, NULL, NULL),
(1574, 21, 'Lakshauyana', 'ලක්ෂඋයන', NULL, NULL, '51006', 7.9583, 81.0417, 1, 1, 1, NULL, NULL),
(1575, 21, 'Mankemi', NULL, NULL, NULL, '30442', 7.9833, 81.25, 1, 1, 1, NULL, NULL),
(1576, 21, 'Minneriya', 'මින්නේරිය', NULL, NULL, '51410', 8.036343, 80.903215, 1, 1, 1, NULL, NULL),
(1577, 21, 'Onegama', NULL, NULL, NULL, '51004', 7.992203, 81.090758, 1, 1, 1, NULL, NULL),
(1578, 21, 'Orubendi Siyambalawa', NULL, NULL, NULL, '51256', 7.751972, 80.812093, 1, 1, 1, NULL, NULL),
(1579, 21, 'Palugasdamana', 'පලුගස්දමන', NULL, NULL, '51046', 8.0167, 81.0833, 1, 1, 1, NULL, NULL),
(1580, 21, 'Panichankemi', NULL, NULL, NULL, '30444', 7.9833, 81.25, 1, 1, 1, NULL, NULL),
(1581, 21, 'Polonnaruwa', 'පොළොන්නරුව', NULL, NULL, '51000', 7.940295, 81.007138, 1, 1, 1, NULL, NULL),
(1582, 21, 'Talpotha', NULL, NULL, NULL, '51044', 8.0167, 81.0833, 1, 1, 1, NULL, NULL),
(1583, 21, 'Tambala', NULL, NULL, NULL, '51049', 8.0167, 81.0833, 1, 1, 1, NULL, NULL),
(1584, 21, 'Unagalavehera', NULL, NULL, NULL, '51008', 8.001006, 80.995549, 1, 1, 1, NULL, NULL),
(1585, 21, 'Wijayabapura', NULL, NULL, NULL, '51042', 8.0167, 81.0833, 1, 1, 1, NULL, NULL);
INSERT INTO `cities` (`id`, `district_id`, `name_en`, `name_si`, `name_ta`, `description`, `postcode`, `latitude`, `longitude`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1586, 22, 'Adippala', NULL, NULL, NULL, '61012', 7.5833, 79.8417, 1, 1, 1, NULL, NULL),
(1587, 22, 'Alutgama', 'අළුත්ගම', NULL, NULL, '12080', 7.7667, 79.9333, 1, 1, 1, NULL, NULL),
(1588, 22, 'Alutwewa', 'අළුත්වැව', NULL, NULL, '51014', 7.8667, 79.95, 1, 1, 1, NULL, NULL),
(1589, 22, 'Ambakandawila', 'අඹකඳවිල', NULL, NULL, '61024', 7.5333, 79.8, 1, 1, 1, NULL, NULL),
(1590, 22, 'Anamaduwa', 'ආනමඩුව', NULL, NULL, '61500', 7.881625, 80.00353, 1, 1, 1, NULL, NULL),
(1591, 22, 'Andigama', 'අඬිගම', NULL, NULL, '61508', 7.7775, 79.9528, 1, 1, 1, NULL, NULL),
(1592, 22, 'Angunawila', 'අඟුණවිල', NULL, NULL, '61264', 7.7667, 79.85, 1, 1, 1, NULL, NULL),
(1593, 22, 'Attawilluwa', 'අත්තවිල්ලුව', NULL, NULL, '61328', 7.4167, 79.8833, 1, 1, 1, NULL, NULL),
(1594, 22, 'Bangadeniya', 'බංගදෙණිය', NULL, NULL, '61238', 7.619471, 79.809055, 1, 1, 1, NULL, NULL),
(1595, 22, 'Baranankattuwa', 'බරණන්කට්ටුව', NULL, NULL, '61262', 7.803253, 79.872624, 1, 1, 1, NULL, NULL),
(1596, 22, 'Battuluoya', 'බත්තුලුඔය', NULL, NULL, '61246', 7.734655, 79.817455, 1, 1, 1, NULL, NULL),
(1597, 22, 'Bujjampola', 'බුජ්ජම්පොල', NULL, NULL, '61136', 7.3333, 79.9, 1, 1, 1, NULL, NULL),
(1598, 22, 'Chilaw', 'හලාවත', NULL, NULL, '61000', 7.5758, 79.7953, 1, 1, 1, NULL, NULL),
(1599, 22, 'Dalukana', 'දලුකන', NULL, NULL, '51092', 7.3167, 79.85, 1, 1, 1, NULL, NULL),
(1600, 22, 'Dankotuwa', 'දංකොටුව', NULL, NULL, '61130', 7.300443, 79.88505, 1, 1, 1, NULL, NULL),
(1601, 22, 'Dewagala', 'දේවගල', NULL, NULL, '51094', 7.3167, 79.85, 1, 1, 1, NULL, NULL),
(1602, 22, 'Dummalasuriya', 'දුම්මලසූරිය', NULL, NULL, '60260', 7.4833, 79.9, 1, 1, 1, NULL, NULL),
(1603, 22, 'Dunkannawa', 'දුන්කන්නාව', NULL, NULL, '61192', 7.4167, 79.9, 1, 1, 1, NULL, NULL),
(1604, 22, 'Eluwankulama', 'එළුවන්කුලම', NULL, NULL, '61308', 8.332832, 79.859928, 1, 1, 1, NULL, NULL),
(1605, 22, 'Ettale', 'ඇත්තලේ', NULL, NULL, '61343', 8.097416, 79.717306, 1, 1, 1, NULL, NULL),
(1606, 22, 'Galamuna', 'ගලමුන', NULL, NULL, '51416', 7.464661, 79.872371, 1, 1, 1, NULL, NULL),
(1607, 22, 'Galmuruwa', 'ගල්මුරුව', NULL, NULL, '61233', 7.501718, 79.895774, 1, 1, 1, NULL, NULL),
(1608, 22, 'Hansayapalama', NULL, NULL, NULL, '51098', 7.3167, 79.85, 1, 1, 1, NULL, NULL),
(1609, 22, 'Ihala Kottaramulla', NULL, NULL, NULL, '61154', 7.383069, 79.871755, 1, 1, 1, NULL, NULL),
(1610, 22, 'Ilippadeniya', NULL, NULL, NULL, '61018', 7.567036, 79.826233, 1, 1, 1, NULL, NULL),
(1611, 22, 'Inginimitiya', NULL, NULL, NULL, '61514', 7.964099, 80.112055, 1, 1, 1, NULL, NULL),
(1612, 22, 'Ismailpuram', NULL, NULL, NULL, '61302', 8.0333, 79.8167, 1, 1, 1, NULL, NULL),
(1613, 22, 'Jayasiripura', 'ජයසිරිපුර', NULL, NULL, '51246', 7.6333, 79.8167, 1, 1, 1, NULL, NULL),
(1614, 22, 'Kakkapalliya', NULL, NULL, NULL, '61236', 7.5333, 79.8267, 1, 1, 1, NULL, NULL),
(1615, 22, 'Kalkudah', 'කල්කුඩා', NULL, NULL, '30410', 8.1167, 79.7167, 1, 1, 1, NULL, NULL),
(1616, 22, 'Kalladiya', NULL, NULL, NULL, '61534', 7.95, 79.9333, 1, 1, 1, NULL, NULL),
(1617, 22, 'Kandakuliya', NULL, NULL, NULL, '61358', 7.98, 79.9569, 1, 1, 1, NULL, NULL),
(1618, 22, 'Karathivu', NULL, NULL, NULL, '61307', 8.192511, 79.832662, 1, 1, 1, NULL, NULL),
(1619, 22, 'Karawitagara', NULL, NULL, NULL, '61022', 7.572417, 79.86173, 1, 1, 1, NULL, NULL),
(1620, 22, 'Karuwalagaswewa', NULL, NULL, NULL, '61314', 8.037625, 79.94267, 1, 1, 1, NULL, NULL),
(1621, 22, 'Katuneriya', 'කටුනේරිය', NULL, NULL, '61180', 7.3667, 79.8333, 1, 1, 1, NULL, NULL),
(1622, 22, 'Koswatta', 'කොස්වත්ත', NULL, NULL, '61158', 7.3667, 79.9, 1, 1, 1, NULL, NULL),
(1623, 22, 'Kottantivu', NULL, NULL, NULL, '61252', 7.85, 79.7833, 1, 1, 1, NULL, NULL),
(1624, 22, 'Kottapitiya', NULL, NULL, NULL, '51244', 7.63568, 79.815394, 1, 1, 1, NULL, NULL),
(1625, 22, 'Kottukachchiya', NULL, NULL, NULL, '61532', 7.938617, 79.954577, 1, 1, 1, NULL, NULL),
(1626, 22, 'Kumarakattuwa', 'කුමාරකට්ටුව', NULL, NULL, '61032', 7.661964, 79.886873, 1, 1, 1, NULL, NULL),
(1627, 22, 'Kurinjanpitiya', NULL, NULL, NULL, '61356', 7.98, 79.9569, 1, 1, 1, NULL, NULL),
(1628, 22, 'Kuruketiyawa', NULL, NULL, NULL, '61516', 8.0167, 80.05, 1, 1, 1, NULL, NULL),
(1629, 22, 'Lunuwila', 'ලුණුවිල', NULL, NULL, '61150', 7.350819, 79.85725, 1, 1, 1, NULL, NULL),
(1630, 22, 'Madampe', 'මාදම්පේ', NULL, NULL, '61230', 7.5, 79.8333, 1, 1, 1, NULL, NULL),
(1631, 22, 'Madurankuliya', 'මදුරන්කුලිය', NULL, NULL, '61270', 7.896391, 79.836449, 1, 1, 1, NULL, NULL),
(1632, 22, 'Mahakumbukkadawala', NULL, NULL, NULL, '61272', 7.85, 79.9, 1, 1, 1, NULL, NULL),
(1633, 22, 'Mahauswewa', NULL, NULL, NULL, '61512', 7.9575, 80.0683, 1, 1, 1, NULL, NULL),
(1634, 22, 'Mampitiya', NULL, NULL, NULL, '51090', 7.3167, 79.85, 1, 1, 1, NULL, NULL),
(1635, 22, 'Mampuri', NULL, NULL, NULL, '61341', 7.9964, 79.7411, 1, 1, 1, NULL, NULL),
(1636, 22, 'Mangalaeliya', NULL, NULL, NULL, '61266', 7.775, 79.85, 1, 1, 1, NULL, NULL),
(1637, 22, 'Marawila', 'මාරවිල', NULL, NULL, '61210', 7.4094, 79.8322, 1, 1, 1, NULL, NULL),
(1638, 22, 'Mudalakkuliya', NULL, NULL, NULL, '61506', 7.799533, 79.977428, 1, 1, 1, NULL, NULL),
(1639, 22, 'Mugunuwatawana', NULL, NULL, NULL, '61014', 7.58487, 79.854684, 1, 1, 1, NULL, NULL),
(1640, 22, 'Mukkutoduwawa', NULL, NULL, NULL, '61274', 7.928236, 79.75648, 1, 1, 1, NULL, NULL),
(1641, 22, 'Mundel', NULL, NULL, NULL, '61250', 7.7958, 79.8283, 1, 1, 1, NULL, NULL),
(1642, 22, 'Muttibendiwila', NULL, NULL, NULL, '61195', 7.45, 79.8833, 1, 1, 1, NULL, NULL),
(1643, 22, 'Nainamadama', 'නයිනමඩම', NULL, NULL, '61120', 7.3714, 79.8837, 1, 1, 1, NULL, NULL),
(1644, 22, 'Nalladarankattuwa', NULL, NULL, NULL, '61244', 7.689152, 79.844243, 1, 1, 1, NULL, NULL),
(1645, 22, 'Nattandiya', 'නාත්තණ්ඩිය', NULL, NULL, '61190', 7.4086, 79.8683, 1, 1, 1, NULL, NULL),
(1646, 22, 'Nawagattegama', 'නවගත්තේගම', NULL, NULL, '61520', 8, 80.1167, 1, 1, 1, NULL, NULL),
(1647, 22, 'Nelumwewa', 'නෙළුම්වැව', NULL, NULL, '51096', 7.3167, 79.85, 1, 1, 1, NULL, NULL),
(1648, 22, 'Norachcholai', 'නොරච්චෝලේ', NULL, NULL, '61342', 7.9964, 79.7411, 1, 1, 1, NULL, NULL),
(1649, 22, 'Pallama', NULL, NULL, NULL, '61040', 7.681225, 79.918239, 1, 1, 1, NULL, NULL),
(1650, 22, 'Palliwasalturai', NULL, NULL, NULL, '61354', 7.98, 79.9569, 1, 1, 1, NULL, NULL),
(1651, 22, 'Panirendawa', NULL, NULL, NULL, '61234', 7.542426, 79.886377, 1, 1, 1, NULL, NULL),
(1652, 22, 'Parakramasamudraya', NULL, NULL, NULL, '51016', 7.8667, 79.95, 1, 1, 1, NULL, NULL),
(1653, 22, 'Pothuwatawana', NULL, NULL, NULL, '61162', 7.4833, 79.9, 1, 1, 1, NULL, NULL),
(1654, 22, 'Puttalam', 'පුත්තලම', NULL, NULL, '61300', 8.043613, 79.841209, 1, 1, 1, NULL, NULL),
(1655, 22, 'Puttalam Cement Factory', 'පුත්තලම සිමෙන්ති කම්හල', NULL, NULL, '61326', 7.4167, 79.8833, 1, 1, 1, NULL, NULL),
(1656, 22, 'Rajakadaluwa', NULL, NULL, NULL, '61242', 7.650515, 79.828283, 1, 1, 1, NULL, NULL),
(1657, 22, 'Saliyawewa Junction', 'සාලියවැව හන්දිය', NULL, NULL, '61324', 7.4167, 79.8833, 1, 1, 1, NULL, NULL),
(1658, 22, 'Serukele', NULL, NULL, NULL, '61042', 7.7333, 79.9167, 1, 1, 1, NULL, NULL),
(1659, 22, 'Siyambalagashene', NULL, NULL, NULL, '61504', 7.8239, 79.978, 1, 1, 1, NULL, NULL),
(1660, 22, 'Tabbowa', 'තබ්බෝව', NULL, NULL, '61322', 7.4167, 79.8833, 1, 1, 1, NULL, NULL),
(1661, 22, 'Talawila Church', 'තලවිල පල්ලිය', NULL, NULL, '61344', 7.9964, 79.7411, 1, 1, 1, NULL, NULL),
(1662, 22, 'Toduwawa', NULL, NULL, NULL, '61224', 7.4861, 79.8022, 1, 1, 1, NULL, NULL),
(1663, 22, 'Udappuwa', NULL, NULL, NULL, '61004', 7.5758, 79.7953, 1, 1, 1, NULL, NULL),
(1664, 22, 'Uridyawa', NULL, NULL, NULL, '61502', 7.8239, 79.978, 1, 1, 1, NULL, NULL),
(1665, 22, 'Vanathawilluwa', 'වනාතවිල්ලුව', NULL, NULL, '61306', 8.17001, 79.8461, 1, 1, 1, NULL, NULL),
(1666, 22, 'Waikkal', 'වයික්කාල', NULL, NULL, '61110', 7.2833, 79.85, 1, 1, 1, NULL, NULL),
(1667, 22, 'Watugahamulla', NULL, NULL, NULL, '61198', 7.4667, 79.9, 1, 1, 1, NULL, NULL),
(1668, 22, 'Wennappuwa', 'වෙන්නප්පුව', NULL, NULL, '61170', 7.35048, 79.850112, 1, 1, 1, NULL, NULL),
(1669, 22, 'Wijeyakatupotha', NULL, NULL, NULL, '61006', 7.5758, 79.7953, 1, 1, 1, NULL, NULL),
(1670, 22, 'Wilpotha', NULL, NULL, NULL, '61008', 7.5758, 79.7953, 1, 1, 1, NULL, NULL),
(1671, 22, 'Yodaela', NULL, NULL, NULL, '51422', 7.5833, 79.8667, 1, 1, 1, NULL, NULL),
(1672, 22, 'Yogiyana', NULL, NULL, NULL, '61144', 7.286035, 79.924213, 1, 1, 1, NULL, NULL),
(1673, 23, 'Akarella', 'අකරැල්ල', NULL, NULL, '70082', 6.59053, 80.644197, 1, 1, 1, NULL, NULL),
(1674, 23, 'Amunumulla', 'අමුනුමුල්ල', NULL, NULL, '90204', 6.7333, 80.75, 1, 1, 1, NULL, NULL),
(1675, 23, 'Atakalanpanna', 'අටකලන්පන්න', NULL, NULL, '70294', 6.5333, 80.6, 1, 1, 1, NULL, NULL),
(1676, 23, 'Ayagama', 'අයගම', NULL, NULL, '70024', 6.63662, 80.317329, 1, 1, 1, NULL, NULL),
(1677, 23, 'Balangoda', 'බලන්ගොඩ', NULL, NULL, '70100', 6.661743, 80.69371, 1, 1, 1, NULL, NULL),
(1678, 23, 'Batatota', 'බටතොට', NULL, NULL, '70504', 6.8333, 80.3667, 1, 1, 1, NULL, NULL),
(1679, 23, 'Beralapanathara', 'බෙරලපනතර', NULL, NULL, '81541', 6.4521, 80.4894, 1, 1, 1, NULL, NULL),
(1680, 23, 'Bogahakumbura', 'බෝගහකුඹුර', NULL, NULL, '90354', 6.6833, 80.7667, 1, 1, 1, NULL, NULL),
(1681, 23, 'Bolthumbe', 'බොල්තුඹෙ', NULL, NULL, '70131', 6.739114, 80.664956, 1, 1, 1, NULL, NULL),
(1682, 23, 'Bomluwageaina', 'බොම්ලුවගෙයින', NULL, NULL, '70344', 6.4, 80.6333, 1, 1, 1, NULL, NULL),
(1683, 23, 'Bowalagama', 'බෝවලගම', NULL, NULL, '82458', 6.3917, 80.6833, 1, 1, 1, NULL, NULL),
(1684, 23, 'Bulutota', 'බුලුතොට', NULL, NULL, '70346', 6.4333, 80.65, 1, 1, 1, NULL, NULL),
(1685, 23, 'Dambuluwana', 'දඹුලුවාන', NULL, NULL, '70019', 6.7167, 80.3333, 1, 1, 1, NULL, NULL),
(1686, 23, 'Daugala', 'දවුගල', NULL, NULL, '70455', 6.4901, 80.4248, 1, 1, 1, NULL, NULL),
(1687, 23, 'Dela', 'දෙල', NULL, NULL, '70042', 6.6258, 80.4486, 1, 1, 1, NULL, NULL),
(1688, 23, 'Delwala', 'දෙල්වල', NULL, NULL, '70046', 6.513055, 80.473993, 1, 1, 1, NULL, NULL),
(1689, 23, 'Dodampe', 'දොඩම්පෙ', NULL, NULL, '70017', 6.73603, 80.301105, 1, 1, 1, NULL, NULL),
(1690, 23, 'Doloswalakanda', 'දොලොස්වලකන්ද', NULL, NULL, '70404', 6.55133, 80.470258, 1, 1, 1, NULL, NULL),
(1691, 23, 'Dumbara Manana', 'දුම්බර මනන', NULL, NULL, '70495', 6.680322, 80.247485, 1, 1, 1, NULL, NULL),
(1692, 23, 'Eheliyagoda', 'ඇහැළියගොඩ', NULL, NULL, '70600', 6.85, 80.2667, 1, 1, 1, NULL, NULL),
(1693, 23, 'Ekamutugama', 'එකමුතුගම', NULL, NULL, '70254', 6.3406, 80.7804, 1, 1, 1, NULL, NULL),
(1694, 23, 'Elapatha', 'ඇලපාත', NULL, NULL, '70032', 6.66081, 80.366828, 1, 1, 1, NULL, NULL),
(1695, 23, 'Ellagawa', 'ඇල්ලගාව', NULL, NULL, '70492', 6.5687, 80.363, 1, 1, 1, NULL, NULL),
(1696, 23, 'Ellaulla', 'ඇල්ලඋල', NULL, NULL, '70552', 6.8583, 80.3083, 1, 1, 1, NULL, NULL),
(1697, 23, 'Ellawala', 'ඇල්ලවල', NULL, NULL, '70606', 6.809945, 80.259547, 1, 1, 1, NULL, NULL),
(1698, 23, 'Embilipitiya', 'ඇඹිලිපිටිය', NULL, NULL, '70200', 6.3439, 80.8489, 1, 1, 1, NULL, NULL),
(1699, 23, 'Eratna', 'එරත්න', NULL, NULL, '70506', 6.7986, 80.3784, 1, 1, 1, NULL, NULL),
(1700, 23, 'Erepola', 'එරෙපොල', NULL, NULL, '70602', 6.804277, 80.242773, 1, 1, 1, NULL, NULL),
(1701, 23, 'Gabbela', 'ගබ්බෙල', NULL, NULL, '70156', 6.7167, 80.35, 1, 1, 1, NULL, NULL),
(1702, 23, 'Gangeyaya', 'ගන්ගෙයාය', NULL, NULL, '70195', 6.7516, 80.5927, 1, 1, 1, NULL, NULL),
(1703, 23, 'Gawaragiriya', 'ගවරගිරිය', NULL, NULL, '70026', 6.6422, 80.2667, 1, 1, 1, NULL, NULL),
(1704, 23, 'Gillimale', 'ගිලීමලේ', NULL, NULL, '70002', 6.729, 80.4415, 1, 1, 1, NULL, NULL),
(1705, 23, 'Godakawela', 'ගොඩකවැල', NULL, NULL, '70160', 6.505599, 80.647268, 1, 1, 1, NULL, NULL),
(1706, 23, 'Gurubewilagama', 'ගුරුබෙවිලගම', NULL, NULL, '70136', 6.7, 80.5667, 1, 1, 1, NULL, NULL),
(1707, 23, 'Halwinna', 'හල්වින්න', NULL, NULL, '70171', 6.6833, 80.7167, 1, 1, 1, NULL, NULL),
(1708, 23, 'Handagiriya', 'හඳගිරිය', NULL, NULL, '70106', 6.562839, 80.780347, 1, 1, 1, NULL, NULL),
(1709, 23, 'Hatangala', 'හටංගල', NULL, NULL, '70105', 6.532527, 80.739407, 1, 1, 1, NULL, NULL),
(1710, 23, 'Hatarabage', 'තරබාගේ', NULL, NULL, '70108', 6.65, 80.75, 1, 1, 1, NULL, NULL),
(1711, 23, 'Hewanakumbura', 'හේවානකුඹුර', NULL, NULL, '90358', 6.6833, 80.7667, 1, 1, 1, NULL, NULL),
(1712, 23, 'Hidellana', 'හිදැල්ලන', NULL, NULL, '70012', 6.7192, 80.3842, 1, 1, 1, NULL, NULL),
(1713, 23, 'Hiramadagama', 'හිරමඩගම', NULL, NULL, '70296', 6.533544, 80.60045, 1, 1, 1, NULL, NULL),
(1714, 23, 'Horewelagoda', 'හොරේවෙලගොඩ', NULL, NULL, '82456', 6.3917, 80.6833, 1, 1, 1, NULL, NULL),
(1715, 23, 'Ittakanda', 'ඉත්තකන්ද', NULL, NULL, '70342', 6.403532, 80.636458, 1, 1, 1, NULL, NULL),
(1716, 23, 'Kahangama', 'කහන්ගම', NULL, NULL, '70016', 6.704217, 80.362927, 1, 1, 1, NULL, NULL),
(1717, 23, 'Kahawatta', 'කහවත්ත', NULL, NULL, '70150', 6.708145, 80.303805, 1, 1, 1, NULL, NULL),
(1718, 23, 'Kalawana', 'කලවාන', NULL, NULL, '70450', 6.531595, 80.407285, 1, 1, 1, NULL, NULL),
(1719, 23, 'Kaltota', 'කල්තොට', NULL, NULL, '70122', 6.6833, 80.6833, 1, 1, 1, NULL, NULL),
(1720, 23, 'Kalubululanda', 'කළුබුළුලන්ද', NULL, NULL, '90352', 6.6833, 80.7667, 1, 1, 1, NULL, NULL),
(1721, 23, 'Kananke Bazaar', 'කනන්කේ බසාර්', NULL, NULL, '80136', 6.7361, 80.4354, 1, 1, 1, NULL, NULL),
(1722, 23, 'Kandepuhulpola', 'කන්දෙපුහුල්පොල', NULL, NULL, '90356', 6.6833, 80.7667, 1, 1, 1, NULL, NULL),
(1723, 23, 'Karandana', 'කරඳන', NULL, NULL, '70488', 6.77254, 80.206883, 1, 1, 1, NULL, NULL),
(1724, 23, 'Karangoda', 'කරංගොඩ', NULL, NULL, '70018', 6.677224, 80.368723, 1, 1, 1, NULL, NULL),
(1725, 23, 'Kella Junction', 'කෑල්ල හන්දිය', NULL, NULL, '70352', 6.4, 80.6833, 1, 1, 1, NULL, NULL),
(1726, 23, 'Keppetipola', 'කැප්පෙටිපොළ', NULL, NULL, '90350', 6.6833, 80.7667, 1, 1, 1, NULL, NULL),
(1727, 23, 'Kiriella', 'කිරිඇල්ල', NULL, NULL, '70480', 6.753583, 80.265838, 1, 1, 1, NULL, NULL),
(1728, 23, 'Kiriibbanwewa', 'කිරිඉබ්බන්වැව', NULL, NULL, '70252', 6.3406, 80.7804, 1, 1, 1, NULL, NULL),
(1729, 23, 'Kolambage Ara', 'කොළඹගේ ආර', NULL, NULL, '70180', 6.7516, 80.5927, 1, 1, 1, NULL, NULL),
(1730, 23, 'Kolombugama', 'කොළඹගම', NULL, NULL, '70403', 6.5667, 80.4833, 1, 1, 1, NULL, NULL),
(1731, 23, 'Kolonna', 'කොළොන්න', NULL, NULL, '70350', 6.404095, 80.681552, 1, 1, 1, NULL, NULL),
(1732, 23, 'Kudawa', 'කුඩාව', NULL, NULL, '70005', 6.757336, 80.504485, 1, 1, 1, NULL, NULL),
(1733, 23, 'Kuruwita', 'කුරුවිට', NULL, NULL, '70500', 6.7792, 80.3686, 1, 1, 1, NULL, NULL),
(1734, 23, 'Lellopitiya', 'ලෙල්ලොපිටිය', NULL, NULL, '70056', 6.655172, 80.471348, 1, 1, 1, NULL, NULL),
(1735, 23, 'Imaduwa', 'ඉමදූව', NULL, NULL, '80130', 6.7361, 80.4354, 1, 1, 1, NULL, NULL),
(1736, 23, 'Imbulpe', 'ඉඹුල්පේ', NULL, NULL, '70134', 6.7159, 80.6375, 1, 1, 1, NULL, NULL),
(1737, 23, 'Mahagama Colony', 'මහගම ජනපදය', NULL, NULL, '70256', 6.3406, 80.7804, 1, 1, 1, NULL, NULL),
(1738, 23, 'Mahawalatenna', 'මහාවලතැන්න', NULL, NULL, '70112', 6.5833, 80.75, 1, 1, 1, NULL, NULL),
(1739, 23, 'Makandura', 'මාකඳුර', NULL, NULL, '70298', 6.5333, 80.6, 1, 1, 1, NULL, NULL),
(1740, 23, 'Malwala Junction', 'මල්වල හන්දිය', NULL, NULL, '70001', 6.7, 80.4333, 1, 1, 1, NULL, NULL),
(1741, 23, 'Malwatta', 'මල්වත්ත', NULL, NULL, '32198', 6.65, 80.4167, 1, 1, 1, NULL, NULL),
(1742, 23, 'Matuwagalagama', 'මතුවාගලගම', NULL, NULL, '70482', 6.7667, 80.2333, 1, 1, 1, NULL, NULL),
(1743, 23, 'Medagalature', 'මැදගලතුරේ', NULL, NULL, '70021', 6.6414, 80.2882, 1, 1, 1, NULL, NULL),
(1744, 23, 'Meddekanda', 'මැද්දෙකන්ද', NULL, NULL, '70127', 6.6833, 80.6833, 1, 1, 1, NULL, NULL),
(1745, 23, 'Minipura Dumbara', 'මිණිපුර දුම්බර', NULL, NULL, '70494', 6.5687, 80.363, 1, 1, 1, NULL, NULL),
(1746, 23, 'Mitipola', 'මිටිපොල', NULL, NULL, '70604', 6.836923, 80.221949, 1, 1, 1, NULL, NULL),
(1747, 23, 'Moragala Kirillapone', 'මොරගල කිරිල්ලපොන', NULL, NULL, '81532', 6.8333, 80.3, 1, 1, 1, NULL, NULL),
(1748, 23, 'Morahela', 'මොරහැල', NULL, NULL, '70129', 6.679967, 80.691531, 1, 1, 1, NULL, NULL),
(1749, 23, 'Mulendiyawala', 'මුල්ඇඩියාවල', NULL, NULL, '70212', 6.291657, 80.760239, 1, 1, 1, NULL, NULL),
(1750, 23, 'Mulgama', 'මුල්ගම', NULL, NULL, '70117', 6.645942, 80.817832, 1, 1, 1, NULL, NULL),
(1751, 23, 'Nawalakanda', 'නාවලකන්ද', NULL, NULL, '70469', 6.5167, 80.3333, 1, 1, 1, NULL, NULL),
(1752, 23, 'Nawinnapinnakanda', 'නාවින්නපින්නකන්ඳ', NULL, NULL, '70165', 6.7168, 80.4999, 1, 1, 1, NULL, NULL),
(1753, 23, 'Niralagama', 'නිරලගම', NULL, NULL, '70038', 6.65, 80.3667, 1, 1, 1, NULL, NULL),
(1754, 23, 'Nivitigala', 'නිවිතිගල', NULL, NULL, '70400', 6.6, 80.4553, 1, 1, 1, NULL, NULL),
(1755, 23, 'Omalpe', 'ඕමල්පේ', NULL, NULL, '70215', 6.327391, 80.694691, 1, 1, 1, NULL, NULL),
(1756, 23, 'Opanayaka', 'ඕපනායක', NULL, NULL, '70080', 6.608359, 80.625134, 1, 1, 1, NULL, NULL),
(1757, 23, 'Padalangala', 'පදලංගල', NULL, NULL, '70230', 6.244961, 80.916029, 1, 1, 1, NULL, NULL),
(1758, 23, 'Pallebedda', 'පල්ලෙබැද්ද', NULL, NULL, '70170', 6.45, 80.7333, 1, 1, 1, NULL, NULL),
(1759, 23, 'Pallekanda', 'පල්ලෙකන්ද', NULL, NULL, '82454', 6.6333, 80.6667, 1, 1, 1, NULL, NULL),
(1760, 23, 'Pambagolla', 'පඹගොල්ල', NULL, NULL, '70133', 6.7333, 80.6833, 1, 1, 1, NULL, NULL),
(1761, 23, 'Panamura', 'පණාමුර', NULL, NULL, '70218', 6.351417, 80.776404, 1, 1, 1, NULL, NULL),
(1762, 23, 'Panapola', 'පනාපොළ', NULL, NULL, '70461', 6.425337, 80.445421, 1, 1, 1, NULL, NULL),
(1763, 23, 'Paragala', 'පරගල', NULL, NULL, '81474', 6.601317, 80.343575, 1, 1, 1, NULL, NULL),
(1764, 23, 'Parakaduwa', 'පරකඩුව', NULL, NULL, '70550', 6.825482, 80.299049, 1, 1, 1, NULL, NULL),
(1765, 23, 'Pebotuwa', 'පෙබොටුව', NULL, NULL, '70045', 6.540192, 80.452191, 1, 1, 1, NULL, NULL),
(1766, 23, 'Pelmadulla', 'පැල්මඩුල්ල', NULL, NULL, '70070', 6.620071, 80.542243, 1, 1, 1, NULL, NULL),
(1767, 23, 'Pinnawala', 'පින්නවල', NULL, NULL, '70130', 6.731251, 80.672146, 1, 1, 1, NULL, NULL),
(1768, 23, 'Pothdeniya', 'පොත්දෙණිය', NULL, NULL, '81538', 6.8333, 80.3, 1, 1, 1, NULL, NULL),
(1769, 23, 'Rajawaka', 'රජවක', NULL, NULL, '70116', 6.609347, 80.797987, 1, 1, 1, NULL, NULL),
(1770, 23, 'Ranwala', 'රන්වල', NULL, NULL, '70162', 6.553121, 80.665495, 1, 1, 1, NULL, NULL),
(1771, 23, 'Rassagala', 'රාස්සගල', NULL, NULL, '70135', 6.695227, 80.617304, 1, 1, 1, NULL, NULL),
(1772, 23, 'Rathgama', 'රත්ගම', NULL, NULL, '80260', 6.7333, 80.4833, 1, 1, 1, NULL, NULL),
(1773, 23, 'Ratna Hangamuwa', 'රත්න හංගමුව', NULL, NULL, '70036', 6.65, 80.3667, 1, 1, 1, NULL, NULL),
(1774, 23, 'Ratnapura', 'රත්නපුර', NULL, NULL, '70000', 6.677603, 80.405592, 1, 1, 1, NULL, NULL),
(1775, 23, 'Sewanagala', 'සෙවණගල', NULL, NULL, '70250', 6.3406, 80.7804, 1, 1, 1, NULL, NULL),
(1776, 23, 'Sri Palabaddala', 'ශ්‍රී පලාබද්දල', NULL, NULL, '70004', 6.800198, 80.476202, 1, 1, 1, NULL, NULL),
(1777, 23, 'Sudagala', 'සුදාගල', NULL, NULL, '70502', 6.7833, 80.4, 1, 1, 1, NULL, NULL),
(1778, 23, 'Thalakolahinna', 'තලකොළහින්න', NULL, NULL, '70101', 6.5844, 80.7332, 1, 1, 1, NULL, NULL),
(1779, 23, 'Thanjantenna', 'තන්ජන්තැන්න', NULL, NULL, '70118', 6.6361, 80.8536, 1, 1, 1, NULL, NULL),
(1780, 23, 'Theppanawa', 'තෙප්පනාව', NULL, NULL, '70512', 6.75, 80.3167, 1, 1, 1, NULL, NULL),
(1781, 23, 'Thunkama', 'තුංකම', NULL, NULL, '70205', 6.2833, 80.8833, 1, 1, 1, NULL, NULL),
(1782, 23, 'Udakarawita', 'උඩකරවිට', NULL, NULL, '70044', 6.7317, 80.4287, 1, 1, 1, NULL, NULL),
(1783, 23, 'Udaniriella', 'උඩනිරිඇල්ල', NULL, NULL, '70034', 6.65, 80.3667, 1, 1, 1, NULL, NULL),
(1784, 23, 'Udawalawe', 'උඩවලවේ', NULL, NULL, '70190', 6.7516, 80.5927, 1, 1, 1, NULL, NULL),
(1785, 23, 'Ullinduwawa', 'උල්ලිඳුවාව', NULL, NULL, '70345', 6.367322, 80.631196, 1, 1, 1, NULL, NULL),
(1786, 23, 'Veddagala', 'වැද්දාගල', NULL, NULL, '70459', 6.45, 80.4333, 1, 1, 1, NULL, NULL),
(1787, 23, 'Vijeriya', 'විජේරිය', NULL, NULL, '70348', 6.4, 80.6333, 1, 1, 1, NULL, NULL),
(1788, 23, 'Waleboda', 'වලේබොඩ', NULL, NULL, '70138', 6.726367, 80.64106, 1, 1, 1, NULL, NULL),
(1789, 23, 'Watapotha', 'වටාපොත', NULL, NULL, '70408', 6.577958, 80.510709, 1, 1, 1, NULL, NULL),
(1790, 23, 'Waturawa', 'වටුරාව', NULL, NULL, '70456', 6.4833, 80.4333, 1, 1, 1, NULL, NULL),
(1791, 23, 'Weligepola', 'වැලිගෙපොල', NULL, NULL, '70104', 6.567212, 80.707078, 1, 1, 1, NULL, NULL),
(1792, 23, 'Welipathayaya', 'වැලිපතයාය', NULL, NULL, '70124', 6.6833, 80.6833, 1, 1, 1, NULL, NULL),
(1793, 23, 'Wikiliya', 'විකිලිය', NULL, NULL, '70114', 6.6203, 80.7467, 1, 1, 1, NULL, NULL),
(1794, 24, 'Agbopura', 'අග්බෝපුර', NULL, NULL, '31304', 8.330575, 80.97191, 1, 1, 1, NULL, NULL),
(1795, 24, 'Buckmigama', 'බක්මීගම', NULL, NULL, '31028', 8.6667, 80.95, 1, 1, 1, NULL, NULL),
(1796, 24, 'China Bay', 'චීන වරාය', NULL, NULL, '31050', 8.561664, 81.187386, 1, 1, 1, NULL, NULL),
(1797, 24, 'Dehiwatte', 'දෙහිවත්ත', NULL, NULL, '31226', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1798, 24, 'Echchilampattai', 'එච්චිලම්පට්ටෙයි', NULL, NULL, '31236', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1799, 24, 'Galmetiyawa', 'ගල්මැටියාව', NULL, NULL, '31318', 8.3683, 81.0281, 1, 1, 1, NULL, NULL),
(1800, 24, 'Gomarankadawala', 'ගෝමරන්කඩවල', NULL, NULL, '31026', 8.677731, 80.960417, 1, 1, 1, NULL, NULL),
(1801, 24, 'Kaddaiparichchan', 'කඩ්ඩයිපරිච්චන්', NULL, NULL, '31212', 8.459198, 81.278164, 1, 1, 1, NULL, NULL),
(1802, 24, 'Kallar', 'කල්ලාර්', NULL, NULL, '30250', 8.2833, 81.2667, 1, 1, 1, NULL, NULL),
(1803, 24, 'Kanniya', 'කන්නියා', NULL, NULL, '31032', 8.6333, 81.0167, 1, 1, 1, NULL, NULL),
(1804, 24, 'Kantalai', 'කන්තලේ', NULL, NULL, '31300', 8.365483, 80.966897, 1, 1, 1, NULL, NULL),
(1805, 24, 'Kantalai Sugar Factory', 'කන්තලේ සීනි කර්මාන්ත ශාලාව', NULL, NULL, '31306', 8.3683, 81.0281, 1, 1, 1, NULL, NULL),
(1806, 24, 'Kiliveddy', 'කිලිවෙද්දී', NULL, NULL, '31220', 8.354092, 81.275605, 1, 1, 1, NULL, NULL),
(1807, 24, 'Kinniya', 'කින්නියා', NULL, NULL, '31100', 8.497717, 81.179214, 1, 1, 1, NULL, NULL),
(1808, 24, 'Kuchchaveli', 'කුච්චවේලි', NULL, NULL, '31014', 8.792709, 81.036113, 1, 1, 1, NULL, NULL),
(1809, 24, 'Kumburupiddy', 'කුඹුරුපිද්දී', NULL, NULL, '31012', 8.7333, 81.15, 1, 1, 1, NULL, NULL),
(1810, 24, 'Kurinchakemy', 'කුරින්චකෙමි', NULL, NULL, '31112', 8.4989, 81.1897, 1, 1, 1, NULL, NULL),
(1811, 24, 'Lankapatuna', 'ලංකාපටුන', NULL, NULL, '31234', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1812, 24, 'Mahadivulwewa', 'මහදිවුල්වැව', NULL, NULL, '31036', 8.613863, 80.9518, 1, 1, 1, NULL, NULL),
(1813, 24, 'Maharugiramam', 'මහරුගිරමං', NULL, NULL, '31106', 8.4989, 81.1897, 1, 1, 1, NULL, NULL),
(1814, 24, 'Mallikativu', 'මල්ලිකතිව්', NULL, NULL, '31224', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1815, 24, 'Mawadichenai', 'මාවඩ්චේන', NULL, NULL, '31238', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1816, 24, 'Mullipothana', 'මුල්ලිපොතන', NULL, NULL, '31312', 8.3683, 81.0281, 1, 1, 1, NULL, NULL),
(1817, 24, 'Mutur', 'මුතුර්', NULL, NULL, '31200', 8.45, 81.2667, 1, 1, 1, NULL, NULL),
(1818, 24, 'Neelapola', 'නීලපොල', NULL, NULL, '31228', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1819, 24, 'Nilaveli', 'නිලාවැලි', NULL, NULL, '31010', 8.658756, 81.148516, 1, 1, 1, NULL, NULL),
(1820, 24, 'Pankulam', 'පන්කුලම්', NULL, NULL, '31034', 8.6333, 81.0167, 1, 1, 1, NULL, NULL),
(1821, 24, 'Pulmoddai', 'පුල්මුඩේ', NULL, NULL, '50567', 8.9333, 80.9833, 1, 1, 1, NULL, NULL),
(1822, 24, 'Rottawewa', NULL, NULL, NULL, '31038', 8.6333, 81.0167, 1, 1, 1, NULL, NULL),
(1823, 24, 'Sampaltivu', 'සම්පල්ටිවූ', NULL, NULL, '31006', 8.6167, 81.2, 1, 1, 1, NULL, NULL),
(1824, 24, 'Sampoor', 'සාම්පූර්', NULL, NULL, '31216', 8.493354, 81.284828, 1, 1, 1, NULL, NULL),
(1825, 24, 'Serunuwara', 'සේනුවර', NULL, NULL, '31232', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1826, 24, 'Seruwila', 'සේරුවිල', NULL, NULL, '31260', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1827, 24, 'Sirajnagar', 'සිරජ්නගර්', NULL, NULL, '31314', 8.3683, 81.0281, 1, 1, 1, NULL, NULL),
(1828, 24, 'Somapura', 'සෝමපුර', NULL, NULL, '31222', 8.4458, 81.2875, 1, 1, 1, NULL, NULL),
(1829, 24, 'Tampalakamam', 'තම්පලකාමම්', NULL, NULL, '31046', 8.4925, 81.0964, 1, 1, 1, NULL, NULL),
(1830, 24, 'Thuraineelavanai', 'තුරෛනීලාවනයි', NULL, NULL, '30254', 8.2833, 81.2667, 1, 1, 1, NULL, NULL),
(1831, 24, 'Tiriyayi', 'තිරියයි', NULL, NULL, '31016', 8.7444, 81.15, 1, 1, 1, NULL, NULL),
(1832, 24, 'Toppur', 'තොප්පුර්', NULL, NULL, '31250', 8.4, 81.3167, 1, 1, 1, NULL, NULL),
(1833, 24, 'Trincomalee', 'තිරිකුණාමලය', NULL, NULL, '31000', 8.5667, 81.2333, 1, 1, 1, NULL, NULL),
(1834, 24, 'Wanela', 'වනෙල', NULL, NULL, '31308', 8.3683, 81.0281, 1, 1, 1, NULL, NULL),
(1835, 25, 'Vavuniya', 'වව්නියාව', NULL, NULL, '43000', 8.758818, 80.493461, 1, 1, 1, NULL, NULL),
(1836, 5, 'Colombo 1', 'කොළඹ 1', 'கொழும்பு 1', 'Fort', '100', 6.925833, 79.841667, 1, 1, 1, NULL, NULL),
(1837, 5, 'Colombo 3', 'කොළඹ 3', 'கொழும்பு 3', 'Colpetty', '300', 6.900556, 79.853333, 1, 1, 1, NULL, NULL),
(1838, 5, 'Colombo 4', 'කොළඹ 4', 'கொழும்பு 4', 'Bambalapitiya', '400', 6.888889, 79.856667, 1, 1, 1, NULL, NULL),
(1839, 5, 'Colombo 5', 'කොළඹ 5', 'கொழும்பு 5', 'Havelock Town', '500', 6.879444, 79.865278, 1, 1, 1, NULL, NULL),
(1840, 5, 'Colombo 7', 'කොළඹ 7', 'கொழும்பு 7', 'Cinnamon Gardens', '700', 6.906667, 79.863333, 1, 1, 1, NULL, NULL),
(1841, 5, 'Colombo 9', 'කොළඹ 9', 'கொழும்பு 9', 'Dematagoda', '900', 6.93, 79.877778, 1, 1, 1, NULL, NULL),
(1842, 5, 'Colombo 10', 'කොළඹ 10', 'கொழும்பு 10', 'Maradana', '1000', 6.928333, 79.864167, 1, 1, 1, NULL, NULL),
(1843, 5, 'Colombo 11', 'කොළඹ 11', 'கொழும்பு 11', 'Pettah', '1100', 6.936667, 79.849722, 1, 1, 1, NULL, NULL),
(1844, 5, 'Colombo 12', 'කොළඹ 12', 'கொழும்பு 12', 'Hulftsdorp', '1200', 6.9425, 79.858333, 1, 1, 1, NULL, NULL),
(1845, 5, 'Colombo 14', 'කොළඹ 14', 'கொழும்பு 14', 'Grandpass', '1400', 6.9475, 79.874722, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `province_id` int(11) DEFAULT NULL,
  `name_en` varchar(64) DEFAULT NULL,
  `name_si` varchar(64) DEFAULT NULL,
  `name_ta` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `province_id`, `name_en`, `name_si`, `name_ta`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 6, 'Ampara', 'අම්පාර', 'அம்பாறை', NULL, 1, NULL, NULL, NULL, NULL),
(2, 8, 'Anuradhapura', 'අනුරාධපුරය', 'அனுராதபுரம்', NULL, 1, NULL, NULL, NULL, NULL),
(3, 7, 'Badulla', 'බදුල්ල', 'பதுளை', NULL, 1, NULL, NULL, NULL, NULL),
(4, 6, 'Batticaloa', 'මඩකලපුව', 'மட்டக்களப்பு', NULL, 1, NULL, NULL, NULL, NULL),
(5, 1, 'Colombo', 'කොළඹ', 'கொழும்பு', NULL, 1, NULL, NULL, NULL, NULL),
(6, 3, 'Galle', 'ගාල්ල', 'காலி', NULL, 1, NULL, NULL, NULL, NULL),
(7, 1, 'Gampaha', 'ගම්පහ', 'கம்பஹா', NULL, 1, NULL, NULL, NULL, NULL),
(8, 3, 'Hambantota', 'හම්බන්තොට', 'அம்பாந்தோட்டை', NULL, 1, NULL, NULL, NULL, NULL),
(9, 9, 'Jaffna', 'යාපනය', 'யாழ்ப்பாணம்', NULL, 1, NULL, NULL, NULL, NULL),
(10, 1, 'Kalutara', 'කළුතර', 'களுத்துறை', NULL, 1, NULL, NULL, NULL, NULL),
(11, 2, 'Kandy', 'මහනුවර', 'கண்டி', NULL, 1, NULL, NULL, NULL, NULL),
(12, 5, 'Kegalle', 'කෑගල්ල', 'கேகாலை', NULL, 1, NULL, NULL, NULL, NULL),
(13, 9, 'Kilinochchi', 'කිලිනොච්චිය', 'கிளிநொச்சி', NULL, 1, NULL, NULL, NULL, NULL),
(14, 4, 'Kurunegala', 'කුරුණෑගල', 'குருணாகல்', NULL, 1, NULL, NULL, NULL, NULL),
(15, 9, 'Mannar', 'මන්නාරම', 'மன்னார்', NULL, 1, NULL, NULL, NULL, NULL),
(16, 2, 'Matale', 'මාතලේ', 'மாத்தளை', NULL, 1, NULL, NULL, NULL, NULL),
(17, 3, 'Matara', 'මාතර', 'மாத்தறை', NULL, 1, NULL, NULL, NULL, NULL),
(18, 7, 'Monaragala', 'මොණරාගල', 'மொணராகலை', NULL, 1, NULL, NULL, NULL, NULL),
(19, 9, 'Mullaitivu', 'මුලතිව්', 'முல்லைத்தீவு', NULL, 1, NULL, NULL, NULL, NULL),
(20, 2, 'Nuwara Eliya', 'නුවර එළිය', 'நுவரேலியா', NULL, 1, NULL, NULL, NULL, NULL),
(21, 8, 'Polonnaruwa', 'පොළොන්නරුව', 'பொலன்னறுவை', NULL, 1, NULL, NULL, NULL, NULL),
(22, 4, 'Puttalam', 'පුත්තලම', 'புத்தளம்', NULL, 1, NULL, NULL, NULL, NULL),
(23, 5, 'Ratnapura', 'රත්නපුර', 'இரத்தினபுரி', NULL, 1, NULL, NULL, NULL, NULL),
(24, 6, 'Trincomalee', 'ත්‍රිකුණාමලය', 'திருகோணமலை', NULL, 1, NULL, NULL, NULL, NULL),
(25, 9, 'Vavuniya', 'වව්නියාව', 'வவுனியா', NULL, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `slmc` int(11) DEFAULT NULL,
  `slmc_card_proof_location` varchar(512) DEFAULT NULL,
  `specialisation_1` int(11) DEFAULT NULL,
  `specialisation_2` int(11) DEFAULT NULL,
  `titles` varchar(64) DEFAULT NULL,
  `degrees` varchar(256) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `slmc`, `slmc_card_proof_location`, `specialisation_1`, `specialisation_2`, `titles`, `degrees`, `approved_by`, `approved_at`) VALUES
(3, 999, '', 1, 2, 'DR', 'MBBS, MD', 1, '2020-10-30 21:17:23'),
(7, 555, NULL, 4, 3, 'DR', 'BDS', 0, '2020-12-02 11:58:01'),
(19, 1000, 'SLFsxgpo1Um4KMGR9rf2GzfvtpNmUz.jpg', 4, 3, 'Dr', 'MD, MBBS', 4, '2021-03-27 09:53:49');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_availability`
--

CREATE TABLE `doctor_availability` (
  `id` int(11) NOT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `max_count` int(11) DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `payment` float DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_availability`
--

INSERT INTO `doctor_availability` (`id`, `doctor_id`, `hospital_id`, `date`, `start_time`, `end_time`, `max_count`, `count`, `payment`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 3, 1, '2021-03-26', '08:00:00', '10:00:00', 20, 7, 1000, 1, '2020-11-19 12:43:29', '2020-11-19 12:43:29', 4, 4),
(2, 3, 1, '2021-01-02', '13:00:00', '14:00:00', 20, 0, 1500, 1, '2020-12-02 12:01:09', '2020-12-02 12:01:09', 4, 4),
(3, 3, 1, '2021-03-28', '19:00:00', '21:00:00', 20, 1, 1500, 1, '2020-12-02 12:01:09', '2020-12-02 12:01:09', 4, 4),
(4, 7, 1, '2020-12-03', '12:00:00', '14:00:00', 10, 1, 2000, 1, '2020-12-02 12:04:24', '2020-12-02 12:04:24', 4, 4),
(5, 3, 1, '2021-03-29', '20:20:00', '22:20:00', 20, 0, 600, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_hospital`
--

CREATE TABLE `doctor_hospital` (
  `doctor_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_hospital`
--

INSERT INTO `doctor_hospital` (`doctor_id`, `hospital_id`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 1, 999, 'Demo', 1, '2020-10-30 21:24:32', '2020-10-30 21:24:35', 1, 1),
(7, 1, 75473, 'dental', 1, '2020-12-02 11:59:58', '2020-12-02 11:59:58', 4, 4),
(19, 1, 1000, 'ENT', 1, '2021-03-27 09:55:51', '2021-03-27 09:55:58', 4, 4);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_reviews`
--

CREATE TABLE `doctor_reviews` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `approved_at` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_reviews`
--

INSERT INTO `doctor_reviews` (`id`, `patient_id`, `doctor_id`, `rating`, `description`, `status`, `approved_at`, `approved_by`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 13, 3, 4, 'bleh', 1, NULL, NULL, '2021-03-27 14:27:57', '2021-03-27 14:27:57', 13, 13),
(2, 13, 3, 3, 'kkk', 1, NULL, NULL, '2021-03-27 14:28:07', '2021-03-27 14:28:07', 13, 13),
(3, 13, 3, 1, 'mmmmm', 1, NULL, NULL, '2021-03-27 14:28:13', '2021-03-27 14:28:13', 13, 13),
(4, 13, 3, 4, 'oooo', 1, NULL, NULL, '2021-03-27 14:28:20', '2021-03-27 14:28:20', 13, 13),
(5, 13, 3, 5, 'lll', 1, NULL, NULL, '2021-03-27 14:28:27', '2021-03-27 14:28:27', 13, 13),
(6, 13, 3, 4, 'mmm', 1, NULL, NULL, '2021-03-27 14:28:34', '2021-03-27 14:28:34', 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `doctor_specialisation`
--

CREATE TABLE `doctor_specialisation` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctor_specialisation`
--

INSERT INTO `doctor_specialisation` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Cardiology Surgeon', 'Heart', 1, '2020-10-30 21:13:12', '2020-10-30 21:13:16', 1, 1),
(2, 'Cardiology Physician', 'Heart', 1, '2020-10-30 21:13:12', '2020-10-30 21:13:16', 1, 1),
(3, 'ENT Surgeon', 'ENT', 1, '2020-10-30 21:13:12', '2020-10-30 21:13:16', 1, 1),
(4, 'ENT Physician', 'ENT', 1, '2020-10-30 21:13:12', '2020-10-30 21:13:16', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_activation`
--

CREATE TABLE `email_activation` (
  `id` int(11) NOT NULL,
  `email` varchar(90) NOT NULL,
  `token` varchar(30) NOT NULL,
  `ack` int(11) NOT NULL,
  `dateTime` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_activation`
--

INSERT INTO `email_activation` (`id`, `email`, `token`, `ack`, `dateTime`) VALUES
(1, 'uvininduwaraperera@gmail.com', 'znCKn83DuIl3OjuWxL', 1, '2021-03-21 15:46:18');

-- --------------------------------------------------------

--
-- Table structure for table `hospitals`
--

CREATE TABLE `hospitals` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `license_number` int(11) DEFAULT NULL,
  `license_proof_location` varchar(512) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `director_id_proof_location` varchar(512) DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  `display_pic_path` varchar(256) DEFAULT NULL,
  `land_number` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `longitude` float(11,8) DEFAULT NULL,
  `latitude` double(10,8) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `license_number`, `license_proof_location`, `director_id`, `director_id_proof_location`, `display_name`, `display_pic_path`, `land_number`, `fax`, `email`, `address_1`, `address_2`, `city`, `longitude`, `latitude`, `description`, `status`, `last_login`, `last_login_by`, `created_at`, `updated_at`, `created_by`, `updated_by`, `approved_by`, `approved_at`) VALUES
(1, 'Medihub Hospital', 999, NULL, 3, NULL, 'MH Hospital', NULL, NULL, NULL, 'medihub@gmail.com', NULL, NULL, 1, NULL, NULL, 'Owners', 1, '2020-10-30 21:20:14', 4, '2020-10-30 21:22:01', '2020-10-30 21:22:04', 1, 1, 1, '2020-10-30 21:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_admins`
--

CREATE TABLE `hospital_admins` (
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `privilege` int(11) NOT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hospital_admins`
--

INSERT INTO `hospital_admins` (`user_id`, `hospital_id`, `privilege`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 1, 1, 999, 'Demo', 1, '2020-10-30 21:27:28', '2020-10-30 21:27:30', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hospital_reviews`
--

CREATE TABLE `hospital_reviews` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `approved_at` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `intervals`
--

CREATE TABLE `intervals` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `times_per_day` double DEFAULT NULL,
  `meal_preference` int(11) DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `interval_times`
--

CREATE TABLE `interval_times` (
  `id` int(11) NOT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `channelling_id` int(11) DEFAULT NULL,
  `path` varchar(256) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `medication_reminders`
--

CREATE TABLE `medication_reminders` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  `through_mail` tinyint(1) DEFAULT NULL,
  `through_sms` tinyint(1) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `medication_reminders`
--

INSERT INTO `medication_reminders` (`id`, `prescription_id`, `duration`, `through_mail`, `through_sms`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 7, 1, 1, 'Drink everyday', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `from_id` int(11) DEFAULT NULL,
  `to_id` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `file_path` varchar(512) DEFAULT NULL,
  `absolute_path` varchar(255) NOT NULL,
  `description` varchar(256) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `file_path`, `absolute_path`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'final.pdf', '', '', 1, '2021-03-20 19:29:46', '2021-03-21 17:13:38', 13, 13),
(2, 2, '2018cs040.pdf', '', 'Online Store for Young girls', 1, '2021-03-20 23:06:02', '2021-03-20 23:06:02', 13, NULL),
(16, 17, 'Lecture-1.pdf', '4SMWy8e5MCkr1SRXQKnJaVEod6nJ5c.pdf', 'ok', 1, '2021-03-24 12:42:09', '2021-03-25 15:03:37', 13, 13);

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` int(11) NOT NULL,
  `pharmacy_order_id` int(11) DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `payment_method` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `order_refunds`
--

CREATE TABLE `order_refunds` (
  `id` int(11) NOT NULL,
  `pharmacy_order_id` int(11) DEFAULT NULL,
  `refund_amount` float DEFAULT NULL,
  `refund_method` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset`
--

CREATE TABLE `password_reset` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `ack` int(11) NOT NULL DEFAULT 0,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `password_reset`
--

INSERT INTO `password_reset` (`id`, `email`, `token`, `ack`, `time`) VALUES
(1, 'uvininduwaraperera@gmail.com', 'Cy9Nz2FHlM5KUIhsSC', 1, '2021-03-22 16:20:57'),
(2, 'uvininduwaraperera@gmail.com', 'SMuBVFE18iFQ6Jr0L5', 1, '2021-03-25 09:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `name`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Cash', NULL, 1, '2020-11-19 15:01:52', '2020-11-19 15:01:52', 1, 1),
(2, 'Visa', NULL, 1, '2020-11-19 15:01:52', '2020-11-19 15:01:52', 1, 1),
(3, 'Master Card', NULL, 1, '2020-11-19 15:03:01', '2020-11-19 15:03:01', 1, 1),
(4, 'Pay Here', NULL, 1, '2020-11-19 15:03:01', '2020-11-19 15:03:01', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `license_number` int(11) DEFAULT NULL,
  `license_proof_location` varchar(512) DEFAULT NULL,
  `pharmacist_id` int(11) DEFAULT NULL,
  `pharmacist_id_proof_location` varchar(512) DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  `display_pic_path` varchar(256) DEFAULT NULL,
  `land_number` varchar(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `longitude` float(11,8) DEFAULT NULL,
  `latitude` double(10,8) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `last_login_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `approved_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `name`, `license_number`, `license_proof_location`, `pharmacist_id`, `pharmacist_id_proof_location`, `display_name`, `display_pic_path`, `land_number`, `fax`, `email`, `address_1`, `address_2`, `city`, `longitude`, `latitude`, `description`, `status`, `last_login`, `last_login_by`, `created_at`, `updated_at`, `created_by`, `updated_by`, `approved_by`, `approved_at`) VALUES
(1, 'Medihub Pharmacy', 999, NULL, 11, NULL, 'MH Pharmacy', NULL, NULL, NULL, 'medihub@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, 1, '2020-10-30 21:33:43', 5, '2020-10-30 21:33:51', '2020-10-30 21:33:55', 1, 1, 1, '2020-10-30 21:34:06'),
(2, 'qwerty', 123, NULL, NULL, NULL, 'qwerty', NULL, '0112736453', '0119829387', 'hi@bye.com', '04,kirula rd', 'colo', 340, NULL, NULL, 'qwerty', 1, NULL, NULL, '2020-12-01 15:26:07', '2020-12-01 15:26:07', 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_admins`
--

CREATE TABLE `pharmacy_admins` (
  `user_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `privilege` int(11) NOT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy_admins`
--

INSERT INTO `pharmacy_admins` (`user_id`, `pharmacy_id`, `privilege`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(11, 1, 1, 999, 'Demo', 1, '2020-10-30 21:32:12', '2020-10-30 21:32:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_orders`
--

CREATE TABLE `pharmacy_orders` (
  `id` int(11) NOT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `expected_delivery_date` datetime DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pharmacy_orders`
--

INSERT INTO `pharmacy_orders` (`id`, `pharmacy_id`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`, `expected_delivery_date`, `order_status`) VALUES
(1, 1, '', 1, '2021-03-20 19:29:46', '2021-03-21 17:13:38', 10, 10, '2021-03-07 00:00:00', NULL),
(2, 1, NULL, 1, '2021-03-20 23:06:02', '2021-03-20 23:06:02', 10, NULL, '2021-03-10 00:00:00', 'Pending'),
(17, 1, NULL, 1, '2021-03-24 12:42:09', '2021-03-25 15:03:37', 13, 13, '2021-03-26 00:00:00', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_reviews`
--

CREATE TABLE `pharmacy_reviews` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `approved_at` int(11) DEFAULT NULL,
  `approved_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `prescriptions`
--

CREATE TABLE `prescriptions` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescriptions`
--

INSERT INTO `prescriptions` (`id`, `channeling_id`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 30, 1, '2021-03-23 12:12:38', '2021-03-23 12:12:38', 0, 0),
(2, 33, 1, NULL, NULL, NULL, NULL),
(3, 33, 1, NULL, NULL, NULL, NULL),
(4, 33, 1, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `generic_name` varchar(128) DEFAULT NULL,
  `trade_name` varchar(128) DEFAULT NULL,
  `dosage` varchar(255) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `meal_preference` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `prescription_items`
--

INSERT INTO `prescription_items` (`id`, `prescription_id`, `generic_name`, `trade_name`, `dosage`, `interval_id`, `meal_preference`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 1, 'Paracetomol', 'Panadol', '2', 3, NULL, 1, '2021-03-23 12:17:30', '2021-03-23 12:17:30', 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `name_en` varchar(64) DEFAULT NULL,
  `name_si` varchar(64) DEFAULT NULL,
  `name_ta` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name_en`, `name_si`, `name_ta`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Western', 'බස්නාහිර', 'மேல்', NULL, 1, 1, 1, NULL, NULL),
(2, 'Central', 'මධ්‍යම', 'மத்திய', NULL, 1, 1, 1, NULL, NULL),
(3, 'Southern', 'දකුණු', 'தென்', NULL, 1, 1, 1, NULL, NULL),
(4, 'North Western', 'වයඹ', 'வட மேல்', NULL, 1, 1, 1, NULL, NULL),
(5, 'Sabaragamuwa', 'සබරගමුව', 'சபரகமுவ', NULL, 1, 1, 1, NULL, NULL),
(6, 'Eastern', 'නැගෙනහිර', 'கிழக்கு', NULL, 1, 1, 1, NULL, NULL),
(7, 'Uva', 'ඌව', 'ஊவா', NULL, 1, 1, 1, NULL, NULL),
(8, 'North Central', 'උතුරු මැද', 'வட மத்திய', NULL, 1, 1, 1, NULL, NULL),
(9, 'Northern', 'උතුරු', 'வட', NULL, 1, 1, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `record_premissions`
--

CREATE TABLE `record_premissions` (
  `doctor_id` int(11) NOT NULL,
  `record_id` int(11) NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  `profile_pic_path` varchar(256) DEFAULT NULL,
  `absolute_pp_path` varchar(255) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `mobile_number` varchar(11) DEFAULT NULL,
  `land_number` varchar(11) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `display_name`, `profile_pic_path`, `absolute_pp_path`, `email`, `password`, `user_type`, `nic`, `dob`, `gender`, `mobile_number`, `land_number`, `address_1`, `address_2`, `city`, `description`, `status`, `last_login`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Admin', NULL, 'Admin', NULL, '', 'admin@medihub.com', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 0, '000', '2020-08-13', 'M', NULL, NULL, '', '', 1, '', 1, '2020-10-30 21:00:56', '2020-10-30 21:01:06', '2020-10-30 21:01:09', NULL, NULL),
(2, 'Uvin', 'Perera', 'Uvin', NULL, '', 'uvin@gmial.com', '123', 1, '111', '2020-10-30', 'M', '1235744399', '', '08, Anderson Rd', 'Kalubowila', 118, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-12-21 06:43:22', 1, 2),
(3, 'Yashithi', 'Dharma', 'Yash', NULL, '', 'yash@gmial.com', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 2, '222', '2020-10-30', 'F', '0751234567', '0112345678', '33', 'Flower Road', 1, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(4, 'Aysha', 'Ifra', 'Aysha', NULL, '', 'aysha@gmial.com', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 3, '333', '2020-10-30', 'F', NULL, NULL, NULL, NULL, 1, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(5, 'Priyatharshan', 'Balachandran', 'Tharshan', NULL, '', 'tharshan@gmial.com', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 4, '666', '2020-10-30', 'M', NULL, NULL, NULL, NULL, 1, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(7, 'John', 'Doe', 'John', NULL, '', 'john@gmail.com', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 2, '837475847V', '1997-07-08', 'M', '772746374', '112847563', '01, 2nd cross street', 'qwerty', 1, NULL, 1, NULL, NULL, NULL, NULL, NULL),
(9, 'Jane', 'Doe', 'Jane', NULL, '', 'jane@gmail.com', 'Qwerty12345', 1, '837472847V', '1997-06-20', 'F', '767837499', '112847563', '01, 2nd cross street', 'qwerty', 376, NULL, 1, NULL, '2020-11-24 22:56:07', '2020-11-24 22:56:07', NULL, NULL),
(10, 'Yashithi', 'dharme', 'Yashsha', NULL, '', 'yashsha7@gmail.com', '77aae185203edc6357676db95caa25d0f398d402c1723e6a7b42cfe8d2967f2e', 1, '987380012v', '2021-03-16', 'F', '0755821611', '0112913950', 'No>90,1st cross street', '', 333, NULL, 1, NULL, '2021-03-17 14:18:42', '2021-03-17 14:18:42', NULL, NULL),
(11, 'Pharmacist', 'Dharmawimala', 'Pharmacy', NULL, '', 'pharmacy@gmail.com', 'c228f6a59b06a4b9f01dabdbc43f44208137cf2bca247938af3cfc0ea2c376d4', 4, '389358495', '2021-03-03', 'M', '0728018617', '0755821611', 'NO:18/8B, waragoda road, Kelaniya, Sri lanka', '', 1294, NULL, 1, NULL, '2021-03-18 18:08:24', '2021-03-21 11:58:47', NULL, 11),
(13, 'Uvin', 'Perera', 'UvinPerera', '03-the-joker-w1200-h630-1562679871.jpg', 'TZPMqhLlUvVwf6R1PnZngdRCFj5Z9D.jpg', 'uvininduwaraperera@gmail.com', 'aa43e6afbaa8c0670031ca2bb03de4edef9b32f45e505fbe3da30af4959c9a3f', 1, '981450965v', '2021-03-02', 'M', '0776089886', '0112724916', '10', 'Katukuruduwatta road', 118, NULL, 1, NULL, '2021-03-21 21:16:18', '2021-03-26 07:21:14', NULL, 13),
(19, 'Uvin', 'Perera', 'UPerera', NULL, NULL, '', '35f05f92f4e52217d47df7af1ece929b576a886f409f95dda09a5b1f5837f89e', 2, '', '2021-03-09', 'M', '0123456789', '9874561230', '10', 'Katukuruduwatta road', 118, NULL, 1, NULL, '2021-03-27 09:53:49', '2021-03-27 09:53:49', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channelling`
--
ALTER TABLE `channelling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_availability_id` (`doctor_availability_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `channelling_feedbacks`
--
ALTER TABLE `channelling_feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `channelling_payments`
--
ALTER TABLE `channelling_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channelling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `refund_method` (`payment_method`);

--
-- Indexes for table `channelling_refunds`
--
ALTER TABLE `channelling_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `refund_method` (`refund_method`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district` (`district_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `slmc` (`slmc`),
  ADD UNIQUE KEY `slmc_card_proof_location` (`slmc_card_proof_location`),
  ADD KEY `specialisation_1` (`specialisation_1`),
  ADD KEY `specialisation_2` (`specialisation_2`);

--
-- Indexes for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `doctor_hospital`
--
ALTER TABLE `doctor_hospital`
  ADD PRIMARY KEY (`doctor_id`,`hospital_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `doctor_reviews`
--
ALTER TABLE `doctor_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `approved_at` (`approved_at`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `doctor_specialisation`
--
ALTER TABLE `doctor_specialisation`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `email_activation`
--
ALTER TABLE `email_activation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `license_proof_location` (`license_proof_location`),
  ADD UNIQUE KEY `director_id_proof_location` (`director_id_proof_location`),
  ADD UNIQUE KEY `display_name` (`display_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `display_pic_path` (`display_pic_path`),
  ADD KEY `city` (`city`),
  ADD KEY `last_login_by` (`last_login_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `hospital_admins`
--
ALTER TABLE `hospital_admins`
  ADD PRIMARY KEY (`user_id`,`hospital_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `hospital_reviews`
--
ALTER TABLE `hospital_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `approved_at` (`approved_at`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `intervals`
--
ALTER TABLE `intervals`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `interval_times`
--
ALTER TABLE `interval_times`
  ADD PRIMARY KEY (`id`),
  ADD KEY `interval_id` (`interval_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `path` (`path`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `channelling_id` (`channelling_id`);

--
-- Indexes for table `medication_reminders`
--
ALTER TABLE `medication_reminders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `from_id` (`from_id`),
  ADD KEY `to_id` (`to_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_order_id` (`pharmacy_order_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `payment_method` (`payment_method`);

--
-- Indexes for table `order_refunds`
--
ALTER TABLE `order_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_order_id` (`pharmacy_order_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `refund_method` (`refund_method`);

--
-- Indexes for table `password_reset`
--
ALTER TABLE `password_reset`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD UNIQUE KEY `license_proof_location` (`license_proof_location`),
  ADD UNIQUE KEY `pharmacist_id_proof_location` (`pharmacist_id_proof_location`),
  ADD UNIQUE KEY `display_name` (`display_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `city` (`city`),
  ADD KEY `last_login_by` (`last_login_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`),
  ADD KEY `approved_by` (`approved_by`);

--
-- Indexes for table `pharmacy_admins`
--
ALTER TABLE `pharmacy_admins`
  ADD PRIMARY KEY (`user_id`,`pharmacy_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `pharmacy_orders`
--
ALTER TABLE `pharmacy_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `pharmacy_reviews`
--
ALTER TABLE `pharmacy_reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `hospital_id` (`pharmacy_id`),
  ADD KEY `approved_at` (`approved_at`),
  ADD KEY `approved_by` (`approved_by`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `interval_id` (`interval_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `provinces`
--
ALTER TABLE `provinces`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `record_premissions`
--
ALTER TABLE `record_premissions`
  ADD PRIMARY KEY (`doctor_id`,`record_id`),
  ADD KEY `record_id` (`record_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `display_name` (`display_name`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `nic` (`nic`),
  ADD UNIQUE KEY `mobile_number` (`mobile_number`),
  ADD KEY `city` (`city`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `channelling`
--
ALTER TABLE `channelling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `channelling_feedbacks`
--
ALTER TABLE `channelling_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channelling_payments`
--
ALTER TABLE `channelling_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `channelling_refunds`
--
ALTER TABLE `channelling_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3893;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_reviews`
--
ALTER TABLE `doctor_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctor_specialisation`
--
ALTER TABLE `doctor_specialisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `email_activation`
--
ALTER TABLE `email_activation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospitals`
--
ALTER TABLE `hospitals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hospital_reviews`
--
ALTER TABLE `hospital_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `intervals`
--
ALTER TABLE `intervals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `interval_times`
--
ALTER TABLE `interval_times`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medical_records`
--
ALTER TABLE `medical_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medication_reminders`
--
ALTER TABLE `medication_reminders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `order_payments`
--
ALTER TABLE `order_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_refunds`
--
ALTER TABLE `order_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `password_reset`
--
ALTER TABLE `password_reset`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pharmacy_orders`
--
ALTER TABLE `pharmacy_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pharmacy_reviews`
--
ALTER TABLE `pharmacy_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `prescription_items`
--
ALTER TABLE `prescription_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channelling`
--
ALTER TABLE `channelling`
  ADD CONSTRAINT `channelling_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channelling_ibfk_2` FOREIGN KEY (`doctor_availability_id`) REFERENCES `doctor_availability` (`id`),
  ADD CONSTRAINT `channelling_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channelling_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `channelling_feedbacks`
--
ALTER TABLE `channelling_feedbacks`
  ADD CONSTRAINT `channelling_feedbacks_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channelling` (`id`),
  ADD CONSTRAINT `channelling_feedbacks_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channelling_feedbacks_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `channelling_refunds`
--
ALTER TABLE `channelling_refunds`
  ADD CONSTRAINT `channelling_refunds_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channelling` (`id`),
  ADD CONSTRAINT `channelling_refunds_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channelling_refunds_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channelling_refunds_ibfk_4` FOREIGN KEY (`refund_method`) REFERENCES `payment_methods` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

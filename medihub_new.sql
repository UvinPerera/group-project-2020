-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Nov 16, 2020 at 07:54 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `privilege`) VALUES
(1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `channeling`
--

CREATE TABLE `channeling` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `doctor_availability_id` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channeling_feedbacks`
--

CREATE TABLE `channeling_feedbacks` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `doctor_feedback` varchar(2048) DEFAULT NULL,
  `patient_feedback` varchar(2048) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channeling_payments`
--

CREATE TABLE `channeling_payments` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `payment_amount` float DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `channeling_refunds`
--

CREATE TABLE `channeling_refunds` (
  `id` int(11) NOT NULL,
  `channeling_id` int(11) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `district` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `district`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Wellawatte', 'Colombo - 06', 1, 1, 1, '2020-10-30 21:04:30', '2020-10-30 21:04:35');

-- --------------------------------------------------------

--
-- Table structure for table `districts`
--

CREATE TABLE `districts` (
  `id` int(11) NOT NULL,
  `province` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `districts`
--

INSERT INTO `districts` (`id`, `province`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 1, 'Colombo', '', 1, 1, 1, '2020-10-30 21:02:35', '2020-10-30 21:02:37');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `slmc`, `slmc_card_proof_location`, `specialisation_1`, `specialisation_2`, `titles`, `degrees`, `approved_by`, `approved_at`) VALUES
(3, 999, '', 1, 2, 'MBBS,MD', 'MD', 1, '2020-10-30 21:17:23');

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
  `max_count` int(11) DEFAULT 0,
  `count` int(11) NOT NULL DEFAULT 0,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doctor_hospital`
--

INSERT INTO `doctor_hospital` (`doctor_id`, `hospital_id`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(3, 1, 999, 'Demo', 1, '2020-10-30 21:24:32', '2020-10-30 21:24:35', 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
-- Table structure for table `dump`
--

CREATE TABLE `dump` (
  `id` int(11) NOT NULL,
  `name` varchar(256) NOT NULL,
  `addr` varchar(256) NOT NULL,
  `tel` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dump`
--

INSERT INTO `dump` (`id`, `name`, `addr`, `tel`) VALUES
(1, 'sdfsfsdf', 'sfs', 'fsf');

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
  `land_number` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospitals`
--

INSERT INTO `hospitals` (`id`, `name`, `license_number`, `license_proof_location`, `director_id`, `director_id_proof_location`, `display_name`, `land_number`, `fax`, `email`, `address_1`, `address_2`, `city`, `longitude`, `latitude`, `description`, `status`, `last_login`, `last_login_by`, `created_at`, `updated_at`, `created_by`, `updated_by`, `approved_by`, `approved_at`) VALUES
(1, 'Medihub Hospital', 999, NULL, 3, NULL, 'MH Hospital', NULL, NULL, 'medihub@gmail.com', NULL, NULL, 1, NULL, NULL, 'Owners', 1, '2020-10-30 21:20:14', 4, '2020-10-30 21:22:01', '2020-10-30 21:22:04', 1, 1, 1, '2020-10-30 21:22:22');

-- --------------------------------------------------------

--
-- Table structure for table `hospital_admins`
--

CREATE TABLE `hospital_admins` (
  `user_id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hospital_admins`
--

INSERT INTO `hospital_admins` (`user_id`, `hospital_id`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(4, 1, 999, 'Demo', 1, '2020-10-30 21:27:28', '2020-10-30 21:27:30', 1, 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medical_records`
--

CREATE TABLE `medical_records` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `hospital_name` varchar(128) DEFAULT NULL,
  `doctor_id` int(11) DEFAULT NULL,
  `doctor_name` varchar(128) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `description` varchar(2048) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_payments`
--

CREATE TABLE `order_payments` (
  `id` int(11) NOT NULL,
  `pharmacy_order_id` int(11) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order_refunds`
--

CREATE TABLE `order_refunds` (
  `id` int(11) NOT NULL,
  `pharmacy_order_id` int(11) DEFAULT NULL,
  `payment_amount` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
  `land_number` int(11) DEFAULT NULL,
  `fax` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `name`, `license_number`, `license_proof_location`, `pharmacist_id`, `pharmacist_id_proof_location`, `display_name`, `land_number`, `fax`, `email`, `address_1`, `address_2`, `city`, `longitude`, `latitude`, `description`, `status`, `last_login`, `last_login_by`, `created_at`, `updated_at`, `created_by`, `updated_by`, `approved_by`, `approved_at`) VALUES
(1, 'Medihub Pharmacy', 999, NULL, 5, NULL, 'MH Pharmacy', NULL, NULL, 'medihub@gmail.com', NULL, NULL, 1, NULL, NULL, NULL, 1, '2020-10-30 21:33:43', 5, '2020-10-30 21:33:51', '2020-10-30 21:33:55', 1, 1, 1, '2020-10-30 21:34:06');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_admins`
--

CREATE TABLE `pharmacy_admins` (
  `user_id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `reference_number` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pharmacy_admins`
--

INSERT INTO `pharmacy_admins` (`user_id`, `pharmacy_id`, `reference_number`, `description`, `status`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(5, 1, 999, 'Demo', 1, '2020-10-30 21:32:12', '2020-10-30 21:32:14', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy_orders`
--

CREATE TABLE `pharmacy_orders` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `pharmacy_id` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `prescription_items`
--

CREATE TABLE `prescription_items` (
  `id` int(11) NOT NULL,
  `prescription_id` int(11) DEFAULT NULL,
  `generic_name` varchar(128) DEFAULT NULL,
  `trade_name` varchar(128) DEFAULT NULL,
  `dosage` int(11) DEFAULT NULL,
  `interval_id` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `provinces`
--

CREATE TABLE `provinces` (
  `id` int(11) NOT NULL,
  `name` varchar(64) DEFAULT NULL,
  `description` varchar(64) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `provinces`
--

INSERT INTO `provinces` (`id`, `name`, `description`, `status`, `created_by`, `updated_by`, `created_at`, `updated_at`) VALUES
(1, 'Western Province', '', 1, 1, 1, '2020-10-30 20:58:56', '2020-10-30 20:59:03');

-- --------------------------------------------------------

--
-- Table structure for table `record_categories`
--

CREATE TABLE `record_categories` (
  `id` int(11) NOT NULL,
  `name` varchar(128) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(64) DEFAULT NULL,
  `last_name` varchar(64) DEFAULT NULL,
  `display_name` varchar(64) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `nic` varchar(12) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `mobile_number` int(11) DEFAULT NULL,
  `land_number` int(11) DEFAULT NULL,
  `address_1` varchar(128) DEFAULT NULL,
  `address_2` varchar(128) DEFAULT NULL,
  `city` int(11) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `display_name`, `email`, `password`, `user_type`, `nic`, `dob`, `gender`, `mobile_number`, `land_number`, `address_1`, `address_2`, `city`, `zip_code`, `description`, `status`, `last_login`, `created_at`, `updated_at`, `created_by`, `updated_by`) VALUES
(1, 'Admin', NULL, 'Admin', 'admin@medihub.com', 'admin123', 0, '000', '2020-10-30', 'M', NULL, NULL, '', '', 1, NULL, '', 1, '2020-10-30 21:00:56', '2020-10-30 21:01:06', '2020-10-30 21:01:09', NULL, NULL),
(2, 'Uvin', 'Perera', 'Uvin', 'uvin@gmial.com', '123', 1, '111', '2020-10-30', 'M', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(3, 'Yashithi', 'Dharma', 'Yash', 'yash@gmial.com', '123', 2, '222', '2020-10-30', 'F', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(4, 'Aysha', 'Ifra', 'Aysha', 'aysha@gmial.com', '123', 3, '333', '2020-10-30', 'F', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1),
(5, 'Priyatharshan', 'Balachandran', 'Tharshan', 'tharshan@gmial.com', '123', 4, '666', '2020-10-30', 'M', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2020-10-30 21:08:44', '2020-10-30 21:08:47', '2020-10-30 21:08:50', 1, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `channeling`
--
ALTER TABLE `channeling`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `doctor_availability_id` (`doctor_availability_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `channeling_feedbacks`
--
ALTER TABLE `channeling_feedbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `channeling_payments`
--
ALTER TABLE `channeling_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `channeling_refunds`
--
ALTER TABLE `channeling_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channeling_id` (`channeling_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `district` (`district`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `districts`
--
ALTER TABLE `districts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `province` (`province`),
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
-- Indexes for table `dump`
--
ALTER TABLE `dump`
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
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `hospital_id` (`hospital_id`),
  ADD KEY `doctor_id` (`doctor_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

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
-- Indexes for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_order_id` (`pharmacy_order_id`),
  ADD KEY `created_by` (`created_by`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `order_refunds`
--
ALTER TABLE `order_refunds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_order_id` (`pharmacy_order_id`),
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
  ADD KEY `prescription_id` (`prescription_id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`),
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
-- Indexes for table `record_categories`
--
ALTER TABLE `record_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`),
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
-- AUTO_INCREMENT for table `channeling`
--
ALTER TABLE `channeling`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channeling_feedbacks`
--
ALTER TABLE `channeling_feedbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channeling_payments`
--
ALTER TABLE `channeling_payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `channeling_refunds`
--
ALTER TABLE `channeling_refunds`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `districts`
--
ALTER TABLE `districts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_reviews`
--
ALTER TABLE `doctor_reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doctor_specialisation`
--
ALTER TABLE `doctor_specialisation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `dump`
--
ALTER TABLE `dump`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pharmacy_orders`
--
ALTER TABLE `pharmacy_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescriptions`
--
ALTER TABLE `prescriptions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `prescription_items`
--
ALTER TABLE `prescription_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `provinces`
--
ALTER TABLE `provinces`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `record_categories`
--
ALTER TABLE `record_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admins`
--
ALTER TABLE `admins`
  ADD CONSTRAINT `admins_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Constraints for table `channeling`
--
ALTER TABLE `channeling`
  ADD CONSTRAINT `channeling_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channeling_ibfk_2` FOREIGN KEY (`doctor_availability_id`) REFERENCES `doctor_availability` (`id`),
  ADD CONSTRAINT `channeling_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channeling_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `channeling_feedbacks`
--
ALTER TABLE `channeling_feedbacks`
  ADD CONSTRAINT `channeling_feedbacks_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`),
  ADD CONSTRAINT `channeling_feedbacks_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channeling_feedbacks_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `channeling_payments`
--
ALTER TABLE `channeling_payments`
  ADD CONSTRAINT `channeling_payments_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`),
  ADD CONSTRAINT `channeling_payments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channeling_payments_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `channeling_refunds`
--
ALTER TABLE `channeling_refunds`
  ADD CONSTRAINT `channeling_refunds_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`),
  ADD CONSTRAINT `channeling_refunds_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `channeling_refunds_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`district`) REFERENCES `districts` (`id`),
  ADD CONSTRAINT `cities_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `cities_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `districts`
--
ALTER TABLE `districts`
  ADD CONSTRAINT `districts_ibfk_1` FOREIGN KEY (`province`) REFERENCES `provinces` (`id`),
  ADD CONSTRAINT `districts_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `districts_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`specialisation_1`) REFERENCES `doctor_specialisation` (`id`),
  ADD CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`specialisation_2`) REFERENCES `doctor_specialisation` (`id`);

--
-- Constraints for table `doctor_availability`
--
ALTER TABLE `doctor_availability`
  ADD CONSTRAINT `doctor_availability_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `doctor_availability_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`),
  ADD CONSTRAINT `doctor_availability_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_availability_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctor_hospital`
--
ALTER TABLE `doctor_hospital`
  ADD CONSTRAINT `doctor_hospital_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `doctor_hospital_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`),
  ADD CONSTRAINT `doctor_hospital_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_hospital_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctor_reviews`
--
ALTER TABLE `doctor_reviews`
  ADD CONSTRAINT `doctor_reviews_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_reviews_ibfk_2` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `doctor_reviews_ibfk_3` FOREIGN KEY (`approved_at`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_reviews_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_reviews_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_reviews_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `doctor_specialisation`
--
ALTER TABLE `doctor_specialisation`
  ADD CONSTRAINT `doctor_specialisation_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `doctor_specialisation_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `hospitals`
--
ALTER TABLE `hospitals`
  ADD CONSTRAINT `hospitals_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `hospitals_ibfk_4` FOREIGN KEY (`last_login_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospitals_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospitals_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospitals_ibfk_7` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `hospital_admins`
--
ALTER TABLE `hospital_admins`
  ADD CONSTRAINT `hospital_admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_admins_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`),
  ADD CONSTRAINT `hospital_admins_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_admins_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `hospital_reviews`
--
ALTER TABLE `hospital_reviews`
  ADD CONSTRAINT `hospital_reviews_ibfk_1` FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_reviews_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `hospital_reviews_ibfk_3` FOREIGN KEY (`approved_at`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_reviews_ibfk_4` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_reviews_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `hospital_reviews_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `intervals`
--
ALTER TABLE `intervals`
  ADD CONSTRAINT `intervals_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `intervals_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `interval_times`
--
ALTER TABLE `interval_times`
  ADD CONSTRAINT `interval_times_ibfk_1` FOREIGN KEY (`interval_id`) REFERENCES `intervals` (`id`),
  ADD CONSTRAINT `interval_times_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `interval_times_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `medical_records`
--
ALTER TABLE `medical_records`
  ADD CONSTRAINT `medical_records_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `record_categories` (`id`),
  ADD CONSTRAINT `medical_records_ibfk_2` FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`),
  ADD CONSTRAINT `medical_records_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `medical_records_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `medical_records_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `medication_reminders`
--
ALTER TABLE `medication_reminders`
  ADD CONSTRAINT `medication_reminders_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  ADD CONSTRAINT `medication_reminders_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `medication_reminders_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`from_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`to_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_payments`
--
ALTER TABLE `order_payments`
  ADD CONSTRAINT `order_payments_ibfk_1` FOREIGN KEY (`pharmacy_order_id`) REFERENCES `pharmacy_orders` (`id`),
  ADD CONSTRAINT `order_payments_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_payments_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_refunds`
--
ALTER TABLE `order_refunds`
  ADD CONSTRAINT `order_refunds_ibfk_1` FOREIGN KEY (`pharmacy_order_id`) REFERENCES `pharmacy_orders` (`id`),
  ADD CONSTRAINT `order_refunds_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_refunds_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD CONSTRAINT `pharmacies_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `pharmacies_ibfk_4` FOREIGN KEY (`last_login_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacies_ibfk_5` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacies_ibfk_6` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacies_ibfk_7` FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `pharmacy_admins`
--
ALTER TABLE `pharmacy_admins`
  ADD CONSTRAINT `pharmacy_admins_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacy_admins_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`),
  ADD CONSTRAINT `pharmacy_admins_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacy_admins_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `pharmacy_orders`
--
ALTER TABLE `pharmacy_orders`
  ADD CONSTRAINT `pharmacy_orders_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  ADD CONSTRAINT `pharmacy_orders_ibfk_2` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`),
  ADD CONSTRAINT `pharmacy_orders_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `pharmacy_orders_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `prescriptions`
--
ALTER TABLE `prescriptions`
  ADD CONSTRAINT `prescriptions_ibfk_1` FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_2` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `prescriptions_ibfk_3` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `prescription_items`
--
ALTER TABLE `prescription_items`
  ADD CONSTRAINT `prescription_items_ibfk_1` FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`),
  ADD CONSTRAINT `prescription_items_ibfk_2` FOREIGN KEY (`interval_id`) REFERENCES `intervals` (`id`),
  ADD CONSTRAINT `prescription_items_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `prescription_items_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `provinces`
--
ALTER TABLE `provinces`
  ADD CONSTRAINT `provinces_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `provinces_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `record_categories`
--
ALTER TABLE `record_categories`
  ADD CONSTRAINT `record_categories_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `record_categories_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `record_premissions`
--
ALTER TABLE `record_premissions`
  ADD CONSTRAINT `record_premissions_ibfk_1` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `record_premissions_ibfk_2` FOREIGN KEY (`record_id`) REFERENCES `medical_records` (`id`),
  ADD CONSTRAINT `record_premissions_ibfk_3` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `record_premissions_ibfk_4` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`city`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `users_ibfk_4` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `users_ibfk_5` FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

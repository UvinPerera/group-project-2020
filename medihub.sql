CREATE TABLE `provinces` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64),
  `description` varchar(64),
  `status` int,
  `created_by` int,
  `updated_by` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `districts` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `province` int,
  `name` varchar(64),
  `description` varchar(64),
  `status` int,
  `created_by` int,
  `updated_by` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `cities` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `district` int,
  `name` varchar(64),
  `description` varchar(64),
  `status` int,
  `created_by` int,
  `updated_by` int,
  `created_at` datetime,
  `updated_at` datetime
);

CREATE TABLE `users` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `first_name` varchar(64),
  `last_name` varchar(64),
  `display_name` varchar(64) UNIQUE,
  `email` varchar(128) UNIQUE,
  `password` varchar(128),
  `user_type` int,
  `nic` varchar(12) UNIQUE,
  `dob` date,
  `gender` char,
  `mobile_number` int(9) UNIQUE,
  `land_number` int(9),
  `address_1` varchar(128),
  `address_2` varchar(128),
  `city` int,
  `zip_code` int,
  `district` int,
  `province` int,
  `description` varchar(512),
  `status` int,
  `last_login` datetime,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `admins` (
  `id` int UNIQUE PRIMARY KEY,
  `privilege` int
);

CREATE TABLE `doctor_specialisation` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `doctors` (
  `id` int UNIQUE PRIMARY KEY,
  `slmc` int UNIQUE,
  `slmc_card_proof_location` varchar(512) UNIQUE,
  `specialisation_1` int,
  `specialisation_2` int,
  `titles` varchar(64),
  `degrees` varchar(256),
  `approved_by` int,
  `approved_at` datetime
);

CREATE TABLE `hospitals` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `license_number` int,
  `license_proof_location` varchar(512) UNIQUE,
  `director_id` int,
  `director_id_proof_location` varchar(512) UNIQUE,
  `display_name` varchar(64) UNIQUE,
  `land_number` int(9),
  `fax` int,
  `email` varchar(128) UNIQUE,
  `address_1` varchar(128),
  `address_2` varchar(128),
  `city` int,
  `district` int,
  `province` int,
  `longitude` float(11,8),
  `latitude` double(10,8),
  `description` varchar(512),
  `status` int,
  `last_login` datetime,
  `last_login_by` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  `approved_by` int,
  `approved_at` datetime
);

CREATE TABLE `pharmacies` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `license_number` int,
  `license_proof_location` varchar(512) UNIQUE,
  `pharmacist_id` int,
  `pharmacist_id_proof_location` varchar(512) UNIQUE,
  `display_name` varchar(64) UNIQUE,
  `land_number` int(9),
  `fax` int,
  `email` varchar(128) UNIQUE,
  `address_1` varchar(128),
  `address_2` varchar(128),
  `city` int,
  `district` int,
  `province` int,
  `longitude` float(11,8),
  `latitude` double(10,8),
  `description` varchar(512),
  `status` int,
  `last_login` datetime,
  `last_login_by` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  `approved_by` int,
  `approved_at` datetime
);

CREATE TABLE `doctor_hospital` (
  `doctor_id` int,
  `hospital_id` int,
  `reference_number` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  PRIMARY KEY (`doctor_id`, `hospital_id`)
);

CREATE TABLE `hospital_admins` (
  `user_id` int,
  `hospital_id` int,
  `reference_number` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  PRIMARY KEY (`user_id`, `hospital_id`)
);

CREATE TABLE `pharmacy_admins` (
  `user_id` int,
  `pharmacy_id` int,
  `reference_number` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  PRIMARY KEY (`user_id`, `pharmacy_id`)
);

CREATE TABLE `doctor_availability` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `doctor_id` int,
  `hospital_id` int,
  `date` date,
  `start_time` time,
  `end_time` time,
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `channeling` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `patient_id` int,
  `doctor_availability_id` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `channeling_payments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `channeling_id` int,
  `payment_amount` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `channeling_refunds` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `channeling_id` int,
  `payment_amount` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `channeling_feedbacks` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `channeling_id` int,
  `doctor_feedback` varchar(2048),
  `patient_feedback` varchar(2048),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `intervals` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(64) UNIQUE,
  `times_per_day` double,
  `meal_preference` int,
  `description` varchar(256),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `interval_times` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `interval_id` int,
  `time` time,
  `description` varchar(256),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `prescriptions` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `channeling_id` int,
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `prescription_items` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `prescription_id` int,
  `generic_name` varchar(128),
  `trade_name` varchar(128),
  `dosage` int,
  `interval_id` int,
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `pharmacy_orders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `prescription_id` int,
  `pharmacy_id` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `order_payments` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pharmacy_order_id` int,
  `payment_amount` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `order_refunds` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `pharmacy_order_id` int,
  `payment_amount` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `record_categories` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `medical_records` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `name` varchar(128) UNIQUE,
  `category_id` int,
  `hospital_id` int,
  `hospital_name` varchar(128),
  `doctor_id` int,
  `doctor_name` varchar(128),
  `date` date,
  `time` time,
  `description` varchar(2048),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `record_premissions` (
  `doctor_id` int,
  `record_id` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int,
  PRIMARY KEY (`doctor_id`, `record_id`)
);

CREATE TABLE `medication_reminders` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `prescription_id` int,
  `duration` int,
  `through_mail` boolean,
  `through_sms` boolean,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `notifications` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `from_id` int,
  `to_id` int,
  `description` varchar(512),
  `status` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `doctor_reviews` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `patient_id` int,
  `doctor_id` int,
  `rating` int,
  `description` varchar(512),
  `status` int,
  `approved_at` int,
  `approved_by` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

CREATE TABLE `hospital_reviews` (
  `id` int PRIMARY KEY AUTO_INCREMENT,
  `patient_id` int,
  `hospital_id` int,
  `rating` int,
  `description` varchar(512),
  `status` int,
  `approved_at` int,
  `approved_by` int,
  `created_at` datetime,
  `updated_at` datetime,
  `created_by` int,
  `updated_by` int
);

ALTER TABLE `provinces` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `provinces` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `districts` ADD FOREIGN KEY (`province`) REFERENCES `provinces` (`id`);

ALTER TABLE `districts` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `districts` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `cities` ADD FOREIGN KEY (`district`) REFERENCES `districts` (`id`);

ALTER TABLE `cities` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `cities` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`city`) REFERENCES `cities` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`district`) REFERENCES `districts` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`province`) REFERENCES `provinces` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `users` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `admins` ADD FOREIGN KEY (`id`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_specialisation` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_specialisation` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctors` ADD FOREIGN KEY (`id`) REFERENCES `users` (`id`);

ALTER TABLE `doctors` ADD FOREIGN KEY (`specialisation_1`) REFERENCES `doctor_specialisation` (`id`);

ALTER TABLE `doctors` ADD FOREIGN KEY (`specialisation_2`) REFERENCES `doctor_specialisation` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`city`) REFERENCES `cities` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`district`) REFERENCES `districts` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`province`) REFERENCES `provinces` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`last_login_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospitals` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`city`) REFERENCES `cities` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`district`) REFERENCES `districts` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`province`) REFERENCES `provinces` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`last_login_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacies` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_hospital` ADD FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `doctor_hospital` ADD FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`);

ALTER TABLE `doctor_hospital` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_hospital` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_admins` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_admins` ADD FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`);

ALTER TABLE `hospital_admins` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_admins` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacy_admins` ADD FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacy_admins` ADD FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`);

ALTER TABLE `pharmacy_admins` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacy_admins` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_availability` ADD FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `doctor_availability` ADD FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`);

ALTER TABLE `doctor_availability` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_availability` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling` ADD FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `channeling` ADD FOREIGN KEY (`doctor_availability_id`) REFERENCES `doctor_availability` (`id`);

ALTER TABLE `channeling` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_payments` ADD FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`);

ALTER TABLE `channeling_payments` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_payments` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_refunds` ADD FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`);

ALTER TABLE `channeling_refunds` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_refunds` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_feedbacks` ADD FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`);

ALTER TABLE `channeling_feedbacks` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `channeling_feedbacks` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `intervals` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `intervals` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `interval_times` ADD FOREIGN KEY (`interval_id`) REFERENCES `intervals` (`id`);

ALTER TABLE `interval_times` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `interval_times` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `prescriptions` ADD FOREIGN KEY (`channeling_id`) REFERENCES `channeling` (`id`);

ALTER TABLE `prescriptions` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `prescriptions` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `prescription_items` ADD FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);

ALTER TABLE `prescription_items` ADD FOREIGN KEY (`interval_id`) REFERENCES `intervals` (`id`);

ALTER TABLE `prescription_items` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `prescription_items` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacy_orders` ADD FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);

ALTER TABLE `pharmacy_orders` ADD FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`);

ALTER TABLE `pharmacy_orders` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `pharmacy_orders` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `order_payments` ADD FOREIGN KEY (`pharmacy_order_id`) REFERENCES `pharmacy_orders` (`id`);

ALTER TABLE `order_payments` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `order_payments` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `order_refunds` ADD FOREIGN KEY (`pharmacy_order_id`) REFERENCES `pharmacy_orders` (`id`);

ALTER TABLE `order_refunds` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `order_refunds` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `record_categories` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `record_categories` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `medical_records` ADD FOREIGN KEY (`category_id`) REFERENCES `record_categories` (`id`);

ALTER TABLE `medical_records` ADD FOREIGN KEY (`hospital_id`) REFERENCES `hospitals` (`id`);

ALTER TABLE `medical_records` ADD FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `medical_records` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `medical_records` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `record_premissions` ADD FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `record_premissions` ADD FOREIGN KEY (`record_id`) REFERENCES `medical_records` (`id`);

ALTER TABLE `record_premissions` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `record_premissions` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `medication_reminders` ADD FOREIGN KEY (`prescription_id`) REFERENCES `prescriptions` (`id`);

ALTER TABLE `medication_reminders` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `medication_reminders` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`from_id`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`to_id`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `notifications` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`approved_at`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `doctor_reviews` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`patient_id`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`hospital_id`) REFERENCES `doctors` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`approved_at`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`approved_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

ALTER TABLE `hospital_reviews` ADD FOREIGN KEY (`updated_by`) REFERENCES `users` (`id`);


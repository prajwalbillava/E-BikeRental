-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 09, 2023 at 07:30 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bikerental`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2017-06-18 12:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `card_number` int(16) NOT NULL,
  `name` varchar(50) NOT NULL,
  `expiry_date` int(11) NOT NULL,
  `cvv` int(11) NOT NULL,
  `total_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `card_number`, `name`, `expiry_date`, `cvv`, `total_amount`) VALUES
(10, 'afaan45@gmail.com', 6, '2023-05-10', '2023-05-13', 'Hi', 0, '2023-05-09 04:03:29', 44444444, 'Afaan', 4, 911, 400);

-- --------------------------------------------------------

--
-- Table structure for table `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'KTM', '2017-06-18 16:24:34', '2017-06-19 06:42:23'),
(3, 'Honda', '2017-06-18 16:25:03', NULL),
(4, 'Suzuki', '2017-06-18 16:25:13', NULL),
(5, 'Yamaha', '2017-06-18 16:25:24', NULL),
(8, 'TVS', '2023-04-12 00:41:47', NULL),
(9, 'Honda', '2023-04-12 00:42:04', NULL),
(10, 'Kawasaki', '2023-04-12 03:40:55', NULL),
(11, 'Royal Enfield', '2023-05-09 05:09:28', NULL),
(12, 'Bajaj', '2023-05-09 05:14:03', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'Ujjodi', 'bikclinic@gmail.com', '6366109927');

-- --------------------------------------------------------

--
-- Table structure for table `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'Afaan', 'mdafaan2002@gmail.com', '9886871968', 'Nice Bike I Took Once. Good Maintenance Had Been Done and Well Serviced.', '2023-04-12 01:18:56', 1),
(3, 'Sujan', 'sujanpanduranga@gmail.com', '01212121212', 'Sugoiiii Service desu', '2023-04-12 01:20:20', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '										<ul style=\"box-sizing: inherit; margin-top: 3em; margin-bottom: 3em; color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\"><li class=\"padding_bottom\" style=\"box-sizing: inherit; padding-bottom: 0.3333rem;\">The terms and conditions of Bike Clinic (Company) are the policies that govern the relationship between the Company and the User. These terms and conditions (as amended from time to time including all Schedules and Annexures hereto) shall constitute a legally valid and binding contract under the Applicable Laws and the use of any product Services either through Royal Brothers’ Website or Application (hereinafter referred to as App”) by the User shall be deemed to be an acceptance of all the terms and conditions set forth herein. Users are advised to read these terms and conditions carefully before using/registering on the Website/ App or availing Services through the same. Royal Brothers reserves the right to alter/modify/change these terms and conditions in its sole discretion, from time to time, with or without prior notice to the User. Notice of any changes shall be made by Bike Clinic, promptly and communicated/brought to the attention of the User in such manner as it deems fit.</li></ul>\r\n										'),
(2, 'Privacy Policy', 'privacy', '										<p style=\"box-sizing: inherit; color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\">Bike Clinic is a website(www.royalbrotherbikeclinic.com)&nbsp; owned and operated by Pravennchandra J Rai, a company registered and incorporated under the Companies Act,2013, whose address is at Ujjodi, Pumpwell, , Mangalore-575003, Karnataka, India.<br style=\"box-sizing: inherit;\">Bike Clinic, is strongly committed in protecting your privacy and has taken all necessary and reasonable measures to protect your personal information and handle the same in a safe and responsible manner in accordance with the terms and conditions of this policy (“Privacy Policy”) set out herein below:</p><p style=\"box-sizing: inherit; color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\">We view protection of your privacy as a very important principle. In case we ask you to provide certain information by which you can be identified when using our website or Mobile application, that will also be used in accordance with this privacy statement. Royal Brothers reserves the right to change this policy from time to time. We store and process your information, including any sensitive financial information collected (as defined under the Information Technology Act, 2000), if any, on computers that may be protected by physical as well as reasonable technological security measures and procedures in accordance to Information Technology Act 2000. The user is asked to submit personal data or information under (Reasonable Security Practices and Procedures and Sensitive Personal Data or Information) Rules 2011 (Privacy Rules). Our current privacy policy is available at www.royalbrothers.com/privacy-policy. If you have any objections to your |Information being transferred or used in this way, we request you to avoid using this website.</p>\r\n										'),
(3, 'About Us ', 'aboutus', '										<ul style=\"box-sizing: inherit; color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px; margin-top: 3em; margin-bottom: 3em;\"><li class=\"padding_bottom\" style=\"box-sizing: inherit; padding-bottom: 0.3333rem;\">We are one of the best Bike Rental Dealers in the whole of Mangalore. We provide excellent service to out customers that fulfils their needs. A Customer is a King and we intend to serve one like one.</li></ul>\r\n										'),
(11, 'FAQs', 'faqs', '										<div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">*What is Bike Clinic?</span></div><div style=\"text-align: justify;\"><span style=\"font-size: 1em; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\">#Bike Clinic</span><span style=\"color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\">&nbsp;is the most affordable, easiest and convenient way of renting a bike across India. An easier mode of riding, exploring, commuting. that gives you accessibility beyond any other means.</span></div><div style=\"text-align: justify;\"><span style=\"color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\"><br></span></div><div style=\"text-align: justify;\"><span style=\"color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; font-size: 12.8px;\">*What Makes Bike Clinic Special?</span></div><div style=\"text-align: justify;\"><span style=\"color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; text-align: left; font-size: 12.8px;\">#</span><span style=\"font-size: 1em; color: rgba(0, 0, 0, 0.87); font-family: Muli, sans-serif; text-align: left;\">Prominent locations across our 30 cities in India and 3 in Thailand with 20 various bike models, needless to mention our great customer service experience is a proof enough of our zeal to make a way into your heart and daily life.</span></div>\r\n										');

-- --------------------------------------------------------

--
-- Table structure for table `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`) VALUES
(5, 'sherwin@gmail.com', 'Hi', '2023-04-11 06:13:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `License` varchar(120) NOT NULL,
  `Aadhaar` varchar(120) NOT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `License`, `Aadhaar`, `Address`, `City`, `RegDate`, `UpdationDate`) VALUES
(5, 'Sherwin', 'sherwin@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '7022089872', '13/09/2001', '', '', 'mangalore', 'dsgsfgds', '2023-04-11 05:40:17', '2023-04-11 08:25:04'),
(8, 'Fahad', 'fahad1111@gmail.com', '81b073de9370ea873f548e31b8adc081', '1234567899', NULL, '', '', NULL, NULL, '2023-04-11 09:27:30', '2023-04-11 09:29:10'),
(14, 'Abdul Fahad', 'Ablfahad777333@gmail.com', '03161c7219d6b2fad6ccc30a10ee6fe1', '8310662670', NULL, '', '', NULL, NULL, '2023-04-11 10:34:40', '2023-04-11 10:35:39'),
(19, 'arwin', 'arwindsouza7@gmail.com', '88840296de9a92a2ab0d66ac0b6f9216', '9113030574', NULL, '', '', NULL, NULL, '2023-05-04 04:30:09', NULL),
(20, 'Afaan', 'afaan45@gmail.com', '1bbd886460827015e5d605ed44252251', '6366109927', NULL, '', '', NULL, NULL, '2023-05-09 04:02:41', NULL),
(21, 'Sherwin', 'sherwin54@gmail.com', '1bbd886460827015e5d605ed44252251', '9886871968', NULL, '', '', NULL, NULL, '2023-05-09 05:28:32', NULL),
(22, 'Sujan', 'sujan59@gmail.com', '1bbd886460827015e5d605ed44252251', '7022208973', NULL, '', '', NULL, NULL, '2023-05-09 05:29:17', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Registration` varchar(20) NOT NULL,
  `Engine` varchar(30) NOT NULL,
  `Chassis` varchar(30) NOT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Registration`, `Engine`, `Chassis`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `RegDate`, `UpdationDate`) VALUES
(12, 'Avenis 125', 4, 'Good pickup. High demand from our customers', 800, 'Petrol', 2018, 2, 'KA19HG2354', 'AF211136821', 'MB8DP11AKG8243254', 'Av1.jpg', 'Av2.jpg', 'Av3.jpg', 'Av4.jpg', '', '2023-05-09 05:06:47', '2023-05-09 05:25:22'),
(13, 'Dio', 3, 'Nice mileage. Well maintained', 750, 'Petrol', 2019, 2, 'KA19HG1856', 'AF211136828', 'MB8DP11AKG8246256', 'D1.jpg', 'D2.jpg', 'D3.jpg', 'D4.jpg', '', '2023-05-09 05:08:56', '2023-05-09 05:26:17'),
(14, 'Royal Enfield Classic 350', 11, 'Good for long rides. Imported rear tire. Suitable for mud roads too.', 1250, 'Petrol', 2020, 2, 'KA19HG5675', 'AG211136821', 'MB8DH11AKG8243256', 'R1.jpg', 'R2.jpg', 'R3.jpg', 'R4.jpg', '', '2023-05-09 05:11:40', '2023-05-09 05:27:00'),
(15, 'Access 125', 4, 'For regular use. Excellent condition with disc brakes.', 900, 'Petrol', 2019, 2, 'KA19HG6660', 'AF2111368687', 'MB8DP11AKG8246875', 'A1.jpg', 'A2.jpg', 'A3.jpg', 'A4.jpg', '', '2023-05-09 05:13:12', '2023-05-09 05:27:42'),
(16, 'Pulsar', 12, 'NS 160 Model. Good for long rides.', 1100, 'Petrol', 2020, 2, 'KA19HG2754', 'AF20854136821', 'MB8DP11AKG8243254', '1.jpg', '2.jpg', '3.jpg', '4.jpg', '', '2023-05-09 05:15:37', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1003;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

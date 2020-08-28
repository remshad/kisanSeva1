-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 28, 2020 at 12:59 PM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kisanseva`
--

-- --------------------------------------------------------

--
-- Table structure for table `agofficer`
--

CREATE TABLE `agofficer` (
  `ag_id` int(11) NOT NULL,
  `ag_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ag_password` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ag_phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ag_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ag_govid` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop`
--

CREATE TABLE `crop` (
  `c_id` int(11) NOT NULL,
  `c_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cc_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `crop`
--

INSERT INTO `crop` (`c_id`, `c_name`, `cc_id`) VALUES
(1, 'Banana', 1),
(2, 'orange', 1),
(3, 'grape', 1);

-- --------------------------------------------------------

--
-- Table structure for table `crop_category`
--

CREATE TABLE `crop_category` (
  `cc_id` int(11) NOT NULL,
  `cc_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `crop_category`
--

INSERT INTO `crop_category` (`cc_id`, `cc_name`) VALUES
(1, 'fruit'),
(2, 'vegitable');

-- --------------------------------------------------------

--
-- Table structure for table `crop_disease`
--

CREATE TABLE `crop_disease` (
  `cd_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `cd_text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_disease`
--

INSERT INTO `crop_disease` (`cd_id`, `c_id`, `cd_text`) VALUES
(1, 1, '<p>hey sample add text</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `crop_disease_update`
--

CREATE TABLE `crop_disease_update` (
  `cdu_id` int(11) NOT NULL,
  `cd_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `cdu_text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_fertilizers`
--

CREATE TABLE `crop_fertilizers` (
  `cf_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `cf_text` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_fertilizers`
--

INSERT INTO `crop_fertilizers` (`cf_id`, `c_id`, `cf_text`) VALUES
(2, 1, '<p>abcabc123</p>\r\n'),
(3, 2, '<p>hey hello</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `crop_fertilizers_update`
--

CREATE TABLE `crop_fertilizers_update` (
  `cfu_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `cf_id` int(11) NOT NULL,
  `cfu_text` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_instruction`
--

CREATE TABLE `crop_instruction` (
  `ci_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `ci_instruction` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_instruction`
--

INSERT INTO `crop_instruction` (`ci_id`, `c_id`, `ci_instruction`) VALUES
(1, 1, '<p>sample text sample</p>\r\n'),
(21, 2, '<p>hahahahaa</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `crop_instruction_update`
--

CREATE TABLE `crop_instruction_update` (
  `ciu_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `ci_id` int(11) NOT NULL,
  `ciu_instruction` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_price`
--

CREATE TABLE `crop_price` (
  `cp_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  `cp_date` int(11) NOT NULL,
  `cp_price` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `crop_tips`
--

CREATE TABLE `crop_tips` (
  `ct_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `ct_tips` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `crop_tips`
--

INSERT INTO `crop_tips` (`ct_id`, `c_id`, `ct_tips`) VALUES
(1, 1, '<p>123hel;lloo123</p>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `crop_tips_update`
--

CREATE TABLE `crop_tips_update` (
  `ctu_id` int(11) NOT NULL,
  `ct_id` int(11) NOT NULL,
  `ag_id` int(11) NOT NULL,
  `ctu_tips` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer`
--

CREATE TABLE `dealer` (
  `de_id` int(11) NOT NULL,
  `de_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_store_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_address` text COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int(11) NOT NULL,
  `de_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `de_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_licence` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `dealer`
--

INSERT INTO `dealer` (`de_id`, `de_name`, `de_store_name`, `de_address`, `v_id`, `de_phone`, `de_password`, `de_licence`) VALUES
(1, 'testago', '', 'abc', 1194, '9999999999', 'e10adc3949ba59abbe56e057f20f883e', ''),
(2, '9400326201', 'ABC', '6C GJ Lavender, Opp Cherthala Police Station', 1194, '9400326201', 'e10adc3949ba59abbe56e057f20f883e', 'MH5212ABL');

-- --------------------------------------------------------

--
-- Table structure for table `dealer_language`
--

CREATE TABLE `dealer_language` (
  `dl_id` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_request`
--

CREATE TABLE `dealer_request` (
  `dr_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `dr_quantity` int(11) NOT NULL,
  `dr_unit_price` float NOT NULL,
  `ut_id` int(11) NOT NULL,
  `dr_date` int(11) NOT NULL,
  `de_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dealer_to_farmer_msg`
--

CREATE TABLE `dealer_to_farmer_msg` (
  `dtfm_id` int(11) NOT NULL,
  `dtfm_msg` text COLLATE utf8_unicode_ci NOT NULL,
  `dtfm_date` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `dtfm_status` int(11) NOT NULL,
  `de_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `district`
--

CREATE TABLE `district` (
  `d_id` int(11) NOT NULL,
  `d_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `s_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `district`
--

INSERT INTO `district` (`d_id`, `d_name`, `s_id`) VALUES
(1, 'North and Middle Andaman', 32),
(2, 'South Andaman', 32),
(3, 'Nicobar', 32),
(4, 'Adilabad', 1),
(5, 'Anantapur', 1),
(6, 'Chittoor', 1),
(7, 'East Godavari', 1),
(8, 'Guntur', 1),
(9, 'Hyderabad', 1),
(10, 'Kadapa', 1),
(11, 'Karimnagar', 1),
(12, 'Khammam', 1),
(13, 'Krishna', 1),
(14, 'Kurnool', 1),
(15, 'Mahbubnagar', 1),
(16, 'Medak', 1),
(17, 'Nalgonda', 1),
(18, 'Nellore', 1),
(19, 'Nizamabad', 1),
(20, 'Prakasam', 1),
(21, 'Rangareddi', 1),
(22, 'Srikakulam', 1),
(23, 'Vishakhapatnam', 1),
(24, 'Vizianagaram', 1),
(25, 'Warangal', 1),
(26, 'West Godavari', 1),
(27, 'Anjaw', 3),
(28, 'Changlang', 3),
(29, 'East Kameng', 3),
(30, 'Lohit', 3),
(31, 'Lower Subansiri', 3),
(32, 'Papum Pare', 3),
(33, 'Tirap', 3),
(34, 'Dibang Valley', 3),
(35, 'Upper Subansiri', 3),
(36, 'West Kameng', 3),
(37, 'Barpeta', 2),
(38, 'Bongaigaon', 2),
(39, 'Cachar', 2),
(40, 'Darrang', 2),
(41, 'Dhemaji', 2),
(42, 'Dhubri', 2),
(43, 'Dibrugarh', 2),
(44, 'Goalpara', 2),
(45, 'Golaghat', 2),
(46, 'Hailakandi', 2),
(47, 'Jorhat', 2),
(48, 'Karbi Anglong', 2),
(49, 'Karimganj', 2),
(50, 'Kokrajhar', 2),
(51, 'Lakhimpur', 2),
(52, 'Marigaon', 2),
(53, 'Nagaon', 2),
(54, 'Nalbari', 2),
(55, 'North Cachar Hills', 2),
(56, 'Sibsagar', 2),
(57, 'Sonitpur', 2),
(58, 'Tinsukia', 2),
(59, 'Araria', 4),
(60, 'Aurangabad', 4),
(61, 'Banka', 4),
(62, 'Begusarai', 4),
(63, 'Bhagalpur', 4),
(64, 'Bhojpur', 4),
(65, 'Buxar', 4),
(66, 'Darbhanga', 4),
(67, 'Purba Champaran', 4),
(68, 'Gaya', 4),
(69, 'Gopalganj', 4),
(70, 'Jamui', 4),
(71, 'Jehanabad', 4),
(72, 'Khagaria', 4),
(73, 'Kishanganj', 4),
(74, 'Kaimur', 4),
(75, 'Katihar', 4),
(76, 'Lakhisarai', 4),
(77, 'Madhubani', 4),
(78, 'Munger', 4),
(79, 'Madhepura', 4),
(80, 'Muzaffarpur', 4),
(81, 'Nalanda', 4),
(82, 'Nawada', 4),
(83, 'Patna', 4),
(84, 'Purnia', 4),
(85, 'Rohtas', 4),
(86, 'Saharsa', 4),
(87, 'Samastipur', 4),
(88, 'Sheohar', 4),
(89, 'Sheikhpura', 4),
(90, 'Saran', 4),
(91, 'Sitamarhi', 4),
(92, 'Supaul', 4),
(93, 'Siwan', 4),
(94, 'Vaishali', 4),
(95, 'Pashchim Champaran', 4),
(96, 'Bastar', 35),
(97, 'Bilaspur', 35),
(98, 'Dantewada', 35),
(99, 'Dhamtari', 35),
(100, 'Durg', 35),
(101, 'Jashpur', 35),
(102, 'Janjgir-Champa', 35),
(103, 'Korba', 35),
(104, 'Koriya', 35),
(105, 'Kanker', 35),
(106, 'Kawardha', 35),
(107, 'Mahasamund', 35),
(108, 'Raigarh', 35),
(109, 'Rajnandgaon', 35),
(110, 'Raipur', 35),
(111, 'Surguja', 35),
(112, 'Diu', 29),
(113, 'Daman', 29),
(114, 'Central Delhi', 25),
(115, 'East Delhi', 25),
(116, 'New Delhi', 25),
(117, 'North Delhi', 25),
(118, 'North East Delhi', 25),
(119, 'North West Delhi', 25),
(120, 'South Delhi', 25),
(121, 'South West Delhi', 25),
(122, 'West Delhi', 25),
(123, 'North Goa', 26),
(124, 'South Goa', 26),
(125, 'Ahmedabad', 5),
(126, 'Amreli District', 5),
(127, 'Anand', 5),
(128, 'Banaskantha', 5),
(129, 'Bharuch', 5),
(130, 'Bhavnagar', 5),
(131, 'Dahod', 5),
(132, 'The Dangs', 5),
(133, 'Gandhinagar', 5),
(134, 'Jamnagar', 5),
(135, 'Junagadh', 5),
(136, 'Kutch', 5),
(137, 'Kheda', 5),
(138, 'Mehsana', 5),
(139, 'Narmada', 5),
(140, 'Navsari', 5),
(141, 'Patan', 5),
(142, 'Panchmahal', 5),
(143, 'Porbandar', 5),
(144, 'Rajkot', 5),
(145, 'Sabarkantha', 5),
(146, 'Surendranagar', 5),
(147, 'Surat', 5),
(148, 'Vadodara', 5),
(149, 'Valsad', 5),
(150, 'Ambala', 6),
(151, 'Bhiwani', 6),
(152, 'Faridabad', 6),
(153, 'Fatehabad', 6),
(154, 'Gurgaon', 6),
(155, 'Hissar', 6),
(156, 'Jhajjar', 6),
(157, 'Jind', 6),
(158, 'Karnal', 6),
(159, 'Kaithal', 6),
(160, 'Kurukshetra', 6),
(161, 'Mahendragarh', 6),
(162, 'Mewat', 6),
(163, 'Panchkula', 6),
(164, 'Panipat', 6),
(165, 'Rewari', 6),
(166, 'Rohtak', 6),
(167, 'Sirsa', 6),
(168, 'Sonepat', 6),
(169, 'Yamuna Nagar', 6),
(170, 'Palwal', 6),
(171, 'Bilaspur', 7),
(172, 'Chamba', 7),
(173, 'Hamirpur', 7),
(174, 'Kangra', 7),
(175, 'Kinnaur', 7),
(176, 'Kulu', 7),
(177, 'Lahaul and Spiti', 7),
(178, 'Mandi', 7),
(179, 'Shimla', 7),
(180, 'Sirmaur', 7),
(181, 'Solan', 7),
(182, 'Una', 7),
(183, 'Anantnag', 8),
(184, 'Badgam', 8),
(185, 'Bandipore', 8),
(186, 'Baramula', 8),
(187, 'Doda', 8),
(188, 'Jammu', 8),
(189, 'Kargil', 8),
(190, 'Kathua', 8),
(191, 'Kupwara', 8),
(192, 'Leh', 8),
(193, 'Poonch', 8),
(194, 'Pulwama', 8),
(195, 'Rajauri', 8),
(196, 'Srinagar', 8),
(197, 'Samba', 8),
(198, 'Udhampur', 8),
(199, 'Bokaro', 34),
(200, 'Chatra', 34),
(201, 'Deoghar', 34),
(202, 'Dhanbad', 34),
(203, 'Dumka', 34),
(204, 'Purba Singhbhum', 34),
(205, 'Garhwa', 34),
(206, 'Giridih', 34),
(207, 'Godda', 34),
(208, 'Gumla', 34),
(209, 'Hazaribagh', 34),
(210, 'Koderma', 34),
(211, 'Lohardaga', 34),
(212, 'Pakur', 34),
(213, 'Palamu', 34),
(214, 'Ranchi', 34),
(215, 'Sahibganj', 34),
(216, 'Seraikela and Kharsawan', 34),
(217, 'Pashchim Singhbhum', 34),
(218, 'Ramgarh', 34),
(219, 'Bidar', 9),
(220, 'Belgaum', 9),
(221, 'Bijapur', 9),
(222, 'Bagalkot', 9),
(223, 'Bellary', 9),
(224, 'Bangalore Rural District', 9),
(225, 'Bangalore Urban District', 9),
(226, 'Chamarajnagar', 9),
(227, 'Chikmagalur', 9),
(228, 'Chitradurga', 9),
(229, 'Davanagere', 9),
(230, 'Dharwad', 9),
(231, 'Dakshina Kannada', 9),
(232, 'Gadag', 9),
(233, 'Gulbarga', 9),
(234, 'Hassan', 9),
(235, 'Haveri District', 9),
(236, 'Kodagu', 9),
(237, 'Kolar', 9),
(238, 'Koppal', 9),
(239, 'Mandya', 9),
(240, 'Mysore', 9),
(241, 'Raichur', 9),
(242, 'Shimoga', 9),
(243, 'Tumkur', 9),
(244, 'Udupi', 9),
(245, 'Uttara Kannada', 9),
(246, 'Ramanagara', 9),
(247, 'Chikballapur', 9),
(248, 'Yadagiri', 9),
(249, 'Alappuzha', 10),
(250, 'Ernakulam', 10),
(251, 'Idukki', 10),
(252, 'Kollam', 10),
(253, 'Kannur', 10),
(254, 'Kasaragod', 10),
(255, 'Kottayam', 10),
(256, 'Kozhikode', 10),
(257, 'Malappuram', 10),
(258, 'Palakkad', 10),
(259, 'Pathanamthitta', 10),
(260, 'Thrissur', 10),
(261, 'Thiruvananthapuram', 10),
(262, 'Wayanad', 10),
(263, 'Alirajpur', 11),
(264, 'Anuppur', 11),
(265, 'Ashok Nagar', 11),
(266, 'Balaghat', 11),
(267, 'Barwani', 11),
(268, 'Betul', 11),
(269, 'Bhind', 11),
(270, 'Bhopal', 11),
(271, 'Burhanpur', 11),
(272, 'Chhatarpur', 11),
(273, 'Chhindwara', 11),
(274, 'Damoh', 11),
(275, 'Datia', 11),
(276, 'Dewas', 11),
(277, 'Dhar', 11),
(278, 'Dindori', 11),
(279, 'Guna', 11),
(280, 'Gwalior', 11),
(281, 'Harda', 11),
(282, 'Hoshangabad', 11),
(283, 'Indore', 11),
(284, 'Jabalpur', 11),
(285, 'Jhabua', 11),
(286, 'Katni', 11),
(287, 'Khandwa', 11),
(288, 'Khargone', 11),
(289, 'Mandla', 11),
(290, 'Mandsaur', 11),
(291, 'Morena', 11),
(292, 'Narsinghpur', 11),
(293, 'Neemuch', 11),
(294, 'Panna', 11),
(295, 'Rewa', 11),
(296, 'Rajgarh', 11),
(297, 'Ratlam', 11),
(298, 'Raisen', 11),
(299, 'Sagar', 11),
(300, 'Satna', 11),
(301, 'Sehore', 11),
(302, 'Seoni', 11),
(303, 'Shahdol', 11),
(304, 'Shajapur', 11),
(305, 'Sheopur', 11),
(306, 'Shivpuri', 11),
(307, 'Sidhi', 11),
(308, 'Singrauli', 11),
(309, 'Tikamgarh', 11),
(310, 'Ujjain', 11),
(311, 'Umaria', 11),
(312, 'Vidisha', 11),
(313, 'Ahmednagar', 12),
(314, 'Akola', 12),
(315, 'Amrawati', 12),
(316, 'Aurangabad', 12),
(317, 'Bhandara', 12),
(318, 'Beed', 12),
(319, 'Buldhana', 12),
(320, 'Chandrapur', 12),
(321, 'Dhule', 12),
(322, 'Gadchiroli', 12),
(323, 'Gondiya', 12),
(324, 'Hingoli', 12),
(325, 'Jalgaon', 12),
(326, 'Jalna', 12),
(327, 'Kolhapur', 12),
(328, 'Latur', 12),
(329, 'Mumbai City', 12),
(330, 'Mumbai suburban', 12),
(331, 'Nandurbar', 12),
(332, 'Nanded', 12),
(333, 'Nagpur', 12),
(334, 'Nashik', 12),
(335, 'Osmanabad', 12),
(336, 'Parbhani', 12),
(337, 'Pune', 12),
(338, 'Raigad', 12),
(339, 'Ratnagiri', 12),
(340, 'Sindhudurg', 12),
(341, 'Sangli', 12),
(342, 'Solapur', 12),
(343, 'Satara', 12),
(344, 'Thane', 12),
(345, 'Wardha', 12),
(346, 'Washim', 12),
(347, 'Yavatmal', 12),
(348, 'Bishnupur', 13),
(349, 'Churachandpur', 13),
(350, 'Chandel', 13),
(351, 'Imphal East', 13),
(352, 'Senapati', 13),
(353, 'Tamenglong', 13),
(354, 'Thoubal', 13),
(355, 'Ukhrul', 13),
(356, 'Imphal West', 13),
(357, 'East Garo Hills', 14),
(358, 'East Khasi Hills', 14),
(359, 'Jaintia Hills', 14),
(360, 'Ri-Bhoi', 14),
(361, 'South Garo Hills', 14),
(362, 'West Garo Hills', 14),
(363, 'West Khasi Hills', 14),
(364, 'Aizawl', 15),
(365, 'Champhai', 15),
(366, 'Kolasib', 15),
(367, 'Lawngtlai', 15),
(368, 'Lunglei', 15),
(369, 'Mamit', 15),
(370, 'Saiha', 15),
(371, 'Serchhip', 15),
(372, 'Dimapur', 16),
(373, 'Kohima', 16),
(374, 'Mokokchung', 16),
(375, 'Mon', 16),
(376, 'Phek', 16),
(377, 'Tuensang', 16),
(378, 'Wokha', 16),
(379, 'Zunheboto', 16),
(380, 'Angul', 17),
(381, 'Boudh', 17),
(382, 'Bhadrak', 17),
(383, 'Bolangir', 17),
(384, 'Bargarh', 17),
(385, 'Baleswar', 17),
(386, 'Cuttack', 17),
(387, 'Debagarh', 17),
(388, 'Dhenkanal', 17),
(389, 'Ganjam', 17),
(390, 'Gajapati', 17),
(391, 'Jharsuguda', 17),
(392, 'Jajapur', 17),
(393, 'Jagatsinghpur', 17),
(394, 'Khordha', 17),
(395, 'Kendujhar', 17),
(396, 'Kalahandi', 17),
(397, 'Kandhamal', 17),
(398, 'Koraput', 17),
(399, 'Kendrapara', 17),
(400, 'Malkangiri', 17),
(401, 'Mayurbhanj', 17),
(402, 'Nabarangpur', 17),
(403, 'Nuapada', 17),
(404, 'Nayagarh', 17),
(405, 'Puri', 17),
(406, 'Rayagada', 17),
(407, 'Sambalpur', 17),
(408, 'Subarnapur', 17),
(409, 'Sundargarh', 17),
(410, 'Karaikal', 27),
(411, 'Mahe', 27),
(412, 'Puducherry', 27),
(413, 'Yanam', 27),
(414, 'Amritsar', 18),
(415, 'Bathinda', 18),
(416, 'Firozpur', 18),
(417, 'Faridkot', 18),
(418, 'Fatehgarh Sahib', 18),
(419, 'Gurdaspur', 18),
(420, 'Hoshiarpur', 18),
(421, 'Jalandhar', 18),
(422, 'Kapurthala', 18),
(423, 'Ludhiana', 18),
(424, 'Mansa', 18),
(425, 'Moga', 18),
(426, 'Mukatsar', 18),
(427, 'Nawan Shehar', 18),
(428, 'Patiala', 18),
(429, 'Rupnagar', 18),
(430, 'Sangrur', 18),
(431, 'Ajmer', 19),
(432, 'Alwar', 19),
(433, 'Bikaner', 19),
(434, 'Barmer', 19),
(435, 'Banswara', 19),
(436, 'Bharatpur', 19),
(437, 'Baran', 19),
(438, 'Bundi', 19),
(439, 'Bhilwara', 19),
(440, 'Churu', 19),
(441, 'Chittorgarh', 19),
(442, 'Dausa', 19),
(443, 'Dholpur', 19),
(444, 'Dungapur', 19),
(445, 'Ganganagar', 19),
(446, 'Hanumangarh', 19),
(447, 'Juhnjhunun', 19),
(448, 'Jalore', 19),
(449, 'Jodhpur', 19),
(450, 'Jaipur', 19),
(451, 'Jaisalmer', 19),
(452, 'Jhalawar', 19),
(453, 'Karauli', 19),
(454, 'Kota', 19),
(455, 'Nagaur', 19),
(456, 'Pali', 19),
(457, 'Pratapgarh', 19),
(458, 'Rajsamand', 19),
(459, 'Sikar', 19),
(460, 'Sawai Madhopur', 19),
(461, 'Sirohi', 19),
(462, 'Tonk', 19),
(463, 'Udaipur', 19),
(464, 'East Sikkim', 20),
(465, 'North Sikkim', 20),
(466, 'South Sikkim', 20),
(467, 'West Sikkim', 20),
(468, 'Ariyalur', 21),
(469, 'Chennai', 21),
(470, 'Coimbatore', 21),
(471, 'Cuddalore', 21),
(472, 'Dharmapuri', 21),
(473, 'Dindigul', 21),
(474, 'Erode', 21),
(475, 'Kanchipuram', 21),
(476, 'Kanyakumari', 21),
(477, 'Karur', 21),
(478, 'Madurai', 21),
(479, 'Nagapattinam', 21),
(480, 'The Nilgiris', 21),
(481, 'Namakkal', 21),
(482, 'Perambalur', 21),
(483, 'Pudukkottai', 21),
(484, 'Ramanathapuram', 21),
(485, 'Salem', 21),
(486, 'Sivagangai', 21),
(487, 'Tiruppur', 21),
(488, 'Tiruchirappalli', 21),
(489, 'Theni', 21),
(490, 'Tirunelveli', 21),
(491, 'Thanjavur', 21),
(492, 'Thoothukudi', 21),
(493, 'Thiruvallur', 21),
(494, 'Thiruvarur', 21),
(495, 'Tiruvannamalai', 21),
(496, 'Vellore', 21),
(497, 'Villupuram', 21),
(498, 'Dhalai', 22),
(499, 'North Tripura', 22),
(500, 'South Tripura', 22),
(501, 'West Tripura', 22),
(502, 'Almora', 33),
(503, 'Bageshwar', 33),
(504, 'Chamoli', 33),
(505, 'Champawat', 33),
(506, 'Dehradun', 33),
(507, 'Haridwar', 33),
(508, 'Nainital', 33),
(509, 'Pauri Garhwal', 33),
(510, 'Pithoragharh', 33),
(511, 'Rudraprayag', 33),
(512, 'Tehri Garhwal', 33),
(513, 'Udham Singh Nagar', 33),
(514, 'Uttarkashi', 33),
(515, 'Agra', 23),
(516, 'Allahabad', 23),
(517, 'Aligarh', 23),
(518, 'Ambedkar Nagar', 23),
(519, 'Auraiya', 23),
(520, 'Azamgarh', 23),
(521, 'Barabanki', 23),
(522, 'Badaun', 23),
(523, 'Bagpat', 23),
(524, 'Bahraich', 23),
(525, 'Bijnor', 23),
(526, 'Ballia', 23),
(527, 'Banda', 23),
(528, 'Balrampur', 23),
(529, 'Bareilly', 23),
(530, 'Basti', 23),
(531, 'Bulandshahr', 23),
(532, 'Chandauli', 23),
(533, 'Chitrakoot', 23),
(534, 'Deoria', 23),
(535, 'Etah', 23),
(536, 'Kanshiram Nagar', 23),
(537, 'Etawah', 23),
(538, 'Firozabad', 23),
(539, 'Farrukhabad', 23),
(540, 'Fatehpur', 23),
(541, 'Faizabad', 23),
(542, 'Gautam Buddha Nagar', 23),
(543, 'Gonda', 23),
(544, 'Ghazipur', 23),
(545, 'Gorkakhpur', 23),
(546, 'Ghaziabad', 23),
(547, 'Hamirpur', 23),
(548, 'Hardoi', 23),
(549, 'Mahamaya Nagar', 23),
(550, 'Jhansi', 23),
(551, 'Jalaun', 23),
(552, 'Jyotiba Phule Nagar', 23),
(553, 'Jaunpur District', 23),
(554, 'Kanpur Dehat', 23),
(555, 'Kannauj', 23),
(556, 'Kanpur Nagar', 23),
(557, 'Kaushambi', 23),
(558, 'Kushinagar', 23),
(559, 'Lalitpur', 23),
(560, 'Lakhimpur Kheri', 23),
(561, 'Lucknow', 23),
(562, 'Mau', 23),
(563, 'Meerut', 23),
(564, 'Maharajganj', 23),
(565, 'Mahoba', 23),
(566, 'Mirzapur', 23),
(567, 'Moradabad', 23),
(568, 'Mainpuri', 23),
(569, 'Mathura', 23),
(570, 'Muzaffarnagar', 23),
(571, 'Pilibhit', 23),
(572, 'Pratapgarh', 23),
(573, 'Rampur', 23),
(574, 'Rae Bareli', 23),
(575, 'Saharanpur', 23),
(576, 'Sitapur', 23),
(577, 'Shahjahanpur', 23),
(578, 'Sant Kabir Nagar', 23),
(579, 'Siddharthnagar', 23),
(580, 'Sonbhadra', 23),
(581, 'Sant Ravidas Nagar', 23),
(582, 'Sultanpur', 23),
(583, 'Shravasti', 23),
(584, 'Unnao', 23),
(585, 'Varanasi', 23),
(586, 'Birbhum', 24),
(587, 'Bankura', 24),
(588, 'Bardhaman', 24),
(589, 'Darjeeling', 24),
(590, 'Dakshin Dinajpur', 24),
(591, 'Hooghly', 24),
(592, 'Howrah', 24),
(593, 'Jalpaiguri', 24),
(594, 'Cooch Behar', 24),
(595, 'Kolkata', 24),
(596, 'Malda', 24),
(597, 'Midnapore', 24),
(598, 'Murshidabad', 24),
(599, 'Nadia', 24),
(600, 'North 24 Parganas', 24),
(601, 'South 24 Parganas', 24),
(602, 'Purulia', 24),
(603, 'Uttar Dinajpur', 24);

-- --------------------------------------------------------

--
-- Table structure for table `farmer`
--

CREATE TABLE `farmer` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_address` text COLLATE utf8_unicode_ci NOT NULL,
  `f_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `farmer`
--

INSERT INTO `farmer` (`f_id`, `f_name`, `f_password`, `f_address`, `f_phone`, `v_id`) VALUES
(1, 'abc', 'e10adc3949ba59abbe56e057f20f883e', 'abc street', '1234567890', 680),
(2, '9400326201', 'e10adc3949ba59abbe56e057f20f883e', '6C GJ Lavender, Opp Cherthala Police Station', '9400326201', 1194);

-- --------------------------------------------------------

--
-- Table structure for table `farmer_language`
--

CREATE TABLE `farmer_language` (
  `fl_id` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harvesting`
--

CREATE TABLE `harvesting` (
  `h_id` int(11) NOT NULL,
  `p_id` int(11) NOT NULL,
  `h_date` int(11) NOT NULL,
  `h_quantity` int(11) NOT NULL,
  `h_unit_price` float NOT NULL,
  `h_transp_willing` int(11) NOT NULL,
  `h_status` int(11) NOT NULL,
  `ut_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `harvest_process`
--

CREATE TABLE `harvest_process` (
  `hp_id` int(11) NOT NULL,
  `h_id` int(11) NOT NULL,
  `hp_quantity` int(11) NOT NULL,
  `hp_date` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `language`
--

CREATE TABLE `language` (
  `l_id` int(11) NOT NULL,
  `l_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `language`
--

INSERT INTO `language` (`l_id`, `l_name`) VALUES
(1, 'malayalam'),
(2, 'english'),
(3, 'hindi'),
(4, 'tamil'),
(5, 'telgu');

-- --------------------------------------------------------

--
-- Table structure for table `planting`
--

CREATE TABLE `planting` (
  `p_id` int(11) NOT NULL,
  `c_id` int(11) NOT NULL,
  `p_planting_date` int(11) NOT NULL,
  `p_harvesting_date` int(11) NOT NULL,
  `p_quantity` int(11) NOT NULL,
  `p_quantity_type` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `p_locality` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_id` int(11) NOT NULL,
  `p_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `state`
--

CREATE TABLE `state` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`s_id`, `s_name`) VALUES
(1, 'ANDHRA PRADESH'),
(2, 'ASSAM'),
(3, 'ARUNACHAL PRADESH'),
(4, 'BIHAR'),
(5, 'GUJRAT'),
(6, 'HARYANA'),
(7, 'HIMACHAL PRADESH'),
(8, 'JAMMU & KASHMIR'),
(9, 'KARNATAKA'),
(10, 'KERALA'),
(11, 'MADHYA PRADESH'),
(12, 'MAHARASHTRA'),
(13, 'MANIPUR'),
(14, 'MEGHALAYA'),
(15, 'MIZORAM'),
(16, 'NAGALAND'),
(17, 'ORISSA'),
(18, 'PUNJAB'),
(19, 'RAJASTHAN'),
(20, 'SIKKIM'),
(21, 'TAMIL NADU'),
(22, 'TRIPURA'),
(23, 'UTTAR PRADESH'),
(24, 'WEST BENGAL'),
(25, 'DELHI'),
(26, 'GOA'),
(27, 'PONDICHERY'),
(28, 'LAKSHDWEEP'),
(29, 'DAMAN & DIU'),
(30, 'DADRA & NAGAR'),
(31, 'CHANDIGARH'),
(32, 'ANDAMAN & NICOBAR'),
(33, 'UTTARANCHAL'),
(34, 'JHARKHAND'),
(35, 'CHHATTISGARH');

-- --------------------------------------------------------

--
-- Table structure for table `unit_type`
--

CREATE TABLE `unit_type` (
  `ut_id` int(11) NOT NULL,
  `ut_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `unit_type`
--

INSERT INTO `unit_type` (`ut_id`, `ut_name`) VALUES
(1, 'kilogram'),
(2, 'litter'),
(3, 'meter'),
(4, 'item number');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `u_id` int(11) NOT NULL,
  `u_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `u_pass` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `u_status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`u_id`, `u_name`, `u_pass`, `u_status`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', 1);

-- --------------------------------------------------------

--
-- Table structure for table `village`
--

CREATE TABLE `village` (
  `v_id` int(11) NOT NULL,
  `v_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `d_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `village`
--

INSERT INTO `village` (`v_id`, `v_name`, `d_id`) VALUES
(1, 'Kasaragod\r\n', 254),
(2, 'Pavoor\r\n', 254),
(3, 'Vorkady\r\n', 254),
(4, 'Pathur\r\n', 254),
(5, 'Kodalamogaru\r\n', 254),
(6, 'Koliyoor\r\n', 254),
(7, 'Kaliyoor\r\n', 254),
(8, 'Talikala\r\n', 254),
(9, 'Meenja\r\n', 254),
(10, 'Kadambar\r\n', 254),
(11, 'Moodambail\r\n', 254),
(12, 'Kuloor\r\n', 254),
(13, 'Majibail\r\n', 254),
(14, 'Badaje\r\n', 254),
(15, 'Mulinja\r\n', 254),
(16, 'Kodibail\r\n', 254),
(17, 'Ichilangod\r\n', 254),
(18, 'Heroor\r\n', 254),
(19, 'Kubanoor\r\n', 254),
(20, 'Bekoor\r\n', 254),
(21, 'Kayyar\r\n', 254),
(22, 'Kudalmarkala\r\n', 254),
(23, 'Paivalike\r\n', 254),
(24, 'Chippar\r\n', 254),
(25, 'Bayar\r\n', 254),
(26, 'Badoor\r\n', 254),
(27, 'Angadimogaru\r\n', 254),
(28, 'Mugu\r\n', 254),
(29, 'Maire\r\n', 254),
(30, 'Enmakaje\r\n', 254),
(31, 'Kattukukke\r\n', 254),
(32, 'Padre\r\n', 254),
(33, 'Badiyadka\r\n', 254),
(34, 'Nirchal\r\n', 254),
(35, 'Bela\r\n', 254),
(36, 'Puthige\r\n', 254),
(37, 'Edanad\r\n', 254),
(38, 'Kannur\r\n', 254),
(39, 'Kidoor\r\n', 254),
(40, 'Ujarulvar\r\n', 254),
(41, 'Bombrana\r\n', 254),
(42, 'Arikady\r\n', 254),
(43, 'Ichilampady\r\n', 254),
(44, 'Patla\r\n', 254),
(45, 'Kalnad\r\n', 254),
(46, 'Perumbala\r\n', 254),
(47, 'Thekkil\r\n', 254),
(48, 'Muttathody\r\n', 254),
(49, 'Pady\r\n', 254),
(50, 'Nekraje\r\n', 254),
(51, 'Ubrangala\r\n', 254),
(52, 'Kumbadaje\r\n', 254),
(53, 'Nettanige\r\n', 254),
(54, 'Bellur\r\n', 254),
(55, 'Adhur\r\n', 254),
(56, 'Karadka\r\n', 254),
(57, 'Muliyar\r\n', 254),
(58, 'Kolathur\r\n', 254),
(59, 'Bedadka\r\n', 254),
(60, 'Munnad\r\n', 254),
(61, 'Kuttikole\r\n', 254),
(62, 'Karivedakam\r\n', 254),
(63, 'Bandadka\r\n', 254),
(64, 'Adoor\r\n', 254),
(65, 'Delampady\r\n', 254),
(66, 'Kunjathur (CT)\r\n', 254),
(67, 'Manjeshwar (CT)\r\n', 254),
(68, 'Hosabettu (CT)\r\n', 254),
(69, 'Bangra Manjeshwar (CT)\r\n', 254),
(70, 'Uppala (CT)\r\n', 254),
(71, 'Mangalpady (CT)\r\n', 254),
(72, 'Shiriya (CT)\r\n', 254),
(73, 'Koipady (CT)\r\n', 254),
(74, 'Mogral (CT)\r\n', 254),
(75, 'Puthur (CT)\r\n', 254),
(76, 'Shiribagilu (CT)\r\n', 254),
(77, 'Madhur (CT)\r\n', 254),
(78, 'Kudlu (CT)\r\n', 254),
(79, 'Chengala (CT)\r\n', 254),
(80, 'Chemnad (CT)\r\n', 254),
(81, 'Hosdurg\r\n', 254),
(82, 'Pallikkara II\r\n', 254),
(83, 'Panayal\r\n', 254),
(84, 'Chithari\r\n', 254),
(85, 'Periya\r\n', 254),
(86, 'Pullur\r\n', 254),
(87, 'Kodom\r\n', 254),
(88, 'Kallar\r\n', 254),
(89, 'Panathady\r\n', 254),
(90, 'Balal\r\n', 254),
(91, 'Maloth \r\n', 254),
(92, 'West Eleri\r\n', 254),
(93, 'Palavayal\r\n', 254),
(94, 'Chittarikkal\r\n', 254),
(95, 'Bheemanady\r\n', 254),
(96, 'Parappa \r\n', 254),
(97, 'Thayanur\r\n', 254),
(98, 'Ambalathara\r\n', 254),
(99, 'Madikai\r\n', 254),
(100, 'Kinanoor\r\n', 254),
(101, 'Karindalam\r\n', 254),
(102, 'Cheemeni II\r\n', 254),
(103, 'Cheemeni \r\n', 254),
(104, 'Kayyur\r\n', 254),
(105, 'Kilayikode\r\n', 254),
(106, 'Thimiri\r\n', 254),
(107, 'Kodakkad\r\n', 254),
(108, 'Padne\r\n', 254),
(109, 'Udinoor\r\n', 254),
(110, 'Bare (CT)\r\n', 254),
(111, 'Udma (CT)\r\n', 254),
(112, 'Pallikkara (CT)\r\n', 254),
(113, 'Keekan (CT)\r\n', 254),
(114, 'Ajanur (CT)\r\n', 254),
(115, 'Perole (CT)\r\n', 254),
(116, 'Pilicode (CT)\r\n', 254),
(117, 'Maniyat (CT)\r\n', 254),
(118, 'North Thrikkaripur (CT)\r\n', 254),
(119, 'South Thrikkaripur (CT)\r\n', 254),
(120, 'Nileshwar (OG)\r\n', 254),
(121, 'Cheruvathur (OG)  \r\n', 254),
(122, 'Kannur\r\n', 253),
(123, 'Taliparamba \r\n', 253),
(124, 'Ramanthali\r\n', 253),
(125, 'Peralam\r\n', 253),
(126, 'Kankole\r\n', 253),
(127, 'Alapadamba\r\n', 253),
(128, 'Eramam\r\n', 253),
(129, 'Perinthatta\r\n', 253),
(130, 'Kuttoor\r\n', 253),
(131, 'Vellora\r\n', 253),
(132, 'Peringome\r\n', 253),
(133, 'Thimiri\r\n', 253),
(134, 'Vayakkara\r\n', 253),
(135, 'Pulingome\r\n', 253),
(136, 'Thirumeni\r\n', 253),
(137, 'Alakode\r\n', 253),
(138, 'Vellad\r\n', 253),
(139, 'New Naduvil\r\n', 253),
(140, 'Kooveri\r\n', 253),
(141, 'Panniyoor\r\n', 253),
(142, 'Kuttiyeri\r\n', 253),
(143, 'Pattuvam\r\n', 253),
(144, 'Chuzhali\r\n', 253),
(145, 'Nediyanga\r\n', 253),
(146, 'Eruvassy\r\n', 253),
(147, 'Payyavoor\r\n', 253),
(148, 'Nuchiyad\r\n', 253),
(149, 'Vayathur\r\n', 253),
(150, 'Padiyoor\r\n', 253),
(151, 'Kalliad\r\n', 253),
(152, 'Sreekandapuram\r\n', 253),
(153, 'Malapattam\r\n', 253),
(154, 'Chengalai\r\n', 253),
(155, 'Kayaralam\r\n', 253),
(156, 'Karivellur (CT)\r\n', 253),
(157, 'Pariyaram (CT)\r\n', 253),
(158, 'Kurumathur (CT)\r\n', 253),
(159, 'Irikkur (CT)\r\n', 253),
(160, 'Kuttiattoor (CT)\r\n', 253),
(161, 'Mayyil (CT)\r\n', 253),
(162, 'Kolacherry (CT)\r\n', 253),
(163, 'Cheleri (CT)\r\n', 253),
(164, 'Maniyoor (CT)\r\n', 253),
(165, 'Panapuzha\r\n', 253),
(166, 'Mattool\r\n', 253),
(167, 'Kunhimangalam (CT)\r\n', 253),
(168, 'Cheruthazham (CT)\r\n', 253),
(169, 'Kadannappalli (CT)\r\n', 253),
(170, 'Ezhome (CT)\r\n', 253),
(171, 'Madayi (CT)\r\n', 253),
(172, 'Cherukunnu (CT)\r\n', 253),
(173, 'Kannapuram (CT)\r\n', 253),
(174, 'Narath (CT)\r\n', 253),
(175, 'Pappinisseri (CT)\r\n', 253),
(176, 'Kalliasseri (CT)\r\n', 253),
(177, 'Azhikode North (CT)\r\n', 253),
(178, 'Azhikode South (CT)\r\n', 253),
(179, 'Valapattanam (CT)\r\n', 253),
(180, 'Chirakkal (CT)\r\n', 253),
(181, 'Kannadiparamba (CT)\r\n', 253),
(182, 'Munderi (CT)\r\n', 253),
(183, 'Kanhirode (CT)\r\n', 253),
(184, 'Varam (CT)\r\n', 253),
(185, 'Puzhathi (CT)\r\n', 253),
(186, 'Pallikkunnu (CT)\r\n', 253),
(187, 'Elayavoor (CT)\r\n', 253),
(188, 'Chelora (CT)\r\n', 253),
(189, 'Ancharakandy (CT)\r\n', 253),
(190, 'Iriveri (CT)\r\n', 253),
(191, 'Chala (CT)\r\n', 253),
(192, 'Thottada (CT)\r\n', 253),
(193, 'Kadachira (CT)\r\n', 253),
(194, 'Mavilayi (CT)\r\n', 253),
(195, 'Peralassery (CT)\r\n', 253),
(196, 'Muzhappilangad (CT)\r\n', 253),
(197, 'Thalassery\r\n', 253),
(198, 'Pattannur\r\n', 253),
(199, 'Chavassery\r\n', 253),
(200, 'Keezhur\r\n', 253),
(201, 'Payam\r\n', 253),
(202, 'Vilamana\r\n', 253),
(203, 'Ayyankunnu\r\n', 253),
(204, 'Aralam\r\n', 253),
(205, 'Kottiyoor\r\n', 253),
(206, 'Kelakam\r\n', 253),
(207, 'Kanichar\r\n', 253),
(208, 'Manathana\r\n', 253),
(209, 'Muzhakkunnu\r\n', 253),
(210, 'Thillenkeri\r\n', 253),
(211, 'Tholambra\r\n', 253),
(212, 'Vellarvelly\r\n', 253),
(213, 'Vekkalam\r\n', 253),
(214, 'Koloyad\r\n', 253),
(215, 'Kannavam\r\n', 253),
(216, 'Sivapuram\r\n', 253),
(217, 'Cheruvanchery\r\n', 253),
(218, 'Puthoor\r\n', 253),
(219, 'Thrippangottur\r\n', 253),
(220, 'Koodali (CT)\r\n', 253),
(221, 'Keezhallur (CT)\r\n', 253),
(222, 'Paduvilayi (CT)\r\n', 253),
(223, 'Pathiriyad (CT)\r\n', 253),
(224, 'Mangattidam (CT)\r\n', 253),
(225, 'Kandamkunnu (CT)\r\n', 253),
(226, 'Manantheri (CT)\r\n', 253),
(227, 'Kottayam-Malabar (CT)\r\n', 253),
(228, 'Eruvatti (CT)\r\n', 253),
(229, 'Pinarayi (CT)\r\n', 253),
(230, 'Dharmadom (CT)\r\n', 253),
(231, 'Eranholi (CT)\r\n', 253),
(232, 'Kadirur (CT)\r\n', 253),
(233, 'Pattiom (CT)\r\n', 253),
(234, 'Mokeri (CT)\r\n', 253),
(235, 'Kolavelloor (CT)\r\n', 253),
(236, 'Panoor (CT)\r\n', 253),
(237, 'Panniyannur (CT)\r\n', 253),
(238, 'New Mahe (CT)\r\n', 253),
(239, 'Chockli (CT)\r\n', 253),
(240, 'Peringathur (CT)\r\n', 253),
(241, 'Wayanad\r\n', 262),
(242, 'Mananthavady\r\n', 262),
(243, 'Thirunelly\r\n', 262),
(244, 'Thrissilery\r\n', 262),
(245, 'Payyampally\r\n', 262),
(246, 'Thavinhal\r\n', 262),
(247, 'Periya\r\n', 262),
(248, 'Thondernad\r\n', 262),
(249, 'Valat\r\n', 262),
(250, 'Edavaka\r\n', 262),
(251, 'Nalloornad\r\n', 262),
(252, 'Cherukottur\r\n', 262),
(253, 'Panamaram\r\n', 262),
(254, 'Anchukunnu\r\n', 262),
(255, 'Porunnanore\r\n', 262),
(256, 'Vellamunda\r\n', 262),
(257, 'Kanjirangad\r\n', 262),
(258, 'Sulthanbathery\r\n', 262),
(259, 'Nadavayal \r\n', 262),
(260, 'Poothadi\r\n', 262),
(261, 'Pulpalli\r\n', 262),
(262, 'Padichira\r\n', 262),
(263, 'Kidanganad\r\n', 262),
(264, 'Irulam\r\n', 262),
(265, 'Purakkadi \r\n', 262),
(266, 'Krishnagiri\r\n', 262),
(267, 'Kuppadi\r\n', 262),
(268, 'Noolpuzha\r\n', 262),
(269, 'Cheeral\r\n', 262),
(270, 'Nenmeni\r\n', 262),
(271, 'Ambalavayal\r\n', 262),
(272, 'Thomattuchal\r\n', 262),
(273, 'Vythiri\r\n', 262),
(274, 'Padinharethara\r\n', 262),
(275, 'Kuppadithara\r\n', 262),
(276, 'Kottathara \r\n', 262),
(277, 'Kaniambetta\r\n', 262),
(278, 'Muttil North \r\n', 262),
(279, 'Muttil South\r\n', 262),
(280, 'Vengappally\r\n', 262),
(281, 'Kavumannam\r\n', 262),
(282, 'Thariyode\r\n', 262),
(283, 'Achooranam\r\n', 262),
(284, 'Pozhuthana\r\n', 262),
(285, 'Kunnathidavaka\r\n', 262),
(286, 'Chundale\r\n', 262),
(287, 'Kottappadi (Part)\r\n', 262),
(288, 'Thrikkaipatta (Part)\r\n', 262),
(289, 'Muppainad\r\n', 262),
(290, 'Vellarimala\r\n', 262),
(291, 'Kozhikode\r\n', 256),
(292, 'Vadakara\r\n', 256),
(293, 'Onchiam\r\n', 256),
(294, 'Vanimel\r\n', 256),
(295, 'Vilangad\r\n', 256),
(296, 'Thinoor\r\n', 256),
(297, 'Kavilumpara\r\n', 256),
(298, 'Kayakkodi\r\n', 256),
(299, 'Narippatta\r\n', 256),
(300, 'Purameri\r\n', 256),
(301, 'Thiruvallur\r\n', 256),
(302, 'Velom\r\n', 256),
(303, 'Kuttiadi\r\n', 256),
(304, 'Maruthonkara\r\n', 256),
(305, 'Valayam (CT)\r\n', 256),
(306, 'Chekkiad (CT)\r\n', 256),
(307, 'Thuneri (CT)\r\n', 256),
(308, 'Kunnummal (CT)\r\n', 256),
(309, 'Nadapuram (CT)\r\n', 256),
(310, 'Edacheri (CT)\r\n', 256),
(311, 'Eramala (CT)\r\n', 256),
(312, 'Azhiyur (CT)\r\n', 256),
(313, 'Chorode (CT)\r\n', 256),
(314, 'Ayancheri (CT)\r\n', 256),
(315, 'Kottappally (CT)\r\n', 256),
(316, 'Villiappally (CT)\r\n', 256),
(317, 'Palayad (CT)\r\n', 256),
(318, 'Maniyur (CT)\r\n', 256),
(319, 'Quilandy\r\n', 256),
(320, 'Payyoli\r\n', 256),
(321, 'Cheruvannur\r\n', 256),
(322, 'Palery\r\n', 256),
(323, 'Changaroth\r\n', 256),
(324, 'Chempanoda\r\n', 256),
(325, 'Chakkittapara\r\n', 256),
(326, 'Perambra\r\n', 256),
(327, 'Nochad\r\n', 256),
(328, 'Moodadi\r\n', 256),
(329, 'Arikkulam (Part)\r\n', 256),
(330, 'Kottur\r\n', 256),
(331, 'Kayanna \r\n', 256),
(332, 'Koorachundu \r\n', 256),
(333, 'Kanthalad \r\n', 256),
(334, 'Avitanallur\r\n', 256),
(335, 'Chengottukavu\r\n', 256),
(336, 'Kinalur\r\n', 256),
(337, 'Unnikulam\r\n', 256),
(338, 'Sivapuram\r\n', 256),
(339, 'Iringal (CT)\r\n', 256),
(340, 'Eravattur (CT)\r\n', 256),
(341, 'Koothali (CT)\r\n', 256),
(342, 'Menhaniam (CT)\r\n', 256),
(343, 'Meppayyur (CT)\r\n', 256),
(344, 'Kozhukkallur (CT)\r\n', 256),
(345, 'Thurayur (CT)\r\n', 256),
(346, 'Thikkody (CT)\r\n', 256),
(347, 'Keezhariyur (CT)\r\n', 256),
(348, 'Naduvannur (CT)\r\n', 256),
(349, 'Panangad (CT)\r\n', 256),
(350, 'Balusseri (CT)\r\n', 256),
(351, 'Ulliyeri (CT)\r\n', 256),
(352, 'Chemancheri (CT)\r\n', 256),
(353, 'Atholi (CT)\r\n', 256),
(354, 'Kakkur\r\n', 256),
(355, 'Narikkuni\r\n', 256),
(356, 'Kizhakkoth\r\n', 256),
(357, 'Vavad\r\n', 256),
(358, 'Raroth\r\n', 256),
(359, 'Kedavur\r\n', 256),
(360, 'Puthuppadi\r\n', 256),
(361, 'Engapuzha\r\n', 256),
(362, 'Koodathayi \r\n', 256),
(363, 'Kodencheri\r\n', 256),
(364, 'Nellipoyil\r\n', 256),
(365, 'Koodaranji\r\n', 256),
(366, 'Thiruvambadi\r\n', 256),
(367, 'Neeleswaram \r\n', 256),
(368, 'Puthur\r\n', 256),
(369, 'Chathamangalam \r\n', 256),
(370, 'Madavoor\r\n', 256),
(371, 'Kumaranallur\r\n', 256),
(372, 'Kakkad\r\n', 256),
(373, 'Kodiyathur\r\n', 256),
(374, 'Nanmanda (CT)\r\n', 256),
(375, 'Chelannur (CT)\r\n', 256),
(376, 'Thalakkulathur (CT)\r\n', 256),
(377, 'Kakkodi (CT)\r\n', 256),
(378, 'Kuruvattur (CT)\r\n', 256),
(379, 'Kunnamangalam (CT)\r\n', 256),
(380, 'Poolacode (CT)\r\n', 256),
(381, 'Thazhecode (CT)\r\n', 256),
(382, 'Mavoor (CT)\r\n', 256),
(383, 'Peruvayal (CT)\r\n', 256),
(384, 'Kuttikkattoor (CT)\r\n', 256),
(385, 'Olavanna (CT)\r\n', 256),
(386, 'Pantheeramkavu (CT)\r\n', 256),
(387, 'Perumanna (CT)\r\n', 256),
(388, 'Ramanattukara (CT)\r\n', 256),
(389, 'Cheruvannur (CT)\r\n', 256),
(390, 'Beypore (CT)\r\n', 256),
(391, 'Karuvanthuruthy (CT)\r\n', 256),
(392, 'Feroke (CT)\r\n', 256),
(393, 'Koduvally (OG)\r\n', 256),
(394, 'Elathur (OG)\r\n', 256),
(395, 'Kadalundi (OG)\r\n', 256),
(396, 'Puthiyangadi (OG) (Part)\r\n', 256),
(397, 'Malappuram\r\n', 257),
(398, 'Ernad\r\n', 257),
(399, 'Vettilappara\r\n', 257),
(400, 'Vazhakkad\r\n', 257),
(401, 'Pulikkal\r\n', 257),
(402, 'Cheekkode\r\n', 257),
(403, 'Areekode\r\n', 257),
(404, 'Urangattiri\r\n', 257),
(405, 'Perakamanna\r\n', 257),
(406, 'Edavanna\r\n', 257),
(407, 'Karakunnu\r\n', 257),
(408, 'Kavanoor\r\n', 257),
(409, 'Kuzhimanna\r\n', 257),
(410, 'Muthuvallur\r\n', 257),
(411, 'Nediyiruppu\r\n', 257),
(412, 'Morayur\r\n', 257),
(413, 'Pookkottur\r\n', 257),
(414, 'Pulpatta\r\n', 257),
(415, 'Trikkalangode\r\n', 257),
(416, 'Elankur\r\n', 257),
(417, 'Pandalur\r\n', 257),
(418, 'Vettikkattiri\r\n', 257),
(419, 'Chembrasseri\r\n', 257),
(420, 'Pandikkad\r\n', 257),
(421, 'Kizhuparamba (CT)\r\n', 257),
(422, 'Vazhayur (CT)\r\n', 257),
(423, 'Cherukavu (CT)\r\n', 257),
(424, 'Kondotty (CT)\r\n', 257),
(425, 'Anakkayam (OG)\r\n', 257),
(426, 'Nilambur\r\n', 257),
(427, 'Pullipadam \r\n', 257),
(428, 'Akampadam\r\n', 257),
(429, 'Kurumbilangode\r\n', 257),
(430, 'Chungathara\r\n', 257),
(431, 'Edakkara\r\n', 257),
(432, 'Vazhikkadavu\r\n', 257),
(433, 'Amarambalam\r\n', 257),
(434, 'Karulai\r\n', 257),
(435, 'Mambad\r\n', 257),
(436, 'Thiruvali\r\n', 257),
(437, 'Porur\r\n', 257),
(438, 'Wandoor\r\n', 257),
(439, 'Chekkode\r\n', 257),
(440, 'Kalikavu\r\n', 257),
(441, 'Vellayur\r\n', 257),
(442, 'Thuvvur\r\n', 257),
(443, 'Kerala Estate\r\n', 257),
(444, 'Karuvarakundu\r\n', 257),
(445, 'Nilambur (CT)\r\n', 257),
(446, 'Perinthalmanna\r\n', 257),
(447, 'Edappatta\r\n', 257),
(448, 'Melattur\r\n', 257),
(449, 'Keezhattur\r\n', 257),
(450, 'Nenmini\r\n', 257),
(451, 'Mankada\r\n', 257),
(452, 'Vadakkangara\r\n', 257),
(453, 'Kuruva\r\n', 257),
(454, 'Puzhakkattiri\r\n', 257),
(455, 'Valambur\r\n', 257),
(456, 'Angadippuram\r\n', 257),
(457, 'Kariavattom\r\n', 257),
(458, 'Vettathur\r\n', 257),
(459, 'Arakkuparamba\r\n', 257),
(460, 'Thazhekode\r\n', 257),
(461, 'Aliparamba\r\n', 257),
(462, 'Anamangad\r\n', 257),
(463, 'Elamkulam\r\n', 257),
(464, 'Pulamanthole\r\n', 257),
(465, 'Kuruvambalam\r\n', 257),
(466, 'Moorkkanad\r\n', 257),
(467, 'Koottilangadi (CT)\r\n', 257),
(468, 'Kodur (CT)\r\n', 257),
(469, 'Tirur\r\n', 257),
(470, 'Pariyapuram\r\n', 257),
(471, 'Tanur \r\n', 257),
(472, 'Ozhur\r\n', 257),
(473, 'Niramaruthur\r\n', 257),
(474, 'Valavannur\r\n', 257),
(475, 'Kalpakancheri\r\n', 257),
(476, 'Marakkara\r\n', 257),
(477, 'Ponmala\r\n', 257),
(478, 'Melmuri\r\n', 257),
(479, 'Edayoor\r\n', 257),
(480, 'Athavanad\r\n', 257),
(481, 'Kurumbathur\r\n', 257),
(482, 'Ananthavoor\r\n', 257),
(483, 'Vettom\r\n', 257),
(484, 'Purathur\r\n', 257),
(485, 'Mangalam\r\n', 257),
(486, 'Kottakkal (CT)\r\n', 257),
(487, 'Perumanna (CT)\r\n', 257),
(488, 'Ponmundam (CT)\r\n', 257),
(489, 'Tanalur (CT)\r\n', 257),
(490, 'Cheriyamundam (CT)\r\n', 257),
(491, 'Kattipparuthi (CT)\r\n', 257),
(492, 'Talakkad (CT)\r\n', 257),
(493, 'Triprangode (CT)\r\n', 257),
(494, 'Thirunavaya (CT)\r\n', 257),
(495, 'Naduvattom (CT)\r\n', 257),
(496, 'Kuttippuram (CT)\r\n', 257),
(497, 'Irimbiliyam (CT)\r\n', 257),
(498, 'Tirurangadi\r\n', 257),
(499, 'Vallikkunnu\r\n', 257),
(500, 'Parappanangadi \r\n', 257),
(501, 'Chelambra (CT)\r\n', 257),
(502, 'Pallikal (CT)\r\n', 257),
(503, 'Thenhippalam (CT)\r\n', 257),
(504, 'Ariyallur (CT)\r\n', 257),
(505, 'Moonniyur (CT)\r\n', 257),
(506, 'Peruvallur (CT)\r\n', 257),
(507, 'Kannamangalam (CT)\r\n', 257),
(508, 'Urakam (CT)\r\n', 257),
(509, 'Othukkungal (CT)\r\n', 257),
(510, 'Parappur (CT)\r\n', 257),
(511, 'Vengara (CT)\r\n', 257),
(512, 'Abdu Rahiman Nagar (CT)\r\n', 257),
(513, 'Tirurangadi (CT)\r\n', 257),
(514, 'Neduva (CT)\r\n', 257),
(515, 'Nannambra (CT)\r\n', 257),
(516, 'Thennala (CT)\r\n', 257),
(517, 'Ponnani\r\n', 257),
(518, 'Tavanur\r\n', 257),
(519, 'Vattamkulam\r\n', 257),
(520, 'Veliyankode\r\n', 257),
(521, 'Perumpadappa\r\n', 257),
(522, 'Nannamukku\r\n', 257),
(523, 'Kalady (CT)\r\n', 257),
(524, 'Edappal (CT)\r\n', 257),
(525, 'Alamcode (CT)\r\n', 257),
(526, 'Marancheri (CT)\r\n', 257),
(527, 'Palakkad\r\n', 258),
(528, 'Ottappalam\r\n', 258),
(529, 'Anakkara\r\n', 258),
(530, 'Parudur\r\n', 258),
(531, 'Thiruvegapura\r\n', 258),
(532, 'Vilayur\r\n', 258),
(533, 'Kulukkallur\r\n', 258),
(534, 'Nellaya\r\n', 258),
(535, 'Cherpulacherry\r\n', 258),
(536, 'Vellinezhi\r\n', 258),
(537, 'Karimpuzha-I\r\n', 258),
(538, 'Karimpuzha-II\r\n', 258),
(539, 'Kadampazhipuram-II\r\n', 258),
(540, 'Kadampazhipuram-I\r\n', 258),
(541, 'Sreekrishnapuram -I\r\n', 258),
(542, 'Sreekrishnapuram -II\r\n', 258),
(543, 'Thrikkadeeri -II\r\n', 258),
(544, 'Thrikkadeeri -I\r\n', 258),
(545, 'Ananganadi\r\n', 258),
(546, 'Chalavara\r\n', 258),
(547, 'Vallapuzha\r\n', 258),
(548, 'Koppam\r\n', 258),
(549, 'Pattithara\r\n', 258),
(550, 'Kappur\r\n', 258),
(551, 'Chalissery\r\n', 258),
(552, 'Nagalassery\r\n', 258),
(553, 'Thirumittacode-I\r\n', 258),
(554, 'Vaniyamkulam-I\r\n', 258),
(555, 'Ambalapara - II\r\n', 258),
(556, 'Ambalapara - I\r\n', 258),
(557, 'Lakkidi-Perur- I \r\n', 258),
(558, 'Lakkidi-Perur- II \r\n', 258),
(559, 'Ongallur -II (CT)\r\n', 258),
(560, 'Ongallur -I (CT)\r\n', 258),
(561, 'Pattambi (CT)\r\n', 258),
(562, 'Muthuthala (CT)\r\n', 258),
(563, 'Thrithala (CT)\r\n', 258),
(564, 'Vaniyamkulam- II (CT)\r\n', 258),
(565, 'Thirumittacode -II (CT)\r\n', 258),
(566, 'Mannarkad\r\n', 258),
(567, 'Alanallur-I\r\n', 258),
(568, 'Alanallur-II\r\n', 258),
(569, 'Alanallur-III\r\n', 258),
(570, 'Kottoppadam-I\r\n', 258),
(571, 'Kottoppadam-III\r\n', 258),
(572, 'Payyanadam\r\n', 258),
(573, 'Padavayal\r\n', 258),
(574, 'Pudur\r\n', 258),
(575, 'Agali\r\n', 258),
(576, 'Kottathara\r\n', 258),
(577, 'Sholayur\r\n', 258),
(578, 'Kallamala\r\n', 258),
(579, 'Palakkayam\r\n', 258),
(580, 'Mannarkad-II\r\n', 258),
(581, 'Pottassery- I\r\n', 258),
(582, 'Pottassery- II\r\n', 258),
(583, 'Thachampara\r\n', 258),
(584, 'Karimba -I\r\n', 258),
(585, 'Karimba -II\r\n', 258),
(586, 'Karakurissi\r\n', 258),
(587, 'Kumaramputhur\r\n', 258),
(588, 'Kottoppadam-II\r\n', 258),
(589, 'Thachanattukara-I\r\n', 258),
(590, 'Thachanattukara-II\r\n', 258),
(591, 'Mannarkad-I (CT)\r\n', 258),
(592, 'Kongad-II\r\n', 258),
(593, 'Keralassery\r\n', 258),
(594, 'Mannur\r\n', 258),
(595, 'Mankara\r\n', 258),
(596, 'Kongad-I\r\n', 258),
(597, 'Mundur-II\r\n', 258),
(598, 'Mundur-I\r\n', 258),
(599, 'Parli-I\r\n', 258),
(600, 'Parli-II\r\n', 258),
(601, 'Puthuppariyaram-I\r\n', 258),
(602, 'Malampuzha-I\r\n', 258),
(603, 'Malampuzha-II\r\n', 258),
(604, 'Kannadi-I\r\n', 258),
(605, 'Kannadi-II\r\n', 258),
(606, 'Kodumba\r\n', 258),
(607, 'Peruvemba\r\n', 258),
(608, 'Polpully\r\n', 258),
(609, 'Elappully-II\r\n', 258),
(610, 'Elappully-I\r\n', 258),
(611, 'Pudussery East\r\n', 258),
(612, 'Puthuppariyaram (CT)\r\n', 258),
(613, 'Hemambikanagar (CT)\r\n', 258),
(614, 'Pudussery Central (CT)\r\n', 258),
(615, 'Pudussery West (CT)\r\n', 258),
(616, 'Marutharode (CT)\r\n', 258),
(617, 'Pirayiri (CT)\r\n', 258),
(618, 'Chittur\r\n', 258),
(619, 'Koduvayur-II\r\n', 258),
(620, 'Thathamangalam (Part)\r\n', 258),
(621, 'Chittur (Part)\r\n', 258),
(622, 'Thekkedesom\r\n', 258),
(623, 'Nalleppilly\r\n', 258),
(624, 'Kozhinjampara\r\n', 258),
(625, 'Vadakarapathy\r\n', 258),
(626, 'Ozhalapathy\r\n', 258),
(627, 'Eruthempathy\r\n', 258),
(628, 'Kozhipathy\r\n', 258),
(629, 'Valiyavallampathy\r\n', 258),
(630, 'Moolathara\r\n', 258),
(631, 'Perumatty\r\n', 258),
(632, 'Vandithavalam\r\n', 258),
(633, 'Pattanchery\r\n', 258),
(634, 'Vadavannur\r\n', 258),
(635, 'Pallassana\r\n', 258),
(636, 'Vallanghy\r\n', 258),
(637, 'Nemmara\r\n', 258),
(638, 'Ayiloor\r\n', 258),
(639, 'Kairady\r\n', 258),
(640, 'Thiruvazhiyad\r\n', 258),
(641, 'Nelliyampathy\r\n', 258),
(642, 'Elavancherry\r\n', 258),
(643, 'Kollengode-II\r\n', 258),
(644, 'Kollengode-I\r\n', 258),
(645, 'Muthalamada-I\r\n', 258),
(646, 'Muthalamada-II\r\n', 258),
(647, 'Koduvayur (CT)\r\n', 258),
(648, 'Puthunagaram (CT)\r\n', 258),
(649, 'Alathur\r\n', 258),
(650, 'Peringottukurissi-II\r\n', 258),
(651, 'Peringottukurissi-I\r\n', 258),
(652, 'Kottayi-I\r\n', 258),
(653, 'Kottayi-II\r\n', 258),
(654, 'Mathur -I\r\n', 258),
(655, 'Mathur -II\r\n', 258),
(656, 'Kuzhalmannam-II\r\n', 258),
(657, 'Thenkurissi-I\r\n', 258),
(658, 'Thenkurissi-II \r\n', 258),
(659, 'Kuzhalmannam-I\r\n', 258),
(660, 'Kuthannur-I\r\n', 258),
(661, 'Kuthannur-II\r\n', 258),
(662, 'Tarur-I\r\n', 258),
(663, 'Tarur-II\r\n', 258),
(664, 'Erimayur-I \r\n', 258),
(665, 'Erimayur-II\r\n', 258),
(666, 'Melarcode \r\n', 258),
(667, 'Kavasseri-I\r\n', 258),
(668, 'Kavasseri-II\r\n', 258),
(669, 'Puducode\r\n', 258),
(670, 'Kannambra-I\r\n', 258),
(671, 'Kannambra-II\r\n', 258),
(672, 'Vadakkancheri-I\r\n', 258),
(673, 'Vadakkancheri-II\r\n', 258),
(674, 'Vandazhi-II\r\n', 258),
(675, 'Vandazhi-I\r\n', 258),
(676, 'Mangalam Dam\r\n', 258),
(677, 'Kizhakkencheri-II\r\n', 258),
(678, 'Kizhakkencheri-I\r\n', 258),
(679, 'Alathur (CT)\r\n', 258),
(680, 'Thrissur\r\n', 260),
(681, 'Talappilly\r\n', 260),
(682, 'Perumpilavu\r\n', 260),
(683, 'Kadangode\r\n', 260),
(684, 'Thichur\r\n', 260),
(685, 'Arangottukara\r\n', 260),
(686, 'Pallur\r\n', 260),
(687, 'Thalassery\r\n', 260),
(688, 'Pilakkad\r\n', 260),
(689, 'Varavoor\r\n', 260),
(690, 'Painkulam\r\n', 260),
(691, 'Mayannur\r\n', 260),
(692, 'Pampady\r\n', 260),
(693, 'Thiruvilwamala\r\n', 260),
(694, 'Vadakkethara\r\n', 260),
(695, 'Kondazhy\r\n', 260),
(696, 'Chelakode\r\n', 260),
(697, 'Venganellur\r\n', 260),
(698, 'Killimangalam\r\n', 260),
(699, 'Panjal\r\n', 260),
(700, 'Attoor\r\n', 260),
(701, 'Mullurkara\r\n', 260),
(702, 'Kanjirakode\r\n', 260),
(703, 'Vellarakkad\r\n', 260),
(704, 'Chowwannur(Part)\r\n', 260),
(705, 'Mangad (Part)\r\n', 260),
(706, 'Kanipayyur (Part)\r\n', 260),
(707, 'Chemmanthatta\r\n', 260),
(708, 'Vellattanjur\r\n', 260),
(709, 'Thayyur\r\n', 260),
(710, 'Kiralur\r\n', 260),
(711, 'Parlikad\r\n', 260),
(712, 'Puthuruthy\r\n', 260),
(713, 'Thekkumkara\r\n', 260),
(714, 'Karumathara\r\n', 260),
(715, 'Viruppakka\r\n', 260),
(716, 'Manalithara\r\n', 260),
(717, 'Kurumala\r\n', 260),
(718, 'Thonnurkara\r\n', 260),
(719, 'Pangarappilly\r\n', 260),
(720, 'Pulakode\r\n', 260),
(721, 'Pazhayannur\r\n', 260),
(722, 'Vennur\r\n', 260),
(723, 'Elanad\r\n', 260),
(724, 'Kaniyarkode (CT)\r\n', 260),
(725, 'Cheruthuruthi (CT)\r\n', 260),
(726, 'Nedumpura (CT)\r\n', 260),
(727, 'Desamangalam (CT)\r\n', 260),
(728, 'Kadavallur (CT)\r\n', 260),
(729, 'Kattakampal (CT)\r\n', 260),
(730, 'Pazhanji (CT)\r\n', 260),
(731, 'Karikkad (CT)\r\n', 260),
(732, 'Nelluwaya (CT)\r\n', 260),
(733, 'Kottappuram (CT)\r\n', 260),
(734, 'Chittanda (CT)\r\n', 260),
(735, 'Kumaranellur (CT)\r\n', 260),
(736, 'Chelakkara (CT)\r\n', 260),
(737, 'Enkakkad (CT)\r\n', 260),
(738, 'Wadakkanchery (CT)\r\n', 260),
(739, 'Kariyannur (CT)\r\n', 260),
(740, 'Eyyal (CT)\r\n', 260),
(741, 'Chiramanangad (CT)\r\n', 260),
(742, 'Akathiyoor (CT)\r\n', 260),
(743, 'Porkulam (CT)\r\n', 260),
(744, 'Choondal (CT)\r\n', 260),
(745, 'Chiranellur (CT)\r\n', 260),
(746, 'Velur (CT)\r\n', 260),
(747, 'Mundathikode (CT)\r\n', 260),
(748, 'Peringandoor (CT)\r\n', 260),
(749, 'Minalur (CT)\r\n', 260),
(750, 'Eranellur (CT)\r\n', 260),
(751, 'Alur (CT)\r\n', 260),
(752, 'Kandanassery (CT)\r\n', 260),
(753, 'Chavakkad\r\n', 260),
(754, 'Kadappuram \r\n', 260),
(755, 'Annakara\r\n', 260),
(756, 'Irimbranallur\r\n', 260),
(757, 'Kundazhiyur\r\n', 260),
(758, 'Engandiyur\r\n', 260),
(759, 'Nattika\r\n', 260),
(760, 'Valappad\r\n', 260),
(761, 'Kadikkad (CT)\r\n', 260),
(762, 'Punnayurkulam (CT)\r\n', 260),
(763, 'Vadakkekad (CT)\r\n', 260),
(764, 'Punnayur (CT)\r\n', 260),
(765, 'Edakkazhiyur (CT)\r\n', 260),
(766, 'Vylathur (CT)\r\n', 260),
(767, 'Pookode (CT)\r\n', 260),
(768, 'Iringaprom (CT)\r\n', 260),
(769, 'Perakam (CT)\r\n', 260),
(770, 'Orumanayur (CT)\r\n', 260),
(771, 'Paluvai (CT)\r\n', 260),
(772, 'Thaikkad (CT)\r\n', 260),
(773, 'Brahmakulam (CT)\r\n', 260),
(774, 'Elavally (CT)\r\n', 260),
(775, 'Pavaratty (CT)\r\n', 260),
(776, 'Venmanad (CT)\r\n', 260),
(777, 'Mullassery (CT)\r\n', 260),
(778, 'Venkitangu (CT)\r\n', 260),
(779, 'Vadanappally (CT)\r\n', 260),
(780, 'Talikkulam (CT)\r\n', 260),
(781, 'Velappaya\r\n', 260),
(782, 'Madakkathara\r\n', 260),
(783, 'Chalakkal\r\n', 260),
(784, 'Pananchery\r\n', 260),
(785, 'Peechi\r\n', 260),
(786, 'Mannamangalam\r\n', 260),
(787, 'Mulayam\r\n', 260),
(788, 'Pullu\r\n', 260),
(789, 'Pallippuram\r\n', 260),
(790, 'Alappad\r\n', 260),
(791, 'Chazhoor\r\n', 260),
(792, 'Inchamudi\r\n', 260),
(793, 'Arattupuzha\r\n', 260),
(794, 'Killannur (CT)\r\n', 260),
(795, 'Thangalur (CT)\r\n', 260),
(796, 'Avanur (CT)\r\n', 260),
(797, 'Anjur (CT)\r\n', 260),
(798, 'Kaiparamba (CT)\r\n', 260),
(799, 'Tholur (CT)\r\n', 260),
(800, 'Edakkalathur (CT)\r\n', 260),
(801, 'Peramangalam (CT)\r\n', 260),
(802, 'Choolissery (CT)\r\n', 260),
(803, 'Pottore (CT)\r\n', 260),
(804, 'Kolazhy (CT)\r\n', 260),
(805, 'Kurichikkara (CT)\r\n', 260),
(806, 'Vellanikkara (CT)\r\n', 260),
(807, 'Kuttoor (CT)\r\n', 260),
(808, 'Puzhakkal (CT)\r\n', 260),
(809, 'Puranattukara (CT)\r\n', 260),
(810, 'Chittilappilly (CT)\r\n', 260),
(811, 'Adat (CT)\r\n', 260),
(812, 'Kozhukkully (CT)\r\n', 260),
(813, 'Kainoor (CT)\r\n', 260),
(814, 'Nadathara (CT)\r\n', 260),
(815, 'Parakkad (CT)\r\n', 260),
(816, 'Karamuck (CT)\r\n', 260),
(817, 'Manalur (CT)\r\n', 260),
(818, 'Eravu (CT)\r\n', 260),
(819, 'Veluthur (CT)\r\n', 260),
(820, 'Manakkody (CT)\r\n', 260),
(821, 'Marathakkara (CT)\r\n', 260),
(822, 'Puthur (CT)\r\n', 260),
(823, 'Avinissery (CT)\r\n', 260),
(824, 'Palissery (CT)\r\n', 260),
(825, 'Venginissery (CT)\r\n', 260),
(826, 'Kodannur (CT)\r\n', 260),
(827, 'Anthicad (CT)\r\n', 260),
(828, 'Padiyam (CT)\r\n', 260),
(829, 'Vadakkummuri (CT)\r\n', 260),
(830, 'Kizhakkummuri (CT)\r\n', 260),
(831, 'Cherpu (CT)\r\n', 260),
(832, 'Paralam (CT)\r\n', 260),
(833, 'Chevvoor (CT)\r\n', 260),
(834, 'Vallachira (CT)\r\n', 260),
(835, 'Oorakam (CT)\r\n', 260),
(836, 'Kurumpilavu (CT)\r\n', 260),
(837, 'Kizhuppillikkara (CT)\r\n', 260),
(838, 'Thanniyam (CT)\r\n', 260),
(839, 'Kodungallur\r\n', 260),
(840, 'Koolimuttam\r\n', 260),
(841, 'Padinjare Vemballur\r\n', 260),
(842, 'Azhikode\r\n', 260),
(843, 'Edathiruthy (CT)\r\n', 260),
(844, 'Chendrappini (CT)\r\n', 260),
(845, 'Kaipamangalam (CT)\r\n', 260),
(846, 'Perinjanam (CT)\r\n', 260),
(847, 'Pappinivattom (CT)\r\n', 260),
(848, 'Panangad (CT)\r\n', 260),
(849, 'Edavilangu (CT)\r\n', 260),
(850, 'Ala (CT)\r\n', 260),
(851, 'Pallippuram (CT)\r\n', 260),
(852, 'Methala (CT)\r\n', 260),
(853, 'Poyya (CT)\r\n', 260),
(854, 'Madathumpady (CT)\r\n', 260),
(855, 'Eriyad (OG)\r\n', 260),
(856, 'Mukundapuram\r\n', 260),
(857, 'Karalam (Part)\r\n', 260),
(858, 'Thottippal\r\n', 260),
(859, 'Kallur\r\n', 260),
(860, 'Varandarappilly\r\n', 260),
(861, 'Mupliyam\r\n', 260),
(862, 'Nandipulam\r\n', 260),
(863, 'Chengallur\r\n', 260),
(864, 'Nellayi\r\n', 260),
(865, 'Anandapuram\r\n', 260),
(866, 'Muriyad\r\n', 260),
(867, 'Irinjalakuda (Part)\r\n', 260),
(868, 'Kaduppassery\r\n', 260),
(869, 'Kodakara\r\n', 260),
(870, 'Mattathur\r\n', 260),
(871, 'Vellikulangara\r\n', 260),
(872, 'Kuttichira\r\n', 260),
(873, 'Kodassery \r\n', 260),
(874, 'Pariyaram\r\n', 260),
(875, 'Elanjipra\r\n', 260),
(876, 'Alur\r\n', 260),
(877, 'Thazhekkad\r\n', 260),
(878, 'Kottanellur\r\n', 260),
(879, 'Vallivattom\r\n', 260),
(880, 'Karumathra\r\n', 260),
(881, 'Puthenchira\r\n', 260),
(882, 'Vadakkumbhagom\r\n', 260),
(883, 'Annallur\r\n', 260),
(884, 'Melur\r\n', 260),
(885, 'Kizhakkummuri\r\n', 260),
(886, 'Alathur\r\n', 260),
(887, 'Kuruvilassery\r\n', 260),
(888, 'Kakkulissery\r\n', 260),
(889, 'Thirumukkulam\r\n', 260),
(890, 'Trikkur (CT)\r\n', 260),
(891, 'Nenmenikkara (CT)\r\n', 260),
(892, 'Amballur (CT)\r\n', 260),
(893, 'Puthukkad (CT)\r\n', 260),
(894, 'Parappukkara (CT)\r\n', 260),
(895, 'Kattur (CT)\r\n', 260),
(896, 'Porathissery (CT)\r\n', 260),
(897, 'Madayikonam (CT)\r\n', 260),
(898, 'Kallettumkara (CT)\r\n', 260),
(899, 'Pullur (CT)\r\n', 260),
(900, 'Manavalassery (CT)\r\n', 260),
(901, 'Edathirinji (CT)\r\n', 260),
(902, 'Vellookkara (CT)\r\n', 260),
(903, 'Vadakkumkara (CT)\r\n', 260),
(904, 'Poomangalam (CT)\r\n', 260),
(905, 'Padiyur (CT)\r\n', 260),
(906, 'Thekkumkara (CT)\r\n', 260),
(907, 'Muringur Vadakkummuri (CT)\r\n', 260),
(908, 'Koratty (CT)\r\n', 260),
(909, 'Kallur Vadakkummuri (CT)\r\n', 260),
(910, 'Vadama (CT)\r\n', 260),
(911, 'Kallur Thekkummuri (CT)\r\n', 260),
(912, 'Ernakulam\r\n', 250),
(913, 'Kunnathunad\r\n', 250),
(914, 'Kodanad\r\n', 250),
(915, 'Kombanad\r\n', 250),
(916, 'Vengoor\r\n', 250),
(917, 'Vengoor West\r\n', 250),
(918, 'Asamannoor\r\n', 250),
(919, 'Rayamangalam\r\n', 250),
(920, 'Arakapady\r\n', 250),
(921, 'Irapuram \r\n', 250),
(922, 'Mazhuvannoor\r\n', 250),
(923, 'Pattimattom \r\n', 250),
(924, 'Kizhakkambalam\r\n', 250),
(925, 'Vadavukode\r\n', 250),
(926, 'Aikaranad North\r\n', 250),
(927, 'Aikaranad South\r\n', 250),
(928, 'Thiruvaniyoor\r\n', 250),
(929, 'Koovappady (CT)\r\n', 250),
(930, 'Chelamattom (CT)\r\n', 250),
(931, 'Marampilly(CT)\r\n', 250),
(932, 'Vazhakulam (CT)\r\n', 250),
(933, 'Vengola (CT)\r\n', 250),
(934, 'Perumbavoor (CT)\r\n', 250),
(935, 'Kunnathunad (CT)\r\n', 250),
(936, 'Puthencruz (CT)\r\n', 250),
(937, 'Aluva\r\n', 250),
(938, 'Parakkadavu\r\n', 250),
(939, 'Karukutty\r\n', 250),
(940, 'Mookkannoor\r\n', 250),
(941, 'Ayyampuzha\r\n', 250),
(942, 'Manjapra\r\n', 250),
(943, 'Malayattoor\r\n', 250),
(944, 'Thuravoor\r\n', 250),
(945, 'Kalady (CT)\r\n', 250),
(946, 'Mattoor (CT)\r\n', 250),
(947, 'Vadakkumbhagom (CT)\r\n', 250),
(948, 'Chowwara (CT)\r\n', 250),
(949, 'Nedumbassery (CT)\r\n', 250),
(950, 'Chengamanad (CT)\r\n', 250),
(951, 'Kizhakkumbhagom (CT)\r\n', 250),
(952, 'Thekkumbhagom (CT)\r\n', 250),
(953, 'Edathala (CT)\r\n', 250),
(954, 'Choornikkara (CT)\r\n', 250),
(955, 'Paravur\r\n', 250),
(956, 'Kunnukara\r\n', 250),
(957, 'Ezhikkara\r\n', 250),
(958, 'Puthenvelikkara (CT)\r\n', 250),
(959, 'Chendamangalam (CT)\r\n', 250),
(960, 'Moothakunnam (CT)\r\n', 250),
(961, 'Vadakkekara (CT)\r\n', 250),
(962, 'Karumalloor (CT)\r\n', 250),
(963, 'Kadungalloor (CT)\r\n', 250),
(964, 'Alangad (CT)\r\n', 250),
(965, 'Kottuvally (CT)\r\n', 250),
(966, 'Varappuzha (CT)\r\n', 250),
(967, 'Eloor (CT)\r\n', 250),
(968, 'Kedamangalam (OG) (Part)\r\n', 250),
(969, 'Kochi\r\n', 250),
(970, 'Kuzhuppilly\r\n', 250),
(971, 'Pallippuram\r\n', 250),
(972, 'Edavanakkad\r\n', 250),
(973, 'Nayarambalam\r\n', 250),
(974, 'Chellanam\r\n', 250),
(975, 'Njarackal (CT)\r\n', 250),
(976, 'Elamkunnapuzha (CT)\r\n', 250),
(977, 'Puthuvype (CT)\r\n', 250),
(978, 'Kumbalangy (CT)\r\n', 250),
(979, 'Cheriyakadavu (OG) (Part)\r\n', 250),
(980, 'Kanayannur\r\n', 250),
(981, 'Thrikkakara North (Part)\r\n', 250),
(982, 'Edakkattuvayal\r\n', 250),
(983, 'Kaippattur\r\n', 250),
(984, 'Kulayettikara\r\n', 250),
(985, 'Keecherry\r\n', 250),
(986, 'Kakkanad (CT)\r\n', 250),
(987, 'Vazhakkala (CT)\r\n', 250),
(988, 'Cheranallur (CT)\r\n', 250),
(989, 'Kadamakkudy (CT)\r\n', 250),
(990, 'Mulavukad (CT)\r\n', 250),
(991, 'Thiruvankulam (CT)\r\n', 250),
(992, 'Kanayannur (CT)\r\n', 250),
(993, 'Kureekkad (CT)\r\n', 250),
(994, 'Maradu (CT)\r\n', 250),
(995, 'Kumbalam (CT)\r\n', 250),
(996, 'Manakunnam (CT)\r\n', 250),
(997, 'Mulamthuruthy (CT)\r\n', 250),
(998, 'Amballur (CT)\r\n', 250),
(999, 'Muvattupuzha\r\n', 250),
(1000, 'Valakam\r\n', 250),
(1001, 'Mulavoor\r\n', 250),
(1002, 'Enanalloor \r\n', 250),
(1003, 'Kalloorkkad \r\n', 250),
(1004, 'Manjalloor\r\n', 250),
(1005, 'Muvattupuzha (Part)\r\n', 250),
(1006, 'Arakuzha\r\n', 250),
(1007, 'Marady (Part)\r\n', 250),
(1008, 'Memury\r\n', 250),
(1009, 'Ramamangalam\r\n', 250),
(1010, 'Maneed\r\n', 250),
(1011, 'Piravom\r\n', 250),
(1012, 'Onakkoor\r\n', 250),
(1013, 'Thirumarady\r\n', 250),
(1014, 'Palakkuzha\r\n', 250),
(1015, 'Koothattukulam\r\n', 250),
(1016, 'Elanji\r\n', 250),
(1017, 'Velloorkunnam (CT)\r\n', 250),
(1018, 'Kothamangalam\r\n', 250),
(1019, 'Thrikkariyoor (Part)\r\n', 250),
(1020, 'Kottappady\r\n', 250),
(1021, 'Pindimana\r\n', 250),
(1022, 'Kuttampuzha\r\n', 250),
(1023, 'Keerampara\r\n', 250),
(1024, 'Kuttamangalam\r\n', 250),
(1025, 'Neriamangalam \r\n', 250),
(1026, 'Kedavoor\r\n', 250),
(1027, 'Pothanikkad\r\n', 250),
(1028, 'Varappetty\r\n', 250),
(1029, 'Eramalloor (CT)\r\n', 250),
(1030, 'Idukki \r\n', 251),
(1031, 'Devikulam\r\n', 251),
(1032, 'Marayoor\r\n', 251),
(1033, 'Keezhanthoor\r\n', 251),
(1034, 'Kanthalloor\r\n', 251),
(1035, 'Kottakamboor\r\n', 251),
(1036, 'Vattavada\r\n', 251),
(1037, 'Kannan Devan Hills\r\n', 251),
(1038, 'Mankulam\r\n', 251),
(1039, 'Mannamkandam\r\n', 251),
(1040, 'Anaviratty\r\n', 251),
(1041, 'Pallivasal\r\n', 251),
(1042, 'Kunjithanny\r\n', 251),
(1043, 'Vellathuval\r\n', 251),
(1044, 'Udumbanchola\r\n', 251),
(1045, 'Konnathady\r\n', 251),
(1046, 'Rajakkad \r\n', 251),
(1047, 'Baisonvally\r\n', 251),
(1048, 'Chinnakanal\r\n', 251),
(1049, 'Poopara \r\n', 251),
(1050, 'Rajakumari\r\n', 251),
(1051, 'Kanthippara\r\n', 251),
(1052, 'Santhanpara\r\n', 251),
(1053, 'Chathurangapara\r\n', 251),
(1054, 'Vathikudy\r\n', 251),
(1055, 'Upputhode\r\n', 251),
(1056, 'Thankamony\r\n', 251),
(1057, 'Kalkoonthal\r\n', 251),
(1058, 'Parathodu\r\n', 251),
(1059, 'Pampadumpara\r\n', 251),
(1060, 'Karunapuram\r\n', 251),
(1061, 'Vandanmedu\r\n', 251),
(1062, 'Kattappana\r\n', 251),
(1063, 'Ayyappancoil\r\n', 251),
(1064, 'Anavilasam \r\n', 251),
(1065, 'Chakkupallam\r\n', 251),
(1066, 'Anakkara\r\n', 251),
(1067, 'Thodupuzha\r\n', 251),
(1068, 'Kumaramangalam (Part)\r\n', 251),
(1069, 'Kodikulam \r\n', 251),
(1070, 'Vannapuram\r\n', 251),
(1071, 'Kanjikuzhi\r\n', 251),
(1072, 'Udumbannoor\r\n', 251),
(1073, 'Neyyasseri\r\n', 251),
(1074, 'Karimannoor\r\n', 251),
(1075, 'Karikkode (Part)\r\n', 251),
(1076, 'Thodupuzha (Part)\r\n', 251),
(1077, 'Manakkad (Part)\r\n', 251),
(1078, 'Purapuzha\r\n', 251),
(1079, 'Karimkunnam (Part)\r\n', 251),
(1080, 'Muttom \r\n', 251),
(1081, 'Alacode\r\n', 251),
(1082, 'Velliyamattom\r\n', 251),
(1083, 'Idukki\r\n', 251),
(1084, 'Arakkulam \r\n', 251),
(1085, 'Kudayathoor \r\n', 251),
(1086, 'Elappally\r\n', 251),
(1087, 'Peerumade\r\n', 251),
(1088, 'Vagamon \r\n', 251),
(1089, 'Upputhara \r\n', 251),
(1090, 'Elappara \r\n', 251),
(1091, 'Kokkayar\r\n', 251),
(1092, 'Manjumala\r\n', 251),
(1093, 'Periyar\r\n', 251),
(1094, 'Kumily\r\n', 251),
(1095, 'Mlappara\r\n', 251),
(1096, 'Peruvanthanam\r\n', 251),
(1097, 'Kottayam\r\n', 255),
(1098, 'Meenachil\r\n', 255),
(1099, 'Veliyannoor\r\n', 255),
(1100, 'Monippally\r\n', 255),
(1101, 'Uzhavoor\r\n', 255),
(1102, 'Vellilappally \r\n', 255),
(1103, 'Ramapuram \r\n', 255),
(1104, 'Kadanad\r\n', 255),
(1105, 'Melukavu\r\n', 255),
(1106, 'Moonilavu\r\n', 255),
(1107, 'Poonjar Vadakkekara\r\n', 255),
(1108, 'Teekoy\r\n', 255),
(1109, 'Thalappalam\r\n', 255),
(1110, 'Bharananganam \r\n', 255),
(1111, 'Lalam (Part)\r\n', 255),
(1112, 'Vallichira\r\n', 255),
(1113, 'Kurichithanam\r\n', 255),
(1114, 'Kuravilangad\r\n', 255),
(1115, 'Kanakkari\r\n', 255),
(1116, 'Elackad\r\n', 255),
(1117, 'Kidangoor\r\n', 255),
(1118, 'Puliyannoor (Part)\r\n', 255),
(1119, 'Meenachil (Part)\r\n', 255),
(1120, 'Poovarany\r\n', 255),
(1121, 'Kondoor\r\n', 255),
(1122, 'Poonjar Thekkekara\r\n', 255),
(1123, 'Poonjar Nadubhagam\r\n', 255),
(1124, 'Erattupetta (CT)\r\n', 255),
(1125, 'Vaikom\r\n', 255),
(1126, 'Chempu\r\n', 255),
(1127, 'Velloor\r\n', 255),
(1128, 'Mulakulam\r\n', 255),
(1129, 'Njeezhoor\r\n', 255),
(1130, 'Kaduthuruthy\r\n', 255),
(1131, 'Vadayar\r\n', 255),
(1132, 'Kulasekharamangalam\r\n', 255),
(1133, 'Vadakkemuri (Part)\r\n', 255),
(1134, 'Naduvile (Part)\r\n', 255),
(1135, 'Vaikom (Part)\r\n', 255),
(1136, 'Thalayazham\r\n', 255),
(1137, 'Vechoor\r\n', 255),
(1138, 'Kallara\r\n', 255),
(1139, 'Muttuchira\r\n', 255),
(1140, 'Manjoor\r\n', 255),
(1141, 'Kothanalloor\r\n', 255),
(1142, 'Arpookara\r\n', 255),
(1143, 'Kaipuzha\r\n', 255),
(1144, 'Onamthuruth\r\n', 255),
(1145, 'Peroor\r\n', 255),
(1146, 'Ayarkunnam\r\n', 255),
(1147, 'Akalakunnam\r\n', 255),
(1148, 'Chengalam East\r\n', 255),
(1149, 'Anikkad\r\n', 255),
(1150, 'Kooroppada\r\n', 255),
(1151, 'Manarcad\r\n', 255),
(1152, 'Muttampalam (Part)\r\n', 255),
(1153, 'Kumarakam\r\n', 255),
(1154, 'Thiruvarpu\r\n', 255),
(1155, 'Veloor  (Part)\r\n', 255),
(1156, 'Meenadam \r\n', 255),
(1157, 'Pampady\r\n', 255),
(1158, 'Ettumanoor (CT)\r\n', 255),
(1159, 'Athirampuzha (CT)\r\n', 255),
(1160, 'Aimanam (CT)\r\n', 255),
(1161, 'Perumbaikad (CT)\r\n', 255),
(1162, 'Vijayapuram (CT)\r\n', 255),
(1163, 'Chengalam South (CT)\r\n', 255),
(1164, 'Nattakam (CT)\r\n', 255),
(1165, 'Panachikkad (CT)\r\n', 255),
(1166, 'Puthuppally (CT)\r\n', 255),
(1167, 'Changanassery\r\n', 255),
(1168, 'Vakathanam\r\n', 255),
(1169, 'Kurichy\r\n', 255),
(1170, 'Vazhappally Padinjaru (Part)\r\n', 255),
(1171, 'Changanassery (Part)\r\n', 255),
(1172, 'Madappally\r\n', 255),
(1173, 'Thottackad\r\n', 255),
(1174, 'Karukachal\r\n', 255),
(1175, 'Nedumkunnam \r\n', 255),
(1176, 'Vazhoor\r\n', 255),
(1177, 'Kangazha\r\n', 255),
(1178, 'Vellavoor\r\n', 255),
(1179, 'Chethipuzha (CT)\r\n', 255),
(1180, 'Thrikkodithanam (CT)\r\n', 255),
(1181, 'Paippad (CT)\r\n', 255),
(1182, 'Kanjirappally\r\n', 255),
(1183, 'Koottickal\r\n', 255),
(1184, 'Mundakayam\r\n', 255),
(1185, 'Edakkunnam\r\n', 255),
(1186, 'Elikkulam\r\n', 255),
(1187, 'Elamgulam\r\n', 255),
(1188, 'Chirakkadavu\r\n', 255),
(1189, 'Cheruvally\r\n', 255),
(1190, 'Koovappally\r\n', 255),
(1191, 'Erumeli North\r\n', 255),
(1192, 'Erumeli South \r\n', 255),
(1193, 'Manimala\r\n', 255),
(1194, 'Alappuzha\r\n', 249),
(1195, 'Cherthala\r\n', 249),
(1196, 'Perumbalam\r\n', 249),
(1197, 'Panavally\r\n', 249),
(1198, 'Thuravoor Thekku\r\n', 249),
(1199, 'Pattanakkad\r\n', 249),
(1200, 'Kadakkarappally\r\n', 249),
(1201, 'Cherthala North (Part)\r\n', 249),
(1202, 'Cherthala South (Part)\r\n', 249),
(1203, 'Mararikkulam North\r\n', 249),
(1204, 'Arookutty (CT)\r\n', 249),
(1205, 'Aroor (CT)\r\n', 249),
(1206, 'Ezhupunna (CT)\r\n', 249),
(1207, 'Kodamthuruth (CT)\r\n', 249),
(1208, 'Thaikattussery (CT)\r\n', 249),
(1209, 'Kuthiathode (CT)\r\n', 249),
(1210, 'Vayalar (CT)\r\n', 249),
(1211, 'Pallippuram (CT)\r\n', 249),
(1212, 'Thanneermukkam (CT)\r\n', 249),
(1213, 'Kokkothamangalam (CT)\r\n', 249),
(1214, 'Kanjikkuzhi (CT)\r\n', 249),
(1215, 'Muhamma (CT)\r\n', 249),
(1216, 'Ambalappuzha\r\n', 249),
(1217, 'Kalavoor\r\n', 249),
(1218, 'Aryad South  (Part)\r\n', 249),
(1219, 'Mullakkal (Part) \r\n', 249),
(1220, 'Karumady  \r\n', 249),
(1221, 'Purakkad\r\n', 249),
(1222, 'Mannanchery (CT)\r\n', 249),
(1223, 'Pathirappally (CT)\r\n', 249),
(1224, 'Komalapuram (CT)\r\n', 249),
(1225, 'Punnapra (OG)\r\n', 249),
(1226, 'Kalarkode (OG) (Part)\r\n', 249),
(1227, 'Kuttanad\r\n', 249),
(1228, 'Kainakary North\r\n', 249),
(1229, 'Kainakary South\r\n', 249),
(1230, 'Pulinkunnu\r\n', 249),
(1231, 'Kunnumma\r\n', 249),
(1232, 'Kavalam\r\n', 249),
(1233, 'Neelamperoor\r\n', 249),
(1234, 'Veliyanad\r\n', 249),
(1235, 'Ramankary\r\n', 249),
(1236, 'Champakkulam\r\n', 249),
(1237, 'Nedumudi\r\n', 249),
(1238, 'Thakazhy\r\n', 249),
(1239, 'Edathua  \r\n', 249),
(1240, 'Muttar\r\n', 249),
(1241, 'Thalavady \r\n', 249),
(1242, 'Karthikappally\r\n', 249),
(1243, 'Karuvatta\r\n', 249),
(1244, 'Cheruthana\r\n', 249),
(1245, 'Veeyapuram\r\n', 249),
(1246, 'Pallippad\r\n', 249),
(1247, 'Thrikkunnapuzha\r\n', 249),
(1248, 'Arattupuzha\r\n', 249),
(1249, 'Haripad (CT)\r\n', 249),
(1250, 'Kumarapuram (CT)\r\n', 249),
(1251, 'Karthikappally (CT)\r\n', 249),
(1252, 'Chingoli (CT)\r\n', 249),
(1253, 'Cheppad (CT)\r\n', 249),
(1254, 'Pathiyoor (CT)\r\n', 249),
(1255, 'Keerikkad (CT)\r\n', 249),
(1256, 'Muthukulam (CT)\r\n', 249),
(1257, 'Kandalloor (CT)\r\n', 249),
(1258, 'Puthuppally (CT)\r\n', 249),
(1259, 'Krishnapuram (CT)\r\n', 249),
(1260, 'Chengannur\r\n', 249),
(1261, 'Ennakkad\r\n', 249),
(1262, 'Pandanad (Part)\r\n', 249),
(1263, 'Thiruvanvandoor\r\n', 249),
(1264, 'Chengannur  (Part)\r\n', 249),
(1265, 'Mulakuzha (Part) \r\n', 249),
(1266, 'Ala (Part)\r\n', 249),
(1267, 'Puliyoor(Part)\r\n', 249),
(1268, 'Cheriyanad\r\n', 249),
(1269, 'Venmony\r\n', 249),
(1270, 'Mannar (CT)\r\n', 249),
(1271, 'Kurattissery (CT)\r\n', 249),
(1272, 'Mavelikkara\r\n', 249),
(1273, 'Thriperumthura\r\n', 249),
(1274, 'Vettiyar\r\n', 249),
(1275, 'Thekkekara (Part)\r\n', 249),
(1276, 'Perungala\r\n', 249),
(1277, 'Chunakkara\r\n', 249),
(1278, 'Noornad\r\n', 249),
(1279, 'Palamel\r\n', 249),
(1280, 'Thamarakkulam\r\n', 249),
(1281, 'Vallikunnam\r\n', 249),
(1282, 'Kannamangalam (CT)\r\n', 249),
(1283, 'Chennithala (CT)\r\n', 249),
(1284, 'Thazhakara (CT)\r\n', 249),
(1285, 'Bharanikkavu (CT)\r\n', 249),
(1286, 'Kattanam (CT)\r\n', 249),
(1287, 'Pathanamthitta\r\n', 259),
(1288, 'Thiruvalla\r\n', 259),
(1289, 'Niranam\r\n', 259),
(1290, 'Kadapra\r\n', 259),
(1291, 'Nedumpuram\r\n', 259),
(1292, 'Peringara\r\n', 259),
(1293, 'Kavumbhagom (Part)\r\n', 259),
(1294, 'Kuttoor\r\n', 259),
(1295, 'Kaviyoor\r\n', 259),
(1296, 'Eraviperoor\r\n', 259),
(1297, 'Koipuram\r\n', 259),
(1298, 'Thottapuzhassery\r\n', 259),
(1299, 'Mallappally\r\n', 259),
(1300, 'Kunnamthanam\r\n', 259),
(1301, 'Kallooppara\r\n', 259),
(1302, 'Anicad\r\n', 259),
(1303, 'Kottangal\r\n', 259),
(1304, 'Perumpetty\r\n', 259),
(1305, 'Ezhumattoor\r\n', 259),
(1306, 'Thelliyoor\r\n', 259),
(1307, 'Puramattam\r\n', 259),
(1308, 'Ranni\r\n', 259),
(1309, 'Chethakkal\r\n', 259),
(1310, 'Kollamula\r\n', 259),
(1311, 'Perunad\r\n', 259),
(1312, 'Athikkayam\r\n', 259),
(1313, 'Pazhavangadi\r\n', 259),
(1314, 'Angadi\r\n', 259),
(1315, 'Ayiroor\r\n', 259),
(1316, 'Cherukole\r\n', 259),
(1317, 'Ranni \r\n', 259),
(1318, 'Vadasserikkara \r\n', 259),
(1319, 'Chittar-Seethathodu\r\n', 259),
(1320, 'Kozhenchery\r\n', 259),
(1321, 'Kulanada\r\n', 259),
(1322, 'Mezhuveli\r\n', 259),
(1323, 'Kidangannur\r\n', 259),
(1324, 'Aranmula\r\n', 259),
(1325, 'Mallapuzhassery\r\n', 259),
(1326, 'Elanthoor\r\n', 259),
(1327, 'Chenneerkara\r\n', 259),
(1328, 'Vallicode\r\n', 259),
(1329, 'Omalloor\r\n', 259),
(1330, 'Pathanamthitta (Part)\r\n', 259),
(1331, 'Naranganam\r\n', 259),
(1332, 'Mylapra (Part)\r\n', 259),
(1333, 'Malayalapuzha (Part)\r\n', 259),
(1334, 'Konnithazham\r\n', 259),
(1335, 'Pramadom\r\n', 259),
(1336, 'Vallicode-Kottayam\r\n', 259),
(1337, 'Konni\r\n', 259),
(1338, 'Aruvappulam\r\n', 259),
(1339, 'Iravan\r\n', 259),
(1340, 'Thannithode \r\n', 259),
(1341, 'Kozhenchery (CT)\r\n', 259),
(1342, 'Adoor\r\n', 259),
(1343, 'Pandalam\r\n', 259),
(1344, 'Kurampala\r\n', 259),
(1345, 'Pandalam Thekkekara\r\n', 259),
(1346, 'Kodumon\r\n', 259),
(1347, 'Angadickal\r\n', 259),
(1348, 'Koodal\r\n', 259),
(1349, 'Kalanjoor\r\n', 259),
(1350, 'Enadimangalam\r\n', 259),
(1351, 'Ezhamkulam\r\n', 259),
(1352, 'Erathu\r\n', 259),
(1353, 'Peringanadu (Part)\r\n', 259),
(1354, 'Pallickal\r\n', 259),
(1355, 'Kadampanadu\r\n', 259),
(1356, 'Enathu\r\n', 259),
(1357, 'Kollam\r\n', 252),
(1358, 'Karunagappally \r\n', 252),
(1359, 'Alappad\r\n', 252),
(1360, 'Clappana\r\n', 252),
(1361, 'Thazhava\r\n', 252),
(1362, 'Pavumba\r\n', 252),
(1363, 'Thevalakkara\r\n', 252),
(1364, 'Thekkumbhagom\r\n', 252),
(1365, 'Oachira (CT)\r\n', 252),
(1366, 'Kulasekharapuram (CT)\r\n', 252),
(1367, 'Adinad (CT)\r\n', 252),
(1368, 'Thodiyoor (CT)\r\n', 252),
(1369, 'Kallelibhagom (CT)\r\n', 252),
(1370, 'Karunagappally (CT)\r\n', 252),
(1371, 'Ayanivelikulangara (CT)\r\n', 252),
(1372, 'Vadakkumthala (CT)\r\n', 252),
(1373, 'Panmana (CT)\r\n', 252),
(1374, 'Chavara (CT)\r\n', 252),
(1375, 'Neendakara (OG)\r\n', 252),
(1376, 'Kunnathur\r\n', 252),
(1377, 'Sooranad North\r\n', 252),
(1378, 'Poruvazhy\r\n', 252),
(1379, 'Sasthamkotta\r\n', 252),
(1380, 'Sooranad South\r\n', 252),
(1381, 'Mynagappally\r\n', 252),
(1382, 'West Kallada\r\n', 252),
(1383, 'Pathanapuram\r\n', 252),
(1384, 'Pattazhy Vadakkekara\r\n', 252),
(1385, 'Pattazhy\r\n', 252),
(1386, 'Thalavoor\r\n', 252),
(1387, 'Vilakkudy\r\n', 252),
(1388, 'Pidavoor\r\n', 252),
(1389, 'Pathanapuram \r\n', 252),
(1390, 'Punnala\r\n', 252),
(1391, 'Piravanthur \r\n', 252),
(1392, 'Valacode (Part)\r\n', 252),
(1393, 'Edamon\r\n', 252),
(1394, 'Thenmala\r\n', 252),
(1395, 'Arienkavu\r\n', 252),
(1396, 'Kulathupuzha\r\n', 252),
(1397, 'Thinkalkarikkakom\r\n', 252),
(1398, 'Ayiranalloor\r\n', 252),
(1399, 'Karavaloor (Part)\r\n', 252),
(1400, 'Arackal\r\n', 252),
(1401, 'Edamulackal\r\n', 252),
(1402, 'Anchal\r\n', 252),
(1403, 'Eroor\r\n', 252),
(1404, 'Alayamon \r\n', 252),
(1405, 'Channappetta \r\n', 252),
(1406, 'Kottarakkara\r\n', 252),
(1407, 'Pavithreswaram\r\n', 252),
(1408, 'Puthur \r\n', 252),
(1409, 'Kulakkada\r\n', 252),
(1410, 'Kalayapuram\r\n', 252),
(1411, 'Mylom\r\n', 252),
(1412, 'Melila \r\n', 252),
(1413, 'Chakkuvarakkal\r\n', 252),
(1414, 'Vettikkavala\r\n', 252),
(1415, 'Neduvathoor\r\n', 252),
(1416, 'Ezhukone\r\n', 252),
(1417, 'Kareepra\r\n', 252),
(1418, 'Odanavattam\r\n', 252),
(1419, 'Ummannoor\r\n', 252),
(1420, 'Valakam\r\n', 252),
(1421, 'Elamad\r\n', 252),
(1422, 'Veliyam\r\n', 252),
(1423, 'Pooyappally\r\n', 252),
(1424, 'Velinalloor\r\n', 252),
(1425, 'Chadayamangalam\r\n', 252),
(1426, 'Kottukkal\r\n', 252),
(1427, 'Ittiva\r\n', 252),
(1428, 'Kadakkal\r\n', 252),
(1429, 'Nilamel\r\n', 252),
(1430, 'Kummil\r\n', 252),
(1431, 'Mancode\r\n', 252),
(1432, 'Chithara\r\n', 252),
(1433, 'Kottarakkara (CT)\r\n', 252),
(1434, 'Eravipuram (OG) (Part)\r\n', 252),
(1435, 'Mundrothuruth\r\n', 252),
(1436, 'Kizhakkekallada\r\n', 252),
(1437, 'Mulavana\r\n', 252),
(1438, 'Pallimon\r\n', 252),
(1439, 'Chirakkara\r\n', 252),
(1440, 'Paravoor (Part)\r\n', 252),
(1441, 'Parippally\r\n', 252),
(1442, 'Kalluvathukkal\r\n', 252),
(1443, 'Thrikkaruva (CT)\r\n', 252),
(1444, 'Panayam (CT)\r\n', 252),
(1445, 'Perinad (CT)\r\n', 252),
(1446, 'Elampalloor (CT)\r\n', 252),
(1447, 'Nedumpana (CT)\r\n', 252),
(1448, 'Kottamkara (CT)\r\n', 252),
(1449, 'Thrikkadavoor (CT)\r\n', 252),
(1450, 'Thrikkovilvattom (CT)\r\n', 252),
(1451, 'Adichanalloor (CT)\r\n', 252),
(1452, 'Thazhuthala (CT)\r\n', 252),
(1453, 'Mayyanad (CT)\r\n', 252),
(1454, 'Meenad (CT)\r\n', 252),
(1455, 'Poothakkulam (CT)\r\n', 252),
(1456, 'Thiruvananthapuram\r\n', 261),
(1457, 'Chirayinkeezhu\r\n', 261),
(1458, 'Edava\r\n', 261),
(1459, 'Ayiroor\r\n', 261),
(1460, 'Chemmaruthy\r\n', 261),
(1461, 'Navaikulam\r\n', 261),
(1462, 'Pallickal\r\n', 261),
(1463, 'Madavoor\r\n', 261),
(1464, 'Kudavoor\r\n', 261),
(1465, 'Vellalloor\r\n', 261),
(1466, 'Kilimanoor\r\n', 261),
(1467, 'Pazhayakunnummel\r\n', 261),
(1468, 'Pulimath\r\n', 261),
(1469, 'Koduvazhannoor\r\n', 261),
(1470, 'Nagaroor\r\n', 261),
(1471, 'Karavaram\r\n', 261),
(1472, 'Ottoor\r\n', 261),
(1473, 'Vettoor-Cherunniyoor \r\n', 261),
(1474, 'Manamboor\r\n', 261),
(1475, 'Elamba-Mudakkal\r\n', 261),
(1476, 'Attingal-Avanavancherry (Part)\r\n', 261),
(1477, 'Kadakkavoor\r\n', 261),
(1478, 'Sarkara-Chirayinkeezhu\r\n', 261),
(1479, 'Alamcode (CT)\r\n', 261),
(1480, 'Keezhattingal (CT)\r\n', 261),
(1481, 'Vakkom (CT)\r\n', 261),
(1482, 'Kizhuvalam-Koonthalloor (CT)\r\n', 261),
(1483, 'Edakkode (CT)\r\n', 261),
(1484, 'Azhoor (CT)\r\n', 261),
(1485, 'Nedumangad\r\n', 261),
(1486, 'Nellanad\r\n', 261),
(1487, 'Vamanapuram\r\n', 261),
(1488, 'Kallara\r\n', 261),
(1489, 'Pangode\r\n', 261),
(1490, 'Peringamala\r\n', 261),
(1491, 'Thennoor \r\n', 261),
(1492, 'Palode\r\n', 261),
(1493, 'Kurupuzha\r\n', 261),
(1494, 'Panavoor\r\n', 261),
(1495, 'Pullampara\r\n', 261),
(1496, 'Koliyakode\r\n', 261),
(1497, 'Manikkal\r\n', 261),
(1498, 'Theakada\r\n', 261),
(1499, 'Anad\r\n', 261),
(1500, 'Tholicode\r\n', 261),
(1501, 'Vithura\r\n', 261),
(1502, 'Mannoorkara\r\n', 261),
(1503, 'Aryanad\r\n', 261),
(1504, 'Uzhamalackal\r\n', 261),
(1505, 'Vembayam\r\n', 261),
(1506, 'Aruvikkara\r\n', 261),
(1507, 'Vellanad\r\n', 261),
(1508, 'Perumkulam\r\n', 261),
(1509, 'Veeranakavu\r\n', 261),
(1510, 'Vattappara (CT)\r\n', 261),
(1511, 'Karakulam (CT)\r\n', 261),
(1512, 'Kadinamkulam\r\n', 261),
(1513, 'Melthonnakkal\r\n', 261),
(1514, 'Keezhthonnakkal\r\n', 261),
(1515, 'Andoorkonam\r\n', 261),
(1516, 'Menamkulam\r\n', 261),
(1517, 'Veiloor (CT)\r\n', 261),
(1518, 'Pallippuram (CT)\r\n', 261),
(1519, 'Iroopara (CT)\r\n', 261),
(1520, 'Uliyazhathura (CT)\r\n', 261),
(1521, 'Sreekaryam (CT)\r\n', 261),
(1522, 'Kudappanakkunnu (CT)\r\n', 261),
(1523, 'Vattiyoorkavu (CT)\r\n', 261),
(1524, 'Kalliyoor (CT)\r\n', 261),
(1525, 'Venganoor (CT)\r\n', 261),
(1526, 'Kazhakkoottam(OG)\r\n', 261),
(1527, 'Neyyattinkara\r\n', 261),
(1528, 'Ottasekharamangalam\r\n', 261),
(1529, 'Kallikkad\r\n', 261),
(1530, 'Vazhichal\r\n', 261),
(1531, 'Amboori\r\n', 261),
(1532, 'Vellarada\r\n', 261),
(1533, 'Keezharoor\r\n', 261),
(1534, 'Maranalloor\r\n', 261),
(1535, 'Perumkadavila\r\n', 261),
(1536, 'Anavoor\r\n', 261),
(1537, 'Kunnathukal\r\n', 261),
(1538, 'Kollayil (Part)\r\n', 261),
(1539, 'Karode\r\n', 261),
(1540, 'Chenkal (Part)\r\n', 261),
(1541, 'Kulathoor\r\n', 261),
(1542, 'Thirupuram\r\n', 261),
(1543, 'Karumkulam \r\n', 261),
(1544, 'Kottukal (Part)\r\n', 261),
(1545, 'Vizhinjam (Part)\r\n', 261),
(1546, 'Kovalam (OG) (Part)\r\n', 261),
(1547, 'Vilappil (CT)\r\n', 261),
(1548, 'Kulathummal (CT)\r\n', 261),
(1549, 'Malayinkeezhu (CT)\r\n', 261),
(1550, 'Vilavoorkkal (CT)\r\n', 261),
(1551, 'Pallichal (CT)\r\n', 261),
(1552, 'Athiyannur (CT)\r\n', 261),
(1553, 'Kanjiramkulam (CT)\r\n', 261),
(1554, 'Parasuvaikkal (CT)\r\n', 261),
(1555, 'Parassala (CT)\r\n', 261);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `agofficer`
--
ALTER TABLE `agofficer`
  ADD PRIMARY KEY (`ag_id`),
  ADD KEY `d_id` (`d_id`);

--
-- Indexes for table `crop`
--
ALTER TABLE `crop`
  ADD PRIMARY KEY (`c_id`),
  ADD KEY `cc_id` (`cc_id`);

--
-- Indexes for table `crop_category`
--
ALTER TABLE `crop_category`
  ADD PRIMARY KEY (`cc_id`);

--
-- Indexes for table `crop_disease`
--
ALTER TABLE `crop_disease`
  ADD PRIMARY KEY (`cd_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `crop_disease_update`
--
ALTER TABLE `crop_disease_update`
  ADD PRIMARY KEY (`cdu_id`),
  ADD KEY `cd_id` (`cd_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `crop_fertilizers`
--
ALTER TABLE `crop_fertilizers`
  ADD PRIMARY KEY (`cf_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `crop_fertilizers_update`
--
ALTER TABLE `crop_fertilizers_update`
  ADD PRIMARY KEY (`cfu_id`),
  ADD KEY `cf_id` (`cf_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `crop_instruction`
--
ALTER TABLE `crop_instruction`
  ADD PRIMARY KEY (`ci_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `crop_instruction_update`
--
ALTER TABLE `crop_instruction_update`
  ADD PRIMARY KEY (`ciu_id`),
  ADD KEY `ci_id` (`ci_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `crop_price`
--
ALTER TABLE `crop_price`
  ADD PRIMARY KEY (`cp_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `de_id` (`de_id`);

--
-- Indexes for table `crop_tips`
--
ALTER TABLE `crop_tips`
  ADD PRIMARY KEY (`ct_id`),
  ADD KEY `c_id` (`c_id`);

--
-- Indexes for table `crop_tips_update`
--
ALTER TABLE `crop_tips_update`
  ADD PRIMARY KEY (`ctu_id`),
  ADD KEY `ct_id` (`ct_id`),
  ADD KEY `ag_id` (`ag_id`);

--
-- Indexes for table `dealer`
--
ALTER TABLE `dealer`
  ADD PRIMARY KEY (`de_id`),
  ADD KEY `v_id` (`v_id`);

--
-- Indexes for table `dealer_language`
--
ALTER TABLE `dealer_language`
  ADD PRIMARY KEY (`dl_id`),
  ADD KEY `l_id` (`l_id`),
  ADD KEY `de_id` (`de_id`);

--
-- Indexes for table `dealer_request`
--
ALTER TABLE `dealer_request`
  ADD PRIMARY KEY (`dr_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `ut_id` (`ut_id`),
  ADD KEY `de_id` (`de_id`);

--
-- Indexes for table `dealer_to_farmer_msg`
--
ALTER TABLE `dealer_to_farmer_msg`
  ADD PRIMARY KEY (`dtfm_id`),
  ADD KEY `de_id` (`de_id`),
  ADD KEY `f_id` (`f_id`);

--
-- Indexes for table `district`
--
ALTER TABLE `district`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `s_id` (`s_id`);

--
-- Indexes for table `farmer`
--
ALTER TABLE `farmer`
  ADD PRIMARY KEY (`f_id`),
  ADD KEY `v_id` (`v_id`);

--
-- Indexes for table `farmer_language`
--
ALTER TABLE `farmer_language`
  ADD PRIMARY KEY (`fl_id`),
  ADD KEY `f_id` (`f_id`),
  ADD KEY `l_id` (`l_id`);

--
-- Indexes for table `harvesting`
--
ALTER TABLE `harvesting`
  ADD PRIMARY KEY (`h_id`),
  ADD KEY `p_id` (`p_id`),
  ADD KEY `ut_id` (`ut_id`);

--
-- Indexes for table `harvest_process`
--
ALTER TABLE `harvest_process`
  ADD PRIMARY KEY (`hp_id`),
  ADD KEY `h_id` (`h_id`);

--
-- Indexes for table `language`
--
ALTER TABLE `language`
  ADD PRIMARY KEY (`l_id`);

--
-- Indexes for table `planting`
--
ALTER TABLE `planting`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `c_id` (`c_id`),
  ADD KEY `v_id` (`v_id`),
  ADD KEY `f_id` (`f_id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`s_id`);

--
-- Indexes for table `unit_type`
--
ALTER TABLE `unit_type`
  ADD PRIMARY KEY (`ut_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_id`);

--
-- Indexes for table `village`
--
ALTER TABLE `village`
  ADD PRIMARY KEY (`v_id`),
  ADD KEY `d_id` (`d_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `crop`
--
ALTER TABLE `crop`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crop_category`
--
ALTER TABLE `crop_category`
  MODIFY `cc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crop_disease`
--
ALTER TABLE `crop_disease`
  MODIFY `cd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `crop_fertilizers`
--
ALTER TABLE `crop_fertilizers`
  MODIFY `cf_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `crop_instruction`
--
ALTER TABLE `crop_instruction`
  MODIFY `ci_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `crop_price`
--
ALTER TABLE `crop_price`
  MODIFY `cp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `crop_tips`
--
ALTER TABLE `crop_tips`
  MODIFY `ct_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dealer`
--
ALTER TABLE `dealer`
  MODIFY `de_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dealer_language`
--
ALTER TABLE `dealer_language`
  MODIFY `dl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_request`
--
ALTER TABLE `dealer_request`
  MODIFY `dr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dealer_to_farmer_msg`
--
ALTER TABLE `dealer_to_farmer_msg`
  MODIFY `dtfm_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `district`
--
ALTER TABLE `district`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1024;

--
-- AUTO_INCREMENT for table `farmer`
--
ALTER TABLE `farmer`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `farmer_language`
--
ALTER TABLE `farmer_language`
  MODIFY `fl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `harvesting`
--
ALTER TABLE `harvesting`
  MODIFY `h_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `harvest_process`
--
ALTER TABLE `harvest_process`
  MODIFY `hp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `language`
--
ALTER TABLE `language`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `planting`
--
ALTER TABLE `planting`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `unit_type`
--
ALTER TABLE `unit_type`
  MODIFY `ut_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `u_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `village`
--
ALTER TABLE `village`
  MODIFY `v_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1556;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `agofficer`
--
ALTER TABLE `agofficer`
  ADD CONSTRAINT `agofficer_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `district` (`d_id`);

--
-- Constraints for table `crop`
--
ALTER TABLE `crop`
  ADD CONSTRAINT `crop_ibfk_1` FOREIGN KEY (`cc_id`) REFERENCES `crop_category` (`cc_id`);

--
-- Constraints for table `crop_disease`
--
ALTER TABLE `crop_disease`
  ADD CONSTRAINT `crop_disease_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`);

--
-- Constraints for table `crop_disease_update`
--
ALTER TABLE `crop_disease_update`
  ADD CONSTRAINT `crop_disease_update_ibfk_2` FOREIGN KEY (`ag_id`) REFERENCES `agofficer` (`ag_id`),
  ADD CONSTRAINT `crop_disease_update_ibfk_3` FOREIGN KEY (`cd_id`) REFERENCES `crop_disease` (`cd_id`);

--
-- Constraints for table `crop_fertilizers`
--
ALTER TABLE `crop_fertilizers`
  ADD CONSTRAINT `crop_fertilizers_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`);

--
-- Constraints for table `crop_fertilizers_update`
--
ALTER TABLE `crop_fertilizers_update`
  ADD CONSTRAINT `crop_fertilizers_update_ibfk_2` FOREIGN KEY (`ag_id`) REFERENCES `agofficer` (`ag_id`),
  ADD CONSTRAINT `crop_fertilizers_update_ibfk_3` FOREIGN KEY (`cf_id`) REFERENCES `crop_fertilizers` (`cf_id`);

--
-- Constraints for table `crop_instruction`
--
ALTER TABLE `crop_instruction`
  ADD CONSTRAINT `crop_instruction_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`);

--
-- Constraints for table `crop_instruction_update`
--
ALTER TABLE `crop_instruction_update`
  ADD CONSTRAINT `crop_instruction_update_ibfk_2` FOREIGN KEY (`ag_id`) REFERENCES `agofficer` (`ag_id`),
  ADD CONSTRAINT `crop_instruction_update_ibfk_3` FOREIGN KEY (`ci_id`) REFERENCES `crop_instruction` (`ci_id`);

--
-- Constraints for table `crop_price`
--
ALTER TABLE `crop_price`
  ADD CONSTRAINT `crop_price_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  ADD CONSTRAINT `crop_price_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`);

--
-- Constraints for table `crop_tips`
--
ALTER TABLE `crop_tips`
  ADD CONSTRAINT `crop_tips_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`);

--
-- Constraints for table `crop_tips_update`
--
ALTER TABLE `crop_tips_update`
  ADD CONSTRAINT `crop_tips_update_ibfk_2` FOREIGN KEY (`ag_id`) REFERENCES `agofficer` (`ag_id`),
  ADD CONSTRAINT `crop_tips_update_ibfk_3` FOREIGN KEY (`ct_id`) REFERENCES `crop_tips` (`ct_id`);

--
-- Constraints for table `dealer`
--
ALTER TABLE `dealer`
  ADD CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`);

--
-- Constraints for table `dealer_language`
--
ALTER TABLE `dealer_language`
  ADD CONSTRAINT `dealer_language_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`),
  ADD CONSTRAINT `dealer_language_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`);

--
-- Constraints for table `dealer_request`
--
ALTER TABLE `dealer_request`
  ADD CONSTRAINT `dealer_request_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  ADD CONSTRAINT `dealer_request_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`),
  ADD CONSTRAINT `dealer_request_ibfk_3` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`);

--
-- Constraints for table `dealer_to_farmer_msg`
--
ALTER TABLE `dealer_to_farmer_msg`
  ADD CONSTRAINT `dealer_to_farmer_msg_ibfk_1` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`),
  ADD CONSTRAINT `dealer_to_farmer_msg_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`);

--
-- Constraints for table `district`
--
ALTER TABLE `district`
  ADD CONSTRAINT `district_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `state` (`s_id`);

--
-- Constraints for table `farmer`
--
ALTER TABLE `farmer`
  ADD CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`);

--
-- Constraints for table `farmer_language`
--
ALTER TABLE `farmer_language`
  ADD CONSTRAINT `farmer_language_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`),
  ADD CONSTRAINT `farmer_language_ibfk_2` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`);

--
-- Constraints for table `harvesting`
--
ALTER TABLE `harvesting`
  ADD CONSTRAINT `harvesting_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `planting` (`p_id`),
  ADD CONSTRAINT `harvesting_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`);

--
-- Constraints for table `harvest_process`
--
ALTER TABLE `harvest_process`
  ADD CONSTRAINT `harvest_process_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `harvesting` (`h_id`);

--
-- Constraints for table `planting`
--
ALTER TABLE `planting`
  ADD CONSTRAINT `planting_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  ADD CONSTRAINT `planting_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`),
  ADD CONSTRAINT `planting_ibfk_3` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`);

--
-- Constraints for table `village`
--
ALTER TABLE `village`
  ADD CONSTRAINT `village_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `district` (`d_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

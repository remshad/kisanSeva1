SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
--
-- Database: `kisanseva`
--




CREATE TABLE `user` (
  `u_id` int NOT NULL AUTO_INCREMENT,
  `u_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_pass` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `u_status` int NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO user VALUES
("1","admin","e10adc3949ba59abbe56e057f20f883e","1");




CREATE TABLE `crop` (
  `c_id` int NOT NULL AUTO_INCREMENT,
  `c_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cc_id` int NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `cc_id` (`cc_id`),
  CONSTRAINT `crop_ibfk_1` FOREIGN KEY (`cc_id`) REFERENCES `crop_category` (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO crop VALUES
("1","Banana","1"),
("2","Orange","1"),
("3","Grape","1"),
("4","Cauliflower","6"),
("5","Cucumbar(Kheera)","1"),
("6","Black Gram (Urd Beans)(Whole)","8"),
("7","Arhar Dal(Tur Dal)","8"),
("8","Chilly Capsicum","1"),
("9","Ginger(Dry)","7"),
("10","Coriander(Leaves)","6"),
("12","Brinjal","1"),
("13","Cotton","2"),
("14","Cabbage","6"),
("15","Bitter gourd","1"),
("16","Green Chilli","1"),
("17","Barley (Jau)","8"),
("18","Drumstick","1"),
("19","Chikoos(Sapota)","1"),
("20","Bhindi(Ladies Finger)","1"),
("21","Cabbage","6"),
("22","Ginger(Green)","9"),
("23","Apple","1"),
("24","Amphophalus","1"),
("25","Butter","1"),
("26","Beaten Rice","8"),
("27","Coconut Seed","8"),
("28","Cluster beans","1"),
("29","Capsicum","1"),
("30","Amla(Nelli Kai)","1"),
("31","Borehannu","1"),
("32","Ajwan","8"),
("33","Delha","8"),
("34","Copra","1"),
("35","Coffee","8"),
("36","Gramflour","8"),
("37","Gram Raw(Chholia)","8"),
("38","Black Gram Dal (Urd Dal)","8"),
("39","Cloves","8"),
("40","Cummin Seed(Jeera)","8"),
("41","Field Pea","8"),
("42","Alasande Gram","8"),
("43","Cummin Seed(Jeera)","8"),
("44","Dhaincha","9"),
("45","Cinamon(Dalchini)","9"),
("46","Bunch Beans","1"),
("47","Castor Seed","8"),
("48","Cowpea (Lobia/Karamani)","8"),
("49","Ber(Zizyphus/Borehannu)","1"),
("50","Bran","8"),
("51","Bran","8"),
("52","Broomstick(Flower Broom)","1"),
("53","Dry Chillies","1"),
("54","Amaranthus","1"),
("55","Bamboo","9"),
("56","Chapparad Avare","8"),
("57","Antawala","2"),
("58","Coconut","1"),
("59","Dry Grapes","1"),
("60","Green Fodder","6"),
("61","Corriander seed","8"),
("62","Dry Grapes","1"),
("63","Almond(Badam)","8"),
("64","Arhar (Tur/Red Gram)(Whole)","8"),
("65","Avare Dal","8"),
("66","Bay leaf (Tejpatta)","6"),
("67","Bay leaf (Tejpatta)","6"),
("68","Dry Grapes","1"),
("69","Ambada Seed","8"),
("70","Chili Red","1"),
("71","Duster Beans","1"),
("72","Beans","8"),
("73","Chow Chow","1"),
("74","Chow Chow","1"),
("75","Colacasia","7"),
("76","Dalda","8"),
("77","Grapes","1"),
("78","Bajra(Pearl Millet/Cumbu)","8"),
("79","Cherry","1"),
("81","Green Avare (W)","1"),
("82","Firewood","9"),
("83","Green Avare (W)","1"),
("84","Broken Rice","8"),
("85","Elephant Yam (Suran)","9"),
("86","Coca","6"),
("87","Anthorium","6"),
("88","Custard Apple (Sharifa)","1"),
("89","Ashgourd","1"),
("90","Bengal Gram Dal (Chana Dal)","8"),
("91","Betal Leaves","6"),
("92","Carnation","2"),
("93","Chennangi (Whole)","8"),
("94","Carnation","2"),
("95","Arecanut(Betelnut/Supari)","8"),
("96","Cowpea(Veg)","8"),
("97","Bottle gourd","1"),
("98","Black pepper","8"),
("99","Banana - Green","1"),
("100","Bottle gourd","1"),
("101","Cardamoms","8"),
("102","Banana - Green","1");
INSERT INTO crop VALUES
("103","Alsandikai","8"),
("104","Beetroot","7"),
("105","Carrot","9"),
("106","Coconut Oil","8"),
("107","Coconut Oil","8"),
("108","Apricot(Jardalu/Khumani)","1"),
("109","Coconut Oil","8"),
("110","Coconut Oil","8"),
("111","Cocoa","8"),
("112","Coconut Oil","8"),
("113","Dry Fodder","6"),
("114","Balekai","1"),
("115","Chrysanthemum","2"),
("116","Balekai","1"),
("117","Balekai","1"),
("118","Balekai","1"),
("119","Cashew Kernnel","8"),
("120","Balekai","1");




CREATE TABLE `crop_category` (
  `cc_id` int NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO crop_category VALUES
("1","Fruit"),
("2","Flowers"),
("4","Bulbs"),
("5","Fungi"),
("6","Leaves"),
("7","Roots"),
("8","Seeds"),
("9","Stems");




CREATE TABLE `crop_price` (
  `cp_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `de_id` int NOT NULL,
  `cp_date` int NOT NULL,
  `cp_price` float NOT NULL,
  PRIMARY KEY (`cp_id`),
  KEY `c_id` (`c_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `crop_price_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  CONSTRAINT `crop_price_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer` (
  `de_id` int NOT NULL AUTO_INCREMENT,
  `de_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `de_store_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `de_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int NOT NULL,
  `de_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `de_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `de_licence` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`de_id`),
  KEY `v_id` (`v_id`),
  CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO dealer VALUES
("1","testago","","abc","1194","9999999999","e10adc3949ba59abbe56e057f20f883e",""),
("2","9400326201","ABC","6C GJ Lavender, Opp Cherthala Police Station","1194","9400326201","e10adc3949ba59abbe56e057f20f883e","MH5212ABL");




CREATE TABLE `dealer_language` (
  `dl_id` int NOT NULL AUTO_INCREMENT,
  `de_id` int NOT NULL,
  `l_id` int NOT NULL,
  PRIMARY KEY (`dl_id`),
  KEY `l_id` (`l_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `dealer_language_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`),
  CONSTRAINT `dealer_language_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer_request` (
  `dr_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `dr_quantity` int NOT NULL,
  `dr_unit_price` float NOT NULL,
  `ut_id` int NOT NULL,
  `dr_date` int NOT NULL,
  `de_id` int NOT NULL,
  PRIMARY KEY (`dr_id`),
  KEY `c_id` (`c_id`),
  KEY `ut_id` (`ut_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `dealer_request_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  CONSTRAINT `dealer_request_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`),
  CONSTRAINT `dealer_request_ibfk_3` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer_to_farmer_msg` (
  `dtfm_id` int NOT NULL AUTO_INCREMENT,
  `dtfm_msg` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dtfm_date` int NOT NULL,
  `f_id` int NOT NULL,
  `dtfm_status` int NOT NULL,
  `de_id` int NOT NULL,
  PRIMARY KEY (`dtfm_id`),
  KEY `de_id` (`de_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `dealer_to_farmer_msg_ibfk_1` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`),
  CONSTRAINT `dealer_to_farmer_msg_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `district` (
  `d_id` int NOT NULL AUTO_INCREMENT,
  `d_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `s_id` int NOT NULL,
  PRIMARY KEY (`d_id`),
  KEY `s_id` (`s_id`),
  CONSTRAINT `district_ibfk_1` FOREIGN KEY (`s_id`) REFERENCES `state` (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1024 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO district VALUES
("1","North and Middle Andaman","32"),
("2","South Andaman","32"),
("3","Nicobar","32"),
("4","Adilabad","1"),
("5","Anantapur","1"),
("6","Chittoor","1"),
("7","East Godavari","1"),
("8","Guntur","1"),
("9","Hyderabad","1"),
("10","Kadapa","1"),
("11","Karimnagar","1"),
("12","Khammam","1"),
("13","Krishna","1"),
("14","Kurnool","1"),
("15","Mahbubnagar","1"),
("16","Medak","1"),
("17","Nalgonda","1"),
("18","Nellore","1"),
("19","Nizamabad","1"),
("20","Prakasam","1"),
("21","Rangareddi","1"),
("22","Srikakulam","1"),
("23","Vishakhapatnam","1"),
("24","Vizianagaram","1"),
("25","Warangal","1"),
("26","West Godavari","1"),
("27","Anjaw","3"),
("28","Changlang","3"),
("29","East Kameng","3"),
("30","Lohit","3"),
("31","Lower Subansiri","3"),
("32","Papum Pare","3"),
("33","Tirap","3"),
("34","Dibang Valley","3"),
("35","Upper Subansiri","3"),
("36","West Kameng","3"),
("37","Barpeta","2"),
("38","Bongaigaon","2"),
("39","Cachar","2"),
("40","Darrang","2"),
("41","Dhemaji","2"),
("42","Dhubri","2"),
("43","Dibrugarh","2"),
("44","Goalpara","2"),
("45","Golaghat","2"),
("46","Hailakandi","2"),
("47","Jorhat","2"),
("48","Karbi Anglong","2"),
("49","Karimganj","2"),
("50","Kokrajhar","2"),
("51","Lakhimpur","2"),
("52","Marigaon","2"),
("53","Nagaon","2"),
("54","Nalbari","2"),
("55","North Cachar Hills","2"),
("56","Sibsagar","2"),
("57","Sonitpur","2"),
("58","Tinsukia","2"),
("59","Araria","4"),
("60","Aurangabad","4"),
("61","Banka","4"),
("62","Begusarai","4"),
("63","Bhagalpur","4"),
("64","Bhojpur","4"),
("65","Buxar","4"),
("66","Darbhanga","4"),
("67","Purba Champaran","4"),
("68","Gaya","4"),
("69","Gopalganj","4"),
("70","Jamui","4"),
("71","Jehanabad","4"),
("72","Khagaria","4"),
("73","Kishanganj","4"),
("74","Kaimur","4"),
("75","Katihar","4"),
("76","Lakhisarai","4"),
("77","Madhubani","4"),
("78","Munger","4"),
("79","Madhepura","4"),
("80","Muzaffarpur","4"),
("81","Nalanda","4"),
("82","Nawada","4"),
("83","Patna","4"),
("84","Purnia","4"),
("85","Rohtas","4"),
("86","Saharsa","4"),
("87","Samastipur","4"),
("88","Sheohar","4"),
("89","Sheikhpura","4"),
("90","Saran","4"),
("91","Sitamarhi","4"),
("92","Supaul","4"),
("93","Siwan","4"),
("94","Vaishali","4"),
("95","Pashchim Champaran","4"),
("96","Bastar","35"),
("97","Bilaspur","35"),
("98","Dantewada","35"),
("99","Dhamtari","35"),
("100","Durg","35");
INSERT INTO district VALUES
("101","Jashpur","35"),
("102","Janjgir-Champa","35"),
("103","Korba","35"),
("104","Koriya","35"),
("105","Kanker","35"),
("106","Kawardha","35"),
("107","Mahasamund","35"),
("108","Raigarh","35"),
("109","Rajnandgaon","35"),
("110","Raipur","35"),
("111","Surguja","35"),
("112","Diu","29"),
("113","Daman","29"),
("114","Central Delhi","25"),
("115","East Delhi","25"),
("116","New Delhi","25"),
("117","North Delhi","25"),
("118","North East Delhi","25"),
("119","North West Delhi","25"),
("120","South Delhi","25"),
("121","South West Delhi","25"),
("122","West Delhi","25"),
("123","North Goa","26"),
("124","South Goa","26"),
("125","Ahmedabad","5"),
("126","Amreli District","5"),
("127","Anand","5"),
("128","Banaskantha","5"),
("129","Bharuch","5"),
("130","Bhavnagar","5"),
("131","Dahod","5"),
("132","The Dangs","5"),
("133","Gandhinagar","5"),
("134","Jamnagar","5"),
("135","Junagadh","5"),
("136","Kutch","5"),
("137","Kheda","5"),
("138","Mehsana","5"),
("139","Narmada","5"),
("140","Navsari","5"),
("141","Patan","5"),
("142","Panchmahal","5"),
("143","Porbandar","5"),
("144","Rajkot","5"),
("145","Sabarkantha","5"),
("146","Surendranagar","5"),
("147","Surat","5"),
("148","Vadodara","5"),
("149","Valsad","5"),
("150","Ambala","6"),
("151","Bhiwani","6"),
("152","Faridabad","6"),
("153","Fatehabad","6"),
("154","Gurgaon","6"),
("155","Hissar","6"),
("156","Jhajjar","6"),
("157","Jind","6"),
("158","Karnal","6"),
("159","Kaithal","6"),
("160","Kurukshetra","6"),
("161","Mahendragarh","6"),
("162","Mewat","6"),
("163","Panchkula","6"),
("164","Panipat","6"),
("165","Rewari","6"),
("166","Rohtak","6"),
("167","Sirsa","6"),
("168","Sonepat","6"),
("169","Yamuna Nagar","6"),
("170","Palwal","6"),
("171","Bilaspur","7"),
("172","Chamba","7"),
("173","Hamirpur","7"),
("174","Kangra","7"),
("175","Kinnaur","7"),
("176","Kulu","7"),
("177","Lahaul and Spiti","7"),
("178","Mandi","7"),
("179","Shimla","7"),
("180","Sirmaur","7"),
("181","Solan","7"),
("182","Una","7"),
("183","Anantnag","8"),
("184","Badgam","8"),
("185","Bandipore","8"),
("186","Baramula","8"),
("187","Doda","8"),
("188","Jammu","8"),
("189","Kargil","8"),
("190","Kathua","8"),
("191","Kupwara","8"),
("192","Leh","8"),
("193","Poonch","8"),
("194","Pulwama","8"),
("195","Rajauri","8"),
("196","Srinagar","8"),
("197","Samba","8"),
("198","Udhampur","8"),
("199","Bokaro","34"),
("200","Chatra","34");
INSERT INTO district VALUES
("201","Deoghar","34"),
("202","Dhanbad","34"),
("203","Dumka","34"),
("204","Purba Singhbhum","34"),
("205","Garhwa","34"),
("206","Giridih","34"),
("207","Godda","34"),
("208","Gumla","34"),
("209","Hazaribagh","34"),
("210","Koderma","34"),
("211","Lohardaga","34"),
("212","Pakur","34"),
("213","Palamu","34"),
("214","Ranchi","34"),
("215","Sahibganj","34"),
("216","Seraikela and Kharsawan","34"),
("217","Pashchim Singhbhum","34"),
("218","Ramgarh","34"),
("219","Bidar","9"),
("220","Belgaum","9"),
("221","Bijapur","9"),
("222","Bagalkot","9"),
("223","Bellary","9"),
("224","Bangalore Rural District","9"),
("225","Bangalore Urban District","9"),
("226","Chamarajnagar","9"),
("227","Chikmagalur","9"),
("228","Chitradurga","9"),
("229","Davanagere","9"),
("230","Dharwad","9"),
("231","Dakshina Kannada","9"),
("232","Gadag","9"),
("233","Gulbarga","9"),
("234","Hassan","9"),
("235","Haveri District","9"),
("236","Kodagu","9"),
("237","Kolar","9"),
("238","Koppal","9"),
("239","Mandya","9"),
("240","Mysore","9"),
("241","Raichur","9"),
("242","Shimoga","9"),
("243","Tumkur","9"),
("244","Udupi","9"),
("245","Uttara Kannada","9"),
("246","Ramanagara","9"),
("247","Chikballapur","9"),
("248","Yadagiri","9"),
("249","Alappuzha","10"),
("250","Ernakulam","10"),
("251","Idukki","10"),
("252","Kollam","10"),
("253","Kannur","10"),
("254","Kasaragod","10"),
("255","Kottayam","10"),
("256","Kozhikode","10"),
("257","Malappuram","10"),
("258","Palakkad","10"),
("259","Pathanamthitta","10"),
("260","Thrissur","10"),
("261","Thiruvananthapuram","10"),
("262","Wayanad","10"),
("263","Alirajpur","11"),
("264","Anuppur","11"),
("265","Ashok Nagar","11"),
("266","Balaghat","11"),
("267","Barwani","11"),
("268","Betul","11"),
("269","Bhind","11"),
("270","Bhopal","11"),
("271","Burhanpur","11"),
("272","Chhatarpur","11"),
("273","Chhindwara","11"),
("274","Damoh","11"),
("275","Datia","11"),
("276","Dewas","11"),
("277","Dhar","11"),
("278","Dindori","11"),
("279","Guna","11"),
("280","Gwalior","11"),
("281","Harda","11"),
("282","Hoshangabad","11"),
("283","Indore","11"),
("284","Jabalpur","11"),
("285","Jhabua","11"),
("286","Katni","11"),
("287","Khandwa","11"),
("288","Khargone","11"),
("289","Mandla","11"),
("290","Mandsaur","11"),
("291","Morena","11"),
("292","Narsinghpur","11"),
("293","Neemuch","11"),
("294","Panna","11"),
("295","Rewa","11"),
("296","Rajgarh","11"),
("297","Ratlam","11"),
("298","Raisen","11"),
("299","Sagar","11"),
("300","Satna","11");
INSERT INTO district VALUES
("301","Sehore","11"),
("302","Seoni","11"),
("303","Shahdol","11"),
("304","Shajapur","11"),
("305","Sheopur","11"),
("306","Shivpuri","11"),
("307","Sidhi","11"),
("308","Singrauli","11"),
("309","Tikamgarh","11"),
("310","Ujjain","11"),
("311","Umaria","11"),
("312","Vidisha","11"),
("313","Ahmednagar","12"),
("314","Akola","12"),
("315","Amrawati","12"),
("316","Aurangabad","12"),
("317","Bhandara","12"),
("318","Beed","12"),
("319","Buldhana","12"),
("320","Chandrapur","12"),
("321","Dhule","12"),
("322","Gadchiroli","12"),
("323","Gondiya","12"),
("324","Hingoli","12"),
("325","Jalgaon","12"),
("326","Jalna","12"),
("327","Kolhapur","12"),
("328","Latur","12"),
("329","Mumbai City","12"),
("330","Mumbai suburban","12"),
("331","Nandurbar","12"),
("332","Nanded","12"),
("333","Nagpur","12"),
("334","Nashik","12"),
("335","Osmanabad","12"),
("336","Parbhani","12"),
("337","Pune","12"),
("338","Raigad","12"),
("339","Ratnagiri","12"),
("340","Sindhudurg","12"),
("341","Sangli","12"),
("342","Solapur","12"),
("343","Satara","12"),
("344","Thane","12"),
("345","Wardha","12"),
("346","Washim","12"),
("347","Yavatmal","12"),
("348","Bishnupur","13"),
("349","Churachandpur","13"),
("350","Chandel","13"),
("351","Imphal East","13"),
("352","Senapati","13"),
("353","Tamenglong","13"),
("354","Thoubal","13"),
("355","Ukhrul","13"),
("356","Imphal West","13"),
("357","East Garo Hills","14"),
("358","East Khasi Hills","14"),
("359","Jaintia Hills","14"),
("360","Ri-Bhoi","14"),
("361","South Garo Hills","14"),
("362","West Garo Hills","14"),
("363","West Khasi Hills","14"),
("364","Aizawl","15"),
("365","Champhai","15"),
("366","Kolasib","15"),
("367","Lawngtlai","15"),
("368","Lunglei","15"),
("369","Mamit","15"),
("370","Saiha","15"),
("371","Serchhip","15"),
("372","Dimapur","16"),
("373","Kohima","16"),
("374","Mokokchung","16"),
("375","Mon","16"),
("376","Phek","16"),
("377","Tuensang","16"),
("378","Wokha","16"),
("379","Zunheboto","16"),
("380","Angul","17"),
("381","Boudh","17"),
("382","Bhadrak","17"),
("383","Bolangir","17"),
("384","Bargarh","17"),
("385","Baleswar","17"),
("386","Cuttack","17"),
("387","Debagarh","17"),
("388","Dhenkanal","17"),
("389","Ganjam","17"),
("390","Gajapati","17"),
("391","Jharsuguda","17"),
("392","Jajapur","17"),
("393","Jagatsinghpur","17"),
("394","Khordha","17"),
("395","Kendujhar","17"),
("396","Kalahandi","17"),
("397","Kandhamal","17"),
("398","Koraput","17"),
("399","Kendrapara","17"),
("400","Malkangiri","17");
INSERT INTO district VALUES
("401","Mayurbhanj","17"),
("402","Nabarangpur","17"),
("403","Nuapada","17"),
("404","Nayagarh","17"),
("405","Puri","17"),
("406","Rayagada","17"),
("407","Sambalpur","17"),
("408","Subarnapur","17"),
("409","Sundargarh","17"),
("410","Karaikal","27"),
("411","Mahe","27"),
("412","Puducherry","27"),
("413","Yanam","27"),
("414","Amritsar","18"),
("415","Bathinda","18"),
("416","Firozpur","18"),
("417","Faridkot","18"),
("418","Fatehgarh Sahib","18"),
("419","Gurdaspur","18"),
("420","Hoshiarpur","18"),
("421","Jalandhar","18"),
("422","Kapurthala","18"),
("423","Ludhiana","18"),
("424","Mansa","18"),
("425","Moga","18"),
("426","Mukatsar","18"),
("427","Nawan Shehar","18"),
("428","Patiala","18"),
("429","Rupnagar","18"),
("430","Sangrur","18"),
("431","Ajmer","19"),
("432","Alwar","19"),
("433","Bikaner","19"),
("434","Barmer","19"),
("435","Banswara","19"),
("436","Bharatpur","19"),
("437","Baran","19"),
("438","Bundi","19"),
("439","Bhilwara","19"),
("440","Churu","19"),
("441","Chittorgarh","19"),
("442","Dausa","19"),
("443","Dholpur","19"),
("444","Dungapur","19"),
("445","Ganganagar","19"),
("446","Hanumangarh","19"),
("447","Juhnjhunun","19"),
("448","Jalore","19"),
("449","Jodhpur","19"),
("450","Jaipur","19"),
("451","Jaisalmer","19"),
("452","Jhalawar","19"),
("453","Karauli","19"),
("454","Kota","19"),
("455","Nagaur","19"),
("456","Pali","19"),
("457","Pratapgarh","19"),
("458","Rajsamand","19"),
("459","Sikar","19"),
("460","Sawai Madhopur","19"),
("461","Sirohi","19"),
("462","Tonk","19"),
("463","Udaipur","19"),
("464","East Sikkim","20"),
("465","North Sikkim","20"),
("466","South Sikkim","20"),
("467","West Sikkim","20"),
("468","Ariyalur","21"),
("469","Chennai","21"),
("470","Coimbatore","21"),
("471","Cuddalore","21"),
("472","Dharmapuri","21"),
("473","Dindigul","21"),
("474","Erode","21"),
("475","Kanchipuram","21"),
("476","Kanyakumari","21"),
("477","Karur","21"),
("478","Madurai","21"),
("479","Nagapattinam","21"),
("480","The Nilgiris","21"),
("481","Namakkal","21"),
("482","Perambalur","21"),
("483","Pudukkottai","21"),
("484","Ramanathapuram","21"),
("485","Salem","21"),
("486","Sivagangai","21"),
("487","Tiruppur","21"),
("488","Tiruchirappalli","21"),
("489","Theni","21"),
("490","Tirunelveli","21"),
("491","Thanjavur","21"),
("492","Thoothukudi","21"),
("493","Thiruvallur","21"),
("494","Thiruvarur","21"),
("495","Tiruvannamalai","21"),
("496","Vellore","21"),
("497","Villupuram","21"),
("498","Dhalai","22"),
("499","North Tripura","22"),
("500","South Tripura","22");
INSERT INTO district VALUES
("501","West Tripura","22"),
("502","Almora","33"),
("503","Bageshwar","33"),
("504","Chamoli","33"),
("505","Champawat","33"),
("506","Dehradun","33"),
("507","Haridwar","33"),
("508","Nainital","33"),
("509","Pauri Garhwal","33"),
("510","Pithoragharh","33"),
("511","Rudraprayag","33"),
("512","Tehri Garhwal","33"),
("513","Udham Singh Nagar","33"),
("514","Uttarkashi","33"),
("515","Agra","23"),
("516","Allahabad","23"),
("517","Aligarh","23"),
("518","Ambedkar Nagar","23"),
("519","Auraiya","23"),
("520","Azamgarh","23"),
("521","Barabanki","23"),
("522","Badaun","23"),
("523","Bagpat","23"),
("524","Bahraich","23"),
("525","Bijnor","23"),
("526","Ballia","23"),
("527","Banda","23"),
("528","Balrampur","23"),
("529","Bareilly","23"),
("530","Basti","23"),
("531","Bulandshahr","23"),
("532","Chandauli","23"),
("533","Chitrakoot","23"),
("534","Deoria","23"),
("535","Etah","23"),
("536","Kanshiram Nagar","23"),
("537","Etawah","23"),
("538","Firozabad","23"),
("539","Farrukhabad","23"),
("540","Fatehpur","23"),
("541","Faizabad","23"),
("542","Gautam Buddha Nagar","23"),
("543","Gonda","23"),
("544","Ghazipur","23"),
("545","Gorkakhpur","23"),
("546","Ghaziabad","23"),
("547","Hamirpur","23"),
("548","Hardoi","23"),
("549","Mahamaya Nagar","23"),
("550","Jhansi","23"),
("551","Jalaun","23"),
("552","Jyotiba Phule Nagar","23"),
("553","Jaunpur District","23"),
("554","Kanpur Dehat","23"),
("555","Kannauj","23"),
("556","Kanpur Nagar","23"),
("557","Kaushambi","23"),
("558","Kushinagar","23"),
("559","Lalitpur","23"),
("560","Lakhimpur Kheri","23"),
("561","Lucknow","23"),
("562","Mau","23"),
("563","Meerut","23"),
("564","Maharajganj","23"),
("565","Mahoba","23"),
("566","Mirzapur","23"),
("567","Moradabad","23"),
("568","Mainpuri","23"),
("569","Mathura","23"),
("570","Muzaffarnagar","23"),
("571","Pilibhit","23"),
("572","Pratapgarh","23"),
("573","Rampur","23"),
("574","Rae Bareli","23"),
("575","Saharanpur","23"),
("576","Sitapur","23"),
("577","Shahjahanpur","23"),
("578","Sant Kabir Nagar","23"),
("579","Siddharthnagar","23"),
("580","Sonbhadra","23"),
("581","Sant Ravidas Nagar","23"),
("582","Sultanpur","23"),
("583","Shravasti","23"),
("584","Unnao","23"),
("585","Varanasi","23"),
("586","Birbhum","24"),
("587","Bankura","24"),
("588","Bardhaman","24"),
("589","Darjeeling","24"),
("590","Dakshin Dinajpur","24"),
("591","Hooghly","24"),
("592","Howrah","24"),
("593","Jalpaiguri","24"),
("594","Cooch Behar","24"),
("595","Kolkata","24"),
("596","Malda","24"),
("597","Midnapore","24"),
("598","Murshidabad","24"),
("599","Nadia","24"),
("600","North 24 Parganas","24");
INSERT INTO district VALUES
("601","South 24 Parganas","24"),
("602","Purulia","24"),
("603","Uttar Dinajpur","24");




CREATE TABLE `farmer` (
  `f_id` int NOT NULL AUTO_INCREMENT,
  `f_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_password` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_address` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `v_id` (`v_id`),
  CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO farmer VALUES
("1","abc","e10adc3949ba59abbe56e057f20f883e","abc street","1234567890","680"),
("2","9400326201","e10adc3949ba59abbe56e057f20f883e","6C GJ Lavender, Opp Cherthala Police Station","9400326201","1194"),
("3","testnit","4297f44b13955235245b2497399d7a93","123","1122112212","680");




CREATE TABLE `farmer_language` (
  `fl_id` int NOT NULL AUTO_INCREMENT,
  `f_id` int NOT NULL,
  `l_id` int NOT NULL,
  PRIMARY KEY (`fl_id`),
  KEY `f_id` (`f_id`),
  KEY `l_id` (`l_id`),
  CONSTRAINT `farmer_language_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`),
  CONSTRAINT `farmer_language_ibfk_2` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `harvesting` (
  `h_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `h_date` int NOT NULL,
  `h_quantity` int NOT NULL,
  `h_unit_price` float NOT NULL,
  `h_transp_willing` int NOT NULL,
  `h_status` int NOT NULL,
  `ut_id` int NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `p_id` (`p_id`),
  KEY `ut_id` (`ut_id`),
  CONSTRAINT `harvesting_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `planting` (`p_id`),
  CONSTRAINT `harvesting_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `harvest_process` (
  `hp_id` int NOT NULL AUTO_INCREMENT,
  `h_id` int NOT NULL,
  `hp_quantity` int NOT NULL,
  `hp_date` int NOT NULL,
  PRIMARY KEY (`hp_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `harvest_process_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `harvesting` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `language` (
  `l_id` int NOT NULL AUTO_INCREMENT,
  `l_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO language VALUES
("1","malayalam"),
("2","english"),
("3","hindi"),
("4","tamil"),
("5","telgu");




CREATE TABLE `planting` (
  `p_id` int NOT NULL AUTO_INCREMENT,
  `c_id` int NOT NULL,
  `p_planting_date` int NOT NULL,
  `p_harvesting_date` int NOT NULL,
  `p_quantity` int NOT NULL,
  `p_quantity_type` int NOT NULL,
  `v_id` int NOT NULL,
  `p_locality` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `f_id` int NOT NULL,
  `p_status` int NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `c_id` (`c_id`),
  KEY `v_id` (`v_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `planting_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_id`),
  CONSTRAINT `planting_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`),
  CONSTRAINT `planting_ibfk_3` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `state` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `s_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`s_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO state VALUES
("1","ANDHRA PRADESH"),
("2","ASSAM"),
("3","ARUNACHAL PRADESH"),
("4","BIHAR"),
("5","GUJRAT"),
("6","HARYANA"),
("7","HIMACHAL PRADESH"),
("8","JAMMU & KASHMIR"),
("9","KARNATAKA"),
("10","KERALA"),
("11","MADHYA PRADESH"),
("12","MAHARASHTRA"),
("13","MANIPUR"),
("14","MEGHALAYA"),
("15","MIZORAM"),
("16","NAGALAND"),
("17","ORISSA"),
("18","PUNJAB"),
("19","RAJASTHAN"),
("20","SIKKIM"),
("21","TAMIL NADU"),
("22","TRIPURA"),
("23","UTTAR PRADESH"),
("24","WEST BENGAL"),
("25","DELHI"),
("26","GOA"),
("27","PONDICHERY"),
("28","LAKSHDWEEP"),
("29","DAMAN & DIU"),
("30","DADRA & NAGAR"),
("31","CHANDIGARH"),
("32","ANDAMAN & NICOBAR"),
("33","UTTARANCHAL"),
("34","JHARKHAND"),
("35","CHHATTISGARH");




CREATE TABLE `unit_type` (
  `ut_id` int NOT NULL AUTO_INCREMENT,
  `ut_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO unit_type VALUES
("1","kilogram"),
("2","litter"),
("3","meter"),
("4","item number");




CREATE TABLE `village` (
  `v_id` int NOT NULL AUTO_INCREMENT,
  `v_name` varchar(250) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `d_id` int NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `village_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `district` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO village VALUES
("1","Kasaragod\n","254"),
("2","Pavoor\n","254"),
("3","Vorkady\n","254"),
("4","Pathur\n","254"),
("5","Kodalamogaru\n","254"),
("6","Koliyoor\n","254"),
("7","Kaliyoor\n","254"),
("8","Talikala\n","254"),
("9","Meenja\n","254"),
("10","Kadambar\n","254"),
("11","Moodambail\n","254"),
("12","Kuloor\n","254"),
("13","Majibail\n","254"),
("14","Badaje\n","254"),
("15","Mulinja\n","254"),
("16","Kodibail\n","254"),
("17","Ichilangod\n","254"),
("18","Heroor\n","254"),
("19","Kubanoor\n","254"),
("20","Bekoor\n","254"),
("21","Kayyar\n","254"),
("22","Kudalmarkala\n","254"),
("23","Paivalike\n","254"),
("24","Chippar\n","254"),
("25","Bayar\n","254"),
("26","Badoor\n","254"),
("27","Angadimogaru\n","254"),
("28","Mugu\n","254"),
("29","Maire\n","254"),
("30","Enmakaje\n","254"),
("31","Kattukukke\n","254"),
("32","Padre\n","254"),
("33","Badiyadka\n","254"),
("34","Nirchal\n","254"),
("35","Bela\n","254"),
("36","Puthige\n","254"),
("37","Edanad\n","254"),
("38","Kannur\n","254"),
("39","Kidoor\n","254"),
("40","Ujarulvar\n","254"),
("41","Bombrana\n","254"),
("42","Arikady\n","254"),
("43","Ichilampady\n","254"),
("44","Patla\n","254"),
("45","Kalnad\n","254"),
("46","Perumbala\n","254"),
("47","Thekkil\n","254"),
("48","Muttathody\n","254"),
("49","Pady\n","254"),
("50","Nekraje\n","254"),
("51","Ubrangala\n","254"),
("52","Kumbadaje\n","254"),
("53","Nettanige\n","254"),
("54","Bellur\n","254"),
("55","Adhur\n","254"),
("56","Karadka\n","254"),
("57","Muliyar\n","254"),
("58","Kolathur\n","254"),
("59","Bedadka\n","254"),
("60","Munnad\n","254"),
("61","Kuttikole\n","254"),
("62","Karivedakam\n","254"),
("63","Bandadka\n","254"),
("64","Adoor\n","254"),
("65","Delampady\n","254"),
("66","Kunjathur (CT)\n","254"),
("67","Manjeshwar (CT)\n","254"),
("68","Hosabettu (CT)\n","254"),
("69","Bangra Manjeshwar (CT)\n","254"),
("70","Uppala (CT)\n","254"),
("71","Mangalpady (CT)\n","254"),
("72","Shiriya (CT)\n","254"),
("73","Koipady (CT)\n","254"),
("74","Mogral (CT)\n","254"),
("75","Puthur (CT)\n","254"),
("76","Shiribagilu (CT)\n","254"),
("77","Madhur (CT)\n","254"),
("78","Kudlu (CT)\n","254"),
("79","Chengala (CT)\n","254"),
("80","Chemnad (CT)\n","254"),
("81","Hosdurg\n","254"),
("82","Pallikkara II\n","254"),
("83","Panayal\n","254"),
("84","Chithari\n","254"),
("85","Periya\n","254"),
("86","Pullur\n","254"),
("87","Kodom\n","254"),
("88","Kallar\n","254"),
("89","Panathady\n","254"),
("90","Balal\n","254"),
("91","Maloth \n","254"),
("92","West Eleri\n","254"),
("93","Palavayal\n","254"),
("94","Chittarikkal\n","254"),
("95","Bheemanady\n","254"),
("96","Parappa \n","254"),
("97","Thayanur\n","254"),
("98","Ambalathara\n","254"),
("99","Madikai\n","254"),
("100","Kinanoor\n","254");
INSERT INTO village VALUES
("101","Karindalam\n","254"),
("102","Cheemeni II\n","254"),
("103","Cheemeni \n","254"),
("104","Kayyur\n","254"),
("105","Kilayikode\n","254"),
("106","Thimiri\n","254"),
("107","Kodakkad\n","254"),
("108","Padne\n","254"),
("109","Udinoor\n","254"),
("110","Bare (CT)\n","254"),
("111","Udma (CT)\n","254"),
("112","Pallikkara (CT)\n","254"),
("113","Keekan (CT)\n","254"),
("114","Ajanur (CT)\n","254"),
("115","Perole (CT)\n","254"),
("116","Pilicode (CT)\n","254"),
("117","Maniyat (CT)\n","254"),
("118","North Thrikkaripur (CT)\n","254"),
("119","South Thrikkaripur (CT)\n","254"),
("120","Nileshwar (OG)\n","254"),
("121","Cheruvathur (OG)  \n","254"),
("122","Kannur\n","253"),
("123","Taliparamba \n","253"),
("124","Ramanthali\n","253"),
("125","Peralam\n","253"),
("126","Kankole\n","253"),
("127","Alapadamba\n","253"),
("128","Eramam\n","253"),
("129","Perinthatta\n","253"),
("130","Kuttoor\n","253"),
("131","Vellora\n","253"),
("132","Peringome\n","253"),
("133","Thimiri\n","253"),
("134","Vayakkara\n","253"),
("135","Pulingome\n","253"),
("136","Thirumeni\n","253"),
("137","Alakode\n","253"),
("138","Vellad\n","253"),
("139","New Naduvil\n","253"),
("140","Kooveri\n","253"),
("141","Panniyoor\n","253"),
("142","Kuttiyeri\n","253"),
("143","Pattuvam\n","253"),
("144","Chuzhali\n","253"),
("145","Nediyanga\n","253"),
("146","Eruvassy\n","253"),
("147","Payyavoor\n","253"),
("148","Nuchiyad\n","253"),
("149","Vayathur\n","253"),
("150","Padiyoor\n","253"),
("151","Kalliad\n","253"),
("152","Sreekandapuram\n","253"),
("153","Malapattam\n","253"),
("154","Chengalai\n","253"),
("155","Kayaralam\n","253"),
("156","Karivellur (CT)\n","253"),
("157","Pariyaram (CT)\n","253"),
("158","Kurumathur (CT)\n","253"),
("159","Irikkur (CT)\n","253"),
("160","Kuttiattoor (CT)\n","253"),
("161","Mayyil (CT)\n","253"),
("162","Kolacherry (CT)\n","253"),
("163","Cheleri (CT)\n","253"),
("164","Maniyoor (CT)\n","253"),
("165","Panapuzha\n","253"),
("166","Mattool\n","253"),
("167","Kunhimangalam (CT)\n","253"),
("168","Cheruthazham (CT)\n","253"),
("169","Kadannappalli (CT)\n","253"),
("170","Ezhome (CT)\n","253"),
("171","Madayi (CT)\n","253"),
("172","Cherukunnu (CT)\n","253"),
("173","Kannapuram (CT)\n","253"),
("174","Narath (CT)\n","253"),
("175","Pappinisseri (CT)\n","253"),
("176","Kalliasseri (CT)\n","253"),
("177","Azhikode North (CT)\n","253"),
("178","Azhikode South (CT)\n","253"),
("179","Valapattanam (CT)\n","253"),
("180","Chirakkal (CT)\n","253"),
("181","Kannadiparamba (CT)\n","253"),
("182","Munderi (CT)\n","253"),
("183","Kanhirode (CT)\n","253"),
("184","Varam (CT)\n","253"),
("185","Puzhathi (CT)\n","253"),
("186","Pallikkunnu (CT)\n","253"),
("187","Elayavoor (CT)\n","253"),
("188","Chelora (CT)\n","253"),
("189","Ancharakandy (CT)\n","253"),
("190","Iriveri (CT)\n","253"),
("191","Chala (CT)\n","253"),
("192","Thottada (CT)\n","253"),
("193","Kadachira (CT)\n","253"),
("194","Mavilayi (CT)\n","253"),
("195","Peralassery (CT)\n","253"),
("196","Muzhappilangad (CT)\n","253"),
("197","Thalassery\n","253"),
("198","Pattannur\n","253"),
("199","Chavassery\n","253"),
("200","Keezhur\n","253");
INSERT INTO village VALUES
("201","Payam\n","253"),
("202","Vilamana\n","253"),
("203","Ayyankunnu\n","253"),
("204","Aralam\n","253"),
("205","Kottiyoor\n","253"),
("206","Kelakam\n","253"),
("207","Kanichar\n","253"),
("208","Manathana\n","253"),
("209","Muzhakkunnu\n","253"),
("210","Thillenkeri\n","253"),
("211","Tholambra\n","253"),
("212","Vellarvelly\n","253"),
("213","Vekkalam\n","253"),
("214","Koloyad\n","253"),
("215","Kannavam\n","253"),
("216","Sivapuram\n","253"),
("217","Cheruvanchery\n","253"),
("218","Puthoor\n","253"),
("219","Thrippangottur\n","253"),
("220","Koodali (CT)\n","253"),
("221","Keezhallur (CT)\n","253"),
("222","Paduvilayi (CT)\n","253"),
("223","Pathiriyad (CT)\n","253"),
("224","Mangattidam (CT)\n","253"),
("225","Kandamkunnu (CT)\n","253"),
("226","Manantheri (CT)\n","253"),
("227","Kottayam-Malabar (CT)\n","253"),
("228","Eruvatti (CT)\n","253"),
("229","Pinarayi (CT)\n","253"),
("230","Dharmadom (CT)\n","253"),
("231","Eranholi (CT)\n","253"),
("232","Kadirur (CT)\n","253"),
("233","Pattiom (CT)\n","253"),
("234","Mokeri (CT)\n","253"),
("235","Kolavelloor (CT)\n","253"),
("236","Panoor (CT)\n","253"),
("237","Panniyannur (CT)\n","253"),
("238","New Mahe (CT)\n","253"),
("239","Chockli (CT)\n","253"),
("240","Peringathur (CT)\n","253"),
("241","Wayanad\n","262"),
("242","Mananthavady\n","262"),
("243","Thirunelly\n","262"),
("244","Thrissilery\n","262"),
("245","Payyampally\n","262"),
("246","Thavinhal\n","262"),
("247","Periya\n","262"),
("248","Thondernad\n","262"),
("249","Valat\n","262"),
("250","Edavaka\n","262"),
("251","Nalloornad\n","262"),
("252","Cherukottur\n","262"),
("253","Panamaram\n","262"),
("254","Anchukunnu\n","262"),
("255","Porunnanore\n","262"),
("256","Vellamunda\n","262"),
("257","Kanjirangad\n","262"),
("258","Sulthanbathery\n","262"),
("259","Nadavayal \n","262"),
("260","Poothadi\n","262"),
("261","Pulpalli\n","262"),
("262","Padichira\n","262"),
("263","Kidanganad\n","262"),
("264","Irulam\n","262"),
("265","Purakkadi \n","262"),
("266","Krishnagiri\n","262"),
("267","Kuppadi\n","262"),
("268","Noolpuzha\n","262"),
("269","Cheeral\n","262"),
("270","Nenmeni\n","262"),
("271","Ambalavayal\n","262"),
("272","Thomattuchal\n","262"),
("273","Vythiri\n","262"),
("274","Padinharethara\n","262"),
("275","Kuppadithara\n","262"),
("276","Kottathara \n","262"),
("277","Kaniambetta\n","262"),
("278","Muttil North \n","262"),
("279","Muttil South\n","262"),
("280","Vengappally\n","262"),
("281","Kavumannam\n","262"),
("282","Thariyode\n","262"),
("283","Achooranam\n","262"),
("284","Pozhuthana\n","262"),
("285","Kunnathidavaka\n","262"),
("286","Chundale\n","262"),
("287","Kottappadi (Part)\n","262"),
("288","Thrikkaipatta (Part)\n","262"),
("289","Muppainad\n","262"),
("290","Vellarimala\n","262"),
("291","Kozhikode\n","256"),
("292","Vadakara\n","256"),
("293","Onchiam\n","256"),
("294","Vanimel\n","256"),
("295","Vilangad\n","256"),
("296","Thinoor\n","256"),
("297","Kavilumpara\n","256"),
("298","Kayakkodi\n","256"),
("299","Narippatta\n","256"),
("300","Purameri\n","256");
INSERT INTO village VALUES
("301","Thiruvallur\n","256"),
("302","Velom\n","256"),
("303","Kuttiadi\n","256"),
("304","Maruthonkara\n","256"),
("305","Valayam (CT)\n","256"),
("306","Chekkiad (CT)\n","256"),
("307","Thuneri (CT)\n","256"),
("308","Kunnummal (CT)\n","256"),
("309","Nadapuram (CT)\n","256"),
("310","Edacheri (CT)\n","256"),
("311","Eramala (CT)\n","256"),
("312","Azhiyur (CT)\n","256"),
("313","Chorode (CT)\n","256"),
("314","Ayancheri (CT)\n","256"),
("315","Kottappally (CT)\n","256"),
("316","Villiappally (CT)\n","256"),
("317","Palayad (CT)\n","256"),
("318","Maniyur (CT)\n","256"),
("319","Quilandy\n","256"),
("320","Payyoli\n","256"),
("321","Cheruvannur\n","256"),
("322","Palery\n","256"),
("323","Changaroth\n","256"),
("324","Chempanoda\n","256"),
("325","Chakkittapara\n","256"),
("326","Perambra\n","256"),
("327","Nochad\n","256"),
("328","Moodadi\n","256"),
("329","Arikkulam (Part)\n","256"),
("330","Kottur\n","256"),
("331","Kayanna \n","256"),
("332","Koorachundu \n","256"),
("333","Kanthalad \n","256"),
("334","Avitanallur\n","256"),
("335","Chengottukavu\n","256"),
("336","Kinalur\n","256"),
("337","Unnikulam\n","256"),
("338","Sivapuram\n","256"),
("339","Iringal (CT)\n","256"),
("340","Eravattur (CT)\n","256"),
("341","Koothali (CT)\n","256"),
("342","Menhaniam (CT)\n","256"),
("343","Meppayyur (CT)\n","256"),
("344","Kozhukkallur (CT)\n","256"),
("345","Thurayur (CT)\n","256"),
("346","Thikkody (CT)\n","256"),
("347","Keezhariyur (CT)\n","256"),
("348","Naduvannur (CT)\n","256"),
("349","Panangad (CT)\n","256"),
("350","Balusseri (CT)\n","256"),
("351","Ulliyeri (CT)\n","256"),
("352","Chemancheri (CT)\n","256"),
("353","Atholi (CT)\n","256"),
("354","Kakkur\n","256"),
("355","Narikkuni\n","256"),
("356","Kizhakkoth\n","256"),
("357","Vavad\n","256"),
("358","Raroth\n","256"),
("359","Kedavur\n","256"),
("360","Puthuppadi\n","256"),
("361","Engapuzha\n","256"),
("362","Koodathayi \n","256"),
("363","Kodencheri\n","256"),
("364","Nellipoyil\n","256"),
("365","Koodaranji\n","256"),
("366","Thiruvambadi\n","256"),
("367","Neeleswaram \n","256"),
("368","Puthur\n","256"),
("369","Chathamangalam \n","256"),
("370","Madavoor\n","256"),
("371","Kumaranallur\n","256"),
("372","Kakkad\n","256"),
("373","Kodiyathur\n","256"),
("374","Nanmanda (CT)\n","256"),
("375","Chelannur (CT)\n","256"),
("376","Thalakkulathur (CT)\n","256"),
("377","Kakkodi (CT)\n","256"),
("378","Kuruvattur (CT)\n","256"),
("379","Kunnamangalam (CT)\n","256"),
("380","Poolacode (CT)\n","256"),
("381","Thazhecode (CT)\n","256"),
("382","Mavoor (CT)\n","256"),
("383","Peruvayal (CT)\n","256"),
("384","Kuttikkattoor (CT)\n","256"),
("385","Olavanna (CT)\n","256"),
("386","Pantheeramkavu (CT)\n","256"),
("387","Perumanna (CT)\n","256"),
("388","Ramanattukara (CT)\n","256"),
("389","Cheruvannur (CT)\n","256"),
("390","Beypore (CT)\n","256"),
("391","Karuvanthuruthy (CT)\n","256"),
("392","Feroke (CT)\n","256"),
("393","Koduvally (OG)\n","256"),
("394","Elathur (OG)\n","256"),
("395","Kadalundi (OG)\n","256"),
("396","Puthiyangadi (OG) (Part)\n","256"),
("397","Malappuram\n","257"),
("398","Ernad\n","257"),
("399","Vettilappara\n","257"),
("400","Vazhakkad\n","257");
INSERT INTO village VALUES
("401","Pulikkal\n","257"),
("402","Cheekkode\n","257"),
("403","Areekode\n","257"),
("404","Urangattiri\n","257"),
("405","Perakamanna\n","257"),
("406","Edavanna\n","257"),
("407","Karakunnu\n","257"),
("408","Kavanoor\n","257"),
("409","Kuzhimanna\n","257"),
("410","Muthuvallur\n","257"),
("411","Nediyiruppu\n","257"),
("412","Morayur\n","257"),
("413","Pookkottur\n","257"),
("414","Pulpatta\n","257"),
("415","Trikkalangode\n","257"),
("416","Elankur\n","257"),
("417","Pandalur\n","257"),
("418","Vettikkattiri\n","257"),
("419","Chembrasseri\n","257"),
("420","Pandikkad\n","257"),
("421","Kizhuparamba (CT)\n","257"),
("422","Vazhayur (CT)\n","257"),
("423","Cherukavu (CT)\n","257"),
("424","Kondotty (CT)\n","257"),
("425","Anakkayam (OG)\n","257"),
("426","Nilambur\n","257"),
("427","Pullipadam \n","257"),
("428","Akampadam\n","257"),
("429","Kurumbilangode\n","257"),
("430","Chungathara\n","257"),
("431","Edakkara\n","257"),
("432","Vazhikkadavu\n","257"),
("433","Amarambalam\n","257"),
("434","Karulai\n","257"),
("435","Mambad\n","257"),
("436","Thiruvali\n","257"),
("437","Porur\n","257"),
("438","Wandoor\n","257"),
("439","Chekkode\n","257"),
("440","Kalikavu\n","257"),
("441","Vellayur\n","257"),
("442","Thuvvur\n","257"),
("443","Kerala Estate\n","257"),
("444","Karuvarakundu\n","257"),
("445","Nilambur (CT)\n","257"),
("446","Perinthalmanna\n","257"),
("447","Edappatta\n","257"),
("448","Melattur\n","257"),
("449","Keezhattur\n","257"),
("450","Nenmini\n","257"),
("451","Mankada\n","257"),
("452","Vadakkangara\n","257"),
("453","Kuruva\n","257"),
("454","Puzhakkattiri\n","257"),
("455","Valambur\n","257"),
("456","Angadippuram\n","257"),
("457","Kariavattom\n","257"),
("458","Vettathur\n","257"),
("459","Arakkuparamba\n","257"),
("460","Thazhekode\n","257"),
("461","Aliparamba\n","257"),
("462","Anamangad\n","257"),
("463","Elamkulam\n","257"),
("464","Pulamanthole\n","257"),
("465","Kuruvambalam\n","257"),
("466","Moorkkanad\n","257"),
("467","Koottilangadi (CT)\n","257"),
("468","Kodur (CT)\n","257"),
("469","Tirur\n","257"),
("470","Pariyapuram\n","257"),
("471","Tanur \n","257"),
("472","Ozhur\n","257"),
("473","Niramaruthur\n","257"),
("474","Valavannur\n","257"),
("475","Kalpakancheri\n","257"),
("476","Marakkara\n","257"),
("477","Ponmala\n","257"),
("478","Melmuri\n","257"),
("479","Edayoor\n","257"),
("480","Athavanad\n","257"),
("481","Kurumbathur\n","257"),
("482","Ananthavoor\n","257"),
("483","Vettom\n","257"),
("484","Purathur\n","257"),
("485","Mangalam\n","257"),
("486","Kottakkal (CT)\n","257"),
("487","Perumanna (CT)\n","257"),
("488","Ponmundam (CT)\n","257"),
("489","Tanalur (CT)\n","257"),
("490","Cheriyamundam (CT)\n","257"),
("491","Kattipparuthi (CT)\n","257"),
("492","Talakkad (CT)\n","257"),
("493","Triprangode (CT)\n","257"),
("494","Thirunavaya (CT)\n","257"),
("495","Naduvattom (CT)\n","257"),
("496","Kuttippuram (CT)\n","257"),
("497","Irimbiliyam (CT)\n","257"),
("498","Tirurangadi\n","257"),
("499","Vallikkunnu\n","257"),
("500","Parappanangadi \n","257");
INSERT INTO village VALUES
("501","Chelambra (CT)\n","257"),
("502","Pallikal (CT)\n","257"),
("503","Thenhippalam (CT)\n","257"),
("504","Ariyallur (CT)\n","257"),
("505","Moonniyur (CT)\n","257"),
("506","Peruvallur (CT)\n","257"),
("507","Kannamangalam (CT)\n","257"),
("508","Urakam (CT)\n","257"),
("509","Othukkungal (CT)\n","257"),
("510","Parappur (CT)\n","257"),
("511","Vengara (CT)\n","257"),
("512","Abdu Rahiman Nagar (CT)\n","257"),
("513","Tirurangadi (CT)\n","257"),
("514","Neduva (CT)\n","257"),
("515","Nannambra (CT)\n","257"),
("516","Thennala (CT)\n","257"),
("517","Ponnani\n","257"),
("518","Tavanur\n","257"),
("519","Vattamkulam\n","257"),
("520","Veliyankode\n","257"),
("521","Perumpadappa\n","257"),
("522","Nannamukku\n","257"),
("523","Kalady (CT)\n","257"),
("524","Edappal (CT)\n","257"),
("525","Alamcode (CT)\n","257"),
("526","Marancheri (CT)\n","257"),
("527","Palakkad\n","258"),
("528","Ottappalam\n","258"),
("529","Anakkara\n","258"),
("530","Parudur\n","258"),
("531","Thiruvegapura\n","258"),
("532","Vilayur\n","258"),
("533","Kulukkallur\n","258"),
("534","Nellaya\n","258"),
("535","Cherpulacherry\n","258"),
("536","Vellinezhi\n","258"),
("537","Karimpuzha-I\n","258"),
("538","Karimpuzha-II\n","258"),
("539","Kadampazhipuram-II\n","258"),
("540","Kadampazhipuram-I\n","258"),
("541","Sreekrishnapuram -I\n","258"),
("542","Sreekrishnapuram -II\n","258"),
("543","Thrikkadeeri -II\n","258"),
("544","Thrikkadeeri -I\n","258"),
("545","Ananganadi\n","258"),
("546","Chalavara\n","258"),
("547","Vallapuzha\n","258"),
("548","Koppam\n","258"),
("549","Pattithara\n","258"),
("550","Kappur\n","258"),
("551","Chalissery\n","258"),
("552","Nagalassery\n","258"),
("553","Thirumittacode-I\n","258"),
("554","Vaniyamkulam-I\n","258"),
("555","Ambalapara - II\n","258"),
("556","Ambalapara - I\n","258"),
("557","Lakkidi-Perur- I \n","258"),
("558","Lakkidi-Perur- II \n","258"),
("559","Ongallur -II (CT)\n","258"),
("560","Ongallur -I (CT)\n","258"),
("561","Pattambi (CT)\n","258"),
("562","Muthuthala (CT)\n","258"),
("563","Thrithala (CT)\n","258"),
("564","Vaniyamkulam- II (CT)\n","258"),
("565","Thirumittacode -II (CT)\n","258"),
("566","Mannarkad\n","258"),
("567","Alanallur-I\n","258"),
("568","Alanallur-II\n","258"),
("569","Alanallur-III\n","258"),
("570","Kottoppadam-I\n","258"),
("571","Kottoppadam-III\n","258"),
("572","Payyanadam\n","258"),
("573","Padavayal\n","258"),
("574","Pudur\n","258"),
("575","Agali\n","258"),
("576","Kottathara\n","258"),
("577","Sholayur\n","258"),
("578","Kallamala\n","258"),
("579","Palakkayam\n","258"),
("580","Mannarkad-II\n","258"),
("581","Pottassery- I\n","258"),
("582","Pottassery- II\n","258"),
("583","Thachampara\n","258"),
("584","Karimba -I\n","258"),
("585","Karimba -II\n","258"),
("586","Karakurissi\n","258"),
("587","Kumaramputhur\n","258"),
("588","Kottoppadam-II\n","258"),
("589","Thachanattukara-I\n","258"),
("590","Thachanattukara-II\n","258"),
("591","Mannarkad-I (CT)\n","258"),
("592","Kongad-II\n","258"),
("593","Keralassery\n","258"),
("594","Mannur\n","258"),
("595","Mankara\n","258"),
("596","Kongad-I\n","258"),
("597","Mundur-II\n","258"),
("598","Mundur-I\n","258"),
("599","Parli-I\n","258"),
("600","Parli-II\n","258");
INSERT INTO village VALUES
("601","Puthuppariyaram-I\n","258"),
("602","Malampuzha-I\n","258"),
("603","Malampuzha-II\n","258"),
("604","Kannadi-I\n","258"),
("605","Kannadi-II\n","258"),
("606","Kodumba\n","258"),
("607","Peruvemba\n","258"),
("608","Polpully\n","258"),
("609","Elappully-II\n","258"),
("610","Elappully-I\n","258"),
("611","Pudussery East\n","258"),
("612","Puthuppariyaram (CT)\n","258"),
("613","Hemambikanagar (CT)\n","258"),
("614","Pudussery Central (CT)\n","258"),
("615","Pudussery West (CT)\n","258"),
("616","Marutharode (CT)\n","258"),
("617","Pirayiri (CT)\n","258"),
("618","Chittur\n","258"),
("619","Koduvayur-II\n","258"),
("620","Thathamangalam (Part)\n","258"),
("621","Chittur (Part)\n","258"),
("622","Thekkedesom\n","258"),
("623","Nalleppilly\n","258"),
("624","Kozhinjampara\n","258"),
("625","Vadakarapathy\n","258"),
("626","Ozhalapathy\n","258"),
("627","Eruthempathy\n","258"),
("628","Kozhipathy\n","258"),
("629","Valiyavallampathy\n","258"),
("630","Moolathara\n","258"),
("631","Perumatty\n","258"),
("632","Vandithavalam\n","258"),
("633","Pattanchery\n","258"),
("634","Vadavannur\n","258"),
("635","Pallassana\n","258"),
("636","Vallanghy\n","258"),
("637","Nemmara\n","258"),
("638","Ayiloor\n","258"),
("639","Kairady\n","258"),
("640","Thiruvazhiyad\n","258"),
("641","Nelliyampathy\n","258"),
("642","Elavancherry\n","258"),
("643","Kollengode-II\n","258"),
("644","Kollengode-I\n","258"),
("645","Muthalamada-I\n","258"),
("646","Muthalamada-II\n","258"),
("647","Koduvayur (CT)\n","258"),
("648","Puthunagaram (CT)\n","258"),
("649","Alathur\n","258"),
("650","Peringottukurissi-II\n","258"),
("651","Peringottukurissi-I\n","258"),
("652","Kottayi-I\n","258"),
("653","Kottayi-II\n","258"),
("654","Mathur -I\n","258"),
("655","Mathur -II\n","258"),
("656","Kuzhalmannam-II\n","258"),
("657","Thenkurissi-I\n","258"),
("658","Thenkurissi-II \n","258"),
("659","Kuzhalmannam-I\n","258"),
("660","Kuthannur-I\n","258"),
("661","Kuthannur-II\n","258"),
("662","Tarur-I\n","258"),
("663","Tarur-II\n","258"),
("664","Erimayur-I \n","258"),
("665","Erimayur-II\n","258"),
("666","Melarcode \n","258"),
("667","Kavasseri-I\n","258"),
("668","Kavasseri-II\n","258"),
("669","Puducode\n","258"),
("670","Kannambra-I\n","258"),
("671","Kannambra-II\n","258"),
("672","Vadakkancheri-I\n","258"),
("673","Vadakkancheri-II\n","258"),
("674","Vandazhi-II\n","258"),
("675","Vandazhi-I\n","258"),
("676","Mangalam Dam\n","258"),
("677","Kizhakkencheri-II\n","258"),
("678","Kizhakkencheri-I\n","258"),
("679","Alathur (CT)\n","258"),
("680","Thrissur\n","260"),
("681","Talappilly\n","260"),
("682","Perumpilavu\n","260"),
("683","Kadangode\n","260"),
("684","Thichur\n","260"),
("685","Arangottukara\n","260"),
("686","Pallur\n","260"),
("687","Thalassery\n","260"),
("688","Pilakkad\n","260"),
("689","Varavoor\n","260"),
("690","Painkulam\n","260"),
("691","Mayannur\n","260"),
("692","Pampady\n","260"),
("693","Thiruvilwamala\n","260"),
("694","Vadakkethara\n","260"),
("695","Kondazhy\n","260"),
("696","Chelakode\n","260"),
("697","Venganellur\n","260"),
("698","Killimangalam\n","260"),
("699","Panjal\n","260"),
("700","Attoor\n","260");
INSERT INTO village VALUES
("701","Mullurkara\n","260"),
("702","Kanjirakode\n","260"),
("703","Vellarakkad\n","260"),
("704","Chowwannur(Part)\n","260"),
("705","Mangad (Part)\n","260"),
("706","Kanipayyur (Part)\n","260"),
("707","Chemmanthatta\n","260"),
("708","Vellattanjur\n","260"),
("709","Thayyur\n","260"),
("710","Kiralur\n","260"),
("711","Parlikad\n","260"),
("712","Puthuruthy\n","260"),
("713","Thekkumkara\n","260"),
("714","Karumathara\n","260"),
("715","Viruppakka\n","260"),
("716","Manalithara\n","260"),
("717","Kurumala\n","260"),
("718","Thonnurkara\n","260"),
("719","Pangarappilly\n","260"),
("720","Pulakode\n","260"),
("721","Pazhayannur\n","260"),
("722","Vennur\n","260"),
("723","Elanad\n","260"),
("724","Kaniyarkode (CT)\n","260"),
("725","Cheruthuruthi (CT)\n","260"),
("726","Nedumpura (CT)\n","260"),
("727","Desamangalam (CT)\n","260"),
("728","Kadavallur (CT)\n","260"),
("729","Kattakampal (CT)\n","260"),
("730","Pazhanji (CT)\n","260"),
("731","Karikkad (CT)\n","260"),
("732","Nelluwaya (CT)\n","260"),
("733","Kottappuram (CT)\n","260"),
("734","Chittanda (CT)\n","260"),
("735","Kumaranellur (CT)\n","260"),
("736","Chelakkara (CT)\n","260"),
("737","Enkakkad (CT)\n","260"),
("738","Wadakkanchery (CT)\n","260"),
("739","Kariyannur (CT)\n","260"),
("740","Eyyal (CT)\n","260"),
("741","Chiramanangad (CT)\n","260"),
("742","Akathiyoor (CT)\n","260"),
("743","Porkulam (CT)\n","260"),
("744","Choondal (CT)\n","260"),
("745","Chiranellur (CT)\n","260"),
("746","Velur (CT)\n","260"),
("747","Mundathikode (CT)\n","260"),
("748","Peringandoor (CT)\n","260"),
("749","Minalur (CT)\n","260"),
("750","Eranellur (CT)\n","260"),
("751","Alur (CT)\n","260"),
("752","Kandanassery (CT)\n","260"),
("753","Chavakkad\n","260"),
("754","Kadappuram \n","260"),
("755","Annakara\n","260"),
("756","Irimbranallur\n","260"),
("757","Kundazhiyur\n","260"),
("758","Engandiyur\n","260"),
("759","Nattika\n","260"),
("760","Valappad\n","260"),
("761","Kadikkad (CT)\n","260"),
("762","Punnayurkulam (CT)\n","260"),
("763","Vadakkekad (CT)\n","260"),
("764","Punnayur (CT)\n","260"),
("765","Edakkazhiyur (CT)\n","260"),
("766","Vylathur (CT)\n","260"),
("767","Pookode (CT)\n","260"),
("768","Iringaprom (CT)\n","260"),
("769","Perakam (CT)\n","260"),
("770","Orumanayur (CT)\n","260"),
("771","Paluvai (CT)\n","260"),
("772","Thaikkad (CT)\n","260"),
("773","Brahmakulam (CT)\n","260"),
("774","Elavally (CT)\n","260"),
("775","Pavaratty (CT)\n","260"),
("776","Venmanad (CT)\n","260"),
("777","Mullassery (CT)\n","260"),
("778","Venkitangu (CT)\n","260"),
("779","Vadanappally (CT)\n","260"),
("780","Talikkulam (CT)\n","260"),
("781","Velappaya\n","260"),
("782","Madakkathara\n","260"),
("783","Chalakkal\n","260"),
("784","Pananchery\n","260"),
("785","Peechi\n","260"),
("786","Mannamangalam\n","260"),
("787","Mulayam\n","260"),
("788","Pullu\n","260"),
("789","Pallippuram\n","260"),
("790","Alappad\n","260"),
("791","Chazhoor\n","260"),
("792","Inchamudi\n","260"),
("793","Arattupuzha\n","260"),
("794","Killannur (CT)\n","260"),
("795","Thangalur (CT)\n","260"),
("796","Avanur (CT)\n","260"),
("797","Anjur (CT)\n","260"),
("798","Kaiparamba (CT)\n","260"),
("799","Tholur (CT)\n","260"),
("800","Edakkalathur (CT)\n","260");
INSERT INTO village VALUES
("801","Peramangalam (CT)\n","260"),
("802","Choolissery (CT)\n","260"),
("803","Pottore (CT)\n","260"),
("804","Kolazhy (CT)\n","260"),
("805","Kurichikkara (CT)\n","260"),
("806","Vellanikkara (CT)\n","260"),
("807","Kuttoor (CT)\n","260"),
("808","Puzhakkal (CT)\n","260"),
("809","Puranattukara (CT)\n","260"),
("810","Chittilappilly (CT)\n","260"),
("811","Adat (CT)\n","260"),
("812","Kozhukkully (CT)\n","260"),
("813","Kainoor (CT)\n","260"),
("814","Nadathara (CT)\n","260"),
("815","Parakkad (CT)\n","260"),
("816","Karamuck (CT)\n","260"),
("817","Manalur (CT)\n","260"),
("818","Eravu (CT)\n","260"),
("819","Veluthur (CT)\n","260"),
("820","Manakkody (CT)\n","260"),
("821","Marathakkara (CT)\n","260"),
("822","Puthur (CT)\n","260"),
("823","Avinissery (CT)\n","260"),
("824","Palissery (CT)\n","260"),
("825","Venginissery (CT)\n","260"),
("826","Kodannur (CT)\n","260"),
("827","Anthicad (CT)\n","260"),
("828","Padiyam (CT)\n","260"),
("829","Vadakkummuri (CT)\n","260"),
("830","Kizhakkummuri (CT)\n","260"),
("831","Cherpu (CT)\n","260"),
("832","Paralam (CT)\n","260"),
("833","Chevvoor (CT)\n","260"),
("834","Vallachira (CT)\n","260"),
("835","Oorakam (CT)\n","260"),
("836","Kurumpilavu (CT)\n","260"),
("837","Kizhuppillikkara (CT)\n","260"),
("838","Thanniyam (CT)\n","260"),
("839","Kodungallur\n","260"),
("840","Koolimuttam\n","260"),
("841","Padinjare Vemballur\n","260"),
("842","Azhikode\n","260"),
("843","Edathiruthy (CT)\n","260"),
("844","Chendrappini (CT)\n","260"),
("845","Kaipamangalam (CT)\n","260"),
("846","Perinjanam (CT)\n","260"),
("847","Pappinivattom (CT)\n","260"),
("848","Panangad (CT)\n","260"),
("849","Edavilangu (CT)\n","260"),
("850","Ala (CT)\n","260"),
("851","Pallippuram (CT)\n","260"),
("852","Methala (CT)\n","260"),
("853","Poyya (CT)\n","260"),
("854","Madathumpady (CT)\n","260"),
("855","Eriyad (OG)\n","260"),
("856","Mukundapuram\n","260"),
("857","Karalam (Part)\n","260"),
("858","Thottippal\n","260"),
("859","Kallur\n","260"),
("860","Varandarappilly\n","260"),
("861","Mupliyam\n","260"),
("862","Nandipulam\n","260"),
("863","Chengallur\n","260"),
("864","Nellayi\n","260"),
("865","Anandapuram\n","260"),
("866","Muriyad\n","260"),
("867","Irinjalakuda (Part)\n","260"),
("868","Kaduppassery\n","260"),
("869","Kodakara\n","260"),
("870","Mattathur\n","260"),
("871","Vellikulangara\n","260"),
("872","Kuttichira\n","260"),
("873","Kodassery \n","260"),
("874","Pariyaram\n","260"),
("875","Elanjipra\n","260"),
("876","Alur\n","260"),
("877","Thazhekkad\n","260"),
("878","Kottanellur\n","260"),
("879","Vallivattom\n","260"),
("880","Karumathra\n","260"),
("881","Puthenchira\n","260"),
("882","Vadakkumbhagom\n","260"),
("883","Annallur\n","260"),
("884","Melur\n","260"),
("885","Kizhakkummuri\n","260"),
("886","Alathur\n","260"),
("887","Kuruvilassery\n","260"),
("888","Kakkulissery\n","260"),
("889","Thirumukkulam\n","260"),
("890","Trikkur (CT)\n","260"),
("891","Nenmenikkara (CT)\n","260"),
("892","Amballur (CT)\n","260"),
("893","Puthukkad (CT)\n","260"),
("894","Parappukkara (CT)\n","260"),
("895","Kattur (CT)\n","260"),
("896","Porathissery (CT)\n","260"),
("897","Madayikonam (CT)\n","260"),
("898","Kallettumkara (CT)\n","260"),
("899","Pullur (CT)\n","260"),
("900","Manavalassery (CT)\n","260");
INSERT INTO village VALUES
("901","Edathirinji (CT)\n","260"),
("902","Vellookkara (CT)\n","260"),
("903","Vadakkumkara (CT)\n","260"),
("904","Poomangalam (CT)\n","260"),
("905","Padiyur (CT)\n","260"),
("906","Thekkumkara (CT)\n","260"),
("907","Muringur Vadakkummuri (CT)\n","260"),
("908","Koratty (CT)\n","260"),
("909","Kallur Vadakkummuri (CT)\n","260"),
("910","Vadama (CT)\n","260"),
("911","Kallur Thekkummuri (CT)\n","260"),
("912","Ernakulam\n","250"),
("913","Kunnathunad\n","250"),
("914","Kodanad\n","250"),
("915","Kombanad\n","250"),
("916","Vengoor\n","250"),
("917","Vengoor West\n","250"),
("918","Asamannoor\n","250"),
("919","Rayamangalam\n","250"),
("920","Arakapady\n","250"),
("921","Irapuram \n","250"),
("922","Mazhuvannoor\n","250"),
("923","Pattimattom \n","250"),
("924","Kizhakkambalam\n","250"),
("925","Vadavukode\n","250"),
("926","Aikaranad North\n","250"),
("927","Aikaranad South\n","250"),
("928","Thiruvaniyoor\n","250"),
("929","Koovappady (CT)\n","250"),
("930","Chelamattom (CT)\n","250"),
("931","Marampilly(CT)\n","250"),
("932","Vazhakulam (CT)\n","250"),
("933","Vengola (CT)\n","250"),
("934","Perumbavoor (CT)\n","250"),
("935","Kunnathunad (CT)\n","250"),
("936","Puthencruz (CT)\n","250"),
("937","Aluva\n","250"),
("938","Parakkadavu\n","250"),
("939","Karukutty\n","250"),
("940","Mookkannoor\n","250"),
("941","Ayyampuzha\n","250"),
("942","Manjapra\n","250"),
("943","Malayattoor\n","250"),
("944","Thuravoor\n","250"),
("945","Kalady (CT)\n","250"),
("946","Mattoor (CT)\n","250"),
("947","Vadakkumbhagom (CT)\n","250"),
("948","Chowwara (CT)\n","250"),
("949","Nedumbassery (CT)\n","250"),
("950","Chengamanad (CT)\n","250"),
("951","Kizhakkumbhagom (CT)\n","250"),
("952","Thekkumbhagom (CT)\n","250"),
("953","Edathala (CT)\n","250"),
("954","Choornikkara (CT)\n","250"),
("955","Paravur\n","250"),
("956","Kunnukara\n","250"),
("957","Ezhikkara\n","250"),
("958","Puthenvelikkara (CT)\n","250"),
("959","Chendamangalam (CT)\n","250"),
("960","Moothakunnam (CT)\n","250"),
("961","Vadakkekara (CT)\n","250"),
("962","Karumalloor (CT)\n","250"),
("963","Kadungalloor (CT)\n","250"),
("964","Alangad (CT)\n","250"),
("965","Kottuvally (CT)\n","250"),
("966","Varappuzha (CT)\n","250"),
("967","Eloor (CT)\n","250"),
("968","Kedamangalam (OG) (Part)\n","250"),
("969","Kochi\n","250"),
("970","Kuzhuppilly\n","250"),
("971","Pallippuram\n","250"),
("972","Edavanakkad\n","250"),
("973","Nayarambalam\n","250"),
("974","Chellanam\n","250"),
("975","Njarackal (CT)\n","250"),
("976","Elamkunnapuzha (CT)\n","250"),
("977","Puthuvype (CT)\n","250"),
("978","Kumbalangy (CT)\n","250"),
("979","Cheriyakadavu (OG) (Part)\n","250"),
("980","Kanayannur\n","250"),
("981","Thrikkakara North (Part)\n","250"),
("982","Edakkattuvayal\n","250"),
("983","Kaippattur\n","250"),
("984","Kulayettikara\n","250"),
("985","Keecherry\n","250"),
("986","Kakkanad (CT)\n","250"),
("987","Vazhakkala (CT)\n","250"),
("988","Cheranallur (CT)\n","250"),
("989","Kadamakkudy (CT)\n","250"),
("990","Mulavukad (CT)\n","250"),
("991","Thiruvankulam (CT)\n","250"),
("992","Kanayannur (CT)\n","250"),
("993","Kureekkad (CT)\n","250"),
("994","Maradu (CT)\n","250"),
("995","Kumbalam (CT)\n","250"),
("996","Manakunnam (CT)\n","250"),
("997","Mulamthuruthy (CT)\n","250"),
("998","Amballur (CT)\n","250"),
("999","Muvattupuzha\n","250"),
("1000","Valakam\n","250");
INSERT INTO village VALUES
("1001","Mulavoor\n","250"),
("1002","Enanalloor \n","250"),
("1003","Kalloorkkad \n","250"),
("1004","Manjalloor\n","250"),
("1005","Muvattupuzha (Part)\n","250"),
("1006","Arakuzha\n","250"),
("1007","Marady (Part)\n","250"),
("1008","Memury\n","250"),
("1009","Ramamangalam\n","250"),
("1010","Maneed\n","250"),
("1011","Piravom\n","250"),
("1012","Onakkoor\n","250"),
("1013","Thirumarady\n","250"),
("1014","Palakkuzha\n","250"),
("1015","Koothattukulam\n","250"),
("1016","Elanji\n","250"),
("1017","Velloorkunnam (CT)\n","250"),
("1018","Kothamangalam\n","250"),
("1019","Thrikkariyoor (Part)\n","250"),
("1020","Kottappady\n","250"),
("1021","Pindimana\n","250"),
("1022","Kuttampuzha\n","250"),
("1023","Keerampara\n","250"),
("1024","Kuttamangalam\n","250"),
("1025","Neriamangalam \n","250"),
("1026","Kedavoor\n","250"),
("1027","Pothanikkad\n","250"),
("1028","Varappetty\n","250"),
("1029","Eramalloor (CT)\n","250"),
("1030","Idukki \n","251"),
("1031","Devikulam\n","251"),
("1032","Marayoor\n","251"),
("1033","Keezhanthoor\n","251"),
("1034","Kanthalloor\n","251"),
("1035","Kottakamboor\n","251"),
("1036","Vattavada\n","251"),
("1037","Kannan Devan Hills\n","251"),
("1038","Mankulam\n","251"),
("1039","Mannamkandam\n","251"),
("1040","Anaviratty\n","251"),
("1041","Pallivasal\n","251"),
("1042","Kunjithanny\n","251"),
("1043","Vellathuval\n","251"),
("1044","Udumbanchola\n","251"),
("1045","Konnathady\n","251"),
("1046","Rajakkad \n","251"),
("1047","Baisonvally\n","251"),
("1048","Chinnakanal\n","251"),
("1049","Poopara \n","251"),
("1050","Rajakumari\n","251"),
("1051","Kanthippara\n","251"),
("1052","Santhanpara\n","251"),
("1053","Chathurangapara\n","251"),
("1054","Vathikudy\n","251"),
("1055","Upputhode\n","251"),
("1056","Thankamony\n","251"),
("1057","Kalkoonthal\n","251"),
("1058","Parathodu\n","251"),
("1059","Pampadumpara\n","251"),
("1060","Karunapuram\n","251"),
("1061","Vandanmedu\n","251"),
("1062","Kattappana\n","251"),
("1063","Ayyappancoil\n","251"),
("1064","Anavilasam \n","251"),
("1065","Chakkupallam\n","251"),
("1066","Anakkara\n","251"),
("1067","Thodupuzha\n","251"),
("1068","Kumaramangalam (Part)\n","251"),
("1069","Kodikulam \n","251"),
("1070","Vannapuram\n","251"),
("1071","Kanjikuzhi\n","251"),
("1072","Udumbannoor\n","251"),
("1073","Neyyasseri\n","251"),
("1074","Karimannoor\n","251"),
("1075","Karikkode (Part)\n","251"),
("1076","Thodupuzha (Part)\n","251"),
("1077","Manakkad (Part)\n","251"),
("1078","Purapuzha\n","251"),
("1079","Karimkunnam (Part)\n","251"),
("1080","Muttom \n","251"),
("1081","Alacode\n","251"),
("1082","Velliyamattom\n","251"),
("1083","Idukki\n","251"),
("1084","Arakkulam \n","251"),
("1085","Kudayathoor \n","251"),
("1086","Elappally\n","251"),
("1087","Peerumade\n","251"),
("1088","Vagamon \n","251"),
("1089","Upputhara \n","251"),
("1090","Elappara \n","251"),
("1091","Kokkayar\n","251"),
("1092","Manjumala\n","251"),
("1093","Periyar\n","251"),
("1094","Kumily\n","251"),
("1095","Mlappara\n","251"),
("1096","Peruvanthanam\n","251"),
("1097","Kottayam\n","255"),
("1098","Meenachil\n","255"),
("1099","Veliyannoor\n","255"),
("1100","Monippally\n","255");
INSERT INTO village VALUES
("1101","Uzhavoor\n","255"),
("1102","Vellilappally \n","255"),
("1103","Ramapuram \n","255"),
("1104","Kadanad\n","255"),
("1105","Melukavu\n","255"),
("1106","Moonilavu\n","255"),
("1107","Poonjar Vadakkekara\n","255"),
("1108","Teekoy\n","255"),
("1109","Thalappalam\n","255"),
("1110","Bharananganam \n","255"),
("1111","Lalam (Part)\n","255"),
("1112","Vallichira\n","255"),
("1113","Kurichithanam\n","255"),
("1114","Kuravilangad\n","255"),
("1115","Kanakkari\n","255"),
("1116","Elackad\n","255"),
("1117","Kidangoor\n","255"),
("1118","Puliyannoor (Part)\n","255"),
("1119","Meenachil (Part)\n","255"),
("1120","Poovarany\n","255"),
("1121","Kondoor\n","255"),
("1122","Poonjar Thekkekara\n","255"),
("1123","Poonjar Nadubhagam\n","255"),
("1124","Erattupetta (CT)\n","255"),
("1125","Vaikom\n","255"),
("1126","Chempu\n","255"),
("1127","Velloor\n","255"),
("1128","Mulakulam\n","255"),
("1129","Njeezhoor\n","255"),
("1130","Kaduthuruthy\n","255"),
("1131","Vadayar\n","255"),
("1132","Kulasekharamangalam\n","255"),
("1133","Vadakkemuri (Part)\n","255"),
("1134","Naduvile (Part)\n","255"),
("1135","Vaikom (Part)\n","255"),
("1136","Thalayazham\n","255"),
("1137","Vechoor\n","255"),
("1138","Kallara\n","255"),
("1139","Muttuchira\n","255"),
("1140","Manjoor\n","255"),
("1141","Kothanalloor\n","255"),
("1142","Arpookara\n","255"),
("1143","Kaipuzha\n","255"),
("1144","Onamthuruth\n","255"),
("1145","Peroor\n","255"),
("1146","Ayarkunnam\n","255"),
("1147","Akalakunnam\n","255"),
("1148","Chengalam East\n","255"),
("1149","Anikkad\n","255"),
("1150","Kooroppada\n","255"),
("1151","Manarcad\n","255"),
("1152","Muttampalam (Part)\n","255"),
("1153","Kumarakam\n","255"),
("1154","Thiruvarpu\n","255"),
("1155","Veloor  (Part)\n","255"),
("1156","Meenadam \n","255"),
("1157","Pampady\n","255"),
("1158","Ettumanoor (CT)\n","255"),
("1159","Athirampuzha (CT)\n","255"),
("1160","Aimanam (CT)\n","255"),
("1161","Perumbaikad (CT)\n","255"),
("1162","Vijayapuram (CT)\n","255"),
("1163","Chengalam South (CT)\n","255"),
("1164","Nattakam (CT)\n","255"),
("1165","Panachikkad (CT)\n","255"),
("1166","Puthuppally (CT)\n","255"),
("1167","Changanassery\n","255"),
("1168","Vakathanam\n","255"),
("1169","Kurichy\n","255"),
("1170","Vazhappally Padinjaru (Part)\n","255"),
("1171","Changanassery (Part)\n","255"),
("1172","Madappally\n","255"),
("1173","Thottackad\n","255"),
("1174","Karukachal\n","255"),
("1175","Nedumkunnam \n","255"),
("1176","Vazhoor\n","255"),
("1177","Kangazha\n","255"),
("1178","Vellavoor\n","255"),
("1179","Chethipuzha (CT)\n","255"),
("1180","Thrikkodithanam (CT)\n","255"),
("1181","Paippad (CT)\n","255"),
("1182","Kanjirappally\n","255"),
("1183","Koottickal\n","255"),
("1184","Mundakayam\n","255"),
("1185","Edakkunnam\n","255"),
("1186","Elikkulam\n","255"),
("1187","Elamgulam\n","255"),
("1188","Chirakkadavu\n","255"),
("1189","Cheruvally\n","255"),
("1190","Koovappally\n","255"),
("1191","Erumeli North\n","255"),
("1192","Erumeli South \n","255"),
("1193","Manimala\n","255"),
("1194","Alappuzha\n","249"),
("1195","Cherthala\n","249"),
("1196","Perumbalam\n","249"),
("1197","Panavally\n","249"),
("1198","Thuravoor Thekku\n","249"),
("1199","Pattanakkad\n","249"),
("1200","Kadakkarappally\n","249");
INSERT INTO village VALUES
("1201","Cherthala North (Part)\n","249"),
("1202","Cherthala South (Part)\n","249"),
("1203","Mararikkulam North\n","249"),
("1204","Arookutty (CT)\n","249"),
("1205","Aroor (CT)\n","249"),
("1206","Ezhupunna (CT)\n","249"),
("1207","Kodamthuruth (CT)\n","249"),
("1208","Thaikattussery (CT)\n","249"),
("1209","Kuthiathode (CT)\n","249"),
("1210","Vayalar (CT)\n","249"),
("1211","Pallippuram (CT)\n","249"),
("1212","Thanneermukkam (CT)\n","249"),
("1213","Kokkothamangalam (CT)\n","249"),
("1214","Kanjikkuzhi (CT)\n","249"),
("1215","Muhamma (CT)\n","249"),
("1216","Ambalappuzha\n","249"),
("1217","Kalavoor\n","249"),
("1218","Aryad South  (Part)\n","249"),
("1219","Mullakkal (Part) \n","249"),
("1220","Karumady  \n","249"),
("1221","Purakkad\n","249"),
("1222","Mannanchery (CT)\n","249"),
("1223","Pathirappally (CT)\n","249"),
("1224","Komalapuram (CT)\n","249"),
("1225","Punnapra (OG)\n","249"),
("1226","Kalarkode (OG) (Part)\n","249"),
("1227","Kuttanad\n","249"),
("1228","Kainakary North\n","249"),
("1229","Kainakary South\n","249"),
("1230","Pulinkunnu\n","249"),
("1231","Kunnumma\n","249"),
("1232","Kavalam\n","249"),
("1233","Neelamperoor\n","249"),
("1234","Veliyanad\n","249"),
("1235","Ramankary\n","249"),
("1236","Champakkulam\n","249"),
("1237","Nedumudi\n","249"),
("1238","Thakazhy\n","249"),
("1239","Edathua  \n","249"),
("1240","Muttar\n","249"),
("1241","Thalavady \n","249"),
("1242","Karthikappally\n","249"),
("1243","Karuvatta\n","249"),
("1244","Cheruthana\n","249"),
("1245","Veeyapuram\n","249"),
("1246","Pallippad\n","249"),
("1247","Thrikkunnapuzha\n","249"),
("1248","Arattupuzha\n","249"),
("1249","Haripad (CT)\n","249"),
("1250","Kumarapuram (CT)\n","249"),
("1251","Karthikappally (CT)\n","249"),
("1252","Chingoli (CT)\n","249"),
("1253","Cheppad (CT)\n","249"),
("1254","Pathiyoor (CT)\n","249"),
("1255","Keerikkad (CT)\n","249"),
("1256","Muthukulam (CT)\n","249"),
("1257","Kandalloor (CT)\n","249"),
("1258","Puthuppally (CT)\n","249"),
("1259","Krishnapuram (CT)\n","249"),
("1260","Chengannur\n","249"),
("1261","Ennakkad\n","249"),
("1262","Pandanad (Part)\n","249"),
("1263","Thiruvanvandoor\n","249"),
("1264","Chengannur  (Part)\n","249"),
("1265","Mulakuzha (Part) \n","249"),
("1266","Ala (Part)\n","249"),
("1267","Puliyoor(Part)\n","249"),
("1268","Cheriyanad\n","249"),
("1269","Venmony\n","249"),
("1270","Mannar (CT)\n","249"),
("1271","Kurattissery (CT)\n","249"),
("1272","Mavelikkara\n","249"),
("1273","Thriperumthura\n","249"),
("1274","Vettiyar\n","249"),
("1275","Thekkekara (Part)\n","249"),
("1276","Perungala\n","249"),
("1277","Chunakkara\n","249"),
("1278","Noornad\n","249"),
("1279","Palamel\n","249"),
("1280","Thamarakkulam\n","249"),
("1281","Vallikunnam\n","249"),
("1282","Kannamangalam (CT)\n","249"),
("1283","Chennithala (CT)\n","249"),
("1284","Thazhakara (CT)\n","249"),
("1285","Bharanikkavu (CT)\n","249"),
("1286","Kattanam (CT)\n","249"),
("1287","Pathanamthitta\n","259"),
("1288","Thiruvalla\n","259"),
("1289","Niranam\n","259"),
("1290","Kadapra\n","259"),
("1291","Nedumpuram\n","259"),
("1292","Peringara\n","259"),
("1293","Kavumbhagom (Part)\n","259"),
("1294","Kuttoor\n","259"),
("1295","Kaviyoor\n","259"),
("1296","Eraviperoor\n","259"),
("1297","Koipuram\n","259"),
("1298","Thottapuzhassery\n","259"),
("1299","Mallappally\n","259"),
("1300","Kunnamthanam\n","259");
INSERT INTO village VALUES
("1301","Kallooppara\n","259"),
("1302","Anicad\n","259"),
("1303","Kottangal\n","259"),
("1304","Perumpetty\n","259"),
("1305","Ezhumattoor\n","259"),
("1306","Thelliyoor\n","259"),
("1307","Puramattam\n","259"),
("1308","Ranni\n","259"),
("1309","Chethakkal\n","259"),
("1310","Kollamula\n","259"),
("1311","Perunad\n","259"),
("1312","Athikkayam\n","259"),
("1313","Pazhavangadi\n","259"),
("1314","Angadi\n","259"),
("1315","Ayiroor\n","259"),
("1316","Cherukole\n","259"),
("1317","Ranni \n","259"),
("1318","Vadasserikkara \n","259"),
("1319","Chittar-Seethathodu\n","259"),
("1320","Kozhenchery\n","259"),
("1321","Kulanada\n","259"),
("1322","Mezhuveli\n","259"),
("1323","Kidangannur\n","259"),
("1324","Aranmula\n","259"),
("1325","Mallapuzhassery\n","259"),
("1326","Elanthoor\n","259"),
("1327","Chenneerkara\n","259"),
("1328","Vallicode\n","259"),
("1329","Omalloor\n","259"),
("1330","Pathanamthitta (Part)\n","259"),
("1331","Naranganam\n","259"),
("1332","Mylapra (Part)\n","259"),
("1333","Malayalapuzha (Part)\n","259"),
("1334","Konnithazham\n","259"),
("1335","Pramadom\n","259"),
("1336","Vallicode-Kottayam\n","259"),
("1337","Konni\n","259"),
("1338","Aruvappulam\n","259"),
("1339","Iravan\n","259"),
("1340","Thannithode \n","259"),
("1341","Kozhenchery (CT)\n","259"),
("1342","Adoor\n","259"),
("1343","Pandalam\n","259"),
("1344","Kurampala\n","259"),
("1345","Pandalam Thekkekara\n","259"),
("1346","Kodumon\n","259"),
("1347","Angadickal\n","259"),
("1348","Koodal\n","259"),
("1349","Kalanjoor\n","259"),
("1350","Enadimangalam\n","259"),
("1351","Ezhamkulam\n","259"),
("1352","Erathu\n","259"),
("1353","Peringanadu (Part)\n","259"),
("1354","Pallickal\n","259"),
("1355","Kadampanadu\n","259"),
("1356","Enathu\n","259"),
("1357","Kollam\n","252"),
("1358","Karunagappally \n","252"),
("1359","Alappad\n","252"),
("1360","Clappana\n","252"),
("1361","Thazhava\n","252"),
("1362","Pavumba\n","252"),
("1363","Thevalakkara\n","252"),
("1364","Thekkumbhagom\n","252"),
("1365","Oachira (CT)\n","252"),
("1366","Kulasekharapuram (CT)\n","252"),
("1367","Adinad (CT)\n","252"),
("1368","Thodiyoor (CT)\n","252"),
("1369","Kallelibhagom (CT)\n","252"),
("1370","Karunagappally (CT)\n","252"),
("1371","Ayanivelikulangara (CT)\n","252"),
("1372","Vadakkumthala (CT)\n","252"),
("1373","Panmana (CT)\n","252"),
("1374","Chavara (CT)\n","252"),
("1375","Neendakara (OG)\n","252"),
("1376","Kunnathur\n","252"),
("1377","Sooranad North\n","252"),
("1378","Poruvazhy\n","252"),
("1379","Sasthamkotta\n","252"),
("1380","Sooranad South\n","252"),
("1381","Mynagappally\n","252"),
("1382","West Kallada\n","252"),
("1383","Pathanapuram\n","252"),
("1384","Pattazhy Vadakkekara\n","252"),
("1385","Pattazhy\n","252"),
("1386","Thalavoor\n","252"),
("1387","Vilakkudy\n","252"),
("1388","Pidavoor\n","252"),
("1389","Pathanapuram \n","252"),
("1390","Punnala\n","252"),
("1391","Piravanthur \n","252"),
("1392","Valacode (Part)\n","252"),
("1393","Edamon\n","252"),
("1394","Thenmala\n","252"),
("1395","Arienkavu\n","252"),
("1396","Kulathupuzha\n","252"),
("1397","Thinkalkarikkakom\n","252"),
("1398","Ayiranalloor\n","252"),
("1399","Karavaloor (Part)\n","252"),
("1400","Arackal\n","252");
INSERT INTO village VALUES
("1401","Edamulackal\n","252"),
("1402","Anchal\n","252"),
("1403","Eroor\n","252"),
("1404","Alayamon \n","252"),
("1405","Channappetta \n","252"),
("1406","Kottarakkara\n","252"),
("1407","Pavithreswaram\n","252"),
("1408","Puthur \n","252"),
("1409","Kulakkada\n","252"),
("1410","Kalayapuram\n","252"),
("1411","Mylom\n","252"),
("1412","Melila \n","252"),
("1413","Chakkuvarakkal\n","252"),
("1414","Vettikkavala\n","252"),
("1415","Neduvathoor\n","252"),
("1416","Ezhukone\n","252"),
("1417","Kareepra\n","252"),
("1418","Odanavattam\n","252"),
("1419","Ummannoor\n","252"),
("1420","Valakam\n","252"),
("1421","Elamad\n","252"),
("1422","Veliyam\n","252"),
("1423","Pooyappally\n","252"),
("1424","Velinalloor\n","252"),
("1425","Chadayamangalam\n","252"),
("1426","Kottukkal\n","252"),
("1427","Ittiva\n","252"),
("1428","Kadakkal\n","252"),
("1429","Nilamel\n","252"),
("1430","Kummil\n","252"),
("1431","Mancode\n","252"),
("1432","Chithara\n","252"),
("1433","Kottarakkara (CT)\n","252"),
("1434","Eravipuram (OG) (Part)\n","252"),
("1435","Mundrothuruth\n","252"),
("1436","Kizhakkekallada\n","252"),
("1437","Mulavana\n","252"),
("1438","Pallimon\n","252"),
("1439","Chirakkara\n","252"),
("1440","Paravoor (Part)\n","252"),
("1441","Parippally\n","252"),
("1442","Kalluvathukkal\n","252"),
("1443","Thrikkaruva (CT)\n","252"),
("1444","Panayam (CT)\n","252"),
("1445","Perinad (CT)\n","252"),
("1446","Elampalloor (CT)\n","252"),
("1447","Nedumpana (CT)\n","252"),
("1448","Kottamkara (CT)\n","252"),
("1449","Thrikkadavoor (CT)\n","252"),
("1450","Thrikkovilvattom (CT)\n","252"),
("1451","Adichanalloor (CT)\n","252"),
("1452","Thazhuthala (CT)\n","252"),
("1453","Mayyanad (CT)\n","252"),
("1454","Meenad (CT)\n","252"),
("1455","Poothakkulam (CT)\n","252"),
("1456","Thiruvananthapuram\n","261"),
("1457","Chirayinkeezhu\n","261"),
("1458","Edava\n","261"),
("1459","Ayiroor\n","261"),
("1460","Chemmaruthy\n","261"),
("1461","Navaikulam\n","261"),
("1462","Pallickal\n","261"),
("1463","Madavoor\n","261"),
("1464","Kudavoor\n","261"),
("1465","Vellalloor\n","261"),
("1466","Kilimanoor\n","261"),
("1467","Pazhayakunnummel\n","261"),
("1468","Pulimath\n","261"),
("1469","Koduvazhannoor\n","261"),
("1470","Nagaroor\n","261"),
("1471","Karavaram\n","261"),
("1472","Ottoor\n","261"),
("1473","Vettoor-Cherunniyoor \n","261"),
("1474","Manamboor\n","261"),
("1475","Elamba-Mudakkal\n","261"),
("1476","Attingal-Avanavancherry (Part)\n","261"),
("1477","Kadakkavoor\n","261"),
("1478","Sarkara-Chirayinkeezhu\n","261"),
("1479","Alamcode (CT)\n","261"),
("1480","Keezhattingal (CT)\n","261"),
("1481","Vakkom (CT)\n","261"),
("1482","Kizhuvalam-Koonthalloor (CT)\n","261"),
("1483","Edakkode (CT)\n","261"),
("1484","Azhoor (CT)\n","261"),
("1485","Nedumangad\n","261"),
("1486","Nellanad\n","261"),
("1487","Vamanapuram\n","261"),
("1488","Kallara\n","261"),
("1489","Pangode\n","261"),
("1490","Peringamala\n","261"),
("1491","Thennoor \n","261"),
("1492","Palode\n","261"),
("1493","Kurupuzha\n","261"),
("1494","Panavoor\n","261"),
("1495","Pullampara\n","261"),
("1496","Koliyakode\n","261"),
("1497","Manikkal\n","261"),
("1498","Theakada\n","261"),
("1499","Anad\n","261"),
("1500","Tholicode\n","261");
INSERT INTO village VALUES
("1501","Vithura\n","261"),
("1502","Mannoorkara\n","261"),
("1503","Aryanad\n","261"),
("1504","Uzhamalackal\n","261"),
("1505","Vembayam\n","261"),
("1506","Aruvikkara\n","261"),
("1507","Vellanad\n","261"),
("1508","Perumkulam\n","261"),
("1509","Veeranakavu\n","261"),
("1510","Vattappara (CT)\n","261"),
("1511","Karakulam (CT)\n","261"),
("1512","Kadinamkulam\n","261"),
("1513","Melthonnakkal\n","261"),
("1514","Keezhthonnakkal\n","261"),
("1515","Andoorkonam\n","261"),
("1516","Menamkulam\n","261"),
("1517","Veiloor (CT)\n","261"),
("1518","Pallippuram (CT)\n","261"),
("1519","Iroopara (CT)\n","261"),
("1520","Uliyazhathura (CT)\n","261"),
("1521","Sreekaryam (CT)\n","261"),
("1522","Kudappanakkunnu (CT)\n","261"),
("1523","Vattiyoorkavu (CT)\n","261"),
("1524","Kalliyoor (CT)\n","261"),
("1525","Venganoor (CT)\n","261"),
("1526","Kazhakkoottam(OG)\n","261"),
("1527","Neyyattinkara\n","261"),
("1528","Ottasekharamangalam\n","261"),
("1529","Kallikkad\n","261"),
("1530","Vazhichal\n","261"),
("1531","Amboori\n","261"),
("1532","Vellarada\n","261"),
("1533","Keezharoor\n","261"),
("1534","Maranalloor\n","261"),
("1535","Perumkadavila\n","261"),
("1536","Anavoor\n","261"),
("1537","Kunnathukal\n","261"),
("1538","Kollayil (Part)\n","261"),
("1539","Karode\n","261"),
("1540","Chenkal (Part)\n","261"),
("1541","Kulathoor\n","261"),
("1542","Thirupuram\n","261"),
("1543","Karumkulam \n","261"),
("1544","Kottukal (Part)\n","261"),
("1545","Vizhinjam (Part)\n","261"),
("1546","Kovalam (OG) (Part)\n","261"),
("1547","Vilappil (CT)\n","261"),
("1548","Kulathummal (CT)\n","261"),
("1549","Malayinkeezhu (CT)\n","261"),
("1550","Vilavoorkkal (CT)\n","261"),
("1551","Pallichal (CT)\n","261"),
("1552","Athiyannur (CT)\n","261"),
("1553","Kanjiramkulam (CT)\n","261"),
("1554","Parasuvaikkal (CT)\n","261"),
("1555","Parassala (CT)\n","261");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
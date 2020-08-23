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
  `u_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `u_pass` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `u_status` int(11) NOT NULL,
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO user VALUES
("1","admin","e10adc3949ba59abbe56e057f20f883e","1");




CREATE TABLE `crop` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `cc_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  KEY `cc_id` (`cc_id`),
  CONSTRAINT `crop_ibfk_1` FOREIGN KEY (`cc_id`) REFERENCES `crop_category` (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO crop VALUES
("1","Banana","1"),
("2","orange","1"),
("3","grape","1");




CREATE TABLE `crop_category` (
  `cc_id` int(11) NOT NULL AUTO_INCREMENT,
  `cc_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`cc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO crop_category VALUES
("1","fruit"),
("2","vegitable");




CREATE TABLE `crop_price` (
  `cp_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  `cp_date` int(11) NOT NULL,
  `cp_price` float NOT NULL,
  PRIMARY KEY (`cp_id`),
  KEY `c_id` (`c_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `crop_price_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_Id`),
  CONSTRAINT `crop_price_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer` (
  `de_id` int(11) NOT NULL AUTO_INCREMENT,
  `de_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_store_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_address` text COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int(11) NOT NULL,
  `de_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `de_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `de_licence` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`de_id`),
  KEY `v_id` (`v_id`),
  CONSTRAINT `dealer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer_language` (
  `dl_id` int(11) NOT NULL AUTO_INCREMENT,
  `de_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  PRIMARY KEY (`dl_id`),
  KEY `l_id` (`l_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `dealer_language_ibfk_1` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`),
  CONSTRAINT `dealer_language_ibfk_2` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer_request` (
  `dr_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `dr_quantity` int(11) NOT NULL,
  `dr_unit_price` float NOT NULL,
  `ut_id` int(11) NOT NULL,
  `dr_date` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  PRIMARY KEY (`dr_id`),
  KEY `c_id` (`c_id`),
  KEY `ut_id` (`ut_id`),
  KEY `de_id` (`de_id`),
  CONSTRAINT `dealer_request_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_Id`),
  CONSTRAINT `dealer_request_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`),
  CONSTRAINT `dealer_request_ibfk_3` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `dealer_to_farmer_msg` (
  `dtfm_id` int(11) NOT NULL AUTO_INCREMENT,
  `dtfm_msg` text COLLATE utf8_unicode_ci NOT NULL,
  `dtfm_date` int(11) NOT NULL,
  `f_id` int(11) NOT NULL,
  `dtfm_status` int(11) NOT NULL,
  `de_id` int(11) NOT NULL,
  PRIMARY KEY (`dtfm_id`),
  KEY `de_id` (`de_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `dealer_to_farmer_msg_ibfk_1` FOREIGN KEY (`de_id`) REFERENCES `dealer` (`de_id`),
  CONSTRAINT `dealer_to_farmer_msg_ibfk_2` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `district` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `d_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `s_id` int(11) NOT NULL,
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
  `f_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_password` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_address` text COLLATE utf8_unicode_ci NOT NULL,
  `f_phone` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `v_id` int(11) NOT NULL,
  PRIMARY KEY (`f_id`),
  KEY `v_id` (`v_id`),
  CONSTRAINT `farmer_ibfk_1` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `farmer_language` (
  `fl_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_id` int(11) NOT NULL,
  `l_id` int(11) NOT NULL,
  PRIMARY KEY (`fl_id`),
  KEY `f_id` (`f_id`),
  KEY `l_id` (`l_id`),
  CONSTRAINT `farmer_language_ibfk_1` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`),
  CONSTRAINT `farmer_language_ibfk_2` FOREIGN KEY (`l_id`) REFERENCES `language` (`l_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `harvesting` (
  `h_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_id` int(11) NOT NULL,
  `h_date` int(11) NOT NULL,
  `h_quantity` int(11) NOT NULL,
  `h_unit_price` float NOT NULL,
  `h_transp_willing` int(11) NOT NULL,
  `h_status` int(11) NOT NULL,
  `ut_id` int(11) NOT NULL,
  PRIMARY KEY (`h_id`),
  KEY `p_id` (`p_id`),
  KEY `ut_id` (`ut_id`),
  CONSTRAINT `harvesting_ibfk_1` FOREIGN KEY (`p_id`) REFERENCES `planting` (`p_id`),
  CONSTRAINT `harvesting_ibfk_2` FOREIGN KEY (`ut_id`) REFERENCES `unit_type` (`ut_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `harvest_process` (
  `hp_id` int(11) NOT NULL AUTO_INCREMENT,
  `h_id` int(11) NOT NULL,
  `hp_quantity` int(11) NOT NULL,
  `hp_date` int(11) NOT NULL,
  PRIMARY KEY (`hp_id`),
  KEY `h_id` (`h_id`),
  CONSTRAINT `harvest_process_ibfk_1` FOREIGN KEY (`h_id`) REFERENCES `harvesting` (`h_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `language` (
  `l_id` int(11) NOT NULL AUTO_INCREMENT,
  `l_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`l_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO language VALUES
("1","malayalam"),
("2","english"),
("3","hindi"),
("4","tamil"),
("5","telgu");




CREATE TABLE `planting` (
  `p_id` int(11) NOT NULL AUTO_INCREMENT,
  `c_id` int(11) NOT NULL,
  `p_planting_date` int(11) NOT NULL,
  `p_harvesting_date` int(11) NOT NULL,
  `p_quantity` int(11) NOT NULL,
  `p_quantity_type` int(11) NOT NULL,
  `v_id` int(11) NOT NULL,
  `p_locality` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `f_id` int(11) NOT NULL,
  `p_status` int(11) NOT NULL,
  PRIMARY KEY (`p_id`),
  KEY `c_id` (`c_id`),
  KEY `v_id` (`v_id`),
  KEY `f_id` (`f_id`),
  CONSTRAINT `planting_ibfk_1` FOREIGN KEY (`c_id`) REFERENCES `crop` (`c_Id`),
  CONSTRAINT `planting_ibfk_2` FOREIGN KEY (`v_id`) REFERENCES `village` (`v_id`),
  CONSTRAINT `planting_ibfk_3` FOREIGN KEY (`f_id`) REFERENCES `farmer` (`f_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;






CREATE TABLE `state` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `s_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
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
  `ut_id` int(11) NOT NULL AUTO_INCREMENT,
  `ut_name` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`ut_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO unit_type VALUES
("1","kilogram"),
("2","litter"),
("3","meter"),
("4","item number");




CREATE TABLE `village` (
  `v_id` int(11) NOT NULL AUTO_INCREMENT,
  `v_name` varchar(250) COLLATE utf8_unicode_ci NOT NULL,
  `d_id` int(11) NOT NULL,
  PRIMARY KEY (`v_id`),
  KEY `d_id` (`d_id`),
  CONSTRAINT `village_ibfk_1` FOREIGN KEY (`d_id`) REFERENCES `district` (`d_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1556 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;


INSERT INTO village VALUES
("1","Kasaragod
("2","Pavoor
("3","Vorkady
("4","Pathur
("5","Kodalamogaru
("6","Koliyoor
("7","Kaliyoor
("8","Talikala
("9","Meenja
("10","Kadambar
("11","Moodambail
("12","Kuloor
("13","Majibail
("14","Badaje
("15","Mulinja
("16","Kodibail
("17","Ichilangod
("18","Heroor
("19","Kubanoor
("20","Bekoor
("21","Kayyar
("22","Kudalmarkala
("23","Paivalike
("24","Chippar
("25","Bayar
("26","Badoor
("27","Angadimogaru
("28","Mugu
("29","Maire
("30","Enmakaje
("31","Kattukukke
("32","Padre
("33","Badiyadka
("34","Nirchal
("35","Bela
("36","Puthige
("37","Edanad
("38","Kannur
("39","Kidoor
("40","Ujarulvar
("41","Bombrana
("42","Arikady
("43","Ichilampady
("44","Patla
("45","Kalnad
("46","Perumbala
("47","Thekkil
("48","Muttathody
("49","Pady
("50","Nekraje
("51","Ubrangala
("52","Kumbadaje
("53","Nettanige
("54","Bellur
("55","Adhur
("56","Karadka
("57","Muliyar
("58","Kolathur
("59","Bedadka
("60","Munnad
("61","Kuttikole
("62","Karivedakam
("63","Bandadka
("64","Adoor
("65","Delampady
("66","Kunjathur (CT)
("67","Manjeshwar (CT)
("68","Hosabettu (CT)
("69","Bangra Manjeshwar (CT)
("70","Uppala (CT)
("71","Mangalpady (CT)
("72","Shiriya (CT)
("73","Koipady (CT)
("74","Mogral (CT)
("75","Puthur (CT)
("76","Shiribagilu (CT)
("77","Madhur (CT)
("78","Kudlu (CT)
("79","Chengala (CT)
("80","Chemnad (CT)
("81","Hosdurg
("82","Pallikkara II
("83","Panayal
("84","Chithari
("85","Periya
("86","Pullur
("87","Kodom
("88","Kallar
("89","Panathady
("90","Balal
("91","Maloth 
("92","West Eleri
("93","Palavayal
("94","Chittarikkal
("95","Bheemanady
("96","Parappa 
("97","Thayanur
("98","Ambalathara
("99","Madikai
("100","Kinanoor
INSERT INTO village VALUES
("101","Karindalam
("102","Cheemeni II
("103","Cheemeni 
("104","Kayyur
("105","Kilayikode
("106","Thimiri
("107","Kodakkad
("108","Padne
("109","Udinoor
("110","Bare (CT)
("111","Udma (CT)
("112","Pallikkara (CT)
("113","Keekan (CT)
("114","Ajanur (CT)
("115","Perole (CT)
("116","Pilicode (CT)
("117","Maniyat (CT)
("118","North Thrikkaripur (CT)
("119","South Thrikkaripur (CT)
("120","Nileshwar (OG)
("121","Cheruvathur (OG)  
("122","Kannur
("123","Taliparamba 
("124","Ramanthali
("125","Peralam
("126","Kankole
("127","Alapadamba
("128","Eramam
("129","Perinthatta
("130","Kuttoor
("131","Vellora
("132","Peringome
("133","Thimiri
("134","Vayakkara
("135","Pulingome
("136","Thirumeni
("137","Alakode
("138","Vellad
("139","New Naduvil
("140","Kooveri
("141","Panniyoor
("142","Kuttiyeri
("143","Pattuvam
("144","Chuzhali
("145","Nediyanga
("146","Eruvassy
("147","Payyavoor
("148","Nuchiyad
("149","Vayathur
("150","Padiyoor
("151","Kalliad
("152","Sreekandapuram
("153","Malapattam
("154","Chengalai
("155","Kayaralam
("156","Karivellur (CT)
("157","Pariyaram (CT)
("158","Kurumathur (CT)
("159","Irikkur (CT)
("160","Kuttiattoor (CT)
("161","Mayyil (CT)
("162","Kolacherry (CT)
("163","Cheleri (CT)
("164","Maniyoor (CT)
("165","Panapuzha
("166","Mattool
("167","Kunhimangalam (CT)
("168","Cheruthazham (CT)
("169","Kadannappalli (CT)
("170","Ezhome (CT)
("171","Madayi (CT)
("172","Cherukunnu (CT)
("173","Kannapuram (CT)
("174","Narath (CT)
("175","Pappinisseri (CT)
("176","Kalliasseri (CT)
("177","Azhikode North (CT)
("178","Azhikode South (CT)
("179","Valapattanam (CT)
("180","Chirakkal (CT)
("181","Kannadiparamba (CT)
("182","Munderi (CT)
("183","Kanhirode (CT)
("184","Varam (CT)
("185","Puzhathi (CT)
("186","Pallikkunnu (CT)
("187","Elayavoor (CT)
("188","Chelora (CT)
("189","Ancharakandy (CT)
("190","Iriveri (CT)
("191","Chala (CT)
("192","Thottada (CT)
("193","Kadachira (CT)
("194","Mavilayi (CT)
("195","Peralassery (CT)
("196","Muzhappilangad (CT)
("197","Thalassery
("198","Pattannur
("199","Chavassery
("200","Keezhur
INSERT INTO village VALUES
("201","Payam
("202","Vilamana
("203","Ayyankunnu
("204","Aralam
("205","Kottiyoor
("206","Kelakam
("207","Kanichar
("208","Manathana
("209","Muzhakkunnu
("210","Thillenkeri
("211","Tholambra
("212","Vellarvelly
("213","Vekkalam
("214","Koloyad
("215","Kannavam
("216","Sivapuram
("217","Cheruvanchery
("218","Puthoor
("219","Thrippangottur
("220","Koodali (CT)
("221","Keezhallur (CT)
("222","Paduvilayi (CT)
("223","Pathiriyad (CT)
("224","Mangattidam (CT)
("225","Kandamkunnu (CT)
("226","Manantheri (CT)
("227","Kottayam-Malabar (CT)
("228","Eruvatti (CT)
("229","Pinarayi (CT)
("230","Dharmadom (CT)
("231","Eranholi (CT)
("232","Kadirur (CT)
("233","Pattiom (CT)
("234","Mokeri (CT)
("235","Kolavelloor (CT)
("236","Panoor (CT)
("237","Panniyannur (CT)
("238","New Mahe (CT)
("239","Chockli (CT)
("240","Peringathur (CT)
("241","Wayanad
("242","Mananthavady
("243","Thirunelly
("244","Thrissilery
("245","Payyampally
("246","Thavinhal
("247","Periya
("248","Thondernad
("249","Valat
("250","Edavaka
("251","Nalloornad
("252","Cherukottur
("253","Panamaram
("254","Anchukunnu
("255","Porunnanore
("256","Vellamunda
("257","Kanjirangad
("258","Sulthanbathery
("259","Nadavayal 
("260","Poothadi
("261","Pulpalli
("262","Padichira
("263","Kidanganad
("264","Irulam
("265","Purakkadi 
("266","Krishnagiri
("267","Kuppadi
("268","Noolpuzha
("269","Cheeral
("270","Nenmeni
("271","Ambalavayal
("272","Thomattuchal
("273","Vythiri
("274","Padinharethara
("275","Kuppadithara
("276","Kottathara 
("277","Kaniambetta
("278","Muttil North 
("279","Muttil South
("280","Vengappally
("281","Kavumannam
("282","Thariyode
("283","Achooranam
("284","Pozhuthana
("285","Kunnathidavaka
("286","Chundale
("287","Kottappadi (Part)
("288","Thrikkaipatta (Part)
("289","Muppainad
("290","Vellarimala
("291","Kozhikode
("292","Vadakara
("293","Onchiam
("294","Vanimel
("295","Vilangad
("296","Thinoor
("297","Kavilumpara
("298","Kayakkodi
("299","Narippatta
("300","Purameri
INSERT INTO village VALUES
("301","Thiruvallur
("302","Velom
("303","Kuttiadi
("304","Maruthonkara
("305","Valayam (CT)
("306","Chekkiad (CT)
("307","Thuneri (CT)
("308","Kunnummal (CT)
("309","Nadapuram (CT)
("310","Edacheri (CT)
("311","Eramala (CT)
("312","Azhiyur (CT)
("313","Chorode (CT)
("314","Ayancheri (CT)
("315","Kottappally (CT)
("316","Villiappally (CT)
("317","Palayad (CT)
("318","Maniyur (CT)
("319","Quilandy
("320","Payyoli
("321","Cheruvannur
("322","Palery
("323","Changaroth
("324","Chempanoda
("325","Chakkittapara
("326","Perambra
("327","Nochad
("328","Moodadi
("329","Arikkulam (Part)
("330","Kottur
("331","Kayanna 
("332","Koorachundu 
("333","Kanthalad 
("334","Avitanallur
("335","Chengottukavu
("336","Kinalur
("337","Unnikulam
("338","Sivapuram
("339","Iringal (CT)
("340","Eravattur (CT)
("341","Koothali (CT)
("342","Menhaniam (CT)
("343","Meppayyur (CT)
("344","Kozhukkallur (CT)
("345","Thurayur (CT)
("346","Thikkody (CT)
("347","Keezhariyur (CT)
("348","Naduvannur (CT)
("349","Panangad (CT)
("350","Balusseri (CT)
("351","Ulliyeri (CT)
("352","Chemancheri (CT)
("353","Atholi (CT)
("354","Kakkur
("355","Narikkuni
("356","Kizhakkoth
("357","Vavad
("358","Raroth
("359","Kedavur
("360","Puthuppadi
("361","Engapuzha
("362","Koodathayi 
("363","Kodencheri
("364","Nellipoyil
("365","Koodaranji
("366","Thiruvambadi
("367","Neeleswaram 
("368","Puthur
("369","Chathamangalam 
("370","Madavoor
("371","Kumaranallur
("372","Kakkad
("373","Kodiyathur
("374","Nanmanda (CT)
("375","Chelannur (CT)
("376","Thalakkulathur (CT)
("377","Kakkodi (CT)
("378","Kuruvattur (CT)
("379","Kunnamangalam (CT)
("380","Poolacode (CT)
("381","Thazhecode (CT)
("382","Mavoor (CT)
("383","Peruvayal (CT)
("384","Kuttikkattoor (CT)
("385","Olavanna (CT)
("386","Pantheeramkavu (CT)
("387","Perumanna (CT)
("388","Ramanattukara (CT)
("389","Cheruvannur (CT)
("390","Beypore (CT)
("391","Karuvanthuruthy (CT)
("392","Feroke (CT)
("393","Koduvally (OG)
("394","Elathur (OG)
("395","Kadalundi (OG)
("396","Puthiyangadi (OG) (Part)
("397","Malappuram
("398","Ernad
("399","Vettilappara
("400","Vazhakkad
INSERT INTO village VALUES
("401","Pulikkal
("402","Cheekkode
("403","Areekode
("404","Urangattiri
("405","Perakamanna
("406","Edavanna
("407","Karakunnu
("408","Kavanoor
("409","Kuzhimanna
("410","Muthuvallur
("411","Nediyiruppu
("412","Morayur
("413","Pookkottur
("414","Pulpatta
("415","Trikkalangode
("416","Elankur
("417","Pandalur
("418","Vettikkattiri
("419","Chembrasseri
("420","Pandikkad
("421","Kizhuparamba (CT)
("422","Vazhayur (CT)
("423","Cherukavu (CT)
("424","Kondotty (CT)
("425","Anakkayam (OG)
("426","Nilambur
("427","Pullipadam 
("428","Akampadam
("429","Kurumbilangode
("430","Chungathara
("431","Edakkara
("432","Vazhikkadavu
("433","Amarambalam
("434","Karulai
("435","Mambad
("436","Thiruvali
("437","Porur
("438","Wandoor
("439","Chekkode
("440","Kalikavu
("441","Vellayur
("442","Thuvvur
("443","Kerala Estate
("444","Karuvarakundu
("445","Nilambur (CT)
("446","Perinthalmanna
("447","Edappatta
("448","Melattur
("449","Keezhattur
("450","Nenmini
("451","Mankada
("452","Vadakkangara
("453","Kuruva
("454","Puzhakkattiri
("455","Valambur
("456","Angadippuram
("457","Kariavattom
("458","Vettathur
("459","Arakkuparamba
("460","Thazhekode
("461","Aliparamba
("462","Anamangad
("463","Elamkulam
("464","Pulamanthole
("465","Kuruvambalam
("466","Moorkkanad
("467","Koottilangadi (CT)
("468","Kodur (CT)
("469","Tirur
("470","Pariyapuram
("471","Tanur 
("472","Ozhur
("473","Niramaruthur
("474","Valavannur
("475","Kalpakancheri
("476","Marakkara
("477","Ponmala
("478","Melmuri
("479","Edayoor
("480","Athavanad
("481","Kurumbathur
("482","Ananthavoor
("483","Vettom
("484","Purathur
("485","Mangalam
("486","Kottakkal (CT)
("487","Perumanna (CT)
("488","Ponmundam (CT)
("489","Tanalur (CT)
("490","Cheriyamundam (CT)
("491","Kattipparuthi (CT)
("492","Talakkad (CT)
("493","Triprangode (CT)
("494","Thirunavaya (CT)
("495","Naduvattom (CT)
("496","Kuttippuram (CT)
("497","Irimbiliyam (CT)
("498","Tirurangadi
("499","Vallikkunnu
("500","Parappanangadi 
INSERT INTO village VALUES
("501","Chelambra (CT)
("502","Pallikal (CT)
("503","Thenhippalam (CT)
("504","Ariyallur (CT)
("505","Moonniyur (CT)
("506","Peruvallur (CT)
("507","Kannamangalam (CT)
("508","Urakam (CT)
("509","Othukkungal (CT)
("510","Parappur (CT)
("511","Vengara (CT)
("512","Abdu Rahiman Nagar (CT)
("513","Tirurangadi (CT)
("514","Neduva (CT)
("515","Nannambra (CT)
("516","Thennala (CT)
("517","Ponnani
("518","Tavanur
("519","Vattamkulam
("520","Veliyankode
("521","Perumpadappa
("522","Nannamukku
("523","Kalady (CT)
("524","Edappal (CT)
("525","Alamcode (CT)
("526","Marancheri (CT)
("527","Palakkad
("528","Ottappalam
("529","Anakkara
("530","Parudur
("531","Thiruvegapura
("532","Vilayur
("533","Kulukkallur
("534","Nellaya
("535","Cherpulacherry
("536","Vellinezhi
("537","Karimpuzha-I
("538","Karimpuzha-II
("539","Kadampazhipuram-II
("540","Kadampazhipuram-I
("541","Sreekrishnapuram -I
("542","Sreekrishnapuram -II
("543","Thrikkadeeri -II
("544","Thrikkadeeri -I
("545","Ananganadi
("546","Chalavara
("547","Vallapuzha
("548","Koppam
("549","Pattithara
("550","Kappur
("551","Chalissery
("552","Nagalassery
("553","Thirumittacode-I
("554","Vaniyamkulam-I
("555","Ambalapara - II
("556","Ambalapara - I
("557","Lakkidi-Perur- I 
("558","Lakkidi-Perur- II 
("559","Ongallur -II (CT)
("560","Ongallur -I (CT)
("561","Pattambi (CT)
("562","Muthuthala (CT)
("563","Thrithala (CT)
("564","Vaniyamkulam- II (CT)
("565","Thirumittacode -II (CT)
("566","Mannarkad
("567","Alanallur-I
("568","Alanallur-II
("569","Alanallur-III
("570","Kottoppadam-I
("571","Kottoppadam-III
("572","Payyanadam
("573","Padavayal
("574","Pudur
("575","Agali
("576","Kottathara
("577","Sholayur
("578","Kallamala
("579","Palakkayam
("580","Mannarkad-II
("581","Pottassery- I
("582","Pottassery- II
("583","Thachampara
("584","Karimba -I
("585","Karimba -II
("586","Karakurissi
("587","Kumaramputhur
("588","Kottoppadam-II
("589","Thachanattukara-I
("590","Thachanattukara-II
("591","Mannarkad-I (CT)
("592","Kongad-II
("593","Keralassery
("594","Mannur
("595","Mankara
("596","Kongad-I
("597","Mundur-II
("598","Mundur-I
("599","Parli-I
("600","Parli-II
INSERT INTO village VALUES
("601","Puthuppariyaram-I
("602","Malampuzha-I
("603","Malampuzha-II
("604","Kannadi-I
("605","Kannadi-II
("606","Kodumba
("607","Peruvemba
("608","Polpully
("609","Elappully-II
("610","Elappully-I
("611","Pudussery East
("612","Puthuppariyaram (CT)
("613","Hemambikanagar (CT)
("614","Pudussery Central (CT)
("615","Pudussery West (CT)
("616","Marutharode (CT)
("617","Pirayiri (CT)
("618","Chittur
("619","Koduvayur-II
("620","Thathamangalam (Part)
("621","Chittur (Part)
("622","Thekkedesom
("623","Nalleppilly
("624","Kozhinjampara
("625","Vadakarapathy
("626","Ozhalapathy
("627","Eruthempathy
("628","Kozhipathy
("629","Valiyavallampathy
("630","Moolathara
("631","Perumatty
("632","Vandithavalam
("633","Pattanchery
("634","Vadavannur
("635","Pallassana
("636","Vallanghy
("637","Nemmara
("638","Ayiloor
("639","Kairady
("640","Thiruvazhiyad
("641","Nelliyampathy
("642","Elavancherry
("643","Kollengode-II
("644","Kollengode-I
("645","Muthalamada-I
("646","Muthalamada-II
("647","Koduvayur (CT)
("648","Puthunagaram (CT)
("649","Alathur
("650","Peringottukurissi-II
("651","Peringottukurissi-I
("652","Kottayi-I
("653","Kottayi-II
("654","Mathur -I
("655","Mathur -II
("656","Kuzhalmannam-II
("657","Thenkurissi-I
("658","Thenkurissi-II 
("659","Kuzhalmannam-I
("660","Kuthannur-I
("661","Kuthannur-II
("662","Tarur-I
("663","Tarur-II
("664","Erimayur-I 
("665","Erimayur-II
("666","Melarcode 
("667","Kavasseri-I
("668","Kavasseri-II
("669","Puducode
("670","Kannambra-I
("671","Kannambra-II
("672","Vadakkancheri-I
("673","Vadakkancheri-II
("674","Vandazhi-II
("675","Vandazhi-I
("676","Mangalam Dam
("677","Kizhakkencheri-II
("678","Kizhakkencheri-I
("679","Alathur (CT)
("680","Thrissur
("681","Talappilly
("682","Perumpilavu
("683","Kadangode
("684","Thichur
("685","Arangottukara
("686","Pallur
("687","Thalassery
("688","Pilakkad
("689","Varavoor
("690","Painkulam
("691","Mayannur
("692","Pampady
("693","Thiruvilwamala
("694","Vadakkethara
("695","Kondazhy
("696","Chelakode
("697","Venganellur
("698","Killimangalam
("699","Panjal
("700","Attoor
INSERT INTO village VALUES
("701","Mullurkara
("702","Kanjirakode
("703","Vellarakkad
("704","Chowwannur(Part)
("705","Mangad (Part)
("706","Kanipayyur (Part)
("707","Chemmanthatta
("708","Vellattanjur
("709","Thayyur
("710","Kiralur
("711","Parlikad
("712","Puthuruthy
("713","Thekkumkara
("714","Karumathara
("715","Viruppakka
("716","Manalithara
("717","Kurumala
("718","Thonnurkara
("719","Pangarappilly
("720","Pulakode
("721","Pazhayannur
("722","Vennur
("723","Elanad
("724","Kaniyarkode (CT)
("725","Cheruthuruthi (CT)
("726","Nedumpura (CT)
("727","Desamangalam (CT)
("728","Kadavallur (CT)
("729","Kattakampal (CT)
("730","Pazhanji (CT)
("731","Karikkad (CT)
("732","Nelluwaya (CT)
("733","Kottappuram (CT)
("734","Chittanda (CT)
("735","Kumaranellur (CT)
("736","Chelakkara (CT)
("737","Enkakkad (CT)
("738","Wadakkanchery (CT)
("739","Kariyannur (CT)
("740","Eyyal (CT)
("741","Chiramanangad (CT)
("742","Akathiyoor (CT)
("743","Porkulam (CT)
("744","Choondal (CT)
("745","Chiranellur (CT)
("746","Velur (CT)
("747","Mundathikode (CT)
("748","Peringandoor (CT)
("749","Minalur (CT)
("750","Eranellur (CT)
("751","Alur (CT)
("752","Kandanassery (CT)
("753","Chavakkad
("754","Kadappuram 
("755","Annakara
("756","Irimbranallur
("757","Kundazhiyur
("758","Engandiyur
("759","Nattika
("760","Valappad
("761","Kadikkad (CT)
("762","Punnayurkulam (CT)
("763","Vadakkekad (CT)
("764","Punnayur (CT)
("765","Edakkazhiyur (CT)
("766","Vylathur (CT)
("767","Pookode (CT)
("768","Iringaprom (CT)
("769","Perakam (CT)
("770","Orumanayur (CT)
("771","Paluvai (CT)
("772","Thaikkad (CT)
("773","Brahmakulam (CT)
("774","Elavally (CT)
("775","Pavaratty (CT)
("776","Venmanad (CT)
("777","Mullassery (CT)
("778","Venkitangu (CT)
("779","Vadanappally (CT)
("780","Talikkulam (CT)
("781","Velappaya
("782","Madakkathara
("783","Chalakkal
("784","Pananchery
("785","Peechi
("786","Mannamangalam
("787","Mulayam
("788","Pullu
("789","Pallippuram
("790","Alappad
("791","Chazhoor
("792","Inchamudi
("793","Arattupuzha
("794","Killannur (CT)
("795","Thangalur (CT)
("796","Avanur (CT)
("797","Anjur (CT)
("798","Kaiparamba (CT)
("799","Tholur (CT)
("800","Edakkalathur (CT)
INSERT INTO village VALUES
("801","Peramangalam (CT)
("802","Choolissery (CT)
("803","Pottore (CT)
("804","Kolazhy (CT)
("805","Kurichikkara (CT)
("806","Vellanikkara (CT)
("807","Kuttoor (CT)
("808","Puzhakkal (CT)
("809","Puranattukara (CT)
("810","Chittilappilly (CT)
("811","Adat (CT)
("812","Kozhukkully (CT)
("813","Kainoor (CT)
("814","Nadathara (CT)
("815","Parakkad (CT)
("816","Karamuck (CT)
("817","Manalur (CT)
("818","Eravu (CT)
("819","Veluthur (CT)
("820","Manakkody (CT)
("821","Marathakkara (CT)
("822","Puthur (CT)
("823","Avinissery (CT)
("824","Palissery (CT)
("825","Venginissery (CT)
("826","Kodannur (CT)
("827","Anthicad (CT)
("828","Padiyam (CT)
("829","Vadakkummuri (CT)
("830","Kizhakkummuri (CT)
("831","Cherpu (CT)
("832","Paralam (CT)
("833","Chevvoor (CT)
("834","Vallachira (CT)
("835","Oorakam (CT)
("836","Kurumpilavu (CT)
("837","Kizhuppillikkara (CT)
("838","Thanniyam (CT)
("839","Kodungallur
("840","Koolimuttam
("841","Padinjare Vemballur
("842","Azhikode
("843","Edathiruthy (CT)
("844","Chendrappini (CT)
("845","Kaipamangalam (CT)
("846","Perinjanam (CT)
("847","Pappinivattom (CT)
("848","Panangad (CT)
("849","Edavilangu (CT)
("850","Ala (CT)
("851","Pallippuram (CT)
("852","Methala (CT)
("853","Poyya (CT)
("854","Madathumpady (CT)
("855","Eriyad (OG)
("856","Mukundapuram
("857","Karalam (Part)
("858","Thottippal
("859","Kallur
("860","Varandarappilly
("861","Mupliyam
("862","Nandipulam
("863","Chengallur
("864","Nellayi
("865","Anandapuram
("866","Muriyad
("867","Irinjalakuda (Part)
("868","Kaduppassery
("869","Kodakara
("870","Mattathur
("871","Vellikulangara
("872","Kuttichira
("873","Kodassery 
("874","Pariyaram
("875","Elanjipra
("876","Alur
("877","Thazhekkad
("878","Kottanellur
("879","Vallivattom
("880","Karumathra
("881","Puthenchira
("882","Vadakkumbhagom
("883","Annallur
("884","Melur
("885","Kizhakkummuri
("886","Alathur
("887","Kuruvilassery
("888","Kakkulissery
("889","Thirumukkulam
("890","Trikkur (CT)
("891","Nenmenikkara (CT)
("892","Amballur (CT)
("893","Puthukkad (CT)
("894","Parappukkara (CT)
("895","Kattur (CT)
("896","Porathissery (CT)
("897","Madayikonam (CT)
("898","Kallettumkara (CT)
("899","Pullur (CT)
("900","Manavalassery (CT)
INSERT INTO village VALUES
("901","Edathirinji (CT)
("902","Vellookkara (CT)
("903","Vadakkumkara (CT)
("904","Poomangalam (CT)
("905","Padiyur (CT)
("906","Thekkumkara (CT)
("907","Muringur Vadakkummuri (CT)
("908","Koratty (CT)
("909","Kallur Vadakkummuri (CT)
("910","Vadama (CT)
("911","Kallur Thekkummuri (CT)
("912","Ernakulam
("913","Kunnathunad
("914","Kodanad
("915","Kombanad
("916","Vengoor
("917","Vengoor West
("918","Asamannoor
("919","Rayamangalam
("920","Arakapady
("921","Irapuram 
("922","Mazhuvannoor
("923","Pattimattom 
("924","Kizhakkambalam
("925","Vadavukode
("926","Aikaranad North
("927","Aikaranad South
("928","Thiruvaniyoor
("929","Koovappady (CT)
("930","Chelamattom (CT)
("931","Marampilly(CT)
("932","Vazhakulam (CT)
("933","Vengola (CT)
("934","Perumbavoor (CT)
("935","Kunnathunad (CT)
("936","Puthencruz (CT)
("937","Aluva
("938","Parakkadavu
("939","Karukutty
("940","Mookkannoor
("941","Ayyampuzha
("942","Manjapra
("943","Malayattoor
("944","Thuravoor
("945","Kalady (CT)
("946","Mattoor (CT)
("947","Vadakkumbhagom (CT)
("948","Chowwara (CT)
("949","Nedumbassery (CT)
("950","Chengamanad (CT)
("951","Kizhakkumbhagom (CT)
("952","Thekkumbhagom (CT)
("953","Edathala (CT)
("954","Choornikkara (CT)
("955","Paravur
("956","Kunnukara
("957","Ezhikkara
("958","Puthenvelikkara (CT)
("959","Chendamangalam (CT)
("960","Moothakunnam (CT)
("961","Vadakkekara (CT)
("962","Karumalloor (CT)
("963","Kadungalloor (CT)
("964","Alangad (CT)
("965","Kottuvally (CT)
("966","Varappuzha (CT)
("967","Eloor (CT)
("968","Kedamangalam (OG) (Part)
("969","Kochi
("970","Kuzhuppilly
("971","Pallippuram
("972","Edavanakkad
("973","Nayarambalam
("974","Chellanam
("975","Njarackal (CT)
("976","Elamkunnapuzha (CT)
("977","Puthuvype (CT)
("978","Kumbalangy (CT)
("979","Cheriyakadavu (OG) (Part)
("980","Kanayannur
("981","Thrikkakara North (Part)
("982","Edakkattuvayal
("983","Kaippattur
("984","Kulayettikara
("985","Keecherry
("986","Kakkanad (CT)
("987","Vazhakkala (CT)
("988","Cheranallur (CT)
("989","Kadamakkudy (CT)
("990","Mulavukad (CT)
("991","Thiruvankulam (CT)
("992","Kanayannur (CT)
("993","Kureekkad (CT)
("994","Maradu (CT)
("995","Kumbalam (CT)
("996","Manakunnam (CT)
("997","Mulamthuruthy (CT)
("998","Amballur (CT)
("999","Muvattupuzha
("1000","Valakam
INSERT INTO village VALUES
("1001","Mulavoor
("1002","Enanalloor 
("1003","Kalloorkkad 
("1004","Manjalloor
("1005","Muvattupuzha (Part)
("1006","Arakuzha
("1007","Marady (Part)
("1008","Memury
("1009","Ramamangalam
("1010","Maneed
("1011","Piravom
("1012","Onakkoor
("1013","Thirumarady
("1014","Palakkuzha
("1015","Koothattukulam
("1016","Elanji
("1017","Velloorkunnam (CT)
("1018","Kothamangalam
("1019","Thrikkariyoor (Part)
("1020","Kottappady
("1021","Pindimana
("1022","Kuttampuzha
("1023","Keerampara
("1024","Kuttamangalam
("1025","Neriamangalam 
("1026","Kedavoor
("1027","Pothanikkad
("1028","Varappetty
("1029","Eramalloor (CT)
("1030","Idukki 
("1031","Devikulam
("1032","Marayoor
("1033","Keezhanthoor
("1034","Kanthalloor
("1035","Kottakamboor
("1036","Vattavada
("1037","Kannan Devan Hills
("1038","Mankulam
("1039","Mannamkandam
("1040","Anaviratty
("1041","Pallivasal
("1042","Kunjithanny
("1043","Vellathuval
("1044","Udumbanchola
("1045","Konnathady
("1046","Rajakkad 
("1047","Baisonvally
("1048","Chinnakanal
("1049","Poopara 
("1050","Rajakumari
("1051","Kanthippara
("1052","Santhanpara
("1053","Chathurangapara
("1054","Vathikudy
("1055","Upputhode
("1056","Thankamony
("1057","Kalkoonthal
("1058","Parathodu
("1059","Pampadumpara
("1060","Karunapuram
("1061","Vandanmedu
("1062","Kattappana
("1063","Ayyappancoil
("1064","Anavilasam 
("1065","Chakkupallam
("1066","Anakkara
("1067","Thodupuzha
("1068","Kumaramangalam (Part)
("1069","Kodikulam 
("1070","Vannapuram
("1071","Kanjikuzhi
("1072","Udumbannoor
("1073","Neyyasseri
("1074","Karimannoor
("1075","Karikkode (Part)
("1076","Thodupuzha (Part)
("1077","Manakkad (Part)
("1078","Purapuzha
("1079","Karimkunnam (Part)
("1080","Muttom 
("1081","Alacode
("1082","Velliyamattom
("1083","Idukki
("1084","Arakkulam 
("1085","Kudayathoor 
("1086","Elappally
("1087","Peerumade
("1088","Vagamon 
("1089","Upputhara 
("1090","Elappara 
("1091","Kokkayar
("1092","Manjumala
("1093","Periyar
("1094","Kumily
("1095","Mlappara
("1096","Peruvanthanam
("1097","Kottayam
("1098","Meenachil
("1099","Veliyannoor
("1100","Monippally
INSERT INTO village VALUES
("1101","Uzhavoor
("1102","Vellilappally 
("1103","Ramapuram 
("1104","Kadanad
("1105","Melukavu
("1106","Moonilavu
("1107","Poonjar Vadakkekara
("1108","Teekoy
("1109","Thalappalam
("1110","Bharananganam 
("1111","Lalam (Part)
("1112","Vallichira
("1113","Kurichithanam
("1114","Kuravilangad
("1115","Kanakkari
("1116","Elackad
("1117","Kidangoor
("1118","Puliyannoor (Part)
("1119","Meenachil (Part)
("1120","Poovarany
("1121","Kondoor
("1122","Poonjar Thekkekara
("1123","Poonjar Nadubhagam
("1124","Erattupetta (CT)
("1125","Vaikom
("1126","Chempu
("1127","Velloor
("1128","Mulakulam
("1129","Njeezhoor
("1130","Kaduthuruthy
("1131","Vadayar
("1132","Kulasekharamangalam
("1133","Vadakkemuri (Part)
("1134","Naduvile (Part)
("1135","Vaikom (Part)
("1136","Thalayazham
("1137","Vechoor
("1138","Kallara
("1139","Muttuchira
("1140","Manjoor
("1141","Kothanalloor
("1142","Arpookara
("1143","Kaipuzha
("1144","Onamthuruth
("1145","Peroor
("1146","Ayarkunnam
("1147","Akalakunnam
("1148","Chengalam East
("1149","Anikkad
("1150","Kooroppada
("1151","Manarcad
("1152","Muttampalam (Part)
("1153","Kumarakam
("1154","Thiruvarpu
("1155","Veloor  (Part)
("1156","Meenadam 
("1157","Pampady
("1158","Ettumanoor (CT)
("1159","Athirampuzha (CT)
("1160","Aimanam (CT)
("1161","Perumbaikad (CT)
("1162","Vijayapuram (CT)
("1163","Chengalam South (CT)
("1164","Nattakam (CT)
("1165","Panachikkad (CT)
("1166","Puthuppally (CT)
("1167","Changanassery
("1168","Vakathanam
("1169","Kurichy
("1170","Vazhappally Padinjaru (Part)
("1171","Changanassery (Part)
("1172","Madappally
("1173","Thottackad
("1174","Karukachal
("1175","Nedumkunnam 
("1176","Vazhoor
("1177","Kangazha
("1178","Vellavoor
("1179","Chethipuzha (CT)
("1180","Thrikkodithanam (CT)
("1181","Paippad (CT)
("1182","Kanjirappally
("1183","Koottickal
("1184","Mundakayam
("1185","Edakkunnam
("1186","Elikkulam
("1187","Elamgulam
("1188","Chirakkadavu
("1189","Cheruvally
("1190","Koovappally
("1191","Erumeli North
("1192","Erumeli South 
("1193","Manimala
("1194","Alappuzha
("1195","Cherthala
("1196","Perumbalam
("1197","Panavally
("1198","Thuravoor Thekku
("1199","Pattanakkad
("1200","Kadakkarappally
INSERT INTO village VALUES
("1201","Cherthala North (Part)
("1202","Cherthala South (Part)
("1203","Mararikkulam North
("1204","Arookutty (CT)
("1205","Aroor (CT)
("1206","Ezhupunna (CT)
("1207","Kodamthuruth (CT)
("1208","Thaikattussery (CT)
("1209","Kuthiathode (CT)
("1210","Vayalar (CT)
("1211","Pallippuram (CT)
("1212","Thanneermukkam (CT)
("1213","Kokkothamangalam (CT)
("1214","Kanjikkuzhi (CT)
("1215","Muhamma (CT)
("1216","Ambalappuzha
("1217","Kalavoor
("1218","Aryad South  (Part)
("1219","Mullakkal (Part) 
("1220","Karumady  
("1221","Purakkad
("1222","Mannanchery (CT)
("1223","Pathirappally (CT)
("1224","Komalapuram (CT)
("1225","Punnapra (OG)
("1226","Kalarkode (OG) (Part)
("1227","Kuttanad
("1228","Kainakary North
("1229","Kainakary South
("1230","Pulinkunnu
("1231","Kunnumma
("1232","Kavalam
("1233","Neelamperoor
("1234","Veliyanad
("1235","Ramankary
("1236","Champakkulam
("1237","Nedumudi
("1238","Thakazhy
("1239","Edathua  
("1240","Muttar
("1241","Thalavady 
("1242","Karthikappally
("1243","Karuvatta
("1244","Cheruthana
("1245","Veeyapuram
("1246","Pallippad
("1247","Thrikkunnapuzha
("1248","Arattupuzha
("1249","Haripad (CT)
("1250","Kumarapuram (CT)
("1251","Karthikappally (CT)
("1252","Chingoli (CT)
("1253","Cheppad (CT)
("1254","Pathiyoor (CT)
("1255","Keerikkad (CT)
("1256","Muthukulam (CT)
("1257","Kandalloor (CT)
("1258","Puthuppally (CT)
("1259","Krishnapuram (CT)
("1260","Chengannur
("1261","Ennakkad
("1262","Pandanad (Part)
("1263","Thiruvanvandoor
("1264","Chengannur  (Part)
("1265","Mulakuzha (Part) 
("1266","Ala (Part)
("1267","Puliyoor(Part)
("1268","Cheriyanad
("1269","Venmony
("1270","Mannar (CT)
("1271","Kurattissery (CT)
("1272","Mavelikkara
("1273","Thriperumthura
("1274","Vettiyar
("1275","Thekkekara (Part)
("1276","Perungala
("1277","Chunakkara
("1278","Noornad
("1279","Palamel
("1280","Thamarakkulam
("1281","Vallikunnam
("1282","Kannamangalam (CT)
("1283","Chennithala (CT)
("1284","Thazhakara (CT)
("1285","Bharanikkavu (CT)
("1286","Kattanam (CT)
("1287","Pathanamthitta
("1288","Thiruvalla
("1289","Niranam
("1290","Kadapra
("1291","Nedumpuram
("1292","Peringara
("1293","Kavumbhagom (Part)
("1294","Kuttoor
("1295","Kaviyoor
("1296","Eraviperoor
("1297","Koipuram
("1298","Thottapuzhassery
("1299","Mallappally
("1300","Kunnamthanam
INSERT INTO village VALUES
("1301","Kallooppara
("1302","Anicad
("1303","Kottangal
("1304","Perumpetty
("1305","Ezhumattoor
("1306","Thelliyoor
("1307","Puramattam
("1308","Ranni
("1309","Chethakkal
("1310","Kollamula
("1311","Perunad
("1312","Athikkayam
("1313","Pazhavangadi
("1314","Angadi
("1315","Ayiroor
("1316","Cherukole
("1317","Ranni 
("1318","Vadasserikkara 
("1319","Chittar-Seethathodu
("1320","Kozhenchery
("1321","Kulanada
("1322","Mezhuveli
("1323","Kidangannur
("1324","Aranmula
("1325","Mallapuzhassery
("1326","Elanthoor
("1327","Chenneerkara
("1328","Vallicode
("1329","Omalloor
("1330","Pathanamthitta (Part)
("1331","Naranganam
("1332","Mylapra (Part)
("1333","Malayalapuzha (Part)
("1334","Konnithazham
("1335","Pramadom
("1336","Vallicode-Kottayam
("1337","Konni
("1338","Aruvappulam
("1339","Iravan
("1340","Thannithode 
("1341","Kozhenchery (CT)
("1342","Adoor
("1343","Pandalam
("1344","Kurampala
("1345","Pandalam Thekkekara
("1346","Kodumon
("1347","Angadickal
("1348","Koodal
("1349","Kalanjoor
("1350","Enadimangalam
("1351","Ezhamkulam
("1352","Erathu
("1353","Peringanadu (Part)
("1354","Pallickal
("1355","Kadampanadu
("1356","Enathu
("1357","Kollam
("1358","Karunagappally 
("1359","Alappad
("1360","Clappana
("1361","Thazhava
("1362","Pavumba
("1363","Thevalakkara
("1364","Thekkumbhagom
("1365","Oachira (CT)
("1366","Kulasekharapuram (CT)
("1367","Adinad (CT)
("1368","Thodiyoor (CT)
("1369","Kallelibhagom (CT)
("1370","Karunagappally (CT)
("1371","Ayanivelikulangara (CT)
("1372","Vadakkumthala (CT)
("1373","Panmana (CT)
("1374","Chavara (CT)
("1375","Neendakara (OG)
("1376","Kunnathur
("1377","Sooranad North
("1378","Poruvazhy
("1379","Sasthamkotta
("1380","Sooranad South
("1381","Mynagappally
("1382","West Kallada
("1383","Pathanapuram
("1384","Pattazhy Vadakkekara
("1385","Pattazhy
("1386","Thalavoor
("1387","Vilakkudy
("1388","Pidavoor
("1389","Pathanapuram 
("1390","Punnala
("1391","Piravanthur 
("1392","Valacode (Part)
("1393","Edamon
("1394","Thenmala
("1395","Arienkavu
("1396","Kulathupuzha
("1397","Thinkalkarikkakom
("1398","Ayiranalloor
("1399","Karavaloor (Part)
("1400","Arackal
INSERT INTO village VALUES
("1401","Edamulackal
("1402","Anchal
("1403","Eroor
("1404","Alayamon 
("1405","Channappetta 
("1406","Kottarakkara
("1407","Pavithreswaram
("1408","Puthur 
("1409","Kulakkada
("1410","Kalayapuram
("1411","Mylom
("1412","Melila 
("1413","Chakkuvarakkal
("1414","Vettikkavala
("1415","Neduvathoor
("1416","Ezhukone
("1417","Kareepra
("1418","Odanavattam
("1419","Ummannoor
("1420","Valakam
("1421","Elamad
("1422","Veliyam
("1423","Pooyappally
("1424","Velinalloor
("1425","Chadayamangalam
("1426","Kottukkal
("1427","Ittiva
("1428","Kadakkal
("1429","Nilamel
("1430","Kummil
("1431","Mancode
("1432","Chithara
("1433","Kottarakkara (CT)
("1434","Eravipuram (OG) (Part)
("1435","Mundrothuruth
("1436","Kizhakkekallada
("1437","Mulavana
("1438","Pallimon
("1439","Chirakkara
("1440","Paravoor (Part)
("1441","Parippally
("1442","Kalluvathukkal
("1443","Thrikkaruva (CT)
("1444","Panayam (CT)
("1445","Perinad (CT)
("1446","Elampalloor (CT)
("1447","Nedumpana (CT)
("1448","Kottamkara (CT)
("1449","Thrikkadavoor (CT)
("1450","Thrikkovilvattom (CT)
("1451","Adichanalloor (CT)
("1452","Thazhuthala (CT)
("1453","Mayyanad (CT)
("1454","Meenad (CT)
("1455","Poothakkulam (CT)
("1456","Thiruvananthapuram
("1457","Chirayinkeezhu
("1458","Edava
("1459","Ayiroor
("1460","Chemmaruthy
("1461","Navaikulam
("1462","Pallickal
("1463","Madavoor
("1464","Kudavoor
("1465","Vellalloor
("1466","Kilimanoor
("1467","Pazhayakunnummel
("1468","Pulimath
("1469","Koduvazhannoor
("1470","Nagaroor
("1471","Karavaram
("1472","Ottoor
("1473","Vettoor-Cherunniyoor 
("1474","Manamboor
("1475","Elamba-Mudakkal
("1476","Attingal-Avanavancherry (Part)
("1477","Kadakkavoor
("1478","Sarkara-Chirayinkeezhu
("1479","Alamcode (CT)
("1480","Keezhattingal (CT)
("1481","Vakkom (CT)
("1482","Kizhuvalam-Koonthalloor (CT)
("1483","Edakkode (CT)
("1484","Azhoor (CT)
("1485","Nedumangad
("1486","Nellanad
("1487","Vamanapuram
("1488","Kallara
("1489","Pangode
("1490","Peringamala
("1491","Thennoor 
("1492","Palode
("1493","Kurupuzha
("1494","Panavoor
("1495","Pullampara
("1496","Koliyakode
("1497","Manikkal
("1498","Theakada
("1499","Anad
("1500","Tholicode
INSERT INTO village VALUES
("1501","Vithura
("1502","Mannoorkara
("1503","Aryanad
("1504","Uzhamalackal
("1505","Vembayam
("1506","Aruvikkara
("1507","Vellanad
("1508","Perumkulam
("1509","Veeranakavu
("1510","Vattappara (CT)
("1511","Karakulam (CT)
("1512","Kadinamkulam
("1513","Melthonnakkal
("1514","Keezhthonnakkal
("1515","Andoorkonam
("1516","Menamkulam
("1517","Veiloor (CT)
("1518","Pallippuram (CT)
("1519","Iroopara (CT)
("1520","Uliyazhathura (CT)
("1521","Sreekaryam (CT)
("1522","Kudappanakkunnu (CT)
("1523","Vattiyoorkavu (CT)
("1524","Kalliyoor (CT)
("1525","Venganoor (CT)
("1526","Kazhakkoottam(OG)
("1527","Neyyattinkara
("1528","Ottasekharamangalam
("1529","Kallikkad
("1530","Vazhichal
("1531","Amboori
("1532","Vellarada
("1533","Keezharoor
("1534","Maranalloor
("1535","Perumkadavila
("1536","Anavoor
("1537","Kunnathukal
("1538","Kollayil (Part)
("1539","Karode
("1540","Chenkal (Part)
("1541","Kulathoor
("1542","Thirupuram
("1543","Karumkulam 
("1544","Kottukal (Part)
("1545","Vizhinjam (Part)
("1546","Kovalam (OG) (Part)
("1547","Vilappil (CT)
("1548","Kulathummal (CT)
("1549","Malayinkeezhu (CT)
("1550","Vilavoorkkal (CT)
("1551","Pallichal (CT)
("1552","Athiyannur (CT)
("1553","Kanjiramkulam (CT)
("1554","Parasuvaikkal (CT)
("1555","Parassala (CT)




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
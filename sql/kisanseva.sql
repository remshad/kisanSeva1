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
("1","Kasaragod","254"),
("2","Pavoor","254"),
("3","Vorkady","254"),
("4","Pathur","254"),
("5","Kodalamogaru","254"),
("6","Koliyoor","254"),
("7","Kaliyoor","254"),
("8","Talikala","254"),
("9","Meenja","254"),
("10","Kadambar","254"),
("11","Moodambail","254"),
("12","Kuloor","254"),
("13","Majibail","254"),
("14","Badaje","254"),
("15","Mulinja","254"),
("16","Kodibail","254"),
("17","Ichilangod","254"),
("18","Heroor","254"),
("19","Kubanoor","254"),
("20","Bekoor","254"),
("21","Kayyar","254"),
("22","Kudalmarkala","254"),
("23","Paivalike","254"),
("24","Chippar","254"),
("25","Bayar","254"),
("26","Badoor","254"),
("27","Angadimogaru","254"),
("28","Mugu","254"),
("29","Maire","254"),
("30","Enmakaje","254"),
("31","Kattukukke","254"),
("32","Padre","254"),
("33","Badiyadka","254"),
("34","Nirchal","254"),
("35","Bela","254"),
("36","Puthige","254"),
("37","Edanad","254"),
("38","Kannur","254"),
("39","Kidoor","254"),
("40","Ujarulvar","254"),
("41","Bombrana","254"),
("42","Arikady","254"),
("43","Ichilampady","254"),
("44","Patla","254"),
("45","Kalnad","254"),
("46","Perumbala","254"),
("47","Thekkil","254"),
("48","Muttathody","254"),
("49","Pady","254"),
("50","Nekraje","254"),
("51","Ubrangala","254"),
("52","Kumbadaje","254"),
("53","Nettanige","254"),
("54","Bellur","254"),
("55","Adhur","254"),
("56","Karadka","254"),
("57","Muliyar","254"),
("58","Kolathur","254"),
("59","Bedadka","254"),
("60","Munnad","254"),
("61","Kuttikole","254"),
("62","Karivedakam","254"),
("63","Bandadka","254"),
("64","Adoor","254"),
("65","Delampady","254"),
("66","Kunjathur (CT)","254"),
("67","Manjeshwar (CT)","254"),
("68","Hosabettu (CT)","254"),
("69","Bangra Manjeshwar (CT)","254"),
("70","Uppala (CT)","254"),
("71","Mangalpady (CT)","254"),
("72","Shiriya (CT)","254"),
("73","Koipady (CT)","254"),
("74","Mogral (CT)","254"),
("75","Puthur (CT)","254"),
("76","Shiribagilu (CT)","254"),
("77","Madhur (CT)","254"),
("78","Kudlu (CT)","254"),
("79","Chengala (CT)","254"),
("80","Chemnad (CT)","254"),
("81","Hosdurg","254"),
("82","Pallikkara II","254"),
("83","Panayal","254"),
("84","Chithari","254"),
("85","Periya","254"),
("86","Pullur","254"),
("87","Kodom","254"),
("88","Kallar","254"),
("89","Panathady","254"),
("90","Balal","254"),
("91","Maloth ","254"),
("92","West Eleri","254"),
("93","Palavayal","254"),
("94","Chittarikkal","254"),
("95","Bheemanady","254"),
("96","Parappa ","254"),
("97","Thayanur","254"),
("98","Ambalathara","254"),
("99","Madikai","254"),
("100","Kinanoor","254");
INSERT INTO village VALUES
("101","Karindalam","254"),
("102","Cheemeni II","254"),
("103","Cheemeni ","254"),
("104","Kayyur","254"),
("105","Kilayikode","254"),
("106","Thimiri","254"),
("107","Kodakkad","254"),
("108","Padne","254"),
("109","Udinoor","254"),
("110","Bare (CT)","254"),
("111","Udma (CT)","254"),
("112","Pallikkara (CT)","254"),
("113","Keekan (CT)","254"),
("114","Ajanur (CT)","254"),
("115","Perole (CT)","254"),
("116","Pilicode (CT)","254"),
("117","Maniyat (CT)","254"),
("118","North Thrikkaripur (CT)","254"),
("119","South Thrikkaripur (CT)","254"),
("120","Nileshwar (OG)","254"),
("121","Cheruvathur (OG)  ","254"),
("122","Kannur","253"),
("123","Taliparamba ","253"),
("124","Ramanthali","253"),
("125","Peralam","253"),
("126","Kankole","253"),
("127","Alapadamba","253"),
("128","Eramam","253"),
("129","Perinthatta","253"),
("130","Kuttoor","253"),
("131","Vellora","253"),
("132","Peringome","253"),
("133","Thimiri","253"),
("134","Vayakkara","253"),
("135","Pulingome","253"),
("136","Thirumeni","253"),
("137","Alakode","253"),
("138","Vellad","253"),
("139","New Naduvil","253"),
("140","Kooveri","253"),
("141","Panniyoor","253"),
("142","Kuttiyeri","253"),
("143","Pattuvam","253"),
("144","Chuzhali","253"),
("145","Nediyanga","253"),
("146","Eruvassy","253"),
("147","Payyavoor","253"),
("148","Nuchiyad","253"),
("149","Vayathur","253"),
("150","Padiyoor","253"),
("151","Kalliad","253"),
("152","Sreekandapuram","253"),
("153","Malapattam","253"),
("154","Chengalai","253"),
("155","Kayaralam","253"),
("156","Karivellur (CT)","253"),
("157","Pariyaram (CT)","253"),
("158","Kurumathur (CT)","253"),
("159","Irikkur (CT)","253"),
("160","Kuttiattoor (CT)","253"),
("161","Mayyil (CT)","253"),
("162","Kolacherry (CT)","253"),
("163","Cheleri (CT)","253"),
("164","Maniyoor (CT)","253"),
("165","Panapuzha","253"),
("166","Mattool","253"),
("167","Kunhimangalam (CT)","253"),
("168","Cheruthazham (CT)","253"),
("169","Kadannappalli (CT)","253"),
("170","Ezhome (CT)","253"),
("171","Madayi (CT)","253"),
("172","Cherukunnu (CT)","253"),
("173","Kannapuram (CT)","253"),
("174","Narath (CT)","253"),
("175","Pappinisseri (CT)","253"),
("176","Kalliasseri (CT)","253"),
("177","Azhikode North (CT)","253"),
("178","Azhikode South (CT)","253"),
("179","Valapattanam (CT)","253"),
("180","Chirakkal (CT)","253"),
("181","Kannadiparamba (CT)","253"),
("182","Munderi (CT)","253"),
("183","Kanhirode (CT)","253"),
("184","Varam (CT)","253"),
("185","Puzhathi (CT)","253"),
("186","Pallikkunnu (CT)","253"),
("187","Elayavoor (CT)","253"),
("188","Chelora (CT)","253"),
("189","Ancharakandy (CT)","253"),
("190","Iriveri (CT)","253"),
("191","Chala (CT)","253"),
("192","Thottada (CT)","253"),
("193","Kadachira (CT)","253"),
("194","Mavilayi (CT)","253"),
("195","Peralassery (CT)","253"),
("196","Muzhappilangad (CT)","253"),
("197","Thalassery","253"),
("198","Pattannur","253"),
("199","Chavassery","253"),
("200","Keezhur","253");
INSERT INTO village VALUES
("201","Payam","253"),
("202","Vilamana","253"),
("203","Ayyankunnu","253"),
("204","Aralam","253"),
("205","Kottiyoor","253"),
("206","Kelakam","253"),
("207","Kanichar","253"),
("208","Manathana","253"),
("209","Muzhakkunnu","253"),
("210","Thillenkeri","253"),
("211","Tholambra","253"),
("212","Vellarvelly","253"),
("213","Vekkalam","253"),
("214","Koloyad","253"),
("215","Kannavam","253"),
("216","Sivapuram","253"),
("217","Cheruvanchery","253"),
("218","Puthoor","253"),
("219","Thrippangottur","253"),
("220","Koodali (CT)","253"),
("221","Keezhallur (CT)","253"),
("222","Paduvilayi (CT)","253"),
("223","Pathiriyad (CT)","253"),
("224","Mangattidam (CT)","253"),
("225","Kandamkunnu (CT)","253"),
("226","Manantheri (CT)","253"),
("227","Kottayam-Malabar (CT)","253"),
("228","Eruvatti (CT)","253"),
("229","Pinarayi (CT)","253"),
("230","Dharmadom (CT)","253"),
("231","Eranholi (CT)","253"),
("232","Kadirur (CT)","253"),
("233","Pattiom (CT)","253"),
("234","Mokeri (CT)","253"),
("235","Kolavelloor (CT)","253"),
("236","Panoor (CT)","253"),
("237","Panniyannur (CT)","253"),
("238","New Mahe (CT)","253"),
("239","Chockli (CT)","253"),
("240","Peringathur (CT)","253"),
("241","Wayanad","262"),
("242","Mananthavady","262"),
("243","Thirunelly","262"),
("244","Thrissilery","262"),
("245","Payyampally","262"),
("246","Thavinhal","262"),
("247","Periya","262"),
("248","Thondernad","262"),
("249","Valat","262"),
("250","Edavaka","262"),
("251","Nalloornad","262"),
("252","Cherukottur","262"),
("253","Panamaram","262"),
("254","Anchukunnu","262"),
("255","Porunnanore","262"),
("256","Vellamunda","262"),
("257","Kanjirangad","262"),
("258","Sulthanbathery","262"),
("259","Nadavayal ","262"),
("260","Poothadi","262"),
("261","Pulpalli","262"),
("262","Padichira","262"),
("263","Kidanganad","262"),
("264","Irulam","262"),
("265","Purakkadi ","262"),
("266","Krishnagiri","262"),
("267","Kuppadi","262"),
("268","Noolpuzha","262"),
("269","Cheeral","262"),
("270","Nenmeni","262"),
("271","Ambalavayal","262"),
("272","Thomattuchal","262"),
("273","Vythiri","262"),
("274","Padinharethara","262"),
("275","Kuppadithara","262"),
("276","Kottathara ","262"),
("277","Kaniambetta","262"),
("278","Muttil North ","262"),
("279","Muttil South","262"),
("280","Vengappally","262"),
("281","Kavumannam","262"),
("282","Thariyode","262"),
("283","Achooranam","262"),
("284","Pozhuthana","262"),
("285","Kunnathidavaka","262"),
("286","Chundale","262"),
("287","Kottappadi (Part)","262"),
("288","Thrikkaipatta (Part)","262"),
("289","Muppainad","262"),
("290","Vellarimala","262"),
("291","Kozhikode","256"),
("292","Vadakara","256"),
("293","Onchiam","256"),
("294","Vanimel","256"),
("295","Vilangad","256"),
("296","Thinoor","256"),
("297","Kavilumpara","256"),
("298","Kayakkodi","256"),
("299","Narippatta","256"),
("300","Purameri","256");
INSERT INTO village VALUES
("301","Thiruvallur","256"),
("302","Velom","256"),
("303","Kuttiadi","256"),
("304","Maruthonkara","256"),
("305","Valayam (CT)","256"),
("306","Chekkiad (CT)","256"),
("307","Thuneri (CT)","256"),
("308","Kunnummal (CT)","256"),
("309","Nadapuram (CT)","256"),
("310","Edacheri (CT)","256"),
("311","Eramala (CT)","256"),
("312","Azhiyur (CT)","256"),
("313","Chorode (CT)","256"),
("314","Ayancheri (CT)","256"),
("315","Kottappally (CT)","256"),
("316","Villiappally (CT)","256"),
("317","Palayad (CT)","256"),
("318","Maniyur (CT)","256"),
("319","Quilandy","256"),
("320","Payyoli","256"),
("321","Cheruvannur","256"),
("322","Palery","256"),
("323","Changaroth","256"),
("324","Chempanoda","256"),
("325","Chakkittapara","256"),
("326","Perambra","256"),
("327","Nochad","256"),
("328","Moodadi","256"),
("329","Arikkulam (Part)","256"),
("330","Kottur","256"),
("331","Kayanna ","256"),
("332","Koorachundu ","256"),
("333","Kanthalad ","256"),
("334","Avitanallur","256"),
("335","Chengottukavu","256"),
("336","Kinalur","256"),
("337","Unnikulam","256"),
("338","Sivapuram","256"),
("339","Iringal (CT)","256"),
("340","Eravattur (CT)","256"),
("341","Koothali (CT)","256"),
("342","Menhaniam (CT)","256"),
("343","Meppayyur (CT)","256"),
("344","Kozhukkallur (CT)","256"),
("345","Thurayur (CT)","256"),
("346","Thikkody (CT)","256"),
("347","Keezhariyur (CT)","256"),
("348","Naduvannur (CT)","256"),
("349","Panangad (CT)","256"),
("350","Balusseri (CT)","256"),
("351","Ulliyeri (CT)","256"),
("352","Chemancheri (CT)","256"),
("353","Atholi (CT)","256"),
("354","Kakkur","256"),
("355","Narikkuni","256"),
("356","Kizhakkoth","256"),
("357","Vavad","256"),
("358","Raroth","256"),
("359","Kedavur","256"),
("360","Puthuppadi","256"),
("361","Engapuzha","256"),
("362","Koodathayi ","256"),
("363","Kodencheri","256"),
("364","Nellipoyil","256"),
("365","Koodaranji","256"),
("366","Thiruvambadi","256"),
("367","Neeleswaram ","256"),
("368","Puthur","256"),
("369","Chathamangalam ","256"),
("370","Madavoor","256"),
("371","Kumaranallur","256"),
("372","Kakkad","256"),
("373","Kodiyathur","256"),
("374","Nanmanda (CT)","256"),
("375","Chelannur (CT)","256"),
("376","Thalakkulathur (CT)","256"),
("377","Kakkodi (CT)","256"),
("378","Kuruvattur (CT)","256"),
("379","Kunnamangalam (CT)","256"),
("380","Poolacode (CT)","256"),
("381","Thazhecode (CT)","256"),
("382","Mavoor (CT)","256"),
("383","Peruvayal (CT)","256"),
("384","Kuttikkattoor (CT)","256"),
("385","Olavanna (CT)","256"),
("386","Pantheeramkavu (CT)","256"),
("387","Perumanna (CT)","256"),
("388","Ramanattukara (CT)","256"),
("389","Cheruvannur (CT)","256"),
("390","Beypore (CT)","256"),
("391","Karuvanthuruthy (CT)","256"),
("392","Feroke (CT)","256"),
("393","Koduvally (OG)","256"),
("394","Elathur (OG)","256"),
("395","Kadalundi (OG)","256"),
("396","Puthiyangadi (OG) (Part)","256"),
("397","Malappuram","257"),
("398","Ernad","257"),
("399","Vettilappara","257"),
("400","Vazhakkad","257");
INSERT INTO village VALUES
("401","Pulikkal","257"),
("402","Cheekkode","257"),
("403","Areekode","257"),
("404","Urangattiri","257"),
("405","Perakamanna","257"),
("406","Edavanna","257"),
("407","Karakunnu","257"),
("408","Kavanoor","257"),
("409","Kuzhimanna","257"),
("410","Muthuvallur","257"),
("411","Nediyiruppu","257"),
("412","Morayur","257"),
("413","Pookkottur","257"),
("414","Pulpatta","257"),
("415","Trikkalangode","257"),
("416","Elankur","257"),
("417","Pandalur","257"),
("418","Vettikkattiri","257"),
("419","Chembrasseri","257"),
("420","Pandikkad","257"),
("421","Kizhuparamba (CT)","257"),
("422","Vazhayur (CT)","257"),
("423","Cherukavu (CT)","257"),
("424","Kondotty (CT)","257"),
("425","Anakkayam (OG)","257"),
("426","Nilambur","257"),
("427","Pullipadam ","257"),
("428","Akampadam","257"),
("429","Kurumbilangode","257"),
("430","Chungathara","257"),
("431","Edakkara","257"),
("432","Vazhikkadavu","257"),
("433","Amarambalam","257"),
("434","Karulai","257"),
("435","Mambad","257"),
("436","Thiruvali","257"),
("437","Porur","257"),
("438","Wandoor","257"),
("439","Chekkode","257"),
("440","Kalikavu","257"),
("441","Vellayur","257"),
("442","Thuvvur","257"),
("443","Kerala Estate","257"),
("444","Karuvarakundu","257"),
("445","Nilambur (CT)","257"),
("446","Perinthalmanna","257"),
("447","Edappatta","257"),
("448","Melattur","257"),
("449","Keezhattur","257"),
("450","Nenmini","257"),
("451","Mankada","257"),
("452","Vadakkangara","257"),
("453","Kuruva","257"),
("454","Puzhakkattiri","257"),
("455","Valambur","257"),
("456","Angadippuram","257"),
("457","Kariavattom","257"),
("458","Vettathur","257"),
("459","Arakkuparamba","257"),
("460","Thazhekode","257"),
("461","Aliparamba","257"),
("462","Anamangad","257"),
("463","Elamkulam","257"),
("464","Pulamanthole","257"),
("465","Kuruvambalam","257"),
("466","Moorkkanad","257"),
("467","Koottilangadi (CT)","257"),
("468","Kodur (CT)","257"),
("469","Tirur","257"),
("470","Pariyapuram","257"),
("471","Tanur ","257"),
("472","Ozhur","257"),
("473","Niramaruthur","257"),
("474","Valavannur","257"),
("475","Kalpakancheri","257"),
("476","Marakkara","257"),
("477","Ponmala","257"),
("478","Melmuri","257"),
("479","Edayoor","257"),
("480","Athavanad","257"),
("481","Kurumbathur","257"),
("482","Ananthavoor","257"),
("483","Vettom","257"),
("484","Purathur","257"),
("485","Mangalam","257"),
("486","Kottakkal (CT)","257"),
("487","Perumanna (CT)","257"),
("488","Ponmundam (CT)","257"),
("489","Tanalur (CT)","257"),
("490","Cheriyamundam (CT)","257"),
("491","Kattipparuthi (CT)","257"),
("492","Talakkad (CT)","257"),
("493","Triprangode (CT)","257"),
("494","Thirunavaya (CT)","257"),
("495","Naduvattom (CT)","257"),
("496","Kuttippuram (CT)","257"),
("497","Irimbiliyam (CT)","257"),
("498","Tirurangadi","257"),
("499","Vallikkunnu","257"),
("500","Parappanangadi ","257");
INSERT INTO village VALUES
("501","Chelambra (CT)","257"),
("502","Pallikal (CT)","257"),
("503","Thenhippalam (CT)","257"),
("504","Ariyallur (CT)","257"),
("505","Moonniyur (CT)","257"),
("506","Peruvallur (CT)","257"),
("507","Kannamangalam (CT)","257"),
("508","Urakam (CT)","257"),
("509","Othukkungal (CT)","257"),
("510","Parappur (CT)","257"),
("511","Vengara (CT)","257"),
("512","Abdu Rahiman Nagar (CT)","257"),
("513","Tirurangadi (CT)","257"),
("514","Neduva (CT)","257"),
("515","Nannambra (CT)","257"),
("516","Thennala (CT)","257"),
("517","Ponnani","257"),
("518","Tavanur","257"),
("519","Vattamkulam","257"),
("520","Veliyankode","257"),
("521","Perumpadappa","257"),
("522","Nannamukku","257"),
("523","Kalady (CT)","257"),
("524","Edappal (CT)","257"),
("525","Alamcode (CT)","257"),
("526","Marancheri (CT)","257"),
("527","Palakkad","258"),
("528","Ottappalam","258"),
("529","Anakkara","258"),
("530","Parudur","258"),
("531","Thiruvegapura","258"),
("532","Vilayur","258"),
("533","Kulukkallur","258"),
("534","Nellaya","258"),
("535","Cherpulacherry","258"),
("536","Vellinezhi","258"),
("537","Karimpuzha-I","258"),
("538","Karimpuzha-II","258"),
("539","Kadampazhipuram-II","258"),
("540","Kadampazhipuram-I","258"),
("541","Sreekrishnapuram -I","258"),
("542","Sreekrishnapuram -II","258"),
("543","Thrikkadeeri -II","258"),
("544","Thrikkadeeri -I","258"),
("545","Ananganadi","258"),
("546","Chalavara","258"),
("547","Vallapuzha","258"),
("548","Koppam","258"),
("549","Pattithara","258"),
("550","Kappur","258"),
("551","Chalissery","258"),
("552","Nagalassery","258"),
("553","Thirumittacode-I","258"),
("554","Vaniyamkulam-I","258"),
("555","Ambalapara - II","258"),
("556","Ambalapara - I","258"),
("557","Lakkidi-Perur- I ","258"),
("558","Lakkidi-Perur- II ","258"),
("559","Ongallur -II (CT)","258"),
("560","Ongallur -I (CT)","258"),
("561","Pattambi (CT)","258"),
("562","Muthuthala (CT)","258"),
("563","Thrithala (CT)","258"),
("564","Vaniyamkulam- II (CT)","258"),
("565","Thirumittacode -II (CT)","258"),
("566","Mannarkad","258"),
("567","Alanallur-I","258"),
("568","Alanallur-II","258"),
("569","Alanallur-III","258"),
("570","Kottoppadam-I","258"),
("571","Kottoppadam-III","258"),
("572","Payyanadam","258"),
("573","Padavayal","258"),
("574","Pudur","258"),
("575","Agali","258"),
("576","Kottathara","258"),
("577","Sholayur","258"),
("578","Kallamala","258"),
("579","Palakkayam","258"),
("580","Mannarkad-II","258"),
("581","Pottassery- I","258"),
("582","Pottassery- II","258"),
("583","Thachampara","258"),
("584","Karimba -I","258"),
("585","Karimba -II","258"),
("586","Karakurissi","258"),
("587","Kumaramputhur","258"),
("588","Kottoppadam-II","258"),
("589","Thachanattukara-I","258"),
("590","Thachanattukara-II","258"),
("591","Mannarkad-I (CT)","258"),
("592","Kongad-II","258"),
("593","Keralassery","258"),
("594","Mannur","258"),
("595","Mankara","258"),
("596","Kongad-I","258"),
("597","Mundur-II","258"),
("598","Mundur-I","258"),
("599","Parli-I","258"),
("600","Parli-II","258");
INSERT INTO village VALUES
("601","Puthuppariyaram-I","258"),
("602","Malampuzha-I","258"),
("603","Malampuzha-II","258"),
("604","Kannadi-I","258"),
("605","Kannadi-II","258"),
("606","Kodumba","258"),
("607","Peruvemba","258"),
("608","Polpully","258"),
("609","Elappully-II","258"),
("610","Elappully-I","258"),
("611","Pudussery East","258"),
("612","Puthuppariyaram (CT)","258"),
("613","Hemambikanagar (CT)","258"),
("614","Pudussery Central (CT)","258"),
("615","Pudussery West (CT)","258"),
("616","Marutharode (CT)","258"),
("617","Pirayiri (CT)","258"),
("618","Chittur","258"),
("619","Koduvayur-II","258"),
("620","Thathamangalam (Part)","258"),
("621","Chittur (Part)","258"),
("622","Thekkedesom","258"),
("623","Nalleppilly","258"),
("624","Kozhinjampara","258"),
("625","Vadakarapathy","258"),
("626","Ozhalapathy","258"),
("627","Eruthempathy","258"),
("628","Kozhipathy","258"),
("629","Valiyavallampathy","258"),
("630","Moolathara","258"),
("631","Perumatty","258"),
("632","Vandithavalam","258"),
("633","Pattanchery","258"),
("634","Vadavannur","258"),
("635","Pallassana","258"),
("636","Vallanghy","258"),
("637","Nemmara","258"),
("638","Ayiloor","258"),
("639","Kairady","258"),
("640","Thiruvazhiyad","258"),
("641","Nelliyampathy","258"),
("642","Elavancherry","258"),
("643","Kollengode-II","258"),
("644","Kollengode-I","258"),
("645","Muthalamada-I","258"),
("646","Muthalamada-II","258"),
("647","Koduvayur (CT)","258"),
("648","Puthunagaram (CT)","258"),
("649","Alathur","258"),
("650","Peringottukurissi-II","258"),
("651","Peringottukurissi-I","258"),
("652","Kottayi-I","258"),
("653","Kottayi-II","258"),
("654","Mathur -I","258"),
("655","Mathur -II","258"),
("656","Kuzhalmannam-II","258"),
("657","Thenkurissi-I","258"),
("658","Thenkurissi-II ","258"),
("659","Kuzhalmannam-I","258"),
("660","Kuthannur-I","258"),
("661","Kuthannur-II","258"),
("662","Tarur-I","258"),
("663","Tarur-II","258"),
("664","Erimayur-I ","258"),
("665","Erimayur-II","258"),
("666","Melarcode ","258"),
("667","Kavasseri-I","258"),
("668","Kavasseri-II","258"),
("669","Puducode","258"),
("670","Kannambra-I","258"),
("671","Kannambra-II","258"),
("672","Vadakkancheri-I","258"),
("673","Vadakkancheri-II","258"),
("674","Vandazhi-II","258"),
("675","Vandazhi-I","258"),
("676","Mangalam Dam","258"),
("677","Kizhakkencheri-II","258"),
("678","Kizhakkencheri-I","258"),
("679","Alathur (CT)","258"),
("680","Thrissur","260"),
("681","Talappilly","260"),
("682","Perumpilavu","260"),
("683","Kadangode","260"),
("684","Thichur","260"),
("685","Arangottukara","260"),
("686","Pallur","260"),
("687","Thalassery","260"),
("688","Pilakkad","260"),
("689","Varavoor","260"),
("690","Painkulam","260"),
("691","Mayannur","260"),
("692","Pampady","260"),
("693","Thiruvilwamala","260"),
("694","Vadakkethara","260"),
("695","Kondazhy","260"),
("696","Chelakode","260"),
("697","Venganellur","260"),
("698","Killimangalam","260"),
("699","Panjal","260"),
("700","Attoor","260");
INSERT INTO village VALUES
("701","Mullurkara","260"),
("702","Kanjirakode","260"),
("703","Vellarakkad","260"),
("704","Chowwannur(Part)","260"),
("705","Mangad (Part)","260"),
("706","Kanipayyur (Part)","260"),
("707","Chemmanthatta","260"),
("708","Vellattanjur","260"),
("709","Thayyur","260"),
("710","Kiralur","260"),
("711","Parlikad","260"),
("712","Puthuruthy","260"),
("713","Thekkumkara","260"),
("714","Karumathara","260"),
("715","Viruppakka","260"),
("716","Manalithara","260"),
("717","Kurumala","260"),
("718","Thonnurkara","260"),
("719","Pangarappilly","260"),
("720","Pulakode","260"),
("721","Pazhayannur","260"),
("722","Vennur","260"),
("723","Elanad","260"),
("724","Kaniyarkode (CT)","260"),
("725","Cheruthuruthi (CT)","260"),
("726","Nedumpura (CT)","260"),
("727","Desamangalam (CT)","260"),
("728","Kadavallur (CT)","260"),
("729","Kattakampal (CT)","260"),
("730","Pazhanji (CT)","260"),
("731","Karikkad (CT)","260"),
("732","Nelluwaya (CT)","260"),
("733","Kottappuram (CT)","260"),
("734","Chittanda (CT)","260"),
("735","Kumaranellur (CT)","260"),
("736","Chelakkara (CT)","260"),
("737","Enkakkad (CT)","260"),
("738","Wadakkanchery (CT)","260"),
("739","Kariyannur (CT)","260"),
("740","Eyyal (CT)","260"),
("741","Chiramanangad (CT)","260"),
("742","Akathiyoor (CT)","260"),
("743","Porkulam (CT)","260"),
("744","Choondal (CT)","260"),
("745","Chiranellur (CT)","260"),
("746","Velur (CT)","260"),
("747","Mundathikode (CT)","260"),
("748","Peringandoor (CT)","260"),
("749","Minalur (CT)","260"),
("750","Eranellur (CT)","260"),
("751","Alur (CT)","260"),
("752","Kandanassery (CT)","260"),
("753","Chavakkad","260"),
("754","Kadappuram ","260"),
("755","Annakara","260"),
("756","Irimbranallur","260"),
("757","Kundazhiyur","260"),
("758","Engandiyur","260"),
("759","Nattika","260"),
("760","Valappad","260"),
("761","Kadikkad (CT)","260"),
("762","Punnayurkulam (CT)","260"),
("763","Vadakkekad (CT)","260"),
("764","Punnayur (CT)","260"),
("765","Edakkazhiyur (CT)","260"),
("766","Vylathur (CT)","260"),
("767","Pookode (CT)","260"),
("768","Iringaprom (CT)","260"),
("769","Perakam (CT)","260"),
("770","Orumanayur (CT)","260"),
("771","Paluvai (CT)","260"),
("772","Thaikkad (CT)","260"),
("773","Brahmakulam (CT)","260"),
("774","Elavally (CT)","260"),
("775","Pavaratty (CT)","260"),
("776","Venmanad (CT)","260"),
("777","Mullassery (CT)","260"),
("778","Venkitangu (CT)","260"),
("779","Vadanappally (CT)","260"),
("780","Talikkulam (CT)","260"),
("781","Velappaya","260"),
("782","Madakkathara","260"),
("783","Chalakkal","260"),
("784","Pananchery","260"),
("785","Peechi","260"),
("786","Mannamangalam","260"),
("787","Mulayam","260"),
("788","Pullu","260"),
("789","Pallippuram","260"),
("790","Alappad","260"),
("791","Chazhoor","260"),
("792","Inchamudi","260"),
("793","Arattupuzha","260"),
("794","Killannur (CT)","260"),
("795","Thangalur (CT)","260"),
("796","Avanur (CT)","260"),
("797","Anjur (CT)","260"),
("798","Kaiparamba (CT)","260"),
("799","Tholur (CT)","260"),
("800","Edakkalathur (CT)","260");
INSERT INTO village VALUES
("801","Peramangalam (CT)","260"),
("802","Choolissery (CT)","260"),
("803","Pottore (CT)","260"),
("804","Kolazhy (CT)","260"),
("805","Kurichikkara (CT)","260"),
("806","Vellanikkara (CT)","260"),
("807","Kuttoor (CT)","260"),
("808","Puzhakkal (CT)","260"),
("809","Puranattukara (CT)","260"),
("810","Chittilappilly (CT)","260"),
("811","Adat (CT)","260"),
("812","Kozhukkully (CT)","260"),
("813","Kainoor (CT)","260"),
("814","Nadathara (CT)","260"),
("815","Parakkad (CT)","260"),
("816","Karamuck (CT)","260"),
("817","Manalur (CT)","260"),
("818","Eravu (CT)","260"),
("819","Veluthur (CT)","260"),
("820","Manakkody (CT)","260"),
("821","Marathakkara (CT)","260"),
("822","Puthur (CT)","260"),
("823","Avinissery (CT)","260"),
("824","Palissery (CT)","260"),
("825","Venginissery (CT)","260"),
("826","Kodannur (CT)","260"),
("827","Anthicad (CT)","260"),
("828","Padiyam (CT)","260"),
("829","Vadakkummuri (CT)","260"),
("830","Kizhakkummuri (CT)","260"),
("831","Cherpu (CT)","260"),
("832","Paralam (CT)","260"),
("833","Chevvoor (CT)","260"),
("834","Vallachira (CT)","260"),
("835","Oorakam (CT)","260"),
("836","Kurumpilavu (CT)","260"),
("837","Kizhuppillikkara (CT)","260"),
("838","Thanniyam (CT)","260"),
("839","Kodungallur","260"),
("840","Koolimuttam","260"),
("841","Padinjare Vemballur","260"),
("842","Azhikode","260"),
("843","Edathiruthy (CT)","260"),
("844","Chendrappini (CT)","260"),
("845","Kaipamangalam (CT)","260"),
("846","Perinjanam (CT)","260"),
("847","Pappinivattom (CT)","260"),
("848","Panangad (CT)","260"),
("849","Edavilangu (CT)","260"),
("850","Ala (CT)","260"),
("851","Pallippuram (CT)","260"),
("852","Methala (CT)","260"),
("853","Poyya (CT)","260"),
("854","Madathumpady (CT)","260"),
("855","Eriyad (OG)","260"),
("856","Mukundapuram","260"),
("857","Karalam (Part)","260"),
("858","Thottippal","260"),
("859","Kallur","260"),
("860","Varandarappilly","260"),
("861","Mupliyam","260"),
("862","Nandipulam","260"),
("863","Chengallur","260"),
("864","Nellayi","260"),
("865","Anandapuram","260"),
("866","Muriyad","260"),
("867","Irinjalakuda (Part)","260"),
("868","Kaduppassery","260"),
("869","Kodakara","260"),
("870","Mattathur","260"),
("871","Vellikulangara","260"),
("872","Kuttichira","260"),
("873","Kodassery ","260"),
("874","Pariyaram","260"),
("875","Elanjipra","260"),
("876","Alur","260"),
("877","Thazhekkad","260"),
("878","Kottanellur","260"),
("879","Vallivattom","260"),
("880","Karumathra","260"),
("881","Puthenchira","260"),
("882","Vadakkumbhagom","260"),
("883","Annallur","260"),
("884","Melur","260"),
("885","Kizhakkummuri","260"),
("886","Alathur","260"),
("887","Kuruvilassery","260"),
("888","Kakkulissery","260"),
("889","Thirumukkulam","260"),
("890","Trikkur (CT)","260"),
("891","Nenmenikkara (CT)","260"),
("892","Amballur (CT)","260"),
("893","Puthukkad (CT)","260"),
("894","Parappukkara (CT)","260"),
("895","Kattur (CT)","260"),
("896","Porathissery (CT)","260"),
("897","Madayikonam (CT)","260"),
("898","Kallettumkara (CT)","260"),
("899","Pullur (CT)","260"),
("900","Manavalassery (CT)","260");
INSERT INTO village VALUES
("901","Edathirinji (CT)","260"),
("902","Vellookkara (CT)","260"),
("903","Vadakkumkara (CT)","260"),
("904","Poomangalam (CT)","260"),
("905","Padiyur (CT)","260"),
("906","Thekkumkara (CT)","260"),
("907","Muringur Vadakkummuri (CT)","260"),
("908","Koratty (CT)","260"),
("909","Kallur Vadakkummuri (CT)","260"),
("910","Vadama (CT)","260"),
("911","Kallur Thekkummuri (CT)","260"),
("912","Ernakulam","250"),
("913","Kunnathunad","250"),
("914","Kodanad","250"),
("915","Kombanad","250"),
("916","Vengoor","250"),
("917","Vengoor West","250"),
("918","Asamannoor","250"),
("919","Rayamangalam","250"),
("920","Arakapady","250"),
("921","Irapuram ","250"),
("922","Mazhuvannoor","250"),
("923","Pattimattom ","250"),
("924","Kizhakkambalam","250"),
("925","Vadavukode","250"),
("926","Aikaranad North","250"),
("927","Aikaranad South","250"),
("928","Thiruvaniyoor","250"),
("929","Koovappady (CT)","250"),
("930","Chelamattom (CT)","250"),
("931","Marampilly(CT)","250"),
("932","Vazhakulam (CT)","250"),
("933","Vengola (CT)","250"),
("934","Perumbavoor (CT)","250"),
("935","Kunnathunad (CT)","250"),
("936","Puthencruz (CT)","250"),
("937","Aluva","250"),
("938","Parakkadavu","250"),
("939","Karukutty","250"),
("940","Mookkannoor","250"),
("941","Ayyampuzha","250"),
("942","Manjapra","250"),
("943","Malayattoor","250"),
("944","Thuravoor","250"),
("945","Kalady (CT)","250"),
("946","Mattoor (CT)","250"),
("947","Vadakkumbhagom (CT)","250"),
("948","Chowwara (CT)","250"),
("949","Nedumbassery (CT)","250"),
("950","Chengamanad (CT)","250"),
("951","Kizhakkumbhagom (CT)","250"),
("952","Thekkumbhagom (CT)","250"),
("953","Edathala (CT)","250"),
("954","Choornikkara (CT)","250"),
("955","Paravur","250"),
("956","Kunnukara","250"),
("957","Ezhikkara","250"),
("958","Puthenvelikkara (CT)","250"),
("959","Chendamangalam (CT)","250"),
("960","Moothakunnam (CT)","250"),
("961","Vadakkekara (CT)","250"),
("962","Karumalloor (CT)","250"),
("963","Kadungalloor (CT)","250"),
("964","Alangad (CT)","250"),
("965","Kottuvally (CT)","250"),
("966","Varappuzha (CT)","250"),
("967","Eloor (CT)","250"),
("968","Kedamangalam (OG) (Part)","250"),
("969","Kochi","250"),
("970","Kuzhuppilly","250"),
("971","Pallippuram","250"),
("972","Edavanakkad","250"),
("973","Nayarambalam","250"),
("974","Chellanam","250"),
("975","Njarackal (CT)","250"),
("976","Elamkunnapuzha (CT)","250"),
("977","Puthuvype (CT)","250"),
("978","Kumbalangy (CT)","250"),
("979","Cheriyakadavu (OG) (Part)","250"),
("980","Kanayannur","250"),
("981","Thrikkakara North (Part)","250"),
("982","Edakkattuvayal","250"),
("983","Kaippattur","250"),
("984","Kulayettikara","250"),
("985","Keecherry","250"),
("986","Kakkanad (CT)","250"),
("987","Vazhakkala (CT)","250"),
("988","Cheranallur (CT)","250"),
("989","Kadamakkudy (CT)","250"),
("990","Mulavukad (CT)","250"),
("991","Thiruvankulam (CT)","250"),
("992","Kanayannur (CT)","250"),
("993","Kureekkad (CT)","250"),
("994","Maradu (CT)","250"),
("995","Kumbalam (CT)","250"),
("996","Manakunnam (CT)","250"),
("997","Mulamthuruthy (CT)","250"),
("998","Amballur (CT)","250"),
("999","Muvattupuzha","250"),
("1000","Valakam","250");
INSERT INTO village VALUES
("1001","Mulavoor","250"),
("1002","Enanalloor ","250"),
("1003","Kalloorkkad ","250"),
("1004","Manjalloor","250"),
("1005","Muvattupuzha (Part)","250"),
("1006","Arakuzha","250"),
("1007","Marady (Part)","250"),
("1008","Memury","250"),
("1009","Ramamangalam","250"),
("1010","Maneed","250"),
("1011","Piravom","250"),
("1012","Onakkoor","250"),
("1013","Thirumarady","250"),
("1014","Palakkuzha","250"),
("1015","Koothattukulam","250"),
("1016","Elanji","250"),
("1017","Velloorkunnam (CT)","250"),
("1018","Kothamangalam","250"),
("1019","Thrikkariyoor (Part)","250"),
("1020","Kottappady","250"),
("1021","Pindimana","250"),
("1022","Kuttampuzha","250"),
("1023","Keerampara","250"),
("1024","Kuttamangalam","250"),
("1025","Neriamangalam ","250"),
("1026","Kedavoor","250"),
("1027","Pothanikkad","250"),
("1028","Varappetty","250"),
("1029","Eramalloor (CT)","250"),
("1030","Idukki ","251"),
("1031","Devikulam","251"),
("1032","Marayoor","251"),
("1033","Keezhanthoor","251"),
("1034","Kanthalloor","251"),
("1035","Kottakamboor","251"),
("1036","Vattavada","251"),
("1037","Kannan Devan Hills","251"),
("1038","Mankulam","251"),
("1039","Mannamkandam","251"),
("1040","Anaviratty","251"),
("1041","Pallivasal","251"),
("1042","Kunjithanny","251"),
("1043","Vellathuval","251"),
("1044","Udumbanchola","251"),
("1045","Konnathady","251"),
("1046","Rajakkad ","251"),
("1047","Baisonvally","251"),
("1048","Chinnakanal","251"),
("1049","Poopara ","251"),
("1050","Rajakumari","251"),
("1051","Kanthippara","251"),
("1052","Santhanpara","251"),
("1053","Chathurangapara","251"),
("1054","Vathikudy","251"),
("1055","Upputhode","251"),
("1056","Thankamony","251"),
("1057","Kalkoonthal","251"),
("1058","Parathodu","251"),
("1059","Pampadumpara","251"),
("1060","Karunapuram","251"),
("1061","Vandanmedu","251"),
("1062","Kattappana","251"),
("1063","Ayyappancoil","251"),
("1064","Anavilasam ","251"),
("1065","Chakkupallam","251"),
("1066","Anakkara","251"),
("1067","Thodupuzha","251"),
("1068","Kumaramangalam (Part)","251"),
("1069","Kodikulam ","251"),
("1070","Vannapuram","251"),
("1071","Kanjikuzhi","251"),
("1072","Udumbannoor","251"),
("1073","Neyyasseri","251"),
("1074","Karimannoor","251"),
("1075","Karikkode (Part)","251"),
("1076","Thodupuzha (Part)","251"),
("1077","Manakkad (Part)","251"),
("1078","Purapuzha","251"),
("1079","Karimkunnam (Part)","251"),
("1080","Muttom ","251"),
("1081","Alacode","251"),
("1082","Velliyamattom","251"),
("1083","Idukki","251"),
("1084","Arakkulam ","251"),
("1085","Kudayathoor ","251"),
("1086","Elappally","251"),
("1087","Peerumade","251"),
("1088","Vagamon ","251"),
("1089","Upputhara ","251"),
("1090","Elappara ","251"),
("1091","Kokkayar","251"),
("1092","Manjumala","251"),
("1093","Periyar","251"),
("1094","Kumily","251"),
("1095","Mlappara","251"),
("1096","Peruvanthanam","251"),
("1097","Kottayam","255"),
("1098","Meenachil","255"),
("1099","Veliyannoor","255"),
("1100","Monippally","255");
INSERT INTO village VALUES
("1101","Uzhavoor","255"),
("1102","Vellilappally ","255"),
("1103","Ramapuram ","255"),
("1104","Kadanad","255"),
("1105","Melukavu","255"),
("1106","Moonilavu","255"),
("1107","Poonjar Vadakkekara","255"),
("1108","Teekoy","255"),
("1109","Thalappalam","255"),
("1110","Bharananganam ","255"),
("1111","Lalam (Part)","255"),
("1112","Vallichira","255"),
("1113","Kurichithanam","255"),
("1114","Kuravilangad","255"),
("1115","Kanakkari","255"),
("1116","Elackad","255"),
("1117","Kidangoor","255"),
("1118","Puliyannoor (Part)","255"),
("1119","Meenachil (Part)","255"),
("1120","Poovarany","255"),
("1121","Kondoor","255"),
("1122","Poonjar Thekkekara","255"),
("1123","Poonjar Nadubhagam","255"),
("1124","Erattupetta (CT)","255"),
("1125","Vaikom","255"),
("1126","Chempu","255"),
("1127","Velloor","255"),
("1128","Mulakulam","255"),
("1129","Njeezhoor","255"),
("1130","Kaduthuruthy","255"),
("1131","Vadayar","255"),
("1132","Kulasekharamangalam","255"),
("1133","Vadakkemuri (Part)","255"),
("1134","Naduvile (Part)","255"),
("1135","Vaikom (Part)","255"),
("1136","Thalayazham","255"),
("1137","Vechoor","255"),
("1138","Kallara","255"),
("1139","Muttuchira","255"),
("1140","Manjoor","255"),
("1141","Kothanalloor","255"),
("1142","Arpookara","255"),
("1143","Kaipuzha","255"),
("1144","Onamthuruth","255"),
("1145","Peroor","255"),
("1146","Ayarkunnam","255"),
("1147","Akalakunnam","255"),
("1148","Chengalam East","255"),
("1149","Anikkad","255"),
("1150","Kooroppada","255"),
("1151","Manarcad","255"),
("1152","Muttampalam (Part)","255"),
("1153","Kumarakam","255"),
("1154","Thiruvarpu","255"),
("1155","Veloor  (Part)","255"),
("1156","Meenadam ","255"),
("1157","Pampady","255"),
("1158","Ettumanoor (CT)","255"),
("1159","Athirampuzha (CT)","255"),
("1160","Aimanam (CT)","255"),
("1161","Perumbaikad (CT)","255"),
("1162","Vijayapuram (CT)","255"),
("1163","Chengalam South (CT)","255"),
("1164","Nattakam (CT)","255"),
("1165","Panachikkad (CT)","255"),
("1166","Puthuppally (CT)","255"),
("1167","Changanassery","255"),
("1168","Vakathanam","255"),
("1169","Kurichy","255"),
("1170","Vazhappally Padinjaru (Part)","255"),
("1171","Changanassery (Part)","255"),
("1172","Madappally","255"),
("1173","Thottackad","255"),
("1174","Karukachal","255"),
("1175","Nedumkunnam ","255"),
("1176","Vazhoor","255"),
("1177","Kangazha","255"),
("1178","Vellavoor","255"),
("1179","Chethipuzha (CT)","255"),
("1180","Thrikkodithanam (CT)","255"),
("1181","Paippad (CT)","255"),
("1182","Kanjirappally","255"),
("1183","Koottickal","255"),
("1184","Mundakayam","255"),
("1185","Edakkunnam","255"),
("1186","Elikkulam","255"),
("1187","Elamgulam","255"),
("1188","Chirakkadavu","255"),
("1189","Cheruvally","255"),
("1190","Koovappally","255"),
("1191","Erumeli North","255"),
("1192","Erumeli South ","255"),
("1193","Manimala","255"),
("1194","Alappuzha","249"),
("1195","Cherthala","249"),
("1196","Perumbalam","249"),
("1197","Panavally","249"),
("1198","Thuravoor Thekku","249"),
("1199","Pattanakkad","249"),
("1200","Kadakkarappally","249");
INSERT INTO village VALUES
("1201","Cherthala North (Part)","249"),
("1202","Cherthala South (Part)","249"),
("1203","Mararikkulam North","249"),
("1204","Arookutty (CT)","249"),
("1205","Aroor (CT)","249"),
("1206","Ezhupunna (CT)","249"),
("1207","Kodamthuruth (CT)","249"),
("1208","Thaikattussery (CT)","249"),
("1209","Kuthiathode (CT)","249"),
("1210","Vayalar (CT)","249"),
("1211","Pallippuram (CT)","249"),
("1212","Thanneermukkam (CT)","249"),
("1213","Kokkothamangalam (CT)","249"),
("1214","Kanjikkuzhi (CT)","249"),
("1215","Muhamma (CT)","249"),
("1216","Ambalappuzha","249"),
("1217","Kalavoor","249"),
("1218","Aryad South  (Part)","249"),
("1219","Mullakkal (Part) ","249"),
("1220","Karumady  ","249"),
("1221","Purakkad","249"),
("1222","Mannanchery (CT)","249"),
("1223","Pathirappally (CT)","249"),
("1224","Komalapuram (CT)","249"),
("1225","Punnapra (OG)","249"),
("1226","Kalarkode (OG) (Part)","249"),
("1227","Kuttanad","249"),
("1228","Kainakary North","249"),
("1229","Kainakary South","249"),
("1230","Pulinkunnu","249"),
("1231","Kunnumma","249"),
("1232","Kavalam","249"),
("1233","Neelamperoor","249"),
("1234","Veliyanad","249"),
("1235","Ramankary","249"),
("1236","Champakkulam","249"),
("1237","Nedumudi","249"),
("1238","Thakazhy","249"),
("1239","Edathua  ","249"),
("1240","Muttar","249"),
("1241","Thalavady ","249"),
("1242","Karthikappally","249"),
("1243","Karuvatta","249"),
("1244","Cheruthana","249"),
("1245","Veeyapuram","249"),
("1246","Pallippad","249"),
("1247","Thrikkunnapuzha","249"),
("1248","Arattupuzha","249"),
("1249","Haripad (CT)","249"),
("1250","Kumarapuram (CT)","249"),
("1251","Karthikappally (CT)","249"),
("1252","Chingoli (CT)","249"),
("1253","Cheppad (CT)","249"),
("1254","Pathiyoor (CT)","249"),
("1255","Keerikkad (CT)","249"),
("1256","Muthukulam (CT)","249"),
("1257","Kandalloor (CT)","249"),
("1258","Puthuppally (CT)","249"),
("1259","Krishnapuram (CT)","249"),
("1260","Chengannur","249"),
("1261","Ennakkad","249"),
("1262","Pandanad (Part)","249"),
("1263","Thiruvanvandoor","249"),
("1264","Chengannur  (Part)","249"),
("1265","Mulakuzha (Part) ","249"),
("1266","Ala (Part)","249"),
("1267","Puliyoor(Part)","249"),
("1268","Cheriyanad","249"),
("1269","Venmony","249"),
("1270","Mannar (CT)","249"),
("1271","Kurattissery (CT)","249"),
("1272","Mavelikkara","249"),
("1273","Thriperumthura","249"),
("1274","Vettiyar","249"),
("1275","Thekkekara (Part)","249"),
("1276","Perungala","249"),
("1277","Chunakkara","249"),
("1278","Noornad","249"),
("1279","Palamel","249"),
("1280","Thamarakkulam","249"),
("1281","Vallikunnam","249"),
("1282","Kannamangalam (CT)","249"),
("1283","Chennithala (CT)","249"),
("1284","Thazhakara (CT)","249"),
("1285","Bharanikkavu (CT)","249"),
("1286","Kattanam (CT)","249"),
("1287","Pathanamthitta","259"),
("1288","Thiruvalla","259"),
("1289","Niranam","259"),
("1290","Kadapra","259"),
("1291","Nedumpuram","259"),
("1292","Peringara","259"),
("1293","Kavumbhagom (Part)","259"),
("1294","Kuttoor","259"),
("1295","Kaviyoor","259"),
("1296","Eraviperoor","259"),
("1297","Koipuram","259"),
("1298","Thottapuzhassery","259"),
("1299","Mallappally","259"),
("1300","Kunnamthanam","259");
INSERT INTO village VALUES
("1301","Kallooppara","259"),
("1302","Anicad","259"),
("1303","Kottangal","259"),
("1304","Perumpetty","259"),
("1305","Ezhumattoor","259"),
("1306","Thelliyoor","259"),
("1307","Puramattam","259"),
("1308","Ranni","259"),
("1309","Chethakkal","259"),
("1310","Kollamula","259"),
("1311","Perunad","259"),
("1312","Athikkayam","259"),
("1313","Pazhavangadi","259"),
("1314","Angadi","259"),
("1315","Ayiroor","259"),
("1316","Cherukole","259"),
("1317","Ranni ","259"),
("1318","Vadasserikkara ","259"),
("1319","Chittar-Seethathodu","259"),
("1320","Kozhenchery","259"),
("1321","Kulanada","259"),
("1322","Mezhuveli","259"),
("1323","Kidangannur","259"),
("1324","Aranmula","259"),
("1325","Mallapuzhassery","259"),
("1326","Elanthoor","259"),
("1327","Chenneerkara","259"),
("1328","Vallicode","259"),
("1329","Omalloor","259"),
("1330","Pathanamthitta (Part)","259"),
("1331","Naranganam","259"),
("1332","Mylapra (Part)","259"),
("1333","Malayalapuzha (Part)","259"),
("1334","Konnithazham","259"),
("1335","Pramadom","259"),
("1336","Vallicode-Kottayam","259"),
("1337","Konni","259"),
("1338","Aruvappulam","259"),
("1339","Iravan","259"),
("1340","Thannithode ","259"),
("1341","Kozhenchery (CT)","259"),
("1342","Adoor","259"),
("1343","Pandalam","259"),
("1344","Kurampala","259"),
("1345","Pandalam Thekkekara","259"),
("1346","Kodumon","259"),
("1347","Angadickal","259"),
("1348","Koodal","259"),
("1349","Kalanjoor","259"),
("1350","Enadimangalam","259"),
("1351","Ezhamkulam","259"),
("1352","Erathu","259"),
("1353","Peringanadu (Part)","259"),
("1354","Pallickal","259"),
("1355","Kadampanadu","259"),
("1356","Enathu","259"),
("1357","Kollam","252"),
("1358","Karunagappally ","252"),
("1359","Alappad","252"),
("1360","Clappana","252"),
("1361","Thazhava","252"),
("1362","Pavumba","252"),
("1363","Thevalakkara","252"),
("1364","Thekkumbhagom","252"),
("1365","Oachira (CT)","252"),
("1366","Kulasekharapuram (CT)","252"),
("1367","Adinad (CT)","252"),
("1368","Thodiyoor (CT)","252"),
("1369","Kallelibhagom (CT)","252"),
("1370","Karunagappally (CT)","252"),
("1371","Ayanivelikulangara (CT)","252"),
("1372","Vadakkumthala (CT)","252"),
("1373","Panmana (CT)","252"),
("1374","Chavara (CT)","252"),
("1375","Neendakara (OG)","252"),
("1376","Kunnathur","252"),
("1377","Sooranad North","252"),
("1378","Poruvazhy","252"),
("1379","Sasthamkotta","252"),
("1380","Sooranad South","252"),
("1381","Mynagappally","252"),
("1382","West Kallada","252"),
("1383","Pathanapuram","252"),
("1384","Pattazhy Vadakkekara","252"),
("1385","Pattazhy","252"),
("1386","Thalavoor","252"),
("1387","Vilakkudy","252"),
("1388","Pidavoor","252"),
("1389","Pathanapuram ","252"),
("1390","Punnala","252"),
("1391","Piravanthur ","252"),
("1392","Valacode (Part)","252"),
("1393","Edamon","252"),
("1394","Thenmala","252"),
("1395","Arienkavu","252"),
("1396","Kulathupuzha","252"),
("1397","Thinkalkarikkakom","252"),
("1398","Ayiranalloor","252"),
("1399","Karavaloor (Part)","252"),
("1400","Arackal","252");
INSERT INTO village VALUES
("1401","Edamulackal","252"),
("1402","Anchal","252"),
("1403","Eroor","252"),
("1404","Alayamon ","252"),
("1405","Channappetta ","252"),
("1406","Kottarakkara","252"),
("1407","Pavithreswaram","252"),
("1408","Puthur ","252"),
("1409","Kulakkada","252"),
("1410","Kalayapuram","252"),
("1411","Mylom","252"),
("1412","Melila ","252"),
("1413","Chakkuvarakkal","252"),
("1414","Vettikkavala","252"),
("1415","Neduvathoor","252"),
("1416","Ezhukone","252"),
("1417","Kareepra","252"),
("1418","Odanavattam","252"),
("1419","Ummannoor","252"),
("1420","Valakam","252"),
("1421","Elamad","252"),
("1422","Veliyam","252"),
("1423","Pooyappally","252"),
("1424","Velinalloor","252"),
("1425","Chadayamangalam","252"),
("1426","Kottukkal","252"),
("1427","Ittiva","252"),
("1428","Kadakkal","252"),
("1429","Nilamel","252"),
("1430","Kummil","252"),
("1431","Mancode","252"),
("1432","Chithara","252"),
("1433","Kottarakkara (CT)","252"),
("1434","Eravipuram (OG) (Part)","252"),
("1435","Mundrothuruth","252"),
("1436","Kizhakkekallada","252"),
("1437","Mulavana","252"),
("1438","Pallimon","252"),
("1439","Chirakkara","252"),
("1440","Paravoor (Part)","252"),
("1441","Parippally","252"),
("1442","Kalluvathukkal","252"),
("1443","Thrikkaruva (CT)","252"),
("1444","Panayam (CT)","252"),
("1445","Perinad (CT)","252"),
("1446","Elampalloor (CT)","252"),
("1447","Nedumpana (CT)","252"),
("1448","Kottamkara (CT)","252"),
("1449","Thrikkadavoor (CT)","252"),
("1450","Thrikkovilvattom (CT)","252"),
("1451","Adichanalloor (CT)","252"),
("1452","Thazhuthala (CT)","252"),
("1453","Mayyanad (CT)","252"),
("1454","Meenad (CT)","252"),
("1455","Poothakkulam (CT)","252"),
("1456","Thiruvananthapuram","261"),
("1457","Chirayinkeezhu","261"),
("1458","Edava","261"),
("1459","Ayiroor","261"),
("1460","Chemmaruthy","261"),
("1461","Navaikulam","261"),
("1462","Pallickal","261"),
("1463","Madavoor","261"),
("1464","Kudavoor","261"),
("1465","Vellalloor","261"),
("1466","Kilimanoor","261"),
("1467","Pazhayakunnummel","261"),
("1468","Pulimath","261"),
("1469","Koduvazhannoor","261"),
("1470","Nagaroor","261"),
("1471","Karavaram","261"),
("1472","Ottoor","261"),
("1473","Vettoor-Cherunniyoor ","261"),
("1474","Manamboor","261"),
("1475","Elamba-Mudakkal","261"),
("1476","Attingal-Avanavancherry (Part)","261"),
("1477","Kadakkavoor","261"),
("1478","Sarkara-Chirayinkeezhu","261"),
("1479","Alamcode (CT)","261"),
("1480","Keezhattingal (CT)","261"),
("1481","Vakkom (CT)","261"),
("1482","Kizhuvalam-Koonthalloor (CT)","261"),
("1483","Edakkode (CT)","261"),
("1484","Azhoor (CT)","261"),
("1485","Nedumangad","261"),
("1486","Nellanad","261"),
("1487","Vamanapuram","261"),
("1488","Kallara","261"),
("1489","Pangode","261"),
("1490","Peringamala","261"),
("1491","Thennoor ","261"),
("1492","Palode","261"),
("1493","Kurupuzha","261"),
("1494","Panavoor","261"),
("1495","Pullampara","261"),
("1496","Koliyakode","261"),
("1497","Manikkal","261"),
("1498","Theakada","261"),
("1499","Anad","261"),
("1500","Tholicode","261");
INSERT INTO village VALUES
("1501","Vithura","261"),
("1502","Mannoorkara","261"),
("1503","Aryanad","261"),
("1504","Uzhamalackal","261"),
("1505","Vembayam","261"),
("1506","Aruvikkara","261"),
("1507","Vellanad","261"),
("1508","Perumkulam","261"),
("1509","Veeranakavu","261"),
("1510","Vattappara (CT)","261"),
("1511","Karakulam (CT)","261"),
("1512","Kadinamkulam","261"),
("1513","Melthonnakkal","261"),
("1514","Keezhthonnakkal","261"),
("1515","Andoorkonam","261"),
("1516","Menamkulam","261"),
("1517","Veiloor (CT)","261"),
("1518","Pallippuram (CT)","261"),
("1519","Iroopara (CT)","261"),
("1520","Uliyazhathura (CT)","261"),
("1521","Sreekaryam (CT)","261"),
("1522","Kudappanakkunnu (CT)","261"),
("1523","Vattiyoorkavu (CT)","261"),
("1524","Kalliyoor (CT)","261"),
("1525","Venganoor (CT)","261"),
("1526","Kazhakkoottam(OG)","261"),
("1527","Neyyattinkara","261"),
("1528","Ottasekharamangalam","261"),
("1529","Kallikkad","261"),
("1530","Vazhichal","261"),
("1531","Amboori","261"),
("1532","Vellarada","261"),
("1533","Keezharoor","261"),
("1534","Maranalloor","261"),
("1535","Perumkadavila","261"),
("1536","Anavoor","261"),
("1537","Kunnathukal","261"),
("1538","Kollayil (Part)","261"),
("1539","Karode","261"),
("1540","Chenkal (Part)","261"),
("1541","Kulathoor","261"),
("1542","Thirupuram","261"),
("1543","Karumkulam ","261"),
("1544","Kottukal (Part)","261"),
("1545","Vizhinjam (Part)","261"),
("1546","Kovalam (OG) (Part)","261"),
("1547","Vilappil (CT)","261"),
("1548","Kulathummal (CT)","261"),
("1549","Malayinkeezhu (CT)","261"),
("1550","Vilavoorkkal (CT)","261"),
("1551","Pallichal (CT)","261"),
("1552","Athiyannur (CT)","261"),
("1553","Kanjiramkulam (CT)","261"),
("1554","Parasuvaikkal (CT)","261"),
("1555","Parassala (CT)","261");




/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
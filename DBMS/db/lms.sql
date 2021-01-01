-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 01, 2021 at 06:50 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lms`
--

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `author` varchar(11) NOT NULL,
  `dateadd` datetime NOT NULL DEFAULT current_timestamp(),
  `addedby` varchar(1000) NOT NULL,
  `isbn` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `name`, `author`, `dateadd`, `addedby`, `isbn`) VALUES
(8, 'lucy', 'Arnold', '2020-12-31 19:23:43', 'Saurabh s. Wani', '11-11111-11-4'),
(9, 'Emma Watson', 'Harmoine', '2020-12-31 19:23:43', 'Saurabh s. Wani', '11-11111-11-5'),
(10, 'Harry Porte', 'Arnold', '2020-12-31 19:23:43', 'Saurabh s. Wani', '11-11111-11-6'),
(11, 'Jonas Marth', 'Arnold', '2020-12-31 19:23:43', 'Saurabh s. Wani', '11-11111-11-7');

-- --------------------------------------------------------

--
-- Table structure for table `bookcopy`
--

CREATE TABLE `bookcopy` (
  `sr` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `copyid` varchar(11) NOT NULL,
  `status` int(11) NOT NULL,
  `prn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bookcopy`
--

INSERT INTO `bookcopy` (`sr`, `bookid`, `copyid`, `status`, `prn`) VALUES
(1, 8, '8-1', 0, 1841058),
(2, 8, '8-2', 1, 0),
(3, 9, '9-1', 0, 1841058),
(4, 9, '9-2', 1, 0),
(5, 10, '10-1', 1, 0),
(6, 10, '10-2', 1, 0),
(7, 11, '11-1', 1, 0),
(8, 11, '11-2', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `magazine`
--

CREATE TABLE `magazine` (
  `id` int(11) NOT NULL,
  `name` varchar(11) NOT NULL,
  `author` varchar(11) NOT NULL,
  `dateadd` datetime NOT NULL DEFAULT current_timestamp(),
  `addedby` varchar(1000) NOT NULL,
  `isbn` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `magazine`
--

INSERT INTO `magazine` (`id`, `name`, `author`, `dateadd`, `addedby`, `isbn`) VALUES
(93, 'lucy', 'Arnold', '2020-12-31 19:23:32', 'Saurabh s. Wani', '11-11111-11-4'),
(94, 'Emma Watson', 'Harmoine', '2020-12-31 19:23:32', 'Saurabh s. Wani', '11-11111-11-5'),
(95, 'Harry Porte', 'Arnold', '2020-12-31 19:23:32', 'Saurabh s. Wani', '11-11111-11-6'),
(96, 'Jonas Marth', 'Arnold', '2020-12-31 19:23:32', 'Saurabh s. Wani', '11-11111-11-7');

-- --------------------------------------------------------

--
-- Table structure for table `magazinecopy`
--

CREATE TABLE `magazinecopy` (
  `sr` int(11) NOT NULL,
  `bookid` int(11) NOT NULL,
  `copyid` varchar(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `prn` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `magazinecopy`
--

INSERT INTO `magazinecopy` (`sr`, `bookid`, `copyid`, `status`, `prn`) VALUES
(1, 93, '93-1', 0, 1841058),
(2, 93, '93-2', 1, 0),
(3, 94, '94-1', 1, 0),
(4, 94, '94-2', 1, 0),
(5, 95, '95-1', 0, 1841058),
(6, 95, '95-2', 1, 0),
(7, 96, '96-1', 1, 0),
(8, 96, '96-2', 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `removeddata`
--

CREATE TABLE `removeddata` (
  `id` int(11) NOT NULL,
  `removedby` varchar(1000) NOT NULL,
  `removedon` datetime NOT NULL DEFAULT current_timestamp(),
  `removeditem` varchar(1000) NOT NULL,
  `removedcount` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `sid` int(11) UNSIGNED NOT NULL,
  `Name` varchar(30) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `password` varchar(256) NOT NULL,
  `branch` varchar(40) NOT NULL,
  `image` varchar(256) NOT NULL,
  `Date` date NOT NULL DEFAULT current_timestamp(),
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Login_ip` varchar(30) NOT NULL,
  `Category` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`sid`, `Name`, `mobile`, `Email`, `password`, `branch`, `image`, `Date`, `last_login`, `Login_ip`, `Category`) VALUES
(1, 'Saurabh s. Wani', '1452587891', 'er.saurabhwani1@gmail.com', 'asdf', 'Computer Engineering', 'PicsArt_01-13-10.12.32.jpg', '2020-12-05', '2020-12-30 07:51:12', '::1', 0),
(2, 'Prasad Joshi', '1452587842', 'prasadjoshi9969@gmail.com', '1234', 'Computer Engineering', 'prasad2.jpeg', '2020-12-01', '2020-12-30 03:59:10', '::1', 0),
(3, 'Tony Stark', '4581236975', 'Tonystark@ironman.com', '1234', 'Electrical Engineering', '', '2020-12-01', '2020-12-30 03:59:22', '::1', 1),
(5, 'Bruece Banner', '9654123658', 'BrueceBanner@Hulk.com', '1234', 'Instrumentation Engineering', '', '2020-12-03', '2020-12-30 03:59:36', '', 1),
(9, 'Hannah', '1234567890', 'hannah@hannah.com', 'asdf', 'Computer Engineering', '', '2021-01-01', '2021-01-01 05:32:42', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `stid` int(11) UNSIGNED NOT NULL,
  `prn` varchar(11) NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Email` varchar(256) NOT NULL,
  `mobile` bigint(255) NOT NULL,
  `branch` varchar(30) NOT NULL,
  `admi_year` date NOT NULL,
  `status` varchar(30) NOT NULL DEFAULT '0',
  `Gender` text NOT NULL,
  `Address` longtext NOT NULL,
  `image` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student`
--

INSERT INTO `student` (`stid`, `prn`, `Name`, `Email`, `mobile`, `branch`, `admi_year`, `status`, `Gender`, `Address`, `image`) VALUES
(1, '1431039', 'Ajita Sunil Patil', 'ajitapatil15@gmail.com', 9420156972, 'Electrical Engineering', '2017-06-15', '1', 'Female', 'Shree Sai Nager ,Varangaon\nTal.Bhusawal\nDist.Jalgaon\n', ''),
(2, '1501028', 'Sachin Chandrasen kshirsagar', 'kshirsagarsachinc@gmail.com', 9130165187, 'Mechanical Engineering', '2017-06-15', '1', 'Male', 'At-awasagaon, tq-kaij, dist-beed', ''),
(3, '1521014', 'Lalit anil Dhanrale', 'dhanrale8@gmail.com', 9975766476, 'Instrumentation Engineering', '2017-06-15', '1', 'Male', 'Plot no 62 parakh nagar jalgaon', ''),
(4, '1531021', 'Mangesh Bhagwanrao Gaigodhane ', 'mangeshgaigodhane58@gmail.com', 9665044110, 'Electrical Engineering', '2017-06-15', '1', 'Male', 'Jintur', ''),
(5, '1552374', 'Ankita Surupsing Valvi ', 'valviankita23@gmail.com', 9075278716, 'Civil Engineering', '2017-06-15', '0', 'Female', 'At porambi  Tal. - Akkalkuwa \nDist - Nandurbar', ''),
(6, '1552375', 'Abhishek Nandkishor Yeole', 'abhishekyeole17@gmail.com', 7020255130, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Shiv colony Jalgaon', ''),
(7, '1601028', 'Sahil Raghunath Lekami', 'lekamisahil@gmail.com', 9420397620, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Nagpur', ''),
(8, '1611008', 'Sudarshan Vishnu Gawande', 'sudarshangawande98@gmail.com', 7083411086, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Panchavati Katol Tal.Katol Dist.Nagpur', ''),
(9, '1613304', 'Munaf Husain Tadavi ', 'munafh20@gmail.com', 8983539949, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Bhushan colony,jalgaon ', ''),
(10, '1621039', 'SHIRISH VIJAY PATNE', 'PATNESHIRISH@GMAIL.COM', 8308228503, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'A/p hanegaon , tq deglor, dist-nanded', ''),
(11, '1621045', 'Radha Vitthalrao Shinde', 'radhashinde1712@gmail.com', 7972830998, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Parbhani', ''),
(12, '1621046', 'Akash Rajendraji Soge', 'akashsoge123@gmail.com', 7741970327, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Ekta Nagar Ward no 1 wardha 442001', ''),
(13, '1631058', 'Anjali Rajesh Thool', 'anjalithool98@gmail.com', 7768871255, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Ashok nagar,sindhi meghe,thool lay out,wardha', ''),
(14, '1631060', 'Amol Datta Waghmare ', 'amolwaghmare9766@gmail.com', 8600635516, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At.post panbhosi tq.kandhar dist.nanded ', ''),
(15, '1641043', 'Tejas Nilesh  Patil ', 'tejas2512patilt@gmail.com', 8669089609, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Ashoka Hights,Anand mangal nagar,Primpala,Jalgaon', ''),
(16, '1641051', 'Pranjal Rajendra salunkhe ', 'pranjalsalunkhe5@gmail.com', 8888142869, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Dadpimpri at post bhiras ,Tal_chalisgaon, dist_Jalgaon.', ''),
(17, '1651002', 'Ashish Ashruba Autade', 'aashuautade123@gmail.com', 7709045371, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Bhushan colony, jalgaon', ''),
(18, '1651052', 'Rajveer shinde', 'shinderajveer966@gmail.com', 8805696638, 'Civil Engineering', '2017-06-15', '0', 'Male', 'AURANGABAD', ''),
(19, '1651053', 'Santram Govind Shrigire', 'santramshrigire1998@gmail.com', 7276525131, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Hari bhau nagar Nanded road Latur', ''),
(20, '1651059', 'Ramkrishna Vishwas Takmoge', 'takmogeramkrishna@gmail.com', 9588452643, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Shelgaon R,Dist.Solapur', ''),
(21, '1652302', 'Gopal Arun Patil', 'gopalpatilgp4210@gmail.com', 9545447396, 'Civil Engineering', '2017-06-15', '0', 'Male', 'A/p kurhe, Tal-Bhusawal, Dist-jalgaon', ''),
(22, '1701002', 'Nilay Murlidhar Bhaisare', 'nilaybhaisare1098@gmail.com', 7447273499, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Plot. No. 5, Tulsi Nagar, Khat Road, Bhandara', ''),
(23, '1701003', 'Bhargav Mukund Nikumbh', 'bhargavnikumbh99@gmail.com', 8975087068, 'Mechanical Engineering', '2017-06-15', '0', 'Male', '18 Abhinav Colony, Pune Road, Ahmednagar', ''),
(24, '1701005', 'Sachin Yadorao Bisen', 'bisensachin25@gmail.com', 7057718818, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Sane guruji Nagar kamtha road bangaon, Amgaon-441902', ''),
(25, '1701006', 'Ashutosh Shankar Bonde', 'ashubonde7979@gmail.com', 9834402377, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Sane guruji nagar ward no.5 wani', ''),
(26, '1701009', 'CHAUDHARI SAURABH VIKAS', 'saurabhvc99@gmail.com', 7588988935, 'Mechanical Engineering', '2017-06-15', '0', 'Male', '28, Sambhav, Jeevan Nagar, Behind Ramanand Nagar Bus Stop, Jalgaon', ''),
(27, '1701010', 'Ashutosh Basgonda Desai', 'ashutoshdesai706@gmail.com', 9579461055, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Pl.no14, gat no.343/2,indranil society,khotenagar, jalgaon', ''),
(28, '1701011', 'Shantanu Satish Devdhare', 'shantanudevdhare@gmail.com', 7744977153, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At post yusufwadgaon,tq.kaij,dist.beed', ''),
(29, '1701012', 'Kapil Sudhakar Dhage', 'kapildhage22@gmail.com', 8625881540, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Pariwar colony no.4, Keshav Nagar, Akola', ''),
(30, '1701013', 'Kunal Lomesh Dhande ', 'kunalldhande@gmail.com', 8329368811, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Yashkalp, 13, New Bhushan Colony, Jalgaon 425002', ''),
(31, '1701014', 'Shreyash Vilas Dhawale', 'dhawaleshreyash2708@gmail.com', 7038149779, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Sanjivani Paper Mill , Khetan Nagar , Kaulkhed ,Akola', ''),
(32, '1701015', 'Udit Sanjay Dubey', 'uditdubey99@gmail.com', 9146454788, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Balagi lane , jalgaon Jamod , Dist - Buldhana , 443402', ''),
(33, '1701016', 'Dvarakadas kailas shevate', 'dshewte@gmail.com', 9834259003, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'L111,mhada colony , tisgaon, Aurangabad 431136', ''),
(34, '1701017', 'Shubham Shridhar Ghadge', 'shubhamsghadge@gmail.com', 918088000000, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'D-8 shivam residency , Ambethan road chakan. Pune 410501', ''),
(35, '1701018', 'Bhagyashri Sanjay Gosavi', 'bhagyashrigsv102@gmail.com', 8788202720, 'Mechanical Engineering', '2017-06-15', '0', 'Female', ' S.k.Nagar chopda dist jalgaon', ''),
(36, '1701019', 'Hrushikesh Sanjay Gawali ', 'hrushikeshgawali99@gmail.com', 9975665867, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Near vinayak plaza sumitranagar tukum chandrapur ', ''),
(37, '1701020', 'Akshay Ganesh Ingle', 'akshaygi273@gmail.com', 9284206488, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Plot no 73B GAT no 177, Shivshankar Soc near Waghnagar Jalgaon', ''),
(38, '1701021', 'Gaurav Balaji Jadhav', 'jadhavgaurav135@gmail.com', 9834065425, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Udgir Dist.Latur', ''),
(39, '1701022', 'Mayur Manoj Jain', 'mmayurjjain@gmail.com', 7218080395, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Near chandralok lodge varangaon road opposite kamal restaurant shivaji nagar Bhusawal-425201', ''),
(40, '1701023', 'Rahul Santosh Jawanjale', 'rahul.jawanjale2017@gmail.com', 8407933823, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'thakare Galli Ansing', ''),
(41, '1701025', 'ROHIT SUDHAKAR KAMBLE', 'rk6653294@gmail.com', 9767126632, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At Borisinh Po. Rui Dist. YAVATMAL 445105', ''),
(42, '1701026', 'Shubham Anilrao khobragade', 'shubhamkhobragade72368@gmail.com', 9146254868, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Vanjari fail yavatmal Maharashtra', ''),
(43, '1701027', 'pratiksha Rajesh khot', 'khotpratiksha6@gmail.com', 7841897551, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Court road,majalgaon 431131', ''),
(44, '1701028', 'VIJAY VITTHAL LADDE', 'vijayladde123@gmail.com', 9028316881, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'RH-16/27, Bajajnagar, Waluj MIDC, Aurangabad', ''),
(45, '1701029', 'Akash Arun Mahajan', 'aaakashmahajan1@gmail.com', 9767337427, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Teachers Colony Jamner 424206', ''),
(46, '1701031', 'Tejaswini Pramod Meshram.', 'tejumeshram18@gmail.com', 9834441763, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'C/o M. W. Dahiwale, Vaishali Nagar Khat road ,Bhandara-441904', ''),
(47, '1701032', 'Nayantara Balu More', 'morenayantara9766616991@gmail.com', 9689183875, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Plot no.18 , Padmalay Nagar Erandol', ''),
(48, '1701034', 'YUGENDRA VILAS NARKHEDE ', 'yugendranarkhede@gmail.com', 9168289883, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'H. No. 2917,NARKHEDE WADA, ASODA, JALGAON ', ''),
(49, '1701035', 'Yadnyesh Gopal Nehete', 'yadnyeshnehete999@gmail.com', 9922044199, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Mauli plot no 10B, Shivaji Nagar, Faizpur. Tal-Yawal dist- Jalgaon', ''),
(50, '1701038', 'DARSHAN BABULAL PATIL', 'patildarshan417@gmail.com', 7770061750, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'DHANAI SMRUTI TAL. ERANDOL DIST. JALGAON , PIN 42109', ''),
(51, '1701039', 'Kunal Patil', 'kunalkuvar22@gmail.com', 9595625563, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Plot no 6 gat no 347 shree ram samartha colony khotenagar Stop , Jalgaon ,425001', ''),
(52, '1701040', 'Shubham Adhikar Patil', 'shubhampatil123636@gmail.com', 7758929381, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Ramnagar, Ho no.:-5/09/2370, N-2 cidco, Aurangabad', ''),
(53, '1701041', 'Nikhil Ramakant Pawar', 'nikhilpawar7745@gmail.com', 7745882780, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Plot no 9 gat no 89 panditrao colony ashababa nagar jalgaon', ''),
(54, '1701043', 'Prajakta Chandrakant Deshmukh ', 'prajaktaanu0@gmail.com', 7057852541, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'A.P. Kasarwadi, Tal- Sinnar,Dist.- Nasik', ''),
(55, '1701048', 'Sameer Sandip Vanjari', 'sameervanjari@yahoo.com', 7768955586, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Harshraj Colony, Near National High School, VMV rd, Amravati, PIN-444604 ', ''),
(56, '1701049', 'Mansee Ghansham Sanap', 'sanapmansi16@gmail.com', 9689746468, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Plot no. 13/251 Ganpati Mandir near Rameshwar colony, Mehrun, Jalgaon', ''),
(57, '1701050', 'Sayyad Ansar Afsar', 'sayyadansar0908@gmail.com', 7720968894, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At post Yellamb ghat tq ,dist Beed', ''),
(58, '1701051', 'Shraddha Balu Shegokar', 'shraddhashegokar2017@gmail.com', 8421432995, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Hudko colony Mangrulpir, dist Washim pin 444403', ''),
(59, '1701053', 'Ajay Sunil Sonar ', 'ajaysonar730@gmail.com', 9518982791, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Shivaji Nagar,Pachora,dist-Jalgaon', ''),
(60, '1701054', 'Shital Sanjay Sonar', 'shitalsonar23@gmail.com', 8208002904, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Shivaji Nagar , pachora', ''),
(61, '1701055', 'Akshay Jitendra Sonawane', 'akshaysonawanedada@gmail.com', 7743864589, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Vishwakarma Nagar, Old Dharangaon Road, Erandol Dist. Jalgaon 425109', ''),
(62, '1701060', 'Pratiksha Dnyaneshwar Theng', 'patutheng@gmail.com', 7387482729, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'At post -Khandala (M),Tq- Chikhali, Dist -Buldana', ''),
(63, '1701061', 'Venkatesh Harish Vijaykar', 'venkateshvijaykar7030@gmail.com', 9518571429, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Rajapeth Near Galaxy Hospital Amravati', ''),
(64, '1701063', 'Yugandhara Anilrao Nikam', 'yugandharanikam99@gmail.com', 9834565787, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'United recidency, near sonamata high school,saat rasta ,solapur', ''),
(65, '1711002', 'Radhika Shankarlal Agrawal ', 'coolradhika78@gmail.com', 7720033524, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Sabji Mandi near palan super market Gondia ', ''),
(66, '1711006', 'Rohit Raju Bhandare', 'rohitbhandare40@gmail.com', 7741871793, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Jalgaon', ''),
(67, '1711007', 'Govind ganpatrao bharati ', 'govindbharti1144@gmail.com', 9021212634, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At post. sonkhed dist. nanded tq. loha', ''),
(68, '1711008', 'Ankita Gajanan Bharsake', 'ankitabharsake@gmail.com', 9404094513, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'New patvari colony pardesi pura old city murtizapur', ''),
(69, '1711009', 'Hitesh Himchand Bisen', 'hiteshbisen20@gmail.com', 9518350682, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At post:Mundipar Tah: Goregaon;\nDist:Gondia', ''),
(70, '1711010', 'Dimpal Sudhakar Chaudhari ', 'dimpalc1342000@gmail.com', 7709416207, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Manak Bag, Gajanan Maharaj Nagar, Bhusawal. ', ''),
(71, '1711012', 'Krishna Sudam Damkondwar', 'krishnadamkondwar8@gmail.com', 8407933023, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At. borgaon thadi post .alandi tq. biloli dist nanded', ''),
(72, '1711013', 'Darshana Anil Mali', 'darshanamali67@gmail.com', 7410176064, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Dahiwad Tal-Amalner Dist Jalgaon Maharashtra 425001', ''),
(73, '1711016', 'Aditya Subhashrao Dharme', 'dharmeaditya@gmail.com', 7775876047, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Shivaji Nagar, Akot', ''),
(74, '1711017', 'Ashwini Chhagan Gaikwad', 'ashwinicgaikwad1999@gmail.com', 7219349563, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Shantiniketan Nagar Buldana ', ''),
(75, '1711018', 'Madhuri Dilip Hedau', 'madhurihedau1999@gmail.com', 7768996735, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Vidhya nagar,Gandhi ward,Desaiganj, pin-441207 Dist-Gadchiroli ', ''),
(76, '1711019', 'Dhanashree Ganesh Joshi ', 'dhanashreejoshi1999@gmail.com', 7517617664, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Juna satara, Bhusawal ', ''),
(77, '1711020', 'Shivprasad Kailasrao Kadam', 'shivprasadkadam450@gmail.com', 7219882749, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Cidco Nanded', ''),
(78, '1711021', 'Akshay Bandu Kangude', 'akangude1191@gmail.com', 9764954920, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Jayakwadi vasahat, Georai, Beed', ''),
(79, '1711023', 'Ajit Ledange', 'ajitledange123@gmail.com', 8999143223, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At kalmula tq purna dist parbhani', ''),
(80, '1711028', 'Rahul bhagwat more', 'rahulmore02016@gmail.com', 9168589229, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At mahukheda post khadki tal jamner dist Jalgaon State Maharashtra', ''),
(82, '1711032', 'Ajaysing Vijaysing Pardeshi', 'apardeshi243@gmail.com', 8830483177, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At Betawad Kh., Tal Jamner, Dist Jalgaon 425310.', ''),
(83, '1711037', 'Rashi sanjay Kuber', 'rashikuber844@gmail.com', 7083332269, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Beltarodi road Nagpur', ''),
(84, '1711038', 'Sanket shyam Raut', 'sanketraut384@gmail.com', 9834216850, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At palodi tq darwha dist yavatmal', ''),
(85, '1711040', 'Kshitij rokade', 'kshitijrokade1@gmail.com', 9527337552, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Wardha ', ''),
(86, '1711041', 'Sachin balaji Sontakke', 'sachinsontakke0168@gmail.com', 7517031381, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Mu Ambegaon post lahan tq ardhapur dist nanded', ''),
(87, '1711044', 'Sangam Sudhakar shinde', 'sangamshinde1234@gmail.com', 7028562954, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Kahala (KH) dist nanded sub-dist naigaon', ''),
(88, '1711047', 'Akshay Sanjay Savdekar', 'akshaysavdekar18@gmail.com', 7057916398, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', '14th A, Telephone Nagar, near church jalgaon', ''),
(89, '1711048', 'Satyam Vilas Shete', 'satyamshete06@gmail.com', 7038594648, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Khamgaon', ''),
(90, '1711049', 'Rohit Satish Shinde', 'shinderohit679@gmail.com', 9552807978, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Jalgaon', ''),
(91, '1711050', 'Shreya Prakash Hatwar', 'shreyahatwar15@gmail.com', 7218277899, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', '7, Adarsh Nagar, Wadi, Nagpur-440023', ''),
(92, '1711054', 'Dhanshri balaji tandle', 'dhanshri22tandle@gmail.com', 9730328422, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Lecture colony gangakhed,dist parbhani', ''),
(93, '1711055', 'Shivam Sopan Todsam', 'todasamshivam2375@gmail.com', 9075687052, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Behind government godown khadan akola', ''),
(94, '1711057', 'Prathmesh Vilasrao Wankhade', 'prathmeshw7887@gmail.com', 9552439583, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Shikshak colony ward no 5 Teosa,Ta Teosa 444903,Dist Amravti', ''),
(95, '1711058', 'Nikita Krishna Wayal', 'nikitawayal99@gmail.com', 7588666147, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Pawar colony,partur.', ''),
(96, '1721001', 'Adesh Ashok Akare', '26adesh@gmail.com', 917057000000, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'C/o Shravan Hajare, Asma Nagar, Bhojapur road, Takiya ward, Bhandara-441904', ''),
(97, '1721002', 'Apoorva Narendra Bhalerao', 'bhaleraoapoorva1@gmail.com', 1721002, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Modikhana, Jalna', ''),
(98, '1721003', 'Chaitali Sanjay Avhad', 'Chaitaliavhad99@gmail.com', 9067909894, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', '333, satpur colony, satpur nashik', ''),
(99, '1721004', 'Ritesh Vitthalrao Badki ', 'riteshbadki17@gmail.com', 7517997206, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At. Majara Post chopan ta maregaon dist yavatmal ', ''),
(100, '1721007', 'Vinay Dilip Bedarkar', 'vinaybedarkar@gmail.com', 8275826738, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Vidhya nagar selu Dist parbhani ', ''),
(101, '1721009', 'Devraoji Shrutika Chimane', 'chimaneshrutika@gmail.com', 9284029397, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Old Mhada Colony near ITI College MIG-96/ 18, Wardha', ''),
(102, '1721012', 'Dipak Uttam Hambarde', 'dipakhambarde98@gmail.com', 7447823055, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At Post Waka Tq. Loha Dist. Nanded', ''),
(103, '1721014', 'Hrushikesh Patil', 'phrushikesh8@gmail.com', 9834559102, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', '22,Suyog nagar, Darwha Road, Yavatmal 445001', ''),
(104, '1721015', 'Rahul Ravindra Jadhav ', 'rjadhav223@gmail.com', 9145317692, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Flat no 5 Kunturkar Plaza Kabra nagar Nanded', ''),
(105, '1721016', 'ANAND NILKANTHRAO KENDRE', 'anandkendre51199@gmail.com', 9518910884, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At post kumtha khurd,tq udgir,dist .latur, Maharashtra-413517', ''),
(106, '1721017', 'Vaishnavi Sunil Kharche ', 'kharchevishu23@gmail.com', 8329017828, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Kolhe nagar near police station jalgaon ', ''),
(107, '1721018', 'Pande Krishna Shyam', 'kpande352@gmail.com', 8208605990, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Ganesh Nagar Nanded', ''),
(108, '1721019', 'Chinmay Santosh Kulkarni', 'chinmaykulkarni901@gmail.com', 8208260895, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Bhakti Construction, Eknath Nagar , Beed', ''),
(109, '1721020', 'Lukeshni Suresh Nasare', 'lukeshaninasare@gmail.com', 7775894689, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Sadguru Complex Plot no 10 IUDP KATOL, District NAGPUR ', ''),
(110, '1721021', 'Nilesh Gautam Tulse', 'nileshtulse212@gmail.com', 7219031380, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At Jay Bhim Nagar, Tq:Nanded, Dist:Nanded-431602.', ''),
(111, '1721022', 'Sharad Rameshrao Pawar', 'spawarpatil9@gmail.com', 7218285077, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Balaji nager, Basmath Di:-Hingoli', ''),
(112, '1721023', 'Shrirang Shyam Pendke', 'shrirangpendkes@gmail.com', 9096701292, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Near, Rashtriya Samajik Vidyalay,Mude le out, arvi road, post Manas Mandir, Wardha-442001', ''),
(113, '1721026', 'Nikhil Dnyaneshwar Sahare', 'nikhilsahare1258@gmail.com', 8668627569, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Gadchiroli', ''),
(114, '1721027', 'Aditya hari sakhare', 'adityasakhare5487@gmail.com', 7218875673, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Parbhani, Maharashtra ', ''),
(115, '1721028', 'SAMADHAN GANGADHAR RAWALE', 'samr63372@gmail.com', 7719928132, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'AT POST KHADKI BAZAR TQ-HIMAYATNAGAR DIST-NANDED', ''),
(116, '1721030', 'Saurabh Narendra Karwande', 'sauravkarwande007@gmail.com', 9021175528, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Nanded', ''),
(117, '1721031', 'Sahil shegokar', 'sahilshegokar365@gmail.com', 7507796971, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Akola', ''),
(118, '1721032', 'Manoj Arun Shendre', 'manojshendre234@gmail.com', 8788670448, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Naik talav near Hera zenda nagpur', ''),
(119, '1721033', 'Shirde Jaipal Ganesh ', 'shirdejaipal7@gamil.com', 9923153918, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At.takbid post. Degaon dist. Nanded 431709', ''),
(120, '1721034', 'Snehal Dilip Solunke', 'snehalds1999@gmail.com', 7972533986, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Plot no.48/a Mohan Nagar jalgaon', ''),
(121, '1721036', 'Gajanan Rajebhau Takmoge', 'takmogegajanan@gmail.com', 9561597799, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'at pokhari tq.dis.Beed', ''),
(122, '1721038', 'Akshay Samadhan Walkhad', 'akshaywalkhad@gmail.com', 8788560993, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At Post - Ghodasgaon Tal - Muktainagar Dist - Jalgaon', ''),
(123, '1731001', 'Amol  Tarachand Dhole', 'amoldhole2572@gmail.com', 9284993027, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At.Gawandi,Post.Umari ,Tah.Karanja,Dist.Wardha.', ''),
(124, '1731002', 'Apeksha Nandkumar Sarode', 'apekshasarode28@gmail.com', 9561611475, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At - post k.k.nagar, Shitalwadi , Ramtek, Nagpur', ''),
(125, '1731003', 'Swapnil Sanjay Baviskar', 'durgeshbaviskar3399@gmail.com', 8485036126, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Shivaji nagar shendurni', ''),
(126, '1731005', 'Bhatane Dattatray Madhukar', 'dattatraybhatane99@gmail.com', 8766511532, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At Bhatanwadi po ujani dist Beed Maharashtra', ''),
(127, '1731006', 'Shital Jagdish Chalmelwar', 'shital.chelmelwar@gmail.com', 7720043144, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Sadashiv Niwas, Pratap galli, Himayatnagar dist:Nanded', ''),
(128, '1731007', 'Pritesh Deelip Chavan', 'priteshdchavan82@gmail.com', 9284256494, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Bhadgaon Dist-Jalgaon', ''),
(129, '1731008', 'Prasad Panditrao Deshmukh', 'prasadpdeshmukh88@gmail.com', 9421826900, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'N 9 k 18/2pawan nagar Cidco Aurangabad', ''),
(130, '1731009', 'Dhondarkar Shrinath Haribhau', 'shrinathdhondarkar111@gmail.com', 7028168990, 'Electrical Engineering', '2018-06-15', '0', 'Male', '33 sanmitra colony, karegaon road, Parbhani', ''),
(131, '1731011', 'Mrudula Deelip Ekhe', 'mrudula8377@gmail.com', 8446621373, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Weekly Market New area ward, Bhusaval', ''),
(132, '1731012', 'Santosh Balaji Gade', 'santoshg8373@gmail.com', 7083667344, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Tirupati Society Dhanegaon At post Cidco Nanded', ''),
(133, '1731013', 'Nikita Madhavrao Gadge', 'nikita.gadge5131@gmail.com', 9049105131, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At. Khairgaon, Tq. Ardhapur, Dist. Nanded', ''),
(134, '1731014', 'Vishal Ravsaheb Gadhave', 'vishalgadhave4352@gmail.com', 9284959647, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At. dhakephal tq .ghanasawangi dist.jalna', ''),
(135, '1731015', 'Yogesh Dattatraya Gaikwad', 'ygaikwad070@gmail.com', 8308398486, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Navin Kaigaon\nGANGAPUR\nAurangabad \n431110', ''),
(136, '1731016', 'ASHWINI MANOHAR GAJALWAR ', 'ashwinigajalwar009@gmail.com', 9834850660, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Sahakar nagar Rampur, Sasti Road, Rajura Ta.Rajura, Dist. Chandrapur, state maharashtra, 442905 ', ''),
(137, '1731019', 'Vaishnavi Vivekanand Gawande', 'vaishnavigawandeoct@gmail.com', 8208033136, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At. Post. Dhotardi\nTq.Dist.Akola', ''),
(138, '1731020', 'Gayatri Ravindra Gunjate ', 'gayatrigunjatejbn@gmail.com', 7875142647, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Shanti Nagar Karanja Lad', ''),
(139, '1731021', 'Shubhangi Baban Ghuge', 'shubhangighuge05@gmail.com', 9146073826, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At post Dusarbid Ta. Sindhkhed Raja Di.buldhana', ''),
(140, '1731025', 'YOGESH ASHOK INGOLE', 'yingole358@gmail.com', 917888000000, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At Post Kekatumara Tq Dist washim', ''),
(141, '1731026', 'Rohit joshi', 'bhdream000@gmail.com', 8381056384, 'Electrical Engineering', '2017-06-15', '0', 'Male', '10 Narayan nagar biba nagar jalgaon', ''),
(142, '1731027', 'Roshani Nivrutti Karade', 'karadern2016@gmail.com', 7378830714, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At Post Jalgaon(Ni.), Malegaon, Nashik', ''),
(143, '1731028', 'Vaibhav shivaji karale', 'vaibhavkarale2005@gmail.com', 9604553617, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At post sawargaon, tal jalgaon jamod , dist buldhana', ''),
(144, '1731032', 'Swarup Laxmikant Kulkarni', 'swarupkulkarni007@gmail.com', 8379049752, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Beed', ''),
(145, '1731034', 'Dnyaneshwar Ramakant Mane', 'dnyaneshwar27699@gmail.com', 8007851772, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At post talni tq Renapur dist Latur', ''),
(146, '1731035', 'Manjusha Ramesh Patil', 'manjusha301199@gmail.com', 9049572474, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Bhushan colony, jalgoan', ''),
(147, '1731036', 'Himanshu Arun Meshram', 'meshramhimanshu05@gmail.com', 7972013254, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Vidhyut colony jalgaon ', ''),
(148, '1731037', 'Ashwini Vishwanath More', 'more49130@gmail.com', 9130751492, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At.Kamtha ,Tq.Kalamnuri,Dist.Hingoli 431702', ''),
(149, '1731038', 'Omkar Ravsaheb More', 'moreomkar2017@gmail.com', 9011242185, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At kamtha Tq. kalamnuri Dist.Hingoli', ''),
(150, '1731039', 'Dhanraj Vaijnath Munde ', 'munde.dhanraj7777@gmail.com', 9511800332, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'TPS colony parli tq parli', ''),
(151, '1731041', 'Piyush Sudhakar Neel', 'piyushneel9765543643@gmail.com', 9765543643, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Saraswati Colony, Chalisgoan Road, Kannad, Dist. Aurangabad', ''),
(152, '1731042', 'Prishita Vishwambar Patil ', 'prishitapatil1129@gmail.com', 8379091255, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Hind nagar,ward no 37 ,wardha', ''),
(153, '1731043', 'Nikita Vinayak Pawar', 'tau30pawar@gmail.com', 7038850904, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Plot no 28 b, Talathi colony, Bhadgaon road, Pachora,District Jalgaon', ''),
(154, '1731044', 'Pranav Ashok Potdar', 'ppotdar08@gmail.com', 9657047510, 'Electrical Engineering', '2017-06-15', '0', 'Male', '16 B Ashok Nagar Dhule', ''),
(155, '1731045', 'Rahul potpallewar', 'rahulpotpallewar23@gmail.com', 8855869335, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Omkar nagar pathri dist parbhani', ''),
(156, '1731046', 'Prashik Bhimrao Adole ', 'prashikadole910@gmail.com', 8999038153, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'G-113 ACW Colony Awarpur, Chandrapur ', ''),
(157, '1731048', 'Pavan Ashok Raut', 'pavanraut911@gmail.com', 8421597035, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Jalgaon', ''),
(158, '1731049', 'Rohit Ashokrao Bhele', 'rohit.bhele1749@gmail.com', 8308407701, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Navin Bhagwan Nagar , Jalgaon.', ''),
(159, '1731051', 'Bhagyashree Nandakishor Shelar', 'bhagyashreesh99@gmail.com', 9766676746, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'AP.:Bhenda,Tq.:Newasa,Dist.Ahmednagar ', ''),
(160, '1731052', 'Siddiqui Maroof Abdul Malik ', 'maroof.siddiqui18@gmail.com', 8669004240, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Flat no 5, Sana plaza, Bhadkal gate, Aurangabad ', ''),
(161, '1731053', 'Sukanya Ganesh Suralkar', 'sukanyasuralkar15@gmail.com', 8421100185, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Plot no.26,parvati nagar,Jalgaon', ''),
(162, '1731058', 'Trupti Suresh Barsagade ', 'truptibarsagade23@gmail.com', 9881324789, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'MS-1,Diamond Leaf Appartment, near Major Gate, Durgapur road, Chandrapur ', ''),
(163, '1731059', 'Vedant Sunilrao Nagpure', 'vedantnagpure555@gmail.com', 9834231674, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Ambulkar Lay-out, Warud,post-sewagram, district- wardha', ''),
(164, '1731060', 'Nilakshi Bipin Wani ', 'nilakshiwani13@gmail.com', 7773969892, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Wani Niwas, Wani Square, Karanja Lad,Washim ,444105', ''),
(165, '1741001', 'Akshay Rajendra Wankhede ', 'akshay11wankhede@gmail.com', 8806592630, 'Computer Engineering', '2017-06-15', '0', 'Male', 'at post dongaon tq. Mehkar dist. Buldhana', ''),
(166, '1741004', 'Ayush Vikas Oberoi', 'ayushoberoi55@gmail.com', 7020045185, 'Computer Engineering', '2017-06-15', '0', 'Male', '203 Royal Palace C, Boregaon Road, Gittikhadan, Katol Road, Nagpur', ''),
(167, '1741007', 'Ishwar Suresh Bankar', 'ishwarbankar6120@gmail.com', 9657013134, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At Post pahur kasbe Tal Jamner Dist Jalgaon', ''),
(168, '1741008', 'Nainika Milind Barhate', 'nainikabarhate@gmail.com', 7720834624, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Plot no.37,Gat no.76/1/2,Kolhe Nagar,Jalgaon', ''),
(169, '1741010', 'Kiransing Bandusing Bhat', 'kiransingbhat1998@gmail.com', 8999025679, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Anand nagar , near mnp school no 05 , latur', ''),
(170, '1741015', 'Neha krushna Chavan', 'nehachavan040@gmail.com', 7385595080, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Shakuntala nagar, Jalna', ''),
(171, '1741017', 'Pavan Ganesh Datkar', 'pavandatkar007@gmail.com', 7507405141, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At Hingni Bk, Post-Dahihanda, Taluka-Akola, District-Akola', ''),
(172, '1741018', 'Kunal Dhanushyakar', 'kunaldhanushykar15aug@gmail.com', 918788000000, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Gadchiroli, Maharashtra ', ''),
(173, '1741019', 'Shreyas Manoj Fegade', 'smfegade2799@gmail.com', 9404341181, 'Computer Engineering', '2017-06-15', '0', 'Male', '16,laxman nagar, Pimprala Road, infront of Bajrang Railway tunnel, Jalgaon. ', ''),
(174, '1741020', 'Kaustubh girnale ', 'kaustubhgirnale.kg@gmail.com', 8007583711, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Abhinav colony , achalpur...tq -achalpur , dist- amravati ', ''),
(175, '1741021', 'DATTA PRASAD GORE', 'dattagore27@gmail.com', 9168303084, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At Post Bori , Tal. Jintur Dist. Parbhani', ''),
(176, '1741022', 'NEHA VASANT JAIN', 'jain.neha0108@gmail.com', 7219009108, 'Computer Engineering', '2017-06-15', '0', 'Female', 'At post mandal, Tal- Amalner Dist -Jalgaon', ''),
(177, '1741024', 'Mrunal Milind Janbandhu', 'mrunalj1999@gmail.com', 8830462071, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Ekta Nagar Kardha Bhandara - 441924', ''),
(178, '1741025', 'Janhavi Vikas Shivankar', 'janhavishivankar@gmail.com', 7420904007, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Vidya Nagar, Nagpur Road, Bhandara', ''),
(179, '1741026', 'Maheshwari Shankar Kale', 'mahikale28@gmail.com', 9146191977, 'Computer Engineering', '2017-06-15', '0', 'Female', 'vidya nagar,selu', ''),
(180, '1741027', 'Animesh Madhu Kharabe', 'animeshkharabe03@gmail.com', 8766405371, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At. Manegaon,Lakhani, Bhandara 441804', ''),
(181, '1741029', 'Khole Rohit Parasram ', 'kholerocky9656@gmail.com', 9322297549, 'Computer Engineering', '2017-06-15', '0', 'Male', 'A/p - Rakshasabhuvan, Shirur, Beed, 413249.', ''),
(182, '1741034', 'Mrudula Arvind Mahajan', 'mrudulamahajan28@gmail.com', 9028632889, 'Computer Engineering', '2017-06-15', '0', 'Female', '12 b parijat colony, mahabal, jalgaon', ''),
(183, '1741037', 'Padvi Tapsing Kirta', 'padvitapsing@gmail.com', 9420461730, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At Goramba post Toranmal Tal Akrani Dist Nandurbar', ''),
(184, '1741038', 'ASHUTOSH GAJANAN PARIHAR', 'ashutoshparihar0@gmail.com', 9834129997, 'Computer Engineering', '2017-06-15', '0', 'Male', 'At post Hatni Ta chikhli dist buldana', ''),
(185, '1741039', 'Pranali uddhao patil', 'pranalip080@gmail.com', 8788250208, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Satyam Nagar jaitala road Nagpur', ''),
(186, '1741040', 'Pavan A. Sidam', 'pavansidam656@gmail.com', 7083332001, 'Computer Engineering', '2017-06-15', '0', 'Male', 'house no:1597\nshivaji nagar (near gurukul convent)\nKARANJA (GHADGE), MAHARASHTRA 442203\nIndia', ''),
(187, '1741043', 'Rajkumar Kundan Jumde', 'rajjumde10@gmail.com', 7875621992, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Near Durga Mata Mandir, Hanuman Nagar,Tukum , Chandrapur', ''),
(188, '1741044', 'Rachi Ramanand Rangari ', 'rachirangari1999@gmail.com', 9096944928, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Dayal Nagar wardha ,ward no 39', ''),
(189, '1741045', 'Diksha Rajkumar Raut', 'diksharaut1020@gmail.com', 9518577230, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Nehru ward Dewhadi\nDist. Bhandara\n', ''),
(190, '1741046', 'Saloni Sanjiv Chaudhari', 'salonisanjivchaudhary@gmail.com', 7588009848, 'Computer Engineering', '2017-06-15', '0', 'Female', 'At post Amode Tal-Yawal Dist- Jalgaon', ''),
(191, '1741049', 'Sanjana Manoj Bhandarkar ', 'sanjanambhandarkar@gmail.com', 9860386335, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Shani chauk,sayyad wada,Bhadagaon. ', ''),
(192, '1741050', 'Ketan Dilip Sawant', 'ketansawant159@gmail.com', 8378827927, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Plot no.76, Namrata Nagar ,Erandol', ''),
(193, '1741051', 'Sayali Sanjiv Chaudhari', 'sayalisanjivchaudhari@gmail.com', 9665417348, 'Computer Engineering', '2017-06-15', '0', 'Female', 'At post Amode Tal-Yawal Dist- Jalgoan', ''),
(194, '1741053', 'Shraddha Satish Thakre ', 'shraddhathakre2016@gmail.com', 9422373857, 'Computer Engineering', '2017-06-15', '0', 'Female', 'SHRADDHASUMAN\' CHINTAMANI NAGARI NEAR OLD MHADA COLONY WARDHA ', ''),
(195, '1741054', 'Siddharth Shankar Debata', 'siddharth.1526@rediffmail.com', 8999158968, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Air Force Station Suratgarh', ''),
(196, '1741055', 'sachin gopal solanke', 'misolanke57@gmail.com', 8766761703, 'Computer Engineering', '2017-06-15', '0', 'Male', 'sita gita appartment ,sudhir colony,akola', ''),
(197, '1741056', 'Sagar Shankar Sonar', 'sonarsagarvat@gmail.com', 9518976940, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Swami Vivekanand Nagar Bodwad (425310)', ''),
(198, '1741057', 'Sonal Baliram Sonawane', 'sonalsonawane2000@gmail.com', 9834053897, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Plot no. 13, Devidas Colony, Behind lathi school, Jalgaon', ''),
(199, '1741058', 'Suryakant Jiyalal Sinha', 'suryakantsinha945@gmail.com', 9860111273, 'Computer Engineering', '2017-06-15', '0', 'Male', 'A03, adarsh nagar, achole road, nallasopara east, thane- 401209', ''),
(200, '1741062', 'Mohd Asmail', 'mohdasmailkth2000@gmail.com', 447007000000, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Jalgaon', ''),
(201, '1751001', 'Abhinay Sonawane', 'abhinaysonawane10@gmail.com', 919004000000, 'Civil Engineering', '2017-06-15', '0', 'Male', 'kalpataru society G-2 3-2 sector 14 Airoli Navi Mumbai', ''),
(202, '1751002', 'Adwet Kewalram Gondane', 'adwetgondane@gmail.com', 9146674734, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Ward no. 16 chichgad road deori -441901, dist- gondia', ''),
(203, '1751004', 'Lalit Prakash Bawankar', 'l.p.bawankar@gmail.com', 9511872273, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Q. No. E-2/13, Vainganga Nager, Ajni, Nagpur - 440003', ''),
(204, '1751005', 'Prashant Ramdas Bhise ', 'bhisepr29@gmail.com', 7218498401, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Pathardi, Ahmednagar ', ''),
(205, '1751006', 'Pratyush Sanjay Bodele', 'pratyushbodele@gmail.com', 7709951973, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Q. No. E/1Akashwani colony,ring road, Jalgaon 425001', ''),
(206, '1751007', 'Revati Santram Buwa', 'buwarevati27@gmail.com', 8237558991, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Gurudatta nagar jalgoan', ''),
(207, '1751008', 'Khushboo Sanjay charhate', 'khushboocharhate3@gmail.com', 8482922820, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Plot no :-29 ayodhya Nagar , jalgaon', ''),
(208, '1751009', 'Akash Gajanaan chaudhari ', 'akashchaudhari3333@gmail.com', 9096634380, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Bodwad Jalgaon ', ''),
(209, '1751010', 'Ashwini Megharaj Chaudhari', 'ashwinichaudhari633@gmail.com', 7066876711, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Ravanje Bk,Tal.Erandol,Dist.Jalgaon', ''),
(210, '1751011', 'Mahesh Prabhakarrao Chaudhari ', 'mahesh_chaudhari1@outlook.com', 9404253177, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Ward No 3, Satnur, Warud, Amravati, Maharashtra Pin Code: 444907', ''),
(211, '1751014', 'Dakhane Abhilash Kashinath', 'abhilashdakhane123@gmail.com', 9834123816, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At Ubda Post Jam Taluka Samudrapar District Wardha', ''),
(212, '1751015', 'Shivaji Satish Deshmukh', 'deshmukhshivaji2016@gmail.com', 9284025536, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Ghayal Nagar , Old jalna , jalna', ''),
(213, '1751016', 'Aniket Dhabe', 'aniketdhabe048@gmail.com', 9420254533, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Dhawne wadi, Dhamangaon Rly, Amravati, Maharashtra', ''),
(214, '1751017', 'Krishna Mahadev Gadhave', 'krishnagadhave9767@gmail.com', 9767652235, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At post chorakhali ta kalamb Dist-Osamanabad', ''),
(215, '1751018', 'Gautam Dhanaji Ghadge', 'gautamdhanajighadge1999@gmail.com', 9284212198, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At.Aher wadgaon post Pali taluka Beed District Beed', ''),
(216, '1751020', 'Trisheela Vivekanand Jambhulka', 'trisheela1302@gmail.com', 7745859379, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Mahadev Nagar, Sharma layout, Pandharkawada. Dist- Yavatmal', ''),
(217, '1751022', 'Vinayak Bapurao Kakde', 'vinayakkakde90@gmail.com', 7517259861, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Maroti nagar selu district Parbhani', ''),
(218, '1751023', 'Prerna Chunnilal Karanjekar ', 'prerna1999kar@gmail.com', 7264866022, 'Civil Engineering', '2017-06-15', '0', 'Female', 'At, Vijay nagar, Balaghat road, Gondia ', ''),
(219, '1751024', 'Anand dnyaneshwar khadke', 'anandkhadke2016@gmail.com', 9636966566, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Chikhli dist. Buldana', ''),
(220, '1751025', 'PRANAV LILADHAR KURKURE ', 'kurkurepranav2016@gmail.com', 8275490914, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Plot no 26 nutan varsha colony jalgaon ', ''),
(221, '1751028', 'Mohammad Faizan Ansari', 'faizaniqbal2016ansari@gmail.com', 8378817554, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Near ADB Bank , juni chawdi Balapur, district Akola', ''),
(222, '1751030', 'Sumit Baburao Naykude', 'sumitnaykude123@gmail.com', 7030121921, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At. Chinchkheda Khu. Post.chapaner Tq. Kannad , Dist. Aurangabad ', ''),
(223, '1751031', 'Chunauti Kushidhar Nehete ', 'chunauti.nehete@gmail.com', 9834470597, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Plot no 60,Panchamukhi hanuman temple near, jalgaon', ''),
(224, '1751032', 'Pushkraj Anil Nemade', 'nemadepushkraj@gmail.com', 9657194869, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Gajanan Housing Society Plot 4 Jalgaon Maharashtra', ''),
(225, '1751034', 'Mangesh Konduba Pandit', 'mangeshkpandit3335@gmail.com', 9067279377, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Ram Nagar Chincholkar Lay Out Buldana ', ''),
(226, '1751035', 'Sanjay Rajabhau Patait', 'sanjay9168743739@gmail.com', 9168743739, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At post-vida,\n Tq-Kaij,\n Dist-Beed.\nPin code 431122', ''),
(227, '1751036', 'Harshada pandharinath patil', 'harshadapatil231999@gmail.com', 8605189065, 'Civil Engineering', '2017-06-15', '0', 'Female', '16,chintamani morya nagar, Dharangaon', ''),
(228, '1751037', 'Mayuri subhash patil', 'mayuripatil3366@gmail.com', 7517981080, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Nivrutti nagar ,jalgaon', ''),
(229, '1751038', 'Pranali Sahebrao Patil', 'pranalispatil1999@gmail.com', 7263847249, 'Civil Engineering', '2017-06-15', '0', 'Female', 'At. Post Chopda, Taluka- Chopda District-Jalgaon', ''),
(230, '1751039', 'Taterao motiram pawar', 'tateraopawar04@gmail.com', 7066662105, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At. Khoras tq. Palam dist. Parbhani', ''),
(231, '1751040', 'Angad Keshavrao Raut ', 'rautangad1999@gmail.com', 7218997215, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At post WASSA taq. Jintur dist. Parbhani ', ''),
(232, '1751041', 'Rohini Ankush Deshmukh', 'deshmukhrohini999@gmail.com', 9130454372, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Balaji nagar, mehkar', ''),
(233, '1751042', 'Roshni Dnyaneshwar Rewatkar', 'roshni11rdr@gmail.com', 9834659209, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Ballarpur, Dist--Chandrapur', ''),
(234, '1751043', 'Rushabh Satishrao Khosare', 'rushabhkhosare@gmail.com', 9158604604, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At post Galle Borgaon,Tq Khultabad, Dist Aurangabad', ''),
(235, '1751044', 'Shrikant Ratan Sable ', 'sablesr98@gmail.com', 8767464061, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At Post Dongargan ,Tq- Ashti Dist -Beed 414202', ''),
(236, '1751045', 'vidhyasagar sureshrao sagar', 'svidhyasagar71@gmail.com', 9146993992, 'Civil Engineering', '2017-06-15', '0', 'Male', 'at post udgir tq. udgir, dist.latur, shallal road near kohinur ice factory', ''),
(237, '1751046', 'Pooja Rajendra Sarode', 'poojasarode231@gmail.com', 7066545652, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Aurangabad ,cidco mahanagar 1', ''),
(238, '1751047', 'Shubhangi Suresh Madavi', 'shubhangimadavi3@gmail.com', 9067381297, 'Civil Engineering', '2017-06-15', '0', 'Female', 'At warora,  dist.chandrapur', ''),
(239, '1751049', 'Akshay Dipak Sonawane', 'akshaydipaksonawane@gmail.com', 8329483411, 'Civil Engineering', '2017-06-15', '0', 'Male', '15 A Donde colony deopur dhule', ''),
(240, '1751050', 'Nachiket Gopikrishna Sonawane ', 'sonawanenachiket1091@gmail.com', 9860238133, 'Civil Engineering', '2017-06-15', '0', 'Male', '65, Dr. Zakir Husain colony, Jalgaon ', ''),
(241, '1751051', 'Santosh Vitthal Sontakke', 'svs9860011592@gmail.com', 9860011592, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Ganpur,purna, parbhani, Maharashtra', ''),
(242, '1751052', 'Shubham Devidas Sayam', 'shubhamsayam44@gmail.com', 9595142282, 'Civil Engineering', '2017-06-15', '0', 'Male', 'T Point Chowk MIDC Road Navegaon Complex,Gadchiroli', ''),
(243, '1751053', 'Darshan Haribhau Surwade', 'darshansurwade001@gmail.com', 9309103105, 'Civil Engineering', '2017-06-15', '0', 'Male', 'S.no 468/1B/4, vidyut jafari, mahabal , jalgaon', ''),
(244, '1751056', 'Sarika Shabbir Tadavi', 'sarikatadvi31@gmail.com', 9657464775, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Digamber housing society near ramand nagar, Jalgaon', ''),
(245, '1751057', 'Aniket Suryakant Tikar', 'atikar099@gmail.com', 9689341853, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Dis.Buldhana Tal.khamgaon', ''),
(246, '1751058', 'Trupti Shankar Giradkar', 'giradkartrupti4@gmail.com', 1751058, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Visapur dist Chandrapur Maharashtra', ''),
(247, '1751059', 'Tushar Ganeshrao Maliye', 'tusharmaliye59@gmail.com', 9021235698, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At post sorta, Tah Arvi, Dist. Wardha', ''),
(248, '1751061', 'Krishnakant balaji uttarwar', 'krishnakantuttarwar208@gmail.com', 7218771924, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Nanded', ''),
(249, '1751063', 'Mitali Chandramani Wahane', 'mitaliwahane0732@gmail.com', 8698210052, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Chatrapati choulk, nanded', ''),
(250, '1801001', 'AASIM RAZA ', 'aasimrazamorshi@gmail.com', 9766613006, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Jawahar colony morshi. Dis.  Amravati', ''),
(251, '1801002', 'Jay Agrawal ', 'jayagrawal0000@gmail.com', 7887654762, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Washim', ''),
(252, '1801003', 'Ashish Babarao Sontakke', 'ashishsontakke011@gmail.com', 9049758136, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Post Chincholi (s), tahasil hinganghat ,Dist wardha', ''),
(253, '1801004', 'Tejas Gopal Badgujar', 'tgb672000@gmail.com', 9421636358, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Plot no.7 gat no. 89/2b behind Gujaral petrol pump jalgaon', ''),
(254, '1801005', 'JAYWANT MAROTRAO BELKHEDE', 'jaywantbelkhede@gmail.com', 8605087293, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Ralegaon , dist-Yavatmal, Maharashtra', ''),
(255, '1801006', 'TEJAS RAMCHANDRA BHOYAR ', 'tejasbhoyar13@gmail.com', 7875190368, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Plot No.21 \"Tuljai\" , Patel Nagar , Near Nelco Society , Trimurti Nagar , Nagpur -440022', ''),
(256, '1801007', 'Sachin Ambadas Borde', 'sachinborde685@gmail.com', 9175211024, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At Hilalpur TQ Vaijapur Dist Aurangabad', ''),
(257, '1801010', 'Trupti Shantilal Chaudhari', 'chaudharitrupti29@gmail.com', 9764076884, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Sanjay Nagar ,Sonwad road,Dharangaon ,pincode 425105', ''),
(258, '1801011', 'Prasad Ranjit Chavan', 'prasadchavanmc@gmail.com', 8983918554, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Plot no 60,ramdas colony jalagaon-425001', ''),
(259, '1801012', 'Aishwarya Dilip Deokar', 'aishwaryadeokar2018@gmail.com', 9359307456, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'At post Dhamangaon TQ dist Buldhana', ''),
(260, '1801013', 'Devbhushan Sudhir Prasad', 'devbhushanprasad1@gmail.com', 6265254611, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Qt. No.162 At + Post- Amlohri Project, Distt.-Singrauli, M.P, Pin code- 486887', ''),
(261, '1801017', 'Sharad Bhikaji Dongre', 'dongresharad27@gmail.com', 918699000000, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At Nandi tq Ambad Dist Jalna ', ''),
(262, '1801018', 'Sneha Rajendra Gajbhiye', 'snehagajbhiye54@gmail.com', 8999767783, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'At Kohla ,Post- Dhawlapur, Tah- Katol , Dist- Nagpur', ''),
(263, '1801020', 'ABHIJEET  PRAKASH  GONDCHAR', 'abhijeetgondchar12@gmail.com', 7776830728, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'New Khetan Nagar, Kaulkhed, Akola', ''),
(264, '1801021', 'Ajay Kamaji Gulave', 'ajaygulave2000@gmail.com', 7620843749, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Mahaveer Nagar Nanded.', ''),
(265, '1801022', 'Sneha Shivaji Hinge', 'snehahinge41@gmail.com', 8007296150, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'At- ranmala Ta-Georaei Dist-Beed', ''),
(266, '1801024', 'Aditya Anant Jamodkar', 'adityaajamodkar@gmail.com', 9359789826, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Jawahar Nagar, VMV road , Amravati Maharashtra 444604', ''),
(267, '1801025', 'Aditya Dipak Khade', 'adityakhade115@gmail.com', 9359613601, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Samta colony barshitakli akola', ''),
(268, '1801026', 'Sachin Lakshman Khadke', 'sachinkhadke355@gmail.com', 8805941492, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'AT. Post Sawna Tq-chikhli District-Buldhana', ''),
(269, '1801030', 'Sharad Vishwanath Kulwant', 'sharadkulwant1234@gmail.com', 9370046433, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'N-2 P-2 3/4 Vitthal Nagar Cidco Aurangabad', ''),
(270, '1801031', 'Nikhil Nandulal Kumavat', 'nnk49200@gmail.com', 9922403756, 'Mechanical Engineering', '2018-06-15', '0', 'Male', '57, Shastri Nagar Ramanand Bus Stop, Jalgaon', ''),
(271, '1801033', 'Mayuri  Manohar Deogirkar ', 'mayurimdevgirkar90@gmail.com', 9130791969, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Kothari vatika no 2 malkapur road akola ', '');
INSERT INTO `student` (`stid`, `prn`, `Name`, `Email`, `mobile`, `branch`, `admi_year`, `status`, `Gender`, `Address`, `image`) VALUES
(272, '1801034', 'Prachi Subhash More', 'prachimore2311@gmail.com', 9423784693, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Plot no.9 new Nandanvan colony Aurangbad', ''),
(273, '1801035', 'Saurabh Prakash Musale', 'saurabh30112000@gmail.com', 9177844992, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Onkareshwar nagar,near taroda bk,nanded', ''),
(274, '1801036', 'Nagpure Shreyash Sunil', 'ssnagpure5jee@gmail.com', 8975149719, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At post Mul, dist. Chandrapur - 441224', ''),
(275, '1801037', 'Nikita Rajendra Singh', 'singh.nikita9808@gmail.com', 9359506032, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Government College of engineering jalgaon ', ''),
(276, '1801038', 'Tushar Pralhad Nikrat', 'tusharnikrat16@gmail.com', 9112858066, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Shivnagar ghati road old jalna', ''),
(277, '1801039', 'Nitin Shrikant Talmale', 'talmalenitin@gmail.com', 7030323692, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Pauni 441910', ''),
(278, '1801040', 'Aditi Sunilkumar Patil', 'aditisunilpatil05@gmail.com', 8379925938, 'Mechanical Engineering', '2018-06-15', '0', 'Female', '95 A,shree-villa,sai nagar,Buldana', ''),
(279, '1801043', 'Gayatri Prakash Patil ', 'gayatripatil596@gmail.com', 7038073668, 'Mechanical Engineering', '2018-06-15', '0', 'Female', '13, sarveshwar nagar WB Road, Dhule', ''),
(280, '1801045', 'Sudhir Bhaskar Patil ', '216sudhirpatil@gmail.com', 9075693745, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At post Bharvas Tal- Amalner Dist-Jalgaon', ''),
(281, '1801046', 'Vibha Prafull Patil', 'vibhapatil29@gmail.com', 9422565425, 'Mechanical Engineering', '2018-06-15', '0', 'Female', '248, Bhavani Peth Jalgaon 425001', ''),
(282, '1801047', 'Abhay Pawar', 'pawarabhay0001@gmail.com', 9284875413, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Aurangabad', ''),
(283, '1801048', 'Prashant Dnyaneshwar Wagh', 'pdw23012001@gmail.com', 7410516235, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At khamkheda post tekwade tal shirpur dist dhule', ''),
(284, '1801049', 'Shreyash Raju Pundge', 'pundgesonu15@gmail.com', 9119583850, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Hingoli ', ''),
(285, '1801050', 'Devraj pratapsing rajput', 'rajputdevrajp@gmail.com', 9423977983, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Plot no 94,anandban colony pimprala,jalgaon', ''),
(286, '1801051', 'Umakant Suryabhan Samrutwar ', 'umakantsamrutwar01@gmail.com', 8805393489, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Adyal', ''),
(287, '1801052', 'Vishnugupt Samir sane', 'siddhesh.sane56@gmail.com', 8479010510, 'Mechanical Engineering', '2018-06-15', '0', 'Male', '22, safalya, pratap nagar, ring road, jalgaon.', ''),
(288, '1801053', 'SAMEER MURLIDHAR SAWLIKAR', 'sameersawlikar@gmail.com', 8329904599, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Transport and marketing division, forest colony ,ballarpur ', ''),
(289, '1801054', 'Akash Raviraj Sisode', 'akash2000sisode@gmail.com', 9960571300, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Changdev nagar Waki road jamner         dist. Jalgaon', ''),
(290, '1801055', 'NAGESH BALAJI SONTAKKE', 'nageshbsontakke@gmail.com', 8830228043, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Viral ,TQ jalkot ,dist Latur', ''),
(291, '1801056', 'Anuj Madhukar Suradkar', 'anujsuradkar07032000@gmail.com', 7218315207, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Hariom nagar , chikhali , dist. Buldhana', ''),
(292, '1801058', 'Tushar Dilip Masmar', 'masmartushar27@gmail.com', 9325300251, 'Mechanical Engineering', '2018-06-15', '0', 'Male', '1062, Nagzari Dongripada, Post- Jamshet, Tal-Dahanu, Dist-Palghar, Pin code-401602', ''),
(293, '1801059', 'Pavan Satish Udavant', 'pavanudavant66@gmail.com', 7972606222, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Gopikishan Nagar, Jalna', ''),
(294, '1801061', 'Valvi Jaysing Manga', 'valvijaysing690@gmail.com', 9420918368, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At Post Veli Tal Akkalkuwa Dist Nandurbar', ''),
(295, '1802201', 'Poonam devanand baviskar', 'poonambaviskar370@gmail.com', 7400392691, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Swagat CHS sector 24 A-3/3:2 nerul navi mumbai', ''),
(296, '1802202', 'Bhavik Nanakram Patle', 'bhavikpatle1998@gmail.com', 7218172574, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At korni post Satona dic.gondia', ''),
(297, '1802203', 'Lalit Chindhu Bhoi', 'lcb241999@gmail.com', 7709643299, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Bhavani Nagar, Nashirabad. Po. Nashirabad.\nTal.Dist. Jalgaon\n425309', ''),
(298, '1802204', 'Pavan Narendra Bhoi ', 'pavannbhoi555@gmail.com', 7020375353, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'Behind rathchowk, koliwada pimprala jalgaon ', ''),
(299, '1802205', 'Yashashree Pramod Chaudhari', 'yashuchau3@gmail.com', 8830339620, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Plot no .6,Premchand nagar , behind Kamal Paradise , jalgaon', ''),
(300, '1802210', 'Bhagyashree parag sarode', 'bsarode1999@gmail.com', 7276695379, 'Mechanical Engineering', '2017-06-15', '0', 'Female', 'Plot no 8/1 Bhushan Colony,Jalgaon', ''),
(301, '1802211', 'Suryawanshi Raju Mukund ', 'rajumsuryawanshi2015@gmail.com', 9309163568, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At.Dhamdari Tq.Ardhapur Dist.Nanded ', ''),
(302, '1802212', 'Mahesh Arun Wankhede', 'iammahesh9356@gmail.com', 8554010356, 'Mechanical Engineering', '2017-06-15', '0', 'Male', 'At-Aklud,Post-Padalse,Tal-Yawal,Dist-Jalgaon', ''),
(303, '1811001', 'Abhishek Yogiraj Shivgan', 'abhiyshivgan2709@gmail.com', 8999408084, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At. Post. Ghatnandur Teh. Ambajogai Distt. Beed', ''),
(304, '1811002', 'Agrawal Harshad Ajaykumar', 'harshadagrawal0000@gmail.com', 9921234913, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At post Gobhani Tq. Risod Dist.Washim 444506 . Maharashtra', ''),
(305, '1811003', 'Aman Tejram Wankhede', 'amanwankhede98@gmail.com', 7972265781, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Nagpur', ''),
(306, '1811005', 'Apeksha Surit Patle', 'apekshapatle8@gmail.com', 9075395639, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Vinoba Nagar Tumsar dist.-Bhandara , Maharashtra', ''),
(307, '1811006', 'Varsha Tarachand Bhakkand', 'bhakkand.varsha1999@gmail.com', 7020147618, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Mahada colony, Bansilal nagar, Aurangabad', ''),
(308, '1811007', 'Krishna Satishrao Borade', 'boradekrishna1@gmail.com', 8530297525, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Saraswati Shikshak Colony Sailu Dist.Parbhani', ''),
(309, '1811009', 'Mugdha Sakharam Deshpande', 'mugdhad1612@gmail.com', 9426778736, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', '205,shree ram complex, samarvani, silvassa, dadra & nagar haveli 396230', ''),
(310, '1811010', 'Uditanshu Sachin Deshpande ', 'uditanshudeshpande2312@gmail.com', 8698236644, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Bank Colony , Ramkrishna Nagar , Parbhani', ''),
(311, '1811011', 'Vanshika Vishwas Faye', 'vanshikafaye99@gmail.com', 9421005177, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'F2 om krupa appartment Hanuman Nagar tukum Chandrapur', ''),
(312, '1811012', 'Govind Dilip Gajbhiye', 'gajbhiyegovind@gmail.com', 8668331246, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Near,paikantoli behind laxmi bekery gondia 441601', ''),
(313, '1811014', 'Atharva Vimlesh Hatolkar', 'atharvahatolkar@gmail.com', 8459395583, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', '22 bangloes alipur road , barshi', ''),
(314, '1811015', 'Yogesh lalaji Holpade ', 'holpadeyogesh5455@gmail.com', 8830086607, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At pimprala post kurunda tq Vasmath dist hingoli Maharashtra ', ''),
(315, '1811016', 'Rajesh Trimbak Jatal ', 'rajeshjatal2@gmail.com', 8329820607, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'BHOGAON Sable parbhani ', ''),
(316, '1811017', 'Om Nandkishor Kachave ', 'omkachave44@gmail.com', 7058847092, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At post wadki ta Ralegaon dist Yavatmal ', ''),
(317, '1811018', 'Rohit Pandharinath Kale', 'mr.rohitkale3303@gmail.com', 7773909665, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Pt 24 behind panchayat samiti muktainagar', ''),
(318, '1811019', 'Prathmesh Mahesh Kalyankar', 'prathmeshkalyankar29@gmail.com', 8552835448, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', '\"Ashirwad\", Plot No. 71, Kanchan Nagar, Paithan Road, Nakshatrawadi, Aurangabad, Maharashtra', ''),
(319, '1811021', 'Nikhil Shyam Koli ', 'nikhilkoli762@gmail.com', 8788487359, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Vrundavan,65,Mundada Nagar, Amalner.', ''),
(320, '1811022', 'Komal vilas ingle', 'kvingle20@gmail.com', 7410708905, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Gandi nagar,chikhali dist Buldhana ', ''),
(321, '1811023', 'Prashna Sunil  Lende', 'prashna.lende07@gmail.com', 9096552476, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Ward no 1 \nNehru Nagar\nDhamangaon railway\nAmravati\n444709\nMaharashtra', ''),
(322, '1811024', 'Gaurav Vijay Mane', 'gauravmane2017@gmail.com', 8421414707, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Ayodhya nagar, Pulgaon, Dist. Wardha, 442302', ''),
(323, '1811025', 'Apurva Gurudas Mankar', 'apurvamankar2012@gmail.com', 8208113739, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Naginabag sister colony Chandrapur', ''),
(324, '1811028', 'Dhumravarn Sanjay Mukkawar', 'mukkawarsanjay@gmail.com', 7397848984, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Sanjay Sudhakar Mukkawar main road mukhed', ''),
(325, '1811029', 'Aayushi Deepak Naik', 'naikaayushi2901@gmail.com', 8669339882, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Tirupati mayadevi nagar near rotary club jalgoan', ''),
(326, '1811030', 'Prajwal Sunil Naik', 'prjwlnaik123@gmail.com', 8766578647, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At wadgaon Bajdi post wadgaon Rajdi\nTa. Dhamangaon railway Dist . Amravati', ''),
(327, '1811031', 'Chandan balkrishna patil ', 'chandanpatil09032000@gmail.com', 7058437502, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Plotno. 14 parvati nagar jalgaon ', ''),
(328, '1811033', 'Pranita Jivan Patil', 'pranitapatilbsl@gmail.com', 8975957073, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Swami vihar jalgaon road Bhusawal', ''),
(329, '1811036', 'Sonal Kamalakar patil', 'sonalkpatil99@gmail.com', 7840970276, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Gate no 54/1B plot no 33 shiv colony jalgoan ', ''),
(330, '1811037', 'Rutuja Vikas Pawar', 'rutujap913@gmail.com', 9359881649, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'New ST colony plot no 270  Meenatai Thakare Nagar  Aurangabad', ''),
(331, '1811038', 'Pooja Sambhaji Ramshetwad ', 'poojaramshetwad@gmail.com', 7499236926, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Flat no. 13, BRJ Plaza, Sidhivinayak nagar, Gajanan mandir, Mallegaon road, Nanded ', ''),
(332, '1811039', 'saurabh bandu rane', 'saurabhrane786@gmail.com', 7030843571, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'priya Park navsari amravati ', ''),
(333, '1811040', 'Abhay Sunil Raut', 'rautabhay3@gmail.com', 8888572148, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Ward no. 13 Near Weekly Market Ambedkar Nagar Pulgaon Dist. Wardha', ''),
(334, '1811042', 'Rohit Pandhari Banait', 'banaitrohit1206@gmail.com', 9370541631, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At post Manur BK Tel Bodwad Dist Jalgaon', ''),
(335, '1811044', 'Vishal Siddharth Sardar', 'sardarvishal2000@gmail.com', 8329357321, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Plot no.11,Tuljai Nagar, Near Shivaji Nagar,Garkheda parisar, Aurangabad', ''),
(336, '1811046', 'Saurabh Siddharth Shambharkar', 'saurabhrocks81@gmail.com', 9423518340, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Plot No. 370, ChandanNagar, Near NMC Tax Office, Medical Square, Nagpur-24', ''),
(337, '1811047', 'Vaishnavi Narendra Shantalwar', 'vaishnu221@gmail.com', 9130314612, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', '8/4, MIG Quarter , Hasanbagh Road, New Nandanvan,Rajendra Nagar,Nagpur', ''),
(338, '1811050', 'Sunward Sunil Humaney ', 'humaneysunward@gmail.com', 7028277241, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', '51,kukaday layout post paravati nagar nagpur. ', ''),
(339, '1811051', 'Swejal  Narendra Gajbhiye', 'swejugajbhiye19@gmail.com', 7620455663, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Qtr 19 Ty 2 gc CrpF campus Nagpur', ''),
(340, '1811052', 'Piyush Rajesh Tantak', 'piyushrt2000@gmail.com', 7249224034, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'A/P Savda. Tal Raver Dis.Jalgaon', ''),
(341, '1811053', 'Ganesh  Balkrushna Wagh', 'wganesh507@gmail.com', 8485800394, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Plot no.21, shiv Nagar ,erandol,425109', ''),
(342, '1811054', 'Akanksha Ajay Wani', 'akankshawani19@gmail.com', 9309148518, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Plot No - 18th\nIn front of Sant Gyaneshwar Mauli Mandir\nDena Nagar\nBhusawal - 425201', ''),
(343, '1811055', 'Nihit Ravikant Wankhede', 'wnihit@gmail.com', 7276736804, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Plot No. V-25, narendra nagar, nagpur, Maharashtra 440015', ''),
(344, '1811056', 'Mayur Zatale', 'mayurzatale2000@gmail.com', 9552368128, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Akola, Maharashtra', ''),
(345, '1812204', 'Prajakta dipak Charjan', 'charjanprajakta@gmail.com', 7721899350, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Gurukunj aashram mozari dist amaravati ', ''),
(346, '1812205', 'Lokesh Arvind Chaudhari', 'lokeshchaudhari403@gmail.com', 8329589602, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At.Post.-Mamurabad \nTal. Dist.-Jalgaon', ''),
(347, '1812206', 'Nikhil Nathu Chaudhari', 'nikhilchaudhari2000@gmail.com', 7066353501, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', '9/2.prabhat appt ganpati nagar , jalgaon', ''),
(348, '1812207', 'Varsha Vijay Chaudhari', 'chaudharivarshav@gmail.com', 7083080243, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'At post Bornar Tal & dist Jalgaon', ''),
(349, '1812210', 'Sanket Vishwas Dikkar', 'sanketdikkar1999@gmail.com', 9623791507, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At.Post.Raundala TQ.Akot  Dist.Akola', ''),
(350, '1812212', 'SWAPNIL BHARAT KAWADE', 'kawadeswapnil98@gmail.com', 9623007776, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Aurangabad', ''),
(351, '1812214', 'Madhuri Mahadev Kudale', 'madhurikudale99@gmail.com', 7507494753, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'At/post  - Sarola (bk) \nTa &dist -  Osmanabad', ''),
(352, '1812215', 'NEHA VALMIK LADE', 'nehaladerediff@gmail.com', 7249893379, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Plot no 17A Jay Shankar colony chalisgaon road dhule 424001', ''),
(353, '1812216', 'Prasad Ashokrao Mahakal', 'prasadmahakal89@gmail.com', 7020581305, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At.Manoli,Post.Arak,Tq.Mangrulpir, Dist.Washim', ''),
(354, '1812217', 'Rahul Babasaheb  more', 'Morerahul391@gmail.com', 9309115972, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'At post vaijubabhulgaon TAL-Pathardi Dist-ahmednagar.', ''),
(355, '1812218', 'Suvarna Dnyaneshwar Netke', 'suvarnanetke9@gmail.com', 7038041348, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Plot no 33/116 bajarang housing society near harivitthal nagar jalgaon', ''),
(356, '1812220', 'Gauri Vijay Patil', 'gauripatil27499@gmail.com', 7083758338, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', '28 Jaynagar near Omkareshwar temple, Jalgaon', ''),
(357, '1812221', 'Jayshri Sanjay Patil', 'jayshrirajput99@gmail.com', 7020363451, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Plot no-13,116 Bajarang housing society, Harivitthal nagar, Jalgaon', ''),
(358, '1812223', 'Rushikesh Yamaji Pawar', 'pawarrushikesh16699@gmail.com', 9130302706, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Male', 'Beed', ''),
(359, '1812225', 'Nayana machhindra salunke', 'nayanasalunkhe0990@gmail.com', 7769082711, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'Rameshevar colony hanuman nagar plot no5 jalgaon', ''),
(360, '1812226', 'Priyanka Govind Shinde', 'spriyanka0599@gmail.com', 9373343133, 'Electronics & Telecommunicatio', '2017-06-15', '0', 'Female', 'At Post Sawargaon \nTQ. Dist. Latur', ''),
(361, '1821001', 'Swapnil madhav Admane', 'swapniladmane17@gmail.com', 9112045409, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At post warud ck tq Sengon dist hingoli', ''),
(362, '1821002', 'Nikhil Shivshankar Ausekar', 'nikhilausekar703@gmail.com', 7385105131, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Lokmangal nagar ,selu ,dist parbhani', ''),
(363, '1821003', 'Hemlata suresh Bawankule', 'hemlatabawankule14@gmail.com', 9579624760, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Ward no 5 gabhane mohlla ,lakhani, district: bhandara ', ''),
(364, '1821005', 'Bharambe Dhiraj Prakash', 'dhirajbharambe00@gmail.com', 8459293800, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'At-Gadegaon tal-jamner dist-jalgaon', ''),
(365, '1821007', 'Pranav Shivhari Bhoge ', 'pranavbhoge2899@gmail.com', 7558742216, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'N-6, CIDCO ,Aurangabad', ''),
(366, '1821009', 'Radhika Shrikant Deshpande', 'radhikadeshpande221@gmail.com', 7385870491, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Jatharpath ,Akola', ''),
(367, '1821010', 'Aakanksha Ravindra dharmadhika', 'akankshadharmadhikari20@gmail.com', 8208960415, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', '45 shivshkti chauk raisoni nagar jalgaon ', ''),
(368, '1821011', 'Sumeet Dnyandeo Dongardive', 'sumeetdongardive9933@gmail.com', 9673288338, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At-Chakwa, Post-Wai, Tq-Mangrulpir, Dist-Washim, Maharashtra, 444105.', ''),
(369, '1821015', 'Isha Vilas kasangottuwar', 'isha04kasangottuwar@gmail.com', 7410119849, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Ganesh Nagar Tukum Chandrapur', ''),
(370, '1821016', 'DINESH KANOBA KATAKAMWAD', 'dineshkatakamwad2000@gmail.com', 7798756415, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At.Tembhi Tq. Himayatnager . Dist.Nanded   431802', ''),
(371, '1821017', 'Suraj Dhondiram Kawathale', 'sksuraj6077@gmail.com', 9168126184, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At.Bhingoli, To.Shirur Anantpal, Dist.Latur     Pin Code413544', ''),
(372, '1821018', 'Ekta kharbe', 'ektakharbe950@gmail.com', 7350289725, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Nanded', ''),
(373, '1821019', 'Komal suresh lone ', 'lonekomal123@gmail.com', 9325369445, 'Instrumentation Engineering', '2019-06-15', '0', 'Female', 'Tq,purna ,dist,parbhani,village,chudawa', ''),
(374, '1821020', 'Hemlata Arjun Malve ', 'malvehemlata1999@gmail.com', 9359700385, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Near motha maruti ,dhule road,nandurbar.', ''),
(375, '1821021', 'Lokesh Prakash Maske', 'maskelokesh1@gmail.com', 7588768845, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Plot no.112 , Hitt top colony, 8th mail, Nagpur-440023', ''),
(376, '1821022', 'Shiwani Sunil mohod', 'shivanimohod7862@gmail.com', 7083625255, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Borwaghal,Amravati', ''),
(377, '1821023', 'Aniket rajendra patil', 'patil8624972776@gmail.com', 8624972776, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Mp-kauthali, ta-pandharpur dist-solapur', ''),
(378, '1821024', 'Jaykumar Atmaram Pawar', 'japawar001@gmail.com', 9021731767, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At.post.bhandari ta.pusad Dist.yavatmal', ''),
(379, '1821025', 'Trunal Dilip Pawar', 'trunaldpawar@gmail.com', 9130196998, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Suyog colony Karanja(gh) ', ''),
(380, '1821027', 'Aakash santosh Solanke', 'aakashsolanke99@gmail.com', 9325529741, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Sunder Nagar,Nageshwarwadi , Aurangabad 431001', ''),
(381, '1821028', 'Tushar Gajanan Ubarhande', 'Tusharubarhandekhushi@gmail.com', 8308303198, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Dwarka Nagar, Rajgure-Lay-Out, Buldana', ''),
(382, '1821029', 'Rushabh Ugemuge', 'rushabhugemuge12@gmail.com', 8551800653, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', '92, pardhi nagar hingna road nagpur', ''),
(383, '1821030', 'Laxmikant Liladhar Warade', 'tejasvarade446@gmail.com', 8459040915, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At post Gadegaon tal-jamner dist-Jalgaon 425114', ''),
(384, '1822201', 'Rohit Satish Aage', 'rohitaage98@gmail.com', 7769977847, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Near old remand home arvi naka wardha', ''),
(385, '1822203', 'Suyog Ganesh Bagul', 'suyogbagul604@gmail.com', 8459569204, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Plot No. 36, Gurukrupa Nivas, Hanuman Nagar, Nandgaon Tal. Nandgaon Dist. Nashik', ''),
(386, '1822205', 'Kunal Prabhakar Bhavsar', 'kunal2499bhavsar@gmail.com', 7721098601, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Jalgaon', ''),
(387, '1822206', 'Meghsham Chandrakant Chaudhari', 'meghsham40@gmail.com', 7083317733, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'N-32/N-7/31-2 Swami Vivekanand Nagar, Cidco Nashik-09', ''),
(388, '1822207', 'Nishant Hemlal Chaudhari', 'nc14884@gmail.com', 9022204845, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Tukaram Nagar,Padalse', ''),
(389, '1822209', 'Shubham Ramesh Desai ', 'shubhamdesai4819@gmail.com', 9422093037, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At post ane, tal. Karad, Dist. Satara, Maharashtra ', ''),
(390, '1822210', 'Akanksha Ashok Gaikwad', 'aakugaikwad4399@gmail.com', 9527625643, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Gayatri Nagar, Sailu,Dist.Parbhani', ''),
(391, '1822214', 'Snehal prakash ingale', 'isnehal265@gmail.com', 9021348274, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'At post Salshingi,Tal Bodwad ,jalgaon ', ''),
(392, '1822216', 'Kajal sharad bhangale ', 'kajalbhangale9300@gmail.com', 9359405272, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Plot no 3,get no 95/3B,shriram nahar dadawadi, jalgaon. ', ''),
(393, '1822219', 'Jayesh Ratnakar Kapadane', 'jk71197@gmail.com', 8329686153, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'Plot no. 49, Ashababa nagar jalgaon', ''),
(394, '1822223', 'Shrinivas Shivdas pandagale', 'shripandagale147@gmail.com', 8888933697, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'At post shiradhon tq kandhar dist nanded', ''),
(395, '1822225', 'Vaishnavi pralhad patne ', 'vaishnavipatne18@gmail.com', 8378898028, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'At Post Lohara, Taluka Udgir,District Latur.', ''),
(396, '1822226', 'Kalyani Ramchandra Sontake', 'sontakekalyani18@gmail.com', 9730515561, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'At post Virul (A.) Ta. Arvi Dist. Wardha ', ''),
(397, '1822227', 'Sourabh Sitaram Vyavahare', 'ssv16441@gmail.com', 9764122300, 'Instrumentation Engineering', '2017-06-15', '0', 'Male', 'A/p modnimb tahsil: Madha Dist: Solapur', ''),
(398, '1822230', 'Supriya sudarshanrao wakade', 'wakadesupriya1999@gmail.com', 7498308006, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'At post bhavsar chok rajesh nagar taroda kh naka nanded ', ''),
(399, '1822231', 'Sneha Rajkumar Warad', 'warad.sneha1997@gmail.com', 8605374151, 'Instrumentation Engineering', '2017-06-15', '0', 'Female', 'Hanuman Chowk Udgir ,Dist.Latur', ''),
(400, '1831001', 'Aishwarya Kishor Bhaisare', 'truptibhaisare05@gmail.com', 9325027280, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Lakhani, Dist : Bhandara', ''),
(401, '1831002', 'Rushikesh Mohanrao Basre', 'rbasre53@gmail.com', 9130674399, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At post shahapur Tq degloor Dt nanded', ''),
(402, '1831003', 'DURGESH JAYESH BAVISKAR', 'durgeshbaviskar2018@gmail.com', 9370162769, 'Electrical Engineering', '2018-06-15', '0', 'Male', '92, USMANIYA PARK, SHIVAJI NAGAR, JALGAON 425001', ''),
(403, '1831004', 'Anjali Devidas Bhadekar', 'anjalibhadekar2@gmail.com', 8956290999, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'SVM colony ,Kinwat, Nanded. ', ''),
(404, '1831005', 'Shubham Govind Bhalekar', 'shubhamb07sb@gmail.com', 9834980867, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Jalna', ''),
(405, '1831006', 'Ashutosh Ramesh Bhaltilak ', 'ashutoshbhaltilak0@gmail.com', 7038573633, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Jalgaon ', ''),
(406, '1831008', 'Dhaval Suresh Bhangale ', 'dhavalbhangale19584@gmail.com', 9423773529, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Plot no 31-2 gat no-76/2b sunandini park, sadashiv nagar, near old khedi road, jalgaon , 425001.', ''),
(407, '1831011', 'Vipin shiolal bopche', 'vipinbopche2000@gmail.com', 9511260011, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Paraswada , tirora , gondia ', ''),
(408, '1831012', 'Sagar Sheshrao Borse', 'borsesagar735@gmail.com', 9370601294, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Shri Ram Nagar Shegaon, Maharashtra.', ''),
(409, '1831015', 'Nikhil Shivnarayan Chaudhari', 'nikhilschaudhari05@gmail.com', 9370567473, 'Electrical Engineering', '2018-06-15', '0', 'Male', '139,Gandhi Nagar,Jilha Peth,Jalgaon', ''),
(410, '1831018', 'Shubham Harne', 'harne123shubham@gmail.com', 7448231900, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Jalgaon', ''),
(411, '1831019', 'Janhavi Suresh Thengre', 'janhavithengre2000@gmail.com', 9470509751, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Behind sai pump,teacher colony ,delanwadi , Tal:Bramhpuri,dist:chandrapur,MH', ''),
(412, '1831020', 'Rudresh Pralhadrao Kadu', 'rudrapkadu143@gmail.com', 9607486601, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At.Meha Post.Dhanaj Bk Tal.Karanja lad Dist.Washim 444110', ''),
(413, '1831021', 'Priya Sunil Kale ', 'priyakale940579@gmail.com', 8830862367, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Plot no.5, Ayodhya Nagar, Jalgaon ', ''),
(414, '1831022', 'Nachiketa Gulab Kalkar', 'ngkalkar036@gmail.com', 7721844691, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Narkhed', ''),
(415, '1831023', 'VAIBHAV YEDU KAMBLE', 'vaibhavk9909@gmail.com', 8698451011, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Vision city, paithan road , aurangabad', ''),
(416, '1831024', 'Mandar Balasaheb Khadke', 'mandarkhadke.25man@rediffmail.com', 9011392141, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Ganpati Galli ambad ta ambad dist jalna', ''),
(417, '1831026', 'Vikram Shrikrishnarao Kulkarni', 'vk8999603263@gmail.com', 8999603263, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Cidco Nanded', ''),
(418, '1831027', 'Vasudev Bhikan Mahajan', 'vasu.mahajan54@gmail.com', 8308345456, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Sant Sena, Mukund Nagar, near St Lawrence School, Jalgaon, dist. Jalgaon.', ''),
(419, '1831028', 'Sneha Rupesh Mahale', 'snehamahale9@gmail.com', 7875190225, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'At post Datta Mandir ward fekari.tal - Bhusawal', ''),
(420, '1831029', 'Pratik Dinesh Mondhekar', 'pratikmondhekar@gmail.com', 9226267212, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'House no 2, satlok bungalows, gurukrupa colony, pangri road, beed', ''),
(421, '1831032', 'Jaya Tulsidasji Paliwal', 'paliwaljaya8@gmail.com', 7038212333, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Jalgaon', ''),
(422, '1831033', 'Pallavi Ramesh Acharya', 'palluacharya10@gmail.com', 9021778291, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Sujata Nagar,parbhani ', ''),
(423, '1831034', 'Harshal Umakant Patil ', 'hup13101998@gmail.com', 7775084618, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Premchandra Nagar ,plot no 14 ,juna khedi road ,jalgaon ', ''),
(424, '1831035', 'Poonam Sunil Patil', '346poonampatil@gmail.com', 9271904918, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Ayodhya Nagar Talwel Tal Bhusawal Dist Jalgaon', ''),
(425, '1831036', 'Adityahpawar99@gmail.com', 'adityahpawar99@gmail.com', 8275937055, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Shiv nagar kannad , dist. Aurangabad.', ''),
(426, '1831039', 'Raman kumar ', 'ramankumar297@gmail.com', 9579493932, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'G/23 b railway qtr malhar chowk ahmednagar ', ''),
(427, '1831040', 'Swapnil Rajkumar Ramteke', 'ramtekes502@gmail.com', 9730780985, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Ambedkar Nagar , Tumsar Dist. Bhandara', ''),
(428, '1831041', 'Sayali Vijay Rokade', 'sayali.rokade1234@gmail.com', 9359518337, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'State Bank colony tukum Chandrapur', ''),
(429, '1831043', 'Samiksha Rajkumar Purohit', 'purohitsamiksha19@gmail.co', 8999683295, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Arvi,Dist Wardha', ''),
(430, '1831044', 'SHUBHAM SUNIL SAWALE', 'shubhamsawale97@gmail.com', 9503243442, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'QTR.NO. 151 B TYPE 2 ORDNANCE FACTORY VARANGAON- 425308', ''),
(431, '1831045', 'Arpan shah', 'wizthekid730@gmail.com', 8956242840, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Shivam electricals daryapur', ''),
(432, '1831046', 'Tanmay Manohar Shire ', 'tanmayshire19@gmail.com', 8698913720, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Shikshak Colony Karanja lad', ''),
(433, '1831047', 'Nikhil Shantaram Sonawane', 'nikhilsonawane903@gmail.com', 7030621192, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At Post Ordnance Factory Varangaon, BLDG No. 63/G Type III Tal:- Bhusawal Dist:- Jalgaon', ''),
(434, '1831048', 'Dhanashri M. Sontakke', 'dhanusontakke2000@gmail.com', 7588961742, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Poha get karanja lad ', ''),
(435, '1831049', 'Neha kishor surwade', 'nehasurwade59@gmail.com', 7057131602, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Shraddha nagar, Bhusawal', ''),
(436, '1831051', 'Sarika Shivaji Takalkar ', 'sarikatakalkar2000@gmail.com', 9561648113, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'At post wadegaon.', ''),
(437, '1831052', 'Tejas Sanjay Bankar', 'tejasb218@gmail.com', 918601000000, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Hanuman Nagar,Takiya Ward,Bhandara ', ''),
(438, '1831054', 'AKSHAY SUNDAR THORBOLE', 'akshaythorbole28@gmail.com', 8208690521, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'AT POST GOJWADA TQ WASHI DIST OSMANABAD 413525', ''),
(439, '1831055', 'Prashik uke', 'prashikuke55@gmail.com', 7028841245, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Dhamangaon', ''),
(440, '1831056', 'Vaibhav Dattarao Vaidya', 'vaibhavvaidyarv@gmail.com', 86050309357, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At. Usmanpur, tq. partur, dist. Jalna', ''),
(441, '1831057', 'Shital kishordas vaishanv', 'shitalvaishnav2018@gmail.com', 7666549270, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Ajanta', ''),
(442, '1831058', 'Nachiket Bapu Wagh', 'nachiketbapuwagh000@gmail.com', 7620961110, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Patil Nagar,Collector Patta,Sangmeshwar, Malegaon Dist.Nashik', ''),
(443, '1831059', 'Preeti Vijay Wavage', 'preeti26wavage@gmail.com', 9112467764, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Old khetan Nagar, Kaulkhed, Akola', ''),
(444, '1831060', 'Charulata Vilas Zalke', 'charulatazalke711@gmail.com', 8806479916, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'In front of Hanuman Temple,\nAt.Po.: Kharashi\nTa:Lakhani\nDi.: Bhandari\nMaharashtra', ''),
(445, '1831061', 'Hemangi Prakash Zope', 'hemangizope6139@gmail.com', 9545279339, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Indranil society pimprala shivar,jalgaon.', ''),
(446, '1832101', 'MOHIT SURESH KULTHE', 'mohitskulthe@gmail.com', 9011516997, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Sadashiv nagar shahada 425409', ''),
(447, '1832103', 'Akshada Yuvraj Mahajan', 'akshada99.mahajan@gmail.com', 7057169606, 'Electrical Engineering', '2017-06-15', '0', 'Female', '10,parijat colony mahabal,Jalgaon', ''),
(448, '1832201', 'Shubhangi Sahebrao Awachar', 'shubhangiawachar22@gmail.com', 7507297268, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At post rajanda ,tq.barshitakali ,dist .akola ', ''),
(449, '1832202', 'Rishikesh Pradip Bhadke', 'rishibhadke@gmail.com', 9730876891, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Navjivan colleny, kathora Naka, Amravati', ''),
(450, '1832203', 'Shreyash Bhaskar Firake', 'shreyasfirake1999@gmail.com', 9890729915, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At Po.Nhavi pr.Yawal Dist.Jalgaon ', ''),
(451, '1832204', 'Geeta arun chaudhary', 'chaudharigeet469@gmail.com', 9923852509, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'Sudatt colony, khote-nagar, jalgaon', ''),
(452, '1832205', 'Suraj Sanjay Hingde', 'surajhingde11@gmail.com', 9665782061, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At.Sakhara , Post.Kharus BK , TQ. Umarkhed, Dist. Yavatmal', ''),
(453, '1832206', 'Satish Dilip Patale', 'satishpatale769@gmail.com', 7038621837, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At Post Shelubazar TQ Mangarulpir Dist Washim Pincode 444402', ''),
(454, '1832208', 'Vidya Madhukar Roundle', 'vidya21roundle@gmail.com', 7066761832, 'Electrical Engineering', '2017-06-15', '0', 'Female', 'At post Sungaon Tq Jalgaon Jamod Dist Buldhana', ''),
(455, '1832209', 'Anup Kashinath Sable', 'sableanup1999@gmail.com', 7028599238, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'At:- Ghorkund Tell:-Soegaon Dist:-Aurangabad', ''),
(456, '1832211', 'Chetan Sanjay Sonawane', 'chetanssonawane889@gmail.com', 8149368185, 'Electrical Engineering', '2017-06-15', '0', 'Male', 'Room no.118, Municipal Colony, Near Ramanand nagar, Jalgaon.', ''),
(457, '1832212', 'Chhaya  Sunil Vispute', 'chhayavispute1999@gmail.com', 917621000000, 'Electrical Engineering', '2017-06-15', '0', 'Female', '472, Vitthal Peth Badam Galli Jalgaon', ''),
(458, '1841003', 'Sushrut Rajesh Babhulkar', 'sushrutbabhulkar2000@gmail.com', 9403398109, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Pratap Nagar, Wardha', ''),
(459, '1841005', 'Arya Atul Bhangale', 'aryabhangale72@gmail.com', 8551952771, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Professor colony, jammer road, Bhusawal', ''),
(460, '1841007', 'Saylee Deepak Borole', 'sayaliborole111@gmail.com', 9404250042, 'Computer Engineering', '2018-06-15', '0', 'Female', 'EM 70/7 BTPS colony Deepnagar', ''),
(461, '1841008', 'Ali Asgar Chalniwala', 'alichalniwala@gmail.com', 8830011958, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Kothari bazar akola', ''),
(462, '1841009', 'Prasad Bhanudas Chaudhari', 'prasadchaudhari117@gmail.com', 8999874482, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Savda Tal Raver Dist Jalgaon', ''),
(463, '1841011', 'Tanmay Bhagwat Chaudhari', 'chaudharitanmay0@gmail.com', 8149087808, 'Computer Engineering', '2018-06-15', '0', 'Male', '15 Dhanabhishek Row House Indraprastha Colony Mahajan Nagar Ambad Link Road Ambad Nashik', ''),
(464, '1841012', 'Snehal Dhanraj Chavan', 'chavansnehal1020@gmail.com', 7972236955, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Plot no.20,Padmalaya nagar,Dharangaon,Dist- Jalgaon', ''),
(465, '1841014', 'Vaibhav Rajesh Chirde', 'vrchirde@gmail.com', 8788900657, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Digras-445203 Tq.Digras Dist.Yavatmal', ''),
(466, '1841015', 'Chanchal Vijay fegade', 'chanchalfegade1@gmail.com', 7796885789, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Ashtavinayak nagar savada road Raver', ''),
(467, '1841016', 'Rupesh Gaikwad', 'gaikwadrupesh515@gmail.com', 917028000000, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Bhramsingh nagar ,nanded 431605', ''),
(468, '1841018', 'Achal pramod gohade ', 'achalgohade0505@gmail.com', 7218693719, 'Computer Engineering', '2018-06-15', '0', 'Female', 'At post dhotardi dist ,akola .', ''),
(469, '1841019', 'Komal Laxman Jadhav', 'komalljadhav2000@gmail.com', 9975691395, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Kalinka mata temple, tulsai nagar, jalgaon', ''),
(470, '1841020', 'Kulbhushan Ramkishan Jadhav', 'kulbhushanjadhav54448@gmail.com', 8999736716, 'Computer Engineering', '2018-06-15', '0', 'Male', 'At Dohara, post. Bori, tq. Jintur,dist. Parbhani, 431401', ''),
(471, '1841022', 'Aaditya Sudhir Joshi', 'aadityajoshi291020@gmail.com', 8380860010, 'Computer Engineering', '2018-06-15', '1', 'Male', '34, new parvati kale nagar, mohadi road, Jalgaon', ''),
(472, '1841023', 'Prasad Mukund Joshi', 'Prasadjoshi9969@gmail.com', 9730667159, 'Computer Engineering', '2018-06-15', '1', 'Male', 'Near old post office, parola, Jalgaon', ''),
(473, '1841024', 'Vishal Jyotiram Kangude', 'vishalkangude8383@gmail.com', 8380938383, 'Computer Engineering', '2018-06-15', '1', 'Male', 'At.Bhadangwadi Po.Madalmohi Tq.Georai Dist.Beed', ''),
(474, '1841025', 'Amisha Rajendra kothawade ', 'kothawadeamisha20@gmail.com', 9370103597, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Dnyaneshwar colony ,Marvad road Amalner district Jalgaon ', ''),
(475, '1841026', 'Vedant Vinayak Kulkarni', 'kulvedant2000@gmail.com', 8530250091, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Cidco, aurangabad, Maharashtra', ''),
(476, '1841027', 'Bhavna Surendra Latare', 'bhavnalatare@gmail.com', 7507700288, 'Computer Engineering', '2018-06-15', '0', 'Female', 'House no. 841, Ward no. 10, Shashtri ward, near panchayat samiti colony, Gondia', ''),
(477, '1841030', 'Rameshwar Purushottam Malode', 'rameshwarmalode39@gmail.com', 9370180948, 'Computer Engineering', '2018-06-15', '0', 'Male', 'At.post.Sawad Tq.Risod Dist.Washim', ''),
(478, '1841032', 'Amey Shamrao Nagmode ', 'ameynagmode@gmail.com', 9175559003, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Tarale layout, sai nagar , wardha', ''),
(479, '1841034', 'Ishwari Rajiv Narkhede', 'ishwarin2000@gmail.com', 8888032530, 'Computer Engineering', '2018-06-15', '0', 'Female', '256/7 Bhavani peth, near Yashoda hospital , Jalgaon.', ''),
(480, '1841035', 'Anuja Milind Nemade', 'anujanemade546@gmail.com', 9370715464, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Bhusawal', ''),
(481, '1841036', 'Riya Diwakar Nikhade', 'riyanikhade355@gmail.com', 9370959069, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Gorakshan Ward, Ballarpur, Dist-Chandrapur', ''),
(482, '1841037', 'Anup R. Nishanrao', 'anupnishanrao2@gmail.com', 919666000000, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Daryapur', ''),
(483, '1841038', 'Atharva Rajendra Patil', 'yatinchaudhari8254@gmail.com', 7588405246, 'Computer Engineering', '2018-06-15', '0', 'Male', 'C/O Dr. Yatin Chaudhari, Plot no. 10, Behind Durga Devi Mandir, Indraprastha Nagar, Dudh Federation Road, Jalgaon', ''),
(484, '1841039', 'Ganesh Patru Pipare ', 'gpipare2@gmail.com', 8379050590, 'Computer Engineering', '2018-06-15', '0', 'Male', 'At. Karkapalli  Dist.Gadchiroli Maharashtra ', ''),
(485, '1841040', 'Rahul Ponde', 'rahulponde214@gmail.com', 1841040, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Malviya Nagar tumsar', ''),
(486, '1841041', 'Rahul Rajendra Kadam', 'kadamrahul12189@gmail.com', 9309937960, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Military Boys Hostel, Jalgaon', ''),
(487, '1841042', 'Hrushikesh Shriram Rasne', 'hrushikeshrasne@gmail.com', 9420952180, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Aurngabad', ''),
(488, '1841043', 'Sanket Pandharinath Rathod', 'sanketrathod040@gmail.com', 9763218858, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Balaji Nagar Khandsari Parisar Kannad dist. Aurangabad', ''),
(489, '1841044', 'Chirag Deepak Ratvekar ', 'chinmayratvekar77@gmail.com', 9822414171, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Siddhivinayak Park, old kanalda road, jalgaon', ''),
(490, '1841045', 'Sandeep Anna Raut', 'rautsandeepv99@gmail.com', 8788069847, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Sorti nagar Ambar road Jalna ', ''),
(491, '1841047', 'Dhiraj Rajesh Shinde', 'dhirajshinde101@gmail.com', 9049044398, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Cotton Market Road, Karanja Lad', ''),
(492, '1841048', 'Shivanshu Anant Suryakar', 'shivanshusurya192@gmail.com', 9767020682, 'Computer Engineering', '2018-06-15', '0', 'Male', 'WD3-986 Shivneri Society, Arni Naka, Yavatmal', ''),
(493, '1841051', 'Suraj Banarsi Singh ', 'surajbksingh157@gmail.com', 9823872550, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Sai ram colony, Ambernath,Thane,Mumbai', ''),
(494, '1841052', 'Prasad Nilkanth Sonje', 'prasadsonje1@gmail.com', 9284120424, 'Computer Engineering', '2018-06-15', '0', 'Male', 'At post Shewade Tel.Shindhkheda Dist.Dhule', ''),
(495, '1841053', 'Abhishek Rupchand Thakare', 'thakareabhishek2001@gmail.com', 7038560859, 'Computer Engineering', '2018-06-15', '0', 'Male', 'At. Manapur Tah. Ramtek Dist. Nagpur -441106', ''),
(496, '1841054', 'Kaustubh Umbarkar', 'kaustubhumbarkar36@gmail.com', 7218787038, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Infront of Sagar Park Government Qtr P3 Building,Jalgaon', ''),
(497, '1841057', 'Jayesh Bhanudas Wani', 'jayeshwani05@gmail.com', 7972963535, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Swaminarayan Nagar ,Savda(425502) ,Tal: Raver , Dist: Jalgaon', ''),
(498, '1841058', 'Saurabh Sunil Wani', 'er.saurabhwani1@gmail.com', 7841917752, 'Computer Engineering', '2018-06-15', '1', 'Male', 'Near shivdham temple, jalgaon', ''),
(500, '1841060', 'Manali Dinesh Zope', 'manalizope4@gmail.com', 9588412994, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Flat No. 6, Shree Plaza Appt., Tapi Nagr, Yawal Road ,Bhusawal.', ''),
(501, '1842101', 'NITIN DADABHAU BORSE', 'nitinborseversion7@gmail.com', 8999705608, 'Computer Engineering', '2017-06-15', '0', 'Male', 'C/O - Cement\nCarrier,\nPlot.no. - 11, \nNear sakal newspaper,\nVasumitra Hotel,\nMIDC,\n425003', ''),
(502, '1842102', 'Awes Khan Ayyub Khan ', 'khanawes22@gmail.com', 9172342937, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Plot No 1, Rahat Colony, Dargah Road, Parbhani', ''),
(503, '1842104', 'Aniket Bhaskar Sanap', 'aniketsanap43@gmail.com', 9075410707, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Dattprabhu Nagar, Pimpargavhan Road, Beed, Maharashtra', ''),
(504, '1842105', 'Swapnil Khushal Sarve', 'swapnildude1717@gmail.com', 8983132848, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Plot no 212,Doctors Colony, Bela, Bhandara', ''),
(505, '1842201', 'Akash  kishor badgujar', 'akashbadgujar199@gmail.com', 8830376987, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Mahavir nagar jawal road chopda', ''),
(506, '1842202', 'Shubhangi Shivaji Bari', 'shubhangibari15@gmail.com', 8983881866, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Jalgaon', ''),
(507, '1842203', 'Harshada Ishwar Borude ', 'harshuborude2705@gmail.com', 7887476409, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Ballav society, bhadgaon road, pachora, dist. Jalgaon ', ''),
(508, '1842204', 'Falguni Dinesh Chaudhari ', 'falgunichaudhari3@gmail.com', 9860428142, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Shiv colony plot no.45/55 opposite saraswati school,Jalgaon ', ''),
(509, '1842205', 'Srushti Tushar Chaudhari', 'srushtichaudhari1@gmail.com', 8805910293, 'Computer Engineering', '2017-06-15', '0', 'Female', 'Yogeshwar Nagar, Jalgaon', ''),
(510, '1842206', 'Parag Narayan Chimankar', 'paragchimankar@gmail.com', 8554044212, 'Computer Engineering', '2017-06-15', '0', 'Male', '101/1 Plot no.22/5 Mundada Nagar, Jalgaon', ''),
(511, '1842208', 'Rasheeda Murtaza Lehri ', 'rasheedalehri27@gmail.com', 9405124052, 'Computer Engineering', '2017-06-15', '0', 'Female', '153, Bhavani peth Jalgaon. 425001', ''),
(512, '1842210', 'Jayashree Sunil Patil', 'jayashree8668@gmail.com', 7498447223, 'Computer Engineering', '2017-06-15', '0', 'Female', 'At -  Padalasare , Post - Kalmsare , Tal - Amalner , Dist - Jalgaon.', ''),
(513, '1842211', 'Badal Devichand Rathod', 'badalrathod99@gmail.com', 8208032585, 'Computer Engineering', '2017-06-15', '0', 'Male', 'Ravinagar mhasala wardha', ''),
(514, '1851001', 'SAYLI HEMANTRAO AGHAV ', 'saylihemantaghav@gmail.com', 7887325191, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Teacher\'s colony beed ', ''),
(515, '1851002', 'Pratiksha Nitin Ahire', 'pratikshaahire09@gmail.com', 7058210438, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Flat no 01, kaustubh appartment shraddha colony jalgaon', ''),
(516, '1851003', 'Tushar Bhaidas Ahire', 'tusharahire1406@gmail.com', 8698340134, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Government College of Engineering Jalgaon, 425001', ''),
(517, '1851005', 'Siddhesh Vijay Bagul', 'siddheshbagul2000@gmail.com', 7350960643, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Soygaon, Malegaon, Dist - Nashik', ''),
(518, '1851006', 'Bankar Sagar Bhimrao', 'bankarsagar358@gmail.com', 9764935606, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At post chincholi li tq kannad dist Aurangabad', ''),
(519, '1851007', 'Mahesh Ganpati Birajdar', 'birajdarm21@gmail.com', 8208394934, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Chichondi, Nilanga Dr Latur', ''),
(520, '1851010', 'Rashmi Arun Deshmukh', 'rashmideshmukh444@gmail.com', 9359961665, 'Civil Engineering', '2018-06-15', '0', 'Female', 'At post Talodhi (Ba) . Dist- chandrapur ', ''),
(521, '1851011', 'Vinod pralhadrao Deshmukh', 'vinoddeshmukh6462@gmail.com', 9359996372, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Krushi nagar parbhani ', ''),
(522, '1851013', 'Komal Bhagwat Dhanshetti', 'dhanshettikomal@gmail.com', 9370084398, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Ahmedpur', ''),
(523, '1851014', 'Harshad Ashok Dhepe', 'harshaddhepe101@gmail.com', 7420885736, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Anand Nagar, gittifail, sawangi Meghe, wardha.\nMaharashtra.\n442001', ''),
(524, '1851016', 'Nisarg Vinay Gavit', 'gavitnisarg853@gmail.com', 7447886832, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Navapur', ''),
(525, '1851017', 'Pavan vasant Gawande', 'pavangawande2000@gmail.com', 7066264297, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At Post Tembhapuri Tq Gangapur Dist Aurangabad ', ''),
(526, '1851018', 'Bhushan Pandurang Gole', 'bhushangoley@gmail.com', 9011198671, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At-warud Post-gavhan Tq-shegaon Dist-buldhana', ''),
(527, '1851022', 'Pratiksha S  Kamble', 'kpratiksha645@gmail.com', 8530292110, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Saraswatinagar , katol dist Nagpur', ''),
(528, '1851023', 'Pranjal Kailash Kanpate', 'vk.kanpate.72@gmail.com', 9130222853, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Indira Nagar Tumsar', ''),
(529, '1851024', 'Darpan Dilip Katre', 'darpankatre815@gmail.com', 7709775488, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At po Dhanoli ta salekasa dist gondia', ''),
(530, '1851025', 'Sapana Ramesh Kokani ', 'sapanakokani230077@gmail.com', 9604576705, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Plot no 10/B sahyadri nagar dudhale shivar Nandurbar ', ''),
(531, '1851028', 'Kaustubh Manoj Manudhane ', 'manudhanekaustubh@gmail.com', 7588338919, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Marwadi gali erandol ', ''),
(532, '1851029', 'Sonal Ramesh More ', 'sonalmore7843@gmail.com', 7498141380, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Plot no-19/1,Gat no-151/2,Kisanrao Nagar, Jalgaon', ''),
(533, '1851030', 'Balaji Madhav Nagme', 'balajinagme1803@gmail.com', 9130208363, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At.post.shirur tajband,tq.ahmadpur,dist.latur', ''),
(534, '1851032', 'Saurav Dilip Pate ', 'saurav.pate99@gmail.com', 8983831511, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Gat no 290 plot no 3 swadip niwas bhoete nagar jalgaon ', ''),
(535, '1851034', 'Bhavesh Sanjay Patil ', 'patilbhavesh1436@gmail.com', 7038062974, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Plot no 8 get no 6/a auditor colony , pimprala, jalgaon-425001', ''),
(536, '1851035', 'Chetan Manoj Patil', 'cmpatiloooo@gmail.com', 7498117691, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At post Mohadi,Tal-Jamner Dist-Jalgaon', ''),
(537, '1851036', 'Dhanashree Pramod Patil', 'patildhanshree02@gmail.com', 8208045800, 'Civil Engineering', '2018-06-15', '0', 'Female', '8 , New Postal Colony , behind M.J college Jalgaon . ', ''),
(538, '1851038', 'Kaustubh Manoj Patil ', 'kaustubhmpatil2000@gmail.com', 9325115780, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Plot no. 78 shivaji nagar jamner Tal.-Jamner dist.-Jalgaon', ''),
(539, '1851040', 'Nikhil Bhanudas Patil', 'nikhilbp99@gmail.com', 9607654713, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Kapadane,tal ,dist ,dhule', '');
INSERT INTO `student` (`stid`, `prn`, `Name`, `Email`, `mobile`, `branch`, `admi_year`, `status`, `Gender`, `Address`, `image`) VALUES
(540, '1851042', 'Ravsaheb ravindra patil', 'ravsaheb137@gmail.com', 8830659281, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Nimbhora Tal. Bhadgaon. Dist jalgaon ', ''),
(541, '1851043', 'Ajinkya Vishnu Pawal', 'ajinkyapawal1999@gmail.com', 9359631095, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Bhakti construction vishweshwar Nagar, Beed', ''),
(542, '1851047', 'Mohammad Aseem Gaffarsab Shaik', 'aseemshaikh2225@gmail.com', 8669074174, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Government Boys hostel, Jalgaon', ''),
(543, '1851049', 'Shailesh Vinayak Shinde', 'shindeshailesh7020@gmail.com', 7020906547, 'Civil Engineering', '2018-06-15', '0', 'Male', 'RM-103/2 near colgate company ,Bajajnagar ,Aurangabad.', ''),
(544, '1851050', 'Dhanashri Mahendra Sonavane.', 'dhanashrim1862000@gmail.com', 8275461406, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Jalgaon', ''),
(545, '1851051', 'VAIBHAV RAMESH SONONE', 'sonone364@gmail.com', 9689149661, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Arvi Dist.Wardha', ''),
(546, '1851052', 'Jayant Mohan Uttarwar ', 'jayantuttarwar2000@gmail.com', 9421513085, 'Civil Engineering', '2018-06-15', '0', 'Male', '20/29 Muktainagar ,Jalgaon, 425001', ''),
(547, '1851053', 'Vaishnavi Bhagwan Patil ', 'vbpatil942@gmail.com', 9370705285, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Jalgaon ', ''),
(548, '1851054', 'Prajwal Anil Veer', 'prajwalveer4@gmail.com', 7218956594, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Ambika Nagar Darwha, Dist. yavatmal', ''),
(549, '1851056', 'Anjali Rama Wankhade ', 'anjaliwankhade2000@gmail.com', 9552888073, 'Civil Engineering', '2018-06-15', '0', 'Female', 'At post ugwa ,akola ', ''),
(550, '1851057', 'Khomesh Ganesh Yerne ', 'yernekhomesh2018@gmail.com', 9370123669, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At post paraswada ta tirora dist Gondia ', ''),
(551, '1851059', 'Saurabh Prashant Zalte', 'saurabhpz158@gmail.com', 918308000000, 'Civil Engineering', '2018-06-15', '0', 'Male', 'At. Ranantri , Po.Ambashu ,Ta.Chikhali , Dist.Buldhana', ''),
(552, '1851060', 'Rupali dilip zope', 'rupalizope2020@gmail.com', 8888188747, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Zope wada varangaon', ''),
(553, '1852101', 'Sayyed Nouman Mushirali', 'sayyednouman53@gmail.com', 9404175366, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Latur', ''),
(554, '1852201', 'Snehal Prakash Birar', 'snehalbirar22@gmail.com', 9075695228, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Mamledar lane Malegaon Nashik', ''),
(555, '1852202', 'Bhagyashri Sanjay Dande', 'bhagyashridande@gmail.com', 9552428002, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Khadki, Akola, Maharashtra', ''),
(556, '1852204', 'Abhishek Ganesh Kamble', 'abhishekgkamble28@gmail.com', 8698295686, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Latur', ''),
(557, '1852207', 'NIRAJ NITARAM MOHURLE', 'nirajmohurle01@gmail.com', 918390000000, 'Civil Engineering', '2017-06-15', '0', 'Male', 'At. Kinhi, Post. Ekodi , Tah. Sakoli, Dist. Bhandara', ''),
(558, '1852210', 'Sameer Subhash Pachare ', 'sameerpachare1999@gmail.com', 9075537154, 'Civil Engineering', '2017-06-15', '0', 'Male', 'Pauni,  Dist-Bhandara', ''),
(559, '1852211', 'Samiksha Ramdas Ahire', 'samikshaahire29@gmail.com', 9168118311, 'Civil Engineering', '2017-06-15', '0', 'Female', 'Flat No.3-A, Watsalykunj Apartment, Makhmalabad Naka, Panchavati, Nashik.', ''),
(560, '1852212', 'Bhagyashree Dipak Sonar', 'bhagyashreesonar1211@gmail.com', 9168170276, 'Civil Engineering', '2017-06-15', '0', 'Female', 'At. Post Lasur, Taluka Chopda, District Jalgaon', ''),
(561, '1901001', 'Shashikant Gawade aakash', 'aakash123gawade512@gmail.com', 8149667076, 'Mechanical Engineering', '2019-06-15', '0', 'Male', '96 Narendra nagar saiful vijapur road solapur', ''),
(562, '1901002', 'Aniket Kailas Survase', 'aniketsurvase3@gmail.com', 7666650527, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'RM 129/ 3, Bajajnagar, Waluj MIDC, Aurangabad', ''),
(563, '1901005', 'Anup Gosai Awari ', 'anupawari143@gmail.com', 8669890421, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Nilapur wani yavtamal Maharashtra ', ''),
(564, '1901006', 'Budha Laganya Bagul', 'budhabagul001@gmail.com', 9075951178, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At: mogarpada Post Shendwad Tal, Tost, Dhule.', ''),
(565, '1901008', 'Sakshi Hemant Borekar', 'sakshihb2001@gmail.com', 9970028275, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'Near shree ram temple old tahasil Drayapur district Amravati', ''),
(566, '1901010', 'Payal Mohan Chaudhari', 'pmchaudhari910@gmail.com', 7888251521, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'At post Palso, Dist. Akola', ''),
(567, '1901011', 'Rupesh Yogendra Chaudhari', 'rc12chaudhari@gmail.com', 7522920895, 'Mechanical Engineering', '2019-06-15', '0', 'Male', '92/4 shamrav nagar jalgaon', ''),
(568, '1901012', 'Daanial Khan Ayube Khan Rahi', '90daanialk@gmail.com', 7057073635, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'near new Eidgah, khadka road,Bhusaval.', ''),
(569, '1901016', 'Diksha juganu gaikwad', 'dikshagaikwad26011@gamil.com', 9673978577, 'Mechanical Engineering', '2019-06-15', '0', 'Female', '29,samarth nagar, sakri road, dhule -424001', ''),
(570, '1901019', 'Sakshi Ganesh Gawali ', 'sakshigawali5@gmail.com', 9359867743, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'C/o Ganesh Gawali.01 vishwakarma sahniwas sakri road dhule 424001', ''),
(571, '1901020', 'Vishal Prakash Ghorad', 'vishalghorad4@gmail.com', 7219363070, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Juna Hingna post old city Akola Maharashtra', ''),
(572, '1901021', 'Neha Shivkumar Harinkhede', 'nehaharinkhede777@gmail.com', 7020897046, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'Rajabhoj colony, Ring road , Gondia', ''),
(573, '1901025', 'Jaglekar Sahebrao Chandu', 'jaglekarsahebrao@gmail.com', 9112413697, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At-Karegaon tq-Dharmabad Dist-Nanded\nPost-Atala pin code-431808', ''),
(574, '1901026', 'Kalyani vijay khade', 'khadekalyani10@gmail.com', 8668833258, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'At. Gundi ta .Manora , dist. Washim Maharashtra', ''),
(575, '1901027', 'Vishal Kanade', 'vishalkanade3007@gmail.com', 919325000000, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Nashik', ''),
(576, '1901028', 'Prajwal motilal khandare', 'prajwalkhandare746@gmail.com', 7666695260, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Lig168 madha colony khat road bhandara', ''),
(577, '1901029', 'Khode Swati Gajanan', 'swatikhode50@gmail.com', 8530523230, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'Warora. Dst- Chandrapur', ''),
(578, '1901031', 'Omkar Baburao Kokate', 'omkarkokate501@gmail.com', 8857881896, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Swaraj Nagar Barshi Road, Beed.', ''),
(579, '1901032', 'Sanket Ajay Kolte', 'sanketkolte375@gmail.com', 7666328801, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At punhai Ta+Post. Motala Dist. Buldhana', ''),
(580, '1901033', 'Vrushali Arun Kunte', 'vrushalikunte4801@gmail.com', 8080084356, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'Post, bhodhegaon, district=Aurangabad,taluka = phulambri', ''),
(581, '1901040', 'Ajay Dagadu patil', 'adpatil18052001@gmail.com', 9022157221, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'plot no 1, gat no 76, mayur colony , pimprala , jalgaon', ''),
(582, '1901041', 'Chetan sanjay patil', 'chetan06042001@gmail.com', 8855817155, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Shivaji nagar,pailad,Amalner, Dist-Jalgaon', ''),
(583, '1901043', 'Manish Digambar Patil', 'manishpatil.samratmp2001@gmail.com', 9309559636, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Old Malegaon Road,Chalisgaon,Jalgaon ', ''),
(584, '1901045', 'Abhishek Popat Pawar', 'abhishekpawar2402@gmail.com', 9763883747, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Shivaji Nagar , dondaicha ,Tel Shinkheda district Dhule', ''),
(585, '1901047', 'Pushkaraj Mahesh Sant', 'pushkarajsant1@gmail.com', 9370450714, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Parola, jalgaon', ''),
(586, '1901048', 'Shantanu Dnyaneshwar Deshmukh', 'shantanu.deshmukh1404@gmail.com', 8605241649, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At yarmal post bhansara TQ Arni dist yawatmal', ''),
(587, '1901049', 'Kunal Umesh Taji', 'kunaltaji570@gmail.com', 7522996571, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At. Po. Paradh bk. Ta. Bhokardan, Dist. Jalna', ''),
(588, '1901051', 'Manmohan kishanchand Thakur ', 'manmohanthakur746@gmail.com', 7745006879, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Near bhagade hospital washim ', ''),
(589, '1901052', 'Krushna Akrur  Ugale', 'krushnaugale3640@gmail.com', 7219319672, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Nariman Nagar ', ''),
(590, '1901053', 'Prathmesh shridhar vyavhare', 'shridharvyavhare8@gmail.com', 7447367639, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'Madina chowk pusad', ''),
(591, '1901054', 'Sakshi raghupati wakode', 'sakshiwakode@rediffmail.com', 9359948713, 'Mechanical Engineering', '2019-06-15', '0', 'Female', 'Tompe nagar, chandur bazaar, district : amravati', ''),
(592, '1901057', 'Yash Gajanan Shinde', 'yash1772000@gmail.com', 8805810880, 'Mechanical Engineering', '2019-06-15', '0', 'Male', 'At.po.Hiwara sangam tk.Mahagaon\nDis.Yavatmal', ''),
(593, '1902202', 'Sakshi Dilip Birajdar', 'sakshibirajdar16@gmail.com', 8421597244, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Manthale Nagar, latur', ''),
(594, '1902203', 'Dhruv Roy', 'dhruvroy20@gmail.com', 8275011530, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Flat number-102 Dwarkamai Apartments, Plot number-38, Wanjari Nagar, Ajni, Nagpur, 440003', ''),
(595, '1902204', 'Shital suresh dongre', 'shital.dongre251097@gmail.com', 8237775106, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Sugat nagar ,near sugat budhha vihar, jariptka ring road , Nagpur.440026', ''),
(596, '1902205', 'NIKHIL ANIL GADEKAR', 'nikhilgadekar1234@gmail.com', 8379945601, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Chintamani nagar, parsodi road, dhamangaon rly, -444709, dist. Amravati', ''),
(597, '1902206', 'ADITYA ANIL MATHANKAR', 'adityamathankar@rediffmail.com', 7020166254, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Hari Om Nagar,Takalghat, Tah Hingana, Dist. Nagpur,441122', ''),
(598, '1902207', 'Kalpesh Sanjay Patil ', 'kspkalpu2000@gmail.com', 8888030691, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Vatika Ashram, Near Khote Nagar,Plot no:-38,Gat no:-109,Jalgaon[425001]', ''),
(599, '1902208', 'Snehal Bharat Patil', 'snehalbpatil2000@gmail.com', 8530873047, 'Mechanical Engineering', '2018-06-15', '0', 'Female', 'Chintamani moraya nagar dharangaon', ''),
(600, '1902209', 'Gaurav Rameshwar Uikey', 'gauravuikey7501@gmail.com', 9527849601, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'Chinchfail Near santoshi mata mandir Railway Station Road Amravati 444602', ''),
(601, '1902210', 'ANAND RAMDAS WAGH', 'waghanand1999@gmail.com', 9673846861, 'Mechanical Engineering', '2018-06-15', '0', 'Male', 'At post Bodwad Dist-Jalgoan , Maharashtra.', ''),
(602, '1911003', 'Gouri Ganesha Bhandarkar ', 'gouribhandarkar2002@gmail.com', 9552911150, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', '28 Ganesh colony  Jalgaon ', ''),
(603, '1911004', 'Manasi Tryambak Chaudhari ', 'chaudharimanasi87@gmail.com', 7796371976, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Plot no 8/1,bhushan colony, near gov. Eng. College, jalgaon', ''),
(604, '1911005', 'Divesh Digambar Chinawale', 'dchinawale@gmail.com', 7083349170, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Plot no 6-2 gat no 54-1-A , shiv colony, Jalgaon', ''),
(605, '1911006', 'Chaitali Lalitrao Chitade ', 'chaitalichitade2002@gmail.com', 9923021469, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Pl.no.141 ,Saubhgya Nagar ,Hudkeshwar Road,Nagpur ', ''),
(606, '1911007', 'Shreya Jitendra Dayma ', 'shreyadayma621@gmail.com', 9834524461, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Ayodhya nagar,  near balaji temple ,jalgaon ', ''),
(607, '1911008', 'Sanket Subhash Devray', 'devraysanket@gmail.com', 9834193194, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'At. Post kukana\nTel. Nevasa\nDist. Ahmadnagr\n414604', ''),
(608, '1911009', 'Pooja Bhaskar Dhage', 'poojadef70@gmail.com', 9657682562, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Jalgaon (,jamod) 443402 buldhana, Maharashtra.', ''),
(609, '1911011', 'Krushna Mahadu Gaware', 'krushnagaware653@gmail.com', 8805380803, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'At pimprala post kurunda TQ Basmath Dist Hingoli', ''),
(610, '1911012', 'Vedant Vijay Joshi', 'vedantjoshi4406@gmail.com', 8788615689, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'P-1, 12/8, vitthal nagar, N-2, CIDCO, Aurangabad.', ''),
(611, '1911013', 'SACHIN PRALHAD KAMBLE', 'spk9021105782@gmail.com', 8698273836, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'AT POST:PETHPIMPLEGAON   TQ:PALAM \n   DIST:PARBHANI', ''),
(612, '1911015', 'Rupali Sunil Khole', 'rkhole24@gmail.com', 9307263282, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'At Fuli Post Khaira Taluka Nandura District Buldhana', ''),
(613, '1911018', 'Gaurav manmath mathpati ', 'gauravmathpati7020@gmail.com', 7020769265, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Jay bhavani nagar n2 cidco aurangabad ', ''),
(614, '1911019', 'Divya Satishappa Naringe', 'divyanaringe01@gmail.com', 8080451819, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Near Dutta mandir, Bhartipura, Karanja (lad), dist. Washim(444105) ', ''),
(615, '1911020', 'Shivam Anand Neware', 'shivamneware9@gmail.com', 8208504493, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', '201,3rd floor,Satyam Tower,Ganeshdham,Hudkeshwar,NAGPUR.', ''),
(616, '1911021', 'Srushti Keahao Nimkar', 'srushtinimkar2001@gmail.com', 7385879569, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Rajni Nagar Khat Road Buandara', ''),
(617, '1911022', 'Pranali Nilkanth Patil ', 'pranalipatil20190@gmail.com', 7385732555, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Female', 'Siradhon , Malkapur Dist. Buldhana ', ''),
(618, '1911025', 'YOGESH RAHANE', 'yogeshrahane45@gmail.com', 7775803744, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Rahata', ''),
(619, '1911027', 'Utkarsh laxmikant Singh', 'utkarsh989s@gmail.com', 9067589131, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'Jai mauli society,plot no. 46/house no.6 n6 cidco bajrang chowk aurangabad 431001. Maharashtra', ''),
(620, '1911029', 'Aditya Anil Wani', 'wani.aditya14@gmail.com', 7218186138, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', '43/3 Gayatri Nagar, Shirsoli Road, Jalgaon', ''),
(621, '1912201', 'Arti Shankar Chavan', 'artichavanmit9325@gmail.com', 9325624737, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'At. Vajnapur Tq. Gangapur Dist. Aurangabad', ''),
(622, '1912202', 'Deepak Pramod Dhake', 'deepakdhake99@gmail.com', 7588437804, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Gat no.291/15/8808, Bhikamchand Jain Nagar , Pimprala road, near yash lawn , Jalgaon - 425001', ''),
(623, '1912203', 'Kailas Anil Deore', 'devrekailas1@gmail.com', 9172673447, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At post debhegaon,tq Kannad dist Aurangabad', ''),
(624, '1912204', 'Gauri Kishor Pawar', 'pawargauri0309@gmail.com', 8956272230, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'P.S.Pawar, dudhsagar sosyt chouck, near shanimandir , kedgaon Arngaon road, 414005', ''),
(625, '1912205', 'Prerna Nishikant Kayde', 'prernakayde@gmail.com', 7387419020, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Vitthal vishwa apartment, pangari road, Beed.', ''),
(626, '1912206', 'Shubham Devendra Kharche', 'skharche11@gmail.com', 9175989253, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'Vishnu nager salipura Malkapur dist: Buldhana', ''),
(627, '1912207', 'Nirupam gawali ', 'nirupamgawali@gmail.com', 9309176566, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'infront of kendriya vidhyalaya 2, MIRC ,solapur road ,Ahmednagar ', ''),
(628, '1912208', 'Sneha Sanjay Palaspagar ', 'snehap0414@gmail.com', 8605402656, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Ganori post Dahihanda Taq&District Akola 444111 ', ''),
(629, '1912209', 'Archana Rajesh Patil', 'ap803451@gmail.com', 8625996914, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Shree Sai row banglow ro-house no.1 upendranagar cidco nashik -422010', ''),
(630, '1912210', 'Dipak Suresh Patil', 'patildipak091@gmail.com', 7066073042, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Male', 'At Post: Balad BK, City:Pachora, Dist: Jalgaon', ''),
(631, '1912211', 'Falguni Nana patil.', 'patilfalgunin@rediffmail.com', 9689755864, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'Plot no 114,adarsh  nagar , jalgaon', ''),
(632, '1912212', 'Sujata Sanjay Patil', 'patilsujatas@rediffmail.com', 7770064232, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', '2 parakh nagar, south of girna water tank, jalgaon', ''),
(633, '1912214', 'Vaishnavi Gunvant Sapkale', 'vaishnavisapkale2@gmail.com', 7875575883, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', '643, Vitthal Peth, June Jalgaon, Jalgaon. ', ''),
(634, '1912216', 'SAMRUDDHI SANJAY SHINDE ', 'sssamruddhi08@gmail.com', 9404514542, 'Electronics & Telecommunicatio', '2018-06-15', '0', 'Female', 'PLOT NO. 37, SATGURU NAGAR, M.I.D.C. AREA, JALGAON.', ''),
(635, '1921001', 'PRADYUMNA PRAFULLA BADE', 'praashok696@gmail.com', 9404313194, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'Nehru ward hinganghat ', ''),
(636, '1921003', 'Sudarshan bhaskarrao Darade', 'sudarshandarade21@gmail.com', 91618151912, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'At Post Wassa Tq Jintur Dist parbhani ', ''),
(637, '1921005', 'ROSHAN BALKRUSHNA DHAWALE ', 'dhawaleroshan2808@gmail.com', 7350252060, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'At.post Bhatori,  Tq.Murtijapur, Dist.Akola', ''),
(638, '1921009', 'Ashvin Dilip Khond', 'ashvinkhond2016@gmail.com', 8459540134, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'At .post Kodri 444201', ''),
(639, '1921013', 'VISHAL AMBADAS PAWAR', 'vp882001@gmail.com', 7507461754, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'Abhishek Niwas, Vaibhav Nagar , \n Malegaon Road, Nanded', ''),
(640, '1921015', 'Nikhil Randhir', 'nrahulr20@gmail.com', 9075103226, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'A/p ranjangaon desh. Tal kopargaon, Ahmednagar 423605', ''),
(641, '1921019', 'Pallavi Ganesh Salunke', 'pallavigsalunke@gmail.com', 7083930054, 'Instrumentation Engineering', '2019-06-15', '0', 'Female', 'Anturli, Tal- Muktainagar', ''),
(642, '1921023', 'Ankush Ramdas Tayde', 'taydea610@gmail.com', 918460000000, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'At post Sawarkhed\n', ''),
(643, '1921025', 'Sayli Rumdeo Thengane ', 'saylithengane2018@gmail.com', 8669224327, 'Instrumentation Engineering', '2019-06-15', '0', 'Female', 'Sant tukdoji ward nandori road, beside gajanan traders,hinganghat,wardha ', ''),
(644, '1921030', 'Kiran Laxman Ware', 'kiranware48@gmail.com', 7028801682, 'Instrumentation Engineering', '2019-06-15', '0', 'Male', 'Shivraj Nagar, Daund, dist.- Pune', ''),
(645, '1922101', 'Shraddha sunil tehare', 'shradhatehare@gmail.com', 7066380273, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Ramnagar colony H. No. 91, jalna', ''),
(646, '1922201', 'Rohit Bhole', 'rohitbhole2000@gmail.com', 7448138721, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Yashodham Colony Malkapur', ''),
(647, '1922202', 'Parag pramod chaudhari', 'paragchaudhari403@gmail.com', 9765194344, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At post - chinawal tal- raver,dist-jalgaon', ''),
(648, '1922203', 'Suraj Babruwan Gaikwad', 'surajgaikwadsg358@gmail.com', 9049190546, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'at post kasar balkunda tq nilanga dist latur', ''),
(649, '1922205', 'chaitanya arvind kawade', 'chaitanyakawade1714@gmail.com', 8975959926, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'A/p tandulwadi kalyaninagar tal baramati dist pune', ''),
(650, '1922206', 'Neha Sanjay Khewalkar', 'nehakhewalkar3@gmail.com', 9112763314, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Santaji nagar,baher peth Bodwad\nDist-Jalgaon', ''),
(651, '1922207', 'Keshav Dilip Korke', 'korkekeshav@gmail.com', 8459836567, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At. Pimpalgaon (Korka) post. Rahathi tq. Dist. Nanded Maharashtra-431602', ''),
(652, '1922208', 'Padole Abhishek Rameshappa', 'padoleabhi1231@gmail.com', 7620291980, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Near saibaba school hanumangadh nanded-431605', ''),
(653, '1922209', 'Rushikesh Tukaram Palaskar ', 'rushikeshpalaskar6@gmail.com', 7517025430, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Gandhi Nagar, Nanded.', ''),
(654, '1922210', 'Ganesh Prabhakar Patil', 'ganeshppatil75@gmail.com', 7745871897, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At.chawardha, tal.motala, dist.buldhana', ''),
(655, '1922211', 'Pawar Suraj Arun', 'surajp9121999@gmail.com', 9665923169, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'At Samarth Nagar,17/10, H M Road, Kalyan(east) 421306', ''),
(656, '1922212', 'Sushil Puri ', 'sushilpurri1997@gmail.com', 9146457310, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Old pedgaon road prabhavati nagar parbhani ', ''),
(657, '1922214', 'Prajwal Vilasrao Tekade', 'prajwaltekade12345@gmail.com', 9657323245, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', 'Dhanaj (kd) Ta.:- karanja(Lad) Dist.:-Washim', ''),
(658, '1922216', 'Yash Narendra Patil', 'yash1199patil@gmail.com', 9970386558, 'Instrumentation Engineering', '2018-06-15', '0', 'Male', '32, Jai Nagar, near Omkareshwar temple, Jalgaon, 425001', ''),
(659, '1922217', 'Ankita Rajendra Yetale', 'ankiyetale7997@gmail.com', 7447473632, 'Instrumentation Engineering', '2018-06-15', '0', 'Female', 'Sangli, tal-sangli dist :-sangli State-maharshatra', ''),
(660, '1931001', 'Abhishek Dattatray Thorat', 'abhishekthorat17ab@gmail.com', 7972207689, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Manchar,Pune', ''),
(661, '1931003', 'Komal Narayanrao Basunde ', 'basundekomal@gmail.com', 8408873415, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'At post wandali ,Ta.warud ,Dist.Amravati. ', ''),
(662, '1931007', 'Nishant Narendra Gaikwad ', 'nishantgaikwad2001@gmail.com', 8698233865, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Sanjay Nagar Mothi Umari Akola, Akola ', ''),
(663, '1931008', 'Vijay Sukhadev Ghadge ', 'vijayghadge1009@gmail.com', 7820870419, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At. Wadali, Post: Jatnandur, Tal: Shirur(Kasar), Dist: Beed', ''),
(664, '1931013', 'Minal Rajesh Kathale', 'minalkathale14@gmail.com', 7447253801, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'At post - jarud , ta - warud , Dist - Amravati ', ''),
(665, '1931014', 'yogendra Topsing katre', 'yogendrakatre3@gmail.com', 9579139871, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'at post mhasgaon ta goregaon dis gondia', ''),
(666, '1931015', 'Sail Keshav Kharwade', 'sailkharwade@gmail.com', 9168267829, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Matrusmruti Nagar Khat Road , Bhandara', ''),
(667, '1931021', 'Pooja vijay nannavare ', 'poojanannaware773@gmail.com', 7666449187, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Beed', ''),
(668, '1931022', 'Prajwal Suresh Narkhede ', 'prajwalsn2001@gmail.com', 9834407480, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At post Borakhedi Ta Motala ', ''),
(669, '1931023', 'Bhushan satish pagar ', 'bhushanpagar2000@gmail.com', 9766473594, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At post kalamdhari tal nandgaon, nashik ', ''),
(670, '1931026', 'Dhanraj Pandurang Sahave', 'dpsahave2001@gmail.com', 9307948618, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At punhai tq po motala dist buldhana\n443103', ''),
(671, '1931027', 'MAYUR VASANTRAO SATBHAI', 'mayursatbhai2506@gmail.com', 7030474016, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At post Rasulabad ta. Arvi dist. Wardha', ''),
(672, '1931028', 'Geetika Niraj Sawkare ', 'sawkaregeetika@gmail.com', 9207560211, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Near Bank of india, jamer road, bhusawal', ''),
(673, '1931031', 'SHIVAM WASUDEO MHATARMARE', 'shivammhatarmare@gmail.com', 919607000000, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'JAGRUTI NAGAR NEAR AAI MANGAL KARYALAY KARANJA', ''),
(674, '1931032', 'SHRUTI HEMANT PATIL', 'shrutisama8@gmail.com', 7385110758, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'AJAY COLONY IMR COLLEGE HARSH RESIDENCY THIRD FLOOR FLAT NO 12RING ROAD JALGAON', ''),
(675, '1931037', 'Nikhil Mahavir Sutey', 'mns9421326393@gmail.com', 9421326393, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Ramai nagar new bhokardan', ''),
(676, '1931040', 'Sayali yashwant tayade', 'sayaliyt2002@gmail.com', 9307260098, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Near 2nd bus stop daryapur shivar O.F.Varangaon Tal.Bhusawal Dist. Jalgaon', ''),
(677, '1931041', 'Ankit Sumedh Telgote', 'ankittelgote411@gmail.com', 7666030577, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Akola', ''),
(678, '1931042', 'Apurva Arunrao Thangan', 'apurvathangan2025@gmail.com', 7498912225, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Arun Ganpatrao Thangan,Ward no.4, near shivaji college, Mowad, Taluka Narkher, District Nagpur.', ''),
(679, '1931044', 'SUMIT SUKHADEO VAIDYA', 'sumitvaidya1000@gmail.com', 9373231784, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'At TIRORA 441911', ''),
(680, '1931045', 'Vidhi vinod shende ', 'vidhishende222@gmail.com', 9834366085, 'Electrical Engineering', '2019-06-15', '0', 'Female', 'Old b-32 Shakti nagar wcl colony chandrapur ', ''),
(681, '1931046', 'Manoj Rajesh Zagekar', 'manojzagekar2000@gmail.com', 9673499312, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Berdipar ', ''),
(682, '1931048', 'Abhay Manhas ', 'abhaymanhas88222@gmail.com', 6005293207, 'Electrical Engineering', '2019-06-15', '0', 'Male', 'Jammu & Kashmir ', ''),
(683, '1932201', 'MD MAAZ MD ARSHAD ALI', 'maazali.royal@gmail.com', 8857069699, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Osmanpura, Aurangabad', ''),
(684, '1932202', 'Swapnali Ratnakar Borade ', 'swapnaliborade122@gmail.com', 9421162080, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Yashwant nagar sailu', ''),
(685, '1932203', 'BUDDHABHUSHAN LILADHAR BRAMHAN', 'buddhabhushan2122@gmail.com', 9637738131, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At Post Asalgaon Taluka Jalgaon Jamod Dist Buldana', ''),
(686, '1932204', 'Raviraj Rajaram Chavan', 'ravirajchavan071@gmail.com', 7385251127, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Balaji Nagar taroda Bk Nanded', ''),
(687, '1932205', 'Vishal Eknath Daud', 'vishaldaud2001@gmail.com', 9604950339, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'At post Anvi Ta.Sillod DIST. Aurangabad', ''),
(688, '1932206', 'Neha Chandanlal Kaushalye', 'nehakaushalye27@gmail.com', 9307915550, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Mahavir Chowk main road khamgaon', ''),
(689, '1932207', 'Mukund Ramchandra kharde', 'mukundkharde11@gmail.com', 8999019212, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'A/p- Bhagwatipur,Tal-Rahata\'Dist-Ahmednagar,loni road ,413710 ', ''),
(690, '1932208', 'Shruti Ambadas Mhasal', 'shrutimhasal5@gmail.com', 9422486842, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Civil Court Colony, Nandura road, Sutala Bk., Khamgaon. Dist:- Buldhana.', ''),
(691, '1932209', 'Chetana N. Patil', 'patilchetana2000@gmail.com', 7447533857, 'Electrical Engineering', '2018-06-15', '0', 'Female', 'Main Road, Nhavi.\nPin- 425524\nTal. - Yawal \nDist.- Jalgaon', ''),
(692, '1932210', 'Rahul Sunil Kharat', 'kharatrahul2610@gmail.con', 7972222359, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Rly Q No. 1241/C , North colony, Kandari, bhusawal\nDist. Jalgaon\nMaharashtra', ''),
(693, '1932211', 'Veer Ganesh Pandurang', 'veerganesh9405@gmail.com', 8624010818, 'Electrical Engineering', '2018-06-15', '0', 'Male', 'Georai', ''),
(694, '1941004', 'Aparna Shivhari Bhagwat', 'aparnabhagwat24@gmail.com', 7249458539, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Renuka Nagar, Muktainagar', ''),
(695, '1941006', 'Achal Dharmpal Bodalkar', 'achalbodalkar0301@gmail.com', 8080044917, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Ward no. 14,Mul,dist chandrapur', ''),
(696, '1941007', 'Yash Dilip Chandekar ', 'yashchandekar1520@gmail.com', 9325830695, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Ishwar nagar batra layout mahsala wardha ', ''),
(697, '1941010', 'Tanushka Jitendra Chaudhari', 'chaudharitanushka677@gmail.com', 9518366746, 'Computer Engineering', '2019-06-15', '0', 'Female', '45,b, ramkrushna nagar, taloda ', ''),
(698, '1941011', 'Swapnil Kailas Dange', 'dangeswapnil12@gmail.com', 8080055273, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post Phulwal ta Kandhar di Nanded', ''),
(699, '1941012', 'Eshwar Shantiram Dhawle', 'eshwardhawle90@gmail.com', 7264078332, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At thigalkheda tq Bhokardan dist jalna', ''),
(700, '1941016', 'Vaibhavi vilas gaikwad', 'vaibhavigaikwad2001@gmail.com', 9356684418, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Gaikwad galli, kille dharur, dist. Beed', ''),
(701, '1941018', 'Gaurav Suresh Gavhane', 'gauravgavhane1702@gmail.com', 8888581203, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Bhenda, Tal. Newasa , Dist. Ahmednagar', ''),
(702, '1941019', 'Saurabh Diliprao Ghuge', 'saurabhghuge74@gmail.com', 9579354717, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post. Pangrabandi taluka Malegaon district washim', ''),
(703, '1941021', 'SHREYA UDAY JOGDAND ', 'shreyajogdandpatil@gmail.com', 9325116924, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Subhash road, beed', ''),
(704, '1941022', 'Vipul Ganesh Junghare', 'vipuljunghare05@gmail.com', 9130254757, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Saraswati Nagar Bodwad District Jalgaon', ''),
(705, '1941023', 'KATKADE TEJAS GANPAT', 'tejaskatkade2@gmail.com', 9518303023, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At. katkarwadi Ambajogai dist. beed 431519', ''),
(706, '1941026', 'Pratik Astak Koparkar', 'pratiak01@gmail.com', 7507758698, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At: Nagthana , post: Sawargaon (rokda),  Dist: Latur', ''),
(707, '1941028', 'Krunal Prakash Kurkure ', 'krunalkurkure2721@gmail.com', 9307653001, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Zope wada, Varangaon ', ''),
(708, '1941030', 'Saurabh Ghansham Lanjewar', 'saurabhlanjewar66506@gmail.com', 9325165417, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Samta nagar medha road bhandara', ''),
(709, '1941031', 'Abhijit Bhausaheb lingse', 'abhijitlingse132132@gmail.com', 9423560340, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Ad.pandharwadi post rajpimpari tq georai DIST beed', ''),
(710, '1941032', 'Mayur Prakash Mali', 'mayurmali128@gmail.com', 7709001495, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post Paladhi Tal Jamner Dist Jalgaon', ''),
(711, '1941033', 'Riya Hiralal Mehta ', 'riyumehta0@gmail.com', 7219102962, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Anandeshwar lakhala road , Washim', ''),
(712, '1941034', 'Shrikant Anshul Meshram', 'dranshulm16052001@gmail.com', 8830085737, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Gautam Buddha Ward, Bhandara, Maharashtra', ''),
(713, '1941035', 'Bhagwat Devidas Mohite', 'bhagwatmohite2000@gmail.com', 7057857829, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Dist:Parbhani,Tq:purna,At: Mahagaon', ''),
(714, '1941036', 'Kalpesh Mohan Palve', 'kmpalve5266@gmail.com', 8237475055, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Plot no 45, kothari nagar near harivitthal nagar ,jalgaon 425001', ''),
(715, '1941037', 'Aashwini Ramkrushna Patil', 'ashupatil1905@gmail.com', 9146153185, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Shanipeth,Chopda Road Amalner,DIST - Jalgaon.', ''),
(716, '1941039', 'Narayan Shriram Patil', 'nspatilme@gmail.com', 9373569570, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post NIMKHEDI BK TEH-MUKTAINAGAR DIST-JALGAON \nPIN-425327', ''),
(717, '1941040', 'Naval Digambar Patil', 'naval976583@gmail.com', 9112837969, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post Pathari, Tal&Dist-Jalgaon', ''),
(718, '1941041', 'Tejaswini Bhagawan Patil ', 'teju1772@gmail.com', 8850268919, 'Computer Engineering', '2019-06-15', '0', 'Female', 'At Bhod Bk. Post - Pimpri Khali Tal - Dharangaon Dist - Jalgaon ', ''),
(719, '1941042', 'TRUPTI NANDKISHOR RAJHANS ', 'truptirajhans2018@gmail.com', 8888478178, 'Computer Engineering', '2019-06-15', '0', 'Female', 'sai nagar ,parola , dist. Jalgaon', ''),
(720, '1941043', 'Raman Mankar', 'ramanrsm123@gmail.com', 9763086367, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Ramnagar, Wardha', ''),
(721, '1941045', 'Vaishali Vijaysing Sabale', 'sablevaishali2@gmail.com', 9307930641, 'Computer Engineering', '2019-06-15', '0', 'Female', 'At-Nalkund Taluka-Motala District-Buldana', ''),
(722, '1941046', 'Mrunali Dilip Kumar Sakure', 'msakure444@gmail.com', 9284712009, 'Computer Engineering', '2019-06-15', '0', 'Female', 'At post Karti buz tah-tirora dist-,gondia', ''),
(723, '1941047', 'Krushna shivaji sase', 'krushnasase999@gmail.com', 7498182007, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Beed, Asthi', ''),
(724, '1941048', 'SHARAD JALINDAR KANGUDE', 'skangude05@gmail.com', 919596000000, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Ahmednagar', ''),
(725, '1941049', 'Pravin Mahendra Shendre ', 'pravinshendre148@gmail.com', 8390724390, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At post. Virli KHANDAR rah pauni dist bhandara ', ''),
(726, '1941050', 'Snehal Shivaji Shirude', 'snehalshirude07@gmail.com', 7499173064, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Shivshakti nagar near bholebaba Darbar takli pr Chalisgaon district jalgaon', ''),
(727, '1941051', 'Amit Kishor Surkar', 'amitsurkar1232@gmail.com', 9518748935, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Telipura ,ward no.1 ,wardha', ''),
(728, '1941052', 'Ashlesha Sunil Tayade', 'ashleshatayade@gmail.com', 8552924956, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Near Jijau Convent, Veer Sawarkar Nagar, Chikhli, dist.Buldana', ''),
(729, '1941053', 'Dinesh Lobhan Telang', 'dineshtelang29@gmail.com', 7775049972, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At birsaipeth post patan tq zari dust yavatmal 445305', ''),
(730, '1941054', 'Rohit Narayan Telgote', 'rohittelgote23@gmail.com', 9022531745, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Mhada colony,khapri(Rly), Nagpur', ''),
(731, '1941055', 'Megha Shriram Thakare', 'meghathakare135@gmail.com', 7767030767, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Kothari khadan, Shivapur,Akola,Akola.', ''),
(732, '1941056', 'Sahil Wasudeorao Thakare', 'thakaresahil678@gmail.com', 7391909068, 'Computer Engineering', '2019-06-15', '0', 'Male', 'At.Po.Ta.Ashti,Dist.Wardha, Maharashtra', ''),
(733, '1941057', 'Arti Vishnu Wagh ', 'artiwagh04@gmail.com', 9923323538, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Vanjar Umbrad,Post Gondegaon,T.Q.Dist.Jalna', ''),
(734, '1941058', 'Antara Ramesh Wakte', 'antarawakte@gmail.com', 9307965939, 'Computer Engineering', '2019-06-15', '0', 'Female', 'Radhe Radhe Colony,near Saraswati School, Akot, Dis Akola, 444101', ''),
(735, '1941060', 'Yash Patil', 'pyash3491@gmail.com', 9669297677, 'Computer Engineering', '2019-06-15', '0', 'Male', 'B-63 shantingar MHOW , INDORE (M.P.) ', ''),
(736, '1941061', 'Rajasee Milind Yeole ', 'rajaseeyeole23@gmail.com', 8411894603, 'Computer Engineering', '2019-06-15', '0', 'Female', '28, Shantiniketan society, Near Ajanta Chowk, Old MIDC, Jalgaon- 425001', ''),
(737, '1941064', 'Pradnyesh Jagdish Lawankar', 'plawankar28@gmail.com', 9423861403, 'Computer Engineering', '2019-06-15', '0', 'Male', 'Plot No 10, Gopal Nagar 2nd bus stop ,Nagpur ,Maharashtra', ''),
(738, '1942101', 'Smita Rajendra Pokale', 'srpokale221@gmail.com', 9975879931, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Gadge chowk, ward no. 6 Jarud, Ta. Warud, Dist. Amravati, 444908', ''),
(739, '1942102', 'Shweta Vinayak Patil ', 'shwetavp893@gmail.com', 9850433837, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Ganesh wadi, Jalgaon ', ''),
(740, '1942103', 'Dipika Bhagirath Marathe', 'dipika2000marathe@gmail.com', 7900155975, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Gat no -54/3,shiv colony,jalgaon', ''),
(741, '1942104', 'Aniket Sukhdev Brahmankar', 'aniketb91299@gmail.com', 9623012769, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Janta Colony, ring road Gondia', ''),
(742, '1942201', 'Aishwarya Pradeep Zope', 'vmahajan2009@gmail.com', 9422230056, 'Computer Engineering', '2018-06-15', '0', 'Female', '27,Nutan Varsha Colony near Mohody road Jalgaon', ''),
(743, '1942202', 'Rani Sandu Bansode', 'ranibansode166002@gmail.com', 8010858310, 'Computer Engineering', '2018-06-15', '0', 'Female', 'At Post Banoti, Tal : Soygaon, Dist : Aurangabad (431150)', ''),
(744, '1942203', 'Harshali Ramesh Gavali', '134harshugavali@gmail.com', 8975488797, 'Computer Engineering', '2018-06-15', '0', 'Male', '   Tal.Kalwan , Dist. Nashik', ''),
(745, '1942204', 'Isha Yogesh Jangle', 'jangle.isha11@gmail.com', 7721919938, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Plot No,15/1 ,Satguru Nagar old MIDC, Jalgaon', ''),
(746, '1942205', 'Pooja Sanjay Marathe', 'poojasm2907@gmail.com', 8625837698, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Plot no 28, nehru nagar, shirsoli road, jalgaon.', ''),
(747, '1942207', 'Vaibhav Bharat Sontakke ', 'justinvibhu121@gmail.com', 7387385163, 'Computer Engineering', '2018-06-15', '0', 'Male', 'Chadrapur ', ''),
(748, '1942209', 'Bhagyashri Bhalchandra Talele', 'bbtalele510@gmail.com', 7887344749, 'Computer Engineering', '2018-06-15', '0', 'Female', 'Plot No 12  Murlidhar Nagar , Behind hotel kamal paradise, Jalgaon', ''),
(749, '1942210', 'Swati Bhagwan Udgire', 'swatibhagwanudgire@gmail.com', 9130364717, 'Computer Engineering', '2018-06-15', '0', 'Female', 'At. bhendegaon. Post-Shewadi(BA) Tq.Loha. Dist.Nanded.', ''),
(750, '1951001', 'Sanskruti Sanjay Bhagat', 'sanskrutibhagat0903@gmail.com', 9552686874, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Sant tukdoji ward, Pradhnya Nagar, hinganghat', ''),
(751, '1951002', 'Yash Nivrutti Bhalerao', 'yashbhalerao74@gmail.com', 8999363557, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Gut number 9/2/1B Plot number 27 Om shanti nagar primpala Jalgoan', ''),
(752, '1951003', 'Avinash Ranjit Bobade', 'arbobade123@gmail.com', 9518541318, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At. Bharosa , Ta. Korpana , dist. Chandrapur', ''),
(753, '1951004', 'Achal kailas Bodalkar', 'bodalkarachal@gmail.com', 9404675897, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Officer colony,mul road , chamorshi, dist gadchiroli.', ''),
(754, '1951005', 'Raksha rajendra chaudhari ', 'raksha.r.chaudhari123@gmail.com', 7385615574, 'Civil Engineering', '2019-06-15', '0', 'Female', '25,26shraddha colony, jalgaon ', ''),
(755, '1951009', 'Rupali Hiralal Gade', 'rupalihiralalgade@gmail.com', 9011216869, 'Civil Engineering', '2019-06-15', '0', 'Female', 'At post kawathal tq morshi distric Amravati', ''),
(756, '1951013', 'Sandesh Santosh Jadhav', 'jadhavsandesh387@gmail.com', 9604085397, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At.chincholi po.Ningnoor.tq.Mahagaon. Dist.Yavatmal', ''),
(757, '1951017', 'Umesh Premdas Kamble', 'umeshkamble7878@gmail.com', 8830291007, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Anand Nagar akola bypass, hingoli', ''),
(758, '1951018', 'Gopal Sunil Kamdi ', 'gopalkamdi158@gmail.com', 7620716225, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At.Po.Dongargaon Th.Samudrapur Dist.Wardha', ''),
(759, '1951019', 'Dhananjay Vilas Khandebharad', 'dhananjaykhandebharad2001@gmail.com', 9307439015, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Kanhaiya nagar , Jalna', ''),
(760, '1951020', 'KHOLE PRAVIN HARIBHAU', 'pravinkhole0202@gmail.com', 9075715256, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At. Pt. Rakshasbhuwan tamba tq shirur Kasar dis.t Beed', ''),
(761, '1951021', 'Harshal Gajanan Lahase ', 'harshallahase2018@gmail.com', 9921129706, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Chikhali road, sundarkhed, buldhana ', ''),
(762, '1951022', 'SAGAR WAMAN LANJEWAR', 'lanjewarsagar41@gmail.com', 9158259067, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At-Shamanism,Post-Kattipar, Th-Amgaon,Dist-Gondia (MH)', ''),
(763, '1951023', 'Karan Bhaiyasaheb Mali', 'karanmali2001@gmail.com', 7887692747, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Bhadgaon road, kharjai Naka,infront of senior tyre, chalisgaon District Jalgaon', ''),
(764, '1951024', 'Chetan Navnath Manne', 'chetanmanne123@gmail.com', 9325119135, 'Civil Engineering', '2019-06-15', '0', 'Male', 'CSTPS colony urjanagar chandrapur', ''),
(765, '1951025', 'Anamika Rajaram More', 'annumore123@gmail.com', 8766897583, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Kingaon tal. Yawal dist. Jalgaon', ''),
(766, '1951026', 'Mule Onkar Balu', 'onkarmule2001@gmail.com', 9359814276, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Swarajya  nagar beed', ''),
(767, '1951027', 'Kamal Ashish Mundada', 'kamalmundada2001@gmail.com', 9307621106, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Infront of Shivaay Super Shoppee, Krishna Heights, Jatharpeth, Akola 3 Rd floor, 303 ', ''),
(768, '1951028', 'Abhishek Suresh Nagargoje', 'abhinagargoje2001@gmail.com', 8686303046, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Beed', ''),
(769, '1951029', 'Dipali Sambhaji Patil', 'patildipali0044@gmail.com', 9307171413, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Shejawalker negar bhadgaon raod Chalisgaon', ''),
(770, '1951031', 'Nutan Sunil Patil', 'nutanpatil2407@gmail.com', 7821937344, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Neri Ta-Jamner Dist-Jalgaon', ''),
(771, '1951032', 'Rajashree Chandrashekhar Patil', 'rajashreepatil191715@gmail.com', 9307540667, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Anand nagar, jamner, dis.Jalgaon ', ''),
(772, '1951033', 'Sakshi Pravin Patil', 'sakshipatil162001@gmail.com', 9309167978, 'Civil Engineering', '2019-06-15', '0', 'Female', 'plot no.16,gat no-37/4,Droupadi nagar,jalgaon ', ''),
(773, '1951034', 'Vaibhavi Narendra Patil', 'vaibhavi2552@gmail.com', 8446570170, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Near ganesh temple, shimpi lane, pimprala, Jalgaon', ''),
(774, '1951036', 'Rushikesh Govindrao Pratapwar', 'rushipratapwar1302@gmail.com', 9922824537, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Gandhi Chowk,Near Laxmi Temple,Bhokar 431801', ''),
(775, '1951037', 'Sandip Bhimrao Pukale', 'sandippukale25@gmail.com', 9594323206, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Room no 18 Savitribai Malan chawl parighkhadi vasahat lbs road Kurla Mumbai west 400070', ''),
(776, '1951038', 'Divyani Vijayrao Rade', 'divyanirade12@gmail.com', 9049152402, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Maroti ward ,Hinganghat \nDist:Wardha', ''),
(777, '1951039', 'Gopal Shantaram Rahane', 'gopalrahane7@gmail.com', 7498713811, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At post panhera dist . Buldhana', ''),
(778, '1951040', 'Pranay Santosh Ramekar', 'pranayramekar15@gmail.com', 8698542925, 'Civil Engineering', '2019-06-15', '0', 'Male', 'paratwada dist.amravati talq.achalpur', ''),
(779, '1951043', 'Pankaj Dewaji Satpute', 'pankajsatpute2000@gmail.com', 7721923487, 'Civil Engineering', '2019-06-15', '0', 'Male', 'At.Post Jamtukum Tal.Pombhurna Dist. Chandrapur', ''),
(780, '1951046', 'KARAN VIJAY SONAWANE', 'karansonawane250701@gmail.com', 8459896294, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Pratibha nagar,Varangaon, Tal Bhusawal, dist Jalgaon', ''),
(781, '1951047', 'Sumital Gulabrao Sonawane', 'Sumitalsonawane63@gmail.com', 8080422685, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Paldhi Kh,dis jalgaon ,tal dharangaon', ''),
(782, '1951050', 'yeshwant bhimrao wadje', 'yashwantwadje101@gmail.com', 9370213626, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Nanded', ''),
(783, '1951051', 'Vaishnavi Shailendra Wagh', 'vaishnaviwagh61201@gmail.com', 8788125445, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Gat no.94/1 plot no.11 Khote Nagar , Jayhind Colony, Jalgaon', ''),
(784, '1951053', 'Khushboo Romdeo waghmare', 'khushboowaghmare2001@gmail.com', 7769822597, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Bhandara', ''),
(785, '1951054', 'Pranjal jagannath  wani ', 'pranjalwani571@gmail.com', 9420385957, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Plot no 33, gurudatt colony, bajar road, In front of municipal school , pimprala, Jalgaon ', ''),
(786, '1951055', 'Nikita Ramhari Zanjure', 'zanjurenr2019@gmail.com', 8552951695, 'Civil Engineering', '2019-06-15', '0', 'Female', 'At post Chakurwadi TQ Bid dist Beed', ''),
(787, '1951056', 'Imtiyaz Hussain', 'immiaatif@gmail.com', 6005910628, 'Civil Engineering', '2019-06-15', '0', 'Male', 'Ladakh kargil', ''),
(788, '1951057', 'Vaishnavi Sudhakar Chaudhari', 'vaishnavisc4@gmail.com', 9307963312, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Tukaram nagar, near swami naryan Mandir, bhusawal dist. Jalgaon', ''),
(789, '1951058', 'Prachi Milind Birhade ', 'birhadeprachi2000@gmail.com', 9834484234, 'Civil Engineering', '2019-06-15', '0', 'Female', 'Behind M.J.College, New postal colony, Jalgaon', ''),
(790, '1952201', 'Dipali Prabhakar Chavan ', 'dipalichavan81044@gmail.com', 7796173202, 'Civil Engineering', '2018-06-15', '0', 'Female', 'At malgavhan tell post surgana district nashik', ''),
(791, '1952203', 'Bhakti santosh fand', 'bhaktifand94@gmail.com', 7218285209, 'Civil Engineering', '2018-06-15', '0', 'Female', 'Wallabhanagar pulgaon, wardha', ''),
(792, '1952204', 'Dhiraj Raju  Hande ', 'dhirajhande3@gmail.com', 9096286397, 'Civil Engineering', '2018-06-15', '0', 'Male', 'LIC Colony, Near Prashant Nagar Amravati. ', ''),
(793, '1952205', 'Om Kishor Ingole', 'omingole2001@gmail.com', 9309908734, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Bhaji bazar Amravati', ''),
(794, '1952206', 'Darshana Pramod Jondhale', 'darshanajondhale111@gmail.com', 8788298971, 'Civil Engineering', '2018-06-15', '0', 'Female', ' Plot no 63 survey no 31/1 Shantiniketan housing society Near ajintha chawk Jalgaon', ''),
(795, '1952207', 'Rutuja Arun Sangale ', 'rutujasangale2001@gmail.com', 9373211935, 'Civil Engineering', '2018-06-15', '0', 'Female', 'At post Tamswadi, Niphad, Nashik ', ''),
(796, '1952208', 'Shinde Aishwarya Uddhavrao', 'shindeaishwarya30@gmail.com', 8080369556, 'Civil Engineering', '2018-06-15', '0', 'Female', 'At post- Helamb, Tq- Deoni,Dist-Latur', ''),
(797, '1952209', 'Madhav Ravindra Wakhare', 'madhavwakhare@gmail.com', 9730573252, 'Civil Engineering', '2018-06-15', '0', 'Male', 'Behind Lokmahavidhlaya Bachlor road Wardha', ''),
(798, '2012101', 'Vaibhav Gopal Dhamankar', 'vaibhavdhamankar300@gmail.com', 9623659389, 'Electronics & Telecommunicatio', '2019-06-15', '0', 'Male', 'At post hatala.Tq sengaon.dist hingoli', ''),
(801, '2031025', 'Arnold Sweznagger', 'Arnold@Terminater.com', 1478965412, 'Electrical Engineering', '0000-00-00', '0', 'Male', 'Near USA, Terminator Park, Jalgaon', ''),
(803, '1588055', 'Emma Wattson', 'Harmoine@Harrypotter.com', 2541589965, 'Civil Engineering', '0000-00-00', '0', 'Female', 'Near Uk, Voldemort Street, Dhule', ''),
(804, '2031026', 'Arnold Sweznagger', 'Arnold@terminater.com', 1478965412, 'Electrical Engineering', '0000-00-00', '0', 'Male', 'Near USA, Terminator Park, Jalgaon', ''),
(806, '1588056', 'Emma Wattson', 'Harmoine@Harrypotter.com', 2541589965, 'Civil Engineering', '0000-00-00', '0', 'Female', 'Near Uk, Voldemort Street, Dhule', ''),
(809, '2041024', 'Eren Jeager', 'Eren@shingekinnokyojin.com', 7854123333, 'Computer Engineering', '2020-08-28', '0', 'Male', 'In wall shigansina', ''),
(810, '1111111', 'hannah ', 'hannah@admin.com', 9313254625, 'Computer Engineering', '2020-06-15', '0', 'Female', 'jalgaon', ''),
(811, '1952013', 'Silvester ', 'Silvester@Rambo.com', 1100223344, 'Mechanical Engineering', '0000-00-00', '0', 'Male', 'Near USA, Rambo nagar, Jalgaon', '');

-- --------------------------------------------------------

--
-- Table structure for table `student_book`
--

CREATE TABLE `student_book` (
  `sr_no` int(11) UNSIGNED NOT NULL,
  `prn` varchar(30) NOT NULL,
  `book_name` varchar(30) NOT NULL,
  `took` datetime NOT NULL,
  `renew` datetime NOT NULL,
  `fine` bigint(20) NOT NULL DEFAULT 0,
  `category` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `student_book`
--

INSERT INTO `student_book` (`sr_no`, `prn`, `book_name`, `took`, `renew`, `fine`, `category`) VALUES
(1, '1841058', 'lucy', '2020-12-31 19:23:58', '0000-00-00 00:00:00', 0, 'b'),
(2, '1841058', 'Emma Watson', '2020-12-31 19:24:14', '0000-00-00 00:00:00', 0, 'b'),
(4, '1841058', 'lucy', '2020-12-31 19:26:10', '0000-00-00 00:00:00', 0, 'm'),
(5, '1841058', 'Harry Porte', '2020-12-31 19:26:23', '0000-00-00 00:00:00', 0, 'm');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD PRIMARY KEY (`sr`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `magazine`
--
ALTER TABLE `magazine`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `magazinecopy`
--
ALTER TABLE `magazinecopy`
  ADD PRIMARY KEY (`sr`),
  ADD KEY `bookid` (`bookid`);

--
-- Indexes for table `removeddata`
--
ALTER TABLE `removeddata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `removedby_2` (`removedby`(768));
ALTER TABLE `removeddata` ADD FULLTEXT KEY `removedby` (`removedby`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`sid`),
  ADD KEY `Name_2` (`Name`);
ALTER TABLE `staff` ADD FULLTEXT KEY `Name` (`Name`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`stid`),
  ADD UNIQUE KEY `prn` (`prn`),
  ADD KEY `prn_2` (`prn`);

--
-- Indexes for table `student_book`
--
ALTER TABLE `student_book`
  ADD PRIMARY KEY (`sr_no`),
  ADD KEY `prn` (`prn`),
  ADD KEY `prn_2` (`prn`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `bookcopy`
--
ALTER TABLE `bookcopy`
  MODIFY `sr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `magazine`
--
ALTER TABLE `magazine`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `magazinecopy`
--
ALTER TABLE `magazinecopy`
  MODIFY `sr` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `removeddata`
--
ALTER TABLE `removeddata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `sid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `student`
--
ALTER TABLE `student`
  MODIFY `stid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=812;

--
-- AUTO_INCREMENT for table `student_book`
--
ALTER TABLE `student_book`
  MODIFY `sr_no` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookcopy`
--
ALTER TABLE `bookcopy`
  ADD CONSTRAINT `bookcopy_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `book` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `magazinecopy`
--
ALTER TABLE `magazinecopy`
  ADD CONSTRAINT `magazinecopy_ibfk_1` FOREIGN KEY (`bookid`) REFERENCES `magazine` (`id`);

--
-- Constraints for table `student_book`
--
ALTER TABLE `student_book`
  ADD CONSTRAINT `student_book_ibfk_1` FOREIGN KEY (`prn`) REFERENCES `student` (`prn`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 23, 2020 at 11:54 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `insurance`
--

-- --------------------------------------------------------

--
-- Table structure for table `hms_bill_r_billdoctor`
--

CREATE TABLE `hms_bill_r_billdoctor` (
  `billdocid` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `pcpid` int(11) NOT NULL,
  `billdocfee` varchar(255) NOT NULL,
  `billdocdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `billdocstatus` enum('Paid','Unpaid',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hms_bill_r_billlab`
--

CREATE TABLE `hms_bill_r_billlab` (
  `billlabid` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `billlabdescription` varchar(255) NOT NULL,
  `billlabfee` varchar(255) NOT NULL,
  `billlabdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `billlabstatus` enum('Paid','Unpaid',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hms_bill_r_pharmacy`
--

CREATE TABLE `hms_bill_r_pharmacy` (
  `billpid` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `billpdescriptions` varchar(255) NOT NULL,
  `billpqty` varchar(255) NOT NULL,
  `billpfee` varchar(255) NOT NULL,
  `billpdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `billpstatus` enum('Paid','Unpaid',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hms_bill_r_room`
--

CREATE TABLE `hms_bill_r_room` (
  `billroomid` int(11) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `billbednum` varchar(255) NOT NULL,
  `billroomdescriptions` varchar(255) NOT NULL,
  `billroomfee` varchar(255) NOT NULL,
  `billroomdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `billroomstatus` enum('Paid','Unpaid',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hms_bill_t_billing`
--

CREATE TABLE `hms_bill_t_billing` (
  `billid` int(11) NOT NULL,
  `billidno` varchar(255) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `insured_id` int(11) NOT NULL,
  `insid` int(11) NOT NULL,
  `billdocid` int(11) NOT NULL,
  `billlabid` int(11) NOT NULL,
  `billroomid` int(11) NOT NULL,
  `billpid` int(11) NOT NULL,
  `billfees` varchar(255) NOT NULL,
  `billdiscount` varchar(255) NOT NULL,
  `billpaymentdate` date NOT NULL,
  `billtotal` varchar(255) NOT NULL,
  `billdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `billstatus` enum('Paid','Unpaid',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_r_insurance`
--

CREATE TABLE `hms_hmo_r_insurance` (
  `insid` int(11) NOT NULL,
  `insname` varchar(255) NOT NULL,
  `insdescription` varchar(255) NOT NULL,
  `insremarks` varchar(255) NOT NULL,
  `insdateregister` datetime NOT NULL DEFAULT current_timestamp(),
  `insstatus` enum('active','inactive',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_r_insurance`
--

INSERT INTO `hms_hmo_r_insurance` (`insid`, `insname`, `insdescription`, `insremarks`, `insdateregister`, `insstatus`) VALUES
(1, 'Sunlife', 'We provide a good services in terms health insurance for individual', 'Registered', '2020-01-10 22:04:54', 'active'),
(2, 'Select', 'We provide a good services in terms health insurance for individual', 'Registered', '2020-01-10 22:04:54', 'active'),
(3, 'Maxicare', 'We provide a good services in terms health insurance for individual', 'Registered', '2020-01-15 14:42:36', 'active'),
(4, 'Medicard', 'We provide a good services in terms health insurance for individual', 'Registered', '2020-01-15 14:42:36', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_r_insurancecategory`
--

CREATE TABLE `hms_hmo_r_insurancecategory` (
  `categoryid` int(11) NOT NULL,
  `insid` int(11) NOT NULL,
  `categoryname` varchar(255) NOT NULL,
  `categorydescription` varchar(255) NOT NULL,
  `categorydateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `categorystatus` enum('active','inactive',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_r_insurancecategory`
--

INSERT INTO `hms_hmo_r_insurancecategory` (`categoryid`, `insid`, `categoryname`, `categorydescription`, `categorydateregistered`, `categorystatus`) VALUES
(1, 1, 'Senior care', 'Cover insurance health by up to 70%', '2020-01-10 22:07:32', 'active'),
(2, 1, 'Life Assure', 'Cover insurance health by up to 60%', '2020-01-10 22:07:32', 'active'),
(3, 1, 'Healthier Life', 'Cover insurance health by up to 50%', '2020-01-10 22:08:37', 'active'),
(4, 1, 'First Aid', 'Cover insurance health by up to 20%', '2020-01-10 22:08:37', 'active'),
(5, 2, 'Platinum', 'Cover insurance health by up to 80%', '2020-01-10 22:09:56', 'active'),
(6, 2, 'Gold', 'Cover insurance health by up to 60%', '2020-01-10 22:09:56', 'active'),
(7, 2, 'Silver', 'Cover insurance health by up to 40%', '2020-01-10 22:09:56', 'active'),
(8, 2, 'Bronze', 'Cover insurance health by up to 20%', '2020-01-10 22:09:56', 'active'),
(9, 3, 'Platinum 1', 'Small Suite over  220,000', '2020-01-15 14:44:29', 'active'),
(10, 3, 'Platinum 2', 'Large Private over 175,000', '2020-01-15 14:44:29', 'active'),
(11, 3, 'Gold 1', 'Regular Private over 150,000 ', '2020-01-15 14:44:29', 'active'),
(12, 3, 'Gold 2', 'Regular Private over 100,000', '2020-01-15 14:44:29', 'active'),
(13, 3, 'Silver 1', 'Semi Private over 80,000', '2020-01-15 14:45:28', 'active'),
(14, 3, 'Silver 2', 'Semi Private over 60,000', '2020-01-15 14:45:28', 'active'),
(15, 3, 'Bronze', 'Ward over 50,000', '2020-01-15 14:45:28', 'active'),
(16, 4, 'Family / Individual', 'These plans are specifically created for individuals and families who want to have coverage for hospitalization, out-patient, preventive healthcare, emergency, financial assistance, and dental care.', '2020-01-15 14:48:17', 'active'),
(17, 4, 'VIP Plan', 'MediCard VIP plans are for those who want to have more comprehensive healthcare coverage. On top of the extensive hospitalization, out-patient, preventive healthcare, emergency, member’s financial assistance and dental care coverage, MediCard VIP plans al', '2020-01-15 14:48:17', 'active'),
(18, 4, 'HealthPlus', 'For only P1,100, get preventive and out-patient coverage in MediCard Free-Standing Clinics (FSCs) for one year', '2020-01-15 14:48:17', 'active'),
(19, 4, 'Health Check', 'Get unlimited check-ups for the cost of one consultation fee!  The MediCard Health Check card gives you unlimited check-ups with our primary care physicians and select specialists, 20% discount on labs and tests, plus one-time annual physical exam—all for', '2020-01-15 14:48:17', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_r_pcp`
--

CREATE TABLE `hms_hmo_r_pcp` (
  `pcpid` int(11) NOT NULL,
  `insid` int(11) NOT NULL,
  `pcpname` varchar(255) NOT NULL,
  `pcpgender` varchar(255) NOT NULL,
  `pcpemail` varchar(255) NOT NULL,
  `pcpcontact` varchar(255) NOT NULL,
  `pcpdateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `pcpstatus` enum('Active','Disabled',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_r_pcp`
--

INSERT INTO `hms_hmo_r_pcp` (`pcpid`, `insid`, `pcpname`, `pcpgender`, `pcpemail`, `pcpcontact`, `pcpdateregistered`, `pcpstatus`) VALUES
(9, 1, 'Dr. Jayson Palmares', 'Male', 'JaysonPalmares@Sunlife.com', '63911111111111', '2020-01-18 00:42:40', 'Active'),
(10, 2, 'Dr. Kervin Burce', 'Male', 'KervinBurce@Select.com', '63911111111111', '2020-01-18 00:42:40', 'Active'),
(11, 3, 'Dr. Aaron Ramirez', 'Male', 'AaronRamirez@Maxicare.com', '63911111111111', '2020-01-18 00:42:40', 'Active'),
(12, 4, 'Dr. Harvey Batiancila', 'Male', 'HarveyBatiancila@Medicard.com', '63911111111111', '2020-01-18 00:42:40', 'Active'),
(13, 1, 'Dr. Arvin Jhon I. Vertudez', 'Male', 'vertudez.arvinjhon@gmail.com', '639111111111', '2020-01-27 07:36:47', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_r_role`
--

CREATE TABLE `hms_hmo_r_role` (
  `roleid` int(11) NOT NULL,
  `roledescriptions` varchar(255) NOT NULL,
  `dateregister` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_r_role`
--

INSERT INTO `hms_hmo_r_role` (`roleid`, `roledescriptions`, `dateregister`) VALUES
(2, 'Admin', '0000-00-00 00:00:00'),
(3, 'HMO Staff', '0000-00-00 00:00:00'),
(4, 'Vendor', '2020-01-15 14:52:02'),
(5, 'Billing', '2020-01-15 14:52:02'),
(6, 'Patient', '2020-01-15 14:52:02'),
(7, 'PCP', '2020-01-15 14:52:02');

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_t_insured`
--

CREATE TABLE `hms_hmo_t_insured` (
  `insured_id` int(11) NOT NULL,
  `insured_idno` varchar(255) NOT NULL,
  `pat_id` int(11) NOT NULL,
  `insid` int(11) NOT NULL,
  `categoryid` int(11) NOT NULL,
  `pcpid` int(11) NOT NULL,
  `insured_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `insured_status` enum('for review','approved','denied',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_t_insured`
--

INSERT INTO `hms_hmo_t_insured` (`insured_id`, `insured_idno`, `pat_id`, `insid`, `categoryid`, `pcpid`, `insured_dateregistered`, `insured_status`) VALUES
(6, '10001', 1, 1, 1, 9, '2020-02-23 00:54:20', 'for review');

-- --------------------------------------------------------

--
-- Table structure for table `hms_hmo_t_user`
--

CREATE TABLE `hms_hmo_t_user` (
  `userid` int(11) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Middlename` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `roleid` int(11) NOT NULL,
  `userdateregister` datetime NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','inactive',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_hmo_t_user`
--

INSERT INTO `hms_hmo_t_user` (`userid`, `Firstname`, `Middlename`, `Lastname`, `username`, `password`, `email`, `roleid`, `userdateregister`, `status`) VALUES
(1, 'Arvin Jhon', 'israel', 'Vertudez', 'Admin', 'Admin', 'Admin@hmo.com', 2, '2020-01-04 13:26:39', 'active'),
(3, 'Immanuel', 'Jerusalem', 'Israel', 'HMO Staff', 'HMO Staff', 'HMOStaff@hmo.com', 3, '2020-01-15 14:51:24', 'active');

-- --------------------------------------------------------

--
-- Table structure for table `hms_patient_r_information`
--

CREATE TABLE `hms_patient_r_information` (
  `pat_id` int(11) NOT NULL,
  `pat_firstname` varchar(255) NOT NULL,
  `pat_middlename` varchar(255) NOT NULL,
  `pat_lastname` varchar(255) NOT NULL,
  `pat_age` varchar(255) NOT NULL,
  `pat_birthdate` varchar(255) NOT NULL,
  `pat_gender` varchar(255) NOT NULL,
  `pat_address` varchar(255) NOT NULL,
  `pat_contactnum` varchar(255) NOT NULL,
  `pat_email` varchar(255) NOT NULL,
  `pat_remarks` varchar(255) NOT NULL,
  `pat_dateregistered` datetime NOT NULL DEFAULT current_timestamp(),
  `pat_status` enum('Admitted','Discharge','Check-up',',') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `hms_patient_r_information`
--

INSERT INTO `hms_patient_r_information` (`pat_id`, `pat_firstname`, `pat_middlename`, `pat_lastname`, `pat_age`, `pat_birthdate`, `pat_gender`, `pat_address`, `pat_contactnum`, `pat_email`, `pat_remarks`, `pat_dateregistered`, `pat_status`) VALUES
(1, 'Warren', 'D', 'Miraflor', '25', '1995-01-10', 'Male', '22 Perya Ave', '0911111111111', 'Warren@gmail.com', 'In-Patient', '2020-02-18 20:38:25', 'Admitted'),
(2, 'James Albert', 'L', 'Ramirez', '21', '1999-04-18', 'Male', 'Quezon Ave', '09876543879', 'JamesAlbert@gmail.com', 'In-Patient', '2020-02-22 16:12:10', 'Admitted'),
(3, 'Kervin', 'R', 'Burce', '21', '2019-08-20', 'Male', 'Quezon City', '09797897985', 'KervinBurce@gmail.com', 'In-Patient', '2020-02-22 16:14:03', 'Admitted'),
(4, 'Hazelle Ann', 'M', 'Cardinas', '21', '2019-08-26', 'Female', 'North Caloocan City', '09876543879', 'Hazelle@gmail.com', 'In-Patient', '2020-02-22 16:14:03', 'Admitted'),
(5, 'Berna', 'J', 'Jabat', '21', '1998-12-12', 'Female', 'Tungko Bulacan', '09896543879', 'Bergin@gmail.com', 'Out-Patient', '2020-02-22 16:15:46', 'Check-up'),
(6, 'Jocelyn', 'R', 'Lalic', '22', '2017-11-09', 'Female', 'Tungko Bulacan', '09876543879', 'JoyJames@gmail.com', 'In-Patient', '2020-02-22 16:15:46', 'Admitted'),
(7, 'Kaisha', 'R', 'Lupaz', '22', '1987-10-03', 'Female', 'Quezon City', '09876543879', 'Kaisha@gmail.com', 'In-Patient', '2020-02-22 16:18:31', 'Admitted'),
(8, 'Erwin Paolo', 'P', 'Fernandez', '21', '2019-11-20', 'Male', 'North Caloocan City', '09876542345', 'ErwinCielo@gmail.com', 'In-Patient', '2020-02-22 16:18:31', 'Admitted'),
(9, 'Harvey', 'B', 'Batiancila', '21', '2019-07-31', 'Male', 'Quezon City', '09876542345', 'Harvey@gmail.com', 'In-Patient', '2020-02-22 16:18:31', 'Discharge');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hms_bill_r_billdoctor`
--
ALTER TABLE `hms_bill_r_billdoctor`
  ADD PRIMARY KEY (`billdocid`),
  ADD KEY `pcpid` (`pcpid`),
  ADD KEY `appid` (`pat_id`);

--
-- Indexes for table `hms_bill_r_billlab`
--
ALTER TABLE `hms_bill_r_billlab`
  ADD PRIMARY KEY (`billlabid`),
  ADD KEY `appid` (`pat_id`);

--
-- Indexes for table `hms_bill_r_pharmacy`
--
ALTER TABLE `hms_bill_r_pharmacy`
  ADD PRIMARY KEY (`billpid`),
  ADD KEY `appid` (`pat_id`);

--
-- Indexes for table `hms_bill_r_room`
--
ALTER TABLE `hms_bill_r_room`
  ADD PRIMARY KEY (`billroomid`),
  ADD KEY `appid` (`pat_id`);

--
-- Indexes for table `hms_bill_t_billing`
--
ALTER TABLE `hms_bill_t_billing`
  ADD PRIMARY KEY (`billid`),
  ADD KEY `appid` (`insured_id`),
  ADD KEY `insid` (`insid`),
  ADD KEY `billdocid` (`billdocid`),
  ADD KEY `billlabid` (`billlabid`),
  ADD KEY `billroomid` (`billroomid`),
  ADD KEY `billpid` (`billpid`),
  ADD KEY `pat_id` (`pat_id`);

--
-- Indexes for table `hms_hmo_r_insurance`
--
ALTER TABLE `hms_hmo_r_insurance`
  ADD PRIMARY KEY (`insid`);

--
-- Indexes for table `hms_hmo_r_insurancecategory`
--
ALTER TABLE `hms_hmo_r_insurancecategory`
  ADD PRIMARY KEY (`categoryid`),
  ADD KEY `insid` (`insid`);

--
-- Indexes for table `hms_hmo_r_pcp`
--
ALTER TABLE `hms_hmo_r_pcp`
  ADD PRIMARY KEY (`pcpid`),
  ADD KEY `insid` (`insid`);

--
-- Indexes for table `hms_hmo_r_role`
--
ALTER TABLE `hms_hmo_r_role`
  ADD PRIMARY KEY (`roleid`);

--
-- Indexes for table `hms_hmo_t_insured`
--
ALTER TABLE `hms_hmo_t_insured`
  ADD PRIMARY KEY (`insured_id`),
  ADD KEY `pat_id` (`pat_id`),
  ADD KEY `insid` (`insid`),
  ADD KEY `categoryid` (`categoryid`),
  ADD KEY `pcpid` (`pcpid`);

--
-- Indexes for table `hms_hmo_t_user`
--
ALTER TABLE `hms_hmo_t_user`
  ADD PRIMARY KEY (`userid`),
  ADD KEY `roleid` (`roleid`);

--
-- Indexes for table `hms_patient_r_information`
--
ALTER TABLE `hms_patient_r_information`
  ADD PRIMARY KEY (`pat_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hms_bill_r_billdoctor`
--
ALTER TABLE `hms_bill_r_billdoctor`
  MODIFY `billdocid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hms_bill_r_billlab`
--
ALTER TABLE `hms_bill_r_billlab`
  MODIFY `billlabid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `hms_bill_r_pharmacy`
--
ALTER TABLE `hms_bill_r_pharmacy`
  MODIFY `billpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hms_bill_r_room`
--
ALTER TABLE `hms_bill_r_room`
  MODIFY `billroomid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hms_bill_t_billing`
--
ALTER TABLE `hms_bill_t_billing`
  MODIFY `billid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_hmo_r_insurance`
--
ALTER TABLE `hms_hmo_r_insurance`
  MODIFY `insid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hms_hmo_r_insurancecategory`
--
ALTER TABLE `hms_hmo_r_insurancecategory`
  MODIFY `categoryid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hms_hmo_r_pcp`
--
ALTER TABLE `hms_hmo_r_pcp`
  MODIFY `pcpid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `hms_hmo_r_role`
--
ALTER TABLE `hms_hmo_r_role`
  MODIFY `roleid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `hms_hmo_t_insured`
--
ALTER TABLE `hms_hmo_t_insured`
  MODIFY `insured_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hms_hmo_t_user`
--
ALTER TABLE `hms_hmo_t_user`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hms_patient_r_information`
--
ALTER TABLE `hms_patient_r_information`
  MODIFY `pat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `hms_bill_r_billdoctor`
--
ALTER TABLE `hms_bill_r_billdoctor`
  ADD CONSTRAINT `hms_bill_r_billdoctor_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`);

--
-- Constraints for table `hms_bill_r_billlab`
--
ALTER TABLE `hms_bill_r_billlab`
  ADD CONSTRAINT `hms_bill_r_billlab_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`);

--
-- Constraints for table `hms_bill_r_pharmacy`
--
ALTER TABLE `hms_bill_r_pharmacy`
  ADD CONSTRAINT `hms_bill_r_pharmacy_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`);

--
-- Constraints for table `hms_bill_r_room`
--
ALTER TABLE `hms_bill_r_room`
  ADD CONSTRAINT `hms_bill_r_room_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`);

--
-- Constraints for table `hms_bill_t_billing`
--
ALTER TABLE `hms_bill_t_billing`
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_10` FOREIGN KEY (`billdocid`) REFERENCES `hms_bill_r_billdoctor` (`billdocid`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_11` FOREIGN KEY (`billlabid`) REFERENCES `hms_bill_r_billlab` (`billlabid`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_12` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_6` FOREIGN KEY (`insid`) REFERENCES `hms_hmo_r_insurance` (`insid`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_7` FOREIGN KEY (`insured_id`) REFERENCES `hms_hmo_t_insured` (`insured_id`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_8` FOREIGN KEY (`billpid`) REFERENCES `hms_bill_r_pharmacy` (`billpid`),
  ADD CONSTRAINT `hms_bill_t_billing_ibfk_9` FOREIGN KEY (`billroomid`) REFERENCES `hms_bill_r_room` (`billroomid`);

--
-- Constraints for table `hms_hmo_r_insurancecategory`
--
ALTER TABLE `hms_hmo_r_insurancecategory`
  ADD CONSTRAINT `hms_hmo_r_insurancecategory_ibfk_1` FOREIGN KEY (`insid`) REFERENCES `hms_hmo_r_insurance` (`insid`);

--
-- Constraints for table `hms_hmo_r_pcp`
--
ALTER TABLE `hms_hmo_r_pcp`
  ADD CONSTRAINT `hms_hmo_r_pcp_ibfk_1` FOREIGN KEY (`insid`) REFERENCES `hms_hmo_r_insurance` (`insid`);

--
-- Constraints for table `hms_hmo_t_insured`
--
ALTER TABLE `hms_hmo_t_insured`
  ADD CONSTRAINT `hms_hmo_t_insured_ibfk_1` FOREIGN KEY (`pat_id`) REFERENCES `hms_patient_r_information` (`pat_id`),
  ADD CONSTRAINT `hms_hmo_t_insured_ibfk_2` FOREIGN KEY (`categoryid`) REFERENCES `hms_hmo_r_insurancecategory` (`categoryid`),
  ADD CONSTRAINT `hms_hmo_t_insured_ibfk_3` FOREIGN KEY (`insid`) REFERENCES `hms_hmo_r_insurance` (`insid`),
  ADD CONSTRAINT `hms_hmo_t_insured_ibfk_4` FOREIGN KEY (`pcpid`) REFERENCES `hms_hmo_r_pcp` (`pcpid`);

--
-- Constraints for table `hms_hmo_t_user`
--
ALTER TABLE `hms_hmo_t_user`
  ADD CONSTRAINT `hms_hmo_t_user_ibfk_1` FOREIGN KEY (`roleid`) REFERENCES `hms_hmo_r_role` (`roleid`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

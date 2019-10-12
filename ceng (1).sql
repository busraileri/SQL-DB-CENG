-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 12 Eki 2019, 10:36:57
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `ceng`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `announcement`
--

DROP TABLE IF EXISTS `announcement`;
CREATE TABLE IF NOT EXISTS `announcement` (
  `ann_id` int(11) NOT NULL,
  `ann_name` varchar(100) NOT NULL,
  `ann_date` datetime NOT NULL,
  `ann_place` varchar(50) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`ann_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `announcement`
--

INSERT INTO `announcement` (`ann_id`, `ann_name`, `ann_date`, `ann_place`, `course_id`) VALUES
(20, 'meeting', '2019-10-01 14:30:00', 'congress and culture center', 103),
(30, 'technology meeting ', '2019-10-06 16:40:00', 'MF202', 111);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class_id` int(11) NOT NULL,
  `class_name` varchar(10) NOT NULL,
  PRIMARY KEY (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `classes`
--

INSERT INTO `classes` (`class_id`, `class_name`) VALUES
(50, 'E002'),
(92, 'BILLAB2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course_id` int(11) NOT NULL,
  `course_type_id` varchar(20) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `course_description` varchar(50) NOT NULL,
  `course_start` time NOT NULL,
  `course_end` time NOT NULL,
  `course_teacher` varchar(50) NOT NULL,
  `course_credit` int(5) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`course_id`, `course_type_id`, `course_name`, `course_description`, `course_start`, `course_end`, `course_teacher`, `course_credit`, `class_id`) VALUES
(103, 'COME103', 'Computer Programming Lab', 'how to solve the problem?', '10:40:00', '11:30:00', 'Nihat Yilmaz Simsek', 2, 50),
(111, 'COME103/CENG111', 'Computer Programming 1', 'how to use the python?', '08:40:00', '09:30:00', 'M. Fatih Hasoglu', 4, 92),
(114, 'MATH114', 'Discrete Mathematics', 'what is the discrete mathematics?', '10:40:00', '11:30:00', 'Ulas Gulec', 5, 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `course_id` int(11) NOT NULL,
  `exam_name` varchar(30) NOT NULL,
  `course_teacher` varchar(20) NOT NULL,
  `exam_class` varchar(6) NOT NULL,
  `exam_level` int(2) NOT NULL,
  `exam_date` datetime NOT NULL,
  `exam_observer` varchar(20) NOT NULL,
  PRIMARY KEY (`exam_name`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `exams`
--

INSERT INTO `exams` (`course_id`, `exam_name`, `course_teacher`, `exam_class`, `exam_level`, `exam_date`, `exam_observer`) VALUES
(103, 'Computer Programming Lab 1', 'Nihat Yilmaz Simsek', '1', 2, '2019-10-13 08:40:00', 'Melih Yayla'),
(114, 'Discrete Mathematics', 'Ulas Gulec', '3', 1, '2019-10-08 09:00:00', 'M. Fatih Hasoglu');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `std_id` int(11) NOT NULL,
  `std_name` varchar(50) NOT NULL,
  `std_surname` varchar(50) NOT NULL,
  `std_birth_date` date NOT NULL,
  `std_sex` varchar(20) NOT NULL,
  `std_phone` varchar(20) NOT NULL,
  `std_city` varchar(50) NOT NULL,
  `std_mail` varchar(50) NOT NULL,
  `std_class` varchar(6) NOT NULL,
  `std_advisor` varchar(50) NOT NULL,
  `course_id` varchar(11) NOT NULL,
  `class_id` int(11) NOT NULL,
  PRIMARY KEY (`std_id`),
  KEY `class_id` (`class_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`std_id`, `std_name`, `std_surname`, `std_birth_date`, `std_sex`, `std_phone`, `std_city`, `std_mail`, `std_class`, `std_advisor`, `course_id`, `class_id`) VALUES
(171501010, 'Melih', 'Konas', '1999-10-16', 'Male', '05537499022', 'Mersin', 'melih.konas@std.hku.edu.tr', '3', 'Nihat Yilmaz Simsek', '114', 50),
(181501015, 'Busra', 'Ileri', '1999-05-22', 'Female', '05532414574', 'Gaziantep', 'busra.ileri@std.hku.edu.tr', '1', 'Melih Yayla', '103', 92),
(181501040, 'Sena Nur', 'Cermik', '1999-08-06', 'Male', '05389873625', 'Diyarbakir', 'snur.cermik@std.hku.edu.tr', '2', 'Ulas Gulec', '103/111', 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students_courses`
--

DROP TABLE IF EXISTS `students_courses`;
CREATE TABLE IF NOT EXISTS `students_courses` (
  `std_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  KEY `std_id` (`std_id`,`course_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `students_courses`
--

INSERT INTO `students_courses` (`std_id`, `course_id`) VALUES
(171501010, 114),
(181501015, 103);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(50) NOT NULL,
  `teacher_surname` varchar(50) NOT NULL,
  `teacher_mail` varchar(50) NOT NULL,
  `teacher_grade` varchar(50) NOT NULL,
  `teacher_student_link` varchar(250) NOT NULL,
  `teacher_course` varchar(30) NOT NULL,
  `teacher_course_code` varchar(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`teacher_id`),
  KEY `course_id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `teachers`
--

INSERT INTO `teachers` (`teacher_id`, `teacher_name`, `teacher_surname`, `teacher_mail`, `teacher_grade`, `teacher_student_link`, `teacher_course`, `teacher_course_code`, `course_id`) VALUES
(1, 'Nihat Yilmaz', 'Simsek', 'nyilmaz.simsek@hku.edu.tr', 'Research Assistant', '0(342) 211 8080 – 2220\r\n', 'Computer Programming Lab', 'COME103', 103),
(2, 'M. Fatih', 'Hasoglu', 'mfatih.hasoglu@hku.edu.tr', 'Instructor', '0(342) 211 8080 – 2213\r\n', 'Computer Programming 1', 'COME103/CENG111', 111),
(3, 'Ulas', 'Gulec', 'ulas.gulec@hku.edu.tr', 'Department Chair', '0(342) 211 8080 – 2203', 'Discrete Mathematics', 'MATH114', 114),
(4, 'Melih', 'Yayla', 'melih.yayla@hku.edu.tr', 'Research Assistant', '0(342) 211 8080 – 2227\r\n', 'Object Oriented Programming', 'COME201', 103);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `announcement`
--
ALTER TABLE `announcement`
  ADD CONSTRAINT `announcement_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Tablo kısıtlamaları `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`class_id`);

--
-- Tablo kısıtlamaları `students_courses`
--
ALTER TABLE `students_courses`
  ADD CONSTRAINT `students_courses_ibfk_1` FOREIGN KEY (`std_id`) REFERENCES `students` (`std_id`),
  ADD CONSTRAINT `students_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);

--
-- Tablo kısıtlamaları `teachers`
--
ALTER TABLE `teachers`
  ADD CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

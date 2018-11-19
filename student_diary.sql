-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 19, 2018 lúc 08:08 PM
-- Phiên bản máy phục vụ: 10.1.36-MariaDB
-- Phiên bản PHP: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `student_diary`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `class`
--

CREATE TABLE `class` (
  `c_id` int(11) NOT NULL,
  `c_idyear` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`c_id`, `c_idyear`, `c_name`) VALUES
(1, 2018, '12A6'),
(2, 2018, 'IT A2'),
(3, 2018, 'IT A2 K40');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diary`
--

CREATE TABLE `diary` (
  `d_id` int(11) NOT NULL,
  `d_codeuser` varchar(50) NOT NULL,
  `d_name` varchar(200) NOT NULL,
  `d_dayupdate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diarydocument`
--

CREATE TABLE `diarydocument` (
  `dd_id` int(11) NOT NULL,
  `dd_idd` int(11) NOT NULL,
  `dd_name` varchar(200) NOT NULL,
  `dd_datecreated` date NOT NULL,
  `dd_attach` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `documentsubject`
--

CREATE TABLE `documentsubject` (
  `ds_id` int(11) NOT NULL,
  `ds_idtod` int(11) NOT NULL,
  `ds_idstudy` int(11) NOT NULL,
  `ds_name` varchar(50) NOT NULL,
  `ds_content` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `event`
--

CREATE TABLE `event` (
  `e_id` int(11) NOT NULL,
  `e_idplan` int(11) NOT NULL,
  `e_name` varchar(200) NOT NULL,
  `e_place` varchar(300) DEFAULT NULL,
  `e_starttime` datetime NOT NULL,
  `e_endtime` datetime NOT NULL,
  `e_priority` int(11) NOT NULL,
  `e_remind` int(11) NOT NULL,
  `e_describe` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `event`
--

INSERT INTO `event` (`e_id`, `e_idplan`, `e_name`, `e_place`, `e_starttime`, `e_endtime`, `e_priority`, `e_remind`, `e_describe`) VALUES
(1, 1, 'Sự kiện 1', '', '2018-11-15 20:28:00', '2018-11-15 21:28:00', 30, 10, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `form`
--

CREATE TABLE `form` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `lecturer`
--

CREATE TABLE `lecturer` (
  `l_id` int(11) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `l_phone` varchar(10) DEFAULT NULL,
  `l_email` varchar(100) DEFAULT NULL,
  `l_web` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `lecturer`
--

INSERT INTO `lecturer` (`l_id`, `l_name`, `l_phone`, `l_email`, `l_web`) VALUES
(1, 'A', NULL, NULL, NULL),
(11, 'C', '0123546555', 'a@gmail.com', 'a.com'),
(12, 'C', '0123546555', 'a@gmail.com', 'a.com'),
(13, 'C', '0123546555', 'a@gmail.com', 'a.com'),
(14, 'PNQ', '', '', ''),
(15, 'PNQ', '', '', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `p_id` int(11) NOT NULL,
  `p_codeuser` varchar(50) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_updateday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `plan`
--

INSERT INTO `plan` (`p_id`, `p_codeuser`, `p_name`, `p_updateday`) VALUES
(1, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Cướp nhà bank', '2018-11-09'),
(2, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Trả tiền bank', '2018-11-17'),
(8, 'Chybi1iYOvOQbN9ajDAySdV1Gsh1', 'Làm báo cáo ', '2018-11-09'),
(12, 'Chybi1iYOvOQbN9ajDAySdV1Gsh1', 'Code dạo', '2018-11-10'),
(13, 'Chybi1iYOvOQbN9ajDAySdV1Gsh1', 'Cafe cuối tuần', '2018-11-12'),
(28, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Nãn thật', '2018-11-12'),
(29, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Loading', '2018-11-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schedule`
--

CREATE TABLE `schedule` (
  `sch_id` int(11) NOT NULL,
  `sch_idstudy` int(11) NOT NULL,
  `sch_dayofweek` varchar(10) NOT NULL,
  `sch_place` varchar(50) NOT NULL,
  `sch_lesson` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `schoolyear`
--

CREATE TABLE `schoolyear` (
  `sy_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `schoolyear`
--

INSERT INTO `schoolyear` (`sy_id`) VALUES
(0),
(2018),
(2019),
(2020);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score`
--

CREATE TABLE `score` (
  `sco_score` int(11) NOT NULL,
  `sco_idstudy` int(11) NOT NULL,
  `sco_idtos` int(11) NOT NULL,
  `sco_idform` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `semester`
--

CREATE TABLE `semester` (
  `sm_id` int(11) NOT NULL,
  `sm_name` varchar(50) NOT NULL,
  `sm_year` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `semester`
--

INSERT INTO `semester` (`sm_id`, `sm_name`, `sm_year`) VALUES
(1, 'Học kỳ 1', 2018),
(2, 'HK I', 2020),
(4, 'HK III', 2018),
(5, 'HK I', 2018);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `study`
--

CREATE TABLE `study` (
  `st_id` int(11) NOT NULL,
  `st_codeuser` varchar(50) NOT NULL,
  `st_idlecturer` int(11) NOT NULL,
  `st_idsubject` int(11) NOT NULL,
  `st_idclass` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `study`
--

INSERT INTO `study` (`st_id`, `st_codeuser`, `st_idlecturer`, `st_idsubject`, `st_idclass`) VALUES
(2, 'Chybi1iYOvOQbN9ajDAySdV1Gsh1', 15, 3, 3);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject`
--

CREATE TABLE `subject` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_createday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `subject`
--

INSERT INTO `subject` (`s_id`, `s_name`, `s_createday`) VALUES
(1, 'Math', '2018-11-20'),
(2, 'Toan', '2018-11-20'),
(3, 'LVTN', '2018-11-20');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `testschedule`
--

CREATE TABLE `testschedule` (
  `ts_id` int(11) NOT NULL,
  `ts_idstudy` int(11) NOT NULL,
  `ts_idsemester` int(11) NOT NULL,
  `ts_name` varchar(100) NOT NULL,
  `ts_daytest` datetime NOT NULL,
  `ts_place` varchar(100) NOT NULL,
  `ts_note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typeofdocument`
--

CREATE TABLE `typeofdocument` (
  `t_id` int(11) NOT NULL,
  `t_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `typeofscore`
--

CREATE TABLE `typeofscore` (
  `tos_id` int(11) NOT NULL,
  `tos_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `u_code` varchar(50) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `u_image` varchar(1000) DEFAULT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_gender` tinyint(1) NOT NULL,
  `u_birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`u_code`, `u_name`, `u_image`, `u_email`, `u_gender`, `u_birthday`) VALUES
('8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Demo', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/User%2F8gLYImKCKaZ0UNQfCYMY3ZY56bt2.png?alt=media&token=12ca6702-5bf0-4a4c-be7b-09175d7574b2', 'demo@gmail.com', 1, '1996-12-02'),
('Chybi1iYOvOQbN9ajDAySdV1Gsh1', 'Demo Female', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/User%2FChybi1iYOvOQbN9ajDAySdV1Gsh1.png?alt=media&token=dde66932-00ea-4428-a023-c7fe8d8925da', 'demo1@gmail.com', 1, '1987-11-08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`c_id`) USING BTREE,
  ADD KEY `fkc_schoolyear` (`c_idyear`);

--
-- Chỉ mục cho bảng `diary`
--
ALTER TABLE `diary`
  ADD PRIMARY KEY (`d_id`),
  ADD KEY `fkd_codeuser` (`d_codeuser`);

--
-- Chỉ mục cho bảng `diarydocument`
--
ALTER TABLE `diarydocument`
  ADD PRIMARY KEY (`dd_id`),
  ADD KEY `fkdd_diary` (`dd_idd`);

--
-- Chỉ mục cho bảng `documentsubject`
--
ALTER TABLE `documentsubject`
  ADD PRIMARY KEY (`ds_id`),
  ADD KEY `fkds_tod` (`ds_idtod`);

--
-- Chỉ mục cho bảng `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`e_id`),
  ADD KEY `fk_idplan` (`e_idplan`);

--
-- Chỉ mục cho bảng `form`
--
ALTER TABLE `form`
  ADD PRIMARY KEY (`f_id`);

--
-- Chỉ mục cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  ADD PRIMARY KEY (`l_id`);

--
-- Chỉ mục cho bảng `plan`
--
ALTER TABLE `plan`
  ADD PRIMARY KEY (`p_id`),
  ADD KEY `fk_codeuser` (`p_codeuser`);

--
-- Chỉ mục cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD PRIMARY KEY (`sch_id`),
  ADD KEY `fksch_study` (`sch_idstudy`);

--
-- Chỉ mục cho bảng `schoolyear`
--
ALTER TABLE `schoolyear`
  ADD PRIMARY KEY (`sy_id`);

--
-- Chỉ mục cho bảng `score`
--
ALTER TABLE `score`
  ADD PRIMARY KEY (`sco_idstudy`,`sco_idtos`,`sco_idform`),
  ADD KEY `fksco_form` (`sco_idform`),
  ADD KEY `fksco_tos` (`sco_idtos`);

--
-- Chỉ mục cho bảng `semester`
--
ALTER TABLE `semester`
  ADD PRIMARY KEY (`sm_id`),
  ADD KEY `fk_schoolyear` (`sm_year`);

--
-- Chỉ mục cho bảng `study`
--
ALTER TABLE `study`
  ADD PRIMARY KEY (`st_id`),
  ADD KEY `fks_user` (`st_codeuser`),
  ADD KEY `fks_subject` (`st_idsubject`),
  ADD KEY `fks_lecturer` (`st_idlecturer`),
  ADD KEY `fks_class` (`st_idclass`);

--
-- Chỉ mục cho bảng `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`s_id`);

--
-- Chỉ mục cho bảng `testschedule`
--
ALTER TABLE `testschedule`
  ADD PRIMARY KEY (`ts_id`),
  ADD KEY `fkts_study` (`ts_idstudy`),
  ADD KEY `fkts_semester` (`ts_idsemester`);

--
-- Chỉ mục cho bảng `typeofdocument`
--
ALTER TABLE `typeofdocument`
  ADD PRIMARY KEY (`t_id`);

--
-- Chỉ mục cho bảng `typeofscore`
--
ALTER TABLE `typeofscore`
  ADD PRIMARY KEY (`tos_id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`u_code`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `class`
--
ALTER TABLE `class`
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `diary`
--
ALTER TABLE `diary`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `diarydocument`
--
ALTER TABLE `diarydocument`
  MODIFY `dd_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `documentsubject`
--
ALTER TABLE `documentsubject`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `form`
--
ALTER TABLE `form`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT cho bảng `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sch_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `semester`
--
ALTER TABLE `semester`
  MODIFY `sm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT cho bảng `study`
--
ALTER TABLE `study`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `subject`
--
ALTER TABLE `subject`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `testschedule`
--
ALTER TABLE `testschedule`
  MODIFY `ts_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `typeofdocument`
--
ALTER TABLE `typeofdocument`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `typeofscore`
--
ALTER TABLE `typeofscore`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fkc_schoolyear` FOREIGN KEY (`c_idyear`) REFERENCES `schoolyear` (`sy_id`);

--
-- Các ràng buộc cho bảng `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `fkd_codeuser` FOREIGN KEY (`d_codeuser`) REFERENCES `user` (`u_code`);

--
-- Các ràng buộc cho bảng `diarydocument`
--
ALTER TABLE `diarydocument`
  ADD CONSTRAINT `fkdd_diary` FOREIGN KEY (`dd_idd`) REFERENCES `diary` (`d_id`);

--
-- Các ràng buộc cho bảng `documentsubject`
--
ALTER TABLE `documentsubject`
  ADD CONSTRAINT `fkds_tod` FOREIGN KEY (`ds_idtod`) REFERENCES `diarydocument` (`dd_id`);

--
-- Các ràng buộc cho bảng `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_idplan` FOREIGN KEY (`e_idplan`) REFERENCES `plan` (`p_id`);

--
-- Các ràng buộc cho bảng `plan`
--
ALTER TABLE `plan`
  ADD CONSTRAINT `fk_codeuser` FOREIGN KEY (`p_codeuser`) REFERENCES `user` (`u_code`);

--
-- Các ràng buộc cho bảng `schedule`
--
ALTER TABLE `schedule`
  ADD CONSTRAINT `fksch_study` FOREIGN KEY (`sch_idstudy`) REFERENCES `study` (`st_id`);

--
-- Các ràng buộc cho bảng `score`
--
ALTER TABLE `score`
  ADD CONSTRAINT `fksco_form` FOREIGN KEY (`sco_idform`) REFERENCES `form` (`f_id`),
  ADD CONSTRAINT `fksco_idstudy` FOREIGN KEY (`sco_idstudy`) REFERENCES `study` (`st_id`),
  ADD CONSTRAINT `fksco_tos` FOREIGN KEY (`sco_idtos`) REFERENCES `typeofscore` (`tos_id`);

--
-- Các ràng buộc cho bảng `semester`
--
ALTER TABLE `semester`
  ADD CONSTRAINT `fk_schoolyear` FOREIGN KEY (`sm_year`) REFERENCES `schoolyear` (`sy_id`);

--
-- Các ràng buộc cho bảng `study`
--
ALTER TABLE `study`
  ADD CONSTRAINT `fks_class` FOREIGN KEY (`st_idclass`) REFERENCES `class` (`c_id`),
  ADD CONSTRAINT `fks_lecturer` FOREIGN KEY (`st_idlecturer`) REFERENCES `lecturer` (`l_id`),
  ADD CONSTRAINT `fks_subject` FOREIGN KEY (`st_idsubject`) REFERENCES `subject` (`s_id`),
  ADD CONSTRAINT `fks_user` FOREIGN KEY (`st_codeuser`) REFERENCES `user` (`u_code`);

--
-- Các ràng buộc cho bảng `testschedule`
--
ALTER TABLE `testschedule`
  ADD CONSTRAINT `fkts_semester` FOREIGN KEY (`ts_idsemester`) REFERENCES `semester` (`sm_id`),
  ADD CONSTRAINT `fkts_study` FOREIGN KEY (`ts_idstudy`) REFERENCES `study` (`st_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

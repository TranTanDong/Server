-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 14, 2018 lúc 06:15 AM
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
  `c_idsemester` int(11) NOT NULL,
  `c_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `class`
--

INSERT INTO `class` (`c_id`, `c_idsemester`, `c_name`) VALUES
(32, 22, 'Nhóm 5'),
(33, 23, 'Nhóm 2'),
(34, 24, 'Nhóm 7'),
(35, 25, 'Nhóm 2'),
(36, 26, 'Nhóm 1');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diary`
--

CREATE TABLE `diary` (
  `d_id` int(11) NOT NULL,
  `d_codeuser` varchar(50) NOT NULL,
  `d_name` varchar(200) NOT NULL,
  `d_dayupdate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `diary`
--

INSERT INTO `diary` (`d_id`, `d_codeuser`, `d_name`, `d_dayupdate`) VALUES
(1, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Nhật ký cho những ngày buồn', '2018-12-03 00:00:00'),
(2, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Buổi học cuối cùng', '2018-12-03 14:32:22'),
(3, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Cô gái dễ thương', '2018-12-13 14:39:25'),
(4, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Ngày tan trường', '2018-12-13 14:41:25');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `diarydocument`
--

CREATE TABLE `diarydocument` (
  `dd_id` int(11) NOT NULL,
  `dd_iddiary` int(11) NOT NULL,
  `dd_content` varchar(500) NOT NULL,
  `dd_daycreate` datetime NOT NULL,
  `dd_attach` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `diarydocument`
--

INSERT INTO `diarydocument` (`dd_id`, `dd_iddiary`, `dd_content`, `dd_daycreate`, `dd_attach`) VALUES
(13, 2, 'Tôi đã cố gắng và tôi đã làm đc...', '2018-12-12 17:12:35', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/Diary%2FWed%20Dec%2012%2017%3A12%3A36%20GMT%2B07%3A00%202018.png?alt=media&token=9935f589-4ea4-4078-9520-cfd89eb04ee4'),
(14, 1, 'Mong ngày mai sẽ nắng tốt!', '2018-12-14 00:26:42', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/Diary%2FFri%20Dec%2014%2000%3A26%3A42%20GMT%2B07%3A00%202018.png?alt=media&token=f2e1baef-4e09-479f-8bd2-bc6552ba784d');

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
(1, 41, 'Tìm trung tâm học AV lần 1', 'Đường 3/2', '2018-12-14 18:00:00', '2018-12-14 20:00:00', 100, 10, 'Đi cùng nhóm'),
(2, 41, 'Tìm trung tâm học AV lần 2', 'Đường 30/4', '2018-12-15 07:30:00', '2018-12-15 10:00:00', 100, 10, 'Tìm trung tâm phù hợp với giờ đi làm'),
(3, 42, 'Bảo vệ luận văn', 'P09/DI', '2018-12-14 17:40:00', '2018-12-14 18:25:00', 100, 10, 'Kết quả bảo vệ rất quan trọng'),
(4, 42, 'Nộp file báo cáo đã sửa', 'Thư viện Khoa CNTT', '2018-12-15 07:00:00', '2018-12-16 17:00:00', 30, 10, '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `form`
--

CREATE TABLE `form` (
  `f_id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `form`
--

INSERT INTO `form` (`f_id`, `f_name`) VALUES
(1, 'Trắc nghiệm'),
(2, 'Tự luận'),
(3, 'Thực hành'),
(4, 'Trắc nghiệm và tự luận'),
(5, 'Khác');

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
(46, 'Trần Việt Châu', '0123456487', 'tvchau@cit.ctu.edu.vn', 'tvchau.com'),
(47, 'Test', '', '', ''),
(48, 'Trương Minh Thái', '', 'tmthai@cit.ctu.edu.vn', 'tmthai.com'),
(49, 'Phạm Thị Ngọc Diễm', '', 'ptndiem@cit.ctu.edu.vn', 'ptndiem.com'),
(50, 'Phạm Ngọc Quyền', '0123456789', 'pnquyen@cit.ctu.edu.vn', 'pnquyen.com');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plan`
--

CREATE TABLE `plan` (
  `p_id` int(11) NOT NULL,
  `p_codeuser` varchar(50) NOT NULL,
  `p_name` varchar(200) NOT NULL,
  `p_updateday` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `plan`
--

INSERT INTO `plan` (`p_id`, `p_codeuser`, `p_name`, `p_updateday`) VALUES
(41, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Tìm trung tâm học anh văn', '2018-12-03 14:25:55'),
(42, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Báo cáo luận văn', '2018-12-13 14:43:50');

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

--
-- Đang đổ dữ liệu cho bảng `schedule`
--

INSERT INTO `schedule` (`sch_id`, `sch_idstudy`, `sch_dayofweek`, `sch_place`, `sch_lesson`) VALUES
(1, 36, 'Thứ 2', '303/A3', '123'),
(3, 38, 'Thứ 3', '204/B1', '123'),
(6, 36, 'Thứ 7', '8978', '789'),
(7, 36, 'Thứ 4', '204/B1', '45'),
(8, 38, 'Thứ 5', 'P07/DI', '678'),
(9, 39, 'Thứ 6', '103/KH', '123'),
(10, 39, 'Thứ 2', 'P05/DI', '678');

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
(2018),
(2019),
(2020);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `score`
--

CREATE TABLE `score` (
  `sco_id` int(11) NOT NULL,
  `sco_score` double NOT NULL,
  `sco_note` varchar(200) DEFAULT NULL,
  `sco_updateday` datetime NOT NULL,
  `sco_idstudy` int(11) NOT NULL,
  `sco_idtos` int(11) NOT NULL,
  `sco_idform` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `score`
--

INSERT INTO `score` (`sco_id`, `sco_score`, `sco_note`, `sco_updateday`, `sco_idstudy`, `sco_idtos`, `sco_idform`) VALUES
(8, 10, 'Thật may mắn', '2018-12-12 15:48:16', 36, 1, 5),
(9, 9, 'Điểm giữa kỳ', '2018-12-13 14:20:37', 36, 1, 1),
(10, 9.5, '', '2018-12-14 12:11:47', 39, 1, 1);

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
(19, 'Học kỳ 1', 2018),
(20, 'Học kỳ 1', 2018),
(21, 'Học kỳ 2', 2018),
(22, 'Học kỳ 2', 2018),
(23, 'Học kỳ 2', 2018),
(24, 'Học kỳ 1', 2018),
(25, 'Học kỳ 2', 2018),
(26, 'Học kỳ 1', 2018);

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
(36, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 46, 38, 32),
(38, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 48, 40, 34),
(39, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 49, 41, 35),
(40, '8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 50, 42, 36);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `subject`
--

CREATE TABLE `subject` (
  `s_id` int(11) NOT NULL,
  `s_name` varchar(100) NOT NULL,
  `s_createday` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `subject`
--

INSERT INTO `subject` (`s_id`, `s_name`, `s_createday`) VALUES
(38, 'Toán rời rạc', '2018-12-12 15:16:22'),
(39, 'Môn Test', '2018-12-12 15:39:01'),
(40, 'Cấu trúc dữ liệu', '2018-12-12 18:13:11'),
(41, 'Cơ sở dữ liệu', '2018-12-13 14:37:46'),
(42, 'Luận văn tốt nghiệp 2018', '2018-12-13 14:42:38');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `testschedule`
--

CREATE TABLE `testschedule` (
  `ts_id` int(11) NOT NULL,
  `ts_idstudy` int(11) NOT NULL,
  `ts_idform` int(11) NOT NULL,
  `ts_daytest` datetime NOT NULL,
  `ts_place` varchar(100) NOT NULL,
  `ts_note` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `testschedule`
--

INSERT INTO `testschedule` (`ts_id`, `ts_idstudy`, `ts_idform`, `ts_daytest`, `ts_place`, `ts_note`) VALUES
(10, 36, 1, '2018-12-12 07:00:00', '101/C1', '60 phút 40 câu'),
(11, 38, 3, '2018-12-21 14:00:00', 'P06/DI', ''),
(12, 40, 5, '2018-12-14 17:00:00', 'P09/DI', 'Bảo vệ luận văn');

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

--
-- Đang đổ dữ liệu cho bảng `typeofscore`
--

INSERT INTO `typeofscore` (`tos_id`, `tos_name`) VALUES
(1, 'Hệ số 1'),
(2, 'Hệ số 2'),
(3, 'Hệ số 3');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `u_code` varchar(50) NOT NULL,
  `u_name` varchar(100) NOT NULL,
  `u_image` varchar(200) DEFAULT NULL,
  `u_email` varchar(100) NOT NULL,
  `u_gender` tinyint(1) NOT NULL,
  `u_birthday` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`u_code`, `u_name`, `u_image`, `u_email`, `u_gender`, `u_birthday`) VALUES
('8gLYImKCKaZ0UNQfCYMY3ZY56bt2', 'Trần Tấn Đồng', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/User%2F8gLYImKCKaZ0UNQfCYMY3ZY56bt2.png?alt=media&token=d806d6a1-2f3e-49ed-a51c-ecdee386dcb4', 'demo@gmail.com', 1, '1996-12-02'),
('Chybi1iYOvOQbN9ajDAySdV1Gsh1', 'I am Demo', 'https://firebasestorage.googleapis.com/v0/b/studentdiary-e027b.appspot.com/o/User%2FChybi1iYOvOQbN9ajDAySdV1Gsh1.png?alt=media&token=e11ab12b-f300-4be2-8c7d-dd6170b37c9d', 'demo1@gmail.com', 1, '1996-07-08');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`c_id`) USING BTREE,
  ADD KEY `fkc_semester` (`c_idsemester`);

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
  ADD KEY `fkdd_diary` (`dd_iddiary`);

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
  ADD PRIMARY KEY (`sco_id`),
  ADD KEY `fksco_idstudy` (`sco_idstudy`),
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
  ADD KEY `fkts_form` (`ts_idform`);

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
  MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT cho bảng `diary`
--
ALTER TABLE `diary`
  MODIFY `d_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `diarydocument`
--
ALTER TABLE `diarydocument`
  MODIFY `dd_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT cho bảng `documentsubject`
--
ALTER TABLE `documentsubject`
  MODIFY `ds_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `event`
--
ALTER TABLE `event`
  MODIFY `e_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `form`
--
ALTER TABLE `form`
  MODIFY `f_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `lecturer`
--
ALTER TABLE `lecturer`
  MODIFY `l_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `plan`
--
ALTER TABLE `plan`
  MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `schedule`
--
ALTER TABLE `schedule`
  MODIFY `sch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `score`
--
ALTER TABLE `score`
  MODIFY `sco_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `semester`
--
ALTER TABLE `semester`
  MODIFY `sm_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT cho bảng `study`
--
ALTER TABLE `study`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT cho bảng `subject`
--
ALTER TABLE `subject`
  MODIFY `s_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT cho bảng `testschedule`
--
ALTER TABLE `testschedule`
  MODIFY `ts_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT cho bảng `typeofdocument`
--
ALTER TABLE `typeofdocument`
  MODIFY `t_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `typeofscore`
--
ALTER TABLE `typeofscore`
  MODIFY `tos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `class`
--
ALTER TABLE `class`
  ADD CONSTRAINT `fkc_semester` FOREIGN KEY (`c_idsemester`) REFERENCES `semester` (`sm_id`);

--
-- Các ràng buộc cho bảng `diary`
--
ALTER TABLE `diary`
  ADD CONSTRAINT `fkd_codeuser` FOREIGN KEY (`d_codeuser`) REFERENCES `user` (`u_code`);

--
-- Các ràng buộc cho bảng `diarydocument`
--
ALTER TABLE `diarydocument`
  ADD CONSTRAINT `fkdd_diary` FOREIGN KEY (`dd_iddiary`) REFERENCES `diary` (`d_id`);

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
  ADD CONSTRAINT `fkts_form` FOREIGN KEY (`ts_idform`) REFERENCES `form` (`f_id`),
  ADD CONSTRAINT `fkts_study` FOREIGN KEY (`ts_idstudy`) REFERENCES `study` (`st_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

<?php 
	include "connect.php";
	$query_subject = "INSERT INTO subject(s_id,s_name,s_createday) VALUES (null,'LVTN','2018-11-20')";
	$query_lecturer = "INSERT INTO lecturer(l_id,l_name,l_phone,l_email,l_web) VALUES (null,'PNQ','','','')";
	$query_schoolyear = "INSERT INTO schoolyear(sy_id) SELECT * FROM (SELECT '2018') as tmp WHERE NOT EXISTS (SELECT sy_id FROM schoolyear WHERE sy_id='2018') LIMIT 1";

	$query_semester = "INSERT INTO semester(sm_id,sm_name,sm_year) VALUES (null,'HK I','2018')";
	$query_class = "INSERT INTO class(c_id,c_idyear,c_name) VALUES (null,'2018','IT A2 K40')";

	$result_lecturer = mysqli_query($conn,$query_lecturer);
	if ($result_lecturer) {
		$idlecturer = $conn->insert_id;
		echo "ID lecturer: " . $idlecturer;
	}else echo "Insert Lecturer Error";

	$result_subject = mysqli_query($conn,$query_subject);
	if ($result_subject) {
		$idsubject = $conn->insert_id;
		echo "ID subject: " . $idsubject;
	}else echo "Insert Subject Error";

	$result_schoolyear = mysqli_query($conn,$query_schoolyear);
	if ($result_schoolyear) {
		$result_semester = mysqli_query($conn,$query_semester);
		if ($result_semester) {
			$idsemester = $conn->insert_id;
			echo "ID semester: " . $idsemester;
		}else echo "Insert Semester Error";
	}else echo "Insert Schoolyear Error";

	$result_class = mysqli_query($conn,$query_class);
	if ($result_class) {
		$idclass = $conn->insert_id;
		echo "ID class: " . $idclass;
	}else echo "Insert Class Error";


	$query_study = "INSERT INTO study(st_id,st_codeuser,st_idlecturer,st_idsubject,st_idclass) VALUES (null,'Chybi1iYOvOQbN9ajDAySdV1Gsh1','$idlecturer','$idsubject','$idclass')";
	$result_study = mysqli_query($conn,$query_study);
	if ($result_study) {
		$idstudy = $conn->insert_id;
		echo "ID study: " . $idstudy;
	}else echo "Insert Study Error";
 ?>
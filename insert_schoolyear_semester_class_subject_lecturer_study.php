<?php
	include "connect.php";
	$codeuser 			= $_POST['u_code'];

	$namesubject 		= $_POST['s_name'];
	$createdaysubject 	= $_POST['s_createday'];

	$year 				= $_POST['sy_id'];

	$namesemester  		= $_POST['sm_name'];

	$namelecturer 		= $_POST['l_name'];
	$phonelecturer 		= $_POST['l_phone'];
	$emaillecturer 		= $_POST['l_email'];
	$weblecturer 		= $_POST['l_web'];

	$nameclass 	= $_POST['c_name'];

	$query_subject = "INSERT INTO subject(s_id,s_name,s_createday) VALUES (null,'$namesubject','$createdaysubject')";
	$query_lecturer = "INSERT INTO lecturer(l_id,l_name,l_phone,l_email,l_web) VALUES (null,'$namelecturer','$phonelecturer','$emaillecturer','$weblecturer')";
	$query_schoolyear = "INSERT INTO schoolyear(sy_id) SELECT * FROM (SELECT '$year') as tmp WHERE NOT EXISTS (SELECT sy_id FROM schoolyear WHERE sy_id='$year') LIMIT 1";

	$query_semester = "INSERT INTO semester(sm_id,sm_name,sm_year) VALUES (null,'$namesemester','$year')";
	$query_class = "INSERT INTO class(c_id,c_idyear,c_name) VALUES (null,'$year','$nameclass')";

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
	}else echo "Insert Semester Error";

	$result_class = mysqli_query($conn,$query_class);
	if ($result_class) {
		$idclass = $conn->insert_id;
		echo "ID class: " . $idclass;
	}else echo "Insert Class Error";


	$query_study = "INSERT INTO study(st_id,st_codeuser,st_idlecturer,st_idsubject,st_idclass) VALUES (null,'$codeuser','$idlecturer','$idsubject','$idclass')";
	$result_study = mysqli_query($conn,$query_study);
	if ($result_study) {
		$idstudy = $conn->insert_id;
		echo "ID study: " . $idstudy;
	}else echo "Insert Study Error";

	




	// if(strlen($idplan) > 0){
	// 	$query = "INSERT INTO event(e_id,e_idplan,e_name,e_place,e_starttime,e_endtime,e_priority,e_remind,e_describe) VALUES (null,'$idplan','$name','$place','$starttime','$endtime','$priority','$remind','$describe')";
	// 	$result = mysqli_query($conn, $query);
	// 	if ($result) {
	// 		echo "Success";
	// 	}else{
	// 		echo "Fail";
	// 	}

	// }else{
	// 	echo "Check data";
	// }
?>
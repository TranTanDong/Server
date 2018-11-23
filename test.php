<?php
	include "connect.php";
	$codeuser 			= '8gLYImKCKaZ0UNQfCYMY3ZY56bt2';

	$namesubject 		= 'Math';
	$createdaysubject 	= '2018-11-23';

	$year 				= '2018';

	$namesemester  		= 'Học kỳ II';

	$namelecturer 		= 'Nguyen Thi Ut';
	$phonelecturer 		= '';
	$emaillecturer 		= '';
	$weblecturer 		= '';

	$nameclass 	= '12A6';

	
	if (strlen($codeuser) > 0 && strlen($namesubject) > 0 && strlen($nameclass) > 0 && strlen($namesemester) > 0 && strlen($namelecturer) > 0 && strlen($year) > 0) {
		//Insert Lecturer
		$query_lecturer = "INSERT INTO lecturer(l_id,l_name,l_phone,l_email,l_web) VALUES (null,'$namelecturer','$phonelecturer','$emaillecturer','$weblecturer')";
		$result_lecturer = mysqli_query($conn,$query_lecturer);
		if ($result_lecturer) {
			$idlecturer = $conn->insert_id;
			echo " - ID lecturer: " . $idlecturer;
		}else echo " - Insert Lecturer Error";
		//Insert Subject
		$query_subject = "INSERT INTO subject(s_id,s_name,s_createday) VALUES (null,'$namesubject','$createdaysubject')";
		$result_subject = mysqli_query($conn,$query_subject);
		if ($result_subject) {
			$idsubject = $conn->insert_id;
			echo " - ID subject: " . $idsubject;
		}else echo " - Insert Subject Error";
		//Insert Schoolyear
		$query_schoolyear = "INSERT INTO schoolyear(sy_id) SELECT * FROM (SELECT '$year') as tmp WHERE NOT EXISTS (SELECT sy_id FROM schoolyear WHERE sy_id='$year') LIMIT 1";
		$result_schoolyear = mysqli_query($conn,$query_schoolyear);
		if ($result_schoolyear) {
			echo $year;
		}else echo " - Insert Schoolyear Error";
		
		//Process Semester
		$query_semester = "INSERT INTO semester(sm_name,sm_year) SELECT * FROM (SELECT '$namesemester','$year') as smt WHERE NOT EXISTS (SELECT sm_name,sm_year FROM semester WHERE sm_name='$namesemester' && sm_year='$year') LIMIT 1";
		$query_idsemester = "SELECT sm_id FROM semester WHERE sm_name='$namesemester' && sm_year='$year'";
		$result_semester = mysqli_query($conn,$query_semester);
		if ($result_semester) {
			$idsemester = $conn->insert_id;
			echo " - ID semester: " . $idsemester;
		}else echo " - Insert Semester Error";

		if ($idsemester === 0) {
			$arraysemester = array();
			$data = mysqli_query($conn, $query_idsemester);
			$i=0;
			while ($row = mysqli_fetch_assoc($data)) {
				if ($i===0) {
					$idsemester=$row['sm_id'];
				}
				$i=$i+1;
			}

			echo $idsemester;
		}

		//Insert Class
		$query_class = "INSERT INTO class(c_id,c_idsemester,c_name) VALUES (null,'$idsemester','$nameclass')";
		$result_class = mysqli_query($conn,$query_class);
		if ($result_class) {
			$idclass = $conn->insert_id;
			echo " - ID class: " . $idclass;
		}else echo " - Insert Class Error";

		//Insert Study
		$query_study = "INSERT INTO study(st_id,st_codeuser,st_idlecturer,st_idsubject,st_idclass) VALUES (null,'$codeuser','$idlecturer','$idsubject','$idclass')";
		$result_study = mysqli_query($conn,$query_study);
		if ($result_study) {
			$idstudy = $conn->insert_id;
			echo " - ID study: " . $idstudy;
		}else echo " - Insert Study Error";
	}else echo " - Check data";

	class Semester{
		function Semester($id){
			$this->id=$id;
		}
	}
?>
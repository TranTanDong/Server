<?php
	include "connect.php";
	$idsubject 	= $_POST['s_id'];
	$namesubject 	= $_POST['s_name'];

	$year = $_POST['sy_id'];

	$idsemester = $_POST['sm_id'];
	$namesemester = $_POST['sm_name'];

	$idclass = $_POST['c_id'];
	$nameclass = $_POST['c_name'];

	// $idsubject 	= '31';
	// $namesubject 	= 'Cơ Sở Dữ Liệu';

	// $year = '2020';

	// $idsemester = '15';
	// $namesemester = 'Học kỳ 3';

	// $idclass = '25';
	// $nameclass = 'Cơ Sở Dữ Liệu';

	if (strlen($idsubject) > 0 && strlen($namesubject) > 0 && strlen($year) > 0 && strlen($idsemester) > 0 && strlen($namesemester) > 0 && strlen($idclass) > 0 && strlen($nameclass) > 0) {

		$query_schoolyear = "INSERT INTO schoolyear(sy_id) SELECT * FROM (SELECT '$year') as tmp WHERE NOT EXISTS (SELECT sy_id FROM schoolyear WHERE sy_id='$year') LIMIT 1";
		$result_schoolyear = mysqli_query($conn,$query_schoolyear);
		if ($result_schoolyear) {
			// echo $year;
		}else echo " - Insert Schoolyear Error";

		$query = "UPDATE subject SET s_name='$namesubject' WHERE s_id='$idsubject';";
		$query .= "UPDATE semester SET sm_name='$namesemester',sm_year='$year' WHERE sm_id='$idsemester';";
		$query .= "UPDATE class SET c_name='$nameclass',c_idsemester='$idsemester' WHERE c_id='$idclass';";

		$result = mysqli_multi_query($conn,$query);
		if ($result) {
			echo "Success";
		}else{
			echo "Fail";
		}
	}else{
		echo "Check data";
	}

	// if(strlen($id) > 0 && strlen($name) > 0){
	// 	$query = "UPDATE lecturer SET l_name='$name',l_phone='$phone',l_email='$email',l_web='$web' WHERE l_id='$id'";
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
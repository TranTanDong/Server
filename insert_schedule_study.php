<?php
	include "connect.php";
	$idst 	= $_POST['sch_idstudy'];
	$dayofweek 	= $_POST['sch_dayofweek'];
	$place = $_POST['sch_place'];
	$lesson = $_POST['sch_lesson'];

	if(strlen($idst) > 0){
		$query = "INSERT INTO schedule(sch_id,sch_idstudy,sch_dayofweek,sch_place,sch_lesson) VALUES (null,'$idst','$dayofweek','$place','$lesson')";
		$result = mysqli_query($conn, $query);
		if ($result) {
			echo "Success";
		}else{
			echo "Fail";
		}
	}else{
		echo "Check data";
	}
?>
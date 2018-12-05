<?php
	include "connect.php";
	$id 	= $_POST['sch_id'];
	$idst 	= $_POST['sch_idstudy'];
	$dayofweek 	= $_POST['sch_dayofweek'];
	$place = $_POST['sch_place'];
	$lesson = $_POST['sch_lesson'];

	if(strlen($idst) > 0){
		$query = "UPDATE schedule SET sch_idstudy='$idst',sch_dayofweek='$dayofweek',sch_place='$place',sch_lesson='$lesson' WHERE sch_id='$id'";
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
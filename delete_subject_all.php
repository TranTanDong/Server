<?php
	include "connect.php";
	$id 	= $_POST['st_id'];
	// $id 	= '34';

	if(strlen($id) > 0){
		$query 	= "DELETE FROM schedule WHERE sch_idstudy='$id';";
		$query .= "DELETE FROM testschedule WHERE ts_idstudy='$id';";
		$query .= "DELETE FROM score WHERE sco_idstudy='$id';";
		$query .= "DELETE FROM study WHERE st_id='$id';";

		$result = mysqli_multi_query($conn, $query);
		if ($result) {
			echo "Success";
		}else{
			echo "Fail";
		}
	}else{
		echo "Check data";
	}
?>
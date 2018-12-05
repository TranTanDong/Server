<?php
	include "connect.php";
	$idst 	= $_POST['ts_idstudy'];
	$idform 	= $_POST['ts_idform'];
	$daytest 	= $_POST['ts_daytest'];
	$place = $_POST['ts_place'];
	$note = $_POST['ts_note'];


	if(strlen($idst) > 0){
		$query = "INSERT INTO testschedule(ts_id,ts_idstudy,ts_idform,ts_daytest,ts_place,ts_note) VALUES (null,'$idst','$idform','$daytest','$place','$note')";
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
<?php
	include "connect.php";
	$id 	= $_POST['ts_id'];
	$idst 	= $_POST['ts_idstudy'];
	$idform 	= $_POST['ts_idform'];
	$daytest 	= $_POST['ts_daytest'];
	$place = $_POST['ts_place'];
	$note = $_POST['ts_note'];

	if(strlen($idst) > 0){
		$query = "UPDATE testschedule SET ts_idstudy='$idst',ts_idform='$idform',ts_daytest='$daytest',ts_place='$place',ts_note='$note' WHERE ts_id='$id'";
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
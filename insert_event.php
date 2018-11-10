<?php
	include "connect.php";
	$idplan 	= $_POST['e_idplan'];
	$name 		= $_POST['e_name'];
	$place 		= $_POST['e_place'];
	$starttime  = $_POST['e_starttime'];
	$endtime 	= $_POST['e_endtime'];
	$priority 	= $_POST['e_priority'];
	$remind 	= $_POST['e_remind'];
	$describe 	= $_POST['e_describe'];

	if(strlen($idplan) > 0){
		$query = "INSERT INTO event(e_id,e_idplan,e_name,e_place,e_starttime,e_endtime,e_priority,e_remind,e_describe) VALUES (null,'$idplan','$name','$place','$starttime','$endtime','$priority','$remind','$describe')";
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

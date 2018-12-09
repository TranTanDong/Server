<?php
	include "connect.php";
	$id 		= $_POST['e_id'];
	$idplan 	= $_POST['e_idplan'];
	$name 		= $_POST['e_name'];
	$place 		= $_POST['e_place'];
	$starttime  = $_POST['e_starttime'];
	$endtime 	= $_POST['e_endtime'];
	$priority 	= $_POST['e_priority'];
	$remind 	= $_POST['e_remind'];
	$describe 	= $_POST['e_describe'];

	if(strlen($idplan) > 0){
		$query = "UPDATE event SET e_idplan='$idplan',e_name='$name',e_place='$place',e_starttime='$starttime',e_endtime='$endtime',e_priority='$priority',e_remind='$remind',e_describe='$describe' WHERE e_id='$id'";
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

<?php
	include "connect.php";
	$id 	= $_POST['ts_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM testschedule WHERE ts_id='$id'";
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
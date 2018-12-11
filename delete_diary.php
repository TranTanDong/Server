<?php
	include "connect.php";
	$id 	= $_POST['d_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM diarydocument WHERE dd_iddiary='$id';";
		$query .= "DELETE FROM diary WHERE d_id='$id'";
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
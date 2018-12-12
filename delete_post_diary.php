<?php
	include "connect.php";
	$id 	= $_POST['dd_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM diarydocument WHERE dd_id='$id'";
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
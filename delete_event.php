<?php
	include "connect.php";
	$id 	= $_POST['e_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM event WHERE e_id='$id'";
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
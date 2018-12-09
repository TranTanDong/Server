<?php
	include "connect.php";
	$id 	= $_POST['p_id'];
	$name 	= $_POST['p_name'];

	if(strlen($id) > 0){
		$query = "UPDATE plan SET p_name='$name' WHERE p_id='$id'";
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
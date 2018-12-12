<?php
	include "connect.php";
	$id 	= $_POST['d_id'];
	$name 	= $_POST['d_name'];

	if(strlen($id) > 0){
		$query = "UPDATE diary SET d_name='$name' WHERE d_id='$id'";
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
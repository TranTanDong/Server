<?php
	include "connect.php";
	$id 	= $_POST['l_id'];
	$name 	= $_POST['l_name'];
	$phone = $_POST['l_phone'];
	$email = $_POST['l_email'];
	$web = $_POST['l_web'];

	if(strlen($id) > 0 && strlen($name) > 0){
		$query = "UPDATE lecturer SET l_name='$name',l_phone='$phone',l_email='$email',l_web='$web' WHERE l_id='$id'";
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
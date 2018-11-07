<?php
	include "connect.php";
	$code 	= $_POST['u_code'];
	$name 	= $_POST['u_name'];
	$image	= $_POST['u_image'];
	$gender = $_POST['u_gender'];
	$birthday = $_POST['u_birthday'];

	if(strlen($code) > 0){
		$query = "UPDATE user SET u_name='$name',u_image='$image',u_gender='$gender',u_birthday='$birthday' WHERE u_code='$code'";

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

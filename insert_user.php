<?php
	include "connect.php";
	$code 	= $_POST['u_code'];
	$name 	= $_POST['u_name'];
	$email 	= $_POST['u_email'];
	$gender = $_POST['u_gender'];
	$birthday = $_POST['u_birthday'];

	if(strlen($code) > 0){
		$query = "INSERT INTO user(u_code,u_name,u_email,u_sex,u_birthday) VALUES ('$code','$name','$email','$gender','$birthday')";
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

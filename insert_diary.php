<?php
	include "connect.php";
	$codeuser 	= $_POST['d_codeuser'];
	$name 	= $_POST['d_name'];
	$updateday = $_POST['d_dayupdate'];

	if(strlen($codeuser) > 0){
		$query = "INSERT INTO diary(d_id,d_codeuser,d_name,d_dayupdate) VALUES (null,'$codeuser','$name','$updateday')";
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
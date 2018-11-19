<?php
	include "connect.php";
	$codeuser 	= $_POST['p_codeuser'];
	$name 	= $_POST['p_name'];
	$updateday = $_POST['p_updateday'];

	if(strlen($codeuser) > 0){
		$query = "INSERT INTO plan(p_id,p_codeuser,p_name,p_updateday) VALUES (null,'$codeuser','$name','$updateday')";
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
<?php
	include "connect.php";
	$id 	= $_POST['p_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM event WHERE e_idplan='$id';";
		$query .= "DELETE FROM plan WHERE p_id='$id'";
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
<?php
	include "connect.php";
	$id 	= $_POST['sco_id'];

	if(strlen($id) > 0){
		$query = "DELETE FROM score WHERE sco_id='$id'";
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
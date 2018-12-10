<?php
	include "connect.php";
	$iddiary 		= $_POST['dd_iddiary'];
	$content 		= $_POST['dd_content'];
	$daycreate 		= $_POST['dd_daycreate'];
	$attach 		= $_POST['dd_attach'];
	

	if(strlen($iddiary) > 0){
		$query = "INSERT INTO diarydocument(dd_id,dd_iddiary,dd_content,dd_daycreate,dd_attach) VALUES (null,'$iddiary','$content','$daycreate','$attach')";
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

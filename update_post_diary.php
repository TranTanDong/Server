<?php
	include "connect.php";
	$id 			= $_POST['dd_id'];
	$content 		= $_POST['dd_content'];
	$attach 		= $_POST['dd_attach'];

	if(strlen($id) > 0){
		$query = "UPDATE diarydocument SET dd_content='$content',dd_attach='$attach' WHERE dd_id='$id'";
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

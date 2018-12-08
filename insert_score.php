
<?php
	include "connect.php";
	$score 	= $_POST['sco_score'];
	$note 	= $_POST['sco_note'];
	$updateday 	= $_POST['sco_updateday'];
	$idst 	= $_POST['sco_idstudy'];
	$idtos 	= $_POST['sco_idtos'];
	$idform = $_POST['sco_idform'];

	if(strlen($score) > 0){
		$query = "INSERT INTO score(sco_score,sco_note,sco_updateday,sco_idstudy,sco_idtos,sco_idform) VALUES ('$score','$note','$updateday','$idst','$idtos','$idform')";
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
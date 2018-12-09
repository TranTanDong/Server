
<?php
	include "connect.php";
	$id 	= $_POST['sco_id'];
	$score 	= $_POST['sco_score'];
	$note 	= $_POST['sco_note'];
	$updateday 	= $_POST['sco_updateday'];
	$idst 	= $_POST['sco_idstudy'];
	$idtos 	= $_POST['sco_idtos'];
	$idform = $_POST['sco_idform'];

	if(strlen($score) > 0){
		$query = "UPDATE score SET sco_score='$score',sco_note='$note',sco_updateday='$updateday',sco_idstudy='$idst',sco_idtos='$idtos',sco_idform='$idform' WHERE sco_id='$id'";
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
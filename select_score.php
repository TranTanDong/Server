<?php
	include "connect.php";

	$arrayscore = array();
	$query = "SELECT sco_id,sco_score,sco_note,sco_updateday,sco_idstudy,sco_idtos,sco_idform,st_codeuser FROM score,study WHERE study.st_id=score.sco_idstudy";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayscore, new Score(
			$row['sco_id'],
			$row['sco_score'],
			$row['sco_note'],
			$row['sco_updateday'],
			$row['sco_idstudy'],
			$row['sco_idtos'],
			$row['sco_idform'],
			$row['st_codeuser'])
		);
	}

	echo json_encode($arrayscore);



	class Score{
		function Score($id,$score,$note,$updateday,$idst,$idtos,$idform,$codeuser){
			$this->id=$id;
			$this->score=$score;
			$this->note=$note;
			$this->updateday=$updateday;
			$this->idst=$idst;
			$this->idtos=$idtos;
			$this->idform=$idform;
			$this->codeuser=$codeuser;
		}
	}

?>
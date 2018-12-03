<?php
	include "connect.php";

	$arraytest = array();
	$query = "SELECT ts_id,ts_idform,ts_daytest,ts_place,ts_note,st_idsubject,st_codeuser,ts_idstudy FROM testschedule,study WHERE study.st_id=testschedule.ts_idstudy ORDER BY ts_daytest ASC";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraytest, new Test(
			$row['ts_id'],
			$row['ts_idform'],
			$row['ts_daytest'],
			$row['ts_place'],
			$row['ts_note'],
			$row['st_idsubject'],
			$row['st_codeuser'],
			$row['ts_idstudy'])
		);
	}

	echo json_encode($arraytest);



	class Test{
		function Test($id,$idform,$daytest,$place,$note,$idsubject,$codeuser,$idst){
			$this->id=$id;
			$this->idform=$idform;
			$this->daytest=$daytest;
			$this->place=$place;
			$this->note=$note;
			$this->idsubject=$idsubject;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
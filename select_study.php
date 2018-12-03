<?php
	include "connect.php";

	$arraystudy = array();
	$query = "SELECT sch_id,sch_dayofweek,sch_place,sch_lesson,st_idsubject,st_codeuser,sch_idstudy FROM schedule,study WHERE study.st_id=schedule.sch_idstudy ORDER BY sch_dayofweek,sch_lesson ASC";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraystudy, new Study(
			$row['sch_id'],
			$row['sch_dayofweek'],
			$row['sch_place'],
			$row['sch_lesson'],
			$row['st_idsubject'],
			$row['st_codeuser'],
			$row['sch_idstudy'])
		);
	}

	echo json_encode($arraystudy);



	class Study{
		function Study($id,$dayofweek,$place,$lesson,$idsubject,$codeuser,$idst){
			$this->id=$id;
			$this->dayofweek=$dayofweek;
			$this->place=$place;
			$this->lesson=$lesson;
			$this->idsubject=$idsubject;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
<?php
	include "connect.php";
	
	$arrayclassyear = array();
	$query = "SELECT c_id,c_name,c_idsemester,sm_name,sm_year,st_codeuser,st_id FROM class,study,semester WHERE class.c_id=study.st_idclass && class.c_idsemester=semester.sm_id";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayclassyear, new ClassYear(
			$row['c_id'],
			$row['c_name'],
			$row['c_idsemester'],
			$row['sm_name'],
			$row['sm_year'],
			$row['st_codeuser'],
			$row['st_id'])
		);
	}

	echo json_encode($arrayclassyear);



	class ClassYear{
		function ClassYear($idclass,$nameclass,$idsemester,$namesemester,$year,$codeuser,$idst){
			$this->idclass=$idclass;
			$this->nameclass=$nameclass;
			$this->idsemester=$idsemester;
			$this->namesemester=$namesemester;
			$this->year=$year;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
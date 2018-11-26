<?php
	include "connect.php";
	
	$arrayclassyear = array();
	$query = "SELECT c_id,c_name,c_idsemester,sm_name,sm_year,st_codeuser,st_id FROM class,study,semester WHERE class.c_id=study.st_idclass && class.c_idsemester=semester.sm_id";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayclassyear, new ClassYear(
			$row['s_id'],
			$row['s_name'],
			$row['s_createday'],
			$row['st_codeuser'],
			$row['st_id'])
		);
	}

	echo json_encode($arraysubject);



	class ClassYear{
		function ClassYear($id,$name,$createday,$codeuser,$idst){
			$this->id=$id;
			$this->name=$name;
			$this->createday=$createday;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
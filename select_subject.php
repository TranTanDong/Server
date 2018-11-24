<?php
	include "connect.php";
	// $codeuser = $_POST['u_code'];
	// $codeuser = "Chybi1iYOvOQbN9ajDAySdV1Gsh1";

	$arraysubject = array();
	$query = "SELECT s_id,s_name,s_createday,st_codeuser,st_id FROM subject,study WHERE subject.s_id=study.st_idsubject";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraysubject, new Subject(
			$row['s_id'],
			$row['s_name'],
			$row['s_createday'],
			$row['st_codeuser'],
			$row['st_id'])
		);
	}

	echo json_encode($arraysubject);



	class Subject{
		function Subject($id,$name,$createday,$codeuser,$idst){
			$this->id=$id;
			$this->name=$name;
			$this->createday=$createday;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
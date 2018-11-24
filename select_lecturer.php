<?php
	include "connect.php";

	$arraylecturer = array();
	$query = "SELECT l_id,l_name,l_phone,l_email,l_web,st_codeuser,st_id FROM lecturer,study WHERE lecturer.l_id=study.st_idlecturer";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraylecturer, new Lecturer(
			$row['l_id'],
			$row['l_name'],
			$row['l_phone'],
			$row['l_email'],
			$row['l_web'],
			$row['st_codeuser'],
			$row['st_id'])
		);
	}

	echo json_encode($arraylecturer);



	class Lecturer{
		function Lecturer($id,$name,$phone,$email,$web,$codeuser,$idst){
			$this->id=$id;
			$this->name=$name;
			$this->phone=$phone;
			$this->email=$email;
			$this->web=$web;
			$this->codeuser=$codeuser;
			$this->idst=$idst;
		}
	}

?>
<?php
	include "connect.php";
	$arraydiary = array();
	$query = "SELECT * FROM diary";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraydiary, new Diary(
			$row['d_id'],
			$row['d_codeuser'],
			$row['d_name'],
			$row['d_dayupdate'])
		);
	}

	echo json_encode($arraydiary);



	class Diary{
		function Diary($id,$codeuser,$name,$updateday){
			$this->id=$id;
			$this->codeuser=$codeuser;
			$this->name=$name;
			$this->updateday=$updateday;
		}
	}

?>
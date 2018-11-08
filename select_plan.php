<?php
	include "connect.php";
	$arrayplan = array();
	$query = "SELECT * FROM plan";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayplan, new Plan(
			$row['p_id'],
			$row['p_codeuser'],
			$row['p_name'],
			$row['p_updateday'])
		);
	}

	echo json_encode($arrayplan);



	class Plan{
		function Plan($id,$codeuser,$name,$updateday){
			$this->id=$id;
			$this->codeuser=$codeuser;
			$this->name=$name;
			$this->updateday=$updateday;
		}
	}

?>
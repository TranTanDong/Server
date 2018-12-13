<?php
	include "connect.php";
	$arrayevent = array();
	$query = "SELECT e_id,e_idplan,e_name,e_place,e_starttime,e_endtime,e_priority,e_remind,e_describe,p_codeuser FROM event,plan WHERE event.e_idplan=plan.p_id ORDER BY e_starttime,e_priority";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayevent, new Event(
			$row['e_id'],
			$row['e_idplan'],
			$row['e_name'],
			$row['e_place'],
			$row['e_starttime'],
			$row['e_endtime'],
			$row['e_priority'],
			$row['e_remind'],
			$row['e_describe'],
			$row['p_codeuser'])
		);
	}

	echo json_encode($arrayevent);



	class Event{
		function Event($id,$idplan,$name,$place,$starttime,$endtime,$priority,$remind,$describe,$codeuser){
			$this->id=$id;
			$this->idplan=$idplan;
			$this->name=$name;
			$this->place=$place;
			$this->starttime=$starttime;
			$this->endtime=$endtime;
			$this->priority=$priority;
			$this->remind=$remind;
			$this->describe=$describe;
			$this->codeuser=$codeuser;
		}
	}

?>
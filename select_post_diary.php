<?php
	include "connect.php";
	$arraypostdiary = array();
	$query = "SELECT dd_id,dd_iddiary,dd_content,dd_daycreate,dd_attach,d_codeuser FROM diary,diarydocument WHERE diary.d_id=diarydocument.dd_iddiary";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arraypostdiary, new PostDiary(
			$row['dd_id'],
			$row['dd_iddiary'],
			$row['dd_content'],
			$row['dd_daycreate'],
			$row['dd_attach'],
			$row['d_codeuser'])
		);
	}

	echo json_encode($arraypostdiary);



	class PostDiary{
		function PostDiary($id,$iddiary,$content,$daycreate,$attach,$codeuser){
			$this->id=$id;
			$this->iddiary=$iddiary;
			$this->content=$content;
			$this->daycreate=$daycreate;
			$this->attach=$attach;
			$this->codeuser=$codeuser;
		}
	}

?>
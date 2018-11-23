<?php
	include "connect.php";
	$arrayuser = array();
	$query = "SELECT * FROM user";

	$data = mysqli_query($conn,$query);
	while ($row = mysqli_fetch_assoc($data)) {
		array_push($arrayuser, new User(
			$row['u_code'],
			$row['u_name'],
			$row['u_image'],
			$row['u_email'],
			$row['u_gender'],
			$row['u_birthday'])
		);
	}

	echo json_encode($arrayuser);


	class User{
		function User($code,$name,$image,$email,$gender,$birthday){
			$this->code=$code;
			$this->name=$name;
			$this->image=$image;
			$this->email=$email;
			$this->gender=$gender;
			$this->birthday=$birthday;
		}
	}

?>
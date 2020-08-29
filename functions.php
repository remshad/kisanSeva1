<?php

function addNewFarmer($f_name,$f_pass,$f_addr,$f_phone,$v_id) {
global $link;
		$sql = "INSERT INTO farmer(f_name,f_password,f_address,f_phone,v_id) VALUES('".$f_name."','".$f_pass."','".$f_addr."','".$f_phone."','".$v_id."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<script>alert('Farmer Already Exists!')</script>";
		} else {
			echo "<script>alert('Farmer Registered Successfully!')</script>";
		}
	}
	function addNewDealer($f_name,$f_pass,$f_addr,$f_phone,$v_id,$l_no,$s_name) {
		global $link;
		$sql = "INSERT INTO dealer(de_name,de_store_name,de_address,v_id,de_phone,de_password,de_licence) VALUES('".$f_name."','".$s_name."','".$f_addr."','".$v_id."','".$f_phone."','".$f_pass."','".$l_no."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<script>alert('Dealer Already Exists!')</script>";
		} else {
			echo "<script>alert('Dealer Registered Successfully!')</script>";
		}
	}

	function addagriofficer($f_name,$f_pass,$f_addr,$f_phone,$v_id,$l_no,$s_name) {
		global $link;
		$sql = "INSERT INTO agriofficer(de_name,de_store_name,de_address,v_id,de_phone,de_password,de_licence) VALUES('".$f_name."','".$s_name."','".$f_addr."','".$v_id."','".$f_phone."','".$f_pass."','".$l_no."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<script>alert('Dealer Already Exists!')</script>";
		} else {
			echo "<script>alert('Dealer Registered Successfully!')</script>";
		}
	}
	function addPlanting($cv_id,$planting_date,$harv_date,$qty,$qtype,$v_id,$loc,$fid) {
		global $link;
		$p_status='0';
	echo	$sql = "INSERT INTO planting(cv_id,p_planting_date,p_harvesting_date,p_quantity,p_quantity_type,v_id,p_locality,f_id,p_status
) VALUES('".$c_id."','".$cv_id."','".$planting_date."','".$harv_date."','".$qty."','".$qtype."','".$v_id."','".$loc."','".$fid."','".$p_status."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<script>alert('Planting Already Exists!')</script>";
		} else {
			echo "<script>alert('Planting Registered Successfully!')</script>";
		}
	}
	function addHarvesting($p_id,$h_date,$h_qty,$u_price,$willing,$h_stats) {
		global $link;
		$sql = "INSERT INTO harvesting(p_id,h_date,h_quantity,h_unit_price,h_transp_willing,h_status,ut_id) VALUES('".$p_id."','".$h_date."','".$h_qty."','".$u_price."','".$willing."','".$h_stats."',(SELECT p_quantity_type FROM planting WHERE p_id='".$p_id."'))";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<script>alert('Harvesting Already Exists!')</script>";
		} else {
			echo "<script>alert('Harvesting Registered Successfully!')</script>";
			$sql = "UPDATE planting SET p_status='1' WHERE p_id='".$p_id."'";
			$result = mysqli_query($link, $sql);
	}
	}
	function setPrice($c_id,$today,$de_id ,$cp_price) {
		global $link;
		$sql = "INSERT INTO crop_price(c_id,de_id,cp_date,cp_price) VALUES('".$c_id."','".$de_id."','".$today."','".$cp_price."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<h1>Error Occured!</h1>";
		} else {
			echo "<script>alert('Crop Price Saved Successfully!')</script>";
		}
	}
	function setinst($c_id,$cinst) {
		global $link;
		$sql = "INSERT INTO crop_instruction(c_id,ci_instructions) VALUES('".$c_id."','".$cinst."')";
		$result = mysqli_query($link, $sql);
		if($result!=1) {
			echo "<h1>Error Occured!</h1>";
		} else {
			echo "<script>alert('Crop Price Saved Successfully!')</script>";
		}
	}
?>

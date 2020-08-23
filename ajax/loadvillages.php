<?php
require_once('dbs.php'); 
$d_id=$_GET['d_id'];
$sql = "SELECT * FROM village WHERE d_id=$d_id";
$result = mysqli_query($link, $sql);
if (mysqli_num_rows($result) > 0) {    
	while($row = mysqli_fetch_assoc($result)) {
		echo "<option value='".$row["v_id"]. "'>".$row["v_name"]. "</option>";	
	}
}
?>
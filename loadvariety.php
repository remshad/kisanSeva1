<?php
require_once('dbs.php'); 
$c_id=$_GET['c_id'];
$sql = "SELECT * FROM variety WHERE c_id=$c_id";	
$result = mysqli_query($link, $sql);
if (mysqli_num_rows($result) > 0) {    
	while($row = mysqli_fetch_assoc($result)) {
		echo "<option value='".$row["cv_id"]. "'>".$row["v_name"]. "</option>";	
	}
}
mysqli_close($conn);
?>
<?php
require_once('dbs.php'); 
$c_id=$_GET['c_id'];
$sql = "SELECT * FROM crop WHERE cc_id=$c_id";	
$result = mysqli_query($link, $sql);
if (mysqli_num_rows($result) > 0) {    
	echo "<option value=''>Select</option>";	
	while($row = mysqli_fetch_assoc($result)) {
		echo "<option value='".$row["c_id"]. "'>".$row["c_name"]. "</option>";	
	}
}
mysqli_close($conn);
?>
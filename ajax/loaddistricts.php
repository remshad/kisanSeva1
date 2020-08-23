<?php
require_once('dbs.php'); 
$s_id=$_GET['s_id'];
$sql = "SELECT * FROM district WHERE s_id=$s_id";	
$result = mysqli_query($link, $sql);
echo "<option value=''>Select a Disctric</option>";	
if (mysqli_num_rows($result) > 0) {    
	while($row = mysqli_fetch_assoc($result)) {
		echo "<option value='".$row["d_id"]. "'>".$row["d_name"]. "</option>";	
	}
}
mysqli_close($conn);
?>
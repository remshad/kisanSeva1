<?php
include("DBConnect.php");
$sql = "SELECT member_id,member_name FROM member_tbl";
$result = mysqli_query($conn, $sql);
if (mysqli_num_rows($result) > 0) {    
	while($row = mysqli_fetch_assoc($result)) {
		echo "<option value='".$row["member_id"]. "'>".$row["member_name"]. "</option>";	
	}
}
mysqli_close($conn);
?>
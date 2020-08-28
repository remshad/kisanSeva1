<?php
require_once('dbs.php'); 
$c_id=$_GET['c_id'];
$sql = "SELECT ci_instruction FROM  crop_instruction, crop where crop_instruction.c_id=$nm AND crop_instruction.c_id=crop.c_id ";
$result = mysqli_query($link, $sql);
if (mysqli_num_rows($result) > 0) {    
	while($row = mysqli_fetch_assoc($result)) {
		echo $row['ci_instruction'];
	}
}
mysqli_close($conn);
?>

<?php

									
								//  $nm=$_POST['crop'];
								
								
								// if (mysqli_num_rows($result) > 0) {
								// 	while ($row = mysqli_fetch_assoc($result)) {
										
								// 	}
											
								//  $text=$_POST['editor1'];

								// $sql1 = "UPDATE crop_instruction SET ci_instruction='".$text."' WHERE c_id='".$nm."'";
								// $result1 = mysqli_query($link, $sql1);
								}
								// else
								// {
								// $sql = "INSERT INTO crop_instruction(c_id,ci_instruction) VALUES('".$nm."','".$text."')";
								// $result = mysqli_query($link, $sql);
								// }
								
								?>	
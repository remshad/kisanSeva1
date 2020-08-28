<?php 
require_once('../dbs.php'); 
$msgid=$_GET["msgid"];
$sql="UPDATE dealer_to_farmer_msg SET dtfm_status='1' WHERE dtfm_id='$msgid'";
$res=mysqli_query($link, $sql);
if($res){
    echo"<script>alert('Message Hided Successfully'); window.location='index.php';</script>";
}
?>
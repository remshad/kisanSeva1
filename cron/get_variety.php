<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
include_once "simple_html_dom.php";
include_once "dbs.php";

$sql="SELECT * FROM `crop` ";
$result=mysqli_query($link,$sql);
while($row=mysqli_fetch_assoc($result))
{
$sql="SELECT DISTINCT(`variety`) FROM `market_data` WHERE item LIKE '{$row['c_name']}'";
$res=mysqli_query($link,$sql);
while($row1=mysqli_fetch_assoc($res)){
    $nam=mysqli_real_escape_string($link,$row1['variety']);
    $part[]="('{$row['c_id']}', '{$nam}')";
}

}

$all=implode(",",$part);
$sql="INSERT INTO `variety`(`c_id`, `v_name`) VALUES {$all}";
mysqli_query($link,$sql);
?>
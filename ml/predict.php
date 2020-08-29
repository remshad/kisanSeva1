<?php
error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
include_once '../dbs.php';
include_once 'train.php';


$sample=[1,"22.479999923706053","18.6"];
$sql="SELECT * FROM `ml_data` WHERE ml_id=4";
$result=mysqli_query($link,$sql);
while($row=mysqli_fetch_assoc($result)){

    echo getpredict($sample,$row['model_path']);
}

?>
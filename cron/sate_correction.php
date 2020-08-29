<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
include_once "simple_html_dom.php";
include_once "dbs.php";

$sql="SELECT * FROM `state`";
$result=mysqli_query($link,$sql);
while($row=mysqli_fetch_assoc($result))
{

echo $sql="SELECT * FROM `states` WHERE name = '{$row['s_name']}'";
$rw=mysqli_query($link,$sql);
if(mysqli_num_rows($rw)>0)
{


while($roq=mysqli_fetch_assoc($rw))
{
    echo $sql="UPDATE regions set state_id='{$row['s_id']}' WHERE state_id = '{$roq['id']}'";
    mysqli_query($link,$sql);

    $sl="UPDATE states SET stat=3 WHERE id LIKE '{$roq['id']}'";
    mysqli_query($link,$sl);    
}

}


}

?>
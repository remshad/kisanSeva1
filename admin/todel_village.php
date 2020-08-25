<?php
include_once('../dbs.php');
$data=file_get_contents('datas.txt');
$rows=explode("\n",$data);
foreach($rows as $row)
{
   $cols=explode("\t",$row);
 $sql="SELECT * FROM `district` WHERE s_id=10 and d_name = '{$cols[0]}'";
$result=mysqli_query($link,$sql);
if(mysqli_num_rows($result)<1)
{
echo "<h1>ERROR</h1>";
}else
{
    $ls=mysqli_fetch_assoc($result);
$bs=    mysqli_query($link,"SELECT * FROM village WHERE d_id = {$ls['d_id']} and v_name = '{$cols[1]}' ");
if(mysqli_num_rows($bs)<1)
{
    mysqli_query($link,"INSERT INTO village (d_id,v_name) VALUES ('{$ls['d_id']}','{$cols[1]}') ");
}


}

}


?>
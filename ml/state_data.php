<?php

include_once('../dbs.phhp');
$sql="SELECT AVG(temp) as avg_temp FROM `avg_tmp`  JOIN `regions` on reg_id=`regions`.id JOIN `state` on state_id=s_id WHERE s_name='kerala' AND month LIKE '{$month}'";
mysqli_query($link,$sql);


$sql="SELECT AVG(rainfall) as avg_rain FROM `precipitation`  JOIN `regions` on reg_id=`regions`.id JOIN `state` on state_id=s_id WHERE s_name='kerala' AND month LIKE '1'";
mysqli_query($link,$sql);


$sql="SELECT avg(model_price) FROM `market_data` JOIN  `district` on d_name=district JOIN `state` on state.s_id=district.s_id WHERE s_name like 'kerala' AND item='Amla(Nelli Kai)' AND variety LIKE 'other' AND date BETWEEN 0 AND 121212121212";
mysqli_query($link,$sql);
?>
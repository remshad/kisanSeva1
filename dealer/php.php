<?php


$timestamp    = strtotime('2012-1-21');
echo $first_second = strtotime(date('01-m-Y 00:00:00', $timestamp));
echo $last_second  = strtotime(date('t-m-Y 12:59:59', $timestamp)); 

// select * from planting where p_harvesting time in betwwen $first_second and $last_second 
?>
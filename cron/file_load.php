<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
include_once "simple_html_dom.php";
include_once "dbs.php";
$files = glob("./data/*");
foreach ($files as $file) {
//    echo date('d/m/Y',);
    //   echo "<br/>";
    $time = filemtime($file);
    $file = mysqli_real_escape_string($link, $file);
    $part[] = "('{$file}','{$time}','0')";
}

if (count($part) > 0) {
    $all = implode(",", $part);
    $sql = "INSERT IGNORE INTO `to_del`(`path`, `created_date`, `stat`) VALUES {$all}";
    mysqli_query($link, $sql);
}

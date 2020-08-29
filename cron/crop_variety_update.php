<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);

include_once('dbs.php');

$sql = "SELECT * FROM `market_data` WHERE stat=0 LIMIT 500";
$resul = mysqli_query($link, $sql);
while ($row = mysqli_fetch_assoc($resul)) {
    $row['item'] = mysqli_real_escape_string($link, $row['item']);
    $sql = "SELECT * FROM `crop` WHERE c_name LIKE '{$row['item']}'";
    $rs = mysqli_query($link, $sql);

    $v_id = 0;

    while ($row1 = mysqli_fetch_assoc($rs)) {
        $row['variety'] = mysqli_real_escape_string($link, $row['variety']);
        $sql = "SELECT * FROM `variety` WHERE v_name LIKE '{$row['variety']}' AND c_id LIKE '{$row1['c_id']}'";
        $byu = mysqli_query($link, $sql);
        $sc = mysqli_fetch_assoc($byu);

        $v_id = $sc['v_id'];

    }

    $sql = "UPDATE `market_data` SET cv_id='{$v_id}',stat=1 WHERE id={$row['id']}";
    mysqli_query($link, $sql);


    echo '<script type="text/javascript">
    setTimeout(function () { location.reload(true); }, 1000);
  </script>';
}

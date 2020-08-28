<?php


error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);


include_once "simple_html_dom.php";
include_once "dbs.php";

//if (isset($_POST['submit'])) {

$sql = "SELECT * FROM `to_del` WHERE stat=0 ORDER BY created_date ASC LIMIT 1";
$result = mysqli_query($link, $sql);
while ($row = mysqli_fetch_assoc($result)) {

//    $data = file_get_contents($_FILES['fileToUpload']['tmp_name']);
    $data = file_get_contents($row['path']);

    $regex = '#<\s*?tr\b[^>]*>(.*?)</tr\b[^>]*>#s';
    preg_match_all($regex, $data, $match);
//print_r($match);

    $load = time();
    foreach ($match[1] as $key => $da) {

        if ($key > 0) {
            $td = str_get_html($da)->find('td');
            $district = mysqli_real_escape_string($link, trim($td[1]->plaintext));
            $market = mysqli_real_escape_string($link, trim($td[2]->plaintext));
            $item = mysqli_real_escape_string($link, trim($td[3]->plaintext));
            $variety = mysqli_real_escape_string($link, trim($td[4]->plaintext));
            $min = mysqli_real_escape_string($link, $td[6]->plaintext);
            $max = mysqli_real_escape_string($link, $td[7]->plaintext);
            $model = mysqli_real_escape_string($link, $td[8]->plaintext);
            $time = strtotime($td[9]->plaintext);
            $part[] = "( '{$district}', '{$market}', '{$variety}', '{$item}', '{$min}','{$max}', '{$model}', '{$time}', '0','{$load}') ";
        }
    }

    if (count($part) > 0) {
        $next = array_chunk($part, 1000);
        foreach ($next as $all) {
            $last = implode(",", $all);
            $sql = "INSERT INTO `market_data`( `district`, `market`, `variety`, `item`, `min_price`, `max_price`, `model_price`, `date`, `stat`,`load_time`) VALUES {$last}";
            mysqli_query($link, $sql);
        }

    }

    $sql = "UPDATE `to_del` SET stat=1 WHERE id LIKE '{$row['id']}'";
    mysqli_query($link, $sql);

    $num=count($part);
    echo "{$num} data loaded";

    echo '<script type="text/javascript">
    setTimeout(function () { location.reload(true); }, 1000);
  </script>';

}

?>


<!DOCTYPE html>
<html>
<body>

<form action="commodity_upload.php" method="post" enctype="multipart/form-data">
  Select excel to upload:
  <input type="file" name="fileToUpload" id="fileToUpload">
  <input type="submit" value="Upload Excel" name="submit">
</form>

</body>
</html>

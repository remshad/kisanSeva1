<?php
include_once "simple_html_dom.php";
include_once "dbs.php";

$sql = "SELECT * FROM `regions`  WHERE stat=0 LIMIT 1";
$result = mysqli_query($link, $sql);
while ($row = mysqli_fetch_assoc($result)) {
   echo $url = "https://en.climate-data.org/{$row['url']}";
    $data = file_get_contents($url);

   echo $html = str_get_html($data);

    $tr = $html->find('[id=weather_table]', 0)->find('tbody', 0)->find('tr');
    //   echo $item->innertext;

//        $tr = str_get_html($item)->find('td');

    $time = time();

    foreach ($tr[0]->find('td') as $key => $td) {
        echo $key;
        if ($key > 0) {
            $part[] = "('{$row['id']}','{$td->plaintext}' , '{$key}', '{$time}') ";
        }

//print_r($part);

    }

    if (count($part) > 0) {
        $all = implode(",", $part);
        unset($part);
        $sql = "INSERT INTO `avg_tmp`( `reg_id`, `temp`, `month`, `time`) VALUES {$all}";
        mysqli_query($link, $sql);
    }

    foreach ($tr[1]->find('td') as $key => $td) {
        if ($key > 0) {
            $part[] = "('{$row['id']}','{$td->plaintext}' , '{$key}', '{$time}') ";}
    }
    if (count($part) > 0) {
        $all = implode(",", $part);
        unset($part);
        echo $sql = "INSERT INTO `min_tmp`( `reg_id`, `temp`, `month`, `time`) VALUES {$all}";
        mysqli_query($link, $sql);
    }

    foreach ($tr[2]->find('td') as $key => $td) {
        if ($key > 0) {
            $part[] = "('{$row['id']}','{$td->plaintext}' , '{$key}', '{$time}') ";}
    }

    if (count($part) > 0) {
        $all = implode(",", $part);
        unset($part);
        $sql = "INSERT INTO `max_tmp`( `reg_id`, `temp`, `month`, `time`) VALUES {$all}";
        mysqli_query($link, $sql);
    }

    foreach ($tr[6]->find('td') as $key => $td) {if ($key > 0) {
        $part[] = "('{$row['id']}','{$td->plaintext}' , '{$key}', '{$time}') ";}
    }

    if (count($part) > 0) {
        $all = implode(",", $part);
        unset($part);
        $sql = "INSERT INTO `precipitation`( `reg_id`, `rainfall`, `month`, `time`) VALUES {$all}";
        mysqli_query($link, $sql);
    }

    mysqli_query($link, "UPDATE regions SET stat=1 WHERE id LIKE '{$row['id']}'");
    echo '<script type="text/javascript">
    setTimeout(function () { location.reload(true); }, 1000);
  </script>';
}

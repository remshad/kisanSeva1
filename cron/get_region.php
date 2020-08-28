<?php
include_once "simple_html_dom.php";
include_once "dbs.php";

$sql = "SELECT * FROM `states` WHERE stat=0 LIMIT 1";
$result = mysqli_query($link, $sql);
while ($row = mysqli_fetch_assoc($result)) {
    $url = "https://en.climate-data.org/{$row['url']}";
    $data = file_get_contents($url);

    $html = str_get_html($data);

    foreach ($html->find('tbody', 0)->find('tr') as $item) {
     //   echo $item->innertext;

        $tr = str_get_html($item)->find('td');
        
        $clasification = $tr[0]->plaintext;
        $type = $tr[2]->plaintext;
        $time = time();
        foreach ($tr[3]->find('a') as $a) {

            $part[] = "('{$a->plaintext}', '{$row['id']}','{$clasification}','{$type}','{$a->href}','{$time}', '0') ";
        }

    }
    $all = implode(",", $part);
     $sql = "INSERT INTO `regions`( `name`, `state_id`,  `classification`, `type`, `url`,`f_time`, `stat`) VALUES {$all}";
    mysqli_query($link, $sql);

    mysqli_query($link,"UPDATE states SET stat=1 WHERE id LIKE '{$row['id']}'");
    echo '<script type="text/javascript">
    setTimeout(function () { location.reload(true); }, 1000);
  </script>';
}

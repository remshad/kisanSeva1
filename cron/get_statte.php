<?php
include_once("simple_html_dom.php");
include_once("dbs.php");


$url="https://en.climate-data.org/asia/india-129/";
 $data=file_get_contents($url);

$html=str_get_html($data);

foreach($html->find('[class=widget widget-info]',1)->find('a') as $item){
$part[]="('$item->plaintext','$item->href')" ;
}
$all=implode(",",$part);
echo $sql="INSERT INTO `states`(`name`, `url`) VALUES {$all}";
mysqli_query($link,$sql);

?>
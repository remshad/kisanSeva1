<?php

error_reporting(E_ALL);
ini_set('display_errors', true);
ini_set('display_startup_errors', true);
?>

<html>
<head>

</head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>


<style>
.main{
    margin: auto;
    padding: 50;
    text-align: center;
    width: 30%;

}</style>
<?php

include_once '../dbs.php';
include_once 'train.php';

//print_r($_POST);

$flag = 0;

if (is_file('process.txt')) {

    $_POST = json_decode(file_get_contents('process.txt'), true);
    print_r($_POST);
    $st_id = $_POST['st_id'];
    $var_id = $_POST['var_id'];
    $flag = 1;

    if ($_POST['now'] > 12) {
        $flag = 0;
        unlink('process.txt');
        $data = json_decode(file_get_contents('sample_model.txt'), true);
        foreach ($data as $mydata) {

            $parts = array_chunk($mydata, count($mydata) - 1);
            $feature[] = $parts[0];
            $target[] = $parts[1][0];

        }

        echo json_encode($feature);
        echo json_encode($target);
        unlink('sample_model.txt');

        $path = get_model($feature, $target);
        $time = time();
        $sql = "INSERT INTO `ml_data`(`s_id`,`cv_id`, `model_path`, `time`, `stat`) VALUES ('{$_POST['st_id']}','{$_POST['var_id']}','{$path}','{$time}','0')";
        mysqli_query($link, $sql);

        echo "<h1>Model created successfully..<br/></h1>";

    }

} else if (isset($_POST['submit'])) {

    $st_id = $_POST['st_id'];
    $var_id = $_POST['var_id'];

    $sql = "SELECT * FROM `ml_data` WHERE `s_id` LIKE '{$st_id}' AND `cv_id` LIKE '{$var_id}'";
    if (mysqli_num_rows(mysqli_query($link, $sql))) {
        die("<h2>Already model created for this crop and this state</h2>");
    }

    $_POST['now'] = 1;
    print_r($_POST);

    file_put_contents('process.txt', json_encode($_POST));
    $flag = 2;

}

$times = array();
for ($month = 1; $month <= 12; $month++) {
    $first_minute = mktime(0, 0, 0, $month, 1) - (365 * 24 * 60 * 60);
    $last_minute = mktime(23, 59, 59, $month, date('t', $first_minute)) - (365 * 24 * 60 * 60);
    $mid_minute = mktime(0, 0, 0, $month, 15) - (365 * 24 * 60 * 60);
    $times[$month] = array($first_minute, $mid_minute, $last_minute);
}

if ($flag > 0) {

    $time = $times[$_POST['now']];
    $month = $_POST['now'];

    {
        $sql = "SELECT AVG(temp) as avg_temp FROM `avg_tmp`  JOIN `regions` on reg_id=`regions`.id WHERE state_id LIKE '{$st_id}'  AND month LIKE '{$month}'";
        $avg_temp = mysqli_fetch_assoc(mysqli_query($link, $sql))['avg_temp'];
        echo "<br/>";

        $sql = "SELECT AVG(rainfall) as avg_rain FROM `precipitation`  JOIN `regions` on reg_id=`regions`.id WHERE state_id LIKE '{$st_id}'  AND month LIKE '{$month}'";
        $avg_rain = mysqli_fetch_assoc(mysqli_query($link, $sql))['avg_rain'];
        echo "<br/>";

        $sql = "SELECT avg(model_price) as  model_price FROM `market_data` JOIN  `district` on d_name=district  WHERE s_id like '{$st_id}' AND cv_id LIKE '{$var_id}' AND date BETWEEN '{$time[0]}' AND '{$time[2]}'";
        $model_price1 = mysqli_fetch_assoc(mysqli_query($link, $sql))['model_price'];
        echo "<br/>";

        // $sql = "SELECT avg(model_price) as  model_price FROM `market_data` JOIN  `district` on d_name=district   WHERE s_id like '{$st_id}' AND cv_id LIKE '{$var_id}' AND date BETWEEN  '{$time[1]}' AND '{$time[2]}'";
        // $model_price2 = mysqli_fetch_assoc(mysqli_query($link, $sql))['model_price'];

        for ($i = 1; $i < 13; $i++) {

            if ($i == $_POST['now']) {
               // $part[] = 1;
            } else {
              //  $part[] = 0;
            }
        }

        if ($model_price1 > 0) {

        } else {
            unlink('process.txt');
            die("model price is zero");
        }
        $part[]=$_POST['now'];
        $part[] = $avg_temp > 0 ? $avg_temp : 23;
        $part[] = $avg_rain > 0 ? $avg_rain : 0;

        // $first = $part;
        // $first[] = 0;
        $part[] = $model_price1 > 0 ? $model_price1 : 0;

    //    $second = $part;
    //    $second[] = 1;
 //       $part[] = $model_price2 > 0 ? $model_price2 : $model_price1;

        if (is_file('sample_model.txt')) {
            $json = json_decode(file_get_contents('sample_model.txt'), true);
            // $json[] = $first;
            // $json[] = $second;
           $json[]=$part;

            file_put_contents('sample_model.txt', json_encode($json));
        } else {
            // $json[] = $first;
            // $json[] = $second;
             $json[]=$part;
            file_put_contents('sample_model.txt', json_encode($json));
        }

    }

    $_POST['now']++;
    file_put_contents('process.txt', json_encode($_POST));

}

if ($flag > 0) {
    echo '<script type="text/javascript">
    setTimeout(function () { location.reload(true); }, 1000);
  </script>';

    die("Its need to process data");
}

?>

 <div class="main">
<form method="post" action="state_data.php">

<table>
<tr>
<td>Select State</td><td> <select name='st_id' required='true'>
<?php
$sql = "SELECT * FROM `state`";
$result = mysqli_query($link, $sql);
echo "<option value=''>Select</option>";
while ($row = mysqli_fetch_assoc($result)) {
    echo "<option value='{$row['s_id']}'>{$row['s_name']}</option>";
}

?>
</select>  </td>
</tr>


<tr>
<td>Select Category</td><td> <select name='cat_id' required='true' id='catarea'>
<?php
$sql = "SELECT * FROM `crop_category`";
$result = mysqli_query($link, $sql);
echo "<option value=''>Select</option>";
while ($row = mysqli_fetch_assoc($result)) {
    echo "<option value='{$row['cc_id']}'>{$row['cc_name']}</option>";
}

?>
</select>  </td>
</tr>

<tr>
<td>Select Crop</td><td> <select name='crop_id' required='true' id='croparea'>

</select>  </td>
</tr>

<tr>
<td>Select Variety</td><td> <select name='var_id' required='true' id='variety'>

</select>  </td>
</tr>

<tr><td colspan=2><input type='submit' name='submit'></td></td>

</table>
</form>
</div>


<script>
  $( document ).ready(function() {

    $("#catarea").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea").html(result);
        }
      });
    });


    $("#croparea").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety").html(result);
        }
      });
    });



  });


  </script>
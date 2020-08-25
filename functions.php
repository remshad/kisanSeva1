<?php

$inclusion[]="bank";
$inclusion[]="bank_transaction";
$inclusion[]="cash_transaction";
$inclusion[]="customer";
$inclusion[]="donation";
$inclusion[]="expense";
$inclusion[]="expense_transaction";
$inclusion[]="loan_deposit";
$inclusion[]="loan_withdrawal";



function date_obj($date, $month)
{

    $d = date('j', $date);
    $m = date('n', $date);
    $y = date('Y', $date);
    $m = $m + $month;
    $add_y = $m / 12;
    $add_y = (int) $add_y;
    $add_m = (int) $m % 12;

    $y += $add_y;
    return strtotime("{$y}-{$add_m}-{$d}");
}



function insert($table, $value)
{
    $file = 'error_insert.txt';
    global $link;
    foreach ($value as $key => $val) {
        $val = mysqli_real_escape_string($link, $val);
        $keys[] = "`{$key}`";
        $vals[] = "'{$val}'";
        $select[] = "`{$key}`='{$val}'";
    }

    $attribute = implode(",", $keys);
    $values = implode(",", $vals);
    $clause = implode(" AND ", $select);

    $sql1 = "SELECT * FROM {$table} WHERE {$clause}";
    $result = mysqli_query($link, $sql1);
    if (mysqli_error($link)) {
        file_put_contents($file, "\n" . mysqli_error($link), FILE_APPEND);
        return mysqli_error($link);
    }

    if (mysqli_num_rows($result) > 0) {
        $row = mysqli_fetch_array($result);
        return $row[0];
    } else {

        $sql = "INSERT INTO {$table} ({$attribute}) values ({$values})";
        mysqli_query($link, $sql);
        if (mysqli_error($link)) {
            file_put_contents($file, "\n" . mysqli_error($link), FILE_APPEND);
            return mysqli_error($link);
        }
        return mysqli_insert_id($link);
    }
}



function update($table, $set, $where)
{

    global $link,$inclusion;
    $file = "error_update.txt";


    foreach ($where as $key => $val) {
        $val = mysqli_real_escape_string($link, $val);
        $keys[] = "`{$key}`";
        $vals[] = "'{$val}'";
        $swhere_c[] = "`{$key}` LIKE '{$val}'";
    }

    $swhere_all = implode(" AND ", $swhere_c);

    $sq = "SELECT * FROM {$table} WHERE {$swhere_all}";
    $res = mysqli_query($link, $sq);

    $update = array();
    while ($row = mysqli_fetch_assoc($res)) {
        $update[] = $row;
    }

    foreach ($set as $key => $val) {
        $val = mysqli_real_escape_string($link, $val);
        $keys[] = "`{$key}`";
        $vals[] = "'{$val}'";
        $sets_c[] = "`{$key}`='{$val}'";

        foreach ($update as $row) {
            if (mysqli_real_escape_string($link,$row[$key]) != $val) {
                $dats['up_records'][] = "the record {##{$key}##} has been changed from {##{$row[$key]}##} to {##{$val}##}";
            }
        }
    }

    if (isset($dats) && count($dats) > 0 && in_array($table,$inclusion)) {
        $dat['up_table'] = $table;
        $dat['time'] = time();
        $dat['up_who_did'] = $_SESSION['uid'];
        $dat['up_where'] = $swhere_all;
        $dat['up_record'] = implode("\n", $dats['up_records']);
        insert("log_update", $dat);
    }



    $sets_all = implode(",", $sets_c);


    $sql1 = "UPDATE {$table} SET {$sets_all} WHERE {$swhere_all}";
    $result = mysqli_query($link, $sql1);
    if (mysqli_error($link)) {
        file_put_contents($file, "\n" . mysqli_error($link), FILE_APPEND);
        return mysqli_error($link);
    }

    return $result;
}



function delete($table, $where)
{

    global $link,$inclusion;
    $file = "error_delete.txt";
    foreach ($where as $key => $val) {
        $val = mysqli_real_escape_string($link, $val);
        $keys[] = "`{$key}`";
        $vals[] = "'{$val}'";
        $swhere_c[] = "`{$key}` LIKE '{$val}'";
    }




    $swhere_all = implode(" AND ", $swhere_c);

    $sq="SELECT * FROM  {$table} WHERE {$swhere_all}";
    $res=mysqli_query($link,$sq);
    $pack = mysqli_fetch_all($res, MYSQLI_ASSOC);
    $jsonData = json_encode(array('slider'=>$pack, 'status' => 'success'));



if(count($pack)>0 && in_array($table,$inclusion))
{
$data['de_data']=$jsonData;
$data['de_table']=$table;
$data['de_where']=$swhere_all;
$data['de_time']=time();
$data['de_who_did']=$_SESSION['uid'];
    insert('log_delete',$data);
}
    $sql1 = "DELETE FROM  {$table} WHERE {$swhere_all}";
    $result = mysqli_query($link, $sql1);
    if (mysqli_error($link)) {
        file_put_contents($file, "\n" . mysqli_error($link), FILE_APPEND);
        return mysqli_error($link);
    }

    return $result;
}

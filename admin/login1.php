<?php
include_once('../dbs.php');
if (isset($_SESSION['user']) && isset($_SESSION['pass'])) {
    $sql = "select * from `user` where `u_name`='{$_SESSION['user']}' and u_pass='{$_SESSION['pass']}' and u_status=1 ";
    $kku = mysqli_query($link, $sql);
    if (mysqli_error($link)) {
        die(mysqli_error($link));
    } else {
        if (mysqli_num_rows($kku) > 0) {
        } else {
            $error = "invalid login....";
            header("Location: login.php?error={$error}");
            exit();
        }
    }
} else {
    $error = "not logged in....";
    header("Location: login.php?error={$error}");
    exit();
}
?>
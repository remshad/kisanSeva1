<?php 
    require_once('../dbs.php');
   unset($_SESSION['user']);
   unset($_SESSION['pass']);
   unset($_SESSION['power']);
   unset($_SESSION['uid']);

   //unset($_COOKIE['share_power']);   
    header("Location:index.php"); 
    exit();
?>
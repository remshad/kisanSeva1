<?php
    include_once('../dbs.php');
  
?>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
   <meta charset="utf-8">

 
  <link rel="stylesheet" href="./css/bootstrap.min.css">
  <link href='./css/cairo.css' rel='stylesheet'>
  <script src="./js/jquery.min.js"></script>
  <script src="./js/bootstrap.min.js"></script>



<link rel="stylesheet" href="./css/bootstrap-select.css" />
<script src="./js/bootstrap-select.js"></script>





  <link href="./css/style.css?key=<?php echo time(); ?>" rel="stylesheet" type="text/css" />


  <?php
    if(isset($head)) echo $head;
?>         
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
    <ul><li <?php if(strstr($_SERVER['PHP_SELF'],'index.php')) echo 'class="navbar-brand  active"'; else  echo 'class="navbar-brand"';    ?> style="list-style-type:none; text-decoration:none  " ><a  style="list-style-type:none; text-decoration:none "  href="index.php">Admin Control</a> </li><ul>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
    
    <ul class="nav navbar-nav">


    <?php 


{
$menu['crop']['category']="crop_category.php";
$menu['crop']['crop']="crop.php";
$menu['crop']['variety']="variety.php"; 

$menu['action']['Backup']="backup.php";
$menu['action']['Logout']="logout.php";

} 


  


foreach($menu as $KEY=>$VALE)
{
  if(count($VALE)>1)
  {
    
    $flag="";

    foreach($VALE as $new_key=>$val)
    {

     
      if(strstr($_SERVER['PHP_SELF'],$val)){
     //   echo $_SERVER['PHP_SELF'];
$flag="style='color:white;'";
        $dat[]= "<li class='active'><a href='{$val}'>{$new_key}</a>";
        
        } else {
        $dat[]=  "<li><a href='{$val}'>{$new_key}</a>";
        
        }
    }

    echo "<li class='dropdown'>
    <a class='dropdown-toggle'  {$flag} data-toggle='dropdown' href='#'>{$KEY}
    <span class='caret'></span></a>
    <ul class='dropdown-menu'>";

echo implode($dat);
unset($dat);
    echo "</ul>
    </li>";


  }else
  {
    $VALE=  array_values($VALE);
if(strstr($_SERVER['PHP_SELF'],$VALE[0])){
echo "<li class='active'><a href='{$VALE[0]}'>{$KEY}</a>";

} else {
  echo "<li><a href='{$VALE[0]}'>{$KEY}</a>";

}}

}
?>
       </ul>
    </div>
  </div>
</nav>
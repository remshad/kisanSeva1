<!DOCTYPE html>

<?php  error_reporting(E_ERROR | E_PARSE);
//comme
?>
<html lang="en">
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="">
  <title>Farmer landing</title>
  <link href="../css/bootstrap.min.css" rel="stylesheet">
  <link href="../css/font-awesome.min.css" rel="stylesheet">
  <link href="../css/animate.min.css" rel="stylesheet">
  <link href="../css/lightbox.css" rel="stylesheet">
  <link href="../css/main.css" rel="stylesheet">
  <link href="../css/responsive.css" rel="stylesheet">

  <!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <![endif]-->
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="https://cdn.ckeditor.com/4.14.1/standard/ckeditor.js"></script>

  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-1.9.1.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
  <script>
  $( document ).ready(function() {
    $("#statearea").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loaddistricts.php?s_id="+selected,
        success: function(result) {
          $("#districtarea").html(result);
        }
      });
    });

    $("#districtarea").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvillages.php?d_id="+selected,
        success: function(result) {
          $("#villagearea").html(result);

        }
      });
    });
    $("#statearea1").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loaddistricts.php?s_id="+selected,
        success: function(result) {
          $("#districtarea1").html(result);
        }
      });
    });

    $("#districtarea1").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvillages.php?d_id="+selected,
        success: function(result) {
          $("#villagearea1").html(result);

        }
      });
    });
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
          $("#variety1").html(result);
        }
      });
    });

    $("#catarea1").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea1").html(result);
        }
      });
    });
    $("#croparea1").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety4").html(result);
        }
      });
    });


    $("#catarea2").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea2").html(result);
        }
      });
    });
    $("#croparea2").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety2").html(result);
        }
      });
    });


    $("#catarea3").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea3").html(result);
        }
      });
    });
    $("#croparea3").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety_ci").html(result);
        }
      });
    });


    $("#catarea4").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea4").html(result);
        }
      });
    });
    $("#croparea4").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety_cf").html(result);
        }
      });
    });


    $("#catarea5").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea5").html(result);
        }
      });
    });
    $("#croparea5").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety_cd").html(result);
        }
      });
    });


    $("#catarea7").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadcrops.php?c_id="+selected,
        success: function(result) {
          $("#croparea7").html(result);
        }
      });
    });
    $("#croparea7").change(function() {
      selected=$(this).val();
      $.ajax({
        type: "GET",
        url: "../loadvariety.php?c_id="+selected,
        success: function(result) {
          $("#variety_ct").html(result);
        }
      });
    });


  });
</script>


<link rel="icon" type="image/png" href="../images/icons/favicon.ico"/>
</head><!--/head-->

<body>
  <?php
  require_once('../dbs.php');
  require_once('../functions.php');   ?>


  <?php if( isset($_SESSION['user']) && !empty($_SESSION['user']) )
  {}else{
    header("Location: index.php");
  } ?>




  <header id="header">

    <div class="navbar navbar-inverse" role="banner">
      <div class="container" style="
      margin-top: -26px;
      ">
      <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>

        <a class="navbar-brand" href="index.html">
          <h1><img src="../images/logo.png" alt="logo" style="
          width: 10%;
          "></h1><h1><img src="../images/logo1.png" alt="logo" style="
          width: 20%;
          margin-left: 8%;
          margin-top: -13%;
          "></h1>
        </a>

      </div>
      <div class="collapse navbar-collapse">
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown active"><a href="../index.php">Home </a>

          </li>

          <li><a href="../logout.php ">Log Out</a></li>
        </ul>
      </div>

    </div>
  </div>
</header>

<div id="tab-container">
  <div class="row">
    <div class="col-md-12">
      <h2 class="page-header" style="
      margin-left: 9%;
      /* margin-right: -11%; */
      ">Farmer Page</h2>
    </div>
    <div class="col-md-9" style="
    width: 65%;
    margin-left: 10%;
    ">
    <ul id="tab2" class="nav nav-pills">
      <li  class="active"><a href="#tab2-item1" data-toggle="tab">Crop Forecasting</a></li>

      <li><a href="#tab2-item2" data-toggle="tab">Add Harvesting</a></li>
      <li><a href="#tab2-item3" data-toggle="tab">Add Planting</a></li>
      <li><a href="#tab2-item4" data-toggle="tab">Process Harvesting</a></li>
      <li><a href="#tab2-item6" data-toggle="tab">Seek Demand</a></li>
      <li><a href="#tab2-item5" data-toggle="tab">Message from Dealer</a></li>
      <li><a href="#tab2-item7" data-toggle="tab">Crop instructions</a></li>
      <li><a href="#tab2-item8" data-toggle="tab">Crop  fertizilers</a></li>
      <li><a href="#tab2-item9" data-toggle="tab">crop disease and solutions</a></li>
      <li><a href="#tab2-item10" data-toggle="tab">Additional Tips</a></li>
    </ul>
    <div class="tab-content">
      <div class="tab-pane fade" id="tab2-item3">
        <form action="index.php" method="post">
          <?php
          if(isset($_POST['sub'])) {
            date_default_timezone_set('Asia/Kolkata');
            $c_id = $_POST['crop'];
            $planting_date = time();
            $harv_date = strtotime($_POST['date']);
            $qty = $_POST['qty'];
            $qtype = $_POST['qtype'];
            $v_id = $_POST['village'];
            $loc = $_POST['locality'];
            $fid = $_SESSION['uid'];
            addPlanting($c_id,$planting_date,$harv_date,$qty,$qtype,$v_id,$loc,$fid);

          } ?>
          <div class="form-group">
            <select class="browser-default custom-select" id="catarea">
              <option value="" disabled selected>Category</option>
              <?php
              $sql = "SELECT * FROM crop_category";
              $result = mysqli_query($link, $sql);
              if (mysqli_num_rows($result) > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                  echo "<option value='".$row["cc_id"]. "'>".$row["cc_name"]. "</option>";
                }
              }
              ?>
            </select>
          </div>

          <div class="form-group">
            <select class="browser-default custom-select" id="croparea" name="crop">
              <option value="" disabled selected>Crop Name</option>

            </select>

          </div>
		  <div class="form-group">
            <select class="browser-default custom-select" id="variety1" name="crop">
              <option value="" disabled selected>Crop Variety</option>

            </select>

          </div>

          <p>Expected harvest Date </p>
          <div class="form-group">
            <input type="date" name="date" class="form-control" required="required" placeholder="Date">
          </div>
          <div class="form-group">
            <select class="browser-default custom-select" name="qtype">
              <option value="" disabled selected>Quantity Type</option>
              <?php
              $sql = "SELECT * FROM unit_type";
              $result = mysqli_query($link, $sql);
              if (mysqli_num_rows($result) > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                  echo "<option value='".$row["ut_id"]. "'>".$row["ut_name"]. "</option>";
                }
              }
              ?>

            </select>
          </div>

          <div class="form-group">
            <input type="number" name="qty" class="form-control" required="required" placeholder="Enter Quantity">
          </div>

          <div class="form-group">
            <select class="browser-default custom-select" id="statearea">
              <option value="" disabled selected>State</option>
              <?php
              $sql = "SELECT * FROM state";
              $result = mysqli_query($link, $sql);
              if (mysqli_num_rows($result) > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                  echo "<option value='".$row["s_id"]. "'>".$row["s_name"]. "</option>";
                }
              }
              ?>

            </select>
          </div>
          <div class="form-group">
            <select class="browser-default custom-select"  id="districtarea">
              <option value="" disabled selected>District</option>


            </select>
          </div>
          <div class="form-group">
            <select name="village" class="browser-default custom-select" id="villagearea">
              <option value="" disabled selected>Village</option>


            </select>
          </div>
          <div class="form-group">
            <input type="text" name="locality" class="form-control" required="required" placeholder="Enter Locality">
          </div>
          <div class="form-group">
            <input type="submit" class="login100-form-btn" name="sub" value="Add Planting">
          </div>
        </form>
        <p>My Plantings </p>
        <table class="table table-striped">
          <caption><h2>Item Search Result</h2></caption>
          <tr><td>No</td><td>Crop Name</td><td>Date of Planting</td><td>Expected Harvest</td><td>Quantity</td></tr>
          <?php
          date_default_timezone_set('Asia/Kolkata');
          $f_id=$_SESSION['uid'];
          $sql = "SELECT * FROM planting p,crop c,unit_type ut WHERE p.c_id=c.c_id AND ut.ut_id=p.p_quantity_type AND f_id={$f_id} ORDER BY p_id DESC";
          $result = mysqli_query($link, $sql);
          $i = 0;
          while ($row = mysqli_fetch_assoc($result)) {
            $i++;
            $row['p_planting_date'] = date('d/m/Y', $row['p_planting_date']);
            $row['p_harvesting_date'] = date('d/m/Y', $row['p_harvesting_date']);
            echo "<tr><td>{$i}</td><td>{$row['c_name']}</td><td>{$row['p_planting_date']}</td><td>{$row['p_harvesting_date']}</td><td>{$row['p_quantity']}&nbsp;{$row['ut_name']}</td></tr>";
          }
          ?>


        </table>

      </div>
      <div class="tab-pane fade" id="tab2-item2">
        <form method="post" action="index.php">
          <?php
          if(isset($_POST['submit'])) {
            date_default_timezone_set('Asia/Kolkata');
            $p_id = $_POST['plant'];
            $h_date = strtotime($_POST['date']);
            $h_qty = $_POST['quantity'];
            $u_price = $_POST['price'];
            $willing =  $_POST['will'];
            $h_stats = '0';
            addHarvesting($p_id,$h_date,$h_qty,$u_price,$willing,$h_stats);

          }

          ?>
          <div class="form-group">
            <select class="browser-default custom-select" name="plant" id="plantid">
              <option value="" disabled selected>Plant ID</option>
              <?php
              $sql = "SELECT * FROM planting WHERE p_status='0'";
              $result = mysqli_query($link, $sql);
              if (mysqli_num_rows($result) > 0) {
                while($row = mysqli_fetch_assoc($result)) {
                  $dat = date('d/m/Y',$row['p_planting_date']);
                  echo "<option value='".$row["p_id"]. "'>".$row['p_id']."_(Planted On:".$dat.")</option>";
                }
              }
              ?>
            </select>
            <div class="form-group">
              <input type="date" name="date" class="form-control" required="required" placeholder="Date1">
            </div>
            <div class="form-group">
              <input type="number" name="quantity" class="form-control" required="required" placeholder="Enter Quantity">
            </div>
            <div class="form-group">
              <input type="number" name="price" class="form-control" required="required" placeholder="Enter Expected Price">
            </div>
            <div class="form-check">
              <label class="form-check-label">Willing to Transport Crop into Market?</label>
              <input type="radio" value="1" name="will" class="form-check-input" id="exampleCheck1">
              <label class="form-check-label" for="exampleCheck1">Yes</label>
              <input type="radio" value="0" name="will" class="form-check-input" id="exampleCheck2">
              <label class="form-check-label" for="exampleCheck2">No</label>
            </div>
            <div class="form-group">
              <input type="submit" class="login100-form-btn" name="submit" value="Add Harvesting">
            </div>
          </form>
          <p> My Harvestings</p>
          <table class="table table-striped">
            <caption><h2>Item Search Result</h2></caption>
            <tr><td>No</td><td>Crop Name</td><td>Date of Harvesting</td><td>Quantity</td></tr>
            <?php
            date_default_timezone_set('Asia/Kolkata');
            $f_id=$_SESSION['uid'];
            $sql = "SELECT c_name,h_date,h_quantity FROM harvesting h,planting p,crop c WHERE h.p_id=p.p_id AND p.c_id=c.c_id AND h.h_status=0";
            $result = mysqli_query($link, $sql);
            $i = 0;
            while ($row = mysqli_fetch_assoc($result)) {
              $i++;
              $row['h_date'] = date('d/m/Y', $row['h_date']);

              echo "<tr><td>{$i}</td><td>{$row['c_name']}</td><td>{$row['h_date']}</td><td>{$row['h_quantity']}</td></tr>";
            }
            ?>


          </table>
        </div>
      </div>
      <div class="tab-pane fade active in" id="tab2-item1">
        <form action="index.php" method="post">
          <table>
            <tr>
              <th>Crop Forecasting</th>
            </tr>
            <tr>
              <td>
                <select class="browser-default custom-select" id="catarea1">
                  <option value="" disabled selected>Category</option>
                  <?php
                  $sql = "SELECT * FROM crop_category";
                  $result = mysqli_query($link, $sql);
                  if (mysqli_num_rows($result) > 0) {
                    while($row = mysqli_fetch_assoc($result)) {
                      echo "<option value='".$row["cc_id"]. "'>".$row["cc_name"]. "</option>";
                    }
                  }
                  ?>
                </select>
              </div>

              <div class="form-group">
                <select class="browser-default custom-select" id="croparea1" name="cropf">
                  <option value="" disabled selected>Crop Name</option>

                </select>
				<select class="browser-default custom-select" id="variety4" name="cropf">
                  <option value="" disabled selected>Crop variety</option>

                </select>
                <input type="submit" class="login100-form-btn" name="subf" value="Show Forecasting Chart">
                <br>
              </td>
            </tr>
            <tr>
              <td width=600>
                <canvas  id="chartjs_bar"></canvas>
                <?php
                date_default_timezone_set('Asia/Kolkata');
                if(isset($_POST['subf'])) {
                  $c_id=$_POST['cropf'];
                  for($i=1;$i<13;$i++)
                  {

                    if($i<10)
                    $j="0{$i}";
                    else
                    $j=$i;

                    $year=date("Y");
                    $timestamp= strtotime("{$year}-{$j}-25");
                    $first_second = strtotime(date('01-m-Y 00:00:00', $timestamp));
                    $last_second  = strtotime(date('t-m-Y 12:59:59', $timestamp));
                    $sql ="select c_id,SUM(p_quantity)'qty'  from planting where p_harvesting_date between {$first_second} and {$last_second} AND c_id={$c_id} GROUP BY c_id";
                    echo "<br>";
                    $result = mysqli_query($link,$sql);
                    $chart_data="";
                    while ($row = mysqli_fetch_array($result)) {
                      $month_name = date("F", mktime(0, 0, 0, $j, 10));
                      $productname[]  = $month_name;
                      $sales[] = $row['qty'];
                    }
                  }

                }

                ?>
              </td></tr>
            </table>
          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item4">
          <form method="post" action="index.php">
            <?php
            if(isset($_POST['subm'])) {
              $h_id=$_POST['harvest'];
              $h_qty=$_POST['quantity'];
              $hp_date = time();
              $sql = "SELECT h_quantity FROM harvesting WHERE h_id='$h_id' AND h_status='0'";
              $result=mysqli_query($link, $sql);
              $row=mysqli_fetch_assoc($result);
              $avail_qty = $row['h_quantity'];
              $new_qty = $avail_qty - $h_qty;
              if($avail_qty>$h_qty) {
                $sql = "UPDATE harvesting SET h_quantity='$new_qty' WHERE h_id='".$h_id."'";
                $result = mysqli_query($link, $sql);
                $sql = "INSERT INTO harvest_process(h_id,hp_quantity,hp_date) VALUES('".$h_id."','".$h_qty."','".$hp_date."')";
                $result = mysqli_query($link, $sql);
                if($result!=1) {
                  echo "<script>alert('Unable to Process!')</script>";
                } else {
                  echo "<script>alert('Harvesting Processed Successfully!')</script>";
                }
              } else if($avail_qty==$h_qty) {
                $sql = "UPDATE harvesting SET h_quantity='$new_qty',h_status='1' WHERE h_id='".$h_id."'";
                $result = mysqli_query($link, $sql);
                $sql = "INSERT INTO harvest_process(h_id,hp_quantity,hp_date) VALUES('".$h_id."','".$h_qty."','".$hp_date."')";
                $result = mysqli_query($link, $sql);
                if($result!=1) {
                  echo "<script>alert('Unable to Process!')</script>";
                } else {
                  echo "<script>alert('Harvesting Processed Successfully!')</script>";
                }
              } else {
                echo "<script>alert('Insufficient Quantity to Process!')</script>";
              }
            }
            ?>
            <div class="form-group">
              <select class="browser-default custom-select" name="harvest" id="harid">
                <option value="" disabled selected>Harvest ID</option>
                <?php
                $sql = "SELECT * FROM harvesting WHERE h_status='0'";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while($row = mysqli_fetch_assoc($result)) {
                    $dat = date('d/m/Y',$row['h_date']);
                    echo "<option value='".$row["h_id"]. "'>".$row['h_id']."_(Harvested On:".$dat.")</option>";
                  }
                }
                ?>
              </select>
            </div>
            <div class="form-group">
              <input type="text" name="quantity" class="form-control" required="required" placeholder="Quantity of Order Received">
            </div>
            <div class="form-group">
              <input type="submit" class="login100-form-btn" name="subm" value="Process Harvest">
            </div>
          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item4">
          <form>
            <div class="form-group">
              <input type="text" name="id" class="form-control" required="required" placeholder="Id">
            </div>
            <div class="form-group">
              <input type="text" name="quantity" class="form-control" required="required" placeholder="qty">
            </div>
            <div class="form-group">
              <button type="button" class="btn btn-success">Submit</button>
            </div>
          </form>
        </div>

        <div class="tab-pane fade" id="tab2-item6">
          <form action="index.php#tab2-item6" method="POST">
            <div class="form-group">
              <select class="browser-default custom-select" id="catarea2" required="true">
                <option value="" disabled selected>Select Category</option>
                <?php
                $sql = "SELECT * FROM crop_category";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["cc_id"] . "'>" . $row["cc_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" id="croparea2" name="crop" required="true">
                <option value="" disabled selected>Crop Name</option>

              </select>
            </div>
			<div class="form-group">
              <select class="browser-default custom-select" id="variety2" name="crop" required="true">
                <option value="" disabled selected>Crop Variety</option>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" name="statearea" id="statearea1">
                <option value="" disabled selected>Any State</option>
                <?php
                $sql = "SELECT * FROM state";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["s_id"] . "'>" . $row["s_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>
            <div class="form-group">
              <select class="browser-default custom-select" name="districtarea" id="districtarea1">
                <option value="" disabled selected>Any District</option>


              </select>
            </div>
            <div class="form-group">
              <select name="village" class="browser-default custom-select" id="villagearea1">
                <option value="" disabled selected>Any Village</option>


              </select>
            </div>
            <div class="form-group">
              <button type="submit" name="search" class="btn btn-success">Submit</button>
            </div>

            <table class="table table-striped">
              <caption><h2>Item Search Result</h2></caption>

              <tr><td>No</td><td>Crop Name</td><td>Quantity</td><td>Unit Price</td><td>Date</td><td>Contact Number</td></tr>


              <?php
              if (isset($_POST['search'])) {
                if (isset($_POST['statearea'])) {

                  $sid = intval($_POST['statearea']);
                  $part[] = " s_id='{$sid}' ";
                  $par[]="  JOIN state ";
                }

                if (isset($_POST['districtarea'])) {

                  $sid = intval($_POST['districtarea']);
                  $part[] = " d_id='{$sid}' ";
                  $par[]="  JOIN district ";

                }


                if (isset($_POST['village'])) {

                  $sid = intval($_POST['village']);
                  $part[] = " v_id='{$sid}' ";
                  $par[]="  JOIN village ";
                }

                $crs = intval($_POST['crop']);
                $part[] = " c_id='{$crs}' ";

                $dz='';
                if (isset($part) &&  count($part) > 0) {
                  $pa = implode(" AND ", $part);
                  if(isset($par))
                  {
                    $dz=implode(" ",$par);
                  }
                }
                //$vid=$_POST['village'];


                echo   $sql = "SELECT c_name,dr_quantity,dr_unit_price,dr_date,de_phone FROM dealer_request NATURAL JOIN crop  NATURAL JOIN  dealer {$dz} WHERE {$pa}";
                $result = mysqli_query($link, $sql);
                $i = 0;
                while ($row = mysqli_fetch_assoc($result)) {
                  $i++;
                  $row['dr_date'] = date('d/m/Y', $row['dr_date']);
                  echo "<tr><td>{$i}</td><td>{$row['c_name']}</td><td>{$row['dr_quantity']}</td><td>{$row['dr_unit_price']}</td><td>{$row['dr_date']}</td><td>{$row['de_phone']}</td></tr>";
                }
              }
              ?>


            </table>
          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item7">
          <form action="index.php#tab2-item7" method="POST">
            <div class="form-group">
              <select class="browser-default custom-select"  id="catarea3" required="true">
                <option value="" disabled selected>Select Category</option>
                <?php
                $sql = "SELECT * FROM crop_category";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["cc_id"] . "'>" . $row["cc_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" id="croparea3" name="crop" required="true">
                <option value="" disabled selected>Crop Name</option>

              </select>
            </div>

			<div class="form-group">
              <select class="browser-default custom-select" id="variety_ci" name="crop" required="true">
                <option value="" disabled selected>Crop Variety</option>

              </select>
            </div>


            <div class="form-group">
              <button type="submit" name="searchci" class="btn btn-success">Get</button>
            </div>

            <div name="editor1">

              <?php


              if(isset($_POST['searchci']))
              {
                $nm=$_POST['crop'];
                //echo $nm;
                $sql = "SELECT ci_instruction FROM  crop_instruction, crop where crop_instruction.c_id=$nm AND crop_instruction.c_id=crop.c_id ";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo $row['ci_instruction'];
                  }
                }



              }
              unset($_POST['searchci']);

              ?>
            </div>
            <?php


            ?>







          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item8">
          <form action="index.php#tab2-item8" method="POST">
            <div class="form-group">
              <select class="browser-default custom-select"  id="catarea4" required="true">
                <option value="" disabled selected>Select Category</option>
                <?php
                $sql = "SELECT * FROM crop_category";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["cc_id"] . "'>" . $row["cc_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" id="croparea4" name="crop" required="true">
                <option value="" disabled selected>Crop Name</option>

              </select>
            </div>

			<div class="form-group">
              <select class="browser-default custom-select" id="variety_cf" name="crop" required="true">
                <option value="" disabled selected>Crop Variety</option>

              </select>
            </div>

            <div class="form-group">
              <button type="submit" name="searchcf" class="btn btn-success">Get</button>
            </div>


            <div name="editor2">

              <?php


              if(isset($_POST['searchcf']))
              {
                $nm=$_POST['crop'];
                //echo $nm;
                $sql = "SELECT cf_text FROM  crop_fertilizers, crop where crop_fertilizers.c_id=$nm AND crop_fertilizers.c_id=crop.c_id ";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo $row['cf_text'];
                  }
                }



              }
              unset($_POST['searchcf']);

              ?>
            </div>
            <?php


            ?>


          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item9">
          <form action="index.php#tab2-item9" method="POST">
            <div class="form-group">
              <select class="browser-default custom-select"  id="catarea5" required="true">
                <option value="" disabled selected>Select Category</option>
                <?php
                $sql = "SELECT * FROM crop_category";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["cc_id"] . "'>" . $row["cc_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" id="croparea5" name="crop" required="true">
                <option value="" disabled selected>Crop Name</option>

              </select>
            </div>
			<div class="form-group">
              <select class="browser-default custom-select" id="variety_cd" name="crop" required="true">
                <option value="" disabled selected>Crop Variety</option>

              </select>
            </div>


            <div class="form-group">
              <button type="submit" name="searchcd" class="btn btn-success">Get</button>
            </div>


            <div name="editor3">

              <?php


              if(isset($_POST['searchcd']))
              {
                $nm=$_POST['crop'];
                //echo $nm;
                $sql = "SELECT cd_text FROM  crop_disease, crop where crop_disease.c_id=$nm AND crop_disease.c_id=crop.c_id ";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo $row['cd_text'];
                  }
                }



              }
              unset($_POST['searchcd']);

              ?>
            </div>


          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item10">
          <form action="index.php#tab2-item10" method="POST">
            <div class="form-group">
              <select class="browser-default custom-select"  id="catarea7" required="true">
                <option value="" disabled selected>Select Category</option>
                <?php
                $sql = "SELECT * FROM crop_category";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo "<option value='" . $row["cc_id"] . "'>" . $row["cc_name"] . "</option>";
                  }
                }
                ?>

              </select>
            </div>

            <div class="form-group">
              <select class="browser-default custom-select" id="croparea7" name="crop" required="true">
                <option value="" disabled selected>Crop Name</option>

              </select>
            </div>

			<div class="form-group">
              <select class="browser-default custom-select" id="variety_ct" name="crop" required="true">
                <option value="" disabled selected>Crop Variety</option>

              </select>
            </div>


            <div class="form-group">
              <button type="submit" name="searchct" class="btn btn-success">Get</button>
            </div>

            <div name="editor4">

              <?php


              if(isset($_POST['searchct']))
              {
                $nm=$_POST['crop'];
                //echo $nm;
                $sql = "SELECT ct_tips FROM  crop_tips, crop where crop_tips.c_id=$nm AND crop_tips.c_id=crop.c_id ";
                $result = mysqli_query($link, $sql);
                if (mysqli_num_rows($result) > 0) {
                  while ($row = mysqli_fetch_assoc($result)) {
                    echo $row['ci_tips'];
                  }
                }



              }
              unset($_POST['searchct']);

              ?>
            </div>
          </form>
        </div>
        <div class="tab-pane fade" id="tab2-item5">
          <table class="table table-striped">
            <caption><h2>Messages From Dealers</h2></caption>

            <tr><td>No</td><td>Message</td><td>Date</td><td>Dealer Name</td><td>Store Name</td><td>Contact Number</td><td>Actions</td></tr>
            <?php
            $f_id=$_SESSION['uid'];
            $sql = "SELECT * FROM dealer_to_farmer_msg dtf,dealer d WHERE d.de_id=dtf.de_id AND f_id={$f_id} AND dtfm_status=0";
            $result = mysqli_query($link, $sql);
            $i = 0;
            while ($row = mysqli_fetch_assoc($result)) {
              $i++;
              $row['dtfm_date'] = date('d/m/Y', $row['dtfm_date']);
              echo "<tr><td>{$i}</td><td>{$row['dtfm_msg']}</td><td>{$row['dtfm_date']}</td><td>{$row['de_name']}</td><td>{$row['de_store_name']}</td><td>{$row['de_phone']}</td><td><a href='hidemessage.php?msgid={$row['dtfm_id']}'>Hide Message</a></td></tr>";
            }
            ?>
          </table>

        </div>


      </div>
    </div>
  </div>
</div><!--/#table-container-->

<footer id="footer">
  <div class="container">
    <div class="row">

      <div class="col-sm-12">
        <div class="copyright-text text-center">
          <p style="
          color: black;
          ">&copy; Your Company 2014. All Rights Reserved.</p>
          <p style="
          color: black;
          "><strong>Designed by <a target="_blank" href="#">SB Creations</a></strong></p>
        </div>
      </div>
    </div>
  </div>
</footer>
<!--/#footer-->

<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/lightbox.min.js"></script>
<script type="text/javascript" src="../js/wow.min.js"></script>
<script type="text/javascript" src="../js/main.js"></script>
<script type="text/javascript">
var ctx = document.getElementById("chartjs_bar").getContext('2d');
var myChart = new Chart(ctx, {
  type: 'bar',
  data: {
    labels:<?php if(isset($productname)) echo  json_encode($productname); ?>,
    datasets: [{
      backgroundColor: [
        "#5969ff",
        "#ff407b",
        "#25d5f2",
        "#ffc750",
        "#2ec551",
        "#7040fa",
        "#ff004e"
      ],
      data:<?php echo json_encode($sales); ?>,
    }]
  },
  options: {
    legend: {
      display: false,
      position: 'bottom',

      labels: {
        fontColor: '#71748d',
        fontFamily: 'Circular Std Book',
        fontSize: 14,
      }
    },


  }
});
</script>
</body>
</html>

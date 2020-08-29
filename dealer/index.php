<!DOCTYPE html>
<html lang="en">
<?php  error_reporting(E_ERROR | E_PARSE);
?>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Dealer landing</title>
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
    <link rel="shortcut icon" href="../images/favicon.ico">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script>
        function contact(hid, did) {

            window.location.href = "http://localhost:81/kisanseva/1.1/dealer/index.php?action=contact&hid=" + hid;
        }
        $(document).ready(function() {
            $("#statearea").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loaddistricts.php?s_id=" + selected,
                    success: function(result) {
                        $("#districtarea").html(result);
                    }
                });
            });

            $("#districtarea").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadvillages.php?d_id=" + selected,
                    success: function(result) {
                        $("#villagearea").html(result);

                    }
                });
            });
            $("#catarea").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadcrops.php?c_id=" + selected,
                    success: function(result) {
                        $("#croparea").html(result);
                    }
                });
            });
            $("#catarea1").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadcrops.php?c_id=" + selected,
                    success: function(result) {
                        $("#croparea1").html(result);
                    }
                });
            });

            $("#catarea3").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadcrops.php?c_id=" + selected,
                    success: function(result) {
                        $("#croparea3").html(result);
                    }
                });
            });
            $("#croparea1").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadvariety.php?c_id=" + selected,
                    success: function(result) {
                        $("#variety1").html(result);
                    }
                });
            });
            $("#croparea").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadvariety.php?c_id=" + selected,
                    success: function(result) {
                        $("#variety2").html(result);
                    }
                });
            });
            $("#croparea3").change(function() {
                selected = $(this).val();
                $.ajax({
                    type: "GET",
                    url: "../loadvariety.php?c_id=" + selected,
                    success: function(result) {
                        $("#variety3").html(result);
                    }
                });
            });
        });
    </script>
</head>
<!--/head-->
<?php
require_once('../dbs.php');
require_once('../functions.php');   ?>


<?php if( isset($_SESSION['user']) && !empty($_SESSION['user']) )
{}else{
	header("Location: index.php");
 } ?>


<body>
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
"></h1>
                        <h1><img src="../images/logo1.png" alt="logo" style="
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


                        <li><a href="../logout.php">Log Out</a></li>
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
">Dealer Page</h2>
            </div>
            <div class="col-md-9" style="
    width: 52%;
    margin-left: 10%;
">


                <?php
                if (isset($_POST['sub'])) {
                    date_default_timezone_set('Asia/Kolkata');
                    $c_id = $_POST['crop'];
                    $today = time();
                    $de_id = $_SESSION['uid'];
                    $cp_price = $_POST['tp'];
                    setPrice($c_id, $today, $de_id, $cp_price);
                    $sucess[] = "Price saved sucessfully";
                }

                if (isset($_POST['request'])) {
                    $de_id = $_SESSION['uid'];
                    $time = time();
                    $c_id = intval($_POST['crop']);
                    $offpr = $_POST['offpr'];
                    $dr_quantity = intval($_POST['qty']);
                    $ut_id = intval($_POST['ut_id']);
                    mysqli_query($link, "INSERT INTO `dealer_request`( `c_id`, `dr_quantity`, `dr_unit_price`, `ut_id`, `dr_date`, `de_id`) VALUES ('{$c_id}','{$dr_quantity}','{$offpr}','{$ut_id}','{$time}','{$de_id}')");
                    $sucess[] = "Rrequest saved sucessfully";
                } else if (isset($_GET['action']) && $_GET['action'] == 'contact') {
                    $h_id = intval($_GET['hid']);
                    $result = mysqli_query($link, "SELECT * FROM harvesting NATURAL JOIN planting  WHERE h_id='{$h_id}' ");
                 //   echo "SELECT * FROM harvesting NATURAL JOIN planting WHERE h_id='{$h_id}'";
                    $row = mysqli_fetch_assoc($result);
                    $result = mysqli_query($link, "SELECT * FROM dealer WHERE de_id='{$_SESSION['uid']}'");
                    $deal = mysqli_fetch_assoc($result);
                    $msg = "The dealer {$deal['de_name']} inquired about your harvesting with harvest id {$h_id} , his/her contact number is {$deal['de_phone']}";
                    $time = time();
                    mysqli_query($link, "INSERT INTO `dealer_to_farmer_msg` (`dtfm_msg`, `dtfm_date`, `f_id`, `dtfm_status`, `de_id`) values ('{$msg}','{$time}','{$row['f_id']}','0','{$_SESSION['uid']}')");
                 //   echo  "INSERT INTO `dealer_to_farmer_msg` (`dtfm_msg`, `dtfm_date`, `f_id`, `dtfm_status`, `de_id`) values ('{$msg}','{$time}','{$row['f_id']}','0','{$_SESSION['uid']}')";
                    $sucess[] = "Message passed sucessfully";
                }




                ?>


                <?php



                if (isset($error) && count($error) > 0) {

                    foreach ($error as $err) {

                        echo '<div class="alert alert-danger alert-dismissible">
    <a  class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Error..!</strong> ' . $err . '.
  </div>';
                    }
                }

                if (isset($sucess) && count($sucess) > 0) {

                    foreach ($sucess as $err) {

                        echo '<div class="alert alert-info alert-dismissible">
    <a  class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success..!</strong> ' . $err . '.
  </div>';
                    }
                }

                ?>
                <ul id="tab2" class="nav nav-pills">
                    <li class="active"><a href="#tab2-item1" data-toggle="tab">Search Items</a></li>
                    <li><a href="#tab2-item2" data-toggle="tab">Set price</a></li>
                    <li><a href="#tab2-item4" data-toggle="tab">Request Item</a></li>

                </ul>
                <div class="tab-content">


                    <div class="tab-pane fade active in" id="tab2-item1">

                        <form action="index.php#tab2-item3" method="POST">
                            <div class="form-group">
                                <select class="browser-default custom-select" id="catarea1" required="true">
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
                                <select class="browser-default custom-select" id="croparea1" name="crop" required="true">
                                    <option value="" disabled selected>Crop Name</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <select class="browser-default custom-select" id="variety1" name="crop" required="true">
                                    <option value="" disabled selected>Crop Variety</option>

                                </select>
                            </div>      

                            <div class="form-group">
                                <select class="browser-default custom-select" name="statearea" id="statearea">
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
                                <select class="browser-default custom-select" name="districtarea" id="districtarea">
                                    <option value="" disabled selected>Any District</option>


                                </select>
                            </div>
                            <div class="form-group">
                                <select name="village" class="browser-default custom-select" id="villagearea">
                                    <option value="" disabled selected>Any Village</option>


                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" name="search" class="btn btn-success">Submit</button>
                            </div>
                        </form>

                        <table class="table table-striped">
                            <caption>
                                <h2>Item Search Result</h2>
                            </caption>

                            <tr>
                                <td>No</td>
                                <td>State</td>
                                <td>District</td>
                                <td>Village</td>
                                <td>Harvested Quantity</td>
                                <td>Unit Price</td>
                                <td>Harvest Date</td>
                                <td>Action</td>
                            </tr>


                            <?php
                            if (isset($_POST['search'])) {
                                if (isset($_POST['statearea'])) {

                                    $sid = intval($_POST['statearea']);
                                    $part[] = " s_id='{$sid}' ";
                                }

                                if (isset($_POST['districtarea'])) {

                                    $sid = intval($_POST['districtarea']);
                                    $part[] = " d_id='{$sid}' ";
                                }


                                if (isset($_POST['villagearea'])) {

                                    $sid = intval($_POST['villagearea']);
                                    $part[] = " v_id='{$sid}' ";
                                }

                                $crs = intval($_POST['crop']);
                                $part[] = " c_id='{$crs}' AND h_status=0 ";
                                if (isset($part) &&  count($part) > 0) {
                                    $pa = implode(" AND ", $part);
                                }

                                $sql = "SELECT * FROM `harvesting` NATURAL JOIN planting NATURAL JOIN village NATURAL JOIN district NATURAL JOIN state NATURAL JOIN unit_type WHERE  {$pa}";
                                $result = mysqli_query($link, $sql);
                                $i = 0;
                                while ($row = mysqli_fetch_assoc($result)) {
                                    $i++;
                                    $row['h_date'] = date('d/m/Y', $row['h_date']);
                                    echo "<tr><td>{$i}</td><td>{$row['s_name']}</td><td>{$row['d_name']}</td><td>{$row['v_name']}</td><td>{$row['h_quantity']} {$row['ut_name']}</td><td>{$row['h_unit_price']}</td><td>{$row['h_date']}</td><td><button onclick='contact({$row['h_id']});'>Contact Farmer</button></td></tr>";
                                }
                            }
                            ?>
                        </table>

                    </div>


                    <div class="tab-pane fade" id="tab2-item2">
                        <form action="index.php" method="post">
                            <div class="form-group">
                                <select class="browser-default custom-select" id="catarea">
                                    <option value="" disabled selected>Category</option>
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
                                <select class="browser-default custom-select" id="croparea" name="crop">
                                    <option value="" disabled selected>Crop Name</option>

                                </select>
                            </div>
                            <div class="form-group">
                                <select class="browser-default custom-select" id="variety2" name="crop">
                                    <option value="" disabled selected>Crop Variety</option>

                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" name="tp" class="form-control" required="required" placeholder="Todays Price">
                            </div>
                            <div class="form-group">
                                <input type="submit" class="login100-form-btn" name="sub" value="Set Price">
                            </div>


                        </form>
                    </div>

                    <div class="tab-pane fade" id="tab2-item4">
                        <form action="index.php" method="POST">

                            <div class="form-group">
                                <select class="browser-default custom-select" id="catarea3" required="true">
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
                                <select class="browser-default custom-select" id="variety3" name="crop" required="true">
                                    <option value="" disabled selected>Crop variety</option>

                                </select>
                            </div>

                            <div class="form-group">
                                <input type="text" name="qty" class="form-control" required="required" placeholder="Quantity">
                            </div>

                            <div class="form-group">
                                <select class="browser-default custom-select" name="ut_id" required="true">
                                    <option value="" disabled selected>Select Unit</option>
                                    <?php
                                    $sql = "SELECT * FROM `unit_type`";
                                    $result = mysqli_query($link, $sql);
                                    if (mysqli_num_rows($result) > 0) {
                                        while ($row = mysqli_fetch_assoc($result)) {
                                            echo "<option value='" . $row["ut_id"] . "'>" . $row["ut_name"] . "</option>";
                                        }
                                    }
                                    ?>

                                </select>
                            </div>



                            <div class="form-group">
                                <input type="text" name="offpr" class="form-control" required="required" placeholder="Offering Price">
                            </div>
                            <div class="form-group">

                                <button type="submit" name="request" class="btn btn-lg btn-warning">Request</button>
                            </div>

                        </form>
                    </div>



                </div>
            </div>
        </div>
    </div>
    <!--/#table-container-->
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


</body>

</html>

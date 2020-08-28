<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login </title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!--===============================================================================================-->
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
	<link rel="shortcut icon" href="images/favicon.ico">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
	<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main1.css">
	<!--===============================================================================================-->
</head>
<body>

	<?php

	//echo print_r($_POST);
	//echo print_r($_GET);
	//echo print_r($_SESSION);
	include("dbs.php");

	if (isset($_POST['submit']) && $_POST['submit'] = 'submit') {


		$uname = $_POST['uname'];
		$password = md5(mysqli_real_escape_string($link,$_POST['pass']));

		if(strcmp($_POST['type'],"1")==0) {
			//farmer
			//$sql = "select * from farmer where f_phone='{$uname}' and f_password='{$password}'";
      $sql = "UPDATE farmer SET f_password = '{$password}' WHERE f_phone='{$uname}'";
			$result = mysqli_query($link, $sql);
			if (mysqli_error($link)) {
				die(mysqli_error($link));
			} else {
				if ($result) {
					header("Location: signin.php");
					exit();
				} else {
					$error[] = 'Username is wrong or Inactive account';
				}
			}
		} else if(strcmp($_POST['type'],"2")==0) {
			//dealer
			$sql = "UPDATE dealer SET de_password = '{$password}' WHERE de_phone='{$uname}'";
			$result = mysqli_query($link, $sql);
			if (mysqli_error($link)) {
				die(mysqli_error($link));
			} else {
        if ($result) {
					header("Location: signin.php");
					exit();
				} else {
					$error[] = 'Username is wrong or Inactive account';
				}
			}
		}
		else if(strcmp($_POST['type'],"3")==0) {
			//agri officer
			$sql = "UPDATE agoffice SET ag_password = '{$password}' WHERE aag_phone='{$uname}'";
			$result = mysqli_query($link, $sql);
			if (mysqli_error($link)) {
				die(mysqli_error($link));
			} else {
        if ($result) {
					header("Location: signin.php");
					exit();
				} else {
					$error[] = 'Username is wrong or Inactive account';
				}
			}
		}
	}

	//require_once('head.php');
	//require_once('menu.php');


	?>

	<div class="limiter">

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
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" method="post" action="passwordreset.php">
					<span class="login100-form-title">
						PASSWORD RESET
          </span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="uname" placeholder="Mobile Number">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass" placeholder="New Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" >
						<select class="browser-default custom-select" name="type" required>
							<option value="" disabled selected >User Type</option>
							<option value="1">Farmer</option>
							<option value="2">Dealers</option>
							<option value="3">Agricultural Officer</option>
						</select>
						<span class="focus-input100"></span>

					</div>
					<div class="container-login100-form-btn">
						<input type="submit" class="login100-form-btn" name="submit" value="Change Password">

					</div>

					<div class="text-center p-t-12">
						<a class="txt2" href="signin.php">
							Sign-in Page
						</a>
					</div>
					<div class="text-center p-t-136">
						<a class="txt2" href="index.php">
							Home							<i class="fa fa-long-arrow-right m-l-5" aria-hidden="true"></i>
						</a>
					</div>
				</form>
			</div>
		</div>
	</div>




	<!--===============================================================================================-->
	<script src="vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/bootstrap/js/popper.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/select2/select2.min.js"></script>
	<!--===============================================================================================-->
	<script src="vendor/tilt/tilt.jquery.min.js"></script>
	<script >
	$('.js-tilt').tilt({
		scale: 1.1
	})
	</script>
	<!--===============================================================================================-->
	<script src="js/main1.js"></script>

</body>
</html>

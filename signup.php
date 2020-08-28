<!DOCTYPE html>
<?php require_once('dbs.php');
require_once('functions.php');   ?>
<html lang="en">
<head>
	<title>SignUpS</title>
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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script>

	function check()
	{
frm=		document.getElementById('frm');
	if(frm.pass1.value!=frm.pass2.value)
	{
		alert('password missmatch');
		return false;
	}else if(frm.pass1.value.length<6)
	{
		alert('small password');
		return false;
	}else
	{
		return true;
	}
	}


$( document ).ready(function() {
$("#statearea").change(function() {
  selected=$(this).val();
	$.ajax({
        type: "GET",
        url: "loaddistricts.php?s_id="+selected,
        success: function(result) {
          $("#districtarea").html(result);
        }
    });   
});
$("#districtarea").change(function() {
  selected=$(this).val();
	$.ajax({
        type: "GET",
        url: "loadvillages.php?d_id="+selected,
        success: function(result) {
          $("#villagesarea").html(result);
        }
    });   
});
$("#typearea").change(function() {
  selected=$(this).val();
	if(selected==2) {
		content="<div class='wrap-input100 validate-input' data-validate = 'Valid Phone number Reqd'><input class='input100' type='text' name='license' placeholder='License No'><span class='focus-input100'></span><span class='symbol-input100'><i class='fa fa-address-card-o' aria-hidden='true'></i></span></div><div class='wrap-input100 validate-input' data-validate = 'Valid Phone number Reqd'><input class='input100' type='text' name='storename' placeholder='Store Name'><span class='focus-input100'></span><span class='symbol-input100'><i class='fa fa-address-card-o' aria-hidden='true'></i></span></div>";
		$("#licencearea").html(content);
	}
	if(selected==3) {
		content="<div class='wrap-input100 validate-input' data-validate = 'Valid Phone number Reqd'><input class='input100' type='text' name='idnum' placeholder='Enter ID number'><span class='focus-input100'></span><span class='symbol-input100'><i class='fa fa-address-card-o' aria-hidden='true'></i></span></div>";
		$("#idnumber").html(content);
	}
});
});
</script>
</head>
<body>
<?php 
	if(isset($_POST['sub'])) {
		$f_name = $_POST["name"];
		$f_pass =  md5($_POST["pass2"]);
		$f_addr = $_POST["address"];
		$f_phone = $_POST["mob"];
		$v_id = $_POST["village"];
		
		if(strcmp($_POST['type'],"1")==0) { 
		//adding new farmer
			addNewFarmer($f_name,$f_pass,$f_addr,$f_phone,$v_id);
			header("location: ./signin.php");
		} else if(strcmp($_POST['type'],"2")==0) { 
		//adding new dealer
		$l_no = $_POST["license"];
		$s_name = $_POST["storename"];
			addNewDealer($f_name,$f_pass,$f_addr,$f_phone,$v_id,$l_no,$s_name);
			header("location: ./signin.php");

		}
		else if(strcmp($_POST['type'],"3")==0) { 
			//adding new agriculturalofficer
			$l_no = $_POST["license"];
			$s_name = $_POST["storename"];
			addagriofficer($f_name,$f_pass,$f_addr,$f_phone,$v_id);
				header("location: ./signin.php");
	
			}  		
	}
?>	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-pic js-tilt" data-tilt>
					<img src="images/img-01.png" alt="IMG">
				</div>

				<form class="login100-form validate-form" id="frm" method="post" action="signup.php">
					<span class="login100-form-title" style="
    margin-top: -39%;
">
						Member Signup
					</span>

					<div class="wrap-input100 validate-input" data-validate = "Valid email is required: ex@abc.xyz">
						<input class="input100" type="text" name="name" placeholder="Your Name">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-envelope" aria-hidden="true"></i>
						</span>
					</div>

					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass1" placeholder="Password">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Password is required">
						<input class="input100" type="password" name="pass2" placeholder="Enter password again">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-lock" aria-hidden="true"></i>
						</span>
					</div>
					<div class="wrap-input100 validate-input" data-validate = "Valid Phone number Reqd">
						<input class="input100" type="text" name="mob" placeholder="Mobile No">
						<span class="focus-input100"></span>
						<span class="symbol-input100">
							<i class="fa fa-mobile" aria-hidden="true"></i>
						</span>
					</div>
							<div class="md-form">
							<textarea id="address" name="address" class="md-textarea form-control" rows="3"></textarea>
							<label for="form7">Address</label>
							</div>
					<div class="wrap-input100 validate-input" >
						<select class="browser-default custom-select" name="type" id="typearea">
  					<option value="" disabled selected>Sign Up As</option>
  					<option value="1">Farmer</option>
  					<option value="2">Dealers</option>
  					<option value="3">Agricultural Officer</option>
					</select>
						<span class="focus-input100"></span>						
					</div>
					<div id="licencearea">
					</div>
					<div id="idnumber">
					</div>
					
					
					<div class="wrap-input100 validate-input" >
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
						<span class="focus-input100"></span>
						
					</div>
					<div class="wrap-input100 validate-input" >
						<select class="browser-default custom-select" id="districtarea">
  					<option value="" disabled selected>District</option>
  					
					</select>
						<span class="focus-input100"></span>
						
					</div>
					<div class="wrap-input100 validate-input" >
						<select class="browser-default custom-select" name="village" id="villagesarea">
  					<option value="" disabled selected>Village</option>
					</select>
						<span class="focus-input100"></span>
						
					</div>
					<div class="container-login100-form-btn">
					<input type="submit" class="login100-form-btn" onclick="return check();" name="sub" value="Sign Up">
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
		// Material Select Initialization
$(document).ready(function() {
$('.mdb-select').materialSelect();
});
	</script>
<!--===============================================================================================-->
	<script src="js/main1.js"></script>

</body>
</html>
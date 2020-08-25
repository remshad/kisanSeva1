<?php require_once('../dbs.php');  ?>

<head>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
        <script src="./js/jquery.min.js"></script>
        <script src="./js/bootstrap.min.js"></script>

        <link href="./css/style.css?key=<?php echo time(); ?>" rel="stylesheet" type="text/css" />

</head>

<body>
        <?php

        //echo print_r($_POST);
        //echo print_r($_GET);
        //echo print_r($_SESSION);


        if (isset($_POST['submit']) && $_POST['submit'] = 'submit') {


                if (!preg_match('/[^A-Za-z0-9 ]+/', $_POST['uname'])) {
                        $uname = $_POST['uname'];
                        $password = md5(mysqli_real_escape_string($link, $_POST['password']));

                       $sql = "select * from user where u_name='{$uname}' and u_pass='{$password}' and u_status=1 ";
                   
                        $result = mysqli_query($link, $sql);
                        if (mysqli_error($link)) {
                                die(mysqli_error($link));
                        } else {

                                if (mysqli_num_rows($result) > 0) {
                                        $row = mysqli_fetch_assoc($result);

                                        $_SESSION['user'] = $row['u_name'];
                                        $_SESSION['pass'] = $row['u_pass'];
                                       
                                        header("Location: index.php");
                                        exit();
                                } else {
                                        $error[] = 'Username or password is wrong or Inactive account';
                                }
                        }
                } else {
                        $error[] = "User name only expect alpha numeritics";
                }
        }

        //require_once('head.php');
        //require_once('menu.php');


        ?>

        <div class="container">



                <div style="text-align:center;padding-left:10px;">

                        <?php

                        if (isset($_GET['error'])) {
                                $error[] = urldecode($_GET['error']);
                        }
                        if (isset($error) && count($error) > 0) {

                                foreach ($error as $err) {

                                        echo '<div class="alert alert-danger alert-dismissible">
                                        <a  class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                        <strong>Error..!</strong> ' . $err . '.
                                      </div>';
                                }
                        }
                        ?>
                        <div class="section-head">
                                <h2 class="section-title text-uppercase">Login</h2>
                        </div>


                        <div>
                                <table style="margin: auto">

                                        <form action='login.php' method='post' id='frm'>

                                                <tr>
                                                        <td>Login Name:</td>
                                                        <td><input type='text' name='uname'></td>
                                                </tr>
                                                <tr>
                                                        <td>Password:</td>
                                                        <td><input type='password' name='password'></td>
                                                </tr>
                                                <!-- <tr><td>Login as:</td><td><select name='loginAs' ><option value='0'>User</option><option value='1'>Manager</option><option value='2'>Admin</option></select></td></tr>  -->
                                                <tr>
                                                        <td colspan='2'><input type='submit' name='submit' value='submit'></td>
                                                </tr>
                                        </form>




                                </table>
                        </div>
                </div>

        </div>


</body>
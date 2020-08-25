<?php
//include_once('simplexlsx.class.php');
require('login1.php');

$head = "<script>

function del(id)
{
if(confirm('are you sure?'))
{
    window.location.href='crop_category.php?action=delete&id='+id;
}
}
</script>";
include_once('head.php');

if (isset($_POST['submit'])) {
    $cat = mysqli_real_escape_string($link, $_POST['category']);
    mysqli_query($link, "INSERT INTO `crop_category` (cc_name) VALUES ('{$cat}') ");
    $sucess[] = "crop category added sucessfully";
} else if (isset($_GET['action']) && $_GET['action'] == 'edit') {
    $cat_id = intval($_GET['id']);
    $result = mysqli_query($link, "SELECT * FROM  `crop_category` WHERE cc_id='{$cat_id}' ");
    $edit = mysqli_fetch_assoc($result);
} else if (isset($_POST['edit'])) {
    $cat_id = intval($_POST['cat_id']);
    $cat = mysqli_real_escape_string($link, $_POST['category']);
    mysqli_query($link, "UPDATE crop_category SET cc_name='{$cat}' WHERE cc_id='{$cat_id}'");
    $sucess[] = "crop category edited sucessfully";
} elseif (isset($_GET['action']) && $_GET['action'] == 'delete') {
    $cat_id = intval($_GET['id']);
    $result = mysqli_query($link, "SELECT * FROM `crop` WHERE `cc_id`='{$cat_id}'");
    if (mysqli_num_rows($result) > 0) {
        $error[] = "Crop items available in DB";
    } else {
        $sql="DELETE FROM crop_category WHERE `cc_id`='{$cat_id}' ";
        mysqli_query($link, $sql);
        $sucess[] = "crop category deleted sucessfully";
    }
}

echo '<div class="container">
  ';


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


<table class="table table-bordered">
    <caption>Add Category</caption>
    <form action="crop_category.php" method="POST">
        <tr>
            <th>Category Name</th>
            <td><input type="text" name="category" required="true" <?php if (isset($edit)) echo 'value="' . $edit['cc_name'] . '"'; ?> style="width:100%;"></td>
        <tr>
            <?php if (isset($edit)) echo '<input type="hidden" name="cat_id" value="' . $edit['cc_id'] . '">' ?>

            <td colspan="2"><input <?php if (isset($edit)) {
                                        echo 'type="submit" name="edit" value="edit"';
                                    } else {
                                        echo 'type="submit" name="submit" value="submit"';
                                    } ?>> </td>
        </tr>
        </tr>

    </form>
</table>

<br>
<table class="table table-bordered">
    <?php

    $sql = "SELECT * FROM `crop_category`";
    $result = mysqli_query($link, $sql);
    $i = 0;

    echo "<tr><td>No</td><td>Category Name</td><td>Action1</td><td>Action2</td></tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $i++;
        echo "<tr><td>{$i}</td><td>{$row['cc_name']}</td><td><a href='crop_category.php?action=edit&id={$row['cc_id']}'><button>Edit</button></a></td><td><button onClick='del({$row['cc_id']})'>Delete</button></td></tr>";
    }

    ?>

</table>


</div>

<?php
include_once('foot.php');
?>
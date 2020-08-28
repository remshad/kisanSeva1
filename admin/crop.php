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
    $crop = mysqli_real_escape_string($link, $_POST['crop']);
    mysqli_query($link, "INSERT INTO `crop` (c_name,cc_id) VALUES ('{$crop}','{$cat}') ");
    $sucess[] = "crop  added sucessfully";
} else if (isset($_GET['action']) && $_GET['action'] == 'edit') {
    $crop_id = intval($_GET['id']);
    $result = mysqli_query($link, "SELECT * FROM  `crop` WHERE c_id='{$crop_id}' ");
    $edit = mysqli_fetch_assoc($result);
} else if (isset($_POST['edit'])) {
    $crop_id = intval($_POST['crop_id']);
    $cat = intval($_POST['category']);
    $crop = mysqli_real_escape_string($link, $_POST['crop']);

    mysqli_query($link, "UPDATE crop SET cc_id='{$cat}' , c_name='{$crop}' WHERE c_id='{$crop_id}'");
    $sucess[] = "crop  edited sucessfully";
} elseif (isset($_GET['action']) && $_GET['action'] == 'delete') {
    $crop_id = intval($_GET['id']);
    $result = mysqli_query($link, "(SELECT c_id FROM crop_price WHERE c_id='{$crop_id}') UNION (SELECT c_id FROM planting WHERE  c_id='{$crop_id}' )  UNION (SELECT c_id FROM dealer_request WHERE  c_id='{$crop_id}' )");
    if (mysqli_num_rows($result) > 0) {
        $error[] = "Crop items available in DB";
    } else {
        mysqli_query($link, "DELETE FROM crop WHERE `c_id`='{$crop_id}' ");
        $sucess[] = "crop item deleted sucessfully";
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
    <caption>Add Crop</caption>
    <form action="crop.php" method="POST">
        <tr>
            <th>Crop Name</th>
            <td><input type="text" name="crop" required="true"
                    <?php if (isset($edit)){
                         echo 'value="' . $edit['c_name'] . '"';
                    }else if (mysqli_num_rows(mysqli_query($link,"SELECT item FROM `market_data` WHERE item not IN (SELECT c_name FROM `crop`) ORDER by rand () LIMIT 1"))){
                      $item=  mysqli_fetch_assoc(mysqli_query($link,"SELECT DISTINCT(item) FROM `market_data` WHERE item not IN (SELECT c_name FROM `crop`) ORDER by rand () LIMIT 1"))['item'];
                        echo 'value="' . $item . '"'; 
                    }?> style="width:100%;"></td>
        <tr>
            <th>Select Category</th>
            <td>
                <select name="category" required="true">
                    <?php
                    if (!isset($edit)) {
                        echo "<option value=''>Select</option>";
                    }

                    $sql = "SELECT * FROM crop_category";
                    $result = mysqli_query($link, $sql);
                    while ($row = mysqli_fetch_assoc($result)) {
                        if(isset($edit) && $edit['cc_id']==$row['cc_id'])
                        echo "<option value='{$row['cc_id']}' selected='true'>{$row['cc_name']}</option>";
                        else
                        echo "<option value='{$row['cc_id']}'>{$row['cc_name']}</option>";

                    }

                    ?>

                </select>

            </td>
        </tr>

        <tr>
            <?php 
            
            if(isset($edit)){
                echo '<input type="hidden" name="crop_id" value="' . $edit['c_id'] . '">';
            }
             
            
            
            ?>

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

    $sql = "SELECT * FROM `crop` natural join crop_category";
    $result = mysqli_query($link, $sql);
    $i = 0;

    echo "<tr><td>No</td><td>Crop Name</td><td>Crop Category</td><td>Action1</td><td>Action2</td></tr>";

    while ($row = mysqli_fetch_assoc($result)) {
        $i++;
        echo "<tr><td>{$i}</td><td>{$row['c_name']}</td><td>{$row['cc_name']}</td><td><a href='crop.php?action=edit&id={$row['c_id']}'><button>Edit</button></a></td><td><button onClick='del({$row['c_id']})'>Delete</button></td></tr>";
    }

    ?>

</table>


</div>

<?php
include_once('foot.php');
?>
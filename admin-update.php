<?php
if (session_id() == '' || !isset($_SESSION)) {
  session_start();
}

if ($_SESSION["type"] != "admin") {
  header("location:index.php");
}

include 'config.php';

$_SESSION["products_id"] = array();
$_SESSION["products_id"] = $_REQUEST['quantity'];

$result = $mysqli->query("SELECT * FROM products ORDER BY id asc");
$i = 0;
$x = 1;

if ($result) {
  while ($obj = $result->fetch_object()) {
    if (empty($_SESSION["products_id"][$i])) {
      $i++;
      $x++;
    } else {
      $newqty = $obj->qty + intval($_SESSION["products_id"][$i]); // Use intval to sanitize input as an integer
      if ($newqty < 0) $newqty = 0; // So, Qty will not be in negative.

      // Use prepared statement to update the product quantity
      $stmt = $mysqli->prepare("UPDATE products SET qty = ? WHERE id = ?");
      $stmt->bind_param("ii", $newqty, $x);
      
      if ($stmt->execute()) {
        echo 'Data Updated';
      }

      $stmt->close();
      $i++;
      $x++;
    }
  }
}

header("location:success.php");
?>

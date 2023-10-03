<?php
// Check if session is not already started, then start it.
if (session_id() == '' || !isset($_SESSION)) {
  session_start();
}

// Check if $_SESSION["type"] is set and not empty
if (!isset($_SESSION["type"]) || empty($_SESSION["type"])) {
  header("location:index.php");
  exit(); // Add an exit to prevent further execution
}

if ($_SESSION["type"] != "admin") {
  header("location:index.php");
  exit(); // Add an exit to prevent further execution
}

include 'config.php';

$_SESSION["products_id"] = array();
if (isset($_REQUEST['quantity'])) {
  $_SESSION["products_id"] = $_REQUEST['quantity'];
}

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
exit(); // Add an exit to prevent further execution
?>

<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

if (isset($_SESSION['cart'])) {
    $cart = $_SESSION['cart'];
    } else {
    $cart = array();
}

//if pet id cannot be found, terminate script.
if (!filter_has_var(INPUT_GET, 'id')) {
    $error = "Pet id not found. Operation cannot proceed.<br><br>";
    header("Location: error.php?m=$error");
    die();
}

//retrieve pet id and make sure it is a numeric value.
$id = filter_input(INPUT_GET, 'id', FILTER_SANITIZE_NUMBER_INT);
if (!is_numeric($id)) {
    $error = "Invalid Pet id. Operation cannot proceed.<br><br>";
    header("Location: error.php?m=$error");
    die();
}

if (array_key_exists($id, $cart)) {
    //no longer keeping track of count, so this is commented out for now
    #$cart[$id] = $cart[$id] + 1;
    } else {
    $cart[$id] = 1;
}

//update the session variable
$_SESSION['cart'] = $cart;

//redirect to the show_cart.php page.
header('Location: show_cart.php');
<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include_once ('includes/alert.php');

if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = intval($_GET['id']);

    if (isset($_SESSION['cart'][$id])) {
        unset($_SESSION['cart'][$id]);
        set_alert("Pet removed from your reservation cart.", "info");
    }
}

header("Location: show_cart.php");
exit();

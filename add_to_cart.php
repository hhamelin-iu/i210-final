<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include_once ('includes/alert.php');

$login_status = $_SESSION['login_status'] ?? 0;

if ($login_status == 0) {
    set_alert("Please sign in to reserve a pet.", "warning");
    header("Location: loginform.php");
    exit();
}

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;

if ($id <= 0) {
    set_alert("Invalid pet selection.", "error");
    header("Location: browse.php");
    exit();
}

if (!isset($_SESSION['cart']) || !is_array($_SESSION['cart'])) {
    $_SESSION['cart'] = array();
}

$_SESSION['cart'][$id] = 1;

set_alert("Pet successfully added to your reservation cart!", "success");
header('Location: show_cart.php');
exit();
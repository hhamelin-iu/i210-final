<?php
session_start(); // Start the session to access the cart

// Check if the ID parameter is provided in the URL
if (isset($_GET['id']) && is_numeric($_GET['id'])) {
    $id = intval($_GET['id']);

    // Check if the cart exists in the session
    if (isset($_SESSION['cart']) && isset($_SESSION['cart'][$id])) {
        unset($_SESSION['cart'][$id]); // Remove the item from the cart
    }
}

// Redirect back to the shopping cart page
header("Location: show_cart.php");
exit();

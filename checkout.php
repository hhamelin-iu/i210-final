<?php
$page_title = "Check Out";
include ('includes/header.php');?>
</head>

<?php
    //start session if it has not already started
    if (session_status() == PHP_SESSION_NONE) {
        session_start();
    }
    $_SESSION['cart'] = [];
?>

<?php include ('includes/navbar.php'); ?>
    <h2>Checkout</h2>
    <p>Thank you for viewing our pets. Your business is greatly appreciated.</p>
</body>
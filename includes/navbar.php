<body>
<?php
//start session if it has not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$login_status = isset($_SESSION['login_status']) ? $_SESSION['login_status'] : 0;
$cart_full = false;

if (isset($_SESSION['login']) AND isset($_SESSION['name']) AND
    isset($_SESSION['role'])) {
    $login = $_SESSION['login'];
    $name = $_SESSION['name'];
    $role = $_SESSION['role'];

    if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
        $cart = $_SESSION['cart'];
        if (count($cart) > 0) { // Check if the cart has at least one item
            $cart_full = true;
        } else {
            $cart_full = false; // Explicitly handle the empty case
        }
    } 
}
?>

<div class="navbar">
    <ul>
        <li><a class="home-button" href="."><div class="cat-icon"></div></a></li>
        <li><a href="browse.php">Browse</a></li>
        <li><a href="contact.php">Contact</a></li>
        <li><a class="cart-button" href="show_cart.php"
        style="<?= $cart_full ? 'mask-image: url(\'www/img/cart_full.svg\');' : '' ?>"></a></li>
    </ul>
    <div>
        <?= ($role == 1 ? '<span style="color:red">ADMIN MODE</span>' : '') ?>
        <span style="color:black"><?= ($login_status != 0 ? ('Welcome ' . $name . '!') : 'Login to reserve a pet.') ?></span>
        <a href="<?= ($login_status != 0 ? 'logout.php' : 'loginform.php') ?>" class="sign-in"> 
            <?= ($login_status != 0 ? 'Log Out' : 'Login') ?>
        </a>
    </div>
    </ul>
</div>
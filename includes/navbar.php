<body>
<?php
//start session if it has not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$login_status = isset($_SESSION['login_status']) ? $_SESSION['login_status'] : 0;

if (isset($_SESSION['login']) AND isset($_SESSION['name']) AND
    isset($_SESSION['role'])) {
    $login = $_SESSION['login'];
    $name = $_SESSION['name'];
    $role = $_SESSION['role'];
}
?>

<div class="navbar">
    <ul>
        <li><a href=".">Home</a></li>
        <li><a href="browse.php">Browse</a></li>
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
<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

include_once ('includes/alert.php');

$_SESSION = array();
if (ini_get("session.use_cookies")) {
    $params = session_get_cookie_params();
    setcookie(session_name(), '', time() - 42000,
        $params["path"], $params["domain"],
        $params["secure"], $params["httponly"]
    );
}
session_destroy();

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
set_alert("You have been signed out successfully.", "info");

$page_title = "Log Out";
include ('includes/header.php');
?>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="max-width: 550px; margin: 50px auto; text-align: center;" class="glass-card">
        <span class="badge badge-accent">[LOGGED OUT]</span>
        <h2 style="font-size: 2rem; margin-top: 10px; color: var(--neon-cyan);">Signed Out Successfully</h2>
        <p style="color: var(--text-muted); margin-bottom: 26px;">
            Thank you for visiting Silly Sanctuary. You have been safely logged out.
        </p>
        <div style="display: flex; gap: 14px; justify-content: center; flex-wrap: wrap;">
            <a href="loginform.php" class="btn btn-primary">Sign Back In</a>
            <a href="index.php" class="btn btn-secondary">Return Home</a>
        </div>
    </div>
</main>

<?php include ('includes/footer.php'); ?>
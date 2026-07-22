<?php
$page_title = "Reservation Confirmed";
include ('includes/header.php');
include_once ('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$_SESSION['cart'] = [];
set_alert("Your pet reservation request has been submitted successfully!", "success");
?>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="max-width: 700px; margin: 40px auto; text-align: center;" class="glass-card">
        <span class="badge badge-green">[RESERVATION LOGGED]</span>
        <h1 style="font-size: 2.6rem; margin-top: 14px; color: var(--neon-green);">Reservation Confirmed!</h1>
        <p style="color: var(--text-muted); font-size: 1.1rem; line-height: 1.7; margin-bottom: 32px;">
            Thank you for choosing Silly Sanctuary. Your reservation has been logged and our adoption specialists will contact you shortly to complete the onboarding process.
        </p>
        <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
            <a href="browse.php" class="btn btn-primary">Browse More Pets</a>
            <a href="index.php" class="btn btn-secondary">Return Home</a>
        </div>
    </div>
</main>

<?php include ('includes/footer.php'); ?>
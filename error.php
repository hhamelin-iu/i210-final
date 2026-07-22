<?php
$page_title = "Notice - Silly Sanctuary";
require_once 'includes/header.php';
require_once 'includes/alert.php';

$error = 'An unexpected system notice occurred.';
if (isset($_GET['m'])) {
    $error = trim($_GET['m']);
}
?>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="max-width: 620px; margin: 50px auto; text-align: center;" class="glass-card">
        <span class="badge badge-admin">[NOTICE]</span>
        <h1 style="font-size: 2.2rem; margin-top: 12px; color: var(--neon-pink);">System Notice</h1>
        <div style="background: rgba(255, 0, 127, 0.2); border: 2px solid var(--neon-pink); border-radius: 14px 6px 14px 6px; padding: 18px; color: #fbcfe8; margin: 20px 0; font-family: var(--font-body); font-weight: 500;">
            <?= htmlspecialchars($error) ?>
        </div>
        <div style="display: flex; gap: 14px; justify-content: center; flex-wrap: wrap;">
            <a href="browse.php" class="btn btn-primary">&larr; Return to Catalog</a>
            <a href="index.php" class="btn btn-secondary">Go to Home</a>
        </div>
    </div>
</main>

<?php require_once 'includes/footer.php'; ?>

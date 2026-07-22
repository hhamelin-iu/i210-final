<?php
$page_title = "Contact Us - Silly Sanctuary";
include('includes/header.php');
include_once('includes/alert.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $email = trim($_POST['email'] ?? '');
    $message = trim($_POST['message'] ?? '');

    if (!empty($name) && !empty($email) && !empty($message)) {
        set_alert("Thank you, $name! Your message has been received. Our adoption staff will get back to you shortly.", "success");
    } else {
        set_alert("Please complete all message fields.", "warning");
    }
}
?>
</head>

<?php 
include('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="max-width: 680px; margin: 30px auto;" class="glass-card">
        <div style="text-align: center; margin-bottom: 26px;">
            <span class="badge badge-accent">Contact Sanctuary Staff</span>
            <h1 style="font-size: 2.4rem; margin-top: 8px; color: var(--neon-cyan);">Send Us a Message</h1>
            <p style="color: var(--text-muted); font-size: 0.95rem;">
                Have questions about pet adoption, requirements, or care? Send a message to our staff below!
            </p>
        </div>

        <form action="contact.php" method="POST">
            <div class="form-group">
                <label for="name">Your Name</label>
                <input type="text" id="name" name="name" placeholder="Jane Doe" required>
            </div>

            <div class="form-group">
                <label for="email">Email Address</label>
                <input type="email" id="email" name="email" placeholder="jane@example.com" required>
            </div>

            <div class="form-group">
                <label for="message">Message</label>
                <textarea id="message" name="message" rows="5" placeholder="How can we help you find your pet?" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary" style="width: 100%; padding: 14px; font-size: 1.05rem; margin-top: 10px;">
                Send Message &rarr;
            </button>
        </form>
    </div>
</main>

<?php include('includes/footer.php'); ?>

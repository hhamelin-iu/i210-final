<?php
$page_title = "Sign In & Registration - Silly Sanctuary";
require_once('includes/header.php');
require_once('includes/alert.php');
?>
    <style>
        .auth-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 36px;
            margin-top: 30px;
            align-items: start;
        }

        @media (max-width: 768px) {
            .auth-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="text-align: center; margin-top: 20px;">
        <span class="badge badge-accent">Portal Access</span>
        <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">Sign In or Register</h1>
    </div>

    <div class="auth-grid">
        <!-- Sign In Card -->
        <div class="glass-card">
            <h2 style="font-size: 1.5rem; margin-bottom: 6px; color: var(--neon-purple);">User Sign In</h2>
            <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 24px;">
                Enter your credentials to manage your pet reservations.
            </p>

            <form method="post" action="login.php">
                <div class="form-group">
                    <label for="login-username">Username</label>
                    <input type="text" id="login-username" name="username" placeholder="e.g. user or admin" required>
                </div>

                <div class="form-group">
                    <label for="login-password">Password</label>
                    <input type="password" id="login-password" name="password" placeholder="••••••••" required>
                </div>

                <button type="submit" class="btn btn-primary" style="width: 100%; margin-top: 10px; padding: 14px;">
                    Sign In &rarr;
                </button>
            </form>
        </div>

        <!-- Registration Card -->
        <div class="glass-card">
            <h2 style="font-size: 1.5rem; margin-bottom: 6px; color: var(--neon-green);">Create New Account</h2>
            <p style="color: var(--text-muted); font-size: 0.95rem; margin-bottom: 24px;">
                New to Silly Sanctuary? Register below to reserve pets.
            </p>

            <form action="register.php" method="post">
                <div style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" id="firstname" name="firstname" placeholder="Jane" required>
                    </div>

                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="lastname" name="lastname" placeholder="Doe" required>
                    </div>
                </div>

                <div class="form-group">
                    <label for="reg-username">Desired Username</label>
                    <input type="text" id="reg-username" name="username" placeholder="cat_lover" required>
                </div>

                <div class="form-group">
                    <label for="reg-password">Password</label>
                    <input type="password" id="reg-password" name="password" placeholder="Create a password" required>
                </div>

                <button type="submit" class="btn btn-secondary" style="width: 100%; margin-top: 10px; padding: 14px;">
                    Create Account &rarr;
                </button>
            </form>
        </div>
    </div>
</main>

<?php include ('includes/footer.php'); ?>
<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$login_status = $_SESSION['login_status'] ?? 0;
$name = $_SESSION['name'] ?? '';
$role = $_SESSION['role'] ?? 0;

$cart_count = 0;
if (isset($_SESSION['cart']) && is_array($_SESSION['cart'])) {
    $cart_count = count($_SESSION['cart']);
}

$current_page = basename($_SERVER['PHP_SELF']);
?>

<body>
<header class="navbar-header">
    <div class="navbar-container">
        <!-- Cat Paw / Pet Logo -->
        <a href="index.php" class="nav-brand">
            <div class="brand-icon">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M12 2C10.5 2 9.5 3.5 9.5 5C9.5 6.5 10.5 8 12 8C13.5 8 14.5 6.5 14.5 5C14.5 3.5 13.5 2 12 2ZM6.5 5C5 5 4 6.5 4 8C4 9.5 5 11 6.5 11C8 11 9 9.5 9 8C9 6.5 8 5 6.5 5ZM17.5 5C16 5 15 6.5 15 8C15 9.5 16 11 17.5 11C19 11 20 9.5 20 8C20 6.5 19 5 17.5 5ZM12 10C8.5 10 5 13 5 16.5C5 19.5 8 22 12 22C16 22 19 19.5 19 16.5C19 13.5 15.5 10 12 10Z"/>
                </svg>
            </div>
            <span class="brand-title">Silly Sanctuary</span>
        </a>

        <!-- Mobile Controls & Hamburger Toggle -->
        <div class="nav-mobile-actions">
            <!-- Mobile Cart Pill -->
            <a href="show_cart.php" class="cart-pill cart-pill-mobile" title="View Reservation Cart">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/>
                </svg>
                <?php if ($cart_count > 0): ?>
                    <span class="cart-count"><?= $cart_count ?></span>
                <?php endif; ?>
            </a>

            <!-- Hamburger Button -->
            <button class="nav-toggle" aria-label="Toggle Navigation Menu" aria-expanded="false">
                <span class="hamburger-bar"></span>
                <span class="hamburger-bar"></span>
                <span class="hamburger-bar"></span>
            </button>
        </div>

        <!-- Collapsible Mobile & Desktop Navigation Wrapper -->
        <div class="nav-collapse">
            <!-- Navigation Links -->
            <ul class="nav-menu">
                <li class="nav-item">
                    <a href="index.php" class="<?= ($current_page == 'index.php' || $current_page == '') ? 'active' : '' ?>">Home</a>
                </li>
                <li class="nav-item">
                    <a href="browse.php" class="<?= ($current_page == 'browse.php' || $current_page == 'animal_details.php') ? 'active' : '' ?>">Browse Pets</a>
                </li>
                <?php if ($login_status == 1 && !empty($_SESSION['user_id'])): ?>
                    <li class="nav-item">
                        <a href="my_reservations.php" class="<?= ($current_page == 'my_reservations.php') ? 'active' : '' ?>">My Applications</a>
                    </li>
                <?php endif; ?>
                <?php if ($login_status == 1 && $role == 1): ?>
                    <li class="nav-item">
                        <a href="manage_reservations.php" class="<?= ($current_page == 'manage_reservations.php') ? 'active' : '' ?>">Manage Applications</a>
                    </li>
                <?php endif; ?>
                <li class="nav-item">
                    <a href="contact.php" class="<?= ($current_page == 'contact.php') ? 'active' : '' ?>">Contact Us</a>
                </li>
            </ul>

            <!-- User Controls -->
            <div class="nav-user-controls">
                <!-- Desktop Cart Pill -->
                <a href="show_cart.php" class="cart-pill cart-pill-desktop" title="View Reservation Cart">
                    <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zM1 2v2h2l3.6 7.59-1.35 2.45c-.16.28-.25.61-.25.96 0 1.1.9 2 2 2h12v-2H7.42c-.14 0-.25-.11-.25-.25l.03-.12.9-1.63h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49c.08-.14.12-.31.12-.48 0-.55-.45-1-1-1H5.21l-.94-2H1zm16 16c-1.1 0-1.99.9-1.99 2s.89 2 1.99 2 2-.9 2-2-.9-2-2-2z"/>
                    </svg>
                    <?php if ($cart_count > 0): ?>
                        <span class="cart-count"><?= $cart_count ?></span>
                    <?php endif; ?>
                </a>

                <!-- User Auth Status -->
                <?php if ($login_status == 1 && !empty($_SESSION['user_id'])): ?>
                    <div class="user-profile-container <?= ($role == 1) ? 'is-admin' : '' ?>">
                        <?php if ($role == 1): ?>
                            <span class="badge-admin-overlay">ADMIN MODE</span>
                        <?php endif; ?>
                        <span class="user-welcome">Welcome, <strong class="user-name"><?= htmlspecialchars($name) ?></strong></span>
                    </div>
                    <a href="logout.php" class="btn btn-secondary nav-auth-btn" style="padding: 6px 14px; font-size: 0.85rem;">Log Out</a>
                <?php else: ?>
                    <a href="loginform.php" class="btn btn-primary nav-auth-btn" style="padding: 8px 18px; font-size: 0.95rem;">Sign In</a>
                <?php endif; ?>
            </div>
        </div>
    </div>
</header>
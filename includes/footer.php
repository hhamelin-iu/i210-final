<footer class="site-footer">
    <div class="container">
        <div class="footer-grid">
            <div class="footer-col">
                <div class="nav-brand" style="margin-bottom: 12px;">
                    <div class="brand-icon" style="width: 34px; height: 34px;">
                        <svg viewBox="0 0 24 24" fill="#0a0518" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12 2C10.5 2 9.5 3.5 9.5 5C9.5 6.5 10.5 8 12 8C13.5 8 14.5 6.5 14.5 5C14.5 3.5 13.5 2 12 2ZM6.5 5C5 5 4 6.5 4 8C4 9.5 5 11 6.5 11C8 11 9 9.5 9 8C9 6.5 8 5 6.5 5ZM17.5 5C16 5 15 6.5 15 8C15 9.5 16 11 17.5 11C19 11 20 9.5 20 8C20 6.5 19 5 17.5 5ZM12 10C8.5 10 5 13 5 16.5C5 19.5 8 22 12 22C16 22 19 19.5 19 16.5C19 13.5 15.5 10 12 10Z"/>
                        </svg>
                    </div>
                    <span class="brand-title" style="font-size: 1.2rem;">Silly Sanctuary</span>
                </div>
                <p style="color: var(--text-muted); font-size: 0.875rem; line-height: 1.6;">
                    Connecting loving owners with unique and extraordinary companions. Built with PHP 8+, MariaDB, & modern web standards.
                </p>
            </div>
            
            <div class="footer-col">
                <h4>Quick Navigation</h4>
                <ul class="footer-links">
                    <li><a href="index.php">Home</a></li>
                    <li><a href="browse.php">Browse Pets</a></li>
                    <li><a href="show_cart.php">Reservation Cart</a></li>
                    <li><a href="contact.php">Contact Us</a></li>
                </ul>
            </div>

            <div class="footer-col">
                <h4>Account & Portal</h4>
                <ul class="footer-links">
                    <?php if (isset($_SESSION['login_status']) && $_SESSION['login_status'] != 0): ?>
                        <li><a href="logout.php">Log Out (<?= htmlspecialchars($_SESSION['name'] ?? '') ?>)</a></li>
                    <?php else: ?>
                        <li><a href="loginform.php">Sign In</a></li>
                        <li><a href="register.php">Create Account</a></li>
                    <?php endif; ?>
                </ul>
            </div>
        </div>
        
        <div class="footer-bottom">
            <p>&copy; <?= date('Y') ?> Haven Hamelin — Silly Sanctuary</p>
        </div>
    </div>
</footer>
</body>
</html>

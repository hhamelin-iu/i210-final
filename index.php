<?php
// Authors: Haven Hamelin
$page_title = "Silly Sanctuary";
include ('includes/header.php');
include_once ('includes/alert.php');
?>
    <link rel="stylesheet" href="www/css/index.css">
    <link rel="stylesheet" href="www/css/browse.css">
</head>
<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <!-- Unified Taller Hero Section with hero.jpg Background -->
    <section class="hero-section">
        <div class="badge badge-green hero-badge">
            <span>SILLY SANCTUARY PET ADOPTION</span>
        </div>
        <h1 class="hero-title">Find Your Perfect Pet Companion</h1>
        <p class="hero-subtitle">
            Welcome to our local pet sanctuary. Browse our roster of adoptable cats, dogs, and unique companions, learn about their personalities, and reserve your new best friend today.
        </p>
        <div class="hero-actions">
            <a href="browse.php" class="btn btn-primary" style="padding: 14px 34px; font-size: 1.1rem;">
                Browse Pet Roster &rarr;
            </a>
            <?php if (!isset($_SESSION['login_status']) || $_SESSION['login_status'] == 0): ?>
                <a href="register.php" class="btn btn-secondary" style="padding: 14px 28px; font-size: 1.1rem;">
                    Create Free Account
                </a>
            <?php endif; ?>
        </div>

        <!-- Feature Cards Nested Inside Taller Hero Container -->
        <div class="features-grid">
            <div class="glass-card feature-card">
                <div class="feature-tag">LOCAL SANCTUARY</div>
                <h3>Wholesome Companions</h3>
                <p>Discover wonderful pets of all shapes and sizes looking for loving homes and lifelong owners.</p>
            </div>
            <div class="glass-card feature-card">
                <div class="feature-tag">PERSONALITY PROFILES</div>
                <h3>Detailed Pet History</h3>
                <p>Every pet profile includes age, behavior notes, and background history to help you find your match.</p>
            </div>
            <div class="glass-card feature-card">
                <div class="feature-tag">EASY RESERVATION</div>
                <h3>Simple Adoption Process</h3>
                <p>Add your favorite pets directly to your reservation cart and complete your adoption request in seconds.</p>
            </div>
        </div>
    </section>

    <!-- Recent Featured Pets -->
    <?php
    include_once ('includes/config.php');
    include_once ('includes/connect.php');

    if (isset($conn) && !$conn->connect_error) {
        $sql = "
            SELECT pets.*, animal_types.type_name, breeds.breed_name 
            FROM pets
            LEFT JOIN animal_types ON pets.animal = animal_types.id
            LEFT JOIN breeds ON pets.breed = breeds.id
            ORDER BY pets.id DESC
            LIMIT 3
        ";
        $result = $conn->query($sql);
        if ($result && $result->num_rows > 0):
    ?>
    <section style="margin-top: 50px;">
        <div class="featured-header">
            <div>
                <span class="badge badge-accent">Featured Roster</span>
                <h2 style="font-size: 2rem; margin-top: 8px; color: var(--neon-cyan);">Recently Listed Pets</h2>
            </div>
            <a href="browse.php" class="btn btn-secondary" style="font-size: 0.95rem;">View Full Catalog &rarr;</a>
        </div>

        <div class="animal-grid">
            <?php while ($row = $result->fetch_assoc()): ?>
                <div class="animal-card">
                    <?php if (isset($role) && $role == 1): ?>
                        <a class="edit-button" href="edit.php?id=<?= $row['id'] ?>" title="Edit Entry">
                            <div class="edit-icon"></div>
                        </a>
                    <?php endif; ?>
                    <a href="animal_details.php?id=<?= $row['id'] ?>">
                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['name']) ?>">
                        <div class="animal-card-body">
                            <div style="display: flex; gap: 6px; margin-bottom: 8px; justify-content: center; flex-wrap: wrap;">
                                <span class="badge badge-accent"><?= htmlspecialchars($row['type_name'] ?? 'Pet') ?></span>
                                <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Unknown') ?></span>
                            </div>
                            <h2><?= htmlspecialchars($row['name']) ?></h2>
                            <p class="animal-card-desc"><?= htmlspecialchars(substr($row['description'], 0, 90)) ?>...</p>
                            <div style="margin-top: 12px; display: flex; align-items: center; justify-content: space-between; font-size: 0.85rem; color: var(--neon-cyan);">
                                <span>Age: <strong><?= htmlspecialchars($row['age']) ?> yrs</strong></span>
                                <strong>View Profile &rarr;</strong>
                            </div>
                        </div>
                    </a>
                </div>
            <?php endwhile; ?>
        </div>
    </section>
    <?php 
        endif;
    } 
    ?>
</main>

<?php include ('includes/footer.php'); ?>
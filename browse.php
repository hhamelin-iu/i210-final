<?php
$page_title = "Browse Pets - Silly Sanctuary";
include ('includes/header.php');
include_once ('includes/alert.php');
?>
    <link rel="stylesheet" href="www/css/browse.css">
</head>
<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container browse-container">
    <!-- Browse Header with Spaceship Corridor Background -->
    <div class="browse-hero-header">
        <span class="badge badge-accent">Adoptable Roster</span>
        <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">Find Your New Best Friend</h1>
        <p style="color: #e2e8f0; max-width: 550px; margin: 0 auto;">
            Search adoptable pets by name, behavior, animal type, or breed.
        </p>

        <!-- Search Form -->
        <div class="search-container">
            <form action="browse.php" method="get" class="search-form">
                <input type="text" name="terms" placeholder="Search pets..." value="<?= htmlspecialchars($_GET['terms'] ?? '') ?>" />
                <button type="submit" class="btn btn-primary" style="padding: 0 26px;">Search Pets</button>
                <?php if (!empty($_GET['terms'])): ?>
                    <a href="browse.php" class="btn btn-secondary">Clear Search</a>
                <?php endif; ?>
            </form>
        </div>
    </div>

    <?php
    include_once ('includes/config.php');
    include_once ('includes/connect.php');

    $search_terms = trim($_GET['terms'] ?? '');

    if (isset($conn) && !$conn->connect_error) {
        if (!empty($search_terms)) {
            $sql = "
                SELECT pets.*, animal_types.type_name, breeds.breed_name 
                FROM pets
                LEFT JOIN animal_types ON pets.animal = animal_types.id
                LEFT JOIN breeds ON pets.breed = breeds.id
                WHERE pets.name LIKE ? 
                OR pets.description LIKE ?
                OR pets.behavior LIKE ?
                OR animal_types.type_name LIKE ?
                OR breeds.breed_name LIKE ?
                ORDER BY pets.id DESC
            ";
            $stmt = $conn->prepare($sql);
            $like_term = '%' . $search_terms . '%';
            $stmt->bind_param("sssss", $like_term, $like_term, $like_term, $like_term, $like_term);
            $stmt->execute();
            $result = $stmt->get_result();
        } else {
            $sql = "
                SELECT pets.*, animal_types.type_name, breeds.breed_name 
                FROM pets
                LEFT JOIN animal_types ON pets.animal = animal_types.id
                LEFT JOIN breeds ON pets.breed = breeds.id
                ORDER BY pets.id DESC
            ";
            $result = $conn->query($sql);
        }

        if ($result && $result->num_rows > 0) {
            echo "<div class='animal-grid'>";
            while ($row = $result->fetch_assoc()) {
                ?>
                <div class="animal-card">
                    <?php if (isset($role) && $role == 1): ?>
                        <a class="edit-button" href="edit.php?id=<?= $row['id'] ?>" title="Edit Entry">
                            <div class="edit-icon"></div>
                        </a>
                    <?php endif; ?>
                    <a href="animal_details.php?id=<?= $row['id'] ?>">
                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['name']) ?>">
                        <div class="animal-card-body">
                            <div style="display: flex; gap: 6px; margin-bottom: 8px; flex-wrap: wrap;">
                                <span class="badge badge-accent"><?= htmlspecialchars($row['type_name'] ?? 'Pet') ?></span>
                                <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Unknown') ?></span>
                            </div>
                            <h2><?= htmlspecialchars($row['name']) ?></h2>
                            <p class="animal-card-desc"><?= htmlspecialchars(substr($row['description'], 0, 95)) ?>...</p>
                            <div style="margin-top: 12px; display: flex; align-items: center; justify-content: space-between; font-size: 0.85rem; color: var(--neon-cyan);">
                                <span>Age: <strong><?= htmlspecialchars($row['age']) ?> yrs</strong></span>
                                <span style="color: var(--neon-green); font-weight: bold;">View Profile &rarr;</span>
                            </div>
                        </div>
                    </a>
                </div>
                <?php
            }

            if (isset($role) && $role == 1) {
                ?>
                <a href="add_new.php" class="add-new-card" style="text-decoration: none;">
                    <div class="plus-btn">
                        <div class="plus-icon">+</div>
                        <span>Add New Pet</span>
                    </div>
                </a>
                <?php
            }
            echo "</div>";
        } else {
            ?>
            <div class="empty-state">
                <div class="empty-state-title">No Pets Found</div>
                <div class="empty-state-desc">
                    We couldn't find any pets matching "<strong><?= htmlspecialchars($search_terms) ?></strong>". Try searching for different keywords.
                </div>
                <a href="browse.php" class="btn btn-secondary">Reset Search</a>
            </div>
            <?php
        }
    } else {
        ?>
        <div class="empty-state">
            <div class="empty-state-title">Database Offline</div>
            <div class="empty-state-desc">Unable to query the pet database right now. Please check back shortly.</div>
        </div>
        <?php
    }
    ?>
</main>

<?php include ('includes/footer.php'); ?>

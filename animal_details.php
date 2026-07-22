<?php
include_once ('includes/config.php');
include_once ('includes/connect.php');

$pet = null;
$error_msg = null;

if (isset($_GET['id'])) {
    $id = intval($_GET['id']);

    if (isset($conn) && !$conn->connect_error) {
        $sql = "SELECT pets.*, animal_types.type_name, breeds.breed_name
                FROM pets
                LEFT JOIN animal_types ON pets.animal = animal_types.id
                LEFT JOIN breeds ON pets.breed = breeds.id
                WHERE pets.id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            $pet = $result->fetch_assoc();
        } else {
            $error_msg = "Selected pet could not be found in our adoption roster.";
        }
        $stmt->close();
    } else {
        $error_msg = "Database error. Please try again later.";
    }
} else {
    $error_msg = "No pet selected for detailed viewing.";
}

$page_title = $pet ? htmlspecialchars($pet['name']) . " - Pet Profile" : "Pet Profile Error";
include ('includes/header.php');
include_once ('includes/alert.php');
?>
    <link rel="stylesheet" href="www/css/animal_details.css">
</head>
<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <a href="browse.php" class="breadcrumb-link">&larr; Back to Pet Catalog</a>

    <?php if ($pet): ?>
        <div class="details-wrapper">
            <!-- Image Showcase -->
            <div class="details-image-container">
                <img src="<?= htmlspecialchars($pet['photo']); ?>" alt="<?= htmlspecialchars($pet['name']); ?>">
            </div>

            <!-- Profile Details -->
            <div class="glass-card details-info">
                <div>
                    <div class="attribute-list">
                        <span class="badge badge-accent"><?= htmlspecialchars($pet['type_name'] ?? 'Pet'); ?></span>
                        <span class="badge badge-gold"><?= htmlspecialchars($pet['breed_name'] ?? 'Breed'); ?></span>
                        <span class="badge badge-green"><?= htmlspecialchars($pet['age']); ?> years old</span>
                    </div>
                    <h1 class="details-header-title"><?= htmlspecialchars($pet['name']); ?></h1>
                </div>

                <div>
                    <div class="details-section-title">BEHAVIOR & TEMPERAMENT</div>
                    <p class="details-text" style="color: var(--neon-yellow); font-weight: 600;">
                        <?= htmlspecialchars($pet['behavior']); ?>
                    </p>
                </div>

                <div>
                    <div class="details-section-title">PROFILE DESCRIPTION</div>
                    <p class="details-text">
                        <?= nl2br(htmlspecialchars($pet['description'])); ?>
                    </p>
                </div>

                <div style="margin-top: 10px; display: flex; gap: 16px; align-items: center; flex-wrap: wrap;">
                    <a href="add_to_cart.php?id=<?= $pet['id'] ?>" class="btn btn-primary" style="padding: 14px 30px;">
                        Reserve <?= htmlspecialchars($pet['name']); ?> &rarr;
                    </a>
                    <?php if (isset($role) && $role == 1): ?>
                        <a href="edit.php?id=<?= $pet['id'] ?>" class="btn btn-secondary">
                            Edit Entry
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>
    <?php else: ?>
        <div class="empty-state">
            <div class="empty-state-title">Pet Not Found</div>
            <div class="empty-state-desc"><?= htmlspecialchars($error_msg); ?></div>
            <a href="browse.php" class="btn btn-primary">Return to Catalog</a>
        </div>
    <?php endif; ?>
</main>

<?php include ('includes/footer.php'); ?>

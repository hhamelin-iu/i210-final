<?php
include_once ('includes/config.php');
include_once ('includes/connect.php');

$pet = null;
$error_msg = null;
$similar_pets = [];

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

            // Fetch 4 similar pets (same animal type or breed, available status)
            $stmt_sim = $conn->prepare("
                SELECT pets.id, pets.name, pets.photo, pets.age, animal_types.type_name, breeds.breed_name
                FROM pets
                LEFT JOIN animal_types ON pets.animal = animal_types.id
                LEFT JOIN breeds ON pets.breed = breeds.id
                WHERE (pets.animal = ? OR pets.breed = ?) AND pets.id != ? AND pets.status = 'Available'
                ORDER BY RAND() LIMIT 4
            ");
            $stmt_sim->bind_param("iii", $pet['animal'], $pet['breed'], $id);
            $stmt_sim->execute();
            $sim_res = $stmt_sim->get_result();
            if ($sim_res) {
                while ($r = $sim_res->fetch_assoc()) $similar_pets[] = $r;
            }
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
    <style>
        .badge-status-available { background: rgba(34, 197, 94, 0.2); color: #4ade80; border: 1px solid #4ade80; }
        .badge-status-reserved { background: rgba(234, 179, 8, 0.2); color: #facc15; border: 1px solid #facc15; }
        .badge-status-adopted { background: rgba(6, 182, 212, 0.2); color: #38bdf8; border: 1px solid #38bdf8; }

        .similar-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            gap: 16px;
            margin-top: 16px;
        }

        .similar-card {
            background: var(--bg-surface);
            border: 1px solid var(--border-color);
            border-radius: 12px;
            overflow: hidden;
            text-decoration: none;
            transition: transform 0.2s ease, border-color 0.2s ease;
        }

        .similar-card:hover {
            transform: translateY(-4px);
            border-color: var(--neon-cyan);
        }

        .similar-card img {
            width: 100%;
            height: 140px;
            object-fit: cover;
        }

        .similar-card-body {
            padding: 12px;
        }
    </style>
</head>
<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <a href="browse.php" class="breadcrumb-link">&larr; Back to Pet Catalog</a>

    <?php if ($pet): 
        $status = $pet['status'] ?? 'Available';
        $status_class = 'badge-status-available';
        if ($status === 'Reserved') $status_class = 'badge-status-reserved';
        elseif ($status === 'Adopted') $status_class = 'badge-status-adopted';
    ?>
        <div class="details-wrapper">
            <!-- Image Showcase -->
            <div class="details-image-container">
                <img src="<?= htmlspecialchars($pet['photo']); ?>" alt="<?= htmlspecialchars($pet['name']); ?>">
            </div>

            <!-- Profile Details -->
            <div class="glass-card details-info">
                <div>
                    <div class="attribute-list">
                        <span class="badge badge-gold"><?= htmlspecialchars($pet['breed_name'] ?? 'Breed'); ?></span>
                        <span class="badge badge-green"><?= htmlspecialchars($pet['age']); ?> years old</span>
                        <span class="badge <?= $status_class ?>"><?= htmlspecialchars($status); ?></span>
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
                    <?php if ($status === 'Available'): ?>
                        <a href="add_to_cart.php?id=<?= $pet['id'] ?>" class="btn btn-primary" style="padding: 14px 30px;">
                            Reserve <?= htmlspecialchars($pet['name']); ?> &rarr;
                        </a>
                    <?php else: ?>
                        <button class="btn btn-secondary" disabled style="opacity: 0.6; cursor: not-allowed; padding: 14px 30px;">
                            Currently <?= htmlspecialchars($status) ?>
                        </button>
                    <?php endif; ?>

                    <?php if (isset($role) && $role == 1): ?>
                        <a href="edit.php?id=<?= $pet['id'] ?>" class="btn btn-secondary">
                            Edit Entry
                        </a>
                    <?php endif; ?>
                </div>
            </div>
        </div>

        <!-- Similar Pets Section -->
        <?php if (!empty($similar_pets)): ?>
            <div style="margin-top: 50px;">
                <h3 style="color: var(--neon-cyan); font-family: var(--font-heading); font-size: 1.5rem; margin-bottom: 12px;">Similar Adoptable Companions</h3>
                <div class="similar-grid">
                    <?php foreach ($similar_pets as $sim): ?>
                        <a href="animal_details.php?id=<?= $sim['id'] ?>" class="similar-card">
                            <img src="<?= htmlspecialchars($sim['photo']) ?>" alt="<?= htmlspecialchars($sim['name']) ?>">
                            <div class="similar-card-body">
                                <div style="display: flex; gap: 4px; margin-bottom: 4px;">
                                    <span class="badge badge-gold" style="font-size: 0.7rem; padding: 2px 6px;"><?= htmlspecialchars($sim['breed_name'] ?? 'Breed') ?></span>
                                </div>
                                <strong style="color: var(--text-main); font-size: 1.05rem; font-family: var(--font-heading);"><?= htmlspecialchars($sim['name']) ?></strong>
                                <div style="font-size: 0.8rem; color: var(--neon-cyan); margin-top: 4px;"><?= htmlspecialchars($sim['age']) ?> yrs old</div>
                            </div>
                        </a>
                    <?php endforeach; ?>
                </div>
            </div>
        <?php endif; ?>

    <?php else: ?>
        <div class="empty-state">
            <div class="empty-state-title">Pet Not Found</div>
            <div class="empty-state-desc"><?= htmlspecialchars($error_msg); ?></div>
            <a href="browse.php" class="btn btn-primary">Return to Catalog</a>
        </div>
    <?php endif; ?>
</main>

<?php include ('includes/footer.php'); ?>

<?php
$page_title = "Add New Pet Entry - Admin Mode";
include ('includes/header.php');
include_once ('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$login_status = $_SESSION['login_status'] ?? 0;
$role = $_SESSION['role'] ?? 0;
if ($login_status != 1 || $role != 1) {
    set_alert("Admin privileges required to add pet entries.", "error");
    header("Location: browse.php");
    exit();
}

include('includes/config.php');
include('includes/connect.php');

$animal_types = [];
if (isset($conn) && !$conn->connect_error) {
    $animal_types_query = "SELECT id, type_name FROM animal_types";
    if ($result = $conn->query($animal_types_query)) {
        while ($row = $result->fetch_assoc()) {
            $animal_types[] = $row;
        }
        $result->free();
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = trim($_POST['name'] ?? '');
    $animal = intval($_POST['animal'] ?? 0);
    $breed = intval($_POST['breed'] ?? 0);
    $age = intval($_POST['age'] ?? 0);
    $description = trim($_POST['description'] ?? '');
    $behavior = trim($_POST['behavior'] ?? '');

    $upload_dir = 'img/animals/';
    $photo = 'img/animals/bleemk.png';

    if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
        $tmp_name = $_FILES['photo']['tmp_name'];
        $original_name = basename($_FILES['photo']['name']);
        $target_path = $upload_dir . time() . '_' . preg_replace("/[^a-zA-Z0-9\._-]/", "", $original_name);

        if (move_uploaded_file($tmp_name, $target_path)) {
            $photo = $target_path;
        }
    }

    if (!empty($name) && $animal > 0 && $breed > 0) {
        $stmt = $conn->prepare("INSERT INTO pets (name, animal, breed, age, description, behavior, photo) VALUES (?, ?, ?, ?, ?, ?, ?)");
        $stmt->bind_param("siissss", $name, $animal, $breed, $age, $description, $behavior, $photo);

        if ($stmt->execute()) {
            set_alert("New pet '$name' added successfully!", "success");
            header("Location: browse.php");
            exit();
        } else {
            set_alert("Error adding pet: " . $stmt->error, "error");
        }
        $stmt->close();
    } else {
        set_alert("All required pet entry fields must be filled.", "warning");
    }
}
?>
    <link rel="stylesheet" href="www/css/edit.css">
    <script src="www/js/updateBreeds.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            initializeBreedUpdater('animal', 'breed');
        });
    </script>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <a href="browse.php" class="breadcrumb-link">&larr; Back to Pet Catalog</a>

    <div class="glass-card admin-form-card">
        <div style="margin-bottom: 24px;">
            <span class="badge badge-admin">ADMIN PORTAL</span>
            <h1 style="font-size: 2.2rem; margin-top: 6px; color: var(--neon-pink);">Add New Pet Entry</h1>
        </div>

        <form action="add_new.php" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Pet Name *</label>
                <input type="text" id="name" name="name" placeholder="e.g. Bleemk or Zim Zorp" required>
            </div>

            <div class="form-grid-2col" style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                <div class="form-group">
                    <label for="animal">Animal Type *</label>
                    <select id="animal" name="animal" required>
                        <option value="">Select Type</option>
                        <?php foreach ($animal_types as $type): ?>
                            <option value="<?= $type['id'] ?>"><?= htmlspecialchars($type['type_name']) ?></option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="breed">Breed *</label>
                    <select id="breed" name="breed" required>
                        <option value="">Select Breed</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="age">Age (Years) *</label>
                <input type="number" id="age" name="age" min="0" max="100" value="1" required>
            </div>

            <div class="form-group">
                <label for="behavior">Behavior & Temperament *</label>
                <input type="text" id="behavior" name="behavior" placeholder="e.g. Energetic, Loud, Brooding, Friendly" required>
            </div>

            <div class="form-group">
                <label for="description">Profile Description & History *</label>
                <textarea id="description" name="description" rows="4" placeholder="Enter pet description and history..." required></textarea>
            </div>

            <div class="form-group">
                <label for="photo">Photo Upload *</label>
                <input type="file" id="photo" name="photo" accept="image/*" required>
            </div>

            <div class="action-bar">
                <button type="submit" class="btn btn-primary" style="flex: 1; padding: 14px;">Add Pet Entry &rarr;</button>
                <a href="browse.php" class="btn btn-secondary">Cancel</a>
            </div>
        </form>
    </div>
</main>

<?php include ('includes/footer.php'); ?>

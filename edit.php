<?php
$page_title = "Edit Pet Entry - Admin Mode";
include ('includes/header.php');
include_once ('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$role = $_SESSION['role'] ?? 0;
if ($role != 1) {
    set_alert("Admin privileges required to edit pet entries.", "error");
    header("Location: browse.php");
    exit();
}

include('includes/config.php');
include('includes/connect.php');

$id = isset($_GET['id']) ? intval($_GET['id']) : 0;
if ($id <= 0) {
    set_alert("Invalid pet ID specified.", "error");
    header("Location: browse.php");
    exit();
}

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

$pet = null;
$stmt = $conn->prepare("SELECT * FROM pets WHERE id = ?");
$stmt->bind_param("i", $id);
$stmt->execute();
$res = $stmt->get_result();
if ($res && $res->num_rows > 0) {
    $pet = $res->fetch_assoc();
} else {
    set_alert("Pet record not found.", "error");
    header("Location: browse.php");
    exit();
}
$stmt->close();

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete_action'])) {
        $del_stmt = $conn->prepare("DELETE FROM pets WHERE id = ?");
        $del_stmt->bind_param("i", $id);
        if ($del_stmt->execute()) {
            set_alert("Pet entry deleted from roster.", "info");
            header("Location: browse.php");
            exit();
        } else {
            set_alert("Error deleting pet entry: " . $del_stmt->error, "error");
        }
        $del_stmt->close();
    } else {
        $name = trim($_POST['name'] ?? '');
        $animal = intval($_POST['animal'] ?? 0);
        $breed = intval($_POST['breed'] ?? 0);
        $age = intval($_POST['age'] ?? 0);
        $description = trim($_POST['description'] ?? '');
        $behavior = trim($_POST['behavior'] ?? '');

        $photo = $pet['photo'];
        if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
            $tmp_name = $_FILES['photo']['tmp_name'];
            $original_name = basename($_FILES['photo']['name']);
            $target_path = 'img/animals/' . time() . '_' . preg_replace("/[^a-zA-Z0-9\._-]/", "", $original_name);

            if (move_uploaded_file($tmp_name, $target_path)) {
                $photo = $target_path;
            }
        }

        $up_stmt = $conn->prepare("UPDATE pets SET name = ?, animal = ?, breed = ?, age = ?, description = ?, behavior = ?, photo = ? WHERE id = ?");
        $up_stmt->bind_param("siissssi", $name, $animal, $breed, $age, $description, $behavior, $photo, $id);

        if ($up_stmt->execute()) {
            set_alert("Pet '$name' updated successfully!", "success");
            header("Location: animal_details.php?id=$id");
            exit();
        } else {
            set_alert("Error updating record: " . $up_stmt->error, "error");
        }
        $up_stmt->close();
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
    <a href="animal_details.php?id=<?= $id ?>" class="breadcrumb-link">&larr; Back to Pet Profile</a>

    <div class="glass-card admin-form-card">
        <div style="margin-bottom: 24px;">
            <span class="badge badge-admin">ADMIN PORTAL</span>
            <h1 style="font-size: 2.2rem; margin-top: 6px; color: var(--neon-pink);">Edit Pet Entry: <?= htmlspecialchars($pet['name']) ?></h1>
        </div>

        <form action="edit.php?id=<?= $id ?>" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Pet Name *</label>
                <input type="text" id="name" name="name" value="<?= htmlspecialchars($pet['name']) ?>" required>
            </div>

            <div class="form-grid-2col" style="display: grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                <div class="form-group">
                    <label for="animal">Animal Type *</label>
                    <select id="animal" name="animal" required>
                        <option value="">Select Type</option>
                        <?php foreach ($animal_types as $type): ?>
                            <option value="<?= $type['id'] ?>" <?= $pet['animal'] == $type['id'] ? 'selected' : '' ?>>
                                <?= htmlspecialchars($type['type_name']) ?>
                            </option>
                        <?php endforeach; ?>
                    </select>
                </div>

                <div class="form-group">
                    <label for="breed">Breed *</label>
                    <select id="breed" name="breed" data-selected-breed="<?= htmlspecialchars($pet['breed']) ?>" required>
                        <option value="">Select Breed</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="age">Age (Years) *</label>
                <input type="number" id="age" name="age" min="0" max="100" value="<?= htmlspecialchars($pet['age']) ?>" required>
            </div>

            <div class="form-group">
                <label for="behavior">Behavior & Temperament *</label>
                <input type="text" id="behavior" name="behavior" value="<?= htmlspecialchars($pet['behavior']) ?>" required>
            </div>

            <div class="form-group">
                <label for="description">Profile Description & History *</label>
                <textarea id="description" name="description" rows="4" required><?= htmlspecialchars($pet['description']) ?></textarea>
            </div>

            <div class="form-group">
                <label>Current Photo</label>
                <div class="photo-preview-box">
                    <img src="<?= htmlspecialchars($pet['photo']) ?>" alt="<?= htmlspecialchars($pet['name']) ?>" class="current-photo-thumb">
                    <div class="file-input-wrapper">
                        <label for="photo">Update Photo (Optional)</label>
                        <input type="file" id="photo" name="photo" accept="image/*">
                    </div>
                </div>
            </div>

            <div class="action-bar">
                <button type="submit" name="update_action" class="btn btn-primary" style="flex: 1; padding: 14px;">Save Changes &rarr;</button>
                <button type="submit" name="delete_action" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this pet entry?');">Delete Pet Entry</button>
            </div>
        </form>
    </div>
</main>

<?php include ('includes/footer.php'); ?>

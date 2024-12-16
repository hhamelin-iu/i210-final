<?php
$page_title = "Edit Entry";
include ('includes/header.php');?>
    <link rel="stylesheet" href="www/css/edit.css">
    <script src="www/js/updateBreeds.js"></script>
    <script>
        document.addEventListener('DOMContentLoaded', () => {
            initializeBreedUpdater('animal', 'breed');
        });
    </script>
</head>

<?php
include('includes/config.php');
include('includes/connect.php');

// Fetch animal types
$animal_types = [];
$animal_types_query = "SELECT id, type_name FROM animal_types";
if ($result = $conn->query($animal_types_query)) {
    while ($row = $result->fetch_assoc()) {
        $animal_types[] = $row;
    }
    $result->free();
}

// Fetch the pet data for editing
$pet = null;
if (isset($_GET['id'])) {
    $id = intval($_GET['id']);
    $stmt = $conn->prepare("SELECT * FROM pets WHERE id = ?");
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows > 0) {
        $pet = $result->fetch_assoc();
    } else {
        die("Pet not found.");
    }
    $stmt->close();
} else {
    die("No pet ID specified.");
}

// Handle form submission for updates
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['delete'])) {
        // Delete the pet entry
        $stmt = $conn->prepare("DELETE FROM pets WHERE id = ?");
        $stmt->bind_param("i", $id);
        if ($stmt->execute()) {
            echo "Pet entry deleted successfully.";
            header("Location: browse.php"); // Redirect to browse.php
            exit();
        } else {
            echo "Error deleting pet: " . $stmt->error;
        }
        $stmt->close();
    } else {
        $name = $_POST['name'] ?? '';
        $animal = $_POST['animal'] ?? '';
        $breed = $_POST['breed'] ?? '';
        $age = $_POST['age'] ?? '';
        $description = $_POST['description'] ?? '';
        $behavior = $_POST['behavior'] ?? '';

        // Handle file upload
        $upload_dir = 'www/img/animals/';
        $photo = $pet['photo']; // Retain current photo by default

        if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
            $tmp_name = $_FILES['photo']['tmp_name'];
            $original_name = basename($_FILES['photo']['name']);
            $target_path = $upload_dir . time() . '_' . $original_name;

            if (move_uploaded_file($tmp_name, $target_path)) {
                $photo = $target_path;
            } else {
                echo "Error uploading file.";
            }
        }

        // Update the pet record
        $stmt = $conn->prepare("UPDATE pets SET name = ?, animal = ?, breed = ?, age = ?, description = ?, behavior = ?, photo = ? WHERE id = ?");
        $stmt->bind_param("siissssi", $name, $animal, $breed, $age, $description, $behavior, $photo, $id);

        if ($stmt->execute()) {
            echo "Pet entry updated successfully.";
        } else {
            echo "Error: " . $stmt->error;
        }

        $stmt->close();
    }
}

$conn->close();
?>

<body>
    <h1>Edit Pet Entry</h1>
    <form action="" method="POST" enctype="multipart/form-data">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" value="<?php echo htmlspecialchars($pet['name']); ?>" required><br><br>

        <label for="animal">Animal Type:</label><br>
        <select id="animal" name="animal" required>
            <option value="">Select an animal type</option>
            <?php foreach ($animal_types as $type): ?>
                <option value="<?php echo htmlspecialchars($type['id']); ?>" <?php echo $pet['animal'] == $type['id'] ? 'selected' : ''; ?>>
                    <?php echo htmlspecialchars($type['type_name']); ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>

        <label for="breed">Breed:</label><br>
        <select id="breed" name="breed" data-selected-breed="<?php echo htmlspecialchars($pet['breed'] ?? ''); ?>" required>
            <option value="">Select a breed</option>
        </select><br><br>

        <label for="age">Age:</label><br>
        <input type="number" id="age" name="age" value="<?php echo htmlspecialchars($pet['age']); ?>" required><br><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" required><?php echo htmlspecialchars($pet['description']); ?></textarea><br><br>

        <label for="behavior">Behavior:</label><br>
        <input type="text" id="behavior" name="behavior" value="<?php echo htmlspecialchars($pet['behavior']); ?>" required><br><br>

        <div class="photo-section">
            <p class="current-photo-label">Current Photo:</p>
            <div class="photo-wrapper">
                <img src="<?php echo htmlspecialchars($pet['photo']); ?>" alt="Current Photo" class="current-photo">
                <div class="update-photo">
                    <label for="photo">Update Photo:</label><br>
                    <input type="file" id="photo" name="photo" accept="image/*">
                </div>
            </div>
        </div>

        <div class="button-container">
            <button type="submit">Update Entry</button>
            <form action="" method="POST" onsubmit="return confirm('Are you sure you want to delete this pet?');" style="display: inline;">
                <input type="hidden" name="delete" value="1">
                <button type="submit" style="background-color: red; color: white;">Delete Entry</button>
            </form>
        </div>
    </form>
</body>
</html>

<?php
$page_title = "Add New Entry";
include ('includes/header.php');?>
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

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = $_POST['name'] ?? '';
    $animal = $_POST['animal'] ?? '';
    $breed = $_POST['breed'] ?? '';
    $age = $_POST['age'] ?? '';
    $description = $_POST['description'] ?? '';
    $behavior = $_POST['behavior'] ?? '';

    // Handle file upload
    $upload_dir = 'www/img/animals/';
    $photo = '';

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

    // Prepare and bind
    $stmt = $conn->prepare("INSERT INTO pets (name, animal, breed, age, description, behavior, photo) VALUES (?, ?, ?, ?, ?, ?, ?)");
    $stmt->bind_param("siissss", $name, $animal, $breed, $age, $description, $behavior, $photo);

    if ($stmt->execute()) {
        echo "New entry added successfully.";
    } else {
        echo "Error: " . $stmt->error;
    }

    $stmt->close();
}

$conn->close();
?>

<body>
    <a href="browse.php" class="special-link">&larr; Back to List</a>
    <h1>Add a New Pet Entry</h1>
    <form action="" method="POST" enctype="multipart/form-data">
        <label for="name">Name:</label><br>
        <input type="text" id="name" name="name" required><br><br>

        <label for="animal">Animal Type:</label><br>
        <select id="animal" name="animal" required>
            <option value="">Select an animal type</option>
            <?php foreach ($animal_types as $type): ?>
                <option value="<?php echo htmlspecialchars($type['id']); ?>">
                    <?php echo htmlspecialchars($type['type_name']); ?>
                </option>
            <?php endforeach; ?>
        </select><br><br>

        <label for="breed">Breed:</label><br>
        <select id="breed" name="breed" required>
            <option value="">Select a breed</option>
        </select><br><br>

        <label for="age">Age:</label><br>
        <input type="number" id="age" name="age" required><br><br>

        <label for="description">Description:</label><br>
        <textarea id="description" name="description" required></textarea><br><br>

        <label for="behavior">Behavior:</label><br>
        <input type="text" id="behavior" name="behavior" required><br><br>

        <label for="photo">Photo:</label><br>
        <input type="file" id="photo" name="photo" accept="image/*" required><br><br>

        <button type="submit">Add Entry</button>
    </form>
</body>
</html>

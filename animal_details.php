<?php
include ('includes/config.php');
include('includes/connect.php');

// Check if 'id' is in the URL
if (isset($_GET['id'])) {
    $id = intval($_GET['id']); // Sanitize the 'id' parameter

    // Prepare SQL to get the animal details with joined tables
    $sql = "SELECT pets.name, pets.age, pets.description, pets.behavior, pets.photo, 
                   animal_types.type_name, breeds.breed_name
            FROM pets
            JOIN animal_types ON pets.animal = animal_types.id
            JOIN breeds ON pets.breed = breeds.id
            WHERE pets.id = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("i", $id);
    $stmt->execute();
    $result = $stmt->get_result();

    // Check if the animal exists
    if ($result->num_rows > 0) {
        $pet = $result->fetch_assoc();
    } else {
        die("Pet not found.");
    }
    $stmt->close();
} else {
    die("No pet selected.");
}

$conn->close();
?>

<?php
$page_title = htmlspecialchars($pet['name']) . " - Details";
include ('includes/header.php'); ?>
    <link rel="stylesheet" href="www/css/browse-details.css">
    <link rel="stylesheet" href="www/css/animal_details.css">
</head>
<?php include ('includes/navbar.php'); ?>
    <div class="flex-wrapper">
        <div class="animal-details">
            <h1><?php echo htmlspecialchars($pet['name']); ?></h1>
            <img src="<?= htmlspecialchars($pet['photo']); ?>" alt="<?php echo htmlspecialchars($pet['name']); ?>">
            <div style="display:inline-block">
                <p><strong>Animal:</strong> <?php echo htmlspecialchars($pet['type_name']); ?></p>
                <p><strong>Breed:</strong> <?php echo htmlspecialchars($pet['breed_name']); ?></p>
                <p><strong>Age:</strong> <?php echo htmlspecialchars($pet['age']); ?> years</p>
            </div>
            <a class="special-link" style="display:inline-block; margin-left: 125px;" href="add_to_cart.php?id=<?= $_GET['id'] ?>">Reserve</a>
            <p><strong>Description:</strong> <?php echo htmlspecialchars($pet['description']); ?></p>
            <a href="browse.php" class="special-link">&larr; Back to List</a>
        </div>
    </div>
</body>
</html>

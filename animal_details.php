<?php
    include ('includes/config.php');
    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }

    // Check if 'id' is in the URL
    if (isset($_GET['id'])) {
        $id = intval($_GET['id']); // Sanitize the 'id' parameter

        // Prepare SQL to get the animal details
        $sql = "SELECT * FROM pets WHERE id = ?";
        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $id);
        $stmt->execute();
        $result = $stmt->get_result();

        // Check if the animal exists
        if ($result->num_rows > 0) {
            $animal = $result->fetch_assoc();
        } else {
            die("Animal not found.");
        }
        $stmt->close();
    } else {
        die("No animal selected.");
    }

    $conn->close();
?>

<?php
$page_title = htmlspecialchars($animal['name']) . " - Details";
include ('includes/header.php'); ?>
    <link rel="stylesheet" href="www/css/animal_details.css">
</head>
<?php include ('includes/navbar.php'); ?>
    <div class="animal-details">
        <h1><?php echo htmlspecialchars($animal['name']); ?></h1>
        <img src="<?= 'www/img/animals/' . htmlspecialchars($animal['photo']); ?>" alt="<?php echo htmlspecialchars($animal['name']); ?>">
        <p><strong>Animal:</strong> <?php echo htmlspecialchars($animal['animal']); ?></p>
        <p><strong>Breed:</strong> <?php echo htmlspecialchars($animal['breed']); ?></p>
        <p><strong>Age:</strong> <?php echo htmlspecialchars($animal['age']); ?> years</p>
        <p><strong>Description:</strong> <?php echo htmlspecialchars($animal['description']); ?></p>
        <a href="browse.php" class="back-link">← Back to List</a>
    </div>
</body>
</html>
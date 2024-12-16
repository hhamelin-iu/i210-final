<?php
$page_title = "Browsing";
include ('includes/header.php'); ?>
    <link rel="stylesheet" href="www/css/browse-details.css">
    <link rel="stylesheet" href="www/css/browse.css">
</head>
<?php include ('includes/navbar.php'); ?>
    <h1>Up For Adoption</h1>
    <form action="browse.php" method="get">
        <input type="text" name="terms" size="40" value="<?php echo htmlspecialchars($_GET['terms'] ?? ''); ?>" />&nbsp;&nbsp;
        <input type="submit" name="Submit" id="Submit" value="Search" />
    </form>
    <?php
        include ('includes/config.php');
        include('includes/connect.php');

        // Check if search terms are provided
        $search_terms = $_GET['terms'] ?? '';

        // Base SQL query with JOINs to include animal types and breeds
        $sql = "
            SELECT pets.*, animal_types.type_name, breeds.breed_name 
            FROM pets
            LEFT JOIN animal_types ON pets.animal = animal_types.id
            LEFT JOIN breeds ON pets.breed = breeds.id
        ";

        // Append WHERE clause if search terms exist
        if (!empty($search_terms)) {
            $search_terms = $conn->real_escape_string($search_terms);
            $sql .= "
                WHERE pets.name LIKE '%$search_terms%' 
                OR pets.description LIKE '%$search_terms%'
                OR pets.behavior LIKE '%$search_terms%'
                OR animal_types.type_name LIKE '%$search_terms%'
                OR breeds.breed_name LIKE '%$search_terms%'
            ";
        }

        $result = $conn->query($sql);

        echo "<div class='animal-grid'>";
        if ($result->num_rows > 0) {
            // Loop through each entry
            while ($row = $result->fetch_assoc()) {
                echo "<div class='animal-card'>";
                    if ($role == 1) {
                        echo '<a class="edit-button" href="edit.php?id=' . $row['id'] . '" target="_blank">';
                            echo '<div class="edit-icon"></div>';
                        echo '</a>';
                    }
                    echo '<a href="animal_details.php?id=' . $row['id'] . '">';
                    echo "<img src='" . $row['photo'] . "'>";
                    echo "<h2>" . htmlspecialchars($row['name']) . "</h2>";
                    echo "</a>";
                echo "</div>";
            }
        } else {
            echo "<p>No results found for your search.</p>";
        }
        
        if ($role == 1) {
            echo "<div class='add-new'>";
                echo '<a class="plus" href="add_new.php">+</a>';
            echo "</div>";
        }
        echo "</div>";
    ?>
</body>
</html>

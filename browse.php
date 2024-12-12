<?php
$page_title = "Browsing";
include ('includes/header.php');?>
    <link rel="stylesheet" href="www/css/browse-details.css">
    <link rel="stylesheet" href="www/css/browse.css">
</head>
<?php include ('includes/navbar.php'); ?>
    <h1>Up For Adoption</h1>
    <?php
        include ('includes/config.php');
        // Create connection
        $conn = new mysqli($servername, $username, $password, $database);

        // Check connection
        if ($conn->connect_error) {
            die("Connection failed: " . $conn->connect_error);
        }
        // Query to fetch all entries from 'pets' table
        $sql = "SELECT * FROM pets";
        $result = $conn->query($sql);

        echo "<div class='animal-grid'> ";
        if ($result->num_rows > 0) {
            // Loop through each entry
            while ($row = $result->fetch_assoc()) {
                    echo "<div class='animal-card'>";
                        echo '<a href="animal_details.php?id=' . $row['id'] . '">';
                        echo "<img src='www/img/animals/" . $row['photo'] . "'>";
                        echo "<h2>" . $row['name'] . "</h2>";
                    echo "</div>";
            }
        }
                echo "<div class='add-new-card'>";
                    echo '<a href="add_new.php">';
                    echo "<div class='plus'>+</div>";
                    echo "<h2> Add New </h2>";
                echo "</div>";
        echo "</div>";
    ?>
</body>
</html>

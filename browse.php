<?php
$page_title = "Browsing";
include ('includes/header.php');?>
    <link rel="stylesheet" href="www/css/browse.css">
</head>
    <?php include ('includes/navbar.php'); ?>
</head>
<body>
    <h1>Up For Adoption</h1>
    <?php
        // Query to fetch all entries from 'pets' table
        $sql = "SELECT * FROM pets";
        $result = $conn->query($sql);

        if ($result->num_rows > 0) {
            // Loop through each entry
            echo "<div class='animal-grid'> ";
            while ($row = $result->fetch_assoc()) {
                    echo "<div class='animal-card'>";
                        echo "<img src='www/img/animals/" . $row['photo'] . "'>";
                        echo "<h2>" . $row['name'] . "</h2>";
                    echo "</div>";
            }
            echo "</div>";
        }
    ?>
</body>
</html>

<?php

require_once('includes/config.php');
require_once('includes/connect.php');

$page_title = "Reservations";
require_once('includes/header.php');
?>
</head>

<?php require_once('includes/navbar.php'); ?>
<h2>My Reservations</h2>
<?php
if (!isset($_SESSION['cart']) || !$_SESSION['cart']) {
    echo "You have no reservations.<br><br>";
    exit();
}

// Proceed since the cart is not empty
$cart = $_SESSION['cart'];
$pet_ids = array_keys($cart); // Extract pet IDs from the cart

if (empty($pet_ids)) {
    echo "You have no reservations.<br><br>";
    exit();
}

$sql = "SELECT pets.id, pets.name, pets.photo, animal_types.type_name, breeds.breed_name 
        FROM pets
        LEFT JOIN animal_types ON pets.animal = animal_types.id
        LEFT JOIN breeds ON pets.breed = breeds.id
        WHERE pets.id IN (" . implode(',', $pet_ids) . ")";

// Execute query directly since IDs are known to be integers
$result = $conn->query($sql);

if (!$result || $result->num_rows === 0) {
    echo "You have no reservations<br><br>";
    exit();
}
?>
    <table class="petlist" style="border: 1px solid black; border-collapse: collapse;">
        <thead>
            <tr>
                <th style="border: 1px solid black;">Photo</th>
                <th style="border: 1px solid black;">Name</th>
                <th style="border: 1px solid black;">Animal Type</th>
                <th style="border: 1px solid black;">Breed</th>
                <th style="border: 1px solid black;"></th>
            </tr>
        </thead>
        <tbody>
            <?php
            while ($row = $result->fetch_assoc()) {
                $id = $row['id'];
                $name = htmlspecialchars($row['name']);
                $photo = htmlspecialchars($row['photo']);
                $animal_type = htmlspecialchars($row['type_name']);
                $breed = htmlspecialchars($row['breed_name']);
                
                echo "<tr>
                        <td style='border: 1px solid black; text-align: center;'>
                            <img src='$photo' alt='$name' style='max-width: 100px; max-height: 100px;'>
                        </td>
                        <td style='border: 1px solid black;'>$name</td>
                        <td style='border: 1px solid black;'>$animal_type</td>
                        <td style='border: 1px solid black;'>$breed</td>
                        <td style='border: 1px solid black;'>
                            <a class='special-link' href='remove_from_cart.php?id=$id' onclick='return confirm(\"Are you sure you want to remove this pet?\")'>Remove</a>
                        </td>
                    </tr>";
            }
            ?>
        </tbody>
    </table>
    <br>
    <div>
        <a href="browse.php" class="special-link">&larr; Back to List</a>
        <form action="checkout.php">
            <button type="submit">Submit</button>
        </form>
    </div>
</body>
</html>

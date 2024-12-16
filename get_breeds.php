<?php
include('includes/config.php');
include('includes/connect.php');

// Check if animal_id is set
if (isset($_GET['animal_id'])) {
    $animal_id = intval($_GET['animal_id']); // Sanitize input

    // Fetch breeds for the given animal type
    $stmt = $conn->prepare("SELECT id, breed_name FROM breeds WHERE animal_type_id = ?");
    $stmt->bind_param("i", $animal_id);
    $stmt->execute();

    $result = $stmt->get_result();
    $breeds = [];

    while ($row = $result->fetch_assoc()) {
        $breeds[] = $row;
    }

    $stmt->close();

    // Return breeds as JSON
    header('Content-Type: application/json');
    echo json_encode($breeds);
} else {
    // Handle missing parameter
    http_response_code(400);
    echo json_encode(["error" => "animal_id parameter is required"]);
}

$conn->close();
?>

<?php
// Database Connection Wrapper
if (!isset($servername)) {
    include_once __DIR__ . '/config.php';
}

$conn = @new mysqli($servername, $db_username, $db_password, $database);

if ($conn->connect_error) {
    // If MySQL connection fails, set an error flag instead of raw crash
    $db_connection_error = $conn->connect_error;
} else {
    $conn->set_charset("utf8mb4");
}
?>
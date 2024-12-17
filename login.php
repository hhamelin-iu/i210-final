<?php
require_once('includes/config.php');
include('includes/connect.php');

// Start session if it hasn't already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Initialize login status
$_SESSION['login_status'] = 2;
$username = $password = "";

if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING)));
    $password = trim($_POST['password']);
} else {
    die("Username or password not provided.");
}

// Query the database for the user
$sql = "SELECT * FROM users WHERE username = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

// Validate the username and password
if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    
    // Verify the password
    if ($password == $row['password']) {
        // Password matches
        $_SESSION['login'] = $username;
        $_SESSION['role'] = $row['role'];
        $_SESSION['name'] = $row['firstname'] . " " . $row['lastname'];
        $_SESSION['login_status'] = 1;
    } else {
        // Incorrect password
        $_SESSION['login_status'] = 2;
    }
} else {
    // Username does not exist
    $_SESSION['login_status'] = 2;
}

// Close the connection
$stmt->close();
$conn->close();
//redirect to the loginform.php page
header("Location: loginform.php");
?>

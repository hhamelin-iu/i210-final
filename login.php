<?php
require_once('includes/config.php');
include('includes/connect.php');
include_once('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$username = trim($_POST['username'] ?? '');
$password = trim($_POST['password'] ?? '');

if (empty($username) || empty($password)) {
    set_alert("Please enter both username and password.", "warning");
    header("Location: loginform.php");
    exit();
}

if (isset($conn) && !$conn->connect_error) {
    // Prepared Query
    $sql = "SELECT * FROM users WHERE username = ?";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();

    if ($result && $result->num_rows > 0) {
        $row = $result->fetch_assoc();
        
        // Verify password
        if ($password === $row['password']) {
            $_SESSION['login'] = $username;
            $_SESSION['role'] = (int)$row['role'];
            $_SESSION['name'] = $row['firstname'] . " " . $row['lastname'];
            $_SESSION['login_status'] = 1;

            set_alert("Welcome back, " . $_SESSION['name'] . "!", "success");
            header("Location: index.php");
            exit();
        }
    }
}

$_SESSION['login_status'] = 2;
set_alert("Invalid username or password. Please try again.", "error");
header("Location: loginform.php");
exit();

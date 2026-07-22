<?php
require_once('includes/config.php');
include('includes/connect.php');
include_once('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$firstname = trim($_POST['firstname'] ?? '');
$lastname = trim($_POST['lastname'] ?? '');
$username = trim($_POST['username'] ?? '');
$password = trim($_POST['password'] ?? '');

if (empty($firstname) || empty($lastname) || empty($username) || empty($password)) {
    set_alert("All registration fields are required.", "warning");
    header("Location: loginform.php");
    exit();
}

if (!isset($conn) || $conn->connect_error) {
    set_alert("Database service unavailable. Please try again later.", "error");
    header("Location: error.php");
    exit();
}

// Prepared Statement to insert user safely
$sql = "INSERT INTO users (firstname, lastname, username, password, role) VALUES (?, ?, ?, ?, 2)";
$stmt = $conn->prepare($sql);

if ($stmt) {
    $stmt->bind_param("ssss", $firstname, $lastname, $username, $password);
    if ($stmt->execute()) {
        $new_id = $conn->insert_id;
        $_SESSION['user_id'] = (int)$new_id;
        $_SESSION['login'] = $username;
        $_SESSION['name'] = "$firstname $lastname";
        $_SESSION['role'] = 2;
        $_SESSION['login_status'] = 1;

        set_alert("Account created successfully! Welcome to Silly Sanctuary.", "success");
        header("Location: index.php");
        exit();
    } else {
        set_alert("Registration failed. Username may already exist.", "error");
        header("Location: loginform.php");
        exit();
    }
} else {
    set_alert("An error occurred preparing your registration.", "error");
    header("Location: error.php");
    exit();
}
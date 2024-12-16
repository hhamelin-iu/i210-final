<?php
//include code from database.php
require_once('includes/config.php');
include('includes/connect.php');

//start session if it has not already started
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

//create variable login status.
$_SESSION['login_status'] = 2;
$username = $passcode = "";

// Retrieve username and password from POST request
if (isset($_POST['username']) && isset($_POST['password'])) {
    $username = $conn->real_escape_string(trim(filter_input(INPUT_POST, 'username', FILTER_SANITIZE_STRING)));
    $password = trim(filter_input(INPUT_POST, 'password', FILTER_SANITIZE_STRING));
} else {
    die("Username or password not provided.");
}

//validate user name and password against a record in the users table in the database. If they are valid, create session variables.
$sql = "SELECT * FROM users WHERE username='$username'";
$query = $conn->query($sql);

if ($query->num_rows) {
    //It is a valid user. Need to store the user in session variables.
    $row = $query->fetch_assoc();
    $_SESSION['login'] = $username;
    $_SESSION['role'] = $row['role'];
    $_SESSION['name'] = $row['firstname'] . " " . $row['lastname'];
    $_SESSION['login_status'] = 1;
}



//close the connection
$conn->close();

//redirect to the loginform.php page
header("Location: loginform.php");

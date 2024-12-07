<?php
    //Authors: Ryan Elliott, Haven Hamelin, Josie Juarez
    // Database credentials
    $servername = "localhost";
    $username = "phpmyadmin";
    $password = "AVGN3r)";
    $database = "pet_adoption";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $database);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=$page_title?></title>
    <link rel="stylesheet" href="www/css/styles.css">

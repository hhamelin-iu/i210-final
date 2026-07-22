<?php
// Authors: Haven Hamelin
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= htmlspecialchars($page_title ?? 'Silly Cats & Gnarp Pet Depot') ?></title>
    
    <!-- Google Fonts: Space Grotesk, Fredoka, Silkscreen -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Fredoka:wght@400;500;600;700&family=Silkscreen&family=Space+Grotesk:wght@400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Theme & Styles -->
    <link rel="stylesheet" href="www/css/theme.css">
    <link rel="stylesheet" href="www/css/styles.css">

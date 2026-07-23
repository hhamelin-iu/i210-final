<?php
// Health Check Endpoint for Portfolio Status Checks
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: GET, HEAD, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

// Handle preflight OPTIONS request
if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$response = [
    "status" => "ok",
    "service" => "Silly Sanctuary",
    "timestamp" => time()
];

// Optional: check DB connection status if connect.php is present
if (file_exists(__DIR__ . '/includes/connect.php')) {
    try {
        @include_once __DIR__ . '/includes/connect.php';
        if (isset($conn) && $conn instanceof mysqli && $conn->connect_error) {
            $response['status'] = 'degraded';
            $response['database'] = 'disconnected';
        } else {
            $response['database'] = 'connected';
        }
    } catch (Throwable $e) {
        $response['status'] = 'degraded';
    }
}

http_response_code(200);
echo json_encode($response, JSON_PRETTY_PRINT);

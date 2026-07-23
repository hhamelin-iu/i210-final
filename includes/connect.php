<?php
// Database Connection Wrapper
if (!isset($servername)) {
    include_once __DIR__ . '/config.php';
}

mysqli_report(MYSQLI_REPORT_OFF);

// Try standard connection first
$conn = @new mysqli($servername, $db_username, $db_password, $database);

// If connection failed, fallback to detecting common Unix socket paths (e.g. Debian/Raspberry Pi vs Fedora/RHEL)
if ($conn->connect_error) {
    $common_sockets = [
        '/var/run/mysqld/mysqld.sock', // Debian / Ubuntu / Raspberry Pi OS
        '/var/lib/mysql/mysql.sock',   // Fedora / RHEL / CentOS / Arch
        '/tmp/mysql.sock'              // macOS / custom setups
    ];

    foreach ($common_sockets as $socket) {
        if (file_exists($socket)) {
            $test_conn = @new mysqli('localhost', $db_username, $db_password, $database, null, $socket);
            if (!$test_conn->connect_error) {
                $conn = $test_conn;
                break;
            }
        }
    }
}

if ($conn->connect_error) {
    // If MySQL connection fails, set an error flag instead of raw crash
    $db_connection_error = $conn->connect_error;
} else {
    $conn->set_charset("utf8mb4");
    // Auto-create reservations table if missing from database schema
    @$conn->query("CREATE TABLE IF NOT EXISTS `reservations` (
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `user_id` int(11) NOT NULL,
      `pet_id` int(11) NOT NULL,
      `status` varchar(50) NOT NULL DEFAULT 'Pending',
      `notes` text DEFAULT NULL,
      `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
      PRIMARY KEY (`id`),
      KEY `user_id` (`user_id`),
      KEY `pet_id` (`pet_id`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4");
}
?>
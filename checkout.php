<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}
include_once ('includes/config.php');
include_once ('includes/connect.php');
include_once ('includes/alert.php');

$login_status = $_SESSION['login_status'] ?? 0;
$user_id = $_SESSION['user_id'] ?? 0;
$username = $_SESSION['login'] ?? '';

// Fallback lookup if user_id wasn't saved in older session
if ($user_id <= 0 && !empty($username) && isset($conn) && !$conn->connect_error) {
    $stmt_u = $conn->prepare("SELECT id FROM users WHERE username = ?");
    $stmt_u->bind_param("s", $username);
    $stmt_u->execute();
    $u_res = $stmt_u->get_result();
    if ($u_row = $u_res->fetch_assoc()) {
        $user_id = (int)$u_row['id'];
        $_SESSION['user_id'] = $user_id;
    }
}

if (($login_status == 0 && empty($username)) || $user_id <= 0) {
    set_alert("Please log in to finalize your pet reservation.", "warning");
    header("Location: loginform.php");
    exit();
}

$cart = $_SESSION['cart'] ?? [];
$pet_ids = array_filter(array_keys($cart), 'is_numeric');

if (empty($pet_ids)) {
    set_alert("Your reservation cart is empty.", "warning");
    header("Location: show_cart.php");
    exit();
}

$reserved_pets = [];

if (isset($conn) && !$conn->connect_error) {
    $conn->begin_transaction();
    try {
        $stmt_res = $conn->prepare("INSERT INTO reservations (user_id, pet_id, status, created_at) VALUES (?, ?, 'Pending', NOW())");
        $stmt_update = $conn->prepare("UPDATE pets SET status = 'Reserved' WHERE id = ? AND status = 'Available'");
        $stmt_info = $conn->prepare("SELECT name, photo FROM pets WHERE id = ?");

        foreach ($pet_ids as $pid) {
            $pid = intval($pid);
            // Insert reservation
            $stmt_res->bind_param("ii", $user_id, $pid);
            $stmt_res->execute();

            // Update pet status
            $stmt_update->bind_param("i", $pid);
            $stmt_update->execute();

            // Get pet name & photo for display
            $stmt_info->bind_param("i", $pid);
            $stmt_info->execute();
            $res = $stmt_info->get_result();
            if ($row = $res->fetch_assoc()) {
                $reserved_pets[] = $row;
            }
        }
        $conn->commit();
        $_SESSION['cart'] = [];
        set_alert("Your pet reservation request has been submitted successfully!", "success");
    } catch (Exception $e) {
        $conn->rollback();
        set_alert("Failed to log reservation. Please try again.", "error");
        header("Location: show_cart.php");
        exit();
    }
}

$page_title = "Reservation Confirmed";
include ('includes/header.php');
?>
</head>

<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="max-width: 750px; margin: 40px auto;" class="glass-card">
        <div style="text-align: center; margin-bottom: 24px;">
            <span class="badge badge-green">[RESERVATION SAVED]</span>
            <h1 style="font-size: 2.6rem; margin-top: 14px; color: var(--neon-green);">Reservation Confirmed!</h1>
            <p style="color: var(--text-muted); font-size: 1.1rem; line-height: 1.7;">
                Your adoption applications have been logged in our system. Our specialists will review your application and contact you soon.
            </p>
        </div>

        <?php if (!empty($reserved_pets)): ?>
            <div style="background: rgba(15, 23, 42, 0.6); padding: 20px; border-radius: 12px; border: 1px solid var(--border-color); margin-bottom: 28px;">
                <h3 style="color: var(--neon-cyan); margin-bottom: 14px; font-family: var(--font-heading);">Reserved Companions</h3>
                <div style="display: grid; grid-template-columns: repeat(auto-fill, minmax(200px, 1fr)); gap: 16px;">
                    <?php foreach ($reserved_pets as $pet): ?>
                        <div style="display: flex; align-items: center; gap: 12px; background: var(--bg-surface); padding: 12px; border-radius: 10px; border: 1px solid var(--border-color);">
                            <img src="<?= htmlspecialchars($pet['photo']) ?>" alt="<?= htmlspecialchars($pet['name']) ?>" style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px; border: 1px solid var(--neon-purple);">
                            <div>
                                <strong style="color: var(--text-main); font-size: 1.05rem;"><?= htmlspecialchars($pet['name']) ?></strong>
                                <div style="font-size: 0.8rem; color: var(--neon-green);">Status: Pending</div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        <?php endif; ?>

        <div style="display: flex; gap: 16px; justify-content: center; flex-wrap: wrap;">
            <a href="my_reservations.php" class="btn btn-primary">View My Reservations</a>
            <a href="browse.php" class="btn btn-secondary">Browse More Pets</a>
        </div>
    </div>
</main>

<?php include ('includes/footer.php'); ?>
<?php
require_once('includes/config.php');
require_once('includes/connect.php');
require_once('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

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
    set_alert("Please sign in to view your pet reservations.", "warning");
    header("Location: loginform.php");
    exit();
}

// Handle cancellation request
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['cancel_reservation_id'])) {
    $cancel_id = intval($_POST['cancel_reservation_id']);
    if ($cancel_id > 0 && isset($conn) && !$conn->connect_error) {
        $conn->begin_transaction();
        try {
            // Verify reservation belongs to user and is pending
            $stmt_chk = $conn->prepare("SELECT pet_id FROM reservations WHERE id = ? AND user_id = ? AND status = 'Pending'");
            $stmt_chk->bind_param("ii", $cancel_id, $user_id);
            $stmt_chk->execute();
            $res = $stmt_chk->get_result();
            if ($row = $res->fetch_assoc()) {
                $pet_id = $row['pet_id'];

                // Update reservation status to Cancelled
                $stmt_canc = $conn->prepare("UPDATE reservations SET status = 'Cancelled' WHERE id = ?");
                $stmt_canc->bind_param("i", $cancel_id);
                $stmt_canc->execute();

                // Restore pet status to Available
                $stmt_rest = $conn->prepare("UPDATE pets SET status = 'Available' WHERE id = ? AND status = 'Reserved'");
                $stmt_rest->bind_param("i", $pet_id);
                $stmt_rest->execute();

                $conn->commit();
                set_alert("Reservation cancelled successfully.", "success");
            } else {
                $conn->rollback();
                set_alert("Unable to cancel reservation.", "error");
            }
        } catch (Exception $e) {
            $conn->rollback();
            set_alert("Error cancelling reservation.", "error");
        }
        header("Location: my_reservations.php");
        exit();
    }
}

$page_title = "My Pet Reservations";
require_once('includes/header.php');
?>
    <style>
        .res-card {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-backdrop);
            border: 2px solid var(--border-color);
            border-radius: 16px;
            padding: 20px;
            margin-bottom: 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 20px;
            flex-wrap: wrap;
            transition: border-color 0.2s ease;
        }

        .res-card:hover {
            border-color: var(--neon-cyan);
        }

        .res-thumb {
            width: 85px;
            height: 85px;
            object-fit: cover;
            border-radius: 14px;
            border: 2px solid var(--neon-purple);
        }

        .status-badge {
            font-weight: 700;
            font-size: 0.85rem;
            padding: 6px 14px;
            border-radius: 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }

        .status-pending { background: rgba(234, 179, 8, 0.2); color: #facc15; border: 1px solid #facc15; }
        .status-approved { background: rgba(34, 197, 94, 0.2); color: #4ade80; border: 1px solid #4ade80; }
        .status-adopted { background: rgba(6, 182, 212, 0.2); color: #38bdf8; border: 1px solid #38bdf8; }
        .status-cancelled { background: rgba(239, 68, 68, 0.2); color: #f87171; border: 1px solid #f87171; }

        @media (max-width: 640px) {
            .res-card {
                flex-direction: column;
                align-items: stretch;
                padding: 16px;
            }

            .res-card-left {
                flex-direction: row;
                align-items: center !important;
                gap: 14px !important;
            }

            .res-card-right {
                flex-direction: column;
                width: 100%;
                gap: 10px !important;
                align-items: stretch !important;
                margin-top: 10px;
                padding-top: 12px;
                border-top: 1px dashed var(--border-color);
            }

            .res-card-right .btn, .res-card-right form {
                width: 100%;
            }

            .res-card-right form button {
                width: 100%;
            }

            .status-badge {
                text-align: center;
                width: 100%;
            }
        }
    </style>
</head>

<?php 
require_once('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="margin-top: 20px; margin-bottom: 30px;">
        <span class="badge badge-accent">User Dashboard</span>
        <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">My Adoption Applications</h1>
        <p style="color: var(--text-muted);">Track your active pet reservations, review approval status, and manage your applications.</p>
    </div>

    <?php
    if (isset($conn) && !$conn->connect_error) {
        $sql = "SELECT r.id AS res_id, r.status AS res_status, r.created_at, r.notes, 
                       p.id AS pet_id, p.name AS pet_name, p.photo, p.age, 
                       t.type_name, b.breed_name
                FROM reservations r
                JOIN pets p ON r.pet_id = p.id
                LEFT JOIN animal_types t ON p.animal = t.id
                LEFT JOIN breeds b ON p.breed = b.id
                WHERE r.user_id = ?
                ORDER BY r.id DESC";

        $stmt = $conn->prepare($sql);
        $stmt->bind_param("i", $user_id);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            echo "<div>";
            while ($row = $result->fetch_assoc()) {
                $status = $row['res_status'];
                $badge_class = 'status-pending';
                if ($status === 'Approved') $badge_class = 'status-approved';
                elseif ($status === 'Adopted') $badge_class = 'status-adopted';
                elseif ($status === 'Cancelled') $badge_class = 'status-cancelled';
                ?>
                <div class="res-card">
                    <div class="res-card-left" style="display: flex; align-items: center; gap: 20px;">
                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['pet_name']) ?>" class="res-thumb">
                        <div>
                            <div style="display: flex; gap: 8px; margin-bottom: 6px; flex-wrap: wrap;">
                                <span class="badge badge-accent"><?= htmlspecialchars($row['type_name'] ?? 'Pet') ?></span>
                                <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Unknown') ?></span>
                            </div>
                            <h2 style="margin: 0; font-size: 1.3rem; color: var(--text-main); font-family: var(--font-heading);"><?= htmlspecialchars($row['pet_name']) ?></h2>
                            <div style="font-size: 0.85rem; color: var(--text-muted); margin-top: 4px;">
                                Reserved on: <?= date('M j, Y \a\t g:i A', strtotime($row['created_at'])) ?>
                            </div>
                        </div>
                    </div>

                    <div class="res-card-right" style="display: flex; align-items: center; gap: 16px;">
                        <span class="status-badge <?= $badge_class ?>"><?= htmlspecialchars($status) ?></span>
                        <a href="animal_details.php?id=<?= $row['pet_id'] ?>" class="btn btn-secondary" style="padding: 8px 16px; font-size: 0.9rem;">View Profile</a>
                        <?php if ($status === 'Pending'): ?>
                            <form action="my_reservations.php" method="POST" onsubmit="return confirm('Are you sure you want to cancel this reservation?');">
                                <input type="hidden" name="cancel_reservation_id" value="<?= $row['res_id'] ?>">
                                <button type="submit" class="btn btn-secondary" style="padding: 8px 16px; font-size: 0.9rem; color: var(--neon-pink); border-color: rgba(236, 72, 153, 0.4);">Cancel</button>
                            </form>
                        <?php endif; ?>
                    </div>
                </div>
                <?php
            }
            echo "</div>";
        } else {
            ?>
            <div class="empty-state">
                <div class="empty-state-title">No Reservations Found</div>
                <div class="empty-state-desc">You haven't reserved any pets yet. Explore our adoptable companions and submit an application!</div>
                <a href="browse.php" class="btn btn-primary">Browse Adoptable Pets</a>
            </div>
            <?php
        }
    }
    ?>
</main>

<?php include('includes/footer.php'); ?>

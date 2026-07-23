<?php
require_once('includes/config.php');
require_once('includes/connect.php');
require_once('includes/alert.php');

if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

$role = $_SESSION['role'] ?? 0;

if ($role != 1) {
    set_alert("Access denied. Admin privileges required.", "error");
    header("Location: index.php");
    exit();
}

// Handle Admin Actions
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['action'], $_POST['reservation_id'])) {
    $res_id = intval($_POST['reservation_id']);
    $action = $_POST['action'];

    if ($res_id > 0 && isset($conn) && !$conn->connect_error) {
        $conn->begin_transaction();
        try {
            // Get reservation and pet details
            $stmt_info = $conn->prepare("SELECT pet_id, status FROM reservations WHERE id = ?");
            $stmt_info->bind_param("i", $res_id);
            $stmt_info->execute();
            $res = $stmt_info->get_result();

            if ($row = $res->fetch_assoc()) {
                $pet_id = $row['pet_id'];

                if ($action === 'approve') {
                    $stmt_u = $conn->prepare("UPDATE reservations SET status = 'Approved' WHERE id = ?");
                    $stmt_u->bind_param("i", $res_id);
                    $stmt_u->execute();
                    set_alert("Reservation #$res_id approved.", "success");
                } elseif ($action === 'adopt') {
                    $stmt_u = $conn->prepare("UPDATE reservations SET status = 'Adopted' WHERE id = ?");
                    $stmt_u->bind_param("i", $res_id);
                    $stmt_u->execute();

                    $stmt_p = $conn->prepare("UPDATE pets SET status = 'Adopted' WHERE id = ?");
                    $stmt_p->bind_param("i", $pet_id);
                    $stmt_p->execute();
                    set_alert("Pet successfully marked as Adopted!", "success");
                } elseif ($action === 'decline') {
                    $stmt_u = $conn->prepare("UPDATE reservations SET status = 'Cancelled' WHERE id = ?");
                    $stmt_u->bind_param("i", $res_id);
                    $stmt_u->execute();

                    $stmt_p = $conn->prepare("UPDATE pets SET status = 'Available' WHERE id = ? WHERE id = ? AND status = 'Reserved'");
                    $stmt_p = $conn->prepare("UPDATE pets SET status = 'Available' WHERE id = ?");
                    $stmt_p->bind_param("i", $pet_id);
                    $stmt_p->execute();
                    set_alert("Reservation cancelled and pet set to Available.", "info");
                }
                $conn->commit();
            } else {
                $conn->rollback();
                set_alert("Invalid reservation ID.", "error");
            }
        } catch (Exception $e) {
            $conn->rollback();
            set_alert("Database error updating reservation.", "error");
        }
        header("Location: manage_reservations.php");
        exit();
    }
}

$page_title = "Manage Reservations - Admin Panel";
require_once('includes/header.php');
?>
    <style>
        .admin-res-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        .admin-res-row {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-backdrop);
            border: 2px solid var(--border-color);
        }

        .admin-res-row td {
            padding: 16px 20px;
            vertical-align: middle;
        }

        .admin-res-row td:first-child { border-top-left-radius: 14px; border-bottom-left-radius: 14px; }
        .admin-res-row td:last-child { border-top-right-radius: 14px; border-bottom-right-radius: 14px; }

        .status-pill {
            font-weight: 700;
            font-size: 0.8rem;
            padding: 4px 12px;
            border-radius: 12px;
            text-transform: uppercase;
        }

        .st-Pending { background: rgba(234, 179, 8, 0.2); color: #facc15; border: 1px solid #facc15; }
        .st-Approved { background: rgba(34, 197, 94, 0.2); color: #4ade80; border: 1px solid #4ade80; }
        .st-Adopted { background: rgba(6, 182, 212, 0.2); color: #38bdf8; border: 1px solid #38bdf8; }
        .st-Cancelled { background: rgba(239, 68, 68, 0.2); color: #f87171; border: 1px solid #f87171; }

        @media (max-width: 768px) {
            .admin-res-table, .admin-res-table thead, .admin-res-table tbody, .admin-res-table tr, .admin-res-table td {
                display: block;
                width: 100%;
            }

            .admin-res-table thead {
                display: none;
            }

            .admin-res-row {
                margin-bottom: 16px;
                border-radius: 16px !important;
                padding: 16px;
            }

            .admin-res-row td {
                padding: 6px 0 !important;
                text-align: left !important;
                border-radius: 0 !important;
            }

            .admin-actions {
                display: flex;
                flex-direction: column;
                gap: 8px;
                width: 100%;
                margin-top: 10px;
                padding-top: 10px;
                border-top: 1px dashed var(--border-color);
            }

            .admin-actions form, .admin-actions button {
                width: 100% !important;
            }
        }
    </style>
</head>

<?php 
require_once('includes/navbar.php');
render_alert();
?>

<main class="container">
    <div style="margin-top: 20px; margin-bottom: 30px; display: flex; justify-content: space-between; align-items: center; flex-wrap: wrap; gap: 16px;">
        <div>
            <span class="badge badge-primary">Admin Control Center</span>
            <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">Manage Adoption Applications</h1>
            <p style="color: var(--text-muted);">Review incoming pet applications, approve candidates, and update adoption statuses.</p>
        </div>
        <a href="add_new.php" class="btn btn-primary">+ Add New Pet</a>
    </div>

    <?php
    if (isset($conn) && !$conn->connect_error) {
        $sql = "SELECT r.id AS res_id, r.status AS res_status, r.created_at,
                       u.id AS user_id, u.firstname, u.lastname, u.username,
                       p.id AS pet_id, p.name AS pet_name, p.photo, p.status AS pet_status,
                       t.type_name, b.breed_name
                FROM reservations r
                JOIN users u ON r.user_id = u.id
                JOIN pets p ON r.pet_id = p.id
                LEFT JOIN animal_types t ON p.animal = t.id
                LEFT JOIN breeds b ON p.breed = b.id
                ORDER BY r.id DESC";

        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            ?>
            <div class="glass-card" style="padding: 24px; overflow-x: auto;">
                <table class="admin-res-table">
                    <thead>
                        <tr style="color: var(--neon-cyan); font-family: var(--font-heading); text-align: left; font-size: 0.95rem;">
                            <th>Res #</th>
                            <th>Applicant</th>
                            <th>Pet Companion</th>
                            <th>Date Submitted</th>
                            <th>Status</th>
                            <th style="text-align: right;">Admin Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr class="admin-res-row">
                                <td style="font-weight: bold; color: var(--neon-purple);">#<?= $row['res_id'] ?></td>
                                <td>
                                    <strong style="color: var(--text-main);"><?= htmlspecialchars($row['firstname'] . ' ' . $row['lastname']) ?></strong>
                                    <div style="font-size: 0.85rem; color: var(--text-muted);">@<?= htmlspecialchars($row['username']) ?></div>
                                </td>
                                <td>
                                    <div style="display: flex; align-items: center; gap: 12px;">
                                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['pet_name']) ?>" style="width: 50px; height: 50px; object-fit: cover; border-radius: 8px; border: 1px solid var(--neon-purple);">
                                        <div>
                                            <strong style="color: var(--text-main); font-family: var(--font-heading);"><?= htmlspecialchars($row['pet_name']) ?></strong>
                                            <div style="font-size: 0.8rem; color: var(--neon-cyan);"><?= htmlspecialchars($row['breed_name'] ?? 'Unknown') ?></div>
                                        </div>
                                    </div>
                                </td>
                                <td style="font-size: 0.85rem; color: var(--text-muted);">
                                    <?= date('M j, Y g:i A', strtotime($row['created_at'])) ?>
                                </td>
                                <td>
                                    <span class="status-pill st-<?= $row['res_status'] ?>"><?= htmlspecialchars($row['res_status']) ?></span>
                                </td>
                                <td style="text-align: right;">
                                    <div class="admin-actions" style="display: flex; gap: 8px; justify-content: flex-end;">
                                        <?php if ($row['res_status'] === 'Pending'): ?>
                                            <form action="manage_reservations.php" method="POST" style="display: inline;">
                                                <input type="hidden" name="reservation_id" value="<?= $row['res_id'] ?>">
                                                <input type="hidden" name="action" value="approve">
                                                <button type="submit" class="btn btn-secondary" style="padding: 6px 12px; font-size: 0.85rem; color: #4ade80; border-color: #4ade80;">Approve</button>
                                            </form>
                                        <?php endif; ?>

                                        <?php if ($row['res_status'] !== 'Adopted' && $row['res_status'] !== 'Cancelled'): ?>
                                            <form action="manage_reservations.php" method="POST" style="display: inline;">
                                                <input type="hidden" name="reservation_id" value="<?= $row['res_id'] ?>">
                                                <input type="hidden" name="action" value="adopt">
                                                <button type="submit" class="btn btn-primary" style="padding: 6px 12px; font-size: 0.85rem;">Mark Adopted</button>
                                            </form>
                                        <?php endif; ?>

                                        <?php if ($row['res_status'] !== 'Cancelled'): ?>
                                            <form action="manage_reservations.php" method="POST" style="display: inline;" onsubmit="return confirm('Cancel/Decline this application?');">
                                                <input type="hidden" name="reservation_id" value="<?= $row['res_id'] ?>">
                                                <input type="hidden" name="action" value="decline">
                                                <button type="submit" class="btn btn-secondary" style="padding: 6px 12px; font-size: 0.85rem; color: #f87171; border-color: #f87171;">Decline</button>
                                            </form>
                                        <?php endif; ?>
                                    </div>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
            <?php
        } else {
            ?>
            <div class="empty-state">
                <div class="empty-state-title">No Reservations Submitted Yet</div>
                <div class="empty-state-desc">When users submit pet reservation requests, they will appear here for review.</div>
            </div>
            <?php
        }
    }
    ?>
</main>

<?php include('includes/footer.php'); ?>

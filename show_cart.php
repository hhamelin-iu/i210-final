<?php
require_once('includes/config.php');
require_once('includes/connect.php');
require_once('includes/alert.php');

$page_title = "My Pet Reservations";
require_once('includes/header.php');
?>
    <style>
        .cart-card-container {
            padding: 26px;
        }

        .cart-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0 14px;
            margin: 10px 0 20px 0;
        }

        .cart-row {
            background: var(--bg-surface);
            backdrop-filter: var(--glass-backdrop);
            border: 2px solid var(--border-color);
            transition: border-color 0.2s ease;
        }

        .cart-row td {
            padding: 18px 22px;
            vertical-align: middle;
        }

        .cart-row td:first-child {
            border-top-left-radius: 16px;
            border-bottom-left-radius: 16px;
        }

        .cart-row td:last-child {
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
        }

        .cart-item-wrapper {
            display: flex;
            align-items: center;
            gap: 18px;
        }

        .cart-thumb {
            width: 80px;
            height: 80px;
            object-fit: cover;
            border-radius: 14px;
            border: 2px solid var(--neon-purple);
            box-shadow: 0 0 12px rgba(176, 38, 255, 0.25);
            transition: transform 0.2s ease, border-color 0.2s ease;
        }

        .cart-row:hover .cart-thumb {
            transform: scale(1.04);
            border-color: var(--neon-cyan);
        }

        .cart-mobile-details {
            display: none;
        }

        @media (max-width: 640px) {
            .cart-card-container {
                padding: 14px;
            }

            .cart-table, .cart-table thead, .cart-table tbody, .cart-table tr {
                display: block;
                width: 100%;
            }

            .cart-table thead {
                display: none;
            }

            .cart-row {
                margin-bottom: 16px;
                border-radius: 16px !important;
                padding: 14px;
                display: flex;
                flex-direction: column;
                gap: 12px;
            }

            .cart-row td {
                padding: 0 !important;
                border-radius: 0 !important;
            }

            .cart-cell-age, .cart-cell-badges {
                display: none !important;
            }

            .cart-cell-item {
                width: 100%;
            }

            .cart-item-wrapper {
                display: flex;
                align-items: center;
                gap: 14px;
                width: 100%;
            }

            .cart-thumb {
                width: 110px;
                height: 110px;
                min-width: 110px;
                border-radius: 14px;
            }

            .cart-mobile-details {
                display: flex;
                flex-direction: column;
                gap: 4px;
                flex: 1;
            }

            .cart-mobile-badges {
                display: flex;
                gap: 6px;
                flex-wrap: wrap;
                margin-top: 4px;
            }

            .cart-cell-action {
                width: 100%;
                padding-top: 10px !important;
                border-top: 1px dashed var(--border-color);
                text-align: left !important;
            }

            .cart-cell-action .btn {
                width: 100%;
                display: block;
                text-align: center;
                padding: 10px 16px !important;
                font-size: 0.9rem !important;
            }

            .cart-actions {
                flex-direction: column;
                gap: 12px;
                align-items: stretch !important;
            }

            .cart-actions .btn, .cart-actions form {
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
        <span class="badge badge-primary">Reservation Center</span>
        <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">My Pet Reservations</h1>
    </div>

    <?php
    $cart = $_SESSION['cart'] ?? [];
    $pet_ids = array_filter(array_keys($cart), 'is_numeric');

    if (empty($pet_ids)) {
        ?>
        <div class="empty-state">
            <div class="empty-state-title">Your Cart is Empty</div>
            <div class="empty-state-desc">You haven't added any pets to your reservation list yet. Browse our roster to find your match!</div>
            <a href="browse.php" class="btn btn-primary">Browse Pets Now</a>
        </div>
        <?php
    } else {
        $id_list = implode(',', array_map('intval', $pet_ids));
        $sql = "SELECT pets.id, pets.name, pets.photo, pets.age, animal_types.type_name, breeds.breed_name 
                FROM pets
                LEFT JOIN animal_types ON pets.animal = animal_types.id
                LEFT JOIN breeds ON pets.breed = breeds.id
                WHERE pets.id IN ($id_list)";
        
        $result = $conn->query($sql);

        if ($result && $result->num_rows > 0) {
            ?>
            <div class="glass-card cart-card-container">
                <table class="cart-table">
                    <thead>
                        <tr style="color: var(--neon-cyan); font-family: var(--font-heading); text-align: left; font-size: 1rem;">
                            <th style="padding: 0 20px 10px 20px;">Companion Pet</th>
                            <th>Age</th>
                            <th>Breed</th>
                            <th style="text-align: right; padding-right: 20px;">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php while ($row = $result->fetch_assoc()): ?>
                            <tr class="cart-row">
                                <td class="cart-cell-item">
                                    <div class="cart-item-wrapper">
                                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['name']) ?>" class="cart-thumb">
                                        <div>
                                            <strong style="font-size: 1.25rem; color: var(--text-main); font-family: var(--font-heading); display: block;"><?= htmlspecialchars($row['name']) ?></strong>
                                            <div class="cart-mobile-details">
                                                <span style="color: var(--text-muted); font-size: 0.85rem;"><?= htmlspecialchars($row['age']) ?> years old</span>
                                                <div class="cart-mobile-badges">
                                                    <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Breed') ?></span>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </td>
                                <td class="cart-cell-age">
                                    <span style="color: var(--text-muted); font-size: 0.95rem;"><?= htmlspecialchars($row['age']) ?> years old</span>
                                </td>
                                <td class="cart-cell-badges">
                                    <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Breed') ?></span>
                                </td>
                                <td class="cart-cell-action" style="text-align: right;">
                                    <a href="remove_from_cart.php?id=<?= $row['id'] ?>" class="btn btn-danger" style="padding: 6px 16px; font-size: 0.85rem;" onclick="return confirm('Remove <?= htmlspecialchars($row['name']) ?> from your cart?')">
                                        Remove Pet
                                    </a>
                                </td>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>

                <div class="cart-actions" style="display: flex; justify-content: space-between; align-items: center; margin-top: 26px; padding-top: 20px; border-top: 2px dashed var(--border-color);">
                    <a href="browse.php" class="btn btn-secondary">&larr; Back to Roster</a>
                    <form action="checkout.php" method="post" style="margin: 0;">
                        <button type="submit" class="btn btn-primary" style="padding: 14px 34px; font-size: 1.1rem;">
                            Submit Reservation Request &rarr;
                        </button>
                    </form>
                </div>
            </div>
            <?php
        } else {
            ?>
            <div class="empty-state">
                <div class="empty-state-title">No Reservations Logged</div>
                <a href="browse.php" class="btn btn-primary">Browse Pets</a>
            </div>
            <?php
        }
    }
    ?>
</main>

<?php include ('includes/footer.php'); ?>

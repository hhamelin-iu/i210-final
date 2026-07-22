<?php
$page_title = "Browse Pets - Silly Sanctuary";
include ('includes/header.php');
include_once ('includes/alert.php');
?>
    <link rel="stylesheet" href="www/css/browse.css">
    <style>
        .filter-bar {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 12px;
            margin-top: 18px;
            align-items: center;
        }

        .filter-select, .filter-input {
            background: rgba(15, 23, 42, 0.7);
            border: 1px solid var(--border-color);
            color: var(--text-main);
            padding: 10px 14px;
            border-radius: 10px;
            font-size: 0.95rem;
            outline: none;
            width: 100%;
        }

        .filter-select:focus, .filter-input:focus {
            border-color: var(--neon-cyan);
        }

        .badge-status-available { background: rgba(34, 197, 94, 0.2); color: #4ade80; border: 1px solid #4ade80; }
        .badge-status-reserved { background: rgba(234, 179, 8, 0.2); color: #facc15; border: 1px solid #facc15; }
        .badge-status-adopted { background: rgba(6, 182, 212, 0.2); color: #38bdf8; border: 1px solid #38bdf8; }

        .pagination {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 36px;
            margin-bottom: 20px;
        }
    </style>
</head>
<?php 
include ('includes/navbar.php');
render_alert();
?>

<main class="container browse-container">
    <!-- Browse Header -->
    <div class="browse-hero-header">
        <span class="badge badge-accent">Adoptable Roster</span>
        <h1 style="font-size: 2.5rem; margin-top: 8px; color: var(--neon-cyan);">Find Your New Best Friend</h1>
        <p style="color: #e2e8f0; max-width: 550px; margin: 0 auto;">
            Search adoptable companions by name, animal type, breed, availability, or personality.
        </p>

        <?php
        include_once ('includes/config.php');
        include_once ('includes/connect.php');

        $search_terms = trim($_GET['terms'] ?? '');
        $type_filter = intval($_GET['type'] ?? 0);
        $breed_filter = intval($_GET['breed'] ?? 0);
        $status_filter = trim($_GET['status'] ?? 'Available');
        $sort_order = trim($_GET['sort'] ?? 'newest');
        $page = max(1, intval($_GET['page'] ?? 1));
        $limit = 16;
        $offset = ($page - 1) * $limit;

        // Fetch types and breeds for dropdown filters
        $animal_types_list = [];
        $breeds_list = [];
        if (isset($conn) && !$conn->connect_error) {
            $t_res = $conn->query("SELECT id, type_name FROM animal_types ORDER BY type_name ASC");
            if ($t_res) {
                while ($r = $t_res->fetch_assoc()) $animal_types_list[] = $r;
            }
            $b_res = $conn->query("SELECT id, breed_name FROM breeds ORDER BY breed_name ASC");
            if ($b_res) {
                while ($r = $b_res->fetch_assoc()) $breeds_list[] = $r;
            }
        }
        ?>

        <!-- Filter Form -->
        <div class="search-container" style="max-width: 850px;">
            <form action="browse.php" method="get" class="search-form" style="display: block;">
                <div style="display: flex; gap: 10px; margin-bottom: 10px;">
                    <input type="text" name="terms" class="filter-input" placeholder="Search pet names, traits, or descriptions..." value="<?= htmlspecialchars($search_terms) ?>" />
                    <button type="submit" class="btn btn-primary" style="padding: 0 24px; white-space: nowrap;">Search</button>
                    <?php if (!empty($search_terms) || $type_filter > 0 || $breed_filter > 0 || $status_filter !== 'Available'): ?>
                        <a href="browse.php" class="btn btn-secondary" style="white-space: nowrap;">Reset All</a>
                    <?php endif; ?>
                </div>

                <div class="filter-bar">
                    <select name="type" class="filter-select" onchange="this.form.submit()">
                        <option value="0">All Animal Types</option>
                        <?php foreach ($animal_types_list as $at): ?>
                            <option value="<?= $at['id'] ?>" <?= $type_filter == $at['id'] ? 'selected' : '' ?>><?= htmlspecialchars($at['type_name']) ?></option>
                        <?php endforeach; ?>
                    </select>

                    <select name="breed" class="filter-select" onchange="this.form.submit()">
                        <option value="0">All Breeds</option>
                        <?php foreach ($breeds_list as $br): ?>
                            <option value="<?= $br['id'] ?>" <?= $breed_filter == $br['id'] ? 'selected' : '' ?>><?= htmlspecialchars($br['breed_name']) ?></option>
                        <?php endforeach; ?>
                    </select>

                    <select name="status" class="filter-select" onchange="this.form.submit()">
                        <option value="Available" <?= $status_filter === 'Available' ? 'selected' : '' ?>>Available Only</option>
                        <option value="Reserved" <?= $status_filter === 'Reserved' ? 'selected' : '' ?>>Reserved</option>
                        <option value="Adopted" <?= $status_filter === 'Adopted' ? 'selected' : '' ?>>Adopted</option>
                        <option value="all" <?= $status_filter === 'all' ? 'selected' : '' ?>>All Statuses</option>
                    </select>

                    <select name="sort" class="filter-select" onchange="this.form.submit()">
                        <option value="newest" <?= $sort_order === 'newest' ? 'selected' : '' ?>>Newest First</option>
                        <option value="name_asc" <?= $sort_order === 'name_asc' ? 'selected' : '' ?>>Name (A - Z)</option>
                        <option value="age_asc" <?= $sort_order === 'age_asc' ? 'selected' : '' ?>>Age (Youngest)</option>
                        <option value="age_desc" <?= $sort_order === 'age_desc' ? 'selected' : '' ?>>Age (Oldest)</option>
                    </select>
                </div>
            </form>
        </div>
    </div>

    <?php
    if (isset($conn) && !$conn->connect_error) {
        $where_clauses = ["1=1"];
        $params = [];
        $types_str = "";

        if (!empty($search_terms)) {
            $where_clauses[] = "(pets.name LIKE ? OR pets.description LIKE ? OR pets.behavior LIKE ? OR animal_types.type_name LIKE ? OR breeds.breed_name LIKE ?)";
            $like_term = '%' . $search_terms . '%';
            for ($i = 0; $i < 5; $i++) {
                $params[] = $like_term;
                $types_str .= "s";
            }
        }

        if ($type_filter > 0) {
            $where_clauses[] = "pets.animal = ?";
            $params[] = $type_filter;
            $types_str .= "i";
        }

        if ($breed_filter > 0) {
            $where_clauses[] = "pets.breed = ?";
            $params[] = $breed_filter;
            $types_str .= "i";
        }

        if ($status_filter === 'Available' || $status_filter === 'Reserved' || $status_filter === 'Adopted') {
            $where_clauses[] = "pets.status = ?";
            $params[] = $status_filter;
            $types_str .= "s";
        }

        $where_sql = implode(" AND ", $where_clauses);

        // Count total matching pets
        $count_sql = "SELECT COUNT(*) AS total FROM pets LEFT JOIN animal_types ON pets.animal = animal_types.id LEFT JOIN breeds ON pets.breed = breeds.id WHERE $where_sql";
        $count_stmt = $conn->prepare($count_sql);
        if (!empty($params)) {
            $count_stmt->bind_param($types_str, ...$params);
        }
        $count_stmt->execute();
        $total_rows = $count_stmt->get_result()->fetch_assoc()['total'] ?? 0;
        $total_pages = ceil($total_rows / $limit);

        // Order by clause
        $order_by = "pets.id DESC";
        if ($sort_order === 'name_asc') $order_by = "pets.name ASC";
        elseif ($sort_order === 'age_asc') $order_by = "pets.age ASC";
        elseif ($sort_order === 'age_desc') $order_by = "pets.age DESC";

        $sql = "
            SELECT pets.*, animal_types.type_name, breeds.breed_name 
            FROM pets
            LEFT JOIN animal_types ON pets.animal = animal_types.id
            LEFT JOIN breeds ON pets.breed = breeds.id
            WHERE $where_sql
            ORDER BY $order_by
            LIMIT ? OFFSET ?
        ";

        $stmt = $conn->prepare($sql);
        $params[] = $limit;
        $params[] = $offset;
        $types_str .= "ii";
        $stmt->bind_param($types_str, ...$params);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result && $result->num_rows > 0) {
            echo "<div class='animal-grid'>";
            while ($row = $result->fetch_assoc()) {
                $status = $row['status'] ?? 'Available';
                $status_class = 'badge-status-available';
                if ($status === 'Reserved') $status_class = 'badge-status-reserved';
                elseif ($status === 'Adopted') $status_class = 'badge-status-adopted';
                ?>
                <div class="animal-card">
                    <?php if (isset($role) && $role == 1): ?>
                        <a class="edit-button" href="edit.php?id=<?= $row['id'] ?>" title="Edit Entry">
                            <div class="edit-icon"></div>
                        </a>
                    <?php endif; ?>
                    <a href="animal_details.php?id=<?= $row['id'] ?>">
                        <img src="<?= htmlspecialchars($row['photo']) ?>" alt="<?= htmlspecialchars($row['name']) ?>">
                        <div class="animal-card-body">
                            <div style="display: flex; gap: 6px; margin-bottom: 8px; flex-wrap: wrap;">
                                <span class="badge badge-accent"><?= htmlspecialchars($row['type_name'] ?? 'Pet') ?></span>
                                <span class="badge badge-gold"><?= htmlspecialchars($row['breed_name'] ?? 'Unknown') ?></span>
                                <span class="badge <?= $status_class ?>"><?= htmlspecialchars($status) ?></span>
                            </div>
                            <h2><?= htmlspecialchars($row['name']) ?></h2>
                            <p class="animal-card-desc"><?= htmlspecialchars(substr($row['description'], 0, 95)) ?>...</p>
                            <div style="margin-top: 12px; display: flex; align-items: center; justify-content: space-between; font-size: 0.85rem; color: var(--neon-cyan);">
                                <span>Age: <strong><?= htmlspecialchars($row['age']) ?> yrs</strong></span>
                                <span style="color: var(--neon-green); font-weight: bold;">View Profile &rarr;</span>
                            </div>
                        </div>
                    </a>
                </div>
                <?php
            }

            if (isset($role) && $role == 1) {
                ?>
                <a href="add_new.php" class="add-new-card" style="text-decoration: none;">
                    <div class="plus-btn">
                        <div class="plus-icon">+</div>
                        <span>Add New Pet</span>
                    </div>
                </a>
                <?php
            }
            echo "</div>";

            // Pagination Controls
            if ($total_pages > 1) {
                $query_params = $_GET;
                ?>
                <div class="pagination">
                    <?php if ($page > 1): ?>
                        <?php $query_params['page'] = $page - 1; ?>
                        <a href="browse.php?<?= http_build_query($query_params) ?>" class="btn btn-secondary">&laquo; Previous</a>
                    <?php endif; ?>

                    <span style="color: var(--text-muted); font-size: 0.95rem;">Page <strong><?= $page ?></strong> of <strong><?= $total_pages ?></strong></span>

                    <?php if ($page < $total_pages): ?>
                        <?php $query_params['page'] = $page + 1; ?>
                        <a href="browse.php?<?= http_build_query($query_params) ?>" class="btn btn-primary">Next &raquo;</a>
                    <?php endif; ?>
                </div>
                <?php
            }
        } else {
            ?>
            <div class="empty-state">
                <div class="empty-state-title">No Pets Found</div>
                <div class="empty-state-desc">
                    We couldn't find any pets matching your filter criteria. Try broadening your search or resetting filters.
                </div>
                <a href="browse.php" class="btn btn-secondary">Reset Filters</a>
            </div>
            <?php
        }
    } else {
        ?>
        <div class="empty-state">
            <div class="empty-state-title">Database Offline</div>
            <div class="empty-state-desc">Unable to query the pet database right now. Please check back shortly.</div>
        </div>
        <?php
    }
    ?>
</main>

<?php include ('includes/footer.php'); ?>

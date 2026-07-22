# Silly Sanctuary — I210 Final

Interactive web-based pet adoption portal featuring companions from the Silly Cats and Gnarp Gnaplian universes (including notable figures like *Geeble*, *Gnapy*, and *Bleemk*). Refactored and modernized from a legacy INFO-I210 PHP/MySQL codebase to contemporary full-stack web standards, incorporating sleek glassmorphic UI design, 100% SQL prepared statements, session-based reservation cart workflows, role-based authentication, and admin CRUD controls.

## Live Deployment

- [Silly Sanctuary Live Preview](https://sillysanctuary.projects.havenhamelin.work)

## Key Features

- **Pet Roster & Dynamic Filtering**: Search adoptable pets by title, description, character traits, animal type, or breed using prepared statements. Includes dynamic AJAX breed loading (`get_breeds.php` + `updateBreeds.js`).
- **Interactive Pet Showcase**: Detailed 2-column showcase page (`animal_details.php`) featuring high-resolution pet artwork, personality tags, lore descriptions, availability status, and direct reservation actions.
- **Reservation Cart Engine**: Persistent session cart (`add_to_cart.php`, `show_cart.php`, `remove_from_cart.php`) allowing users to curate pet adoption requests, review cart summaries, and confirm reservations (`checkout.php`).
- **User & Admin Reservation Portals**: User-facing tracking page (`my_reservations.php`) to monitor active and past adoption requests, and an administrative control panel (`manage_reservations.php`) to review, approve, reject, or fulfill user reservations.
- **Role-Based Authentication**: Secure sign-in (`login.php`) and account registration (`register.php`) system managing session state (`$_SESSION['role']`) with explicit access control separating standard adopters from administrators.
- **Administrative CRUD & Uploads**: Dedicated admin tools to create new pet listings (`add_new.php`) and update or delete existing entries (`edit.php`), including file upload handling for pet portrait assets.
- **Glassmorphic Navigation & Alerts**: Sticky responsive glassmorphic navbar (`includes/navbar.php`) featuring a real-time reservation cart badge and user state indicators, backed by a session flash notification engine (`includes/alert.php`).

---

## Modernization & Security Refactoring

| Technical Aspect | Legacy Implementation | Modernized Standard |
| :--- | :--- | :--- |
| **Database Security** | Vulnerable raw SQL string concatenation (`LIKE '%$terms%'`) | 100% Parameterized Prepared Statements (`mysqli::prepare` & `bind_param`) across all endpoints |
| **Aesthetics & UI/UX** | Plain light-grey borders, default browser fonts, raw unstyled forms | Modular CSS custom property design system (`theme.css`), dark mode glassmorphism, Google Fonts (`Fredoka` & `Space Grotesk`), micro-interactions |
| **User Notifications** | Unhandled raw `die()` error screens and default browser alert popups | Dynamic session-based flash notification system (`includes/alert.php`) with dismissible contextual alert banners |
| **Navigation & State** | Static HTML navbar with manual link state checks | Sticky glassmorphic header (`includes/navbar.php`) with live cart item counter, session state checks, and active page indicators |
| **Database Architecture** | Unsanitized queries with basic connection checks | UTF-8 connection wrapper (`includes/connect.php`) with graceful fallback error states |

---

## CRUD & Reservation Coverage

- **Create**:
  - Add new adoptable pets (`add_new.php`) with image upload and AJAX breed selection.
  - Register new adopter accounts (`register.php`).
  - Submit pet adoption reservations (`checkout.php`).
- **Read**:
  - Browse pet roster with keyword search and breed filters (`browse.php`, `get_breeds.php`).
  - View comprehensive pet showcase profiles (`animal_details.php`).
  - View user reservation history (`my_reservations.php`) and admin reservation manager (`manage_reservations.php`).
- **Update**:
  - Edit existing pet details and update artwork (`edit.php`).
  - Update reservation request statuses (Pending, Approved, Rejected, Fulfilled) via admin panel (`manage_reservations.php`).
- **Delete**:
  - Delete pet listings from database and unlink media assets (`edit.php`).
  - Remove items from reservation cart (`remove_from_cart.php`).

---

## Tech Stack & Architecture

- **Backend / Scripting**: PHP 8.3+ (Session handling, Prepared MySQLi Statements, File Upload Processing)
- **Database**: MySQL / MariaDB (Relational schema `db/pet_adoption.sql`)
- **Frontend / Markup**: HTML5, Vanilla CSS3 (Custom CSS Properties, Responsive Flexbox/Grid, Glassmorphism UI)
- **Scripting & Dynamic Loading**: Vanilla JavaScript ES6 (Fetch API for dynamic breed loading `updateBreeds.js`)
- **Typography**: Google Fonts (`Fredoka`, `Space Grotesk`)

---

## Directory Structure

- `index.php` – Landing page featuring hero banner, project highlight, and featured pet showcase.
- `browse.php` – Filterable pet catalog with search inputs and animal type/breed dropdowns.
- `animal_details.php` – 2-column showcase page displaying full pet profile, traits, and reservation button.
- `show_cart.php` – Reservation cart view with item listings, quantity subtotals, and checkout link.
- `add_to_cart.php` – Session cart processor for adding pets to active adoption request.
- `remove_from_cart.php` – Session cart processor for removing pets from active adoption request.
- `checkout.php` – Reservation checkout processor creating database reservation records.
- `my_reservations.php` – User dashboard displaying personal adoption reservation history and statuses.
- `manage_reservations.php` – Admin dashboard for reviewing, approving, rejecting, or fulfilling reservations.
- `add_new.php` – Admin form for adding new pet entries with AJAX breed selection and file upload.
- `edit.php` – Admin page for modifying pet profiles, replacing artwork, or deleting records.
- `get_breeds.php` – JSON API endpoint delivering breed lists filtered by animal type.
- `loginform.php` – Authentication interface containing Sign-In and Register forms.
- `login.php` – Authentication processor verifying credentials using prepared statements.
- `register.php` – User registration handler inserting sanitized user records.
- `logout.php` – Session cleanup and sign-out handler.
- `contact.php` – Adopter inquiry form page.
- `error.php` – System error display page for graceful exception reporting.
- `db/pet_adoption.sql` – Database dump containing table schemas and initial seed data.
- `includes/config.php` – Database connection parameters ($servername, $db_username, $db_password, $database).
- `includes/connect.php` – MySQLi connection setup with UTF-8 character encoding.
- `includes/header.php` – HTML `<head>` include for metadata, web fonts, and CSS linkages.
- `includes/navbar.php` – Sticky glassmorphic header component with live cart count and auth state.
- `includes/footer.php` – Responsive footer component.
- `includes/alert.php` – Session flash alert engine for displaying contextual status messages.
- `www/css/theme.css` – Design tokens, CSS variables, glassmorphism utilities, and base styles.
- `www/css/styles.css` – Global layout, navbar, footer, and utility component styles.
- `www/css/index.css` – Homepage hero section and card grid styling.
- `www/css/browse.css` – Catalog grid, filter sidebar, and card layout styles.
- `www/css/animal_details.css` – Detailed profile showcase layout styles.
- `www/css/edit.css` – Admin form and file upload preview styles.
- `www/js/updateBreeds.js` – Client-side script making AJAX requests to update breed dropdowns dynamically.

---

## Local Setup

### 1. Requirements
- Web server environment (Apache / Nginx / PHP built-in server) running **PHP 8.0+**
- **MySQL** or **MariaDB** server

### 2. Clone Repository
```bash
git clone https://github.com/havenhamelin/i210-final.git
cd i210-final
```

### 3. Database Initialization
Import `db/pet_adoption.sql` into your MySQL server:
```bash
mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS pet_adoption;"
mysql -u root -p pet_adoption < db/pet_adoption.sql
```

### 4. Database Configuration
Ensure `includes/config.php` matches your local MySQL database credentials:
```php
<?php
$servername = "localhost";
$db_username = "root";
$db_password = "";
$database = "pet_adoption";
?>
```

### 5. Run Local Development Server
Start PHP's built-in web server or launch via `npm`:
```bash
# Using npm script
npm start

# Or directly with PHP
php -S localhost:8000
```
Open `http://localhost:8000` in your web browser.

---

## Pre-seeded Test Accounts

| Username | Password | Role | Access Level |
| :--- | :--- | :--- | :--- |
| `admin` | `password` | Admin (Role 1) | Full CRUD (Add, Edit, Delete pets, Manage Reservations) |
| `user` | `password` | Adopter (Role 2) | Browse Roster, Reserve Pets, View My Reservations, Contact |

---

## Author

**Haven Hamelin**  
*Full-Stack Developer & UI/UX Designer*  
Portfolio: [Haven Hamelin Portfolio](https://havenhamelin.work)

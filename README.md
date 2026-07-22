# 🐾 Silly Sanctuary — Pet Adoption Portal

> **Portfolio Modernization Showcase** | Refactored from legacy INFO-I210 codebase to modern UI/UX, security, and design system standards.

![PHP](https://img.shields.io/badge/PHP-8.3%2B-777BB4?style=for-the-badge&logo=php&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-MariaDB-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-Glassmorphism-1572B6?style=for-the-badge&logo=css3&logoColor=white)
![JavaScript](https://img.shields.io/badge/JavaScript-ES6%2B-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black)

---

## 🌟 Overview

**Silly Sanctuary** is an interactive web-based pet adoption portal featuring companions from the Silly Cats and Gnarp Gnaplian universes (including notable figures like *Geeble*, *Gnapy*, and *Bleemk*). Originally written as a foundational web development final project in late 2024, this repository has been comprehensively refactored and modernized to align with contemporary full-stack standards, sleek glassmorphic UI design, robust security patterns, and modular architecture.

---

## ✨ Modernization Highlights

| Dimension | Legacy Version (Dec 2024) | Modernized Version (2026 Standard) |
| :--- | :--- | :--- |
| **Aesthetics & UI** | Plain light-grey borders, default browser fonts, raw unstyled forms | Custom CSS variable design tokens (`theme.css`), dark mode glassmorphism, Google Fonts (`Fredoka` & `Space Grotesk`), hover animations, retro badges |
| **Security** | Vulnerable raw SQL string concatenation (`LIKE '%$terms%'`) | 100% Parameterized Prepared Statements (`mysqli::prepare` & `bind_param`) |
| **User Experience** | Raw `die()` error screens and default browser alerts | Custom non-blocking flash alert notifications (`alert.php`), empty state components, dynamic breed filters |
| **Header & Nav** | Static unstyled HTML navbar | Sticky glassmorphic navbar, active link indicators, real-time cart counter badge, admin status indicator |
| **Database Integration** | Basic MySQL queries with minimal error checks | UTF-8 sanitized connection wrapper (`connect.php`) with graceful fallback error states |

---

## 🚀 Key Features

- 🔍 **Pet Roster & Search**: Search adoptable pets by name, behavior traits, animal type, or breed using SQL prepared statements.
- 🐈 **Interactive Pet Showcase**: Detailed 2-column pet profiles featuring high-res imagery, characteristic pill tags, lore descriptions, and reservation actions.
- 🛒 **Reservation Cart System**: Persistent session cart allowing users to add/remove multiple pets, view item previews, and complete reservation requests.
- 🔐 **User Authentication**: Secure Sign-in and Registration system with session state tracking and role-based permissions (User vs Admin).
- 🛠️ **Admin Management (CRUD)**: Dedicated admin controls to add new pet listings with dynamic AJAX breed populating (`updateBreeds.js`) and update/delete existing entries with image uploads.
- 📬 **Contact Hub & Alert Engine**: Integrated contact form and universal alert engine (`includes/alert.php`) providing feedback for auth actions, cart updates, and errors.

---

## 📁 Repository Structure

```
i210-final/
├── index.php                 # Landing page with hero banner & featured roster
├── browse.php                # Pet catalog with search & filter engine
├── animal_details.php        # Comprehensive 2-column pet showcase profile
├── show_cart.php             # Pet reservation list & checkout trigger
├── add_to_cart.php           # Session cart add handler
├── remove_from_cart.php      # Session cart item removal handler
├── checkout.php              # Reservation confirmation page
├── add_new.php               # Admin interface to create pet entries
├── edit.php                  # Admin interface to update or delete pet entries
├── get_breeds.php            # AJAX API endpoint for animal breed filtering
├── loginform.php             # Dual Sign-in and Registration form page
├── login.php                 # Auth processor with prepared query check
├── register.php              # Account registration processor
├── logout.php                # Session cleanup & sign-out handler
├── contact.php               # Customer inquiry contact page
├── error.php                 # Graceful error notification container
├── db/
│   └── pet_adoption.sql      # Database schema dump & seed data
├── includes/
│   ├── config.php            # Database credential configuration
│   ├── connect.php           # MySQLi connection wrapper with UTF-8 setup
│   ├── header.php            # Global <head> markup, meta tags & fonts
│   ├── navbar.php           # Sticky glassmorphic header component
│   ├── footer.php            # Site-wide responsive footer component
│   └── alert.php             # Flash notification banner engine
└── www/
    ├── css/
    │   ├── theme.css         # Design system tokens, variables, & utilities
    │   ├── styles.css        # Global navigation & footer styles
    │   ├── index.css         # Hero banner & feature grid layout
    │   ├── browse.css        # Pet card grid & search bar styles
    │   ├── animal_details.css# Profile showcase & breadcrumb styles
    │   └── edit.css          # Admin form & file upload preview styles
    ├── js/
    │   └── updateBreeds.js   # Dynamic breed dropdown AJAX listener
    └── img/                  # Pet roster photos & SVG icons
```

---

## 🛠️ Local Setup Instructions

### Prerequisites
- Local Web Server (e.g., Apache / Nginx) with **PHP 8.0+**
- **MySQL / MariaDB** Server

### Installation Steps

1. **Clone or Download Repository**:
   ```bash
   git clone https://github.com/havenhamelin/i210-final.git
   cd i210-final
   ```

2. **Import Database Schema**:
   Import `db/pet_adoption.sql` into your MySQL server via phpMyAdmin or MySQL CLI:
   ```bash
   mysql -u root -p -e "CREATE DATABASE IF NOT EXISTS pet_adoption;"
   mysql -u root -p pet_adoption < db/pet_adoption.sql
   ```

3. **Configure Database Credentials**:
   Update `includes/config.php` with your local database connection credentials:
   ```php
   $servername = "localhost";
   $db_username = "your_db_user";
   $db_password = "your_db_password";
   $database = "pet_adoption";
   ```

4. **Run Application**:
   Serve the project directory using Apache, Nginx, or PHP's built-in development server:
   ```bash
   php -S localhost:8000
   ```
   Open `http://localhost:8000` in your web browser.

---

## 🔐 Pre-seeded Test Accounts

| Username | Password | Role | Permissions |
| :--- | :--- | :--- | :--- |
| `admin` | `password` | Admin (Role 1) | Full CRUD access (Add, Edit, Delete pets) |
| `user` | `password` | User (Role 2) | Browse roster, Reserve pets, Contact staff |

---

## 👤 Author

**Haven Hamelin**  
*Full-Stack Developer & UI/UX Designer*  
Portfolio & Projects: [Haven Hamelin Portfolio](https://github.com/havenhamelin)

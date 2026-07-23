<?php
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Detect referral from portfolio
$referer = $_SERVER['HTTP_REFERER'] ?? '';
$host = $_SERVER['HTTP_HOST'] ?? '';
$host_name = !empty($host) ? explode(':', $host)[0] : '';
$raw_uri = $_SERVER['REQUEST_URI'] ?? '';
$raw_query = $_SERVER['QUERY_STRING'] ?? '';

$is_from_param = (isset($_GET['from']) && strtolower($_GET['from']) === 'portfolio') ||
                 (isset($_GET['ref']) && strtolower($_GET['ref']) === 'portfolio') ||
                 (strpos(strtolower($raw_query), 'from=portfolio') !== false) ||
                 (strpos(strtolower($raw_query), 'ref=portfolio') !== false) ||
                 (strpos(strtolower($raw_uri), 'from=portfolio') !== false) ||
                 (strpos(strtolower($raw_uri), 'ref=portfolio') !== false);

$referer_host = !empty($referer) ? parse_url($referer, PHP_URL_HOST) : null;
$is_internal_referer = !empty($referer_host) && !empty($host_name) && ($referer_host === $host_name);

$is_external_portfolio_referer = !empty($referer) && !$is_internal_referer && (
    strpos(strtolower($referer), 'havenhamelin.work') !== false ||
    strpos(strtolower($referer), 'wasworld.xyz') !== false ||
    strpos(strtolower($referer), 'portfolio') !== false
);

if ($is_external_portfolio_referer) {
    // Fresh arrival from external portfolio site
    $_SESSION['from_portfolio'] = true;
    unset($_SESSION['from_portfolio_dismissed']);
    $_SESSION['portfolio_url'] = htmlspecialchars($referer);
} elseif ($is_from_param) {
    // Fresh arrival with ?from=portfolio parameter
    $_SESSION['from_portfolio'] = true;
    unset($_SESSION['from_portfolio_dismissed']);
} elseif ($is_internal_referer) {
    // Internal navigation within the app - preserve existing session state
} else {
    // Direct manual entry without portfolio referer or param - clear portfolio mode
    unset($_SESSION['from_portfolio']);
    unset($_SESSION['from_portfolio_dismissed']);
}

// Handle explicit dismiss query parameter
if (isset($_GET['dismiss_portfolio_banner']) && $_GET['dismiss_portfolio_banner'] == '1') {
    $_SESSION['from_portfolio_dismissed'] = true;
}

// Determine return target URL
$portfolio_url = $_SESSION['portfolio_url'] ?? "https://havenhamelin.work";

$show_banner = !empty($_SESSION['from_portfolio']) && empty($_SESSION['from_portfolio_dismissed']);
?>

<?php if ($show_banner): ?>
<style>
/* Universal Standalone Portfolio Return Banner Styles */
#portfolioReturnBanner.portfolio-return-banner {
    display: block !important;
    background: linear-gradient(90deg, #0f172a 0%, #1e293b 50%, #0f172a 100%) !important;
    border-bottom: 2px solid #38bdf8 !important;
    box-shadow: 0 4px 16px rgba(15, 23, 42, 0.4) !important;
    color: #f8fafc !important;
    font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Helvetica, Arial, sans-serif !important;
    padding: 10px 20px !important;
    position: relative !important;
    width: 100% !important;
    box-sizing: border-box !important;
    z-index: 999999 !important;
    max-height: 200px !important;
    overflow: hidden !important;
    transition: max-height 0.3s ease, padding 0.3s ease, margin 0.3s ease, opacity 0.3s ease !important;
}

#portfolioReturnBanner.portfolio-banner-closing {
    max-height: 0 !important;
    padding-top: 0 !important;
    padding-bottom: 0 !important;
    margin-top: 0 !important;
    margin-bottom: 0 !important;
    border-bottom-width: 0 !important;
    border-bottom-color: transparent !important;
    opacity: 0 !important;
}

#portfolioReturnBanner .portfolio-banner-container {
    max-width: 1200px !important;
    margin: 0 auto !important;
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    gap: 16px !important;
    flex-wrap: wrap !important;
}

#portfolioReturnBanner .portfolio-banner-content {
    display: flex !important;
    align-items: center !important;
    gap: 12px !important;
    font-size: 0.9rem !important;
    color: #e2e8f0 !important;
}

#portfolioReturnBanner .portfolio-banner-badge {
    background: #0284c7 !important;
    color: #ffffff !important;
    font-weight: 700 !important;
    font-size: 0.72rem !important;
    text-transform: uppercase !important;
    letter-spacing: 0.06em !important;
    padding: 3px 10px !important;
    border-radius: 20px !important;
    display: inline-block !important;
}

#portfolioReturnBanner .portfolio-banner-text {
    color: #e2e8f0 !important;
}

#portfolioReturnBanner .portfolio-banner-actions {
    display: flex !important;
    align-items: center !important;
    gap: 14px !important;
}

#portfolioReturnBanner .portfolio-return-btn {
    display: inline-flex !important;
    align-items: center !important;
    gap: 8px !important;
    background: rgba(56, 189, 248, 0.12) !important;
    color: #38bdf8 !important;
    border: 1px solid #38bdf8 !important;
    padding: 6px 14px !important;
    border-radius: 6px !important;
    font-size: 0.85rem !important;
    font-weight: 600 !important;
    text-decoration: none !important;
    transition: all 0.2s ease !important;
}

#portfolioReturnBanner .portfolio-return-btn:hover {
    background: #38bdf8 !important;
    color: #0f172a !important;
    box-shadow: 0 0 10px rgba(56, 189, 248, 0.4) !important;
    text-decoration: none !important;
}

#portfolioReturnBanner .portfolio-banner-close {
    background: transparent !important;
    border: none !important;
    color: #94a3b8 !important;
    font-size: 1.3rem !important;
    line-height: 1 !important;
    cursor: pointer !important;
    padding: 0 4px !important;
    transition: color 0.2s ease !important;
}

#portfolioReturnBanner .portfolio-banner-close:hover {
    color: #f43f5e !important;
}

@media (max-width: 768px) {
    #portfolioReturnBanner .portfolio-banner-container {
        flex-direction: column !important;
        align-items: flex-start !important;
        gap: 10px !important;
    }
    #portfolioReturnBanner .portfolio-banner-actions {
        width: 100% !important;
        justify-content: space-between !important;
    }
}
</style>

<div class="portfolio-return-banner" id="portfolioReturnBanner">
    <div class="portfolio-banner-container">
        <div class="portfolio-banner-content">
            <span class="portfolio-banner-badge">Portfolio Demo</span>
            <span class="portfolio-banner-text">You are currently viewing a live demo project by <strong>Haven Hamelin</strong>.</span>
        </div>
        <div class="portfolio-banner-actions">
            <a href="<?= $portfolio_url ?>" class="portfolio-return-btn" title="Return to Portfolio">
                <svg viewBox="0 0 24 24" width="15" height="15" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                    <line x1="19" y1="12" x2="5" y2="12"></line>
                    <polyline points="12 19 5 12 12 5"></polyline>
                </svg>
                Return to Portfolio
            </a>
            <button type="button" class="portfolio-banner-close" id="closePortfolioBanner" aria-label="Dismiss banner">&times;</button>
        </div>
    </div>
</div>
<script>
document.addEventListener('DOMContentLoaded', function() {
    var closeBtn = document.getElementById('closePortfolioBanner');
    var banner = document.getElementById('portfolioReturnBanner');
    if (closeBtn && banner) {
        closeBtn.addEventListener('click', function() {
            banner.classList.add('portfolio-banner-closing');
            setTimeout(function() {
                banner.style.display = 'none';
            }, 300);
            try {
                sessionStorage.setItem('from_portfolio_dismissed', 'true');
                sessionStorage.removeItem('from_portfolio');
            } catch(e) {}
            var url = new URL(window.location.href);
            url.searchParams.set('dismiss_portfolio_banner', '1');
            fetch(url.toString(), { method: 'GET', credentials: 'same-origin' }).catch(function(){});
        });
    }
});
</script>
<?php else: ?>
<script>
try {
    sessionStorage.removeItem('from_portfolio');
    sessionStorage.setItem('from_portfolio_dismissed', 'true');
} catch(e) {}
</script>
<?php endif; ?>

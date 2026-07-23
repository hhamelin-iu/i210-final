<?php
/**
 * Deadpan Flash Alert Component (No Emojis)
 */
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

function set_alert($message, $type = 'info') {
    $_SESSION['flash_alert'] = [
        'message' => $message,
        'type' => $type // 'info', 'success', 'warning', 'error'
    ];
}

function render_alert() {
    if (!isset($_SESSION['flash_alert'])) {
        return;
    }
    
    $alert = $_SESSION['flash_alert'];
    unset($_SESSION['flash_alert']);
    
    $bg_color = 'rgba(0, 240, 255, 0.15)';
    $border_color = '#00f0ff';
    $tag = '[NOTICE]';
    $text_color = '#a5f3fc';

    if ($alert['type'] === 'success') {
        $bg_color = 'rgba(57, 255, 20, 0.15)';
        $border_color = '#39ff14';
        $tag = '[SUCCESS]';
        $text_color = '#bbf7d0';
    } elseif ($alert['type'] === 'error') {
        $bg_color = 'rgba(255, 0, 127, 0.2)';
        $border_color = '#ff007f';
        $tag = '[ERROR]';
        $text_color = '#fbcfe8';
    } elseif ($alert['type'] === 'warning') {
        $bg_color = 'rgba(255, 238, 0, 0.15)';
        $border_color = '#ffee00';
        $tag = '[ATTENTION]';
        $text_color = '#fef08a';
    }

    echo "
    <div style='width: calc(100% - 32px); max-width: 1200px; margin: 18px auto; padding: 14px 18px; background: {$bg_color}; border: 2px solid {$border_color}; border-radius: 18px 8px 18px 8px; color: {$text_color}; display: flex; align-items: center; justify-content: space-between; font-weight: 500; gap: 12px; box-shadow: 0 0 15px {$border_color};'>
        <div style='display: flex; align-items: center; gap: 10px; flex: 1; flex-wrap: wrap;'>
            <span style='font-family: var(--font-pixel); font-size: 0.75rem; letter-spacing: 0.05em; background: rgba(0,0,0,0.4); padding: 4px 8px; border-radius: 6px; border: 1px solid {$border_color};'>{$tag}</span>
            <span style='word-break: break-word;'>" . htmlspecialchars($alert['message']) . "</span>
        </div>
        <button onclick='this.parentElement.remove()' style='background: none; border: none; color: {$text_color}; cursor: pointer; font-size: 1.3rem; font-weight: bold; padding: 0 4px;'>&times;</button>
    </div>
    ";
}

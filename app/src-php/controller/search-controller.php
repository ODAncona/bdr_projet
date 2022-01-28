<?php
if (!$CURRENT_USER->isAuthenticated()) {
    header("Location: /login ", true, 302);
    exit();
}

require(__DIR__ . '/../view/page-search.php');

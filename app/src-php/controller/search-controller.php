<?php
if (!$CURRENT_USER->isAuthenticated()) {
    header("Location: /login ", true, 302);
    exit();
}

$dbView = new DBView($DB_CLIENT, 'vBière');

$beers = array();
if (!empty($_GET['searchInput'])) {
    $serachString = '%' . $_GET['searchInput'] . '%';
    $dbView->addFilter('nomBière', $serachString, 'ILIKE');
    $dbView->fetch();
    $beersArray = $dbView->getData();
}

require(__DIR__ . '/../view/page-search.php');

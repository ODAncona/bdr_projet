<?php
if (!$CURRENT_USER->isAuthenticated()) {
    header("Location: /login ", true, 302);
    exit();
}

$tableToPrint;

$tableToPrint = new DBView($DB_CLIENT, 'vFavoris');
try {
    $tableToPrint->addFilter('idpersonne', $CURRENT_USER->getId());
    $tableToPrint->fetch();
    $tableToPrint->getData();
} catch(PDOException $e) {
    throw $e;
}


if (isset($_GET['ajax']) && $_GET['ajax'] === 'true') {
    require(__DIR__ . '/../view/components/component-table.php');
} else {
    require(__DIR__ . '/../view/page-table.php');
}

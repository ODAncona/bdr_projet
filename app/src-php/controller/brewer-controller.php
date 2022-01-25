<?php

$tableToPrint;
$tableToPrint = new DBView($DB_CLIENT, 'vBrasserie');
try {
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
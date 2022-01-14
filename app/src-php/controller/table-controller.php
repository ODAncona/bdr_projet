<?php

$filters = DB_Table::getTablesNames();

$tableToPrint;

if(isset($_GET['table'])) {
    $tableName = htmlspecialchars($_GET['table']);
    $tableToPrint = new DB_Table($DB_CLIENT, $tableName);
    $tableToPrint->fetch();
}

if(isset($_GET['ajax']) && $_GET['ajax'] === 'true') {
    require(__DIR__ . '/../view/components/component-table.php');
} else {
    require(__DIR__ . '/../view/page-table.php');
}


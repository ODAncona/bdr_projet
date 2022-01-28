<?php

$v1 = new DBView($DB_CLIENT, 'vBière');

try {
    // Récupération des Bières
    $v1->fetch();
} catch(PDOException $e) {
    throw $e;
}

$cheapBeers = $v1->getData();
require(__DIR__ . '/../view/page-home.php');

<?php

$tableToPrint;
$tableToPrint = new DBView($DB_CLIENT, 'vBrasserie');

if (isset($_GET['id'])) {

    // Récupérer les données
    $breweries = array();
    $id = $_GET['id'];
    $sql = "SELECT * FROM vBrasserie WHERE id = :id ";
    $PDOStatement = $DB_CLIENT->prepare($sql);
    if ($PDOStatement->execute([':id' => $id])) {
        $breweries = $PDOStatement->fetchAll(PDO::FETCH_ASSOC);
    }
    $beers = array();
    $sql2 = "SELECT * FROM vBière WHERE idBrasserie = :id ";
    $PDOStatement2 = $DB_CLIENT->prepare($sql2);
    if ($PDOStatement2->execute([':id' => $id])) {
        $beers = $PDOStatement2->fetchAll(PDO::FETCH_ASSOC);
    }
    //$PDOStatement->debugDumpParams();

    require(__DIR__ . '/../view/page-brewery.php');
    exit;
}

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

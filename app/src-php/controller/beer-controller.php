<?php

$beerTypes = new BeerType($DB_CLIENT);
$beerTypes->fetch();

$filters = $beerTypes->getData();


$tableToPrint;

$tableToPrint = new DBView($DB_CLIENT, 'vBière');



if (isset($_GET['table'])) {
    $tableToPrint->addFilter('nomTypeBière', $_GET['table']);
}

if (isset($_GET['nom']) && isset($_GET['id'])) {
    
    // Récupérer les données
    $data = array();
    $nom = $_GET['nom'];
    $id = $_GET['id'];
    $sql = "SELECT * FROM vBière WHERE nomBière = :nom AND idBrasserie = :id ";
    $PDOStatement = $DB_CLIENT->prepare($sql);
    if ($PDOStatement->execute([':nom' => $nom, ':id' => $id])) {
        $data = $PDOStatement->fetchAll(PDO::FETCH_ASSOC);
    }
    $PDOStatement->debugDumpParams();

    require(__DIR__ . '/../view/page-beer.php');
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
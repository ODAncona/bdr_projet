<?php

$beerTypes = new BeerType($DB_CLIENT);
$beerTypes->fetch();

$filters = $beerTypes->getData();

$dbView = new DBView($DB_CLIENT, 'vBière');

if (isset($_GET['table'])) {
    $dbView->addFilter('nomTypeBière', $_GET['table']);
}

if (isset($_GET['nom']) && isset($_GET['id'])) {
    // Ajout des clauses WHERE
    $dbView->addFilter('nomBière', $_GET['nom']);
    $dbView->addFilter('idBrasserie', $_GET['id']);
    // Lien logique entre les clauses WHERE
    $dbView->setFiltersLogicalLink('AND');
}

try {
    // Récupération des données
    $dbView->fetch();
} catch(PDOException $e) {
    throw $e;
}

if (isset($_GET['nom']) && isset($_GET['id'])) {

    // Récupérer les données sous forme de tableau associatif
    $beers = $dbView->getData();
    // $nom = $_GET['nom'];
    // $id = $_GET['id'];
    // $sql = "SELECT * FROM vBière WHERE nomBière = :nom AND idBrasserie = :id ";
    // $PDOStatement = $DB_CLIENT->prepare($sql);
    // if ($PDOStatement->execute([':nom' => $nom, ':id' => $id])) {
    //     $data = $PDOStatement->fetchAll(PDO::FETCH_ASSOC);
    // }
    //$PDOStatement->debugDumpParams();

    $reviews = array();
    $nom = $_GET['nom'];
    $id = $_GET['id'];
    $sql = "SELECT * FROM vAvis WHERE nomBière = :nom AND idBrasserie = :id ";
    $PDOStatement = $DB_CLIENT->prepare($sql);
    if ($PDOStatement->execute([':nom' => $nom, ':id' => $id])) {
        $reviews = $PDOStatement->fetchAll(PDO::FETCH_ASSOC);
    }
    //$PDOStatement->debugDumpParams();


    require(__DIR__ . '/../view/page-beer.php');
    exit;
}



$tableToPrint = $dbView;
if (isset($_GET['ajax']) && $_GET['ajax'] === 'true') {
    require(__DIR__ . '/../view/components/component-table.php');
} else {
    require(__DIR__ . '/../view/page-table.php');
}

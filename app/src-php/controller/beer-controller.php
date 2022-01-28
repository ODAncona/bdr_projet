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

    $beers = $dbView->getData();

    $DBViewReviews = new DBView($DB_CLIENT, 'vAvis');
    $DBViewReviews->addFilter('nomBière', $_GET['nom']);
    $DBViewReviews->addFilter('idBrasserie', $_GET['id']);
    $reviews = $DBViewReviews->getData();
    $DBViewReviews->fetch();
    $reviews = $DBViewReviews->getData();
    require(__DIR__ . '/../view/page-beer.php');
    exit;
}



$tableToPrint = $dbView;
$beerArray = $dbView->getData();
if (isset($_GET['ajax']) && $_GET['ajax'] === 'true') {
    require(__DIR__ . '/../view/components/component-beer.php');
} else {

    require(__DIR__ . '/../view/page-all-beer.php');
}

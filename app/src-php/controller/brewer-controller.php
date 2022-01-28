<?php

$viewBreweries = new DBView($DB_CLIENT, 'vBrasserie');
$viewBeer = new DBView($DB_CLIENT, 'vBière');

if (isset($_GET['id'])) {
    // Ajout des clauses WHERE
    $viewBreweries->addFilter('id', $_GET['id']);
    $viewBeer->addFilter('idBrasserie', $_GET['id']);
    // Lien logique entre les clauses WHERE
    $viewBreweries->setFiltersLogicalLink('AND');
    $viewBeer->setFiltersLogicalLink('AND');
    try {
        // Récupération des Bières
        $viewBeer->fetch();
    } catch(PDOException $e) {
        throw $e;
    }
}

try {
    // Récupération des Brasseries
    $viewBreweries->fetch();
} catch(PDOException $e) {
    throw $e;
}

if(isset($_GET['id'])){
      $breweries = $viewBreweries->getData();
      $beers =  $viewBeer->getData();
      require(__DIR__ . '/../view/page-brewery.php');
      exit;
}


$breweryArray = $viewBreweries->getData();
require(__DIR__ . '/../view/page-all-breweries.php');

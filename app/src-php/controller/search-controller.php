<?php
if (!$CURRENT_USER->isAuthenticated()) {
    header("Location: /login ", true, 302);
    exit();
}


$beers = array();
if (!empty($_GET['searchInput'])) {

    $serachString;
    if (isset($_GET['searchOption'])) {
        if ($_GET['searchOption'] === 'exactMatch') {
            $serachString = $_GET['searchInput'];
        }
    } else {
        $serachString = '%' . $_GET['searchInput'] . '%';
    }

    
    $viewName = 'vBière';
    $columnName = '';
    $searchCategory = 'beer';

    if (!empty($_GET['radioChoice'])) {
        if ($_GET['radioChoice'] === 'beer') {
            $viewName = 'vBière';
            $columnName = 'nomBière';
            $searchCategory = 'beer';
        } elseif ($_GET['radioChoice'] === 'brewery') {
            $viewName = 'vBrasserie';
            $columnName = 'nomBrasserie';
            $searchCategory = 'brewery';
        }
    }

    $dbView = new DBView($DB_CLIENT, $viewName);
    if (!empty($columnName)) {
        $dbView->addFilter($columnName, $serachString, 'ILIKE');
    }
    $dbView->fetch();

    $beersArray = array();
    $breweryArray = array();
    if ($searchCategory === 'beer') {
        $beersArray = $dbView->getData();
    } elseif ($searchCategory === 'brewery') {
        $breweryArray = $dbView->getData();
    }
    
}

require(__DIR__ . '/../view/page-search.php');

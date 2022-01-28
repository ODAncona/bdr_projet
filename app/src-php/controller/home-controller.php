<?php

// Les moins chères -----------------------------------
$vCheap = new DBView($DB_CLIENT, 'vBière');
$vCheap.setLimit(5);

try {
    // Récupération des Bières
    $vCheap->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les mieux notées -----------------------------------
$vBestMark = new DBView($DB_CLIENT, 'vBière');
$vBestMark.setLimit(5);
try {
    // Récupération des Bières
    $vBestMark->fetch();
} catch(PDOException $e) {
    throw $e;
}

//Les moins connues -----------------------------------
$vLessKnown = new DBView($DB_CLIENT, 'vBière');
$vLessKnown.setLimit(5);
try {
    // Récupération des Bières
    $vLessKnown->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus commandées -----------------------------------
$vMostOrdered = new DBView($DB_CLIENT, 'vBière');
$vMostOrdered.setLimit(5);
try {
    // Récupération des Bières
    $vMostOrdered->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus commentées -----------------------------------
$vMostCommented = new DBView($DB_CLIENT, 'vBière');
$vMostCommented.setLimit(5);
try {
    // Récupération des Bières
    $vMostCommented->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus récentes -----------------------------------
$vMostRecent = new DBView($DB_CLIENT, 'vBière');
$vMostRecent.setLimit(5);
try {
    // Récupération des Bières
    $vMostRecent->fetch();
} catch(PDOException $e) {
    throw $e;
}

$cheapBeers = $vCheap->getData();
$bestMarkBeers = $vBestMark->getData();
$lessKnownBeers = $vLessKnown->getData();
$mostOrderedBeers = $vMostOrdered->getData();
$mostCommentedBeers = $vMostCommented->getData();
$mostRecentBeers = $vMostRecent->getData();
require(__DIR__ . '/../view/page-home.php');

<?php

// Les moins chères -----------------------------------
$vCheap = new DBView($DB_CLIENT, 'vBièresmoinschèresquelamoyenne');
$vCheap->setLimit(4);

try {
    // Récupération des Bières
    $vCheap->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les mieux notées -----------------------------------
$vBestMark = new DBView($DB_CLIENT, 'vbièresmieuxnotées');
$vBestMark->setLimit(4);
try {
    // Récupération des Bières
    $vBestMark->fetch();
} catch(PDOException $e) {
    throw $e;
}

//Les moins connues -----------------------------------
$vLessKnown = new DBView($DB_CLIENT, 'vbièresjamaiscommandées');
$vLessKnown->setLimit(4);
try {
    // Récupération des Bières
    $vLessKnown->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus commandées -----------------------------------
$vMostOrdered = new DBView($DB_CLIENT, 'vBièrespluscommandées');
$vMostOrdered->setLimit(4);
try {
    // Récupération des Bières
    $vMostOrdered->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus commentées -----------------------------------
$vMostCommented = new DBView($DB_CLIENT, 'vBièrespluscommentées');
$vMostCommented->setLimit(4);
try {
    // Récupération des Bières
    $vMostCommented->fetch();
} catch(PDOException $e) {
    throw $e;
}

// Les plus récentes -----------------------------------
$vMostRecent = new DBView($DB_CLIENT, 'vBièresplusrécentes');
$vMostRecent->setLimit(4);
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

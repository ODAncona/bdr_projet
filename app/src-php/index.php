<?php
$DB_CLIENT;

try {
    $DB_CLIENT = require_once("connexion-db.php");
} catch (PDOException $e) {
    $noErreur = 500;
    $message = "Erreur de base de donnée";
    require("vues/error.php");
    exit;
}

$request;
if (isset($_SERVER['REDIRECT_URL'])) {
    $request = $_SERVER['REDIRECT_URL'];
} else {
    $request = $_SERVER['REQUEST_URI'];
}


session_start();

switch ($request) {
    case '/':
        require("controllers/home-controller.php");
        break;
    case '/login':
        require('controllers/login-controller.php');
        break;
    default:
        $noErreur = 404;
        $message  = 'Page non trouvée !';
        require("vues/error.php");
        break;
}
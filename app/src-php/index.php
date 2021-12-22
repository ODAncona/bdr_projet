<?php
require_once("model/_load-model.php");
require_once("helpers.php");

$DB_CLIENT;

$servername = "postgres";
$username   = "default";
$password   = "default";
$dbname     = "Beergarden"; // sensible à la casse

try {
    $DB_CLIENT = db_connect($servername, $username, $password, $dbname);
} catch (PDOException $e) {
    $noErreur = 500;
    $message = $e->getMessage();
    require("view/error.php");
    exit();
}

session_start();

$CURRENT_USER = new Personne($DB_CLIENT);

if (isset($_SESSION['idUtilisateur']) && $_SESSION['idUtilisateur'] > 0) {
    try {
        $CURRENT_USER->fetchById($_SESSION['idUtilisateur']);
    } catch (PDOException $e) {
        $message = $e->getMessage();
        $noErreur = 500;
        require("view/error.php");
        exit();
    }
} else {
    $_SESSION['idUtilisateur'] = 0;
}


$request;
if (isset($_SERVER['REDIRECT_URL'])) {
    $request = $_SERVER['REDIRECT_URL'];
} else {
    $request = $_SERVER['REQUEST_URI'];
}




switch ($request) {
    case '/':
        require('controller/home-controller.php');
        break;
    case '/biere':
        break;
    case '/brasseries':
        break;
    case '/brasserie':
        break;
    case '/recherche':
        break;
    case '/login':
        require('controller/login-controller.php');
        break;
    case '/logout':
        require('controller/logout-controller.php');
        break;
    default:
        $noErreur = 404;
        $message  = 'Page non trouvée !';
        require("view/error.php");
        break;
}

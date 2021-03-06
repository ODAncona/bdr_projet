<?php
require_once("model/_load-model.php");
require_once("includes/class-menu.php");
require_once("helpers.php");

$DB_CLIENT;

try {
    $DB_CLIENT = db_connect();
} catch (Exception $e) {
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

$siteMainMenu = new Menu();

$siteMainMenu->putItem(new MenuItem("Accueil", "accueil", 1, 1));
$siteMainMenu->putItem(new MenuItem("Bières", "bieres", 1, 1));
$siteMainMenu->putItem(new MenuItem("Brasseries", "brasseries",1, 1));
$siteMainMenu->putItem(new MenuItem("Recherche", "recherche", 1, 1));

if ($CURRENT_USER->isAuthenticated()) {
    $siteMainMenu->putItem(new MenuItem("Favoris", "favoris", 1, 1));
}

$siteMainMenu->putItem(new MenuItem("DB Tables", "tables", 1, 1));



$beer = new Beer($DB_CLIENT);
$beer->fetch();


switch ($request) {
    case '/':
    case '/accueil':
        $currentPageName = "Accueil";
        require('controller/home-controller.php');
        break;
    case '/login':
        $currentPageName = "Login";
        require('controller/login-controller.php');
        break;
    case '/logout':
        $currentPageName = "Logout";
        require('controller/logout-controller.php');
        break;
    case '/bieres':
        $currentPageName = "Bières";
        require('controller/beer-controller.php');
        break;
    case '/favoris':
        $currentPageName = 'Favoris';
        require('controller/favourites-controller.php');
        break;
    case '/brasseries':
        $currentPageName = 'Brasseries';
        require('controller/brewer-controller.php');
        break;
    case '/recherche':
        $currentPageName = 'Recherche';
        require('controller/search-controller.php');
        break;
    case '/default':
        $currentPageName = $request;
        require('controller/default-controller.php');
        break;
    case '/tables':
        $currentPageName = "Tables";
        require('controller/table-controller.php');
        break;
    default:
        $currentPageName = "Erreur";
        $noErreur = 404;
        $message  = 'Page non trouvée !';
        require("view/error.php");
        break;
}

<?php
require_once(__DIR__ . '/../model/class-Personne.php');
require_once(__DIR__ . '/../model/class-Session.php');

if (isset($_GET['identifiant']) && isset($_GET['motDePasse'])) {
    $session = new Session($DB_CLIENT, session_id());
    try {
        $utilisateur = new Personne($DB_CLIENT, $_GET['identifiant'], $_GET['motDePasse']);
        $session->enregistrer($utilisateur->getId());
        header("Location: / ", true, 302);
        exit();
    } catch (Exception $e) {
        $messageErreur = $e->getMessage();
        require(__DIR__ . '/../vues/login.php');
    }


} else if (isset($_COOKIE['PHPSESSID'])) {

    $session = new Session($DB_CLIENT, $_COOKIE['PHPSESSID']);

    if($session->getIdUtilisateur() == 0) {
        

        require(__DIR__ . '/../vues/login.php');

    } else {
        header("Location: / ", true, 302);
        exit();
    }

}

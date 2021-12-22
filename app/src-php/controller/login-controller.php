<?php
if (isset($_GET['identifiant']) && isset($_GET['motDePasse'])) {

    try {

        $CURRENT_USER->fetchByPseudo($_GET['identifiant']);

    } catch (Exception $e) {
        unset($_SERVER['REDIRECT_QUERY_STRING']);
        $messageErreur = $e->getMessage();
        require(__DIR__ . '/../view/page-login.php');
        exit();
    }

    if($CURRENT_USER->checkPassword($_GET['motDePasse'])) {
        $_SESSION['idUtilisateur'] = $CURRENT_USER->getId();
        header("Location: / ", true, 302);
    } else {
        unset($_SERVER['REDIRECT_QUERY_STRING']);
        $_SESSION['idUtilisateur'] = 0;
        $messageErreur = "Echec de l'authentification";
        require(__DIR__ . '/../view/page-login.php');
    };


} else if ($CURRENT_USER->isAuthenticated()) {
    header("Location: / ", true, 302);
    exit();
} else {
    require(__DIR__ . '/../view/page-login.php');
}

<?php
if (session_destroy()) {
    header("Location: / ", true, 302);
    exit();
} else {
    $messageErreur = "Echec de la déconnexion";
    require(__DIR__ . '/../view/error.php');
}

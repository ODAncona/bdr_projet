<?php

function init_session()
{
    session_start();
    if (isset($_SESSION['idUtilisateur']) && isset($_SESSION['idUtilisateur']) > 0) {
        return;
    } else {
        $_SESSION['idUtilisateur'] = 0;
    }
}

/* function db_connect(string $serverName, string $userName, string $password, string $dbName, int $port = 5432) : PDO
{
    $servername = "postgres";
    $username = "default";
    $password = "default";
    $dbname = "Beergarden"; // sensible à la casse
    $port = "5432";
    $conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname",$username,$password);
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
    return $conn;
} */

function db_connect() : PDO
{
    $servername = getenv('DB_SERVER_HOST');
    $username = getenv('DB_USER');
    $password = getenv('DB_PASSWORD');
    $dbname = getenv('DB_NAME'); // sensible à la casse
    $port = getenv('DB_PORT');

    if (! $servername || 
        ! $username || 
        ! $password ||
        ! $dbname ||
        ! $port) {
            throw new Exception("Les variables d'environnement ne sont pas correctement définies.");
        }
        
    $conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname", $username,$password);
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
    return $conn;
}
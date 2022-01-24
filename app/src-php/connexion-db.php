<?php
function db_connect() : PDO
{
    $servername = getenv('DB_SERVER_HOST');
    $username = getenv('DB_USER');
    $password = getenv('DB_PASSWORD');
    $dbname = getenv('DB_NAME'); // sensible à la casse
    $port = getenv('DB_PORT');

    if (!isset($servername) || 
        !isset($username) || 
        !isset($password) ||
        !isset($dbname) ||
        !isset($port)) {
            throw new Exception("Les variables d'environnement ne sont pas correctement définies.");
        }
        
    $conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname", $username,$password);
    $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
    
    return $conn;
}
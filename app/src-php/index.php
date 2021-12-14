<?php


$servername = "postgres";
$username = "default";
$password = "default";
$dbname = "beergarden";
$port = "5432";
$conn;


function executeQuery(string $sql = null, PDO $connection) {
    $query = null;
    try {
        $query = $connection->query($sql);
    } catch (PDOException $e) {
        echo $e->getMessage();
        exit;
    }
    return $query;
}

try{
   $conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname",$username,$password);
   $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
   echo "Connected succesfully\n";
} catch(PDOException $e) {
   echo "Connection failed: " . $e -> getMessage();
   exit;
}


$sql = 'DROP TABLE IF EXISTS test';
$query = executeQuery($sql, $conn);
var_dump($query);

$sql = 'CREATE TABLE test (
    id SERIAL,
    nom VARCHAR(30),
    CONSTRAINT pk_test PRIMARY KEY (id)
);';

$query = executeQuery($sql, $conn);
var_dump($query);

$sql = "INSERT INTO test (nom) VALUES ('Charles');"; 
executeQuery($sql, $conn);

$sql = "SELECT * FROM test;";

$query = executeQuery($sql, $conn);

foreach ($query as $key => $value) {
    var_dump($value);
}
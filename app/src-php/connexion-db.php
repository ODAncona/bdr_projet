<?php


$servername = "postgres";
$username = "default";
$password = "default";
$dbname = "Beergarden"; // sensible à la casse
$port = "5432";
$conn;


$conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname",$username,$password);
$conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
return $conn;

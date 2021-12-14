<?php
$servername = "postgres";
$username = "default";
$password = "default";
$dbname = "beergarden";
$port = "5432";

try{
   $conn = new PDO("pgsql:host=$servername;port=$port;dbname=$dbname",$username,$password);
   $conn -> setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
   echo "Connected succesfully";
} catch(PDOException $e){
   echo "Connection failed: " . $e -> getMessage();
}
<?php

$beerTypes = new BeerType($DB_CLIENT);
$beerTypes->fetch();

$beerTypesArray = $beerTypes->getData();

require(__DIR__ . '/../view/page-register-beer.php');
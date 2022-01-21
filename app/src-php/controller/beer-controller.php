<?php

$beerTypes = new BeerType($DB_CLIENT);
$beerTypes->fetch();

$filters = $beerTypes->getData();


require(__DIR__ . '/../view/page-beer.php');
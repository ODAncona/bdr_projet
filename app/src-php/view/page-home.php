<?php require("head.php"); ?>

<?php require("components/pagetitle.php"); ?>

<h1>Welcome dude, sit down and enjoy your drink!</h1>
<h2>Les moins chères</h2>
<?php
$beerArray = $cheapBeers;
require("components/component-beer.php");
?>

<h2>Les mieux notées</h2>
<?php
$beerArray = $bestMarkBeers;
require("components/component-beer.php");
?>

<h2>Les moins connues</h2>
<?php
$beerArray = $lessKnownBeers;
require("components/component-beer.php");
?>

<h2>Les plus commandées</h2>
<?php
$beerArray = $mostOrderedBeers;
require("components/component-beer.php");
?>

<h2>Les plus commentées</h2>
<?php
$beerArray = $mostCommentedBeers;
require("components/component-beer.php");
?>

<h2>Les récentes</h2>
<?php
$beerArray = $mostRecentBeers;
require("components/component-beer.php");
?>


<?php require("footer.php"); ?>

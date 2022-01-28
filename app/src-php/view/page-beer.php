<?php require("head.php"); ?>



<?php

$currentPageName = $_GET['nom'];
$filters = array();
require("components/pagetitle.php");

var_dump($data);
?>



<?php //require("components/component-table.php"); ?>

<div class="container">
  <h1>nom</h1>
</div>

<div class="container">
  <h1>image</h1>
  <img src="https://biereartisanale.ch/img/cms/biere.jpg">
</div>

<div class="container">
  <h1>nom</h1>
</div>




<h1>description</h1>

<?php require("footer.php"); ?>

<?php require("head.php"); ?>



<?php

$currentPageName = $_GET['nom'];
$filters = array();
require("components/pagetitle.php");
$vBeer = $beers[0];
?>




<?php //require("components/component-table.php"); ?>

<?php
  $img = "public/images/beer_default.jpg";
if(isset($vBeer['src_images'])) {
  //array_splice()
  $img = 'public/images/' . $vBeer['src_images'];
  //$img = $vBeer['src_images'];
}
?>

<div class="container">
  <div class="row">
     <div class="col-4">
       <!-- Caractéristiques !-->
       <h2>Caractéristiques</h2>
       <p>Type de bière: <?=$vBeer['nomtypebière']?></p>
       <p>Prix Unitaire: <?=$vBeer['prix']?> CHF</p>

       <!-- Note !-->
       <h2>Note Utilisateur: <?=$vBeer['notemoyenne']?> / 10</h2>
       <p>Acidité:  <?=$vBeer['aciditemoyenne']?>/10</p>
       <p>Amertume:  <?=$vBeer['amertumemoyenne']?>/10</p>
       <p>Douceur:  <?=$vBeer['douceurmoyenne']?>/10</p>
       <p>Pétillance:  <?=$vBeer['petillancemoyenne']?>/10</p>

       <!-- Note !-->
      <h2>Description</h2>
      <p> <?=$vBeer['description']?></p>
     </div>

    <div class="col-8">
        <img class="img-beer" src="<?= $img ?>">
    </div>
  </div>

  <div class="container">
    <h2>Avis</h2>
    <?php foreach ($reviews as $rev) : ?>
    <?php foreach ($rev as $key => $value) : ?>
      <p><?= $key ?> : <?= $value ?></p>
      <?php endforeach ?>
      <p>-----------------------</p>
    <?php endforeach ?>
  </div>
</div>

<?php require("footer.php"); ?>

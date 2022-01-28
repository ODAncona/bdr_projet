<?php require("head.php"); ?>

<?php
  $vBrewery = $breweries[0];
  $vBeer = $beers[0];
  $currentPageName = $vBrewery['nombrasserie'];
  $filters = array();
  require("components/pagetitle.php");
  $img = "public/images/brewery_default.jpg";
  if(isset($brewery['src_images'])) {
    $img = 'public/images/' . $brewery['src_images'];
  }
?>

<div class="container">
  <div class="row">
     <div class="col-4">
       <!-- Informations !-->
       <h2>Informations</h2>
       <p>Moyenne de note: <?echo($vBrewery['moyennenotesavis'])?>/10</p>
       <p>Localité: <?echo($vBrewery['localitébrasserie'])?></p>

       <!-- Contacts !-->
       <h2>Contacts</h2>
       <p>Nom: <?echo($vBrewery['nombrasseur'])?></p>
       <p>Prénom: <?echo($vBrewery['prenombrasseur'])?></p>
       <p>Courriel: <?echo($vBrewery['courrielbrasseur'])?></p>

       <!-- Note !-->
      <h2>Description</h2>
      <p> <? echo($vBrewery['description'])?></p>
     </div>

    <div class="col-8">
        <img class="img-beer" src="<?=$img?>">
    </div>
  </div>

  <div class="container">
    <h2>Bières</h2>

  </div>
</div>

<?php require("footer.php"); ?>

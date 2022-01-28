<?php require("head.php"); ?>



<?php

$currentPageName = $_GET['nom'];
$filters = array();
require("components/pagetitle.php");
$vBeer = $data[0];
//var_dump($data);
?>



<?php //require("components/component-table.php"); ?>


<div class="container">
  <div class="row">
     <div class="col-4">
       <!-- Caractéristiques !-->
       <h2>Caractéristiques</h2>
       <p>Type de bière: <?echo($vBeer['nomtypebière'])?></p>
       <p>Prix Unitaire: <?echo($vBeer['prix'])?> CHF</p>

       <!-- Note !-->
       <h2>Note Utilisateur: <?echo($vBeer['notemoyenne'])?> / 10</h2>
       <p>Acidité:  <?echo($vBeer['aciditemoyenne'])?>/10</p>
       <p>Amertume:  <?echo($vBeer['amertumemoyenne'])?>/10</p>
       <p>Douceur:  <?echo($vBeer['douceurmoyenne'])?>/10</p>
       <p>Pétillance:  <?echo($vBeer['petillancemoyenne'])?>/10</p>
     </div>

    <div class="col-8">
        <img class="img-beer" src="https://biereartisanale.ch/img/cms/biere.jpg">
    </div>
  </div>

  <div class="container">
    <h2>Avis</h2>

  </div>
</div>

<?php require("footer.php"); ?>

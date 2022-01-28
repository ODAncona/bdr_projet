<?php require("head.php"); ?>

<?php require("components/pagetitle.php"); 

$placeHolder = "Tastefully asking...";
$value = isset($_GET['searchInput']) ? $_GET['searchInput'] : "";
?>

<div class="row gx-5">
  <div class="col">
    <div class="p-3 border bg-light">
      <div class="mb-3">
        <form action="/recherche">
          <label for="exampleFormControlInput1" class="form-label">Rechercher une bière</label>
          <input type="text" class="form-control" value="<?= $value ?>" name="searchInput" placeholder=<?= $placeHolder ?>>
        </br>
        <button type="submit" class="btn btn-primary">Recheche</button>
      </form>
      </div>
    </div>
  </div>
</div>

<?php 
if (!empty($beersArray)) {
  require("components/component-beer.php");
}



require("footer.php"); ?>

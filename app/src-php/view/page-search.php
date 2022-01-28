<?php require("head.php"); ?>

<?php require("components/pagetitle.php");

$placeHolder = "Tastefully asking...";
$inputValue = isset($_GET['searchInput']) ? $_GET['searchInput'] : "";

$radioBrewerChecked = false; 
if (isset($_GET['radioChoice'])) {
  if ($_GET['radioChoice'] === 'brewery') {
    $radioBrewerChecked = true; 
  }
}
?>

<div class="row gx-5">
  <div class="col">
    <form action="/recherche">
      <div class="p-3 border bg-light">
        <div class="mb-3">
          <label for="exampleFormControlInput1" class="form-label">Rechercher</label>

          <div class="form-check">
            <input class="form-check-input" type="radio" name="radioChoice" id="byBeer" value="beer" <?= !$radioBrewerChecked ? 'checked' : '' ?>>
            <label class="form-check-label" for="byBeer">
              Par bière
            </label>
          </div>
          <div class="form-check">
            <input class="form-check-input" type="radio" name="radioChoice" id="byBrewery" value="brewery" <?= $radioBrewerChecked ? 'checked' : '' ?>>
            <label class="form-check-label" for="byBrewery">
              Par brasserie
            </label>
          </div>

          <input type="text" class="form-control" value="<?= $inputValue ?>" name="searchInput" placeholder=<?= $placeHolder ?>>


          <div class="form-check form-check-inline">
            <input class="form-check-input" name='searchOption' type="checkbox" id="inlineCheckbox1" value="exactMatch" <?= isset($_GET['searchOption']) ? 'checked' : '' ?>>
            <label class="form-check-label">Recherche exacte</label>
          </div>
          </br>
          <button type="submit" class="btn btn-primary">Rechecher</button>
        </div>
      </div>
    </form>
  </div>
</div>


<?php
if (!empty($beerArray)) {
  require("components/component-beer.php");
} elseif (!empty($breweryArray)) {
  require("components/component-brewery.php");
}



require("footer.php"); ?>
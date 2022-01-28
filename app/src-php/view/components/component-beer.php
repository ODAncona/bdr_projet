<div id="bgrd-table" class="container beer-container">
<?php
if (isset($beerArray)) : ?>
  <?php foreach ($beerArray as $beer) :
    $img = "public/images/beer_default.jpg";
    if(isset($beer['src_images'])) {
    //array_splice()
    $img = 'public/images/' . $beer['src_images'];
    //$img = $vBeer['src_images'];
    }
    ?>
    <div class="card" style="width: 18rem;">
      <img src="<?= $img ?>" class="card-img-top card-img" alt="...">
      <div class="card-body">
        <h5 class="card-title"><?= $beer['nombière'] ?></h5>
        <p class="card-text"><?= $beer['description'] ?></p>
        <a href="http://localhost:9999/bieres?nom=<?= $beer['nombière'] ?>&id=<?= $beer['idbrasserie']?>" class="btn btn-primary">Explore</a>
      </div>
    </div>
  <?php endforeach ?>
  <?php endif ?>
</div>

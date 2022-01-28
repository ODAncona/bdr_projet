<div class="container">
<?php if (isset($beersArray)) : ?>
  <?php foreach ($beersArray as $beer) : ?>
    <div class="card" style="width: 18rem;">
      <img src="https://biereartisanale.ch/img/cms/biere.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><?= $beer['nombière'] ?></h5>
        <p class="card-text"><?= $beer['description'] ?></p>
        <a href="localhost:9999/bieres?nom=<?= $beer['nombière'] ?>&id=<?= $beer['idbrasserie']?>" class="btn btn-primary">Explore</a>
      </div>
    </div>
  <?php endforeach ?>
  <?php endif ?>
</div>
<div class="container">
<?php if (isset($vBeer)) { ?>
  <?php foreach ($beer as $colName) : ?>
    <div class="card" style="width: 18rem;">
      <img src="https://biereartisanale.ch/img/cms/biere.jpg" class="card-img-top" alt="...">
      <div class="card-body">
        <h5 class="card-title"><? echo($beer['nombière'])?></h5>
        <p class="card-text"><? echo($beer['description'])?></p>
        <a href="localhost:9999/bieres?nom=<?echo($beer['nombière'])?>&id=<?echo($beer['idbrasserie'])?>" class="btn btn-primary">Explore</a>
      </div>
    </div>
  <?php endforeach ?>
</div>

<div id="bgrd-table" class="container beer-container">
<?php
if (isset($breweryArray)) : ?>
  <?php foreach ($breweryArray as $brewery) :
    $img = "public/images/brewery_default.jpg";
    if(isset($brewery['src_images'])) {
    $img = 'public/images/' . $brewery['src_images'];
    }
    ?>
    <div class="card" style="width: 18rem;">
      <img src="<?= $img ?>" class="card-img-top card-img" alt="...">
      <div class="card-body">
        <h5 class="card-title"><?= $brewery['nombrasserie'] ?></h5>
        <p class="card-text"><?= $brewery['description'] ?></p>
        <a href="http://localhost:9999/brasseries?id=<?= $brewery['id']?>" class="btn btn-primary">Explore</a>
      </div>
    </div>
  <?php endforeach ?>
  <?php endif ?>
</div>

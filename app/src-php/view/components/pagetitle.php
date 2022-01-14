  <!-- Header -->
  <header id="">
    <a href="#"><img src="/w3images/avatar_g2.jpg" style="width:65px;" class="w3-circle w3-right w3-margin w3-hide-large w3-hover-opacity"></a>
    <span class="w3-button w3-hide-large w3-xxlarge w3-hover-text-grey" onclick="w3_open()"><i class="fa fa-bars"></i></span>
    <div class="w3-container">
      <h1><b><?= $currentPageName ?></b></h1>
      <!-- Filters -->
      <?php if (isset($filters)) : ?>
        <div class="w3-section w3-bottombar w3-padding-16">
          <span class="w3-margin-right">Filtres:</span>
          <!-- <button class="w3-button w3-black">Tout</button> -->
          <?php foreach ($filters as $filter) : ?>
            <button id="<?= $filter ?>" class="w3-button w3-white btn-filter"><i class="w3-margin-right"></i><?= htmlspecialchars($filter) ?></button>
          <?php endforeach ?>

        </div>
      <?php endif ?>
    </div>
  </header>
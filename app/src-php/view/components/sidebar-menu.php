<!-- Sidebar/menu -->
<nav class="w3-sidebar w3-collapse w3-white w3-animate-left" style="z-index:3;width:300px;" id="mySidebar"><br>
  <div class="w3-container">
    <a href="#" onclick="w3_close()" class="w3-hide-large w3-right w3-jumbo w3-padding w3-hover-grey" title="close menu">
      <i class="fa fa-remove"></i>
    </a>
    <h4><b>The Beer Garden</b></h4>
  </div>
  <?= $siteMainMenu ?>
  <div class="w3-container mt-5 mx-2">
    <?php if ($CURRENT_USER->isAuthenticated()) :
    ?>
      <p>Bonjour <?= $CURRENT_USER ?> !</p>
      <?php require("logout-form.php") ?>
    <?php else : ?>
      <p>Se connecter</p>

      <?php require("login-form.php") ?>

    <?php endif ?>
  </div>
</nav>

<!-- Overlay effect when opening sidebar on small screens -->
<div class="w3-overlay w3-hide-large w3-animate-opacity" onclick="w3_close()" style="cursor:pointer" title="close side menu" id="myOverlay"></div>
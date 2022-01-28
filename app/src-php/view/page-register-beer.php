
<?php 
if (!$CURRENT_USER->isAuthenticated()) {
    header("Location: /login ", true, 302);
    exit();
}
require("head.php");?>

<?php require("components/pagetitle.php");?>


<?php require("components/form-beer.php"); ?>


<?php require("footer.php");

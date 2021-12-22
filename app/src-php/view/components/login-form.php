<?php
 /**
 * 
 * 
 */
?>

<form action="/login">
    <label for="identifiant">Identifiant (pseudo) : </label>
    <input type="text" id="identifiant" name="identifiant">
    <label for="motDePasse">Mot de passe : </label>
    <input type="text" id="motDePasse" name="motDePasse">
    <input type="Submit" value="Soumettre">
</form>
<?php if (isset($messageErreur)) : ?>
    <p> <?= htmlspecialchars($messageErreur) ?> </p>
    <?php endif;
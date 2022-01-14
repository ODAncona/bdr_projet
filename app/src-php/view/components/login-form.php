<?php

/**
 * 
 * 
 */
?>

<form action="/login" method="post">
    <div class="form-group">
        <label for="identifiant">Identifiant : </label>
        <input type="text" class="form-control" id="identifiant" name="identifiant" placeholder="Pseudo">
        <!-- <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small> -->
    </div>
    <div class="form-group">
        <label for="motDePasse">Mot de passe : </label>
        <input type="password" class="form-control" id="motDePasse" name="motDePasse" placeholder="Mot de passe">
    </div>
    <button type="submit" class="btn btn-primary mt-1">Soumettre</button>
</form>
<?php if (isset($messageErreur)) : ?>
    <p> <?= htmlspecialchars($messageErreur) ?> </p>
<?php endif;
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <form action="/login">
        <label for="identifiant">Identifiant (pseudo) : </label>
        <input type="text" id="identifiant" name="identifiant">
        <label for="motDePasse">Mot de passe : </label>
        <input type="text" id="motDePasse" name="motDePasse">
        <input type="Submit" value="Soumettre">
    </form>
    <?php if (isset($messageErreur)) : ?>
    <p> <?= $messageErreur ?> </p>
    <?php endif?>
    
</body>
</html>